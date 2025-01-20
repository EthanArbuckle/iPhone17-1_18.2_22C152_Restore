@interface WFHKGroupingIndexPathTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (NSCalendar)conversionCalendar;
- (WFHKGroupingIndexPathTransformer)init;
- (WFHKGroupingIndexPathTransformer)initWithGroupingOption:(int64_t)a3;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
- (int64_t)groupingOption;
- (void)setConversionCalendar:(id)a3;
- (void)setGroupingOption:(int64_t)a3;
@end

@implementation WFHKGroupingIndexPathTransformer

- (void).cxx_destruct
{
}

- (void)setConversionCalendar:(id)a3
{
}

- (NSCalendar)conversionCalendar
{
  return self->_conversionCalendar;
}

- (void)setGroupingOption:(int64_t)a3
{
  self->_groupingOption = a3;
}

- (int64_t)groupingOption
{
  return self->_groupingOption;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
    switch([(WFHKGroupingIndexPathTransformer *)self groupingOption])
    {
      case 1:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        objc_msgSend(v6, "setDay:", objc_msgSend(v5, "indexAtPosition:", 2));
        objc_msgSend(v6, "setHour:", objc_msgSend(v5, "indexAtPosition:", 3));
        objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "indexAtPosition:", 4));
        goto LABEL_13;
      case 2:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        objc_msgSend(v6, "setDay:", objc_msgSend(v5, "indexAtPosition:", 2));
        objc_msgSend(v6, "setHour:", objc_msgSend(v5, "indexAtPosition:", 3));
        goto LABEL_13;
      case 3:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        uint64_t v8 = [v5 indexAtPosition:2];
        v9 = v6;
        goto LABEL_10;
      case 4:
        objc_msgSend(v6, "setYearForWeekOfYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v5, "indexAtPosition:", 1));
        [v6 setWeekday:1];
        goto LABEL_13;
      case 5:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "indexAtPosition:", 1));
        v9 = v6;
        uint64_t v8 = 1;
LABEL_10:
        [v9 setDay:v8];
        goto LABEL_13;
      case 6:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
        objc_msgSend(v6, "setMonth:", 3 * objc_msgSend(v5, "indexAtPosition:", 1) - 2);
        goto LABEL_13;
      case 7:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "indexAtPosition:", 0));
LABEL_13:
        v10 = [(WFHKGroupingIndexPathTransformer *)self conversionCalendar];
        v7 = [v10 dateFromComponents:v6];

        break;
      default:
        v7 = 0;
        break;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)transformedValue:(id)a3
{
  v25[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(WFHKGroupingIndexPathTransformer *)self conversionCalendar];
    v7 = [v6 components:24700 fromDate:v5];

    switch([(WFHKGroupingIndexPathTransformer *)self groupingOption])
    {
      case 1:
        uint64_t v8 = (void *)MEMORY[0x263F088C8];
        v25[0] = [v7 year];
        v25[1] = [v7 month];
        v25[2] = [v7 day];
        v25[3] = [v7 hour];
        v25[4] = [v7 minute];
        v9 = v25;
        v10 = v8;
        uint64_t v11 = 5;
        goto LABEL_13;
      case 2:
        v15 = (void *)MEMORY[0x263F088C8];
        v24[0] = [v7 year];
        v24[1] = [v7 month];
        v24[2] = [v7 day];
        v24[3] = [v7 hour];
        v9 = v24;
        v10 = v15;
        uint64_t v11 = 4;
        goto LABEL_13;
      case 3:
        v13 = (void *)MEMORY[0x263F088C8];
        v23[0] = [v7 year];
        v23[1] = [v7 month];
        v23[2] = [v7 day];
        v9 = v23;
        v10 = v13;
        uint64_t v11 = 3;
        goto LABEL_13;
      case 4:
        v14 = (void *)MEMORY[0x263F088C8];
        v22[0] = [v7 yearForWeekOfYear];
        v22[1] = [v7 weekOfYear];
        v9 = v22;
        goto LABEL_11;
      case 5:
        v14 = (void *)MEMORY[0x263F088C8];
        v21[0] = [v7 year];
        v21[1] = [v7 month];
        v9 = v21;
        goto LABEL_11;
      case 6:
        v14 = (void *)MEMORY[0x263F088C8];
        v20[0] = [v7 year];
        float v16 = (double)[v7 month] / 3.0;
        v20[1] = vcvtps_u32_f32(v16);
        v9 = v20;
LABEL_11:
        v10 = v14;
        uint64_t v11 = 2;
        goto LABEL_13;
      case 7:
        v17 = (void *)MEMORY[0x263F088C8];
        uint64_t v19 = [v7 year];
        v9 = &v19;
        v10 = v17;
        uint64_t v11 = 1;
LABEL_13:
        v12 = objc_msgSend(v10, "indexPathWithIndexes:length:", v9, v11, v19);
        break;
      default:
        v12 = 0;
        break;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFHKGroupingIndexPathTransformer)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFHKGroupingIndexPathTransformer;
  v2 = [(WFHKGroupingIndexPathTransformer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    conversionCalendar = v2->_conversionCalendar;
    v2->_conversionCalendar = (NSCalendar *)v3;

    id v5 = v2;
  }

  return v2;
}

- (WFHKGroupingIndexPathTransformer)initWithGroupingOption:(int64_t)a3
{
  id v4 = [(WFHKGroupingIndexPathTransformer *)self init];
  id v5 = v4;
  if (v4)
  {
    v4->_groupingOption = a3;
    id v6 = v4;
  }

  return v5;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end