@interface _GDSwiftFutureLifeEventContext
- (BOOL)enumerateEntriesForFutureActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateFutureActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (id)earliestEntryForFutureActivityEventAndReturnError:(id *)a3;
- (id)earliestFutureActivityEventAndReturnError:(id *)a3;
- (id)initAndReturnError:(id *)a3;
- (id)latestEntryForFutureActivityEventAndReturnError:(id *)a3;
- (id)latestFutureActivityEventAndReturnError:(id *)a3;
@end

@implementation _GDSwiftFutureLifeEventContext

- (id)initAndReturnError:(id *)a3
{
  return (id)_GDSwiftFutureLifeEventContext.init()();
}

- (id)earliestFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B76FFC(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B76870);
}

- (id)latestFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B76FFC(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B769C0);
}

- (BOOL)enumerateFutureActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1B2B772D4(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1B2B77770, (void (*)(uint64_t, uint64_t, void *))sub_1B2B76BF8);
}

- (id)earliestEntryForFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B76FFC(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B76CC8);
}

- (id)latestEntryForFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B76FFC(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B76E0C);
}

- (BOOL)enumerateEntriesForFutureActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1B2B772D4(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1B2B725E8, (void (*)(uint64_t, uint64_t, void *))sub_1B2B771A8);
}

- (void).cxx_destruct
{
}

@end