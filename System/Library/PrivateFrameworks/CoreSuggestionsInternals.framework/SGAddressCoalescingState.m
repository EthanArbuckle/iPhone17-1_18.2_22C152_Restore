@interface SGAddressCoalescingState
- (NSArray)matches;
- (SGAddressCoalescingState)init;
- (void)coalesceAddress:(__DDResult *)a3 orAppendMatch:(id)a4;
- (void)dealloc;
- (void)setMatches:(id)a3;
@end

@implementation SGAddressCoalescingState

- (void).cxx_destruct
{
}

- (void)setMatches:(id)a3
{
}

- (NSArray)matches
{
  return &self->_matches->super;
}

- (void)coalesceAddress:(__DDResult *)a3 orAppendMatch:(id)a4
{
  id v22 = a4;
  if (DDResultHasType())
  {
    uint64_t Range = DDResultGetRange();
    int64_t v8 = Range + v7;
    uint64_t v9 = [(NSMutableArray *)self->_matches count];
    int64_t v10 = v9;
    int64_t lastAddressIndex = self->_lastAddressIndex;
    BOOL v12 = lastAddressIndex != -1 && v9 == lastAddressIndex + 1;
    if (v12 && Range - self->_lastAddressEndPos <= 19 && DDAddressResultCanBeMergedWith())
    {
      v13 = [(NSMutableArray *)self->_matches objectAtIndexedSubscript:self->_lastAddressIndex];
      uint64_t v14 = [v13 range];
      int64_t v15 = v8 - [v13 range];
      v16 = [SGDataDetectorMatch alloc];
      uint64_t v17 = [v13 matchType];
      uint64_t v18 = [v13 labelRange];
      v20 = -[SGDataDetectorMatch initWithMatchType:range:labelRange:labelString:valueRange:valueString:](v16, "initWithMatchType:range:labelRange:labelString:valueRange:valueString:", v17, v14, v15, v18, v19, 0, v14, v15, 0);
      [(NSMutableArray *)self->_matches setObject:v20 atIndexedSubscript:self->_lastAddressIndex];
    }
    else
    {
      [(NSMutableArray *)self->_matches addObject:v22];
    }
    self->_int64_t lastAddressIndex = v10;
    self->_lastAddressEndPos = v8;
    lastResult = self->_lastResult;
    if (lastResult) {
      CFRelease(lastResult);
    }
    self->_lastResult = (__DDResult *)CFRetain(a3);
  }
  else
  {
    [(NSMutableArray *)self->_matches addObject:v22];
  }
}

- (void)dealloc
{
  lastResult = self->_lastResult;
  if (lastResult) {
    CFRelease(lastResult);
  }
  v4.receiver = self;
  v4.super_class = (Class)SGAddressCoalescingState;
  [(SGAddressCoalescingState *)&v4 dealloc];
}

- (SGAddressCoalescingState)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGAddressCoalescingState;
  v2 = [(SGAddressCoalescingState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    matches = v2->_matches;
    v2->_matches = (NSMutableArray *)v3;

    v2->_int64_t lastAddressIndex = -1;
    v2->_lastAddressEndPos = -1;
  }
  return v2;
}

@end