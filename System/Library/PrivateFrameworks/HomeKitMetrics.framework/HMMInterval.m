@interface HMMInterval
+ (NSNumber)negativeInfinityStart;
+ (NSNumber)positiveInfinityEnd;
+ (id)closedClosedIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (id)closedOpenIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (id)intervalForSingleValue:(id)a3;
+ (id)openClosedIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (id)openOpenIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (void)initialize;
- (NSNumber)end;
- (NSNumber)start;
- (NSString)allNumbersIntervalString;
- (NSString)negativeInfinityIntervalString;
- (NSString)positiveInfinityIntervalString;
- (NSString)standardIntervalString;
- (id)initFromStart:(id)a3 toEnd:(id)a4;
- (id)labelString;
@end

@implementation HMMInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

- (NSNumber)end
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)start
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)labelString
{
  v3 = [(HMMInterval *)self start];
  v4 = [(HMMInterval *)self end];
  int v5 = [v3 isEqualToNumber:v4];

  v6 = [(HMMInterval *)self start];
  v7 = v6;
  if (v5)
  {
    v8 = [v6 description];

    goto LABEL_12;
  }
  int v9 = [v6 isEqualToNumber:_HMMNegativeInfinity];

  v10 = [(HMMInterval *)self end];
  int v11 = [v10 isEqualToNumber:_HMMPositiveInfinity];

  if (v9)
  {
    if (v11)
    {
      v8 = [(HMMInterval *)self allNumbersIntervalString];
      goto LABEL_12;
    }
    v12 = NSString;
    v13 = [(HMMInterval *)self negativeInfinityIntervalString];
    uint64_t v14 = [(HMMInterval *)self end];
  }
  else
  {
    v12 = NSString;
    if (!v11)
    {
      v13 = [(HMMInterval *)self standardIntervalString];
      v15 = [(HMMInterval *)self start];
      v16 = [(HMMInterval *)self end];
      v8 = [v12 stringWithValidatedFormat:v13, @"%@ %@", 0, v15, v16 validFormatSpecifiers error];

      goto LABEL_11;
    }
    v13 = [(HMMInterval *)self positiveInfinityIntervalString];
    uint64_t v14 = [(HMMInterval *)self start];
  }
  v15 = (void *)v14;
  v8 = [v12 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];
LABEL_11:

LABEL_12:
  return v8;
}

- (NSString)allNumbersIntervalString
{
  return (NSString *)@"All";
}

- (NSString)positiveInfinityIntervalString
{
  return (NSString *)&stru_1F2C81538;
}

- (NSString)negativeInfinityIntervalString
{
  return (NSString *)&stru_1F2C81538;
}

- (NSString)standardIntervalString
{
  return (NSString *)&stru_1F2C81538;
}

- (id)initFromStart:(id)a3 toEnd:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMInterval;
  int v9 = [(HMMInterval *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)intervalForSingleValue:(id)a3
{
  return (id)[a1 closedClosedIntervalFromStart:a3 toEnd:a3];
}

+ (id)closedClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(HMMInterval *)[HMMClosedClosedInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (id)closedOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(HMMInterval *)[HMMClosedOpenInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (id)openClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(HMMInterval *)[HMMOpenClosedInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (id)openOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(HMMInterval *)[HMMOpenOpenInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (NSNumber)positiveInfinityEnd
{
  return (NSNumber *)(id)_HMMPositiveInfinity;
}

+ (NSNumber)negativeInfinityStart
{
  return (NSNumber *)(id)_HMMNegativeInfinity;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)_HMMPositiveInfinity;
    _HMMPositiveInfinity = (uint64_t)&unk_1F2C876F8;

    id v5 = (void *)_HMMNegativeInfinity;
    _HMMNegativeInfinity = (uint64_t)&unk_1F2C87708;
  }
}

@end