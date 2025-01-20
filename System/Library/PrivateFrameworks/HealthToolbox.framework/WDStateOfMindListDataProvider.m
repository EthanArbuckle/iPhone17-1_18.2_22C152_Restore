@interface WDStateOfMindListDataProvider
- (id)sampleTypes;
- (id)textForObject:(id)a3;
@end

@implementation WDStateOfMindListDataProvider

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
  uint64_t v3 = [a3 valenceClassification];

  return (id)MEMORY[0x270F38370](v3);
}

@end