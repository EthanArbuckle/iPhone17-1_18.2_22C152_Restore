@interface DOCConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationForExportingDocumentsToURLs:(id)a3 mode:(unint64_t)a4;
+ (id)configurationForFolderPicking;
+ (id)configurationForImportingDocumentContentTypes:(id)a3 mode:(unint64_t)a4;
+ (id)configurationForImportingDocumentsWithContentTypes:(id)a3 mode:(unint64_t)a4;
+ (id)configurationForImportingDocumentsWithConversionRules:(id)a3;
+ (id)configurationForOpeningDocumentsOfApplicationWithBundleIdentifier:(id)a3;
+ (id)pickableContentTypesFromAllowedConversions:(id)a3;
- (BOOL)collectionSupportsDragAndDrop;
- (BOOL)forBrowsingInApp;
- (BOOL)forMovingDocuments;
- (BOOL)forPickingDocuments;
- (BOOL)forPickingDownloadsFolder;
- (BOOL)forPickingFolders;
- (BOOL)forPickingFoldersOnly;
- (BOOL)forSavingDocuments;
- (BOOL)inProcess;
- (BOOL)isContentManaged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)isFilesApp;
- (BOOL)isInUIPDocumentLanding;
- (BOOL)isPickerUI;
- (BOOL)isPopover;
- (BOOL)isPopoverOrWidget;
- (BOOL)isWidget;
- (BOOL)neverCreateBookmarkForOpenInPlace;
- (BOOL)pickingItemsShouldBumpLastOpenDate;
- (BOOL)preferLastUsedDate;
- (BOOL)presentingMakesCollectionFirstResponder;
- (BOOL)restoreLastVisitedLocation;
- (BOOL)saveLastVisitedLocation;
- (BOOL)shouldAdjustContentInset;
- (BOOL)shouldConvert;
- (BOOL)shouldHideCatalystHostWindow;
- (BOOL)shouldIgnoreInteractionMode;
- (BOOL)shouldOpenInApp;
- (BOOL)showCollectionControls;
- (BOOL)skipDownload;
- (BOOL)supportsColumnView;
- (BOOL)supportsNavigationTitleMenus;
- (BOOL)supportsRelatedFilesInPicker;
- (BOOL)supportsRemovableFileProviders;
- (BOOL)suppressBlackCallout;
- (BOOL)useExpandedSourceList;
- (BOOL)useSharedQuickLook;
- (DOCConcreteLocation)defaultLocation;
- (DOCConfiguration)init;
- (DOCConfiguration)initWithCoder:(id)a3;
- (NSArray)documentContentTypes;
- (NSArray)excludedDocumentContentTypes;
- (NSArray)forbiddenActionIdentifiers;
- (NSArray)hiddenSourcesIdentifiers;
- (NSArray)recentDocumentsContentTypes;
- (NSArray)urls;
- (NSDictionary)allowedConversions;
- (NSString)defaultEffectiveTabIdentifierForLocationRestore;
- (NSString)hostBundleTitle;
- (NSString)hostIdentifier;
- (NSString)roleIdentifier;
- (NSString)sceneIdentifier;
- (NSString)stateIdentifier;
- (double)thumbnailFetchingTimeOut;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maximumNumberOfItemsToFetch;
- (int64_t)maximumNumberOfRows;
- (unint64_t)browserViewContext;
- (unint64_t)interactionMode;
- (unint64_t)interactionModeForPreparing;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedConversions:(id)a3;
- (void)setBrowserViewContext:(unint64_t)a3;
- (void)setCollectionSupportsDragAndDrop:(BOOL)a3;
- (void)setDefaultEffectiveTabIdentifierForLocationRestore:(id)a3;
- (void)setDefaultLocation:(id)a3;
- (void)setDocumentContentTypes:(id)a3;
- (void)setExcludedDocumentContentTypes:(id)a3;
- (void)setForMovingDocuments:(BOOL)a3;
- (void)setForPickingDocuments:(BOOL)a3;
- (void)setForPickingDownloadsFolder:(BOOL)a3;
- (void)setForPickingFolders:(BOOL)a3;
- (void)setForbiddenActionIdentifiers:(id)a3;
- (void)setHiddenSourcesIdentifiers:(id)a3;
- (void)setHostBundleTitle:(id)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setInProcess:(BOOL)a3;
- (void)setInteractionMode:(unint64_t)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setIsInUIPDocumentLanding:(BOOL)a3;
- (void)setMaximumNumberOfItemsToFetch:(int64_t)a3;
- (void)setMaximumNumberOfRows:(int64_t)a3;
- (void)setNeverCreateBookmarkForOpenInPlace:(BOOL)a3;
- (void)setPickingItemsShouldBumpLastOpenDate:(BOOL)a3;
- (void)setPreferLastUsedDate:(BOOL)a3;
- (void)setPresentingMakesCollectionFirstResponder:(BOOL)a3;
- (void)setRecentDocumentsContentTypes:(id)a3;
- (void)setRestoreLastVisitedLocation:(BOOL)a3;
- (void)setRoleIdentifier:(id)a3;
- (void)setSaveLastVisitedLocation:(BOOL)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setShouldAdjustContentInset:(BOOL)a3;
- (void)setShouldConvert:(BOOL)a3;
- (void)setShouldHideCatalystHostWindow:(BOOL)a3;
- (void)setShouldIgnoreInteractionMode:(BOOL)a3;
- (void)setShouldOpenInApp:(BOOL)a3;
- (void)setShowCollectionControls:(BOOL)a3;
- (void)setSkipDownload:(BOOL)a3;
- (void)setStateIdentifier:(id)a3;
- (void)setSupportsColumnView:(BOOL)a3;
- (void)setSupportsNavigationTitleMenus:(BOOL)a3;
- (void)setSupportsRelatedFilesInPicker:(BOOL)a3;
- (void)setSupportsRemovableFileProviders:(BOOL)a3;
- (void)setSuppressBlackCallout:(BOOL)a3;
- (void)setThumbnailFetchingTimeOut:(double)a3;
- (void)setUrls:(id)a3;
- (void)setUseExpandedSourceList:(BOOL)a3;
- (void)setUseSharedQuickLook:(BOOL)a3;
@end

@implementation DOCConfiguration

- (NSString)stateIdentifier
{
  return self->_stateIdentifier;
}

- (BOOL)forPickingDocuments
{
  return self->_forPickingDocuments;
}

- (BOOL)isInUIPDocumentLanding
{
  BOOL v3 = [(DOCConfiguration *)self forBrowsingInApp];
  if (v3) {
    LOBYTE(v3) = self->_isInUIPDocumentLanding;
  }
  return v3;
}

- (BOOL)forBrowsingInApp
{
  return ![(DOCConfiguration *)self isPickerUI];
}

- (BOOL)isPickerUI
{
  return self->_forPickingFolders
      || self->_forPickingDocuments
      || self->_forPickingDownloadsFolder
      || self->_forMovingDocuments;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (BOOL)supportsRemovableFileProviders
{
  return self->_supportsRemovableFileProviders;
}

- (BOOL)forSavingDocuments
{
  return [(DOCConfiguration *)self interactionMode] == 2
      || [(DOCConfiguration *)self interactionMode] == 3;
}

- (unint64_t)interactionMode
{
  return self->_interactionMode;
}

- (BOOL)inProcess
{
  return self->_inProcess;
}

- (BOOL)forMovingDocuments
{
  return self->_forMovingDocuments;
}

- (NSArray)recentDocumentsContentTypes
{
  recentDocumentsContentTypes = self->_recentDocumentsContentTypes;
  if (recentDocumentsContentTypes)
  {
    BOOL v3 = recentDocumentsContentTypes;
  }
  else
  {
    BOOL v3 = [(DOCConfiguration *)self documentContentTypes];
  }
  return v3;
}

- (NSArray)documentContentTypes
{
  v10[1] = *MEMORY[0x263EF8340];
  documentContentTypes = self->_documentContentTypes;
  if (documentContentTypes)
  {
LABEL_2:
    BOOL v3 = documentContentTypes;
    goto LABEL_3;
  }
  if (self->_hostIdentifier)
  {
    if (DOCSelfCanMapLSDatabase_onceToken != -1) {
      dispatch_once(&DOCSelfCanMapLSDatabase_onceToken, &__block_literal_global_13);
    }
    if (DOCSelfCanMapLSDatabase_canMapLSDatabase) {
      hostIdentifier = self->_hostIdentifier;
    }
    else {
      hostIdentifier = 0;
    }
    DOCContentTypesReadableByApplicationWithBundleIdentifier(hostIdentifier);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_documentContentTypes;
    self->_documentContentTypes = v7;

    NSUInteger v9 = [(NSArray *)self->_documentContentTypes count];
    documentContentTypes = self->_documentContentTypes;
    if (!v9)
    {
      self->_documentContentTypes = 0;

      documentContentTypes = self->_documentContentTypes;
    }
    goto LABEL_2;
  }
  v10[0] = *MEMORY[0x263F1DA38];
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
LABEL_3:
  return v3;
}

- (BOOL)isPopoverOrWidget
{
  if ([(DOCConfiguration *)self isPopover]) {
    return 1;
  }
  return [(DOCConfiguration *)self isWidget];
}

- (BOOL)isPopover
{
  return [(DOCConfiguration *)self browserViewContext] == 1;
}

- (BOOL)isWidget
{
  return [(DOCConfiguration *)self browserViewContext] == 2;
}

- (BOOL)isFilesApp
{
  BOOL v3 = [(DOCConfiguration *)self hostIdentifier];
  if ([v3 isEqualToString:@"com.apple.DocumentsApp"]) {
    BOOL v4 = [(DOCConfiguration *)self browserViewContext] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)browserViewContext
{
  return self->_browserViewContext;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (int64_t)maximumNumberOfItemsToFetch
{
  return self->_maximumNumberOfItemsToFetch;
}

- (NSArray)excludedDocumentContentTypes
{
  return self->_excludedDocumentContentTypes;
}

- (BOOL)preferLastUsedDate
{
  return self->_preferLastUsedDate;
}

- (BOOL)forPickingDownloadsFolder
{
  return self->_forPickingDownloadsFolder;
}

- (NSString)defaultEffectiveTabIdentifierForLocationRestore
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (DOCConcreteLocation)defaultLocation
{
  return (DOCConcreteLocation *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)forPickingFoldersOnly
{
  if (![(DOCConfiguration *)self forPickingFolders]) {
    return 0;
  }
  BOOL v3 = [(DOCConfiguration *)self documentContentTypes];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (BOOL)forPickingFolders
{
  return self->_forPickingFolders;
}

- (void)setRestoreLastVisitedLocation:(BOOL)a3
{
  self->_restoreLastVisitedLocation = a3;
}

- (void)setPreferLastUsedDate:(BOOL)a3
{
  self->_preferLastUsedDate = a3;
}

- (BOOL)showCollectionControls
{
  return self->_showCollectionControls;
}

- (void)setPresentingMakesCollectionFirstResponder:(BOOL)a3
{
  self->_presentingMakesCollectionFirstResponder = a3;
}

- (double)thumbnailFetchingTimeOut
{
  return self->_thumbnailFetchingTimeOut;
}

- (void)setDefaultEffectiveTabIdentifierForLocationRestore:(id)a3
{
}

- (NSArray)forbiddenActionIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)restoreLastVisitedLocation
{
  return self->_restoreLastVisitedLocation;
}

- (void)setSaveLastVisitedLocation:(BOOL)a3
{
  self->_saveLastVisitedLocation = a3;
}

- (void)setNeverCreateBookmarkForOpenInPlace:(BOOL)a3
{
  self->_neverCreateBookmarkForOpenInPlace = a3;
}

- (NSArray)hiddenSourcesIdentifiers
{
  return self->_hiddenSourcesIdentifiers;
}

- (NSString)hostBundleTitle
{
  hostBundleTitle = self->_hostBundleTitle;
  if (hostBundleTitle)
  {
    BOOL v3 = hostBundleTitle;
  }
  else if (self->_hostIdentifier)
  {
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:self->_hostIdentifier];

    if (v7)
    {
      v8 = [v5 localizedInfoDictionary];
      NSUInteger v9 = [v8 objectForKey:*MEMORY[0x263EFFB68]];
      v10 = self->_hostBundleTitle;
      self->_hostBundleTitle = v9;

      BOOL v3 = self->_hostBundleTitle;
    }
    else
    {
      if (DOCSelfCanMapLSDatabase_onceToken != -1) {
        dispatch_once(&DOCSelfCanMapLSDatabase_onceToken, &__block_literal_global_13);
      }
      if (DOCSelfCanMapLSDatabase_canMapLSDatabase)
      {
        v11 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:self->_hostIdentifier allowPlaceholder:0 error:0];
        v12 = [v11 localizedName];
        v13 = (NSString *)[v12 copy];
        v14 = self->_hostBundleTitle;
        self->_hostBundleTitle = v13;

        BOOL v3 = self->_hostBundleTitle;
      }
      else
      {
        BOOL v3 = 0;
      }
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [+[DOCConfiguration allocWithZone:a3] init];
  uint64_t v5 = [(DOCConcreteLocation *)self->_defaultLocation copy];
  defaultLocation = v4->_defaultLocation;
  v4->_defaultLocation = (DOCConcreteLocation *)v5;

  v4->_shouldOpenInApp = self->_shouldOpenInApp;
  v4->_inProcess = self->_inProcess;
  v4->_interactionMode = self->_interactionMode;
  v4->_shouldIgnoreInteractionMode = self->_shouldIgnoreInteractionMode;
  uint64_t v7 = [(NSArray *)self->_documentContentTypes copy];
  documentContentTypes = v4->_documentContentTypes;
  v4->_documentContentTypes = (NSArray *)v7;

  uint64_t v9 = [(NSArray *)self->_excludedDocumentContentTypes copy];
  excludedDocumentContentTypes = v4->_excludedDocumentContentTypes;
  v4->_excludedDocumentContentTypes = (NSArray *)v9;

  uint64_t v11 = [(NSArray *)self->_recentDocumentsContentTypes copy];
  recentDocumentsContentTypes = v4->_recentDocumentsContentTypes;
  v4->_recentDocumentsContentTypes = (NSArray *)v11;

  v13 = (void *)[(NSString *)self->_hostIdentifier copy];
  [(DOCConfiguration *)v4 setHostIdentifier:v13];

  [(DOCConfiguration *)v4 setIsContentManaged:self->_isContentManaged];
  uint64_t v14 = [(NSArray *)self->_urls copy];
  urls = v4->_urls;
  v4->_urls = (NSArray *)v14;

  uint64_t v16 = [(NSArray *)self->_forbiddenActionIdentifiers copy];
  forbiddenActionIdentifiers = v4->_forbiddenActionIdentifiers;
  v4->_forbiddenActionIdentifiers = (NSArray *)v16;

  v4->_neverCreateBookmarkForOpenInPlace = self->_neverCreateBookmarkForOpenInPlace;
  v4->_showCollectionControls = self->_showCollectionControls;
  uint64_t v18 = [(NSArray *)self->_hiddenSourcesIdentifiers copy];
  hiddenSourcesIdentifiers = v4->_hiddenSourcesIdentifiers;
  v4->_hiddenSourcesIdentifiers = (NSArray *)v18;

  v4->_useExpandedSourceList = self->_useExpandedSourceList;
  uint64_t v20 = [(NSString *)self->_roleIdentifier copy];
  roleIdentifier = v4->_roleIdentifier;
  v4->_roleIdentifier = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_stateIdentifier copy];
  stateIdentifier = v4->_stateIdentifier;
  v4->_stateIdentifier = (NSString *)v22;

  uint64_t v24 = [(NSString *)self->_sceneIdentifier copy];
  sceneIdentifier = v4->_sceneIdentifier;
  v4->_sceneIdentifier = (NSString *)v24;

  v4->_maximumNumberOfItemsToFetch = self->_maximumNumberOfItemsToFetch;
  v4->_maximumNumberOfRows = self->_maximumNumberOfRows;
  v4->_restoreLastVisitedLocation = self->_restoreLastVisitedLocation;
  objc_storeStrong((id *)&v4->_defaultEffectiveTabIdentifierForLocationRestore, self->_defaultEffectiveTabIdentifierForLocationRestore);
  v4->_saveLastVisitedLocation = self->_saveLastVisitedLocation;
  v4->_pickingItemsShouldBumpLastOpenDate = self->_pickingItemsShouldBumpLastOpenDate;
  v4->_shouldAdjustContentInset = self->_shouldAdjustContentInset;
  v4->_forPickingDocuments = self->_forPickingDocuments;
  v4->_forPickingFolders = self->_forPickingFolders;
  v4->_forPickingDownloadsFolder = self->_forPickingDownloadsFolder;
  v4->_forMovingDocuments = self->_forMovingDocuments;
  v4->_supportsRelatedFilesInPicker = self->_supportsRelatedFilesInPicker;
  v4->_useSharedQuickLook = self->_useSharedQuickLook;
  v4->_suppressBlackCallout = self->_suppressBlackCallout;
  v4->_preferLastUsedDate = self->_preferLastUsedDate;
  v4->_browserViewContext = self->_browserViewContext;
  v4->_skipDownload = self->_skipDownload;
  v4->_presentingMakesCollectionFirstResponder = self->_presentingMakesCollectionFirstResponder;
  v4->_thumbnailFetchingTimeOut = self->_thumbnailFetchingTimeOut;
  v4->_collectionSupportsDragAndDrop = self->_collectionSupportsDragAndDrop;
  v4->_supportsColumnView = self->_supportsColumnView;
  v4->_supportsNavigationTitleMenus = self->_supportsNavigationTitleMenus;
  v4->_supportsRemovableFileProviders = self->_supportsRemovableFileProviders;
  v4->_isInUIPDocumentLanding = self->_isInUIPDocumentLanding;
  v4->_shouldHideCatalystHostWindow = self->_shouldHideCatalystHostWindow;
  return v4;
}

- (DOCConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)DOCConfiguration;
  v2 = [(DOCConfiguration *)&v13 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_shouldIgnoreInteractionMode = 0;
    [(DOCConfiguration *)v2 setIsContentManaged:0];
    BOOL v4 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];
    [(DOCConfiguration *)v3 setHostIdentifier:v5];

    forbiddenActionIdentifiers = v3->_forbiddenActionIdentifiers;
    uint64_t v7 = (NSArray *)MEMORY[0x263EFFA68];
    v3->_forbiddenActionIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

    v3->_neverCreateBookmarkForOpenInPlace = 0;
    v3->_showCollectionControls = 1;
    hiddenSourcesIdentifiers = v3->_hiddenSourcesIdentifiers;
    v3->_hiddenSourcesIdentifiers = v7;

    v3->_useExpandedSourceList = 0;
    *(int64x2_t *)&v3->_maximumNumberOfItemsToFetch = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v3->_restoreLastVisitedLocation = 0;
    defaultEffectiveTabIdentifierForLocationRestore = v3->_defaultEffectiveTabIdentifierForLocationRestore;
    v3->_defaultEffectiveTabIdentifierForLocationRestore = (NSString *)@"Browse";

    *(_WORD *)&v3->_saveLastVisitedLocation = 256;
    *(_WORD *)&v3->_pickingItemsShouldBumpLastOpenDate = 1;
    *(_WORD *)&v3->_forPickingDocuments = 0;
    *(_WORD *)&v3->_forPickingDownloadsFolder = 0;
    v3->_forMovingDocuments = 0;
    v3->_browserViewContext = 0;
    v3->_thumbnailFetchingTimeOut = 0.25;
    v3->_presentingMakesCollectionFirstResponder = 1;
    *(_DWORD *)&v3->_supportsColumnView = 65792;
    *(_WORD *)&v3->_isInUIPDocumentLanding = 256;
    v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    LODWORD(v5) = [v10 BOOLForKey:@"DOCForceUIPDocumentLandingAlways"];

    if (v5) {
      v3->_isInUIPDocumentLanding = 1;
    }
    uint64_t v11 = v3;
  }

  return v3;
}

- (void)setHostIdentifier:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  hostIdentifier = self->_hostIdentifier;
  self->_hostIdentifier = v4;

  v6 = self->_hostIdentifier;
  id v7 = +[DOCManagedPermission defaultPermission];
  [v7 setHostIdentifier:v6];
}

- (void)setIsContentManaged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = docPersonaLogHandle;
  if (!docPersonaLogHandle)
  {
    DOCInitLogging();
    uint64_t v5 = docPersonaLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_213670000, v5, OS_LOG_TYPE_DEFAULT, "MDM : setting isContentManaged to : %@", (uint8_t *)&v8, 0xCu);
  }
  self->_isContentManaged = v3;
  id v7 = +[DOCManagedPermission defaultPermission];
  objc_sync_enter(v7);
  [v7 setHostAccountDataOwnerState:v3];
  objc_sync_exit(v7);
}

- (void)setSupportsRemovableFileProviders:(BOOL)a3
{
  self->_supportsRemovableFileProviders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_stateIdentifier, 0);
  objc_storeStrong((id *)&self->_roleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultEffectiveTabIdentifierForLocationRestore, 0);
  objc_storeStrong((id *)&self->_hiddenSourcesIdentifiers, 0);
  objc_storeStrong((id *)&self->_hostBundleTitle, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_recentDocumentsContentTypes, 0);
  objc_storeStrong((id *)&self->_excludedDocumentContentTypes, 0);
  objc_storeStrong((id *)&self->_allowedConversions, 0);
  objc_storeStrong((id *)&self->_documentContentTypes, 0);
  objc_storeStrong((id *)&self->_defaultLocation, 0);
}

- (void)setUseSharedQuickLook:(BOOL)a3
{
  self->_useSharedQuickLook = a3;
}

- (void)setUseExpandedSourceList:(BOOL)a3
{
  self->_useExpandedSourceList = a3;
}

- (void)setSupportsColumnView:(BOOL)a3
{
  self->_supportsColumnView = a3;
}

- (void)setStateIdentifier:(id)a3
{
}

- (void)setShouldOpenInApp:(BOOL)a3
{
  self->_shouldOpenInApp = a3;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (void)setRecentDocumentsContentTypes:(id)a3
{
}

- (void)setPickingItemsShouldBumpLastOpenDate:(BOOL)a3
{
  self->_pickingItemsShouldBumpLastOpenDate = a3;
}

- (void)setInProcess:(BOOL)a3
{
  self->_inProcess = a3;
}

- (void)setHiddenSourcesIdentifiers:(id)a3
{
}

- (void)setDefaultLocation:(id)a3
{
}

- (NSArray)urls
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)supportsNavigationTitleMenus
{
  return self->_supportsNavigationTitleMenus;
}

- (BOOL)shouldAdjustContentInset
{
  return self->_shouldAdjustContentInset;
}

- (BOOL)saveLastVisitedLocation
{
  return self->_saveLastVisitedLocation;
}

- (BOOL)collectionSupportsDragAndDrop
{
  return self->_collectionSupportsDragAndDrop;
}

+ (id)configurationForImportingDocumentContentTypes:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  if (a4 >= 2)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"DOCConfiguration.m" lineNumber:87 description:@"mode must be one of DOCDocumentInteractionModeImportOpen or DOCDocumentInteractionModeImportCopy."];
  }
  int v8 = objc_opt_new();
  [v8 setInteractionMode:a4];
  [v8 setDocumentContentTypes:v7];
  if ([v7 containsObject:*MEMORY[0x263F1DAB0]]) {
    [v8 setForPickingFolders:1];
  }

  return v8;
}

- (void)setInteractionMode:(unint64_t)a3
{
  self->_interactionMode = a3;
}

- (void)setDocumentContentTypes:(id)a3
{
}

+ (id)configurationForOpeningDocumentsOfApplicationWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setInteractionMode:1];
  [v4 setHostIdentifier:v3];

  return v4;
}

+ (id)configurationForImportingDocumentsWithContentTypes:(id)a3 mode:(unint64_t)a4
{
  if (a3)
  {
    v6 = objc_msgSend(MEMORY[0x263F1D920], "doc_contentTypesForIdentifiers:");
  }
  else
  {
    v6 = 0;
  }
  id v7 = [a1 configurationForImportingDocumentContentTypes:v6 mode:a4];

  return v7;
}

+ (id)configurationForImportingDocumentsWithConversionRules:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setInteractionMode:0];
  v6 = [a1 pickableContentTypesFromAllowedConversions:v4];
  [v5 setShouldConvert:1];
  [v5 setAllowedConversions:v4];

  id v7 = [v6 allObjects];
  [v5 setDocumentContentTypes:v7];

  return v5;
}

+ (id)pickableContentTypesFromAllowedConversions:(id)a3
{
  id v3 = a3;
  CFArrayRef v4 = CGImageDestinationCopyTypeIdentifiers();
  CFArrayRef v5 = CGImageSourceCopyTypeIdentifiers();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  uint64_t v18 = __Block_byref_object_dispose__5;
  id v19 = (id)objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke;
  v10[3] = &unk_2641B6258;
  objc_super v13 = &v14;
  CFArrayRef v6 = v4;
  CFArrayRef v11 = v6;
  CFArrayRef v7 = v5;
  CFArrayRef v12 = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v5];
  CFArrayRef v7 = (void *)a1[4];
  uint64_t v24 = v5;
  id v8 = [v5 identifier];
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v23 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v15 = (void *)a1[5];
          uint64_t v16 = [v14 identifier];
          LODWORD(v15) = [v15 containsObject:v16];

          if (v15)
          {
            [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v14];
          }
          else
          {
            v17 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v17 = docLogHandle;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = v17;
              id v19 = [v14 identifier];
              uint64_t v20 = [v14 identifier];
              v21 = [v24 identifier];
              *(_DWORD *)buf = 138412802;
              v30 = v19;
              __int16 v31 = 2112;
              v32 = v20;
              __int16 v33 = 2112;
              v34 = v21;
              _os_log_error_impl(&dword_213670000, v18, OS_LOG_TYPE_ERROR, "%@ is not part of Image I/O Source types so conversion from %@ to %@ not allowed", buf, 0x20u);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v11);
    }

    id v6 = v23;
  }
  else
  {
    uint64_t v22 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v22 = docLogHandle;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke_cold_1(v22, v5);
    }
  }
}

+ (id)configurationForExportingDocumentsToURLs:(id)a3 mode:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"DOCConfiguration.m" lineNumber:147 description:@"urls cannot be nil."];
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:a1 file:@"DOCConfiguration.m" lineNumber:149 description:@"mode must be one of DOCDocumentInteractionModeExportMove or DOCDocumentInteractionModeExportCopy."];
  }
  v21 = objc_opt_new();
  [v21 setInteractionMode:a4];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x21668EB00]();
        id v23 = 0;
        v15 = [MEMORY[0x263F054E0] wrapperWithURL:v13 readonly:a4 == 2 error:&v23];
        id v16 = v23;
        if (v15)
        {
          [v8 addObject:v15];
        }
        else
        {
          v17 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v17 = docLogHandle;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v29 = v13;
            __int16 v30 = 2112;
            id v31 = v16;
            _os_log_error_impl(&dword_213670000, v17, OS_LOG_TYPE_ERROR, "Failed to create FPSandboxingURLWrapper for %@. %@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }

  [v21 setUrls:v8];
  return v21;
}

+ (id)configurationForFolderPicking
{
  v2 = objc_opt_new();
  [v2 setInteractionMode:1];
  [v2 setForPickingFolders:1];
  return v2;
}

- (NSString)roleIdentifier
{
  roleIdentifier = (__CFString *)self->_roleIdentifier;
  if (!roleIdentifier)
  {
    BOOL v3 = [(DOCConfiguration *)self forPickingDocuments];
    roleIdentifier = @"com.apple.DocumentManager.Role.Picker";
    if (!v3) {
      roleIdentifier = 0;
    }
  }
  CFArrayRef v4 = roleIdentifier;
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DOCConfiguration;
  id v5 = [(DOCConfiguration *)&v48 init];
  if (v5)
  {
    v5->_interactionMode = [v4 decodeIntegerForKey:@"interactionMode"];
    v5->_shouldIgnoreInteractionMode = [v4 decodeBoolForKey:@"shouldIgnoreInteractionMode"];
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"documentContentTypes"];
    documentContentTypes = v5->_documentContentTypes;
    v5->_documentContentTypes = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"excludedDocumentContentTypes"];
    excludedDocumentContentTypes = v5->_excludedDocumentContentTypes;
    v5->_excludedDocumentContentTypes = (NSArray *)v14;

    id v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"recentDocumentsContentTypes"];
    recentDocumentsContentTypes = v5->_recentDocumentsContentTypes;
    v5->_recentDocumentsContentTypes = (NSArray *)v19;

    -[DOCConfiguration setIsContentManaged:](v5, "setIsContentManaged:", [v4 decodeBoolForKey:@"isContentManaged"]);
    v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    id v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"urls"];
    urls = v5->_urls;
    v5->_urls = (NSArray *)v24;

    long long v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostIdentifier"];
    [(DOCConfiguration *)v5 setHostIdentifier:v26];

    long long v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"forbiddenActionIdentifiers"];
    forbiddenActionIdentifiers = v5->_forbiddenActionIdentifiers;
    v5->_forbiddenActionIdentifiers = (NSArray *)v30;

    v5->_neverCreateBookmarkForOpenInPlace = [v4 decodeBoolForKey:@"neverCreateBookmarkForOpenInPlace"];
    v5->_showCollectionControls = [v4 decodeBoolForKey:@"showCollectionControls"];
    v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"hiddenSourcesIdentifiers"];
    hiddenSourcesIdentifiers = v5->_hiddenSourcesIdentifiers;
    v5->_hiddenSourcesIdentifiers = (NSArray *)v35;

    v5->_useExpandedSourceList = [v4 decodeBoolForKey:@"useExpandedSourceList"];
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roleIdentifier"];
    roleIdentifier = v5->_roleIdentifier;
    v5->_roleIdentifier = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateIdentifier"];
    stateIdentifier = v5->_stateIdentifier;
    v5->_stateIdentifier = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v41;

    v5->_maximumNumberOfItemsToFetch = [v4 decodeIntegerForKey:@"maximumNumberOfItemsToFetch"];
    v5->_maximumNumberOfRows = [v4 decodeIntegerForKey:@"maximumNumberOfRows"];
    v5->_restoreLastVisitedLocation = [v4 decodeBoolForKey:@"restoreLastVisitedLocation"];
    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultEffectiveTabIdentifierForLocationRestore"];
    defaultEffectiveTabIdentifierForLocationRestore = v5->_defaultEffectiveTabIdentifierForLocationRestore;
    v5->_defaultEffectiveTabIdentifierForLocationRestore = (NSString *)v43;

    v5->_saveLastVisitedLocation = [v4 decodeBoolForKey:@"saveLastVisitedLocation"];
    v5->_pickingItemsShouldBumpLastOpenDate = [v4 decodeBoolForKey:@"pickingItemsShouldBumpLastOpenDate"];
    v5->_shouldAdjustContentInset = [v4 decodeBoolForKey:@"shouldAdjustContentInset"];
    v5->_forPickingDocuments = [v4 decodeBoolForKey:@"forPickingDocuments"];
    v5->_forPickingFolders = [v4 decodeBoolForKey:@"forPickingFolders"];
    v5->_forPickingDownloadsFolder = [v4 decodeBoolForKey:@"forPickingDownloadsFolder"];
    v5->_forMovingDocuments = [v4 decodeBoolForKey:@"forMovingDocuments"];
    v5->_supportsRelatedFilesInPicker = [v4 decodeBoolForKey:@"supportsRelatedFilesInPicker"];
    v5->_useSharedQuickLook = [v4 decodeBoolForKey:@"useSharedQuickLook"];
    v5->_shouldOpenInApp = [v4 decodeBoolForKey:@"shouldOpenInApp"];
    v5->_suppressBlackCallout = [v4 decodeBoolForKey:@"suppressBlackCallout"];
    v5->_preferLastUsedDate = [v4 decodeBoolForKey:@"preferLastUsedDate"];
    v5->_browserViewContext = [v4 decodeIntegerForKey:@"browserViewContext"];
    v5->_skipDownload = [v4 decodeBoolForKey:@"skipDownload"];
    v5->_presentingMakesCollectionFirstResponder = [v4 decodeBoolForKey:@"presentingMakesCollectionFirstResponder"];
    [v4 decodeDoubleForKey:@"thumbnailFetchingTimeOut"];
    v5->_thumbnailFetchingTimeOut = v45;
    v5->_collectionSupportsDragAndDrop = [v4 decodeBoolForKey:@"collectionSupportsDragAndDrop"];
    v5->_supportsColumnView = [v4 decodeBoolForKey:@"supportsColumnView"];
    v5->_supportsNavigationTitleMenus = [v4 decodeBoolForKey:@"supportsNavigationTitleMenus"];
    v5->_supportsRemovableFileProviders = [v4 decodeBoolForKey:@"supportsRemovableFileProviders"];
    v5->_isInUIPDocumentLanding = [v4 decodeBoolForKey:@"isInUIPDocumentLanding"];
    v5->_shouldHideCatalystHostWindow = [v4 decodeBoolForKey:@"shouldHideCatalystHostWindow"];
    v46 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_interactionMode forKey:@"interactionMode"];
  [v5 encodeBool:self->_shouldIgnoreInteractionMode forKey:@"shouldIgnoreInteractionMode"];
  [v5 encodeObject:self->_documentContentTypes forKey:@"documentContentTypes"];
  [v5 encodeObject:self->_excludedDocumentContentTypes forKey:@"excludedDocumentContentTypes"];
  [v5 encodeObject:self->_recentDocumentsContentTypes forKey:@"recentDocumentsContentTypes"];
  urls = self->_urls;
  if (urls) {
    [v5 encodeObject:urls forKey:@"urls"];
  }
  [v5 encodeObject:self->_hostIdentifier forKey:@"hostIdentifier"];
  [v5 encodeBool:self->_isContentManaged forKey:@"isContentManaged"];
  [v5 encodeObject:self->_forbiddenActionIdentifiers forKey:@"forbiddenActionIdentifiers"];
  [v5 encodeBool:self->_neverCreateBookmarkForOpenInPlace forKey:@"neverCreateBookmarkForOpenInPlace"];
  [v5 encodeBool:self->_showCollectionControls forKey:@"showCollectionControls"];
  [v5 encodeObject:self->_hiddenSourcesIdentifiers forKey:@"hiddenSourcesIdentifiers"];
  [v5 encodeBool:self->_useExpandedSourceList forKey:@"useExpandedSourceList"];
  [v5 encodeBool:self->_restoreLastVisitedLocation forKey:@"restoreLastVisitedLocation"];
  [v5 encodeObject:self->_defaultEffectiveTabIdentifierForLocationRestore forKey:@"defaultEffectiveTabIdentifierForLocationRestore"];
  [v5 encodeBool:self->_saveLastVisitedLocation forKey:@"saveLastVisitedLocation"];
  [v5 encodeBool:self->_shouldOpenInApp forKey:@"shouldOpenInApp"];
  [v5 encodeObject:self->_roleIdentifier forKey:@"roleIdentifier"];
  [v5 encodeObject:self->_stateIdentifier forKey:@"stateIdentifier"];
  [v5 encodeObject:self->_sceneIdentifier forKey:@"sceneIdentifier"];
  [v5 encodeInteger:self->_maximumNumberOfItemsToFetch forKey:@"maximumNumberOfItemsToFetch"];
  [v5 encodeInteger:self->_maximumNumberOfRows forKey:@"maximumNumberOfRows"];
  [v5 encodeBool:self->_pickingItemsShouldBumpLastOpenDate forKey:@"pickingItemsShouldBumpLastOpenDate"];
  [v5 encodeBool:self->_shouldAdjustContentInset forKey:@"shouldAdjustContentInset"];
  [v5 encodeBool:self->_forPickingDocuments forKey:@"forPickingDocuments"];
  [v5 encodeBool:self->_forPickingFolders forKey:@"forPickingFolders"];
  [v5 encodeBool:self->_forPickingDownloadsFolder forKey:@"forPickingDownloadsFolder"];
  [v5 encodeBool:self->_forMovingDocuments forKey:@"forMovingDocuments"];
  [v5 encodeBool:self->_supportsRelatedFilesInPicker forKey:@"supportsRelatedFilesInPicker"];
  [v5 encodeBool:self->_useSharedQuickLook forKey:@"useSharedQuickLook"];
  [v5 encodeBool:self->_suppressBlackCallout forKey:@"suppressBlackCallout"];
  [v5 encodeBool:self->_preferLastUsedDate forKey:@"preferLastUsedDate"];
  [v5 encodeInteger:self->_browserViewContext forKey:@"browserViewContext"];
  [v5 encodeBool:self->_skipDownload forKey:@"skipDownload"];
  [v5 encodeBool:self->_presentingMakesCollectionFirstResponder forKey:@"presentingMakesCollectionFirstResponder"];
  [v5 encodeDouble:@"thumbnailFetchingTimeOut" forKey:self->_thumbnailFetchingTimeOut];
  [v5 encodeBool:self->_collectionSupportsDragAndDrop forKey:@"collectionSupportsDragAndDrop"];
  [v5 encodeBool:self->_supportsColumnView forKey:@"supportsColumnView"];
  [v5 encodeBool:self->_supportsNavigationTitleMenus forKey:@"supportsNavigationTitleMenus"];
  [v5 encodeBool:self->_supportsRemovableFileProviders forKey:@"supportsRemovableFileProviders"];
  [v5 encodeBool:self->_isInUIPDocumentLanding forKey:@"isInUIPDocumentLanding"];
  [v5 encodeBool:self->_shouldHideCatalystHostWindow forKey:@"shouldHideCatalystHostWindow"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DOCConfiguration *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(DOCConfiguration *)v4 isEqualToConfiguration:self];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = (NSArray **)a3;
  char v5 = v4;
  if ((NSArray *)self->_interactionMode != v4[6]) {
    goto LABEL_53;
  }
  if (self->_shouldIgnoreInteractionMode != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_53;
  }
  documentContentTypes = self->_documentContentTypes;
  if (documentContentTypes != v5[7] && !-[NSArray isEqual:](documentContentTypes, "isEqual:")) {
    goto LABEL_53;
  }
  excludedDocumentContentTypes = self->_excludedDocumentContentTypes;
  if (excludedDocumentContentTypes != v5[9]
    && !-[NSArray isEqual:](excludedDocumentContentTypes, "isEqual:"))
  {
    goto LABEL_53;
  }
  recentDocumentsContentTypes = self->_recentDocumentsContentTypes;
  if (recentDocumentsContentTypes != v5[10]
    && !-[NSArray isEqual:](recentDocumentsContentTypes, "isEqual:"))
  {
    goto LABEL_53;
  }
  if (((urls = self->_urls, urls == v5[11]) || -[NSArray isEqual:](urls, "isEqual:"))
    && ((hostIdentifier = self->_hostIdentifier, hostIdentifier == (NSString *)v5[12])
     || -[NSString isEqual:](hostIdentifier, "isEqual:"))
    && self->_isContentManaged == *((unsigned __int8 *)v5 + 17)
    && ((forbiddenActionIdentifiers = self->_forbiddenActionIdentifiers, forbiddenActionIdentifiers == v5[22])
     || -[NSArray isEqual:](forbiddenActionIdentifiers, "isEqual:"))
    && self->_neverCreateBookmarkForOpenInPlace == *((unsigned __int8 *)v5 + 18)
    && self->_showCollectionControls == *((unsigned __int8 *)v5 + 30)
    && ((hiddenSourcesIdentifiers = self->_hiddenSourcesIdentifiers, hiddenSourcesIdentifiers == v5[14])
     || -[NSArray isEqual:](hiddenSourcesIdentifiers, "isEqual:"))
    && self->_useExpandedSourceList == *((unsigned __int8 *)v5 + 35)
    && self->_restoreLastVisitedLocation == *((unsigned __int8 *)v5 + 25)
    && hasEqual_defaultEffectiveTabIdentifierForLocationRestore(self, v5)
    && self->_saveLastVisitedLocation == *((unsigned __int8 *)v5 + 26)
    && self->_shouldOpenInApp == *((unsigned __int8 *)v5 + 24)
    && ((roleIdentifier = self->_roleIdentifier, roleIdentifier == (NSString *)v5[19])
     || -[NSString isEqual:](roleIdentifier, "isEqual:"))
    && ((stateIdentifier = self->_stateIdentifier, stateIdentifier == (NSString *)v5[20])
     || -[NSString isEqual:](stateIdentifier, "isEqual:"))
    && ((sceneIdentifier = self->_sceneIdentifier, sceneIdentifier == (NSString *)v5[21])
     || -[NSString isEqual:](sceneIdentifier, "isEqual:"))
    && (NSArray *)self->_maximumNumberOfItemsToFetch == v5[16]
    && (NSArray *)self->_maximumNumberOfRows == v5[17]
    && self->_pickingItemsShouldBumpLastOpenDate == *((unsigned __int8 *)v5 + 19)
    && self->_shouldAdjustContentInset == *((unsigned __int8 *)v5 + 33)
    && self->_forPickingDocuments == *((unsigned __int8 *)v5 + 11)
    && self->_forPickingFolders == *((unsigned __int8 *)v5 + 12)
    && self->_forPickingDownloadsFolder == *((unsigned __int8 *)v5 + 15)
    && self->_forMovingDocuments == *((unsigned __int8 *)v5 + 13)
    && self->_supportsRelatedFilesInPicker == *((unsigned __int8 *)v5 + 16)
    && self->_useSharedQuickLook == *((unsigned __int8 *)v5 + 34)
    && self->_suppressBlackCallout == *((unsigned __int8 *)v5 + 20)
    && self->_preferLastUsedDate == *((unsigned __int8 *)v5 + 21)
    && (NSArray *)self->_browserViewContext == v5[18]
    && self->_skipDownload == *((unsigned __int8 *)v5 + 28)
    && self->_presentingMakesCollectionFirstResponder == *((unsigned __int8 *)v5 + 29)
    && self->_thumbnailFetchingTimeOut == *((double *)v5 + 23)
    && self->_collectionSupportsDragAndDrop == *((unsigned __int8 *)v5 + 27)
    && self->_supportsColumnView == *((unsigned __int8 *)v5 + 31)
    && self->_supportsNavigationTitleMenus == *((unsigned __int8 *)v5 + 32)
    && self->_supportsRemovableFileProviders == *((unsigned __int8 *)v5 + 14)
    && self->_isInUIPDocumentLanding == *((unsigned __int8 *)v5 + 22))
  {
    BOOL v16 = self->_shouldHideCatalystHostWindow == *((unsigned __int8 *)v5 + 23);
  }
  else
  {
LABEL_53:
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)interactionModeForPreparing
{
  if ([(DOCConfiguration *)self shouldIgnoreInteractionMode]) {
    return 1;
  }
  return [(DOCConfiguration *)self interactionMode];
}

- (BOOL)shouldIgnoreInteractionMode
{
  return self->_shouldIgnoreInteractionMode;
}

- (void)setShouldIgnoreInteractionMode:(BOOL)a3
{
  self->_shouldIgnoreInteractionMode = a3;
}

- (NSDictionary)allowedConversions
{
  return self->_allowedConversions;
}

- (void)setAllowedConversions:(id)a3
{
}

- (BOOL)shouldConvert
{
  return self->_shouldConvert;
}

- (void)setShouldConvert:(BOOL)a3
{
  self->_shouldConvert = a3;
}

- (void)setExcludedDocumentContentTypes:(id)a3
{
}

- (void)setUrls:(id)a3
{
}

- (void)setHostBundleTitle:(id)a3
{
}

- (void)setForPickingDocuments:(BOOL)a3
{
  self->_forPickingDocuments = a3;
}

- (void)setForPickingFolders:(BOOL)a3
{
  self->_forPickingFolders = a3;
}

- (void)setForMovingDocuments:(BOOL)a3
{
  self->_forMovingDocuments = a3;
}

- (void)setForPickingDownloadsFolder:(BOOL)a3
{
  self->_forPickingDownloadsFolder = a3;
}

- (BOOL)supportsRelatedFilesInPicker
{
  return self->_supportsRelatedFilesInPicker;
}

- (void)setSupportsRelatedFilesInPicker:(BOOL)a3
{
  self->_supportsRelatedFilesInPicker = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (BOOL)neverCreateBookmarkForOpenInPlace
{
  return self->_neverCreateBookmarkForOpenInPlace;
}

- (BOOL)pickingItemsShouldBumpLastOpenDate
{
  return self->_pickingItemsShouldBumpLastOpenDate;
}

- (BOOL)suppressBlackCallout
{
  return self->_suppressBlackCallout;
}

- (void)setSuppressBlackCallout:(BOOL)a3
{
  self->_suppressBlackCallout = a3;
}

- (void)setIsInUIPDocumentLanding:(BOOL)a3
{
  self->_isInUIPDocumentLanding = a3;
}

- (BOOL)shouldHideCatalystHostWindow
{
  return self->_shouldHideCatalystHostWindow;
}

- (void)setShouldHideCatalystHostWindow:(BOOL)a3
{
  self->_shouldHideCatalystHostWindow = a3;
}

- (BOOL)shouldOpenInApp
{
  return self->_shouldOpenInApp;
}

- (void)setCollectionSupportsDragAndDrop:(BOOL)a3
{
  self->_collectionSupportsDragAndDrop = a3;
}

- (void)setMaximumNumberOfItemsToFetch:(int64_t)a3
{
  self->_maximumNumberOfItemsToFetch = a3;
}

- (int64_t)maximumNumberOfRows
{
  return self->_maximumNumberOfRows;
}

- (void)setMaximumNumberOfRows:(int64_t)a3
{
  self->_maximumNumberOfRows = a3;
}

- (BOOL)skipDownload
{
  return self->_skipDownload;
}

- (void)setSkipDownload:(BOOL)a3
{
  self->_skipDownload = a3;
}

- (BOOL)presentingMakesCollectionFirstResponder
{
  return self->_presentingMakesCollectionFirstResponder;
}

- (void)setShowCollectionControls:(BOOL)a3
{
  self->_showCollectionControls = a3;
}

- (BOOL)supportsColumnView
{
  return self->_supportsColumnView;
}

- (void)setSupportsNavigationTitleMenus:(BOOL)a3
{
  self->_supportsNavigationTitleMenus = a3;
}

- (void)setShouldAdjustContentInset:(BOOL)a3
{
  self->_shouldAdjustContentInset = a3;
}

- (BOOL)useSharedQuickLook
{
  return self->_useSharedQuickLook;
}

- (BOOL)useExpandedSourceList
{
  return self->_useExpandedSourceList;
}

- (void)setBrowserViewContext:(unint64_t)a3
{
  self->_browserViewContext = a3;
}

- (void)setRoleIdentifier:(id)a3
{
}

- (void)setForbiddenActionIdentifiers:(id)a3
{
}

- (void)setThumbnailFetchingTimeOut:(double)a3
{
  self->_thumbnailFetchingTimeOut = a3;
}

void __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  id v4 = [a2 identifier];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_213670000, v3, OS_LOG_TYPE_ERROR, "%@ is not part of Image I/O Destination types so conversion not allowed", (uint8_t *)&v5, 0xCu);
}

@end