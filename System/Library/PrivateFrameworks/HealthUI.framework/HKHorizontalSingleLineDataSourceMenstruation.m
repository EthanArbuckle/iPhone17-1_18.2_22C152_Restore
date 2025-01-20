@interface HKHorizontalSingleLineDataSourceMenstruation
- (id)queryDescription;
- (void)applyMarkStyleToPoint:(id)a3 sample:(id)a4;
@end

@implementation HKHorizontalSingleLineDataSourceMenstruation

- (id)queryDescription
{
  return @"HKHorizonalSingleLineMenstruation";
}

- (void)applyMarkStyleToPoint:(id)a3 sample:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  v6 = [v5 metadata];
  v7 = [v6 valueForKey:*MEMORY[0x1E4F2A1A8]];
  char v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if ([v5 value] != 5) {
      goto LABEL_6;
    }
    uint64_t v9 = 3;
  }
  [v10 setMarkStyle:v9];
LABEL_6:
}

@end