@interface CAFUInt32Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(unsigned int)a3;
- (id)rangeDescription;
- (unsigned)maximumValue;
- (unsigned)minimumValue;
- (unsigned)stepValue;
- (unsigned)valueRoundedToNearestStepValue:(unsigned int)a3;
@end

@implementation CAFUInt32Range

- (unsigned)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)stepValue
{
  v2 = [(CAFRange *)self step];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%u..%u]x%u", -[CAFUInt32Range minimumValue](self, "minimumValue"), -[CAFUInt32Range maximumValue](self, "maximumValue"), -[CAFUInt32Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unsigned int)a3
{
  v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (unsigned)valueRoundedToNearestStepValue:(unsigned int)a3
{
  if ([(CAFUInt32Range *)self stepValue])
  {
    unsigned int v5 = a3 - [(CAFUInt32Range *)self minimumValue];
    unsigned int v6 = v5 / [(CAFUInt32Range *)self stepValue];
    unsigned int v7 = [(CAFUInt32Range *)self minimumValue];
    return v7 + [(CAFUInt32Range *)self stepValue] * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_26FD90CA8;
}

+ (id)maximum
{
  return &unk_26FD90CC0;
}

+ (id)step
{
  return &unk_26FD90CD8;
}

@end