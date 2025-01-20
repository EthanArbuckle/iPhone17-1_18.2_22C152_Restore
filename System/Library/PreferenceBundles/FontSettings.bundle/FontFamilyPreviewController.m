@interface FontFamilyPreviewController
- (BOOL)fontInfoInitialized;
- (FontFamilyPreviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)fonts;
- (NSString)localizedFamilyName;
- (NSString)providerBundle;
- (NSString)providerName;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)fileSize;
- (void)doRemove:(id)a3;
- (void)doneButtonTapped;
- (void)fetchFontInfo;
- (void)removeButtonTapped;
- (void)setFileSize:(unint64_t)a3;
- (void)setFontInfoInitialized:(BOOL)a3;
- (void)setLocalizedFamilyName:(id)a3;
- (void)setProviderBundle:(id)a3;
- (void)setProviderName:(id)a3;
- (void)updateNavigationItem;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FontFamilyPreviewController

- (FontFamilyPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FontFamilyPreviewController;
  return [(FontFamilyPreviewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)fetchFontInfo
{
  if (!self->_fontInfoInitialized)
  {
    v3 = [(FontFamilyPreviewController *)self specifier];
    v4 = [v3 userInfo];
    objc_super v5 = [v4 objectForKey:@"family"];

    v6 = [v5 localizedFamilyName];
    localizedFamilyName = self->_localizedFamilyName;
    self->_localizedFamilyName = v6;

    v8 = [v5 providerLocalizedName];
    providerName = self->_providerName;
    self->_providerName = v8;

    v10 = [v5 providerIdentifier];
    providerBundle = self->_providerBundle;
    self->_providerBundle = v10;

    v12 = [v5 fonts];
    fonts = self->_fonts;
    self->_fonts = v12;

    self->_fileSize = (unint64_t)[v5 fileSize];
    v14 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_fonts count]];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v15 = self->_fonts;
    id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "localizedStyleName", (void)v21);
          [v14 addObject:v20];
        }
        id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }

    self->_fontInfoInitialized = 1;
  }
}

- (NSString)localizedFamilyName
{
  if (!self->_fontInfoInitialized) {
    [(FontFamilyPreviewController *)self fetchFontInfo];
  }
  localizedFamilyName = self->_localizedFamilyName;

  return localizedFamilyName;
}

- (NSString)providerName
{
  if (!self->_fontInfoInitialized) {
    [(FontFamilyPreviewController *)self fetchFontInfo];
  }
  providerName = self->_providerName;

  return providerName;
}

- (NSString)providerBundle
{
  if (!self->_fontInfoInitialized) {
    [(FontFamilyPreviewController *)self fetchFontInfo];
  }
  providerBundle = self->_providerBundle;

  return providerBundle;
}

- (NSArray)fonts
{
  if (!self->_fontInfoInitialized) {
    [(FontFamilyPreviewController *)self fetchFontInfo];
  }
  fonts = self->_fonts;

  return fonts;
}

- (unint64_t)fileSize
{
  if (!self->_fontInfoInitialized) {
    [(FontFamilyPreviewController *)self fetchFontInfo];
  }
  return self->_fileSize;
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v41 = OBJC_IVAR___PSListController__specifiers;
    uint64_t v4 = [(FontFamilyPreviewController *)self localizedFamilyName];
    v43 = +[NSMutableArray array];
    objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v5 setProperty:@"HEADER" forKey:PSIDKey];
    v6 = [[FontFamilyInfoCell alloc] initWithStyle:0 reuseIdentifier:@"FontFamilyInfoCell" specifier:v5];
    v40 = (void *)v4;
    [(FontFamilyInfoCell *)v6 setLocalizedFamilyName:v4];
    v7 = [(FontFamilyPreviewController *)self specifier];
    v8 = [v7 userInfo];
    v9 = [v8 objectForKey:@"family"];

    v10 = [v9 providerLocalizedName];
    [(FontFamilyInfoCell *)v6 setProviderName:v10];

    v11 = [v9 copyrightString];
    [(FontFamilyInfoCell *)v6 setCopyright:v11];

    v12 = [v9 versionString];
    [(FontFamilyInfoCell *)v6 setVersion:v12];

    -[FontFamilyInfoCell setFileSize:](v6, "setFileSize:", [v9 fileSize]);
    v13 = [v9 providerIdentifier];
    id v14 = [v13 length];

    if (v14)
    {
      v15 = [v9 providerIdentifier];
      id v16 = +[UIScreen mainScreen];
      [v16 scale];
      id v17 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v15, 0);

      [(FontFamilyInfoCell *)v6 setProviderIcon:v17];
    }
    v38 = v6;
    objc_storeStrong((id *)&self->_familyInfoCell, v6);
    [(FontFamilyInfoCell *)self->_familyInfoCell layoutSubviews];
    [(FontFamilyInfoCell *)self->_familyInfoCell bounds];
    v19 = +[NSNumber numberWithDouble:v18];
    [v5 setProperty:v19 forKey:PSTableCellHeightKey];

    v39 = v5;
    [v43 addObject:v5];
    v20 = [(FontFamilyPreviewController *)self fonts];
    long long v21 = [v20 sortedArrayUsingSelector:"compareWeight:"];

    long long v22 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v23 = [v22 localizedStringForKey:@"FACES_PLURAL" value:&stru_1CDF0 table:@"FontSettings"];
    uint64_t v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, [v21 count]);

    v37 = (void *)v24;
    v36 = +[PSSpecifier groupSpecifierWithName:v24];
    objc_msgSend(v43, "addObject:");
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v21;
    id v25 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v45;
      uint64_t v28 = PSValueKey;
      uint64_t v29 = PSCellClassKey;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v32 = [v31 localizedStyleName];
          v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

          [v33 setProperty:v31 forKey:v28];
          [v33 setProperty:objc_opt_class() forKey:v29];
          [v43 addObject:v33];
        }
        id v26 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v26);
    }

    v34 = *(void **)&self->PSListController_opaque[v41];
    *(void *)&self->PSListController_opaque[v41] = v43;

    v3 = *(void **)&self->PSListController_opaque[v41];
  }

  return v3;
}

- (void)doneButtonTapped
{
  id v3 = [(FontFamilyPreviewController *)self navigationController];
  id v2 = [v3 popToRootViewControllerAnimated:1];
}

- (void)doRemove:(id)a3
{
  uint64_t v4 = +[FontSettingsManager sharedManager];
  objc_super v5 = [(FontFamilyPreviewController *)self specifier];
  v6 = [v5 userInfo];
  v7 = [v6 objectForKey:@"family"];
  v11 = v7;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];
  [v4 removeFontFamilies:v8];

  v9 = [(FontFamilyPreviewController *)self navigationController];
  id v10 = [v9 popViewControllerAnimated:1];
}

- (void)removeButtonTapped
{
  id v11 = +[PSConfirmationSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v11 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"REMOVE_FAMILY_CANCEL" value:&stru_1CDF0 table:@"FontSettings"];
  [v11 setCancelButton:v4];

  [v11 setConfirmationAction:"doRemove:"];
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"REMOVE_FAMILY_OK" value:&stru_1CDF0 table:@"FontSettings"];
  [v11 setOkButton:v6];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"REMOVE_FAMILY_TITLE" value:&stru_1CDF0 table:@"FontSettings"];
  [v11 setTitle:v8];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"REMOVE_FAMILY_PROMPT" value:&stru_1CDF0 table:@"FontSettings"];
  [v11 setPrompt:v10];

  [(FontFamilyPreviewController *)self showConfirmationViewForSpecifier:v11];
}

- (void)updateNavigationItem
{
  id v3 = [(FontFamilyPreviewController *)self specifier];
  uint64_t v4 = [v3 userInfo];
  id v13 = [v4 objectForKey:@"family"];

  if ([v13 isDeletable])
  {
    id v5 = objc_alloc((Class)UIBarButtonItem);
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"REMOVE_BUTTON" value:&stru_1CDF0 table:@"FontSettings"];
    id v8 = [v5 initWithTitle:v7 style:0 target:self action:"removeButtonTapped"];
    v9 = [(FontFamilyPreviewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];

    id v10 = +[UIColor _systemDestructiveTintColor];
    id v11 = [(FontFamilyPreviewController *)self navigationItem];
    v12 = [v11 rightBarButtonItem];
    [v12 setTintColor:v10];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FontFamilyPreviewController;
  [(FontFamilyPreviewController *)&v4 viewWillAppear:a3];
  [(FontFamilyPreviewController *)self updateNavigationItem];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FontFamilyPreviewController *)self specifierAtIndex:[(FontFamilyPreviewController *)self indexForIndexPath:v7]];
  v9 = [v8 identifier];
  unsigned int v10 = [v9 isEqualToString:@"HEADER"];

  if (v10)
  {
    id v11 = self->_familyInfoCell;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)FontFamilyPreviewController;
    id v11 = [(FontFamilyPreviewController *)&v14 tableView:v6 cellForRowAtIndexPath:v7];
  }
  v12 = v11;

  return v12;
}

- (void)setLocalizedFamilyName:(id)a3
{
}

- (void)setProviderName:(id)a3
{
}

- (void)setProviderBundle:(id)a3
{
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (BOOL)fontInfoInitialized
{
  return self->_fontInfoInitialized;
}

- (void)setFontInfoInitialized:(BOOL)a3
{
  self->_fontInfoInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundle, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_localizedFamilyName, 0);
  objc_storeStrong((id *)&self->_fonts, 0);

  objc_storeStrong((id *)&self->_familyInfoCell, 0);
}

@end