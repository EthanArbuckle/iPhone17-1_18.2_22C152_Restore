@interface GDFutureLifeEventContext
+ (id)subscribeToUpdateNotificationWithSystemwideUniqueSubscriptionIdentifier:(id)a3 targetQueue:(id)a4 onReceiveUpdateNotificationBlock:(id)a5;
- (BOOL)enumerateEntriesForFutureActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateFutureActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5;
- (GDFutureLifeEventContext)initWithGDSwiftContext:(id)a3;
- (id)context;
- (id)earliestFutureActivityEventAndReturnError:(id *)a3;
- (id)earliestFutureActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6;
- (id)entryForEarliestFutureActivityEventAndReturnError:(id *)a3;
- (id)entryForLatestFutureActivityEventAndReturnError:(id *)a3;
- (id)extremeFutureActivityEventWithEntityIdentifierType:(Class)a3 ascending:(BOOL)a4 outStartDate:(id *)a5 outEndDate:(id *)a6 error:(id *)a7;
- (id)initAndReturnError:(id *)a3;
- (id)latestFutureActivityEventAndReturnError:(id *)a3;
- (id)latestFutureActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6;
@end

@implementation GDFutureLifeEventContext

- (void).cxx_destruct
{
}

- (id)latestFutureActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_extremeFutureActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3, 0, a4);
}

- (id)earliestFutureActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_extremeFutureActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3, 1, a4);
}

- (id)extremeFutureActivityEventWithEntityIdentifierType:(Class)a3 ascending:(BOOL)a4 outStartDate:(id *)a5 outEndDate:(id *)a6 error:(id *)a7
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1B2E434C4;
  v27 = sub_1B2E434D4;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1B2E434C4;
  v21 = sub_1B2E434D4;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E434DC;
  v16[3] = &unk_1E6013778;
  v16[5] = &v17;
  v16[6] = a3;
  v16[4] = &v23;
  if (objc_msgSend_enumerateEntriesForFutureActivityEventsInAscendingOrder_error_usingBlock_(self, a2, a4, (uint64_t)a7, (uint64_t)v16)&& v24[5]&& (v13 = (void *)v18[5]) != 0)
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

- (BOOL)enumerateEntriesForFutureActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateEntriesForFutureActivityEventsWithAscending_error_block_, a3, a4, a5);
}

- (id)entryForLatestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftFutureLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_latestEntryForFutureActivityEventAndReturnError_, a3);
}

- (id)entryForEarliestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftFutureLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_earliestEntryForFutureActivityEventAndReturnError_, a3);
}

- (BOOL)enumerateFutureActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1F4181798](self->gdSwiftContext, sel_enumerateFutureActivityEventsWithAscending_error_block_, a3, a4, a5);
}

- (id)latestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftFutureLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_latestFutureActivityEventAndReturnError_, a3);
}

- (id)earliestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(_TtC20IntelligencePlatform30_GDSwiftFutureLifeEventContext *, char *, id *))MEMORY[0x1F4181798])(self->gdSwiftContext, sel_earliestFutureActivityEventAndReturnError_, a3);
}

- (id)initAndReturnError:(id *)a3
{
  v5 = [_TtC20IntelligencePlatform30_GDSwiftFutureLifeEventContext alloc];
  uint64_t v12 = objc_msgSend_initAndReturnError_(v5, v6, (uint64_t)a3, v7, v8);
  if (v12)
  {
    self = (GDFutureLifeEventContext *)(id)objc_msgSend_initWithGDSwiftContext_(self, v9, (uint64_t)v12, v10, v11);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GDFutureLifeEventContext)initWithGDSwiftContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFutureLifeEventContext;
  v6 = [(GDFutureLifeEventContext *)&v9 init];
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

+ (id)subscribeToUpdateNotificationWithSystemwideUniqueSubscriptionIdentifier:(id)a3 targetQueue:(id)a4 onReceiveUpdateNotificationBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [GDFutureLifeEventUpdateNotificationSubscription alloc];
  updated = objc_msgSend_initWithSystemwideUniqueSubscriptionIdentifier_targetQueue_onReceiveUpdateNotificationBlock_(v10, v11, (uint64_t)v9, (uint64_t)v8, (uint64_t)v7);

  return updated;
}

@end