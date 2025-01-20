void sub_4E64(id a1)
{
  byte_2A298 = +[CAMCaptureCapabilities isCameraAppInstalled];
}

void sub_4E8C(id a1)
{
  qword_2A2A8 = (uint64_t)[objc_alloc((Class)CAMCaptureCapabilities) initWithHostProcess:0];

  _objc_release_x1();
}

void sub_4ED0(id a1)
{
  qword_2A2B8 = (uint64_t)[objc_alloc((Class)CAMCaptureCapabilities) initWithHostProcess:2];

  _objc_release_x1();
}

void sub_5188(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  v2 = (void *)qword_2A2C8;
  qword_2A2C8 = (uint64_t)v1;

  v3 = (void *)qword_2A2C8;

  [v3 setPositiveFormat:@"0"];
}

void sub_5440(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_546C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "cameraTCCIsAuthorized", (void)v15))
        {
          v12 = [v11 bundleIdentifier];
          [v4 addObject:v12];
        }
        v13 = [v11 bundleIdentifier];
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setEligibleAppsBundleIDs:v5 withAuthorizedBundleIds:v4];
}

void sub_55FC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setEligibleAppsBundleIDs:v3];
}

void sub_5658(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setAssociatedAppBundleID:v3 notifySpringBoard:0 notifyDelegate:1];
}

void sub_5B94(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    if ([v4 cellType] == (char *)&dword_0 + 3) {
      [v4 setProperty:&__kCFBooleanTrue forKey:PSAdjustFontSizeToFitWidthKey];
    }
  }

  _objc_release_x1();
}

id sub_6C5C(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_7A08;
  v14 = sub_7A18;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7A20;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24D20 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_6DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7A08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7A18(uint64_t a1)
{
}

id sub_7A20(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_7D30(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_7FA0;
  v14 = sub_7FB0;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7FB8;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24D38 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_7E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7FA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7FB0(uint64_t a1)
{
}

id sub_7FB8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_878C(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_9430;
  v14 = sub_9440;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9448;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24D68 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_88E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_88F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];

  if (v4 == @"CAMNoActionSpecifierID")
  {
    id v5 = [*(id *)(a1 + 32) _associatedAppBundleID];
    unint64_t v7 = v5 == 0;
  }
  else
  {
    id v5 = [v3 identifier];
    uint64_t v6 = [*(id *)(a1 + 32) _associatedAppBundleID];
    unint64_t v7 = (unint64_t)[v5 isEqualToString:v6];
  }
  return v7;
}

void sub_8AAC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _appConfigurationCoordinator];
  id v6 = [v5 isBundleIDCameraTTCAuthorized:v4];

  id v7 = [*(id *)(a1 + 32) _listItemSpecifierForBundleID:v4 appAuthorized:v6];

  [*(id *)(a1 + 40) addObject:v7];
}

int64_t sub_8B44(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  id v4 = a3;
  id v5 = [(PSSpecifier *)a2 name];
  id v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t sub_9430(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9440(uint64_t a1)
{
}

id sub_9448(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_98F4(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_9CDC;
  v14 = sub_9CEC;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9CF4;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24D80 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_9A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9CDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9CEC(uint64_t a1)
{
}

id sub_9CF4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_AAD8(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_AFF0;
  v14 = sub_B000;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_B008;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24D98 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_AC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_AFF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_B000(uint64_t a1)
{
}

id sub_B008(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

void sub_BECC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id sub_BF7C(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_C154;
  v14 = sub_C164;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_DE3C;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24DB0 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_C0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_C0E8(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) isSupportedVideoConfiguration:a2 forMode:1 device:0]) {
    return &dword_0 + 1;
  }
  id v5 = *(void **)(a1 + 32);

  return [v5 isSupportedVideoConfiguration:a2 forMode:1 device:1];
}

uint64_t sub_C154(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_C164(uint64_t a1)
{
}

void sub_C16C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (*(unsigned char *)(a1 + 80))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:", objc_msgSend(v3, "integerValue"), 1);
    id v3 = v11;
  }
  else
  {
    id v4 = 0;
  }
  if (*(unsigned char *)(a1 + 81)) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = +[CameraVideoSettingsController _titleForVideoConfiguration:isHEVCEnabled:isHDR10BitVideoEnabled:](CameraVideoSettingsController, "_titleForVideoConfiguration:isHEVCEnabled:isHDR10BitVideoEnabled:", [v3 integerValue], *(unsigned __int8 *)(a1 + 81), v4);
  id v7 = +[CameraVideoSettingsController _footerForVideoConfiguration:v11 willUseHEVC:v5 willUseDolbyVision:v4];
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v6 target:*(void *)(a1 + 40) set:0 get:0 detail:0 cell:3 edit:0];
  [v8 setProperty:v11 forKey:PSValueKey];
  [v8 setProperty:&__kCFBooleanTrue forKey:PSAdjustFontSizeToFitWidthKey];
  [*(id *)(a1 + 48) addObject:v8];
  uint64_t v9 = +[NSNumber numberWithInteger:*(void *)(a1 + 72)];
  unsigned int v10 = [v11 isEqualToNumber:v9];

  if (v10) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
  }
  [*(id *)(a1 + 56) appendFormat:@"\n%@", v7];
}

id sub_DE3C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_E464(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_E7A4;
  v14 = sub_E7B4;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_E7BC;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24DC8 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_E5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_E7A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_E7B4(uint64_t a1)
{
}

id sub_E7BC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_112AC(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_1258C;
  v14 = sub_1259C;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_125A4;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24DF8 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_11400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_11418(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) indexOfSpecifierWithID:a2];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) objectAtIndex:v3];
    [v4 addObject:v5];
  }
}

uint64_t sub_1258C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1259C(uint64_t a1)
{
}

id sub_125A4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_12FA8(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_136AC;
  v14 = sub_136BC;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_136C4;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24E70 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_130FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_136AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_136BC(uint64_t a1)
{
}

id sub_136C4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

id sub_13E54(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_148BC;
  v14 = sub_148CC;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_148D4;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24E88 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_13FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_148BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_148CC(uint64_t a1)
{
}

id sub_148D4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

void sub_14B30(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    if ([v4 cellType] == (char *)&dword_0 + 3) {
      [v4 setProperty:&__kCFBooleanTrue forKey:PSAdjustFontSizeToFitWidthKey];
    }
  }

  _objc_release_x1();
}

id sub_14BC4(void *a1)
{
  id v1 = a1;
  +[NSBundle bundleForClass:NSClassFromString(@"CameraSettingsController")];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_14F54;
  v14 = sub_14F64;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_14F6C;
  v6[3] = &unk_20700;
  uint64_t v9 = &v10;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v2;
  id v3 = v1;
  id v8 = v3;
  [&off_24EA0 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void sub_14D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_14F54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_14F64(uint64_t a1)
{
}

id sub_14F6C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:&stru_20A70 table:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

void sub_150D0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Missing bundleIdentifier for selected specifier %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_15148(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to get application record for %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
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

uint64_t PXPreferencesIsCameraAutoShareEnabled()
{
  return _PXPreferencesIsCameraAutoShareEnabled();
}

uint64_t PXPreferencesSetCameraAutoShareEnabled()
{
  return _PXPreferencesSetCameraAutoShareEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend__appConfigurationController(void *a1, const char *a2, ...)
{
  return [a1 _appConfigurationController];
}

id objc_msgSend__appConfigurationCoordinator(void *a1, const char *a2, ...)
{
  return [a1 _appConfigurationCoordinator];
}

id objc_msgSend__associatedAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 _associatedAppBundleID];
}

id objc_msgSend__authorizedAppsBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 _authorizedAppsBundleIDs];
}

id objc_msgSend__checkedDefaultIndex(void *a1, const char *a2, ...)
{
  return [a1 _checkedDefaultIndex];
}

id objc_msgSend__cinematicConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _cinematicConfiguration];
}

id objc_msgSend__cinematicSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _cinematicSpecifier];
}

id objc_msgSend__createSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _createSpecifiers];
}

id objc_msgSend__defaultCustomLens(void *a1, const char *a2, ...)
{
  return [a1 _defaultCustomLens];
}

id objc_msgSend__deviceLanguage(void *a1, const char *a2, ...)
{
  return [a1 _deviceLanguage];
}

id objc_msgSend__didAppearAtLeastOnce(void *a1, const char *a2, ...)
{
  return [a1 _didAppearAtLeastOnce];
}

id objc_msgSend__eligibleAppsBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 _eligibleAppsBundleIDs];
}

id objc_msgSend__eligibleAppsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _eligibleAppsSpecifiers];
}

id objc_msgSend__initializeSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _initializeSpecifiers];
}

id objc_msgSend__isHDRVideoEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isHDRVideoEnabled];
}

id objc_msgSend__isPALVideoEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isPALVideoEnabled];
}

id objc_msgSend__persistCurrentDefaultCustomLens(void *a1, const char *a2, ...)
{
  return [a1 _persistCurrentDefaultCustomLens];
}

id objc_msgSend__proRawFileFormatPreferenceTitle(void *a1, const char *a2, ...)
{
  return [a1 _proRawFileFormatPreferenceTitle];
}

id objc_msgSend__readCurrentDefaultCustomLens(void *a1, const char *a2, ...)
{
  return [a1 _readCurrentDefaultCustomLens];
}

id objc_msgSend__reloadDefaultGroup(void *a1, const char *a2, ...)
{
  return [a1 _reloadDefaultGroup];
}

id objc_msgSend__selectedLaunchGesture(void *a1, const char *a2, ...)
{
  return [a1 _selectedLaunchGesture];
}

id objc_msgSend__selectedProRawFileFormat(void *a1, const char *a2, ...)
{
  return [a1 _selectedProRawFileFormat];
}

id objc_msgSend__setupAppConfigurationCoordinatorIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _setupAppConfigurationCoordinatorIfNecessary];
}

id objc_msgSend__sharedLibrarySpecifier(void *a1, const char *a2, ...)
{
  return [a1 _sharedLibrarySpecifier];
}

id objc_msgSend__showHEVCOnlyFormatsOnCapableDevices(void *a1, const char *a2, ...)
{
  return [a1 _showHEVCOnlyFormatsOnCapableDevices];
}

id objc_msgSend__slomoConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _slomoConfiguration];
}

id objc_msgSend__updateCheckedDefaultIndex(void *a1, const char *a2, ...)
{
  return [a1 _updateCheckedDefaultIndex];
}

id objc_msgSend__videoConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _videoConfiguration];
}

id objc_msgSend__writeLastViewedDate(void *a1, const char *a2, ...)
{
  return [a1 _writeLastViewedDate];
}

id objc_msgSend_arePortraitEffectsSupported(void *a1, const char *a2, ...)
{
  return [a1 arePortraitEffectsSupported];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_associatedAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 associatedAppBundleID];
}

id objc_msgSend_availableCustomLenses(void *a1, const char *a2, ...)
{
  return [a1 availableCustomLenses];
}

id objc_msgSend_back1080pMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 back1080pMaxFPS];
}

id objc_msgSend_back4kMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 back4kMaxFPS];
}

id objc_msgSend_back720pMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 back720pMaxFPS];
}

id objc_msgSend_backHighFrameRate1080pMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 backHighFrameRate1080pMaxFPS];
}

id objc_msgSend_backHighFrameRate4kMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 backHighFrameRate4kMaxFPS];
}

id objc_msgSend_backHighFrameRate720pMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 backHighFrameRate720pMaxFPS];
}

id objc_msgSend_baseFocalLengthForWideCamera(void *a1, const char *a2, ...)
{
  return [a1 baseFocalLengthForWideCamera];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cameraSettingsDelegate(void *a1, const char *a2, ...)
{
  return [a1 cameraSettingsDelegate];
}

id objc_msgSend_cameraTCCIsAuthorized(void *a1, const char *a2, ...)
{
  return [a1 cameraTCCIsAuthorized];
}

id objc_msgSend_canEnableCustomLenses(void *a1, const char *a2, ...)
{
  return [a1 canEnableCustomLenses];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_captureButtonAppConfigurationCoordinator(void *a1, const char *a2, ...)
{
  return [a1 captureButtonAppConfigurationCoordinator];
}

id objc_msgSend_cast(void *a1, const char *a2, ...)
{
  return [a1 cast];
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return [a1 cellType];
}

id objc_msgSend_cinematic4KSupported(void *a1, const char *a2, ...)
{
  return [a1 cinematic4KSupported];
}

id objc_msgSend_colorBias(void *a1, const char *a2, ...)
{
  return [a1 colorBias];
}

id objc_msgSend_contentAwareDistortionCorrectionSupported(void *a1, const char *a2, ...)
{
  return [a1 contentAwareDistortionCorrectionSupported];
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

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_deviceSupportsCTM(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsCTM];
}

id objc_msgSend_eligibleAppsBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 eligibleAppsBundleIDs];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_enhancedRAWResolutionSupported(void *a1, const char *a2, ...)
{
  return [a1 enhancedRAWResolutionSupported];
}

id objc_msgSend_externalStorageSupported(void *a1, const char *a2, ...)
{
  return [a1 externalStorageSupported];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_focalLengthPickerSupported(void *a1, const char *a2, ...)
{
  return [a1 focalLengthPickerSupported];
}

id objc_msgSend_front1080pMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 front1080pMaxFPS];
}

id objc_msgSend_frontHighFrameRate1080pMaxFPS(void *a1, const char *a2, ...)
{
  return [a1 frontHighFrameRate1080pMaxFPS];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerFormatter(void *a1, const char *a2, ...)
{
  return [a1 integerFormatter];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intensity(void *a1, const char *a2, ...)
{
  return [a1 intensity];
}

id objc_msgSend_interactiveVideoFormatControlAlwaysEnabled(void *a1, const char *a2, ...)
{
  return [a1 interactiveVideoFormatControlAlwaysEnabled];
}

id objc_msgSend_interactiveVideoFormatControlSupported(void *a1, const char *a2, ...)
{
  return [a1 interactiveVideoFormatControlSupported];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBack4k120VideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isBack4k120VideoSupported];
}

id objc_msgSend_isBack4k24VideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isBack4k24VideoSupported];
}

id objc_msgSend_isBack4k30VideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isBack4k30VideoSupported];
}

id objc_msgSend_isBack4k60VideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isBack4k60VideoSupported];
}

id objc_msgSend_isBackQuadraSuperWideSupported(void *a1, const char *a2, ...)
{
  return [a1 isBackQuadraSuperWideSupported];
}

id objc_msgSend_isBackSuperWideSupported(void *a1, const char *a2, ...)
{
  return [a1 isBackSuperWideSupported];
}

id objc_msgSend_isBackTelephotoSupported(void *a1, const char *a2, ...)
{
  return [a1 isBackTelephotoSupported];
}

id objc_msgSend_isCTMSupported(void *a1, const char *a2, ...)
{
  return [a1 isCTMSupported];
}

id objc_msgSend_isCameraAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isCameraAppInstalled];
}

id objc_msgSend_isCameraButtonSupported(void *a1, const char *a2, ...)
{
  return [a1 isCameraButtonSupported];
}

id objc_msgSend_isCinematicAudioSupported(void *a1, const char *a2, ...)
{
  return [a1 isCinematicAudioSupported];
}

id objc_msgSend_isCinematicModeSupported(void *a1, const char *a2, ...)
{
  return [a1 isCinematicModeSupported];
}

id objc_msgSend_isDepthEffectApertureSupported(void *a1, const char *a2, ...)
{
  return [a1 isDepthEffectApertureSupported];
}

id objc_msgSend_isExposureSliderSupported(void *a1, const char *a2, ...)
{
  return [a1 isExposureSliderSupported];
}

id objc_msgSend_isFrontSlomoSupported(void *a1, const char *a2, ...)
{
  return [a1 isFrontSlomoSupported];
}

id objc_msgSend_isFrontSmartHDRSupported(void *a1, const char *a2, ...)
{
  return [a1 isFrontSmartHDRSupported];
}

id objc_msgSend_isHDR10BitVideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isHDR10BitVideoSupported];
}

id objc_msgSend_isHDR10BitVideoSupports60FPS(void *a1, const char *a2, ...)
{
  return [a1 isHDR10BitVideoSupports60FPS];
}

id objc_msgSend_isHDREV0CaptureSupported(void *a1, const char *a2, ...)
{
  return [a1 isHDREV0CaptureSupported];
}

id objc_msgSend_isHDRSettingAllowed(void *a1, const char *a2, ...)
{
  return [a1 isHDRSettingAllowed];
}

id objc_msgSend_isHEVCEncodingSupported(void *a1, const char *a2, ...)
{
  return [a1 isHEVCEncodingSupported];
}

id objc_msgSend_isImageAnalysisSupported(void *a1, const char *a2, ...)
{
  return [a1 isImageAnalysisSupported];
}

id objc_msgSend_isLinearDNGSupported(void *a1, const char *a2, ...)
{
  return [a1 isLinearDNGSupported];
}

id objc_msgSend_isLivePhotoSupported(void *a1, const char *a2, ...)
{
  return [a1 isLivePhotoSupported];
}

id objc_msgSend_isLowLightSupported(void *a1, const char *a2, ...)
{
  return [a1 isLowLightSupported];
}

id objc_msgSend_isMessagesAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isMessagesAppInstalled];
}

id objc_msgSend_isMirroredFrontCapturesSupported(void *a1, const char *a2, ...)
{
  return [a1 isMirroredFrontCapturesSupported];
}

id objc_msgSend_isMirroredFrontVideosSupported(void *a1, const char *a2, ...)
{
  return [a1 isMirroredFrontVideosSupported];
}

id objc_msgSend_isMixAudioWithOthersSupported(void *a1, const char *a2, ...)
{
  return [a1 isMixAudioWithOthersSupported];
}

id objc_msgSend_isModernHDRSupported(void *a1, const char *a2, ...)
{
  return [a1 isModernHDRSupported];
}

id objc_msgSend_isNeutral(void *a1, const char *a2, ...)
{
  return [a1 isNeutral];
}

id objc_msgSend_isPALVideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isPALVideoSupported];
}

id objc_msgSend_isPreserveCreativeControlsSupported(void *a1, const char *a2, ...)
{
  return [a1 isPreserveCreativeControlsSupported];
}

id objc_msgSend_isProRawJpegXLSupported(void *a1, const char *a2, ...)
{
  return [a1 isProRawJpegXLSupported];
}

id objc_msgSend_isProResLogColorSpaceSupported(void *a1, const char *a2, ...)
{
  return [a1 isProResLogColorSpaceSupported];
}

id objc_msgSend_isProResVideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isProResVideoSupported];
}

id objc_msgSend_isSmartHDRSupported(void *a1, const char *a2, ...)
{
  return [a1 isSmartHDRSupported];
}

id objc_msgSend_isSpatialOverCaptureSupported(void *a1, const char *a2, ...)
{
  return [a1 isSpatialOverCaptureSupported];
}

id objc_msgSend_isSpatialVideoCaptureSupported(void *a1, const char *a2, ...)
{
  return [a1 isSpatialVideoCaptureSupported];
}

id objc_msgSend_isStereoAudioRecordingSupported(void *a1, const char *a2, ...)
{
  return [a1 isStereoAudioRecordingSupported];
}

id objc_msgSend_isSuperWideAutoMacroSupported(void *a1, const char *a2, ...)
{
  return [a1 isSuperWideAutoMacroSupported];
}

id objc_msgSend_isTimeOfFlightSupported(void *a1, const char *a2, ...)
{
  return [a1 isTimeOfFlightSupported];
}

id objc_msgSend_isTrueVideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isTrueVideoSupported];
}

id objc_msgSend_isVariableFramerateVideoSupported(void *a1, const char *a2, ...)
{
  return [a1 isVariableFramerateVideoSupported];
}

id objc_msgSend_isVideoStabilizationControlSupported(void *a1, const char *a2, ...)
{
  return [a1 isVideoStabilizationControlSupported];
}

id objc_msgSend_isWhiteBalanceLockingForVideoRecordingSupported(void *a1, const char *a2, ...)
{
  return [a1 isWhiteBalanceLockingForVideoRecordingSupported];
}

id objc_msgSend_isWindRemovalSupported(void *a1, const char *a2, ...)
{
  return [a1 isWindRemovalSupported];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_macroControlEnabledByDefault(void *a1, const char *a2, ...)
{
  return [a1 macroControlEnabledByDefault];
}

id objc_msgSend_multipleCaptureFeaturesSupported(void *a1, const char *a2, ...)
{
  return [a1 multipleCaptureFeaturesSupported];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newFormatsConfiguration(void *a1, const char *a2, ...)
{
  return [a1 newFormatsConfiguration];
}

id objc_msgSend_performGetter(void *a1, const char *a2, ...)
{
  return [a1 performGetter];
}

id objc_msgSend_photoModeDepthSuggestionSupported(void *a1, const char *a2, ...)
{
  return [a1 photoModeDepthSuggestionSupported];
}

id objc_msgSend_portraitZoomSupported(void *a1, const char *a2, ...)
{
  return [a1 portraitZoomSupported];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return [a1 privacyFlow];
}

id objc_msgSend_readAVCaptureSystemStyle(void *a1, const char *a2, ...)
{
  return [a1 readAVCaptureSystemStyle];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeSharedLibraryAlgorithmsPreferences(void *a1, const char *a2, ...)
{
  return [a1 removeSharedLibraryAlgorithmsPreferences];
}

id objc_msgSend_resolvedDefaultCustomLens(void *a1, const char *a2, ...)
{
  return [a1 resolvedDefaultCustomLens];
}

id objc_msgSend_responsiveShutterSupported(void *a1, const char *a2, ...)
{
  return [a1 responsiveShutterSupported];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectedPhotoFormat(void *a1, const char *a2, ...)
{
  return [a1 selectedPhotoFormat];
}

id objc_msgSend_semanticDevelopmentSupported(void *a1, const char *a2, ...)
{
  return [a1 semanticDevelopmentSupported];
}

id objc_msgSend_semanticStylesSupport(void *a1, const char *a2, ...)
{
  return [a1 semanticStylesSupport];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_smartStylesSupported(void *a1, const char *a2, ...)
{
  return [a1 smartStylesSupported];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportedCustomLensGroups(void *a1, const char *a2, ...)
{
  return [a1 supportedCustomLensGroups];
}

id objc_msgSend_supportedProResColorSpaces(void *a1, const char *a2, ...)
{
  return [a1 supportedProResColorSpaces];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_toneBias(void *a1, const char *a2, ...)
{
  return [a1 toneBias];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}