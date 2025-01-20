@interface CLHidManager
- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4;
- (CLHidManagerDelegate)delegate;
- (HIDManager)manager;
- (NSMutableArray)clientDevices;
- (OS_dispatch_queue)delegateQueue;
- (id)createDeviceForMatchingDictionary:(id)a3;
- (id)getClientDeviceMatchingDict:(id)a3;
- (id)getClientDeviceMatchingHIDDevice:(id)a3;
- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3;
- (id)registerForDeviceMatching:(id)a3;
- (void)activateClientDevice:(id)a3;
- (void)dealloc;
- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4;
- (void)setClientDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterForDeviceMatching:(id)a3;
- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4;
@end

@implementation CLHidManager

- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = objc_msgSend_manager(self, a2, (uint64_t)a3);
  id obj = (id)objc_msgSend_devices(v4, v5, v6);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v31, v40, 16);
  if (!v8) {
    return 0;
  }
  uint64_t v10 = v8;
  uint64_t v11 = *(void *)v32;
  while (1)
  {
    uint64_t v12 = 0;
LABEL_4:
    if (*(void *)v32 != v11) {
      objc_enumerationMutation(obj);
    }
    v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v27, v39, 16);
    if (!v14) {
      break;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
LABEL_8:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(a3);
      }
      uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * v17);
      v19 = objc_msgSend_propertyForKey_(v13, v9, v18);
      uint64_t v21 = objc_msgSend_objectForKey_(a3, v20, v18);
      if (!objc_msgSend_isEqual_(v19, v22, v21)) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v27, v39, 16);
        if (v15) {
          goto LABEL_8;
        }
        goto LABEL_18;
      }
    }
    if (++v12 != v10) {
      goto LABEL_4;
    }
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, v40, 16);
    v13 = 0;
    if (!v10) {
      return v13;
    }
  }
LABEL_18:
  if (qword_1EB3BE898 != -1) {
    dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
  }
  v23 = off_1EB3BE890;
  if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = a3;
    _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_INFO, "[CLHidManager], matched device for %@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
    }
    int v35 = 138412290;
    id v36 = a3;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CLHidManager getHidDeviceFromEnumeratedDevicesMatching:]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf) {
      free(v24);
    }
  }
  return v13;
}

- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)CLHidManager;
  id v6 = [(CLHidManager *)&v26 init];
  if (v6)
  {
    *((void *)v6 + 4) = objc_opt_new();
    *((void *)v6 + 1) = a3;
    *((void *)v6 + 2) = a4;
    id v7 = objc_alloc(MEMORY[0x1E4F64D00]);
    v9 = objc_msgSend_initWithOptions_(v7, v8, 8);
    *((void *)v6 + 3) = v9;
    objc_msgSend_setDeviceMatching_(v9, v10, MEMORY[0x1E4F1CC08]);
    objc_msgSend_setDispatchQueue_(*((void **)v6 + 3), v11, *((void *)v6 + 2));
    uint64_t v12 = (void *)*((void *)v6 + 3);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_19053E570;
    v25[3] = &unk_1E568F440;
    v25[4] = v6;
    objc_msgSend_setDeviceNotificationHandler_(v12, v13, (uint64_t)v25);
    objc_msgSend_activate(*((void **)v6 + 3), v14, v15);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
    }
    uint64_t v16 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = objc_msgSend_devices(*((void **)v6 + 3), v17, v18);
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v19;
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
      }
      uint64_t v23 = objc_msgSend_devices(*((void **)v6 + 3), v21, v22);
      int v27 = 138412290;
      uint64_t v28 = v23;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CLHidManager initWithDelegate:queue:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
  }
  return (CLHidManager *)v6;
}

- (void)dealloc
{
  objc_msgSend_cancel(self->_manager, a2, v2);
  objc_msgSend_close(self->_manager, v4, v5);

  objc_msgSend_removeAllObjects(self->_clientDevices, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)CLHidManager;
  [(CLHidManager *)&v8 dealloc];
}

- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  uint64_t v7 = objc_msgSend_delegateQueue(self, a2, (uint64_t)a3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19053E6DC;
  block[3] = &unk_1E568F468;
  block[4] = self;
  block[5] = a3;
  BOOL v9 = a4;
  dispatch_async(v7, block);
}

- (id)createDeviceForMatchingDictionary:(id)a3
{
  uint64_t HidDeviceFromEnumeratedDevicesMatching = objc_msgSend_getHidDeviceFromEnumeratedDevicesMatching_(self, a2, (uint64_t)a3);
  ClientDeviceMatchingDict = objc_msgSend_getClientDeviceMatchingDict_(self, v6, (uint64_t)a3);
  if (!ClientDeviceMatchingDict)
  {
    uint64_t v10 = [CLHidDevice alloc];
    ClientDeviceMatchingDict = objc_msgSend_initWithHidDevice_matchingDict_(v10, v11, HidDeviceFromEnumeratedDevicesMatching, a3);
    uint64_t v14 = objc_msgSend_clientDevices(self, v12, v13);
    objc_msgSend_addObject_(v14, v15, (uint64_t)ClientDeviceMatchingDict);
    objc_msgSend_activateClientDevice_(self, v16, (uint64_t)ClientDeviceMatchingDict);
    if (!HidDeviceFromEnumeratedDevicesMatching) {
      return ClientDeviceMatchingDict;
    }
    goto LABEL_3;
  }
  if (HidDeviceFromEnumeratedDevicesMatching) {
LABEL_3:
  }
    objc_msgSend_sendMonitorUpdateForDevice_added_(self, v7, (uint64_t)ClientDeviceMatchingDict, 1);
  return ClientDeviceMatchingDict;
}

- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  ClientDeviceMatchingHIDDevice = objc_msgSend_getClientDeviceMatchingHIDDevice_(self, a2, (uint64_t)a3);
  if (ClientDeviceMatchingHIDDevice)
  {
    uint64_t v9 = (uint64_t)ClientDeviceMatchingHIDDevice;
    if (v4)
    {
      objc_msgSend_setHidDevice_(ClientDeviceMatchingHIDDevice, v8, (uint64_t)a3);
      objc_msgSend_activateClientDevice_(self, v10, v9);
    }
    else
    {
      objc_msgSend_setHidDevice_(ClientDeviceMatchingHIDDevice, v8, 0);
    }
    objc_msgSend_sendMonitorUpdateForDevice_added_(self, v11, v9, v4);
  }
}

- (void)activateClientDevice:(id)a3
{
  if (objc_msgSend_hidDevice(a3, a2, (uint64_t)a3))
  {
    uint64_t v7 = objc_msgSend_hidDevice(a3, v5, v6);
    uint64_t v10 = objc_msgSend_delegateQueue(self, v8, v9);
    objc_msgSend_setDispatchQueue_(v7, v11, v10);
    uint64_t v14 = objc_msgSend_hidDevice(a3, v12, v13);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_19053E948;
    v26[3] = &unk_1E568F4B8;
    v26[4] = self;
    v26[5] = a3;
    v26[6] = self;
    objc_msgSend_setInputReportHandler_(v14, v15, (uint64_t)v26);
    uint64_t v18 = objc_msgSend_hidDevice(a3, v16, v17);
    objc_msgSend_open(v18, v19, v20);
    uint64_t v23 = objc_msgSend_hidDevice(a3, v21, v22);
    objc_msgSend_activate(v23, v24, v25);
  }
}

- (id)getClientDeviceMatchingDict:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = objc_msgSend_clientDevices(self, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, v26, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_matching(v12, v7, v8);
        if (objc_msgSend_isEqual_(v13, v14, (uint64_t)a3))
        {
          if (qword_1EB3BE898 != -1) {
            dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
          }
          uint64_t v15 = off_1EB3BE890;
          if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = a3;
            _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_INFO, "[CLHidManager], matched CLHidDevice for %@", buf, 0xCu);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE898 != -1) {
              dispatch_once(&qword_1EB3BE898, &unk_1EDFD21C0);
            }
            int v22 = 138412290;
            id v23 = a3;
            uint64_t v17 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CLHidManager getClientDeviceMatchingDict:]", "CoreLocation: %s\n", v17);
            if (v17 != (char *)buf) {
              free(v17);
            }
          }
          return v12;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v18, v26, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (id)getClientDeviceMatchingHIDDevice:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (id)objc_msgSend_clientDevices(self, a2, (uint64_t)a3);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v32, v37, 16);
  if (!v5) {
    return 0;
  }
  uint64_t v8 = v5;
  uint64_t v27 = *(void *)v33;
  do
  {
    uint64_t v9 = 0;
LABEL_4:
    if (*(void *)v33 != v27) {
      objc_enumerationMutation(obj);
    }
    uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v11 = objc_msgSend_matching(v10, v6, v7);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v28, v36, 16);
    if (!v13) {
      break;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
LABEL_8:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
      long long v18 = objc_msgSend_propertyForKey_(a3, v6, v17);
      long long v21 = objc_msgSend_matching(v10, v19, v20);
      uint64_t v23 = objc_msgSend_objectForKey_(v21, v22, v17);
      if (!objc_msgSend_isEqual_(v18, v24, v23)) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v6, (uint64_t)&v28, v36, 16);
        if (v14) {
          goto LABEL_8;
        }
        return v10;
      }
    }
    if (++v9 != v8) {
      goto LABEL_4;
    }
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v32, v37, 16);
    uint64_t v10 = 0;
  }
  while (v8);
  return v10;
}

- (id)registerForDeviceMatching:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_createDeviceForMatchingDictionary_, a3);
}

- (void)unregisterForDeviceMatching:(id)a3
{
  BOOL v4 = objc_msgSend_clientDevices(self, a2, (uint64_t)a3);

  objc_msgSend_removeObject_(v4, v5, (uint64_t)a3);
}

- (CLHidManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDManager)manager
{
  return self->_manager;
}

- (NSMutableArray)clientDevices
{
  return self->_clientDevices;
}

- (void)setClientDevices:(id)a3
{
}

@end