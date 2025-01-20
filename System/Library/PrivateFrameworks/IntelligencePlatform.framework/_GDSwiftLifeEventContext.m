@interface _GDSwiftLifeEventContext
- (BOOL)enumerateActivityEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateActivityEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateActivityEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateEntriesForActivityEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateEntriesForActivityEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateEntriesForActivityEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateEntriesForActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (id)earliestActivityEventAndReturnError:(id *)a3;
- (id)earliestEntryForActivityEventAndReturnError:(id *)a3;
- (id)initAndReturnError:(id *)a3;
- (id)latestActivityEventAndReturnError:(id *)a3;
- (id)latestEntryForActivityEventAndReturnError:(id *)a3;
@end

@implementation _GDSwiftLifeEventContext

- (id)initAndReturnError:(id *)a3
{
  return (id)_GDSwiftLifeEventContext.init()();
}

- (id)earliestActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B7E340(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B7DC10);
}

- (id)latestActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B7E340(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B7DC54);
}

- (BOOL)enumerateActivityEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B7E7B4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(char *, uint64_t, uint64_t, unsigned char *))sub_1B2B7DDF0);
}

- (BOOL)enumerateActivityEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B7E7B4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(char *, uint64_t, uint64_t, unsigned char *))sub_1B2B7DEDC);
}

- (BOOL)enumerateActivityEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B7E7B4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(char *, uint64_t, uint64_t, unsigned char *))sub_1B2B7DFAC);
}

- (BOOL)enumerateActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1B2B7EA00(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, void *))sub_1B2B7E07C);
}

- (id)earliestEntryForActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B7E340(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B7E120);
}

- (id)latestEntryForActivityEventAndReturnError:(id *)a3
{
  return sub_1B2B7E340(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B7E154);
}

- (BOOL)enumerateEntriesForActivityEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B7E7B4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(char *, uint64_t, uint64_t, unsigned char *))sub_1B2B7E4EC);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B7E7B4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(char *, uint64_t, uint64_t, unsigned char *))sub_1B2B7E5EC);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B7E7B4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(char *, uint64_t, uint64_t, unsigned char *))sub_1B2B7E6D0);
}

- (BOOL)enumerateEntriesForActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1B2B7EA00(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1B2B725E8, (void (*)(uint64_t, uint64_t, void *))sub_1B2B7E938);
}

- (void).cxx_destruct
{
}

@end