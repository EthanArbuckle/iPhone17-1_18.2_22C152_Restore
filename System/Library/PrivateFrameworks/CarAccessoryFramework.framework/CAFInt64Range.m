@interface CAFInt64Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(int64_t)a3;
- (id)rangeDescription;
- (int64_t)maximumValue;
- (int64_t)minimumValue;
- (int64_t)stepValue;
- (int64_t)valueRoundedToNearestStepValue:(int64_t)a3;
@end

@implementation CAFInt64Range

- (int64_t)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (int64_t)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (int64_t)stepValue
{
  v2 = [(CAFRange *)self step];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%lld..%lld]x%lld", -[CAFInt64Range minimumValue](self, "minimumValue"), -[CAFInt64Range maximumValue](self, "maximumValue"), -[CAFInt64Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(int64_t)a3
{
  v4 = [NSNumber numberWithLongLong:a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (int64_t)valueRoundedToNearestStepValue:(int64_t)a3
{
  if ([(CAFInt64Range *)self stepValue])
  {
    int64_t v5 = a3 - [(CAFInt64Range *)self minimumValue];
    int64_t v6 = v5 / [(CAFInt64Range *)self stepValue];
    int64_t v7 = [(CAFInt64Range *)self minimumValue];
    return v7 + [(CAFInt64Range *)self stepValue] * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_26FD909F0;
}

+ (id)maximum
{
  return &unk_26FD90A08;
}

+ (id)step
{
  return &unk_26FD90A20;
}

@end