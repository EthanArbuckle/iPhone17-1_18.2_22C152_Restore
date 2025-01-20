@interface CKSyncEngineEvent
+ (void)initialize;
- (BOOL)CKDescriptionShouldPrintPointer;
- (CKSyncEngineAccountChangeEvent)accountChangeEvent;
- (CKSyncEngineDidFetchChangesEvent)didFetchChangesEvent;
- (CKSyncEngineDidFetchRecordZoneChangesEvent)didFetchRecordZoneChangesEvent;
- (CKSyncEngineDidSendChangesEvent)didSendChangesEvent;
- (CKSyncEngineEventType)type;
- (CKSyncEngineFetchedDatabaseChangesEvent)fetchedDatabaseChangesEvent;
- (CKSyncEngineFetchedRecordZoneChangesEvent)fetchedRecordZoneChangesEvent;
- (CKSyncEngineSentDatabaseChangesEvent)sentDatabaseChangesEvent;
- (CKSyncEngineSentRecordZoneChangesEvent)sentRecordZoneChangesEvent;
- (CKSyncEngineStateUpdateEvent)stateUpdateEvent;
- (CKSyncEngineWillFetchChangesEvent)willFetchChangesEvent;
- (CKSyncEngineWillFetchRecordZoneChangesEvent)willFetchRecordZoneChangesEvent;
- (CKSyncEngineWillSendChangesEvent)willSendChangesEvent;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)initInternal;
- (id)redactedDescription;
@end

@implementation CKSyncEngineEvent

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKSyncEngineEvent;
  return [(CKSyncEngineEvent *)&v3 init];
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineEvent *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  v5 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v4, @"CKSyncEngine", (uint64_t)&stru_1ED7F5C98);

  return v5;
}

+ (void)initialize
{
  v6[12] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 12);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 1);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineEvent *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (CKSyncEngineEventType)type
{
  v2 = [CKException alloc];
  uint64_t v3 = *MEMORY[0x1E4F1C3A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"Event type subclass doesn't implement -type: %@", v5);

  objc_exception_throw(v7);
}

- (CKSyncEngineStateUpdateEvent)stateUpdateEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineStateUpdateEvent *)self;
}

- (CKSyncEngineAccountChangeEvent)accountChangeEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineAccountChangeEvent *)self;
}

- (CKSyncEngineFetchedDatabaseChangesEvent)fetchedDatabaseChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineFetchedDatabaseChangesEvent *)self;
}

- (CKSyncEngineFetchedRecordZoneChangesEvent)fetchedRecordZoneChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineFetchedRecordZoneChangesEvent *)self;
}

- (CKSyncEngineSentDatabaseChangesEvent)sentDatabaseChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineSentDatabaseChangesEvent *)self;
}

- (CKSyncEngineSentRecordZoneChangesEvent)sentRecordZoneChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineSentRecordZoneChangesEvent *)self;
}

- (CKSyncEngineWillFetchChangesEvent)willFetchChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineWillFetchChangesEvent *)self;
}

- (CKSyncEngineWillFetchRecordZoneChangesEvent)willFetchRecordZoneChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineWillFetchRecordZoneChangesEvent *)self;
}

- (CKSyncEngineDidFetchRecordZoneChangesEvent)didFetchRecordZoneChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineDidFetchRecordZoneChangesEvent *)self;
}

- (CKSyncEngineDidFetchChangesEvent)didFetchChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineDidFetchChangesEvent *)self;
}

- (CKSyncEngineWillSendChangesEvent)willSendChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineWillSendChangesEvent *)self;
}

- (CKSyncEngineDidSendChangesEvent)didSendChangesEvent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [CKException alloc];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v11 = (id)objc_msgSend_initWithName_format_(v4, v10, v5, @"Cannot cast %@ to %@", v7, v9);

    objc_exception_throw(v11);
  }
  return (CKSyncEngineDidSendChangesEvent *)self;
}

@end