@interface GDHomeManager
- (GDHomeManager)init;
- (NSArray)homes;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation GDHomeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardedData, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_homeUpdateSem, 0);
}

- (NSArray)homes
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = GDConstructionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C6DE6000, v3, OS_LOG_TYPE_DEFAULT, "GDHomeManager: homes called", buf, 2u);
  }

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_homeUpdateSem, 0xFFFFFFFFFFFFFFFFLL))
  {
    v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5, v6);
    v17 = objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)"void _PASWaitForeverForSemaphore(dispatch_semaphore_t  _Nonnull __strong)", v16);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v14, v18, (uint64_t)v17, @"_PASDispatchInline.h", 39, @"Unexpected failure on unlimited dispatch_semaphore_wait()");
  }
  *(void *)buf = 0;
  v21 = buf;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1C791BC38;
  v24 = sub_1C791BC48;
  id v25 = 0;
  guardedData = self->_guardedData;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C791BC50;
  v19[3] = &unk_1E6537028;
  v19[4] = buf;
  objc_msgSend_runWithLockAcquired_(guardedData, v4, (uint64_t)v19, v6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend_count(*((void **)v21 + 5), v8, v9, v10);
    *(_DWORD *)v26 = 134217984;
    uint64_t v27 = v11;
    _os_log_impl(&dword_1C6DE6000, v3, OS_LOG_TYPE_DEFAULT, "GDHomeManager: homes returning %tu homes", v26, 0xCu);
  }

  id v12 = *((id *)v21 + 5);
  _Block_object_dispose(buf, 8);

  return (NSArray *)v12;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GDConstructionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1C6DE6000, v5, OS_LOG_TYPE_DEFAULT, "GDHomeManager: homeManagerDidUpdateHomes called with %@", buf, 0xCu);
  }

  guardedData = self->_guardedData;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C791BE24;
  v10[3] = &unk_1E6536FE0;
  id v11 = v4;
  id v7 = v4;
  objc_msgSend_runWithLockAcquired_(guardedData, v8, (uint64_t)v10, v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_homeUpdateSem);
}

- (GDHomeManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)GDHomeManager;
  v2 = [(GDHomeManager *)&v21 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    homeUpdateSem = v2->_homeUpdateSem;
    v2->_homeUpdateSem = (OS_dispatch_semaphore *)v3;

    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v8 = (void *)qword_1EA4F60D0;
    uint64_t v26 = qword_1EA4F60D0;
    if (!qword_1EA4F60D0)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = sub_1C791C094;
      v22[3] = &unk_1E6537050;
      v22[4] = &v23;
      sub_1C791C094((uint64_t)v22, v5, v6, v7);
      v8 = (void *)v24[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v23, 8);
    uint64_t v10 = objc_opt_new();
    manager = v2->_manager;
    v2->_manager = (HMHomeManager *)v10;

    objc_msgSend_setDelegate_(v2->_manager, v12, (uint64_t)v2, v13);
    id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
    v15 = objc_opt_new();
    uint64_t v18 = objc_msgSend_initWithGuardedData_(v14, v16, (uint64_t)v15, v17);
    guardedData = v2->_guardedData;
    v2->_guardedData = (_PASLock *)v18;
  }
  return v2;
}

@end