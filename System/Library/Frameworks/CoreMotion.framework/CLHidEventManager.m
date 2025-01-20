@interface CLHidEventManager
- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6;
- (CLHidEventManagerDelegate)delegate;
- (HIDEventSystemClient)manager;
- (NSMutableArray)matching;
- (OS_dispatch_queue)delegateQueue;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMatching:(id)a3;
@end

@implementation CLHidEventManager

- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)CLHidEventManager;
  id v10 = [(CLHidEventManager *)&v36 init];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F64CF8]);
    uint64_t v13 = objc_msgSend_initWithType_(v11, v12, a6);
    *((void *)v10 + 2) = a4;
    *((void *)v10 + 3) = v13;
    *((void *)v10 + 1) = a3;
    v14 = objc_opt_new();
    *((void *)v10 + 4) = v14;
    objc_msgSend_addObject_(v14, v15, (uint64_t)a5);
    objc_msgSend_setMatching_(*((void **)v10 + 3), v16, *((void *)v10 + 4));
    v17 = (void *)*((void *)v10 + 3);
    uint64_t v20 = objc_msgSend_delegateQueue(v10, v18, v19);
    objc_msgSend_setDispatchQueue_(v17, v21, v20);
    v22 = (void *)*((void *)v10 + 3);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_190546214;
    v35[3] = &unk_1E568F588;
    v35[4] = v10;
    objc_msgSend_setEventHandler_(v22, v23, (uint64_t)v35);
    objc_msgSend_activate(*((void **)v10 + 3), v24, v25);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2280);
    }
    v26 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = objc_msgSend_services(*((void **)v10 + 3), v27, v28);
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v29;
      _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD2280);
      }
      uint64_t v33 = objc_msgSend_services(*((void **)v10 + 3), v31, v32);
      int v37 = 138412290;
      uint64_t v38 = v33;
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CLHidEventManager initWithDelegate:queue:matching:type:]", "CoreLocation: %s\n", v34);
      if (v34 != (char *)buf) {
        free(v34);
      }
    }
  }
  return (CLHidEventManager *)v10;
}

- (void)dealloc
{
  objc_msgSend_cancel(self->_manager, a2, v2);

  objc_msgSend_removeAllObjects(self->_matching, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)CLHidEventManager;
  [(CLHidEventManager *)&v6 dealloc];
}

- (CLHidEventManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidEventManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDEventSystemClient)manager
{
  return self->_manager;
}

- (NSMutableArray)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

@end