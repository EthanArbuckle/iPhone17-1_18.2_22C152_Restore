@interface CSDBThreadedRecordStore
- (BOOL)ownsCurrentThreadOtherwiseAssert:(BOOL)a3;
- (CSDBThreadedRecordStore)initWithIdentifier:(__CFString *)a3 qosClass:(unsigned __int16)a4 lookAsideConfig:(CSDBLookAsideBufferConfig)a5;
- (void)_teardownDatabaseOnQueue;
- (void)dealloc;
- (void)performBlock:(id)a3 afterDelay:(double)a4;
- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4;
- (void)registerClass:(id *)a3;
- (void)setupDatabaseWithAllowLocalMigration:(BOOL)a3 pathBlock:(id)a4 setupStoreHandler:(void *)a5 connectionInitializer:(void *)a6 versionChecker:(void *)a7 migrationHandler:(void *)a8 schemaVersion:(int)a9 dataProtectionClass:(unsigned int)a10 registerBlock:(id)a11;
- (void)setupDatabaseWithAllowLocalMigration:(BOOL)a3 pathBlock:(id)a4 setupStoreHandler:(void *)a5 connectionInitializer:(void *)a6 versionChecker:(void *)a7 migrationHandler:(void *)a8 schemaVersion:(int)a9 dataProtectionClass:(unsigned int)a10 registerBlock:(id)a11 exclusiveOwnership:(BOOL)a12;
- (void)teardownDatabase;
@end

@implementation CSDBThreadedRecordStore

- (BOOL)ownsCurrentThreadOtherwiseAssert:(BOOL)a3
{
  return MEMORY[0x270F9A6D0](self->_thread, sel_isCurrentThreadOtherwiseAssert_, a3);
}

- (void)setupDatabaseWithAllowLocalMigration:(BOOL)a3 pathBlock:(id)a4 setupStoreHandler:(void *)a5 connectionInitializer:(void *)a6 versionChecker:(void *)a7 migrationHandler:(void *)a8 schemaVersion:(int)a9 dataProtectionClass:(unsigned int)a10 registerBlock:(id)a11
{
  char v11 = 1;
  objc_msgSend_setupDatabaseWithAllowLocalMigration_pathBlock_setupStoreHandler_connectionInitializer_versionChecker_migrationHandler_schemaVersion_dataProtectionClass_registerBlock_exclusiveOwnership_(self, a2, a3, a4, a5, a6, a7, a8, __PAIR64__(a10, a9), a11, v11);
}

- (void)setupDatabaseWithAllowLocalMigration:(BOOL)a3 pathBlock:(id)a4 setupStoreHandler:(void *)a5 connectionInitializer:(void *)a6 versionChecker:(void *)a7 migrationHandler:(void *)a8 schemaVersion:(int)a9 dataProtectionClass:(unsigned int)a10 registerBlock:(id)a11 exclusiveOwnership:(BOOL)a12
{
  recordStoreQueue = self->_recordStoreQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21527DD98;
  block[3] = &unk_264238D88;
  block[4] = self;
  block[5] = a4;
  int v14 = a9;
  unsigned int v15 = a10;
  block[8] = a6;
  block[9] = a7;
  block[10] = a8;
  BOOL v16 = a3;
  block[6] = a11;
  block[7] = a5;
  BOOL v17 = a12;
  dispatch_sync(recordStoreQueue, block);
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  if (a3)
  {
    id v6 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_21528C4FC;
    v8[3] = &unk_264238DB0;
    v8[4] = self;
    v8[5] = v6;
    objc_msgSend_performBlock_afterDelay_(self->_thread, v7, (uint64_t)v8, a4);
  }
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_21527DD40;
    v8[3] = &unk_264238DB0;
    v8[4] = self;
    v8[5] = v6;
    objc_msgSend_performBlock_waitUntilDone_(self->_thread, v7, (uint64_t)v8, v4);
  }
}

- (void)teardownDatabase
{
  recordStoreQueue = self->_recordStoreQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2152805E0;
  block[3] = &unk_264238C88;
  block[4] = self;
  dispatch_sync(recordStoreQueue, block);
}

- (void)_teardownDatabaseOnQueue
{
  recordStore = self->_recordStore;
  if (recordStore)
  {
    CSDBRecordStoreDestroy(recordStore);
    self->_recordStore = 0;
  }
}

- (CSDBThreadedRecordStore)initWithIdentifier:(__CFString *)a3 qosClass:(unsigned __int16)a4 lookAsideConfig:(CSDBLookAsideBufferConfig)a5
{
  int v5 = *((_DWORD *)&a5 + 2);
  uint64_t v6 = *(void *)&a5.lookAsideSlotSize;
  uint64_t v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSDBThreadedRecordStore;
  id v10 = [(CSDBThreadedRecordStore *)&v18 init];
  if (v10)
  {
    char v11 = objc_msgSend_stringWithFormat_(NSString, v9, @"com.apple.CSDBThreadedRecordStore.recordStoreQueue.%@", a3);
    int v14 = (const char *)objc_msgSend_UTF8String(v11, v12, v13);
    *((void *)v10 + 2) = dispatch_queue_create(v14, 0);
    *((void *)v10 + 3) = a3;
    unsigned int v15 = [_CSDBThreadObject alloc];
    *((void *)v10 + 4) = objc_msgSend_initWithIdentifier_qosClass_(v15, v16, *((void *)v10 + 3), v7);
    *((void *)v10 + 5) = v6;
    *((_DWORD *)v10 + 12) = v5;
  }
  return (CSDBThreadedRecordStore *)v10;
}

- (void)dealloc
{
  recordStoreQueue = self->_recordStoreQueue;
  if (recordStoreQueue) {
    dispatch_release(recordStoreQueue);
  }
  objc_msgSend__teardownDatabaseOnQueue(self, a2, v2);

  v5.receiver = self;
  v5.super_class = (Class)CSDBThreadedRecordStore;
  [(CSDBThreadedRecordStore *)&v5 dealloc];
}

- (void)registerClass:(id *)a3
{
  if (self->_wantsRegister) {
    CSDBRecordStoreRegisterClass((uint64_t)self->_recordStore, (void *)a3);
  }
}

@end