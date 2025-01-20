@interface _GDSwiftAppleMusicEventContext
- (BOOL)enumerateEntriesForSongEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateEntriesForSongEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateEntriesForSongEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateEntriesForSongEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateSongEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateSongEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateSongEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateSongEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (id)earliestEntryForSongEventAndReturnError:(id *)a3;
- (id)earliestSongEventAndReturnError:(id *)a3;
- (id)initAndReturnError:(id *)a3;
- (id)latestEntryForSongEventAndReturnError:(id *)a3;
- (id)latestSongEventAndReturnError:(id *)a3;
@end

@implementation _GDSwiftAppleMusicEventContext

- (id)initAndReturnError:(id *)a3
{
  return (id)_GDSwiftAppleMusicEventContext.init()();
}

- (id)earliestSongEventAndReturnError:(id *)a3
{
  return sub_1B2B74224(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B73FC8);
}

- (id)latestSongEventAndReturnError:(id *)a3
{
  return sub_1B2B74224(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B74048);
}

- (BOOL)enumerateSongEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B74D70(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, uint64_t, unsigned char *))sub_1B2B74368);
}

- (BOOL)enumerateSongEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B74D70(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, uint64_t, unsigned char *))sub_1B2B74494);
}

- (BOOL)enumerateSongEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B74D70(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, uint64_t, unsigned char *))sub_1B2B74578);
}

- (BOOL)enumerateSongEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1B2B74FEC(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, void *))sub_1B2B7465C);
}

- (id)earliestEntryForSongEventAndReturnError:(id *)a3
{
  return sub_1B2B74224(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B74700);
}

- (id)latestEntryForSongEventAndReturnError:(id *)a3
{
  return sub_1B2B74224(self, (uint64_t)a2, (uint64_t)a3, sub_1B2B74774);
}

- (BOOL)enumerateEntriesForSongEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B74D70(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, uint64_t, unsigned char *))sub_1B2B74A7C);
}

- (BOOL)enumerateEntriesForSongEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B74D70(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, uint64_t, unsigned char *))sub_1B2B74BA8);
}

- (BOOL)enumerateEntriesForSongEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1B2B74D70(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1B2B72654, (void (*)(uint64_t, uint64_t, uint64_t, unsigned char *))sub_1B2B74C8C);
}

- (BOOL)enumerateEntriesForSongEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1B2B74FEC(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1B2B725E8, (void (*)(uint64_t, uint64_t, void *))sub_1B2B74EEC);
}

- (void).cxx_destruct
{
}

@end