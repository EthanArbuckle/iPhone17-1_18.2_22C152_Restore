@interface CKMemoryInfo
+ (CKMemoryInfo)memoryInfo;
+ (id)workloop;
- (CKMemoryInfo)init;
- (OS_dispatch_source)source;
- (int64_t)memoryPressure;
- (void)dealloc;
- (void)handleMemoryPressureEvent:(unint64_t)a3;
@end

@implementation CKMemoryInfo

+ (CKMemoryInfo)memoryInfo
{
  if (qword_1EB279C80 != -1) {
    dispatch_once(&qword_1EB279C80, &unk_1ED7EF278);
  }
  v2 = (void *)qword_1EB279C78;

  return (CKMemoryInfo *)v2;
}

+ (id)workloop
{
  if (qword_1EB279C90 != -1) {
    dispatch_once(&qword_1EB279C90, &unk_1ED7F5698);
  }
  v2 = (void *)qword_1EB279C88;

  return v2;
}

- (CKMemoryInfo)init
{
  v14.receiver = self;
  v14.super_class = (Class)CKMemoryInfo;
  id v2 = [(CKMemoryInfo *)&v14 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v6 = objc_msgSend_workloop(CKMemoryInfo, v3, v4, v5);
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 0x37uLL, v6);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    v9 = *((void *)v2 + 2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0E4DA0;
    v11[3] = &unk_1E54610B0;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v9, v11);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (CKMemoryInfo *)v2;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
  v3.receiver = self;
  v3.super_class = (Class)CKMemoryInfo;
  [(CKMemoryInfo *)&v3 dealloc];
}

- (int64_t)memoryPressure
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t memoryPressure = v2->_memoryPressure;
  objc_sync_exit(v2);

  return memoryPressure;
}

- (void)handleMemoryPressureEvent:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a3;
    _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "Handling memory pressure event: %lu", buf, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  unint64_t v7 = (a3 >> 4) & 1;
  if ((a3 & 0x20) != 0) {
    unint64_t v7 = 3;
  }
  uint64_t v8 = (2 * (int)a3) & 4;
  if ((a3 & 4) != 0) {
    uint64_t v8 = 12;
  }
  unint64_t v9 = v8 | v7;
  if (!v6) {
    unint64_t v9 = 0;
  }
  if (v6->_memoryPressure == v9)
  {
    objc_sync_exit(v6);
  }
  else
  {
    v6->_int64_t memoryPressure = v9;
    objc_sync_exit(v6);

    if (a3 == 32) {
      dispatch_qos_class_t v13 = QOS_CLASS_USER_INITIATED;
    }
    else {
      dispatch_qos_class_t v13 = QOS_CLASS_UTILITY;
    }
    objc_super v14 = objc_msgSend_workloop(CKMemoryInfo, v10, v11, v12);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_18B0E5080;
    block[3] = &unk_1E5460350;
    block[4] = v6;
    dispatch_block_t v15 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v13, 0, block);
    dispatch_async(v14, v15);
  }
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void).cxx_destruct
{
}

@end