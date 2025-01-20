@interface SFPrivacyReportExplanationDetailView
- (BOOL)usesInsetStyle;
- (SFPrivacyReportExplanationDetailView)initWithFrame:(CGRect)a3;
- (double)interItemSpacing;
- (void)setUsesInsetStyle:(BOOL)a3;
@end

@implementation SFPrivacyReportExplanationDetailView

- (SFPrivacyReportExplanationDetailView)initWithFrame:(CGRect)a3
{
  v60[2] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)SFPrivacyReportExplanationDetailView;
  v3 = -[SFPrivacyReportGridView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    v5 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
    v6 = _WBSLocalizedString();
    v7 = [(SFPrivacyReportExplanationDetailItemView *)v5 titleLabel];
    [v7 setText:v6];

    v8 = _WBSLocalizedString();
    v9 = [(SFPrivacyReportExplanationDetailItemView *)v5 bodyTextView];
    [v9 setText:v8];

    [v4 addObject:v5];
    v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    LODWORD(v5) = objc_msgSend(v10, "safari_enableAdvancedPrivacyProtections:", 1);

    v11 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
    v12 = _WBSLocalizedString();
    v13 = [(SFPrivacyReportExplanationDetailItemView *)v11 titleLabel];
    [v13 setText:v12];

    v14 = _WBSLocalizedString();
    v15 = [(SFPrivacyReportExplanationDetailItemView *)v11 bodyTextView];
    [v15 setText:v14];

    [v4 addObject:v11];
    if (v5)
    {
      v16 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
      v17 = _WBSLocalizedString();
      v18 = [(SFPrivacyReportExplanationDetailItemView *)v16 titleLabel];
      [v18 setText:v17];

      _SFDeviceIsPad();
      v19 = _WBSLocalizedString();
      v20 = [(SFPrivacyReportExplanationDetailItemView *)v16 bodyTextView];
      [v20 setText:v19];

      [v4 addObject:v16];
      v21 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
      v22 = _WBSLocalizedString();
      v23 = [(SFPrivacyReportExplanationDetailItemView *)v21 titleLabel];
      [v23 setText:v22];

      v24 = _WBSLocalizedString();
      v25 = [(SFPrivacyReportExplanationDetailItemView *)v21 bodyTextView];
      [v25 setText:v24];

      [v4 addObject:v21];
    }
    v26 = [MEMORY[0x1E4F98CF0] sharedManager];
    int v27 = [v26 isPrivacyProxyActive];

    if (v27)
    {
      v28 = [MEMORY[0x1E4F98CF0] sharedManager];
      unsigned int v29 = [v28 isUserAccountInSubscriberTierForPrivacyProxy];

      v30 = [MEMORY[0x1E4F98CF0] sharedManager];
      unsigned int v31 = [v30 isPrivacyProxyPaidTierUnavailableInUserCountry];

      v32 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
      unint64_t v53 = __PAIR64__(v29, v31);
      v33 = _WBSLocalizedString();
      v34 = [(SFPrivacyReportExplanationDetailItemView *)v32 titleLabel];
      [v34 setText:v33];

      v35 = _WBSLocalizedString();
      id v36 = objc_alloc(MEMORY[0x1E4F28E48]);
      v59[0] = *MEMORY[0x1E4FB12B0];
      v37 = [(SFPrivacyReportExplanationDetailItemView *)v32 bodyTextView];
      v38 = [v37 font];
      v60[0] = v38;
      v59[1] = *MEMORY[0x1E4FB12B8];
      v39 = [(SFPrivacyReportExplanationDetailItemView *)v32 bodyTextView];
      v40 = [v39 textColor];
      v60[1] = v40;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
      v42 = (void *)[v36 initWithString:v35 attributes:v41];

      if ((HIDWORD(v53) | v53 ^ 1) == 1)
      {
        uint64_t v57 = *MEMORY[0x1E4FB12C8];
        v43 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F993A8]];
        v58 = v43;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        v45 = [v42 string];
        uint64_t v46 = [v45 rangeOfString:@"{learn-more-link}"];
        objc_msgSend(v42, "addAttributes:range:", v44, v46, v47);

        v48 = _WBSLocalizedString();
        v55 = @"{learn-more-link}";
        v56 = v48;
        v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        objc_msgSend(v42, "safari_replaceCharactersWithStringBindings:", v49);
      }
      v50 = [(SFPrivacyReportExplanationDetailItemView *)v32 bodyTextView];
      [v50 setAttributedText:v42];

      [v4 addObject:v32];
    }
    [(SFPrivacyReportGridView *)v3 setItemViews:v4];
    v51 = v3;
  }
  return v3;
}

- (double)interItemSpacing
{
  return 25.0;
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_usesInsetStyle != a3)
  {
    BOOL v3 = a3;
    self->_usesInsetStyle = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = [(SFPrivacyReportGridView *)self itemViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) setUsesInsetStyle:v3];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

@end