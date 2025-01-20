@interface HFTimeCondition
+ (id)_formattedStringForDateComponentsCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5;
+ (id)_formattedStringForOffset:(id)a3;
+ (id)_formattedStringForSunriseSunsetCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5;
+ (id)_formattedStringForTimeCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5;
+ (id)_formattedStringForTimeRangeCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5;
+ (id)_nameForConditionType:(unint64_t)a3 formattingStyle:(int64_t)a4 formattingContext:(int64_t)a5;
+ (id)defaultConditionForType:(unint64_t)a3;
+ (id)hf_naturalLanguageSummaryForTypeOnlyWithOptions:(id)a3;
- (id)hf_naturalLanguageSummaryWithOptions:(id)a3;
- (unint64_t)timeConditionType;
@end

@implementation HFTimeCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 3)
  {
    BOOL v5 = 0;
    goto LABEL_3;
  }
  if ([v4 type] == 2)
  {
    char v8 = 0;
    BOOL v9 = 0;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_class(), "defaultConditionForType:", objc_msgSend(v4, "type"));
    BOOL v9 = [(HFCondition *)self isEqual:v10];
    char v8 = [v4 formattingStyle] != 3 || v9;
  }
  uint64_t v11 = [v4 timeContext];
  if (!v11)
  {
    if ((v8 & 1) == 0)
    {
      BOOL v5 = [v4 formattingStyle] != 3;
LABEL_3:
      v6 = objc_msgSend((id)objc_opt_class(), "_formattedStringForTimeCondition:style:formattingContext:", self, v5, objc_msgSend(v4, "formattingContext"));
      v7 = 0;
      if (v6) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v11 != 1 || v9)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  v7 = objc_msgSend((id)objc_opt_class(), "_formattedStringForTimeCondition:style:formattingContext:", self, 1, objc_msgSend(v4, "formattingContext"));
LABEL_17:
  v6 = objc_msgSend((id)objc_opt_class(), "_nameForConditionType:formattingStyle:formattingContext:", objc_msgSend(v4, "type"), objc_msgSend(v4, "formattingStyle"), objc_msgSend(v4, "formattingContext"));
LABEL_18:
  if ([v4 formattingContext] != 5)
  {
    uint64_t v12 = objc_msgSend(v6, "hf_stringByCapitalizingFirstWord");

    uint64_t v13 = objc_msgSend(v7, "hf_stringByCapitalizingFirstWord");

    v7 = (void *)v13;
    v6 = (void *)v12;
  }
  v14 = [[HFConditionUISummary alloc] initWithCondition:self title:v6 description:v7];

  return v14;
}

+ (id)hf_naturalLanguageSummaryForTypeOnlyWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend((id)objc_opt_class(), "_nameForConditionType:formattingStyle:formattingContext:", objc_msgSend(v3, "type"), objc_msgSend(v3, "formattingStyle"), objc_msgSend(v3, "formattingContext"));
  uint64_t v5 = [v3 formattingContext];

  if (v5 != 5)
  {
    uint64_t v6 = objc_msgSend(v4, "hf_stringByCapitalizingFirstWord");

    id v4 = (void *)v6;
  }
  v7 = [[HFConditionUISummary alloc] initWithCondition:0 title:v4 description:0];

  return v7;
}

+ (id)_nameForConditionType:(unint64_t)a3 formattingStyle:(int64_t)a4 formattingContext:(int64_t)a5
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __92__HFTimeCondition_NaturalLanguage___nameForConditionType_formattingStyle_formattingContext___block_invoke;
  v11[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v11[4] = a3;
  uint64_t v6 = __92__HFTimeCondition_NaturalLanguage___nameForConditionType_formattingStyle_formattingContext___block_invoke((uint64_t)v11);
  v7 = v6;
  if (a4 != 3)
  {
    uint64_t v8 = [v6 stringByAppendingString:@"_Short"];

    v7 = (void *)v8;
  }
  BOOL v9 = _HFLocalizedStringWithDefaultValue(v7, v7, 1);

  return v9;
}

__CFString *__92__HFTimeCondition_NaturalLanguage___nameForConditionType_formattingStyle_formattingContext___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 < 4) {
    return off_26408E8C0[v1];
  }
  NSLog(&cfstr_UnknownTypeD.isa, *(void *)(a1 + 32));
  return 0;
}

+ (id)_formattedStringForTimeRangeCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 startCondition];
  BOOL v9 = [a1 _formattedStringForTimeCondition:v8 style:1 formattingContext:5];

  v10 = [v7 endCondition];

  uint64_t v11 = [a1 _formattedStringForTimeCondition:v10 style:1 formattingContext:5];

  v18 = @"HFConditionDescriptionTimeRangeFormat";
  if (a4 != 1) {
    v18 = 0;
  }
  if (a4) {
    v19 = v18;
  }
  else {
    v19 = @"HFConditionNameTimeRangeFormat";
  }
  v20 = HFLocalizedStringWithFormat(v19, @"%1$@ %2$@", v12, v13, v14, v15, v16, v17, (uint64_t)v9);

  return v20;
}

__CFString *__98__HFTimeCondition_NaturalLanguage___formattedStringForTimeRangeCondition_style_formattingContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = @"HFConditionDescriptionTimeRangeFormat";
  if (v1 != 1) {
    v2 = 0;
  }
  if (v1) {
    return v2;
  }
  else {
    return @"HFConditionNameTimeRangeFormat";
  }
}

+ (id)_formattedStringForTimeCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [a1 _formattedStringForTimeRangeCondition:v8 style:a4 formattingContext:a5];
LABEL_7:
    v10 = (void *)v9;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [a1 _formattedStringForDateComponentsCondition:v8 style:a4 formattingContext:a5];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [a1 _formattedStringForSunriseSunsetCondition:v8 style:a4 formattingContext:a5];
    goto LABEL_7;
  }
  NSLog(&cfstr_UnknownTimeCon.isa, v8);
  v10 = 0;
LABEL_8:

  return v10;
}

+ (id)_formattedStringForDateComponentsCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v6 = a3;
  id v7 = [v6 dateComponents];

  if (v7)
  {
    id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v9 = [v6 dateComponents];
    v10 = [v8 dateFromComponents:v9];

    uint64_t v11 = [MEMORY[0x263F08790] localizedStringFromDate:v10 dateStyle:0 timeStyle:1];
    uint64_t v12 = v11;
    if (a4 == 1)
    {
      id v13 = v11;
    }
    else
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      id v25 = v6;
      unint64_t v14 = [v25 comparisonType];
      if (v14 > 2) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = off_26408E8E0[v14];
      }
      uint64_t v16 = [NSString stringWithFormat:@"HFConditionNameDate%@", v15, v24, 3221225472, __103__HFTimeCondition_NaturalLanguage___formattedStringForDateComponentsCondition_style_formattingContext___block_invoke, &unk_26408D648];
      HFLocalizedStringWithFormat(v16, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

__CFString *__103__HFTimeCondition_NaturalLanguage___formattedStringForDateComponentsCondition_style_formattingContext___block_invoke(uint64_t a1)
{
  unint64_t v1 = [*(id *)(a1 + 32) comparisonType];
  if (v1 > 2) {
    return 0;
  }
  else {
    return off_26408E8E0[v1];
  }
}

+ (id)_formattedStringForSunriseSunsetCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v8 = a3;
  v38[1] = (id)MEMORY[0x263EF8330];
  v38[2] = (id)3221225472;
  v38[3] = __102__HFTimeCondition_NaturalLanguage___formattedStringForSunriseSunsetCondition_style_formattingContext___block_invoke;
  v38[4] = &__block_descriptor_40_e15___NSString_8__0l;
  v38[5] = (id)a4;
  uint64_t v9 = @"HFConditionDescription";
  if (a4 != 1) {
    uint64_t v9 = 0;
  }
  if (!a4) {
    uint64_t v9 = @"HFConditionName";
  }
  v10 = (objc_class *)MEMORY[0x263F089D8];
  uint64_t v11 = v9;
  uint64_t v12 = (void *)[[v10 alloc] initWithString:v11];

  if (a4 != 1)
  {
    uint64_t v13 = [v8 comparisonType];
    if (v13)
    {
      if (v13 != 2) {
        goto LABEL_23;
      }
      unint64_t v14 = @"After";
    }
    else
    {
      unint64_t v14 = @"Before";
    }
    [v12 appendString:v14];
  }
  uint64_t v15 = [v8 significantEvent];
  char v16 = [v15 isEqualToString:*MEMORY[0x263F0D8F8]];

  if (v16)
  {
    uint64_t v17 = @"Sunrise";
    goto LABEL_15;
  }
  uint64_t v18 = [v8 significantEvent];
  int v19 = [v18 isEqualToString:*MEMORY[0x263F0D908]];

  if (!v19)
  {
LABEL_23:
    v33 = 0;
    goto LABEL_30;
  }
  uint64_t v17 = @"Sunset";
LABEL_15:
  [v12 appendString:v17];
  uint64_t v20 = [v8 offset];
  if (!v20
    || (uint64_t v21 = (void *)v20,
        [v8 offset],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v22, "hf_timeInterval"),
        double v24 = v23,
        v22,
        v21,
        v24 == 0.0))
  {
    v31 = 0;
  }
  else
  {
    id v25 = [v8 offset];
    objc_msgSend(v25, "hf_timeInterval");
    double v27 = v26;

    v28 = [v8 offset];
    v29 = v28;
    if (a4 == 1)
    {
      uint64_t v30 = objc_msgSend(v28, "hf_absoluteValue");

      v29 = (void *)v30;
    }
    v31 = [a1 _formattedStringForOffset:v29];
    if (v27 < 0.0) {
      v32 = @"WithNegativeOffset";
    }
    else {
      v32 = @"WithPositiveOffset";
    }
    [v12 appendString:v32];
  }
  v34 = _HFLocalizedStringWithDefaultValue(v12, 0, 0);
  if (!v34) {
    NSLog(&cfstr_NoLocalizedStr.isa, v12);
  }
  v38[0] = 0;
  v33 = [NSString stringWithValidatedFormat:v34, @"%@", v38, v31 validFormatSpecifiers error];
  id v35 = v38[0];
  if (!v33)
  {
    v36 = NSStringFromSelector(a2);
    NSLog(&cfstr_CouldnTLocaliz.isa, v36, v35);
  }
LABEL_30:

  return v33;
}

__CFString *__102__HFTimeCondition_NaturalLanguage___formattedStringForSunriseSunsetCondition_style_formattingContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = @"HFConditionDescription";
  if (v1 != 1) {
    v2 = 0;
  }
  if (v1) {
    return v2;
  }
  else {
    return @"HFConditionName";
  }
}

+ (id)_formattedStringForOffset:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08780];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setUnitsStyle:2];
  [v5 setAllowedUnits:96];
  id v6 = [v5 stringFromDateComponents:v4];

  return v6;
}

- (unint64_t)timeConditionType
{
  return 3;
}

+ (id)defaultConditionForType:(unint64_t)a3
{
  if (a3 - 2 < 2)
  {
    objc_msgSend(MEMORY[0x263EFF918], "hf_componentsWithHour:minute:", 9, 0);
    id v4 = (HFSunriseSunsetCondition *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x263EFF918], "hf_componentsWithHour:minute:", 17, 0);
    id v7 = (HFSunriseSunsetCondition *)objc_claimAutoreleasedReturnValue();
    id v8 = [[HFDateComponentsCondition alloc] initWithDateComponents:v4 comparisonType:2];
    uint64_t v9 = [[HFDateComponentsCondition alloc] initWithDateComponents:v7 comparisonType:0];
    v10 = [[HFTimeRangeCondition alloc] initWithStartCondition:v8 endCondition:v9];

LABEL_8:
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    uint64_t v11 = [HFSunriseSunsetCondition alloc];
    id v4 = [(HFSunriseSunsetCondition *)v11 initWithSignificantEvent:*MEMORY[0x263F0D908] comparisonType:2];
    id v5 = [HFSunriseSunsetCondition alloc];
    id v6 = (void *)MEMORY[0x263F0D8F8];
    goto LABEL_7;
  }
  if (!a3)
  {
    id v3 = [HFSunriseSunsetCondition alloc];
    id v4 = [(HFSunriseSunsetCondition *)v3 initWithSignificantEvent:*MEMORY[0x263F0D8F8] comparisonType:2];
    id v5 = [HFSunriseSunsetCondition alloc];
    id v6 = (void *)MEMORY[0x263F0D908];
LABEL_7:
    id v7 = [(HFSunriseSunsetCondition *)v5 initWithSignificantEvent:*v6 comparisonType:0];
    v10 = [[HFTimeRangeCondition alloc] initWithStartCondition:v4 endCondition:v7];
    goto LABEL_8;
  }
  NSLog(&cfstr_UnknownConditi.isa, a2, a3);
  v10 = 0;
LABEL_10:
  return v10;
}

@end