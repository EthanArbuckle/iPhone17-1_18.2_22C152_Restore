@interface MKUsageCounter
+ (id)sharedCounter;
- (id)fieldNameForType:(unint64_t)a3;
- (void)count:(unint64_t)a3;
- (void)countUsageOfTypeIfNeeded:(unint64_t)a3;
- (void)createCountedEventsSetIfNeeded;
@end

@implementation MKUsageCounter

id __24__MKUsageCounter_count___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [*(id *)(a1 + 32) fieldNameForType:*(void *)(a1 + 48)];
  [v2 setObject:v3 forKeyedSubscript:@"mktype"];

  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"bundleID"];

  return v2;
}

- (id)fieldNameForType:(unint64_t)a3
{
  if (a3 > 0x39) {
    return @"nil";
  }
  else {
    return off_1E54BB360[a3];
  }
}

- (void)countUsageOfTypeIfNeeded:(unint64_t)a3
{
  [(MKUsageCounter *)self createCountedEventsSetIfNeeded];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  if ((-[NSMutableSet containsObject:](self->_countedEventsSet, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->_countedEventsSet addObject:v5];
    [(MKUsageCounter *)self count:a3];
  }
}

- (void)createCountedEventsSetIfNeeded
{
  if (!self->_countedEventsSet)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    countedEventsSet = self->_countedEventsSet;
    self->_countedEventsSet = v3;
  }
}

- (void)count:(unint64_t)a3
{
  v4 = GEOApplicationIdentifierOrProcessName();
  id v3 = v4;
  AnalyticsSendEventLazy();
}

+ (id)sharedCounter
{
  if (_MergedGlobals_151 != -1) {
    dispatch_once(&_MergedGlobals_151, &__block_literal_global_53);
  }
  v2 = (void *)qword_1EB315E50;

  return v2;
}

void __31__MKUsageCounter_sharedCounter__block_invoke()
{
  v0 = objc_alloc_init(MKUsageCounter);
  v1 = (void *)qword_1EB315E50;
  qword_1EB315E50 = (uint64_t)v0;
}

- (void).cxx_destruct
{
}

@end