@interface CAFInt16Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(signed __int16)a3;
- (id)rangeDescription;
- (signed)maximumValue;
- (signed)minimumValue;
- (signed)stepValue;
- (signed)valueRoundedToNearestStepValue:(signed __int16)a3;
@end

@implementation CAFInt16Range

- (signed)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  signed __int16 v3 = [v2 shortValue];

  return v3;
}

- (signed)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  signed __int16 v3 = [v2 shortValue];

  return v3;
}

- (signed)stepValue
{
  v2 = [(CAFRange *)self step];
  signed __int16 v3 = [v2 shortValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%hd..%hd]x%hd", -[CAFInt16Range minimumValue](self, "minimumValue"), -[CAFInt16Range maximumValue](self, "maximumValue"), -[CAFInt16Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(signed __int16)a3
{
  v4 = [NSNumber numberWithShort:a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (signed)valueRoundedToNearestStepValue:(signed __int16)a3
{
  int v3 = a3;
  if ([(CAFInt16Range *)self stepValue])
  {
    v3 -= [(CAFInt16Range *)self minimumValue];
    int v5 = v3 / [(CAFInt16Range *)self stepValue];
    LOWORD(v3) = [(CAFInt16Range *)self minimumValue];
    LOWORD(v3) = v3 + [(CAFInt16Range *)self stepValue] * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_26FD90A38;
}

+ (id)maximum
{
  return &unk_26FD90A50;
}

+ (id)step
{
  return &unk_26FD90A68;
}

@end