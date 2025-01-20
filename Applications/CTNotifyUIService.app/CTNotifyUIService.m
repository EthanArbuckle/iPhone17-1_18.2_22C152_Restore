void sub_100005A48(id a1)
{
  uint64_t vars8;

  qword_100020CD0 = +[NSCharacterSet characterSetWithCharactersInString:@"0123456789*#+"];

  _objc_release_x1();
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100007890(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void sub_1000078D8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

void sub_100009048(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void sub_100009090(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

void sub_10000AE98(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void sub_10000AF8C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void sub_10000B34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B380(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismiss];
}

void sub_10000B4D8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void sub_10000B520(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

id sub_10000BC0C(uint64_t a1)
{
  v2 = +[BSPlatform sharedInstance];
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    v4 = STKCommonLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received string: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  return [*(id *)(a1 + 40) _noteDidReceiveContent:*(void *)(a1 + 32)];
}

void sub_10000BD88(uint64_t a1)
{
  v2 = +[BSPlatform sharedInstance];
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    v4 = STKCommonLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      int v15 = v5;
      __int16 v16 = 2114;
      uint64_t v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received error code: %d, string: %{public}@", buf, 0x12u);
    }
  }
  int v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  uint64_t v8 = [v7 localizedStringForKey:@"USSD_ERROR" value:&stru_100018540 table:@"SIMToolkitUI"];

  if (*(void *)(a1 + 32))
  {
    v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService", v8];
    v10 = [v9 localizedStringForKey:*(void *)(a1 + 32) value:&stru_100018540 table:@"SIMToolkitUI"];
    v13[1] = v10;
    v11 = +[NSArray arrayWithObjects:v13 count:2];
    uint64_t v12 = [v11 componentsJoinedByString:@"\n"];

    uint64_t v8 = (void *)v12;
  }
  [*(id *)(a1 + 40) _noteDidReceiveContent:v8];
}

void sub_10000BFC8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v2 = [v3 localizedStringForKey:@"USSD_TERMINATED" value:&stru_100018540 table:@"SIMToolkitUI"];
  [v1 _noteDidReceiveContent:v2];
}

id sub_10000C0CC(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllowsResponse:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _setupResponseBar];
}

id sub_10000C1A4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

id sub_10000D67C(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKeyedSubscript:STKUSSDSupplementaryServiceSettingTypeKey];
  unsigned int v3 = [v2 intValue];

  id v4 = [v1 objectForKeyedSubscript:STKUSSDSupplementaryServiceNotificationDataKey];
  if (!v4) {
    id v4 = objc_alloc_init((Class)CTSuppServicesNotificationData);
  }
  uint64_t v5 = &stru_100018540;
  switch(v3)
  {
    case 1u:
      uint64_t v6 = [v4 callForwardingNumber];
      if ([v6 length])
      {
        int v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        uint64_t v8 = [v7 localizedStringForKey:@"Forwards to %@\n" value:&stru_100018540 table:@"SIMToolkitUI"];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v6 = v7;
      }
      else
      {
        v9 = &stru_100018540;
      }

      v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v11 = [v10 localizedStringForKey:@"%@ Call Forwarding\n%@\n%@%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v12 = [v4 callClassString];
      v13 = [v4 callForwardingReasonString];
      __int16 v16 = [v4 enabledString];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v12, v13, v9, v16);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    case 3u:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"%@ Call Waiting\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      v11 = [v4 callClassString];
      uint64_t v12 = [v4 enabledString];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11, v12);
      goto LABEL_22;
    case 4u:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"%@ Call Barring\n%@\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      v11 = [v4 callClassString];
      uint64_t v12 = [v4 callBarringFacilityString];
      v13 = [v4 enabledString];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11, v12, v13);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_23;
    case 5u:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"Supplementary Service Password\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v14 = [v4 ssServiceTypeString];
      goto LABEL_16;
    case 6u:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"Calling Line ID Restriction\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v14 = [v4 callingLineIDRestrictionString];
      goto LABEL_16;
    case 7u:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"Connected Line ID Restriction\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v14 = [v4 connectedLineIDRestrictionString];
      goto LABEL_16;
    case 8u:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"Calling Line Presentation\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v14 = [v4 callingLinePresentationString];
      goto LABEL_16;
    case 9u:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"Connected Line Presentation\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v14 = [v4 connectedLinePresentationString];
      goto LABEL_16;
    case 0xAu:
      int v15 = [v4 enabledString];
      if ([v15 length])
      {
        v9 = [@"\n" stringByAppendingString:v15];
      }
      else
      {
        v9 = &stru_100018540;
      }

      v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v11 = [v10 localizedStringForKey:@"%@ Fixed Dialing%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v12 = [v4 callClassString];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v12, v9);
LABEL_22:
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    case 0xBu:
      v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v10 = [(__CFString *)v9 localizedStringForKey:@"Calling Name Presentation\n%@" value:&stru_100018540 table:@"SIMToolkitUI"];
      uint64_t v14 = [v4 callingNamePresentationString];
LABEL_16:
      v11 = (void *)v14;
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v14);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:

      break;
    default:
      break;
  }
  uint64_t v17 = [v1 objectForKeyedSubscript:STKUSSDSupplementaryServiceEventTypeKey];
  unsigned int v18 = [v17 intValue];

  switch(v18)
  {
    case 1u:
      v19 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v20 = v19;
      CFStringRef v21 = @"Setting Interrogation Succeeded";
      goto LABEL_29;
    case 2u:
      v19 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v20 = v19;
      CFStringRef v21 = @"Setting Interrogation Failed";
LABEL_29:
      v22 = [v19 localizedStringForKey:v21 value:&stru_100018540 table:@"SIMToolkitUI"];
      goto LABEL_33;
    case 3u:
      v20 = [v4 mmiProcedureString];
      v23 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v24 = v23;
      CFStringRef v25 = @"Setting %@ Succeeded";
      goto LABEL_32;
    case 4u:
      v20 = [v4 mmiProcedureString];
      v23 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v24 = v23;
      CFStringRef v25 = @"Setting %@ Failed";
LABEL_32:
      v26 = [v23 localizedStringForKey:v25 value:&stru_100018540 table:@"SIMToolkitUI"];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v20);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_33:
      break;
    default:
      v22 = &stru_100018540;
      break;
  }
  v27 = [(__CFString *)v22 stringByAppendingString:v5];

  return v27;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t STKCommonLog()
{
  return _STKCommonLog();
}

uint64_t STKUSSDHostCommunicationInterface()
{
  return _STKUSSDHostCommunicationInterface();
}

uint64_t STKUSSDSessionCommunicationInterface()
{
  return _STKUSSDSessionCommunicationInterface();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__replyView(void *a1, const char *a2, ...)
{
  return [a1 _replyView];
}

id objc_msgSend__sendsResponseUponDisplay(void *a1, const char *a2, ...)
{
  return [a1 _sendsResponseUponDisplay];
}

id objc_msgSend__setupResponseBar(void *a1, const char *a2, ...)
{
  return [a1 _setupResponseBar];
}

id objc_msgSend__simToolkitListItems(void *a1, const char *a2, ...)
{
  return [a1 _simToolkitListItems];
}

id objc_msgSend__updateCharsRemaining(void *a1, const char *a2, ...)
{
  return [a1 _updateCharsRemaining];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_alertContainerView(void *a1, const char *a2, ...)
{
  return [a1 alertContainerView];
}

id objc_msgSend_alertText(void *a1, const char *a2, ...)
{
  return [a1 alertText];
}

id objc_msgSend_allowsResponse(void *a1, const char *a2, ...)
{
  return [a1 allowsResponse];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginEditing(void *a1, const char *a2, ...)
{
  return [a1 beginEditing];
}

id objc_msgSend_behavior(void *a1, const char *a2, ...)
{
  return [a1 behavior];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blurEffectContainerView(void *a1, const char *a2, ...)
{
  return [a1 blurEffectContainerView];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_callBarringFacility(void *a1, const char *a2, ...)
{
  return [a1 callBarringFacility];
}

id objc_msgSend_callBarringFacilityString(void *a1, const char *a2, ...)
{
  return [a1 callBarringFacilityString];
}

id objc_msgSend_callClass(void *a1, const char *a2, ...)
{
  return [a1 callClass];
}

id objc_msgSend_callClassString(void *a1, const char *a2, ...)
{
  return [a1 callClassString];
}

id objc_msgSend_callForwardingNumber(void *a1, const char *a2, ...)
{
  return [a1 callForwardingNumber];
}

id objc_msgSend_callForwardingReason(void *a1, const char *a2, ...)
{
  return [a1 callForwardingReason];
}

id objc_msgSend_callForwardingReasonString(void *a1, const char *a2, ...)
{
  return [a1 callForwardingReasonString];
}

id objc_msgSend_callingLineIDRestrictionString(void *a1, const char *a2, ...)
{
  return [a1 callingLineIDRestrictionString];
}

id objc_msgSend_callingLineIdRestriction(void *a1, const char *a2, ...)
{
  return [a1 callingLineIdRestriction];
}

id objc_msgSend_callingLinePresentation(void *a1, const char *a2, ...)
{
  return [a1 callingLinePresentation];
}

id objc_msgSend_callingLinePresentationString(void *a1, const char *a2, ...)
{
  return [a1 callingLinePresentationString];
}

id objc_msgSend_callingNamePresentation(void *a1, const char *a2, ...)
{
  return [a1 callingNamePresentation];
}

id objc_msgSend_callingNamePresentationString(void *a1, const char *a2, ...)
{
  return [a1 callingNamePresentationString];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 clearTimeoutTimer];
}

id objc_msgSend_connectedLineIDRestrictionString(void *a1, const char *a2, ...)
{
  return [a1 connectedLineIDRestrictionString];
}

id objc_msgSend_connectedLineIdRestriction(void *a1, const char *a2, ...)
{
  return [a1 connectedLineIdRestriction];
}

id objc_msgSend_connectedLinePresentation(void *a1, const char *a2, ...)
{
  return [a1 connectedLinePresentation];
}

id objc_msgSend_connectedLinePresentationString(void *a1, const char *a2, ...)
{
  return [a1 connectedLinePresentationString];
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return [a1 contentContainerView];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalls(void *a1, const char *a2, ...)
{
  return [a1 currentCalls];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_darkBlurView(void *a1, const char *a2, ...)
{
  return [a1 darkBlurView];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return [a1 defaultHeight];
}

id objc_msgSend_defaultInterButtonSpacing(void *a1, const char *a2, ...)
{
  return [a1 defaultInterButtonSpacing];
}

id objc_msgSend_defaultSideMarginForSingleButton(void *a1, const char *a2, ...)
{
  return [a1 defaultSideMarginForSingleButton];
}

id objc_msgSend_defaultText(void *a1, const char *a2, ...)
{
  return [a1 defaultText];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissButton(void *a1, const char *a2, ...)
{
  return [a1 dismissButton];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_enabledString(void *a1, const char *a2, ...)
{
  return [a1 enabledString];
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return [a1 endEditing];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_formattedAboutText(void *a1, const char *a2, ...)
{
  return [a1 formattedAboutText];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelectedRow];
}

id objc_msgSend_inputTextField(void *a1, const char *a2, ...)
{
  return [a1 inputTextField];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDigitsOnly(void *a1, const char *a2, ...)
{
  return [a1 isDigitsOnly];
}

id objc_msgSend_isHighPriority(void *a1, const char *a2, ...)
{
  return [a1 isHighPriority];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isSecure(void *a1, const char *a2, ...)
{
  return [a1 isSecure];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_learnMoreButton(void *a1, const char *a2, ...)
{
  return [a1 learnMoreButton];
}

id objc_msgSend_leftNavigationButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 leftNavigationButtonPressed];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listItems(void *a1, const char *a2, ...)
{
  return [a1 listItems];
}

id objc_msgSend_maximumInputLength(void *a1, const char *a2, ...)
{
  return [a1 maximumInputLength];
}

id objc_msgSend_messageTextLabel(void *a1, const char *a2, ...)
{
  return [a1 messageTextLabel];
}

id objc_msgSend_messageTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 messageTitleLabel];
}

id objc_msgSend_minimumInputLength(void *a1, const char *a2, ...)
{
  return [a1 minimumInputLength];
}

id objc_msgSend_mmiProcedure(void *a1, const char *a2, ...)
{
  return [a1 mmiProcedure];
}

id objc_msgSend_mmiProcedureString(void *a1, const char *a2, ...)
{
  return [a1 mmiProcedureString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_newBottomBar(void *a1, const char *a2, ...)
{
  return [a1 newBottomBar];
}

id objc_msgSend_newTopBar(void *a1, const char *a2, ...)
{
  return [a1 newTopBar];
}

id objc_msgSend_notifyType(void *a1, const char *a2, ...)
{
  return [a1 notifyType];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phonePadCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 phonePadCharacterSet];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_sessionAction(void *a1, const char *a2, ...)
{
  return [a1 sessionAction];
}

id objc_msgSend_sessionData(void *a1, const char *a2, ...)
{
  return [a1 sessionData];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldSendResponseUponDisplay(void *a1, const char *a2, ...)
{
  return [a1 shouldSendResponseUponDisplay];
}

id objc_msgSend_showsFromAddress(void *a1, const char *a2, ...)
{
  return [a1 showsFromAddress];
}

id objc_msgSend_simLabel(void *a1, const char *a2, ...)
{
  return [a1 simLabel];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_ssServiceTypeString(void *a1, const char *a2, ...)
{
  return [a1 ssServiceTypeString];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startTimeoutTimerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 startTimeoutTimerIfNecessary];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_supplementaryServiceType(void *a1, const char *a2, ...)
{
  return [a1 supplementaryServiceType];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return [a1 textInputTraits];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topBar(void *a1, const char *a2, ...)
{
  return [a1 topBar];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_wakeup(void *a1, const char *a2, ...)
{
  return [a1 wakeup];
}

id objc_msgSend_wantsTextView(void *a1, const char *a2, ...)
{
  return [a1 wantsTextView];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomScale];
}