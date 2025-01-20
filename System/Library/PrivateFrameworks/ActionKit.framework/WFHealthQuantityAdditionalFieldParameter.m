@interface WFHealthQuantityAdditionalFieldParameter
- (BOOL)isHidden;
- (id)localizedLabelWithContext:(id)a3;
@end

@implementation WFHealthQuantityAdditionalFieldParameter

- (BOOL)isHidden
{
  v2 = [(WFHealthQuantityFieldParameter *)self quantityType];
  v3 = [v2 identifier];
  if ([v3 isEqualToString:*MEMORY[0x263F09C28]])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [v2 identifier];
    char v6 = [v5 isEqualToString:*MEMORY[0x263F09C20]];

    char v4 = v6 ^ 1;
  }

  return v4;
}

- (id)localizedLabelWithContext:(id)a3
{
  id v3 = a3;
  char v4 = WFLocalizedStringResourceWithKey(@"Diastolic", @"Diastolic");
  v5 = [v3 localize:v4];

  return v5;
}

@end