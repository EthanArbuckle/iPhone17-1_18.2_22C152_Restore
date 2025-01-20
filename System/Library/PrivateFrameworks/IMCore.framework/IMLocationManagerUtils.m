@interface IMLocationManagerUtils
+ (id)sharedInstance;
- (void)sendCurrentLocationMessageWithChat:(id)a3 withLocationManager:(id)a4 withSourceApplicationIdentifier:(id)a5 foregroundAssertionForBundleIdentifier:(id)a6 completion:(id)a7;
@end

@implementation IMLocationManagerUtils

+ (id)sharedInstance
{
  if (qword_1EB3F24C8 != -1) {
    dispatch_once(&qword_1EB3F24C8, &unk_1EF8E53D8);
  }
  v2 = (void *)qword_1EB3F2528;

  return v2;
}

- (void)sendCurrentLocationMessageWithChat:(id)a3 withLocationManager:(id)a4 withSourceApplicationIdentifier:(id)a5 foregroundAssertionForBundleIdentifier:(id)a6 completion:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v11;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Client request to send current location for chat %@", buf, 0xCu);
    }
  }
  v20 = objc_msgSend_currentLocationGUID(v11, v16, v17, v18);
  BOOL v21 = v20 == 0;

  if (v21)
  {
    v30 = objc_msgSend_stringGUID(NSString, v22, v23, v24);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1A4BBD048;
    v37[3] = &unk_1E5B7BCE0;
    id v38 = v11;
    id v39 = v30;
    id v40 = v13;
    id v41 = v15;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1A4BBD2DC;
    v33[3] = &unk_1E5B7D028;
    id v34 = v38;
    id v35 = v39;
    id v36 = v40;
    id v31 = v39;
    objc_msgSend_startUpdatingCurrentLocationWithForegroundAssertionForBundleIdentifier_withAuthorizedHandler_updateHandler_(v12, v32, (uint64_t)v14, (uint64_t)v37, v33);
  }
  else if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v29 = objc_msgSend_currentLocationGUID(v11, v26, v27, v28);
      *(_DWORD *)buf = 138412290;
      id v43 = v29;
      _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, " => we are already sending a current location for this chat, ignoring (%@)", buf, 0xCu);
    }
  }
}

@end