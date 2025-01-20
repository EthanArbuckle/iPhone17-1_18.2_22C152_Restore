@interface HROnboardingInlineExpandedContentView
+ (double)_badgeFontDistance;
+ (double)_bodyFontDistance;
+ (double)_headingBodyFontDistance;
+ (double)_headingToBadgeFontDistance;
+ (double)_listFontDistance;
+ (id)_badgeFont;
+ (id)_badgeFontTextStyle;
+ (id)_badgeLabelWithLocalizedText:(id)a3;
+ (id)_bodyFont;
+ (id)_bodyFontTextStyle;
+ (id)_bodyLabelWithAtrialFibrillationLocalizationKey:(id)a3;
+ (id)_bodyLabelWithLocalizedText:(id)a3;
+ (id)_bulletedTextViewWithLocalizationKey:(id)a3;
+ (id)_headingBodyFont;
+ (id)_headingLabelWithAtrialFibrillationLocalizationKey:(id)a3;
+ (id)_headingLabelWithLocalizedText:(id)a3;
+ (id)_learnMoreListLabelWithLocalizedText:(id)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5;
+ (id)_listLabelWithAtrialFibrillationLocalizationKey:(id)a3;
+ (id)_listLabelWithLocalizedText:(id)a3;
+ (id)_makeViewWithContentItem:(id)a3;
+ (id)_spacingBetweenItems:(id)a3;
+ (id)learnMoreAboutAtrialFibrillationExpandedView;
+ (id)viewWithItems:(id)a3;
- (int64_t)currentUserInterfaceStyle;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
@end

@implementation HROnboardingInlineExpandedContentView

+ (id)viewWithItems:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HROnboardingInlineExpandedContentView);
  [(HROnboardingInlineExpandedContentView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([v4 count])
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke;
    v25[3] = &__block_descriptor_40_e31__16__0__HRExpandedContentItem_8l;
    v25[4] = a1;
    v6 = objc_msgSend(v4, "hk_map:", v25);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_2;
    v23[3] = &unk_264581310;
    v7 = v5;
    v24 = v7;
    [v6 enumerateObjectsUsingBlock:v23];
    v8 = [v6 firstObject];
    v9 = [v8 firstBaselineAnchor];
    v10 = [(HROnboardingInlineExpandedContentView *)v7 topAnchor];
    [(id)objc_opt_class() _bodyFontDistance];
    v11 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
    [v11 setActive:1];

    v12 = [a1 _spacingBetweenItems:v4];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_3;
    v21[3] = &unk_264581338;
    v22 = v6;
    id v13 = v6;
    [v12 enumerateObjectsUsingBlock:v21];
    v14 = [(HROnboardingInlineExpandedContentView *)v7 bottomAnchor];
    v15 = [v13 lastObject];
    v16 = [v15 lastBaselineAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = v22;
    v19 = v7;
  }
  return v5;
}

uint64_t __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _makeViewWithContentItem:a2];
}

void __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"SessionDetails.MoreInfo.%lu", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [NSString healthAccessibilityIdentifier:1 suffix:v8];
  [v6 setAccessibilityIdentifier:v7];

  [*(id *)(a1 + 32) addSubview:v6];
  objc_msgSend(v6, "hk_alignHorizontalConstraintsWithView:margin:", *(void *)(a1 + 32), 0.0);
}

void __55__HROnboardingInlineExpandedContentView_viewWithItems___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v13 = [v5 objectAtIndexedSubscript:a3];
  v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
  id v8 = [v7 firstBaselineAnchor];
  v9 = [v13 lastBaselineAnchor];
  [v6 floatValue];
  float v11 = v10;

  v12 = [v8 constraintEqualToAnchor:v9 constant:v11];
  [v12 setActive:1];
}

+ (id)learnMoreAboutAtrialFibrillationExpandedView
{
  v60[12] = *MEMORY[0x263EF8340];
  v41 = objc_alloc_init(HROnboardingInlineExpandedContentView);
  [(HROnboardingInlineExpandedContentView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
  v2 = [(HROnboardingInlineExpandedContentView *)v41 widthAnchor];
  v3 = [v2 constraintLessThanOrEqualToConstant:500.0];
  [v3 setActive:1];

  v54 = [(id)objc_opt_class() _bodyLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_1"];
  v53 = [(id)objc_opt_class() _headingLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_2_HEADING"];
  v52 = [(id)objc_opt_class() _bodyLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_2"];
  v51 = [(id)objc_opt_class() _headingLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_HEADING"];
  v50 = [(id)objc_opt_class() _bodyLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3"];
  v49 = [(id)objc_opt_class() _listLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_1"];
  v48 = [(id)objc_opt_class() _listLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_2"];
  v47 = [(id)objc_opt_class() _listLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_3"];
  v46 = [(id)objc_opt_class() _listLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_4"];
  v45 = [(id)objc_opt_class() _listLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_5"];
  v44 = [(id)objc_opt_class() _listLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_6"];
  v43 = [(id)objc_opt_class() _listLabelWithAtrialFibrillationLocalizationKey:@"ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_LEARN_MORE_EXPANDED_3_SYMPTOM_7"];
  v60[0] = v54;
  v60[1] = v53;
  v60[2] = v52;
  v60[3] = v51;
  v60[4] = v50;
  v60[5] = v49;
  v60[6] = v48;
  v60[7] = v47;
  v60[8] = v46;
  v60[9] = v45;
  v60[10] = v44;
  v60[11] = v43;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:12];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke;
  v57[3] = &unk_264581310;
  id v4 = v41;
  v58 = v4;
  v42 = v4;
  [v40 enumerateObjectsUsingBlock:v57];
  v5 = [v40 firstObject];
  id v6 = [v5 firstBaselineAnchor];
  v7 = [(HROnboardingInlineExpandedContentView *)v4 topAnchor];
  [(id)objc_opt_class() _bodyFontDistance];
  id v8 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7);
  [v8 setActive:1];

  v9 = NSNumber;
  [(id)objc_opt_class() _headingBodyFontDistance];
  v39 = objc_msgSend(v9, "numberWithDouble:");
  v59[0] = v39;
  float v10 = NSNumber;
  [(id)objc_opt_class() _bodyFontDistance];
  v38 = objc_msgSend(v10, "numberWithDouble:");
  v59[1] = v38;
  float v11 = NSNumber;
  [(id)objc_opt_class() _headingBodyFontDistance];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v59[2] = v12;
  id v13 = NSNumber;
  [(id)objc_opt_class() _bodyFontDistance];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v59[3] = v14;
  v15 = NSNumber;
  [(id)objc_opt_class() _listFontDistance];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  v59[4] = v16;
  v17 = NSNumber;
  [(id)objc_opt_class() _listFontDistance];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v59[5] = v18;
  v19 = NSNumber;
  [(id)objc_opt_class() _listFontDistance];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  v59[6] = v20;
  v21 = NSNumber;
  [(id)objc_opt_class() _listFontDistance];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  v59[7] = v22;
  v23 = NSNumber;
  [(id)objc_opt_class() _listFontDistance];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  v59[8] = v24;
  v25 = NSNumber;
  [(id)objc_opt_class() _listFontDistance];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v59[9] = v26;
  v27 = NSNumber;
  [(id)objc_opt_class() _listFontDistance];
  v28 = objc_msgSend(v27, "numberWithDouble:");
  v59[10] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:11];

  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke_2;
  v55[3] = &unk_264581338;
  v56 = v40;
  id v30 = v40;
  [v29 enumerateObjectsUsingBlock:v55];
  v31 = [(HROnboardingInlineExpandedContentView *)v42 bottomAnchor];
  v32 = [v30 lastObject];
  v33 = [v32 lastBaselineAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = v56;
  v36 = v42;

  return v36;
}

void __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addSubview:v4];
  objc_msgSend(v4, "hk_alignHorizontalConstraintsWithView:margin:", *(void *)(a1 + 32), 0.0);
}

void __85__HROnboardingInlineExpandedContentView_learnMoreAboutAtrialFibrillationExpandedView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v13 = [v5 objectAtIndexedSubscript:a3];
  v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
  id v8 = [v7 firstBaselineAnchor];
  v9 = [v13 lastBaselineAnchor];
  [v6 floatValue];
  float v11 = v10;

  v12 = [v8 constraintEqualToAnchor:v9 constant:v11];
  [v12 setActive:1];
}

+ (id)_bodyLabelWithAtrialFibrillationLocalizationKey:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = HRHeartRhythmUIFrameworkBundle();
  v7 = [v6 localizedStringForKey:v4 value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  [v5 setText:v7];
  id v8 = [(id)objc_opt_class() _bodyFont];
  [v5 setFont:v8];

  [v5 setAdjustsFontForContentSizeCategory:1];
  [v5 setNumberOfLines:0];
  return v5;
}

+ (id)_headingLabelWithAtrialFibrillationLocalizationKey:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = HRHeartRhythmUIFrameworkBundle();
  v7 = [v6 localizedStringForKey:v4 value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  [v5 setText:v7];
  id v8 = [(id)objc_opt_class() _headingBodyFont];
  [v5 setFont:v8];

  [v5 setAdjustsFontForContentSizeCategory:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setNumberOfLines:0];
  return v5;
}

+ (id)_listLabelWithAtrialFibrillationLocalizationKey:(id)a3
{
  id v3 = a3;
  id v4 = [HRBulletedIndentedLabel alloc];
  id v5 = HRHeartRhythmUIFrameworkBundle();
  id v6 = [v5 localizedStringForKey:v3 value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];

  v7 = [(HRBulletedIndentedLabel *)v4 initWithText:v6];
  [(HRBulletedIndentedLabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v7;
}

+ (id)_spacingBetweenItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  if ((unint64_t)[v3 count] >= 2)
  {
    unint64_t v5 = 1;
    do
    {
      id v6 = [v3 objectAtIndexedSubscript:v5];
      switch([v6 type])
      {
        case 0:
          v7 = NSNumber;
          [(id)objc_opt_class() _badgeFontDistance];
          goto LABEL_9;
        case 1:
          id v8 = [v3 objectAtIndexedSubscript:v5 - 1];
          uint64_t v9 = [v8 type];
          float v10 = NSNumber;
          float v11 = objc_opt_class();
          if (v9) {
            [v11 _headingBodyFontDistance];
          }
          else {
            [v11 _headingToBadgeFontDistance];
          }
          v12 = objc_msgSend(v10, "numberWithDouble:");
          [v4 addObject:v12];

          goto LABEL_12;
        case 2:
          v7 = NSNumber;
          [(id)objc_opt_class() _bodyFontDistance];
          goto LABEL_9;
        case 3:
          v7 = NSNumber;
          [(id)objc_opt_class() _listFontDistance];
LABEL_9:
          id v8 = objc_msgSend(v7, "numberWithDouble:");
          [v4 addObject:v8];
LABEL_12:

          break;
        default:
          break;
      }

      ++v5;
    }
    while (v5 < [v3 count]);
  }

  return v4;
}

+ (id)_makeViewWithContentItem:(id)a3
{
  id v4 = a3;
  switch([v4 type])
  {
    case 0:
      unint64_t v5 = objc_opt_class();
      id v6 = [v4 title];
      uint64_t v7 = [v5 _badgeLabelWithLocalizedText:v6];
      goto LABEL_8;
    case 1:
      id v8 = objc_opt_class();
      id v6 = [v4 title];
      uint64_t v7 = [v8 _headingLabelWithLocalizedText:v6];
      goto LABEL_8;
    case 2:
      uint64_t v9 = objc_opt_class();
      id v6 = [v4 title];
      uint64_t v7 = [v9 _bodyLabelWithLocalizedText:v6];
      goto LABEL_8;
    case 3:
      float v10 = [v4 learnMore];

      float v11 = objc_opt_class();
      id v6 = [v4 title];
      if (v10)
      {
        v12 = [v4 learnMore];
        uint64_t v13 = [v12 urlIdentifier];
        v14 = [v4 learnMore];
        v15 = [v14 delegate];
        id v3 = [v11 _learnMoreListLabelWithLocalizedText:v6 URLIdentifier:v13 delegate:v15];
      }
      else
      {
        uint64_t v7 = [v11 _listLabelWithLocalizedText:v6];
LABEL_8:
        id v3 = (void *)v7;
      }

LABEL_10:
      return v3;
    default:
      goto LABEL_10;
  }
}

+ (id)_badgeLabelWithLocalizedText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [(id)objc_opt_class() _badgeFont];
  [v5 setFont:v6];

  [v5 setAdjustsFontForContentSizeCategory:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setNumberOfLines:0];
  [v5 setText:v4];

  uint64_t v7 = objc_msgSend(MEMORY[0x263F1C550], "hk_heartKeyColor");
  [v5 setTextColor:v7];

  return v5;
}

+ (id)_bodyLabelWithLocalizedText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [(id)objc_opt_class() _bodyFont];
  [v5 setFont:v6];

  [v5 setAdjustsFontForContentSizeCategory:1];
  [v5 setNumberOfLines:0];
  [v5 setText:v4];

  return v5;
}

+ (id)_headingLabelWithLocalizedText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [(id)objc_opt_class() _headingBodyFont];
  [v5 setFont:v6];

  [v5 setAdjustsFontForContentSizeCategory:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setNumberOfLines:0];
  [v5 setText:v4];

  return v5;
}

+ (id)_listLabelWithLocalizedText:(id)a3
{
  id v3 = a3;
  id v4 = [[HRBulletedIndentedLabel alloc] initWithText:v3];

  [(HRBulletedIndentedLabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v4;
}

+ (id)_bulletedTextViewWithLocalizationKey:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1CAC8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScrollEnabled:0];
  [v5 setUserInteractionEnabled:1];
  [v5 setSelectable:0];
  [v5 setEditable:0];
  objc_msgSend(v5, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  id v6 = [v5 textContainer];
  [v6 setLineFragmentPadding:0.0];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v5 setFont:v7];

  id v8 = (void *)MEMORY[0x263F089B8];
  uint64_t v9 = HRUIECGLocalizedString(v4);

  float v10 = [(id)objc_opt_class() _bodyFontTextStyle];
  float v11 = objc_msgSend(v8, "hrui_bulletedString:textStyle:", v9, v10);
  [v5 setAttributedText:v11];

  return v5;
}

+ (id)_learnMoreListLabelWithLocalizedText:(id)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = HRHeartRhythmUIFrameworkBundle();
  float v10 = [v9 localizedStringForKey:@"ONBOARDING_LEARN_MORE_WITH_ELLIPSES" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];

  float v11 = [NSString stringWithFormat:@"%@ %@", v8, v10];

  v12 = (void *)MEMORY[0x263F089B8];
  uint64_t v13 = [(id)objc_opt_class() _bodyFontTextStyle];
  v14 = objc_msgSend(v12, "hrui_bulletedString:textStyle:", v11, v13);

  v15 = [v14 string];
  uint64_t v16 = [v15 rangeOfString:v10];
  uint64_t v18 = v17;

  uint64_t v19 = *MEMORY[0x263F1C240];
  v20 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
  objc_msgSend(v14, "addAttribute:value:range:", v19, v20, v16, v18);

  v21 = [HRLinkTextView alloc];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __101__HROnboardingInlineExpandedContentView__learnMoreListLabelWithLocalizedText_URLIdentifier_delegate___block_invoke;
  v28[3] = &unk_264581360;
  id v29 = v10;
  id v22 = v10;
  v23 = -[HRLinkTextView initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:](v21, "initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:", v16, v18, a4, v7, v28);

  v24 = [(HRLinkTextView *)v23 textView];
  [v24 setAttributedText:v14];

  v25 = [(HRLinkTextView *)v23 textView];
  v26 = [v25 textContainer];
  [v26 setLineFragmentPadding:0.0];

  return v23;
}

void __101__HROnboardingInlineExpandedContentView__learnMoreListLabelWithLocalizedText_URLIdentifier_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 textView];
  id v5 = [v4 attributedText];
  id v11 = (id)[v5 mutableCopy];

  id v6 = [v11 string];
  uint64_t v7 = [v6 rangeOfString:*(void *)(a1 + 32)];

  uint64_t v8 = *MEMORY[0x263F1C240];
  uint64_t v9 = [MEMORY[0x263F1C550] labelColor];
  objc_msgSend(v11, "addAttribute:value:range:", v8, v9, 0, v7);

  float v10 = [v3 textView];

  [v10 setAttributedText:v11];
}

+ (id)_badgeFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(id)objc_opt_class() _badgeFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

+ (double)_badgeFontDistance
{
  v2 = [(id)objc_opt_class() _badgeFont];
  [v2 _scaledValueForValue:48.0];
  double v4 = v3;

  return v4;
}

+ (id)_badgeFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

+ (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

+ (id)_headingBodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(id)objc_opt_class() _bodyFontTextStyle];
  double v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

+ (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(id)objc_opt_class() _bodyFontTextStyle];
  double v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

+ (double)_bodyFontDistance
{
  v2 = [(id)objc_opt_class() _bodyFont];
  [v2 _scaledValueForValue:30.0];
  double v4 = v3;

  return v4;
}

+ (double)_headingBodyFontDistance
{
  v2 = [(id)objc_opt_class() _headingBodyFont];
  [v2 _scaledValueForValue:48.0];
  double v4 = v3;

  return v4;
}

+ (double)_headingToBadgeFontDistance
{
  v2 = [(id)objc_opt_class() _headingBodyFont];
  [v2 _scaledValueForValue:22.0];
  double v4 = v3;

  return v4;
}

+ (double)_listFontDistance
{
  v2 = [(id)objc_opt_class() _bodyFont];
  [v2 _scaledValueForValue:34.0];
  double v4 = v3;

  return v4;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

@end