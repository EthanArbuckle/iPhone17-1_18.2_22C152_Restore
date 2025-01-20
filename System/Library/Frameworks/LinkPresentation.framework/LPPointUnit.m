@interface LPPointUnit
+ (id)zero;
- (LPPointUnit)initWithValue:(double)a3;
- (double)value;
- (id)_lp_CSSText;
- (id)_lp_HTMLAttributeText;
@end

@implementation LPPointUnit

- (LPPointUnit)initWithValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LPPointUnit;
  v4 = [(LPPointUnit *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    v6 = v4;
  }

  return v5;
}

+ (id)zero
{
  v2 = (void *)zero_zeroPoint;
  if (!zero_zeroPoint)
  {
    v3 = [[LPPointUnit alloc] initWithValue:0.0];
    v4 = (void *)zero_zeroPoint;
    zero_zeroPoint = (uint64_t)v3;

    v2 = (void *)zero_zeroPoint;
  }

  return v2;
}

- (id)_lp_CSSText
{
  v2 = NSString;
  [(LPPointUnit *)self value];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"%gpx", v3);
}

- (id)_lp_HTMLAttributeText
{
  v2 = NSString;
  [(LPPointUnit *)self value];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"%g", v3);
}

- (double)value
{
  return self->_value;
}

@end