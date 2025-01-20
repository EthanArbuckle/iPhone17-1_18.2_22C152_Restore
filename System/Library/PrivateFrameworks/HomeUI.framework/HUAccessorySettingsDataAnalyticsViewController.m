@interface HUAccessorySettingsDataAnalyticsViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (UIView)linkFooterView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (void)dismissPrivacyController;
@end

@implementation HUAccessorySettingsDataAnalyticsViewController

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self itemManager];
  v8 = [v7 footerTitleForSection:a4];

  if (v8)
  {
    v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"footerReuseIdentifier"];

    if (!v9) {
      v9 = [[HUItemTableSectionHeaderFooterView alloc] initWithReuseIdentifier:@"footerReuseIdentifier"];
    }
    [(HUItemTableSectionHeaderFooterView *)v9 setType:1];
    v10 = [(HUItemTableViewController *)self itemManager];
    v11 = [v10 displayedSectionIdentifierForSectionIndex:a4];

    if ([v11 isEqualToString:@"root.general.analytics.shareSpeakerAnalytics"])
    {
      v12 = HFLocalizedString();
      char v13 = [MEMORY[0x1E4F69758] supportsAnalytics];
      v14 = (void *)MEMORY[0x1E4F28B18];
      if (v13)
      {
        v15 = HFLocalizedString();
        v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_applePrivacyURL");
        objc_msgSend(v14, "hf_attributedString:withAppendedLinkString:linkURL:", v15, v12, v16);
      }
      else
      {
        v15 = HFLocalizedString();
        v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_applePrivacyURL");
        objc_msgSend(v14, "hf_attributedLinkStringForString:linkString:linkURL:", v15, v12, v16);
      v22 = };
      [(HUItemTableSectionHeaderFooterView *)v9 setMessage:v22];
    }
    else if ([v11 isEqualToString:@"root.general.analytics.shareSiriAnalytics"])
    {
      v17 = (void *)MEMORY[0x1E4F28B18];
      v18 = HFLocalizedString();
      v19 = HFLocalizedString();
      v20 = [MEMORY[0x1E4F696F8] aboutImproveSiriAndDictationURL];
      v21 = objc_msgSend(v17, "hf_attributedString:withAppendedLinkString:linkURL:", v18, v19, v20);
      [(HUItemTableSectionHeaderFooterView *)v9 setMessage:v21];
    }
    else
    {
      [(HUItemTableSectionHeaderFooterView *)v9 setMessage:v8];
    }
    v23 = [(HUItemTableSectionHeaderFooterView *)v9 messageTextView];
    [v23 setDelegate:self];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)HUAccessorySettingsDataAnalyticsViewController;
    v9 = [(HUItemTableViewController *)&v25 tableView:v6 viewForFooterInSection:a4];
  }

  return v9;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  v9 = [MEMORY[0x1E4F696F8] aboutImproveSiriAndDictationURL];
  int v10 = [v7 isEqual:v9];

  v11 = (void *)MEMORY[0x1E4F83AD8];
  if (v10)
  {
    v12 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B30]];
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F83B08];
    v20[0] = *MEMORY[0x1E4F83B00];
    v20[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v12 = [v11 presenterForPrivacyUnifiedAboutWithIdentifiers:v14];
  }
  uint64_t v15 = [(HUAccessorySettingsDataAnalyticsViewController *)self navigationController];
  v16 = (void *)v15;
  if (v15) {
    v17 = (HUAccessorySettingsDataAnalyticsViewController *)v15;
  }
  else {
    v17 = self;
  }
  v18 = v17;

  [v12 setPresentingViewController:v18];
  [v12 present];

  return 0;
}

- (void)dismissPrivacyController
{
}

- (UIView)linkFooterView
{
  return self->_linkFooterView;
}

- (void).cxx_destruct
{
}

@end