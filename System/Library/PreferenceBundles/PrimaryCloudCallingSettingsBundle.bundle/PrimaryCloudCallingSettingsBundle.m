id sub_3008(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"PRIMARY_CLOUD_CALLING_GROUP" animated:1];
}

id sub_32DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_389C(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_75A8();
    }

    v4 = [*(id *)(a1 + 32) delegate];
    v5 = [*(id *)(a1 + 32) genericErrorAlertController];
    [v4 presentOrUpdateViewController:v5];
  }
}

void sub_3928(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 2) >= 2)
  {
    if (!a2)
    {
      v6 = PHDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Successfully loaded web view URL", v7, 2u);
      }

      [*(id *)(a1 + 32) webSheetCompletion];
    }
  }
  else
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_75A8();
    }

    v4 = [*(id *)(a1 + 32) delegate];
    v5 = [*(id *)(a1 + 32) genericErrorAlertController];
    [v4 presentOrUpdateViewController:v5];
  }
}

void sub_3CD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_3EC8(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalPresentationStyle:2];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3F6C;
  v6[3] = &unk_C3D8;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 presentViewController:v4 animated:1 completion:v6];
}

uint64_t sub_3F6C(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reloading specifiers because the presented view controller was a UIAlertController: %@", (uint8_t *)&v5, 0xCu);
    }

    return (uint64_t)[*(id *)(a1 + 40) reloadSpecifiers];
  }
  return result;
}

void *sub_4B5C(void *result)
{
  v1 = result;
  uint64_t v2 = result[4];
  if (!*(void *)(v2 + 40) || !*(void *)(v2 + 48))
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Timed out trying to load carrier URL", v4, 2u);
    }

    return [(id)v1[4] doWebViewTimedOut];
  }
  return result;
}

uint64_t sub_50FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t sub_5220(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_5328(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  }
  return result;
}

uint64_t sub_544C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

JSValueRef sub_5698(JSContextRef ctx, int a2, JSValueRef value)
{
  if (!value) {
    goto LABEL_6;
  }
  int v5 = (OpaqueJSClass *)qword_11510;
  if (!qword_11510)
  {
    int v5 = JSClassCreate((const JSClassDefinition *)&unk_11460);
    qword_11510 = (uint64_t)v5;
  }
  if (JSValueIsObjectOfClass(ctx, value, v5))
  {
    uint64_t v6 = JSObjectGetPrivate(value);
    id v7 = WebThreadMakeNSInvocation();
    WebThreadCallDelegate();

    JSValueRef Undefined = JSValueMakeUndefined(ctx);
    return Undefined;
  }
  else
  {
LABEL_6:
    return JSValueMakeUndefined(ctx);
  }
}

JSValueRef sub_575C(JSContextRef ctx, int a2, JSValueRef value)
{
  if (!value) {
    goto LABEL_6;
  }
  int v5 = (OpaqueJSClass *)qword_11510;
  if (!qword_11510)
  {
    int v5 = JSClassCreate((const JSClassDefinition *)&unk_11460);
    qword_11510 = (uint64_t)v5;
  }
  if (JSValueIsObjectOfClass(ctx, value, v5))
  {
    uint64_t v6 = JSObjectGetPrivate(value);
    id v7 = WebThreadMakeNSInvocation();
    WebThreadCallDelegate();

    JSValueRef Undefined = JSValueMakeUndefined(ctx);
    return Undefined;
  }
  else
  {
LABEL_6:
    return JSValueMakeUndefined(ctx);
  }
}

BOOL PHUIInCallControlAlignmentIs(void *a1)
{
  return (void *)+[PHUIConfiguration inCallControlAlignment] == a1;
}

void sub_5898(id a1)
{
  v1 = +[CADisplay mainDisplay];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  if (v3 >= v5) {
    double v6 = v3;
  }
  else {
    double v6 = v5;
  }
  int v7 = (int)v6;
  uint64_t v8 = MGGetProductType();
  if (v7 == 1136) {
    goto LABEL_5;
  }
  if (v8 <= 2795618602)
  {
    if (v8 > 851437780)
    {
      if (v8 <= 2688879998)
      {
        if (v8 != 851437781)
        {
          if (v8 != 1169082144) {
            goto LABEL_23;
          }
          goto LABEL_42;
        }
LABEL_32:
        BOOL v11 = v7 == 2556;
        goto LABEL_45;
      }
      if (v8 != 2688879999)
      {
        if (v8 != 2793418701) {
          goto LABEL_23;
        }
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v8 == 133314240) {
      goto LABEL_32;
    }
    if (v8 != 330877086)
    {
      uint64_t v10 = 574536383;
LABEL_22:
      if (v8 != v10) {
        goto LABEL_23;
      }
LABEL_33:
      BOOL v12 = v7 == 2796;
      goto LABEL_34;
    }
    BOOL v12 = v7 == 2868;
LABEL_34:
    uint64_t v9 = 14;
    if (!v12) {
      uint64_t v9 = 15;
    }
    goto LABEL_47;
  }
  if (v8 <= 3001488777)
  {
    if (v8 == 2795618603)
    {
      BOOL v11 = v7 == 2622;
LABEL_45:
      uint64_t v9 = 9;
      if (v11) {
        uint64_t v9 = 12;
      }
      goto LABEL_47;
    }
    if (v8 == 2940697645) {
      goto LABEL_32;
    }
    uint64_t v10 = 2941181571;
    goto LABEL_22;
  }
  if (v8 <= 3885279869)
  {
    if (v8 == 3001488778)
    {
LABEL_42:
      BOOL v11 = v7 == 2532;
      goto LABEL_45;
    }
    uint64_t v10 = 3825599860;
    goto LABEL_22;
  }
  if (v8 == 4201643249)
  {
    BOOL v12 = v7 == 2778;
    goto LABEL_34;
  }
  if (v8 == 3885279870)
  {
    uint64_t v9 = 9;
    if (v7 == 2436) {
      uint64_t v9 = 10;
    }
    goto LABEL_47;
  }
LABEL_23:
  if (v7 > 2271)
  {
    if (v7 > 2531)
    {
      if (v7 > 2731)
      {
        if (v7 == 2732 || v7 == 2752)
        {
          uint64_t v9 = 7;
          goto LABEL_47;
        }
        if (v7 == 2778)
        {
          uint64_t v9 = 14;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v7 == 2532)
      {
        uint64_t v9 = 12;
        goto LABEL_47;
      }
      if (v7 != 2688) {
        goto LABEL_48;
      }
LABEL_74:
      uint64_t v9 = 5;
      goto LABEL_47;
    }
    if (v7 > 2387)
    {
      if (v7 != 2388)
      {
        if (v7 != 2436) {
          goto LABEL_48;
        }
        goto LABEL_77;
      }
    }
    else
    {
      if (v7 == 2272)
      {
LABEL_5:
        uint64_t v9 = 0;
LABEL_47:
        qword_11518 = v9;
        goto LABEL_48;
      }
      if (v7 != 2360) {
        goto LABEL_48;
      }
    }
    uint64_t v9 = 8;
    goto LABEL_47;
  }
  uint64_t v9 = 2;
  if (v7 > 2000)
  {
    if (v7 > 2078)
    {
      switch(v7)
      {
        case 2079:
          uint64_t v9 = 9;
          break;
        case 2208:
          uint64_t v9 = 6;
          break;
        case 2224:
          uint64_t v9 = 3;
          break;
        default:
          goto LABEL_48;
      }
      goto LABEL_47;
    }
    if (v7 != 2001)
    {
      if (v7 == 2048) {
        goto LABEL_47;
      }
      goto LABEL_48;
    }
LABEL_79:
    uint64_t v9 = 1;
    goto LABEL_47;
  }
  if (v7 > 1623)
  {
    if (v7 != 1624)
    {
      if (v7 != 1792) {
        goto LABEL_48;
      }
      goto LABEL_74;
    }
LABEL_77:
    uint64_t v9 = 4;
    goto LABEL_47;
  }
  if (v7 == 1024) {
    goto LABEL_47;
  }
  if (v7 == 1334) {
    goto LABEL_79;
  }
LABEL_48:
  v13 = PHDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    uint64_t v15 = qword_11518;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Determined screen size to be %ld for screenHeight: %d", (uint8_t *)&v14, 0x12u);
  }
}

char *sub_5CDC(uint64_t a1)
{
  uint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 0xE) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = qword_9420[(void)(result - 1)];
  }
  qword_114E0 = v2;
  return result;
}

unint64_t sub_5DB0(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xE) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_9498[result];
  }
  qword_11530 = v2;
  return result;
}

unint64_t sub_5E80(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xF) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_9510[result];
  }
  qword_11540 = v2;
  return result;
}

char *sub_5F50(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 7) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_9590[(void)(result - 1)];
  }
  qword_11550 = v2;
  return result;
}

id sub_6030(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  byte_11560 = result == 0;
  return result;
}

char *sub_60EC(uint64_t a1)
{
  id result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 5) > 9) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = qword_95D0[(void)(result - 5)];
  }
  qword_114E8 = v2;
  return result;
}

unint64_t sub_61CC(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  byte_11578 = (result < 0xF) & (0x5060u >> result);
  return result;
}

unint64_t sub_62A0(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  byte_11588 = (result < 0xF) & (0x5060u >> result);
  return result;
}

unint64_t sub_65AC(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xE) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_9650[result];
  }
  qword_11598 = v2;
  return result;
}

char *sub_667C(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 0xE) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = qword_96C8[(void)(result - 1)];
  }
  qword_114F0 = v2;
  return result;
}

unint64_t sub_6750(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldUseExplicitLayoutDimensions])
  {
    unint64_t result = (unint64_t)[*(id *)(a1 + 32) yOffsetForDialerLCDViewForDxDevices];
  }
  else
  {
    unint64_t result = +[PHUIConfiguration screenSize];
    if (result > 7) {
      uint64_t v3 = 0x4061000000000000;
    }
    else {
      uint64_t v3 = qword_9740[result];
    }
  }
  qword_115B0 = v3;
  return result;
}

double sub_6888(uint64_t a1)
{
  [*(id *)(a1 + 32) yOffsetForDialerLCDView];
  double v3 = v2;
  [*(id *)(a1 + 32) yParticipantsViewAdjustmentForKeypad];
  double result = v3 + v4;
  qword_115C0 = *(void *)&result;
  return result;
}

void sub_6914(id a1)
{
  if (!+[PHUIConfiguration screenSize]) {
    qword_115D0 = 0x4046800000000000;
  }
}

char *sub_6A68(uint64_t a1)
{
  double result = (char *)[*(id *)(a1 + 32) screenSize];
  uint64_t v2 = 1;
  if (result == (unsigned char *)&dword_4 + 3) {
    uint64_t v2 = 2;
  }
  if (result == (unsigned char *)&dword_4 + 2) {
    uint64_t v2 = 0;
  }
  qword_115E0 = v2;
  return result;
}

unint64_t sub_6B30(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 8) {
    uint64_t v2 = 0x4055900000000000;
  }
  else {
    uint64_t v2 = qword_97B0[result];
  }
  qword_114F8 = v2;
  return result;
}

char *sub_6C04(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  double v2 = 13.0;
  if ((unint64_t)(result - 4) <= 0xA) {
    double v2 = dbl_97F8[(void)(result - 4)];
  }
  qword_11500 = *(void *)&v2;
  return result;
}

int *sub_6CD4(uint64_t a1)
{
  unint64_t result = (int *)[*(id *)(a1 + 32) screenSize];
  BOOL v2 = result == (int *)((char *)&dword_8 + 1) || result == &dword_4;
  double v3 = 0.0;
  if (v2) {
    double v3 = 2.5;
  }
  qword_11600 = *(void *)&v3;
  return result;
}

int *sub_6D9C(uint64_t a1)
{
  unint64_t result = (int *)[*(id *)(a1 + 32) screenSize];
  double v2 = 4.0;
  if (result == &dword_4) {
    double v2 = 17.0;
  }
  qword_11610 = *(void *)&v2;
  return result;
}

char *sub_6E64(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  double v2 = 1.0;
  if ((unint64_t)(result - 1) <= 0xE) {
    double v2 = dbl_9850[(void)(result - 1)];
  }
  qword_11508 = *(void *)&v2;
  return result;
}

unint64_t sub_6F70(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  byte_11628 = (result < 9) & (0x18Cu >> result);
  return result;
}

char *sub_7044(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  byte_11638 = result == (unsigned char *)&dword_4 + 3;
  return result;
}

char *sub_710C(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  byte_11648 = result == (unsigned char *)&dword_4 + 2;
  return result;
}

id sub_71C8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  byte_11658 = result == 0;
  return result;
}

void sub_7264(id a1)
{
  unint64_t v1 = +[PHUIConfiguration inCallControlSpacing];
  if (v1 <= 6) {
    byte_11668 = (7u >> v1) & 1;
  }
}

id PHDefaultLog()
{
  if (qword_11680 != -1) {
    dispatch_once(&qword_11680, &stru_C4C8);
  }
  v0 = (void *)qword_11678;

  return v0;
}

void sub_73DC(id a1)
{
  qword_11678 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_11690 != -1) {
    dispatch_once(&qword_11690, &stru_C4E8);
  }
  v0 = (void *)qword_11688;

  return v0;
}

void sub_7474(id a1)
{
  qword_11688 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_116A0 != -1) {
    dispatch_once(&qword_116A0, &stru_C508);
  }
  v0 = (void *)qword_11698;

  return v0;
}

void sub_750C(id a1)
{
  double v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  double v2 = (void *)qword_11698;
  qword_11698 = (uint64_t)v1;
}

void sub_7574()
{
  sub_3CF4();
  sub_3CD8(&dword_0, v0, v1, "Did not receive a non-nil provisioning URL after refreshing CT settings. Presenting generic error alert controller", v2, v3, v4, v5, v6);
}

void sub_75A8()
{
  sub_3CF4();
  sub_3CD8(&dword_0, v0, v1, "Error loading web view. Presenting generic error alert controller", v2, v3, v4, v5, v6);
}

void sub_75DC()
{
  sub_3CF4();
  sub_3CD8(&dword_0, v0, v1, "Asked for requestCarrierController when provisioning status is not-allowed. Returning generic error alert controller", v2, v3, v4, v5, v6);
}

void sub_7610(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "didFailLoadWithError: %@", (uint8_t *)&v2, 0xCu);
}

void sub_7688(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "doProvisioningFailed", v1, 2u);
}

void sub_76CC()
{
}

void sub_76F8()
{
}

void sub_7724()
{
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return _JSClassCreate(definition);
}

void *__cdecl JSObjectGetPrivate(JSObjectRef object)
{
  return _JSObjectGetPrivate(object);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return _JSObjectMake(ctx, jsClass, data);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return _JSStringCreateWithCFString(string);
}

BOOL JSValueIsObjectOfClass(JSContextRef ctx, JSValueRef value, JSClassRef jsClass)
{
  return _JSValueIsObjectOfClass(ctx, value, jsClass);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return _JSValueMakeUndefined(ctx);
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t TUStringKeyForNetwork()
{
  return _TUStringKeyForNetwork();
}

uint64_t WebThreadCallDelegate()
{
  return _WebThreadCallDelegate();
}

uint64_t WebThreadMakeNSInvocation()
{
  return _WebThreadMakeNSInvocation();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_JSObject(void *a1, const char *a2, ...)
{
  return [a1 JSObject];
}

id objc_msgSend_accountsSupportSecondaryCalling(void *a1, const char *a2, ...)
{
  return [a1 accountsSupportSecondaryCalling];
}

id objc_msgSend_ambientHorizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 ambientHorizontalSizeClass];
}

id objc_msgSend_ambientVerticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 ambientVerticalSizeClass];
}

id objc_msgSend_appleAccountRebrandEnabled(void *a1, const char *a2, ...)
{
  return [a1 appleAccountRebrandEnabled];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_callingCapabilityInfo(void *a1, const char *a2, ...)
{
  return [a1 callingCapabilityInfo];
}

id objc_msgSend_cancelWebView(void *a1, const char *a2, ...)
{
  return [a1 cancelWebView];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_cloudCallingDevices(void *a1, const char *a2, ...)
{
  return [a1 cloudCallingDevices];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 deviceSpecifiers];
}

id objc_msgSend_doProvisioningCanceled(void *a1, const char *a2, ...)
{
  return [a1 doProvisioningCanceled];
}

id objc_msgSend_doProvisioningFailed(void *a1, const char *a2, ...)
{
  return [a1 doProvisioningFailed];
}

id objc_msgSend_doWebViewTimedOut(void *a1, const char *a2, ...)
{
  return [a1 doWebViewTimedOut];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_enableCapability(void *a1, const char *a2, ...)
{
  return [a1 enableCapability];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flow(void *a1, const char *a2, ...)
{
  return [a1 flow];
}

id objc_msgSend_genericErrorAlertController(void *a1, const char *a2, ...)
{
  return [a1 genericErrorAlertController];
}

id objc_msgSend_globalContext(void *a1, const char *a2, ...)
{
  return [a1 globalContext];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inCallBottomBarSpacing(void *a1, const char *a2, ...)
{
  return [a1 inCallBottomBarSpacing];
}

id objc_msgSend_inCallControlAlignment(void *a1, const char *a2, ...)
{
  return [a1 inCallControlAlignment];
}

id objc_msgSend_inCallControlSpacing(void *a1, const char *a2, ...)
{
  return [a1 inCallControlSpacing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isPresentingURL(void *a1, const char *a2, ...)
{
  return [a1 isPresentingURL];
}

id objc_msgSend_isProvisioningURLInvalid(void *a1, const char *a2, ...)
{
  return [a1 isProvisioningURLInvalid];
}

id objc_msgSend_isRelayCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRelayCallingEnabled];
}

id objc_msgSend_isThumperCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isThumperCallingEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadWebViewController(void *a1, const char *a2, ...)
{
  return [a1 loadWebViewController];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainSwitchFooterText(void *a1, const char *a2, ...)
{
  return [a1 mainSwitchFooterText];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_preferShorterStrings(void *a1, const char *a2, ...)
{
  return [a1 preferShorterStrings];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_provisioningPostData(void *a1, const char *a2, ...)
{
  return [a1 provisioningPostData];
}

id objc_msgSend_provisioningStatus(void *a1, const char *a2, ...)
{
  return [a1 provisioningStatus];
}

id objc_msgSend_provisioningURL(void *a1, const char *a2, ...)
{
  return [a1 provisioningURL];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return [a1 screenSize];
}

id objc_msgSend_shouldEnableCapability(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableCapability];
}

id objc_msgSend_shouldUseExplicitLayoutDimensions(void *a1, const char *a2, ...)
{
  return [a1 shouldUseExplicitLayoutDimensions];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return [a1 specifierID];
}

id objc_msgSend_specifiersArray(void *a1, const char *a2, ...)
{
  return [a1 specifiersArray];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_supportsDisplayingFaceTimeVideoCalls(void *a1, const char *a2, ...)
{
  return [a1 supportsDisplayingFaceTimeVideoCalls];
}

id objc_msgSend_supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsPrimaryCalling];
}

id objc_msgSend_supportsRelayCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsRelayCalling];
}

id objc_msgSend_supportsRestrictingSecondaryCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsRestrictingSecondaryCalling];
}

id objc_msgSend_supportsThumperCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsThumperCalling];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webSheetCompletion(void *a1, const char *a2, ...)
{
  return [a1 webSheetCompletion];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return [a1 webView];
}

id objc_msgSend_webViewController(void *a1, const char *a2, ...)
{
  return [a1 webViewController];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_windowObject(void *a1, const char *a2, ...)
{
  return [a1 windowObject];
}

id objc_msgSend_yOffsetForDialerLCDView(void *a1, const char *a2, ...)
{
  return [a1 yOffsetForDialerLCDView];
}

id objc_msgSend_yOffsetForDialerLCDViewForDxDevices(void *a1, const char *a2, ...)
{
  return [a1 yOffsetForDialerLCDViewForDxDevices];
}

id objc_msgSend_yParticipantsViewAdjustmentForKeypad(void *a1, const char *a2, ...)
{
  return [a1 yParticipantsViewAdjustmentForKeypad];
}