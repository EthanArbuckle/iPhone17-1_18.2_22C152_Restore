@interface DefaultObserver
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_valueForKey_(v9, v10, (uint64_t)v8, v11);
  if (qword_2681B9B60 != -1) {
    dispatch_once(&qword_2681B9B60, &unk_26DC21ED0);
  }
  v13 = qword_2681B9B58;
  if (os_log_type_enabled((os_log_t)qword_2681B9B58, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_227B19000, v13, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", (uint8_t *)&v14, 0x16u);
  }
  sub_227B8D06C((uint64_t)a6, v8, v12);
}

@end