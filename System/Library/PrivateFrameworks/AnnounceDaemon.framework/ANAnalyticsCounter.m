@interface ANAnalyticsCounter
- (ANAnalyticsCounter)init;
- (ANAnalyticsCounter)initWithHexCount:(unint64_t)a3;
- (id)payload:(id)a3 keyTwo:(id)a4;
- (unint64_t)hexCount;
- (unsigned)count;
- (void)append:(unint64_t)a3;
- (void)finished;
- (void)setCount:(unsigned int)a3;
- (void)setHexCount:(unint64_t)a3;
@end

@implementation ANAnalyticsCounter

- (ANAnalyticsCounter)init
{
  v3.receiver = self;
  v3.super_class = (Class)ANAnalyticsCounter;
  result = [(ANAnalyticsCounter *)&v3 init];
  if (result)
  {
    result->_hexCount = 0;
    result->_count = 0;
  }
  return result;
}

- (ANAnalyticsCounter)initWithHexCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ANAnalyticsCounter;
  result = [(ANAnalyticsCounter *)&v5 init];
  if (result)
  {
    result->_hexCount = a3;
    result->_count = a3 & 0xF;
  }
  return result;
}

- (void)append:(unint64_t)a3
{
  unsigned int count = self->_count;
  if (count <= 9)
  {
    unsigned int v4 = count + 1;
    self->_unsigned int count = v4;
    unint64_t v5 = 10;
    if (a3 < 0xA) {
      unint64_t v5 = a3;
    }
    self->_hexCount |= v5 << (4 * v4);
  }
}

- (void)finished
{
  self->_hexCount |= self->_count;
}

- (id)payload:(id)a3 keyTwo:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  if (self->_count)
  {
    uint64_t v9 = 1;
    int v10 = 4;
    do
    {
      unint64_t v11 = (self->_hexCount >> v10) & 0xF;
      v16[0] = v6;
      v12 = [NSNumber numberWithUnsignedInt:v9];
      v16[1] = v7;
      v17[0] = v12;
      v13 = [NSNumber numberWithUnsignedInt:v11];
      v17[1] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      [v8 addObject:v14];

      uint64_t v9 = (v9 + 1);
      v10 += 4;
    }
    while (v9 <= self->_count);
  }

  return v8;
}

- (unint64_t)hexCount
{
  return self->_hexCount;
}

- (void)setHexCount:(unint64_t)a3
{
  self->_hexCount = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  self->_unsigned int count = a3;
}

@end