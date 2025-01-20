@interface CACVocabularyEntriesController
- (BOOL)_isTextValidForVocabulary:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CACVocabularyEntriesController)init;
- (Class)detailViewControllerClass;
- (UIAlertAction)saveAction;
- (id)detailTextForItem:(id)a3;
- (id)items;
- (id)textForItem:(id)a3;
- (void)addButtonTapped;
- (void)dealloc;
- (void)deleteItem:(id)a3;
- (void)setSaveAction:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
@end

@implementation CACVocabularyEntriesController

- (CACVocabularyEntriesController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CACVocabularyEntriesController;
  v2 = [(CACVocabularyEntriesController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_44B8, @"NotificationVocabularyEntriesSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    [(CACVocabularyEntriesController *)v2 setEdgeToEdgeCells:1];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NotificationVocabularyEntriesSettingsChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CACVocabularyEntriesController;
  [(CACVocabularyEntriesController *)&v4 dealloc];
}

- (id)items
{
  v2 = +[CACPreferences sharedPreferences];
  v3 = +[CACPreferences sharedPreferences];
  objc_super v4 = [v3 bestLocaleIdentifier];
  objc_super v5 = [v2 vocabularyEntriesForLocaleIdentifier:v4];

  return v5;
}

- (Class)detailViewControllerClass
{
  return 0;
}

- (id)textForItem:(id)a3
{
  return _[a3 objectForKeyedSubscript:@"Text"];
}

- (id)detailTextForItem:(id)a3
{
  return 0;
}

- (void)deleteItem:(id)a3
{
  id v12 = a3;
  v3 = +[CACPreferences sharedPreferences];
  objc_super v4 = +[CACPreferences sharedPreferences];
  objc_super v5 = [v4 bestLocaleIdentifier];
  v6 = [v3 vocabularyEntriesForLocaleIdentifier:v5];
  id v7 = [v6 mutableCopy];

  id v8 = [v7 indexOfObject:v12];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    _AXAssert();
  }
  else
  {
    [v7 removeObjectAtIndex:v8];
    v9 = +[CACPreferences sharedPreferences];
    v10 = +[CACPreferences sharedPreferences];
    v11 = [v10 bestLocaleIdentifier];
    [v9 setVocabularyEntries:v7 forLocaleIdentifier:v11];
  }
}

- (void)addButtonTapped
{
  [(CACVocabularyEntriesController *)self setEditing:0 animated:1];
  v3 = +[CACPreferences sharedPreferences];
  objc_super v4 = [v3 bestLocaleIdentifier];
  unsigned int v5 = [v4 hasPrefix:@"en"];

  if (v5)
  {
    v6 = +[CACPreferences sharedPreferences];
    id v7 = [v6 bestLocaleIdentifier];
    id v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_4A90;
    v23[3] = &unk_4D980;
    v23[4] = self;
    v9 = +[CACPhoneticVocabularyNavigationViewWrapper createWithLocale:v8 completionHandler:v23];
    [(CACVocabularyEntriesController *)self presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    [(CACVocabularyListController *)self reloadSpecifiers];
    v10 = settingsLocString(@"ADD_VOCABULARY_TITLE", @"CommandAndControlSettings");
    v11 = settingsLocString(@"ADD_VOCABULARY_MESSAGE", @"CommandAndControlSettings");
    id v12 = +[UIAlertController alertControllerWithTitle:v10 message:v11 preferredStyle:1];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_4A98;
    v22[3] = &unk_4D9A8;
    v22[4] = self;
    [v12 addTextFieldWithConfigurationHandler:v22];
    v13 = settingsLocString(@"CANCEL", @"CommandAndControlSettings");
    v9 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];

    [v12 addAction:v9];
    v14 = settingsLocString(@"SAVE", @"CommandAndControlSettings");
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_4B2C;
    v19 = &unk_4D9D0;
    id v20 = v12;
    v21 = self;
    id v8 = v12;
    v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&v16];

    -[CACVocabularyEntriesController setSaveAction:](self, "setSaveAction:", v15, v16, v17, v18, v19);
    [v8 addAction:v15];
    [(CACVocabularyEntriesController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v6 = [a3 text];
  BOOL v4 = [(CACVocabularyEntriesController *)self _isTextValidForVocabulary:v6];
  unsigned int v5 = [(CACVocabularyEntriesController *)self saveAction];
  [v5 setEnabled:v4];
}

- (void)textFieldDidChange:(id)a3
{
  id v6 = [a3 text];
  BOOL v4 = [(CACVocabularyEntriesController *)self _isTextValidForVocabulary:v6];
  unsigned int v5 = [(CACVocabularyEntriesController *)self saveAction];
  [v5 setEnabled:v4];
}

- (BOOL)_isTextValidForVocabulary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  BOOL v4 = +[NSCharacterSet whitespaceCharacterSet];
  unsigned int v5 = [v3 stringByTrimmingCharactersInSet:v4];

  LOBYTE(v3) = [v5 isEqualToString:&stru_4EAE0];
  return v3 ^ 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (UIAlertAction)saveAction
{
  return self->_saveAction;
}

- (void)setSaveAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end