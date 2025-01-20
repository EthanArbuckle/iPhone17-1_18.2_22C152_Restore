@interface CAFFloatRange
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(float)a3;
- (float)maximumValue;
- (float)minimumValue;
- (float)stepValue;
- (float)valueRoundedToNearestStepValue:(float)a3;
- (id)rangeDescription;
@end

@implementation CAFFloatRange

- (float)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)stepValue
{
  v2 = [(CAFRange *)self step];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (id)rangeDescription
{
  float v3 = NSString;
  [(CAFFloatRange *)self minimumValue];
  double v5 = v4;
  [(CAFFloatRange *)self maximumValue];
  double v7 = v6;
  [(CAFFloatRange *)self stepValue];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"[%g..%g]x%g", *(void *)&v5, *(void *)&v7, v8);
}

- (BOOL)valueIsInRange:(float)a3
{
  float v4 = objc_msgSend(NSNumber, "numberWithFloat:");
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (float)valueRoundedToNearestStepValue:(float)a3
{
  [(CAFFloatRange *)self stepValue];
  if (v5 >= 0.0)
  {
    [(CAFFloatRange *)self stepValue];
    if (v6 <= 0.00000011921) {
      return a3;
    }
  }
  [(CAFFloatRange *)self minimumValue];
  float v8 = a3 - v7;
  [(CAFFloatRange *)self stepValue];
  unint64_t v10 = (unint64_t)(float)(v8 / v9);
  [(CAFFloatRange *)self minimumValue];
  float v12 = v11;
  [(CAFFloatRange *)self stepValue];
  return v12 + (float)((float)v10 * v13);
}

+ (id)minimum
{
  return &unk_26FD94CA0;
}

+ (id)maximum
{
  return &unk_26FD94CB0;
}

+ (id)step
{
  return &unk_26FD90C00;
}

@end