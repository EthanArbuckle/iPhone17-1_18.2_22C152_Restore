Class sub_255C(uint64_t a1)
{
  Class result;
  void *v3[6];
  long long v4;
  uint64_t v5;

  v3[0] = 0;
  if (!qword_20EC8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_109A8;
    v3[4] = &unk_19790;
    v3[5] = v3;
    v4 = off_19810;
    v5 = 0;
    qword_20EC8 = _sl_dlopen();
    if (!qword_20EC8)
    {
      abort_report_np();
LABEL_8:
      sub_10BA8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  result = objc_getClass("CCSControlCenterService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_20EC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_30B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_36A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_3894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4494(_Unwind_Exception *a1)
{
}

void sub_5AAC(_Unwind_Exception *a1)
{
}

void sub_5C00(id a1)
{
  qword_20E58 = (uint64_t)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"UICTContentSizeCategoryXS", @"UICTContentSizeCategoryS", @"UICTContentSizeCategoryM", @"UICTContentSizeCategoryL", @"UICTContentSizeCategoryXL", @"UICTContentSizeCategoryXXL", @"UICTContentSizeCategoryXXXL", @"UICTContentSizeCategoryAccessibilityM", @"UICTContentSizeCategoryAccessibilityL", @"UICTContentSizeCategoryAccessibilityXL", @"UICTContentSizeCategoryAccessibilityXXL", @"UICTContentSizeCategoryAccessibilityXXXL", 0);

  _objc_release_x1();
}

uint64_t sub_5CC0()
{
  v3[0] = 0;
  if (!qword_20EA8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_1077C;
    v3[4] = &unk_19790;
    v3[5] = v3;
    long long v4 = off_197E0;
    uint64_t v5 = 0;
    qword_20EA8 = _sl_dlopen();
  }
  uint64_t v0 = qword_20EA8;
  v1 = (void *)v3[0];
  if (!qword_20EA8)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_6120(id a1)
{
  qword_20E38 = objc_alloc_init(AXAggregateStatisticsServer);

  _objc_release_x1();
}

void sub_62DC(id a1)
{
  qword_20E48 = objc_alloc_init(AXAggregateStatistics);

  _objc_release_x1();
}

id sub_642C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLogging];
}

void sub_6B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

id sub_6B64(uint64_t a1)
{
  CFStringRef v4 = @"overlay";
  v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  uint64_t v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_6C18(uint64_t a1)
{
  CFStringRef v5 = @"enabled";
  v1 = [*(id *)(a1 + 32) vocabularyEntries];
  v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v1 count] != 0);
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

id sub_6CF0(uint64_t a1)
{
  CFStringRef v4 = @"disabled";
  v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_6DA4(id a1)
{
  CFStringRef v4 = @"enabled";
  v1 = +[NSNumber numberWithUnsignedChar:_AXSAssistiveTouchScannerEnabled()];
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_6E5C(id a1)
{
  CFStringRef v4 = @"enabled";
  v1 = +[NSNumber numberWithUnsignedChar:_AXSAssistiveTouchEnabled()];
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_6F14(id a1)
{
  CFStringRef v4 = @"enabled";
  v1 = +[NSNumber numberWithUnsignedChar:_AXSZoomTouchEnabled()];
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

id sub_6FCC(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_7080(uint64_t a1)
{
  v7[0] = @"HasCustomTone";
  v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = @"HasCustomHaptic";
  v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v7[2] = @"Detector";
  uint64_t v4 = *(void *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

BOOL sub_7174(id a1, AXSDKShotDetector *a2, unint64_t a3)
{
  return [(AXSDKShotDetector *)a2 isModelReady];
}

id sub_717C(uint64_t a1)
{
  v7[0] = @"HasCustomTone";
  v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = @"HasCustomHaptic";
  v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v7[2] = @"Detector";
  uint64_t v4 = *(void *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

uint64_t sub_7270(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7280(uint64_t a1)
{
}

void sub_7288(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 source];
  unsigned int v4 = [v3 isEqualToString:SCATSwitchSourceSound];

  CFStringRef v5 = v10;
  if (v4)
  {
    v6 = (char *)[v10 accessibilityEventUsage] - 1;
    CFStringRef v5 = v10;
    switch((unint64_t)v6)
    {
      case 0uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"click";
        goto LABEL_17;
      case 1uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"cluck";
        goto LABEL_17;
      case 2uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"ee";
        goto LABEL_17;
      case 3uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"eh";
        goto LABEL_17;
      case 4uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"kk";
        goto LABEL_17;
      case 5uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"la";
        goto LABEL_17;
      case 6uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"muh";
        goto LABEL_17;
      case 7uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"oo";
        goto LABEL_17;
      case 8uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"pop";
        goto LABEL_17;
      case 9uLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"pp";
        goto LABEL_17;
      case 0xAuLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"sh";
        goto LABEL_17;
      case 0xBuLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"ss";
        goto LABEL_17;
      case 0xCuLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"tt";
        goto LABEL_17;
      case 0xDuLL:
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        CFStringRef v9 = @"uh";
LABEL_17:
        *(void *)(v7 + 40) = v9;

        CFStringRef v5 = v10;
        break;
      default:
        break;
    }
  }
}

id sub_74C4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_74CC(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 source];
  unsigned int v4 = [v3 isEqualToString:SCATSwitchSourceBackTap];

  if (v4)
  {
    if ([v5 accessibilityEventUsage] == (char *)&dword_0 + 1) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    if ([v5 accessibilityEventUsage] == (char *)&dword_0 + 2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

id sub_7580(uint64_t a1)
{
  v8[0] = @"enabled";
  v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = @"client";
  v8[2] = @"doubletap";
  unsigned int v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v9[2] = v4;
  void v8[3] = @"tripletap";
  id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
  v9[3] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

id sub_7698(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"action";
  uint64_t v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_771C(id a1)
{
  CFStringRef v5 = @"backtapUsageCount";
  uint64_t v1 = +[AXSettings sharedInstance];
  v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 backTapUsageCount]);
  v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_77F4(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"peopleDetectionEnabledForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_78B8(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"doorDetectionEnabledForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_797C(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"doorDetectionDecorations"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_7A40(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"doorDetectionAttributes"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_7B04(uint64_t a1)
{
  v22[0] = @"approach";
  v21 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v21 containsString:@"0"]);
  v23[0] = v20;
  v22[1] = @"color";
  v19 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v19 containsString:@"1"]);
  v23[1] = v18;
  v22[2] = @"doorHandle";
  v17 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 containsString:@"2"]);
  v23[2] = v16;
  v22[3] = @"openMethod";
  v15 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 containsString:@"3"]);
  v23[3] = v14;
  v22[4] = @"openState";
  v13 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 containsString:@"4"]);
  v23[4] = v12;
  v22[5] = @"shape";
  v2 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 containsString:@"5"]);
  v23[5] = v3;
  v22[6] = @"size";
  CFStringRef v4 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  CFStringRef v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 containsString:@"6"]);
  v23[6] = v5;
  v22[7] = @"window";
  v6 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 containsString:@"7"]);
  v23[7] = v7;
  v22[8] = @"material";
  v8 = [*(id *)(a1 + 32) valueForKey:@"selectedAttributes"];
  CFStringRef v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 containsString:@"8"]);
  v23[8] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:9];

  return v10;
}

id sub_7EB0(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"pointSpeakEnabledForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_7F74(uint64_t a1)
{
  v6[0] = @"under";
  v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) integerForKey:@"pointSpeakFingerLocation"] == 0);
  v6[1] = @"above";
  v7[0] = v2;
  uint64_t v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) integerForKey:@"pointSpeakFingerLocation"] == (char *)&dword_0 + 1);
  v7[1] = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id sub_8084(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"textDetectionEnabledForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_8148(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"objectUnderstandingEnabledForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_820C(uint64_t a1)
{
  CFStringRef v4 = @"detectLanguages";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:"));
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_82C8(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"savedActivityForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_838C(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"switchedActivityForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_8450(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"readerModeEnabledForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_8514(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"readerModeSpeechEnabledForAnalytics"]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_8620(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[AVSSettings avsFeatureEnabled]);
  CFStringRef v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_86E0(id a1)
{
  CFStringRef v5 = @"numberOfEnrolledCommands";
  uint64_t v1 = +[AVSStore shortcuts];
  v2 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v1 count]);
  v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_87B8(uint64_t a1)
{
  v7[0] = @"name";
  v2 = [*(id *)(a1 + 32) name];
  v8[0] = v2;
  v7[1] = @"vendorId";
  uint64_t v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) vendorId]);
  v8[1] = v3;
  void v7[2] = @"productId";
  CFStringRef v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) productId]);
  v8[2] = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id sub_88D8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buttonMap];
  uint64_t v3 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v2 count]);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CFStringRef v4 = objc_msgSend(*(id *)(a1 + 32), "buttonMap", 0);
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [*(id *)(a1 + 32) buttonMap];
        v11 = [v10 objectForKeyedSubscript:v9];
        v12 = [v9 stringValue];
        [v3 setObject:v11 forKeyedSubscript:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

NSDictionary *__cdecl sub_8A6C(id a1)
{
  v7[0] = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 assistiveTouchMouseKeysEnabled]);
  v7[1] = @"optionToggleEnabled";
  v8[0] = v2;
  uint64_t v3 = +[AXSettings sharedInstance];
  CFStringRef v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseKeysOptionToggleEnabled]);
  v8[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_8B8C(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 assistiveTouchMouseDwellControlEnabled]);
  id v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_8C64(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_8CDC(uint64_t a1)
{
  v2 = +[NSNumber numberWithUnsignedChar:_AXSPointerAllowAppCustomizationEnabled(), @"allowAppCustomization"];
  v18[0] = v2;
  v17[1] = @"inertia";
  uint64_t v3 = +[NSNumber numberWithUnsignedChar:_AXSPointerInertiaEnabled()];
  v18[1] = v3;
  v17[2] = @"effectScaling";
  CFStringRef v4 = +[NSNumber numberWithUnsignedChar:_AXSPointerEffectScalingEnabled()];
  v18[2] = v4;
  v17[3] = @"sizeMultiplier";
  _AXSPointerSizeMultiplier();
  CFStringRef v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v18[3] = v5;
  v17[4] = @"increasedContrast";
  id v6 = +[NSNumber numberWithUnsignedChar:_AXSPointerIncreasedContrastEnabled()];
  v18[4] = v6;
  v17[5] = @"autoHideEnabled";
  uint64_t v7 = +[NSNumber numberWithUnsignedChar:_AXSPointerAutoHideEnabled()];
  v18[5] = v7;
  v17[6] = @"scaleWithZoom";
  v8 = +[NSNumber numberWithUnsignedChar:_AXSPointerScaleWithZoomLevelEnabled()];
  v18[6] = v8;
  v17[7] = @"strokeColor";
  int v9 = *(_DWORD *)(a1 + 40) - 1;
  if (v9 > 5) {
    CFStringRef v10 = @"None";
  }
  else {
    CFStringRef v10 = *(&off_19828 + v9);
  }
  v18[7] = v10;
  v17[8] = @"doubleTapDragMode";
  v11 = [*(id *)(a1 + 32) globalDevicePreferences];
  v12 = (char *)[v11 doubleTapDragMode];
  v13 = @"disabled";
  if (v12 == (unsigned char *)&dword_0 + 1) {
    v13 = @"without drag lock";
  }
  if (v12 == (unsigned char *)&dword_0 + 2) {
    v13 = @"with drag lock";
  }
  v18[8] = v13;
  long long v14 = v13;
  long long v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:9];

  return v15;
}

NSDictionary *__cdecl sub_8F6C(id a1)
{
  v7[0] = @"speakUnderPointerEnabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSVoiceOverSpeakUnderPointerEnabled()];
  v7[1] = @"cursorOption";
  v8[0] = v1;
  int v2 = _AXSPointerVoiceOverCursorOption();
  uint64_t v3 = @"Ignore";
  if (v2 == 1) {
    uint64_t v3 = @"Follow";
  }
  if (v2 == 2) {
    uint64_t v3 = @"Move";
  }
  v8[1] = v3;
  CFStringRef v4 = v3;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_9074(id a1)
{
  CFStringRef v7 = @"style";
  uint64_t v1 = +[AXSettings sharedInstance];
  int v2 = (char *)[v1 assistiveTouchMouseZoomPanningStyle];
  uint64_t v3 = @"Continuous";
  if (v2 == (unsigned char *)&dword_0 + 1) {
    uint64_t v3 = @"Centered";
  }
  if (v2 == (unsigned char *)&dword_0 + 2) {
    uint64_t v3 = @"Edges";
  }
  v8 = v3;
  CFStringRef v4 = v3;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_934C(id a1)
{
  id v1 = objc_alloc((Class)NSUserDefaults);
  id v2 = [v1 initWithSuiteName:AX_SpringBoardBundleName];
  unsigned int v3 = [v2 BOOLForKey:@"SBDisableCaptureButton"];

  CFStringRef v4 = +[NSNumber numberWithInt:v3 ^ 1];
  CFStringRef v5 = __UIAccessibilitySafeClass();

  id v6 = &__kCFBooleanTrue;
  if (v5) {
    id v6 = v5;
  }
  id v7 = v6;

  CFStringRef v10 = @"enabled";
  id v11 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  return (NSDictionary *)v8;
}

id sub_947C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) objectForKey:@"systemOverlay.halfPressGestureEnabled"];
  if (v1) {
    id v2 = (void *)v1;
  }
  else {
    id v2 = &__kCFBooleanTrue;
  }
  unsigned int v3 = __UIAccessibilitySafeClass();
  CFStringRef v6 = @"enabled";
  id v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

id sub_9570(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) objectForKey:@"systemOverlay.swipeToPresentEnabled"];
  if (v1) {
    id v2 = (void *)v1;
  }
  else {
    id v2 = &__kCFBooleanTrue;
  }
  unsigned int v3 = __UIAccessibilitySafeClass();
  CFStringRef v6 = @"enabled";
  id v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

NSDictionary *__cdecl sub_9664(id a1)
{
  CFStringRef v5 = @"sensitivity";
  uint64_t v1 = +[AXSettings sharedInstance];
  [v1 cameraButtonSensitivity];
  id v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  CFStringRef v6 = v2;
  unsigned int v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_9738(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) objectForKey:@"systemOverlay.menuToggleMaxIntervalMilliseconds"];
  unsigned int v2 = [v1 intValue];

  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 500;
  }
  CFStringRef v7 = @"doubleLightPressSpeed";
  CFStringRef v4 = +[NSNumber numberWithInt:v3];
  v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

id sub_9814(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) objectForKey:@"systemOverlay.doubleClickMaxIntervalMilliseconds"];
  unsigned int v2 = [v1 intValue];

  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 400;
  }
  CFStringRef v7 = @"doubleClickSpeed";
  CFStringRef v4 = +[NSNumber numberWithInt:v3];
  v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

id sub_98F0(uint64_t a1)
{
  CFStringRef v4 = @"appsNumber";
  uint64_t v1 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_999C(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSVoiceOverTouchEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_9A54(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverHintsEnabled]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_9B2C(id a1)
{
  CFStringRef v5 = @"rate";
  uint64_t v1 = +[AXSettings sharedInstance];
  [v1 voiceOverSpeakingRate];
  unsigned int v2 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_9C00(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverPitchChangeEnabled]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_9CD8(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverImageCaptionsEnabled]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_9DB0(id a1)
{
  v7[0] = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverAudioDuckingEnabled]);
  v7[1] = @"duckingMode";
  v8[0] = v2;
  uint64_t v3 = +[AXSettings sharedInstance];
  CFStringRef v4 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v3 voiceOverMediaDuckingMode]);
  v8[1] = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

id sub_9ED0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"gender";
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_9F54(uint64_t a1)
{
  v6[0] = @"enabled";
  unsigned int v2 = +[NSNumber numberWithInt:_AXSAccessibilitySecureIntentProvider() != 0];
  v6[1] = @"typeIdentifier";
  v7[0] = v2;
  uint64_t v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v7[1] = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id sub_A040(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"filter";
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_A0C4(id a1)
{
  CFStringRef v4 = @"Enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSPhotosensitiveMitigationEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_A17C(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSHoverTextEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

id sub_A234(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"displayMode";
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_A2B8(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSHoverTextTypingEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

id sub_A370(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_A424(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSMonoAudioEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_A4DC(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSZoomTouchEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_A594(id a1)
{
  CFStringRef v8 = @"enabled";
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned int v2 = +[AXSettings sharedInstance];
  [v2 lastSmartInvertColorsEnablement];
  BOOL v4 = Current - v3 < 86400.0 || _AXSInvertColorsEnabled() != 0;
  uint64_t v5 = +[NSNumber numberWithInt:v4];
  int v9 = v5;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  return (NSDictionary *)v6;
}

NSDictionary *__cdecl sub_A6A0(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSClosedCaptionsEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_A758(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSEnhanceTextLegibilityEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_A810(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSEnhanceBackgroundContrastEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_A8C8(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSDifferentiateWithoutColorEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_A980(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSReduceMotionEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_AA38(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSButtonShapesEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_AAF0(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSAssistiveTouchScannerEnabled()];
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_ABA8(id a1)
{
  CFStringRef v6 = @"RecipesCount";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 switchControlRecipes];
  double v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);
  CFStringRef v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

NSDictionary *__cdecl sub_AC90(id a1)
{
  CFStringRef v5 = @"ScanningStyle";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 switchControlScanningStyle]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_AD68(id a1)
{
  CFStringRef v5 = @"TapBehavior";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 switchControlTapBehavior]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_AE40(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 assistiveTouchScannerSpeechEnabled]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_AF18(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 assistiveTouchScannerSoundEnabled]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_AFF0(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 assistiveTouchGroupElementsEnabled]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_B0C8(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 assistiveTouchScannerCursorHighVisibilityEnabled]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_B1A0(uint64_t a1)
{
  CFStringRef v4 = @"SwitchesCount";
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) count]);
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_B25C(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_B310(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_B3C4(id a1)
{
  CFStringRef v5 = @"MultiDeviceCount";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 switchControlPlatformSwitchedCount]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_B49C(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) count] != 0);
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_B55C(uint64_t a1)
{
  CFStringRef v5 = @"enabled";
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v1 = [*(id *)(a1 + 32) count] != 0;
  }
  else {
    BOOL v1 = 0;
  }
  unsigned int v2 = +[NSNumber numberWithInt:v1];
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

NSDictionary *__cdecl sub_B62C(id a1)
{
  CFStringRef v5 = @"enabled";
  BOOL v1 = +[CLFSystemShellSwitcher sharedSystemShellSwitcher];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isClarityBoardEnabled]);
  CFStringRef v6 = v2;
  double v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_B704(id a1)
{
  CFStringRef v6 = @"numberOfApps";
  BOOL v1 = +[CLFSettings sharedInstance];
  unsigned int v2 = [v1 applicationBundleIdentifiers];
  double v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);
  CFStringRef v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

NSDictionary *__cdecl sub_B7EC(id a1)
{
  CFStringRef v6 = @"enabled";
  BOOL v1 = +[CLFSystemShellSwitcher sharedSystemShellSwitcher];
  if ([v1 isClarityBoardEnabled]) {
    uint64_t IsSiriAvailableInClarity = AXDeviceIsSiriAvailableInClarity();
  }
  else {
    uint64_t IsSiriAvailableInClarity = 0;
  }
  double v3 = +[NSNumber numberWithInt:IsSiriAvailableInClarity];
  CFStringRef v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

NSDictionary *__cdecl sub_B8D4(id a1)
{
  CFStringRef v4 = @"enabled";
  BOOL v1 = +[NSNumber numberWithUnsignedChar:_AXSHearingAidComplianceEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_B98C(id a1)
{
  CFStringRef v8 = @"disabled";
  BOOL v1 = &AXCPSharedResourcesDirectory_ptr;
  unsigned int v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 shouldStreamToLeftAid];
  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    BOOL v1 = +[AXSettings sharedInstance];
    uint64_t v4 = [v1 shouldStreamToRightAid] ^ 1;
  }
  CFStringRef v5 = +[NSNumber numberWithInt:v4];
  int v9 = v5;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  if ((v3 & 1) == 0) {

  }
  return (NSDictionary *)v6;
}

NSDictionary *__cdecl sub_BA98(id a1)
{
  CFStringRef v4 = @"enabled";
  BOOL v1 = +[NSNumber numberWithUnsignedChar:_AXSEarpieceNoiseCancellationEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_BB50(id a1)
{
  CFStringRef v6 = @"enabled";
  BOOL v1 = [sub_BC34() sharedInstance];
  unsigned int v2 = [v1 pairedHearingAids];
  unsigned __int8 v3 = +[NSNumber numberWithInt:v2 != 0];
  CFStringRef v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

id sub_BC34()
{
  uint64_t v4 = 0;
  CFStringRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_20EA0;
  uint64_t v7 = qword_20EA0;
  if (!qword_20EA0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10724;
    v3[3] = &unk_19758;
    v3[4] = &v4;
    sub_10724((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_BD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_BD18(id a1)
{
  CFStringRef v5 = @"enabled";
  id v1 = [sub_BC34() sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 multideviceAudioEnabled]);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_BDEC(id a1)
{
  CFStringRef v5 = @"enabled";
  id v1 = [sub_BC34() sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 multideviceSettingsEnabled]);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_BEC0(id a1)
{
  CFStringRef v5 = @"ControlPanelCount";
  id v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 hearingAidControlPanelCount]);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_BF98(id a1)
{
  CFStringRef v5 = @"HandoffCount";
  id v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 hearingAidHandOffCount]);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_C070(uint64_t a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_C124(uint64_t a1)
{
  CFStringRef v4 = @"size";
  id v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_C1D8(id a1)
{
  v6[0] = @"Enabled";
  _AXSSideButtonClickSpeed();
  unsigned int v2 = +[NSNumber numberWithInt:fabsf(v1 + -0.4) > 2.2204e-16];
  v6[1] = @"Speed";
  v7[0] = v2;
  _AXSSideButtonClickSpeed();
  unsigned __int8 v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v7[1] = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return (NSDictionary *)v4;
}

NSDictionary *__cdecl sub_C2DC(id a1)
{
  CFStringRef v5 = @"enabled";
  float v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v1 voiceOverNavigateImagesOption] != (char *)&dword_0 + 1);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_C3B8(id a1)
{
  CFStringRef v5 = @"enabled";
  float v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverLargeCursorEnabled]);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_C490(id a1)
{
  CFStringRef v5 = @"enabled";
  float v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverHandwritingEnabled]);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_C568(id a1)
{
  CFStringRef v5 = @"enabled";
  float v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverBrailleGesturesEnabled]);
  uint64_t v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_C640(id a1)
{
  CFStringRef v4 = @"enabled";
  float v1 = +[NSNumber numberWithUnsignedChar:_AXSVoiceOverTouchLanguageRotorItemsExist()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_C6F8(id a1)
{
  CFStringRef v6 = @"CustomPronunciationsCount";
  float v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 customPronunciationSubstitutions];
  unsigned __int8 v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);
  uint64_t v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

id sub_C7E0(uint64_t a1)
{
  CFStringRef v4 = @"SiriPronunciationsCount";
  float v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_C894(id a1)
{
  CFStringRef v5 = @"BrailleOutput";
  float v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 voiceOverTouchBrailleDisplayOutputMode]);
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_C96C(id a1)
{
  CFStringRef v5 = @"BrailleInput";
  float v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 voiceOverTouchBrailleDisplayInputMode]);
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_CA44(uint64_t a1)
{
  CFStringRef v5 = @"BrailleTable";
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = 2;
  }
  unsigned int v2 = +[NSNumber numberWithInt:v1];
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

NSDictionary *__cdecl sub_CB04(id a1)
{
  CFStringRef v5 = @"BSIUsageCount";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 voiceOverBSIUsageCount]);
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_CBDC(id a1)
{
  CFStringRef v5 = @"TypingMode";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v1 voiceOverTypingMode]);
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_CCB4(uint64_t a1)
{
  CFStringRef v4 = @"ModifierChoice";
  uint64_t v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_CD68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"voiceIdentifier";
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_CDEC(uint64_t a1)
{
  v6[0] = @"SpeakingRate";
  unsigned int v2 = +[AXSettings sharedInstance];
  [v2 voiceOverSpeakingRate];
  unsigned __int8 v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v6[1] = @"voiceIdentifier";
  v7[0] = v3;
  v7[1] = *(void *)(a1 + 32);
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

NSDictionary *__cdecl sub_CED4(id a1)
{
  CFStringRef v5 = @"Enabled";
  uint64_t v1 = +[AXSDSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 soundDetectionEnabled]);
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_CFAC(uint64_t a1)
{
  v4[0] = @"DetectorEnabled";
  v4[1] = @"DetectorName";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = &__kCFBooleanTrue;
  v5[1] = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

NSDictionary *__cdecl sub_D044(id a1)
{
  CFStringRef v4 = @"Enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSHapticMusicEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

void sub_D0FC(id a1, NSDictionary *a2, NSError *a3)
{
  unsigned __int8 v3 = a3;
  if (v3)
  {
    CFStringRef v4 = AXLogHapticMusic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10A90((uint64_t)v3, v4);
    }
  }
}

NSDictionary *__cdecl sub_D154(id a1)
{
  CFStringRef v5 = @"Enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 startupSoundEnabled]);
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_D22C(id a1)
{
  CFStringRef v5 = @"resetCount";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 brokenHomeButtonCount]);
  CFStringRef v6 = v2;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_D304(uint64_t a1)
{
  CFStringRef v4 = @"rebooted";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) BOOLForKey:@"AXBrokenHomeButtonAlreadyRebootedOnce"]);
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_D3C8(uint64_t a1)
{
  CFStringRef v4 = @"rebooted";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_D47C(id a1)
{
  CFStringRef v7 = @"mode";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 zoomCurrentLensMode];
  if ([v2 isEqualToString:AXZoomLensModeWindow]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  CFStringRef v4 = +[NSNumber numberWithInt:v3];
  CFStringRef v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_D578(id a1)
{
  CFStringRef v6 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 zoomCurrentLensEffect];
  uint64_t v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 isEqualToString:AXZoomLensEffectNone] ^ 1);
  CFStringRef v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

NSDictionary *__cdecl sub_D66C(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 zoomAlwaysUseWindowedZoomForTyping]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_D744(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 magnifierEnabled]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_D81C(id a1)
{
  CFStringRef v5 = @"UsageCount";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 magnifierUsageCount]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_D8F4(id a1)
{
  CFStringRef v5 = @"FilterChoice";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v1 magnifierFilterSetIdentifier]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_D9CC(id a1)
{
  CFStringRef v6 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 voiceOverBrailleDisplays];
  uint64_t v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 count] != 0);
  CFStringRef v7 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

NSDictionary *__cdecl sub_DAB8(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSGuidedAccessRequiresApplicationAccessibility()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_DB70(id a1)
{
  CFStringRef v5 = @"UsageCount";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 guidedAccessUsageCount]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_DC48(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 guidedAccessTimeLimitsUsageCount]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_DD20(id a1)
{
  CFStringRef v5 = @"enabled";
  if (_AXSAssistiveTouchEnabled()) {
    BOOL v1 = _AXSAssistiveTouchScannerEnabled() == 0;
  }
  else {
    BOOL v1 = 0;
  }
  unsigned int v2 = +[NSNumber numberWithInt:v1];
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_DDEC(id a1)
{
  CFStringRef v5 = @"enabled";
  BOOL v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 assistiveTouchCustomizationEnabled]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_DEC4(id a1)
{
  CFStringRef v4 = @"enabled";
  BOOL v1 = +[NSNumber numberWithUnsignedChar:_AXSAssistiveTouchHardwareEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_DF7C(id a1)
{
  CFStringRef v7 = @"UsageCount";
  BOOL v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 assistiveTouchUsageCount];
  uint64_t v3 = [v2 objectForKeyedSubscript:AXAssistiveTouchIconTypeHome];
  CFStringRef v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 integerValue]);
  CFStringRef v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_E088(id a1)
{
  CFStringRef v7 = @"UsageCount";
  BOOL v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 assistiveTouchUsageCount];
  uint64_t v3 = [v2 objectForKeyedSubscript:AXAssistiveTouchIconTypeLockScreen];
  CFStringRef v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 integerValue]);
  CFStringRef v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_E194(id a1)
{
  CFStringRef v11 = @"UsageCount";
  BOOL v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 assistiveTouchUsageCount];
  uint64_t v3 = [v2 objectForKeyedSubscript:AXAssistiveTouchIconTypeVolumeDown];
  CFStringRef v4 = (char *)[v3 integerValue];
  CFStringRef v5 = +[AXSettings sharedInstance];
  CFStringRef v6 = [v5 assistiveTouchUsageCount];
  CFStringRef v7 = [v6 objectForKeyedSubscript:AXAssistiveTouchIconTypeVolumeUp];
  CFStringRef v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", &v4[(void)[v7 integerValue]]);
  v12 = v8;
  int v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  return (NSDictionary *)v9;
}

NSDictionary *__cdecl sub_E2F0(id a1)
{
  CFStringRef v7 = @"UsageCount";
  BOOL v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 assistiveTouchUsageCount];
  uint64_t v3 = [v2 objectForKeyedSubscript:AXAssistiveTouchIconTypeControlCenter];
  CFStringRef v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 integerValue]);
  CFStringRef v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_E3FC(id a1)
{
  CFStringRef v7 = @"UsageCount";
  BOOL v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 assistiveTouchUsageCount];
  uint64_t v3 = [v2 objectForKeyedSubscript:AXAssistiveTouchIconTypeNotificationCenter];
  CFStringRef v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 integerValue]);
  CFStringRef v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_E508(id a1)
{
  CFStringRef v7 = @"UsageCount";
  BOOL v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 assistiveTouchUsageCount];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"assistiveTouchOrbAction"];
  CFStringRef v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 integerValue]);
  CFStringRef v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

NSDictionary *__cdecl sub_E610(id a1)
{
  CFStringRef v5 = @"enabled";
  _AXSHomeClickSpeed();
  unsigned int v2 = +[NSNumber numberWithInt:fabsf(v1 + -0.35) > 2.2204e-16];
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_E6E4(id a1)
{
  CFStringRef v4 = @"enabled";
  float v1 = +[NSNumber numberWithUnsignedChar:_AXSHomeButtonRestingUnlock()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_E79C(id a1)
{
  CFStringRef v4 = @"enabled";
  float v1 = +[NSNumber numberWithUnsignedChar:_AXSVisualAlertEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_E854(id a1)
{
  CFStringRef v5 = @"enabled";
  float v1 = [sub_E928() sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 TTYHardwareEnabled]);
  CFStringRef v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_E928()
{
  uint64_t v4 = 0;
  CFStringRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_20EB0;
  uint64_t v7 = qword_20EB0;
  if (!qword_20EB0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_107F0;
    v3[3] = &unk_19758;
    v3[4] = &v4;
    sub_107F0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_E9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_EA0C(id a1)
{
  CFStringRef v5 = @"enabled";
  id v1 = [sub_E928() sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 TTYSoftwareEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_EAE0(id a1)
{
  CFStringRef v5 = @"enabled";
  id v1 = [sub_E928() sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 ttyShouldBeRealtime]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_EBB4(id a1)
{
  CFStringRef v5 = @"IncomingCallCount";
  id v1 = [sub_E928() sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 incomingTTYCallCount]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_EC88(id a1)
{
  CFStringRef v5 = @"OutgoingCallCount";
  id v1 = [sub_E928() sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 outgoingTTYCallCount]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

id sub_ED5C(uint64_t a1)
{
  CFStringRef v4 = @"choice";
  id v1 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_EE10(id a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithUnsignedChar:_AXSReduceWhitePointEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_EEC8(id a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithUnsignedChar:_AXSQuickSpeakEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_EF80(id a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithUnsignedChar:_AXSSpeakThisEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_F038(id a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithUnsignedChar:_AXSLetterFeedbackEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_F0F0(id a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithUnsignedChar:_AXSWordFeedbackEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_F1A8(id a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithUnsignedChar:_AXSQuickTypePredictionFeedbackEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_F260(id a1)
{
  CFStringRef v4 = @"enabled";
  id v1 = +[NSNumber numberWithUnsignedChar:_AXSQuickSpeakHighlightTextEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

id sub_F318(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"voiceIdentifier";
  uint64_t v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_F39C(uint64_t a1)
{
  v6[0] = @"SpeakingRate";
  unsigned int v2 = +[AXSettings sharedInstance];
  [v2 quickSpeakSpeakingRate];
  uint64_t v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v6[1] = @"voiceIdentifier";
  v7[0] = v3;
  v7[1] = *(void *)(a1 + 32);
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

NSDictionary *__cdecl sub_F484(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 touchAccommodationsEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_F55C(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 touchAccommodationsHoldDurationEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_F634(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 touchAccommodationsIgnoreRepeatEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_F70C(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v1 touchAccommodationsTapActivationMethod] != 0);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_F7E8(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSForceTouchEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_F8A0(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSLowercaseKeyboardDisplayEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_F958(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 stickyKeysEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_FA30(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 stickyKeysShiftToggleEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_FB08(id a1)
{
  CFStringRef v4 = @"disabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSVibrationDisabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_FBC0(id a1)
{
  CFStringRef v4 = @"disabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSShakeToUndoDisabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_FC78(id a1)
{
  CFStringRef v5 = @"Enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 callAudioRoutingAutoAnswerEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_FD50(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithInt:_AXSDefaultRouteForCall() != 0];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_FE0C(id a1)
{
  CFStringRef v4 = @"disabled";
  uint64_t v1 = +[NSNumber numberWithInt:_AXSAllowOpaqueTouchGestures() == 0];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_FEC8(id a1)
{
  CFStringRef v5 = @"enabled";
  uint64_t v1 = +[AXSettings sharedInstance];
  unsigned int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 automaticAccessibilityEnabled]);
  uint64_t v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_FFA0(id a1)
{
  CFStringRef v4 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:_AXSCommandAndControlEnabled()];
  CFStringRef v5 = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

void sub_10058(id a1, unint64_t a2)
{
  CFStringRef v4 = @"enabled";
  unsigned int v2 = +[NSNumber numberWithInt:a2 == 3];
  CFStringRef v5 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  AnalyticsSendEvent();
}

Class sub_1019C(uint64_t a1)
{
  sub_101F4();
  Class result = objc_getClass("CACPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10B08();
  }
  qword_20E68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_101F4()
{
  v1[0] = 0;
  if (!qword_20E70)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_102F0;
    v1[4] = &unk_19790;
    v1[5] = v1;
    long long v2 = off_19778;
    uint64_t v3 = 0;
    qword_20E70 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_20E70)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_102F0()
{
  uint64_t result = _sl_dlopen();
  qword_20E70 = result;
  return result;
}

Class sub_10364(uint64_t a1)
{
  sub_101F4();
  Class result = objc_getClass("CACSpokenCommandPresentation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10B30();
  }
  qword_20E78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_103BC(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_20E88)
  {
    v5[1] = _NSConcreteStackBlock;
    void v5[2] = 3221225472;
    v5[3] = sub_104FC;
    v5[4] = &unk_19790;
    v5[5] = v5;
    long long v6 = off_197B0;
    uint64_t v7 = 0;
    qword_20E88 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)qword_20E88;
    if (qword_20E88)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)qword_20E88;
LABEL_5:
  Class result = dlsym(v2, "RXObjectSetProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_20E80 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_104FC()
{
  uint64_t result = _sl_dlopen();
  qword_20E88 = result;
  return result;
}

void *sub_10570(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_20E98)
  {
    v5[1] = _NSConcreteStackBlock;
    void v5[2] = 3221225472;
    v5[3] = sub_106B0;
    v5[4] = &unk_19790;
    v5[5] = v5;
    long long v6 = off_197C8;
    uint64_t v7 = 0;
    qword_20E98 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)qword_20E98;
    if (qword_20E98)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)qword_20E98;
LABEL_5:
  uint64_t result = dlsym(v2, "kSCROBrailleDisplayModelIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_20E90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_106B0()
{
  uint64_t result = _sl_dlopen();
  qword_20E98 = result;
  return result;
}

Class sub_10724(uint64_t a1)
{
  sub_5CC0();
  Class result = objc_getClass("HUHearingAidSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10B58();
  }
  qword_20EA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1077C()
{
  uint64_t result = _sl_dlopen();
  qword_20EA8 = result;
  return result;
}

Class sub_107F0(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_20EB8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10934;
    v3[4] = &unk_19790;
    void v3[5] = v3;
    long long v4 = off_197F8;
    uint64_t v5 = 0;
    qword_20EB8 = _sl_dlopen();
    if (!qword_20EB8)
    {
      abort_report_np();
LABEL_8:
      sub_10B80();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("RTTSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_20EB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10934()
{
  uint64_t result = _sl_dlopen();
  qword_20EB8 = result;
  return result;
}

uint64_t sub_109A8()
{
  uint64_t result = _sl_dlopen();
  qword_20EC8 = result;
  return result;
}

void *sub_10A1C(uint64_t a1)
{
  long long v2 = (void *)sub_5CC0();
  uint64_t result = dlsym(v2, "AXHearingControlCenterBundleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_20ED0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10A6C()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10A90(v0);
}

void sub_10A90(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error booking statistics: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10B08()
{
  uint64_t v0 = abort_report_np();
  sub_10B30(v0);
}

void sub_10B30()
{
  uint64_t v0 = abort_report_np();
  sub_10B58(v0);
}

void sub_10B58()
{
  uint64_t v0 = abort_report_np();
  sub_10B80(v0);
}

void sub_10B80()
{
}

void sub_10BA8()
{
}

uint64_t AXCPSharedResourcesDirectory()
{
  return _AXCPSharedResourcesDirectory();
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXDeviceIsD22()
{
  return _AXDeviceIsD22();
}

uint64_t AXDeviceIsSiriAvailableInClarity()
{
  return _AXDeviceIsSiriAvailableInClarity();
}

uint64_t AXDeviceSupportsBootSound()
{
  return _AXDeviceSupportsBootSound();
}

uint64_t AXDeviceSupportsCameraButton()
{
  return _AXDeviceSupportsCameraButton();
}

uint64_t AXLogAggregate()
{
  return _AXLogAggregate();
}

uint64_t AXLogHapticMusic()
{
  return _AXLogHapticMusic();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

uint64_t MADisplayFilterPrefGetType()
{
  return _MADisplayFilterPrefGetType();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSAccessibilityHasNoticedOpaqueTouchDevice()
{
  return __AXSAccessibilityHasNoticedOpaqueTouchDevice();
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  return __AXSAccessibilityPreferenceDomain();
}

uint64_t _AXSAccessibilitySecureIntentProvider()
{
  return __AXSAccessibilitySecureIntentProvider();
}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  return __AXSAllowOpaqueTouchGestures();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return __AXSAssistiveTouchEnabled();
}

uint64_t _AXSAssistiveTouchHardwareEnabled()
{
  return __AXSAssistiveTouchHardwareEnabled();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return __AXSAssistiveTouchScannerEnabled();
}

uint64_t _AXSBlueYellowFilterEnabled()
{
  return __AXSBlueYellowFilterEnabled();
}

uint64_t _AXSButtonShapesEnabled()
{
  return __AXSButtonShapesEnabled();
}

uint64_t _AXSClosedCaptionsEnabled()
{
  return __AXSClosedCaptionsEnabled();
}

uint64_t _AXSColorTintFilterEnabled()
{
  return __AXSColorTintFilterEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSDefaultRouteForCall()
{
  return __AXSDefaultRouteForCall();
}

uint64_t _AXSDifferentiateWithoutColorEnabled()
{
  return __AXSDifferentiateWithoutColorEnabled();
}

uint64_t _AXSEarpieceNoiseCancellationEnabled()
{
  return __AXSEarpieceNoiseCancellationEnabled();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return __AXSEnhanceBackgroundContrastEnabled();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return __AXSEnhanceTextLegibilityEnabled();
}

uint64_t _AXSForceTouchEnabled()
{
  return __AXSForceTouchEnabled();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return __AXSFullKeyboardAccessEnabled();
}

uint64_t _AXSGrayscaleEnabled()
{
  return __AXSGrayscaleEnabled();
}

uint64_t _AXSGreenRedFilterEnabled()
{
  return __AXSGreenRedFilterEnabled();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return __AXSGuidedAccessRequiresApplicationAccessibility();
}

uint64_t _AXSHapticMusicEnabled()
{
  return __AXSHapticMusicEnabled();
}

uint64_t _AXSHearingAidComplianceEnabled()
{
  return __AXSHearingAidComplianceEnabled();
}

uint64_t _AXSHomeButtonRestingUnlock()
{
  return __AXSHomeButtonRestingUnlock();
}

uint64_t _AXSHomeClickSpeed()
{
  return __AXSHomeClickSpeed();
}

uint64_t _AXSHoverTextEnabled()
{
  return __AXSHoverTextEnabled();
}

uint64_t _AXSHoverTextTypingEnabled()
{
  return __AXSHoverTextTypingEnabled();
}

uint64_t _AXSInvertColorsEnabled()
{
  return __AXSInvertColorsEnabled();
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return __AXSLetterFeedbackEnabled();
}

uint64_t _AXSLowercaseKeyboardDisplayEnabled()
{
  return __AXSLowercaseKeyboardDisplayEnabled();
}

uint64_t _AXSMonoAudioEnabled()
{
  return __AXSMonoAudioEnabled();
}

uint64_t _AXSPhotosensitiveMitigationEnabled()
{
  return __AXSPhotosensitiveMitigationEnabled();
}

uint64_t _AXSPointerAllowAppCustomizationEnabled()
{
  return __AXSPointerAllowAppCustomizationEnabled();
}

uint64_t _AXSPointerAutoHideEnabled()
{
  return __AXSPointerAutoHideEnabled();
}

uint64_t _AXSPointerEffectScalingEnabled()
{
  return __AXSPointerEffectScalingEnabled();
}

uint64_t _AXSPointerIncreasedContrastEnabled()
{
  return __AXSPointerIncreasedContrastEnabled();
}

uint64_t _AXSPointerInertiaEnabled()
{
  return __AXSPointerInertiaEnabled();
}

uint64_t _AXSPointerScaleWithZoomLevelEnabled()
{
  return __AXSPointerScaleWithZoomLevelEnabled();
}

uint64_t _AXSPointerSizeMultiplier()
{
  return __AXSPointerSizeMultiplier();
}

uint64_t _AXSPointerStrokeColor()
{
  return __AXSPointerStrokeColor();
}

uint64_t _AXSPointerVoiceOverCursorOption()
{
  return __AXSPointerVoiceOverCursorOption();
}

uint64_t _AXSQuickSpeakEnabled()
{
  return __AXSQuickSpeakEnabled();
}

uint64_t _AXSQuickSpeakHighlightTextEnabled()
{
  return __AXSQuickSpeakHighlightTextEnabled();
}

uint64_t _AXSQuickTypePredictionFeedbackEnabled()
{
  return __AXSQuickTypePredictionFeedbackEnabled();
}

uint64_t _AXSRedGreenFilterEnabled()
{
  return __AXSRedGreenFilterEnabled();
}

uint64_t _AXSReduceMotionEnabled()
{
  return __AXSReduceMotionEnabled();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return __AXSReduceWhitePointEnabled();
}

uint64_t _AXSShakeToUndoDisabled()
{
  return __AXSShakeToUndoDisabled();
}

uint64_t _AXSSideButtonClickSpeed()
{
  return __AXSSideButtonClickSpeed();
}

uint64_t _AXSSpeakThisEnabled()
{
  return __AXSSpeakThisEnabled();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

uint64_t _AXSVibrationDisabled()
{
  return __AXSVibrationDisabled();
}

uint64_t _AXSVisualAlertEnabled()
{
  return __AXSVisualAlertEnabled();
}

uint64_t _AXSVoiceOverSpeakUnderPointerEnabled()
{
  return __AXSVoiceOverSpeakUnderPointerEnabled();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSVoiceOverTouchLanguageRotorItemsExist()
{
  return __AXSVoiceOverTouchLanguageRotorItemsExist();
}

uint64_t _AXSWordFeedbackEnabled()
{
  return __AXSWordFeedbackEnabled();
}

uint64_t _AXSZoomTouchEnabled()
{
  return __AXSZoomTouchEnabled();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilitySafeClass()
{
  return ___UIAccessibilitySafeClass();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BackTapDoubleTap(void *a1, const char *a2, ...)
{
  return [a1 BackTapDoubleTap];
}

id objc_msgSend_BackTapTripleTap(void *a1, const char *a2, ...)
{
  return [a1 BackTapTripleTap];
}

id objc_msgSend_TTYHardwareEnabled(void *a1, const char *a2, ...)
{
  return [a1 TTYHardwareEnabled];
}

id objc_msgSend_TTYSoftwareEnabled(void *a1, const char *a2, ...)
{
  return [a1 TTYSoftwareEnabled];
}

id objc_msgSend__logAdaptiveVoiceShortcutsStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logAdaptiveVoiceShortcutsStatistics];
}

id objc_msgSend__logAssistiveTouchMouseStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logAssistiveTouchMouseStatistics];
}

id objc_msgSend__logBackTapStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logBackTapStatistics];
}

id objc_msgSend__logCameraButtonStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logCameraButtonStatistics];
}

id objc_msgSend__logCommandAndControlStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logCommandAndControlStatistics];
}

id objc_msgSend__logCommonStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logCommonStatistics];
}

id objc_msgSend__logCustomSoundDetectionCustomTonesHaptics(void *a1, const char *a2, ...)
{
  return [a1 _logCustomSoundDetectionCustomTonesHaptics];
}

id objc_msgSend__logLaserAXStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logLaserAXStatistics];
}

id objc_msgSend__logMagnifierStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logMagnifierStatistics];
}

id objc_msgSend__logPerAppStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logPerAppStatistics];
}

id objc_msgSend__logSideButtonClickSpeed(void *a1, const char *a2, ...)
{
  return [a1 _logSideButtonClickSpeed];
}

id objc_msgSend__logSoundDetectionCustomTonesHaptics(void *a1, const char *a2, ...)
{
  return [a1 _logSoundDetectionCustomTonesHaptics];
}

id objc_msgSend__logStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logStatistics];
}

id objc_msgSend__logTextSizes(void *a1, const char *a2, ...)
{
  return [a1 _logTextSizes];
}

id objc_msgSend__logVoiceTriggerStatistics(void *a1, const char *a2, ...)
{
  return [a1 _logVoiceTriggerStatistics];
}

id objc_msgSend__updateCommandAndControlPurgability(void *a1, const char *a2, ...)
{
  return [a1 _updateCommandAndControlPurgability];
}

id objc_msgSend_accessibilityEventUsage(void *a1, const char *a2, ...)
{
  return [a1 accessibilityEventUsage];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alwaysShowOverlayType(void *a1, const char *a2, ...)
{
  return [a1 alwaysShowOverlayType];
}

id objc_msgSend_applicationBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifiers];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assistiveTouchCustomizationEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchCustomizationEnabled];
}

id objc_msgSend_assistiveTouchGroupElementsEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchGroupElementsEnabled];
}

id objc_msgSend_assistiveTouchMouseCustomizedClickActions(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseCustomizedClickActions];
}

id objc_msgSend_assistiveTouchMouseDwellControlCornerCustomization(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseDwellControlCornerCustomization];
}

id objc_msgSend_assistiveTouchMouseDwellControlEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseDwellControlEnabled];
}

id objc_msgSend_assistiveTouchMouseKeysEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseKeysEnabled];
}

id objc_msgSend_assistiveTouchMouseKeysOptionToggleEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseKeysOptionToggleEnabled];
}

id objc_msgSend_assistiveTouchMouseZoomPanningStyle(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseZoomPanningStyle];
}

id objc_msgSend_assistiveTouchScannerCursorHighVisibilityEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchScannerCursorHighVisibilityEnabled];
}

id objc_msgSend_assistiveTouchScannerSoundEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchScannerSoundEnabled];
}

id objc_msgSend_assistiveTouchScannerSpeechEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchScannerSpeechEnabled];
}

id objc_msgSend_assistiveTouchSwitches(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchSwitches];
}

id objc_msgSend_assistiveTouchUsageCount(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchUsageCount];
}

id objc_msgSend_automaticAccessibilityEnabled(void *a1, const char *a2, ...)
{
  return [a1 automaticAccessibilityEnabled];
}

id objc_msgSend_avsFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 avsFeatureEnabled];
}

id objc_msgSend_backTapDoubleTapAction(void *a1, const char *a2, ...)
{
  return [a1 backTapDoubleTapAction];
}

id objc_msgSend_backTapEnabled(void *a1, const char *a2, ...)
{
  return [a1 backTapEnabled];
}

id objc_msgSend_backTapTripleTapAction(void *a1, const char *a2, ...)
{
  return [a1 backTapTripleTapAction];
}

id objc_msgSend_backTapUsageCount(void *a1, const char *a2, ...)
{
  return [a1 backTapUsageCount];
}

id objc_msgSend_brokenHomeButtonCount(void *a1, const char *a2, ...)
{
  return [a1 brokenHomeButtonCount];
}

id objc_msgSend_buttonMap(void *a1, const char *a2, ...)
{
  return [a1 buttonMap];
}

id objc_msgSend_callAudioRoutingAutoAnswerEnabled(void *a1, const char *a2, ...)
{
  return [a1 callAudioRoutingAutoAnswerEnabled];
}

id objc_msgSend_cameraButtonSensitivity(void *a1, const char *a2, ...)
{
  return [a1 cameraButtonSensitivity];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_commandsArray(void *a1, const char *a2, ...)
{
  return [a1 commandsArray];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_customPronunciationSubstitutions(void *a1, const char *a2, ...)
{
  return [a1 customPronunciationSubstitutions];
}

id objc_msgSend_customType(void *a1, const char *a2, ...)
{
  return [a1 customType];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decodedKShotDetectors(void *a1, const char *a2, ...)
{
  return [a1 decodedKShotDetectors];
}

id objc_msgSend_didTriggerSOSToday(void *a1, const char *a2, ...)
{
  return [a1 didTriggerSOSToday];
}

id objc_msgSend_didTriggerSOSValueSet(void *a1, const char *a2, ...)
{
  return [a1 didTriggerSOSValueSet];
}

id objc_msgSend_discoveredMouseDevices(void *a1, const char *a2, ...)
{
  return [a1 discoveredMouseDevices];
}

id objc_msgSend_doubleTapDragMode(void *a1, const char *a2, ...)
{
  return [a1 doubleTapDragMode];
}

id objc_msgSend_enabledSoundDetectionTypes(void *a1, const char *a2, ...)
{
  return [a1 enabledSoundDetectionTypes];
}

id objc_msgSend_globalDevicePreferences(void *a1, const char *a2, ...)
{
  return [a1 globalDevicePreferences];
}

id objc_msgSend_guidedAccessTimeLimitsUsageCount(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessTimeLimitsUsageCount];
}

id objc_msgSend_guidedAccessUsageCount(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessUsageCount];
}

id objc_msgSend_hasCustomActions(void *a1, const char *a2, ...)
{
  return [a1 hasCustomActions];
}

id objc_msgSend_hearingAidControlPanelCount(void *a1, const char *a2, ...)
{
  return [a1 hearingAidControlPanelCount];
}

id objc_msgSend_hearingAidHandOffCount(void *a1, const char *a2, ...)
{
  return [a1 hearingAidHandOffCount];
}

id objc_msgSend_hoverTextDisplayMode(void *a1, const char *a2, ...)
{
  return [a1 hoverTextDisplayMode];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_imageCaptionGenderStrategy(void *a1, const char *a2, ...)
{
  return [a1 imageCaptionGenderStrategy];
}

id objc_msgSend_incomingTTYCallCount(void *a1, const char *a2, ...)
{
  return [a1 incomingTTYCallCount];
}

id objc_msgSend_initPreferringUserProfile(void *a1, const char *a2, ...)
{
  return [a1 initPreferringUserProfile];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isClarityBoardEnabled(void *a1, const char *a2, ...)
{
  return [a1 isClarityBoardEnabled];
}

id objc_msgSend_isCustom(void *a1, const char *a2, ...)
{
  return [a1 isCustom];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return [a1 isGroup];
}

id objc_msgSend_laserEnabled(void *a1, const char *a2, ...)
{
  return [a1 laserEnabled];
}

id objc_msgSend_lastSmartInvertColorsEnablement(void *a1, const char *a2, ...)
{
  return [a1 lastSmartInvertColorsEnablement];
}

id objc_msgSend_magnifierEnabled(void *a1, const char *a2, ...)
{
  return [a1 magnifierEnabled];
}

id objc_msgSend_magnifierFilterSetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 magnifierFilterSetIdentifier];
}

id objc_msgSend_magnifierUsageCount(void *a1, const char *a2, ...)
{
  return [a1 magnifierUsageCount];
}

id objc_msgSend_mainAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 mainAccessQueue];
}

id objc_msgSend_multideviceAudioEnabled(void *a1, const char *a2, ...)
{
  return [a1 multideviceAudioEnabled];
}

id objc_msgSend_multideviceSettingsEnabled(void *a1, const char *a2, ...)
{
  return [a1 multideviceSettingsEnabled];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nestedCommandGroupsAndItems(void *a1, const char *a2, ...)
{
  return [a1 nestedCommandGroupsAndItems];
}

id objc_msgSend_outgoingTTYCallCount(void *a1, const char *a2, ...)
{
  return [a1 outgoingTTYCallCount];
}

id objc_msgSend_pairedHearingAids(void *a1, const char *a2, ...)
{
  return [a1 pairedHearingAids];
}

id objc_msgSend_perAppSettingsStats(void *a1, const char *a2, ...)
{
  return [a1 perAppSettingsStats];
}

id objc_msgSend_phonemes(void *a1, const char *a2, ...)
{
  return [a1 phonemes];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return [a1 productId];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_quickSpeakSpeakingRate(void *a1, const char *a2, ...)
{
  return [a1 quickSpeakSpeakingRate];
}

id objc_msgSend_resolverForCurrentHost(void *a1, const char *a2, ...)
{
  return [a1 resolverForCurrentHost];
}

id objc_msgSend_runStatistics(void *a1, const char *a2, ...)
{
  return [a1 runStatistics];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedSystemShellSwitcher(void *a1, const char *a2, ...)
{
  return [a1 sharedSystemShellSwitcher];
}

id objc_msgSend_shortcuts(void *a1, const char *a2, ...)
{
  return [a1 shortcuts];
}

id objc_msgSend_shouldStreamToLeftAid(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamToLeftAid];
}

id objc_msgSend_shouldStreamToRightAid(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamToRightAid];
}

id objc_msgSend_soundDetectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionEnabled];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_startupSoundEnabled(void *a1, const char *a2, ...)
{
  return [a1 startupSoundEnabled];
}

id objc_msgSend_stickyKeysEnabled(void *a1, const char *a2, ...)
{
  return [a1 stickyKeysEnabled];
}

id objc_msgSend_stickyKeysShiftToggleEnabled(void *a1, const char *a2, ...)
{
  return [a1 stickyKeysShiftToggleEnabled];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportedSoundDetectionTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedSoundDetectionTypes];
}

id objc_msgSend_switchControlPlatformSwitchedCount(void *a1, const char *a2, ...)
{
  return [a1 switchControlPlatformSwitchedCount];
}

id objc_msgSend_switchControlRecipes(void *a1, const char *a2, ...)
{
  return [a1 switchControlRecipes];
}

id objc_msgSend_switchControlScanningStyle(void *a1, const char *a2, ...)
{
  return [a1 switchControlScanningStyle];
}

id objc_msgSend_switchControlTapBehavior(void *a1, const char *a2, ...)
{
  return [a1 switchControlTapBehavior];
}

id objc_msgSend_touchAccommodationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsEnabled];
}

id objc_msgSend_touchAccommodationsHoldDurationEnabled(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsHoldDurationEnabled];
}

id objc_msgSend_touchAccommodationsIgnoreRepeatEnabled(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsIgnoreRepeatEnabled];
}

id objc_msgSend_touchAccommodationsTapActivationMethod(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsTapActivationMethod];
}

id objc_msgSend_ttyShouldBeRealtime(void *a1, const char *a2, ...)
{
  return [a1 ttyShouldBeRealtime];
}

id objc_msgSend_vendorId(void *a1, const char *a2, ...)
{
  return [a1 vendorId];
}

id objc_msgSend_vocabularyEntries(void *a1, const char *a2, ...)
{
  return [a1 vocabularyEntries];
}

id objc_msgSend_voiceOverAudioDuckingEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverAudioDuckingEnabled];
}

id objc_msgSend_voiceOverBSIUsageCount(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBSIUsageCount];
}

id objc_msgSend_voiceOverBrailleDisplays(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBrailleDisplays];
}

id objc_msgSend_voiceOverBrailleGesturesEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBrailleGesturesEnabled];
}

id objc_msgSend_voiceOverBrailleTableIdentifier(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBrailleTableIdentifier];
}

id objc_msgSend_voiceOverHandwritingEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverHandwritingEnabled];
}

id objc_msgSend_voiceOverHintsEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverHintsEnabled];
}

id objc_msgSend_voiceOverImageCaptionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverImageCaptionsEnabled];
}

id objc_msgSend_voiceOverKeyboardModifierChoice(void *a1, const char *a2, ...)
{
  return [a1 voiceOverKeyboardModifierChoice];
}

id objc_msgSend_voiceOverLargeCursorEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverLargeCursorEnabled];
}

id objc_msgSend_voiceOverMediaDuckingMode(void *a1, const char *a2, ...)
{
  return [a1 voiceOverMediaDuckingMode];
}

id objc_msgSend_voiceOverNavigateImagesOption(void *a1, const char *a2, ...)
{
  return [a1 voiceOverNavigateImagesOption];
}

id objc_msgSend_voiceOverPitchChangeEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverPitchChangeEnabled];
}

id objc_msgSend_voiceOverSpeakingRate(void *a1, const char *a2, ...)
{
  return [a1 voiceOverSpeakingRate];
}

id objc_msgSend_voiceOverTouchBrailleDisplayInputMode(void *a1, const char *a2, ...)
{
  return [a1 voiceOverTouchBrailleDisplayInputMode];
}

id objc_msgSend_voiceOverTouchBrailleDisplayOutputMode(void *a1, const char *a2, ...)
{
  return [a1 voiceOverTouchBrailleDisplayOutputMode];
}

id objc_msgSend_voiceOverTypingMode(void *a1, const char *a2, ...)
{
  return [a1 voiceOverTypingMode];
}

id objc_msgSend_zoomAlwaysUseWindowedZoomForTyping(void *a1, const char *a2, ...)
{
  return [a1 zoomAlwaysUseWindowedZoomForTyping];
}

id objc_msgSend_zoomCurrentLensEffect(void *a1, const char *a2, ...)
{
  return [a1 zoomCurrentLensEffect];
}

id objc_msgSend_zoomCurrentLensMode(void *a1, const char *a2, ...)
{
  return [a1 zoomCurrentLensMode];
}

id objc_msgSend_zoomEnabled(void *a1, const char *a2, ...)
{
  return [a1 zoomEnabled];
}