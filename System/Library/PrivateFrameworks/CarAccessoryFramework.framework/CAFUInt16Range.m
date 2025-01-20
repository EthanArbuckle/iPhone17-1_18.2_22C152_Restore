@interface CAFUInt16Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(unsigned __int16)a3;
- (id)rangeDescription;
- (unsigned)maximumValue;
- (unsigned)minimumValue;
- (unsigned)stepValue;
- (unsigned)valueRoundedToNearestStepValue:(unsigned __int16)a3;
@end

@implementation CAFUInt16Range

- (unsigned)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  unsigned __int16 v3 = [v2 unsignedShortValue];

  return v3;
}

- (unsigned)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  unsigned __int16 v3 = [v2 unsignedShortValue];

  return v3;
}

- (unsigned)stepValue
{
  v2 = [(CAFRange *)self step];
  unsigned __int16 v3 = [v2 unsignedShortValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%hu..%hu]x%hu", -[CAFUInt16Range minimumValue](self, "minimumValue"), -[CAFUInt16Range maximumValue](self, "maximumValue"), -[CAFUInt16Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unsigned __int16)a3
{
  v4 = [NSNumber numberWithUnsignedShort:a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (unsigned)valueRoundedToNearestStepValue:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CAFUInt16Range *)self stepValue])
  {
    v3 -= [(CAFUInt16Range *)self minimumValue];
    int v5 = v3 / [(CAFUInt16Range *)self stepValue];
    LOWORD(v3) = [(CAFUInt16Range *)self minimumValue];
    LOWORD(v3) = v3 + [(CAFUInt16Range *)self stepValue] * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_26FD90D68;
}

+ (id)maximum
{
  return &unk_26FD90D80;
}

+ (id)step
{
  return &unk_26FD90D98;
}

@end