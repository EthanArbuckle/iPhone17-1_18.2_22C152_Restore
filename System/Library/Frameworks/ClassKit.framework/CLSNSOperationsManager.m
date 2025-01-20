@interface CLSNSOperationsManager
- (CLSNSOperationsManager)init;
- (unint64_t)count;
- (void)addOperation:(id)a3;
- (void)lock;
- (void)performOperation:(id)a3 onOperationQueue:(id)a4 withTimeOut:(double)a5;
- (void)removeOperation:(id)a3;
- (void)unlock;
@end

@implementation CLSNSOperationsManager

- (CLSNSOperationsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSNSOperationsManager;
  v2 = [(CLSNSOperationsManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    operations = v2->_operations;
    v2->_operations = (NSMutableArray *)v3;

    v2->_lock = 0;
  }
  return v2;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)addOperation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_addObject_(self->_operations, v7, (uint64_t)v4);
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  v8 = (void *)CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    operations = self->_operations;
    v12 = v8;
    int v15 = 138412546;
    id v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = objc_msgSend_count(operations, v13, v14);
    _os_log_impl(&dword_1DC60F000, v12, OS_LOG_TYPE_DEFAULT, "CLSNSOperationsManager: Added operation: %@ [Pending count: %lu].", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend_unlock(self, v9, v10);
}

- (void)removeOperation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if (objc_msgSend_containsObject_(self->_operations, v7, (uint64_t)v4))
  {
    objc_msgSend_removeObject_(self->_operations, v8, (uint64_t)v4);
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v9 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      operations = self->_operations;
      v13 = v9;
      *(_DWORD *)v21 = 138412546;
      *(void *)&v21[4] = v4;
      *(_WORD *)&v21[12] = 2048;
      *(void *)&v21[14] = objc_msgSend_count(operations, v14, v15);
      id v16 = "CLSNSOperationsManager: Removed operation: %@ [Pending count: %lu].";
LABEL_10:
      _os_log_impl(&dword_1DC60F000, v13, OS_LOG_TYPE_DEFAULT, v16, v21, 0x16u);
    }
  }
  else
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    __int16 v17 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = self->_operations;
      v13 = v17;
      *(_DWORD *)v21 = 138412546;
      *(void *)&v21[4] = v4;
      *(_WORD *)&v21[12] = 2048;
      *(void *)&v21[14] = objc_msgSend_count(v18, v19, v20);
      id v16 = "CLSNSOperationsManager: Cannot remove unknown operation: %@ [Pending count: %lu].";
      goto LABEL_10;
    }
  }
  objc_msgSend_unlock(self, v10, v11, *(_OWORD *)v21, *(void *)&v21[16], v22);
}

- (unint64_t)count
{
  objc_msgSend_lock(self, a2, v2);
  unint64_t v6 = objc_msgSend_count(self->_operations, v4, v5);
  objc_msgSend_unlock(self, v7, v8);
  return v6;
}

- (void)performOperation:(id)a3 onOperationQueue:(id)a4 withTimeOut:(double)a5
{
  id v8 = a3;
  objc_msgSend_addOperation_(a4, v9, (uint64_t)v8);
  objc_msgSend_addOperation_(self, v10, (uint64_t)v8);
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  qos_class_t v12 = qos_class_self();
  v13 = dispatch_get_global_queue(v12, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC62FC58;
  block[3] = &unk_1E6C962D8;
  double v17 = a5;
  block[4] = self;
  id v16 = v8;
  id v14 = v8;
  dispatch_after(v11, v13, block);
}

- (void).cxx_destruct
{
}

@end