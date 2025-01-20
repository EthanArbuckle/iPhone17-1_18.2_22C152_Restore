@interface APSPayloadMessageStatsCount
- (APSPayloadMessageStatsCount)init;
- (NSString)lastMessageTopic;
- (double)lastMessageTime;
- (unint64_t)count;
- (unint64_t)sumOfBucketType:(unsigned __int8)a3;
- (void)countTopic:(id)a3 now:(double)a4;
- (void)dealloc;
- (void)setCount:(unint64_t)a3;
- (void)setLastMessageTime:(double)a3;
- (void)setLastMessageTopic:(id)a3;
- (void)shiftBucketsBasedOnNow:(double)a3;
@end

@implementation APSPayloadMessageStatsCount

- (APSPayloadMessageStatsCount)init
{
  v6.receiver = self;
  v6.super_class = (Class)APSPayloadMessageStatsCount;
  v2 = [(APSPayloadMessageStatsCount *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_buckets[0].interval = 300.0;
    v2->_buckets[0].count = 12;
    v2->_buckets[0].data = 0;
    v2->_buckets[1].interval = 3600.0;
    v2->_buckets[1].count = 24;
    v2->_buckets[1].data = 0;
    v4 = (unsigned __int16 *)malloc_type_calloc(0x24uLL, 2uLL, 0x1000040BDFB0063uLL);
    v3->_buckets[0].data = v4;
    v3->_buckets[1].data = &v4[v3->_buckets[0].count];
  }
  return v3;
}

- (void)dealloc
{
  data = self->_buckets[0].data;
  if (data) {
    free(data);
  }
  v4.receiver = self;
  v4.super_class = (Class)APSPayloadMessageStatsCount;
  [(APSPayloadMessageStatsCount *)&v4 dealloc];
}

- (void)shiftBucketsBasedOnNow:(double)a3
{
  double lastMessageTime = self->_lastMessageTime;
  if (lastMessageTime != 0.0)
  {
    uint64_t v4 = 0;
    double v5 = a3 - lastMessageTime;
    buckets = self->_buckets;
    char v7 = 1;
    do
    {
      char v8 = v7;
      v9 = &buckets[v4];
      uint64_t count = v9->count;
      data = v9->data;
      uint64_t v12 = (unint64_t)(v5 / v9->interval);
      uint64_t v13 = v12 - count;
      if (v12 >= count)
      {
        bzero(data, 2 * count);
      }
      else if (v12 >= 1 && ~v12 + count >= 0)
      {
        v14 = (char *)&data[count - 1];
        uint64_t v15 = -2 * v12;
        do
        {
          *(_WORD *)v14 = *(_WORD *)&v14[v15];
          *(_WORD *)&v14[v15] = 0;
          v14 -= 2;
        }
        while (!__CFADD__(v13++, 1));
      }
      char v7 = 0;
      uint64_t v4 = 1;
    }
    while ((v8 & 1) != 0);
  }
}

- (void)countTopic:(id)a3 now:(double)a4
{
  objc_super v6 = (NSString *)a3;
  [(APSPayloadMessageStatsCount *)self shiftBucketsBasedOnNow:a4];
  ++*self->_buckets[0].data;
  unint64_t count = self->_count;
  ++*self->_buckets[1].data;
  self->_unint64_t count = count + 1;
  self->_double lastMessageTime = a4;
  lastMessageTopic = self->_lastMessageTopic;
  self->_lastMessageTopic = v6;
}

- (unint64_t)sumOfBucketType:(unsigned __int8)a3
{
  v3 = (char *)self + 24 * a3;
  uint64_t v4 = v3[16];
  if (!v3[16]) {
    return 0;
  }
  unint64_t result = 0;
  objc_super v6 = (unsigned __int16 *)*((void *)v3 + 3);
  do
  {
    unsigned int v7 = *v6++;
    result += v7;
    --v4;
  }
  while (v4);
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
}

- (double)lastMessageTime
{
  return self->_lastMessageTime;
}

- (void)setLastMessageTime:(double)a3
{
  self->_double lastMessageTime = a3;
}

- (NSString)lastMessageTopic
{
  return self->_lastMessageTopic;
}

- (void)setLastMessageTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end