@interface HKCorrelationType
- (HKCorrelationType)initWithIdentifier:(id)a3;
@end

@implementation HKCorrelationType

- (HKCorrelationType)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[HKObjectType correlationTypeForIdentifier:v4];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid %@ identifier \"%@\"", objc_opt_class(), v4 format];
  }

  return v5;
}

@end