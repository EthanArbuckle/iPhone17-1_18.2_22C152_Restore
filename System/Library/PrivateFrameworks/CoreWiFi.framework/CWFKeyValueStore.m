@interface CWFKeyValueStore
- (BOOL)__synchronize;
- (BOOL)isActivated;
- (BOOL)synchronize;
- (CWFKeyValueStore)initWithType:(int64_t)a3 identifier:(id)a4;
- (NSString)identifier;
- (id)__debugDescriptionForType:(int64_t)a3;
- (id)dictionaryRepresentation;
- (id)eventHandler;
- (id)invalidationHandler;
- (id)objectForKey:(id)a3;
- (int64_t)type;
- (void)__ubiquitousKVSChanged:(id)a3;
- (void)activate;
- (void)addEntriesFromDictionary:(id)a3;
- (void)invalidate;
- (void)removeAllEntries;
- (void)setActivated:(BOOL)a3;
- (void)setEventHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CWFKeyValueStore

- (void)__ubiquitousKVSChanged:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = objc_msgSend_userInfo(v4, v5, v6, v7, v8);
  v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, *MEMORY[0x1E4F28A20], v11, v12);

  v18 = objc_msgSend_userInfo(v4, v14, v15, v16, v17);

  v22 = objc_msgSend_objectForKeyedSubscript_(v18, v19, *MEMORY[0x1E4F28A28], v20, v21);

  switch(objc_msgSend_integerValue(v13, v23, v24, v25, v26))
  {
    case 0:
      v27 = CWFGetOSLog();
      if (v27)
      {
        v28 = CWFGetOSLog();
      }
      else
      {
        v28 = MEMORY[0x1E4F14500];
        id v34 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        identifier = self->_identifier;
        objc_msgSend___debugDescriptionForType_(self, v35, self->_type, v36, v37);
        int v57 = 138543618;
        v58 = identifier;
        __int16 v59 = 2114;
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B5009B48;
      block[3] = &unk_1E60BB9F0;
      block[4] = self;
      id v54 = v22;
      dispatch_async(eventQueue, block);
      v40 = v54;
      goto LABEL_18;
    case 1:
      v29 = CWFGetOSLog();
      if (v29)
      {
        v30 = CWFGetOSLog();
      }
      else
      {
        v30 = MEMORY[0x1E4F14500];
        id v41 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v45 = self->_identifier;
        objc_msgSend___debugDescriptionForType_(self, v42, self->_type, v43, v44);
        int v57 = 138543618;
        v58 = v45;
        __int16 v59 = 2114;
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
      v46 = self->_eventQueue;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = sub_1B5009AC4;
      v55[3] = &unk_1E60BB9F0;
      v55[4] = self;
      id v56 = v22;
      dispatch_async(v46, v55);
      v40 = v56;
LABEL_18:

      break;
    case 2:
      v31 = CWFGetOSLog();
      if (v31)
      {
        v32 = CWFGetOSLog();
      }
      else
      {
        v32 = MEMORY[0x1E4F14500];
        id v47 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      goto LABEL_25;
    case 3:
      v33 = CWFGetOSLog();
      if (v33)
      {
        v32 = CWFGetOSLog();
      }
      else
      {
        v32 = MEMORY[0x1E4F14500];
        id v51 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        v52 = self->_identifier;
        objc_msgSend___debugDescriptionForType_(self, v48, self->_type, v49, v50);
        int v57 = 138543618;
        v58 = v52;
        __int16 v59 = 2114;
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
LABEL_25:

      break;
    default:
      break;
  }
}

- (id)__debugDescriptionForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 5)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", v3, v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E60BD3F0[a3 - 1];
  }
  return v5;
}

- (CWFKeyValueStore)initWithType:(int64_t)a3 identifier:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v66.receiver = self;
  v66.super_class = (Class)CWFKeyValueStore;
  uint64_t v8 = [(CWFKeyValueStore *)&v66 init];
  v9 = v8;
  if ((unint64_t)(a3 - 6) < 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_22;
  }
  if (!v8) {
    goto LABEL_22;
  }
  v8->_int64_t type = a3;
  if (!v7) {
    goto LABEL_22;
  }
  objc_storeStrong((id *)&v8->_identifier, a4);
  v10 = NSString;
  v14 = objc_msgSend___debugDescriptionForType_(v9, v11, v9->_type, v12, v13);
  objc_msgSend_stringWithFormat_(v10, v15, @"com.apple.corewifi.kvs-%@.mutex.(%@)", v16, v17, v14, v7);
  id v18 = objc_claimAutoreleasedReturnValue();
  v23 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
  uint64_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
  mutexQueue = v9->_mutexQueue;
  v9->_mutexQueue = (OS_dispatch_queue *)v25;

  if (!v9->_mutexQueue) {
    goto LABEL_22;
  }
  v30 = NSString;
  v31 = objc_msgSend___debugDescriptionForType_(v9, v27, v9->_type, v28, v29);
  objc_msgSend_stringWithFormat_(v30, v32, @"com.apple.corewifi.kvs-%@.events.(%@)", v33, v34, v31, v7);
  id v35 = objc_claimAutoreleasedReturnValue();
  v40 = (const char *)objc_msgSend_UTF8String(v35, v36, v37, v38, v39);
  id v41 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v42 = dispatch_queue_create(v40, v41);
  eventQueue = v9->_eventQueue;
  v9->_eventQueue = (OS_dispatch_queue *)v42;

  if (!v9->_eventQueue) {
    goto LABEL_22;
  }
  int64_t type = v9->_type;
  if (type == 5)
  {
    id v52 = objc_alloc(MEMORY[0x1E4F29130]);
    uint64_t v55 = objc_msgSend__initWithStoreIdentifier_usingEndToEndEncryption_(v52, v53, (uint64_t)v9->_identifier, 1, v54);
    ubiquitousKVS = v9->_ubiquitousKVS;
    v9->_ubiquitousKVS = (NSUbiquitousKeyValueStore *)v55;

    if (!v9->_ubiquitousKVS)
    {
      v58 = CWFGetOSLog();
      if (v58)
      {
        id v51 = CWFGetOSLog();
      }
      else
      {
        id v51 = MEMORY[0x1E4F14500];
        id v63 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
LABEL_20:
      identifier = v9->_identifier;
      v65 = objc_msgSend___debugDescriptionForType_(v9, v60, v9->_type, v61, v62);
      int v67 = 138543618;
      v68 = identifier;
      __int16 v69 = 2114;
      v70 = v65;
      _os_log_send_and_compose_impl();

LABEL_21:
LABEL_22:

      v9 = 0;
    }
  }
  else if (type == 3)
  {
    id v45 = objc_alloc(MEMORY[0x1E4F29130]);
    uint64_t v48 = objc_msgSend__initWithStoreIdentifier_usingEndToEndEncryption_(v45, v46, (uint64_t)v9->_identifier, 0, v47);
    uint64_t v49 = v9->_ubiquitousKVS;
    v9->_ubiquitousKVS = (NSUbiquitousKeyValueStore *)v48;

    if (!v9->_ubiquitousKVS)
    {
      uint64_t v50 = CWFGetOSLog();
      if (v50)
      {
        id v51 = CWFGetOSLog();
      }
      else
      {
        id v51 = MEMORY[0x1E4F14500];
        id v59 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }

  return v9;
}

- (void)activate
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500A030;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)invalidate
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500A33C;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1B4F51CBC;
  uint64_t v16 = sub_1B4F51C0C;
  id v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500A5F0;
  block[3] = &unk_1E60BC6D8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500A7F8;
  block[3] = &unk_1E60BB950;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(mutexQueue, block);
}

- (void)removeAllEntries
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500AAEC;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1B500AF10;
  v7[3] = &unk_1E60BB9F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, v7);
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1B4F51CBC;
  id v10 = sub_1B4F51C0C;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B500B338;
  v5[3] = &unk_1E60BC6B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)__synchronize
{
  switch(self->_type)
  {
    case 1:
    case 4:
      CFStringRef identifier = (const __CFString *)self->_identifier;
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      goto LABEL_11;
    case 2:
      CFStringRef identifier = (const __CFString *)self->_identifier;
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFStringRef v7 = @"mobile";
LABEL_11:
      if (CFPreferencesSynchronize(identifier, v7, v8)) {
        goto LABEL_12;
      }
      goto LABEL_4;
    case 3:
    case 5:
      if ((objc_msgSend_synchronize(self->_ubiquitousKVS, a2, v2, v3, v4) & 1) == 0) {
        goto LABEL_4;
      }
LABEL_12:
      BOOL result = 1;
      break;
    default:
LABEL_4:
      id v9 = CWFGetOSLog();
      if (v9)
      {
        id v10 = CWFGetOSLog();
      }
      else
      {
        id v10 = MEMORY[0x1E4F14500];
        id v11 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_msgSend___debugDescriptionForType_(self, v12, self->_type, v13, v14);
        _os_log_send_and_compose_impl();
      }
      BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)synchronize
{
  uint64_t v6 = 0;
  CFStringRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B500B6C8;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ubiquitousKVS, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end