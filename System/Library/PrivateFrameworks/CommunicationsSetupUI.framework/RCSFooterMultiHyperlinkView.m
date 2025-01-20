@interface RCSFooterMultiHyperlinkView
- (RCSFooterMultiHyperlinkView)initWithSpecifier:(id)a3;
- (void)_launchCellularSettings:(id)a3;
- (void)_launchLearnMoreURL:(id)a3;
@end

@implementation RCSFooterMultiHyperlinkView

- (RCSFooterMultiHyperlinkView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[RCSFooterMultiHyperlinkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = MessagesSettingsLocalizedString(@"RCS_FOOTER_LEARN_MORE");
    v7 = MessagesSettingsLocalizedString(@"RCS_FOOTER_TEXT");
    v8 = [NSString stringWithFormat:@"\n%@", v6];
    v9 = [v7 stringByAppendingString:v8];

    v10 = [v4 propertyForKey:@"RCSFooterMultiHyperlinkViewSIMLabelKey"];
    if (v10)
    {
      v11 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Cellular"];
      v12 = MessagesSettingsLocalizedString(@"CELLULAR_DATA_SETTINGS");
      v13 = NSString;
      v14 = MessagesSettingsLocalizedString(@"RCS_FOOTER_ACTIVATION_FAILURE_TEXT");
      v15 = objc_msgSend(v13, "stringWithFormat:", v14, v10, v12);

      v16 = [NSString stringWithFormat:@"%@\n\n%@", v15, v9];

      uint64_t v17 = [v16 rangeOfString:v12];
      uint64_t v24 = v18;

      BOOL v19 = v11 != 0;
      v9 = v16;
    }
    else
    {
      BOOL v19 = 0;
      uint64_t v24 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v20 = [v9 rangeOfString:v6];
    uint64_t v22 = v21;
    [v4 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
    if (v19 && v17 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v4, "addFooterHyperlinkWithRange:target:action:", v17, v24, v5, sel__launchCellularSettings_);
    }
    objc_msgSend(v4, "addFooterHyperlinkWithRange:target:action:", v20, v22, v5, sel__launchLearnMoreURL_);
    [(PSFooterMultiHyperlinkView *)v5 refreshContentsWithSpecifier:v4];
  }
  return v5;
}

- (void)_launchCellularSettings:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Cellular"];
  [v4 openSensitiveURL:v3 withOptions:0 error:0];
}

- (void)_launchLearnMoreURL:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = NSURL;
  id v4 = MessagesSettingsLocalizedString(@"RCS_LEARN_MORE_URL");
  v5 = [v3 URLWithString:v4];
  [v6 openURL:v5 withOptions:0 error:0];
}

@end