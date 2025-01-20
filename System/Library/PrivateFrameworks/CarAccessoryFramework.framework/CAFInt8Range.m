@interface CAFInt8Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(char)a3;
- (char)maximumValue;
- (char)minimumValue;
- (char)stepValue;
- (char)valueRoundedToNearestStepValue:(char)a3;
- (id)rangeDescription;
@end

@implementation CAFInt8Range

- (char)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  char v3 = [v2 charValue];

  return v3;
}

- (char)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  char v3 = [v2 charValue];

  return v3;
}

- (char)stepValue
{
  v2 = [(CAFRange *)self step];
  char v3 = [v2 charValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%hhd..%hhd]x%hhd", -[CAFInt8Range minimumValue](self, "minimumValue"), -[CAFInt8Range maximumValue](self, "maximumValue"), -[CAFInt8Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(char)a3
{
  v4 = [NSNumber numberWithChar:a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (char)valueRoundedToNearestStepValue:(char)a3
{
  int v3 = a3;
  if ([(CAFInt8Range *)self stepValue])
  {
    v3 -= [(CAFInt8Range *)self minimumValue];
    int v5 = v3 / [(CAFInt8Range *)self stepValue];
    LOBYTE(v3) = [(CAFInt8Range *)self minimumValue];
    LOBYTE(v3) = v3 + [(CAFInt8Range *)self stepValue] * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_26FD90DB0;
}

+ (id)maximum
{
  return &unk_26FD90DC8;
}

+ (id)step
{
  return &unk_26FD90DE0;
}

@end