@interface _HDQuantityDateIntervals
- (_HDQuantityDateIntervals)init;
- (uint64_t)insideRanges:(uint64_t)result;
@end

@implementation _HDQuantityDateIntervals

- (uint64_t)insideRanges:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = *(void *)(result + 40);
    if (result)
    {
      while (1)
      {
        if (*(double *)(v2 + 8) > a2) {
          return 0;
        }
        unint64_t v4 = *(void *)(v2 + 24);
        if (v4 >= [(id)result count]) {
          return 0;
        }
        if (*(double *)(v2 + 16) >= a2) {
          break;
        }
        unint64_t v5 = *(void *)(v2 + 24) + 1;
        *(void *)(v2 + 24) = v5;
        if (v5 >= [*(id *)(v2 + 40) count]) {
          return 0;
        }
        v6 = [*(id *)(v2 + 40) objectAtIndexedSubscript:*(void *)(v2 + 24)];
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        if (v6) {
          uint64_t v8 = v6[1];
        }
        *(void *)(v2 + 8) = v8;

        v9 = [*(id *)(v2 + 40) objectAtIndexedSubscript:*(void *)(v2 + 24)];
        if (v9) {
          uint64_t v7 = v9[2];
        }
        *(void *)(v2 + 16) = v7;

        result = *(void *)(v2 + 40);
        if (!result) {
          return result;
        }
      }
      return 1;
    }
  }
  return result;
}

- (_HDQuantityDateIntervals)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HDQuantityDateIntervals;
  uint64_t v2 = [(_HDQuantityDateIntervals *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentStartInterval = 0.0;
    v2->_currentEndInterval = 0.0;
    v2->_containsUUIDs = 0;
    v2->_currentPairIndex = 0;
    intervalPairs = v2->_intervalPairs;
    v2->_intervalPairs = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end