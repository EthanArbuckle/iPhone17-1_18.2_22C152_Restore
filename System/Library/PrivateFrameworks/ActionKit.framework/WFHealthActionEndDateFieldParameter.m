@interface WFHealthActionEndDateFieldParameter
- (BOOL)isHidden;
- (HKSampleType)sampleType;
- (void)setSampleType:(id)a3;
@end

@implementation WFHealthActionEndDateFieldParameter

- (void).cxx_destruct
{
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (BOOL)isHidden
{
  v2 = [(WFHealthActionEndDateFieldParameter *)self sampleType];
  v3 = [v2 identifier];

  if (([v3 isEqualToString:*MEMORY[0x263F09410]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F09388]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F09DF8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F09E28]] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:*MEMORY[0x263F09430]] ^ 1;
  }

  return v4;
}

- (void)setSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_sampleType, a3);
  [(WFHealthActionEndDateFieldParameter *)self attributesDidChange];
}

@end