@interface BWNodeEnumerator
+ (void)initialize;
- (BWNodeEnumerator)initWithGraph:(id)a3;
- (uint64_t)_updateVisitedCount:(uint64_t)result;
- (void)dealloc;
@end

@implementation BWNodeEnumerator

- (uint64_t)_updateVisitedCount:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a2];
    v4 = (void *)[*(id *)(v2 + 24) objectForKeyedSubscript:v3];
    if (v4) {
      v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1);
    }
    else {
      v5 = &unk_1EFAFFE28;
    }
    [*(id *)(v2 + 24) setObject:v5 forKeyedSubscript:v3];
    return [v5 unsignedIntegerValue];
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeEnumerator;
  [(BWNodeEnumerator *)&v3 dealloc];
}

- (BWNodeEnumerator)initWithGraph:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWNodeEnumerator;
  v4 = [(BWNodeEnumerator *)&v6 init];
  if (v4)
  {
    v4->_graph = (BWGraph *)a3;
    v4->_depth = 0;
    v4->_nodeVisitCountMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

+ (void)initialize
{
}

@end