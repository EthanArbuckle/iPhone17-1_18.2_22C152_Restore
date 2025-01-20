@interface WDClinicalSettingsOptInNib
- (UITextViewDelegate)textViewDelegate;
- (id)_footerTextViewString;
- (id)instantiateWithOwner:(id)a3 options:(id)a4;
- (void)setTextViewDelegate:(id)a3;
@end

@implementation WDClinicalSettingsOptInNib

- (id)instantiateWithOwner:(id)a3 options:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:0];
  id v6 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setScrollEnabled:0];
  [v7 setUserInteractionEnabled:1];
  v9 = [(WDClinicalSettingsOptInNib *)self textViewDelegate];
  [v7 setDelegate:v9];

  [v7 setEditable:0];
  [v7 _setInteractiveTextSelectionDisabled:1];
  [v7 setDataDetectorTypes:2];
  v10 = [(WDClinicalSettingsOptInNib *)self _footerTextViewString];
  [v7 setAttributedText:v10];

  v11 = [v5 contentView];
  [v11 addSubview:v7];

  v12 = _NSDictionaryOfVariableBindings(&cfstr_Textview.isa, v7, 0);
  v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[textView]-|" options:40 metrics:0 views:v12];
  v14 = [v5 contentView];
  [v14 addConstraints:v13];

  v15 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-0-[textView]-17-|" options:40 metrics:0 views:v12];

  v16 = [v5 contentView];
  [v16 addConstraints:v15];

  v19[0] = v5;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  return v17;
}

- (id)_footerTextViewString
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v2 = HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_ANALYTICS_SETTINGS_LINK_TITLE");
  v3 = [MEMORY[0x1E4FB16C8] modelSpecificLocalizedStringKeyForKey:@"CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_FOOTER_%@"];
  v4 = HRLocalizedString(v3);

  v5 = objc_msgSend(NSString, "stringWithFormat:", v4, v2);
  id v6 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  v26[0] = *MEMORY[0x1E4FB0700];
  v8 = [MEMORY[0x1E4FB1618] grayColor];
  v27[0] = v8;
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v26[1] = *MEMORY[0x1E4FB06F8];
  uint64_t v10 = *MEMORY[0x1E4FB28F0];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v27[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  v13 = (void *)[v6 initWithString:v5 attributes:v12];

  uint64_t v14 = [v5 rangeOfString:v2];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = v14;
    uint64_t v17 = v15;
    v18 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=PROBLEM_REPORTING/SHARE_HEALTH_RECORDS_DATA"];
    v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
    v24[0] = v7;
    v20 = HKHealthKeyColor();
    uint64_t v21 = *MEMORY[0x1E4FB0720];
    v25[0] = v20;
    v25[1] = v18;
    v24[1] = v21;
    v24[2] = v9;
    v25[2] = v19;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

    objc_msgSend(v13, "setAttributes:range:", v22, v16, v17);
  }

  return v13;
}

- (UITextViewDelegate)textViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textViewDelegate);
  return (UITextViewDelegate *)WeakRetained;
}

- (void)setTextViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end