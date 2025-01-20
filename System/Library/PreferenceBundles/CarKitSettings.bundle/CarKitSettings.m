void sub_1FA8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3;
  NSError *v4;
  NSObject *v5;
  CFStringRef v6;
  int v7;
  CFStringRef v8;
  __int16 v9;
  NSError *v10;

  v3 = a2;
  v4 = a3;
  v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "CRConnectBluetoothLE completed: success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }
}

id sub_2FD8(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_alloc((Class)ISImageDescriptor);
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  id v7 = objc_msgSend(v4, "initWithSize:scale:", 29.0, 29.0, v6);

  [v7 setDrawBorder:a2];
  [v7 setShape:1];
  v8 = [v3 prepareImageForDescriptor:v7];

  id v9 = [v8 CGImage];
  v10 = +[UIScreen mainScreen];
  [v10 scale];
  v11 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v9, 0);

  return v11;
}

void sub_32D4(id a1)
{
  v3[0] = @"com.apple.podcasts";
  v3[1] = @"com.apple.iBooks";
  v3[2] = CRSCalendarIdentifier;
  v3[3] = CRSNewsIdentifier;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:4];
  v2 = (void *)qword_2DFE8;
  qword_2DFE8 = v1;
}

void sub_3C00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_3C24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) parentController];
  [v2 reloadSpecifiers];

  id v3 = *(void **)(a1 + 32);

  return objc_msgSend(v3, "_car_popIfVisible");
}

void sub_3E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3E44(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (a2)
  {
    [WeakRetained beginUpdates];
    id v4 = [v6 specifierForID:@"SWITCH_GROUP"];
    v5 = [v6 specifierForID:@"CARPLAY_SWITCH"];
    [v6 _updateEnabledGroupSpecifier:v4 switchSpecifier:v5];
    [v6 reloadSpecifier:v4];
    [v6 endUpdates];
  }
  else
  {
    [WeakRetained reloadSpecifiers];
  }
}

id sub_4268(void *a1)
{
  id v1 = a1;

  return v1;
}

void sub_4448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_446C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    id v6 = +[NSDistributedNotificationCenter defaultCenter];
    uint64_t v10 = CREnhancedIntegrationConsentDidChangeNotificationVehicleCertificateSerialKey;
    id v7 = [*(id *)(a1 + 32) certificateSerialNumber];
    v8 = v7;
    if (!v7)
    {
      v8 = +[NSData data];
    }
    v11 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v6 postNotificationName:@"CREnhancedIntegrationConsentDidChangeNotificationName" object:0 userInfo:v9];

    if (!v7) {
  }
    }
  else
  {
    [WeakRetained reloadSpecifiers];
  }
}

id sub_4608(uint64_t a1)
{
  if (([*(id *)(a1 + 32) suppressNextReloadForPairedVehicleChanged] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) vehicleSettingManager];
    [v2 reloadVehicle];

    [*(id *)(a1 + 32) reloadSpecifiers];
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 setSuppressNextReloadForPairedVehicleChanged:0];
}

void sub_53F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5418(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

void sub_5C2C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_5C40(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5CF0;
  v4[3] = &unk_24840;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_5CF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = CarGeneralLogging();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Saved vehicle %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_14BE0(a1, v4);
  }
}

void sub_5E8C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_5EA0(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_5F28;
  v2[3] = &unk_24890;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_5F28(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = CarGeneralLogging();
  char v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Deleted vehicle %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_14C5C(a1, v4);
  }
}

id sub_6590(uint64_t a1)
{
  if (([*(id *)(a1 + 32) suppressNextReloadForPairedVehicleChanged] & 1) == 0) {
    [*(id *)(a1 + 32) reloadSpecifiers];
  }
  int v2 = *(void **)(a1 + 32);

  return [v2 setSuppressNextReloadForPairedVehicleChanged:0];
}

void sub_6C88(id a1)
{
  uint64_t v1 = objc_opt_new();
  int v2 = (void *)qword_2DFF8;
  qword_2DFF8 = v1;

  [(id)qword_2DFF8 setDoesRelativeDateFormatting:1];
  [(id)qword_2DFF8 setDateStyle:1];
  id v3 = (void *)qword_2DFF8;

  [v3 setTimeStyle:1];
}

void sub_7904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t sub_7954(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7964(uint64_t a1)
{
}

void sub_796C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_79CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![*(id *)(a1 + 32) _showsCarPlayInternalSettingsUI]) {
    goto LABEL_14;
  }
  uint64_t v7 = [v5 userInfo];
  v8 = [v7 vehicle];

  id v9 = [v6 userInfo];
  uint64_t v10 = [v9 vehicle];

  uint64_t v11 = [v8 lastConnectedDate];
  uint64_t v12 = [v10 lastConnectedDate];
  v13 = (void *)v12;
  if (!v11) {
    goto LABEL_7;
  }
  if (v12)
  {
    v14 = (char *)[(id)v11 compare:v12];
    if (v14 == (char *)-1)
    {
      BOOL v15 = 0;
      uint64_t v16 = 1;
    }
    else if (v14 == (unsigned char *)&dword_0 + 1)
    {
      BOOL v15 = 0;
      uint64_t v16 = -1;
    }
    else
    {
      uint64_t v16 = 0;
      BOOL v15 = 0;
    }
  }
  else
  {
LABEL_7:
    uint64_t v16 = v11 ? -1 : 1;
    BOOL v15 = (v11 | v12) == 0;
  }

  if (v15)
  {
LABEL_14:
    v17 = [v5 name];
    v18 = [v6 name];
    uint64_t v16 = (uint64_t)[v17 localizedStandardCompare:v18];
  }
  return v16;
}

id sub_8318(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_843C(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) carplayPreferences];
  unsigned __int8 v3 = [v2 isCarPlayAllowed];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) navigationController];
    id v5 = [v4 viewControllers];
    unsigned int v6 = [v5 containsObject:*(void *)(a1 + 32)];

    if (v6)
    {
      id v9 = [*(id *)(a1 + 32) navigationController];
      uint64_t v7 = [*(id *)(a1 + 32) parentController];
      id v8 = [v9 popToViewController:v7 animated:1];
    }
  }
}

id sub_8884(uint64_t a1, void *a2)
{
  return [a2 handleWifiPowerChanged];
}

void sub_8FEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) setBluetoothPowered:1];
  }
  if (*(unsigned char *)(a1 + 41)) {
    [*(id *)(a1 + 32) setWiFiPowered:1];
  }
}

id sub_90D0(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsPresentationConsideration:1];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateRadiosAvailabilityAlertPresentation];
}

id sub_9184(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsPresentationConsideration:1];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateRadiosAvailabilityAlertPresentation];
}

void sub_9724(uint64_t a1, void *a2)
{
  uint64_t v3 = kCRSIconLayoutIconOrderKey;
  id v4 = a2;
  id v5 = [v4 objectForKeyedSubscript:v3];
  unsigned int v6 = +[NSMutableArray arrayWithArray:v5];

  uint64_t v7 = [v4 objectForKeyedSubscript:kCRSIconLayoutHiddenIconsKey];

  id v8 = +[NSMutableArray arrayWithArray:v7];

  id v9 = [(id)objc_opt_class() iconSortingComparator];
  [v8 sortUsingComparator:v9];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9888;
  block[3] = &unk_249B8;
  block[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_9888(uint64_t a1)
{
  [*(id *)(a1 + 32) setIcons:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setHiddenIcons:*(void *)(a1 + 48)];
  int v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_9960(uint64_t a1)
{
  int v2 = +[NSMutableArray array];
  uint64_t v3 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [*(id *)(a1 + 32) icons];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v8) bundleIdentifier];
        [v2 addObject:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = objc_msgSend(*(id *)(a1 + 32), "hiddenIcons", 0);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v15 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) bundleIdentifier];
        [v3 addObject:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [*(id *)(a1 + 32) persistenceManager];
  [v16 setIconState:v2 hiddenIcons:v3];
}

void sub_9E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9E40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetVehicleApplications];
}

void sub_A43C(id *a1)
{
  int v2 = [a1[5] traitCollection];
  objc_msgSend(a1[4], "setNeedsBorder:", objc_msgSend(v2, "userInterfaceStyle") == (char *)&dword_0 + 1);

  [a1[4] loadIconImageIfNeeded];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A520;
  block[3] = &unk_249B8;
  int8x16_t v4 = *((int8x16_t *)a1 + 2);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = a1[6];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_A520(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) indexPathForIcon:*(void *)(a1 + 40)];
  id v3 = (void *)v2;
  if (v2)
  {
    int8x16_t v4 = *(void **)(a1 + 48);
    uint64_t v6 = v2;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];
    [v4 reloadRowsAtIndexPaths:v5 withRowAnimation:5];
  }
}

int64_t sub_AAFC(id a1, CRApplicationIcon *a2, CRApplicationIcon *a3)
{
  int8x16_t v4 = a3;
  id v5 = [(CRApplicationIcon *)a2 displayName];
  uint64_t v6 = [(CRApplicationIcon *)v4 displayName];

  id v7 = [v5 caseInsensitiveCompare:v6];
  return (int64_t)v7;
}

id sub_B724(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewState];
}

void sub_C2BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_C394;
  v10[3] = &unk_24A80;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

uint64_t sub_C394(uint64_t a1)
{
  [*(id *)(a1 + 32) setVehicle:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void sub_C4AC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C568;
  block[3] = &unk_24AD0;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_C568(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_CAB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CB80;
  block[3] = &unk_24B20;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

id sub_CB80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processIconStateResponse:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_D1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_D1E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_D1F0(uint64_t a1)
{
}

void sub_D1F8(uint64_t a1, void *a2)
{
  id v24 = a2;
  uint64_t v3 = [v24 localizedDisplayName];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [v24 iconImageData];

  if (v6)
  {
    id v7 = objc_alloc((Class)UIImage);
    id v8 = [v24 iconImageData];
    [v24 iconImageScale];
    id v9 = objc_msgSend(v7, "initWithData:scale:", v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    char v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  if ([*(id *)(a1 + 32) isEqualToString:CRSNowPlayingIdentifier])
  {
    uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = +[UIImage imageNamed:@"iconNowPlaying" inBundle:v12];
LABEL_5:
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) isEqualToString:CRSOEMIdentifier]
    && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    long long v19 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v20 = +[UIImage imageNamed:@"iconOEM" inBundle:v19];
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    long long v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v12 = +[UIScreen mainScreen];
    [v12 scale];
    uint64_t v13 = objc_msgSend(v23, "_applicationIconImageForFormat:precomposed:scale:", 8, 1);
    goto LABEL_5;
  }
LABEL_8:
  uint64_t v16 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

id sub_E538(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) discoveryEnabled];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 startDiscovery];
  }
  return result;
}

id sub_E5F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) pauseDiscovery];
}

void sub_E674(uint64_t a1)
{
  if ([*(id *)(a1 + 32) discoveryEnabled])
  {
    uint64_t v2 = +[BluetoothManager sharedInstance];
    unsigned int v3 = [v2 enabled];

    if (v3)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      [v4 startDiscovery];
    }
  }
}

void sub_ED94(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_EE68;
  block[3] = &unk_24B98;
  id v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  char v12 = a2;
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_EE68(uint64_t a1)
{
  [*(id *)(a1 + 32) setPairing:0];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  unsigned int v3 = CarPairingLogging();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v10 = 141558275;
      uint64_t v11 = 1752392040;
      __int16 v12 = 2113;
      uint64_t v13 = v5;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "successfully paired  %{private, mask.hash}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v6 = 4;
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 56);
      int v10 = 141558531;
      uint64_t v11 = 1752392040;
      __int16 v12 = 2113;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "failed to pair  %{private, mask.hash}@, error: %@", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v6 = 1;
  }

  [*(id *)(a1 + 48) setConnectionStatus:v6];
  [*(id *)(a1 + 32) handleUpdatedVehicle:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) startDiscovery];
}

void sub_FC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_FC70(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_FD30;
  v8[3] = &unk_24BE8;
  uint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void sub_FD30(uint64_t a1)
{
  [*(id *)(a1 + 32) setPairing:0];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  unsigned int v3 = CarPairingLogging();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v11 = 141558275;
      uint64_t v12 = 1752392040;
      __int16 v13 = 2113;
      uint64_t v14 = v5;
      uint64_t v6 = "successfully paired  %{private, mask.hash}@";
      id v7 = v3;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v4)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = 141558531;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2113;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    uint64_t v6 = "failed to pair  %{private, mask.hash}@, error: %@";
    id v7 = v3;
    uint32_t v8 = 32;
    goto LABEL_6;
  }
}

void sub_FE64(id *a1, int a2)
{
  BOOL v4 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setOutstandingPairingPrompt:0];

  id v6 = objc_loadWeakRetained(v4);
  id v7 = [v6 _presentingViewController];

  if (a2)
  {
    if (v7)
    {
      uint32_t v8 = objc_alloc_init(CARBluetoothSyncContactsPrompt);
      id v9 = objc_loadWeakRetained(v4);
      [v9 setOutstandingContactsPrompt:v8];

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FFE8;
      v11[3] = &unk_24C38;
      objc_copyWeak(&v13, v4);
      id v12 = a1[4];
      char v14 = a2;
      [(CARBluetoothSyncContactsPrompt *)v8 setContactsApprovalCompletion:v11];
      [(CARBluetoothSyncContactsPrompt *)v8 presentSyncContactsAlertFromViewController:v7];

      objc_destroyWeak(&v13);
    }
  }
  else
  {
    [a1[5] setPairing:0];
    uint64_t v10 = +[BluetoothManager sharedInstance];
    [v10 acceptSSP:1 forDevice:a1[4]];
  }
}

void sub_FFD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_FFE8(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setOutstandingContactsPrompt:0];

  unsigned int v5 = [*(id *)(a1 + 32) syncSettings];
  uint64_t v6 = 0x100000000;
  if (a2) {
    uint64_t v6 = 0x100000100;
  }
  [*(id *)(a1 + 32) setSyncSettings:v6 | v5 & 0xFFFF00FF];
  BOOL v7 = *(unsigned char *)(a1 + 48) == 0;
  id v8 = +[BluetoothManager sharedInstance];
  [v8 acceptSSP:v7 forDevice:*(void *)(a1 + 32)];
}

void sub_1033C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  BOOL v4 = CarGeneralLogging();
  unsigned int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "carkitd handled the new pairing", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_14F28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

void sub_10540(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_10998(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePairingCompleted:0];
}

id sub_109A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePairingCompleted:1];
}

uint64_t sub_10E04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_110D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleContactsApprovalCompleted:0];
}

id sub_110E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleContactsApprovalCompleted:1];
}

void sub_12E84(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bluetoothClassicDiscoverer];
  [v1 pauseDiscovery];
}

void sub_12F48(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bluetoothClassicDiscoverer];
  [v1 startDiscovery];
}

void sub_13038(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bluetoothClassicDiscoverer];
  [v1 startDiscovery];
}

void sub_14270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_14298(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    id v4 = WeakRetained;
    [WeakRetained reloadSpecifiers];
    id WeakRetained = v4;
  }
}

id sub_14540(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:0];
}

id sub_14550(uint64_t a1, int a2)
{
  int v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 _setFerriteEnabled:0];
  }
  else {
    return [v2 reloadSpecifiers];
  }
}

uint64_t sub_147CC(uint64_t a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  int v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "confirmed CarPlay options confirmation alert", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_14858(uint64_t a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  int v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "canceled CarPlay options confirmation alert", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_148E4(id a1)
{
  id v1 = CarGeneralLogging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "presented CarPlay options confirmation alert", v2, 2u);
  }
}

void sub_14AB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "CARBluetoothLEDiscoverer no peripheral for %@", (uint8_t *)&v2, 0xCu);
}

void sub_14B30(void *a1, NSObject *a2)
{
  id v4 = [a1 name];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "CARBluetoothLEDiscoverer peripheral: %@ didUpdateName: %@", (uint8_t *)&v5, 0x16u);
}

void sub_14BE0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to save vehicle %@", (uint8_t *)&v3, 0xCu);
}

void sub_14C5C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to delete vehicle %@", (uint8_t *)&v3, 0xCu);
}

void sub_14CD8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "failed to pair", v1, 2u);
}

void sub_14D1C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "starting discovery indicator", v1, 2u);
}

void sub_14D60(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "stopping discovery indicator", v1, 2u);
}

void sub_14DA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "pairing failed %@", (uint8_t *)&v2, 0xCu);
}

void sub_14E1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14E54(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 name];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "unsupported pairing style %@", (uint8_t *)&v4, 0xCu);
}

void sub_14EF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14F28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

uint64_t CRCarPlayFeaturesAllFerriteFeatures()
{
  return _CRCarPlayFeaturesAllFerriteFeatures();
}

uint64_t CRConfirmAndContinueBluetoothClassicPairing()
{
  return _CRConfirmAndContinueBluetoothClassicPairing();
}

uint64_t CRConnectBluetoothLE()
{
  return _CRConnectBluetoothLE();
}

uint64_t CRHandleBluetoothClassicPairingCompleted()
{
  return _CRHandleBluetoothClassicPairingCompleted();
}

uint64_t CRIsInternalInstall()
{
  return _CRIsInternalInstall();
}

uint64_t CRSettingsDebugUIEnabled()
{
  return _CRSettingsDebugUIEnabled();
}

uint64_t CRStartBluetoothClassicPairing()
{
  return _CRStartBluetoothClassicPairing();
}

uint64_t CarGeneralLogging()
{
  return _CarGeneralLogging();
}

uint64_t CarPairingLogging()
{
  return _CarPairingLogging();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PSTextViewInsets()
{
  return _PSTextViewInsets();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return _SFLocalizableWAPIStringKeyForKey();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return _WiFiDeviceClientRegisterPowerCallback();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetPower()
{
  return _WiFiManagerClientGetPower();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return _WiFiManagerClientUnscheduleFromRunLoop();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
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

uint64_t self
{
  return _self;
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__alertController(void *a1, const char *a2, ...)
{
  return [a1 _alertController];
}

id objc_msgSend__configureView(void *a1, const char *a2, ...)
{
  return [a1 _configureView];
}

id objc_msgSend__fetchIcons(void *a1, const char *a2, ...)
{
  return [a1 _fetchIcons];
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return [a1 _imageThatSuppressesAccessibilityHairlineThickening];
}

id objc_msgSend__presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentingViewController];
}

id objc_msgSend__resetVehicleApplications(void *a1, const char *a2, ...)
{
  return [a1 _resetVehicleApplications];
}

id objc_msgSend__saveVehicleApplications(void *a1, const char *a2, ...)
{
  return [a1 _saveVehicleApplications];
}

id objc_msgSend__setupWiFi(void *a1, const char *a2, ...)
{
  return [a1 _setupWiFi];
}

id objc_msgSend__showsCarPlayInternalSettingsUI(void *a1, const char *a2, ...)
{
  return [a1 _showsCarPlayInternalSettingsUI];
}

id objc_msgSend__startDiscovery(void *a1, const char *a2, ...)
{
  return [a1 _startDiscovery];
}

id objc_msgSend__stopDiscovery(void *a1, const char *a2, ...)
{
  return [a1 _stopDiscovery];
}

id objc_msgSend__teardownWiFi(void *a1, const char *a2, ...)
{
  return [a1 _teardownWiFi];
}

id objc_msgSend__textCell(void *a1, const char *a2, ...)
{
  return [a1 _textCell];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return [a1 accessory];
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return [a1 accessoryManager];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return [a1 accessoryView];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetPath(void *a1, const char *a2, ...)
{
  return [a1 assetPath];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return [a1 bluetoothAddress];
}

id objc_msgSend_bluetoothClassicDiscoverer(void *a1, const char *a2, ...)
{
  return [a1 bluetoothClassicDiscoverer];
}

id objc_msgSend_bluetoothDevice(void *a1, const char *a2, ...)
{
  return [a1 bluetoothDevice];
}

id objc_msgSend_bluetoothDiscoveryDelegate(void *a1, const char *a2, ...)
{
  return [a1 bluetoothDiscoveryDelegate];
}

id objc_msgSend_bluetoothLEDevice(void *a1, const char *a2, ...)
{
  return [a1 bluetoothLEDevice];
}

id objc_msgSend_bluetoothLEDiscoverer(void *a1, const char *a2, ...)
{
  return [a1 bluetoothLEDiscoverer];
}

id objc_msgSend_bluetoothManager(void *a1, const char *a2, ...)
{
  return [a1 bluetoothManager];
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

id objc_msgSend_btDevice(void *a1, const char *a2, ...)
{
  return [a1 btDevice];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return [a1 bundleType];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_carplayPreferences(void *a1, const char *a2, ...)
{
  return [a1 carplayPreferences];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_certificateSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 certificateSerialNumber];
}

id objc_msgSend_checkmarkImageView(void *a1, const char *a2, ...)
{
  return [a1 checkmarkImageView];
}

id objc_msgSend_checkmarkView(void *a1, const char *a2, ...)
{
  return [a1 checkmarkView];
}

id objc_msgSend_circleImageView(void *a1, const char *a2, ...)
{
  return [a1 circleImageView];
}

id objc_msgSend_clusterAssetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clusterAssetIdentifier];
}

id objc_msgSend_clusterAssetURL(void *a1, const char *a2, ...)
{
  return [a1 clusterAssetURL];
}

id objc_msgSend_clusterAssetVersion(void *a1, const char *a2, ...)
{
  return [a1 clusterAssetVersion];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_confirmationCompletion(void *a1, const char *a2, ...)
{
  return [a1 confirmationCompletion];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connectedVehicleAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedVehicleAccessories];
}

id objc_msgSend_connectionStatus(void *a1, const char *a2, ...)
{
  return [a1 connectionStatus];
}

id objc_msgSend_contactsApprovalCompletion(void *a1, const char *a2, ...)
{
  return [a1 contactsApprovalCompletion];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCountrySupportsCarIntegration(void *a1, const char *a2, ...)
{
  return [a1 currentCountrySupportsCarIntegration];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_debugConnectionStatusDescription(void *a1, const char *a2, ...)
{
  return [a1 debugConnectionStatusDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deviceForAddress(void *a1, const char *a2, ...)
{
  return [a1 deviceForAddress];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceSupportedCarPlayFeatures(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportedCarPlayFeatures];
}

id objc_msgSend_devicesForIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 devicesForIdentifiers];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disabledGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 disabledGroupSpecifier];
}

id objc_msgSend_discoveredBluetoothDevices(void *a1, const char *a2, ...)
{
  return [a1 discoveredBluetoothDevices];
}

id objc_msgSend_discoveredVehicles(void *a1, const char *a2, ...)
{
  return [a1 discoveredVehicles];
}

id objc_msgSend_discoveryDelegate(void *a1, const char *a2, ...)
{
  return [a1 discoveryDelegate];
}

id objc_msgSend_discoveryEnabled(void *a1, const char *a2, ...)
{
  return [a1 discoveryEnabled];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_drawIconBorders(void *a1, const char *a2, ...)
{
  return [a1 drawIconBorders];
}

id objc_msgSend_drawingName(void *a1, const char *a2, ...)
{
  return [a1 drawingName];
}

id objc_msgSend_drawingView(void *a1, const char *a2, ...)
{
  return [a1 drawingView];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_enabledGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 enabledGroupSpecifier];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_evaluator(void *a1, const char *a2, ...)
{
  return [a1 evaluator];
}

id objc_msgSend_featureAvailability(void *a1, const char *a2, ...)
{
  return [a1 featureAvailability];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_handleCarPlayAllowedDidChange(void *a1, const char *a2, ...)
{
  return [a1 handleCarPlayAllowedDidChange];
}

id objc_msgSend_hasCustomImage(void *a1, const char *a2, ...)
{
  return [a1 hasCustomImage];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headerImage(void *a1, const char *a2, ...)
{
  return [a1 headerImage];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hiddenIcons(void *a1, const char *a2, ...)
{
  return [a1 hiddenIcons];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return [a1 iconImage];
}

id objc_msgSend_iconImageData(void *a1, const char *a2, ...)
{
  return [a1 iconImageData];
}

id objc_msgSend_iconImageScale(void *a1, const char *a2, ...)
{
  return [a1 iconImageScale];
}

id objc_msgSend_iconLayoutController(void *a1, const char *a2, ...)
{
  return [a1 iconLayoutController];
}

id objc_msgSend_iconSortingComparator(void *a1, const char *a2, ...)
{
  return [a1 iconSortingComparator];
}

id objc_msgSend_icons(void *a1, const char *a2, ...)
{
  return [a1 icons];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_illegalCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 illegalCharacterSet];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_internalNotes(void *a1, const char *a2, ...)
{
  return [a1 internalNotes];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAnimating(void *a1, const char *a2, ...)
{
  return [a1 isAnimating];
}

id objc_msgSend_isBluetoothLEEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBluetoothLEEnabled];
}

id objc_msgSend_isCarPlayAllowed(void *a1, const char *a2, ...)
{
  return [a1 isCarPlayAllowed];
}

id objc_msgSend_isCarPlaySetupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCarPlaySetupEnabled];
}

id objc_msgSend_isCarPlaySupported(void *a1, const char *a2, ...)
{
  return [a1 isCarPlaySupported];
}

id objc_msgSend_isChecked(void *a1, const char *a2, ...)
{
  return [a1 isChecked];
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return [a1 isConnecting];
}

id objc_msgSend_isEditable(void *a1, const char *a2, ...)
{
  return [a1 isEditable];
}

id objc_msgSend_isEnhancedIntegrationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnhancedIntegrationEnabled];
}

id objc_msgSend_isFerriteEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFerriteEnabled];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPairing(void *a1, const char *a2, ...)
{
  return [a1 isPairing];
}

id objc_msgSend_isWirelessCarPlayEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWirelessCarPlayEnabled];
}

id objc_msgSend_isWirelessDiscovering(void *a1, const char *a2, ...)
{
  return [a1 isWirelessDiscovering];
}

id objc_msgSend_lastConnectedDate(void *a1, const char *a2, ...)
{
  return [a1 lastConnectedDate];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadIconImageIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadIconImageIfNeeded];
}

id objc_msgSend_localizedDisplayName(void *a1, const char *a2, ...)
{
  return [a1 localizedDisplayName];
}

id objc_msgSend_localizedModel(void *a1, const char *a2, ...)
{
  return [a1 localizedModel];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameLabel(void *a1, const char *a2, ...)
{
  return [a1 nameLabel];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsBorder(void *a1, const char *a2, ...)
{
  return [a1 needsBorder];
}

id objc_msgSend_needsPresentationConsideration(void *a1, const char *a2, ...)
{
  return [a1 needsPresentationConsideration];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_optionsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 optionsSpecifiers];
}

id objc_msgSend_outstandingContactsPrompt(void *a1, const char *a2, ...)
{
  return [a1 outstandingContactsPrompt];
}

id objc_msgSend_outstandingPairingPrompt(void *a1, const char *a2, ...)
{
  return [a1 outstandingPairingPrompt];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return [a1 paired];
}

id objc_msgSend_pairingStyle(void *a1, const char *a2, ...)
{
  return [a1 pairingStyle];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_passKey(void *a1, const char *a2, ...)
{
  return [a1 passKey];
}

id objc_msgSend_pauseDiscovery(void *a1, const char *a2, ...)
{
  return [a1 pauseDiscovery];
}

id objc_msgSend_performGetter(void *a1, const char *a2, ...)
{
  return [a1 performGetter];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return [a1 peripheral];
}

id objc_msgSend_persistenceManager(void *a1, const char *a2, ...)
{
  return [a1 persistenceManager];
}

id objc_msgSend_powerState(void *a1, const char *a2, ...)
{
  return [a1 powerState];
}

id objc_msgSend_presentedAlertController(void *a1, const char *a2, ...)
{
  return [a1 presentedAlertController];
}

id objc_msgSend_presentingController(void *a1, const char *a2, ...)
{
  return [a1 presentingController];
}

id objc_msgSend_radiosPowerPrompt(void *a1, const char *a2, ...)
{
  return [a1 radiosPowerPrompt];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_reloadVehicle(void *a1, const char *a2, ...)
{
  return [a1 reloadVehicle];
}

id objc_msgSend_resetDeviceScanning(void *a1, const char *a2, ...)
{
  return [a1 resetDeviceScanning];
}

id objc_msgSend_resetIconState(void *a1, const char *a2, ...)
{
  return [a1 resetIconState];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return [a1 sessionStatus];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldPromptBluetoothPower(void *a1, const char *a2, ...)
{
  return [a1 shouldPromptBluetoothPower];
}

id objc_msgSend_shouldPromptWiFiPower(void *a1, const char *a2, ...)
{
  return [a1 shouldPromptWiFiPower];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierName(void *a1, const char *a2, ...)
{
  return [a1 specifierName];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_spinnerView(void *a1, const char *a2, ...)
{
  return [a1 spinnerView];
}

id objc_msgSend_stagedClusterAssetURL(void *a1, const char *a2, ...)
{
  return [a1 stagedClusterAssetURL];
}

id objc_msgSend_stagedClusterAssetVersion(void *a1, const char *a2, ...)
{
  return [a1 stagedClusterAssetVersion];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startDiscovery(void *a1, const char *a2, ...)
{
  return [a1 startDiscovery];
}

id objc_msgSend_startWirelessDiscovery(void *a1, const char *a2, ...)
{
  return [a1 startWirelessDiscovery];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return [a1 stopDiscovery];
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return [a1 stopScan];
}

id objc_msgSend_stopWirelessDiscovery(void *a1, const char *a2, ...)
{
  return [a1 stopWirelessDiscovery];
}

id objc_msgSend_storedCarsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 storedCarsSpecifiers];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportsEnhancedIntegration(void *a1, const char *a2, ...)
{
  return [a1 supportsEnhancedIntegration];
}

id objc_msgSend_supportsThemeAssets(void *a1, const char *a2, ...)
{
  return [a1 supportsThemeAssets];
}

id objc_msgSend_supportsUSBCarPlay(void *a1, const char *a2, ...)
{
  return [a1 supportsUSBCarPlay];
}

id objc_msgSend_supportsWirelessCarPlay(void *a1, const char *a2, ...)
{
  return [a1 supportsWirelessCarPlay];
}

id objc_msgSend_suppressNextReloadForPairedVehicleChanged(void *a1, const char *a2, ...)
{
  return [a1 suppressNextReloadForPairedVehicleChanged];
}

id objc_msgSend_syncSettings(void *a1, const char *a2, ...)
{
  return [a1 syncSettings];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableSeparatorDarkColor(void *a1, const char *a2, ...)
{
  return [a1 tableSeparatorDarkColor];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 tertiaryLabelColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return [a1 transportType];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_vehicle(void *a1, const char *a2, ...)
{
  return [a1 vehicle];
}

id objc_msgSend_vehicleCertificateSerial(void *a1, const char *a2, ...)
{
  return [a1 vehicleCertificateSerial];
}

id objc_msgSend_vehicleDiscoverer(void *a1, const char *a2, ...)
{
  return [a1 vehicleDiscoverer];
}

id objc_msgSend_vehicleForBluetoothAddress(void *a1, const char *a2, ...)
{
  return [a1 vehicleForBluetoothAddress];
}

id objc_msgSend_vehicleForBluetoothLEIdentifier(void *a1, const char *a2, ...)
{
  return [a1 vehicleForBluetoothLEIdentifier];
}

id objc_msgSend_vehicleId(void *a1, const char *a2, ...)
{
  return [a1 vehicleId];
}

id objc_msgSend_vehicleManager(void *a1, const char *a2, ...)
{
  return [a1 vehicleManager];
}

id objc_msgSend_vehicleModelName(void *a1, const char *a2, ...)
{
  return [a1 vehicleModelName];
}

id objc_msgSend_vehicleSettingManager(void *a1, const char *a2, ...)
{
  return [a1 vehicleSettingManager];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}