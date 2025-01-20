@interface CAFUInt64Range
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(unint64_t)a3;
- (id)rangeDescription;
- (unint64_t)maximumValue;
- (unint64_t)minimumValue;
- (unint64_t)stepValue;
- (unint64_t)valueRoundedToNearestStepValue:(unint64_t)a3;
@end

@implementation CAFUInt64Range

- (unint64_t)minimumValue
{
  v2 = [(CAFRange *)self minimum];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (unint64_t)maximumValue
{
  v2 = [(CAFRange *)self maximum];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (unint64_t)stepValue
{
  v2 = [(CAFRange *)self step];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%llu..%llu]x%llu", -[CAFUInt64Range minimumValue](self, "minimumValue"), -[CAFUInt64Range maximumValue](self, "maximumValue"), -[CAFUInt64Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unint64_t)a3
{
  v4 = [NSNumber numberWithUnsignedLongLong:a3];
  LOBYTE(self) = [(CAFRange *)self isInRange:v4];

  return (char)self;
}

- (unint64_t)valueRoundedToNearestStepValue:(unint64_t)a3
{
  if ([(CAFUInt64Range *)self stepValue])
  {
    unint64_t v5 = a3 - [(CAFUInt64Range *)self minimumValue];
    unint64_t v6 = v5 / [(CAFUInt64Range *)self stepValue];
    unint64_t v7 = [(CAFUInt64Range *)self minimumValue];
    return v7 + [(CAFUInt64Range *)self stepValue] * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_26FD90A80;
}

+ (id)maximum
{
  return &unk_26FD90A98;
}

+ (id)step
{
  return &unk_26FD90AB0;
}

@end