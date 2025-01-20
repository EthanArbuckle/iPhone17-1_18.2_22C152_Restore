@interface FIUINumberFormatter
- (id)stringFromNumber:(id)a3;
@end

@implementation FIUINumberFormatter

- (id)stringFromNumber:(id)a3
{
  id v4 = a3;
  if (![(FIUINumberFormatter *)self maximumFractionDigits])
  {
    [v4 doubleValue];
    double v8 = v7;
    switch([(FIUINumberFormatter *)self roundingMode])
    {
      case 0:
      case 2:
        BOOL v9 = v8 < 0.0;
        double v10 = -1.0;
        goto LABEL_13;
      case 4:
      case 5:
        if (v8 < 0.0 && v8 >= -0.5) {
          goto LABEL_17;
        }
        break;
      case 6:
        BOOL v9 = v8 < 0.0;
        double v10 = -0.5;
LABEL_13:
        if (v9 && v8 > v10)
        {
LABEL_17:
          uint64_t v13 = [NSNumber numberWithDouble:0.0];

          id v4 = (id)v13;
        }
        break;
      default:
        break;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)FIUINumberFormatter;
  v5 = [(FIUINumberFormatter *)&v14 stringFromNumber:v4];

  return v5;
}

@end