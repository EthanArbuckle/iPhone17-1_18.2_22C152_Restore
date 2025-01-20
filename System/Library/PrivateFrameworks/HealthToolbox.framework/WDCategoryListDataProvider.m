@interface WDCategoryListDataProvider
- (id)sampleTypes;
- (id)textForObject:(id)a3;
@end

@implementation WDCategoryListDataProvider

- (id)sampleTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(WDSampleListDataProvider *)self displayType];
  v3 = [v2 sampleType];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)textForObject:(id)a3
{
  id v4 = a3;
  v5 = [(WDSampleListDataProvider *)self displayType];
  v6 = objc_msgSend(v5, "hk_enumeratedValueLabels");

  v7 = NSNumber;
  uint64_t v8 = [v4 value];

  v9 = [v7 numberWithInteger:v8];
  v10 = [v6 objectForKeyedSubscript:v9];

  return v10;
}

@end