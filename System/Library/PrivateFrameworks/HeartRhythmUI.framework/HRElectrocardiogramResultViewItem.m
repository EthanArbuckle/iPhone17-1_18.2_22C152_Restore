@interface HRElectrocardiogramResultViewItem
+ (id)_makeItemForAtrialFibrillationAlgorithmVersionOne;
+ (id)_makeItemForAtrialFibrillationAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3;
+ (id)_makeItemForHighOrLowAbove120Below50AlgorithmVersionOne;
+ (id)_makeItemForHighOrLowAbove150Below50AlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3;
+ (id)_makeItemForInconclusiveAlgorithmVersionOneWithLearnMoreDelegate:(id)a3;
+ (id)_makeItemForInconclusiveAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3 withLearnMoreDelegate:(id)a4;
+ (id)_makeItemForPoorRecordingAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3 withLearnMoreDelegate:(id)a4;
+ (id)_makeItemForSinusRhythmAlgorithmVersionOne;
+ (id)viewItemWithClassification:(unint64_t)a3 sampleAlgorithmVersion:(id)a4 forAlgorithmVersion:(int64_t)a5 learnMoreDelegate:(id)a6;
+ (id)viewItemWithClassification:(unint64_t)a3 sampleAlgorithmVersion:(id)a4 forAlgorithmVersion:(int64_t)a5 upgradingFromAlgorithmVersion:(int64_t)a6 learnMoreDelegate:(id)a7;
- (HRElectrocardiogramResultViewItem)initWithBadge:(id)a3 title:(id)a4 numberedTitle:(id)a5 visibleBodyText:(id)a6 videoPath:(id)a7 expandedContentItems:(id)a8;
- (NSArray)expandedContentItems;
- (NSString)badge;
- (NSString)numberedTitle;
- (NSString)title;
- (NSString)videoPath;
- (NSString)visibleBodyText;
@end

@implementation HRElectrocardiogramResultViewItem

+ (id)viewItemWithClassification:(unint64_t)a3 sampleAlgorithmVersion:(id)a4 forAlgorithmVersion:(int64_t)a5 learnMoreDelegate:(id)a6
{
  return +[HRElectrocardiogramResultViewItem viewItemWithClassification:a3 sampleAlgorithmVersion:a4 forAlgorithmVersion:a5 upgradingFromAlgorithmVersion:*MEMORY[0x263F0AA58] learnMoreDelegate:a6];
}

+ (id)viewItemWithClassification:(unint64_t)a3 sampleAlgorithmVersion:(id)a4 forAlgorithmVersion:(int64_t)a5 upgradingFromAlgorithmVersion:(int64_t)a6 learnMoreDelegate:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  _HKInitializeLogging();
  v14 = (os_log_t *)MEMORY[0x263F09920];
  v15 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    int v21 = 67175683;
    *(_DWORD *)v22 = a3;
    *(_WORD *)&v22[4] = 1026;
    *(_DWORD *)&v22[6] = [v12 intValue];
    LOWORD(v23) = 1026;
    *(_DWORD *)((char *)&v23 + 2) = a5;
    HIWORD(v23) = 1026;
    v24[0] = a6;
    LOWORD(v24[1]) = 2114;
    *(void *)((char *)&v24[1] + 2) = v13;
    _os_log_impl(&dword_220CA3000, v16, OS_LOG_TYPE_DEFAULT, "Generate result view item for classification: %{private}i sampleAlgVersion: %{public}i forAlgorithmVersion: %{public}i fromAlgorithmVersion: %{public}i delegate: %{public}@", (uint8_t *)&v21, 0x24u);
  }
  v17 = 0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_32;
    case 1uLL:
      if (a5 != 2) {
        goto LABEL_13;
      }
      uint64_t v18 = [a1 _makeItemForPoorRecordingAlgorithmVersionTwoUpgradingFromAlgorithmVersion:a6 withLearnMoreDelegate:v13];
      goto LABEL_31;
    case 2uLL:
      if (a5 != 2)
      {
LABEL_13:
        if (a5 != 1) {
          goto LABEL_25;
        }
        goto LABEL_14;
      }
      if (v12 && [v12 integerValue] == 1)
      {
LABEL_14:
        uint64_t v18 = [a1 _makeItemForInconclusiveAlgorithmVersionOneWithLearnMoreDelegate:v13];
        goto LABEL_31;
      }
      uint64_t v18 = [a1 _makeItemForInconclusiveAlgorithmVersionTwoUpgradingFromAlgorithmVersion:a6 withLearnMoreDelegate:v13];
LABEL_31:
      v17 = (void *)v18;
      goto LABEL_32;
    case 3uLL:
      if ((unint64_t)(a5 - 1) > 1) {
        goto LABEL_25;
      }
      uint64_t v18 = [a1 _makeItemForSinusRhythmAlgorithmVersionOne];
      goto LABEL_31;
    case 4uLL:
      if (a5 != 2 && a5 != 1) {
        goto LABEL_25;
      }
      uint64_t v18 = [a1 _makeItemForAtrialFibrillationAlgorithmVersionOne];
      goto LABEL_31;
    case 5uLL:
      if ((unint64_t)(a5 - 1) > 1) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 6uLL:
      if (a5 == 2)
      {
        if (!v12 || [v12 integerValue] != 1)
        {
LABEL_6:
          uint64_t v18 = [a1 _makeItemForHighOrLowAbove150Below50AlgorithmVersionTwoUpgradingFromAlgorithmVersion:a6];
          goto LABEL_31;
        }
        goto LABEL_24;
      }
      if (a5 == 1)
      {
LABEL_24:
        uint64_t v18 = [a1 _makeItemForHighOrLowAbove120Below50AlgorithmVersionOne];
        goto LABEL_31;
      }
LABEL_25:
      _HKInitializeLogging();
      v19 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
      {
        int v21 = 134218496;
        *(void *)v22 = a5;
        *(_WORD *)&v22[8] = 2048;
        int64_t v23 = a6;
        LOWORD(v24[0]) = 2048;
        *(void *)((char *)v24 + 2) = a3;
        _os_log_impl(&dword_220CA3000, v19, OS_LOG_TYPE_INFO, "Failed to create a result view item. For algorithm version: %li, updating from algoritm version: %li classification: %lu", (uint8_t *)&v21, 0x20u);
      }
LABEL_27:
      v17 = 0;
LABEL_32:

      return v17;
    case 7uLL:
    case 0xAuLL:
      if (a5 == 1) {
        goto LABEL_27;
      }
      if (a5 == 2) {
        goto LABEL_6;
      }
      goto LABEL_25;
    case 8uLL:
    case 9uLL:
      if (a5 == 1) {
        goto LABEL_27;
      }
      if (a5 != 2) {
        goto LABEL_25;
      }
      uint64_t v18 = [a1 _makeItemForAtrialFibrillationAlgorithmVersionTwoUpgradingFromAlgorithmVersion:a6];
      goto LABEL_31;
    default:
      goto LABEL_25;
  }
}

- (HRElectrocardiogramResultViewItem)initWithBadge:(id)a3 title:(id)a4 numberedTitle:(id)a5 visibleBodyText:(id)a6 videoPath:(id)a7 expandedContentItems:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HRElectrocardiogramResultViewItem;
  uint64_t v18 = [(HRElectrocardiogramResultViewItem *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_badge, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_numberedTitle, a5);
    objc_storeStrong((id *)&v19->_visibleBodyText, a6);
    objc_storeStrong((id *)&v19->_videoPath, a7);
    objc_storeStrong((id *)&v19->_expandedContentItems, a8);
  }

  return v19;
}

- (NSString)badge
{
  return self->_badge;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)numberedTitle
{
  return self->_numberedTitle;
}

- (NSString)visibleBodyText
{
  return self->_visibleBodyText;
}

- (NSString)videoPath
{
  return self->_videoPath;
}

- (NSArray)expandedContentItems
{
  return self->_expandedContentItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedContentItems, 0);
  objc_storeStrong((id *)&self->_videoPath, 0);
  objc_storeStrong((id *)&self->_visibleBodyText, 0);
  objc_storeStrong((id *)&self->_numberedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

+ (id)_makeItemForAtrialFibrillationAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3
{
  v3 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_2_TITLE");
  v4 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_2_NUMBERED_TITLE");
  v5 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_2_VISIBLE_BODY");
  v6 = objc_msgSend(NSString, "hrui_atrialFibrillationVideoPath");
  v7 = +[HRExpandedContentItem atrialFibrillationItemsForAlgorithmVersion:2];
  v8 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:0 title:v3 numberedTitle:v4 visibleBodyText:v5 videoPath:v6 expandedContentItems:v7];

  return v8;
}

+ (id)_makeItemForHighOrLowAbove150Below50AlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_UPDATED_BADGE");
  }
  else
  {
    v4 = 0;
  }
  v5 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_3_TITLE");
  v6 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_3_TITLE");
  v7 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_3_VISIBLE_BODY");
  v8 = objc_msgSend(NSString, "hrui_highOrLowHeartRateVideoPath");
  v9 = +[HRExpandedContentItem highOrLowAbove150Below50HeartRateItemsForAlgorithmVersion:2 upgradingFromAlgorithmVersion:a3];
  v10 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:v4 title:v5 numberedTitle:v6 visibleBodyText:v7 videoPath:v8 expandedContentItems:v9];

  return v10;
}

+ (id)_makeItemForInconclusiveAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3 withLearnMoreDelegate:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    v6 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_UPDATED_BADGE");
  }
  else
  {
    v6 = 0;
  }
  v7 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_4_TITLE");
  v8 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_4_TITLE");
  v9 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_4_VISIBLE_BODY");
  v10 = objc_msgSend(NSString, "hrui_inconclusiveVideoPath");
  v11 = +[HRExpandedContentItem inconclusiveItemsForAlgorithmVersion:2 upgradingFromAlgorithmVersion:a3 learnMoreDelegate:v5];
  id v12 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:v6 title:v7 numberedTitle:v8 visibleBodyText:v9 videoPath:v10 expandedContentItems:v11];

  return v12;
}

+ (id)_makeItemForPoorRecordingAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3 withLearnMoreDelegate:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    v6 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_NEW_BADGE");
  }
  else
  {
    v6 = 0;
  }
  v7 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_5_TITLE");
  v8 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_5_TITLE");
  v9 = HRUIECGLocalizedString(@"ECG_V2_ONBOARDING_3_SECTION_5_VISIBLE_BODY");
  v10 = +[HRExpandedContentItem poorRecordingItemsForAlgorithmVersion:2 learnMoreDelegate:v5];
  v11 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:v6 title:v7 numberedTitle:v8 visibleBodyText:v9 videoPath:0 expandedContentItems:v10];

  return v11;
}

+ (id)_makeItemForSinusRhythmAlgorithmVersionOne
{
  v2 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_1_TITLE");
  v3 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_1_NUMBERED_TITLE");
  v4 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_1_VISIBLE_BODY");
  id v5 = objc_msgSend(NSString, "hrui_sinusRhythmVideoPath");
  v6 = +[HRExpandedContentItem sinusRhythmItemsForAlgorithmVersion:1];
  v7 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:0 title:v2 numberedTitle:v3 visibleBodyText:v4 videoPath:v5 expandedContentItems:v6];

  return v7;
}

+ (id)_makeItemForAtrialFibrillationAlgorithmVersionOne
{
  v2 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_2_TITLE");
  v3 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_2_NUMBERED_TITLE");
  v4 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_2_VISIBLE_BODY");
  id v5 = objc_msgSend(NSString, "hrui_atrialFibrillationVideoPath");
  v6 = +[HRExpandedContentItem atrialFibrillationItemsForAlgorithmVersion:1];
  v7 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:0 title:v2 numberedTitle:v3 visibleBodyText:v4 videoPath:v5 expandedContentItems:v6];

  return v7;
}

+ (id)_makeItemForHighOrLowAbove120Below50AlgorithmVersionOne
{
  v2 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_3_TITLE");
  v3 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_3_NUMBERED_TITLE");
  v4 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_3_VISIBLE_BODY");
  id v5 = objc_msgSend(NSString, "hrui_highOrLowHeartRateVideoPath");
  v6 = +[HRExpandedContentItem highOrLowAbove120Below50HeartRateItemsForAlgorithmVersion:1];
  v7 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:0 title:v2 numberedTitle:v3 visibleBodyText:v4 videoPath:v5 expandedContentItems:v6];

  return v7;
}

+ (id)_makeItemForInconclusiveAlgorithmVersionOneWithLearnMoreDelegate:(id)a3
{
  id v3 = a3;
  v4 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_4_TITLE");
  id v5 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_4_TITLE");
  v6 = HRUIECGLocalizedString(@"ECG_ONBOARDING_3_SECTION_4_VISIBLE_BODY");
  v7 = objc_msgSend(NSString, "hrui_inconclusiveVideoPath");
  v8 = +[HRExpandedContentItem inconclusiveItemsForAlgorithmVersion:1 upgradingFromAlgorithmVersion:0 learnMoreDelegate:v3];

  v9 = [[HRElectrocardiogramResultViewItem alloc] initWithBadge:0 title:v4 numberedTitle:v5 visibleBodyText:v6 videoPath:v7 expandedContentItems:v8];
  return v9;
}

@end