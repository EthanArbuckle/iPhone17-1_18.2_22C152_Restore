@interface GDLifeEventContext
- (BOOL)enumerateActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateActivityEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateActivityEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateActivityEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateEntriesForActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateEntriesForActivityEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateEntriesForActivityEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateEntriesForActivityEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (GDLifeEventContext)initWithGDSwiftContext:(id)a3;
- (id)context;
- (id)earliestActivityEventAndReturnError:(id *)a3;
- (id)earliestActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6;
- (id)entryForEarliestActivityEventAndReturnError:(id *)a3;
- (id)entryForLatestActivityEventAndReturnError:(id *)a3;
- (id)extremeActivityEventWithEntityIdentifierType:(Class)a3 ascending:(BOOL)a4 outStartDate:(id *)a5 outEndDate:(id *)a6 error:(id *)a7;
- (id)initAndReturnError:(id *)a3;
- (id)latestActivityEventAndReturnError:(id *)a3;
- (id)latestActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6;
@end

@implementation GDLifeEventContext

- (void).cxx_destruct
{
}

- (id)latestActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_extremeActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3, 0, a4);
}

- (id)earliestActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_extremeActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3, 1, a4);
}

- (id)extremeActivityEventWithEntityIdentifierType:(Class)a3 ascending:(BOOL)a4 outStartDate:(id *)a5 outEndDate:(id *)a6 error:(id *)a7
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1B2E5E4EC;
  v27 = sub_1B2E5E4FC;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1B2E5E4EC;
  v21 = sub_1B2E5E4FC;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E5E504;
  v16[3] = &unk_1E6013938;
  v16[5] = &v17;
  v16[6] = a3;
  v16[4] = &v23;
  if (objc_msgSend_enumerateEntriesForActivityEventsInAscendingOrder_error_usingBlock_(self, a2, a4, (uint64_t)a7, (uint64_t)v16)&& v24[5]&& (v13 = (void *)v18[5]) != 0)
  {
    if (a5)
    {
      objc_msgSend_startDate(v13, v9, v10, v11, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6)
    {
      objc_msgSend_endDate((void *)v18[5], v9, v10, v11, v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v14 = (id)v24[5];
  }
  else
  {
    id v14 = 0;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v14;
}

- (BOOL)enumerateEntriesForActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsWithAscending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsWhoseEndDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsWhoseStartDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateEntriesForActivityEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsThatOverlapWith_ascending_error_block_, a3, a4, a5);
}

- (id)entryForLatestActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform24_GDSwiftLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_latestEntryForActivityEventAndReturnError_, a3);
}

- (id)entryForEarliestActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform24_GDSwiftLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_earliestEntryForActivityEventAndReturnError_, a3);
}

- (BOOL)enumerateActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateActivityEventsWithAscending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateActivityEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateActivityEventsWhoseEndDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateActivityEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateActivityEventsWhoseStartDatesAreIn_ascending_error_block_, a3, a4, a5);
}

- (BOOL)enumerateActivityEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateActivityEventsThatOverlapWith_ascending_error_block_, a3, a4, a5);
}

- (id)latestActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform24_GDSwiftLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_latestActivityEventAndReturnError_, a3);
}

- (id)earliestActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform24_GDSwiftLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_earliestActivityEventAndReturnError_, a3);
}

- (id)initAndReturnError:(id *)a3
{
  v5 = [_TtC20IntelligencePlatform24_GDSwiftLifeEventContext alloc];
  uint64_t v12 = objc_msgSend_initAndReturnError_(v5, v6, (uint64_t)a3, v7, v8);
  if (v12)
  {
    self = (GDLifeEventContext *)(id)objc_msgSend_initWithGDSwiftContext_(self, v9, (uint64_t)v12, v10, v11);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GDLifeEventContext)initWithGDSwiftContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDLifeEventContext;
  v6 = [(GDLifeEventContext *)&v9 init];
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