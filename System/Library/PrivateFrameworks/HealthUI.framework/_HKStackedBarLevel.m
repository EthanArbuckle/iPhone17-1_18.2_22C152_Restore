@interface _HKStackedBarLevel
- (NSMutableArray)segments;
- (_HKStackedBarLevel)init;
- (void)setSegments:(id)a3;
@end

@implementation _HKStackedBarLevel

- (_HKStackedBarLevel)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HKStackedBarLevel;
  v2 = [(_HKStackedBarLevel *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    segments = v2->_segments;
    v2->_segments = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end