@interface NSDateComponents(Additions)
+ (id)hf_biweeklyIntervalComponents;
+ (id)hf_componentsWithHour:()Additions minute:;
+ (id)hf_dailyIntervalComponents;
+ (id)hf_dailyWeekdayIntervalComponents;
+ (id)hf_dailyWeekdayIntervalComponentsWithCalendar:()Additions;
+ (id)hf_monthlyIntervalComponents;
+ (id)hf_weeklyIntervalComponents;
+ (id)hf_yearlyIntervalComponents;
+ (id)hf_zeroDateComponentsWithComponents:()Additions calendar:;
+ (uint64_t)_hf_allPossibleComponents;
- (double)hf_timeInterval;
- (id)hf_absoluteValue;
- (id)hf_negativeValue;
- (uint64_t)hf_compareNextMatchingDate:()Additions;
- (uint64_t)hf_compareNextMatchingDate:()Additions withCalendar:;
- (uint64_t)hf_isEqualToHomeKitRecurrence:()Additions;
- (uint64_t)hf_validComponents;
@end

@implementation NSDateComponents(Additions)

+ (id)hf_dailyWeekdayIntervalComponents
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2EE38 != -1) {
    dispatch_once(&qword_26AB2EE38, block);
  }
  v1 = (void *)_MergedGlobals_230;
  return v1;
}

+ (id)hf_dailyWeekdayIntervalComponentsWithCalendar:()Additions
{
  id v3 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 1;
  v4 = (void *)MEMORY[0x263EFF8C0];
  v5 = [v3 weekdaySymbols];
  uint64_t v6 = [v5 count];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponentsWithCalendar___block_invoke;
  v9[3] = &unk_26408F9B8;
  v9[4] = v10;
  v7 = objc_msgSend(v4, "na_arrayByRepeatingWithCount:generatorBlock:", v6, v9);

  _Block_object_dispose(v10, 8);
  return v7;
}

+ (id)hf_dailyIntervalComponents
{
  if (qword_26AB2EE48 != -1) {
    dispatch_once(&qword_26AB2EE48, &__block_literal_global_36);
  }
  v0 = (void *)qword_26AB2EE40;
  return v0;
}

+ (id)hf_weeklyIntervalComponents
{
  if (qword_26AB2EE58 != -1) {
    dispatch_once(&qword_26AB2EE58, &__block_literal_global_5_0);
  }
  v0 = (void *)qword_26AB2EE50;
  return v0;
}

+ (id)hf_biweeklyIntervalComponents
{
  if (qword_26AB2EE68 != -1) {
    dispatch_once(&qword_26AB2EE68, &__block_literal_global_7);
  }
  v0 = (void *)qword_26AB2EE60;
  return v0;
}

+ (id)hf_monthlyIntervalComponents
{
  if (qword_26AB2EE78 != -1) {
    dispatch_once(&qword_26AB2EE78, &__block_literal_global_9_0);
  }
  v0 = (void *)qword_26AB2EE70;
  return v0;
}

+ (id)hf_yearlyIntervalComponents
{
  if (qword_26AB2EE88 != -1) {
    dispatch_once(&qword_26AB2EE88, &__block_literal_global_11_0);
  }
  v0 = (void *)qword_26AB2EE80;
  return v0;
}

+ (id)hf_componentsWithHour:()Additions minute:
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v6 setHour:a3];
  [v6 setMinute:a4];
  return v6;
}

- (uint64_t)hf_isEqualToHomeKitRecurrence:()Additions
{
  id v4 = a3;
  if (a1 != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    if (([a1 isEqual:v4] & 1) == 0)
    {
      id v6 = (void *)[a1 copy];
      [v6 setNanosecond:0x7FFFFFFFFFFFFFFFLL];
      [v6 setSecond:0x7FFFFFFFFFFFFFFFLL];
      v7 = (void *)[v4 copy];
      [v7 setNanosecond:0x7FFFFFFFFFFFFFFFLL];
      [v7 setSecond:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v5 = [v6 isEqual:v7];

      goto LABEL_7;
    }
  }
  uint64_t v5 = 1;
LABEL_7:

  return v5;
}

- (double)hf_timeInterval
{
  v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
  id v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [v3 dateByAddingComponents:a1 toDate:v2 options:0];

  [v4 timeIntervalSinceDate:v2];
  double v6 = v5;

  return v6;
}

- (id)hf_absoluteValue
{
  v2 = (void *)[a1 copy];
  int8x8_t v3 = (int8x8_t)objc_msgSend(a1, "hf_validComponents");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v12 = __47__NSDateComponents_Additions__hf_absoluteValue__block_invoke;
  v13 = &unk_26408F9E0;
  id v4 = v2;
  id v14 = v4;
  v15 = a1;
  double v5 = v11;
  if (v3)
  {
    char v16 = 0;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v3);
    v6.i16[0] = vaddlv_u8(v6);
    int v7 = v6.i32[0];
    if (v6.i32[0])
    {
      unsigned int v8 = 0;
      do
      {
        if ((*(void *)&v3 & (1 << v8)) != 0)
        {
          ((void (*)(void *))v12)(v5);
          if (v16) {
            break;
          }
          --v7;
        }
        if (v8 > 0x3E) {
          break;
        }
        ++v8;
      }
      while (v7 > 0);
    }
  }

  id v9 = v4;
  return v9;
}

- (id)hf_negativeValue
{
  v2 = (void *)[a1 copy];
  int8x8_t v3 = (int8x8_t)objc_msgSend(a1, "hf_validComponents");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v12 = __47__NSDateComponents_Additions__hf_negativeValue__block_invoke;
  v13 = &unk_26408F9E0;
  id v4 = v2;
  id v14 = v4;
  v15 = a1;
  double v5 = v11;
  if (v3)
  {
    char v16 = 0;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v3);
    v6.i16[0] = vaddlv_u8(v6);
    int v7 = v6.i32[0];
    if (v6.i32[0])
    {
      unsigned int v8 = 0;
      do
      {
        if ((*(void *)&v3 & (1 << v8)) != 0)
        {
          ((void (*)(void *))v12)(v5);
          if (v16) {
            break;
          }
          --v7;
        }
        if (v8 > 0x3E) {
          break;
        }
        ++v8;
      }
      while (v7 > 0);
    }
  }

  id v9 = v4;
  return v9;
}

- (uint64_t)hf_compareNextMatchingDate:()Additions
{
  id v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  uint8x8_t v6 = [v4 currentCalendar];
  uint64_t v7 = objc_msgSend(a1, "hf_compareNextMatchingDate:withCalendar:", v5, v6);

  return v7;
}

- (uint64_t)hf_compareNextMatchingDate:()Additions withCalendar:
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = objc_msgSend((id)objc_opt_class(), "hf_zeroDateComponentsWithComponents:calendar:", objc_msgSend(v7, "hf_validComponents") | objc_msgSend(a1, "hf_validComponents"), v6);
  id v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
  v10 = [v6 nextDateAfterDate:v9 matchingComponents:v8 options:1024];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__NSDateComponents_Additions__hf_compareNextMatchingDate_withCalendar___block_invoke;
  aBlock[3] = &unk_26408FA08;
  id v11 = v8;
  id v22 = v11;
  id v12 = v10;
  id v23 = v12;
  id v13 = v6;
  id v24 = v13;
  id v14 = (void (**)(void *, void *))_Block_copy(aBlock);
  v15 = v14[2](v14, a1);
  char v16 = v14[2](v14, v7);

  v17 = v15;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_7:
    v20 = [MEMORY[0x263EFF910] distantFuture];
    uint64_t v18 = [v17 compare:v20];

    if (v15) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v17 = [MEMORY[0x263EFF910] distantFuture];
  if (!v16) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v18 = [v17 compare:v16];
  if (!v15) {
LABEL_4:
  }

LABEL_5:
  return v18;
}

+ (id)hf_zeroDateComponentsWithComponents:()Additions calendar:
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v17 = __76__NSDateComponents_Additions__hf_zeroDateComponentsWithComponents_calendar___block_invoke;
  uint64_t v18 = &unk_26408F9E0;
  id v7 = v6;
  id v19 = v7;
  id v8 = v5;
  id v20 = v8;
  id v9 = v16;
  if (a3)
  {
    char v21 = 0;
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v10.i16[0] = vaddlv_u8(v10);
    int v11 = v10.i32[0];
    if (v10.i32[0])
    {
      unsigned int v12 = 0;
      do
      {
        if (((1 << v12) & a3) != 0)
        {
          ((void (*)(void *))v17)(v9);
          if (v21) {
            break;
          }
          --v11;
        }
        if (v12 > 0x3E) {
          break;
        }
        ++v12;
      }
      while (v11 > 0);
    }
  }

  id v13 = v20;
  id v14 = v7;

  return v14;
}

+ (uint64_t)_hf_allPossibleComponents
{
  return 65278;
}

- (uint64_t)hf_validComponents
{
  int8x8_t v2 = (int8x8_t)objc_msgSend((id)objc_opt_class(), "_hf_allPossibleComponents");
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  uint8x8_t v10 = __49__NSDateComponents_Additions__hf_validComponents__block_invoke;
  int v11 = &unk_26408FA30;
  uint64_t v12 = a1;
  id v13 = &v14;
  int8x8_t v3 = v9;
  if (v2)
  {
    char v18 = 0;
    uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
    v4.i16[0] = vaddlv_u8(v4);
    int v5 = v4.i32[0];
    if (v4.i32[0])
    {
      unsigned int v6 = 0;
      do
      {
        if ((*(void *)&v2 & (1 << v6)) != 0)
        {
          ((void (*)(void *))v10)(v3);
          if (v18) {
            break;
          }
          --v5;
        }
        if (v6 > 0x3E) {
          break;
        }
        ++v6;
      }
      while (v5 > 0);
    }
  }

  uint64_t v7 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v7;
}

@end