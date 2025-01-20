@interface DictionarySettingsController
- (BOOL)isTTYEnabled;
- (BOOL)performedRemoteQuery;
- (BOOL)willReloadContent;
- (DUDictionaryManager)dictionaryManager;
- (NSMutableDictionary)downloadingAssets;
- (NSMutableDictionary)runningAssetOperationInfoForDictionary;
- (UIActivityIndicatorView)loadingSpinner;
- (_UIContentUnavailableView)dictionariesUnavailableView;
- (id)downloadFailedAlertWithError:(id)a3;
- (id)specifiers;
- (int64_t)catalogDownloadResult;
- (int64_t)runningAssetOperationForDictionary:(id)a3;
- (void)activateDictionaryForSpecifier:(id)a3;
- (void)deactivateDictionaryForSpecifier:(id)a3;
- (void)emitNavigationEventForRootController;
- (void)reloadDictionariesList;
- (void)setCatalogDownloadResult:(int64_t)a3;
- (void)setDictionariesUnavailableView:(id)a3;
- (void)setDownloadingAssets:(id)a3;
- (void)setErrorMessageToContentUnavailableView:(id)a3;
- (void)setLoadingSpinner:(id)a3;
- (void)setPerformedRemoteQuery:(BOOL)a3;
- (void)setRunningAssetOperation:(int64_t)a3 forDictionary:(id)a4;
- (void)setRunningAssetOperationInfoForDictionary:(id)a3;
- (void)setWillReloadContent:(BOOL)a3;
- (void)setupProgressHandlerForAsset:(id)a3 specifier:(id)a4;
- (void)showPlaceholderViewsIfNeeded;
- (void)startDownloadForSpecifier:(id)a3;
- (void)toggleDictionaryActivatedState:(id)a3;
- (void)updateProgressForSpecifier:(id)a3 operationState:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DictionarySettingsController

- (id)specifiers
{
  v2 = self;
  v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    v5 = [(DictionarySettingsController *)v2 loadSpecifiersFromPlistName:@"DictionarySettings" target:v2];
    id v6 = [v5 mutableCopy];

    v30 = v3;
    objc_storeStrong(v3, v6);
    v7 = [(DictionarySettingsController *)v2 dictionaryManager];
    v8 = [v7 availableDefinitionDictionaries];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v29 = v8;
    id obj = [v8 reverseObjectEnumerator];
    id v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (!v9) {
      goto LABEL_20;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    uint64_t v12 = PSCellClassKey;
    uint64_t v33 = PSValueKey;
    v31 = v2;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (![v14 isTTYDictionary]
          || [(DictionarySettingsController *)v2 isTTYEnabled])
        {
          v15 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:3 edit:0];
          [v15 setButtonAction:"toggleDictionaryActivatedState:"];
          [v15 setProperty:objc_opt_class() forKey:v12];
          [v15 setProperty:v14 forKey:v33];
          [v6 insertObject:v15 atIndex:0];
          if ([v14 needsDownloadNewerVersion])
          {
            [(DictionarySettingsController *)v2 deactivateDictionaryForSpecifier:v15];
            goto LABEL_16;
          }
          int64_t v16 = [(DictionarySettingsController *)v2 runningAssetOperationForDictionary:v14];
          id v17 = v10;
          uint64_t v18 = v11;
          uint64_t v19 = v12;
          id v20 = v6;
          int64_t v21 = v16;
          v22 = [v14 rawAsset];
          v23 = (int *)[v22 state];

          BOOL v24 = v23 != &dword_4 || v21 == 1;
          id v6 = v20;
          uint64_t v12 = v19;
          uint64_t v11 = v18;
          id v10 = v17;
          v2 = v31;
          if (!v24)
          {
            v25 = [v14 rawAsset];
            v26 = [v25 attributes];
            v27 = [v26 objectForKeyedSubscript:@"DictionaryIdentifier"];
            NSLog(@"DictionaryUI: DictionarySettings start download in '-specifiers' for dictionary(%@)", v27);

LABEL_16:
            [(DictionarySettingsController *)v2 activateDictionaryForSpecifier:v15];
          }

          continue;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v10)
      {
LABEL_20:

        [(DictionarySettingsController *)v2 showPlaceholderViewsIfNeeded];
        id v4 = *v30;
        break;
      }
    }
  }

  return v4;
}

- (void)showPlaceholderViewsIfNeeded
{
  v3 = [(DictionarySettingsController *)self dictionaryManager];
  id v4 = [v3 availableDefinitionDictionaries];
  if ([v4 count])
  {

LABEL_4:
    v7 = [(DictionarySettingsController *)self loadingSpinner];
    [v7 stopAnimating];

    v8 = [(DictionarySettingsController *)self loadingSpinner];
    [v8 removeFromSuperview];

    [(DictionarySettingsController *)self setLoadingSpinner:0];
LABEL_5:
    id v9 = [(DictionarySettingsController *)self dictionariesUnavailableView];
    [v9 removeFromSuperview];

    [(DictionarySettingsController *)self setDictionariesUnavailableView:0];
    return;
  }
  v5 = [(DictionarySettingsController *)self view];
  [v5 frame];
  BOOL IsEmpty = CGRectIsEmpty(v28);

  if (IsEmpty) {
    goto LABEL_4;
  }
  if (![(DictionarySettingsController *)self performedRemoteQuery])
  {
    int64_t v21 = [(DictionarySettingsController *)self loadingSpinner];

    if (!v21)
    {
      id v22 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [(DictionarySettingsController *)self setLoadingSpinner:v22];
      v23 = [(DictionarySettingsController *)self view];
      [v23 bounds];
      double MidX = CGRectGetMidX(v29);
      v25 = [(DictionarySettingsController *)self view];
      [v25 bounds];
      objc_msgSend(v22, "setCenter:", MidX, CGRectGetMidY(v30));

      v26 = [(DictionarySettingsController *)self view];
      [v26 addSubview:v22];

      [v22 startAnimating];
    }
    goto LABEL_5;
  }
  id v10 = [(DictionarySettingsController *)self dictionariesUnavailableView];

  if (!v10)
  {
    id v11 = objc_alloc((Class)_UIContentUnavailableView);
    uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"DICTIONARY_UNAVAILABLE_TITLE" value:&stru_C750 table:@"DictionarySettings"];
    id v14 = objc_msgSend(v11, "initWithFrame:title:style:", v13, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    [(DictionarySettingsController *)self setErrorMessageToContentUnavailableView:v14];
    [v14 setAutoresizingMask:18];
    v15 = [(DictionarySettingsController *)self view];
    [v15 bounds];
    objc_msgSend(v14, "setFrame:");

    int64_t v16 = [(DictionarySettingsController *)self view];
    [v16 addSubview:v14];

    [(DictionarySettingsController *)self setDictionariesUnavailableView:v14];
    uint64_t v17 = DCSDictionaryAssetCopyDiagnosticLog();
    if (v17)
    {
      uint64_t v18 = (const void *)v17;
      NSLog(@"DictionaryUI: %@", v17);
      CFRelease(v18);
    }
  }
  uint64_t v19 = [(DictionarySettingsController *)self loadingSpinner];
  [v19 stopAnimating];

  id v20 = [(DictionarySettingsController *)self loadingSpinner];
  [v20 removeFromSuperview];

  [(DictionarySettingsController *)self setLoadingSpinner:0];
}

- (void)setErrorMessageToContentUnavailableView:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    v5 = DCSDictionaryAssetGetAssetType();
    id v6 = ASServerURLForAssetType();
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"DICTIONARY_UNAVAILABLE_MESSAGE_INTERNAL" value:&stru_C750 table:@"DictionarySettings"];
    int64_t v9 = [(DictionarySettingsController *)self catalogDownloadResult];
    id v10 = [v6 absoluteString];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v10);

    [v4 setButtonTitle:@"Check Connection"];
    uint64_t v12 = [v5 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    v13 = +[NSString stringWithFormat:@"/%@/%@.xml", v12, v12];
    id v14 = [v6 URLByAppendingPathComponent:v13 isDirectory:0];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_3F38;
    v18[3] = &unk_C3F8;
    id v19 = v14;
    id v15 = v14;
    [v4 setButtonAction:v18];
  }
  else
  {
    int64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"DICTIONARY_UNAVAILABLE_MESSAGE" value:&stru_C750 table:@"DictionarySettings"];
    id v11 = +[NSMutableString stringWithString:v17];
  }
  [v4 setMessage:v11];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)DictionarySettingsController;
  [(DictionarySettingsController *)&v18 viewDidLoad];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_421C;
  v15[3] = &unk_C460;
  objc_copyWeak(&v16, &location);
  v3 = objc_retainBlock(v15);
  [(DictionarySettingsController *)self setWillReloadContent:0];
  double v4 = *(double *)&qword_10DD8;
  if (*(double *)&qword_10DD8 == 0.0
    || (+[NSDate timeIntervalSinceReferenceDate], v4 > *(double *)&qword_10DD8 + 3600.0))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    qword_10DD8 = v5;
    [(DictionarySettingsController *)self setWillReloadContent:1];
    id v6 = +[UIApplication sharedApplication];
    [v6 setNetworkActivityIndicatorVisible:1];

    NSLog(@"DictionaryUI: Start catalog download");
    v7 = [(DictionarySettingsController *)self dictionaryManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_42F8;
    v13[3] = &unk_C4B0;
    v8 = v3;
    id v14 = v8;
    [v7 _downloadDictionaryAssetCatalogWithTimeout:60 completion:v13];

    dispatch_time_t v9 = dispatch_time(0, 65000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_43D8;
    block[3] = &unk_C4D8;
    objc_copyWeak(&v12, &location);
    id v11 = v8;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v12);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DictionarySettingsController;
  [(DictionarySettingsController *)&v4 viewDidAppear:a3];
  if (![(DictionarySettingsController *)self willReloadContent]) {
    [(DictionarySettingsController *)self reloadDictionariesList];
  }
  [(DictionarySettingsController *)self showPlaceholderViewsIfNeeded];
  [(DictionarySettingsController *)self emitNavigationEventForRootController];
}

- (void)emitNavigationEventForRootController
{
  id v8 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/DICTIONARY"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v4 = +[NSLocale currentLocale];
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"Dictionary" table:@"DictionarySettings" locale:v4 bundleURL:v6];

  [(DictionarySettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.dictionary" title:v7 localizedNavigationComponents:&__NSArray0__struct deepLink:v8];
}

- (void)reloadDictionariesList
{
  if (![(NSMutableDictionary *)self->_downloadingAssets count])
  {
    id v3 = [(DictionarySettingsController *)self dictionaryManager];
    id v4 = [v3 _allAvailableDefinitionDictionaries];

    [(DictionarySettingsController *)self reloadSpecifiers];
  }
}

- (void)toggleDictionaryActivatedState:(id)a3
{
  id v4 = a3;
  [v4 propertyForKey:PSValueKey];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4718;
  block[3] = &unk_C500;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_time_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setupProgressHandlerForAsset:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4884;
  v10[3] = &unk_C550;
  id v8 = v6;
  id v11 = v8;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  [v8 attachProgressCallBack:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)updateProgressForSpecifier:(id)a3 operationState:(id)a4
{
  id v12 = a4;
  uint64_t v5 = PSValueKey;
  id v6 = a3;
  id v7 = [v6 propertyForKey:v5];
  id v8 = [v6 propertyForKey:PSTableCellKey];

  id v9 = [v12 objectForKeyedSubscript:@"MAProgressNotification"];
  if (([v9 isStalled] & 1) == 0)
  {
    float v10 = (float)(uint64_t)[v9 totalWritten];
    *(float *)&double v11 = v10 / (float)(uint64_t)[v9 totalExpected];
    [v7 setProgress:v11];
    [v8 reloadDataWithAssetOperationState:v12];
  }
}

- (void)activateDictionaryForSpecifier:(id)a3
{
  id v10 = a3;
  id v4 = [v10 propertyForKey:PSValueKey];
  uint64_t v5 = [v10 propertyForKey:PSTableCellKey];
  [v4 setActivated:1];
  id v6 = [v4 rawAsset];
  if (([v6 wasLocal] & 1) == 0)
  {
    [(DictionarySettingsController *)self setupProgressHandlerForAsset:v6 specifier:v10];
    id v7 = [v4 rawAsset];
    id v8 = [v7 attributes];
    id v9 = [v8 objectForKeyedSubscript:@"DictionaryIdentifier"];
    NSLog(@"DictionaryUI: DictionarySettings start download in '-activateDictionaryForSpecifier' for dictionary(%@)", v9);

    [(DictionarySettingsController *)self startDownloadForSpecifier:v10];
  }
  [v5 reloadDataWithAssetOperationState:0];
}

- (void)deactivateDictionaryForSpecifier:(id)a3
{
  uint64_t v4 = PSValueKey;
  id v5 = a3;
  id v24 = [v5 propertyForKey:v4];
  id v6 = [v5 propertyForKey:PSTableCellKey];

  id v7 = [v24 rawAsset];
  id v8 = (int *)[v7 state];

  if (v8 == &dword_4)
  {
    [(DictionarySettingsController *)self setRunningAssetOperation:2 forDictionary:v24];
    id v9 = [v24 rawAsset];
    id v10 = [v9 cancelDownloadSync];

    double v11 = [v24 rawAsset];
    id v12 = [v11 attributes];
    id v13 = [v12 objectForKeyedSubscript:@"DictionaryIdentifier"];
    NSLog(@"DictionaryUI: DictionarySettings canceled download for dictionary(%@) with error(%ld)", v13, v10);

    if (v10)
    {
      [(DictionarySettingsController *)self setRunningAssetOperation:0 forDictionary:v24];
      goto LABEL_9;
    }
    [v24 setActivated:0];
    [v24 setProgress:0.0];
    goto LABEL_8;
  }
  id v14 = [v24 rawAsset];
  unsigned int v15 = [v14 wasPurgeable];

  if (v15)
  {
    id v16 = [v24 rawAsset];
    uint64_t v17 = [v16 attributes];
    DCSDictionaryAssetAttributesWillBePurged();

    objc_super v18 = [v24 rawAsset];
    id v19 = [v18 purgeSync];

    id v20 = [v24 rawAsset];
    int64_t v21 = [v20 attributes];
    id v22 = [v21 objectForKeyedSubscript:@"DictionaryIdentifier"];
    NSLog(@"DictionaryUI: DictionarySettings purged dictionary(%@) with error(%ld)", v22, v19);

    if (!v19)
    {
      [v24 setActivated:0];
LABEL_8:
      v23 = [v24 rawAsset];
      [v23 refreshState];

      [v6 reloadDataWithAssetOperationState:0];
    }
  }
LABEL_9:
}

- (void)startDownloadForSpecifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 propertyForKey:PSValueKey];
  id v6 = [v5 rawAsset];
  downloadingAssets = self->_downloadingAssets;
  if (!downloadingAssets)
  {
    id v8 = objc_opt_new();
    [(DictionarySettingsController *)self setDownloadingAssets:v8];

    downloadingAssets = self->_downloadingAssets;
  }
  id v9 = +[NSNull null];
  id v10 = [v6 assetId];
  [(NSMutableDictionary *)downloadingAssets setObject:v9 forKey:v10];

  [(DictionarySettingsController *)self setRunningAssetOperation:1 forDictionary:v5];
  double v11 = objc_opt_new();
  [v11 setAllowsCellularAccess:1];
  [v11 setDiscretionary:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5140;
  v15[3] = &unk_C5A0;
  id v12 = v6;
  id v16 = v12;
  id v13 = v5;
  id v17 = v13;
  id v14 = v4;
  id v18 = v14;
  objc_copyWeak(&v19, &location);
  [v12 startDownload:v11 then:v15];
  [v12 refreshState];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (id)downloadFailedAlertWithError:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"DICTIONARY_DOWNLOAD_FAILED_MESSAGE" value:&stru_C750 table:@"DictionarySettings"];

  if (v3)
  {
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (%ld)", [v3 integerValue]);
    uint64_t v7 = [v5 stringByAppendingString:v6];

    id v5 = (void *)v7;
  }
  id v8 = +[UIAlertController alertControllerWithTitle:0 message:v5 preferredStyle:1];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"OK" value:&stru_C750 table:@"DictionaryUI"];
  double v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:&stru_C5E0];

  [v8 addAction:v11];

  return v8;
}

- (int64_t)runningAssetOperationForDictionary:(id)a3
{
  runningAssetOperationInfoForDictionary = self->_runningAssetOperationInfoForDictionary;
  id v4 = [a3 rawAsset];
  id v5 = [v4 assetId];
  id v6 = [(NSMutableDictionary *)runningAssetOperationInfoForDictionary objectForKey:v5];
  id v7 = [v6 integerValue];

  return (int64_t)v7;
}

- (void)setRunningAssetOperation:(int64_t)a3 forDictionary:(id)a4
{
  id v11 = a4;
  runningAssetOperationInfoForDictionary = self->_runningAssetOperationInfoForDictionary;
  if (!runningAssetOperationInfoForDictionary)
  {
    id v7 = objc_opt_new();
    [(DictionarySettingsController *)self setRunningAssetOperationInfoForDictionary:v7];

    runningAssetOperationInfoForDictionary = self->_runningAssetOperationInfoForDictionary;
  }
  id v8 = +[NSNumber numberWithInteger:a3];
  id v9 = [v11 rawAsset];
  id v10 = [v9 assetId];
  [(NSMutableDictionary *)runningAssetOperationInfoForDictionary setObject:v8 forKey:v10];
}

- (DUDictionaryManager)dictionaryManager
{
  if (qword_10DE0 != -1) {
    dispatch_once(&qword_10DE0, &stru_C620);
  }
  v2 = (void *)qword_10DE8;

  return (DUDictionaryManager *)v2;
}

- (BOOL)isTTYEnabled
{
  v2 = +[RTTSettings sharedInstance];
  unsigned __int8 v3 = [v2 TTYSoftwareEnabled];

  return v3;
}

- (BOOL)performedRemoteQuery
{
  return self->_performedRemoteQuery;
}

- (void)setPerformedRemoteQuery:(BOOL)a3
{
  self->_performedRemoteQuery = a3;
}

- (int64_t)catalogDownloadResult
{
  return self->_catalogDownloadResult;
}

- (void)setCatalogDownloadResult:(int64_t)a3
{
  self->_catalogDownloadResult = a3;
}

- (UIActivityIndicatorView)loadingSpinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLoadingSpinner:(id)a3
{
}

- (_UIContentUnavailableView)dictionariesUnavailableView
{
  return (_UIContentUnavailableView *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDictionariesUnavailableView:(id)a3
{
}

- (NSMutableDictionary)runningAssetOperationInfoForDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setRunningAssetOperationInfoForDictionary:(id)a3
{
}

- (NSMutableDictionary)downloadingAssets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDownloadingAssets:(id)a3
{
}

- (BOOL)willReloadContent
{
  return self->_willReloadContent;
}

- (void)setWillReloadContent:(BOOL)a3
{
  self->_willReloadContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadingAssets, 0);
  objc_storeStrong((id *)&self->_runningAssetOperationInfoForDictionary, 0);
  objc_storeStrong((id *)&self->_dictionariesUnavailableView, 0);

  objc_storeStrong((id *)&self->_loadingSpinner, 0);
}

@end