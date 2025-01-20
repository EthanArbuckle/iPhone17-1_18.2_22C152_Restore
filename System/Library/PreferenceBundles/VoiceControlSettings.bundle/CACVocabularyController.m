@interface CACVocabularyController
- (id)specifiers;
- (id)vocabularySummary:(id)a3;
- (void)deleteAllVocabulary;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)exportVocabulary;
- (void)importVocabulary;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CACVocabularyController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = settingsLocString(@"VOCABULARY", @"CommandAndControlSettings");
    v24 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"vocabularySummary:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v6 = PSIDKey;
    [v24 setProperty:@"VOCABULARY" forKey:PSIDKey];
    v25 = +[PSSpecifier groupSpecifierWithID:@"CACImportExportDeleteAllGroup"];
    v7 = settingsLocString(@"IMPORT_VOCABULARY", @"CommandAndControlSettings");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v8 setButtonAction:"importVocabulary"];
    uint64_t v9 = PSAllowMultilineTitleKey;
    [v8 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v8 setProperty:@"IMPORT_VOCABULARY" forKey:v6];
    v10 = settingsLocString(@"EXPORT_VOCABULARY", @"CommandAndControlSettings");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v11 setButtonAction:"exportVocabulary"];
    [v11 setProperty:&__kCFBooleanTrue forKey:v9];
    [v11 setProperty:@"EXPORT_VOCABULARY" forKey:v6];
    v12 = settingsLocString(@"DELETE_ALL_VOCABULARY", @"CommandAndControlSettings");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v13 setButtonAction:"deleteAllVocabulary"];
    [v13 setProperty:&__kCFBooleanTrue forKey:v9];
    [v13 setProperty:@"DELETE_ALL_VOCABULARY" forKey:v6];
    v27[0] = v24;
    v27[1] = v25;
    v27[2] = v8;
    uint64_t v14 = +[NSArray arrayWithObjects:v27 count:3];
    v15 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v14;

    v16 = +[CACPreferences sharedPreferences];
    v17 = [v16 vocabularyEntries];
    id v18 = [v17 count];

    if (v18)
    {
      v19 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
      v26[0] = v11;
      v26[1] = v13;
      v20 = +[NSArray arrayWithObjects:v26 count:2];
      uint64_t v21 = [v19 arrayByAddingObjectsFromArray:v20];
      v22 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
      *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v21;
    }
    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACVocabularyController;
  [(CACVocabularyController *)&v4 viewWillAppear:a3];
  [(CACVocabularyController *)self reloadSpecifiers];
}

- (id)vocabularySummary:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  objc_super v4 = +[CACPreferences sharedPreferences];
  v5 = [v4 bestLocaleIdentifier];
  uint64_t v6 = [v3 vocabularyEntriesForLocaleIdentifier:v5];
  id v7 = [v6 count];

  v8 = settingsLocString(@"VOCABULARY_SUMMARY_FORMAT", @"CommandAndControlSettings");
  uint64_t v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v7);

  return v9;
}

- (void)importVocabulary
{
  uint64_t v3 = +[UTType typeWithFilenameExtension:kCACVocabularyFileExtensionVCVocabulary];
  id v4 = objc_alloc((Class)UIDocumentPickerViewController);
  id v7 = v3;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  id v6 = [v4 initForOpeningContentTypes:v5];

  [v6 setModalPresentationStyle:2];
  [v6 setDelegate:self];
  [(CACVocabularyController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)exportVocabulary
{
  uint64_t v3 = +[CACVocabularyImportExportUtilities defaultExportURL];
  [v3 startAccessingSecurityScopedResource];
  id v4 = +[CACVocabularyImportExportUtilities exportToURL:v3];
  v5 = v4;
  if (v4)
  {
    [v4 displayAlertForViewController:self];
  }
  else
  {
    id v6 = objc_alloc((Class)UIDocumentPickerViewController);
    uint64_t v9 = v3;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    id v8 = [v6 initForExportingURLs:v7];

    [v8 setModalPresentationStyle:2];
    [(CACVocabularyController *)self presentViewController:v8 animated:1 completion:0];
  }
  [v3 stopAccessingSecurityScopedResource];
}

- (void)deleteAllVocabulary
{
  uint64_t v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = settingsLocString(@"DELETE_ALL_VOCABULARY", @"CommandAndControlSettings");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_840C;
  v8[3] = &unk_4DA80;
  v8[4] = self;
  v5 = +[UIAlertAction actionWithTitle:v4 style:2 handler:v8];
  [v3 addAction:v5];

  id v6 = settingsLocString(@"CANCEL", @"CommandAndControlSettings");
  id v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:&stru_4DAC0];
  [v3 addAction:v7];

  [(CACVocabularyController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[CACVocabularyImportExportUtilities importFromURL:v6];
  [v5 displayAlertForViewController:self];
}

@end