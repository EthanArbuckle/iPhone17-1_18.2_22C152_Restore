@interface IDSTapToRadar
+ (void)launchWithRequest:(id)a3 context:(id)a4;
@end

@implementation IDSTapToRadar

+ (void)launchWithRequest:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_class();
  if (objc_msgSend__isSupported(v7, v8, v9, v10))
  {
    if (qword_1E944F698 != -1) {
      dispatch_once(&qword_1E944F698, &unk_1EEFCD698);
    }
    uint64_t v14 = objc_msgSend_title(v5, v11, v12, v13);
    v15 = (void *)v14;
    v16 = @"Internal IDS Error Detected";
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v17 = v16;

    uint64_t v21 = objc_msgSend_message(v5, v18, v19, v20);
    v22 = (void *)v21;
    v23 = @"An internal IDS error has been detected";
    if (v21) {
      v23 = (__CFString *)v21;
    }
    v24 = v23;

    v25 = (void *)MEMORY[0x1E4F6C410];
    v29 = objc_msgSend_stringGUID(NSString, v26, v27, v28);
    v32 = objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(v25, v30, (uint64_t)v29, v31, v17, v24, @"File Radar", @"Dismiss", 0);

    if (v32)
    {
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = sub_19DAB8C14;
      v39[4] = sub_19DAB8C24;
      id v40 = (id)0xAAAAAAAAAAAAAAAALL;
      id v40 = v6;
      v36 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C418], v33, v34, v35);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_19DAB8C2C;
      v38[3] = &unk_1E5974A00;
      v38[4] = v39;
      objc_msgSend_addUserNotification_listener_completionHandler_(v36, v37, (uint64_t)v32, COERCE_DOUBLE(3221225472), 0, v38);

      _Block_object_dispose(v39, 8);
    }
  }
}

@end