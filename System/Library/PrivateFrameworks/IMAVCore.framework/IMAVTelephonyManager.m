@interface IMAVTelephonyManager
+ (IMAVTelephonyManager)sharedInstance;
- (IMAVTelephonyManager)init;
- (void)_chatStateChanged:(id)a3;
- (void)dealloc;
@end

@implementation IMAVTelephonyManager

+ (IMAVTelephonyManager)sharedInstance
{
  if (qword_26AB796A0 != -1) {
    dispatch_once(&qword_26AB796A0, &unk_26D85A5B0);
  }
  v2 = (void *)qword_26AB796D0;
  return (IMAVTelephonyManager *)v2;
}

- (IMAVTelephonyManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)IMAVTelephonyManager;
  v6 = [(IMAVTelephonyManager *)&v10 init];
  if (v6)
  {
    v7 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v2, v3, v4, v5);
    objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)v6, (uint64_t)sel__chatStateChanged_, @"__kIMAVChatStateChangedNotification", 0);
  }
  return v6;
}

- (void)dealloc
{
  v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4);
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, 0, 0);

  v12 = objc_msgSend_sharedInstance(MEMORY[0x263F4A5C0], v8, v9, v10, v11);
  objc_msgSend_removeFastDormancyDisableToken_(v12, v13, @"kIMAVTelephonyManagerDormancyClient", v14, v15);

  v16.receiver = self;
  v16.super_class = (Class)IMAVTelephonyManager;
  [(IMAVTelephonyManager *)&v16 dealloc];
}

- (void)_chatStateChanged:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v8 = objc_msgSend_sharedInstance(IMAVController, v4, v5, v6, v7);
  if (objc_msgSend__shouldRunConferences(v8, v9, v10, v11, v12))
  {
  }
  else
  {
    v21 = objc_msgSend_sharedInstance(IMAVController, v13, v14, v15, v16);
    int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v21, v22, v23, v24, v25);

    if (!shouldRunACConferences) {
      goto LABEL_13;
    }
  }
  v27 = objc_msgSend_object(v3, v17, v18, v19, v20);
  if ((objc_msgSend__isProxy(v27, v28, v29, v30, v31) & 1) == 0)
  {
    unsigned int v36 = objc_msgSend_state(v27, v32, v33, v34, v35);
    v37 = sub_224FB12A0();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = _NSStringDescriptionForIMAVChatState(v36);
      int v50 = 138412546;
      v51 = v38;
      __int16 v52 = 2112;
      v53 = v27;
      _os_log_impl(&dword_224F93000, v37, OS_LOG_TYPE_DEFAULT, "Observed chat state change to: %@ for: %@", (uint8_t *)&v50, 0x16u);
    }
    switch(v36)
    {
      case 1u:
      case 3u:
        goto LABEL_10;
      case 2u:
        if (!objc_msgSend_isCaller(v27, v39, v40, v41, v42)) {
          break;
        }
LABEL_10:
        v43 = objc_msgSend_sharedInstance(MEMORY[0x263F4A5C0], v39, v40, v41, v42);
        objc_msgSend_addFastDormancyDisableToken_(v43, v47, @"kIMAVTelephonyManagerDormancyClient", v48, v49);
LABEL_11:

        break;
      default:
        v43 = objc_msgSend_sharedInstance(MEMORY[0x263F4A5C0], v39, v40, v41, v42);
        objc_msgSend_removeFastDormancyDisableToken_(v43, v44, @"kIMAVTelephonyManagerDormancyClient", v45, v46);
        goto LABEL_11;
    }
  }

LABEL_13:
}

@end