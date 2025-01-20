@interface ICDocCamRenamePrompt
- (BOOL)isTitleValid:(id)a3 error:(id *)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (ICDocCamRenamePrompt)initWithExistingTitle:(id)a3;
- (ICDocCamRenamePrompt)strongSelf;
- (NSString)existingTitle;
- (UIAlertAction)saveAction;
- (id)stringByScrubbingStringForCollectionName:(id)a3;
- (void)enableAction:(id)a3 withString:(id)a4;
- (void)setExistingTitle:(id)a3;
- (void)setSaveAction:(id)a3;
- (void)setStrongSelf:(id)a3;
- (void)showFromViewController:(id)a3 completion:(id)a4;
- (void)showSingleButtonAlertFromViewController:(id)a3 withTitle:(id)a4 message:(id)a5;
- (void)textFieldChanged:(id)a3;
@end

@implementation ICDocCamRenamePrompt

- (ICDocCamRenamePrompt)initWithExistingTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamRenamePrompt;
  v6 = [(ICDocCamRenamePrompt *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_existingTitle, a3);
  }

  return v7;
}

- (void)showFromViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ICDocCamRenamePrompt *)self setStrongSelf:self];
  v8 = +[DCLocalization localizedStringForKey:@"Rename" value:@"Rename" table:@"Localizable"];
  objc_super v9 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v8 message:0 preferredStyle:1];
  v10 = [MEMORY[0x263F1C6B0] systemImageNamed:@"character.cursor.ibeam"];
  [v9 setImage:v10];

  objc_initWeak(location, self);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke;
  v34[3] = &unk_2642AA818;
  objc_copyWeak(&v36, location);
  id v11 = v6;
  id v35 = v11;
  [v9 addTextFieldWithConfigurationHandler:v34];
  v12 = (void *)MEMORY[0x263F1C3F0];
  v13 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_2;
  v31[3] = &unk_2642AA840;
  id v14 = v7;
  id v32 = v14;
  objc_copyWeak(&v33, location);
  v15 = [v12 actionWithTitle:v13 style:1 handler:v31];
  [v9 addAction:v15];

  v16 = (void *)MEMORY[0x263F1C3F0];
  v17 = +[DCLocalization localizedStringForKey:@"Save" value:@"Save" table:@"Localizable"];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_3;
  v26[3] = &unk_2642AA868;
  id v18 = v9;
  id v27 = v18;
  objc_copyWeak(&v30, location);
  id v19 = v11;
  id v28 = v19;
  id v20 = v14;
  id v29 = v20;
  v21 = [v16 actionWithTitle:v17 style:0 handler:v26];

  [(ICDocCamRenamePrompt *)self setSaveAction:v21];
  v22 = [(ICDocCamRenamePrompt *)self existingTitle];
  [(ICDocCamRenamePrompt *)self enableAction:v21 withString:v22];

  [v18 addAction:v21];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_4;
  v24[3] = &unk_2642A9250;
  id v23 = v18;
  id v25 = v23;
  [v19 presentViewController:v23 animated:1 completion:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak(location);
}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained existingTitle];
  [v4 setText:v6];

  id v7 = +[DCLocalization localizedStringForKey:@"Name" value:@"Name" table:@"Localizable"];
  [v4 setPlaceholder:v7];

  v8 = [*(id *)(a1 + 32) view];
  [v4 setAutocapitalizationType:DCLocalizedCapitalizationStyleForView(v8)];

  id v9 = objc_loadWeakRetained(v3);
  [v4 addTarget:v9 action:sel_textFieldChanged_ forControlEvents:0x20000];

  [v4 setClearButtonMode:1];
  id v10 = objc_loadWeakRetained(v3);
  [v4 setDelegate:v10];
}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setStrongSelf:0];
}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  v3 = [v2 firstObject];

  id v4 = [v3 text];
  id v5 = (void *)[v4 copy];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v17 = 0;
  char v7 = [WeakRetained isTitleValid:v5 error:&v17];
  id v8 = v17;

  if ((v7 & 1) == 0)
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v10 = *(void *)(a1 + 40);
    [v8 userInfo];
    id v11 = v16 = v3;
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08320]];
    v13 = [v8 userInfo];
    id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F08348]];
    [v9 showSingleButtonAlertFromViewController:v10 withTitle:v12 message:v14];

    v3 = v16;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v15 = objc_loadWeakRetained((id *)(a1 + 56));
  [v15 setStrongSelf:0];
}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) textFields];
  id v4 = [v1 firstObject];

  v2 = [v4 text];
  uint64_t v3 = [v2 length];

  if (v3) {
    [v4 selectAll:0];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  uint64_t v10 = [a3 text];
  id v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  if ([v11 length]) {
    BOOL v12 = [(ICDocCamRenamePrompt *)self isTitleValid:v11 error:0];
  }
  else {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)isTitleValid:(id)a3 error:(id *)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = (__CFString *)a3;
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &stru_26C7D5180;
  }
  char v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v8 = [(__CFString *)v6 stringByTrimmingCharactersInSet:v7];

  if ([v8 length])
  {
    if ((unint64_t)[v8 length] < 0x81)
    {
      LOBYTE(a4) = 1;
      goto LABEL_12;
    }
    if (a4)
    {
      id v9 = +[DCLocalization localizedStringForKey:@"Please choose a different name." value:@"Please choose a different name." table:@"Localizable"];
      uint64_t v10 = @"Collection names can’t be longer than 128 characters.";
LABEL_10:
      v13 = +[DCLocalization localizedStringForKey:v10 value:v10 table:@"Localizable"];
      uint64_t v14 = *MEMORY[0x263F08348];
      v17[0] = *MEMORY[0x263F08320];
      v17[1] = v14;
      v18[0] = v9;
      v18[1] = v13;
      id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:1024 userInfo:v15];

      LOBYTE(a4) = 0;
    }
  }
  else if (a4)
  {
    id v11 = NSString;
    BOOL v12 = +[DCLocalization localizedStringForKey:@"Please choose a different name." value:@"Please choose a different name." table:@"Localizable"];
    id v9 = objc_msgSend(v11, "stringWithFormat:", v12, v8);

    uint64_t v10 = @"Scanned document collection names can’t be blank.";
    goto LABEL_10;
  }
LABEL_12:

  return (char)a4;
}

- (void)showSingleButtonAlertFromViewController:(id)a3 withTitle:(id)a4 message:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  id v8 = a3;
  if ((unint64_t)[v18 length] < 0xC9)
  {
    id v12 = v18;
  }
  else
  {
    id v9 = NSString;
    uint64_t v10 = [v18 substringToIndex:200];
    uint64_t v11 = [v9 stringWithFormat:@"%@…", v10];

    id v12 = (id)v11;
  }
  id v19 = v12;
  v13 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v12 message:v7 preferredStyle:1];
  uint64_t v14 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v13 setImage:v14];

  id v15 = (void *)MEMORY[0x263F1C3F0];
  v16 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  id v17 = [v15 actionWithTitle:v16 style:0 handler:0];
  [v13 addAction:v17];

  [v8 presentViewController:v13 animated:1 completion:0];
}

- (id)stringByScrubbingStringForCollectionName:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v5 = [v3 rangeOfCharacterFromSet:v4];

  id v6 = v3;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [MEMORY[0x263F08708] newlineCharacterSet];
    id v8 = [v3 componentsSeparatedByCharactersInSet:v7];

    id v6 = [v8 componentsJoinedByString:@" "];
  }
  if ((unint64_t)[v6 length] >= 0x81)
  {
    uint64_t v9 = objc_msgSend(v6, "dc_substringToIndex:", 128);

    id v6 = (void *)v9;
  }

  return v6;
}

- (void)textFieldChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  DCDynamicCast(v5, (uint64_t)v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v12 text];
  if (v12)
  {
    id v7 = [(ICDocCamRenamePrompt *)self saveAction];
    [(ICDocCamRenamePrompt *)self enableAction:v7 withString:v6];
  }
  id v8 = [(ICDocCamRenamePrompt *)self stringByScrubbingStringForCollectionName:v6];
  if (([v6 isEqualToString:v8] & 1) == 0)
  {
    uint64_t v9 = [v12 selectionRange];
    uint64_t v11 = v10;
    [v12 setText:v8];
    if (v9 + v11 < (unint64_t)[v8 length]) {
      objc_msgSend(v12, "setSelectionRange:", v9, v11);
    }
  }
}

- (void)enableAction:(id)a3 withString:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F08708];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  id v15 = [v6 stringByTrimmingCharactersInSet:v8];

  objc_msgSend(v7, "setEnabled:", objc_msgSend(v15, "length") != 0);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v7 safeValueForKey:@"_representer"];
  uint64_t v11 = DCDynamicCast(v9, v10);

  LOBYTE(v10) = [v7 isEnabled];
  if (v10)
  {
    uint64_t v12 = *MEMORY[0x263F1CF20];
    uint64_t v13 = [v11 accessibilityTraits] & ~v12;
  }
  else
  {
    uint64_t v14 = [v11 accessibilityTraits];
    uint64_t v13 = *MEMORY[0x263F1CF20] | v14;
  }
  [v11 setAccessibilityTraits:v13];
}

- (NSString)existingTitle
{
  return self->_existingTitle;
}

- (void)setExistingTitle:(id)a3
{
}

- (UIAlertAction)saveAction
{
  return self->_saveAction;
}

- (void)setSaveAction:(id)a3
{
}

- (ICDocCamRenamePrompt)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_saveAction, 0);

  objc_storeStrong((id *)&self->_existingTitle, 0);
}

@end