@interface CAFUInt8Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(unsigned __int8)a3;
- (id)rangeDescription;
- (unsigned)maximumValue;
- (unsigned)minimumValue;
- (unsigned)stepValue;
- (unsigned)valueRoundedToNearestStepValue:(unsigned __int8)a3;
@end

@implementation CAFUInt8Range

- (unsigned)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  unsigned __int8 v3 = [v2 unsignedCharValue];

  return v3;
}

- (unsigned)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  unsigned __int8 v3 = [v2 unsignedCharValue];

  return v3;
}

- (unsigned)stepValue
{
  v2 = [(CAFRange *)self step];
  unsigned __int8 v3 = [v2 unsignedCharValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%hhu..%hhu]x%hhu", -[CAFUInt8Range minimumValue](self, "minimumValue"), -[CAFUInt8Range maximumValue](self, "maximumValue"), -[CAFUInt8Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unsigned __int8)a3
{
  v4 = [NSNumber numberWithUnsignedChar:a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (unsigned)valueRoundedToNearestStepValue:(unsigned __int8)a3
{
  int v3 = a3;
  if ([(CAFUInt8Range *)self stepValue])
  {
    v3 -= [(CAFUInt8Range *)self minimumValue];
    int v5 = v3 / [(CAFUInt8Range *)self stepValue];
    LOBYTE(v3) = [(CAFUInt8Range *)self minimumValue];
    LOBYTE(v3) = v3 + [(CAFUInt8Range *)self stepValue] * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_26FD90C18;
}

+ (id)maximum
{
  return &unk_26FD90C30;
}

+ (id)step
{
  return &unk_26FD90C48;
}

@end