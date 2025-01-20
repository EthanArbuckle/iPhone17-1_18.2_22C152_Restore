@interface KSEditUserWordController
+ (BOOL)wantsToDelegate:(id)a3;
+ (id)propertyTitles;
- (BOOL)_shouldSetDefaultFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (KSEditUserWordController)init;
- (KSEditUserWordController)initWithUserWord:(id)a3;
- (KSUserWordsManager)dictionaryController;
- (NSString)footerTitle;
- (NSString)shortcut;
- (NSString)target;
- (PSSpecifier)groupSpecifier;
- (UIAlertController)keyboardAlertController;
- (UITextField)shortcutTextField;
- (UITextField)targetTextField;
- (_KSTextReplacementEntry)nextEntry;
- (_KSTextReplacementEntry)oldEntry;
- (id)originalDelegateForTextField:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)validationErrorStringFromError:(int64_t)a3;
- (void)_dismiss;
- (void)_handleValidationWithError:(int64_t)a3;
- (void)_unpackTextReplacementError:(id)a3;
- (void)dealloc;
- (void)save;
- (void)setDictionaryController:(id)a3;
- (void)setFooterTitle:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setKeyboardAlertController:(id)a3;
- (void)setNextEntry:(id)a3;
- (void)setOldEntry:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setTarget:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation KSEditUserWordController

- (KSEditUserWordController)initWithUserWord:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)KSEditUserWordController;
  v4 = [(KSEditUserWordController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(KSEditUserWordController *)v4 setOldEntry:a3];
    if (!a3) {
      a3 = objc_alloc_init(MEMORY[0x263F50F60]);
    }
    [(KSEditUserWordController *)v5 setNextEntry:a3];
  }
  return v5;
}

- (KSEditUserWordController)init
{
  return [(KSEditUserWordController *)self initWithUserWord:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KSEditUserWordController;
  [(KSEditUserWordController *)&v3 dealloc];
}

- (NSString)target
{
  v2 = [(KSEditUserWordController *)self nextEntry];
  return (NSString *)[(_KSTextReplacementEntry *)v2 phrase];
}

- (void)setTarget:(id)a3
{
  v4 = [(KSEditUserWordController *)self nextEntry];
  [(_KSTextReplacementEntry *)v4 setPhrase:a3];
}

- (NSString)shortcut
{
  v2 = [(KSEditUserWordController *)self nextEntry];
  return (NSString *)[(_KSTextReplacementEntry *)v2 shortcut];
}

- (void)setShortcut:(id)a3
{
  v4 = [(KSEditUserWordController *)self nextEntry];
  [(_KSTextReplacementEntry *)v4 setShortcut:a3];
}

+ (id)propertyTitles
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"WORD", @"SHORTCUT", 0);
}

- (BOOL)_shouldSetDefaultFirstResponder
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)KSEditUserWordController;
  id v5 = [(KSEditUserWordController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "wantsToDelegate:", objc_msgSend((id)objc_msgSend(v5, "specifier"), "identifier"))&& (KSEditUserWordController *)objc_msgSend((id)objc_msgSend(v5, "textField"), "delegate") != self)
  {
    objc_setAssociatedObject((id)[v5 textField], "kTextFieldOriginalDelegate", (id)objc_msgSend((id)objc_msgSend(v5, "textField"), "delegate"), 0);
    objc_msgSend((id)objc_msgSend(v5, "textField"), "setDelegate:", self);
  }
  return v5;
}

+ (BOOL)wantsToDelegate:(id)a3
{
  v4 = (void *)[a1 propertyTitles];
  return [v4 containsObject:a3];
}

- (id)originalDelegateForTextField:(id)a3
{
  id result = objc_getAssociatedObject(a3, "kTextFieldOriginalDelegate");
  if (!result) {
    id result = (id)[a3 delegate];
  }
  if (result == self) {
    return 0;
  }
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)KSEditUserWordController;
  [(KSEditUserWordController *)&v4 viewDidLoad];
  objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_save));
  objc_msgSend((id)objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", 0);
  objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SHORTCUT_VIEW_TITLE", &stru_2703C6C20, @"Keyboard"));
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KSEditUserWordController;
  [(KSEditUserWordController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(KSEditUserWordController *)self targetTextField];
  if (![(NSString *)[(UITextField *)v4 text] length]) {
    goto LABEL_5;
  }
  if ([(KSEditUserWordController *)self _shouldSetDefaultFirstResponder]
    || ![(NSString *)[(UITextField *)[(KSEditUserWordController *)self shortcutTextField] text] length])
  {
    objc_super v4 = [(KSEditUserWordController *)self shortcutTextField];
LABEL_5:
    [(UITextField *)v4 becomeFirstResponder];
  }
  objc_msgSend((id)objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", -[NSString length](-[UITextField text](-[KSEditUserWordController shortcutTextField](self, "shortcutTextField"), "text"), "length") != 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KSEditUserWordController;
  [(KSEditUserWordController *)&v4 viewWillDisappear:a3];
  [(UIAlertController *)[(KSEditUserWordController *)self keyboardAlertController] dismissViewControllerAnimated:1 completion:0];
  [(KSEditUserWordController *)self setKeyboardAlertController:0];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    objc_super v5 = (void *)[MEMORY[0x263EFF980] array];
    if (![(NSString *)[(KSEditUserWordController *)self footerTitle] length]) {
      -[KSEditUserWordController setFooterTitle:](self, "setFooterTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"USER_WORD_EXPLANATORY_TEXT", &stru_2703C6C20, @"Keyboard"));
    }
    v6 = (void *)[MEMORY[0x263F5FC40] emptyGroupSpecifier];
    objc_super v7 = [(KSEditUserWordController *)self footerTitle];
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];
    [v5 addObject:v6];
    [(KSEditUserWordController *)self setGroupSpecifier:v6];
    v8 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"WORD", &stru_2703C6C20, @"Keyboard"), self, sel_setTarget_, sel_target, 0, 8, 0);
    uint64_t v9 = *MEMORY[0x263F60138];
    [v8 setProperty:@"WORD" forKey:*MEMORY[0x263F60138]];
    [v8 setKeyboardType:0 autoCaps:0 autoCorrection:1];
    [v5 addObject:v8];
    if ([(NSString *)[(KSEditUserWordController *)self target] isEqualToString:[(KSEditUserWordController *)self shortcut]])
    {
      [(KSEditUserWordController *)self setShortcut:&stru_2703C6C20];
    }
    v10 = objc_msgSend(MEMORY[0x263F5FCA8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SHORTCUT_FIELD_TITLE", &stru_2703C6C20, @"Keyboard"), self, sel_setShortcut_, sel_shortcut, 0, 8, 0);
    if ((-[NSString _containsIdeographicCharacters](-[KSEditUserWordController target](self, "target"), "_containsIdeographicCharacters") & 1) == 0)objc_msgSend(v10, "setPlaceholder:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OPTIONAL", &stru_2703C6C20, @"Keyboard")); {
    [v10 setProperty:@"SHORTCUT" forKey:v9];
    }
    [v10 setKeyboardType:0 autoCaps:0 autoCorrection:1];
    [v5 addObject:v10];
    id result = v5;
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (UITextField)targetTextField
{
  v2 = (void *)[(KSEditUserWordController *)self cachedCellForSpecifierID:@"WORD"];
  return (UITextField *)[v2 editableTextField];
}

- (UITextField)shortcutTextField
{
  v2 = (void *)[(KSEditUserWordController *)self cachedCellForSpecifierID:@"SHORTCUT"];
  return (UITextField *)[v2 editableTextField];
}

- (id)validationErrorStringFromError:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return 0;
  }
  objc_super v4 = off_2653A9670[a3 - 1];
  objc_super v5 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return (id)[v5 localizedStringForKey:v4 value:&stru_2703C6C20 table:@"Keyboard"];
}

- (void)_dismiss
{
  v2 = (void *)[(KSEditUserWordController *)self navigationController];
  [v2 popViewControllerAnimated:1];
}

- (void)_unpackTextReplacementError:(id)a3
{
  if ([a3 code] == 11)
  {
    objc_super v5 = (void *)[a3 userInfo];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x263F50F78]), "firstObject");
    objc_super v7 = (void *)[a3 userInfo];
    id v8 = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x263F50F68]), "firstObject");
    if (v6)
    {
      id v8 = (id)v6;
    }
    else if (!v8)
    {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v9 = (void *)[a3 domain];
  if ([v9 isEqual:*MEMORY[0x263F50F70]])
  {
    id v8 = a3;
LABEL_8:
    uint64_t v10 = [v8 code];
    goto LABEL_9;
  }
  uint64_t v10 = -2;
LABEL_9:
  [(KSEditUserWordController *)self _handleValidationWithError:v10];
}

- (void)_handleValidationWithError:(int64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = -[KSEditUserWordController validationErrorStringFromError:](self, "validationErrorStringFromError:");
    if ([v4 length])
    {
      objc_super v5 = (void *)[MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:v4 preferredStyle:1];
      uint64_t v6 = (void *)MEMORY[0x263F1C3F0];
      uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"USER_WORD_BUTTON_OK", &stru_2703C6C20, @"Keyboard");
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __55__KSEditUserWordController__handleValidationWithError___block_invoke;
      v9[3] = &unk_2653A9328;
      v9[4] = v5;
      objc_msgSend(v5, "addAction:", objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, v9));
      [(KSEditUserWordController *)self setKeyboardAlertController:v5];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "_viewControllerForFullScreenPresentationFromView:", -[KSEditUserWordController view](self, "view")), "presentViewController:animated:completion:", -[KSEditUserWordController keyboardAlertController](self, "keyboardAlertController"), 1, 0);
    }
  }
  else
  {
    TIStatisticGetKey();
    [(NSString *)[(UITextField *)[(KSEditUserWordController *)self targetTextField] text] length];
    TIStatisticDistributionPushValue();
    TIStatisticGetKey();
    [(NSString *)[(UITextField *)[(KSEditUserWordController *)self shortcutTextField] text] length];
    TIStatisticDistributionPushValue();
    id v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = @"shortcut";
    v11[0] = [(KSEditUserWordController *)self shortcut];
    objc_msgSend(v8, "postNotificationName:object:userInfo:", @"EditUserWordShortcutDidUpdateNotification", self, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
    [(KSEditUserWordController *)self _dismiss];
  }
}

uint64_t __55__KSEditUserWordController__handleValidationWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)save
{
  v8[1] = *MEMORY[0x263EF8340];
  [(KSEditUserWordController *)self setTarget:[(UITextField *)[(KSEditUserWordController *)self targetTextField] text]];
  [(KSEditUserWordController *)self setShortcut:[(UITextField *)[(KSEditUserWordController *)self shortcutTextField] text]];
  if ([(KSEditUserWordController *)self oldEntry]) {
    [(_KSTextReplacementEntry *)[(KSEditUserWordController *)self nextEntry] setPriorValue:[(KSEditUserWordController *)self oldEntry]];
  }
  uint64_t v3 = [(KSEditUserWordController *)self dictionaryController];
  v8[0] = [(KSEditUserWordController *)self nextEntry];
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  if ([(KSEditUserWordController *)self oldEntry])
  {
    uint64_t v7 = [(KSEditUserWordController *)self oldEntry];
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__KSEditUserWordController_save__block_invoke;
  v6[3] = &unk_2653A9650;
  v6[4] = self;
  [(KSUserWordsManager *)v3 addEntries:v4 removeEntries:v5 withCompletionHandler:v6];
}

uint64_t __32__KSEditUserWordController_save__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _unpackTextReplacementError:a2];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = -[KSEditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ([(KSEditUserWordController *)self targetTextField] == a3)
  {
    v11 = objc_msgSend((id)objc_msgSend(a3, "text"), "stringByReplacingCharactersInRange:withString:", location, length, a5);
    int v12 = [v11 _containsIdeographicCharacters];
    v13 = objc_msgSend(-[KSEditUserWordController specifiers](self, "specifiers"), "objectAtIndex:", 2);
    if (v12) {
      v14 = @" ";
    }
    else {
      v14 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OPTIONAL", &stru_2703C6C20, @"Keyboard");
    }
    [v13 setPlaceholder:v14];
    uint64_t v15 = [v11 length];
    v16 = objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
    if (v15)
    {
      [v16 setEnabled:1];
      if (!v12 || [(NSString *)[(KSEditUserWordController *)self shortcut] length]) {
        goto LABEL_10;
      }
      v16 = objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
    }
    [v16 setEnabled:0];
LABEL_10:
    [(KSEditUserWordController *)self reloadSpecifier:v13];
  }
  if ([(KSEditUserWordController *)self shortcutTextField] != a3) {
    goto LABEL_17;
  }
  v17 = objc_msgSend((id)objc_msgSend(a3, "text"), "stringByReplacingCharactersInRange:withString:", location, length, a5);
  NSUInteger v18 = [(NSString *)[(KSEditUserWordController *)self target] length];
  v19 = objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
  if (!v18) {
    goto LABEL_16;
  }
  [v19 setEnabled:1];
  if (-[NSString _containsIdeographicCharacters](-[KSEditUserWordController target](self, "target"), "_containsIdeographicCharacters")&& ![v17 length])
  {
    v19 = objc_msgSend((id)-[KSEditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
LABEL_16:
    [v19 setEnabled:0];
  }
LABEL_17:
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  return objc_msgSend(v10, "textField:shouldChangeCharactersInRange:replacementString:", a3, location, length, a5);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = -[KSEditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  return [v4 textFieldShouldBeginEditing:a3];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = -[KSEditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if (objc_opt_respondsToSelector())
  {
    [v4 textFieldDidBeginEditing:a3];
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = -[KSEditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  return [v4 textFieldShouldEndEditing:a3];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = -[KSEditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if (objc_opt_respondsToSelector())
  {
    [v4 textFieldDidEndEditing:a3];
  }
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = -[KSEditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  return [v4 textFieldShouldClear:a3];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = -[KSEditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  return [v4 textFieldShouldReturn:a3];
}

- (KSUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (void)setDictionaryController:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (void)setFooterTitle:(id)a3
{
}

- (UIAlertController)keyboardAlertController
{
  return self->_keyboardAlertController;
}

- (void)setKeyboardAlertController:(id)a3
{
}

- (_KSTextReplacementEntry)oldEntry
{
  return self->_oldEntry;
}

- (void)setOldEntry:(id)a3
{
}

- (_KSTextReplacementEntry)nextEntry
{
  return self->_nextEntry;
}

- (void)setNextEntry:(id)a3
{
}

@end