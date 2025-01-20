uint64_t sub_100004758()
{
  uint64_t vars8;

  qword_10001E2A8 = objc_opt_new();

  return _objc_release_x1();
}

id sub_100004840(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForNotifications:1];
}

void sub_100004FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004FEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004FFC(uint64_t a1)
{
}

id sub_100005004(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _iosEventFilter:a2];
}

void sub_100005154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v10 = v8;
  if (a3 == 1028)
  {
    v9 = +[AXEventRepresentation representationWithData:a4];
    if (([v9 additionalFlags] & 0x8000000) != 0) {
      [v10 _iosEventFilter:v9];
    }
  }
  else if (a3 == 1053)
  {
    if ([v8 snarfingEvents])
    {
      [v10 _handleAccessibilityNotification:1053 forElement:a4];
      [v10 _handleNativeFocusItemChangedNotification:a4];
    }
  }
  else
  {
    [v8 _handleAccessibilityNotification:a3 forElement:a2];
  }
}

uint64_t sub_1000057C4()
{
  qword_10001E2B8 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100005B04(id a1)
{
  id v1 = +[XADDisplayManager sharedManager];
  [v1 setCursorFrameForElement:0];
}

void sub_100005B50(uint64_t a1)
{
  id v3 = +[XADDisplayManager sharedManager];
  v2 = [*(id *)(a1 + 32) _currentElement];
  [v3 setCursorFrameForElement:v2];
}

void sub_100005D50(id a1)
{
  id v1 = (void *)qword_10001E2D0;
  qword_10001E2D0 = (uint64_t)&__NSArray0__struct;
}

void sub_100006640(uint64_t a1, uint64_t a2)
{
  id v6 = +[NSString stringWithFormat:@"%@%i", @"AXAction-", a2];
  v4 = [*(id *)(a1 + 32) _humanReadableStringForAction:a2];
  id v5 = [*(id *)(a1 + 32) addAttribute:v6 toSection:*(void *)(a1 + 40) withPrefix:@"Action" performsAction:1 settable:0 humanReadable:v4 valueType:1 overrideIsInternalWithValue:&__kCFBooleanFalse];
}

void sub_100006DF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_100006E3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementHighlight];
}

void sub_100006E7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementHighlight];
}

void sub_100006EBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementHighlight];
}

id sub_100006EFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForNotificationsIfNecessary:1];
}

void sub_1000070EC(void *a1, uint64_t a2)
{
  v8[0] = @"focused";
  id v3 = a1;
  uint64_t v4 = +[NSNumber numberWithBool:a2];
  v8[1] = @"assistiveTech";
  v9[0] = v4;
  v9[1] = @"AXAudit";
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  id v6 = [v3 uiElement];
  [v6 setAXAttribute:2018 withObject:v5 synchronous:0];

  v7 = [v3 elementForAttribute:2092];

  if (v7) {
    sub_1000070EC(v7, a2);
  }
}

id sub_1000077F0(void *a1)
{
  id v1 = a1;
  v2 = [v1 uiElement];
  id v3 = [v2 objectWithAXAttribute:5019];

  uint64_t v4 = +[AXAuditElement auditElementWithElement:v1 identifier:v3];
  id v5 = sub_100007914(v1);
  id v6 = (const __AXUIElement *)[v1 elementRef];

  v7 = sub_100009560(v6, (const __CFString *)0x836);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 firstObject];
  }
  else
  {
    id v8 = &stru_100019338;
  }
  id v9 = [objc_alloc((Class)AXAuditNode) initWithAuditElement:v4 description:v5 roleDescription:v8];

  return v9;
}

id sub_100007914(void *a1)
{
  id v1 = a1;
  v2 = +[NSMutableString string];
  id v3 = sub_100009560((const __AXUIElement *)[v1 elementRef], (const __CFString *)0x836);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length])
          {
            if ([v2 length]) {
              [v2 appendFormat:@", %@", v9];
            }
            else {
              [v2 appendString:v9];
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v6);
    }
  }
  id v10 = [v1 label];
  if (![v10 length])
  {
    uint64_t v11 = [v1 value];

    id v10 = (void *)v11;
  }
  if ([v10 length])
  {
    v12 = +[NSString stringWithFormat:@"%@ %@", v10, v2];
    [v2 setString:v12];
LABEL_19:

    goto LABEL_20;
  }
  pid_t pid = 0;
  if (AXUIElementGetPid((AXUIElementRef)[v1 elementRef], &pid) == kAXErrorSuccess && pid >= 1)
  {
    mach_port_name_t v19 = 0;
    if (!task_for_pid(mach_task_self_, pid, &v19))
    {
      v12 = sub_100009560((const __AXUIElement *)[v1 elementRef], (const __CFString *)0x13B5);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v2 appendFormat:@"<%@>", v12];
      }
      goto LABEL_19;
    }
  }
LABEL_20:

  return v2;
}

id sub_100007BCC(void *a1)
{
  id v1 = [a1 children];
  v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = sub_1000077F0(*(void **)(*((void *)&v11 + 1) + 8 * v8));
      objc_msgSend(v2, "addObject:", v9, (void)v11);

      if ((unint64_t)(v6 + v8 + 1) > 0x32) {
        break;
      }
      if (v5 == (id)++v8)
      {
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        v6 += v8;
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v2;
}

id sub_100007D28(void *a1, int a2, int a3)
{
  id v4 = a1;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v8 = 0;
    id v9 = 0;
    id v10 = 0;
    goto LABEL_25;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = v4;
  while (1)
  {
    id v9 = v6;

    id v10 = sub_1000077F0(v8);

    if (a2 && !v7 && v6)
    {
      long long v11 = sub_100007BCC(v8);
      if ([v11 count])
      {
        id v12 = [objc_alloc((Class)NSMutableArray) initWithArray:v11];
        [v12 removeObject:v9];
        [v12 insertObject:v9 atIndex:0];
        [v10 setChildren:v12];
      }
    }
    else if (!v9)
    {
      if (!a3) {
        goto LABEL_14;
      }
      long long v15 = sub_100007BCC(v8);
      if (![v15 count]) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    long long v13 = [v10 children];
    id v14 = [v13 count];

    if (!v14)
    {
      id v22 = v9;
      long long v15 = +[NSArray arrayWithObjects:&v22 count:1];
LABEL_12:
      [v10 setChildren:v15];
LABEL_13:
    }
LABEL_14:
    pid_t pid = 0;
    if (AXUIElementGetPid((AXUIElementRef)[v8 elementRef], &pid)) {
      goto LABEL_25;
    }
    if (pid < 1) {
      goto LABEL_25;
    }
    mach_port_name_t v21 = 0;
    if (task_for_pid(mach_task_self_, pid, &v21)) {
      goto LABEL_25;
    }
    long long v16 = [v8 parent];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }

    uint64_t v8 = v16;
    uint64_t v6 = v10;
    uint64_t v7 = v9;
    if (!v16) {
      goto LABEL_25;
    }
  }

LABEL_25:
  id v17 = v10;

  return v17;
}

id sub_100008A38(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (([v3 isAccessibilityOpaqueElementProvider] & 1) == 0)
  {
    id v4 = sub_100008BC4(v3);
  }
  if (v4)
  {
    id v5 = +[NSNumber numberWithLong:a2];
    v13[0] = v5;
    v13[1] = &off_100019930;
    uint64_t v6 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", 0x7FFFFFFFLL, 0);
    v13[2] = v6;
    v13[3] = @"AXAudit";
    uint64_t v7 = +[NSArray arrayWithObjects:v13 count:4];

    uint64_t v8 = [v4 elementForAttribute:95225 parameter:v7];
    id v9 = [v8 uiElement];
    unsigned int v10 = [v9 BOOLWithAXAttribute:2046];

    if (v10)
    {
      uint64_t v11 = sub_100008A38(v8, a2);

      uint64_t v8 = (void *)v11;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_100008BC4(void *a1)
{
  id v1 = a1;
  v2 = [v1 elementForAttribute:2066];
  if (!v2)
  {
    uint64_t v3 = [v1 elementForAttribute:2092];
    id v4 = (void *)v3;
    if (v3)
    {
      v2 = sub_100008BC4(v3);
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

void sub_100009224(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = v6;
  if (a3 == 1044)
  {
    uint64_t v8 = [v6 dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000951C;
    block[3] = &unk_100018898;
    id v10 = v7;
    dispatch_async(v8, block);
  }
}

void sub_10000951C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _elementVisualsCoalescer];
  [v1 notifyUpdateElementVisualsEventDidOccur];
}

id sub_100009560(const __AXUIElement *a1, const __CFString *a2)
{
  CFTypeRef value = 0;
  AXError v2 = AXUIElementCopyAttributeValue(a1, a2, &value);
  uint64_t v3 = 0;
  if (v2 == kAXErrorSuccess && value)
  {
    CFTypeID v4 = CFGetTypeID(value);
    if (v4 == CFArrayGetTypeID()
      || v4 == CFStringGetTypeID()
      || v4 == CFDictionaryGetTypeID()
      || v4 == CFNumberGetTypeID()
      || v4 == CFURLGetTypeID())
    {
      uint64_t v3 = (void *)value;
    }
    else
    {
      CFRelease(value);
      uint64_t v3 = 0;
    }
  }

  return v3;
}

void sub_100009FA0(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierInvertColors];
}

void sub_100009FF0(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierIncreaseContrast];
}

void sub_10000A040(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierReduceMotion];
}

void sub_10000A090(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierReduceTransparency];
}

void sub_10000A0E0(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierBoldFonts];
}

void sub_10000A130(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierOnOffLabels];
}

void sub_10000A180(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierButtonShapes];
}

void sub_10000A1D0(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierGrayscale];
}

void sub_10000A220(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierDifferentiateWithoutColor];
}

void sub_10000A270(uint64_t a1, void *a2)
{
  id v2 = [a2 anyObject];
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierFontsSize];
}

void sub_10000AD1C(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"DidPostContentSizeChanged" object:0];
}

void sub_10000AD70(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"DidPostContentSizeChanged" object:0];
}

uint64_t sub_10000AE9C()
{
  qword_10001E2D8 = objc_opt_new();

  return _objc_release_x1();
}

intptr_t sub_10000B57C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000BA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BA84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkFrontmostAppPidChanged];
}

void sub_10000BF20(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 addObserver:*(void *)(a1 + 32) selector:"_appStateChanged:" name:SBApplicationNotificationStateChanged object:0];

    _SBApplicationStateBeginGeneratingChangeNotifications();
  }
  else
  {
    SBApplicationStateEndGeneratingChangeNotifications();
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:*(void *)(a1 + 32) name:SBApplicationNotificationStateChanged object:0];
  }
}

void sub_10000C0A0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _deviceCaptureScreenshot];
  [v1 invokeCompletionWithReturnValue:v2 error:0];
}

void sub_10000C4C0(uint64_t a1)
{
  id v4 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = [v4 objectForTransportDictionary:*(void *)(a1 + 32) expectedClass:objc_opt_class()];
  id v3 = +[XADInspectorManager sharedManager];
  [v3 setDelegate:*(void *)(a1 + 40)];
  [v3 focusOnElement:v2];
}

id sub_10000C708(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveInDirection:*(void *)(a1 + 40) allowMovingToContainers:*(unsigned __int8 *)(a1 + 48) allowMoveToNonAXElements:*(unsigned __int8 *)(a1 + 49)];
}

void sub_10000C7D8(uint64_t a1)
{
  id v4 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = [v4 objectForTransportDictionary:*(void *)(a1 + 32) expectedClass:objc_opt_class()];
  id v3 = +[XADInspectorManager sharedManager];
  [v3 setDelegate:*(void *)(a1 + 40)];
  [v3 previewOnElement:v2];
}

void sub_10000C934(uint64_t a1)
{
  id v2 = +[XADInspectorManager sharedManager];
  [v2 setDelegate:*(void *)(a1 + 32)];
  [v2 setMonitoredEventType:*(void *)(a1 + 40)];
}

id sub_10000CA94(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) BOOLValue];
  id v3 = *(void **)(a1 + 32);

  return [v3 setShowVisuals:v2];
}

void sub_10000CB78(uint64_t a1)
{
  id v2 = +[XADInspectorManager sharedManager];
  [v2 setDelegate:*(void *)(a1 + 32)];
  [v2 lockOnCurrentElement];
}

void sub_10000D014(uint64_t a1)
{
  id v2 = +[AXAuditObjectTransportManager sharedManager];
  id v3 = [v2 objectForTransportDictionary:*(void *)(a1 + 32) expectedClass:objc_opt_class()];
  id v4 = [v2 objectForTransportDictionary:*(void *)(a1 + 40) expectedClass:objc_opt_class()];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D12C;
  v6[3] = &unk_100018898;
  id v5 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v5 element:v3 performAction:v4 withValue:0 completion:v6];
}

id sub_10000D12C(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeCompletionWithReturnValue:0 error:0];
}

void sub_10000D294(uint64_t a1)
{
  id v2 = +[AXAuditObjectTransportManager sharedManager];
  id v3 = [v2 objectForTransportDictionary:*(void *)(a1 + 32) expectedClass:objc_opt_class()];
  id v4 = [v2 objectForTransportDictionary:*(void *)(a1 + 40) expectedClass:objc_opt_class()];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D3A8;
  v6[3] = &unk_100018BD0;
  id v5 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v5 element:v3 valueForAttribute:v4 completion:v6];
}

void sub_10000D3A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = +[AXAuditObjectTransportManager sharedManager];
  id v4 = [v5 transportDictionaryForObject:v3];

  [*(id *)(a1 + 32) invokeCompletionWithReturnValue:v4 error:0];
}

void sub_10000D5B4(uint64_t a1)
{
  id v2 = +[AXAuditObjectTransportManager sharedManager];
  id v3 = [v2 objectForTransportDictionary:*(void *)(a1 + 32) expectedClass:objc_opt_class()];
  id v4 = [v2 objectForTransportDictionary:*(void *)(a1 + 40) expectedClass:objc_opt_class()];
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D6D0;
  v7[3] = &unk_100018BD0;
  id v8 = *(id *)(a1 + 64);
  [v5 element:v3 valueForParameterizedAttribute:v4 withObject:v6 completion:v7];
}

void sub_10000D6D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = +[AXAuditObjectTransportManager sharedManager];
  id v4 = [v5 transportDictionaryForObject:v3];

  [*(id *)(a1 + 32) invokeCompletionWithReturnValue:v4 error:0];
}

id sub_10000D83C(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 focusOnAXElement:v3];
}

void sub_10000D9AC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) fetchSpecialElement:*(void *)(a1 + 48)];
  id v2 = +[AXAuditObjectTransportManager sharedManager];
  uint64_t v3 = [v2 transportDictionaryForObject:v4];
  [*(id *)(a1 + 40) invokeCompletionWithReturnValue:v3 error:0];
}

void sub_10000DB2C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithUnsignedChar:_AXSMossdeepEnabled()];
  [v1 invokeCompletionWithReturnValue:v2 error:0];
}

void sub_10000DCC4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fetchElementAtNormalizedDeviceCoordinate:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[AXAuditObjectTransportManager sharedManager];
  uint64_t v3 = [v2 transportDictionaryForObject:v4];
  [*(id *)(a1 + 40) invokeCompletionWithReturnValue:v3 error:0];
}

id sub_10000DE54(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 deviceDidGetTargeted];
}

id sub_10000DF4C(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 setMonitoredEventType:0];
}

void sub_10000E06C(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  id v3 = +[AXElement elementWithUIElement:*(void *)(a1 + 48)];
  [v2 focusOnAXElement:v3];
}

id sub_10000E1AC(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);

  return objc_msgSend(v2, "focusOnElementAtPoint:", v3, v4);
}

void sub_10000E940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E980(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E990(uint64_t a1)
{
}

void sub_10000E998(uint64_t a1)
{
  id v4 = +[AXAuditObjectTransportManager sharedManager];
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  double v3 = [v4 transportArrayForArray:v2];

  [*(id *)(a1 + 32) invokeCompletionWithReturnValue:v3 error:0];
}

BOOL sub_10000EA9C(id a1, AXElement *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = [(AXElement *)v4 bundleId];
  unsigned __int8 v6 = [v5 isEqualToString:@"com.apple.springboard"];

  id v7 = [(AXElement *)v4 bundleId];
  unsigned __int8 v8 = [v7 isEqualToString:AX_SpotlightBundleName];

  id v9 = +[AXSpringBoardServer server];
  id v10 = [v9 jindoAppBundleIndentifiers];
  uint64_t v11 = [(AXElement *)v4 bundleId];

  LOBYTE(v4) = [v10 containsObject:v11];
  return (v6 | v4 | v8) ^ 1;
}

id sub_10000EC6C(void *a1)
{
  id v1 = a1;
  id v2 = +[XADInspectorManager sharedManager];
  double v3 = [v2 firstElementInHierarchy:v1];

  return v3;
}

id sub_10000EEC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAttributesIfElementIsValid];
}

id sub_10000F014(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_screenChangeHandleAttempts:", (char *)objc_msgSend(*(id *)(a1 + 32), "_screenChangeHandleAttempts") + 1);
  id v2 = *(void **)(a1 + 32);

  return [v2 _handleScreenChangedNotification];
}

id sub_10000F178(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleScreenChangedNotification];
}

uint64_t start()
{
  if (DTHostInDeveloperMode())
  {
    int v0 = _AXSApplicationAccessibilityEnabled();
    _AXSApplicationAccessibilitySetEnabled();
    _AXSSetAuditInspectionModeEnabled();
    SystemWide = AXUIElementCreateSystemWide();
    AXUIElementSetMessagingTimeout(SystemWide, 10000.0);
    if (!v0) {
      AXDisableAccessibilityOnTermination();
    }
    id v2 = +[AXAuditPluginManager sharedManager];
    [v2 loadAuditBundles];

    mach_service = xpc_connection_create_mach_service("com.apple.accessibility.axAuditDaemon.deviceservice.xpc", 0, 1uLL);
    xpc_connection_set_event_handler(mach_service, &stru_100018CF0);
    xpc_connection_resume(mach_service);
    int v4 = lockdown_checkin_xpc();
    if (v4)
    {
      int v7 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        id v9 = getprogname();
        __int16 v10 = 1024;
        pid_t v11 = getpid();
        __int16 v12 = 1024;
        int v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s(%d) xpc-based lockdown checkin failure: %d\n", (uint8_t *)&v8, 0x18u);
      }
      exit(1);
    }
    id v5 = +[NSRunLoop currentRunLoop];
    [v5 run];

    return 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000FC48();
    }
    return 1;
  }
}

void sub_10000F688(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000F7C8;
    handler[3] = &unk_100018D18;
    double v3 = v2;
    id v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume(v3);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v7 = getprogname();
    __int16 v8 = 1024;
    pid_t v9 = getpid();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s(%d): Invalid connection\n", buf, 0x12u);
  }
}

void sub_10000F7C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    region = 0;
    int v4 = xpc_dictionary_get_value(v3, "dtx_shared_memory");
    id v5 = v4;
    if (v4 && xpc_shmem_map(v4, &region))
    {
      id v6 = objc_alloc((Class)DTXSharedMemoryTransport);
      id v7 = [v6 initWithMappedMemory:region];
      __int16 v8 = v7;
      if (v7)
      {
        sub_10000FA9C(v7);
        xpc_object_t reply = xpc_dictionary_create_reply(v3);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
        __int16 v10 = *(void **)(a1 + 32);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10000FB04;
        v17[3] = &unk_100018898;
        long long v18 = v10;
        xpc_connection_send_barrier(v18, v17);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = getprogname();
          pid_t v15 = getpid();
          pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
          *(_DWORD *)buf = 136315650;
          mach_port_name_t v21 = v14;
          __int16 v22 = 1024;
          pid_t v23 = v15;
          __int16 v24 = 1024;
          pid_t v25 = pid;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s(%d): failed to create transport; xpc peer: %d\n",
            buf,
            0x18u);
        }
        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v11 = getprogname();
        pid_t v12 = getpid();
        pid_t v13 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        *(_DWORD *)buf = 136315650;
        mach_port_name_t v21 = v11;
        __int16 v22 = 1024;
        pid_t v23 = v12;
        __int16 v24 = 1024;
        pid_t v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s(%d): shared memory mapping failed; xpc peer: %d\n",
          buf,
          0x18u);
      }
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
  }
  else
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      mach_port_name_t v21 = getprogname();
      __int16 v22 = 1024;
      pid_t v23 = getpid();
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s(%d): Invalid event type\n", buf, 0x12u);
    }
  }
}

void sub_10000FA9C(void *a1)
{
  id v1 = a1;
  id v2 = [[XADAuditServer alloc] initWithTransport:v1];

  [(XADAuditServer *)v2 resume];
}

void sub_10000FB04(uint64_t a1)
{
}

void sub_10000FB0C(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000FBB0;
  v4[3] = &unk_100018870;
  v4[4] = a2;
  id v3 = [objc_alloc((Class)DTXSocketTransport) initWithConnectedSocket:lockdown_get_socket() disconnectAction:v4];
  sub_10000FA9C(v3);
}

uint64_t sub_10000FBB0(uint64_t a1)
{
  id v2 = +[XADDisplayManager sharedManager];
  [v2 hideVisualsSynchronously];

  uint64_t v3 = *(void *)(a1 + 32);

  return _lockdown_disconnect(v3);
}

void sub_10000FC00()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Device got targeted!", v0, 2u);
}

void sub_10000FC48()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "audit daemon failed to start: developer mode NOT ENABLED!", v0, 2u);
}

uint64_t AXAuditAttributeWithPrefixLocStringExists()
{
  return _AXAuditAttributeWithPrefixLocStringExists();
}

uint64_t AXAuditCurrentApplications()
{
  return _AXAuditCurrentApplications();
}

uint64_t AXAuditLocString()
{
  return _AXAuditLocString();
}

uint64_t AXAuditPidForElement()
{
  return _AXAuditPidForElement();
}

uint64_t AXDisableAccessibilityOnTermination()
{
  return _AXDisableAccessibilityOnTermination();
}

uint64_t AXEventTypeIsVolumeButtonPress()
{
  return _AXEventTypeIsVolumeButtonPress();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return _AXObserverAddNotification(observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return _AXObserverCreate(application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return _AXObserverGetRunLoopSource(observer);
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  return _AXObserverRemoveNotification(observer, element, notification);
}

AXError AXUIElementCopyAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef *value)
{
  return _AXUIElementCopyAttributeValue(element, attribute, value);
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return _AXUIElementCreateSystemWide();
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return _AXUIElementGetPid(element, pid);
}

CFTypeID AXUIElementGetTypeID(void)
{
  return _AXUIElementGetTypeID();
}

uint64_t AXUIElementRegisterSystemWideServerDeathCallback()
{
  return _AXUIElementRegisterSystemWideServerDeathCallback();
}

AXError AXUIElementSetMessagingTimeout(AXUIElementRef element, float timeoutInSeconds)
{
  return _AXUIElementSetMessagingTimeout(element, timeoutInSeconds);
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return _AXValueCreate(theType, valuePtr);
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return _AXValueGetValue(value, theType, valuePtr);
}

uint64_t AX_CGPathCopyDataRepresentation()
{
  return _AX_CGPathCopyDataRepresentation();
}

uint64_t AuditDoesAllowDeveloperAttributes()
{
  return _AuditDoesAllowDeveloperAttributes();
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFTypeID CFURLGetTypeID(void)
{
  return _CFURLGetTypeID();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t DTHostInDeveloperMode()
{
  return _DTHostInDeveloperMode();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

uint64_t SBApplicationStateEndGeneratingChangeNotifications()
{
  return _SBApplicationStateEndGeneratingChangeNotifications();
}

uint64_t SBApplicationStateGetDescription()
{
  return _SBApplicationStateGetDescription();
}

uint64_t SBSCopyBundleInfoValueForKeyAndProcessID()
{
  return _SBSCopyBundleInfoValueForKeyAndProcessID();
}

uint64_t SBSCopyLocalizedApplicationNameForDisplayIdentifier()
{
  return _SBSCopyLocalizedApplicationNameForDisplayIdentifier();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t _AXDarkenSystemColors()
{
  return __AXDarkenSystemColors();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return __AXSApplicationAccessibilityEnabled();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return __AXSApplicationAccessibilitySetEnabled();
}

uint64_t _AXSButtonShapesEnabled()
{
  return __AXSButtonShapesEnabled();
}

uint64_t _AXSDifferentiateWithoutColorEnabled()
{
  return __AXSDifferentiateWithoutColorEnabled();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return __AXSEnhanceBackgroundContrastEnabled();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return __AXSEnhanceTextLegibilityEnabled();
}

uint64_t _AXSGrayscaleEnabled()
{
  return __AXSGrayscaleEnabled();
}

uint64_t _AXSGrayscaleSetEnabled()
{
  return __AXSGrayscaleSetEnabled();
}

uint64_t _AXSIncreaseButtonLegibility()
{
  return __AXSIncreaseButtonLegibility();
}

uint64_t _AXSInvertColorsEnabled()
{
  return __AXSInvertColorsEnabled();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return __AXSInvertColorsSetEnabled();
}

uint64_t _AXSMossdeepEnabled()
{
  return __AXSMossdeepEnabled();
}

uint64_t _AXSReduceMotionEnabled()
{
  return __AXSReduceMotionEnabled();
}

uint64_t _AXSSetAuditInspectionModeEnabled()
{
  return __AXSSetAuditInspectionModeEnabled();
}

uint64_t _AXSSetButtonShapesEnabled()
{
  return __AXSSetButtonShapesEnabled();
}

uint64_t _AXSSetDarkenSystemColors()
{
  return __AXSSetDarkenSystemColors();
}

uint64_t _AXSSetDifferentiateWithoutColorEnabled()
{
  return __AXSSetDifferentiateWithoutColorEnabled();
}

uint64_t _AXSSetEnhanceBackgroundContrastEnabled()
{
  return __AXSSetEnhanceBackgroundContrastEnabled();
}

uint64_t _AXSSetEnhanceTextLegibilityEnabled()
{
  return __AXSSetEnhanceTextLegibilityEnabled();
}

uint64_t _AXSSetIncreaseButtonLegibility()
{
  return __AXSSetIncreaseButtonLegibility();
}

uint64_t _AXSSetReduceMotionEnabled()
{
  return __AXSSetReduceMotionEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

uint64_t iOSFrontmostApp()
{
  return _iOSFrontmostApp();
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
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
  return _objc_msgSendSuper2(a1, a2);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return _task_for_pid(target_tport, pid, t);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return _xpc_shmem_map(xshmem, region);
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend__accessibilityNotificationsToObserve(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityNotificationsToObserve];
}

id objc_msgSend__actionSection(void *a1, const char *a2, ...)
{
  return [a1 _actionSection];
}

id objc_msgSend__auditInspectorFocuseObject(void *a1, const char *a2, ...)
{
  return [a1 _auditInspectorFocuseObject];
}

id objc_msgSend__axEventObserver(void *a1, const char *a2, ...)
{
  return [a1 _axEventObserver];
}

id objc_msgSend__basicSection(void *a1, const char *a2, ...)
{
  return [a1 _basicSection];
}

id objc_msgSend__checkFrontmostAppPidChanged(void *a1, const char *a2, ...)
{
  return [a1 _checkFrontmostAppPidChanged];
}

id objc_msgSend__currentCursorFrame(void *a1, const char *a2, ...)
{
  return [a1 _currentCursorFrame];
}

id objc_msgSend__currentElement(void *a1, const char *a2, ...)
{
  return [a1 _currentElement];
}

id objc_msgSend__currentMedusaApplications(void *a1, const char *a2, ...)
{
  return [a1 _currentMedusaApplications];
}

id objc_msgSend__developerOnlyAttributes(void *a1, const char *a2, ...)
{
  return [a1 _developerOnlyAttributes];
}

id objc_msgSend__deviceCaptureScreenshot(void *a1, const char *a2, ...)
{
  return [a1 _deviceCaptureScreenshot];
}

id objc_msgSend__disableIdleTimerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _disableIdleTimerAssertion];
}

id objc_msgSend__elementSection(void *a1, const char *a2, ...)
{
  return [a1 _elementSection];
}

id objc_msgSend__elementVisualsCoalescer(void *a1, const char *a2, ...)
{
  return [a1 _elementVisualsCoalescer];
}

id objc_msgSend__eventProcessor(void *a1, const char *a2, ...)
{
  return [a1 _eventProcessor];
}

id objc_msgSend__focusedElementHistory(void *a1, const char *a2, ...)
{
  return [a1 _focusedElementHistory];
}

id objc_msgSend__fontCategories(void *a1, const char *a2, ...)
{
  return [a1 _fontCategories];
}

id objc_msgSend__forceRefreshOnNextUpdate(void *a1, const char *a2, ...)
{
  return [a1 _forceRefreshOnNextUpdate];
}

id objc_msgSend__frontmostAppUpdateCoalescer(void *a1, const char *a2, ...)
{
  return [a1 _frontmostAppUpdateCoalescer];
}

id objc_msgSend__handlingScreenChanged(void *a1, const char *a2, ...)
{
  return [a1 _handlingScreenChanged];
}

id objc_msgSend__hierarchySection(void *a1, const char *a2, ...)
{
  return [a1 _hierarchySection];
}

id objc_msgSend__initializeAXObserverIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _initializeAXObserverIfNeeded];
}

id objc_msgSend__initializeElementVisualsCoalescer(void *a1, const char *a2, ...)
{
  return [a1 _initializeElementVisualsCoalescer];
}

id objc_msgSend__inspectorSections(void *a1, const char *a2, ...)
{
  return [a1 _inspectorSections];
}

id objc_msgSend__internalAttributes(void *a1, const char *a2, ...)
{
  return [a1 _internalAttributes];
}

id objc_msgSend__lastPoint(void *a1, const char *a2, ...)
{
  return [a1 _lastPoint];
}

id objc_msgSend__lock(void *a1, const char *a2, ...)
{
  return [a1 _lock];
}

id objc_msgSend__mostRecentElementFetchedVisionOS(void *a1, const char *a2, ...)
{
  return [a1 _mostRecentElementFetchedVisionOS];
}

id objc_msgSend__notificationContext(void *a1, const char *a2, ...)
{
  return [a1 _notificationContext];
}

id objc_msgSend__platformDefaultSettings(void *a1, const char *a2, ...)
{
  return [a1 _platformDefaultSettings];
}

id objc_msgSend__platformSettings(void *a1, const char *a2, ...)
{
  return [a1 _platformSettings];
}

id objc_msgSend__registeredForNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registeredForNotifications];
}

id objc_msgSend__screenChangeHandleAttempts(void *a1, const char *a2, ...)
{
  return [a1 _screenChangeHandleAttempts];
}

id objc_msgSend__shouldHideCursor(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideCursor];
}

id objc_msgSend__uiClient(void *a1, const char *a2, ...)
{
  return [a1 _uiClient];
}

id objc_msgSend__updateElementHighlight(void *a1, const char *a2, ...)
{
  return [a1 _updateElementHighlight];
}

id objc_msgSend_additionalFlags(void *a1, const char *a2, ...)
{
  return [a1 additionalFlags];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appMatchingTargetPid(void *a1, const char *a2, ...)
{
  return [a1 appMatchingTargetPid];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributeName(void *a1, const char *a2, ...)
{
  return [a1 attributeName];
}

id objc_msgSend_axElement(void *a1, const char *a2, ...)
{
  return [a1 axElement];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionInterrupted(void *a1, const char *a2, ...)
{
  return [a1 connectionInterrupted];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentFingerCount(void *a1, const char *a2, ...)
{
  return [a1 currentFingerCount];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentValueNumber(void *a1, const char *a2, ...)
{
  return [a1 currentValueNumber];
}

id objc_msgSend_customActions(void *a1, const char *a2, ...)
{
  return [a1 customActions];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceDidGetTargeted(void *a1, const char *a2, ...)
{
  return [a1 deviceDidGetTargeted];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadAssetsIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 downloadAssetsIfNecessary];
}

id objc_msgSend_elementRef(void *a1, const char *a2, ...)
{
  return [a1 elementRef];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstPath(void *a1, const char *a2, ...)
{
  return [a1 firstPath];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frontmostAppForTargetPid(void *a1, const char *a2, ...)
{
  return [a1 frontmostAppForTargetPid];
}

id objc_msgSend_frontmostApplicationsDidChange(void *a1, const char *a2, ...)
{
  return [a1 frontmostApplicationsDidChange];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return [a1 handInfo];
}

id objc_msgSend_hideVisualsSynchronously(void *a1, const char *a2, ...)
{
  return [a1 hideVisualsSynchronously];
}

id objc_msgSend_hint(void *a1, const char *a2, ...)
{
  return [a1 hint];
}

id objc_msgSend_hostAPIVersion(void *a1, const char *a2, ...)
{
  return [a1 hostAPIVersion];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAccessibilityOpaqueElementProvider(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityOpaqueElementProvider];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_jindoAppBundleIndentifiers(void *a1, const char *a2, ...)
{
  return [a1 jindoAppBundleIndentifiers];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastFetchDateForDeviceCoodinate(void *a1, const char *a2, ...)
{
  return [a1 lastFetchDateForDeviceCoodinate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadAuditBundles(void *a1, const char *a2, ...)
{
  return [a1 loadAuditBundles];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockOnCurrentElement(void *a1, const char *a2, ...)
{
  return [a1 lockOnCurrentElement];
}

id objc_msgSend_monitoredEventType(void *a1, const char *a2, ...)
{
  return [a1 monitoredEventType];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_neuterUpdates(void *a1, const char *a2, ...)
{
  return [a1 neuterUpdates];
}

id objc_msgSend_notifyUpdateElementVisualsEventDidOccur(void *a1, const char *a2, ...)
{
  return [a1 notifyUpdateElementVisualsEventDidOccur];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return [a1 pathLocation];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_platformPlugin(void *a1, const char *a2, ...)
{
  return [a1 platformPlugin];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runningApplications(void *a1, const char *a2, ...)
{
  return [a1 runningApplications];
}

id objc_msgSend_scrollToVisible(void *a1, const char *a2, ...)
{
  return [a1 scrollToVisible];
}

id objc_msgSend_senderID(void *a1, const char *a2, ...)
{
  return [a1 senderID];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_showVisuals(void *a1, const char *a2, ...)
{
  return [a1 showVisuals];
}

id objc_msgSend_snarfingEvents(void *a1, const char *a2, ...)
{
  return [a1 snarfingEvents];
}

id objc_msgSend_stopObservingChanges(void *a1, const char *a2, ...)
{
  return [a1 stopObservingChanges];
}

id objc_msgSend_stopSnarfingOnTouchUp(void *a1, const char *a2, ...)
{
  return [a1 stopSnarfingOnTouchUp];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_systemWideAXUIElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideAXUIElement];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideElement];
}

id objc_msgSend_targetPid(void *a1, const char *a2, ...)
{
  return [a1 targetPid];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return [a1 traits];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uiElement(void *a1, const char *a2, ...)
{
  return [a1 uiElement];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateRunningApplications(void *a1, const char *a2, ...)
{
  return [a1 updateRunningApplications];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInputLabels(void *a1, const char *a2, ...)
{
  return [a1 userInputLabels];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithRange:");
}