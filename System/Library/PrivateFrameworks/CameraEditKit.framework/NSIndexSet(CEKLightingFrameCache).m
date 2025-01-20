@interface NSIndexSet(CEKLightingFrameCache)
- (uint64_t)cek_indexNearestToIndex:()CEKLightingFrameCache;
@end

@implementation NSIndexSet(CEKLightingFrameCache)

- (uint64_t)cek_indexNearestToIndex:()CEKLightingFrameCache
{
  uint64_t v5 = objc_msgSend(a1, "indexLessThanOrEqualToIndex:");
  unint64_t v6 = a3 - v5;
  if (a3 != v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = [a1 indexGreaterThanIndex:a3];
    if (v8 - a3 >= v6) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v8;
    }
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = v8;
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      return v7;
    }
    else {
      return v9;
    }
  }
  return a3;
}

@end