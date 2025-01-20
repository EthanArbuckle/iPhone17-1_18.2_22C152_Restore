@interface WFHealthActionStartDateFieldParameter
- (HKSampleType)sampleType;
- (id)localizedLabel;
- (void)setSampleType:(id)a3;
@end

@implementation WFHealthActionStartDateFieldParameter

- (void).cxx_destruct
{
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (id)localizedLabel
{
  v2 = [(WFHealthActionStartDateFieldParameter *)self sampleType];
  v3 = [v2 identifier];

  if (([v3 isEqualToString:*MEMORY[0x263F09410]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F09388]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F09DF8]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x263F09E28]])
  {
    v4 = @"Start Date";
  }
  else
  {
    v4 = @"Date";
  }
  v5 = WFLocalizedString(v4);

  return v5;
}

- (void)setSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_sampleType, a3);
  [(WFHealthActionStartDateFieldParameter *)self attributesDidChange];
}

@end