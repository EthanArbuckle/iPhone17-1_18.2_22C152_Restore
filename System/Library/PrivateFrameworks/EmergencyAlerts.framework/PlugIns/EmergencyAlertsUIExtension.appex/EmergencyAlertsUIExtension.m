id sub_100001FC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_100002100(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7 = qword_10000CF18;
  if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received broadcast message notification %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (a5)
  {
    if (objc_opt_respondsToSelector()) {
      [a2 cellBroadcastMessageReceived:a5];
    }
  }
}

void sub_100002974(uint64_t a1, void *a2)
{
  id v27 = a2;
  id v3 = [v27 resultType];
  if (v3 == (id)16)
  {
    int v8 = [v27 addressComponents];
    v14 = [v8 objectForKey:NSTextCheckingStreetKey];
    v15 = [v8 objectForKey:NSTextCheckingCityKey];
    v16 = [v8 objectForKey:NSTextCheckingStateKey];
    if (v14)
    {
      [@"http://maps.apple.com/?address=" stringByAppendingString:v14];
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_11:
        if (v16)
        {
          v19 = [(__CFString *)v17 stringByAppendingString:@" "];

          v17 = [v19 stringByAppendingString:v16];
        }
        v20 = +[NSURL URLWithString:v17];
        if (v20)
        {
          v21 = *(void **)(a1 + 32);
          id v22 = [v27 range];
          objc_msgSend(v21, "addAttribute:value:range:", NSLinkAttributeName, v20, v22, v23);
        }

        goto LABEL_18;
      }
    }
    else
    {
      v17 = @"http://maps.apple.com/?address=";
      if (!v15) {
        goto LABEL_11;
      }
    }
    v18 = [(__CFString *)v17 stringByAppendingString:@" "];

    v17 = [v18 stringByAppendingString:v15];

    goto LABEL_11;
  }
  if (v3 == (id)32)
  {
    int v8 = [v27 URL];
    if (v8)
    {
      v24 = *(void **)(a1 + 32);
      id v25 = [v27 range];
      objc_msgSend(v24, "addAttribute:value:range:", NSLinkAttributeName, v8, v25, v26);
    }
    goto LABEL_18;
  }
  BOOL v4 = v3 == (id)2048;
  v5 = v27;
  if (v4)
  {
    v6 = [v27 phoneNumber];
    v7 = +[NSCharacterSet URLHostAllowedCharacterSet];
    int v8 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v7];

    uint64_t v9 = +[NSString stringWithFormat:@"tel://%@", v8];
    v10 = +[NSURL URLWithString:v9];
    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      id v12 = [v27 range];
      objc_msgSend(v11, "addAttribute:value:range:", NSLinkAttributeName, v10, v12, v13);
    }

LABEL_18:
    v5 = v27;
  }
}

void sub_100003650(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safetyAlertSpinner];
  [v2 startAnimating];

  dispatch_time_t v3 = dispatch_time(0, 8000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003700;
  block[3] = &unk_1000082D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100003700(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safetyAlertSpinner];
  [v1 removeFromSuperview];
}

void sub_100004808(id a1)
{
  qword_10000CF18 = (uint64_t)os_log_create("com.apple.EmergencyAlerts", "EmergencyAlertsUIExtension");
  _objc_release_x1();
}

void sub_10000484C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id ea_getFormattedDatePrint(void *a1, BOOL *a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init((Class)NSISO8601DateFormatter);
  [v4 setFormatOptions:1907];
  v5 = [v4 dateFromString:v3];
  v6 = v5;
  if (!v5)
  {
    id v11 = v3;
    goto LABEL_14;
  }
  [v5 timeIntervalSinceNow];
  *a2 = v7 < 0.0;
  int v8 = +[NSCalendar currentCalendar];
  uint64_t v9 = +[NSBundle bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.cmas.bundle"];
  if ([v8 isDateInToday:v6])
  {
    CFStringRef v10 = @"TODAY";
  }
  else if ([v8 isDateInTomorrow:v6])
  {
    CFStringRef v10 = @"TOMORROW";
  }
  else
  {
    if (([v8 isDateInYesterday:v6] & 1) == 0)
    {
      id v13 = objc_alloc_init((Class)NSDateFormatter);
LABEL_12:
      [v13 setLocalizedDateFormatFromTemplate:@"MMMMd"];
      id v12 = [v13 stringFromDate:v6];
      goto LABEL_13;
    }
    CFStringRef v10 = @"YESTERDAY";
  }
  id v12 = [v9 localizedStringForKey:v10 value:&stru_1000084B8 table:0];
  id v13 = objc_alloc_init((Class)NSDateFormatter);
  if (!v12) {
    goto LABEL_12;
  }
LABEL_13:
  [v13 setDateFormat:@"hh:mm a"];
  v14 = [v13 stringFromDate:v6];
  id v11 = [v12 stringByAppendingFormat:@", %@", v14];

LABEL_14:
  return v11;
}

void *ea_isValidString(void *result)
{
  if (result) {
    return (void *)([result length] != 0);
  }
  return result;
}

id ea_getEpochTimestamp()
{
  v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  id v1 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v2 = [v1 integerValue];

  return v2;
}

id ea_getHashForString(void *a1)
{
  if (a1)
  {
    id v1 = (const char *)[a1 UTF8String];
    CC_LONG v2 = strlen(v1);
    CC_SHA256(v1, v2, md);
    id v3 = +[NSMutableString stringWithCapacity:32];
    for (uint64_t i = 0; i != 16; ++i)
      objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void ea_sendSafetyAlertTapIndication(void *a1, uint64_t a2)
{
  v9[0] = a1;
  v8[0] = @"WeaMessage";
  v8[1] = @"WeaHash";
  id v3 = a1;
  id v4 = ea_getHashForString(v3);
  v9[1] = v4;
  v8[2] = @"UserInteractionType";
  v5 = +[NSNumber numberWithInt:a2];
  v9[2] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  double v7 = +[SafetyAlerts sharedInterface];

  [v7 onUserTappedOnWeaWithInfo:v6];
}

void sub_100004CF0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load bundle: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100004D68()
{
  sub_100004868();
  sub_10000484C((void *)&_mh_execute_header, v0, v1, "Invalid or repeated instruction", v2, v3, v4, v5, v6);
}

void sub_100004D9C()
{
  sub_100004868();
  sub_10000484C((void *)&_mh_execute_header, v0, v1, "Missing CmamText and CmamLongText key. Dropping the Safety alert", v2, v3, v4, v5, v6);
}

void sub_100004DD0()
{
  sub_100004868();
  sub_10000484C((void *)&_mh_execute_header, v0, v1, "Could not load topAlertIcon", v2, v3, v4, v5, v6);
}

void sub_100004E04()
{
  sub_100004868();
  sub_10000484C((void *)&_mh_execute_header, v0, v1, "Could not load alertIcon", v2, v3, v4, v5, v6);
}

void sub_100004E38()
{
  sub_100004868();
  sub_10000484C((void *)&_mh_execute_header, v0, v1, "Invalid body", v2, v3, v4, v5, v6);
}

void sub_100004E6C()
{
  sub_100004868();
  sub_10000484C((void *)&_mh_execute_header, v0, v1, "Invalid title", v2, v3, v4, v5, v6);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t TUAddTelephonyCenterObserver()
{
  return _TUAddTelephonyCenterObserver();
}

uint64_t TURemoveTelephonyCenterObserver()
{
  return _TURemoveTelephonyCenterObserver();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLHostAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_addGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer];
}

id objc_msgSend_additionalDetails(void *a1, const char *a2, ...)
{
  return [a1 additionalDetails];
}

id objc_msgSend_addressComponents(void *a1, const char *a2, ...)
{
  return [a1 addressComponents];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_centerAlertIcon(void *a1, const char *a2, ...)
{
  return [a1 centerAlertIcon];
}

id objc_msgSend_centerBody(void *a1, const char *a2, ...)
{
  return [a1 centerBody];
}

id objc_msgSend_centerTitle(void *a1, const char *a2, ...)
{
  return [a1 centerTitle];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dividerStack(void *a1, const char *a2, ...)
{
  return [a1 dividerStack];
}

id objc_msgSend_drawAllIcons(void *a1, const char *a2, ...)
{
  return [a1 drawAllIcons];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getImageBounds(void *a1, const char *a2, ...)
{
  return [a1 getImageBounds];
}

id objc_msgSend_getImageBoundsForPhone(void *a1, const char *a2, ...)
{
  return [a1 getImageBoundsForPhone];
}

id objc_msgSend_getImageBoundsForWatch(void *a1, const char *a2, ...)
{
  return [a1 getImageBoundsForWatch];
}

id objc_msgSend_hideAllViews(void *a1, const char *a2, ...)
{
  return [a1 hideAllViews];
}

id objc_msgSend_instructionText(void *a1, const char *a2, ...)
{
  return [a1 instructionText];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isScreenLocked(void *a1, const char *a2, ...)
{
  return [a1 isScreenLocked];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderBasedOnScreenState(void *a1, const char *a2, ...)
{
  return [a1 renderBasedOnScreenState];
}

id objc_msgSend_renderSafetyAlertDetailedView(void *a1, const char *a2, ...)
{
  return [a1 renderSafetyAlertDetailedView];
}

id objc_msgSend_renderSafetyAlertWithSpinnerView(void *a1, const char *a2, ...)
{
  return [a1 renderSafetyAlertWithSpinnerView];
}

id objc_msgSend_renderSafetyAlertsView(void *a1, const char *a2, ...)
{
  return [a1 renderSafetyAlertsView];
}

id objc_msgSend_renderTopView(void *a1, const char *a2, ...)
{
  return [a1 renderTopView];
}

id objc_msgSend_renderingMode(void *a1, const char *a2, ...)
{
  return [a1 renderingMode];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return [a1 resultType];
}

id objc_msgSend_safetyAlertSpinner(void *a1, const char *a2, ...)
{
  return [a1 safetyAlertSpinner];
}

id objc_msgSend_safetyAlertStack(void *a1, const char *a2, ...)
{
  return [a1 safetyAlertStack];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedInterface(void *a1, const char *a2, ...)
{
  return [a1 sharedInterface];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_systemFontSize(void *a1, const char *a2, ...)
{
  return [a1 systemFontSize];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return [a1 textContainer];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topAlertIcon(void *a1, const char *a2, ...)
{
  return [a1 topAlertIcon];
}

id objc_msgSend_topBody(void *a1, const char *a2, ...)
{
  return [a1 topBody];
}

id objc_msgSend_topTitle(void *a1, const char *a2, ...)
{
  return [a1 topTitle];
}

id objc_msgSend_userDidTapOnUnlockedScreen(void *a1, const char *a2, ...)
{
  return [a1 userDidTapOnUnlockedScreen];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_weaStackCenterAligned(void *a1, const char *a2, ...)
{
  return [a1 weaStackCenterAligned];
}

id objc_msgSend_weaStackTopAligned(void *a1, const char *a2, ...)
{
  return [a1 weaStackTopAligned];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}