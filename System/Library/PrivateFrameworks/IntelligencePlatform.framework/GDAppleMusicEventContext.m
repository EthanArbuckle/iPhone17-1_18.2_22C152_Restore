@interface GDAppleMusicEventContext
- (BOOL)enumerateEntriesForSongEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateEntriesForSongEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateEntriesForSongEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateEntriesForSongEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateSongEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateSongEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateSongEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateSongEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (GDAppleMusicEventContext)initWithGDSwiftContext:(id)a3;
- (id)context;
- (id)earliestSongEventAndReturnError:(id *)a3;
- (id)entryForEarliestSongEventAndReturnError:(id *)a3;
- (id)entryForLatestSongEventAndReturnError:(id *)a3;
- (id)initAndReturnError:(id *)a3;
- (id)latestSongEventAndReturnError:(id *)a3;
@end

@implementation GDAppleMusicEventContext

- (void).cxx_destruct
{
}

- (BOOL)enumerateEntriesForSongEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForSongEventsWithAscending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateEntriesForSongEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForSongEventsWhoseEndDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateEntriesForSongEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForSongEventsWhoseStartDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateEntriesForSongEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForSongEventsThatOverlapWith_ascending_error_block_, a3, a4, a5);
}

- (id)entryForLatestSongEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftAppleMusicEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_latestEntryForSongEventAndReturnError_, a3);
}

- (id)entryForEarliestSongEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftAppleMusicEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_earliestEntryForSongEventAndReturnError_, a3);
}

- (BOOL)enumerateSongEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateSongEventsWithAscending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateSongEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateSongEventsWhoseEndDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateSongEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateSongEventsWhoseStartDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateSongEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateSongEventsThatOverlapWith_ascending_error_block_, a3, a4, a5);
}

- (id)latestSongEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftAppleMusicEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_latestSongEventAndReturnError_, a3);
}

- (id)earliestSongEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftAppleMusicEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_earliestSongEventAndReturnError_, a3);
}

- (id)initAndReturnError:(id *)a3
{
  v5 = [_TtC20IntelligencePlatform30_GDSwiftAppleMusicEventContext alloc];
  v12 = objc_msgSend_initAndReturnError_(v5, v6, (uint64_t)a3, v7, v8);
  if (v12)
  {
    self = (GDAppleMusicEventContext *)(id)objc_msgSend_initWithGDSwiftContext_(self, v9, (uint64_t)v12, v10, v11);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GDAppleMusicEventContext)initWithGDSwiftContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAppleMusicEventContext;
  v6 = [(GDAppleMusicEventContext *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->gdSwiftContext, a3);
  }

  return v7;
}

- (id)context
{
  return self->gdSwiftContext;
}

@end