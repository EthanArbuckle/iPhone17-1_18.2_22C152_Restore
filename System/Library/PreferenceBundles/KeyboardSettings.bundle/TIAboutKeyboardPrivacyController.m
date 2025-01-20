@interface TIAboutKeyboardPrivacyController
- (BOOL)asHeader;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (PSListController)listController;
- (PSSpecifier)specifier;
- (TIAboutKeyboardPrivacyController)initWithGroupSpecifier:(id)a3 asHeader:(BOOL)a4 inListController:(id)a5;
- (void)aboutDonePressed;
- (void)addPrivacyLinkViewIfNecessaryToHeaderView:(id)a3 forSection:(int64_t)a4;
- (void)dealloc;
- (void)setAsHeader:(BOOL)a3;
- (void)setListController:(id)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation TIAboutKeyboardPrivacyController

- (TIAboutKeyboardPrivacyController)initWithGroupSpecifier:(id)a3 asHeader:(BOOL)a4 inListController:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TIAboutKeyboardPrivacyController;
  v8 = [(TIAboutKeyboardPrivacyController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_listController = (PSListController *)a5;
    v8->_asHeader = a4;
    [(TIAboutKeyboardPrivacyController *)v8 setSpecifier:a3];
  }
  return v9;
}

- (void)dealloc
{
  [(UITextView *)self->_infoTextView removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)TIAboutKeyboardPrivacyController;
  [(TIAboutKeyboardPrivacyController *)&v3 dealloc];
}

- (void)setSpecifier:(id)a3
{
  self->_specifier = (PSSpecifier *)a3;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"APP_KEYBOARDS_INFO", &stru_26E29DC78, @"Keyboard");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"APP_KEYBOARDS_INFO_LINK", &stru_26E29DC78, @"Keyboard");
  BOOL v7 = [(TIAboutKeyboardPrivacyController *)self asHeader];
  v8 = (uint64_t *)MEMORY[0x263F60120];
  if (!v7) {
    v8 = (uint64_t *)MEMORY[0x263F600F8];
  }
  uint64_t v9 = *v8;
  v10 = [(TIAboutKeyboardPrivacyController *)self specifier];
  uint64_t v11 = [NSString stringWithFormat:@"%@ %@", v5, v6];

  [(PSSpecifier *)v10 setProperty:v11 forKey:v9];
}

- (void)addPrivacyLinkViewIfNecessaryToHeaderView:(id)a3 forSection:(int64_t)a4
{
  if ([(TIAboutKeyboardPrivacyController *)self specifier])
  {
    BOOL v7 = (void *)[(PSListController *)[(TIAboutKeyboardPrivacyController *)self listController] indexPathForSpecifier:[(TIAboutKeyboardPrivacyController *)self specifier]];
    uint64_t v8 = [(TIAboutKeyboardPrivacyController *)self asHeader]
       ? [a3 detailTextLabel]
       : [a3 textLabel];
    uint64_t v9 = (void *)v8;
    if ([v7 section] == a4)
    {
      uint64_t v10 = [(UITextView *)self->_infoTextView superview];
      if (v10 != [a3 contentView])
      {
        [a3 layoutIfNeeded];
        [v9 setHidden:1];
        [(UITextView *)self->_infoTextView removeFromSuperview];

        id v11 = objc_alloc(MEMORY[0x263F1CAC8]);
        [v9 frame];
        self->_infoTextView = (UITextView *)objc_msgSend(v11, "initWithFrame:");
        -[UITextView setBackgroundColor:](self->_infoTextView, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
        [(UITextView *)self->_infoTextView setShowsVerticalScrollIndicator:0];
        [(UITextView *)self->_infoTextView setEditable:0];
        [(UITextView *)self->_infoTextView setSelectable:1];
        [(UITextView *)self->_infoTextView setScrollEnabled:0];
        -[UITextView setTextContainerInset:](self->_infoTextView, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
        [(NSTextContainer *)[(UITextView *)self->_infoTextView textContainer] setLineFragmentPadding:0.0];
        [(UITextView *)self->_infoTextView setContentInsetAdjustmentBehavior:3];
        objc_msgSend((id)objc_msgSend(a3, "contentView"), "addSubview:", self->_infoTextView);
        v12 = objc_msgSend((id)objc_msgSend(v9, "attributedText"), "mutableCopy");
        v13 = (void *)[v9 text];
        uint64_t v14 = objc_msgSend(v13, "rangeOfString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"APP_KEYBOARDS_INFO_LINK", &stru_26E29DC78, @"Keyboard"));
        uint64_t v16 = v15;
        objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F1C240], objc_msgSend(MEMORY[0x263F1C550], "systemBlueColor"), v14, v15);
        objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F1C258], objc_msgSend(NSURL, "URLWithString:", &stru_26E29DC78), v14, v16);
        objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F1C2D8], MEMORY[0x263EFFA80], v14, v16);
        objc_msgSend(v12, "removeAttribute:range:", *MEMORY[0x263F1C268], 0, objc_msgSend(v12, "length"));
        [(UITextView *)self->_infoTextView setAttributedText:v12];
        [(UITextView *)self->_infoTextView setDelegate:self];
        [v9 frame];
        double v18 = v17;
        double v20 = v19;
        -[UITextView sizeThatFits:](self->_infoTextView, "sizeThatFits:", v21, 1.79769313e308);
        double v23 = v22;
        double v25 = v24;
        if ([(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection] == 1)
        {
          objc_msgSend((id)objc_msgSend(a3, "textLabel"), "frame");
          double MaxX = CGRectGetMaxX(v30);
          [(UITextView *)self->_infoTextView frame];
          double v18 = MaxX - v27;
        }
        infoTextView = self->_infoTextView;
        -[UITextView setFrame:](infoTextView, "setFrame:", v18, v20, v23, v25);
      }
    }
  }
}

- (void)aboutDonePressed
{
  v2 = [(TIAboutKeyboardPrivacyController *)self listController];

  [(PSListController *)v2 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  BOOL v7 = [(TIAboutKeyboardPrivacyController *)self specifier];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F1CB68]);
    objc_msgSend(v8, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ABOUT_APP_KEYBOARDS_TITLE", &stru_26E29DC78, @"Keyboard"));
    uint64_t v9 = (void *)[v8 navigationItem];
    objc_msgSend(v9, "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_aboutDonePressed));
    id v10 = objc_alloc(MEMORY[0x263F1CAC8]);
    id v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    objc_msgSend(v11, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ABOUT_APP_KEYBOARDS_INFO_TEXT", &stru_26E29DC78, @"Keyboard"));
    objc_msgSend(v11, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "preferredFontForTextStyle:", *MEMORY[0x263F1D260]));
    [v11 setEditable:0];
    [v11 setContentInsetAdjustmentBehavior:3];
    [v8 setView:v11];
    id v12 = (id)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v8];
    [v12 setModalPresentationStyle:2];
    [(PSListController *)[(TIAboutKeyboardPrivacyController *)self listController] presentViewController:v12 animated:1 completion:0];
  }
  return v7 == 0;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (PSListController)listController
{
  return self->_listController;
}

- (void)setListController:(id)a3
{
  self->_listController = (PSListController *)a3;
}

- (BOOL)asHeader
{
  return self->_asHeader;
}

- (void)setAsHeader:(BOOL)a3
{
  self->_asHeader = a3;
}

@end