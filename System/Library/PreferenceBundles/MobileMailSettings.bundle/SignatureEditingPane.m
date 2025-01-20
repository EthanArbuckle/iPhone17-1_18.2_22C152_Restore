@interface SignatureEditingPane
+ (BOOL)hasMultipleMailAccounts;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (PSListController)parentListController;
- (id)_accountSignatureWithSpecifier:(id)a3;
- (id)_signatureWithSpecifier:(id)a3;
- (id)accountSignaturesSpecifiers;
- (id)defaultSignatureSpecifiers;
- (id)specifiers;
- (void)_setAccountSignature:(id)a3 withSpecifier:(id)a4;
- (void)_setSignature:(id)a3 withSpecifier:(id)a4;
- (void)commitChangesAndDismissKeyboard:(BOOL)a3;
- (void)setParentListController:(id)a3;
- (void)suspend;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SignatureEditingPane

+ (BOOL)hasMultipleMailAccounts
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = +[MailAccount mailAccounts];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isActive])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v7 = 1;
            if (v4) {
              goto LABEL_13;
            }
            uint64_t v4 = 1;
          }
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (id)defaultSignatureSpecifiers
{
  defaultSignatureSpecifiers = self->_defaultSignatureSpecifiers;
  if (!defaultSignatureSpecifiers)
  {
    uint64_t v4 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    uint64_t v5 = +[PSSpecifier emptyGroupSpecifier];
    [(NSArray *)v4 addObject:v5];

    v6 = +[PSSpecifier preferenceSpecifierNamed:&stru_39200 target:self set:"_setSignature:withSpecifier:" get:"_signatureWithSpecifier:" detail:0 cell:14 edit:0];
    LODWORD(v7) = 22.0;
    v8 = +[NSNumber numberWithFloat:v7];
    [v6 setProperty:v8 forKey:PSTextViewBottomMarginKey];

    [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [(NSArray *)v4 addObject:v6];
    long long v9 = self->_defaultSignatureSpecifiers;
    self->_defaultSignatureSpecifiers = v4;

    defaultSignatureSpecifiers = self->_defaultSignatureSpecifiers;
  }

  return defaultSignatureSpecifiers;
}

- (id)accountSignaturesSpecifiers
{
  accountSignaturesSpecifiers = self->_accountSignaturesSpecifiers;
  if (!accountSignaturesSpecifiers)
  {
    v18 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = +[MailAccount mailAccounts];
    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v20;
      uint64_t v16 = PSCellClassKey;
      uint64_t v17 = PSTextViewBottomMarginKey;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v8 isActive])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!self->_singleAccountActive)
              {
                long long v9 = [v8 displayName];
                long long v10 = +[PSSpecifier groupSpecifierWithName:v9];
                [(NSArray *)v18 addObject:v10];
              }
              long long v11 = +[PSSpecifier preferenceSpecifierNamed:&stru_39200 target:self set:"_setAccountSignature:withSpecifier:" get:"_accountSignatureWithSpecifier:" detail:0 cell:14 edit:0];
              LODWORD(v12) = 22.0;
              v13 = +[NSNumber numberWithFloat:v12];
              [v11 setProperty:v13 forKey:v17];

              [v11 setProperty:objc_opt_class() forKey:v16];
              [v11 setProperty:v8 forKey:AccountPropertyKey];
              [(NSArray *)v18 addObject:v11];
            }
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }

    v14 = self->_accountSignaturesSpecifiers;
    self->_accountSignaturesSpecifiers = v18;

    accountSignaturesSpecifiers = self->_accountSignaturesSpecifiers;
  }

  return accountSignaturesSpecifiers;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v21 = objc_alloc_init((Class)NSMutableArray);
    id v5 = +[MFSignatures sharedInstance];
    self->_useAccountSignatures = [v5 useAccountSignatures];

    long long v20 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    double v7 = [v6 localizedStringForKey:@"SINGLE_SIGNATURE_SELECTOR" value:&stru_39200 table:@"Preferences"];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

    long long v9 = +[NSNumber numberWithBool:0];
    uint64_t v10 = PSValueKey;
    [v8 setProperty:v9 forKey:PSValueKey];

    long long v11 = +[NSBundle bundleForClass:objc_opt_class()];
    double v12 = [v11 localizedStringForKey:@"MULTIPLE_SIGNATURES_SELECTOR" value:&stru_39200 table:@"Preferences"];
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v14 = +[NSNumber numberWithBool:1];
    [v13 setProperty:v14 forKey:v10];

    v15 = +[NSNumber numberWithBool:1];
    [v20 setProperty:v15 forKey:PSIsRadioGroupKey];

    [v20 setProperty:SignatureRadioGroupID forKey:PSIDKey];
    if (self->_useAccountSignatures) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = v8;
    }
    [v20 setProperty:v16 forKey:PSRadioGroupCheckedSpecifierKey];
    if ([(id)objc_opt_class() hasMultipleMailAccounts])
    {
      [v21 addObject:v20];
      [v21 addObject:v8];
      [v21 addObject:v13];
    }
    else
    {
      self->_singleAccountActive = 1;
    }
    if (self->_useAccountSignatures) {
      [(SignatureEditingPane *)self accountSignaturesSpecifiers];
    }
    else {
    uint64_t v17 = [(SignatureEditingPane *)self defaultSignatureSpecifiers];
    }
    [v21 addObjectsFromArray:v17];

    v18 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v21;

    uint64_t v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)commitChangesAndDismissKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SignatureEditingPane *)self table];
  uint64_t v6 = [v5 window];
  id v11 = [v6 firstResponder];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v3)
    {
      [v11 resignFirstResponder];
    }
    else
    {
      id v7 = v11;
      v8 = [v7 delegate];
      [v8 textContentViewDidEndEditing:v7];
    }
  }
  long long v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"SignatureEditingPaneSignatureDidChange" object:self];

  uint64_t v10 = [(SignatureEditingPane *)self parentListController];
  [v10 reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
}

- (void)suspend
{
  v3.receiver = self;
  v3.super_class = (Class)SignatureEditingPane;
  [(SignatureEditingPane *)&v3 suspend];
  [(SignatureEditingPane *)self commitChangesAndDismissKeyboard:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SignatureEditingPane;
  [(SignatureEditingPane *)&v5 viewDidAppear:a3];
  uint64_t v4 = [(SignatureEditingPane *)self parentController];
  [(SignatureEditingPane *)self setParentListController:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SignatureEditingPane;
  [(SignatureEditingPane *)&v4 viewWillDisappear:a3];
  [(SignatureEditingPane *)self commitChangesAndDismissKeyboard:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SignatureEditingPane;
  [(SignatureEditingPane *)&v4 viewDidDisappear:a3];
  [(SignatureEditingPane *)self commitChangesAndDismissKeyboard:0];
  [(SignatureEditingPane *)self setParentListController:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SignatureEditingPane;
  [(SignatureEditingPane *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [v7 section];
  long long v9 = [(SignatureEditingPane *)self specifierForID:SignatureRadioGroupID];
  uint64_t v10 = [(SignatureEditingPane *)self indexPathForIndex:[(SignatureEditingPane *)self indexOfSpecifier:v9]];
  id v11 = [v10 section];

  if (v8 == v11)
  {
    double v12 = objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "objectAtIndex:", -[SignatureEditingPane indexForIndexPath:](self, "indexForIndexPath:", v7));
    v13 = [v12 propertyForKey:PSValueKey];
    id v14 = [v13 BOOLValue];

    if (self->_useAccountSignatures != v14)
    {
      self->_useAccountSignatures = (char)v14;
      v15 = +[MFSignatures sharedInstance];
      [v15 setUseAccountSignatures:v14];

      [(SignatureEditingPane *)self commitChangesAndDismissKeyboard:1];
      if (v14)
      {
        uint64_t v16 = [(SignatureEditingPane *)self defaultSignatureSpecifiers];
        [(SignatureEditingPane *)self accountSignaturesSpecifiers];
      }
      else
      {
        uint64_t v16 = [(SignatureEditingPane *)self accountSignaturesSpecifiers];
        [(SignatureEditingPane *)self defaultSignatureSpecifiers];
      uint64_t v17 = };
      [(SignatureEditingPane *)self replaceContiguousSpecifiers:v16 withSpecifiers:v17 animated:1];
    }
  }
}

- (id)_signatureWithSpecifier:(id)a3
{
  objc_super v3 = +[MFSignatures sharedInstance];
  objc_super v4 = [v3 signature];

  return v4;
}

- (void)_setSignature:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  objc_super v4 = +[MFSignatures sharedInstance];
  [v4 setSignature:v5];
}

- (id)_accountSignatureWithSpecifier:(id)a3
{
  objc_super v3 = [a3 propertyForKey:AccountPropertyKey];
  objc_super v4 = [v3 customSignature];
  if (!v4)
  {
    id v5 = +[MFSignatures sharedInstance];
    objc_super v4 = [v5 signature];
  }

  return v4;
}

- (void)_setAccountSignature:(id)a3 withSpecifier:(id)a4
{
  id v7 = a3;
  id v5 = [a4 propertyForKey:AccountPropertyKey];
  id v6 = +[MFSignatures sharedInstance];
  [v6 setSignature:v7 forAccount:v5];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("paste:" == a3)
  {
    id v7 = +[UIPasteboard generalPasteboard];
    LODWORD(self) = [v7 hasImages] ^ 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SignatureEditingPane;
    LOBYTE(self) = [(SignatureEditingPane *)&v9 canPerformAction:a3 withSender:v6];
  }

  return (char)self;
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListController);

  return (PSListController *)WeakRetained;
}

- (void)setParentListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentListController);
  objc_storeStrong((id *)&self->_accountSignaturesSpecifiers, 0);

  objc_storeStrong((id *)&self->_defaultSignatureSpecifiers, 0);
}

@end