@interface CAFInt32Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(int)a3;
- (id)rangeDescription;
- (int)maximumValue;
- (int)minimumValue;
- (int)stepValue;
- (int)valueRoundedToNearestStepValue:(int)a3;
@end

@implementation CAFInt32Range

- (int)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  int v3 = [v2 intValue];

  return v3;
}

- (int)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  int v3 = [v2 intValue];

  return v3;
}

- (int)stepValue
{
  v2 = [(CAFRange *)self step];
  int v3 = [v2 intValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%d..%d]x%d", -[CAFInt32Range minimumValue](self, "minimumValue"), -[CAFInt32Range maximumValue](self, "maximumValue"), -[CAFInt32Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(int)a3
{
  v4 = [NSNumber numberWithInt:*(void *)&a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (int)valueRoundedToNearestStepValue:(int)a3
{
  if ([(CAFInt32Range *)self stepValue])
  {
    int v5 = a3 - [(CAFInt32Range *)self minimumValue];
    int v6 = v5 / [(CAFInt32Range *)self stepValue];
    int v7 = [(CAFInt32Range *)self minimumValue];
    return v7 + [(CAFInt32Range *)self stepValue] * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_26FD90C60;
}

+ (id)maximum
{
  return &unk_26FD90C78;
}

+ (id)step
{
  return &unk_26FD90C90;
}

@end