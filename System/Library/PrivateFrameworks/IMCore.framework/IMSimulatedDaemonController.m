@interface IMSimulatedDaemonController
+ (id)dictionaryForChat:(id)a3;
+ (id)sharedInstance;
+ (void)beginSimulatingDaemon;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5;
- (BOOL)isConnected;
- (NSArray)listeners;
- (unsigned)capabilitiesForListenerID:(id)a3;
- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6;
- (void)setListeners:(id)a3;
@end

@implementation IMSimulatedDaemonController

+ (id)sharedInstance
{
  if (qword_1EB3F2458 != -1) {
    dispatch_once(&qword_1EB3F2458, &unk_1EF8E5498);
  }
  v2 = (void *)qword_1EB3F24A8;

  return v2;
}

+ (void)beginSimulatingDaemon
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4BC54F4;
  block[3] = &unk_1E5B7B2A8;
  block[4] = a1;
  if (qword_1E965E968 != -1) {
    dispatch_once(&qword_1E965E968, block);
  }
}

+ (id)dictionaryForChat:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9 = objc_msgSend_account(v4, v6, v7, v8);
  v13 = objc_msgSend_uniqueID(v9, v10, v11, v12);
  objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, @"accountdID");

  v18 = objc_msgSend_chatIdentifier(v4, v15, v16, v17);
  objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, @"chatIdentifier");

  v23 = objc_msgSend_guid(v4, v20, v21, v22);
  objc_msgSend_setObject_forKey_(v5, v24, (uint64_t)v23, @"guid");

  v25 = NSNumber;
  unsigned int v29 = objc_msgSend_chatStyle(v4, v26, v27, v28);
  v32 = objc_msgSend_numberWithInteger_(v25, v30, v29, v31);
  objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v32, @"style");

  v34 = NSNumber;
  uint64_t v38 = objc_msgSend_joinState(v4, v35, v36, v37);

  v41 = objc_msgSend_numberWithInteger_(v34, v39, v38, v40);
  objc_msgSend_setObject_forKey_(v5, v42, (uint64_t)v41, @"chatIdentifier");

  return v5;
}

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = objc_msgSend_listeners(self, v14, v15, v16, 0);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend_simulatedDaemon_willSendBalloonPayload_attachments_messageGUID_bundleID_(*(void **)(*((void *)&v24 + 1) + 8 * v23++), v20, (uint64_t)self, (uint64_t)v10, v11, v12, v13);
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v21);
  }
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  return 1;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  return 1;
}

- (BOOL)isConnected
{
  return 1;
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IMSimulatedDaemonController;
  return *MEMORY[0x1E4F6C560] | [(IMDaemonController *)&v4 capabilitiesForListenerID:a3] | *MEMORY[0x1E4F6C508];
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end