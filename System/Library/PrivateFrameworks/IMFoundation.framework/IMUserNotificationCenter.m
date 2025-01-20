@interface IMUserNotificationCenter
+ (id)sharedInstance;
- (NSMutableDictionary)identifierToBlockQueueMap;
- (NSMutableDictionary)identifierToCFUserNotificationMap;
- (NSMutableDictionary)identifierToIMUserNotificationQueueMap;
- (NSMutableDictionary)identifierToListenerQueueMap;
- (NSMutableDictionary)identifierToRunLoopSourcesMap;
- (id)_dequeueBlockForIdentifier:(id)a3;
- (id)_dequeueListenerForIdentifier:(id)a3;
- (id)_dequeueUserNotificationForIdentifier:(id)a3;
- (id)_frontBlockForIdentifier:(id)a3;
- (id)_frontListenerForIdentifier:(id)a3;
- (id)_frontUserNotificationForIdentifier:(id)a3;
- (unint64_t)countForIdentifier:(id)a3;
- (void)_cancelActiveUserNotificationForIdentifier:(id)a3;
- (void)_displayNextUserNotificationForIdentifier:(id)a3;
- (void)_enqueueBlock:(id)a3 forIdentifier:(id)a4;
- (void)_enqueueListener:(id)a3 forIdentifier:(id)a4;
- (void)_enqueueUserNotification:(id)a3 forIdentifier:(id)a4;
- (void)_handleUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)addUserNotification:(id)a3 listener:(id)a4;
- (void)addUserNotification:(id)a3 listener:(id)a4 completionHandler:(id)a5;
- (void)removeAllListeners;
- (void)removeListener:(id)a3;
- (void)removeNotificationsForServiceIdentifier:(id)a3;
- (void)setIdentifierToBlockQueueMap:(id)a3;
- (void)setIdentifierToCFUserNotificationMap:(id)a3;
- (void)setIdentifierToIMUserNotificationQueueMap:(id)a3;
- (void)setIdentifierToListenerQueueMap:(id)a3;
- (void)setIdentifierToRunLoopSourcesMap:(id)a3;
@end

@implementation IMUserNotificationCenter

+ (id)sharedInstance
{
  if (qword_1EB273CE8 != -1) {
    dispatch_once(&qword_1EB273CE8, &unk_1EE22FB58);
  }
  v2 = (void *)qword_1EB273C48;
  return v2;
}

- (id)_frontUserNotificationForIdentifier:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, a2, (uint64_t)a3, v3);
    v8 = objc_msgSend___imFirstObject(v4, v5, v6, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_frontListenerForIdentifier:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, a2, (uint64_t)a3, v3);
    v8 = objc_msgSend___imFirstObject(v4, v5, v6, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_frontBlockForIdentifier:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, a2, (uint64_t)a3, v3);
    v8 = objc_msgSend___imFirstObject(v4, v5, v6, v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = 0;
    }
    else {
      v9 = v8;
    }
    v10 = _Block_copy(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_dequeueUserNotificationForIdentifier:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, v4, (uint64_t)v6, v5);
    v14 = objc_msgSend___imFirstObject(v7, v8, v9, v10);
    if (v14) {
      objc_msgSend_removeFirstObject(v7, v11, v12, v13);
    }
    if (!objc_msgSend_count(v7, v11, v12, v13)) {
      objc_msgSend_removeObjectForKey_(self->_identifierToIMUserNotificationQueueMap, v15, (uint64_t)v6, v17);
    }
    if (!objc_msgSend_count(self->_identifierToIMUserNotificationQueueMap, v15, v16, v17))
    {
      identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
      self->_identifierToIMUserNotificationQueueMap = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_dequeueListenerForIdentifier:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, v4, (uint64_t)v6, v5);
    v14 = objc_msgSend___imFirstObject(v7, v8, v9, v10);
    if (v14) {
      objc_msgSend_removeFirstObject(v7, v11, v12, v13);
    }
    if (!objc_msgSend_count(v7, v11, v12, v13)) {
      objc_msgSend_removeObjectForKey_(self->_identifierToListenerQueueMap, v15, (uint64_t)v6, v17);
    }
    if (!objc_msgSend_count(self->_identifierToListenerQueueMap, v15, v16, v17))
    {
      identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
      self->_identifierToListenerQueueMap = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_dequeueBlockForIdentifier:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, v4, (uint64_t)v6, v5);
    if (objc_msgSend_count(v7, v8, v9, v10))
    {
      uint64_t v13 = objc_msgSend_objectAtIndex_(v7, v11, 0, v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = 0;
    }
    else {
      v15 = v13;
    }
    v19 = _Block_copy(v15);
    if (v13) {
      objc_msgSend_removeFirstObject(v7, v16, v17, v18);
    }
    if (!objc_msgSend_count(v7, v16, v17, v18)) {
      objc_msgSend_removeObjectForKey_(self->_identifierToBlockQueueMap, v20, (uint64_t)v6, v22);
    }
    if (!objc_msgSend_count(self->_identifierToBlockQueueMap, v20, v21, v22))
    {
      identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
      self->_identifierToBlockQueueMap = 0;
    }
    v14 = _Block_copy(v19);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_enqueueUserNotification:(id)a3 forIdentifier:(id)a4
{
  id v16 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, v6, (uint64_t)v8, v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
      if (!identifierToIMUserNotificationQueueMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v15 = self->_identifierToIMUserNotificationQueueMap;
        self->_identifierToIMUserNotificationQueueMap = Mutable;

        identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
      }
      objc_msgSend_setObject_forKey_(identifierToIMUserNotificationQueueMap, v12, (uint64_t)v11, (uint64_t)v8);
    }
    objc_msgSend_addObject_(v11, v9, (uint64_t)v16, v10);
  }
}

- (void)_enqueueListener:(id)a3 forIdentifier:(id)a4
{
  id v20 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v12 = objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, v6, (uint64_t)v8, v7);
    if (!v12)
    {
      uint64_t v12 = objc_msgSend_nonRetainingArray(MEMORY[0x1E4F1CA48], v9, v10, v11);
      identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
      if (!identifierToListenerQueueMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        id v16 = self->_identifierToListenerQueueMap;
        self->_identifierToListenerQueueMap = Mutable;

        identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
      }
      objc_msgSend_setObject_forKey_(identifierToListenerQueueMap, v13, (uint64_t)v12, (uint64_t)v8);
    }
    if (v20)
    {
      objc_msgSend_addObject_(v12, v9, (uint64_t)v20, v11);
    }
    else
    {
      uint64_t v17 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v9, 0, v11);
      objc_msgSend_addObject_(v12, v18, (uint64_t)v17, v19);
    }
  }
}

- (void)_enqueueBlock:(id)a3 forIdentifier:(id)a4
{
  id v21 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, v6, (uint64_t)v8, v7);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
      if (!identifierToBlockQueueMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        id v16 = self->_identifierToBlockQueueMap;
        self->_identifierToBlockQueueMap = Mutable;

        identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
      }
      objc_msgSend_setObject_forKey_(identifierToBlockQueueMap, v13, (uint64_t)v12, (uint64_t)v8);
    }
    if (v21)
    {
      uint64_t v17 = objc_msgSend_copy(v21, v9, v10, v11);
    }
    else
    {
      uint64_t v17 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v9, v10, v11);
    }
    id v20 = (void *)v17;
    objc_msgSend_addObject_(v12, v18, v17, v19);
  }
}

- (void)_cancelActiveUserNotificationForIdentifier:(id)a3
{
  id v31 = a3;
  id v6 = (__CFUserNotification *)objc_msgSend_objectForKey_(self->_identifierToCFUserNotificationMap, v4, (uint64_t)v31, v5);
  uint64_t v11 = (__CFRunLoopSource *)objc_msgSend_objectForKey_(self->_identifierToRunLoopSourcesMap, v7, (uint64_t)v31, v8);
  if (v6) {
    CFUserNotificationCancel(v6);
  }
  if (v11) {
    CFRunLoopSourceInvalidate(v11);
  }
  id v12 = (id)objc_msgSend__dequeueUserNotificationForIdentifier_(self, v9, (uint64_t)v31, v10);
  id v15 = (id)objc_msgSend__dequeueListenerForIdentifier_(self, v13, (uint64_t)v31, v14);
  id v18 = (id)objc_msgSend__dequeueBlockForIdentifier_(self, v16, (uint64_t)v31, v17);
  objc_msgSend_removeObjectForKey_(self->_identifierToCFUserNotificationMap, v19, (uint64_t)v31, v20);
  objc_msgSend_removeObjectForKey_(self->_identifierToRunLoopSourcesMap, v21, (uint64_t)v31, v22);
  if (!objc_msgSend_count(self->_identifierToCFUserNotificationMap, v23, v24, v25))
  {
    identifierToCFUserNotificationMap = self->_identifierToCFUserNotificationMap;
    self->_identifierToCFUserNotificationMap = 0;
  }
  if (!objc_msgSend_count(self->_identifierToRunLoopSourcesMap, v26, v27, v28))
  {
    identifierToRunLoopSourcesMap = self->_identifierToRunLoopSourcesMap;
    self->_identifierToRunLoopSourcesMap = 0;
  }
}

- (void)_displayNextUserNotificationForIdentifier:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend__frontUserNotificationForIdentifier_(self, v5, (uint64_t)v4, v6);
  uint64_t v11 = v7;
  if (v7)
  {
    objc_msgSend_timeout(v7, v8, v9, v10);
    CFTimeInterval v13 = v12;
    CFOptionFlags v17 = objc_msgSend_displayFlags(v11, v14, v15, v16);
    id v21 = objc_msgSend_displayInformation(v11, v18, v19, v20);
    uint64_t v25 = (__CFDictionary *)objc_msgSend_mutableCopy(v21, v22, v23, v24);

    v29 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v26, v27, v28);
    v33 = objc_msgSend_resourceURL(v29, v30, v31, v32);

    if (v33) {
      CFDictionarySetValue(v25, (const void *)*MEMORY[0x1E4F1DA00], v33);
    }

    v37 = objc_msgSend_registration(IMRGLog, v34, v35, v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      SInt32 v48 = 138412290;
      v49 = v25;
      _os_log_impl(&dword_191892000, v37, OS_LOG_TYPE_DEFAULT, "Creating CFUserNotification with display information: %@", (uint8_t *)&v48, 0xCu);
    }

    SInt32 v48 = -1431655766;
    CFAllocatorRef v38 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v40 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13, v17, &v48, v25);
    if (!self->_identifierToCFUserNotificationMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      identifierToCFUserNotificationMap = self->_identifierToCFUserNotificationMap;
      self->_identifierToCFUserNotificationMap = Mutable;
    }
    if (v40)
    {
      objc_msgSend_setObject_forKey_(self->_identifierToCFUserNotificationMap, v39, (uint64_t)v40, (uint64_t)v4);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v38, v40, (CFUserNotificationCallBack)sub_1918BB9A8, 0);
      if (!self->_identifierToRunLoopSourcesMap)
      {
        v45 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        identifierToRunLoopSourcesMap = self->_identifierToRunLoopSourcesMap;
        self->_identifierToRunLoopSourcesMap = v45;
      }
      if (RunLoopSource)
      {
        objc_msgSend_setObject_forKey_(self->_identifierToRunLoopSourcesMap, v43, (uint64_t)RunLoopSource, (uint64_t)v4);
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        CFRelease(RunLoopSource);
      }
      CFRelease(v40);
    }
  }
}

- (void)_handleUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_allKeysForObject_(self->_identifierToCFUserNotificationMap, a2, (uint64_t)a3, a4);
  objc_msgSend_lastObject(v7, v8, v9, v10);
  id v50 = (id)objc_claimAutoreleasedReturnValue();

  CFTimeInterval v13 = objc_msgSend__dequeueUserNotificationForIdentifier_(self, v11, (uint64_t)v50, v12);
  uint64_t v16 = objc_msgSend__dequeueListenerForIdentifier_(self, v14, (uint64_t)v50, v15);
  objc_msgSend__dequeueBlockForIdentifier_(self, v17, (uint64_t)v50, v18);
  uint64_t v19 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v20 = _Block_copy(v19);
  uint64_t v24 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v21, v22, v23);

  if (v20 == v24)
  {

    uint64_t v19 = 0;
  }
  uint64_t v28 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v25, v26, v27);

  if (v16 == v28)
  {

    uint64_t v16 = 0;
  }
  objc_msgSend_objectForKey_(self->_identifierToRunLoopSourcesMap, v29, (uint64_t)v50, v30);
  uint64_t v31 = (__CFRunLoopSource *)objc_claimAutoreleasedReturnValue();
  CFRunLoopSourceInvalidate(v31);

  CFDictionaryRef ResponseDictionary = CFUserNotificationGetResponseDictionary(a3);
  objc_msgSend__setResponseFlags_responseInformation_(v13, v33, a4, (uint64_t)ResponseDictionary);
  objc_msgSend_userNotificationDidFinish_(v16, v34, (uint64_t)v13, v35);
  if (v19) {
    ((void (**)(void, void *))v19)[2](v19, v13);
  }
  objc_msgSend_removeObjectForKey_(self->_identifierToCFUserNotificationMap, v36, (uint64_t)v50, v37);
  objc_msgSend_removeObjectForKey_(self->_identifierToRunLoopSourcesMap, v38, (uint64_t)v50, v39);
  if (!objc_msgSend_count(self->_identifierToCFUserNotificationMap, v40, v41, v42))
  {
    identifierToCFUserNotificationMap = self->_identifierToCFUserNotificationMap;
    self->_identifierToCFUserNotificationMap = 0;
  }
  if (!objc_msgSend_count(self->_identifierToRunLoopSourcesMap, v43, v44, v45))
  {
    identifierToRunLoopSourcesMap = self->_identifierToRunLoopSourcesMap;
    self->_identifierToRunLoopSourcesMap = 0;
  }
  objc_msgSend__displayNextUserNotificationForIdentifier_(self, v47, (uint64_t)v50, v48);
}

- (void)addUserNotification:(id)a3 listener:(id)a4
{
}

- (void)addUserNotification:(id)a3 listener:(id)a4 completionHandler:(id)a5
{
  id v25 = a3;
  id v8 = a5;
  id v9 = a4;
  CFTimeInterval v13 = objc_msgSend_identifier(v25, v10, v11, v12);
  objc_msgSend__enqueueUserNotification_forIdentifier_(self, v14, (uint64_t)v25, (uint64_t)v13);
  objc_msgSend__enqueueListener_forIdentifier_(self, v15, (uint64_t)v9, (uint64_t)v13);

  objc_msgSend__enqueueBlock_forIdentifier_(self, v16, (uint64_t)v8, (uint64_t)v13);
  uint64_t v19 = objc_msgSend_objectForKey_(self->_identifierToCFUserNotificationMap, v17, (uint64_t)v13, v18);
  if (!v19
    || (v23 = (void *)v19, int v24 = objc_msgSend_usesNotificationCenter(v25, v20, v21, v22), v23, v24))
  {
    objc_msgSend__displayNextUserNotificationForIdentifier_(self, v20, (uint64_t)v13, v22);
  }
}

- (unint64_t)countForIdentifier:(id)a3
{
  id v4 = objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, a2, (uint64_t)a3, v3);
  unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (void)removeNotificationsForServiceIdentifier:(id)a3
{
  if (a3) {
    objc_msgSend__cancelActiveUserNotificationForIdentifier_(self, a2, (uint64_t)a3, v3);
  }
}

- (void)removeListener:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    objc_msgSend_null(MEMORY[0x1E4F1CA98], v4, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v7)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      CFTimeInterval v13 = objc_msgSend_allKeys(self->_identifierToListenerQueueMap, v10, v11, v12);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v77, (uint64_t)v83, 16);
      if (v15)
      {
        uint64_t v18 = v15;
        uint64_t v19 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v78 != v19) {
              objc_enumerationMutation(v13);
            }
            uint64_t v21 = *(void *)(*((void *)&v77 + 1) + 8 * i);
            objc_msgSend__frontListenerForIdentifier_(self, v16, v21, v17);
            id v22 = (id)objc_claimAutoreleasedReturnValue();

            if (v22 == v7)
            {
              objc_msgSend_addObject_(v9, v16, v21, v17);
              objc_msgSend__cancelActiveUserNotificationForIdentifier_(self, v23, v21, v24);
            }
          }
          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v77, (uint64_t)v83, 16);
        }
        while (v18);
      }
      v67 = v9;

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      objc_msgSend_allKeys(self->_identifierToIMUserNotificationQueueMap, v25, v26, v27);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v73, (uint64_t)v82, 16);
      if (v29)
      {
        uint64_t v32 = v29;
        uint64_t v33 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v74 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v35 = *(void *)(*((void *)&v73 + 1) + 8 * j);
            uint64_t v36 = objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, v30, v35, v31, v67);
            uint64_t v39 = objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, v37, v35, v38);
            uint64_t v42 = objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, v40, v35, v41);
            if (objc_msgSend_count(v36, v43, v44, v45))
            {
              unint64_t v48 = 0;
              do
              {
                objc_msgSend_objectAtIndex_(v36, v46, v48, v47);
                id v51 = (id)objc_claimAutoreleasedReturnValue();
                if (v51 == v7)
                {
                  objc_msgSend_removeObjectAtIndex_(v36, v49, v48, v50);
                  objc_msgSend_removeObjectAtIndex_(v39, v52, v48, v53);
                  objc_msgSend_removeObjectAtIndex_(v42, v54, v48, v55);
                }
                else
                {
                  ++v48;
                }
              }
              while (v48 < objc_msgSend_count(v36, v56, v57, v58));
            }
          }
          uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v73, (uint64_t)v82, 16);
        }
        while (v32);
      }

      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v59 = v67;
      uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v69, (uint64_t)v81, 16);
      if (v61)
      {
        uint64_t v64 = v61;
        uint64_t v65 = *(void *)v70;
        do
        {
          for (uint64_t k = 0; k != v64; ++k)
          {
            if (*(void *)v70 != v65) {
              objc_enumerationMutation(v59);
            }
            objc_msgSend__displayNextUserNotificationForIdentifier_(self, v62, *(void *)(*((void *)&v69 + 1) + 8 * k), v63, v67);
          }
          uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v69, (uint64_t)v81, 16);
        }
        while (v64);
      }
    }
  }
}

- (void)removeAllListeners
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = objc_msgSend_allKeys(self->_identifierToIMUserNotificationQueueMap, a2, v2, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v35;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend__cancelActiveUserNotificationForIdentifier_(self, v8, *(void *)(*((void *)&v34 + 1) + 8 * v12++), v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v10);
  }

  objc_msgSend_removeAllObjects(self->_identifierToIMUserNotificationQueueMap, v13, v14, v15);
  objc_msgSend_removeAllObjects(self->_identifierToListenerQueueMap, v16, v17, v18);
  objc_msgSend_removeAllObjects(self->_identifierToBlockQueueMap, v19, v20, v21);
  if (!objc_msgSend_count(self->_identifierToIMUserNotificationQueueMap, v22, v23, v24))
  {
    identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
    self->_identifierToIMUserNotificationQueueMap = 0;
  }
  if (!objc_msgSend_count(self->_identifierToListenerQueueMap, v25, v26, v27))
  {
    identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
    self->_identifierToListenerQueueMap = 0;
  }
  if (!objc_msgSend_count(self->_identifierToBlockQueueMap, v29, v30, v31))
  {
    identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
    self->_identifierToBlockQueueMap = 0;
  }
}

- (NSMutableDictionary)identifierToIMUserNotificationQueueMap
{
  return self->_identifierToIMUserNotificationQueueMap;
}

- (void)setIdentifierToIMUserNotificationQueueMap:(id)a3
{
}

- (NSMutableDictionary)identifierToListenerQueueMap
{
  return self->_identifierToListenerQueueMap;
}

- (void)setIdentifierToListenerQueueMap:(id)a3
{
}

- (NSMutableDictionary)identifierToBlockQueueMap
{
  return self->_identifierToBlockQueueMap;
}

- (void)setIdentifierToBlockQueueMap:(id)a3
{
}

- (NSMutableDictionary)identifierToRunLoopSourcesMap
{
  return self->_identifierToRunLoopSourcesMap;
}

- (void)setIdentifierToRunLoopSourcesMap:(id)a3
{
}

- (NSMutableDictionary)identifierToCFUserNotificationMap
{
  return self->_identifierToCFUserNotificationMap;
}

- (void)setIdentifierToCFUserNotificationMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToCFUserNotificationMap, 0);
  objc_storeStrong((id *)&self->_identifierToRunLoopSourcesMap, 0);
  objc_storeStrong((id *)&self->_identifierToBlockQueueMap, 0);
  objc_storeStrong((id *)&self->_identifierToListenerQueueMap, 0);
  objc_storeStrong((id *)&self->_identifierToIMUserNotificationQueueMap, 0);
}

@end