@interface HIDAnalyticsHistogramEventField
- (HIDAnalyticsHistogramEventField)initWithAttributes:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5;
- (NSString)fieldName;
- (id)value;
- (void)createBuckets:(_HIDAnalyticsHistogramSegmentConfig *)a3 count:(int64_t)a4;
- (void)dealloc;
- (void)setIntegerValue:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation HIDAnalyticsHistogramEventField

- (void)dealloc
{
  segments = self->_segments;
  if (segments)
  {
    uint64_t v4 = -1;
    uint64_t v5 = 8;
    while (++v4 < (unint64_t)self->_segmentCount)
    {
      if (*(void *)(&segments->var0 + v5))
      {
        free(*(void **)(&segments->var0 + v5));
        segments = self->_segments;
      }
      v5 += 16;
      if (!segments) {
        goto LABEL_9;
      }
    }
    free(segments);
  }
LABEL_9:
  v6.receiver = self;
  v6.super_class = (Class)HIDAnalyticsHistogramEventField;
  [(HIDAnalyticsHistogramEventField *)&v6 dealloc];
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HIDAnalyticsHistogramEventField)initWithAttributes:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HIDAnalyticsHistogramEventField;
  v10 = [(HIDAnalyticsHistogramEventField *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fieldName, a3);
    [(HIDAnalyticsHistogramEventField *)v11 createBuckets:a4 count:a5];
    v12 = v11;
  }

  return v11;
}

- (void)createBuckets:(_HIDAnalyticsHistogramSegmentConfig *)a3 count:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  self->_segmentCount = a4;
  v7 = (_HIDAnalyticsHistogramSegment *)malloc_type_malloc(16 * a4, 0x10200408CB94CA5uLL);
  self->_segments = v7;
  bzero(v7, 16 * self->_segmentCount);
  if (a4 >= 1)
  {
    uint64_t v8 = 0;
    id v9 = MEMORY[0x263EF8438];
    do
    {
      v10 = &a3[v8];
      unint64_t var3 = v10->var3;
      if (var3 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v10->var3;
      }
      if (var3 >= 2 && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        fieldName = self->_fieldName;
        *(_DWORD *)buf = 134218242;
        uint64_t v20 = v12;
        __int16 v21 = 2112;
        v22 = fieldName;
        _os_log_impl(&dword_22133A000, v9, OS_LOG_TYPE_DEFAULT, "HIDAnalytics higher value normalizer %llu for field %@ , reduce to 1 ", buf, 0x16u);
      }
      int var2 = v10->var2;
      uint64_t var0 = v10->var0;
      self->_segments[v8].uint64_t var0 = var0;
      self->_segments[v8].int var1 = (_HIDAnalyticsHistogramBucket *)malloc_type_malloc(6 * var0, 0x10000405D080610uLL);
      bzero(self->_segments[v8].var1, 6 * v10->var0);
      uint64_t v16 = v10->var0;
      if (v10->var0)
      {
        int var1 = a3[v8].var1;
        v18 = (_WORD *)((char *)self->_segments[v8].var1 + 2);
        do
        {
          *(v18 - 1) = var2;
          var2 += var1;
          _WORD *v18 = var2;
          v18 += 3;
          --v16;
        }
        while (v16);
      }
      ++v8;
    }
    while (v8 != a4);
  }
}

- (void)setIntegerValue:(unint64_t)a3
{
  uint64_t segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    uint64_t v4 = 0;
    segments = self->_segments;
    do
    {
      if (segments[v4].var0)
      {
        uint64_t v6 = 0;
        int var1 = segments[v4].var1;
        uint64_t v8 = 6 * segments[v4].var0;
        do
        {
          if (!v6 && (unsigned __int16)a3 <= *(unsigned __int16 *)((char *)var1 + v6)
            || v8 - 6 == v6
            && (unsigned __int16)a3 > *(unsigned __int16 *)((char *)var1 + v6 + 2)
            || (unsigned __int16)a3 > *(unsigned __int16 *)((char *)var1 + v6)
            && (unsigned __int16)a3 <= *(unsigned __int16 *)((char *)var1 + v6 + 2))
          {
            ++*((unsigned char *)var1 + v6 + 4);
          }
          v6 += 6;
        }
        while (v8 != v6);
      }
      ++v4;
    }
    while (v4 != segmentCount);
  }
}

- (id)value
{
  v3 = (void *)MEMORY[0x223C7FAD0](self, a2);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    uint64_t v6 = 0;
    segments = self->_segments;
    do
    {
      if (segments[v6].var0)
      {
        unint64_t v8 = 0;
        uint64_t v9 = 4;
        do
        {
          v10 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)segments[v6].var1 + v9)];
          [v4 addObject:v10];

          ++v8;
          segments = self->_segments;
          v9 += 6;
        }
        while (v8 < segments[v6].var0);
      }
      ++v6;
    }
    while (v6 != segmentCount);
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
  char v4 = [a3 unsignedIntegerValue];
  unsigned int segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    unint64_t v6 = 0;
    segments = self->_segments;
    do
    {
      uint64_t var0 = segments[v6].var0;
      if (segments[v6].var0)
      {
        uint64_t v9 = (char *)segments[v6].var1 + 4;
        do
        {
          *uint64_t v9 = v4;
          v9 += 6;
          --var0;
        }
        while (var0);
        unsigned int segmentCount = self->_segmentCount;
      }
      ++v6;
    }
    while (v6 < segmentCount);
  }
}

@end