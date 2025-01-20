BOOL supportAbsoluteAltimeterFeatures()
{
  uint64_t vars8;

  if (qword_268920D88 != -1) {
    dispatch_once(&qword_268920D88, &unk_26EA48940);
  }
  if (!byte_268920D80) {
    return 0;
  }

  return supportsAltimeterOverride();
}

void sub_2375A0048(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268921058);
  id WeakRetained = objc_loadWeakRetained(&qword_268921060);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_268921060);
    if (v5 == obj)
    {
      uint64_t v8 = objc_msgSend_version(obj, (const char *)obj, v6, v7);
      uint64_t v9 = qword_268921068;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&qword_268921060, obj);
  qword_268921068 = objc_msgSend_version(obj, v11, v12, v13);

  sub_2375AE150(v14, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268921058);
  sub_2375AE464(a2, (uint64_t)&qword_268920F80);
}

void sub_2375A0158(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268921240);
  id WeakRetained = objc_loadWeakRetained(&qword_268921248);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&qword_268921248);
    if (v8 == v5)
    {
      uint64_t v12 = objc_msgSend_version(v5, v9, v10, v11);
      uint64_t v13 = qword_268921250;

      if (v12 == v13) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v14 = objc_storeWeak(&qword_268921248, v5);
  qword_268921250 = objc_msgSend_version(v5, v15, v16, v17);

  sub_2375B4E78(v18, v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268921240);
  *(void *)(a3 + 16) = 0;
  if (a2 == 12)
  {
    v20 = &xmmword_268921218;
  }
  else
  {
    if (a2 != 10)
    {
      v19 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_2375D7FFC(a2, v19);
      }
    }
    v20 = &xmmword_2689211F0;
  }
  *(_OWORD *)a3 = *v20;
  *(void *)(a3 + 16) = *((id *)v20 + 2);
  *(_OWORD *)(a3 + 24) = *(long long *)((char *)v20 + 24);
}

double sub_2375A02B4(void *a1, uint64_t a2)
{
  id v3 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268921380);
  id WeakRetained = objc_loadWeakRetained(&qword_268921388);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&qword_268921388);
    if (v6 == v3)
    {
      uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
      uint64_t v11 = qword_268921390;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&qword_268921388, v3);
  qword_268921390 = objc_msgSend_version(v3, v13, v14, v15);

  sub_2375BEC7C(v16, v3);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268921380);
  if (a2 == 10)
  {
LABEL_12:
    uint64_t v17 = &xmmword_268921340;
    goto LABEL_13;
  }
  if (a2 != 12)
  {
    uint64_t v18 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_2375D7FFC(a2, v18);
    }

    goto LABEL_12;
  }
  uint64_t v17 = &xmmword_268921360;
LABEL_13:
  double v19 = *(double *)v17;

  return v19;
}

void sub_2375A0C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id NanoCompassFormattedHeading(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v9 = a3;
  if (v5 && (objc_msgSend_isAccurate(v5, v6, v7, v8) & 1) != 0)
  {
    objc_msgSend_heading(v5, v10, v11, v12);
    uint64_t v17 = sub_2375A1F14(v9, v13);
    if (a2 && (objc_msgSend_accuracy(v5, v14, v15, v16), v18 > 30.0))
    {
      double v19 = NanoCompassLocalizedString(@"INACCURATE_DEGREE_FORMAT");
      objc_msgSend_stringWithFormat_(NSString, v20, (uint64_t)v19, v21, v17);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = v17;
    }
  }
  else
  {
    NanoCompassLocalizedString(@"UNCALIBRATED");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

void sub_2375A0D98(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int isRunningInStoreDemoMode = objc_msgSend_isRunningInStoreDemoMode(MEMORY[0x263F1C408], a2, a3, a4);
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  if (isRunningInStoreDemoMode)
  {
    uint64_t v8 = objc_msgSend_initWithSuiteName_(v5, v6, @"com.apple.Carousel", v7);
    int v11 = objc_msgSend_BOOLForKey_(v8, v9, @"StandaloneIsSecured", v10);
    byte_268921150 = v11;
    if (v11)
    {
      uint64_t v12 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        double v13 = "Running store demo mode.";
        uint64_t v14 = (uint8_t *)&v19;
LABEL_8:
        _os_log_impl(&dword_23759D000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend_initWithSuiteName_(v5, v6, @"com.apple.compass", v7);
    int v17 = objc_msgSend_BOOLForKey_(v8, v15, @"ShowIdealizedDataForPPT", v16);
    byte_268921150 = v17;
    if (v17)
    {
      uint64_t v12 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        double v13 = "Idealized Data setting is enabled. Most complications will not be available.";
        uint64_t v14 = (uint8_t *)&v18;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
}

void sub_2375A1278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_2375A1EA0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2375A1AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id NanoCompassLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = sub_2375A1FFC();
  v4 = objc_msgSend_localizedStringForKey_value_table_(v2, v3, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"NanoCompass");

  if (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)v1, v6))
  {
    id v9 = sub_2375A1FFC();
    uint64_t v11 = objc_msgSend_localizedStringForKey_value_table_(v9, v10, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"AltimeterComplication");

    v4 = (void *)v11;
  }
  if (objc_msgSend_isEqualToString_(v4, v7, (uint64_t)v1, v8))
  {
    uint64_t v14 = sub_2375A1FFC();
    uint64_t v16 = objc_msgSend_localizedStringForKey_value_table_(v14, v15, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"GridSystem");

    v4 = (void *)v16;
  }
  if (objc_msgSend_isEqualToString_(v4, v12, (uint64_t)v1, v13))
  {
    __int16 v19 = sub_2375A1FFC();
    uint64_t v21 = objc_msgSend_localizedStringForKey_value_table_(v19, v20, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"Waypoint");

    v4 = (void *)v21;
  }
  if (objc_msgSend_isEqualToString_(v4, v17, (uint64_t)v1, v18))
  {
    v24 = sub_2375A1FFC();
    uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"LevelComplication");

    v4 = (void *)v26;
  }
  if (objc_msgSend_isEqualToString_(v4, v22, (uint64_t)v1, v23))
  {
    v29 = sub_2375A1FFC();
    uint64_t v31 = objc_msgSend_localizedStringForKey_value_table_(v29, v30, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"Localizable-Footprint");

    v4 = (void *)v31;
  }
  if (objc_msgSend_isEqualToString_(v4, v27, (uint64_t)v1, v28))
  {
    v34 = sub_2375A1FFC();
    uint64_t v36 = objc_msgSend_localizedStringForKey_value_table_(v34, v35, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"Localizable-N199");

    v4 = (void *)v36;
  }
  if (objc_msgSend_isEqualToString_(v4, v32, (uint64_t)v1, v33))
  {
    v37 = sub_2375A1FFC();
    uint64_t v39 = objc_msgSend_localizedStringForKey_value_table_(v37, v38, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"Localizable-Guides");

    v4 = (void *)v39;
  }

  return v4;
}

void sub_2375A1EA0(uint64_t a1)
{
  v2 = *(void **)(a1 + 168);
}

id sub_2375A1F14(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v8 = objc_msgSend_numberWithInteger_(NSNumber, v4, vcvtmd_s64_f64(a2), v5);
  if (v3) {
    objc_msgSend_stringFromNumber_(v3, v6, (uint64_t)v8, v7);
  }
  else {
  id v9 = objc_msgSend_localizedStringFromNumber_numberStyle_(MEMORY[0x263F08A30], v6, (uint64_t)v8, 0);
  }
  uint64_t v10 = NanoCompassLocalizedString(@"DEGREE_FORMAT");
  uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v11, (uint64_t)v10, v12, v9);

  return v13;
}

id sub_2375A1FFC()
{
  if (qword_268920E38 != -1) {
    dispatch_once(&qword_268920E38, &unk_26EA48AA0);
  }
  v0 = (void *)qword_268920E30;

  return v0;
}

void sub_2375A2254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_2375A1EA0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2375A2BC8()
{
  CLLocationCoordinate2D v0 = CLLocationCoordinate2DMake(37.3353672, -122.011737);
  id v1 = objc_alloc(MEMORY[0x263F00A50]);
  double v2 = *MEMORY[0x263F00B10];
  double v3 = *MEMORY[0x263F00B40];
  uint64_t v7 = objc_msgSend_date(MEMORY[0x263EFF910], v4, v5, v6);
  id v15 = (id)objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(v1, v8, (uint64_t)v7, v9, v0.latitude, v0.longitude, 48.7, v2, v3);

  uint64_t v11 = objc_msgSend_altitudeWithLocation_error_(NCAltitude, v10, (uint64_t)v15, 0);
  uint64_t v12 = (void *)qword_268920BF0;
  qword_268920BF0 = v11;

  objc_msgSend_setAbsoluteAltitudeAccuracy_((void *)qword_268920BF0, v13, (uint64_t)&unk_26EA53208, v14);
}

__CFString *sub_2375A2EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_264CD5540[a3 - 1];
  }
}

uint64_t sub_2375A2F08(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((objc_msgSend_automotive(a1, a2, a3, a4) & 1) != 0
    || (objc_msgSend_cycling(a1, v5, v6, v7) & 1) != 0
    || (objc_msgSend_running(a1, v8, v9, v10) & 1) != 0)
  {
    return 1;
  }

  return objc_msgSend_walking(a1, v11, v12, v13);
}

uint64_t sub_2375A2F6C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_walking(a1, a2, a3, a4)) {
    return 1;
  }
  if (objc_msgSend_running(a1, v5, v6, v7)) {
    return 2;
  }
  if (objc_msgSend_automotive(a1, v9, v10, v11)) {
    return 3;
  }
  if (objc_msgSend_cycling(a1, v12, v13, v14)) {
    return 4;
  }
  return 0;
}

uint64_t sub_2375A3484()
{
  return NSRequestConcreteImplementation();
}

uint64_t sub_2375A34A0()
{
  return objc_opt_class();
}

uint64_t sub_2375A40B4()
{
  qword_268920C00 = objc_alloc_init(NCTargetedWaypointManager);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2375A52D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  qword_268920C10 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], a2, *MEMORY[0x263EFCF58], a4, *(double *)(*(void *)(a1 + 32) + 488), *MEMORY[0x263F81828]);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2375A53DC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], a2, *MEMORY[0x263EFCF58], a4, *(double *)(*(void *)(a1 + 32) + 480), *MEMORY[0x263F81828]);
  uint64_t v5 = (void *)qword_268920C28;
  qword_268920C28 = v4;

  qword_268920C20 = objc_msgSend_CLKFontWithLocalizedSmallCaps((void *)qword_268920C28, v6, v7, v8);

  return MEMORY[0x270F9A758]();
}

void sub_2375A54EC(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v7 = objc_msgSend_sizeClass(v3, v4, v5, v6);
  uint64_t v9 = objc_msgSend_metricsWithDevice_identitySizeClass_(v2, v8, (uint64_t)v3, v7);

  v27 = &unk_26EA536C8;
  v28[0] = &unk_26EA53218;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v28, (uint64_t)&v27, 1);
  objc_msgSend_scaledValue_withOverrides_(v9, v12, (uint64_t)v11, v13, 4.0);
  qword_268920C38 = v14;

  objc_msgSend_scaledValue_(v9, v15, v16, v17, 11.0);
  qword_268920C40 = v18;
  objc_msgSend_scaledValue_(v9, v19, v20, v21, 11.0);
  qword_268920C48 = v22;
  objc_msgSend_scaledValue_(v9, v23, v24, v25, 13.0);
  qword_268920C50 = v26;
}

uint64_t sub_2375A57D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], a2, *MEMORY[0x263EFCF58], a4, *(double *)(*(void *)(a1 + 32) + 512), *MEMORY[0x263F81828]);
  uint64_t v5 = (void *)qword_268920C78;
  qword_268920C78 = v4;

  qword_268920C70 = objc_msgSend_CLKFontWithLocalizedSmallCaps((void *)qword_268920C78, v6, v7, v8);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2375A58F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  qword_268920C88 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], a2, *MEMORY[0x263EFCF58], a4, *(double *)(*(void *)(a1 + 32) + 520), *MEMORY[0x263F81828]);

  return MEMORY[0x270F9A758]();
}

void sub_2375A5968(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v7 = objc_msgSend_sizeClass(v3, v4, v5, v6);
  uint64_t v9 = objc_msgSend_metricsWithDevice_identitySizeClass_(v2, v8, (uint64_t)v3, v7);

  v27 = &unk_26EA536E0;
  v28[0] = &unk_26EA53228;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v28, (uint64_t)&v27, 1);
  objc_msgSend_scaledValue_withOverrides_(v9, v12, (uint64_t)v11, v13, 10.0);
  qword_268920C98 = v14;

  objc_msgSend_scaledValue_(v9, v15, v16, v17, 33.0);
  qword_268920CA0 = v18;
  objc_msgSend_scaledValue_(v9, v19, v20, v21, 33.0);
  qword_268920CA8 = v22;
  objc_msgSend_scaledValue_(v9, v23, v24, v25, 42.0);
  qword_268920CB0 = v26;
}

void sub_2375A5C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2375A5C24(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v2 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _startLocationQueryDurationTimer]_block_invoke";
    _os_log_impl(&dword_23759D000, v2, OS_LOG_TYPE_DEFAULT, "%s Location update should end. Set the idle time to restart location update.", (uint8_t *)&v12, 0xCu);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_stopLocationUpdates(WeakRetained, v5, v6, v7);

  id v8 = objc_loadWeakRetained(v3);
  objc_msgSend__startIdleTimer(v8, v9, v10, v11);
}

void sub_2375A6404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2375A6434(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375A64C4;
  block[3] = &unk_264CD55C0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void sub_2375A64C4(uint64_t a1)
{
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[32];
    if (v6)
    {
      if (objc_msgSend_isValid(v6, v2, v3, v4))
      {
        uint64_t v7 = NCLogForCategory(1uLL);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_2375D7E10(v7);
        }

        objc_msgSend_fire(v5[32], v8, v9, v10);
      }
    }
  }
}

uint64_t sub_2375A6548(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _takeLocationAssertion]_block_invoke";
    _os_log_impl(&dword_23759D000, v2, OS_LOG_TYPE_DEFAULT, "%s runtime assertion is about to expire", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2375A6608(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _takeLocationAssertion]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s runtime assertion invalidated. error: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2375A786C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_bundleForClass_(MEMORY[0x263F086E0], a2, *(void *)(a1 + 32), a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_bundleIdentifier(v9, v4, v5, v6);
  __int16 v8 = (void *)qword_268920CD0;
  qword_268920CD0 = v7;
}

uint64_t sub_2375A8428()
{
  uint64_t v0 = [NCBearing alloc];
  uint64_t v4 = objc_msgSend_initWithBearing_(v0, v1, v2, v3, 0.0);
  uint64_t v5 = qword_268920CE0;
  qword_268920CE0 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

void sub_2375A90C4(uint64_t a1, void *a2)
{
  v22[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v5 = objc_msgSend_metricsWithDevice_identitySizeClass_(v2, v4, (uint64_t)v3, 2);
  v21[0] = &unk_26EA53728;
  v21[1] = &unk_26EA53740;
  v22[0] = &unk_26EA53AA0;
  v22[1] = &unk_26EA53AA0;
  v21[2] = &unk_26EA53758;
  v22[2] = &unk_26EA53AB0;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v22, (uint64_t)v21, 3);
  objc_msgSend_scaledValue_withOverrides_(v5, v8, (uint64_t)v7, v9, 44.0);
  *(void *)&xmmword_268920CF0 = v10;

  objc_msgSend_scaledValue_(v5, v11, v12, v13, 1.25);
  *((void *)&xmmword_268920CF0 + 1) = v14;
  objc_msgSend_scaledValue_(v5, v15, v16, v17, 2.5);
  qword_268920D00 = v18;
  *(_OWORD *)algn_268920D08 = *(long long *)((char *)&xmmword_268920CF0 + 8);
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v20 = v19;

  xmmword_268920D20 = (__int128)vmulq_n_f64((float64x2_t)xmmword_268920CF0, v20);
  *(float64x2_t *)algn_268920D30 = vmulq_n_f64(*(float64x2_t *)&qword_268920D00, v20);
  *(double *)&qword_268920D40 = v20 * *(double *)&qword_268920D10;
}

void sub_2375A9234(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v9[7] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_null(MEMORY[0x263EFF9D0], a2, a3, a4);
  v8[0] = @"transform";
  v8[1] = @"borderColor";
  v9[0] = v4;
  v9[1] = v4;
  v8[2] = @"borderWidth";
  v8[3] = @"backgroundColor";
  v9[2] = v4;
  v9[3] = v4;
  v8[4] = @"foregroundColor";
  v8[5] = @"opacity";
  v9[4] = v4;
  v9[5] = v4;
  v8[6] = @"cornerRadius";
  v9[6] = v4;
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v9, (uint64_t)v8, 7);
  uint64_t v7 = (void *)qword_268920D60;
  qword_268920D60 = v6;
}

uint64_t IsNanoCompass()
{
  if (qword_268920D78 != -1) {
    dispatch_once(&qword_268920D78, &unk_26EA48920);
  }
  return byte_268920D70;
}

void sub_2375A9364(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], a2, a3, a4);
  objc_msgSend_bundleIdentifier(v4, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  byte_268920D70 = objc_msgSend_isEqualToString_(@"com.apple.NanoCompass.watchkitapp", v8, (uint64_t)v10, v9);
}

uint64_t NanoCompassIsInternalBuild()
{
  if (qword_268920D88 != -1) {
    dispatch_once(&qword_268920D88, &unk_26EA48940);
  }
  return byte_268920D80;
}

uint64_t sub_2375A941C()
{
  uint64_t result = os_variant_has_internal_ui();
  byte_268920D80 = result;
  return result;
}

id NanoCompassAppTintColor()
{
  if (qword_268920D98 != -1) {
    dispatch_once(&qword_268920D98, &unk_26EA48960);
  }
  uint64_t v0 = (void *)qword_268920D90;

  return v0;
}

uint64_t sub_2375A9498(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a2, a3, a4, 1.0, 0.333333333, 0.0392156863, 1.0);
  uint64_t v5 = qword_268920D90;
  qword_268920D90 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

id NanoCompassBearingTintColor()
{
  if (qword_268920DA8 != -1) {
    dispatch_once(&qword_268920DA8, &unk_26EA48980);
  }
  uint64_t v0 = (void *)qword_268920DA0;

  return v0;
}

uint64_t sub_2375A9544(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a2, a3, a4, 0.929411765, 0.149019608, 0.0941176471, 1.0);
  uint64_t v5 = qword_268920DA0;
  qword_268920DA0 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

id NanoCompassAccessibilityNameForSymbol(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_2375A1FFC();
  uint64_t v4 = objc_msgSend_localizedStringForKey_value_table_(v2, v3, (uint64_t)v1, (uint64_t)&stru_26EA49580, @"WaypointSymbols");

  return v4;
}

id NanoCompassFormattedUncalibrated()
{
  return NanoCompassLocalizedString(@"UNCALIBRATED");
}

id NanoCompassFormattedDirection(int a1, const char *a2, uint64_t a3, uint64_t a4, double a5)
{
  if (qword_268920DB8 != -1) {
    dispatch_once(&qword_268920DB8, &unk_26EA489A0);
  }
  unint64_t v7 = objc_msgSend_count((void *)qword_268920DB0, a2, a3, a4);
  id v10 = objc_msgSend_objectAtIndexedSubscript_((void *)qword_268920DB0, v8, (uint64_t)vcvtmd_s64_f64((double)(0x168 / v7) * 0.5 + a5) % 360 / (0x168 / v7), v9);
  uint64_t v13 = v10;
  if (a1)
  {
    uint64_t v14 = objc_msgSend_stringByAppendingString_(v10, v11, @"_FULL", v12);

    uint64_t v13 = (void *)v14;
  }
  id v15 = NanoCompassLocalizedString(v13);

  return v15;
}

void sub_2375A971C()
{
  uint64_t v0 = (void *)qword_268920DB0;
  qword_268920DB0 = (uint64_t)&unk_26EA53A70;
}

id NanoCompassFormattedHeadingDirection(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1 && (objc_msgSend_isAccurate(v1, v2, v3, v4) & 1) != 0)
  {
    objc_msgSend_heading(v5, v6, v7, v8);
    uint64_t v13 = NanoCompassFormattedDirection(0, v9, v10, v11, v12);
  }
  else
  {
    uint64_t v13 = NanoCompassLocalizedString(@"UNCALIBRATED");
  }
  uint64_t v14 = (void *)v13;

  return v14;
}

id NanoCompassFormattedHeadingFullDirection(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1 && (objc_msgSend_isAccurate(v1, v2, v3, v4) & 1) != 0)
  {
    objc_msgSend_heading(v5, v6, v7, v8);
    uint64_t v13 = NanoCompassFormattedDirection(1, v9, v10, v11, v12);
  }
  else
  {
    uint64_t v13 = NanoCompassLocalizedString(@"UNCALIBRATED");
  }
  uint64_t v14 = (void *)v13;

  return v14;
}

id NanoCompassFormattedHeadingAndDirection(void *a1, int a2, void *a3)
{
  return NanoCompassFormattedFullHeadingAndDirection(a1, a2, a3, 0);
}

id NanoCompassFormattedFullHeadingAndDirection(void *a1, int a2, void *a3, int a4)
{
  id v7 = a1;
  id v11 = a3;
  if (v7 && (objc_msgSend_isAccurate(v7, v8, v9, v10) & 1) != 0)
  {
    double v12 = NanoCompassLocalizedString(@"HEADING_DIRECTION_COMBINER");
    uint64_t v13 = NSString;
    uint64_t v14 = NanoCompassFormattedHeading(v7, a2, v11);
    objc_msgSend_heading(v7, v15, v16, v17);
    uint64_t v22 = NanoCompassFormattedDirection(a4, v18, v19, v20, v21);
    uint64_t v25 = objc_msgSend_stringWithFormat_(v13, v23, (uint64_t)v12, v24, v14, v22);
  }
  else
  {
    uint64_t v25 = NanoCompassLocalizedString(@"UNCALIBRATED");
  }

  return v25;
}

__CFString *NanoCompassFormattedBearing(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    objc_msgSend_bearing(a1, v4, v5, v6);
    sub_2375A1F14(v3, v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = &stru_26EA49580;
  }

  return v8;
}

__CFString *NanoCompassFormattedBearingDirection(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_bearing(a1, a2, a3, a4);
    NanoCompassFormattedDirection(0, v5, v6, v7, v8);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &stru_26EA49580;
  }
  return v9;
}

__CFString *NanoCompassFormattedBearingAndDirection(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v4 = a1;
    uint64_t v5 = NanoCompassLocalizedString(@"HEADING_DIRECTION_COMBINER");
    uint64_t v6 = NSString;
    uint64_t v7 = NanoCompassFormattedBearing(v4, v3);

    id v11 = NanoCompassFormattedBearingDirection(v4, v8, v9, v10);

    objc_msgSend_stringWithFormat_(v6, v12, (uint64_t)v5, v13, v7, v11);
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = &stru_26EA49580;
  }

  return v14;
}

id NanoCompassDefaultValueFormat()
{
  if (qword_268920DC8 != -1) {
    dispatch_once(&qword_268920DC8, &unk_26EA489C0);
  }
  uint64_t v0 = (void *)qword_268920DC0;

  return v0;
}

uint64_t sub_2375A9B1C()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)qword_268920DC0;
  qword_268920DC0 = v0;

  objc_msgSend_setNumberStyle_((void *)qword_268920DC0, v2, 1, v3);
  objc_msgSend_setMaximumFractionDigits_((void *)qword_268920DC0, v4, 0, v5);
  uint64_t v7 = qword_268920DC0;

  return MEMORY[0x270F9A6D0](v7, sel_setRoundingMode_, 2, v6);
}

id NanoCompassFormattedAltitude(void *a1, void *a2)
{
  id v3 = a1;
  id v7 = a2;
  if (v3 && (objc_msgSend_hasReading(v3, v4, v5, v6) & 1) != 0)
  {
    id v8 = objc_alloc(MEMORY[0x263F08980]);
    objc_msgSend_altitude(v3, v9, v10, v11);
    double v13 = v12;
    uint64_t v17 = objc_msgSend_meters(MEMORY[0x263F08CE8], v14, v15, v16);
    uint64_t v20 = objc_msgSend_initWithDoubleValue_unit_(v8, v18, (uint64_t)v17, v19, v13);

    uint64_t v24 = objc_msgSend_shared(_TtC24NanoCompassComplications21UnitLengthPreferences, v21, v22, v23);
    char v28 = objc_msgSend_usesMetric(v24, v25, v26, v27);

    double v32 = 5.0;
    if ((v28 & 1) == 0)
    {
      uint64_t v33 = objc_msgSend_feet(MEMORY[0x263F08CE8], v29, v30, v31);
      uint64_t v36 = objc_msgSend_measurementByConvertingToUnit_(v20, v34, (uint64_t)v33, v35);

      double v32 = 10.0;
      uint64_t v20 = (void *)v36;
    }
    if (objc_msgSend_type(v3, v29, v30, v31) == 3) {
      double v32 = 1.0;
    }
    objc_msgSend_doubleValue(v20, v37, v38, v39);
    v46 = objc_msgSend_numberWithDouble_(NSNumber, v41, v42, v43, v32 * round(v40 / v32));
    if (v7)
    {
      v47 = objc_msgSend_stringFromNumber_(v7, v44, (uint64_t)v46, v45);
    }
    else
    {
      v48 = NanoCompassDefaultValueFormat();
      v47 = objc_msgSend_stringFromNumber_(v48, v49, (uint64_t)v46, v50);
    }
  }
  else
  {
    v47 = NanoCompassLocalizedString(@"UNCALIBRATED");
  }

  return v47;
}

id NanoCompassFormattedAltitudeUnits(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return NanoCompassFormattedAltitudeUnitsInAbbr(0, a2, a3, a4);
}

id NanoCompassFormattedAltitudeUnitsInAbbr(int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_shared(_TtC24NanoCompassComplications21UnitLengthPreferences, a2, a3, a4);
  int v9 = objc_msgSend_usesMetric(v5, v6, v7, v8);

  uint64_t v10 = @"ALTITUDE_UNIT_METER";
  if (a1) {
    uint64_t v10 = @"ALTITUDE_UNIT_KILOMETER";
  }
  if (v9) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = @"ALTITUDE_UNIT_FOOT";
  }
  double v12 = NanoCompassLocalizedString(v11);

  return v12;
}

id NanoCompassFormattedAltitudeValueAndUnits(void *a1, void *a2)
{
  id v3 = a1;
  id v7 = a2;
  if (v3 && (objc_msgSend_hasReading(v3, v4, v5, v6) & 1) != 0)
  {
    uint64_t v8 = NanoCompassLocalizedString(@"ALTITUDE_COMBINING_FORMAT");
    int v9 = NSString;
    uint64_t v10 = NanoCompassFormattedAltitude(v3, v7);
    uint64_t v14 = NanoCompassFormattedAltitudeUnitsInAbbr(0, v11, v12, v13);
    uint64_t v17 = objc_msgSend_stringWithFormat_(v9, v15, (uint64_t)v8, v16, v10, v14);
  }
  else
  {
    uint64_t v17 = NanoCompassLocalizedString(@"UNCALIBRATED");
  }

  return v17;
}

id NanoCompassValueAndUnit(void *a1, void *a2, char a3, int a4)
{
  if (a1)
  {
    uint64_t v5 = NanoCompassValueWithFormat(a1, a2, a3);
    int v9 = NanoCompassFormattedAltitudeUnitsInAbbr(0, v6, v7, v8);
    uint64_t v10 = NSString;
    if (a4) {
      uint64_t v11 = @"ALTITUDE_COMBINING_WITH_SPACE_FORMAT";
    }
    else {
      uint64_t v11 = @"ALTITUDE_COMBINING_FORMAT";
    }
    uint64_t v12 = NanoCompassLocalizedString(v11);
    uint64_t v15 = objc_msgSend_stringWithFormat_(v10, v13, (uint64_t)v12, v14, v5, v9);
  }
  else
  {
    uint64_t v15 = NanoCompassLocalizedString(@"UNCALIBRATED");
  }

  return v15;
}

id NanoCompassValueWithFormat(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v5)
  {
    uint64_t v14 = NanoCompassLocalizedString(@"UNCALIBRATED");
    goto LABEL_9;
  }
  int v9 = NanoCompassLocalizedString(@"INACCURATE_DEGREE_FORMAT");
  if (!v6)
  {
    uint64_t v15 = NanoCompassDefaultValueFormat();
    uint64_t v12 = objc_msgSend_stringFromNumber_(v15, v16, (uint64_t)v5, v17);

    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    id v13 = v12;
    goto LABEL_8;
  }
  uint64_t v12 = objc_msgSend_stringFromNumber_(v6, v7, (uint64_t)v5, v8);
  if ((a3 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  objc_msgSend_stringWithFormat_(NSString, v10, (uint64_t)v9, v11, v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  uint64_t v14 = v13;

LABEL_9:

  return v14;
}

id NanoCompassGetAltitudeAbbreviationWithTargetLength(void *a1, uint64_t a2, unsigned char *a3)
{
  id v5 = a1;
  unsigned int v9 = objc_msgSend_displayTilde(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_altitude(v5, v11, v12, v13);
  uint64_t v17 = objc_msgSend_numberWithInt_(v10, v15, (int)v14, v16);
  int v21 = objc_msgSend_intValue(v17, v18, v19, v20);
  uint64_t v22 = NanoCompassLocalizedString(@"INACCURATE_DEGREE_FORMAT");
  int v26 = objc_msgSend_intValue(v17, v23, v24, v25);
  if (v26 >= 0) {
    unsigned int v30 = v26;
  }
  else {
    unsigned int v30 = -v26;
  }
  if (v30 < 0x3E8) {
    goto LABEL_15;
  }
  if (v21 >= 0) {
    unsigned int v31 = v21;
  }
  else {
    unsigned int v31 = -v21;
  }
  double v32 = objc_msgSend_stringValue(v17, v27, v28, v29);
  uint64_t v36 = objc_msgSend_length(v32, v33, v34, v35);
  uint64_t v37 = v9;
  if (v31 > 0x3E7) {
    uint64_t v37 = v9 + 1;
  }
  unint64_t v38 = v37 + v36;

  if (v38 <= (int)a2)
  {
LABEL_15:
    v61 = NanoCompassDefaultValueFormat();
    v49 = objc_msgSend_stringFromNumber_(v61, v62, (uint64_t)v17, v63);

    if (v9)
    {
      objc_msgSend_stringWithFormat_(NSString, v64, (uint64_t)v22, v65, v49);
      id v66 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v66 = v49;
      v49 = v66;
    }
    v60 = v66;
  }
  else
  {
    objc_msgSend_altitude(v5, v39, v40, v41);
    *(float *)&double v42 = v42 / 1000.0;
    LODWORD(a2) = llroundf(*(float *)&v42);
    uint64_t v43 = NanoCompassDefaultValueFormat();
    v46 = objc_msgSend_numberWithInt_(NSNumber, v44, a2, v45);
    v49 = objc_msgSend_stringFromNumber_(v43, v47, (uint64_t)v46, v48);

    *a3 = 1;
    v53 = objc_msgSend_shared(_TtC24NanoCompassComplications21UnitLengthPreferences, v50, v51, v52);
    LODWORD(v43) = objc_msgSend_usesMetric(v53, v54, v55, v56);

    if (v43) {
      v57 = @"ALTITUDE_ABBREVIATION_IN_METRIC";
    }
    else {
      v57 = @"ALTITUDE_ABBREVIATION_NON_METRIC";
    }
    v58 = NanoCompassLocalizedString(v57);
    v60 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v59, (uint64_t)v58, @"~%@", 0, v49);
  }

  return v60;
}

__CFString *NanoCompassFormattedAltitudeAccuracy(void *a1, void *a2)
{
  id v3 = a1;
  id v7 = a2;
  if (v3 && objc_msgSend_hasReading(v3, v4, v5, v6))
  {
    id v8 = objc_alloc(MEMORY[0x263F08980]);
    objc_msgSend_accuracy(v3, v9, v10, v11);
    double v13 = v12;
    uint64_t v17 = objc_msgSend_meters(MEMORY[0x263F08CE8], v14, v15, v16);
    uint64_t v20 = objc_msgSend_initWithDoubleValue_unit_(v8, v18, (uint64_t)v17, v19, v13);

    uint64_t v24 = objc_msgSend_shared(_TtC24NanoCompassComplications21UnitLengthPreferences, v21, v22, v23);
    char v28 = objc_msgSend_usesMetric(v24, v25, v26, v27);

    if ((v28 & 1) == 0)
    {
      double v32 = objc_msgSend_feet(MEMORY[0x263F08CE8], v29, v30, v31);
      uint64_t v35 = objc_msgSend_measurementByConvertingToUnit_(v20, v33, (uint64_t)v32, v34);

      uint64_t v20 = (void *)v35;
    }
    uint64_t v36 = NSNumber;
    objc_msgSend_doubleValue(v20, v29, v30, v31);
    double v42 = objc_msgSend_numberWithDouble_(v36, v37, v38, v39);
    if (v7)
    {
      objc_msgSend_stringFromNumber_(v7, v40, (uint64_t)v42, v41);
    }
    else
    {
      if (qword_268920DD8 != -1) {
        dispatch_once(&qword_268920DD8, &unk_26EA489E0);
      }
      objc_msgSend_stringFromNumber_((void *)qword_268920DD0, v40, (uint64_t)v42, v41);
    v44 = };
    uint64_t v45 = NanoCompassLocalizedString(@"ACCURACY_FORMAT");
    objc_msgSend_stringWithFormat_(NSString, v46, (uint64_t)v45, v47, v44);
    uint64_t v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v43 = &stru_26EA49580;
  }

  return v43;
}

uint64_t sub_2375AA494()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)qword_268920DD0;
  qword_268920DD0 = v0;

  objc_msgSend_setNumberStyle_((void *)qword_268920DD0, v2, 1, v3);
  uint64_t v6 = (void *)qword_268920DD0;

  return objc_msgSend_setMaximumFractionDigits_(v6, v4, 2, v5);
}

id _noStyleFormatter()
{
  if (qword_268920DE8 != -1) {
    dispatch_once(&qword_268920DE8, &unk_26EA48A00);
  }
  uint64_t v0 = (void *)qword_268920DE0;

  return v0;
}

void sub_2375AA544()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)qword_268920DE0;
  qword_268920DE0 = v0;

  objc_msgSend_setNumberStyle_((void *)qword_268920DE0, v2, 0, v3);
  objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x263EFF960], v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocale_((void *)qword_268920DE0, v7, (uint64_t)v9, v8);
}

id _DMSAccessibilityFormatter()
{
  if (qword_268920DF8 != -1) {
    dispatch_once(&qword_268920DF8, &unk_26EA48A20);
  }
  uint64_t v0 = (void *)qword_268920DF0;

  return v0;
}

uint64_t sub_2375AA618()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)qword_268920DF0;
  qword_268920DF0 = v0;

  objc_msgSend_setUnitsStyle_((void *)qword_268920DF0, v2, 3, v3);
  uint64_t v5 = qword_268920DF0;

  return MEMORY[0x270F9A6D0](v5, sel_setZeroFormattingBehavior_, 0, v4);
}

id NanoCompassWaypointDefaultColor()
{
  if (qword_268920E08 != -1) {
    dispatch_once(&qword_268920E08, &unk_26EA48A40);
  }
  uint64_t v0 = (void *)qword_268920E00;

  return v0;
}

uint64_t sub_2375AA6C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], a2, a3, a4, 0.949019608, 0.7);
  uint64_t v5 = qword_268920E00;
  qword_268920E00 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

uint64_t hardwareSupportsAbsoluteAltimeter()
{
  return 0;
}

BOOL supportsAltimeterOverride()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AbsoluteAltitudeEnabled", @"com.apple.locationd", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    if (byte_268920E10) {
      goto LABEL_3;
    }
    return 0;
  }
  byte_268920E10 = AppBooleanValue != 0;
  if (!AppBooleanValue) {
    return 0;
  }
LABEL_3:
  id v1 = NCLogForCategory(0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_268920E10) {
      uint64_t v2 = @"YES";
    }
    else {
      uint64_t v2 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = v2;
    _os_log_impl(&dword_23759D000, v1, OS_LOG_TYPE_DEFAULT, "Absolute altimeter support is overridden to %@", buf, 0xCu);
  }

  return byte_268920E10 != 0;
}

uint64_t _isCurrentDeviceAltAccount()
{
  if (qword_268920E18 != -1) {
    dispatch_once(&qword_268920E18, &unk_26EA48A60);
  }
  return byte_268920E11;
}

void sub_2375AA878(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_sharedInstance(MEMORY[0x263F57730], a2, a3, a4);
  uint64_t v8 = objc_msgSend_activePairedDeviceSelectorBlock(MEMORY[0x263F57730], v5, v6, v7);
  uint64_t v11 = objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(v4, v9, (uint64_t)v8, v10);
  objc_msgSend_firstObject(v11, v12, v13, v14);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = v22;
  if (v22)
  {
    uint64_t v18 = objc_msgSend_valueForProperty_(v22, v15, *MEMORY[0x263F575B0], v16);
    byte_268920E11 = objc_msgSend_BOOLValue(v18, v19, v20, v21);

    uint64_t v17 = v22;
  }
  else
  {
    byte_268920E11 = 0;
  }
}

uint64_t supportsOrienteering()
{
  if (qword_268920E28 != -1) {
    dispatch_once(&qword_268920E28, &unk_26EA48A80);
  }
  return byte_268920E20;
}

uint64_t sub_2375AA98C()
{
  uint64_t result = MGGetBoolAnswer();
  byte_268920E20 = result;
  return result;
}

BOOL isFullyFeaturedApp()
{
  if (qword_268920E28 != -1) {
    dispatch_once(&qword_268920E28, &unk_26EA48A80);
  }
  if (!byte_268920E20) {
    return 0;
  }
  if (qword_268920E18 != -1) {
    dispatch_once(&qword_268920E18, &unk_26EA48A60);
  }
  return byte_268920E11 == 0;
}

BOOL NanoCompassIsSameDay(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  id v9 = objc_msgSend_currentCalendar(v3, v6, v7, v8);
  uint64_t v11 = objc_msgSend_components_fromDate_(v9, v10, 28, (uint64_t)v5);

  uint64_t v13 = objc_msgSend_components_fromDate_(v9, v12, 28, (uint64_t)v4);

  uint64_t v17 = objc_msgSend_day(v11, v14, v15, v16);
  if (v17 == objc_msgSend_day(v13, v18, v19, v20)
    && (uint64_t v24 = objc_msgSend_month(v11, v21, v22, v23), v24 == objc_msgSend_month(v13, v25, v26, v27)))
  {
    uint64_t v31 = objc_msgSend_year(v11, v28, v29, v30);
    BOOL v35 = v31 == objc_msgSend_year(v13, v32, v33, v34);
  }
  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

double bearingBetweenCoordinatesInRadian(double a1, double a2, double a3, double a4)
{
  double v4 = a1 * 3.14159265 / 180.0;
  double v5 = a3 * 3.14159265 / 180.0;
  __double2 v6 = __sincos_stret(a4 * 3.14159265 / 180.0 - a2 * 3.14159265 / 180.0);
  __double2 v7 = __sincos_stret(v5);
  __double2 v8 = __sincos_stret(v4);
  double v9 = atan2(v7.__cosval * v6.__sinval, -(v8.__sinval * v7.__cosval) * v6.__cosval + v8.__cosval * v7.__sinval)
     * 180.0
     / 3.14159265;
  if (v9 < 0.0) {
    double v9 = v9 + 360.0;
  }
  return v9 * 3.14159265 / 180.0;
}

double bearingBetweenLocationsInDegree(void *a1, void *a2)
{
  return bearingBetweenLocationsInRadian(a1, a2) * 180.0 / 3.14159265;
}

double bearingBetweenLocationsInRadian(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_msgSend_coordinate(v4, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  objc_msgSend_coordinate(v3, v12, v13, v14);
  double v16 = v15;
  double v18 = v17;

  double v19 = bearingBetweenCoordinatesInRadian(v9, v11, v16, v18);
  objc_msgSend_magneticDeclination(v4, v20, v21, v22);

  return v19;
}

double bearingBetweenLocationsInRadianWithOptions(void *a1, void *a2)
{
  id v3 = a2;
  objc_msgSend_coordinate(a1, v4, v5, v6);
  double v8 = v7;
  double v10 = v9;
  objc_msgSend_coordinate(v3, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;

  return bearingBetweenCoordinatesInRadian(v8, v10, v15, v17);
}

double _roundWaypointDistanceTo(double a1, double a2)
{
  double result = 0.0;
  if (a1 >= 0.0) {
    return floor(a1 / a2 + 0.5) * a2;
  }
  return result;
}

id _formattedDistanceForWaypoint(void *a1, void *a2, int a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v13 = objc_msgSend_meters(MEMORY[0x263F08CE8], v10, v11, v12);
  double v16 = objc_msgSend_initWithDoubleValue_unit_(v9, v14, (uint64_t)v13, v15, a4);

  uint64_t v20 = objc_msgSend_shared(_TtC24NanoCompassComplications21UnitLengthPreferences, v17, v18, v19);
  int v24 = objc_msgSend_usesMetric(v20, v21, v22, v23);

  if (v24)
  {
    if (a4 >= 1000.0)
    {
      id v28 = v8;
      uint64_t v34 = objc_msgSend_kilometers(MEMORY[0x263F08CE8], v59, v60, v61);
      objc_msgSend_measurementByConvertingToUnit_(v16, v62, (uint64_t)v34, v63);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = v7;
      if (a3)
      {
        double v29 = 0.0;
        if (a4 >= 0.0) {
          double v29 = floor(a4 / 10.0 + 0.5) * 10.0;
        }
        id v30 = objc_alloc(MEMORY[0x263F08980]);
        uint64_t v34 = objc_msgSend_meters(MEMORY[0x263F08CE8], v31, v32, v33);
        id v37 = (id)objc_msgSend_initWithDoubleValue_unit_(v30, v35, (uint64_t)v34, v36, v29);
      }
      else
      {
        id v64 = objc_alloc(MEMORY[0x263F08980]);
        uint64_t v34 = objc_msgSend_meters(MEMORY[0x263F08CE8], v65, v66, v67);
        id v37 = (id)objc_msgSend_initWithDoubleValue_unit_(v64, v68, (uint64_t)v34, v69, a4);
      }
    }
    goto LABEL_15;
  }
  uint64_t v38 = objc_msgSend_miles(MEMORY[0x263F08CE8], v25, v26, v27);
  uint64_t v34 = objc_msgSend_measurementByConvertingToUnit_(v16, v39, (uint64_t)v38, v40);

  objc_msgSend_doubleValue(v34, v41, v42, v43);
  if (v44 >= 1.0)
  {
    id v28 = v8;
    id v37 = v34;
    uint64_t v34 = v37;
LABEL_15:
    v70 = v37;
    goto LABEL_18;
  }
  id v28 = v7;
  objc_msgSend_doubleValue(v34, v45, v46, v47);
  double v49 = v48 * 5280.0;
  if (a3)
  {
    double v50 = 0.0;
    if (v49 >= 0.0) {
      double v50 = floor(v49 / 50.0 + 0.5) * 50.0;
    }
    id v51 = objc_alloc(MEMORY[0x263F08980]);
    uint64_t v55 = objc_msgSend_feet(MEMORY[0x263F08CE8], v52, v53, v54);
    uint64_t v58 = objc_msgSend_initWithDoubleValue_unit_(v51, v56, (uint64_t)v55, v57, v50);
  }
  else
  {
    id v71 = objc_alloc(MEMORY[0x263F08980]);
    uint64_t v55 = objc_msgSend_feet(MEMORY[0x263F08CE8], v72, v73, v74);
    uint64_t v58 = objc_msgSend_initWithDoubleValue_unit_(v71, v75, (uint64_t)v55, v76, v49);
  }
  v70 = (void *)v58;

LABEL_18:
  v79 = objc_msgSend_stringFromMeasurement_(v28, v77, (uint64_t)v70, v78);

  return v79;
}

id formattedDistanceForWaypointComplication(double a1)
{
  uint64_t v2 = sub_2375AB118();
  id v3 = sub_2375AB16C();
  id v4 = _formattedDistanceForWaypoint(v2, v3, 1, a1);

  id v8 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v5, v6, v7);
  uint64_t v12 = objc_msgSend_countryCode(v8, v9, v10, v11);

  if (objc_msgSend_isEqualToString_(v12, v13, @"US", v14))
  {
    double v17 = objc_msgSend_componentsSeparatedByString_(v4, v15, @" ", v16);
    if (objc_msgSend_count(v17, v18, v19, v20) == 2)
    {
      uint64_t v23 = objc_msgSend_componentsJoinedByString_(v17, v21, (uint64_t)&stru_26EA49580, v22);

      id v4 = (void *)v23;
    }
  }

  return v4;
}

id sub_2375AB118()
{
  if (qword_268920E48 != -1) {
    dispatch_once(&qword_268920E48, &unk_26EA48AC0);
  }
  uint64_t v0 = (void *)qword_268920E40;

  return v0;
}

id sub_2375AB16C()
{
  if (qword_268920E58 != -1) {
    dispatch_once(&qword_268920E58, &unk_26EA48AE0);
  }
  uint64_t v0 = (void *)qword_268920E50;

  return v0;
}

id formattedDistanceForWaypoint(int a1, double a2)
{
  if (a1)
  {
    if (qword_268920E68 != -1) {
      dispatch_once(&qword_268920E68, &unk_26EA48B00);
    }
    uint64_t v3 = qword_268920E78;
    id v4 = (id)qword_268920E60;
    if (v3 != -1) {
      dispatch_once(&qword_268920E78, &unk_26EA48B20);
    }
    uint64_t v5 = _formattedDistanceForWaypoint(v4, (void *)qword_268920E70, 0, a2);
  }
  else
  {
    sub_2375AB118();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = sub_2375AB16C();
    uint64_t v5 = _formattedDistanceForWaypoint(v4, v6, 0, a2);
  }

  return v5;
}

id convertWaypointArrayToDict(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF9A0];
  id v2 = a1;
  uint64_t v5 = objc_msgSend_valueForKey_(v2, v3, @"uuid", v4);
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_(v1, v6, (uint64_t)v2, (uint64_t)v5);

  return v7;
}

uint64_t sub_2375AB344()
{
  uint64_t v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  uint64_t v4 = objc_msgSend_bundleForClass_(v0, v2, v1, v3);
  uint64_t v5 = qword_268920E30;
  qword_268920E30 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

void sub_2375AB3A0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_268920E40;
  qword_268920E40 = v0;

  objc_msgSend_setUnitOptions_((void *)qword_268920E40, v2, 1, v3);
  uint64_t v7 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x263EFF960], v4, v5, v6);
  objc_msgSend_setLocale_((void *)qword_268920E40, v8, (uint64_t)v7, v9);

  objc_msgSend_setUnitStyle_((void *)qword_268920E40, v10, 2, v11);
  objc_msgSend_numberFormatter((void *)qword_268920E40, v12, v13, v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumFractionDigits_(v17, v15, 0, v16);
}

void sub_2375AB448()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_268920E50;
  qword_268920E50 = v0;

  objc_msgSend_setUnitOptions_((void *)qword_268920E50, v2, 1, v3);
  uint64_t v7 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x263EFF960], v4, v5, v6);
  objc_msgSend_setLocale_((void *)qword_268920E50, v8, (uint64_t)v7, v9);

  objc_msgSend_setUnitStyle_((void *)qword_268920E50, v10, 2, v11);
  objc_msgSend_numberFormatter((void *)qword_268920E50, v12, v13, v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumFractionDigits_(v17, v15, 1, v16);
}

void sub_2375AB4F0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_268920E60;
  qword_268920E60 = v0;

  objc_msgSend_setUnitOptions_((void *)qword_268920E60, v2, 1, v3);
  uint64_t v7 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x263EFF960], v4, v5, v6);
  objc_msgSend_setLocale_((void *)qword_268920E60, v8, (uint64_t)v7, v9);

  objc_msgSend_setUnitStyle_((void *)qword_268920E60, v10, 3, v11);
  objc_msgSend_numberFormatter((void *)qword_268920E60, v12, v13, v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumFractionDigits_(v17, v15, 0, v16);
}

void sub_2375AB598()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_268920E70;
  qword_268920E70 = v0;

  objc_msgSend_setUnitOptions_((void *)qword_268920E70, v2, 1, v3);
  uint64_t v7 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x263EFF960], v4, v5, v6);
  objc_msgSend_setLocale_((void *)qword_268920E70, v8, (uint64_t)v7, v9);

  objc_msgSend_setUnitStyle_((void *)qword_268920E70, v10, 3, v11);
  objc_msgSend_numberFormatter((void *)qword_268920E70, v12, v13, v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumFractionDigits_(v17, v15, 1, v16);
}

void *sub_2375AB640(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    return objc_msgSend_addObject_(a1, a2, a3, a4);
  }
  return a1;
}

void sub_2375AB8E4(uint64_t a1, const char *a2)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 2);
  int v24 = &unk_26EA53770;
  v25[0] = &unk_26EA532A8;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v3, (uint64_t)v25, (uint64_t)&v24, 1);
  objc_msgSend_scaledValue_withOverrides_(v2, v5, (uint64_t)v4, v6, 8.0);
  *(void *)&xmmword_268920E80 = v7;

  objc_msgSend_scaledValue_(v2, v8, v9, v10, 1.0);
  *((void *)&xmmword_268920E80 + 1) = v11;
  objc_msgSend_scaledValue_(v2, v12, v13, v14, 22.0);
  qword_268920E90 = v15;
  *(_OWORD *)algn_268920E98 = xmmword_2375DDF80;
  *(long long *)((char *)&xmmword_268920EA0 + 8) = xmmword_2375DDF90;
  objc_msgSend_scaledValue_(v2, v16, v17, v18, 2.25);
  qword_268920EB8 = v19;
  objc_msgSend_scaledValue_(v2, v20, v21, v22, 0.5);
  qword_268920EC0 = v23;
}

uint64_t sub_2375ABB80()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)qword_268920EE0;
  qword_268920EE0 = (uint64_t)v0;

  uint64_t v3 = qword_268920EE0;

  return MEMORY[0x270F9A6D0](v3, sel_setDateFormat_, @"YYYYMMdd-HHmmss", v2);
}

void sub_2375AC464(uint64_t a1, const char *a2)
{
  objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scaledValue_(v6, v2, v3, v4, 3.0);
  qword_268920EF0 = v5;
}

void sub_2375AC67C(uint64_t a1, const char *a2)
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 2);
  uint64_t v27 = &unk_26EA53788;
  v28[0] = &unk_26EA53368;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v3, (uint64_t)v28, (uint64_t)&v27, 1);
  objc_msgSend_scaledValue_withOverrides_(v2, v5, (uint64_t)v4, v6, 17.0);
  *(void *)&xmmword_268920F10 = v7;

  objc_msgSend_scaledValue_(v2, v8, v9, v10, 1.0);
  *((void *)&xmmword_268920F10 + 1) = v11;
  v25[0] = &unk_26EA537A0;
  v25[1] = &unk_26EA53788;
  void v25[2] = &unk_26EA537B8;
  v25[3] = &unk_26EA537D0;
  v26[2] = &unk_26EA53398;
  v26[3] = &unk_26EA533A8;
  v26[0] = &unk_26EA53378;
  v26[1] = &unk_26EA53388;
  v25[4] = &unk_26EA537E8;
  v25[5] = &unk_26EA53800;
  v26[4] = &unk_26EA53388;
  v26[5] = &unk_26EA53398;
  uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v26, (uint64_t)v25, 6);
  objc_msgSend_scaledValue_withOverrides_(v2, v14, (uint64_t)v13, v15, 41.0);
  qword_268920F20 = v16;

  *(_OWORD *)algn_268920F28 = xmmword_2375DDFB0;
  *(long long *)((char *)&xmmword_268920F30 + 8) = xmmword_2375DDFC0;
  objc_msgSend_scaledValue_(v2, v17, v18, v19, 5.0);
  qword_268920F48 = v20;
  objc_msgSend_scaledValue_(v2, v21, v22, v23, 1.2);
  qword_268920F50 = v24;
}

uint64_t sub_2375AC834(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_addSubview_(*(void **)(*(void *)(a1 + 32) + 448), a2, a3, a4);
}

uint64_t sub_2375AC848(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_addSubview_(*(void **)(*(void *)(a1 + 32) + 448), a2, a3, a4);
}

void sub_2375AC85C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 448);
  id v4 = a3;
  objc_msgSend_layer(v3, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSublayer_(v10, v8, (uint64_t)v4, v9);
}

void sub_2375AC8C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 448);
  id v4 = a3;
  objc_msgSend_layer(v3, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSublayer_(v10, v8, (uint64_t)v4, v9);
}

uint64_t sub_2375ACDE4(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  return objc_msgSend_setHidden_(a3, a2, *(unsigned __int8 *)(a1 + 32), a4);
}

uint64_t sub_2375ACDF4(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  return objc_msgSend_setHidden_(a3, a2, *(unsigned __int8 *)(a1 + 32), a4);
}

void sub_2375ACE04(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v14 = a3;
  uint64_t v8 = objc_msgSend_unsignedIntegerValue(a2, v5, v6, v7);
  uint64_t v11 = objc_msgSend_containsIndex_(v4, v9, v8, v10);
  objc_msgSend_setHidden_(v14, v12, v11, v13);
}

void sub_2375ACE6C(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v14 = a3;
  uint64_t v8 = objc_msgSend_unsignedIntegerValue(a2, v5, v6, v7);
  int v11 = objc_msgSend_containsIndex_(v4, v9, v8, v10);
  objc_msgSend_setHidden_(v14, v12, v11 ^ 1u, v13);
}

void sub_2375ACF28()
{
  id v30 = objc_alloc_init(MEMORY[0x263F81678]);
  uint64_t v3 = objc_msgSend_configurationWithPointSize_(MEMORY[0x263F1C6C8], v0, v1, v2, 11.0);
  uint64_t v5 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v4, @"location.north.fill", (uint64_t)v3);
  uint64_t v6 = NanoCompassAppTintColor();
  uint64_t v8 = objc_msgSend_imageWithTintColor_renderingMode_(v5, v7, (uint64_t)v6, 1);
  objc_msgSend_setImage_(v30, v9, (uint64_t)v8, v10);

  uint64_t v13 = objc_msgSend_attributedStringWithAttachment_(MEMORY[0x263F086A0], v11, (uint64_t)v30, v12);
  id v14 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v17 = objc_msgSend_initWithAttributedString_(v14, v15, (uint64_t)v13, v16);
  uint64_t v18 = (void *)qword_268920F70;
  qword_268920F70 = v17;

  uint64_t v19 = NanoCompassLocalizedString(@"COMPASS_COMPLICATION_TITLE");
  id v20 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v24 = objc_msgSend_localizedUppercaseString(v19, v21, v22, v23);
  uint64_t v27 = objc_msgSend_initWithString_(v20, v25, (uint64_t)v24, v26);

  objc_msgSend_appendAttributedString_((void *)qword_268920F70, v28, (uint64_t)v27, v29);
}

double sub_2375AD098(uint64_t a1, unint64_t a2)
{
  double v2 = (double)a2 - *(double *)(*(void *)(a1 + 32) + 488);
  if (v2 < -180.0) {
    double v2 = v2 + 360.0;
  }
  if (v2 > 180.0) {
    double v2 = v2 + -360.0;
  }
  return *(double *)(a1 + 40) + v2 * *(double *)(a1 + 48);
}

void sub_2375AD708(uint64_t a1, void *a2)
{
  id v45 = a2;
  uint64_t v6 = objc_msgSend_layer(v45, v3, v4, v5);
  uint64_t v10 = objc_msgSend_actions(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"filters", v12);
  uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);

  if (v13 != v17)
  {
    uint64_t v21 = objc_msgSend_layer(v45, v18, v19, v20);
    uint64_t v25 = objc_msgSend_actions(v21, v22, v23, v24);
    uint64_t v29 = objc_msgSend_mutableCopy(v25, v26, v27, v28);

    uint64_t v33 = objc_msgSend_null(MEMORY[0x263EFF9D0], v30, v31, v32);
    objc_msgSend_setObject_forKeyedSubscript_(v29, v34, (uint64_t)v33, @"filters");

    uint64_t v38 = objc_msgSend_layer(v45, v35, v36, v37);
    objc_msgSend_setActions_(v38, v39, (uint64_t)v29, v40);
  }
  uint64_t v41 = *(void *)(a1 + 32);
  uint64_t v42 = objc_msgSend_layer(v45, v18, v19, v20);
  objc_msgSend_setFilters_(v42, v43, v41, v44);
}

void sub_2375AD8DC(uint64_t a1, void *a2)
{
  id v29 = a2;
  uint64_t v6 = objc_msgSend_actions(v29, v3, v4, v5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"filters", v8);
  uint64_t v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11, v12);

  if (v9 != v13)
  {
    uint64_t v17 = objc_msgSend_actions(v29, v14, v15, v16);
    uint64_t v21 = objc_msgSend_mutableCopy(v17, v18, v19, v20);

    uint64_t v25 = objc_msgSend_null(MEMORY[0x263EFF9D0], v22, v23, v24);
    objc_msgSend_setObject_forKeyedSubscript_(v21, v26, (uint64_t)v25, @"filters");

    objc_msgSend_setActions_(v29, v27, (uint64_t)v21, v28);
  }
  objc_msgSend_setFilters_(v29, v14, *(void *)(a1 + 32), v16);
}

void sub_2375ADDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_2375A1EA0((uint64_t)va);
  _Unwind_Resume(a1);
}

id sub_2375ADDC4(uint64_t a1, const char *a2)
{
  double v2 = objc_msgSend__newLabelWithFont_color_text_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), a2);

  return v2;
}

id sub_2375ADDFC(uint64_t a1, const char *a2)
{
  double v2 = objc_msgSend__newLabelWithFont_color_text_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), a2);

  return v2;
}

void sub_2375AE0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_2375A1EA0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2375AE150(uint64_t a1, void *a2)
{
  v74[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_msgSend_screenScale(v2, v3, v4, v5);
  uint64_t v68 = v6;
  uint64_t v7 = (void *)MEMORY[0x263EFD188];
  uint64_t v11 = objc_msgSend_sizeClass(v2, v8, v9, v10);
  uint64_t v13 = objc_msgSend_metricsWithDevice_identitySizeClass_(v7, v12, (uint64_t)v2, v11);

  uint64_t v73 = &unk_26EA538D8;
  v74[0] = &unk_26EA533B8;
  uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v74, (uint64_t)&v73, 1);
  objc_msgSend_scaledValue_withOverrides_(v13, v16, (uint64_t)v15, v17, 13.0);
  qword_268920F80 = v18;

  qword_268920F88 = *MEMORY[0x263F81840];
  uint64_t v19 = qword_268920F88;
  uint64_t v20 = (id *)MEMORY[0x263EFCF58];
  objc_storeStrong(qword_268920F90, (id)*MEMORY[0x263EFCF58]);
  float64x2_t v67 = (float64x2_t)vdupq_lane_s64(v68, 0);
  *(float64x2_t *)&qword_268920F90[1] = vdivq_f64((float64x2_t)xmmword_2375DE000, v67);
  uint64_t v21 = NanoCompassAppTintColor();
  uint64_t v22 = (void *)qword_268920FA8;
  qword_268920FA8 = v21;

  uint64_t v26 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v23, v24, v25);
  uint64_t v27 = (void *)qword_268920FB0;
  qword_268920FB0 = v26;

  uint64_t v28 = NanoCompassBearingTintColor();
  id v29 = (void *)qword_268920FB8;
  qword_268920FB8 = v28;

  qword_268920FC0 = 0x4062C00000000000;
  *(double *)&qword_268920FC8 = 20.0 / *(double *)&v68;
  unk_268920FD0 = v19;
  objc_storeStrong(&qword_268920FD8, *v20);
  double v71 = 0.0;
  double v72 = 0.0;
  double v69 = 1.0;
  double v70 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_((void *)qword_268920FA8, v30, (uint64_t)&v72, (uint64_t)&v71, &v70, &v69);
  double v69 = v69 * 0.8;
  uint64_t v34 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v31, v32, v33, v69 * v72, v69 * v71, v69 * v70, 1.0);
  BOOL v35 = (void *)qword_268920FE0;
  qword_268920FE0 = v34;

  *(double *)&qword_268920FE8 = 52.0 / *(double *)&v68;
  objc_msgSend_scaledValue_(v13, v36, v37, v38, 0.75);
  qword_268920FF0 = v39;
  objc_msgSend_scaledValue_(v13, v40, v41, v42, 10.0);
  qword_268920FF8 = v43;
  objc_msgSend_scaledValue_(v13, v44, v45, v46, 15.0);
  qword_268921000 = v47;
  objc_msgSend_scaledValue_(v13, v48, v49, v50, 17.5);
  qword_268921008 = v51;
  uint64_t v55 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v52, v53, v54);
  uint64_t v56 = (void *)qword_268921010;
  qword_268921010 = v55;

  *(double *)&qword_268921018 = 37.0 / *(double *)&v68;
  uint64_t v60 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v57, v58, v59, 1.0, 0.160784314, 0.101960784, 1.0);
  uint64_t v61 = (void *)qword_268921020;
  qword_268921020 = v60;

  uint64_t v65 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v62, v63, v64);
  uint64_t v66 = (void *)qword_268921028;
  qword_268921028 = v65;

  *(double *)&qword_268921030 = 18.0 / *(double *)&v68;
  unk_268921038 = *(double *)&qword_268921018 + -3.0 / *(double *)&v68;
  xmmword_268921040 = (__int128)vdivq_f64((float64x2_t)xmmword_2375DE010, v67);
  *(double *)&qword_268921050 = 4.0 / *(double *)&v68;
}

__n128 sub_2375AE464(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(id *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(id *)(a2 + 40);
  *(void *)(a1 + 48) = *(id *)(a2 + 48);
  *(void *)(a1 + 56) = *(id *)(a2 + 56);
  uint64_t v4 = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = *(id *)(a2 + 88);
  *(void *)(a1 + 96) = *(id *)(a2 + 96);
  uint64_t v5 = *(void *)(a2 + 136);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v6;
  *(void *)(a1 + 136) = v5;
  *(void *)(a1 + 144) = *(id *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(id *)(a2 + 160);
  *(void *)(a1 + 168) = *(id *)(a2 + 168);
  uint64_t v7 = *(void *)(a2 + 208);
  __n128 result = *(__n128 *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(__n128 *)(a1 + 192) = result;
  *(void *)(a1 + 208) = v7;
  return result;
}

BOOL sub_2375AE654(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a1 - a4;
  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  if (v7 > 0.0001) {
    return 1;
  }
  double v8 = a2 - a5;
  if (v8 < 0.0) {
    double v8 = -v8;
  }
  if (v8 > 0.0001) {
    return 1;
  }
  double v9 = a3 - a6;
  double v10 = -(a3 - a6);
  if (v9 < 0.0) {
    double v9 = v10;
  }
  return v9 > 0.0001;
}

uint64_t sub_2375AEA3C()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_268921070;
  qword_268921070 = v0;

  objc_msgSend_setHasReading_((void *)qword_268921070, v2, 1, v3);
  double v7 = (void *)qword_268921070;

  return objc_msgSend_setGravity_(v7, v4, v5, v6, 0.0, 0.0, 1.0);
}

void sub_2375AF2CC(uint64_t a1, const char *a2)
{
  void v25[2] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 2);
  v24[0] = &unk_26EA538F0;
  v24[1] = &unk_26EA53908;
  v25[0] = &unk_26EA53518;
  v25[1] = &unk_26EA53528;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v3, (uint64_t)v25, (uint64_t)v24, 2);
  objc_msgSend_scaledValue_withOverrides_(v2, v5, (uint64_t)v4, v6, 48.0);
  *(void *)&xmmword_268921080 = v7;

  objc_msgSend_scaledValue_(v2, v8, v9, v10, 2.0);
  *((void *)&xmmword_268921080 + 1) = v11;
  objc_msgSend_scaledValue_(v2, v12, v13, v14, 120.0);
  qword_268921090 = v15;
  *(_OWORD *)algn_268921098 = xmmword_2375DE060;
  *(long long *)((char *)&xmmword_2689210A0 + 8) = xmmword_2375DE070;
  objc_msgSend_scaledValue_(v2, v16, v17, v18, 14.0);
  qword_2689210B8 = v19;
  objc_msgSend_scaledValue_(v2, v20, v21, v22, 2.0);
  qword_2689210C0 = v23;
}

BOOL NanoCompassLevelComplicationConsideredLevel(void *a1, char a2)
{
  id v3 = a1;
  uint64_t v7 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v5, v6);
  char isEqual = objc_msgSend_isEqual_(v3, v8, (uint64_t)v7, v9);

  BOOL v14 = 0;
  if (v3)
  {
    if ((isEqual & 1) == 0)
    {
      BOOL v14 = 0;
      if (objc_msgSend_hasReading(v3, v11, v12, v13))
      {
        if ((a2 & 1) == 0)
        {
          if (objc_msgSend_orientation(v3, v15, v16, v17) == 1)
          {
            objc_msgSend_horizontalOffset(v3, v18, v19, v20);
            BOOL v14 = sqrt(v21 * v21 + v22 * v22) < 0.100000001;
          }
          else
          {
            BOOL v14 = 0;
          }
        }
      }
    }
  }

  return v14;
}

void sub_2375AFC64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_systemImageNamed_(MEMORY[0x263F1C6B0], a2, @"mountain.2.fill", a4);
  double v8 = objc_msgSend_systemGrayColor(MEMORY[0x263F1C550], v5, v6, v7);
  objc_msgSend_imageWithTintColor_(v4, v9, (uint64_t)v8, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = objc_alloc(MEMORY[0x263EFD1A8]);
  uint64_t v14 = objc_msgSend_initWithFullColorImage_(v11, v12, (uint64_t)v16, v13);
  uint64_t v15 = (void *)qword_2689210E0;
  qword_2689210E0 = v14;
}

id NanoCompassComplicationImageNamed(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v2 = qword_268921128;
  id v4 = a1;
  if (v2 != -1) {
    dispatch_once(&qword_268921128, &unk_26EA48C00);
  }
  uint64_t v5 = objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(v1, v3, (uint64_t)v4, qword_268921120, 0);

  return v5;
}

id NanoCompassComplicationHeadingDirectionBearingTextProvider(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x263EFD208];
  uint64_t v6 = NanoCompassFormattedHeading(v3, 0, 0);
  uint64_t v9 = objc_msgSend_textProviderWithText_(v5, v7, (uint64_t)v6, v8);

  uint64_t v10 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_(v9, v11, (uint64_t)v10, v12);

  uint64_t v13 = (void *)MEMORY[0x263EFD208];
  uint64_t v14 = NanoCompassFormattedHeadingDirection(v3);
  uint64_t v17 = objc_msgSend_textProviderWithText_(v13, v15, (uint64_t)v14, v16);

  if (v4 && objc_msgSend_isAccurate(v3, v18, v19, v20))
  {
    double v21 = (void *)MEMORY[0x263EFD208];
    double v22 = NanoCompassFormattedBearing(v4, 0);
    uint64_t v25 = objc_msgSend_textProviderWithText_(v21, v23, (uint64_t)v22, v24);

    uint64_t v26 = NanoCompassBearingTintColor();
    objc_msgSend_setTintColor_(v25, v27, (uint64_t)v26, v28);

    id v29 = NanoCompassLocalizedString(@"HEADING_DIRECTION_BEARING_COMBINER");
    uint64_t v32 = objc_msgSend_textProviderWithFormat_(MEMORY[0x263EFD218], v30, (uint64_t)v29, v31, v9, v17, v25);
  }
  else
  {
    id v29 = NanoCompassLocalizedString(@"HEADING_DIRECTION_COMBINER");
    uint64_t v32 = objc_msgSend_textProviderWithFormat_(MEMORY[0x263EFD218], v33, (uint64_t)v29, v34, v9, v17);
  }

  return v32;
}

id NanoCompassComplicationAltitudeSmallCapsTextProvider(void *a1, void *a2, int a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v9 = a2;
  if (v5 && objc_msgSend_hasReading(v5, v6, v7, v8))
  {
    unsigned __int8 v48 = 0;
    if (a3)
    {
      uint64_t v13 = NanoCompassGetAltitudeAbbreviationWithTargetLength(v5, 5, &v48);
      uint64_t v14 = NCLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v48) {
          uint64_t v15 = @"YES";
        }
        else {
          uint64_t v15 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v15;
        _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "metric unit should be abbreviated: %@", buf, 0xCu);
      }
    }
    else
    {
      double v21 = NSNumber;
      objc_msgSend_altitude(v5, v10, v11, v12);
      uint64_t v14 = objc_msgSend_numberWithDouble_(v21, v22, v23, v24);
      char v28 = objc_msgSend_displayTilde(v5, v25, v26, v27);
      uint64_t v13 = NanoCompassValueWithFormat(v14, v9, v28);
    }

    uint64_t v31 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v29, (uint64_t)v13, v30);
    uint64_t v32 = (void *)MEMORY[0x263EFD208];
    uint64_t v36 = NanoCompassFormattedAltitudeUnitsInAbbr(v48, v33, v34, v35);
    uint64_t v39 = objc_msgSend_textProviderWithText_(v32, v37, (uint64_t)v36, v38);

    objc_msgSend_setUseLowercaseSmallCaps_(v39, v40, 1, v41);
    objc_msgSend_setIgnoreUppercaseStyle_(v39, v42, 1, v43);
    uint64_t v44 = NanoCompassLocalizedString(@"ALTITUDE_COMBINING_FORMAT");
    uint64_t v20 = objc_msgSend_textProviderWithFormat_(MEMORY[0x263EFD218], v45, (uint64_t)v44, v46, v31, v39);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263EFD208];
    uint64_t v17 = NanoCompassFormattedUncalibrated();
    uint64_t v20 = objc_msgSend_textProviderWithText_(v16, v18, (uint64_t)v17, v19);
  }

  return v20;
}

id NanoCompassComplicationAltitudeAccuracySmallCapsTextProvider(void *a1, void *a2)
{
  id v3 = a1;
  id v7 = a2;
  if (v3 && objc_msgSend_hasReading(v3, v4, v5, v6))
  {
    uint64_t v11 = objc_msgSend_absoluteAltitudeAccuracy(v3, v8, v9, v10);
    uint64_t v12 = NanoCompassValueWithFormat(v11, v7, 0);

    uint64_t v15 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v13, (uint64_t)v12, v14);
    uint64_t v16 = (void *)MEMORY[0x263EFD208];
    uint64_t v20 = NanoCompassFormattedAltitudeUnits((uint64_t)v15, v17, v18, v19);
    uint64_t v23 = objc_msgSend_textProviderWithText_(v16, v21, (uint64_t)v20, v22);

    objc_msgSend_setUseLowercaseSmallCaps_(v23, v24, 1, v25);
    objc_msgSend_setIgnoreUppercaseStyle_(v23, v26, 1, v27);
    char v28 = NanoCompassLocalizedString(@"ALTITUDE_INACCURATE_ACCURACY_FORMAT");
    uint64_t v31 = objc_msgSend_textProviderWithFormat_(MEMORY[0x263EFD218], v29, (uint64_t)v28, v30, v15, v23);
  }
  else
  {
    uint64_t v32 = (void *)MEMORY[0x263EFD208];
    uint64_t v12 = NanoCompassFormattedUncalibrated();
    uint64_t v31 = objc_msgSend_textProviderWithText_(v32, v33, (uint64_t)v12, v34);
  }

  return v31;
}

id NanoCompassWaypointCornerAndBezelComplicationTextProvider(void *a1, uint64_t a2, void *a3, int a4, char a5, int a6, int a7)
{
  id v12 = a1;
  id v13 = a3;
  uint64_t v17 = NanoCompassLocalizedString(@"WAYPOINT_CORNER_OR_BEZEL_COMPLICATION_NO_DISTANCE");
  if (v13 && v12 && (a5 & 1) == 0 && (a4 & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_rawLocation(v12, v14, v15, v16);
    uint64_t v22 = objc_msgSend_location(v13, v19, v20, v21);
    objc_msgSend_distanceFromLocation_(v18, v23, (uint64_t)v22, v24);
    double v26 = v25;

    uint64_t v27 = formattedDistanceForWaypointComplication(v26);

    uint64_t v17 = (void *)v27;
  }
  char v28 = NanoCompassLocalizedString(@"WAYPOINT_CORNER_OR_BEZEL_COMPLICATION_NO_DATA");
  id v29 = (void *)MEMORY[0x263EFD208];
  uint64_t v33 = objc_msgSend_label(v13, v30, v31, v32);
  uint64_t v36 = objc_msgSend_textProviderWithText_(v29, v34, (uint64_t)v33, v35);

  if (v13)
  {
    if (a4) {
      objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v37, (uint64_t)v28, v38);
    }
    else {
    uint64_t v39 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v37, (uint64_t)v17, v38);
    }
    uint64_t v40 = NanoCompassWaypointDefaultColor();
    objc_msgSend_setTintColor_(v39, v41, (uint64_t)v40, v42);

    if (v12 && a2 && !a4)
    {
      uint64_t v46 = objc_msgSend_labelColor(v13, v43, v44, v45);
    }
    else
    {
      uint64_t v46 = NanoCompassWaypointDefaultColor();
    }
    uint64_t v50 = (void *)v46;
    objc_msgSend_setTintColor_(v36, v47, v46, v48);

    uint64_t v51 = NanoCompassLocalizedString(@"WAYPOINT_CORNER_OR_BEZEL_COMPLICATION_TEXT_COMBINER");
    uint64_t v54 = objc_msgSend_textProviderWithFormat_(MEMORY[0x263EFD218], v52, (uint64_t)v51, v53, v39, v36);
    goto LABEL_21;
  }
  if (a6)
  {
    uint64_t v49 = @"WAYPOINT_CORNER_OR_BEZEL_COMPLICATION_NO_DATA";
LABEL_20:
    uint64_t v39 = NanoCompassLocalizedString(v49);
    uint64_t v54 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v55, (uint64_t)v39, v56);
    uint64_t v51 = NanoCompassWaypointDefaultColor();
    objc_msgSend_setTintColor_(v54, v57, (uint64_t)v51, v58);
LABEL_21:

    goto LABEL_22;
  }
  if (a7)
  {
    uint64_t v49 = @"WAYPOINT_COMPLICATION_SMART_WAYPOINT_NAME";
    goto LABEL_20;
  }
  uint64_t v54 = 0;
LABEL_22:

  return v54;
}

id NanoCompassSampleWaypointCornerComplicationTextProvider(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = formattedDistanceForWaypointComplication(805.0);
  uint64_t v8 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v6, (uint64_t)v5, v7);
  uint64_t v9 = NanoCompassWaypointDefaultColor();
  objc_msgSend_setTintColor_(v8, v10, (uint64_t)v9, v11);

  uint64_t v14 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v12, (uint64_t)v4, v13);

  objc_msgSend_setTintColor_(v14, v15, (uint64_t)v3, v16);
  uint64_t v17 = NanoCompassLocalizedString(@"WAYPOINT_CORNER_OR_BEZEL_COMPLICATION_TEXT_COMBINER");
  uint64_t v20 = objc_msgSend_textProviderWithFormat_(MEMORY[0x263EFD218], v18, (uint64_t)v17, v19, v8, v14);

  return v20;
}

uint64_t NanoCompassComplicationLayoutIsRTL()
{
  if (qword_2689210F8 != -1) {
    dispatch_once(&qword_2689210F8, &unk_26EA48BC0);
  }
  return byte_2689210F0;
}

void sub_2375B13D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4 = objc_msgSend_keyWindow(MEMORY[0x263F1CBC8], a2, a3, a4);
  id v22 = v4;
  if (v4)
  {
    BOOL v8 = objc_msgSend_effectiveUserInterfaceLayoutDirection(v4, v5, v6, v7) == 1;
    uint64_t v9 = v22;
    char v10 = v8;
    byte_2689210F0 = v10;
  }
  else
  {
    uint64_t v11 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v5, v6, v7);
    uint64_t v15 = v11;
    if (v11)
    {
      byte_2689210F0 = objc_msgSend_userInterfaceLayoutDirection(v11, v12, v13, v14) != 0;
    }
    else
    {
      uint64_t v16 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v12, v13, v14);
      uint64_t v19 = objc_msgSend_objectForKey_(v16, v17, *MEMORY[0x263EFF508], v18);

      byte_2689210F0 = objc_msgSend_characterDirectionForLanguage_(MEMORY[0x263EFF960], v20, (uint64_t)v19, v21) == 2;
    }

    uint64_t v9 = 0;
  }
}

id NanoCompassRedactionLabel()
{
  if (qword_268921108 != -1) {
    dispatch_once(&qword_268921108, &unk_26EA48BE0);
  }
  uint64_t v0 = (void *)qword_268921100;

  return v0;
}

void sub_2375B1520()
{
  id v0 = objc_alloc(MEMORY[0x263EFD210]);
  id v16 = (id)objc_msgSend_initWithSystemName_(v0, v1, @"location.north.fill", v2);
  uint64_t v6 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v3, v4, v5);
  objc_msgSend_setTintColor_(v16, v7, (uint64_t)v6, v8);

  uint64_t v9 = NanoCompassLocalizedString(@"COMPASS_COMPLICATION_TITLE");
  id v12 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v10, (uint64_t)v9, v11);
  uint64_t v14 = objc_msgSend_templateWithTextProvider_imageProvider_(MEMORY[0x263EFD148], v13, (uint64_t)v12, (uint64_t)v16);
  uint64_t v15 = (void *)qword_268921100;
  qword_268921100 = v14;
}

id AltitudeRedactionTextProvider(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375B16B8;
  block[3] = &unk_264CD5570;
  id v7 = v1;
  uint64_t v2 = qword_268921118;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&qword_268921118, block);
  }
  id v4 = (id)qword_268921110;

  return v4;
}

void sub_2375B16B8(uint64_t a1)
{
  NanoCompassLocalizedString(@"ALTITUDE_ELEVATION_TEXT");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)MEMORY[0x263EFD208];
  uint64_t v6 = objc_msgSend_localizedUppercaseString(v13, v3, v4, v5);
  uint64_t v9 = objc_msgSend_textProviderWithText_(v2, v7, (uint64_t)v6, v8);
  char v10 = (void *)qword_268921110;
  qword_268921110 = v9;

  objc_msgSend_setTintColor_((void *)qword_268921110, v11, *(void *)(a1 + 32), v12);
}

uint64_t sub_2375B175C()
{
  id v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  uint64_t v4 = objc_msgSend_bundleForClass_(v0, v2, v1, v3);
  uint64_t v5 = qword_268921120;
  qword_268921120 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

void sub_2375B18F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2375B20C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend_layer(a2, (const char *)a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFilters_(v7, v5, v4, v6);
}

uint64_t sub_2375B2224()
{
  id v0 = [NCManager alloc];
  uint64_t v3 = objc_msgSend_init_(v0, v1, 0, v2);
  uint64_t v4 = qword_268921130;
  qword_268921130 = v3;

  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t sub_2375B2268()
{
  id v0 = [NCManager alloc];
  uint64_t v3 = objc_msgSend_init_(v0, v1, 1, v2);
  uint64_t v4 = qword_268921140;
  qword_268921140 = v3;

  return MEMORY[0x270F9A758](v3, v4);
}

void sub_2375B2698(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  objc_msgSend_altitude(*(void **)(a1 + 32), a2, a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

void sub_2375B2D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2375B2D4C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 32) + 40), a2, (uint64_t)a2, a4);
  if ((result & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

void sub_2375B2EAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2375B2ED4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9) {
      objc_msgSend__queue_altimeterUpdate_(*(void **)(a1 + 32), v6, (uint64_t)v9, v7);
    }
    if (v5) {
      objc_msgSend__queue_altimeterError_(*(void **)(a1 + 32), v6, (uint64_t)v5, v7);
    }
  }
}

uint64_t sub_2375B3120(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2375B3194;
  v7[3] = &unk_264CD5940;
  v7[4] = v4;
  return objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, a2, (uint64_t)v7, a4);
}

void sub_2375B3194(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend_altitude(v4, v6, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))a3)[2](v5, v9);
}

void sub_2375B34F4()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  id v5 = (id)objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.compass", v2);
  byte_268921160 = objc_msgSend_BOOLForKey_(v5, v3, @"ShowsElevationAccuracy", v4);
}

void sub_2375B3D74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2375B3D90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2375B3F80(uint64_t a1, const char *a2)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 2);
  uint64_t v24 = &unk_26EA53920;
  v25[0] = &unk_26EA535E8;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v3, (uint64_t)v25, (uint64_t)&v24, 1);
  objc_msgSend_scaledValue_withOverrides_(v2, v5, (uint64_t)v4, v6, 17.0);
  *(void *)&xmmword_268921170 = v7;

  objc_msgSend_scaledValue_(v2, v8, v9, v10, 1.0);
  *((void *)&xmmword_268921170 + 1) = v11;
  objc_msgSend_scaledValue_(v2, v12, v13, v14, 42.0);
  qword_268921180 = v15;
  *(_OWORD *)algn_268921188 = xmmword_2375DDFB0;
  *(long long *)((char *)&xmmword_268921190 + 8) = xmmword_2375DDFC0;
  objc_msgSend_scaledValue_(v2, v16, v17, v18, 5.0);
  qword_2689211A8 = v19;
  objc_msgSend_scaledValue_(v2, v20, v21, v22, 1.2);
  qword_2689211B0 = v23;
}

void sub_2375B4190(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 40);
  objc_msgSend_location(*(void **)(a1 + 32), a2, a3, a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_altitude(*(void **)(a1 + 32), v6, v7, v8);
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v10, v9);
}

void sub_2375B43D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2375B4C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_2375B4C8C()
{
  NanoCompassLocalizedString(@"UNCALIBRATED");
  uint64_t v3 = (char *)objc_claimAutoreleasedReturnValue();
  id v0 = NanoCompassLocalizedString(@"DEGREE_FORMAT");
  uint64_t v1 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v3, (uint64_t)v0, @"%@", 0, v3);
  uint64_t v2 = (void *)qword_2689211D0;
  qword_2689211D0 = v1;
}

uint64_t sub_2375B4D8C()
{
  uint64_t v0 = NanoCompassLocalizedString(@"UNCALIBRATED_SHORT");
  uint64_t v1 = qword_2689211E0;
  qword_2689211E0 = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_2375B4E78(uint64_t a1, void *a2)
{
  v50[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v7 = objc_msgSend_sizeClass(v3, v4, v5, v6);
  uint64_t v9 = objc_msgSend_metricsWithDevice_identitySizeClass_(v2, v8, (uint64_t)v3, v7);

  uint64_t v49 = &unk_26EA53938;
  v50[0] = &unk_26EA535F8;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v50, (uint64_t)&v49, 1);
  objc_msgSend_scaledValue_withOverrides_(v9, v12, (uint64_t)v11, v13, 9.0);
  *(void *)&xmmword_2689211F0 = v14;

  *((void *)&xmmword_2689211F0 + 1) = *MEMORY[0x263F81840];
  uint64_t v15 = *((void *)&xmmword_2689211F0 + 1);
  id v16 = (id *)MEMORY[0x263EFCF58];
  objc_storeStrong((id *)&qword_268921200, (id)*MEMORY[0x263EFCF58]);
  v48[0] = &unk_26EA53608;
  v48[1] = &unk_26EA53618;
  v47[0] = &unk_26EA53950;
  v47[1] = &unk_26EA53968;
  v47[2] = &unk_26EA53980;
  v47[3] = &unk_26EA53938;
  v48[2] = &unk_26EA53628;
  v48[3] = &unk_26EA53628;
  uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v48, (uint64_t)v47, 4);
  objc_msgSend_scaledValue_withOverrides_(v9, v19, (uint64_t)v18, v20, 19.5);
  qword_268921208 = v21;

  v45[0] = &unk_26EA53950;
  v45[1] = &unk_26EA53968;
  v46[0] = &unk_26EA53638;
  v46[1] = &unk_26EA53648;
  v45[2] = &unk_26EA53980;
  v45[3] = &unk_26EA53938;
  v46[2] = &unk_26EA53658;
  v46[3] = &unk_26EA53658;
  uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)v46, (uint64_t)v45, 4);
  objc_msgSend_scaledValue_withOverrides_(v9, v24, (uint64_t)v23, v25, 28.5);
  qword_268921210 = v26;

  objc_msgSend_scaledValue_(v9, v27, v28, v29, 25.7);
  *(void *)&xmmword_268921218 = v30;
  *((void *)&xmmword_268921218 + 1) = v15;
  objc_storeStrong((id *)&qword_268921228, *v16);
  v43[0] = &unk_26EA53950;
  v43[1] = &unk_26EA53968;
  v44[0] = &unk_26EA53668;
  v44[1] = &unk_26EA53678;
  v43[2] = &unk_26EA53980;
  v43[3] = &unk_26EA53938;
  v44[2] = &unk_26EA53688;
  v44[3] = &unk_26EA53688;
  uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)v44, (uint64_t)v43, 4);
  objc_msgSend_scaledValue_withOverrides_(v9, v33, (uint64_t)v32, v34, 55.7);
  qword_268921230 = v35;

  v41[0] = &unk_26EA53950;
  v41[1] = &unk_26EA53968;
  v42[0] = &unk_26EA53698;
  v42[1] = &unk_26EA536A8;
  v41[2] = &unk_26EA53980;
  v41[3] = &unk_26EA53938;
  v42[2] = &unk_26EA536B8;
  v42[3] = &unk_26EA536B8;
  uint64_t v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)v42, (uint64_t)v41, 4);
  objc_msgSend_scaledValue_withOverrides_(v9, v38, (uint64_t)v37, v39, 81.5);
  qword_268921238 = v40;
}

BOOL ShouldSendAppDailyMetricsEvent()
{
  return ShouldSendDailyMetricsEvent(@"com.apple.compass", @"AppMetricsDailyEventTimestamp");
}

BOOL ShouldSendDailyMetricsEvent(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFFA40];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  uint64_t v9 = objc_msgSend_initWithSuiteName_(v6, v7, (uint64_t)v5, v8);

  uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v4, v11);

  if (v12)
  {
    id v16 = objc_msgSend_now(MEMORY[0x263EFF910], v13, v14, v15);
    BOOL v17 = !NanoCompassIsSameDay(v12, v16);
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

BOOL ShouldSendComplicationDailyMetricsEvent()
{
  return ShouldSendDailyMetricsEvent(@"com.apple.compass", @"ComplicationMetricsDailyEventTimestamp");
}

void UpdateAppDailyMetricsEventTimestamp()
{
}

void UpdateDailyMetricsEventTimestamp(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFFA40];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  id v14 = (id)objc_msgSend_initWithSuiteName_(v6, v7, (uint64_t)v5, v8);

  uint64_t v12 = objc_msgSend_now(MEMORY[0x263EFF910], v9, v10, v11);
  objc_msgSend_setObject_forKey_(v14, v13, (uint64_t)v12, (uint64_t)v4);
}

void UpdateComplicationDailyMetricsEventTimestamp()
{
}

void SendCustomWaypointCount(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = @"TotalCustomWaypoints";
  id v4 = objc_msgSend_numberWithInteger_(NSNumber, a2, a1, a4);
  v8[0] = v4;
  id v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v8, (uint64_t)&v7, 1);
  AnalyticsSendEvent();
}

void SendWaypointsAndGuidesCount(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v40[8] = *MEMORY[0x263EF8340];
  v39[0] = @"TotalCompassWaypoints";
  uint64_t v15 = objc_msgSend_numberWithInteger_(NSNumber, a2, a1, a4);
  v40[0] = v15;
  v39[1] = @"TotalGuideWaypoints";
  uint64_t v18 = objc_msgSend_numberWithInteger_(NSNumber, v16, (uint64_t)a2, v17);
  v40[1] = v18;
  v39[2] = @"NumberEnabledGuideWaypoints";
  uint64_t v21 = objc_msgSend_numberWithInteger_(NSNumber, v19, a3, v20);
  v40[2] = v21;
  v39[3] = @"TotalNumberGuides";
  uint64_t v24 = objc_msgSend_numberWithInteger_(NSNumber, v22, a4, v23);
  v40[3] = v24;
  v39[4] = @"NumberDisabledGuides";
  uint64_t v27 = objc_msgSend_numberWithInteger_(NSNumber, v25, a5, v26);
  v40[4] = v27;
  v39[5] = @"NumberCompassWaypointsMissingElevation";
  uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v28, a6, v29);
  v40[5] = v30;
  v39[6] = @"NumberGuideWaypointsMissingElevation";
  uint64_t v33 = objc_msgSend_numberWithInteger_(NSNumber, v31, a7, v32);
  v40[6] = v33;
  v39[7] = @"TotalGuideWaypointsInElevationTable";
  uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v34, a8, v35);
  v40[7] = v36;
  uint64_t v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)v40, (uint64_t)v39, 8);
  AnalyticsSendEvent();
}

void SendActiveBacktrackUsage(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = NCLogForCategory(5uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2375D85C4(a1, v2);
  }

  uint64_t v8 = @"HistoricalPathAvailable";
  id v5 = objc_msgSend_numberWithBool_(NSNumber, v3, a1, v4);
  v9[0] = v5;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v9, (uint64_t)&v8, 1);
  AnalyticsSendEvent();
}

void SendBacktrackStatistics(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  double v1 = *(double *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = NCLogForCategory(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    uint64_t v20 = @"com.apple.NanoCompass.BacktrackEnded.event";
    __int16 v21 = 2112;
    uint64_t v22 = @"Duration";
    __int16 v23 = 2048;
    double v24 = v1 / 60.0;
    __int16 v25 = 2112;
    uint64_t v26 = @"RecordingCount";
    __int16 v27 = 2048;
    uint64_t v28 = v3;
    __int16 v29 = 2112;
    uint64_t v30 = @"RetracingCount";
    __int16 v31 = 2048;
    uint64_t v32 = v2;
    _os_log_debug_impl(&dword_23759D000, v4, OS_LOG_TYPE_DEBUG, "Logging %@. %@? %.2f min. %@? %ld. %@? %ld.", buf, 0x48u);
  }

  uint64_t v8 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, v1, @"Duration");
  v18[0] = v8;
  v17[1] = @"RecordingCount";
  uint64_t v11 = objc_msgSend_numberWithInteger_(NSNumber, v9, v3, v10);
  v18[1] = v11;
  v17[2] = @"RetracingCount";
  id v14 = objc_msgSend_numberWithInteger_(NSNumber, v12, v2, v13);
  v18[2] = v14;
  id v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v18, (uint64_t)v17, 3);

  AnalyticsSendEvent();
}

void SendDialUsage(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"DialType";
  v6[0] = a1;
  double v1 = NSDictionary;
  id v2 = a1;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v1, v3, (uint64_t)v6, (uint64_t)&v5, 1);

  AnalyticsSendEvent();
}

void SendTargetedWaypointTypeUsage(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"TargetedWaypointType";
  v6[0] = a1;
  double v1 = NSDictionary;
  id v2 = a1;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v1, v3, (uint64_t)v6, (uint64_t)&v5, 1);

  AnalyticsSendEvent();
}

void SendGridSystemUsage(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"GridSystemType";
  v6[0] = a1;
  double v1 = NSDictionary;
  id v2 = a1;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v1, v3, (uint64_t)v6, (uint64_t)&v5, 1);

  AnalyticsSendEvent();
}

void SendWaypointComplicationActivatedEvent(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = @"WaypointComplicationCount";
  uint64_t v4 = objc_msgSend_numberWithInteger_(NSNumber, a2, a1, a4);
  v8[0] = v4;
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v8, (uint64_t)&v7, 1);
  AnalyticsSendEvent();
}

void SendWaypointEditUsage(void *a1, uint64_t a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"WaypointLabelType";
  v10[1] = @"LocationIsManualEntry";
  v11[0] = a1;
  uint64_t v3 = NSNumber;
  id v4 = a1;
  uint64_t v7 = objc_msgSend_numberWithBool_(v3, v5, a2, v6);
  v11[1] = v7;
  uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v11, (uint64_t)v10, 2);

  AnalyticsSendEvent();
}

void SendElevationConfigurationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v6 = NCLogForCategory(0xAuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = @"not ";
    *(_DWORD *)buf = 134218498;
    uint64_t v22 = a1;
    if (a3) {
      uint64_t v18 = &stru_26EA49580;
    }
    __int16 v23 = 2048;
    uint64_t v24 = a2;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    _os_log_debug_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEBUG, "Target elevation is %ld and relative elevation difference is %ld, current elevation is %@available", buf, 0x20u);
  }

  uint64_t v9 = objc_msgSend_numberWithInteger_(NSNumber, v7, a1, v8, @"TargetElevationInMeter");
  v20[0] = v9;
  v19[1] = @"RelativeElevationDifferenceInMeter";
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v10, a2, v11);
  v20[1] = v12;
  v19[2] = @"CurrentElevationIsAvailable";
  uint64_t v15 = objc_msgSend_numberWithBool_(NSNumber, v13, a3, v14);
  v20[2] = v15;
  uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v20, (uint64_t)v19, 3);
  AnalyticsSendEvent();
}

void SendElevationDialUsage(uint64_t a1, const char *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"ElevationDialUsed";
  v4[0] = MEMORY[0x263EFFA88];
  id v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v4, (uint64_t)&v3, 1);
  AnalyticsSendEvent();
}

void SendSystemWaypointAvailability(unint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    uint64_t v22 = @"com.apple.NanoCompass.SystemWaypointAvailability.event";
    id v16 = @"YES";
    __int16 v23 = 2112;
    uint64_t v24 = @"ParkedCar";
    if (a1) {
      uint64_t v17 = @"YES";
    }
    else {
      uint64_t v17 = @"NO";
    }
    __int16 v25 = 2112;
    if ((a1 & 0x100) != 0) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    uint64_t v26 = v17;
    if ((a1 & 0x10000) == 0) {
      id v16 = @"NO";
    }
    __int16 v27 = 2112;
    uint64_t v28 = @"CellularData";
    __int16 v29 = 2112;
    uint64_t v30 = v18;
    __int16 v31 = 2112;
    uint64_t v32 = @"CellularSOS";
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    _os_log_debug_impl(&dword_23759D000, v2, OS_LOG_TYPE_DEBUG, "Logging %@. %@? %@. %@? %@. %@? %@.", buf, 0x48u);
  }
  uint64_t v3 = (a1 >> 16) & 1;
  uint64_t v4 = (a1 >> 8) & 1;

  uint64_t v7 = objc_msgSend_numberWithBool_(NSNumber, v5, a1 & 1, v6, @"ParkedCar");
  v20[0] = v7;
  v19[1] = @"CellularData";
  uint64_t v10 = objc_msgSend_numberWithBool_(NSNumber, v8, v4, v9);
  v20[1] = v10;
  v19[2] = @"CellularSOS";
  uint64_t v13 = objc_msgSend_numberWithBool_(NSNumber, v11, v3, v12);
  v20[2] = v13;
  uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v20, (uint64_t)v19, 3);

  AnalyticsSendEvent();
}

void SendWaypointElevationLookupUsage(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1)
  {
    double v4 = (double)(100000 * a2 / a1) / 100000.0;
    id v5 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v6, a1, v7);
      uint64_t v17 = objc_msgSend_numberWithInteger_(NSNumber, v15, a2, v16);
      *(_DWORD *)buf = 138412802;
      __int16 v21 = v14;
      __int16 v22 = 2112;
      __int16 v23 = v17;
      __int16 v24 = 2048;
      double v25 = v4;
      _os_log_debug_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEBUG, "total count %@, success count %@, value is %f", buf, 0x20u);
    }
    uint64_t v11 = objc_msgSend_numberWithDouble_(NSNumber, v8, v9, v10, v4, @"SuccessRate");
    uint64_t v19 = v11;
    uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v19, (uint64_t)&v18, 1);
    AnalyticsSendEvent();
  }
}

uint64_t sub_2375B7720()
{
  uint64_t v0 = [NCWaypointManager alloc];
  uint64_t v3 = objc_msgSend_initWithSupportsParkedCarWaypoint_(v0, v1, 1, v2);
  uint64_t v4 = qword_268921258;
  qword_268921258 = v3;

  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t sub_2375B77B8()
{
  uint64_t v0 = CLKIsNTKDaemon() ^ 1;
  double v1 = [NCWaypointManager alloc];
  uint64_t v4 = objc_msgSend_initWithSupportsParkedCarWaypoint_(v1, v2, v0, v3);
  uint64_t v5 = qword_268921268;
  qword_268921268 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

uint64_t sub_2375B7860()
{
  uint64_t v0 = [NCWaypointManager alloc];
  uint64_t v3 = objc_msgSend_initWithSupportsParkedCarWaypoint_(v0, v1, 0, v2);
  uint64_t v4 = qword_268921278;
  qword_268921278 = v3;

  return MEMORY[0x270F9A758](v3, v4);
}

void sub_2375B8B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2375B8B34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2375B8B44(uint64_t a1)
{
}

void sub_2375B8B4C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v10 = objc_msgSend_uuid(v14, v7, v8, v9);
  int isEqual = objc_msgSend_isEqual_(v10, v11, *(void *)(a1 + 32), v12);

  if (isEqual)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_2375B930C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_2375B9380(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "persistent container is fully loaded", (uint8_t *)&v15, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (v4 && WeakRetained)
  {
    uint64_t v8 = NCLogForCategory(7uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_msgSend_userInfo(v4, v9, v10, v11);
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_23759D000, v8, OS_LOG_TYPE_DEFAULT, "persistentContainer hit unresolved error %@, %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = (void *)v7[4];
    v7[4] = 0;

    id v14 = (void *)v7[5];
    void v7[5] = 0;
  }
}

uint64_t sub_2375B9564(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend_isEqualToString_(@"com.apple.NanoCompass.watchkitapp", a2, *(void *)(*(void *)(a1 + 32) + 8), a4);
  byte_268921288 = result;
  return result;
}

uint64_t sub_2375B962C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_isEqualToString_(@"com.apple.NanoCompass.watchkitapp", a2, *(void *)(*(void *)(a1 + 32) + 8), a4))uint64_t result = 1; {
  else
  }
    uint64_t result = objc_msgSend_isEqualToString_(@"com.apple.NanoCompass.compasstool", v5, *(void *)(*(void *)(a1 + 32) + 8), v6);
  byte_268921298 = result;
  return result;
}

uint64_t sub_2375B96E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x263F086E0], a2, @"com.apple.NanoCompass.watchkitapp", a4);
  uint64_t v5 = qword_2689212A8;
  qword_2689212A8 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

void sub_2375B97B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2375BB3CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2375BB3F8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2375BB9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2375BB9F0(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375BBA80;
  block[3] = &unk_264CD55C0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void sub_2375BBA80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__cancelLocationAuthRequestAssertion(WeakRetained, v1, v2, v3);
}

uint64_t sub_2375BC750(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], a2, *MEMORY[0x263EFCF58], a4, *(double *)(*(void *)(a1 + 32) + 464), *MEMORY[0x263F81840]);
  uint64_t v5 = (void *)qword_2689212C0;
  qword_2689212C0 = v4;

  uint64_t v9 = objc_msgSend_CLKFontWithLocalizedSmallCaps((void *)qword_2689212C0, v6, v7, v8);
  uint64_t v10 = qword_2689212B8;
  qword_2689212B8 = v9;

  return MEMORY[0x270F9A758](v9, v10);
}

uint64_t sub_2375BC874(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], a2, *MEMORY[0x263EFCF58], a4, *(double *)(*(void *)(a1 + 32) + 480), *MEMORY[0x263F81828]);
  uint64_t v5 = (void *)qword_2689212D8;
  qword_2689212D8 = v4;

  uint64_t v9 = objc_msgSend_CLKFontWithLocalizedLowerCaseSmallCaps((void *)qword_2689212D8, v6, v7, v8);
  uint64_t v10 = qword_2689212D0;
  qword_2689212D0 = v9;

  return MEMORY[0x270F9A758](v9, v10);
}

void sub_2375BC95C()
{
  NanoCompassFormattedUncalibrated();
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = NanoCompassFormattedAltitudeUnits((uint64_t)v8, v0, v1, v2);
  uint64_t v4 = NanoCompassLocalizedString(@"ALTITUDE_COMBINING_FORMAT");
  uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, v8, @"%@%@", v5, v8, v3);
  uint64_t v7 = (void *)qword_2689212E8;
  qword_2689212E8 = v6;
}

void sub_2375BCA84(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v7 = objc_msgSend_sizeClass(v3, v4, v5, v6);
  objc_msgSend_metricsWithDevice_identitySizeClass_(v2, v8, (uint64_t)v3, v7);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_scaledValue_(v21, v9, v10, v11, 20.0);
  qword_2689212F8 = v12;
  objc_msgSend_scaledValue_(v21, v13, v14, v15, 12.0);
  qword_268921300 = v16;
  objc_msgSend_scaledValue_(v21, v17, v18, v19, 30.0);
  qword_268921308 = v20;
}

void sub_2375BD2E8()
{
  CLLocationCoordinate2D v0 = CLLocationCoordinate2DMake(37.3353672, -122.011737);
  id v1 = objc_alloc(MEMORY[0x263F00A50]);
  double v2 = *MEMORY[0x263F00B40];
  uint64_t v6 = objc_msgSend_date(MEMORY[0x263EFF910], v3, v4, v5);
  id v12 = (id)objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(v1, v7, (uint64_t)v6, v8, v0.latitude, v0.longitude, 48.7, v2, v2);

  uint64_t v10 = objc_msgSend_locationWithLocation_error_(NCLocation, v9, (uint64_t)v12, 0);
  uint64_t v11 = (void *)qword_268921328;
  qword_268921328 = v10;
}

void sub_2375BEC7C(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  objc_msgSend_metricsWithDevice_identitySizeClass_(v2, v4, (uint64_t)v3, 3);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scaledValue_(v23, v5, v6, v7, 14.5);
  *(void *)&xmmword_268921340 = v8;
  objc_msgSend_scaledValue_(v23, v9, v10, v11, 6.0);
  *((void *)&xmmword_268921340 + 1) = v12;
  objc_msgSend_scaledValue_(v23, v13, v14, v15, 7.5);
  qword_268921350 = v16;
  objc_msgSend_scaledValue_(v23, v17, v18, v19, 9.0);
  qword_268921358 = v20;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v22 = v21;

  xmmword_268921360 = (__int128)vmulq_n_f64((float64x2_t)xmmword_268921340, v22);
  *(float64x2_t *)&qword_268921370 = vmulq_n_f64(*(float64x2_t *)&qword_268921350, v22);
}

__CFString *NCLocationUpdateInterestDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_264CD5E38[a1 + 1];
  }
}

uint64_t CLLiveUpdateConfigurationForInterest()
{
  return 0;
}

BOOL NCLocationUpdateInterestIsValidForUpdates(uint64_t a1)
{
  return ((a1 + 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

void sub_2375BF6E0(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = objc_msgSend_location(v9, v3, v4, v5);
    objc_msgSend_updateLocation_error_(WeakRetained, v8, (uint64_t)v7, 0);
  }
}

void sub_2375BF9F8()
{
  qword_268921398 = 0x40F3A53333333333;
}

uint64_t sub_2375BFF68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 152) + 16))();
}

uint64_t sub_2375C0124(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 160) + 16))();
}

uint64_t sub_2375C0298(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 120));
}

uint64_t sub_2375C05DC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 240), *(void *)(*(void *)(a1 + 32) + 248));
}

void sub_2375C07E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(unsigned int **)(a1 + 32);
  uint64_t v6 = v5[57];
  uint64_t isPreciseLocationOff = objc_msgSend_isPreciseLocationOff(v5, a2, a3, a4);
  uint64_t v8 = [NCLocationServiceUpdate alloc];
  id v10 = (id)objc_msgSend_initWithAuthorizationStatus_coarsePrecision_(v8, v9, v6, isPreciseLocationOff);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2375C0928(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a1 + 40) + 1;
  if (v3 > 2) {
    uint64_t v4 = @"Unknown";
  }
  else {
    uint64_t v4 = off_264CD5E38[v3];
  }
  return (*(uint64_t (**)(uint64_t, __CFString *))(v2 + 16))(v2, v4);
}

void sub_2375C0A88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  uint64_t isStationary = objc_msgSend_isStationary(WeakRetained, v5, v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v2, isStationary);
}

void sub_2375C0D1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2375C0D38(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t v5 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_2375D8F6C();
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    double v6 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 64)) / 1000000.0);
    uint64_t v7 = *(id *)(a1 + 32);
    uint64_t v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 72);
    if (v3)
    {
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        int v17 = 134217984;
        double v18 = v6;
        _os_signpost_emit_with_name_impl(&dword_23759D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CL/CR Session failed to start", "Delta: %.fms", (uint8_t *)&v17, 0xCu);
      }

      id v10 = NCLogForCategory(5uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_2375D8EF4();
      }
    }
    else
    {
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        int v17 = 134217984;
        double v18 = v6;
        _os_signpost_emit_with_name_impl(&dword_23759D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CL/CR Session started", "Delta: %.fms", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v11 = NCLogForCategory(5uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_2375D8E88();
      }

      uint64_t v15 = objc_msgSend_backgroundActivitySession(MEMORY[0x263F00A08], v12, v13, v14);
      uint64_t v16 = *(void *)(a1 + 40);
      id v10 = *(NSObject **)(v16 + 96);
      *(void *)(v16 + 96) = v15;
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_2375C0F74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2375C11A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2375C11BC(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t v5 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_2375D9084();
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    double v6 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 64)) / 1000000.0);
    uint64_t v7 = *(id *)(a1 + 32);
    uint64_t v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 72);
    if (v3)
    {
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        int v17 = 134217984;
        double v18 = v6;
        _os_signpost_emit_with_name_impl(&dword_23759D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CL/CR Session (without lookback) failed to start", "Delta: %.fms", (uint8_t *)&v17, 0xCu);
      }

      id v10 = NCLogForCategory(5uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_2375D900C();
      }
    }
    else
    {
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        int v17 = 134217984;
        double v18 = v6;
        _os_signpost_emit_with_name_impl(&dword_23759D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CL/CR Session (without lookback) started", "Delta: %.fms", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v11 = NCLogForCategory(5uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_2375D8FA0();
      }

      uint64_t v15 = objc_msgSend_backgroundActivitySession(MEMORY[0x263F00A08], v12, v13, v14);
      uint64_t v16 = *(void *)(a1 + 40);
      id v10 = *(NSObject **)(v16 + 96);
      *(void *)(v16 + 96) = v15;
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_2375C13F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2375C1584(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  double v2 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 56)) / 1000000.0);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    int v13 = 134217984;
    double v14 = v2;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v4, OS_SIGNPOST_INTERVAL_END, v5, "CL/CR Session ended", "Delta: %.fms", (uint8_t *)&v13, 0xCu);
  }

  double v6 = NCLogForCategory(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_2375D90EC();
  }

  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 40) + 96), v7, v8, v9);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_2375C1AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_2375C1B30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2375C1B40(uint64_t a1)
{
}

void sub_2375C1B48(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_location(a2, (const char *)a2, a3, a4);
  if (v8)
  {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6, (uint64_t)v8, v7);
    goto LABEL_10;
  }
  if (a2)
  {
    uint64_t v9 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_INFO, "Received update without a location (split path).", buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v9 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2375D9158();
    }
    goto LABEL_9;
  }
  double v10 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 80)) / 1000000.0);
  uint64_t v11 = *(id *)(a1 + 32);
  uint64_t v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 88);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    double v39 = v10;
    __int16 v40 = 2114;
    uint64_t v41 = v14;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v12, OS_SIGNPOST_INTERVAL_END, v13, "CL/CR transcript fetch ended", "Delta: %.fms (task: %{public}@)", buf, 0x16u);
  }

  uint64_t v15 = NCLogForCategory(5uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    double v39 = v10;
    __int16 v40 = 2112;
    uint64_t v41 = v16;
    _os_log_impl(&dword_23759D000, v15, OS_LOG_TYPE_DEFAULT, "CL/CR transcript fetch ended. Delta: %.fms. Task: %@.", buf, 0x16u);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v17);
        }
        double v23 = *(double *)(*((void *)&v33 + 1) + 8 * i);
        __int16 v24 = NCLogForCategory(5uLL);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v39 = v23;
          _os_log_debug_impl(&dword_23759D000, v24, OS_LOG_TYPE_DEBUG, "Historical Location: %@", buf, 0xCu);
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v25, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v20);
  }

  uint64_t v26 = *(void *)(a1 + 48);
  uint64_t v30 = objc_msgSend_copy(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v27, v28, v29);
  (*(void (**)(uint64_t, void *, void))(v26 + 16))(v26, v30, 0);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = 0;

LABEL_10:
}

void sub_2375C21E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2375C2224(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_location(a2, (const char *)a2, a3, a4);
  if (v8)
  {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6, (uint64_t)v8, v7);
    goto LABEL_10;
  }
  if (a2)
  {
    uint64_t v9 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_INFO, "Received update without a location (split path).", (uint8_t *)&v26, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v9 = NCLogForCategory(8uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2375D9158();
    }
    goto LABEL_9;
  }
  double v10 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 72)) / 1000000.0);
  uint64_t v11 = *(id *)(a1 + 32);
  uint64_t v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 80);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v26 = 134217984;
    double v27 = v10;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v12, OS_SIGNPOST_INTERVAL_END, v13, "CL/CR transcript fetch (interval) ended", "Delta: %.fms", (uint8_t *)&v26, 0xCu);
  }

  uint64_t v14 = NCLogForCategory(8uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_msgSend_count(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v15, v16, v17);
    int v26 = 134218240;
    double v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "CL/CR transcript fetch (interval) ended. Delta: %.fms. Count: %lu.", (uint8_t *)&v26, 0x16u);
  }

  uint64_t v19 = *(void *)(a1 + 40);
  double v23 = objc_msgSend_copy(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v20, v21, v22);
  (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v23, 0);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
  double v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = 0;

LABEL_10:
}

void sub_2375C278C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  double v6 = COERCE_DOUBLE(a3);
  double v7 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 56)) / 1000000.0);
  uint64_t v8 = *(id *)(a1 + 32);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v24 = 134217984;
    double v25 = v7;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CL/CR smoothed fetch ended", "Delta: %.fms", (uint8_t *)&v24, 0xCu);
  }

  if (v6 == 0.0)
  {
    uint64_t v15 = objc_msgSend_count(v5, v11, v12, v13);
    uint64_t v14 = NCLogForCategory(5uLL);
    BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        *(double *)&uint64_t v20 = COERCE_DOUBLE(objc_msgSend_count(v5, v17, v18, v19));
        double v21 = *(double *)(a1 + 40);
        int v24 = 134218498;
        double v25 = *(double *)&v20;
        __int16 v26 = 2114;
        double v27 = v21;
        __int16 v28 = 2048;
        double v29 = v7;
        _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "%lu smoothed locations fetched within %{public}@. Delta: %.fms.", (uint8_t *)&v24, 0x20u);
      }
    }
    else if (v16)
    {
      double v22 = *(double *)(a1 + 40);
      int v24 = 138543618;
      double v25 = v22;
      __int16 v26 = 2048;
      double v27 = v7;
      _os_log_impl(&dword_23759D000, v14, OS_LOG_TYPE_DEFAULT, "No smoothed locations fetched within %{public}@. Delta: %.fms.", (uint8_t *)&v24, 0x16u);
    }
  }
  else
  {
    uint64_t v14 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      double v23 = *(double *)(a1 + 40);
      int v24 = 138543874;
      double v25 = v23;
      __int16 v26 = 2048;
      double v27 = v7;
      __int16 v28 = 2114;
      double v29 = v6;
      _os_log_error_impl(&dword_23759D000, v14, OS_LOG_TYPE_ERROR, "Error while fetching smoothed locations within %{public}@. Delta: %.fms. Error: %{public}@", (uint8_t *)&v24, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_2375C2C98(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 48)) / 1000000.0);
  double v7 = *(id *)(a1 + 32);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v13 = 134217984;
    double v14 = v6;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CL/CR is remote fetch ended", "Delta: %.fms", (uint8_t *)&v13, 0xCu);
  }

  os_signpost_id_t v10 = NCLogForCategory(5uLL);
  uint64_t v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2375D926C();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    sub_2375D9200();
  }

  if (a2)
  {
    uint64_t v12 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_23759D000, v12, OS_LOG_TYPE_DEFAULT, "We currently believe the user is in a remote area.", (uint8_t *)&v13, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2375C30B4(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = (double)(int)llround((double)(mach_continuous_time() - *(void *)(a1 + 48)) / 1000000.0);
  double v7 = *(id *)(a1 + 32);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v13 = 134217984;
    double v14 = v6;
    _os_signpost_emit_with_name_impl(&dword_23759D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CL/CR will prompt fetch ended", "Delta: %.fms", (uint8_t *)&v13, 0xCu);
  }

  os_signpost_id_t v10 = NCLogForCategory(5uLL);
  uint64_t v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2375D93B4();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    sub_2375D9348();
  }

  if (a2)
  {
    uint64_t v12 = NCLogForCategory(5uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_23759D000, v12, OS_LOG_TYPE_DEFAULT, "We currently believe we have backtrack location data to show the user.", (uint8_t *)&v13, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2375C3488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(a1 + 32));
}

uint64_t sub_2375C39F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a3 + 16))(a3, *(void *)(*(void *)(a1 + 32) + 240), *(void *)(*(void *)(a1 + 32) + 248));
}

void sub_2375C49CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2375C49F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateMotionType_isDeviceStationary_(WeakRetained, v5, a2, a3);
}

void sub_2375C4B24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend__groundAltitudeAtLocation_(*(void **)(*(void *)(a1 + 32) + 8), a2, *(void *)(a1 + 40), a4);
  double v6 = NCLogForCategory(7uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend_altitude(v5, v8, v9, v10);
      uint64_t v12 = v11;
      uint64_t v16 = objc_msgSend_hash(*(void **)(a1 + 40), v13, v14, v15);
      *(_DWORD *)buf = 134218240;
      uint64_t v25 = v12;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "Fetched altitude of %f meters for waypoint (%lu).", buf, 0x16u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2375C4D40;
    block[3] = &unk_264CD58C8;
    uint64_t v17 = &v23;
    id v23 = *(id *)(a1 + 48);
    id v22 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (v7)
    {
      uint64_t v18 = objc_msgSend_hash(*(void **)(a1 + 40), v8, v9, v10);
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v18;
      _os_log_impl(&dword_23759D000, v6, OS_LOG_TYPE_DEFAULT, "Can't lookup ground altitude for waypoint (%lu).", buf, 0xCu);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_2375C4DAC;
    void v19[3] = &unk_264CD5C90;
    uint64_t v17 = &v20;
    id v20 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v19);
  }
}

void sub_2375C4D40(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = NSNumber;
  uint64_t v5 = *(void *)(a1 + 40);
  objc_msgSend_altitude(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_numberWithDouble_(v4, v6, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v9);
}

uint64_t sub_2375C4DAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2375C4F40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2375C68B4()
{
  NanoCompassLocalizedString(@"WAYPOINT_COMPLICATION_SMART_WAYPOINT_NAME");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  CLLocationCoordinate2D v0 = (void *)MEMORY[0x263EFD208];
  uint64_t v4 = objc_msgSend_localizedUppercaseString(v12, v1, v2, v3);
  uint64_t v7 = objc_msgSend_textProviderWithText_(v0, v5, (uint64_t)v4, v6);
  uint64_t v8 = (void *)qword_2689213A8;
  qword_2689213A8 = v7;

  uint64_t v9 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_((void *)qword_2689213A8, v10, (uint64_t)v9, v11);
}

void sub_2375C6A50(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_2375C6D34(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_label(a2, v5, v6, v7);
  id v12 = objc_msgSend_uppercaseString(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_label(v4, v13, v14, v15);

  id v20 = objc_msgSend_uppercaseString(v16, v17, v18, v19);
  uint64_t v23 = objc_msgSend_compare_(v12, v21, (uint64_t)v20, v22);

  return v23;
}

uint64_t sub_2375C7E18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_uuid(a2, (const char *)a2, a3, a4);
  uint64_t isEqual = objc_msgSend_isEqual_(v5, v6, *(void *)(a1 + 32), v7);

  return isEqual;
}

uint64_t sub_2375C9580(uint64_t a1, const char *a2)
{
  uint64_t v2 = objc_msgSend__preferredFontForTextStyle_design_variant_maximumContentSizeCategory_compatibleWithTraitCollection_(MEMORY[0x263F81708], a2, *MEMORY[0x263F1D260], *MEMORY[0x263EFCF58], 8, *MEMORY[0x263F1D188], 0);
  uint64_t v3 = qword_2689213B8;
  qword_2689213B8 = v2;

  return MEMORY[0x270F9A758](v2, v3);
}

void sub_2375C9640(uint64_t a1, const char *a2)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend__preferredFontForTextStyle_design_variant_maximumContentSizeCategory_compatibleWithTraitCollection_(MEMORY[0x263F81708], a2, *MEMORY[0x263F1D260], *MEMORY[0x263EFCF58], 8, *MEMORY[0x263F1D188], 0);
  uint64_t v24 = *MEMORY[0x263F81748];
  uint64_t v3 = *MEMORY[0x263F817B0];
  v21[0] = *MEMORY[0x263F817B8];
  v21[1] = v3;
  v22[0] = &unk_26EA53A10;
  v22[1] = &unk_26EA53A28;
  uint64_t v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v4, (uint64_t)v22, (uint64_t)v21, 2);
  uint64_t v23 = v5;
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, (uint64_t)&v23, 1);
  v25[0] = v7;
  uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v25, (uint64_t)&v24, 1);

  int v13 = objc_msgSend_fontDescriptor(v2, v10, v11, v12);
  uint64_t v16 = objc_msgSend_fontDescriptorByAddingAttributes_(v13, v14, (uint64_t)v9, v15);

  uint64_t v19 = objc_msgSend_fontWithDescriptor_size_(MEMORY[0x263F81708], v17, (uint64_t)v16, v18, 0.0);
  id v20 = (void *)qword_2689213C8;
  qword_2689213C8 = v19;
}

void sub_2375C9E94(uint64_t a1, void *a2)
{
  id v45 = a2;
  uint64_t v6 = objc_msgSend_layer(v45, v3, v4, v5);
  uint64_t v10 = objc_msgSend_actions(v6, v7, v8, v9);
  int v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"filters", v12);
  uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);

  if (v13 != v17)
  {
    double v21 = objc_msgSend_layer(v45, v18, v19, v20);
    uint64_t v25 = objc_msgSend_actions(v21, v22, v23, v24);
    double v29 = objc_msgSend_mutableCopy(v25, v26, v27, v28);

    long long v33 = objc_msgSend_null(MEMORY[0x263EFF9D0], v30, v31, v32);
    objc_msgSend_setObject_forKeyedSubscript_(v29, v34, (uint64_t)v33, @"filters");

    uint64_t v38 = objc_msgSend_layer(v45, v35, v36, v37);
    objc_msgSend_setActions_(v38, v39, (uint64_t)v29, v40);
  }
  uint64_t v41 = *(void *)(a1 + 32);
  uint64_t v42 = objc_msgSend_layer(v45, v18, v19, v20);
  objc_msgSend_setFilters_(v42, v43, v41, v44);
}

id LevelComplicationMutedTextColor()
{
  if (qword_2689213E0 != -1) {
    dispatch_once(&qword_2689213E0, &unk_26EA48E40);
  }
  CLLocationCoordinate2D v0 = (void *)qword_2689213D8;

  return v0;
}

uint64_t sub_2375CAC50(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], a2, a3, a4, 0.384313725, 1.0);
  uint64_t v5 = qword_2689213D8;
  qword_2689213D8 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

uint64_t allowVerboseLog()
{
  if (qword_2689213E8 != -1) {
    dispatch_once(&qword_2689213E8, &unk_26EA48E60);
  }
  return byte_2689213F0;
}

void sub_2375CB674()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  id v5 = (id)objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.compass", v2);
  byte_2689213F0 = objc_msgSend_BOOLForKey_(v5, v3, @"VerboseLogging", v4);
}

id NCLogForCategory(unint64_t a1)
{
  if (a1 >= 0xB) {
    sub_2375D9650();
  }
  if (qword_268921450 != -1) {
    dispatch_once(&qword_268921450, &unk_26EA48E80);
  }
  uint64_t v2 = (void *)qword_2689213F8[a1];

  return v2;
}

uint64_t sub_2375CB744()
{
  os_log_t v0 = os_log_create("com.apple.nanocompass", "NCAltimeter");
  uint64_t v1 = (void *)qword_2689213F8[0];
  qword_2689213F8[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.nanocompass", "NCCompass");
  uint64_t v3 = (void *)qword_268921400;
  qword_268921400 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.nanocompass", "NCComplication");
  id v5 = (void *)qword_268921408;
  qword_268921408 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.nanocompass", "location");
  uint64_t v7 = (void *)qword_268921410;
  qword_268921410 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.nanocompass", "motion");
  uint64_t v9 = (void *)qword_268921418;
  qword_268921418 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.nanocompass", "backtrack");
  uint64_t v11 = (void *)qword_268921420;
  qword_268921420 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.nanocompass", "NCGridSystem");
  int v13 = (void *)qword_268921428;
  qword_268921428 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.nanocompass", "NCWaypoint");
  uint64_t v15 = (void *)qword_268921430;
  qword_268921430 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.nanocompass", "cellular");
  uint64_t v17 = (void *)qword_268921438;
  qword_268921438 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.nanocompass", "guides");
  uint64_t v19 = (void *)qword_268921440;
  qword_268921440 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.nanocompass", "elevationAlert");
  uint64_t v21 = qword_268921448;
  qword_268921448 = (uint64_t)v20;

  return MEMORY[0x270F9A758](v20, v21);
}

uint64_t sub_2375CC1A8()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_268921458;
  qword_268921458 = v0;

  objc_msgSend_setHasReading_((void *)qword_268921458, v2, 1, v3);
  objc_msgSend_setHeading_((void *)qword_268921458, v4, v5, v6, 315.0);
  os_log_t v10 = (void *)qword_268921458;

  return objc_msgSend_setAccuracy_(v10, v7, v8, v9, 10.0);
}

void sub_2375CC9CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2375CC9F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2375CCAD0;
    block[3] = &unk_264CD5EB0;
    void block[4] = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t sub_2375CCAD0(void *a1)
{
  return MEMORY[0x270F9A6D0](a1[4], sel__updateParkedCarWaypointWith_withError_, a1[5], a1[6]);
}

void sub_2375CCAE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2375CCBB8;
    block[3] = &unk_264CD5EB0;
    void block[4] = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t sub_2375CCBB8(void *a1)
{
  return MEMORY[0x270F9A6D0](a1[4], sel__updateParkedCarWaypointWith_withError_, a1[5], a1[6]);
}

uint64_t sub_2375CD2B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a2, a3, a4, 0.13333334, 0.513725519, 0.937254906, 1.0);
  uint64_t v5 = qword_268921468;
  qword_268921468 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

uint64_t sub_2375CD360()
{
  uint64_t v0 = NanoCompassLocalizedString(@"PARKED_CAR_WAYPOINT_NAME");
  uint64_t v1 = qword_268921478;
  qword_268921478 = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_2375CD3FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a2, a3, a4, 1.0, 0.329411775, 0.0, 1.0);
  uint64_t v5 = qword_268921488;
  qword_268921488 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

uint64_t sub_2375CD4A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], a2, a3, a4, 1.0, 0.294117659, 0.309803933, 1.0);
  uint64_t v5 = qword_268921498;
  qword_268921498 = v4;

  return MEMORY[0x270F9A758](v4, v5);
}

void sub_2375CD550(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_idealizedLocation(NCLocation, a2, a3, a4);
  objc_msgSend_rawLocation(v4, v5, v6, v7);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = NanoCompassLocalizedString(@"IDEALIZED_WAYPOINT_NAME");
  uint64_t v9 = [NCWaypoint alloc];
  int v13 = objc_msgSend_idealizedWaypointSymbolColor(NCWaypoint, v10, v11, v12);
  os_log_t v14 = NSNumber;
  objc_msgSend_altitude(v26, v15, v16, v17);
  uint64_t v21 = objc_msgSend_numberWithDouble_(v14, v18, v19, v20);
  char v25 = 1;
  uint64_t isEnabled = objc_msgSend_initWithLabel_color_symbol_type_location_altitude_isEnabled_(v9, v22, (uint64_t)v8, (uint64_t)v13, @"tent.fill", 4, v26, v21, v25);
  uint64_t v24 = (void *)qword_2689214A8;
  qword_2689214A8 = isEnabled;
}

void sub_2375CD6AC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_idealizedLocation(NCLocation, a2, a3, a4);
  objc_msgSend_rawLocation(v4, v5, v6, v7);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = NanoCompassLocalizedString(@"IDEALIZED_WAYPOINT_NAME");
  uint64_t v9 = [NCWaypoint alloc];
  int v13 = objc_msgSend_idealizedWaypointSymbolColor(NCWaypoint, v10, v11, v12);
  os_log_t v14 = NSNumber;
  objc_msgSend_altitude(v26, v15, v16, v17);
  uint64_t v21 = objc_msgSend_numberWithDouble_(v14, v18, v19, v20);
  char v25 = 1;
  uint64_t isEnabled = objc_msgSend_initWithLabel_color_symbol_type_location_altitude_isEnabled_(v9, v22, (uint64_t)v8, (uint64_t)v13, @"tent.fill", 4, v26, v21, v25);
  uint64_t v24 = (void *)qword_2689214B8;
  qword_2689214B8 = isEnabled;
}

uint64_t sub_2375CF414(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x237E1C4F0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (objc_msgSend_isActivityAvailable(MEMORY[0x263F01780], v5, v6, v7))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    return MEMORY[0x270F9A6D0](v10, sel__startMotionActivityUpdate, v8, v9);
  }
  else
  {
    uint64_t v11 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_2375D9854(v11);
    }

    return objc_msgSend__updateMotionType_isDeviceStationary_(*(void **)(a1 + 32), v12, 1, 0);
  }
}

void sub_2375CF544(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_stopActivityUpdates(*(void **)(*(void *)(a1 + 32) + 8), a2, a3, a4);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;
}

void sub_2375CF6B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2375CF6D8(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v9 && WeakRetained && objc_msgSend_confidence(v9, v3, v4, v5) == 2) {
    objc_msgSend__updateMotionActivity_(WeakRetained, v7, (uint64_t)v9, v8);
  }
}

void sub_2375CF97C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_now(MEMORY[0x263EFF910], v7, v8, v9);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2375CFA70;
  v15[3] = &unk_264CD5F30;
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v6;
  uint64_t v17 = v11;
  id v18 = v10;
  id v19 = v5;
  id v12 = v5;
  id v13 = v10;
  id v14 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void sub_2375CFA70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = objc_msgSend_eventWithType_timestamp_stationary_(NCMotionEvent, a2, 1, *(void *)(a1 + 48), 0);
    objc_msgSend__housekeepingWith_(v6, v8, (uint64_t)v7, v9);

    uint64_t v10 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2375D98DC(v5, v10);
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend_numberOfSteps(*(void **)(a1 + 56), a2, a3, a4);
    objc_msgSend_doubleValue(v11, v12, v13, v14);
    double v16 = v15;

    uint64_t v17 = *(void **)(a1 + 40);
    id v19 = objc_msgSend_eventWithType_timestamp_stationary_(NCMotionEvent, v18, v16 >= 80.0, *(void *)(a1 + 48), v16 < 80.0);
    objc_msgSend__housekeepingWith_(v17, v20, (uint64_t)v19, v21);

    uint64_t v10 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = @"resumed";
      if (v16 < 80.0) {
        uint64_t v22 = @"paused";
      }
      int v23 = 134218242;
      unint64_t v24 = (unint64_t)v16;
      __int16 v25 = 2114;
      id v26 = v22;
      _os_log_impl(&dword_23759D000, v10, OS_LOG_TYPE_INFO, "Step count is %lu. Pedestrian activity is %{public}@.", (uint8_t *)&v23, 0x16u);
    }
  }
}

uint64_t sub_2375D006C(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 48) || *(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(v2 + 40))
  {
    *(void *)(v2 + 48) = v1;
    *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 48);
    uint64_t v3 = *(void *)(result + 32);
    uint64_t result = *(void *)(v3 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(v3 + 48), *(unsigned __int8 *)(v3 + 40));
    }
  }
  return result;
}

void sub_2375D140C(uint64_t a1)
{
  NanoCompassLocalizedString(@"COMPASS_COMPLICATION_TITLE");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)MEMORY[0x263EFD208];
  id v6 = objc_msgSend_localizedUppercaseString(v13, v3, v4, v5);
  uint64_t v9 = objc_msgSend_textProviderWithText_(v2, v7, (uint64_t)v6, v8);
  uint64_t v10 = (void *)qword_2689214C8;
  qword_2689214C8 = v9;

  objc_msgSend_setTintColor_((void *)qword_2689214C8, v11, *(void *)(a1 + 32), v12);
}

uint64_t sub_2375D1504()
{
  uint64_t v0 = objc_alloc_init(NCGuidesManager);
  uint64_t v1 = qword_2689214D8;
  qword_2689214D8 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_2375D1944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2375D1964()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))off_2689214F8;
  uint64_t v7 = off_2689214F8;
  if (!off_2689214F8)
  {
    uint64_t v1 = (void *)sub_2375D5E48();
    v5[3] = (uint64_t)dlsym(v1, "MKBGetDeviceLockState");
    off_2689214F8 = (_UNKNOWN *)v5[3];
    uint64_t v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_2375D9958();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0(0);
}

void sub_2375D1A60(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!sub_2375D1964()) {
    objc_msgSend__handleFirstUnlock(v5, v2, v3, v4);
  }
}

void sub_2375D1AA8(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[NCGuidesManager init]_block_invoke";
    _os_log_impl(&dword_23759D000, v2, OS_LOG_TYPE_DEFAULT, "%s: creating storeController", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_alloc(MEMORY[0x263F53F90]);
    uint64_t v11 = objc_opt_class();
    uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)&v11, 1);
    uint64_t v8 = objc_msgSend_initWithNotifyForChanges_delegate_(v4, v7, (uint64_t)v6, (uint64_t)WeakRetained);
    objc_msgSend_setStoreController_(WeakRetained, v9, (uint64_t)v8, v10);
  }
}

void sub_2375D1C1C()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v3 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.compass", v2);
  uint64_t v6 = objc_msgSend_integerForKey_(v3, v4, @"MaxWaypointsAllowed", v5);
  uint64_t v7 = 50;
  if (v6) {
    uint64_t v7 = v6;
  }
  qword_2689214E8 = v7;
  uint64_t v8 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[NCGuidesManager maxAllowedWaypoints]_block_invoke";
    __int16 v11 = 2048;
    uint64_t v12 = qword_2689214E8;
    _os_log_impl(&dword_23759D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Maximum allowed waypoints is %lu", (uint8_t *)&v9, 0x16u);
  }
}

uint64_t sub_2375D2114(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_uuid(a2, (const char *)a2, a3, a4);
  uint64_t isEqual = objc_msgSend_isEqual_(v5, v6, *(void *)(a1 + 32), v7);

  return isEqual;
}

void sub_2375D2B18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2375D2DA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2375D2E7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2375D31C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2375D4004(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2375D42A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2375D44F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__loadGuides, a3, a4);
}

uint64_t sub_2375D4A20(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_msgSend_loadGuides(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v5 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[NCGuidesManager _handleFirstUnlock]_block_invoke";
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s: posting notification for GuidesFirstUnlockNotification", (uint8_t *)&v9, 0xCu);
  }

  return objc_msgSend__postNotification_(*(void **)(a1 + 32), v6, @"GuidesFirstUnlockNotification", v7);
}

void sub_2375D50DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2375D5104(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[NCGuidesManager _loadGuides]_block_invoke";
    _os_log_impl(&dword_23759D000, v2, OS_LOG_TYPE_DEFAULT, "%s: Loaded guides, calling _refreshNonDistanceLimitedWaypoints", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend__refreshNonDistanceLimitedWaypoints(*(void **)(a1 + 32), v3, v4, v5);
}

void sub_2375D5748(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2375D5AEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *sub_2375D5DF8(uint64_t a1)
{
  uint64_t v2 = (void *)sub_2375D5E48();
  uint64_t result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_2689214F8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2375D5E48()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268921500)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = sub_2375D5F48;
    v3[4] = &unk_264CD5630;
    v3[5] = v3;
    long long v4 = xmmword_264CD5FF0;
    uint64_t v5 = 0;
    qword_268921500 = _sl_dlopen();
  }
  uint64_t v0 = qword_268921500;
  uint64_t v1 = (void *)v3[0];
  if (!qword_268921500)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_2375D5F48()
{
  uint64_t result = _sl_dlopen();
  qword_268921500 = result;
  return result;
}

void *sub_2375D5FBC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_2375D5E48();
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268921508 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2375D6020(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_2375D6064(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_2375D6084()
{
  if (qword_268921518 != -1) {
    dispatch_once(&qword_268921518, &unk_26EA48FC0);
  }
  uint64_t v0 = (void *)qword_268921510;

  return v0;
}

uint64_t sub_2375D60D8(uint64_t a1, const char *a2)
{
  uint64_t v2 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], a2, @"com.apple.NanoCompass.BacktrackTranscriptSession", -1, 0);
  uint64_t v3 = qword_268921510;
  qword_268921510 = v2;

  return MEMORY[0x270F9A758](v2, v3);
}

id NCWaypointGlyphs.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NCWaypointGlyphs.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NCWaypointGlyphs();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NCWaypointGlyphs.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NCWaypointGlyphs();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of UnitLengthPreferences.overrideToMetric()
{
  return 0;
}

unint64_t sub_2375D6280(uint64_t a1, uint64_t a2)
{
  sub_2375D9F20();
  sub_2375D9EA0();
  uint64_t v4 = sub_2375D9F50();

  return sub_2375D62F8(a1, a2, v4);
}

unint64_t sub_2375D62F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2375D9F10() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2375D9F10() & 1) == 0);
    }
  }
  return v6;
}

uint64_t _s24NanoCompassComplications16NCWaypointGlyphsC15convertedSymbol4fromS2S_tFZ_0(uint64_t a1, uint64_t a2)
{
  if (qword_268920BB0 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_268921550;
  if (!*(void *)(qword_268921550 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_2375D6280(a1, a2);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRetain();
    return a1;
  }
  a1 = *(void *)(*(void *)(v4 + 56) + 16 * v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for NCWaypointGlyphs()
{
  return self;
}

id sub_2375D64C0()
{
  uint64_t v0 = (objc_class *)type metadata accessor for LocationUpdate1HzMode();
  id v1 = (char *)objc_allocWithZone(v0);
  objc_super v2 = &v1[OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier];
  *(void *)objc_super v2 = 0xD000000000000011;
  *((void *)v2 + 1) = 0x80000002375E1960;
  v4.receiver = v1;
  v4.super_class = v0;
  id result = objc_msgSendSuper2(&v4, sel_init);
  static LocationUpdate1HzMode.backtrackRetraceMode = (uint64_t)result;
  return result;
}

uint64_t *LocationUpdate1HzMode.backtrackRetraceMode.unsafeMutableAddressor()
{
  if (qword_268920B88 != -1) {
    swift_once();
  }
  return &static LocationUpdate1HzMode.backtrackRetraceMode;
}

id static LocationUpdate1HzMode.backtrackRetraceMode.getter()
{
  return sub_2375D6850(&qword_268920B88, (void **)&static LocationUpdate1HzMode.backtrackRetraceMode);
}

id sub_2375D65A4()
{
  uint64_t v0 = (objc_class *)type metadata accessor for LocationUpdate1HzMode();
  id v1 = (char *)objc_allocWithZone(v0);
  objc_super v2 = &v1[OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier];
  *(void *)objc_super v2 = 0xD000000000000010;
  *((void *)v2 + 1) = 0x80000002375E1940;
  v4.receiver = v1;
  v4.super_class = v0;
  id result = objc_msgSendSuper2(&v4, sel_init);
  static LocationUpdate1HzMode.locationRefreshUpdateMode = (uint64_t)result;
  return result;
}

uint64_t *LocationUpdate1HzMode.locationRefreshUpdateMode.unsafeMutableAddressor()
{
  if (qword_268920B90 != -1) {
    swift_once();
  }
  return &static LocationUpdate1HzMode.locationRefreshUpdateMode;
}

id static LocationUpdate1HzMode.locationRefreshUpdateMode.getter()
{
  return sub_2375D6850(&qword_268920B90, (void **)&static LocationUpdate1HzMode.locationRefreshUpdateMode);
}

id sub_2375D6688()
{
  uint64_t v0 = (objc_class *)type metadata accessor for LocationUpdate1HzMode();
  id v1 = (char *)objc_allocWithZone(v0);
  objc_super v2 = &v1[OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier];
  *(void *)objc_super v2 = 0xD000000000000011;
  *((void *)v2 + 1) = 0x80000002375E1920;
  v4.receiver = v1;
  v4.super_class = v0;
  id result = objc_msgSendSuper2(&v4, sel_init);
  static LocationUpdate1HzMode.targetedWaypointUpdateMode = (uint64_t)result;
  return result;
}

uint64_t *LocationUpdate1HzMode.targetedWaypointUpdateMode.unsafeMutableAddressor()
{
  if (qword_268920B98 != -1) {
    swift_once();
  }
  return &static LocationUpdate1HzMode.targetedWaypointUpdateMode;
}

id static LocationUpdate1HzMode.targetedWaypointUpdateMode.getter()
{
  return sub_2375D6850(&qword_268920B98, (void **)&static LocationUpdate1HzMode.targetedWaypointUpdateMode);
}

id sub_2375D676C()
{
  uint64_t v0 = (objc_class *)type metadata accessor for LocationUpdate1HzMode();
  id v1 = (char *)objc_allocWithZone(v0);
  objc_super v2 = &v1[OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier];
  *(void *)objc_super v2 = 0xD000000000000011;
  *((void *)v2 + 1) = 0x80000002375E1900;
  v4.receiver = v1;
  v4.super_class = v0;
  id result = objc_msgSendSuper2(&v4, sel_init);
  static LocationUpdate1HzMode.waypointCreationMode = (uint64_t)result;
  return result;
}

uint64_t *LocationUpdate1HzMode.waypointCreationMode.unsafeMutableAddressor()
{
  if (qword_268920BA0 != -1) {
    swift_once();
  }
  return &static LocationUpdate1HzMode.waypointCreationMode;
}

id static LocationUpdate1HzMode.waypointCreationMode.getter()
{
  return sub_2375D6850(&qword_268920BA0, (void **)&static LocationUpdate1HzMode.waypointCreationMode);
}

id sub_2375D6850(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

uint64_t LocationUpdate1HzMode.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LocationUpdate1HzMode.hash.getter()
{
  return sub_2375D9EC0();
}

uint64_t LocationUpdate1HzMode.isEqual(_:)(uint64_t a1)
{
  sub_2375D6AF4(a1, (uint64_t)v6);
  if (!v7)
  {
    sub_2375D6BA0((uint64_t)v6);
    goto LABEL_9;
  }
  type metadata accessor for LocationUpdate1HzMode();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v3 = 0;
    return v3 & 1;
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier) == *(void *)&v5[OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier]
    && *(void *)(v1 + OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier + 8) == *(void *)&v5[OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier + 8])
  {

    char v3 = 1;
  }
  else
  {
    char v3 = sub_2375D9F10();
  }
  return v3 & 1;
}

uint64_t sub_2375D6AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2375D6B5C(&qword_268920BC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2375D6B5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2375D6BA0(uint64_t a1)
{
  uint64_t v2 = sub_2375D6B5C(&qword_268920BC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for LocationUpdate1HzMode()
{
  return self;
}

id LocationUpdate1HzMode.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationUpdate1HzMode();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2375D6CE8()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UnitLengthPreferences()), sel_init);
  static UnitLengthPreferences.shared = (uint64_t)result;
  return result;
}

uint64_t *UnitLengthPreferences.shared.unsafeMutableAddressor()
{
  if (qword_268920BA8 != -1) {
    swift_once();
  }
  return &static UnitLengthPreferences.shared;
}

id static UnitLengthPreferences.shared.getter()
{
  if (qword_268920BA8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static UnitLengthPreferences.shared;

  return v0;
}

uint64_t UnitLengthPreferences.overrideToMetric.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC24NanoCompassComplications21UnitLengthPreferences_overrideToMetric);
  swift_beginAccess();
  return *v1;
}

uint64_t UnitLengthPreferences.overrideToMetric.setter(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC24NanoCompassComplications21UnitLengthPreferences_overrideToMetric);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t (*UnitLengthPreferences.overrideToMetric.modify())()
{
  return j__swift_endAccess;
}

Swift::Bool __swiftcall UnitLengthPreferences.usesMetric()()
{
  uint64_t v1 = sub_2375D9E40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_2375D9E70();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (unsigned char *)(v0 + OBJC_IVAR____TtC24NanoCompassComplications21UnitLengthPreferences_overrideToMetric);
  swift_beginAccess();
  if (*v12)
  {
    char v13 = 1;
  }
  else
  {
    sub_2375D9E60();
    sub_2375D9E50();
    sub_2375D9E30();
    char v13 = MEMORY[0x237E1BD60](v7, v5);
    BOOL v14 = *(void (**)(char *, uint64_t))(v2 + 8);
    v14(v5, v1);
    v14(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v13 & 1;
}

id UnitLengthPreferences.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnitLengthPreferences();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UnitLengthPreferences()
{
  return self;
}

uint64_t DEMTileCoordinates.x.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x);
}

uint64_t DEMTileCoordinates.y.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y);
}

uint64_t DEMTileCoordinates.__allocating_init(location:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_2375D78B8(a1);
  uint64_t v5 = v4;

  return v5;
}

uint64_t DEMTileCoordinates.init(location:)(void *a1)
{
  sub_2375D78B8(a1);
  uint64_t v3 = v2;

  return v3;
}

unint64_t DEMTileCoordinates.description.getter()
{
  return 0xD000000000000017;
}

uint64_t DEMTileCoordinates.hash.getter()
{
  return sub_2375D9F40();
}

BOOL DEMTileCoordinates.isEqual(_:)(uint64_t a1)
{
  sub_2375D6AF4(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for DEMTileCoordinates();
    if (swift_dynamicCast())
    {
      if (*(void *)(v1 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x) == *(void *)&v5[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x])
      {
        uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y);
        uint64_t v3 = *(void *)&v5[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y];

        return v2 == v3;
      }
    }
  }
  else
  {
    sub_2375D6BA0((uint64_t)v6);
  }
  return 0;
}

id DEMTileCoordinates.copy(with:)@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y);
  uint64_t v5 = (objc_class *)type metadata accessor for DEMTileCoordinates();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x] = v3;
  *(void *)&v6[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y] = v4;
  v8.receiver = v6;
  v8.super_class = v5;
  id result = objc_msgSendSuper2(&v8, sel_init);
  a1[3] = v5;
  *a1 = result;
  return result;
}

BOOL DEMTileCoordinates.isInLookupRange(range:wrt:)(BOOL result, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x);
  uint64_t v4 = *(void *)(a2 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x);
  BOOL v11 = __OFSUB__(v3, v4);
  uint64_t v5 = v3 - v4;
  if (v11)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y);
  uint64_t v7 = *(void *)(a2 + OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y);
  BOOL v11 = __OFSUB__(v6, v7);
  uint64_t v8 = v6 - v7;
  if (v11)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  if (v5 < 0)
  {
    BOOL v11 = __OFSUB__(0, v5);
    uint64_t v5 = -v5;
    if (v11) {
      goto LABEL_15;
    }
  }
  if (v8 < 0)
  {
    BOOL v11 = __OFSUB__(0, v8);
    uint64_t v8 = -v8;
    if (v11) {
      goto LABEL_16;
    }
  }
  if (v5 <= result)
  {
    BOOL v11 = __OFSUB__(v8, result);
    BOOL v9 = v8 == result;
    BOOL v10 = v8 - result < 0;
  }
  else
  {
    BOOL v11 = 0;
    BOOL v9 = 0;
    BOOL v10 = 0;
  }
  return (v10 ^ v11 | v9) != 0;
}

id DEMTileCoordinates.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DEMTileCoordinates();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2375D78B8(void *a1)
{
  uint64_t v3 = v1;
  objc_msgSend(a1, sel_coordinate);
  double v5 = v4;
  objc_msgSend(a1, sel_coordinate);
  double v7 = fmod(v6, 360.0);
  if (v7 < 0.0) {
    double v7 = v7 + 360.0;
  }
  double v8 = v5 / 0.1;
  if ((~COERCE__INT64(v5 / 0.1) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *(void *)&v3[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_x] = (uint64_t)v8;
  double v9 = v7 / 0.1;
  if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v9 < 9.22337204e18)
  {
    *(void *)&v3[OBJC_IVAR____TtC24NanoCompassComplications18DEMTileCoordinates_y] = (uint64_t)v9;

    v10.receiver = v3;
    v10.super_class = (Class)type metadata accessor for DEMTileCoordinates();
    objc_msgSendSuper2(&v10, sel_init);
    return;
  }
LABEL_15:
  __break(1u);
}

uint64_t type metadata accessor for DEMTileCoordinates()
{
  return self;
}

unint64_t sub_2375D7A2C()
{
  unint64_t result = sub_2375D7A60((uint64_t)&unk_26EA491E0);
  qword_268921548 = (uint64_t)&unk_26EA48FE0;
  qword_268921550 = result;
  return result;
}

unint64_t sub_2375D7A60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2375D6B5C((uint64_t *)&unk_268920BE0);
  objc_super v2 = (void *)sub_2375D9EF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  double v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2375D6280(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2375D7B84()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_2375D7C80(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v5 = 134217984;
  uint64_t v6 = objc_msgSend_family(a1, a2, a3, a4);
  _os_log_error_impl(&dword_23759D000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Unhandled complication template family: %ld", (uint8_t *)&v5, 0xCu);
}

void sub_2375D7D84(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _takeLocationAssertion]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23759D000, a2, OS_LOG_TYPE_ERROR, "%s failed to take assertion: %@", (uint8_t *)&v2, 0x16u);
}

void sub_2375D7E10(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[NCLocationUpdateNonRhythmicGNSSDelegate _takeLocationAssertion]_block_invoke_2";
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "%s Location update is still running but we are out of runtime. Fire locationQueryDurationTimer now to stop location update.", (uint8_t *)&v1, 0xCu);
}

void sub_2375D7FFC(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "const LayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23759D000, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

void sub_2375D8088(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[NCLocationUpdateComplicationDelegate activateWaypointComplication]";
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "%s user did not enter targeted view in the app, no activation date is available", (uint8_t *)&v1, 0xCu);
}

void sub_2375D8184()
{
  sub_2375B3DAC();
  sub_2375B3D90(&dword_23759D000, v0, v1, "CMAltimeter instance cannot be nil", v2, v3, v4, v5, v6);
}

void sub_2375D81B8()
{
  sub_2375B3DAC();
  _os_log_debug_impl(&dword_23759D000, v0, OS_LOG_TYPE_DEBUG, "altimeter manager is initialized. This device supports the absolute altitude and is authorized", v1, 2u);
}

void sub_2375D81F8(NSObject *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_msgSend_authorizationStatus(MEMORY[0x263F01710], a2, a3, a4);
  sub_2375B3DB8();
  _os_log_error_impl(&dword_23759D000, a1, OS_LOG_TYPE_ERROR, "Device is not authorized. Current Authorized status is %tu", v5, 0xCu);
}

void sub_2375D8288()
{
  sub_2375B3DAC();
  sub_2375B3D90(&dword_23759D000, v0, v1, "absolute altimeter is not available on this device.", v2, v3, v4, v5, v6);
}

void sub_2375D82BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2375D8330()
{
  sub_2375B3DAC();
  sub_2375B3D90(&dword_23759D000, v0, v1, "absolute altimeter not supported", v2, v3, v4, v5, v6);
}

void sub_2375D8364()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2375B3DB8();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "absolute altimeter error: %@", v1, 0xCu);
}

void sub_2375D83D8()
{
  sub_2375B3DB8();
  sub_2375B3D74(&dword_23759D000, v0, v1, "Asked to start 1Hz location updates for %@, but we are currently tracking that mode.", v2, v3, v4, v5, v6);
}

void sub_2375D8440()
{
  sub_2375B3DB8();
  sub_2375B3D74(&dword_23759D000, v0, v1, "Asked to drop 1Hz location updates for %@, but we are not currently tracking that mode.", v2, v3, v4, v5, v6);
}

void sub_2375D85C4(char a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = @"YES";
  int v3 = 138412802;
  uint64_t v4 = @"com.apple.NanoCompass.ActiveBacktrackUsage.event";
  uint8_t v6 = @"HistoricalPathAvailable";
  __int16 v5 = 2112;
  if ((a1 & 1) == 0) {
    uint64_t v2 = @"NO";
  }
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  _os_log_debug_impl(&dword_23759D000, a2, OS_LOG_TYPE_DEBUG, "Logging %@. %@? %@.", (uint8_t *)&v3, 0x20u);
}

void sub_2375D8678(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2375D86F0()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[NCWaypointManager _deleteWaypointInViewContextByUUID:]";
  sub_2375BB3E8();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "%s waypoint with uuid %@ is not found in the database", (uint8_t *)&v1, 0x16u);
}

void sub_2375D8774(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2375D87EC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_uuid(a1, a2, a3, a4);
  sub_2375BB3E8();
  sub_2375BB3F8(&dword_23759D000, v5, v6, "%s waypoint with uuid %@ is not found in the database", v7, v8, v9, v10, 2u);
}

void sub_2375D8880()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[NCWaypointManager updateWaypointWithUUID:withLocation:withAltitude:]";
  sub_2375BB3E8();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "%s waypoint with uuid %@ is not found in the database", (uint8_t *)&v1, 0x16u);
}

void sub_2375D8904(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "Bundle is empty, can't locate the database or create the persistent containter. Use correct NCWaypointManager instance assigned to the process", v1, 2u);
}

void sub_2375D8948(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "The process might not have entitlement to access the security group, can't locate the database or create the persistent containter. Please add com.apple.security.application-groups in the process entitlement", v1, 2u);
}

void sub_2375D898C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2375D8A04(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_userInfo(a1, a2, a3, a4);
  sub_2375BB3E8();
  sub_2375BB3F8(&dword_23759D000, v5, v6, "fetch request hits unresolved error %@, %@", v7, v8, v9, v10, 2u);
}

void sub_2375D8A9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2375D8B14(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_userInfo(a1, a2, a3, a4);
  sub_2375BB3E8();
  sub_2375BB3F8(&dword_23759D000, v5, v6, "countForFetchRequest hit unresolved error %@, %@", v7, v8, v9, v10, 2u);
}

void sub_2375D8BAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2375D8C24(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_userInfo(a1, a2, a3, a4);
  int v7 = 136315650;
  uint64_t v8 = "-[NCWaypointManager _commitToCoreData]";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_23759D000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%s saveContext hit unresolved error %@, %@", (uint8_t *)&v7, 0x20u);
}

void sub_2375D8CE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2375D8D5C(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[NCLocationUpdateAppDelegate _takeLocationAuthRequestAssertion]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23759D000, a2, OS_LOG_TYPE_ERROR, "%s failed to take assertion for requesting location authorization: %@", (uint8_t *)&v2, 0x16u);
}

void sub_2375D8E88()
{
  sub_2375C4F5C();
  sub_2375B3D74(&dword_23759D000, v0, v1, "CL/CR Session started. Delta: %.fms.", v2, v3, v4, v5, v6);
}

void sub_2375D8EF4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2375C4F5C();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "CL/CR Session failed to start. Delta: %.fms.", v1, 0xCu);
}

void sub_2375D8F6C()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "The handler for starting the core location session has already been called.", v2, v3, v4, v5, v6);
}

void sub_2375D8FA0()
{
  sub_2375C4F5C();
  sub_2375B3D74(&dword_23759D000, v0, v1, "CL/CR Session (without lookback) started. Delta: %.fms.", v2, v3, v4, v5, v6);
}

void sub_2375D900C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2375C4F5C();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "CL/CR Session (without lookback) failed to start. Delta: %.fms.", v1, 0xCu);
}

void sub_2375D9084()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "The handler for starting the core location session (without lookback) has already been called.", v2, v3, v4, v5, v6);
}

void sub_2375D90B8()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "Ending core location session.", v2, v3, v4, v5, v6);
}

void sub_2375D90EC()
{
  sub_2375C4F5C();
  sub_2375B3D74(&dword_23759D000, v0, v1, "CL/CR Session ended. Delta: %.fms.", v2, v3, v4, v5, v6);
}

void sub_2375D9158()
{
  sub_2375B3DAC();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "We are processing a subsequent update after terminating the updater. This seems like a CoreLocation bug.", v1, 2u);
}

void sub_2375D9198()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "Location services is considered off; isRemote will return NO.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_2375D91CC()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "Fetching is remote.", v2, v3, v4, v5, v6);
}

void sub_2375D9200()
{
  sub_2375C4F5C();
  sub_2375B3D74(&dword_23759D000, v0, v1, "CL/CR is remote fetch ended. Delta: %.fms.", v2, v3, v4, v5, v6);
}

void sub_2375D926C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2375C4F68();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "CL/CR is remote fetch ended with error. Delta: %.fms. Error: %{public}@", v1, 0x16u);
}

void sub_2375D92E0()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "Location services is considered off; willPrompt will return NO.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_2375D9314()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "Fetching will prompt.", v2, v3, v4, v5, v6);
}

void sub_2375D9348()
{
  sub_2375C4F5C();
  sub_2375B3D74(&dword_23759D000, v0, v1, "CL/CR will prompt fetch ended. Delta: %.fms.", v2, v3, v4, v5, v6);
}

void sub_2375D93B4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2375C4F68();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "CL/CR will prompt fetch ended with error. Delta: %.fms. Error: %{public}@", v1, 0x16u);
}

void sub_2375D9428()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "Received better altitude update.", v2, v3, v4, v5, v6);
}

void sub_2375D945C()
{
  sub_2375B3DAC();
  sub_2375C4F40(&dword_23759D000, v0, v1, "Received better location update.", v2, v3, v4, v5, v6);
}

void sub_2375D9490(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_family(a1, a2, a3, a4);
  sub_2375C6A50(&dword_23759D000, v4, v5, "Unhandled complication (sample) template family: %ld", v6, v7, v8, v9, 0);
}

void sub_2375D950C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_family(a1, a2, a3, a4);
  sub_2375C6A50(&dword_23759D000, v4, v5, "Unhandled complication template family: %ld", v6, v7, v8, v9, 0);
}

void sub_2375D9588(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[WaypointsComplicationDataSource _getWaypointUUIDFromDescriptor:]";
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "%s: We have a waypoint descriptor with no uuid", (uint8_t *)&v1, 0xCu);
}

void sub_2375D960C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "We have a waypoint descriptor with no uuid", v1, 2u);
}

void sub_2375D9650()
{
}

void sub_2375D970C(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_label(a1, a2, a3, a4);
  uint64_t v9 = objc_msgSend_name(a2, v6, v7, v8);
  sub_2375CD244();
  sub_2375BB3F8(&dword_23759D000, v10, v11, "Attempted to update waypoint %@ from guide %@, which is not supported.", v12, v13, v14, v15, v16);
}

void sub_2375D97B0(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_label(a1, a2, a3, a4);
  uint64_t v9 = objc_msgSend_name(a2, v6, v7, v8);
  sub_2375CD244();
  sub_2375BB3F8(&dword_23759D000, v10, v11, "Attempted to delete waypoint %@ from guide %@, which is not supported.", v12, v13, v14, v15, v16);
}

void sub_2375D9854(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "Device does not support motion activity tracking. Assuming user is walking in this case.", v1, 2u);
}

void sub_2375D9898(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_23759D000, log, OS_LOG_TYPE_ERROR, "Device does not support pedometer step counting. Assuming user is walking in this case.", v1, 2u);
}

void sub_2375D98DC(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_23759D000, a2, OS_LOG_TYPE_ERROR, "Pedometer error %@. Assuming user is walking in this case.", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_2375D9958()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_2375D997C(v0);
}

void sub_2375D997C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_count(a1, a2, a3, a4);
  sub_2375D600C();
  sub_2375D6064(&dword_23759D000, v4, v5, "%{public}s: Merge Finished. Final waypoint count is %lu", v6, v7, v8, v9, 2u);
}

void sub_2375D9A00()
{
  sub_2375D600C();
  sub_2375D6020(&dword_23759D000, v0, v1, "%{public}s: Merge - Adding %lu more waypoints from first array", v2, v3, v4, v5, 2u);
}

void sub_2375D9A74()
{
  sub_2375D600C();
  sub_2375D6020(&dword_23759D000, v0, v1, "%{public}s: Merge - Adding %lu more waypoints from second array", v2, v3, v4, v5, 2u);
}

void sub_2375D9AE8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_count(a1, a2, a3, a4);
  sub_2375D600C();
  sub_2375D6064(&dword_23759D000, v4, v5, "%{public}s: Merge - After combining waypoint arrays, waypoint count is %lu.", v6, v7, v8, v9, 2u);
}

void sub_2375D9B6C()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136446722;
  sub_2375D600C();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_23759D000, v2, OS_LOG_TYPE_DEBUG, "%{public}s: Merge starting. Num waypoints in first array: %lu. Num waypoints in second array: %lu", (uint8_t *)v3, 0x20u);
}

void sub_2375D9BF8()
{
  sub_2375D6050();
  sub_2375D6020(&dword_23759D000, v0, v1, "%{public}s Finding compass waypoints within a radius of %f meters", v2, v3, v4, v5, 2u);
}

void sub_2375D9C70()
{
  sub_2375D6050();
  sub_2375D6020(&dword_23759D000, v0, v1, "%{public}s Finding system waypoints within a radius of %f meters", v2, v3, v4, v5, 2u);
}

void sub_2375D9CE8(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_uuid(a1, a2, a3, a4);
  uint64_t v9 = objc_msgSend_UUIDString(v5, v6, v7, v8);
  v10[0] = 136315394;
  sub_2375D603C();
  _os_log_error_impl(&dword_23759D000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%s called for a guide (uuid = %{public}@) that can't be disabled, disallowing", (uint8_t *)v10, 0x16u);
}

void sub_2375D9DA0()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  sub_2375D603C();
  _os_log_error_impl(&dword_23759D000, v0, OS_LOG_TYPE_ERROR, "%s: Fetching map guide collections failed with %{public}@", (uint8_t *)v1, 0x16u);
}

uint64_t sub_2375D9E30()
{
  return MEMORY[0x270EF0E90]();
}

uint64_t sub_2375D9E40()
{
  return MEMORY[0x270EF0E98]();
}

uint64_t sub_2375D9E50()
{
  return MEMORY[0x270EF0EB0]();
}

uint64_t sub_2375D9E60()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_2375D9E70()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2375D9E80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2375D9E90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2375D9EA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2375D9EB0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2375D9EC0()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_2375D9ED0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2375D9EE0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2375D9EF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2375D9F00()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2375D9F10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2375D9F20()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2375D9F30()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2375D9F40()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_2375D9F50()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2375D9F60()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return MEMORY[0x270EE3168]();
}

uint64_t CLKFloatEqualsFloat()
{
  return MEMORY[0x270EE3190]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x270EE31B0]();
}

uint64_t CLKIsNTKDaemon()
{
  return MEMORY[0x270EE31E0]();
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return MEMORY[0x270EE3228]();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return MEMORY[0x270EE3230]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}