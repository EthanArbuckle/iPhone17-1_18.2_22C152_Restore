@interface HKLastUpdatedTimeDataProviderCurrentValue
- (NSDate)date;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (id)lastUpdatedDescriptionWithDateCache:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation HKLastUpdatedTimeDataProviderCurrentValue

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = [(HKLastUpdatedTimeDataProviderCurrentValue *)self date];
  v10 = HKLocalizedStringForDateAndTemplate(v9, 27);

  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  v16[0] = v8;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  v13 = (void *)[v11 initWithString:v10 attributes:v12];
  return v13;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4 = a3;
  v5 = [(HKLastUpdatedTimeDataProviderCurrentValue *)self date];
  v6 = HKLastUpdatedText(v5, v4);

  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end