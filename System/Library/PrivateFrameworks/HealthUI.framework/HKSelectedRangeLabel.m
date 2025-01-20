@interface HKSelectedRangeLabel
+ (id)_addChevron:(id)a3 font:(id)a4;
+ (id)_attributedMultiplePrefixStringForSelectedRangeData:(id)a3 attributedString:(id)a4 font:(id)a5 foregroundColor:(id)a6;
+ (id)_attributedStringForSelectedRangeData:(id)a3 font:(id)a4 foregroundColor:(id)a5 prefixColor:(id)a6 prefersImageAffixes:(BOOL)a7 embedded:(BOOL)a8;
+ (id)_stringForSelectedRangeData:(id)a3 embedded:(BOOL)a4;
+ (id)attributedStringForSelectedRangeData:(id)a3 font:(id)a4 foregroundColor:(id)a5 prefixColor:(id)a6 prefersImageAffixes:(BOOL)a7 embedded:(BOOL)a8;
+ (id)standardPrefixColorForSelectedRangeData:(id)a3 defaultColor:(id)a4;
+ (void)clearCaches;
- (CGSize)intrinsicContentSize;
- (HKSelectedRangeLabel)init;
- (UIEdgeInsets)padding;
- (void)drawTextInRect:(CGRect)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSelectedRangeData:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKSelectedRangeLabel

- (HKSelectedRangeLabel)init
{
  v4.receiver = self;
  v4.super_class = (Class)HKSelectedRangeLabel;
  result = [(HKSelectedRangeLabel *)&v4 init];
  if (result)
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&result->_padding.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&result->_padding.bottom = v3;
  }
  return result;
}

+ (void)clearCaches
{
  id v2 = +[_WDSelectedRangeIcon _iconCache];
  [v2 removeAllObjects];
}

- (void)drawTextInRect:(CGRect)a3
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  CGFloat v5 = a3.size.width - (left + self->_padding.right);
  CGFloat v6 = a3.size.height - (top + self->_padding.bottom);
  v7.receiver = self;
  v7.super_class = (Class)HKSelectedRangeLabel;
  -[HKSelectedRangeLabel drawTextInRect:](&v7, sel_drawTextInRect_, a3.origin.x + left, a3.origin.y + top, v5, v6);
}

- (CGSize)intrinsicContentSize
{
  v7.receiver = self;
  v7.super_class = (Class)HKSelectedRangeLabel;
  [(HKSelectedRangeLabel *)&v7 intrinsicContentSize];
  double v4 = v3 + self->_padding.left + self->_padding.right;
  double v6 = v5 + self->_padding.top + self->_padding.bottom;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setSelectedRangeData:(id)a3
{
  id v4 = a3;
  double v5 = [(HKSelectedRangeLabel *)self textColor];
  id v9 = +[HKSelectedRangeLabel standardPrefixColorForSelectedRangeData:v4 defaultColor:v5];

  double v6 = [(HKSelectedRangeLabel *)self font];
  objc_super v7 = [(HKSelectedRangeLabel *)self textColor];
  v8 = +[HKSelectedRangeLabel attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:](HKSelectedRangeLabel, "attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v4, v6, v7, v9, [v4 prefersImageAffixes], 0);

  [(HKSelectedRangeLabel *)self setAttributedText:v8];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKSelectedRangeLabel;
  [(HKSelectedRangeLabel *)&v4 traitCollectionDidChange:a3];
  double v3 = +[_WDSelectedRangeIcon _iconCache];
  [v3 removeAllObjects];
}

+ (id)attributedStringForSelectedRangeData:(id)a3 font:(id)a4 foregroundColor:(id)a5 prefixColor:(id)a6 prefersImageAffixes:(BOOL)a7 embedded:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = [a1 _attributedStringForSelectedRangeData:v14 font:v15 foregroundColor:v16 prefixColor:a6 prefersImageAffixes:v9 embedded:v8];
  v18 = (void *)v17;
  if (v9 && v17)
  {
    uint64_t v19 = [a1 _attributedMultiplePrefixStringForSelectedRangeData:v14 attributedString:v17 font:v15 foregroundColor:v16];

    v18 = (void *)v19;
  }

  return v18;
}

+ (id)_attributedStringForSelectedRangeData:(id)a3 font:(id)a4 foregroundColor:(id)a5 prefixColor:(id)a6 prefersImageAffixes:(BOOL)a7 embedded:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v37[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v36[0] = *MEMORY[0x1E4FB0700];
  uint64_t v18 = [v14 titleColorOverride];
  uint64_t v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = (uint64_t)v16;
  }
  v36[1] = *MEMORY[0x1E4FB06F8];
  v37[0] = v20;
  v37[1] = v15;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

  if (v9)
  {
    v22 = +[_WDSelectedRangeIcon iconForData:v14 foregroundColor:v17 compatibleWithFont:v15];
  }
  else
  {
    v22 = 0;
  }
  v23 = [a1 _stringForSelectedRangeData:v14 embedded:v8];
  if (v23)
  {
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v23 attributes:v21];
    v25 = (void *)v24;
    if (v22 && v24)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
      [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v27 = id v34 = v16;
      [v27 localizedStringForKey:@"BLOOD_PRESSURE_SYMBOL_SPACE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v28 = id v33 = v17;
      v29 = (void *)[v26 initWithString:v28 attributes:v21];

      id v16 = v34;
      v35[0] = v22;
      v35[1] = v29;
      v35[2] = v25;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
      HKUIJoinAttributedStringsForLocale(v30);
      id v31 = (id)objc_claimAutoreleasedReturnValue();

      id v17 = v33;
      goto LABEL_14;
    }
  }
  else
  {
    v25 = 0;
  }
  if (!v22) {
    goto LABEL_15;
  }
  id v31 = v22;
LABEL_14:

  v25 = v31;
LABEL_15:

  return v25;
}

+ (id)_addChevron:(id)a3 font:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if ([MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1) {
    BOOL v8 = @"date_chevron_left";
  }
  else {
    BOOL v8 = @"date_chevron_right";
  }
  BOOL v9 = [MEMORY[0x1E4FB1818] imageNamed:v8 inBundle:v7 compatibleWithTraitCollection:0];
  v10 = [v9 imageWithRenderingMode:2];

  id v11 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v11 setImage:v10];
  [v10 size];
  if (v12 != 0.0)
  {
    [v10 size];
    [v10 size];
  }
  [v6 capHeight];
  [v11 bounds];
  double v14 = v13;
  [v11 bounds];
  [v11 setBounds:v14];
  id v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v11];
  v19[0] = v5;
  v19[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v17 = HKUIJoinAttributedStringsForLocale(v16);

  return v17;
}

+ (id)_attributedMultiplePrefixStringForSelectedRangeData:(id)a3 attributedString:(id)a4 font:(id)a5 foregroundColor:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v12 = a6;
  if ([v10 dataType] == 5
    && ([v10 statisticsType] == 3 || objc_msgSend(v10, "statisticsType") == 5))
  {
    id v29 = v11;
    id v30 = v10;
    double v13 = (void *)[v11 mutableCopy];
    double v14 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    [(HKSelectedRangeData *)v14 setDataType:3];
    id v15 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    [(HKSelectedRangeData *)v15 setDataType:4];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v27 = v15;
    v28 = v14;
    v40[0] = v14;
    v40[1] = v15;
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    id v33 = v13;
    uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v35)
    {
      uint64_t v32 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v18 = [a1 standardPrefixColorForSelectedRangeData:v17 defaultColor:v12];
          uint64_t v19 = [a1 _attributedStringForSelectedRangeData:v17 font:v34 foregroundColor:v12 prefixColor:v18 prefersImageAffixes:1 embedded:1];
          uint64_t v20 = [a1 _attributedStringForSelectedRangeData:v17 font:v34 foregroundColor:v12 prefixColor:v18 prefersImageAffixes:0 embedded:1];
          v21 = [v13 mutableString];
          v22 = [v20 string];
          uint64_t v23 = [v21 rangeOfString:v22];
          uint64_t v25 = v24;

          double v13 = v33;
          if (v25) {
            objc_msgSend(v33, "replaceCharactersInRange:withAttributedString:", v23, v25, v19);
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v35);
    }

    id v11 = v29;
    id v10 = v30;
  }
  else
  {
    id v33 = v11;
  }

  return v33;
}

+ (id)_stringForSelectedRangeData:(id)a3 embedded:(BOOL)a4
{
  BOOL v4 = a4;
  v49[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 titleOverride];

  if (v6)
  {
    objc_super v7 = [v5 titleOverride];
    goto LABEL_32;
  }
  if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 7)
  {
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"LEFT_AVERAGE_HEARING";
LABEL_15:
    id v11 = @"HealthUI-Localizable";
    goto LABEL_29;
  }
  if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 8)
  {
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"RIGHT_AVERAGE_HEARING";
    goto LABEL_15;
  }
  if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 9)
  {
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"IN_BED_AVERAGE";
    goto LABEL_15;
  }
  if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 10)
  {
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"ASLEEP_AVERAGE";
    goto LABEL_15;
  }
  if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 24)
  {
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"SLEEP_STAGES_ANNOTATION_AVERAGE_AWAKE";
  }
  else if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 25)
  {
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"SLEEP_STAGES_ANNOTATION_AVERAGE_CORE";
  }
  else if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 26)
  {
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"SLEEP_STAGES_ANNOTATION_AVERAGE_DEEP";
  }
  else
  {
    if ([v5 statisticsType] != 3 || objc_msgSend(v5, "dataType") != 27)
    {
      if ([v5 statisticsType] == 3 && objc_msgSend(v5, "dataType") == 5)
      {
        id v15 = NSString;
        id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        BOOL v9 = v16;
        uint64_t v17 = @"AVERAGE_INSULIN_DELIVERY";
      }
      else
      {
        if ([v5 statisticsType] != 5 || objc_msgSend(v5, "dataType") != 5)
        {
          switch([v5 statisticsType])
          {
            case 1:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"MINIMUM_ABBREVIATED";
              goto LABEL_83;
            case 2:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"MAXIMUM_ABBREVIATED";
              goto LABEL_83;
            case 3:
              v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              if (v4)
              {
                uint64_t v24 = @"AVERAGE_ABBREVIATED";
                goto LABEL_76;
              }
              uint64_t v23 = @"AVERAGE_NORMAL";
              goto LABEL_153;
            case 4:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"EXPOSURE_NORMAL";
              goto LABEL_83;
            case 5:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"TOTAL_ABBREVIATED";
              goto LABEL_83;
            case 6:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"INCREASE_ABBREVIATED";
              goto LABEL_83;
            case 7:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"DECREASE_ABBREVIATED";
              goto LABEL_83;
            case 8:
              v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              if (v4)
              {
                uint64_t v24 = @"DAILY_AVERAGE_ABBREVIATED";
                goto LABEL_76;
              }
              uint64_t v23 = @"DAILY_AVERAGE_FULL";
              goto LABEL_153;
            case 9:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"RANGE_ABBREVIATED";
              goto LABEL_83;
            case 10:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"DURATION_ABBREVIATED";
              goto LABEL_83;
            case 11:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"MOST_RECENT_ABBREVIATED";
              goto LABEL_83;
            case 12:
              v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              if (v4)
              {
                uint64_t v24 = @"MONTHLY_AVERAGE_ABBREVIATED";
                goto LABEL_76;
              }
              uint64_t v23 = @"MONTHLY_AVERAGE_FULL";
              goto LABEL_153;
            case 13:
              v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              if (v4)
              {
                uint64_t v24 = @"HOURLY_AVERAGE_ABBREVIATED";
                goto LABEL_76;
              }
              uint64_t v23 = @"HOURLY_AVERAGE_FULL";
              goto LABEL_153;
            case 14:
              v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              if (v4)
              {
                uint64_t v24 = @"MINUTE_AVERAGE_ABBREVIATED";
                goto LABEL_76;
              }
              uint64_t v23 = @"MINUTE_AVERAGE_FULL";
              goto LABEL_153;
            case 15:
              v21 = HKHealthKitFrameworkBundle();
              v22 = v21;
              uint64_t v25 = (__CFString *)*MEMORY[0x1E4F29E40];
              uint64_t v23 = @"RESTING_HEART_RATE";
              goto LABEL_84;
            case 16:
              v21 = HKHealthKitFrameworkBundle();
              v22 = v21;
              uint64_t v25 = (__CFString *)*MEMORY[0x1E4F29E40];
              uint64_t v23 = @"WALKING_HEART_RATE_AVERAGE_SHORT";
              goto LABEL_84;
            case 17:
              v21 = HKHealthKitFrameworkBundle();
              v22 = v21;
              uint64_t v25 = (__CFString *)*MEMORY[0x1E4F29E40];
              uint64_t v23 = @"WORKOUT";
              goto LABEL_84;
            case 18:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"BREATHE";
              goto LABEL_83;
            case 19:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"SLEEP";
              goto LABEL_83;
            case 20:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"SYMPTOM_TITLE";
              goto LABEL_83;
            case 21:
              v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              id v26 = [v22 localizedStringForKey:@"SCANDIUM_OVERLAY_LOW_AIR_PRESSURE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];
              id v12 = [v26 localizedUppercaseString];

              BOOL v9 = 0;
              goto LABEL_86;
            case 22:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"CARDIO_FITNESS_LEVEL_TITLE";
              goto LABEL_73;
            case 23:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"CARDIO_FITNESS_LEVEL_AVERAGE_TITLE";
LABEL_73:
              uint64_t v25 = @"HealthUI-Localizable-CardioFitness";
              goto LABEL_84;
            case 24:
              v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              if (v4)
              {
                uint64_t v24 = @"WEEKLY_AVERAGE_ABBREVIATED";
LABEL_76:
                BOOL v9 = [v22 localizedStringForKey:v24 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
              }
              else
              {
                uint64_t v23 = @"WEEKLY_AVERAGE_FULL";
LABEL_153:
                uint64_t v25 = @"HealthUI-Localizable";
                v21 = v22;
LABEL_84:
                v27 = [v21 localizedStringForKey:v23 value:&stru_1F3B9CF20 table:v25];
                BOOL v9 = [v27 localizedUppercaseString];
              }
              id v12 = 0;
LABEL_86:

LABEL_87:
              switch([v5 dataType])
              {
                case 1:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SYSTOLIC";
                  goto LABEL_113;
                case 2:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"DIASTOLIC";
                  goto LABEL_113;
                case 3:
                  int v31 = 1;
                  id v29 = HKUIStringForInsulinDeliveryReasonEmbedded(1, v4);
                  uint64_t v32 = [v29 localizedUppercaseString];
                  goto LABEL_128;
                case 4:
                  id v29 = HKUIStringForInsulinDeliveryReasonEmbedded(2, v4);
                  uint64_t v33 = [v29 localizedUppercaseString];
                  goto LABEL_146;
                case 5:
                  id v34 = NSString;
                  id v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  uint64_t v35 = [v29 localizedStringForKey:@"INSULIN_DELIVERY_REASON_COMBINED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
                  long long v36 = HKUIStringForInsulinDeliveryReasonEmbedded(1, 1);
                  long long v37 = HKUIStringForInsulinDeliveryReasonEmbedded(2, 1);
                  long long v38 = objc_msgSend(v34, "stringWithFormat:", v35, v36, v37);
                  uint64_t v32 = [v38 localizedUppercaseString];

                  id v12 = (void *)v35;
                  int v31 = 1;
                  goto LABEL_128;
                case 6:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"ACTIVE_ABBREVIATED";
                  goto LABEL_113;
                case 7:
                case 33:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"LEFT_AVERAGE_HEARING_SHORT";
                  goto LABEL_113;
                case 8:
                case 34:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"RIGHT_AVERAGE_HEARING_SHORT";
                  goto LABEL_113;
                case 9:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"IN_BED";
                  goto LABEL_113;
                case 10:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"ASLEEP";
                  goto LABEL_113;
                case 11:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"MENSTRUAL_FLOW";
                  goto LABEL_113;
                case 12:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"START_OF_CYCLE";
                  goto LABEL_113;
                case 13:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_GOAL_CONTEXT";
                  goto LABEL_110;
                case 14:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_SCHEDULE_BEDTIME";
                  goto LABEL_110;
                case 15:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_SCHEDULE_WAKETIME";
                  goto LABEL_110;
                case 16:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_START";
                  goto LABEL_110;
                case 17:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_END";
                  goto LABEL_110;
                case 18:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_IN_BED_START";
                  goto LABEL_110;
                case 19:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_IN_BED_END";
LABEL_110:
                  long long v39 = @"HealthUI-Localizable-Eucalyptus";
                  goto LABEL_126;
                case 20:
                case 21:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"GLUCOSE_BELOW_RANGE";
                  goto LABEL_113;
                case 22:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"GLUCOSE_IN_RANGE";
                  goto LABEL_113;
                case 23:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"GLUCOSE_ABOVE_RANGE";
LABEL_113:
                  long long v39 = @"HealthUI-Localizable";
                  goto LABEL_126;
                case 24:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_STAGES_ANNOTATION_AWAKE";
                  goto LABEL_118;
                case 25:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_STAGES_ANNOTATION_CORE";
                  goto LABEL_118;
                case 26:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_STAGES_ANNOTATION_DEEP";
                  goto LABEL_118;
                case 27:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"SLEEP_STAGES_ANNOTATION_REM";
LABEL_118:
                  long long v39 = @"HealthUI-Localizable-Acacia";
                  goto LABEL_126;
                case 28:
                  v40 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v40;
                  v41 = @"DOSE_EVENT_CHART_TAKEN";
                  goto LABEL_121;
                case 29:
                  v40 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v40;
                  v41 = @"DOSE_EVENT_CHART_SKIPPED";
LABEL_121:
                  uint64_t v42 = [v40 localizedStringForKey:v41 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Meds"];
                  uint64_t v32 = [v42 localizedUppercaseString];

                  int v31 = 0;
                  goto LABEL_127;
                case 30:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"STATE_OF_MIND_CHART_DAILY";
                  goto LABEL_125;
                case 31:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"STATE_OF_MIND_CHART_MOMENTARY";
                  goto LABEL_125;
                case 32:
                  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v28;
                  id v30 = @"STATE_OF_MIND_CHART_TOTAL_MOMENTARY";
LABEL_125:
                  long long v39 = @"HealthUI-Localizable-Chamomile";
LABEL_126:
                  uint64_t v42 = [v28 localizedStringForKey:v30 value:&stru_1F3B9CF20 table:v39];
                  uint64_t v32 = [v42 localizedUppercaseString];

                  int v31 = 1;
LABEL_127:
                  id v12 = v42;
                  goto LABEL_128;
                case 35:
                  v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v46;
                  v47 = @"BALANCE_CHART_BLOOD_OXYGEN";
                  goto LABEL_145;
                case 36:
                  v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v46;
                  v47 = @"BALANCE_CHART_HEART_RATE";
                  goto LABEL_145;
                case 37:
                  v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v46;
                  v47 = @"BALANCE_CHART_RESPIRATORY_RATE";
                  goto LABEL_145;
                case 38:
                  v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v46;
                  v47 = @"BALANCE_CHART_TIME_ASLEEP";
                  goto LABEL_145;
                case 39:
                  v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  id v29 = v46;
                  v47 = @"BALANCE_CHART_WRIST_TEMPERATURE";
LABEL_145:
                  uint64_t v33 = [v46 localizedStringForKey:v47 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Balance"];
LABEL_146:
                  uint64_t v32 = v33;
                  int v31 = 1;
LABEL_128:

                  id v12 = (void *)v32;
                  break;
                default:
                  int v31 = 1;
                  break;
              }
              if (v9 && v12)
              {
                if (v31)
                {
                  v49[0] = v12;
                  v43 = (void **)v49;
                  v44 = v9;
                }
                else
                {
                  v48 = v9;
                  v43 = &v48;
                  v44 = v12;
                }
                v43[1] = @" ";
                v43[2] = v44;
                uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
                objc_super v7 = HKUIJoinStringsForLocale(v18);
                goto LABEL_139;
              }
              if (v9) {
                v45 = v9;
              }
              else {
                v45 = v12;
              }
              id v13 = v45;
              break;
            case 25:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"LEVEL_TITLE";
              goto LABEL_83;
            case 26:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"LEVEL_RANGE_TITLE";
              goto LABEL_83;
            case 27:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"LEVEL_AVERAGE_TITLE";
              goto LABEL_83;
            case 28:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"LEVEL_MOST_FREQUENT_TITLE";
              goto LABEL_83;
            case 29:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"MAXIMUM_DEPTH";
              uint64_t v25 = @"HealthUI-Localizable-Charon";
              goto LABEL_84;
            case 30:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"STATE_MOST_FREQUENT_TITLE";
LABEL_83:
              uint64_t v25 = @"HealthUI-Localizable";
              goto LABEL_84;
            case 31:
              v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v22 = v21;
              uint64_t v23 = @"SLEEP_BREATHING_DISTURBANCES_LEVEL_TITLE";
              uint64_t v25 = @"HealthUI-Localizable-Nebula";
              goto LABEL_84;
            default:
              BOOL v9 = 0;
              id v12 = 0;
              goto LABEL_87;
          }
          goto LABEL_30;
        }
        id v15 = NSString;
        id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        BOOL v9 = v16;
        uint64_t v17 = @"TOTAL_INSULIN_DELIVERY";
      }
      id v12 = [v16 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      uint64_t v18 = HKUIStringForInsulinDeliveryReasonEmbedded(1, 1);
      uint64_t v19 = HKUIStringForInsulinDeliveryReasonEmbedded(2, 1);
      uint64_t v20 = objc_msgSend(v15, "stringWithFormat:", v12, v18, v19);
      objc_super v7 = [v20 localizedUppercaseString];

LABEL_139:
      goto LABEL_31;
    }
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = v8;
    id v10 = @"SLEEP_STAGES_ANNOTATION_AVERAGE_REM";
  }
  id v11 = @"HealthUI-Localizable-Acacia";
LABEL_29:
  id v12 = [v8 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:v11];
  id v13 = [v12 localizedUppercaseString];
LABEL_30:
  objc_super v7 = v13;
LABEL_31:

LABEL_32:
  return v7;
}

+ (id)standardPrefixColorForSelectedRangeData:(id)a3 defaultColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [v5 prefixColor];

  BOOL v8 = v6;
  if (v7)
  {
    BOOL v8 = [v5 prefixColor];
  }
  switch([v5 dataType])
  {
    case 1:
    case 20:
    case 21:
    case 22:
    case 23:
      uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
      break;
    case 2:
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsKeyColor");
      break;
    case 3:
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_insulinBasalKeyColor");
      break;
    case 4:
      uint64_t v9 = HKHealthKeyColor();
      break;
    case 9:
      if (v7) {
        goto LABEL_16;
      }
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInBedColor");
      break;
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      if (v7) {
        goto LABEL_16;
      }
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
      break;
    case 11:
    case 12:
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_reproductiveHealthKeyColor");
      break;
    case 28:
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_medicationDoseEventTakenColor");
      break;
    case 29:
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_medicationDoseEventSkippedColor");
      break;
    default:
      goto LABEL_16;
  }
  id v10 = (void *)v9;

  BOOL v8 = v10;
LABEL_16:

  return v8;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end