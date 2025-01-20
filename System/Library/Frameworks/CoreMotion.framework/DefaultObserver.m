@interface DefaultObserver
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v11 = objc_msgSend_valueForKey_(v9, v10, (uint64_t)v8);
  if (qword_1E929E7D0 != -1) {
    dispatch_once(&qword_1E929E7D0, &unk_1EDFD3820);
  }
  v12 = qword_1E929E7C8;
  if (os_log_type_enabled((os_log_t)qword_1E929E7C8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", (uint8_t *)&v13, 0x16u);
  }
  sub_1903488D8((uint64_t)a6, v8, v11);
}

@end