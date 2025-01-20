@interface MMCSController
+ (id)parseContentHeaderAsDictionary:(id)a3 treatValuesAsArrays:(BOOL)a4;
+ (id)serialControllerQueue;
+ (void)preMMCSWarm;
- (BOOL)_getTransfers:(id)a3 requestURL:(id)a4 requestorID:(id)a5 sourceAppID:(id)a6 token:(id)a7 error:(id *)a8;
- (BOOL)_putTransfers:(id)a3 requestURL:(id)a4 requestorID:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 token:(id)a8 error:(id *)a9;
- (BOOL)_unregisterTransfers:(id)a3;
- (BOOL)isActive;
- (BOOL)unregisterFiles:(id)a3;
- (MMCSController)initWithQueue:(id)a3;
- (NSMutableDictionary)transferIDToContextMap;
- (NSMutableDictionary)transfers;
- (NSRecursiveLock)transferIDContextMapLock;
- (OS_dispatch_queue)replyQueue;
- (_mmcs_engine)_engine;
- (id)_MMCSICloudRequestHeadersCopy:(__CFString *)a3;
- (id)_optionsForFiles:(id)a3 sourceAppID:(id)a4;
- (id)_registeredTransferForGUID:(id)a3;
- (id)_registeredTransferForItemID:(unint64_t)a3;
- (id)getContentHeadersAsString;
- (int64_t)connectionBehavior;
- (void)_addPreauthorizationOptions:(id)a3 forFiles:(id)a4;
- (void)_addRequestorContext:(id)a3 transferID:(id)a4;
- (void)_cancelRequest:(id)a3;
- (void)_getItemCompleted:(id)a3 path:(id)a4 error:(id)a5;
- (void)_getItemUpdated:(id)a3 progress:(double)a4 state:(int)a5 error:(id)a6;
- (void)_handleRegistrationForMMCSPutFile:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5;
- (void)_invalidatePowerAssertionTimer;
- (void)_itemCompleted:(id)a3;
- (void)_processCompletedItem:(id)a3 error:(id)a4;
- (void)_putItemCompleted:(id)a3 error:(id)a4;
- (void)_putItemUpdated:(id)a3 progress:(double)a4 state:(int)a5 error:(id)a6;
- (void)_registerFiles:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5;
- (void)_registerPowerAssertionIfNeeded;
- (void)_registerTransfers:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5;
- (void)_releasePowerAssertion;
- (void)_releasePowerAssertionAndSimulateCrash;
- (void)_removeRequestorContext:(id)a3 transferID:(id)a4;
- (void)_schedulePowerAssertionTimer;
- (void)_setScheduledTransfers:(id)a3 block:(id)a4;
- (void)_unregisterPowerAssertion;
- (void)cancelPutRequestID:(id)a3;
- (void)dealloc;
- (void)getFiles:(id)a3 requestURL:(id)a4 requestorID:(id)a5 sourceAppID:(id)a6 authToken:(id)a7 completionBlock:(id)a8;
- (void)putFiles:(id)a3 requestURL:(id)a4 requestorID:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 authToken:(id)a8 preauthenticate:(BOOL)a9 completionBlock:(id)a10;
- (void)registerFilesForDownload:(id)a3 completionBlock:(id)a4;
- (void)registerFilesForUpload:(id)a3 withPreauthentication:(BOOL)a4 completionBlock:(id)a5;
- (void)setConnectionBehavior:(int64_t)a3;
- (void)setReplyQueue:(id)a3;
- (void)setTransferIDContextMapLock:(id)a3;
@end

@implementation MMCSController

- (MMCSController)initWithQueue:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MMCSController;
  v4 = [(MMCSController *)&v14 init];
  v9 = v4;
  if (v4)
  {
    objc_msgSend__engine(v4, v5, v6, v7, v8);
    v9->_powerAssertionTimer = 0;
    v9->_transferIDContextMapLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    objc_msgSend_setReplyQueue_(v9, v10, (uint64_t)a3, v11, v12);
  }
  return v9;
}

- (void)_releasePowerAssertionAndSimulateCrash
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend_count(self->_transfers, v7, v8, v9, v10);
      id powerAssertion = self->_powerAssertion;
      int v23 = 134218498;
      uint64_t v24 = 0x4082C00000000000;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      id v28 = powerAssertion;
      _os_log_impl(&dword_23C260000, v11, OS_LOG_TYPE_INFO, "Power assertion timed out after %f secs, %ld transfers remaining: %@", (uint8_t *)&v23, 0x20u);
    }
  }
  objc_msgSend__releasePowerAssertion(self, v7, v8, v9, v10);
  IMLogBacktrace();
  v18 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], v14, v15, v16, v17);
  objc_msgSend_processName(v18, v19, v20, v21, v22);
  IMLogSimulateCrashForProcess();
}

- (void)_releasePowerAssertion
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (self->_powerAssertion)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id powerAssertion = self->_powerAssertion;
        int v9 = 138412290;
        id v10 = powerAssertion;
        _os_log_impl(&dword_23C260000, v7, OS_LOG_TYPE_INFO, "Releasing power assertion %@", (uint8_t *)&v9, 0xCu);
      }
    }

    self->_id powerAssertion = 0;
  }
}

- (void)_invalidatePowerAssertionTimer
{
  uint64_t v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  powerAssertionTimer = self->_powerAssertionTimer;
  if (powerAssertionTimer)
  {
    objc_msgSend_invalidate(powerAssertionTimer, v7, v8, v9, v10);

    self->_powerAssertionTimer = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_23C260000, v12, OS_LOG_TYPE_INFO, "Power Assertion Timer invalidated", v13, 2u);
      }
    }
  }
}

- (void)_schedulePowerAssertionTimer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      uint64_t v14 = 0x4082C00000000000;
      _os_log_impl(&dword_23C260000, v11, OS_LOG_TYPE_INFO, "Extending power assertion timer by %f seconds", (uint8_t *)&v13, 0xCu);
    }
  }
  objc_msgSend__invalidatePowerAssertionTimer(self, v7, v8, v9, v10);
  self->_powerAssertionTimer = (NSTimer *)(id)objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], v12, (uint64_t)self, (uint64_t)sel__releasePowerAssertionAndSimulateCrash, 0, 0, 600.0);
}

- (void)_unregisterPowerAssertion
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = objc_msgSend_count(self->_transfers, v7, v8, v9, v10);
      id powerAssertion = self->_powerAssertion;
      v26[0] = 67109378;
      v26[1] = v12;
      __int16 v27 = 2112;
      id v28 = powerAssertion;
      _os_log_impl(&dword_23C260000, v11, OS_LOG_TYPE_INFO, "Clearing power assertion, we have %d transfers (%@)", (uint8_t *)v26, 0x12u);
    }
  }
  objc_msgSend__invalidatePowerAssertionTimer(self, v7, v8, v9, v10);
  objc_msgSend__releasePowerAssertion(self, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_sharedInstance(MEMORY[0x263F4A848], v18, v19, v20, v21);
  objc_msgSend_removeFastDormancyDisableToken_(v22, v23, @"iMessageMMCSFastDormancyAssertion", v24, v25);
}

- (void)_registerPowerAssertionIfNeeded
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (self->_powerAssertion)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v12 = objc_msgSend_count(self->_transfers, v8, v9, v10, v11);
        id powerAssertion = self->_powerAssertion;
        int v33 = 67109378;
        int v34 = v12;
        __int16 v35 = 2112;
        id v36 = powerAssertion;
        uint64_t v14 = "power assertion already exists- we have %d transfers (%@)";
LABEL_8:
        _os_log_impl(&dword_23C260000, v7, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v33, 0x12u);
      }
    }
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x263F33220]);
    self->_id powerAssertion = (id)objc_msgSend_initWithIdentifier_(v15, v16, @"iMessageMMCSController", v17, v18);
    int v23 = objc_msgSend_sharedInstance(MEMORY[0x263F4A848], v19, v20, v21, v22);
    objc_msgSend_addFastDormancyDisableToken_(v23, v24, @"iMessageMMCSFastDormancyAssertion", v25, v26);
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v31 = objc_msgSend_count(self->_transfers, v27, v28, v29, v30);
        id v32 = self->_powerAssertion;
        int v33 = 67109378;
        int v34 = v31;
        __int16 v35 = 2112;
        id v36 = v32;
        uint64_t v14 = "Creating power assertion, we have %d transfers (%@)";
        goto LABEL_8;
      }
    }
  }
}

- (void)dealloc
{
  transfers = self->_transfers;
  if (transfers)
  {

    self->_transfers = 0;
  }
  if (self->_engine)
  {
    uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
    dispatch_assert_queue_not_V2(v7);
    int v12 = objc_msgSend_serialControllerQueue(MMCSController, v8, v9, v10, v11);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23C2618A8;
    block[3] = &unk_264E3AD68;
    block[4] = self;
    dispatch_sync(v12, block);
    self->_engine = 0;
  }
  if (self->_chunkStoreURL)
  {
    int v13 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3, v4);
    objc_msgSend_removeItemAtURL_error_(v13, v14, (uint64_t)self->_chunkStoreURL, 0, v15);
    chunkStoreURL = self->_chunkStoreURL;
    if (chunkStoreURL)
    {
      CFRelease(chunkStoreURL);
      self->_chunkStoreURL = 0;
    }
  }
  objc_msgSend__unregisterPowerAssertion(self, a2, v2, v3, v4);

  self->_transferIDToContextMap = 0;
  self->_transferIDContextMapLock = 0;

  self->_replyQueue = 0;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C260000, v17, OS_LOG_TYPE_INFO, "MMCS Controller dealloc", buf, 2u);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)MMCSController;
  [(MMCSController *)&v18 dealloc];
}

- (void)_addPreauthorizationOptions:(id)a3 forFiles:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v6);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v7, (uint64_t)&v46, (uint64_t)v58, 16);
  if (v12)
  {
    int v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v47;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = v14;
      if (*(void *)v47 != v15) {
        objc_enumerationMutation(a4);
      }
      objc_super v18 = *(void **)(*((void *)&v46 + 1) + 8 * v16);
      uint64_t v14 = objc_msgSend_authResponseData(v18, v8, v9, v10, v11);
      if (!v14) {
        return;
      }
      if (v17 && (objc_msgSend_isEqualToData_(v17, v19, (uint64_t)v14, v20, v21) & 1) == 0) {
        break;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          __int16 v27 = objc_msgSend_authResponseData(v18, v23, v24, v25, v26);
          uint64_t v32 = objc_msgSend_length(v27, v28, v29, v30, v31);
          uint64_t v37 = objc_msgSend_guid(v18, v33, v34, v35, v36);
          *(_DWORD *)buf = 134218242;
          uint64_t v51 = v32;
          __int16 v52 = 2112;
          uint64_t v53 = v37;
          _os_log_impl(&dword_23C260000, v22, OS_LOG_TYPE_INFO, "Preauthorizing MMCS request with auth data of length %tu (file: %@)", buf, 0x16u);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v38 = objc_msgSend_protocolVersion(v18, v8, v9, v10, v11);
        if (!v38) {
          return;
        }
        if (v13 && (objc_msgSend_isEqualToString_(v13, v8, v38, v10, v11) & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v44 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v51 = (uint64_t)a4;
              __int16 v52 = 2112;
              uint64_t v53 = (uint64_t)v13;
              __int16 v54 = 2112;
              uint64_t v55 = v38;
              v41 = "MMCSPutFiles %@ have different protocol versions: %@ vs. %@";
              v42 = v44;
              uint32_t v43 = 32;
              goto LABEL_27;
            }
          }
          return;
        }
        int v13 = (void *)v38;
      }
      if (v12 == ++v16)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v8, (uint64_t)&v46, (uint64_t)v58, 16);
        if (v12) {
          goto LABEL_3;
        }
        CFDictionarySetValue((CFMutableDictionaryRef)a3, (const void *)*MEMORY[0x263F53528], v14);
        if (v13) {
          CFDictionarySetValue((CFMutableDictionaryRef)a3, (const void *)*MEMORY[0x263F53540], v13);
        }
        return;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = objc_opt_class();
        *(_DWORD *)buf = 138413058;
        uint64_t v51 = v40;
        __int16 v52 = 2112;
        uint64_t v53 = (uint64_t)a4;
        __int16 v54 = 2112;
        uint64_t v55 = (uint64_t)v17;
        __int16 v56 = 2112;
        v57 = v14;
        v41 = "%@s %@ have different auth data: %@ vs. %@";
        v42 = v39;
        uint32_t v43 = 42;
LABEL_27:
        _os_log_impl(&dword_23C260000, v42, OS_LOG_TYPE_INFO, v41, buf, v43);
      }
    }
  }
}

- (id)_optionsForFiles:(id)a3 sourceAppID:(id)a4
{
  uint64_t v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  uint64_t v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v10 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v14 = (const void *)objc_msgSend_numberWithBool_(NSNumber, v11, 1, v12, v13);
  if (v14) {
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x263F534C0], v14);
  }
  objc_super v18 = (const void *)objc_msgSend_numberWithBool_(NSNumber, v15, 1, v16, v17);
  if (v18) {
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x263F534C8], v18);
  }
  objc_msgSend__addPreauthorizationOptions_forFiles_(self, v19, (uint64_t)v9, (uint64_t)a3, v20);
  if (a4)
  {
    uint64_t v25 = (const void *)*MEMORY[0x263F53548];
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x263F53548], a4);
    CFDictionarySetValue(v10, v25, a4);
  }
  if (objc_msgSend_connectionBehavior(self, v21, v22, v23, v24) == 1)
  {
    uint64_t v30 = (const void *)objc_msgSend_numberWithBool_(NSNumber, v26, 0, v28, v29);
    if (v30) {
      CFDictionarySetValue(v10, (const void *)*MEMORY[0x263EFC778], v30);
    }
    CFDictionarySetValue(v10, (const void *)*MEMORY[0x263EFC748], @"en0");
  }
  uint64_t v31 = NSNumber;
  uint64_t v32 = objc_msgSend_currentThread(MEMORY[0x263F08B88], v26, v27, v28, v29);
  uint64_t v37 = objc_msgSend_qualityOfService(v32, v33, v34, v35, v36);
  uint64_t v41 = objc_msgSend_numberWithInteger_(v31, v38, v37, v39, v40);
  objc_msgSend_setObject_forKey_(v10, v42, v41, *MEMORY[0x263F53530], v43);
  uint64_t v47 = *MEMORY[0x263F4A8E0];
  if (*MEMORY[0x263F4A8E0]) {
    objc_msgSend_setObject_forKey_(v10, v44, v47, *MEMORY[0x263EFC810], v46);
  }
  if (objc_msgSend_count(v10, v44, v47, v45, v46)) {
    objc_msgSend_setObject_forKey_(v9, v48, (uint64_t)v10, *MEMORY[0x263F53550], v49);
  }

  return v9;
}

- (_mmcs_engine)_engine
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  result = self->_engine;
  if (!result)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = NSTemporaryDirectory();
    uint64_t v10 = objc_msgSend_stringGUID(NSString, v6, v7, v8, v9);
    uint64_t v18 = objc_msgSend_stringByAppendingPathComponent_(v5, v11, v10, v12, v13);
    chunkStoreURL = self->_chunkStoreURL;
    if (chunkStoreURL)
    {
      CFRelease(chunkStoreURL);
      self->_chunkStoreURL = 0;
    }
    uint64_t v20 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v14, v15, v16, v17);
    if (objc_msgSend_makeDirectoriesInPath_mode_(v20, v21, v18, 509, v22)) {
      self->_chunkStoreURL = (__CFURL *)(id)objc_msgSend_fileURLWithPath_(NSURL, v23, v18, v24, v25);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = self->_chunkStoreURL;
        *(_DWORD *)buf = 138412546;
        v42 = v31;
        __int16 v43 = 2112;
        id v44 = v4;
        _os_log_impl(&dword_23C260000, v30, OS_LOG_TYPE_INFO, "Creating engine with temp url: %@ options: %@", buf, 0x16u);
      }
    }
    self->_currentItemID = 100;
    objc_msgSend_serialControllerQueue(MMCSController, v26, v27, v28, v29);
    if (qword_26AEE39F0 != -1) {
      dispatch_once(&qword_26AEE39F0, &unk_26EFE70A8);
    }
    uint64_t v32 = (_mmcs_engine *)MMCSEngineCreateWithTargetDispatchQueue();
    self->_engine = v32;
    BOOL v33 = v32 == 0;
    int v34 = IMOSLoggingEnabled();
    if (v33)
    {
      if (!v34) {
        goto LABEL_19;
      }
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      uint64_t v37 = "Failed to create MMCS engine";
      uint64_t v38 = v40;
      uint32_t v39 = 2;
    }
    else
    {
      if (!v34) {
        goto LABEL_19;
      }
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      engine = self->_engine;
      *(_DWORD *)buf = 134217984;
      v42 = engine;
      uint64_t v37 = "Created engine: %p";
      uint64_t v38 = v35;
      uint32_t v39 = 12;
    }
    _os_log_impl(&dword_23C260000, v38, OS_LOG_TYPE_INFO, v37, buf, v39);
LABEL_19:

    return self->_engine;
  }
  return result;
}

- (id)_registeredTransferForGUID:(id)a3
{
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  transfers = self->_transfers;
  return (id)objc_msgSend_objectForKey_(transfers, v8, (uint64_t)a3, v9, v10);
}

- (id)_registeredTransferForItemID:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = objc_msgSend_allValues(self->_transfers, v8, v9, v10, v11, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v30, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
LABEL_3:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v25 != v19) {
        objc_enumerationMutation(v12);
      }
      uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * v20);
      if (objc_msgSend_itemID(v21, v14, v15, v16, v17) == a3) {
        break;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v24, (uint64_t)v30, 16);
        if (v18) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v29 = a3;
        _os_log_impl(&dword_23C260000, v22, OS_LOG_TYPE_INFO, "Found no registered transfer for transfer id: %qx", buf, 0xCu);
      }
    }
    return 0;
  }
  return v21;
}

- (void)_handleRegistrationForMMCSPutFile:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  v42[3] = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v9);
  objc_msgSend_setRegistrationBlock_(a3, v10, (uint64_t)a5, v11, v12);
  v41[0] = *MEMORY[0x263F53538];
  uint64_t v16 = objc_msgSend_numberWithBool_(NSNumber, v13, v6, v14, v15);
  uint64_t v17 = *MEMORY[0x263F53500];
  uint64_t v18 = MEMORY[0x263EFFA88];
  v42[0] = v16;
  v42[1] = MEMORY[0x263EFFA88];
  uint64_t v19 = *MEMORY[0x263F53520];
  v41[1] = v17;
  v41[2] = v19;
  uint64_t v20 = NSNumber;
  uint64_t v25 = objc_msgSend_itemID(a3, v21, v22, v23, v24, *MEMORY[0x263F534E8]);
  uint64_t v29 = objc_msgSend_numberWithUnsignedLongLong_(v20, v26, v25, v27, v28);
  v38[1] = *MEMORY[0x263F53508];
  v39[0] = v29;
  v39[1] = v18;
  uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v39, (uint64_t)v38, 2);
  v42[2] = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v31, (uint64_t)&v40, 1, v32);
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v42, (uint64_t)v41, 3);
  objc_msgSend__engine(self, v34, v35, v36, v37);
  MMCSRegisterItems();
}

- (void)_registerTransfers:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v66 = a4;
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v8);
  if (objc_msgSend_count(a3, v9, v10, v11, v12))
  {
    v91[0] = 0;
    v91[1] = v91;
    v91[2] = 0x2020000000;
    char v92 = 1;
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x2020000000;
    char v90 = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    v81 = sub_23C264364;
    v82 = &unk_264E3AD90;
    v83 = self;
    id v84 = a5;
    v85 = &v87;
    v86 = v91;
    uint64_t v13 = objc_opt_new();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v76, (uint64_t)v98, 16);
    if (!v19) {
      goto LABEL_27;
    }
    uint64_t v20 = *(void *)v77;
    while (1)
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v77 != v20) {
          objc_enumerationMutation(a3);
        }
        uint64_t v22 = *(void **)(*((void *)&v76 + 1) + 8 * v21);
        uint64_t v23 = objc_msgSend_guid(v22, v15, v16, v17, v18);
        uint64_t v30 = objc_msgSend__registeredTransferForGUID_(self, v24, v23, v25, v26);
        if (v30)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v31 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v30;
              _os_log_impl(&dword_23C260000, v31, OS_LOG_TYPE_INFO, "Returning existing file transfer: %@", buf, 0xCu);
            }
          }
          *((unsigned char *)v88 + 24) = 0;
        }
        else
        {
          unint64_t v32 = self->_currentItemID + 1;
          self->_currentItemID = v32;
          objc_msgSend_setItemID_(v22, v27, v32, v28, v29);
          transfers = self->_transfers;
          if (!transfers)
          {
            transfers = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            self->_transfers = transfers;
          }
          uint64_t v38 = objc_msgSend_guid(v22, v33, v34, v35, v36);
          objc_msgSend_setObject_forKey_(transfers, v39, (uint64_t)v22, v38, v40);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_addObject_(v13, v41, (uint64_t)v22, v42, v43);
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (IMOSLoggingEnabled())
            {
              id v44 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v22;
                uint64_t v45 = v44;
                uint64_t v46 = "Registered mmcs get transfer: %@";
                uint32_t v47 = 12;
LABEL_25:
                _os_log_impl(&dword_23C260000, v45, OS_LOG_TYPE_INFO, v46, buf, v47);
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            long long v48 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              uint64_t v49 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v22;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v49;
              uint64_t v45 = v48;
              uint64_t v46 = "Attempted to register unknown transfer %@ of type %@";
              uint32_t v47 = 22;
              goto LABEL_25;
            }
          }
        }
LABEL_16:
        ++v21;
      }
      while (v19 != v21);
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v15, (uint64_t)&v76, (uint64_t)v98, 16);
      uint64_t v19 = v50;
      if (!v50)
      {
LABEL_27:
        if (objc_msgSend_count(v13, v15, v16, v17, v18))
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3052000000;
          v95 = sub_23C2643F8;
          v96 = sub_23C264408;
          dispatch_group_t v97 = 0;
          dispatch_group_t v97 = dispatch_group_create();
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          obj = v13;
          uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v51, (uint64_t)&v72, (uint64_t)v93, 16);
          if (v56)
          {
            uint64_t v57 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v56; ++i)
              {
                if (*(void *)v73 != v57) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v59 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                id location = 0;
                objc_initWeak(&location, self);
                id from = 0;
                objc_initWeak(&from, v59);
                dispatch_group_enter(*(dispatch_group_t *)(*(void *)&buf[8] + 40));
                v67[0] = MEMORY[0x263EF8330];
                v67[1] = 3221225472;
                v67[2] = sub_23C264414;
                v67[3] = &unk_264E3ADB8;
                objc_copyWeak(&v68, &location);
                objc_copyWeak(&v69, &from);
                v67[4] = self;
                v67[5] = v91;
                v67[6] = buf;
                objc_msgSend__handleRegistrationForMMCSPutFile_preauthenticate_completionBlock_(self, v60, (uint64_t)v59, v66, (uint64_t)v67);
                objc_destroyWeak(&v69);
                objc_destroyWeak(&v68);
                objc_destroyWeak(&from);
                objc_destroyWeak(&location);
              }
              uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v72, (uint64_t)v93, 16);
            }
            while (v56);
          }
          v62 = *(NSObject **)(*(void *)&buf[8] + 40);
          v63 = objc_msgSend_serialControllerQueue(MMCSController, v52, v53, v54, v55);
          dispatch_group_notify(v62, v63, block);
          dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
          if (obj) {

          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          ((void (*)(void *))v81)(block);
          if (v13) {
        }
          }
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(v91, 8);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v64 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C260000, v64, OS_LOG_TYPE_INFO, "Empty files array supplied to register, failing", buf, 2u);
    }
  }
  (*((void (**)(id, void))a5 + 2))(a5, 0);
}

- (BOOL)_unregisterTransfers:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v55, (uint64_t)v61, 16);
  if (v13)
  {
    uint64_t v15 = *(void *)v56;
    *(void *)&long long v14 = 138412290;
    long long v54 = v14;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v56 != v15) {
          objc_enumerationMutation(a3);
        }
        uint64_t v17 = *(void **)(*((void *)&v55 + 1) + 8 * v16);
        if (IMOSLoggingEnabled())
        {
          uint64_t v22 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v54;
            v60 = v17;
            _os_log_impl(&dword_23C260000, v22, OS_LOG_TYPE_INFO, "Unregistering file transfer: %@", buf, 0xCu);
          }
        }
        transfers = self->_transfers;
        uint64_t v24 = objc_msgSend_guid(v17, v18, v19, v20, v21, v54);
        uint64_t v28 = objc_msgSend_objectForKey_(transfers, v25, v24, v26, v27);
        int v29 = IMOSLoggingEnabled();
        if (v28)
        {
          if (v29)
          {
            uint64_t v34 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v54;
              v60 = v28;
              _os_log_impl(&dword_23C260000, v34, OS_LOG_TYPE_INFO, " => Unregistering: %@", buf, 0xCu);
            }
          }
          objc_msgSend__engine(self, v30, v31, v32, v33);
          objc_msgSend_itemID(v28, v35, v36, v37, v38);
          MMCSUnregisterFile();
          uint32_t v39 = self->_transfers;
          uint64_t v44 = objc_msgSend_guid(v17, v40, v41, v42, v43);
          objc_msgSend_removeObjectForKey_(v39, v45, v44, v46, v47);
          if (!objc_msgSend_count(self->_transfers, v48, v49, v50, v51))
          {

            self->_transfers = 0;
          }
        }
        else if (v29)
        {
          __int16 v52 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23C260000, v52, OS_LOG_TYPE_INFO, "Found no transfer to unregister", buf, 2u);
          }
        }
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v30, (uint64_t)&v55, (uint64_t)v61, 16);
    }
    while (v13);
  }
  if (!self->_transfers) {
    objc_msgSend__unregisterPowerAssertion(self, v9, v10, v11, v12);
  }
  return 1;
}

- (void)_setScheduledTransfers:(id)a3 block:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  if (a4)
  {
    if (!self->_requestIDToBlockMap) {
      self->_requestIDToBlockMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    if (!self->_transferToRequestIDsMap) {
      self->_transferToRequestIDsMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v53 = a4;
    if (!self->_requestIDToRemainingTransfersMap) {
      self->_requestIDToRemainingTransfersMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    if (!self->_requestIDToTransfersMap) {
      self->_requestIDToTransfersMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v13 = objc_msgSend_stringGUID(NSString, v9, v10, v11, v12);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v54, (uint64_t)v58, 16);
    if (v15)
    {
      uint64_t v20 = v15;
      uint64_t v21 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v55 != v21) {
            objc_enumerationMutation(a3);
          }
          uint64_t v23 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          transferToRequestIDsMap = self->_transferToRequestIDsMap;
          uint64_t v25 = objc_msgSend_guid(v23, v16, v17, v18, v19);
          id v32 = (id)objc_msgSend_objectForKey_(transferToRequestIDsMap, v26, v25, v27, v28);
          if (!v32) {
            id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          objc_msgSend_addObject_(v32, v29, v13, v30, v31);
          uint64_t v33 = self->_transferToRequestIDsMap;
          uint64_t v38 = objc_msgSend_guid(v23, v34, v35, v36, v37);
          objc_msgSend_setObject_forKey_(v33, v39, (uint64_t)v32, v38, v40);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v16, (uint64_t)&v54, (uint64_t)v58, 16);
      }
      while (v20);
    }
    uint64_t v41 = objc_msgSend_copy(v53, v16, v17, v18, v19);
    objc_msgSend_setObject_forKey_(self->_requestIDToBlockMap, v42, (uint64_t)v41, v13, v43);

    long long v48 = objc_msgSend_mutableCopy(a3, v44, v45, v46, v47);
    objc_msgSend_setObject_forKey_(self->_requestIDToRemainingTransfersMap, v49, (uint64_t)v48, v13, v50);
    objc_msgSend_setObject_forKey_(self->_requestIDToTransfersMap, v51, (uint64_t)a3, v13, v52);
  }
}

- (BOOL)_putTransfers:(id)a3 requestURL:(id)a4 requestorID:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 token:(id)a8 error:(id *)a9
{
  *(void *)&v53[5] = *MEMORY[0x263EF8340];
  uint64_t v16 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v16);
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v53 = a3;
      _os_log_impl(&dword_23C260000, v21, OS_LOG_TYPE_INFO, "Make put transfer request for transfers: %@", buf, 0xCu);
    }
  }
  if (!objc_msgSend__engine(self, v17, v18, v19, v20))
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v45 = " => Could not generate engine, failing";
    goto LABEL_29;
  }
  if (!a4)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v45 = " => empty requestURL";
    goto LABEL_29;
  }
  if (!a5)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v45 = " => empty requestorID";
    goto LABEL_29;
  }
  if (!a8)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v45 = " => empty authToken";
LABEL_29:
    _os_log_impl(&dword_23C260000, v44, OS_LOG_TYPE_INFO, v45, buf, 2u);
    return 0;
  }
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  long long v48 = 0;
  uint64_t v49 = 0;
  objc_msgSend_count(a3, v22, v23, v24, v25);
  sub_23C26501C(a3, (const char *)a5, (uint64_t)a4, (uint64_t)a8);
  if (sub_23C265138(a3, (char *)&v51, &v50, (uint64_t)&v49, (uint64_t)&v48))
  {
    uint64_t v28 = objc_msgSend__optionsForFiles_sourceAppID_(self, v26, (uint64_t)a3, (uint64_t)a7, v27);
    int v29 = [MMCSRequestorContext alloc];
    uint64_t v32 = objc_msgSend_initWithController_transferID_(v29, v30, (uint64_t)self, (uint64_t)a6, v31);
    objc_msgSend__addRequestorContext_transferID_(self, v33, v32, (uint64_t)a6, v34);
    if (IMOSLoggingEnabled())
    {
      uint32_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = objc_msgSend_count(v28, v35, v36, v37, v38);
        *(_DWORD *)buf = 134217984;
        *(void *)id v53 = v40;
        _os_log_impl(&dword_23C260000, v39, OS_LOG_TYPE_INFO, "Calling MMCSPutItems: requestOptions has %tu keys.", buf, 0xCu);
      }
    }
    objc_msgSend__engine(self, v35, v36, v37, v38);
    int v41 = MMCSPutItems();
    BOOL v42 = v41 != 0;
    if (a9) {
      *a9 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53[0] = v41 != 0;
        LOWORD(v53[1]) = 2112;
        *(void *)((char *)&v53[1] + 2) = 0;
        _os_log_impl(&dword_23C260000, v43, OS_LOG_TYPE_INFO, "Returning success: %d   error: %@", buf, 0x12u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C260000, v47, OS_LOG_TYPE_INFO, "Failed to generate item set", buf, 2u);
      }
    }
    BOOL v42 = 0;
  }
  sub_23C2654E4(a3, (const char *)&v51, &v50, &v49, &v48);
  return v42;
}

- (BOOL)_getTransfers:(id)a3 requestURL:(id)a4 requestorID:(id)a5 sourceAppID:(id)a6 token:(id)a7 error:(id *)a8
{
  *(void *)&v53[5] = *MEMORY[0x263EF8340];
  uint64_t v15 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v15);
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v53 = a3;
      _os_log_impl(&dword_23C260000, v20, OS_LOG_TYPE_INFO, "Make get transfer request for transfers: %@", buf, 0xCu);
    }
  }
  if (!objc_msgSend__engine(self, v16, v17, v18, v19))
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v46 = " => Could not generate engine, failing";
    goto LABEL_38;
  }
  if (!a4)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v46 = " => empty requestURL";
    goto LABEL_38;
  }
  if (!a5)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v46 = " => empty requestorID";
    goto LABEL_38;
  }
  if (!a7)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v46 = " => empty authToken";
LABEL_38:
    _os_log_impl(&dword_23C260000, v45, OS_LOG_TYPE_INFO, v46, buf, 2u);
    return 0;
  }
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v49 = 0;
  objc_msgSend_count(a3, v21, v22, v23, v24);
  sub_23C26501C(a3, (const char *)a5, (uint64_t)a4, (uint64_t)a7);
  int v25 = sub_23C265138(a3, (char *)&v51, 0, (uint64_t)&v50, (uint64_t)&v49);
  int v26 = IMOSLoggingEnabled();
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)id v53 = v51;
        _os_log_impl(&dword_23C260000, v27, OS_LOG_TYPE_INFO, "items: %p", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)id v53 = v50;
        _os_log_impl(&dword_23C260000, v28, OS_LOG_TYPE_INFO, "signatures: %p", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)id v53 = v49;
        _os_log_impl(&dword_23C260000, v31, OS_LOG_TYPE_INFO, "tokens: %p", buf, 0xCu);
      }
    }
    uint64_t v32 = objc_msgSend__optionsForFiles_sourceAppID_(self, v29, (uint64_t)a3, (uint64_t)a6, v30);
    uint64_t v33 = [MMCSRequestorContext alloc];
    objc_msgSend_initWithController_transferID_(v33, v34, (uint64_t)self, 0, v35);
    if (IMOSLoggingEnabled())
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = objc_msgSend_count(v32, v36, v37, v38, v39);
        *(_DWORD *)buf = 134217984;
        *(void *)id v53 = v41;
        _os_log_impl(&dword_23C260000, v40, OS_LOG_TYPE_INFO, "Calling MMCSGetItems: requestOptions has %tu keys.", buf, 0xCu);
      }
    }
    objc_msgSend__engine(self, v36, v37, v38, v39);
    int v42 = MMCSGetItems();
    BOOL v43 = v42 != 0;
    if (a8) {
      *a8 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v44 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53[0] = v42 != 0;
        LOWORD(v53[1]) = 2112;
        *(void *)((char *)&v53[1] + 2) = 0;
        _os_log_impl(&dword_23C260000, v44, OS_LOG_TYPE_INFO, "Returning success: %d   error: %@", buf, 0x12u);
      }
    }
  }
  else
  {
    if (v26)
    {
      long long v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C260000, v48, OS_LOG_TYPE_INFO, "Failed to generate item set", buf, 2u);
      }
    }
    BOOL v43 = 0;
  }
  sub_23C2654E4(a3, (const char *)&v51, 0, &v50, &v49);
  return v43;
}

- (void)_registerFiles:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  if (objc_msgSend_count(a3, a2, (uint64_t)a3, a4, (uint64_t)a5))
  {
    objc_msgSend__registerTransfers_preauthenticate_completionBlock_(self, v9, (uint64_t)a3, v6, (uint64_t)a5);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_23C260000, v14, OS_LOG_TYPE_INFO, "Empty files array supplied to register, failing", v16, 2u);
      }
    }
    uint64_t v15 = objc_msgSend_serialControllerQueue(MMCSController, v10, v11, v12, v13);
    dispatch_assert_queue_V2(v15);
    if (a5) {
      (*((void (**)(id, void))a5 + 2))(a5, 0);
    }
  }
}

- (BOOL)isActive
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  BOOL v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_not_V2(v6);
  uint64_t v11 = objc_msgSend_serialControllerQueue(MMCSController, v7, v8, v9, v10);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_23C265D74;
  v13[3] = &unk_264E3ADE0;
  v13[4] = self;
  v13[5] = &v14;
  dispatch_sync(v11, v13);
  LOBYTE(self) = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)registerFilesForDownload:(id)a3 completionBlock:(id)a4
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_23C265E9C;
  v9[3] = &unk_264E3AE30;
  v9[4] = self;
  v9[5] = a4;
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = sub_23C265F48;
  block[3] = &unk_264E3AE58;
  block[4] = self;
  void block[5] = a3;
  block[6] = v9;
  dispatch_async(v7, block);
}

- (void)registerFilesForUpload:(id)a3 withPreauthentication:(BOOL)a4 completionBlock:(id)a5
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_23C266040;
  v11[3] = &unk_264E3AE30;
  v11[4] = self;
  v11[5] = a5;
  uint64_t v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, (uint64_t)a5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_23C2660EC;
  v9[3] = &unk_264E3AE80;
  v9[4] = self;
  v9[5] = a3;
  BOOL v10 = a4;
  void v9[6] = v11;
  dispatch_async(v8, v9);
}

- (BOOL)unregisterFiles:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_not_V2(v7);
  uint64_t v12 = objc_msgSend_serialControllerQueue(MMCSController, v8, v9, v10, v11);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = sub_23C2661F4;
  block[3] = &unk_264E3AEA8;
  void block[5] = self;
  block[6] = &v15;
  block[4] = v5;
  dispatch_sync(v12, block);
  LOBYTE(v5) = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);
  return (char)v5;
}

+ (id)serialControllerQueue
{
  if (qword_26AEE39E0 != -1) {
    dispatch_once(&qword_26AEE39E0, &unk_26EFE7068);
  }
  return (id)qword_26AEE39E8;
}

+ (void)preMMCSWarm
{
  id v5 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_async(v5, &unk_26EFE7088);
}

- (void)getFiles:(id)a3 requestURL:(id)a4 requestorID:(id)a5 sourceAppID:(id)a6 authToken:(id)a7 completionBlock:(id)a8
{
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_23C266788;
  v16[3] = &unk_264E3AF18;
  v16[4] = self;
  v16[5] = a8;
  uint64_t v14 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = sub_23C26684C;
  block[3] = &unk_264E3AF68;
  block[9] = a7;
  block[10] = v16;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async(v14, block);
}

- (void)putFiles:(id)a3 requestURL:(id)a4 requestorID:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 authToken:(id)a8 preauthenticate:(BOOL)a9 completionBlock:(id)a10
{
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_23C266CB8;
  v20[3] = &unk_264E3AF18;
  v20[4] = self;
  v20[5] = a10;
  uint64_t v17 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = sub_23C266D7C;
  block[3] = &unk_264E3AFB8;
  block[4] = a3;
  void block[5] = self;
  BOOL v19 = a9;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  block[9] = a7;
  block[10] = a8;
  void block[11] = v20;
  dispatch_async(v17, block);
}

- (void)_addRequestorContext:(id)a3 transferID:(id)a4
{
  uint64_t v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  if (a3 && a4)
  {
    objc_msgSend_lock(self->_transferIDContextMapLock, v9, v10, v11, v12);
    transferIDToContextMap = self->_transferIDToContextMap;
    if (!transferIDToContextMap)
    {
      transferIDToContextMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      self->_transferIDToContextMap = transferIDToContextMap;
    }
    id v20 = (id)objc_msgSend_objectForKeyedSubscript_(transferIDToContextMap, v13, (uint64_t)a4, v14, v15);
    if (!v20)
    {
      id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
      objc_msgSend_setObject_forKeyedSubscript_(self->_transferIDToContextMap, v21, (uint64_t)v20, (uint64_t)a4, v22);
    }
    objc_msgSend_addObject_(v20, v17, (uint64_t)a3, v18, v19);
    transferIDContextMapLock = self->_transferIDContextMapLock;
    objc_msgSend_unlock(transferIDContextMapLock, v23, v24, v25, v26);
  }
}

- (void)_removeRequestorContext:(id)a3 transferID:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  if (a3 && a4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v29 = 138412290;
        id v30 = a4;
        _os_log_impl(&dword_23C260000, v13, OS_LOG_TYPE_INFO, "Remove request context for transferID %@", (uint8_t *)&v29, 0xCu);
      }
    }
    objc_msgSend_lock(self->_transferIDContextMapLock, v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(self->_transferIDToContextMap, v14, (uint64_t)a4, v15, v16);
    objc_msgSend_removeObject_(v17, v18, (uint64_t)a3, v19, v20);
    if (!objc_msgSend_count(v17, v21, v22, v23, v24)) {
      objc_msgSend_setObject_forKeyedSubscript_(self->_transferIDToContextMap, v25, 0, (uint64_t)a4, v28);
    }
    objc_msgSend_unlock(self->_transferIDContextMapLock, v25, v26, v27, v28);
  }
}

- (void)_cancelRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      id v14 = a3;
      _os_log_impl(&dword_23C260000, v12, OS_LOG_TYPE_INFO, "Request cancel context %p", (uint8_t *)&v13, 0xCu);
    }
  }
  objc_msgSend__engine(self, v8, v9, v10, v11);
  MMCSEngineCancelRequests();
}

- (void)cancelPutRequestID:(id)a3
{
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_not_V2(v7);
  if (a3)
  {
    uint64_t v12 = objc_msgSend_serialControllerQueue(MMCSController, v8, v9, v10, v11);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_23C267478;
    v13[3] = &unk_264E3AFE0;
    v13[4] = a3;
    v13[5] = self;
    dispatch_sync(v12, v13);
  }
}

+ (id)parseContentHeaderAsDictionary:(id)a3 treatValuesAsArrays:(BOOL)a4
{
  BOOL v78 = a4;
  uint64_t v86 = *MEMORY[0x263EF8340];
  BOOL v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, v4);
  dispatch_assert_queue_not_V2(v6);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v11 = objc_msgSend_componentsSeparatedByString_(a3, v8, @"\n", v9, v10);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v79, (uint64_t)v85, 16);
  if (v17)
  {
    uint64_t v19 = *(void *)v80;
    *(void *)&long long v18 = 138412290;
    long long v77 = v18;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v80 != v19) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x263F08708], v13, v14, v15, v16, v77);
        uint64_t v26 = objc_msgSend_stringByTrimmingCharactersInSet_(v21, v23, v22, v24, v25);
        if (objc_msgSend_length(v26, v27, v28, v29, v30))
        {
          unint64_t v31 = objc_msgSend_rangeOfString_(v26, v13, @":", v15, v16);
          if (v31 <= objc_msgSend_length(v26, v32, v33, v34, v35))
          {
            uint64_t v42 = objc_msgSend_substringToIndex_(v26, v36, v31, v37, v38);
            uint64_t v46 = objc_msgSend_substringFromIndex_(v26, v43, v31 + 1, v44, v45);
            long long v54 = objc_msgSend_objectForKey_(v7, v47, v42, v48, v49);
            if (!v54) {
              long long v54 = objc_msgSend_array(MEMORY[0x263EFF980], v50, v51, v52, v53);
            }
            if (!v78) {
              goto LABEL_18;
            }
            if ((unint64_t)objc_msgSend_length(v46, v50, v51, v52, v53) >= 2
              && objc_msgSend_characterAtIndex_(v46, v55, 0, v56, v57) == 91)
            {
              uint64_t v62 = objc_msgSend_length(v46, v58, v59, v60, v61);
              if (objc_msgSend_characterAtIndex_(v46, v63, v62 - 1, v64, v65) == 93)
              {
                uint64_t v70 = objc_msgSend_length(v46, v66, v67, v68, v69);
                uint64_t v46 = objc_msgSend_substringWithRange_(v46, v71, 1, v70 - 2, v72);
LABEL_18:
                objc_msgSend_addObject_(v54, v50, (uint64_t)v46, v52, v53);
                objc_msgSend_setObject_forKey_(v7, v73, (uint64_t)v54, v42, v74);
                continue;
              }
            }
            if (IMOSLoggingEnabled())
            {
              long long v75 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v77;
                id v84 = v26;
                uint64_t v40 = v75;
                uint64_t v41 = "Failed to parse header entry: %@ (value was not enclosed by brackets)";
                goto LABEL_22;
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v77;
              id v84 = v26;
              uint64_t v40 = v39;
              uint64_t v41 = "Failed to parse header entry: %@ (no ':' delimiter between key and value)";
LABEL_22:
              _os_log_impl(&dword_23C260000, v40, OS_LOG_TYPE_INFO, v41, buf, 0xCu);
              continue;
            }
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v79, (uint64_t)v85, 16);
    }
    while (v17);
  }
  return v7;
}

- (id)getContentHeadersAsString
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  long long v18 = sub_23C2643F8;
  uint64_t v19 = sub_23C264408;
  uint64_t v20 = 0;
  BOOL v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_not_V2(v6);
  uint64_t v11 = objc_msgSend_serialControllerQueue(MMCSController, v7, v8, v9, v10);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23C267A1C;
  v14[3] = &unk_264E3B008;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync(v11, v14);
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)_putItemUpdated:(id)a3 progress:(double)a4 state:(int)a5 error:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, *(uint64_t *)&a5, (uint64_t)a6);
  dispatch_assert_queue_V2(v11);
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v24 = a3;
      __int16 v25 = 2048;
      double v26 = a4;
      __int16 v27 = 2112;
      uint64_t v28 = sub_23C267D40(v7, v13, v14, v15, v16);
      __int16 v29 = 2112;
      id v30 = a6;
      _os_log_impl(&dword_23C260000, v12, OS_LOG_TYPE_INFO, "Put item updated: %@  progress: %f state: %@ error: %@", buf, 0x2Au);
    }
  }
  if (MMCSPutItemStateIsDeterminant())
  {
    uint64_t v21 = objc_msgSend_replyQueue(self, v17, v18, v19, v20);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_23C267D90;
    v22[3] = &unk_264E3B030;
    v22[4] = a3;
    *(double *)&v22[5] = a4;
    dispatch_async(v21, v22);
  }
}

- (void)_getItemUpdated:(id)a3 progress:(double)a4 state:(int)a5 error:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, *(uint64_t *)&a5, (uint64_t)a6);
  dispatch_assert_queue_V2(v11);
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v24 = a3;
      __int16 v25 = 2048;
      double v26 = a4;
      __int16 v27 = 2112;
      uint64_t v28 = sub_23C267F30(v7, v13, v14, v15, v16);
      __int16 v29 = 2112;
      id v30 = a6;
      _os_log_impl(&dword_23C260000, v12, OS_LOG_TYPE_INFO, "Get item updated: %@  progress: %f state: %@ error: %@", buf, 0x2Au);
    }
  }
  if (MMCSGetItemStateIsDeterminant())
  {
    uint64_t v21 = objc_msgSend_replyQueue(self, v17, v18, v19, v20);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_23C267F80;
    v22[3] = &unk_264E3B030;
    v22[4] = a3;
    *(double *)&v22[5] = a4;
    dispatch_async(v21, v22);
  }
}

- (void)_processCompletedItem:(id)a3 error:(id)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v7);
  id v8 = a3;
  transferToRequestIDsMap = self->_transferToRequestIDsMap;
  uint64_t v14 = objc_msgSend_guid(a3, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_objectForKey_(transferToRequestIDsMap, v15, v14, v16, v17);
  uint64_t v23 = objc_msgSend_mutableCopy(v18, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_mutableCopy(v23, v24, v25, v26, v27);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v29, (uint64_t)&v92, (uint64_t)v96, 16);
  if (v30)
  {
    uint64_t v35 = v30;
    uint64_t v36 = *(void *)v93;
    if (a3) {
      BOOL v37 = v28 == 0;
    }
    else {
      BOOL v37 = 1;
    }
    int v38 = !v37;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v93 != v36) {
          objc_enumerationMutation(v23);
        }
        uint64_t v40 = *(void *)(*((void *)&v92 + 1) + 8 * v39);
        uint64_t v41 = objc_msgSend_objectForKey_(self->_requestIDToRemainingTransfersMap, v31, v40, v33, v34);
        objc_msgSend_removeObjectIdenticalTo_(v41, v42, (uint64_t)a3, v43, v44);
        if (!objc_msgSend_count(v41, v45, v46, v47, v48))
        {
          uint64_t v49 = objc_msgSend_objectForKey_(self->_requestIDToBlockMap, v31, v40, v33, v34);
          if (v49)
          {
            uint64_t v53 = v49;
            uint64_t v54 = objc_msgSend_objectForKey_(self->_requestIDToTransfersMap, v50, v40, v51, v52);
            (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v53 + 16))(v53, v54, 1, a4);
          }
          objc_msgSend_removeObjectForKey_(self->_requestIDToBlockMap, v50, v40, v51, v52);
          objc_msgSend_removeObjectForKey_(self->_requestIDToRemainingTransfersMap, v55, v40, v56, v57);
          objc_msgSend_removeObjectForKey_(self->_requestIDToTransfersMap, v58, v40, v59, v60);
          objc_msgSend_removeObjectIdenticalTo_(v28, v61, v40, v62, v63);
          if (objc_msgSend_count(v28, v64, v65, v66, v67))
          {
            if (v38)
            {
              uint64_t v69 = self->_transferToRequestIDsMap;
              uint64_t v70 = objc_msgSend_guid(a3, v31, v68, v33, v34);
              objc_msgSend_setObject_forKey_(v69, v71, (uint64_t)v28, v70, v72);
            }
          }
          else if (a3)
          {
            long long v73 = self->_transferToRequestIDsMap;
            uint64_t v74 = objc_msgSend_guid(a3, v31, v68, v33, v34);
            objc_msgSend_removeObjectForKey_(v73, v75, v74, v76, v77);
          }
        }
        ++v39;
      }
      while (v35 != v39);
      uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v31, (uint64_t)&v92, (uint64_t)v96, 16);
      uint64_t v35 = v78;
    }
    while (v78);
  }
  if (!objc_msgSend_count(self->_requestIDToTransfersMap, v31, v32, v33, v34))
  {

    self->_requestIDToTransfersMap = 0;
  }
  if (!objc_msgSend_count(self->_requestIDToRemainingTransfersMap, v79, v80, v81, v82))
  {

    self->_requestIDToRemainingTransfersMap = 0;
  }
  if (!objc_msgSend_count(self->_requestIDToBlockMap, v83, v84, v85, v86))
  {

    self->_requestIDToBlockMap = 0;
  }
  if (!objc_msgSend_count(self->_transferToRequestIDsMap, v87, v88, v89, v90))
  {

    self->_transferToRequestIDsMap = 0;
  }
}

- (void)_putItemCompleted:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  objc_msgSend_setMMCSError_(a3, v9, (uint64_t)a4, v10, v11);
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = a3;
      __int16 v21 = 2112;
      id v22 = a4;
      _os_log_impl(&dword_23C260000, v16, OS_LOG_TYPE_INFO, "Put item completed: %@  error: %@", buf, 0x16u);
    }
  }
  if (a3)
  {
    uint64_t v17 = objc_msgSend_replyQueue(self, v12, v13, v14, v15);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_23C26838C;
    v18[3] = &unk_264E3AFE0;
    v18[4] = a4;
    v18[5] = a3;
    dispatch_async(v17, v18);
  }
  objc_msgSend__processCompletedItem_error_(self, v12, (uint64_t)a3, (uint64_t)a4, v15);
}

- (void)_getItemCompleted:(id)a3 path:(id)a4 error:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v9);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = sub_23C2643F8;
  __int16 v29 = sub_23C264408;
  id v30 = a5;
  objc_msgSend_setMMCSError_(a3, v10, (uint64_t)a5, v11, v12);
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v26[5];
      *(_DWORD *)buf = 138412546;
      id v32 = a3;
      __int16 v33 = 2112;
      uint64_t v34 = v14;
      _os_log_impl(&dword_23C260000, v13, OS_LOG_TYPE_INFO, "Get item completed: %@  error: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v26[5];
      *(_DWORD *)buf = 138412546;
      id v32 = a4;
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      _os_log_impl(&dword_23C260000, v15, OS_LOG_TYPE_INFO, "[=MMCS-Timing=]  Get Item completed for path: %@  (error: %@)", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      qos_class_t v22 = qos_class_self();
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v22;
      _os_log_impl(&dword_23C260000, v21, OS_LOG_TYPE_INFO, "Get item completed running at qos (%u)", buf, 8u);
    }
  }
  if (a3)
  {
    uint64_t v23 = objc_msgSend_replyQueue(self, v17, v18, v19, v20);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    void block[2] = sub_23C2688D0;
    block[3] = &unk_264E3AEA8;
    void block[5] = a4;
    block[6] = &v25;
    block[4] = a3;
    dispatch_async(v23, block);
  }
  objc_msgSend__processCompletedItem_error_(self, v17, (uint64_t)a3, v26[5], v20);
  _Block_object_dispose(&v25, 8);
}

- (void)_itemCompleted:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_23C260000, v7, OS_LOG_TYPE_INFO, "Item completed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)_MMCSICloudRequestHeadersCopy:(__CFString *)a3
{
  id v5 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v5);
  BOOL v6 = (void *)MMCSICloudRequestHeadersCopy();
  return v6;
}

- (int64_t)connectionBehavior
{
  return self->_connectionBehavior;
}

- (void)setConnectionBehavior:(int64_t)a3
{
  self->_connectionBehavior = a3;
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)transferIDToContextMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSRecursiveLock)transferIDContextMapLock
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTransferIDContextMapLock:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReplyQueue:(id)a3
{
}

@end