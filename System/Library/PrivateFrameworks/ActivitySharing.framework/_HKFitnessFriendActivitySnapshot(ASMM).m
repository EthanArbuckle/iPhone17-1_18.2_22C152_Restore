@interface _HKFitnessFriendActivitySnapshot(ASMM)
- (BOOL)isAmm;
- (id)mmgQuantity;
- (id)mmvQuantity;
- (void)mmPercent;
@end

@implementation _HKFitnessFriendActivitySnapshot(ASMM)

- (BOOL)isAmm
{
  return [a1 amm] == 2;
}

- (id)mmvQuantity
{
  v2 = (void *)MEMORY[0x263F0A630];
  v3 = [MEMORY[0x263F0A830] minuteUnit];
  [a1 mmv];
  v4 = objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3);

  return v4;
}

- (id)mmgQuantity
{
  v2 = (void *)MEMORY[0x263F0A630];
  v3 = [MEMORY[0x263F0A830] minuteUnit];
  [a1 mmg];
  v4 = objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3);

  return v4;
}

- (void)mmPercent
{
  v2 = [a1 mmgQuantity];
  v3 = [MEMORY[0x263F0A830] minuteUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  if (v5 >= 0.00000011920929)
  {
    v6 = objc_msgSend(a1, "mmvQuantity", 0.0);
    v7 = [MEMORY[0x263F0A830] minuteUnit];
    [v6 doubleValueForUnit:v7];
  }
}

@end