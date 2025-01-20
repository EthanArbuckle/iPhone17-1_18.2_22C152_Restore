uint64_t CDRichComplicationCornerTextCustomViewRect(uint64_t a1, uint64_t a2)
{
  return +[CDRichComplicationCornerUtilities cornerGaugeCustomViewRectWithPosition:a2 forDevice:a1];
}

BOOL CDTemplicateComplicationShouldPerformFullFade(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 conformsToProtocol:&unk_26CF669C0]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v1 timelineAnimationFadeTypeOverride] == 1;

  return v2;
}

uint64_t CDRichComplicationCornerGaugeCustomViewRect(uint64_t a1, uint64_t a2)
{
  return +[CDRichComplicationCornerUtilities cornerGaugeCustomViewRectWithPosition:a2 forDevice:a1];
}

void sub_21E3E56C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CapCircleRadius(double a1, double a2, double a3)
{
  return a2 - (a3 - sqrt(-(a3 * a1) - a3 * a2 + a2 * a1 + a1 * a1) * -1.41421356) + a1;
}

double CapIntersectAngle(double a1, double a2, double a3)
{
  return atan2(a1 - a3, a2 + a3);
}

id CDGenerateMeterLayersOnLayer(void *a1, void *a2)
{
  id v3 = a1;
  v4 = a2;
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:18];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  for (unint64_t i = 0; i != 18; ++i)
  {
    v7 = objc_opt_new();
    if (_CDMeterDisabledLayerActions_onceToken != -1) {
      dispatch_once(&_CDMeterDisabledLayerActions_onceToken, &__block_literal_global_1);
    }
    [v7 setActions:_CDMeterDisabledLayerActions__dictionary];
    id v8 = [MEMORY[0x263F825C8] systemGrayColor];
    objc_msgSend(v7, "setFillColor:", objc_msgSend(v8, "CGColor"));

    [v3 addSublayer:v7];
    [v5 addObject:v7];
    if (v4) {
      v4[2](v4, v7, i, i == 10, (double)i / 18.0);
    }
  }
  [MEMORY[0x263F158F8] commit];

  return v5;
}

double CDMeterProgressForIndex(unint64_t a1)
{
  return (double)a1 / 18.0;
}

void CDColorizeMeterProgress(void *a1, void *a2, void *a3, double a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if ([v7 count])
  {
    for (unint64_t i = 0; i < [v7 count]; ++i)
    {
      v11 = [v7 objectAtIndexedSubscript:i];
      v12 = v11;
      if ((double)i / 18.0 >= a4)
      {
        [v11 setFillColor:0];
        if (!v9) {
          goto LABEL_11;
        }
      }
      else
      {
        unint64_t v13 = (unint64_t)((double)(unint64_t)[v8 count] * a4);
        if ([v8 count] <= v13) {
          [v8 lastObject];
        }
        else {
        id v14 = [v8 objectAtIndexedSubscript:v13];
        }
        objc_msgSend(v12, "setFillColor:", objc_msgSend(v14, "CGColor"));

        if (!v9) {
          goto LABEL_11;
        }
      }
      v16[0] = v9;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      [v12 setFilters:v15];

LABEL_11:
    }
  }
}

unint64_t CDMeterIndexForProgress(double a1)
{
  return (unint64_t)(a1 * 18.0);
}

id CDGenerateMeterBackgroundGradientColors(uint64_t a1)
{
  uint64_t v1 = a1;
  for (unint64_t i = [MEMORY[0x263EFF980] arrayWithCapacity:a1];
  {
    id v3 = [MEMORY[0x263F825C8] whiteColor];
    [i addObject:v3];
  }
  return i;
}

uint64_t CLKUpdateReasonFromCDReason(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

__n64 perpendicularClockwise(double a1)
{
  float v1 = -*(float *)&a1;
  result.n64_u32[0] = vdup_lane_s32(*(int32x2_t *)&a1, 1).u32[0];
  result.n64_f32[1] = v1;
  return result;
}

BOOL CDRichComplicationProgressFillStyleIsMetered(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

void sub_21E3EAFF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21E3EB254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CDRichComplicationCornerGaugeOuterFontSize(void *a1)
{
  _LayoutConstants(a1, (uint64_t)v2);
  return v2[0];
}

void _LayoutConstants(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_5);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_5);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_5);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion_5;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_5, obj);
  _LayoutConstants___previousCLKDeviceVersion_5 = [obj version];

  ___LayoutConstants_block_invoke_5(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_5);
  long long v10 = *(_OWORD *)&qword_267D2C650;
  *(_OWORD *)(a2 + 32) = xmmword_267D2C640;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_267D2C660;
  *(void *)(a2 + 80) = qword_267D2C670;
  long long v11 = *(_OWORD *)&qword_267D2C630;
  *(_OWORD *)a2 = _LayoutConstants___constants_0;
  *(_OWORD *)(a2 + 16) = v11;
}

double CDRichComplicationCornerGaugeOuterImageMaxSize(void *a1)
{
  _LayoutConstants(a1, (uint64_t)v2);
  return v3;
}

void sub_21E3EC5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LayoutConstants_0(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion_6;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_6, obj);
  _LayoutConstants___previousCLKDeviceVersion_6 = [obj version];

  ___LayoutConstants_block_invoke_6(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  long long v10 = *(_OWORD *)&qword_267D2C6C0;
  *(_OWORD *)(a2 + 32) = xmmword_267D2C6B0;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_267D2C6D0;
  *(void *)(a2 + 80) = qword_267D2C6E0;
  long long v11 = *(_OWORD *)&qword_267D2C6A0;
  *(_OWORD *)a2 = _LayoutConstants___constants_1;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_21E3ED63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LayoutConstants_1(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_7);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_7);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_7);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion_7;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_7, obj);
  _LayoutConstants___previousCLKDeviceVersion_7 = [obj version];

  ___LayoutConstants_block_invoke_7(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_7);
  long long v10 = *(_OWORD *)&qword_267D2C730;
  *(_OWORD *)(a2 + 32) = xmmword_267D2C720;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_267D2C740;
  *(void *)(a2 + 80) = qword_267D2C750;
  long long v11 = *(_OWORD *)&qword_267D2C710;
  *(_OWORD *)a2 = _LayoutConstants___constants_2;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_21E3EE18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return objc_opt_class();
}

uint64_t CDShowGossamerUI(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock(&CDShowGossamerUI___lock);
  id WeakRetained = objc_loadWeakRetained(&CDShowGossamerUI___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDShowGossamerUI___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDShowGossamerUI___cachedDevice, v1);
    CDShowGossamerUI___previousCLKDeviceVersion = [v1 version];

    __CDShowGossamerUI_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDShowGossamerUI___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock(&CDShowGossamerUI___lock);
  uint64_t v9 = CDShowGossamerUI___showGossamerUI;

  return v9;
}

void __CDShowGossamerUI_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E"];
  char v3 = [v5 supportsCapability:v2];

  if (v3) {
    LOBYTE(v4) = 1;
  }
  else {
    int v4 = [v5 isPaired] ^ 1;
  }
  CDShowGossamerUI___showGossamerUI = v4 & _os_feature_enabled_impl();
}

id CDRichComplicationMonoFontDescriptor()
{
  if (CDRichComplicationMonoFontDescriptor_onceToken != -1) {
    dispatch_once(&CDRichComplicationMonoFontDescriptor_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)CDRichComplicationMonoFontDescriptor_fontDescriptor;
  return v0;
}

void __CDRichComplicationMonoFontDescriptor_block_invoke()
{
  v11[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263F81720];
  v10[0] = *MEMORY[0x263F817A0];
  v8[0] = *MEMORY[0x263F81850];
  id v1 = [NSNumber numberWithDouble:*MEMORY[0x263F81840]];
  v8[1] = *MEMORY[0x263F817E8];
  v9[0] = v1;
  v9[1] = *MEMORY[0x263F817D0];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v3 = *MEMORY[0x263F81748];
  v11[0] = v2;
  v11[1] = &unk_26CF5B8F0;
  uint64_t v4 = *MEMORY[0x263F81760];
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = *MEMORY[0x263F03BB8];
  v11[2] = &unk_26CF5B550;
  v11[3] = &unk_26CF5B198;
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v6 = [v0 fontDescriptorWithFontAttributes:v5];
  id v7 = (void *)CDRichComplicationMonoFontDescriptor_fontDescriptor;
  CDRichComplicationMonoFontDescriptor_fontDescriptor = v6;
}

id CDRichComplicationSemiboldFontDescriptor()
{
  if (CDRichComplicationSemiboldFontDescriptor_onceToken != -1) {
    dispatch_once(&CDRichComplicationSemiboldFontDescriptor_onceToken, &__block_literal_global_24);
  }
  uint64_t v0 = (void *)CDRichComplicationSemiboldFontDescriptor_fontDescriptor;
  return v0;
}

void __CDRichComplicationSemiboldFontDescriptor_block_invoke()
{
  v11[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263F81720];
  v10[0] = *MEMORY[0x263F817A0];
  v8[0] = *MEMORY[0x263F81850];
  id v1 = [NSNumber numberWithDouble:*MEMORY[0x263F81840]];
  v8[1] = *MEMORY[0x263F817E8];
  v9[0] = v1;
  v9[1] = *MEMORY[0x263F817D0];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v3 = *MEMORY[0x263F81748];
  v11[0] = v2;
  v11[1] = MEMORY[0x263EFFA68];
  uint64_t v4 = *MEMORY[0x263F81760];
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = *MEMORY[0x263F03BB8];
  v11[2] = &unk_26CF5B550;
  v11[3] = &unk_26CF5B198;
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v6 = [v0 fontDescriptorWithFontAttributes:v5];
  id v7 = (void *)CDRichComplicationSemiboldFontDescriptor_fontDescriptor;
  CDRichComplicationSemiboldFontDescriptor_fontDescriptor = v6;
}

void sub_21E3F1764(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

double CDRichComplicationCornerTextOuterFontSize(void *a1)
{
  _LayoutConstants_2(a1, v2);
  return v2[0];
}

void _LayoutConstants_2(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion_8;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_8, obj);
  _LayoutConstants___previousCLKDeviceVersion_8 = [obj version];

  ___LayoutConstants_block_invoke_8(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  long long v10 = *(_OWORD *)&qword_267D2C7E8;
  a2[2] = xmmword_267D2C7D8;
  a2[3] = v10;
  a2[4] = xmmword_267D2C7F8;
  long long v11 = *(_OWORD *)&qword_267D2C7C8;
  *a2 = _LayoutConstants___constants_3;
  a2[1] = v11;
}

double CDRichComplicationCornerTextOuterImageMaxSize(void *a1)
{
  _LayoutConstants_2(a1, v2);
  return v3;
}

void sub_21E3F22D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double _LayoutConstants_3(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_9);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_LayoutConstants___cachedDevice_9, v1);
    _LayoutConstants___previousCLKDeviceVersion_9 = [v1 version];

    ___LayoutConstants_block_invoke_9(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _LayoutConstants___previousCLKDeviceVersion_9;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_9);
  double v9 = *(double *)&_LayoutConstants_constants_0;

  return v9;
}

double CDRichComplicationCornerInnerImageMaxSize(void *a1)
{
  _LayoutConstants_3(a1);
  return v1;
}

double CDRichComplicationCornerInnerImagePadding(void *a1)
{
  _LayoutConstants_3(a1);
  return v1;
}

void sub_21E3F30EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id _CDLoggingObjectForDomain(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (dispatch_once_t *)((char *)&_CDLoggingObjectForDomain_onceTokens + 8 * a1);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___CDLoggingObjectForDomain_block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a2;
  if (*v3 != -1) {
    dispatch_once(v3, v6);
  }
  id v4 = (void *)_CDLoggingObjectForDomain___logObjects[a1];
  return v4;
}

void sub_21E3F4654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double CDCircularSmallComplicationDiameter(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCircularSmallComplicationDiameter___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCircularSmallComplicationDiameter___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCircularSmallComplicationDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCircularSmallComplicationDiameter___cachedDevice, v1);
    CDCircularSmallComplicationDiameter___previousCLKDeviceVersion = [v1 version];

    __CDCircularSmallComplicationDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCircularSmallComplicationDiameter___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCircularSmallComplicationDiameter___lock);
  double v9 = *(double *)&CDCircularSmallComplicationDiameter__diameter;

  return v9;
}

void __CDCircularSmallComplicationDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:2];
  v5[0] = &unk_26CF5B2D0;
  v5[1] = &unk_26CF5B2E8;
  v6[0] = &unk_26CF5B610;
  v6[1] = &unk_26CF5B620;
  v5[2] = &unk_26CF5B300;
  v5[3] = &unk_26CF5B318;
  v6[2] = &unk_26CF5B630;
  v6[3] = &unk_26CF5B640;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  [v2 scaledValue:v3 withOverrides:32.0];
  CDCircularSmallComplicationDiameter__diameter = v4;
}

double CDCircularMediumComplicationDiameter(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCircularMediumComplicationDiameter___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCircularMediumComplicationDiameter___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCircularMediumComplicationDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCircularMediumComplicationDiameter___cachedDevice, v1);
    CDCircularMediumComplicationDiameter___previousCLKDeviceVersion = [v1 version];

    __CDCircularMediumComplicationDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCircularMediumComplicationDiameter___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCircularMediumComplicationDiameter___lock);
  double v9 = *(double *)&CDCircularMediumComplicationDiameter__diameter;

  return v9;
}

void __CDCircularMediumComplicationDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[7] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:2];
  v5[0] = &unk_26CF5B2D0;
  v5[1] = &unk_26CF5B2E8;
  v6[0] = &unk_26CF5B620;
  v6[1] = &unk_26CF5B650;
  v5[2] = &unk_26CF5B330;
  v5[3] = &unk_26CF5B348;
  v6[2] = &unk_26CF5B660;
  v6[3] = &unk_26CF5B670;
  void v5[4] = &unk_26CF5B360;
  v5[5] = &unk_26CF5B300;
  v6[4] = &unk_26CF5B670;
  void v6[5] = &unk_26CF5B650;
  v5[6] = &unk_26CF5B318;
  void v6[6] = &unk_26CF5B680;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:7];
  [v2 scaledValue:v3 withOverrides:42.0];
  CDCircularMediumComplicationDiameter__diameter = v4;
}

double CDGraphicSubdialComplicationDiameter(void *a1)
{
  return CDCircularMediumComplicationDiameter(a1) + 4.0;
}

double CDGraphicSubdialComplicationEditingInset()
{
  return 5.0;
}

double CDGraphicSubdialComplicationDistanceFromCenter(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicSubdialComplicationDistanceFromCenter___lock);
  id WeakRetained = objc_loadWeakRetained(&CDGraphicSubdialComplicationDistanceFromCenter___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDGraphicSubdialComplicationDistanceFromCenter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDGraphicSubdialComplicationDistanceFromCenter___cachedDevice, v1);
    CDGraphicSubdialComplicationDistanceFromCenter___previousCLKDeviceVersion = [v1 version];

    __CDGraphicSubdialComplicationDistanceFromCenter_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDGraphicSubdialComplicationDistanceFromCenter___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicSubdialComplicationDistanceFromCenter___lock);
  double v9 = *(double *)&CDGraphicSubdialComplicationDistanceFromCenter__distance;

  return v9;
}

void __CDGraphicSubdialComplicationDistanceFromCenter_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  id v7 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v7 scaledValue:3 withOverride:16.0 forSizeClass:19.0];
  double v5 = v4;
  double v6 = CDCircularMediumComplicationDiameter(v3);

  *(double *)&CDGraphicSubdialComplicationDistanceFromCenter__distance = v5 + (v6 + 4.0) * 0.5;
}

double CDGraphicExtraLargeComplicationContentDiameter(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicExtraLargeComplicationContentDiameter___lock);
  id WeakRetained = objc_loadWeakRetained(&CDGraphicExtraLargeComplicationContentDiameter___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDGraphicExtraLargeComplicationContentDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDGraphicExtraLargeComplicationContentDiameter___cachedDevice, v1);
    CDGraphicExtraLargeComplicationContentDiameter___previousCLKDeviceVersion = [v1 version];

    __CDGraphicExtraLargeComplicationContentDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDGraphicExtraLargeComplicationContentDiameter___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicExtraLargeComplicationContentDiameter___lock);
  double v9 = *(double *)&CDGraphicExtraLargeComplicationContentDiameter__contentDiameter;

  return v9;
}

void __CDGraphicExtraLargeComplicationContentDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  void v6[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:2];
  v5[0] = &unk_26CF5B2D0;
  v5[1] = &unk_26CF5B378;
  v6[0] = &unk_26CF5B690;
  v6[1] = &unk_26CF5B690;
  v5[2] = &unk_26CF5B2E8;
  v5[3] = &unk_26CF5B348;
  v6[2] = &unk_26CF5B6A0;
  v6[3] = &unk_26CF5B6B0;
  void v5[4] = &unk_26CF5B360;
  v6[4] = &unk_26CF5B6B0;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
  [v2 scaledValue:v3 withOverrides:120.0];
  CDGraphicExtraLargeComplicationContentDiameter__contentDiameter = v4;
}

double CDGraphicLargeRectangularComplicationSize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationSize___lock);
  id WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationSize___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationSize___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationSize___previousCLKDeviceVersion = [v1 version];

    __CDGraphicLargeRectangularComplicationSize_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDGraphicLargeRectangularComplicationSize___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationSize___lock);
  double v9 = *(double *)&CDGraphicLargeRectangularComplicationSize__complicationSize_0;

  return v9;
}

void __CDGraphicLargeRectangularComplicationSize_block_invoke(uint64_t a1, uint64_t a2)
{
  v12[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v11[0] = &unk_26CF5B2E8;
  v11[1] = &unk_26CF5B348;
  v12[0] = &unk_26CF5B6C0;
  v12[1] = &unk_26CF5B6D0;
  v11[2] = &unk_26CF5B360;
  v11[3] = &unk_26CF5B300;
  v12[2] = &unk_26CF5B6D0;
  v12[3] = &unk_26CF5B6E0;
  v11[4] = &unk_26CF5B318;
  v12[4] = &unk_26CF5B6F0;
  id v3 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  [v2 scaledValue:v3 withOverrides:162.0];
  uint64_t v5 = v4;

  v9[0] = &unk_26CF5B2E8;
  v9[1] = &unk_26CF5B330;
  v10[0] = &unk_26CF5B700;
  v10[1] = &unk_26CF5B710;
  void v9[2] = &unk_26CF5B348;
  v9[3] = &unk_26CF5B360;
  v10[2] = &unk_26CF5B720;
  v10[3] = &unk_26CF5B720;
  v9[4] = &unk_26CF5B300;
  v9[5] = &unk_26CF5B318;
  void v10[4] = &unk_26CF5B730;
  v10[5] = &unk_26CF5B740;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  [v2 scaledValue:v6 withOverrides:69.0];
  uint64_t v8 = v7;

  CDGraphicLargeRectangularComplicationSize__complicationSize_0 = v5;
  CDGraphicLargeRectangularComplicationSize__complicationSize_1 = v8;
}

double CDGraphicLargeRectangularComplicationInset(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationInset___lock);
  id WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationInset___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationInset___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationInset___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationInset___previousCLKDeviceVersion = [v1 version];

    __CDGraphicLargeRectangularComplicationInset_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDGraphicLargeRectangularComplicationInset___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationInset___lock);
  double v9 = *(double *)&CDGraphicLargeRectangularComplicationInset__inset;

  return v9;
}

void __CDGraphicLargeRectangularComplicationInset_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:*MEMORY[0x263EFCF48]];
  CDGraphicLargeRectangularComplicationInset__inset = v2;
}

double CDGraphicLargeRectangularComplicationLargeImageHeight(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationLargeImageHeight___lock);
  id WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationLargeImageHeight___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationLargeImageHeight___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationLargeImageHeight___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationLargeImageHeight___previousCLKDeviceVersion = [v1 version];

    __CDGraphicLargeRectangularComplicationLargeImageHeight_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDGraphicLargeRectangularComplicationLargeImageHeight___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationLargeImageHeight___lock);
  double v9 = *(double *)&CDGraphicLargeRectangularComplicationLargeImageHeight__largeImageHeight;

  return v9;
}

void __CDGraphicLargeRectangularComplicationLargeImageHeight_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:3 withOverride:47.0 forSizeClass:54.0];
  CDGraphicLargeRectangularComplicationLargeImageHeight__largeImageHeight = v2;
}

double CDGraphicLargeRectangularComplicationCornerRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationCornerRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationCornerRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationCornerRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationCornerRadius___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationCornerRadius___previousCLKDeviceVersion = [v1 version];

    __CDGraphicLargeRectangularComplicationCornerRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDGraphicLargeRectangularComplicationCornerRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationCornerRadius___lock);
  double v9 = *(double *)&CDGraphicLargeRectangularComplicationCornerRadius__cornerRadius;

  return v9;
}

void __CDGraphicLargeRectangularComplicationCornerRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:*MEMORY[0x263EFCF50]];
  CDGraphicLargeRectangularComplicationCornerRadius__cornerRadius = v2;
}

double CDGraphicCircularScaledComplicationDiameter(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicCircularScaledComplicationDiameter___lock);
  id WeakRetained = objc_loadWeakRetained(&CDGraphicCircularScaledComplicationDiameter___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDGraphicCircularScaledComplicationDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDGraphicCircularScaledComplicationDiameter___cachedDevice, v1);
    CDGraphicCircularScaledComplicationDiameter___previousCLKDeviceVersion = [v1 version];

    __CDGraphicCircularScaledComplicationDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDGraphicCircularScaledComplicationDiameter___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicCircularScaledComplicationDiameter___lock);
  double v9 = *(double *)&CDGraphicCircularScaledComplicationDiameter__complicationDiameter;

  return v9;
}

void __CDGraphicCircularScaledComplicationDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  void v6[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CF5B2E8;
  v5[1] = &unk_26CF5B330;
  v6[0] = &unk_26CF5B750;
  v6[1] = &unk_26CF5B620;
  v5[2] = &unk_26CF5B348;
  v5[3] = &unk_26CF5B360;
  v6[2] = &unk_26CF5B760;
  v6[3] = &unk_26CF5B760;
  void v5[4] = &unk_26CF5B300;
  void v5[5] = &unk_26CF5B318;
  v6[4] = &unk_26CF5B750;
  void v6[5] = &unk_26CF5B770;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  [v2 scaledValue:v3 withOverrides:34.0];
  CDGraphicCircularScaledComplicationDiameter__complicationDiameter = v4;
}

double CDCornerComplicationSize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationSize___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationSize___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationSize___cachedDevice, v1);
    CDCornerComplicationSize___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationSize___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationSize___lock);
  double v9 = *(double *)&CDCornerComplicationSize__complicationSize_0;

  return v9;
}

void __CDCornerComplicationSize_block_invoke(uint64_t a1, void *a2)
{
  v19[4] = *MEMORY[0x263EF8340];
  id v2 = a2;
  [v2 sizeClass];
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    double v3 = _avoniaComplicationSize(v2);
    uint64_t v5 = v4;

    CDCornerComplicationSize__complicationSize_0 = *(void *)&v3;
    CDCornerComplicationSize__complicationSize_1 = v5;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFD188] metricsWithDevice:v2 identitySizeClass:2];

    v18[0] = &unk_26CF5B2E8;
    long long v17 = xmmword_21E422480;
    id v7 = [MEMORY[0x263F08D40] valueWithBytes:&v17 objCType:"{CGSize=dd}"];
    v19[0] = v7;
    v18[1] = &unk_26CF5B330;
    long long v16 = xmmword_21E422490;
    uint64_t v8 = [MEMORY[0x263F08D40] valueWithBytes:&v16 objCType:"{CGSize=dd}"];
    v19[1] = v8;
    v18[2] = &unk_26CF5B348;
    long long v15 = xmmword_21E4224A0;
    double v9 = [MEMORY[0x263F08D40] valueWithBytes:&v15 objCType:"{CGSize=dd}"];
    v19[2] = v9;
    v18[3] = &unk_26CF5B360;
    long long v14 = xmmword_21E4224B0;
    long long v10 = [MEMORY[0x263F08D40] valueWithBytes:&v14 objCType:"{CGSize=dd}"];
    v19[3] = v10;
    long long v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    objc_msgSend(v6, "scaledSize:withOverrides:", v11, 77.5, 61.5);
    CDCornerComplicationSize__complicationSize_0 = v12;
    CDCornerComplicationSize__complicationSize_1 = v13;
  }
}

double _avoniaComplicationSize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_avoniaComplicationSize___lock);
  id WeakRetained = objc_loadWeakRetained(&_avoniaComplicationSize___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_avoniaComplicationSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_avoniaComplicationSize___cachedDevice, v1);
    _avoniaComplicationSize___previousCLKDeviceVersion = [v1 version];

    ___avoniaComplicationSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _avoniaComplicationSize___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_avoniaComplicationSize___lock);
  double v9 = *(double *)&_avoniaComplicationSize__complicationSize_0;

  return v9;
}

double CDCornerComplicationKeylineSize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationKeylineSize___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationKeylineSize___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationKeylineSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationKeylineSize___cachedDevice, v1);
    CDCornerComplicationKeylineSize___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationKeylineSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationKeylineSize___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationKeylineSize___lock);
  double v9 = *(double *)&CDCornerComplicationKeylineSize__complicationSize_0;

  return v9;
}

void __CDCornerComplicationKeylineSize_block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  [v2 sizeClass];
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    CDCornerComplicationKeylineSize__complicationSize_0 = _avoniaComplicationSize(v2);
    CDCornerComplicationKeylineSize__complicationSize_1 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFD188] metricsWithDevice:v2 identitySizeClass:2];
    [v2 screenBounds];
    objc_msgSend(v4, "setScale:forSizeClass:", objc_msgSend(v2, "sizeClass"), v5 / 162.0);
    long long v11 = &unk_26CF5B2E8;
    long long v10 = xmmword_21E4224C0;
    uint64_t v6 = [MEMORY[0x263F08D40] valueWithBytes:&v10 objCType:"{CGSize=dd}"];
    v12[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    objc_msgSend(v4, "scaledSize:withOverrides:", v7, 77.5, 58.5);
    CDCornerComplicationKeylineSize__complicationSize_0 = v8;
    CDCornerComplicationKeylineSize__complicationSize_1 = v9;
  }
}

double CDCornerComplicationKeylineInnerRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationKeylineInnerRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationKeylineInnerRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationKeylineInnerRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationKeylineInnerRadius___cachedDevice, v1);
    CDCornerComplicationKeylineInnerRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationKeylineInnerRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationKeylineInnerRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationKeylineInnerRadius___lock);
  double v9 = *(double *)&CDCornerComplicationKeylineInnerRadius__innerDiameter;

  return v9;
}

void __CDCornerComplicationKeylineInnerRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CF5B2E8;
  v5[1] = &unk_26CF5B300;
  v6[0] = &unk_26CF5B780;
  v6[1] = &unk_26CF5B790;
  v5[2] = &unk_26CF5B318;
  v6[2] = &unk_26CF5B7A0;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v2 scaledValue:v3 withOverrides:84.0];
  CDCornerComplicationKeylineInnerRadius__innerDiameter = v4;
}

double CDCornerComplicationCenterPointRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationCenterPointRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationCenterPointRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationCenterPointRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationCenterPointRadius___cachedDevice, v1);
    CDCornerComplicationCenterPointRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationCenterPointRadius_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationCenterPointRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationCenterPointRadius___lock);
  double v9 = *(double *)&CDCornerComplicationCenterPointRadius__complicationCenterRadius;

  return v9;
}

double __CDCornerComplicationCenterPointRadius_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = CDCornerComplicationKeylineInnerRadius(v2);
  double v4 = _avoniaCornerComplicationOuterRadius(v2);
  [v2 screenCornerRadius];
  double v6 = v5;

  double result = (v3 + v4 + v6 * -0.414213562) * 0.5;
  *(double *)&CDCornerComplicationCenterPointRadius__complicationCenterRadius = result;
  return result;
}

double _avoniaCornerComplicationOuterRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_avoniaCornerComplicationOuterRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&_avoniaCornerComplicationOuterRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_avoniaCornerComplicationOuterRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_avoniaCornerComplicationOuterRadius___cachedDevice, v1);
    _avoniaCornerComplicationOuterRadius___previousCLKDeviceVersion = [v1 version];

    ___avoniaCornerComplicationOuterRadius_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _avoniaCornerComplicationOuterRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_avoniaCornerComplicationOuterRadius___lock);
  double v9 = *(double *)&_avoniaCornerComplicationOuterRadius__complicationOuterRadius;

  return v9;
}

uint64_t CDWidgetGroupSafeAreaInsets()
{
  return MEMORY[0x270EE3278]();
}

uint64_t CDWidgetGroupNestedContentDiameter()
{
  return MEMORY[0x270EE3270]();
}

uint64_t CDWidgetGroupSquareContentCornerRadius()
{
  return MEMORY[0x270EE3280]();
}

double CDCornerComplicationClippingSliceAngle(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v1 = [MEMORY[0x263EFD188] metricsWithDevice:a1 identitySizeClass:2];
  v6[0] = &unk_26CF5B300;
  v6[1] = &unk_26CF5B318;
  v7[0] = &unk_26CF5B7B0;
  v7[1] = &unk_26CF5B7B0;
  id v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v1 constantValue:v2 withOverrides:56.0];
  double v4 = v3;

  return v4;
}

double CDCornerComplicationTopExclusionSliceAngle(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v1 = [MEMORY[0x263EFD188] metricsWithDevice:a1 identitySizeClass:2];
  v6[0] = &unk_26CF5B300;
  v6[1] = &unk_26CF5B318;
  v7[0] = &unk_26CF5B7C0;
  v7[1] = &unk_26CF5B7C0;
  id v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v1 constantValue:v2 withOverrides:12.0];
  double v4 = v3;

  return v4;
}

double CDCornerComplicationSideExclusionSliceAngle(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v1 = [MEMORY[0x263EFD188] metricsWithDevice:a1 identitySizeClass:2];
  v6[0] = &unk_26CF5B300;
  v6[1] = &unk_26CF5B318;
  v7[0] = &unk_26CF5B7D0;
  v7[1] = &unk_26CF5B7D0;
  id v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v1 constantValue:v2 withOverrides:56.0];
  double v4 = v3;

  return v4;
}

double CDCornerComplicationInnerUpperCircleRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationInnerUpperCircleRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationInnerUpperCircleRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationInnerUpperCircleRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationInnerUpperCircleRadius___cachedDevice, v1);
    CDCornerComplicationInnerUpperCircleRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationInnerUpperCircleRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationInnerUpperCircleRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationInnerUpperCircleRadius___lock);
  double v9 = *(double *)&CDCornerComplicationInnerUpperCircleRadius__innerUpperCircleRadius;

  return v9;
}

void __CDCornerComplicationInnerUpperCircleRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CF5B2E8;
  v5[1] = &unk_26CF5B300;
  v6[0] = &unk_26CF5B780;
  v6[1] = &unk_26CF5B790;
  v5[2] = &unk_26CF5B318;
  void v6[2] = &unk_26CF5B7A0;
  double v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v2 scaledValue:v3 withOverrides:83.5];
  CDCornerComplicationInnerUpperCircleRadius__innerUpperCircleRadius = v4;
}

double CDCornerComplicationInnerUpperTextBaselineRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationInnerUpperTextBaselineRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationInnerUpperTextBaselineRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationInnerUpperTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationInnerUpperTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationInnerUpperTextBaselineRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationInnerUpperTextBaselineRadius_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationInnerUpperTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationInnerUpperTextBaselineRadius___lock);
  double v9 = *(double *)&CDCornerComplicationInnerUpperTextBaselineRadius__innerUpperBaselineRadius;

  return v9;
}

void __CDCornerComplicationInnerUpperTextBaselineRadius_block_invoke(uint64_t a1, void *a2)
{
  v8[3] = *MEMORY[0x263EF8340];
  id v2 = a2;
  [v2 sizeClass];
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    double v3 = CDCornerComplicationInnerUpperCircleRadius(v2);

    CDCornerComplicationInnerUpperTextBaselineRadius__innerUpperBaselineRadius = *(void *)&v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFD188] metricsWithDevice:v2 identitySizeClass:2];

    v7[0] = &unk_26CF5B2E8;
    v7[1] = &unk_26CF5B348;
    v8[0] = &unk_26CF5B7E0;
    v8[1] = &unk_26CF5B7F0;
    v7[2] = &unk_26CF5B360;
    void v8[2] = &unk_26CF5B7F0;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    [v4 scaledValue:v5 withOverrides:80.5];
    CDCornerComplicationInnerUpperTextBaselineRadius__innerUpperBaselineRadius = v6;
  }
}

double CDCornerComplicationInnerLowerTextBaselineRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationInnerLowerTextBaselineRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationInnerLowerTextBaselineRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationInnerLowerTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationInnerLowerTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationInnerLowerTextBaselineRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationInnerLowerTextBaselineRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationInnerLowerTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationInnerLowerTextBaselineRadius___lock);
  double v9 = *(double *)&CDCornerComplicationInnerLowerTextBaselineRadius__innerLowerBaselineRadius;

  return v9;
}

void __CDCornerComplicationInnerLowerTextBaselineRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CF5B2E8;
  v5[1] = &unk_26CF5B300;
  v6[0] = &unk_26CF5B800;
  v6[1] = &unk_26CF5B810;
  v5[2] = &unk_26CF5B318;
  void v6[2] = &unk_26CF5B820;
  double v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v2 scaledValue:v3 withOverrides:90.0];
  CDCornerComplicationInnerLowerTextBaselineRadius__innerLowerBaselineRadius = v4;
}

double CDCornerComplicationOuterUpperTextBaselineRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterUpperTextBaselineRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterUpperTextBaselineRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationOuterUpperTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationOuterUpperTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationOuterUpperTextBaselineRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationOuterUpperTextBaselineRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationOuterUpperTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterUpperTextBaselineRadius___lock);
  double v9 = *(double *)&CDCornerComplicationOuterUpperTextBaselineRadius__outerUpperBaselineRadius;

  return v9;
}

void __CDCornerComplicationOuterUpperTextBaselineRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CF5B2E8;
  v5[1] = &unk_26CF5B300;
  v6[0] = &unk_26CF5B830;
  v6[1] = &unk_26CF5B840;
  v5[2] = &unk_26CF5B318;
  void v6[2] = &unk_26CF5B850;
  double v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v2 scaledValue:v3 withOverrides:94.0];
  CDCornerComplicationOuterUpperTextBaselineRadius__outerUpperBaselineRadius = v4;
}

double CDCornerComplicationOuterLowerTextBaselineRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterLowerTextBaselineRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterLowerTextBaselineRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationOuterLowerTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationOuterLowerTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationOuterLowerTextBaselineRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationOuterLowerTextBaselineRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationOuterLowerTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterLowerTextBaselineRadius___lock);
  double v9 = *(double *)&CDCornerComplicationOuterLowerTextBaselineRadius__outerLowerBaselineRadius;

  return v9;
}

void __CDCornerComplicationOuterLowerTextBaselineRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CF5B2E8;
  v5[1] = &unk_26CF5B300;
  v6[0] = &unk_26CF5B860;
  v6[1] = &unk_26CF5B870;
  v5[2] = &unk_26CF5B318;
  void v6[2] = &unk_26CF5B880;
  double v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v2 scaledValue:v3 withOverrides:105.5];
  CDCornerComplicationOuterLowerTextBaselineRadius__outerLowerBaselineRadius = v4;
}

double CDCornerComplicationTopLeftCenterAngle(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationTopLeftCenterAngle___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationTopLeftCenterAngle___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationTopLeftCenterAngle___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationTopLeftCenterAngle___cachedDevice, v1);
    CDCornerComplicationTopLeftCenterAngle___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationTopLeftCenterAngle_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationTopLeftCenterAngle___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationTopLeftCenterAngle___lock);
  double v9 = *(double *)&CDCornerComplicationTopLeftCenterAngle__cornerTopLeftCenterAngle;

  return v9;
}

double __CDCornerComplicationTopLeftCenterAngle_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = CDCornerComplicationClippingSliceAngle((uint64_t)v2);
  double v4 = CDCornerComplicationTopExclusionSliceAngle((uint64_t)v2);

  double result = (v3 + v4) * 0.5;
  *(double *)&CDCornerComplicationTopLeftCenterAngle__cornerTopLeftCenterAngle = result;
  return result;
}

double CDCornerComplicationOuterImageCenterRadius(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterRadius___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterRadius___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationOuterImageCenterRadius___cachedDevice, v1);
    CDCornerComplicationOuterImageCenterRadius___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationOuterImageCenterRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationOuterImageCenterRadius___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterRadius___lock);
  double v9 = *(double *)&CDCornerComplicationOuterImageCenterRadius__outerImageCenterRadius;

  return v9;
}

void __CDCornerComplicationOuterImageCenterRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  void v6[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26CF5B300;
  v5[1] = &unk_26CF5B318;
  v6[0] = &unk_26CF5B890;
  v6[1] = &unk_26CF5B8A0;
  double v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 scaledValue:v3 withOverrides:109.5];
  CDCornerComplicationOuterImageCenterRadius__outerImageCenterRadius = v4;
}

double CDCornerComplicationOuterImageCenterPoint(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterPoint___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterPoint___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterPoint___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationOuterImageCenterPoint___cachedDevice, v1);
    CDCornerComplicationOuterImageCenterPoint___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationOuterImageCenterPoint_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationOuterImageCenterPoint___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterPoint___lock);
  double v9 = *(double *)&CDCornerComplicationOuterImageCenterPoint__outerImageCenterPoint_0;

  return v9;
}

double __CDCornerComplicationOuterImageCenterPoint_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = MEMORY[0x223C26720]([v2 screenBounds]);
  double v5 = v4;
  CDCornerComplicationTopLeftCenterAngle(v2);
  double v6 = CDCornerComplicationOuterImageCenterRadius(v2);

  CLKDegreesToRadians();
  *(float *)&double v7 = v7;
  *(double *)&CDCornerComplicationOuterImageCenterPoint__outerImageCenterPoint_1 = v5 - v6 * sinf(*(float *)&v7);
  CLKDegreesToRadians();
  *(float *)&double v8 = v8;
  double result = v3 - v6 * cosf(*(float *)&v8);
  CDCornerComplicationOuterImageCenterPoint__outerImageCenterPoint_0 = *(void *)&result;
  return result;
}

double CDCornerComplicationCenterPoint(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationCenterPoint___lock);
  id WeakRetained = objc_loadWeakRetained(&CDCornerComplicationCenterPoint___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CDCornerComplicationCenterPoint___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CDCornerComplicationCenterPoint___cachedDevice, v1);
    CDCornerComplicationCenterPoint___previousCLKDeviceVersion = [v1 version];

    __CDCornerComplicationCenterPoint_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CDCornerComplicationCenterPoint___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationCenterPoint___lock);
  double v9 = *(double *)&CDCornerComplicationCenterPoint__complicationCenterPoint;

  return v9;
}

void __CDCornerComplicationCenterPoint_block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 sizeClass];
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    double v2 = MEMORY[0x223C26720]([v8 screenBounds]);
    double v4 = v3;
    CDCornerComplicationTopLeftCenterAngle(v8);
    double v5 = CDCornerComplicationCenterPointRadius(v8);
    CLKDegreesToRadians();
    *(float *)&double v6 = v6;
    *((double *)&CDCornerComplicationCenterPoint__complicationCenterPoint + 1) = v4 - v5 * sinf(*(float *)&v6);
    CLKDegreesToRadians();
    *(float *)&double v7 = v7;
    *(double *)&CDCornerComplicationCenterPoint__complicationCenterPoint = v2 - v5 * cosf(*(float *)&v7);
  }
  else
  {
    CDCornerComplicationCenterPoint__complicationCenterPoint = *MEMORY[0x263F00148];
  }
}

double ___avoniaComplicationSize_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = CDCornerComplicationKeylineInnerRadius(v2);
  double v4 = MEMORY[0x223C26720]([v2 screenBounds]);
  double v6 = v5;
  double v7 = _avoniaCornerComplicationOuterRadius(v2);
  CDCornerComplicationClippingSliceAngle((uint64_t)v2);
  CLKDegreesToRadians();
  *(float *)&double v8 = v8;
  double v9 = v7 * sinf(*(float *)&v8);
  CLKDegreesToRadians();
  *(float *)&double v10 = v10;
  double v11 = v3 + v9 / sinf(*(float *)&v10);
  CDCornerComplicationTopExclusionSliceAngle((uint64_t)v2);
  CLKDegreesToRadians();
  *(float *)&double v12 = v12;
  double v13 = v11 * -0.5;
  *(double *)&_avoniaComplicationSize__complicationSize_0 = v4 + v13 * sinf(*(float *)&v12);
  CDCornerComplicationSideExclusionSliceAngle((uint64_t)v2);

  CLKDegreesToRadians();
  *(float *)&double v14 = v14;
  double result = v6 + v13 * sinf(*(float *)&v14);
  _avoniaComplicationSize__complicationSize_1 = *(void *)&result;
  return result;
}

void ___avoniaCornerComplicationOuterRadius_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = MEMORY[0x223C26720]([v2 screenBounds]);
  double v5 = v4;
  CDCornerComplicationClippingSliceAngle((uint64_t)v2);
  CDCornerComplicationSideExclusionSliceAngle((uint64_t)v2);

  CLKDegreesToRadians();
  *(float *)&double v6 = v6;
  float v7 = tanf(*(float *)&v6);
  float v8 = v7 * v7 + 1.0;
  double v9 = v3 * sqrtf(v8);
  CLKDegreesToRadians();
  *(float *)&double v10 = v10;
  float v11 = atanf(*(float *)&v10);
  float v12 = v11 * v11 + 1.0;
  double v13 = v5 * sqrtf(v12);
  if (v13 >= v9) {
    double v13 = v9;
  }
  _avoniaCornerComplicationOuterRadius__complicationOuterRadius = *(void *)&v13;
}

id _CDLayerMaskColorizationFilter(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v32 = 0u;
  *(_OWORD *)v33 = 0u;
  id v3 = a2;
  [a1 getRed:&v32 green:(char *)&v32 + 8 blue:v33 alpha:&v33[1]];
  long long v30 = 0u;
  long long v31 = 0u;
  [v3 getRed:&v30 green:(char *)&v30 + 8 blue:&v31 alpha:(char *)&v31 + 8];

  uint64_t v4 = MEMORY[0x263F15720];
  int v5 = *(_DWORD *)(MEMORY[0x263F15720] + 76);
  float v6 = *(double *)&v32;
  float v7 = *((double *)&v32 + 1);
  float v8 = v33[0];
  float v9 = *(double *)&v30;
  float v10 = *((double *)&v30 + 1);
  float v11 = *(double *)&v31;
  float v12 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
  *(float *)long long v16 = v6;
  *(float *)&v16[1] = v9;
  uint64_t v17 = *(void *)(v4 + 8);
  int v18 = *(_DWORD *)(v4 + 16);
  float v19 = v7;
  float v20 = v10;
  uint64_t v21 = *(void *)(v4 + 28);
  int v22 = *(_DWORD *)(v4 + 36);
  float v23 = v8;
  float v24 = v11;
  int v25 = 0;
  int v13 = *(_DWORD *)(v4 + 68);
  long long v26 = *(_OWORD *)(v4 + 52);
  int v27 = v13;
  int v28 = 1065353216;
  int v29 = v5;
  double v14 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:v16];
  [v12 setValue:v14 forKey:@"inputColorMatrix"];

  return v12;
}

void sub_21E3F85F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E3F8820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E3F8F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

double CDRichComplicationCornerBaseCircularViewRect(void *a1, uint64_t a2)
{
  id v3 = a1;
  double v4 = _LayoutConstants_4(v3);
  double v6 = v5;
  double v7 = CDCornerComplicationSize(v3);
  [v3 sizeClass];
  if (CLKDeviceCategoryForSizeClass() == 5) {
    double v8 = CDCornerComplicationCenterPoint(v3) - v4 * 0.5;
  }
  else {
    double v8 = v6;
  }
  switch(a2)
  {
    case 0:
    case 2:
      break;
    case 1:
      double v8 = v7 - v8 - v4;
      break;
    case 3:
      double v8 = v7 - v8 - v4;
      break;
    default:
      double v8 = *MEMORY[0x263F00148];
      break;
  }

  return v8;
}

double _LayoutConstants_4(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_10);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_10);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_10);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_LayoutConstants___cachedDevice_10, v1);
    _LayoutConstants___previousCLKDeviceVersion_10 = [v1 version];

    ___LayoutConstants_block_invoke_10(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _LayoutConstants___previousCLKDeviceVersion_10;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_10);
  double v9 = *(double *)&_LayoutConstants___constants_0_4;

  return v9;
}

double sub_21E3FB5D8()
{
  v6.origin.CGFloat x = sub_21E3FB63C();
  CGFloat x = v6.origin.x;
  CGFloat y = v6.origin.y;
  CGFloat width = v6.size.width;
  CGFloat height = v6.size.height;
  double MidX = CGRectGetMidX(v6);
  v7.origin.CGFloat x = x;
  v7.origin.CGFloat y = y;
  v7.size.CGFloat width = width;
  v7.size.CGFloat height = height;
  CGRectGetMidY(v7);
  return MidX;
}

double sub_21E3FB63C()
{
  id v1 = objc_msgSend(self, sel_sharedRenderingContext);
  id v2 = objc_msgSend(v1, sel_device);

  CDRichComplicationCornerGaugeCustomViewRect((uint64_t)v2, *(void *)(v0 + 16));
  double v4 = v3;

  return v4;
}

double sub_21E3FB6E0()
{
  sub_21E3FB63C();
  return v1 / *v0;
}

double sub_21E3FB704()
{
  sub_21E3FB63C();
  return v0;
}

uint64_t sub_21E3FB724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v26 = sub_21E41F040();
  uint64_t v3 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  int v25 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B800);
  sub_21E41F050();
  sub_21E41F050();
  sub_21E41F050();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B808);
  sub_21E41F050();
  sub_21E41F050();
  swift_getTupleTypeMetadata2();
  sub_21E41F700();
  swift_getWitnessTable();
  uint64_t v6 = sub_21E41F6D0();
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B810);
  uint64_t v9 = sub_21E41F050();
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  float v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v29 = v5;
  uint64_t v30 = v15;
  uint64_t v31 = v27;
  sub_21E41F6F0();
  sub_21E41F6C0();
  swift_getKeyPath();
  uint64_t v16 = v25;
  uint64_t v17 = v26;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v25, *MEMORY[0x263F18DC8], v26);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_21E41F4C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  uint64_t v19 = sub_21E3FD70C((unint64_t *)&qword_267D2B818, &qword_267D2B810);
  uint64_t v32 = WitnessTable;
  uint64_t v33 = v19;
  uint64_t v20 = swift_getWitnessTable();
  sub_21E4095DC(v12, v9, v20);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v24 + 8);
  v21(v12, v9);
  sub_21E4095DC(v14, v9, v20);
  return ((uint64_t (*)(char *, uint64_t))v21)(v14, v9);
}

void sub_21E3FBB70(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v74 = a4;
  uint64_t v63 = *(void *)(a2 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v50 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B800);
  uint64_t v8 = sub_21E41F050();
  uint64_t v65 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v49 = (char *)&v49 - v9;
  uint64_t v59 = sub_21E41F050();
  uint64_t v69 = *(void *)(v59 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v52 = (char *)&v49 - v10;
  uint64_t v61 = sub_21E41F050();
  uint64_t v71 = *(void *)(v61 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v55 = (char *)&v49 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B808);
  uint64_t v68 = sub_21E41F050();
  uint64_t v72 = *(void *)(v68 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v56 = (char *)&v49 - v12;
  uint64_t v62 = sub_21E41F050();
  uint64_t v73 = *(void *)(v62 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v64 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v70 = (char *)&v49 - v15;
  uint64_t v51 = type metadata accessor for ComplicationCornerGaugeView();
  sub_21E3FB63C();
  sub_21E3FB63C();
  uint64_t v67 = *(void *)(a1 + 16);
  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v66 = *(void *)(a1 + 24);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v58 = *(void *)(a1 + 48);
  uint64_t v57 = v17;
  uint64_t v18 = *(void **)(a1 + 40);
  type metadata accessor for MonochromeModel();
  sub_21E3FE4C8((unint64_t *)&qword_267D2B820, (void (*)(uint64_t))type metadata accessor for MonochromeModel);
  id v60 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v19 = v16;
  uint64_t v54 = sub_21E41F030();
  v53 = v20;
  uint64_t v21 = v50;
  (*(void (**)(void))(a1 + 64))();
  swift_getKeyPath();
  LOBYTE(v78[0]) = 1;
  int v22 = v49;
  sub_21E41F4C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v21, a2);
  sub_21E41F730();
  uint64_t v23 = sub_21E3FD70C(&qword_267D2B828, &qword_267D2B800);
  v84[10] = a3;
  v84[11] = v23;
  uint64_t WitnessTable = swift_getWitnessTable();
  int v25 = v52;
  sub_21E41F4D0();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v22, v8);
  sub_21E41F6F0();
  v84[8] = WitnessTable;
  v84[9] = MEMORY[0x263F18880];
  uint64_t v26 = v59;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = v55;
  sub_21E41F510();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v25, v26);
  v84[6] = v27;
  v84[7] = MEMORY[0x263F18860];
  uint64_t v29 = v61;
  uint64_t v30 = swift_getWitnessTable();
  sub_21E3FD6B8();
  uint64_t v31 = v56;
  sub_21E41F550();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v28, v29);
  sub_21E3FB5D8();
  uint64_t v32 = sub_21E3FD70C(&qword_267D2B838, &qword_267D2B808);
  v84[4] = v30;
  v84[5] = v32;
  uint64_t v33 = v68;
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v35 = (uint64_t)v64;
  sub_21E41F540();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v33);
  unint64_t v36 = sub_21E3FD750();
  v84[2] = v34;
  v84[3] = v36;
  uint64_t v37 = v62;
  uint64_t v38 = swift_getWitnessTable();
  v39 = v70;
  sub_21E4095DC(v35, v37, v38);
  uint64_t v40 = v73;
  uint64_t v72 = *(void *)(v73 + 8);
  ((void (*)(uint64_t, uint64_t))v72)(v35, v37);
  v78[0] = v67;
  v78[1] = v66;
  v41 = v60;
  id v79 = v60;
  uint64_t v80 = v58;
  uint64_t v81 = v57;
  uint64_t v82 = v54;
  v42 = v53;
  id v83 = v53;
  v84[0] = (uint64_t)v78;
  v43 = *(void (**)(uint64_t, char *, uint64_t))(v40 + 16);
  v44 = v39;
  v43(v35, v39, v37);
  v84[1] = v35;
  id v45 = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v46 = v42;
  v77[0] = &type metadata for ComplicationCornerGaugeViewRepresentable;
  v77[1] = v37;
  unint64_t v75 = sub_21E3FD7A4();
  uint64_t v76 = v38;
  sub_21E402EC4(v84, 2uLL, (uint64_t)v77);
  v47 = (void (*)(uint64_t, uint64_t))v72;
  ((void (*)(char *, uint64_t))v72)(v44, v37);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v47(v35, v37);
  v48 = v79;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_21E3FC4FC()
{
  return sub_21E41F4F0();
}

uint64_t sub_21E3FC518@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21E3FB724(a1, a2);
}

void sub_21E3FC55C(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = swift_bridgeObjectRetain();
  id v5 = sub_21E40B590(v4);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v5, 0);
LABEL_3:
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = *(id *)(v3 + 8 * v10 + 32);
      id v12 = objc_msgSend(v11, sel_imageProvider);

      if (v12) {
        break;
      }
      ++v10;

      if (v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v11, sel_imageProvider);

    if (v6)
    {
      id v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v6);
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
LABEL_12:
  uint64_t v8 = 0;
LABEL_13:
  uint64_t v13 = *(void *)(v1 + 32);
  uint64_t v14 = swift_bridgeObjectRetain();
  id v15 = sub_21E40B590(v14);
  if (v15)
  {
    id v16 = v15;
    id v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v15, 0);
LABEL_15:
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();

    goto LABEL_25;
  }
  uint64_t v19 = *(void *)(v13 + 16);
  if (v19)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = 0;
    while (1)
    {
      id v21 = *(id *)(v13 + 8 * v20 + 32);
      id v22 = objc_msgSend(v21, sel_imageProvider);

      if (v22) {
        break;
      }
      ++v20;

      if (v19 == v20)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v21, sel_imageProvider);

    if (v16)
    {
      id v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v16);
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v18 = 0;
LABEL_25:
  objc_msgSend(a1, sel_handleGaugeProvider_leftLabelProvider_rightLabelProvider_, *(void *)(v1 + 16), v8, v18);
  long long v26 = *(_OWORD *)(v1 + 40);
  objc_msgSend(a1, sel_setFilterProvider_, *((void *)&v26 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(void *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(void *)(v1 + 8));
  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  id v23 = *((id *)&v26 + 1);
  sub_21E41EED0();
  swift_release();
  swift_release();
  sub_21E3FE608((uint64_t)&v26);
  if (v25 >= 1.0)
  {
    objc_msgSend(a1, sel_updateMonochromeColor, v25);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v24 = v23;
    sub_21E41EED0();
    swift_release();
    swift_release();
    sub_21E3FE608((uint64_t)&v26);
    objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v25);
  }
}

uint64_t sub_21E3FC8F8()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_21E3FD830;
  *(void *)(v3 + 24) = v2;
  void v8[4] = sub_21E3FD880;
  v8[5] = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  void v8[2] = sub_21E41611C;
  v8[3] = &block_descriptor;
  uint64_t v4 = _Block_copy(v8);
  id v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

id sub_21E3FCAE8()
{
  return sub_21E3FCEA0(type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView);
}

uint64_t type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView()
{
  return self;
}

id sub_21E3FCB24()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4], v0[5], v0[6]);
  sub_21E3FC55C(v1);
  return v1;
}

uint64_t sub_21E3FCB9C()
{
  return sub_21E41F1F0();
}

uint64_t sub_21E3FCBE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E3FE5AC();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_21E3FCC44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E3FE5AC();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_21E3FCCA8()
{
}

id sub_21E3FCCD0(id a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v7 = objc_msgSend(a1, sel_style);
    uint64_t v8 = *(void *)&v3[OBJC_IVAR____TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView_fillStyle];
    if (v7 == (id)*MEMORY[0x263EFCF40])
    {
      if (v8 != 7)
      {
        uint64_t v9 = 7;
LABEL_7:
        *(void *)&v3[OBJC_IVAR____TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView_fillStyle] = v9;
        objc_msgSend(v3, sel__replaceProgressView_);
      }
    }
    else if (v8 == 7)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for _ComplicationCornerDynamicGaugeView();
  return objc_msgSendSuper2(&v11, sel_handleGaugeProvider_leftLabelProvider_rightLabelProvider_, a1, a2, a3);
}

id sub_21E3FCE88()
{
  return sub_21E3FCEA0(type metadata accessor for _ComplicationCornerDynamicGaugeView);
}

id sub_21E3FCEA0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for _ComplicationCornerDynamicGaugeView()
{
  return self;
}

void type metadata accessor for SymbolScale(uint64_t a1)
{
}

void type metadata accessor for ComplicationViewFontStyle(uint64_t a1)
{
}

void type metadata accessor for ComplicationCornerViewPosition(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21E3FCF48(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21E3FCF68(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for CDRichComplicationProgressFillStyle(uint64_t a1)
{
}

uint64_t sub_21E3FCFCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t initializeBufferWithCopyOfBuffer for ComplicationCurvedTextConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_21E3FD008(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_21E3FD05C(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  uint64_t v4 = *(void **)(a2 + 32);
  id v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = v6;
  id v7 = v4;
  id v8 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_21E3FD0E0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = (void *)a2[4];
  id v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  id v7 = (void *)a2[5];
  id v8 = (void *)a1[5];
  a1[5] = v7;
  id v9 = v7;

  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_21E3FD1BC(uint64_t a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;

  id v5 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];

  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = a2[3];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = a2[4];
  swift_release();
  return a1;
}

uint64_t sub_21E3FD22C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E3FD274(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCornerGaugeView()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for CLKMonochromeFilterStyle(uint64_t a1)
{
}

BOOL sub_21E3FD2F4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21E3FD308(uint64_t a1, uint64_t a2)
{
  return sub_21E3FD400(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_21E3FD320()
{
  sub_21E41F7C0();
  sub_21E41F7D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E3FD374()
{
  sub_21E41F7C0();
  sub_21E41F970();
  sub_21E41F7D0();
  uint64_t v0 = sub_21E41F990();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21E3FD3E8(uint64_t a1, uint64_t a2)
{
  return sub_21E3FD400(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_21E3FD400(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_21E41F7C0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21E3FD444(uint64_t a1, id *a2)
{
  uint64_t result = sub_21E41F7A0();
  *a2 = 0;
  return result;
}

uint64_t sub_21E3FD4BC(uint64_t a1, id *a2)
{
  char v3 = sub_21E41F7B0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21E3FD53C@<X0>(uint64_t *a1@<X8>)
{
  sub_21E41F7C0();
  uint64_t v2 = sub_21E41F790();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_21E3FD580(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_21E3FD588@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_21E3FD59C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_21E3FD5CC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_21E3FD5E0(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_21E3FD5F4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_21E3FD604(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_21E3FD610()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_21E3FD69C(uint64_t a1@<X8>)
{
  sub_21E3FBB70(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_21E3FD6B8()
{
  unint64_t result = qword_267D2B830;
  if (!qword_267D2B830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B830);
  }
  return result;
}

uint64_t sub_21E3FD70C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21E3FD750()
{
  unint64_t result = qword_267D2B840;
  if (!qword_267D2B840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B840);
  }
  return result;
}

unint64_t sub_21E3FD7A4()
{
  unint64_t result = qword_267D2B848;
  if (!qword_267D2B848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B848);
  }
  return result;
}

uint64_t sub_21E3FD7F8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21E3FD830()
{
  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_21E3FD870()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E3FD880()
{
  return sub_21E4160F4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21E3FD8A0()
{
  uint64_t v0 = sub_21E41F7C0();
  uint64_t v2 = v1;
  if (v0 == sub_21E41F7C0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21E41F960();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_21E3FD92C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21E3FD938@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21E41F790();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21E3FD980@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E41F7C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E3FD9AC(uint64_t a1)
{
  uint64_t v2 = sub_21E3FE4C8(&qword_267D2B880, type metadata accessor for RBDrawableStatisticsKey);
  uint64_t v3 = sub_21E3FE4C8(&qword_267D2B888, type metadata accessor for RBDrawableStatisticsKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void sub_21E3FDA68(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>)
{
  id v17 = self;
  id v52 = a3;
  id v51 = a4;
  id v18 = objc_msgSend(v17, sel_sharedRenderingContext);
  id v19 = objc_msgSend(v18, sel_device);

  v50 = v19;
  double v20 = CDRichComplicationCornerInnerImageMaxSize(v19);
  double v22 = v21;
  uint64_t v23 = MEMORY[0x263F8EE78];
  int64_t v24 = *(void *)(a5 + 16);
  if (!v24)
  {
    swift_bridgeObjectRelease();
    uint64_t v34 = MEMORY[0x263F8EE78];
    int64_t v37 = *(void *)(a6 + 16);
    if (!v37) {
      goto LABEL_31;
    }
    goto LABEL_18;
  }
  uint64_t v49 = a6;
  uint64_t v59 = MEMORY[0x263F8EE78];
  sub_21E40095C(0, v24, 0);
  for (uint64_t i = 0; i != v24; ++i)
  {
    id v26 = *(id *)(a5 + 8 * i + 32);
    id v27 = objc_msgSend(v26, sel_textProvider);
    objc_msgSend(v27, sel_finalize);
    id v28 = objc_msgSend(v26, sel_imageProvider);
    uint64_t v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, sel_copy);

      sub_21E41F890();
      swift_unknownObjectRelease();
      sub_21E3FDFA8();
      if (swift_dynamicCast())
      {
        uint64_t v29 = v58;
        type metadata accessor for WidgetNamedImageProvider(0);
        uint64_t v30 = swift_dynamicCastClass();
        if (v30)
        {
          uint64_t v31 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(unsigned char *)(v30 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            uint64_t v32 = (double *)(v30 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *uint64_t v32 = v20;
            v32[1] = v22;
            *(unsigned char *)(v30 + v31) = 1;
          }
        }
        else
        {
          objc_msgSend(v58, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v20, v22, v20, v22);
        }
      }
      else
      {
        uint64_t v29 = 0;
      }
    }
    id v33 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v27, v29);

    uint64_t v34 = v59;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21E40095C(0, *(void *)(v59 + 16) + 1, 1);
      uint64_t v34 = v59;
    }
    unint64_t v36 = *(void *)(v34 + 16);
    unint64_t v35 = *(void *)(v34 + 24);
    if (v36 >= v35 >> 1)
    {
      sub_21E40095C((char *)(v35 > 1), v36 + 1, 1);
      uint64_t v34 = v59;
    }
    *(void *)(v34 + 16) = v36 + 1;
    *(void *)(v34 + 8 * v36 + 32) = v33;
  }
  swift_bridgeObjectRelease();
  a6 = v49;
  uint64_t v23 = MEMORY[0x263F8EE78];
  int64_t v37 = *(void *)(v49 + 16);
  if (v37)
  {
LABEL_18:
    uint64_t v60 = v23;
    sub_21E40095C(0, v37, 0);
    uint64_t v38 = (id *)(a6 + 32);
    do
    {
      id v39 = *v38;
      id v40 = objc_msgSend(v39, sel_textProvider);
      objc_msgSend(v40, sel_finalize);
      id v41 = objc_msgSend(v39, sel_imageProvider);
      v42 = v41;
      if (v41)
      {
        objc_msgSend(v41, sel_copy);

        sub_21E41F890();
        swift_unknownObjectRelease();
        sub_21E3FDFA8();
        if (swift_dynamicCast())
        {
          v42 = v58;
          type metadata accessor for WidgetNamedImageProvider(0);
          uint64_t v43 = swift_dynamicCastClass();
          if (v43)
          {
            uint64_t v44 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(unsigned char *)(v43 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              id v45 = (double *)(v43 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              *id v45 = v20;
              v45[1] = v22;
              *(unsigned char *)(v43 + v44) = 1;
            }
          }
          else
          {
            objc_msgSend(v58, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v20, v22, v20, v22);
          }
        }
        else
        {
          v42 = 0;
        }
      }
      id v46 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v40, v42);

      uint64_t v23 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v60 + 16) + 1, 1);
        uint64_t v23 = v60;
      }
      unint64_t v48 = *(void *)(v23 + 16);
      unint64_t v47 = *(void *)(v23 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_21E40095C((char *)(v47 > 1), v48 + 1, 1);
        uint64_t v23 = v60;
      }
      *(void *)(v23 + 16) = v48 + 1;
      *(void *)(v23 + 8 * v48 + 32) = v46;
      ++v38;
      --v37;
    }
    while (v37);
  }
LABEL_31:

  *(double *)a9 = a10;
  *(double *)(a9 + 8) = a11;
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = v52;
  *(void *)(a9 + 40) = v51;
  *(void *)(a9 + 48) = v34;
  *(void *)(a9 + 56) = v23;
  *(void *)(a9 + 64) = a7;
  *(void *)(a9 + 72) = a8;
}

unint64_t sub_21E3FDFA8()
{
  unint64_t result = qword_267D2B850;
  if (!qword_267D2B850)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D2B850);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for RBDrawableStatisticsKey(uint64_t a1)
{
}

void sub_21E3FE02C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void destroy for ComplicationCornerGaugeViewRepresentable(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t initializeWithCopy for ComplicationCornerGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  id v6 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v6;
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v6;
  return a1;
}

void *assignWithCopy for ComplicationCornerGaugeViewRepresentable(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  id v7 = (void *)a2[6];
  id v8 = (void *)a1[6];
  a1[6] = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ComplicationCornerGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 48);
  uint64_t v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerGaugeViewRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerGaugeViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerGaugeViewRepresentable()
{
  return &type metadata for ComplicationCornerGaugeViewRepresentable;
}

uint64_t sub_21E3FE2EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_21E3FE480()
{
  return sub_21E3FE4C8(&qword_267D2B860, type metadata accessor for RBDrawableStatisticsKey);
}

uint64_t sub_21E3FE4C8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E3FE510()
{
  return sub_21E3FE4C8(&qword_267D2B868, type metadata accessor for RBDrawableStatisticsKey);
}

uint64_t sub_21E3FE558()
{
  return sub_21E3FE4C8(&qword_267D2B870, type metadata accessor for RBDrawableStatisticsKey);
}

uint64_t sub_21E3FE5A0()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_21E3FE5AC()
{
  unint64_t result = qword_267D2B878;
  if (!qword_267D2B878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B878);
  }
  return result;
}

uint64_t sub_21E3FE608(uint64_t a1)
{
  return a1;
}

uint64_t sub_21E3FE64C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_21E3FE658()
{
  return swift_release();
}

void *sub_21E3FE660(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = v4;
  swift_retain();
  return a1;
}

void *sub_21E3FE698(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_21E3FE6F0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t sub_21E3FE72C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E3FE774(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCornerCircularView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21E3FE7CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E3FE810()
{
  return sub_21E41F0E0();
}

uint64_t sub_21E3FE834(uint64_t a1)
{
  uint64_t v2 = sub_21E41F040();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21E41F0F0();
}

double sub_21E3FE900(uint64_t a1)
{
  v7.origin.CGFloat x = sub_21E3FE964(a1);
  CGFloat x = v7.origin.x;
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  double MidX = CGRectGetMidX(v7);
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  CGRectGetMidY(v8);
  return MidX;
}

double sub_21E3FE964(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_sharedRenderingContext);
  id v3 = objc_msgSend(v2, sel_device);

  double v4 = CDRichComplicationCornerBaseCircularViewRect(v3, a1);
  return v4;
}

double sub_21E3FEA0C(uint64_t a1)
{
  sub_21E3FE964(a1);
  return v1;
}

uint64_t sub_21E3FEA2C@<X0>(uint64_t a1@<X0>, void (*a2)(double)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v50 = a5;
  v44[1] = a3;
  v44[0] = a2;
  uint64_t v59 = a6;
  uint64_t v9 = sub_21E41F040();
  uint64_t v57 = *(void *)(v9 - 8);
  uint64_t v58 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v56 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21E41F050();
  uint64_t v48 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v16 = (char *)v44 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B808);
  uint64_t v17 = sub_21E41F050();
  uint64_t v51 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)v44 - v18;
  uint64_t v49 = sub_21E41F050();
  uint64_t v54 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  id v45 = (char *)v44 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B810);
  uint64_t v53 = sub_21E41F050();
  uint64_t v55 = *(void *)(v53 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v53);
  unint64_t v47 = (char *)v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  id v52 = (char *)v44 - v23;
  uint64_t v24 = a1;
  double v25 = sub_21E3FE964(a1);
  a2(v25);
  sub_21E41F6F0();
  uint64_t v26 = v50;
  sub_21E41F510();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v13, a4);
  uint64_t v66 = v26;
  uint64_t v67 = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_21E3FD6B8();
  sub_21E41F550();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v14);
  sub_21E3FE900(v24);
  uint64_t v28 = sub_21E3FD70C(&qword_267D2B838, &qword_267D2B808);
  uint64_t v64 = WitnessTable;
  uint64_t v65 = v28;
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v30 = v45;
  sub_21E41F540();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v19, v17);
  swift_getKeyPath();
  uint64_t v32 = v56;
  uint64_t v31 = v57;
  uint64_t v33 = v58;
  (*(void (**)(char *, void, uint64_t))(v57 + 104))(v56, *MEMORY[0x263F18DC8], v58);
  unint64_t v34 = sub_21E3FD750();
  uint64_t v62 = v29;
  unint64_t v63 = v34;
  uint64_t v35 = v49;
  uint64_t v36 = swift_getWitnessTable();
  int64_t v37 = v47;
  sub_21E41F4C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v30, v35);
  uint64_t v38 = sub_21E3FD70C((unint64_t *)&qword_267D2B818, &qword_267D2B810);
  uint64_t v60 = v36;
  uint64_t v61 = v38;
  uint64_t v39 = v53;
  uint64_t v40 = swift_getWitnessTable();
  id v41 = v52;
  sub_21E4095DC(v37, v39, v40);
  v42 = *(void (**)(char *, uint64_t))(v55 + 8);
  v42(v37, v39);
  sub_21E4095DC(v41, v39, v40);
  return ((uint64_t (*)(char *, uint64_t))v42)(v41, v39);
}

uint64_t sub_21E3FF0D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21E3FEA2C(*(void *)v2, *(void (**)(double))(v2 + 8), *(void *)(v2 + 16), *(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

uint64_t sub_21E3FF0EC()
{
  return sub_21E41F0E0();
}

uint64_t sub_21E3FF114()
{
  return swift_getWitnessTable();
}

uint64_t ComplicationCurvedLabelViewConfiguration.curvedTextConfiguration.getter@<X0>(_OWORD *a1@<X8>)
{
  long long v2 = v1[3];
  long long v9 = v1[2];
  long long v10 = v2;
  long long v4 = v1[5];
  long long v11 = v1[4];
  long long v3 = v11;
  long long v12 = v4;
  long long v6 = v1[1];
  v8[0] = *v1;
  long long v5 = v8[0];
  v8[1] = v6;
  a1[2] = v9;
  a1[3] = v2;
  a1[4] = v3;
  a1[5] = v4;
  *a1 = v5;
  a1[1] = v6;
  return sub_21E3FF2D4((uint64_t)v8);
}

uint64_t sub_21E3FF2D4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 64);
  swift_retain();
  return a1;
}

__n128 ComplicationCurvedLabelViewConfiguration.curvedTextConfiguration.setter(uint64_t a1)
{
  long long v3 = v1[3];
  v10[2] = v1[2];
  v10[3] = v3;
  long long v4 = v1[5];
  void v10[4] = v1[4];
  v10[5] = v4;
  long long v5 = v1[1];
  v10[0] = *v1;
  v10[1] = v5;
  sub_21E3FF36C((uint64_t)v10);
  long long v6 = *(_OWORD *)(a1 + 48);
  v1[2] = *(_OWORD *)(a1 + 32);
  v1[3] = v6;
  long long v7 = *(_OWORD *)(a1 + 80);
  v1[4] = *(_OWORD *)(a1 + 64);
  v1[5] = v7;
  __n128 result = *(__n128 *)a1;
  long long v9 = *(_OWORD *)(a1 + 16);
  *double v1 = *(_OWORD *)a1;
  v1[1] = v9;
  return result;
}

uint64_t sub_21E3FF36C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 64);
  swift_release();

  return a1;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.curvedTextConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedLabelViewConfiguration.labelProviders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComplicationCurvedLabelViewConfiguration.labelProviders.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.labelProviders.modify())()
{
  return nullsub_1;
}

void *ComplicationCurvedLabelViewConfiguration.monochromeModel.getter()
{
  uint64_t v1 = *(void **)(v0 + 104);
  id v2 = v1;
  return v1;
}

void ComplicationCurvedLabelViewConfiguration.monochromeModel.setter(uint64_t a1)
{
  *(void *)(v1 + 104) = a1;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.monochromeModel.modify())()
{
  return nullsub_1;
}

__n128 ComplicationCurvedLabelViewConfiguration.init(curvedTextConfiguration:monochromeModel:labelProviders:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a4 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a4 + 48) = v4;
  long long v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a4 + 80) = v5;
  __n128 result = *(__n128 *)a1;
  long long v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v7;
  *(void *)(a4 + 96) = a3;
  *(void *)(a4 + 104) = a2;
  return result;
}

uint64_t ComplicationCurvedLabelView.configuration.getter@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = v1[5];
  long long v12 = v1[4];
  long long v2 = v12;
  long long v13 = v3;
  long long v14 = v1[6];
  long long v4 = v14;
  long long v5 = v1[1];
  v9[0] = *v1;
  v9[1] = v5;
  long long v6 = v1[3];
  long long v10 = v1[2];
  long long v7 = v10;
  long long v11 = v6;
  *a1 = v9[0];
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v6;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  return sub_21E3FF4FC((uint64_t)v9);
}

uint64_t sub_21E3FF4FC(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 64);
  id v3 = *(id *)(a1 + 104);
  swift_retain();
  id v4 = v2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21E3FF54C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA68);
  sub_21E41F650();
  return v1;
}

uint64_t ComplicationCurvedLabelView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  MEMORY[0x270FA5388](v3 - 8);
  long long v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B978);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = v1[7];
  long long v40 = v1[6];
  *(_OWORD *)id v41 = v10;
  long long v11 = v1[3];
  long long v12 = v1[1];
  long long v36 = v1[2];
  long long v37 = v11;
  long long v13 = v1[5];
  long long v14 = v1[3];
  long long v38 = v1[4];
  long long v39 = v13;
  long long v15 = v1[1];
  long long v34 = *v1;
  long long v35 = v15;
  long long v44 = v36;
  long long v45 = v14;
  long long v46 = v38;
  long long v47 = v13;
  uint64_t v16 = *((void *)v1 + 16);
  *(void *)&v41[16] = v16;
  long long v42 = v34;
  long long v43 = v12;
  uint64_t v17 = *(void *)&v41[8];
  sub_21E3FF2D4((uint64_t)&v34);
  *(void *)&long long v31 = v17;
  *((void *)&v31 + 1) = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA68);
  sub_21E41F650();
  uint64_t v18 = v48;
  uint64_t v20 = (void *)*((void *)&v40 + 1);
  uint64_t v19 = *(void *)v41;
  id v21 = *((id *)&v40 + 1);
  swift_bridgeObjectRetain();
  sub_21E416144(&v42, v18, v19, v20, (uint64_t)v5);
  long long v42 = *(_OWORD *)&v41[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA68);
  sub_21E41F650();
  uint64_t v22 = v31;
  sub_21E3FF84C((uint64_t)v5, (uint64_t)v9);
  *(void *)&v9[*(int *)(v7 + 44)] = v22;
  sub_21E3FF8B0((uint64_t)v5);
  long long v31 = 0u;
  long long v32 = 0u;
  char v33 = 2;
  sub_21E3FF2D4((uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B980);
  sub_21E41F640();
  long long v30 = v42;
  long long v23 = v43;
  LOBYTE(v7) = v44;
  uint64_t v24 = *((void *)&v44 + 1);
  long long v44 = v36;
  long long v45 = v37;
  long long v46 = v38;
  long long v47 = v39;
  long long v42 = v34;
  long long v43 = v35;
  sub_21E401958((uint64_t)v9, a1, &qword_267D2B978);
  uint64_t v25 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2B988) + 36);
  long long v26 = v45;
  *(_OWORD *)(v25 + 32) = v44;
  *(_OWORD *)(v25 + 48) = v26;
  long long v27 = v47;
  *(_OWORD *)(v25 + 64) = v46;
  *(_OWORD *)(v25 + 80) = v27;
  long long v28 = v43;
  *(_OWORD *)uint64_t v25 = v42;
  *(_OWORD *)(v25 + 16) = v28;
  *(_OWORD *)(v25 + 96) = v30;
  *(_OWORD *)(v25 + 112) = v23;
  *(unsigned char *)(v25 + 128) = v7;
  *(void *)(v25 + 136) = v24;
  return sub_21E4019BC((uint64_t)v9, &qword_267D2B978);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E3FF84C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E3FF8B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_21E3FF910()
{
  qword_267D2B970 = 0x4014000000000000;
}

uint64_t sub_21E3FF920@<X0>(uint64_t a1@<X8>)
{
  char v3 = *(unsigned char *)(v1 + 128);
  uint64_t v4 = *(void *)(v1 + 136);
  long long v5 = *(_OWORD *)(v1 + 112);
  long long v22 = *(_OWORD *)(v1 + 96);
  long long v23 = v5;
  LOBYTE(v24) = v3;
  uint64_t v25 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA58);
  uint64_t result = sub_21E41F650();
  if (v16 == 2)
  {
    long long v7 = 0uLL;
    char v8 = -1;
    long long v9 = 0uLL;
  }
  else
  {
    sub_21E41F480();
    long long v22 = 0x3FF0000000000000uLL;
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = 0x3FF0000000000000;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    sub_21E41F450();
    v20[0] = v12;
    v20[1] = v13;
    char v21 = v14;
    sub_21E401A18((uint64_t)v20, (uint64_t)v26);
    sub_21E401AB8((uint64_t)v26, (void (*)(void, void, void, void, void))sub_21E401A74);
    if (qword_267D2B720 != -1) {
      swift_once();
    }
    sub_21E41EF30();
    sub_21E41F420();
    long long v10 = v18;
    long long v11 = v17;
    char v8 = v19;
    sub_21E401A8C((uint64_t)&v15);
    sub_21E401AB8((uint64_t)v20, (void (*)(void, void, void, void, void))sub_21E401AF8);
    uint64_t result = sub_21E401AB8((uint64_t)v20, (void (*)(void, void, void, void, void))sub_21E401AF8);
    long long v9 = v10;
    long long v7 = v11;
  }
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_21E3FFB14(unsigned int *a1, _OWORD *a2)
{
  unsigned int v4 = *a1;
  unsigned int v3 = a1[1];
  uint64_t v5 = *((void *)a1 + 1);
  uint64_t v6 = *((void *)a1 + 2);
  uint64_t v7 = *((void *)a1 + 3);
  char v8 = *((unsigned char *)a1 + 32);
  long long v9 = a2[7];
  long long v17 = a2[6];
  long long v18 = v9;
  long long v19 = a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA58);
  sub_21E41F650();
  if (v22 == 2) {
    goto LABEL_3;
  }
  long long v17 = v20;
  long long v18 = v21;
  LOBYTE(v19) = v22;
  v12[0] = v4;
  v12[1] = v3;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  char v16 = v8;
  uint64_t result = _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0((uint64_t)&v17, (uint64_t)v12);
  if ((result & 1) == 0)
  {
LABEL_3:
    long long v11 = a2[7];
    long long v17 = a2[6];
    long long v18 = v11;
    long long v19 = a2[8];
    *(void *)&long long v20 = v4 | ((unint64_t)v3 << 32);
    *((void *)&v20 + 1) = v5;
    *(void *)&long long v21 = v6;
    *((void *)&v21 + 1) = v7;
    char v22 = v8;
    return sub_21E41F660();
  }
  return result;
}

uint64_t sub_21E3FFC18()
{
  return sub_21E41EF60();
}

uint64_t sub_21E3FFC34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA40);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = v2[7];
  long long v35 = v2[6];
  long long v36 = v9;
  long long v37 = v2[8];
  long long v10 = v2[3];
  long long v31 = v2[2];
  long long v32 = v10;
  long long v11 = v2[5];
  long long v33 = v2[4];
  long long v34 = v11;
  long long v12 = v2[1];
  long long v29 = *v2;
  long long v30 = v12;
  uint64_t v13 = (uint64_t (*)(unsigned int *))swift_allocObject();
  long long v14 = v2[7];
  *((_OWORD *)v13 + 7) = v2[6];
  *((_OWORD *)v13 + 8) = v14;
  *((_OWORD *)v13 + 9) = v2[8];
  long long v15 = v2[3];
  *((_OWORD *)v13 + 3) = v2[2];
  *((_OWORD *)v13 + 4) = v15;
  long long v16 = v2[5];
  *((_OWORD *)v13 + 5) = v2[4];
  *((_OWORD *)v13 + 6) = v16;
  long long v17 = v2[1];
  *((_OWORD *)v13 + 1) = *v2;
  *((_OWORD *)v13 + 2) = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA48);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v8, a1, v18);
  long long v19 = (uint64_t (**)(unsigned int *))&v8[*(int *)(v6 + 44)];
  *long long v19 = sub_21E401908;
  v19[1] = v13;
  v24[7] = v35;
  v24[8] = v36;
  v24[9] = v37;
  v24[3] = v31;
  v24[4] = v32;
  v24[5] = v33;
  v24[6] = v34;
  v24[1] = v29;
  v24[2] = v30;
  sub_21E401910((uint64_t)&v29);
  sub_21E3FF920((uint64_t)&v25);
  v24[0] = v25;
  uint64_t v20 = v26;
  uint64_t v21 = v27;
  LOBYTE(a1) = v28;
  sub_21E401958((uint64_t)v8, a2, &qword_267D2BA40);
  uint64_t v22 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA50) + 36);
  *(_OWORD *)uint64_t v22 = v24[0];
  *(void *)(v22 + 16) = v20;
  *(void *)(v22 + 24) = v21;
  *(unsigned char *)(v22 + 32) = a1;
  return sub_21E4019BC((uint64_t)v8, &qword_267D2BA40);
}

__n128 ComplicationCurvedLabelView<>.init(configuration:)@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  __n128 v3 = a1[5];
  __n128 v36 = a1[4];
  long long v37 = (__int128)v3;
  __n128 v38 = a1[6];
  __n128 v4 = a1[1];
  __n128 v32 = *a1;
  __n128 v33 = v4;
  __n128 v5 = a1[3];
  __n128 v34 = a1[2];
  __n128 v35 = v5;
  type metadata accessor for ComplicationCurvedTextMetricsObservable();
  uint64_t v6 = swift_allocObject();
  if (qword_267D2B728 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_267D2E488;
  char v8 = byte_267D2E490;
  *(void *)(v6 + 16) = xmmword_267D2E470;
  *(_OWORD *)(v6 + 24) = *(long long *)((char *)&xmmword_267D2E470 + 8);
  *(void *)(v6 + 40) = v7;
  *(unsigned char *)(v6 + 48) = v8;
  sub_21E41EE60();
  sub_21E41F640();
  uint64_t v9 = v29;
  uint64_t v10 = v30;
  unint64_t v11 = v38.n128_u64[0];
  int64_t v12 = *(void *)(v38.n128_u64[0] + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (v12)
  {
    long long v14 = v37;
    sub_21E3FF4FC((uint64_t)&v32);
    uint64_t v31 = v13;
    swift_bridgeObjectRetain();
    sub_21E40095C(0, v12, 0);
    for (uint64_t i = 0; i != v12; ++i)
    {
      id v16 = *(id *)(v11 + 8 * i + 32);
      id v17 = objc_msgSend(v16, sel_textProvider);
      objc_msgSend(v17, sel_finalize);
      id v18 = objc_msgSend(v16, sel_imageProvider);
      long long v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, sel_copy);

        sub_21E41F890();
        swift_unknownObjectRelease();
        sub_21E3FDFA8();
        if (swift_dynamicCast())
        {
          long long v19 = v28;
          type metadata accessor for WidgetNamedImageProvider(0);
          uint64_t v20 = swift_dynamicCastClass();
          if (v20)
          {
            uint64_t v21 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(unsigned char *)(v20 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              *(_OWORD *)(v20 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize) = v14;
              *(unsigned char *)(v20 + v21) = 1;
            }
          }
          else
          {
            objc_msgSend(v28, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v14, v14);
          }
        }
        else
        {
          long long v19 = 0;
        }
      }
      id v22 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v17, v19);

      uint64_t v13 = v31;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v31 + 16) + 1, 1);
        uint64_t v13 = v31;
      }
      unint64_t v24 = *(void *)(v13 + 16);
      unint64_t v23 = *(void *)(v13 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_21E40095C((char *)(v23 > 1), v24 + 1, 1);
        uint64_t v13 = v31;
      }
      *(void *)(v13 + 16) = v24 + 1;
      *(void *)(v13 + 8 * v24 + 32) = v22;
    }
    sub_21E40097C((uint64_t)&v32);
    swift_bridgeObjectRelease();
    uint64_t v9 = v29;
    uint64_t v10 = v30;
  }
  long long v25 = v37;
  *(__n128 *)(a2 + 64) = v36;
  *(_OWORD *)(a2 + 80) = v25;
  *(__n128 *)(a2 + 96) = v38;
  __n128 v26 = v33;
  *(__n128 *)a2 = v32;
  *(__n128 *)(a2 + 16) = v26;
  __n128 result = v35;
  *(__n128 *)(a2 + 32) = v34;
  *(__n128 *)(a2 + 48) = result;
  *(void *)(a2 + 112) = v13;
  *(void *)(a2 + 120) = v9;
  *(void *)(a2 + 128) = v10;
  return result;
}

id ComplicationCurvedLabelViewConfiguration.textProvider.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  if (*(void *)(v1 + 16)) {
    return objc_msgSend(*(id *)(v1 + 32), sel_textProvider);
  }
  else {
    return 0;
  }
}

uint64_t ComplicationCurvedLabelViewConfiguration.textProvider.setter(void *a1)
{
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_21E422BD0;
    *(void *)(v3 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a1, 0);

    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v1 + 96) = v3;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v1 + 96) = MEMORY[0x263F8EE78];
  }
  return result;
}

void (*ComplicationCurvedLabelViewConfiguration.textProvider.modify(void *a1))(id *a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = *(void *)(v1 + 96);
  if (*(void *)(v3 + 16)) {
    id v4 = objc_msgSend(*(id *)(v3 + 32), sel_textProvider);
  }
  else {
    id v4 = 0;
  }
  *a1 = v4;
  return sub_21E4002DC;
}

void sub_21E4002DC(id *a1, char a2)
{
  id v3 = *a1;
  if (a2)
  {
    id v9 = *a1;
    if (v3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_21E422BD0;
      id v5 = objc_allocWithZone((Class)CDLabelProvider);
      id v9 = v9;
      *(void *)(v4 + 32) = objc_msgSend(v5, sel_initWithTextProvider_imageProvider_, v9, 0);
    }
    else
    {
      uint64_t v4 = MEMORY[0x263F8EE78];
    }
    uint64_t v7 = a1[1];
    swift_bridgeObjectRelease();
    v7[12] = v4;
  }
  else
  {
    if (v3)
    {
      id v10 = *a1;
      __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_21E422BD0;
      *(void *)(v6 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v10, 0);
    }
    else
    {
      uint64_t v6 = MEMORY[0x263F8EE78];
    }
    char v8 = a1[1];
    swift_bridgeObjectRelease();
    v8[12] = v6;
  }
}

uint64_t ComplicationCurvedLabelViewConfiguration.contentProviders.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21E4009CC(0, v2, 0);
    uint64_t v4 = 0;
    uint64_t v3 = v13;
    do
    {
      id v5 = *(id *)(v1 + 8 * v4 + 32);
      id v6 = objc_msgSend(v5, sel_textProvider);
      id v7 = v6;
      id v8 = objc_msgSend(v5, sel_imageProvider);

      unint64_t v10 = *(void *)(v13 + 16);
      unint64_t v9 = *(void *)(v13 + 24);
      if (v10 >= v9 >> 1) {
        sub_21E4009CC((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v4;
      *(void *)(v13 + 16) = v10 + 1;
      uint64_t v11 = v13 + 16 * v10;
      *(void *)(v11 + 32) = v6;
      *(void *)(v11 + 40) = v8;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t ComplicationCurvedLabelViewConfiguration.contentProviders.setter(uint64_t a1)
{
  int64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_21E40095C(0, v3, 0);
    uint64_t v4 = v11;
    id v5 = (void *)(a1 + 40);
    do
    {
      id v6 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, *(v5 - 1), *v5);
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      if (v8 >= v7 >> 1) {
        sub_21E40095C((char *)(v7 > 1), v8 + 1, 1);
      }
      v5 += 2;
      *(void *)(v11 + 16) = v8 + 1;
      *(void *)(v11 + 8 * v8 + 32) = v6;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v1 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = v4;
  return result;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.contentProviders.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = ComplicationCurvedLabelViewConfiguration.contentProviders.getter();
  return sub_21E400704;
}

uint64_t sub_21E400704(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return ComplicationCurvedLabelViewConfiguration.contentProviders.setter(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  ComplicationCurvedLabelViewConfiguration.contentProviders.setter(v2);
  return swift_bridgeObjectRelease();
}

__n128 ComplicationCurvedLabelViewConfiguration.init(contentSize:curvedTextConfiguration:textProvider:)@<Q0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_21E422BD0;
    *(void *)(v6 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a2, 0);
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  long long v7 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a3 + 48) = v7;
  long long v8 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a3 + 80) = v8;
  __n128 result = *(__n128 *)a1;
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 16) = v10;
  *(void *)(a3 + 96) = v6;
  *(void *)(a3 + 104) = 0;
  return result;
}

double ComplicationCurvedLabelViewConfiguration.init(curvedTextConfiguration:monochromeModel:contentProviders:)@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = a2;
  long long v18 = a1[2];
  long long v19 = a1[3];
  long long v20 = a1[4];
  long long v21 = a1[5];
  long long v16 = *a1;
  long long v17 = a1[1];
  int64_t v7 = *(void *)(a3 + 16);
  if (v7)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_21E40095C(0, v7, 0);
    uint64_t v8 = v15;
    unint64_t v9 = (void *)(a3 + 40);
    do
    {
      id v10 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, *(v9 - 1), *v9);
      unint64_t v12 = *(void *)(v15 + 16);
      unint64_t v11 = *(void *)(v15 + 24);
      if (v12 >= v11 >> 1) {
        sub_21E40095C((char *)(v11 > 1), v12 + 1, 1);
      }
      v9 += 2;
      *(void *)(v15 + 16) = v12 + 1;
      *(void *)(v15 + 8 * v12 + 32) = v10;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    uint64_t v5 = a2;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  *(_OWORD *)(a4 + 32) = v18;
  *(_OWORD *)(a4 + 48) = v19;
  *(_OWORD *)(a4 + 64) = v20;
  *(_OWORD *)(a4 + 80) = v21;
  double result = *(double *)&v16;
  *(_OWORD *)a4 = v16;
  *(_OWORD *)(a4 + 16) = v17;
  *(void *)(a4 + 96) = v8;
  *(void *)(a4 + 104) = v5;
  return result;
}

char *sub_21E40095C(char *a1, int64_t a2, char a3)
{
  double result = sub_21E401B10(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_21E40097C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  int64_t v3 = *(void **)(a1 + 104);
  swift_bridgeObjectRelease();
  swift_release();

  return a1;
}

char *sub_21E4009CC(char *a1, int64_t a2, char a3)
{
  double result = sub_21E401C14(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

uint64_t sub_21E4009EC()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_21E400A30@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 96);
  if (*(void *)(v3 + 16)) {
    id result = objc_msgSend(*(id *)(v3 + 32), sel_textProvider);
  }
  else {
    id result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t sub_21E400A80(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  return ComplicationCurvedLabelViewConfiguration.textProvider.setter(v1);
}

uint64_t sub_21E400AB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ComplicationCurvedLabelViewConfiguration.contentProviders.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E400ADC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return ComplicationCurvedLabelViewConfiguration.contentProviders.setter(v0);
}

void destroy for ComplicationCurvedLabelViewConfiguration(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  id v2 = *(void **)(a1 + 104);
}

uint64_t initializeWithCopy for ComplicationCurvedLabelViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v3 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v3;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  uint64_t v4 = *(void **)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v4;
  swift_retain();
  id v5 = v3;
  swift_bridgeObjectRetain();
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for ComplicationCurvedLabelViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  id v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int64_t v7 = *(void **)(a1 + 104);
  uint64_t v8 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v8;
  id v9 = v8;

  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for ComplicationCurvedLabelViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  long long v5 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedLabelViewConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedLabelViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedLabelViewConfiguration()
{
  return &type metadata for ComplicationCurvedLabelViewConfiguration;
}

uint64_t sub_21E400E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_21E400E94(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_21E400EF8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v3 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v3;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  uint64_t v4 = *(void **)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v4;
  uint64_t v5 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  id v6 = v3;
  swift_bridgeObjectRetain();
  id v7 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_21E400FE0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a1 + 104);
  uint64_t v8 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v8;
  id v9 = v8;

  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t sub_21E401154(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_release();
  return a1;
}

uint64_t sub_21E401234(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E40127C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCurvedLabelView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21E4012F4()
{
  return sub_21E401380(&qword_267D2BA18, &qword_267D2B988, (void (*)(void))sub_21E401344, (void (*)(void))sub_21E4014B4);
}

uint64_t sub_21E401344()
{
  return sub_21E401380(&qword_267D2BA20, &qword_267D2B978, (void (*)(void))sub_21E401408, (void (*)(void))sub_21E401460);
}

uint64_t sub_21E401380(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21E401408()
{
  unint64_t result = qword_267D2BA28;
  if (!qword_267D2BA28)
  {
    type metadata accessor for ComplicationCurvedTextViewRepresentable();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BA28);
  }
  return result;
}

unint64_t sub_21E401460()
{
  unint64_t result = qword_267D2BA30;
  if (!qword_267D2BA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BA30);
  }
  return result;
}

unint64_t sub_21E4014B4()
{
  unint64_t result = qword_267D2BA38;
  if (!qword_267D2BA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BA38);
  }
  return result;
}

uint64_t destroy for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1)
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v3 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v3;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v4 = *(void **)(a1 + 64);
  id v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  long long v7 = *(_OWORD *)(a2 + 96);
  long long v8 = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 112) = v8;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedLabelViewContentShapeModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedLabelViewContentShapeModifier()
{
  return &type metadata for ComplicationCurvedLabelViewContentShapeModifier;
}

uint64_t sub_21E4018A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E4018C0()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 160, 7);
}

uint64_t sub_21E401908(unsigned int *a1)
{
  return sub_21E3FFB14(a1, (_OWORD *)(v1 + 16));
}

uint64_t sub_21E401910(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 64);
  swift_retain();
  swift_retain();
  id v3 = v2;
  return a1;
}

uint64_t sub_21E401958(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21E4019BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21E401A18(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_21E401A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_21E401A8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_21E401AB8(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_21E401AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

char *sub_21E401B10(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_21E401C14(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA60);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_21E401D1C()
{
  return sub_21E401380(&qword_267D2BA70, &qword_267D2BA50, (void (*)(void))sub_21E401D6C, (void (*)(void))sub_21E401E30);
}

unint64_t sub_21E401D6C()
{
  unint64_t result = qword_267D2BA78;
  if (!qword_267D2BA78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BA40);
    sub_21E3FD70C(&qword_267D2BA80, &qword_267D2BA48);
    sub_21E3FD70C(&qword_267D2BA88, &qword_267D2BA90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BA78);
  }
  return result;
}

unint64_t sub_21E401E30()
{
  unint64_t result = qword_267D2BA98;
  if (!qword_267D2BA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BA98);
  }
  return result;
}

uint64_t View.complicationContainerPath(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21E401EF0(a1, (uint64_t)v8);
  v6[0] = v8[0];
  v6[1] = v8[1];
  char v7 = v9;
  return MEMORY[0x223C26000](v6, a2, &type metadata for ComplicationContainerPathModifier, a3);
}

uint64_t sub_21E401EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static ComplicationContainerPathKey.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v2 = qword_267D2BAA0;
  uint64_t v3 = *(void *)algn_267D2BAA8;
  uint64_t v4 = qword_267D2BAB0;
  uint64_t v5 = qword_267D2BAB8;
  char v6 = byte_267D2BAC0;
  uint64_t result = sub_21E401FDC(qword_267D2BAA0, *(uint64_t *)algn_267D2BAA8, qword_267D2BAB0, qword_267D2BAB8, byte_267D2BAC0);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_21E401FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_21E401A74(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t static ComplicationContainerPathKey.defaultValue.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = qword_267D2BAA0;
  uint64_t v3 = *(void *)algn_267D2BAA8;
  uint64_t v4 = qword_267D2BAB0;
  uint64_t v5 = qword_267D2BAB8;
  unsigned __int8 v6 = byte_267D2BAC0;
  sub_21E401EF0(a1, (uint64_t)&qword_267D2BAA0);
  return sub_21E40207C(v2, v3, v4, v5, v6);
}

uint64_t sub_21E40207C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_21E401AF8(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t (*static ComplicationContainerPathKey.defaultValue.modify())()
{
  return j__swift_endAccess;
}

uint64_t static ComplicationContainerPathKey.reduce(value:nextValue:)(uint64_t a1, void (*a2)(void *__return_ptr))
{
  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    a2(v10);
    return sub_21E401EF0((uint64_t)v10, a1);
  }
  else
  {
    a2(v4);
    uint64_t result = sub_21E401EF0((uint64_t)v4, (uint64_t)v5);
    if (v6 != 255)
    {
      long long v7 = v5[0];
      long long v8 = v5[1];
      unsigned __int8 v9 = v6;
      v10[0] = 0x3FF0000000000000;
      v10[1] = 0;
      v10[2] = 0;
      v10[3] = 0x3FF0000000000000;
      void v10[4] = 0;
      v10[5] = 0;
      sub_21E41F410();
      return sub_21E402DBC((uint64_t)v4, (void (*)(void, void, void, void, void))sub_21E40207C);
    }
  }
  return result;
}

uint64_t sub_21E4021B8@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v2 = qword_267D2BAA0;
  uint64_t v3 = *(void *)algn_267D2BAA8;
  uint64_t v4 = qword_267D2BAB0;
  uint64_t v5 = qword_267D2BAB8;
  *(void *)a1 = qword_267D2BAA0;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  unsigned __int8 v6 = byte_267D2BAC0;
  *(unsigned char *)(a1 + 32) = byte_267D2BAC0;
  return sub_21E401FDC(v2, v3, v4, v5, v6);
}

double sub_21E402218(uint64_t a1, void (*a2)(long long *__return_ptr))
{
  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    a2(&v9);
    char v7 = v11;
    double result = *(double *)&v9;
    long long v8 = v10;
    *(_OWORD *)a1 = v9;
    *(_OWORD *)(a1 + 16) = v8;
    *(unsigned char *)(a1 + 32) = v7;
  }
  else
  {
    a2(&v9);
    unsigned __int8 v4 = v11;
    if (v11 != 255)
    {
      long long v5 = v9;
      long long v6 = v10;
      long long v9 = 0x3FF0000000000000uLL;
      *(void *)&long long v10 = 0;
      *((void *)&v10 + 1) = 0x3FF0000000000000;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      sub_21E41F410();
      sub_21E40207C(v5, *((uint64_t *)&v5 + 1), v6, *((uint64_t *)&v6 + 1), v4);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationContainerPathKey()
{
  return &type metadata for ComplicationContainerPathKey;
}

uint64_t sub_21E40232C()
{
  return swift_getWitnessTable();
}

uint64_t destroy for ComplicationContainerPathModifier(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 32);
  if (v1 != 255) {
    return sub_21E401AF8(*(void *)result, *(void *)(result + 8), *(void *)(result + 16), *(void *)(result + 24), v1);
  }
  return result;
}

uint64_t initializeWithCopy for ComplicationContainerPathModifier(uint64_t a1, uint64_t *a2)
{
  int v3 = *((unsigned __int8 *)a2 + 32);
  if (v3 == 255)
  {
    long long v8 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  }
  else
  {
    uint64_t v4 = *a2;
    uint64_t v5 = a2[1];
    uint64_t v6 = a2[2];
    uint64_t v7 = a2[3];
    sub_21E401A74(*a2, v5, v6, v7, v3);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v7;
    *(unsigned char *)(a1 + 32) = v3;
  }
  return a1;
}

uint64_t assignWithCopy for ComplicationContainerPathModifier(uint64_t a1, long long *a2)
{
  int v4 = *((unsigned __int8 *)a2 + 32);
  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    if (v4 == 255)
    {
      long long v20 = *a2;
      long long v21 = a2[1];
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      *(_OWORD *)a1 = v20;
      *(_OWORD *)(a1 + 16) = v21;
    }
    else
    {
      uint64_t v14 = *(void *)a2;
      uint64_t v15 = *((void *)a2 + 1);
      uint64_t v17 = *((void *)a2 + 2);
      uint64_t v16 = *((void *)a2 + 3);
      sub_21E401A74(*(void *)a2, v15, v17, v16, v4);
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v15;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = v16;
      *(unsigned char *)(a1 + 32) = v4;
    }
  }
  else if (v4 == 255)
  {
    sub_21E402524(a1);
    char v18 = *((unsigned char *)a2 + 32);
    long long v19 = a2[1];
    *(_OWORD *)a1 = *a2;
    *(_OWORD *)(a1 + 16) = v19;
    *(unsigned char *)(a1 + 32) = v18;
  }
  else
  {
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = *((void *)a2 + 1);
    uint64_t v8 = *((void *)a2 + 2);
    uint64_t v7 = *((void *)a2 + 3);
    sub_21E401A74(*(void *)a2, v6, v8, v7, v4);
    uint64_t v9 = *(void *)a1;
    uint64_t v10 = *(void *)(a1 + 8);
    uint64_t v11 = *(void *)(a1 + 16);
    uint64_t v12 = *(void *)(a1 + 24);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v7;
    unsigned __int8 v13 = *(unsigned char *)(a1 + 32);
    *(unsigned char *)(a1 + 32) = v4;
    sub_21E401AF8(v9, v10, v11, v12, v13);
  }
  return a1;
}

uint64_t sub_21E402524(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ComplicationContainerPathModifier(uint64_t a1, uint64_t a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 == 255) {
    goto LABEL_5;
  }
  int v5 = *(unsigned __int8 *)(a2 + 32);
  if (v5 == 255)
  {
    sub_21E402524(a1);
LABEL_5:
    long long v11 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v11;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    return a1;
  }
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(unsigned char *)(a1 + 32) = v5;
  sub_21E401AF8(v6, v7, v8, v9, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationContainerPathModifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 6) {
    int v4 = -1;
  }
  else {
    int v4 = (v3 ^ 0xFF) - 1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationContainerPathModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 249;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = ~(_BYTE)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationContainerPathModifier()
{
  return &type metadata for ComplicationContainerPathModifier;
}

uint64_t sub_21E4026A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E4026C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAD0);
  MEMORY[0x270FA5388](v29);
  uint64_t v6 = (double (**)@<D0>(uint64_t@<X8>))((char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAD8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  int v10 = *(unsigned __int8 *)(v2 + 32);
  if (v10 == 255)
  {
    unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v23((char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
    v23((char *)v6, (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAE0);
    sub_21E3FD70C(&qword_267D2BAE8, &qword_267D2BAE0);
    sub_21E3FD70C(&qword_267D2BAF0, &qword_267D2BAD8);
    sub_21E41F2A0();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))((char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  }
  else
  {
    uint64_t v11 = *(void *)(v2 + 24);
    uint64_t v26 = *(void *)(v2 + 16);
    uint64_t v27 = v11;
    uint64_t v12 = *(void *)(v2 + 8);
    uint64_t v24 = *(void *)v2;
    uint64_t v25 = v12;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
    unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v28 = a2;
    uint64_t v14 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v13, (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    unint64_t v15 = v14 + ((v13 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
    long long v16 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)unint64_t v15 = *(_OWORD *)v2;
    *(_OWORD *)(v15 + 16) = v16;
    *(unsigned char *)(v15 + 32) = *(unsigned char *)(v2 + 32);
    unint64_t v17 = v14 + ((v13 + v9 + 47) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = v24;
    uint64_t v18 = v25;
    *(void *)unint64_t v17 = v24;
    *(void *)(v17 + 8) = v18;
    uint64_t v21 = v26;
    uint64_t v20 = v27;
    *(void *)(v17 + 16) = v26;
    *(void *)(v17 + 24) = v20;
    *(unsigned char *)(v17 + 32) = v10;
    *uint64_t v6 = sub_21E402D00;
    v6[1] = (double (*)@<D0>(uint64_t@<X8>))v14;
    swift_storeEnumTagMultiPayload();
    sub_21E402DBC(v2, (void (*)(void, void, void, void, void))sub_21E401FDC);
    sub_21E401A74(v19, v18, v21, v20, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAE0);
    sub_21E3FD70C(&qword_267D2BAE8, &qword_267D2BAE0);
    sub_21E3FD70C(&qword_267D2BAF0, &qword_267D2BAD8);
    return sub_21E41F2A0();
  }
}

double sub_21E402A5C@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21E41F2D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E41F370();
  sub_21E41EF80();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_21E41F460();
  *(_OWORD *)unint64_t v13 = *(_OWORD *)&v13[3];
  uint64_t v8 = v13[5];
  uint64_t v9 = v13[6];
  LOBYTE(v4) = v14;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2, a1, v10);
  uint64_t v11 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAF8) + 36);
  double result = *(double *)v13;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v13;
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = v9;
  *(unsigned char *)(v11 + 32) = v4;
  return result;
}

uint64_t sub_21E402BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21E4026C0(a1, a2);
}

uint64_t sub_21E402C28()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAD8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v6 = v0 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  int v7 = *(unsigned __int8 *)(v6 + 32);
  if (v7 != 255) {
    sub_21E401AF8(*(void *)v6, *(void *)(v6 + 8), *(void *)(v6 + 16), *(void *)(v6 + 24), v7);
  }
  unint64_t v8 = (v5 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = v8 + 33;
  sub_21E401AF8(*(void *)(v0 + v8), *(void *)(v0 + v8 + 8), *(void *)(v0 + v8 + 16), *(void *)(v0 + v8 + 24), *(unsigned char *)(v0 + v8 + 32));
  return MEMORY[0x270FA0238](v0, v9, v3 | 7);
}

double sub_21E402D00@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2BAD8) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_21E402A5C(v4, a1);
}

uint64_t sub_21E402DBC(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

unint64_t sub_21E402E00()
{
  unint64_t result = qword_267D2BB00;
  if (!qword_267D2BB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_267D2BB08);
    sub_21E3FD70C(&qword_267D2BAE8, &qword_267D2BAE0);
    sub_21E3FD70C(&qword_267D2BAF0, &qword_267D2BAD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BB00);
  }
  return result;
}

uint64_t sub_21E402EC4(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t TupleTypeMetadata = *v5;
  }
  else
  {
    MEMORY[0x270FA5388]();
    unint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        long long v16 = &v8[8 * v9];
        unint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)long long v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  MEMORY[0x270FA5388]();
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(TupleTypeMetadata + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *a1++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_21E41F710();
}

double sub_21E403088()
{
  v6.origin.CGFloat x = sub_21E4030EC();
  CGFloat x = v6.origin.x;
  CGFloat y = v6.origin.y;
  CGFloat width = v6.size.width;
  CGFloat height = v6.size.height;
  double MidX = CGRectGetMidX(v6);
  v7.origin.CGFloat x = x;
  v7.origin.CGFloat y = y;
  v7.size.CGFloat width = width;
  v7.size.CGFloat height = height;
  CGRectGetMidY(v7);
  return MidX;
}

double sub_21E4030EC()
{
  id v1 = objc_msgSend(self, sel_sharedRenderingContext);
  id v2 = objc_msgSend(v1, sel_device);

  CDRichComplicationCornerTextCustomViewRect((uint64_t)v2, *(void *)(v0 + 16));
  double v4 = v3;

  return v4;
}

double sub_21E403190()
{
  sub_21E4030EC();
  return v1 / *v0;
}

double sub_21E4031B4()
{
  sub_21E4030EC();
  return v0;
}

uint64_t sub_21E4031D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v26 = sub_21E41F040();
  uint64_t v3 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v25 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B800);
  sub_21E41F050();
  sub_21E41F050();
  sub_21E41F050();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B808);
  sub_21E41F050();
  sub_21E41F050();
  swift_getTupleTypeMetadata2();
  sub_21E41F700();
  swift_getWitnessTable();
  uint64_t v6 = sub_21E41F6D0();
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)&v23 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B810);
  uint64_t v9 = sub_21E41F050();
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v29 = v5;
  uint64_t v30 = v15;
  uint64_t v31 = v27;
  sub_21E41F6F0();
  sub_21E41F6C0();
  swift_getKeyPath();
  long long v16 = v25;
  uint64_t v17 = v26;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v25, *MEMORY[0x263F18DC8], v26);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_21E41F4C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v16, v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  uint64_t v19 = sub_21E3FD70C((unint64_t *)&qword_267D2B818, &qword_267D2B810);
  uint64_t v32 = WitnessTable;
  uint64_t v33 = v19;
  uint64_t v20 = swift_getWitnessTable();
  sub_21E4095DC(v12, v9, v20);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v24 + 8);
  v21(v12, v9);
  sub_21E4095DC(v14, v9, v20);
  return ((uint64_t (*)(char *, uint64_t))v21)(v14, v9);
}

uint64_t sub_21E403620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v65 = a4;
  uint64_t v53 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  v45[0] = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B800);
  uint64_t v8 = sub_21E41F050();
  uint64_t v56 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v45 - v9;
  uint64_t v49 = sub_21E41F050();
  uint64_t v60 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  long long v46 = (char *)v45 - v11;
  uint64_t v52 = sub_21E41F050();
  uint64_t v62 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  long long v47 = (char *)v45 - v12;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B808);
  uint64_t v59 = sub_21E41F050();
  uint64_t v63 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v48 = (char *)v45 - v13;
  uint64_t v14 = sub_21E41F050();
  uint64_t v64 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v54 = (char *)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v61 = (char *)v45 - v17;
  v45[1] = type metadata accessor for ComplicationCornerTextView();
  sub_21E4030EC();
  sub_21E4030EC();
  uint64_t v58 = *(void *)(a1 + 16);
  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v57 = *(void *)(a1 + 24);
  uint64_t v55 = *(void *)(a1 + 40);
  type metadata accessor for MonochromeModel();
  sub_21E4045E8();
  swift_bridgeObjectRetain();
  id v19 = v18;
  uint64_t v51 = sub_21E41F030();
  uint64_t v50 = v20;
  uint64_t v21 = v45[0];
  (*(void (**)(void))(a1 + 48))();
  swift_getKeyPath();
  LOBYTE(v69[0]) = 1;
  sub_21E41F4C0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v21, a2);
  sub_21E41F730();
  uint64_t v22 = sub_21E3FD70C(&qword_267D2B828, &qword_267D2B800);
  v71[10] = a3;
  v71[11] = v22;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = v46;
  sub_21E41F4D0();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v10, v8);
  sub_21E41F6F0();
  v71[8] = WitnessTable;
  v71[9] = MEMORY[0x263F18880];
  uint64_t v25 = v49;
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v27 = v47;
  sub_21E41F510();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v24, v25);
  v71[6] = v26;
  v71[7] = MEMORY[0x263F18860];
  uint64_t v28 = v52;
  uint64_t v29 = swift_getWitnessTable();
  sub_21E3FD6B8();
  uint64_t v30 = v48;
  sub_21E41F550();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v27, v28);
  sub_21E403088();
  uint64_t v31 = sub_21E3FD70C(&qword_267D2B838, &qword_267D2B808);
  v71[4] = v29;
  v71[5] = v31;
  uint64_t v32 = v59;
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v34 = (uint64_t)v54;
  sub_21E41F540();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v30, v32);
  unint64_t v35 = sub_21E3FD750();
  v71[2] = v33;
  v71[3] = v35;
  uint64_t v36 = swift_getWitnessTable();
  long long v37 = v61;
  sub_21E4095DC(v34, v14, v36);
  uint64_t v38 = v64;
  long long v39 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
  v39(v34, v14);
  v69[0] = v58;
  v69[1] = v57;
  v69[2] = v55;
  v69[3] = v51;
  long long v40 = v50;
  id v70 = v50;
  v71[0] = (uint64_t)v69;
  id v41 = *(void (**)(uint64_t, char *, uint64_t))(v38 + 16);
  long long v42 = v37;
  v41(v34, v37, v14);
  v71[1] = v34;
  swift_bridgeObjectRetain();
  id v43 = v40;
  v68[0] = &type metadata for ComplicationCornerTextViewRepresentable;
  v68[1] = v14;
  unint64_t v66 = sub_21E404648();
  uint64_t v67 = v36;
  sub_21E402EC4(v71, 2uLL, (uint64_t)v68);
  v39((uint64_t)v42, v14);

  swift_bridgeObjectRelease();
  v39(v34, v14);

  return swift_bridgeObjectRelease();
}

uint64_t sub_21E403ECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21E4031D4(a1, a2);
}

id sub_21E403F08(void *a1)
{
  long long v9 = *(_OWORD *)(v1 + 24);
  objc_msgSend(a1, sel_setFilterProvider_, *((void *)&v9 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(void *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(void *)(v1 + 8));
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_21E40DEB8(v3);
  swift_bridgeObjectRelease();
  sub_21E404F98(0, &qword_267D2BBA0);
  uint64_t v4 = (void *)sub_21E41F7F0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInnerLabelProviders_, v4);

  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = *((id *)&v9 + 1);
  sub_21E41EED0();
  swift_release();
  swift_release();
  sub_21E3FE608((uint64_t)&v9);
  if (v8 >= 1.0) {
    return objc_msgSend(a1, sel_updateMonochromeColor, v8);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v5;
  sub_21E41EED0();
  swift_release();
  swift_release();
  sub_21E3FE608((uint64_t)&v9);
  return objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v8);
}

uint64_t sub_21E4040E4()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_21E404824;
  *(void *)(v3 + 24) = v2;
  void v8[4] = sub_21E3FD880;
  v8[5] = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_21E41611C;
  v8[3] = &block_descriptor_0;
  uint64_t v4 = _Block_copy(v8);
  id v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

id sub_21E4042D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView()
{
  return self;
}

uint64_t sub_21E40432C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_21E404334(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_21E404378(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v5;
  id v6 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_21E4043E0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = (void *)a2[4];
  uint64_t v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_21E404488(uint64_t a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;

  *(_OWORD *)(a1 + 32) = a2[2];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = a2[3];
  swift_release();
  return a1;
}

uint64_t sub_21E4044E0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E404528(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCornerTextView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21E404590()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E4045D4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E403620(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_21E4045E8()
{
  unint64_t result = qword_267D2B820;
  if (!qword_267D2B820)
  {
    type metadata accessor for MonochromeModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B820);
  }
  return result;
}

unint64_t sub_21E404648()
{
  unint64_t result = qword_267D2BB90;
  if (!qword_267D2BB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BB90);
  }
  return result;
}

id sub_21E40469C()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4]);
  sub_21E403F08(v1);
  return v1;
}

uint64_t sub_21E4046FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E404F44();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_21E404760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E404F44();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_21E4047C4()
{
}

uint64_t sub_21E4047EC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21E404824()
{
  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_21E404864()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_21E40488C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  uint64_t v18 = self;
  id v19 = a3;
  id v20 = objc_msgSend(v18, sel_sharedRenderingContext);
  id v21 = objc_msgSend(v20, sel_device);

  double v22 = CDRichComplicationCornerInnerImageMaxSize(v21);
  int64_t v24 = *(void *)(a4 + 16);
  if (v24)
  {
    double v25 = v22;
    double v26 = v23;
    uint64_t v39 = a1;
    uint64_t v40 = a2;
    uint64_t v41 = a7;
    uint64_t v42 = a5;
    uint64_t v44 = MEMORY[0x263F8EE78];
    sub_21E40095C(0, v24, 0);
    uint64_t v27 = (id *)(a4 + 32);
    do
    {
      id v28 = *v27;
      id v29 = objc_msgSend(v28, sel_textProvider);
      objc_msgSend(v29, sel_finalize);
      id v30 = objc_msgSend(v28, sel_imageProvider);
      uint64_t v31 = v30;
      if (v30)
      {
        objc_msgSend(v30, sel_copy);

        sub_21E41F890();
        swift_unknownObjectRelease();
        sub_21E404F98(0, (unint64_t *)&qword_267D2B850);
        if (swift_dynamicCast())
        {
          uint64_t v31 = v43;
          type metadata accessor for WidgetNamedImageProvider(0);
          uint64_t v32 = swift_dynamicCastClass();
          if (v32)
          {
            uint64_t v33 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(unsigned char *)(v32 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              uint64_t v34 = (double *)(v32 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              *uint64_t v34 = v25;
              v34[1] = v26;
              *(unsigned char *)(v32 + v33) = 1;
            }
          }
          else
          {
            objc_msgSend(v43, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v25, v26, v25, v26);
          }
        }
        else
        {
          uint64_t v31 = 0;
        }
      }
      id v35 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v29, v31);

      uint64_t v36 = v44;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v44 + 16) + 1, 1);
        uint64_t v36 = v44;
      }
      unint64_t v38 = *(void *)(v36 + 16);
      unint64_t v37 = *(void *)(v36 + 24);
      if (v38 >= v37 >> 1)
      {
        sub_21E40095C((char *)(v37 > 1), v38 + 1, 1);
        uint64_t v36 = v44;
      }
      *(void *)(v36 + 16) = v38 + 1;
      *(void *)(v36 + 8 * v38 + 32) = v35;
      ++v27;
      --v24;
    }
    while (v24);

    a5 = v42;
    a2 = v40;
    a7 = v41;
    a1 = v39;
  }
  else
  {

    uint64_t v36 = MEMORY[0x263F8EE78];
  }
  *(double *)a7 = a8;
  *(double *)(a7 + 8) = a9;
  *(void *)(a7 + 16) = a1;
  *(void *)(a7 + 24) = a2;
  *(void *)(a7 + 32) = v19;
  *(void *)(a7 + 40) = v36;
  *(void *)(a7 + 48) = a5;
  *(void *)(a7 + 56) = a6;
}

void destroy for ComplicationCornerTextViewRepresentable(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for ComplicationCornerTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  long long v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for ComplicationCornerTextViewRepresentable(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  long long v4 = (void *)a2[4];
  id v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ComplicationCornerTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  id v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerTextViewRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerTextViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerTextViewRepresentable()
{
  return &type metadata for ComplicationCornerTextViewRepresentable;
}

uint64_t sub_21E404DB0()
{
  return swift_getWitnessTable();
}

unint64_t sub_21E404F44()
{
  unint64_t result = qword_267D2BB98;
  if (!qword_267D2BB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BB98);
  }
  return result;
}

uint64_t sub_21E404F98(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_21E404FDC(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B810);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  id v30 = (uint64_t *)((char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v33 = sub_21E41F040();
  uint64_t v6 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  double v26 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  long long v9 = (void *)v1[2];
  uint64_t v31 = v1[1];
  uint64_t v32 = v8;
  uint64_t v10 = (void *)v1[4];
  uint64_t v29 = v1[3];
  uint64_t v11 = v1[6];
  uint64_t v27 = v1[5];
  type metadata accessor for MonochromeModel();
  sub_21E4045E8();
  id v12 = v9;
  swift_bridgeObjectRetain();
  id v28 = v10;
  swift_bridgeObjectRetain();
  uint64_t v13 = v11;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_21E41F030();
  uint64_t v16 = v15;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = v26;
  uint64_t v19 = v33;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v26, *MEMORY[0x263F18DC8], v33);
  id v20 = v30;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v30 + *(int *)(v4 + 36), v18, v19);
  *id v20 = KeyPath;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBA8);
  sub_21E405AE4((uint64_t)v20, (uint64_t)a1 + *(int *)(v21 + 36));
  uint64_t v22 = v31;
  *a1 = v32;
  a1[1] = v22;
  a1[2] = v14;
  a1[3] = v16;
  double v23 = v28;
  a1[4] = v29;
  a1[5] = v23;
  a1[6] = v27;
  a1[7] = v13;
  id v24 = v16;
  swift_bridgeObjectRetain();
  id v25 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21E405B4C((uint64_t)v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v18, v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

void sub_21E405278(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = swift_bridgeObjectRetain();
  id v5 = sub_21E40B590(v4);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v5, 0);
LABEL_3:
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = *(id *)(v3 + 8 * v10 + 32);
      id v12 = objc_msgSend(v11, sel_imageProvider);

      if (v12) {
        break;
      }
      ++v10;

      if (v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v11, sel_imageProvider);

    if (v6)
    {
      id v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v6);
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
LABEL_12:
  uint64_t v8 = 0;
LABEL_13:
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v14 = swift_bridgeObjectRetain();
  id v15 = sub_21E40B590(v14);
  if (v15)
  {
    id v16 = v15;
    id v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v15, 0);
LABEL_15:
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();

    goto LABEL_25;
  }
  uint64_t v19 = *(void *)(v13 + 16);
  if (v19)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = 0;
    while (1)
    {
      id v21 = *(id *)(v13 + 8 * v20 + 32);
      id v22 = objc_msgSend(v21, sel_imageProvider);

      if (v22) {
        break;
      }
      ++v20;

      if (v19 == v20)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v21, sel_imageProvider);

    if (v16)
    {
      id v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v16);
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v18 = 0;
LABEL_25:
  objc_msgSend(a1, sel_handleGaugeProvider_leftLabelProvider_rightLabelProvider_, *(void *)(v1 + 40), v8, v18);
  uint64_t v23 = swift_bridgeObjectRetain();
  sub_21E40DEB8(v23);
  swift_bridgeObjectRelease();
  sub_21E404F98(0, &qword_267D2BBA0);
  id v24 = (void *)sub_21E41F7F0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setOuterLabelProviders_, v24);

  long long v28 = *(_OWORD *)(v1 + 16);
  objc_msgSend(a1, sel_setFilterProvider_, *((void *)&v28 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(void *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(void *)(v1 + 8));
  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  id v25 = *((id *)&v28 + 1);
  sub_21E41EED0();
  swift_release();
  swift_release();
  sub_21E3FE608((uint64_t)&v28);
  if (v27 >= 1.0)
  {
    objc_msgSend(a1, sel_updateMonochromeColor, v27);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v26 = v25;
    sub_21E41EED0();
    swift_release();
    swift_release();
    sub_21E3FE608((uint64_t)&v28);
    objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v27);
  }
}

uint64_t sub_21E405680()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_21E405BE4;
  *(void *)(v3 + 24) = v2;
  void v8[4] = sub_21E3FD880;
  v8[5] = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_21E41611C;
  v8[3] = &block_descriptor_1;
  uint64_t v4 = _Block_copy(v8);
  id v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

id sub_21E405870()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView()
{
  return self;
}

uint64_t destroy for ComplicationCornerStackedGaugeView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedGaugeView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  id v6 = *(void **)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  id v7 = v3;
  swift_bridgeObjectRetain();
  id v8 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComplicationCornerStackedGaugeView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = (void *)a2[4];
  id v8 = (void *)a1[4];
  a1[4] = v7;
  id v9 = v7;

  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComplicationCornerStackedGaugeView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedGaugeView()
{
  return &type metadata for ComplicationCornerStackedGaugeView;
}

uint64_t sub_21E405AC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E405AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E405B4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E405BAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21E405BE4()
{
  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_21E405C24()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_21E405C4C()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
  sub_21E405278(v1);
  return v1;
}

uint64_t sub_21E405CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E4068DC();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_21E405D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E4068DC();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_21E405D74()
{
}

void sub_21E405D9C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  id v12 = self;
  id v67 = a3;
  id v13 = objc_msgSend(v12, sel_sharedRenderingContext);
  id v14 = objc_msgSend(v13, sel_device);

  uint64_t v71 = v14;
  double v15 = CDRichComplicationCornerGaugeOuterImageMaxSize(v14);
  uint64_t v17 = MEMORY[0x263F8EE78];
  int64_t v18 = *(void *)(a4 + 16);
  if (v18)
  {
    double v19 = v15;
    double v20 = v16;
    uint64_t v64 = a5;
    uint64_t v73 = MEMORY[0x263F8EE78];
    sub_21E40095C(0, v18, 0);
    for (uint64_t i = 0; i != v18; ++i)
    {
      id v22 = *(id *)(a4 + 8 * i + 32);
      id v23 = objc_msgSend(v22, sel_textProvider);
      objc_msgSend(v23, sel_finalize);
      id v24 = objc_msgSend(v22, sel_imageProvider);
      if (v24
        && (id v25 = v24,
            objc_msgSend(v24, sel_copy),
            v25,
            sub_21E41F890(),
            swift_unknownObjectRelease(),
            sub_21E404F98(0, (unint64_t *)&qword_267D2B850),
            (swift_dynamicCast() & 1) != 0))
      {
        id v26 = v72;
        type metadata accessor for WidgetNamedImageProvider(0);
        uint64_t v27 = swift_dynamicCastClass();
        if (v27)
        {
          uint64_t v28 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(unsigned char *)(v27 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            uint64_t v29 = (double *)(v27 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *uint64_t v29 = v19;
            v29[1] = v20;
            *(unsigned char *)(v27 + v28) = 1;
          }
        }
        else
        {
          objc_msgSend(v72, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v19, v20, v19, v20);
        }
      }
      else
      {
        id v26 = 0;
      }
      id v30 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v23, v26);

      uint64_t v31 = v73;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v73 + 16) + 1, 1);
        uint64_t v31 = v73;
      }
      unint64_t v33 = *(void *)(v31 + 16);
      unint64_t v32 = *(void *)(v31 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_21E40095C((char *)(v32 > 1), v33 + 1, 1);
        uint64_t v31 = v73;
      }
      *(void *)(v31 + 16) = v33 + 1;
      *(void *)(v31 + 8 * v33 + 32) = v30;
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
    a5 = v64;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v31 = MEMORY[0x263F8EE78];
  }
  id v65 = a5;
  double v34 = CDRichComplicationCornerInnerImageMaxSize(v71);
  double v36 = v35;
  int64_t v37 = *(void *)(a6 + 16);
  if (v37)
  {
    uint64_t v74 = v17;
    sub_21E40095C(0, v37, 0);
    for (uint64_t j = 0; j != v37; ++j)
    {
      id v39 = *(id *)(a6 + 8 * j + 32);
      id v40 = objc_msgSend(v39, sel_textProvider);
      objc_msgSend(v40, sel_finalize);
      id v41 = objc_msgSend(v39, sel_imageProvider);
      if (v41
        && (uint64_t v42 = v41,
            objc_msgSend(v41, sel_copy),
            v42,
            sub_21E41F890(),
            swift_unknownObjectRelease(),
            sub_21E404F98(0, (unint64_t *)&qword_267D2B850),
            (swift_dynamicCast() & 1) != 0))
      {
        id v43 = v72;
        type metadata accessor for WidgetNamedImageProvider(0);
        uint64_t v44 = swift_dynamicCastClass();
        if (v44)
        {
          uint64_t v45 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(unsigned char *)(v44 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            long long v46 = (double *)(v44 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *long long v46 = v34;
            v46[1] = v36;
            *(unsigned char *)(v44 + v45) = 1;
          }
        }
        else
        {
          objc_msgSend(v72, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v34, v36, v34, v36);
        }
      }
      else
      {
        id v43 = 0;
      }
      id v47 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v40, v43);

      uint64_t v48 = v74;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v74 + 16) + 1, 1);
        uint64_t v48 = v74;
      }
      unint64_t v50 = *(void *)(v48 + 16);
      unint64_t v49 = *(void *)(v48 + 24);
      if (v50 >= v49 >> 1)
      {
        sub_21E40095C((char *)(v49 > 1), v50 + 1, 1);
        uint64_t v48 = v74;
      }
      *(void *)(v48 + 16) = v50 + 1;
      *(void *)(v48 + 8 * v50 + 32) = v47;
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v48 = MEMORY[0x263F8EE78];
  }
  int64_t v51 = *(void *)(a7 + 16);
  if (v51)
  {
    uint64_t v75 = v17;
    sub_21E40095C(0, v51, 0);
    uint64_t v52 = (id *)(a7 + 32);
    do
    {
      id v53 = *v52;
      id v54 = objc_msgSend(v53, sel_textProvider);
      objc_msgSend(v54, sel_finalize);
      id v55 = objc_msgSend(v53, sel_imageProvider);
      if (v55
        && (uint64_t v56 = v55,
            objc_msgSend(v55, sel_copy),
            v56,
            sub_21E41F890(),
            swift_unknownObjectRelease(),
            sub_21E404F98(0, (unint64_t *)&qword_267D2B850),
            (swift_dynamicCast() & 1) != 0))
      {
        uint64_t v57 = v72;
        type metadata accessor for WidgetNamedImageProvider(0);
        uint64_t v58 = swift_dynamicCastClass();
        if (v58)
        {
          uint64_t v59 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(unsigned char *)(v58 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            uint64_t v60 = (double *)(v58 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *uint64_t v60 = v34;
            v60[1] = v36;
            *(unsigned char *)(v58 + v59) = 1;
          }
        }
        else
        {
          objc_msgSend(v72, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v34, v36, v34, v36);
        }
      }
      else
      {
        uint64_t v57 = 0;
      }
      id v61 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v54, v57);

      uint64_t v17 = v75;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v75 + 16) + 1, 1);
        uint64_t v17 = v75;
      }
      unint64_t v63 = *(void *)(v17 + 16);
      unint64_t v62 = *(void *)(v17 + 24);
      if (v63 >= v62 >> 1)
      {
        sub_21E40095C((char *)(v62 > 1), v63 + 1, 1);
        uint64_t v17 = v75;
      }
      *(void *)(v17 + 16) = v63 + 1;
      *(void *)(v17 + 8 * v63 + 32) = v61;
      ++v52;
      --v51;
    }
    while (v51);
  }

  *a8 = a1;
  a8[1] = a2;
  a8[2] = v67;
  a8[3] = v31;
  a8[4] = v65;
  a8[5] = v48;
  a8[6] = v17;
}

uint64_t destroy for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  id v7 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComplicationCornerStackedGaugeViewRepresentable(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v4 = (void *)a2[3];
  uint64_t v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = (void *)a2[5];
  id v8 = (void *)a1[5];
  a1[5] = v7;
  id v9 = v7;

  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerStackedGaugeViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable()
{
  return &type metadata for ComplicationCornerStackedGaugeViewRepresentable;
}

unint64_t sub_21E4067A4()
{
  unint64_t result = qword_267D2BBB0;
  if (!qword_267D2BBB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BBA8);
    sub_21E406820();
    sub_21E406874();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BBB0);
  }
  return result;
}

unint64_t sub_21E406820()
{
  unint64_t result = qword_267D2BBB8;
  if (!qword_267D2BBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BBB8);
  }
  return result;
}

unint64_t sub_21E406874()
{
  unint64_t result = qword_267D2B818;
  if (!qword_267D2B818)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B818);
  }
  return result;
}

unint64_t sub_21E4068DC()
{
  unint64_t result = qword_267D2BBC0;
  if (!qword_267D2BBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BBC0);
  }
  return result;
}

double MonochromeModel.fraction.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  return v1;
}

double sub_21E4069A4@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_21E406A28(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_21E41EEE0();
}

uint64_t MonochromeModel.fraction.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_21E41EEE0();
}

uint64_t (*MonochromeModel.fraction.modify(void *a1))()
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21E41EEC0();
  return sub_21E406BA4;
}

uint64_t MonochromeModel.$fraction.getter()
{
  return sub_21E4075D8((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_267D2BBD8);
}

uint64_t MonochromeModel.$fraction.setter(uint64_t a1)
{
  return sub_21E407848(a1, &qword_267D2BBE0, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_267D2BBD8);
}

uint64_t (*MonochromeModel.$fraction.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBE0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBD8);
  sub_21E41EEA0();
  swift_endAccess();
  return sub_21E406CE8;
}

uint64_t MonochromeModel.accent.getter()
{
  return sub_21E406F24();
}

uint64_t sub_21E406D00@<X0>(void *a1@<X8>)
{
  return sub_21E406FA4(a1);
}

uint64_t sub_21E406D18(uint64_t a1, void **a2)
{
  return sub_21E407038(a1, a2);
}

uint64_t MonochromeModel.accent.setter()
{
  return sub_21E4070C4();
}

uint64_t (*MonochromeModel.accent.modify(void *a1))()
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21E41EEC0();
  return sub_21E406BA4;
}

uint64_t MonochromeModel.$accent.getter()
{
  return sub_21E4075D8((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_267D2BBF0);
}

uint64_t MonochromeModel.$accent.setter(uint64_t a1)
{
  return sub_21E407848(a1, &qword_267D2BBF8, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_267D2BBF0);
}

uint64_t (*MonochromeModel.$accent.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBF0);
  sub_21E41EEA0();
  swift_endAccess();
  return sub_21E406CE8;
}

uint64_t MonochromeModel.background.getter()
{
  return sub_21E406F24();
}

uint64_t sub_21E406F24()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21E406F90@<X0>(void *a1@<X8>)
{
  return sub_21E406FA4(a1);
}

uint64_t sub_21E406FA4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_21E407024(uint64_t a1, void **a2)
{
  return sub_21E407038(a1, a2);
}

uint64_t sub_21E407038(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  id v3 = v2;
  return sub_21E41EEE0();
}

uint64_t MonochromeModel.background.setter()
{
  return sub_21E4070C4();
}

uint64_t sub_21E4070C4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_21E41EEE0();
}

uint64_t (*MonochromeModel.background.modify(void *a1))()
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21E41EEC0();
  return sub_21E406BA4;
}

uint64_t MonochromeModel.$background.getter()
{
  return sub_21E4075D8((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_267D2BBF0);
}

uint64_t MonochromeModel.$background.setter(uint64_t a1)
{
  return sub_21E407848(a1, &qword_267D2BBF8, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_267D2BBF0);
}

uint64_t (*MonochromeModel.$background.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBF0);
  sub_21E41EEA0();
  swift_endAccess();
  return sub_21E406CE8;
}

uint64_t MonochromeModel.style.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21E40736C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_21E4073F0(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_21E41EEE0();
}

uint64_t MonochromeModel.style.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_21E41EEE0();
}

uint64_t (*MonochromeModel.style.modify(void *a1))()
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21E41EEC0();
  return sub_21E406BA4;
}

void sub_21E40755C(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t MonochromeModel.$style.getter()
{
  return sub_21E4075D8((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_267D2BC10);
}

uint64_t sub_21E4075D8(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_21E407640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_21E4076B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  double v15 = (char *)&v18 - v14;
  double v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_21E41EEB0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t MonochromeModel.$style.setter(uint64_t a1)
{
  return sub_21E407848(a1, (uint64_t *)&unk_267D2BC18, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_267D2BC10);
}

uint64_t sub_21E407848(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_21E41EEB0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*MonochromeModel.$style.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2BC18);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BC10);
  sub_21E41EEA0();
  swift_endAccess();
  return sub_21E406CE8;
}

void sub_21E407A88(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_21E41EEB0();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_21E41EEB0();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

id MonochromeModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id MonochromeModel.init()()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BC10);
  uint64_t v2 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBD8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = &v1[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction];
  uint64_t v24 = 0;
  uint64_t v14 = v1;
  sub_21E41EE90();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v12, v9);
  double v15 = &v14[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent];
  uint64_t v24 = sub_21E41F590();
  sub_21E41EE90();
  double v16 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v16(v15, v8, v5);
  uint64_t v17 = &v14[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background];
  uint64_t v24 = sub_21E41F590();
  sub_21E41EE90();
  v16(v17, v8, v5);
  uint64_t v18 = &v14[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style];
  uint64_t v24 = 1;
  type metadata accessor for CLKMonochromeFilterStyle(0);
  sub_21E41EE90();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v18, v4, v21);

  v23.receiver = v14;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, sel_init);
}

id MonochromeModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21E4080B4@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_21E41EE80();
  *a1 = result;
  return result;
}

uint64_t MonochromeModel.filters(for:style:)()
{
  return sub_21E4082F0();
}

uint64_t MonochromeModel.filters(for:style:fraction:)()
{
  return sub_21E40844C();
}

uint64_t MonochromeModel.filter(for:style:)()
{
  return 0;
}

uint64_t MonochromeModel.filter(for:style:fraction:)()
{
  return 0;
}

UIColor_optional __swiftcall MonochromeModel.color(for:accented:)(UIView *a1, Swift::Bool accented)
{
  objc_super v2 = (objc_class *)sub_21E4085B4();
  result.value.super.isa = v2;
  result.is_nil = v3;
  return result;
}

UIColor_optional __swiftcall MonochromeModel.backgroundColor(for:)(UIView *a1)
{
  id v1 = 0;
  result.value.super.isa = v1;
  return result;
}

uint64_t sub_21E4082F0()
{
  sub_21E404F98(0, &qword_267D2BCB8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  uint64_t v0 = (void *)sub_21E41F870();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  id v1 = (void *)sub_21E41F870();
  id v2 = (id)CLKUIMonochromeFiltersForStyle();

  if (!v2) {
    return 0;
  }
  sub_21E404F98(0, &qword_267D2BCB0);
  uint64_t v3 = sub_21E41F800();

  return v3;
}

uint64_t sub_21E40844C()
{
  sub_21E404F98(0, &qword_267D2BCB8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  uint64_t v0 = (void *)sub_21E41F870();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  id v1 = (void *)sub_21E41F870();
  id v2 = (id)CLKUIMonochromeFiltersForStyle();

  if (!v2) {
    return 0;
  }
  sub_21E404F98(0, &qword_267D2BCB0);
  uint64_t v3 = sub_21E41F800();

  return v3;
}

uint64_t sub_21E4085B4()
{
  return sub_21E41F870();
}

uint64_t sub_21E408670()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_21E40867C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E407640(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_267D2BBD8);
}

uint64_t sub_21E4086A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21E4076B0(a1, a2, a3, a4, &qword_267D2BBE0, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_267D2BBD8);
}

uint64_t sub_21E4086D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E407640(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_267D2BBF0);
}

uint64_t sub_21E4086FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21E4076B0(a1, a2, a3, a4, &qword_267D2BBF8, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_267D2BBF0);
}

uint64_t sub_21E40872C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E407640(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_267D2BBF0);
}

uint64_t sub_21E408754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21E4076B0(a1, a2, a3, a4, &qword_267D2BBF8, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_267D2BBF0);
}

uint64_t sub_21E408784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E407640(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_267D2BC10);
}

uint64_t sub_21E4087AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21E4076B0(a1, a2, a3, a4, (uint64_t *)&unk_267D2BC18, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_267D2BC10);
}

uint64_t sub_21E4087DC()
{
  return type metadata accessor for MonochromeModel();
}

uint64_t type metadata accessor for MonochromeModel()
{
  uint64_t result = qword_267D2BC28;
  if (!qword_267D2BC28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21E408830()
{
  sub_21E408954(319, &qword_267D2BC38);
  if (v0 <= 0x3F)
  {
    sub_21E408954(319, &qword_267D2BC40);
    if (v1 <= 0x3F)
    {
      sub_21E40899C();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_21E408954(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_21E41EEF0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_21E40899C()
{
  if (!qword_267D2BC48)
  {
    type metadata accessor for CLKMonochromeFilterStyle(255);
    unint64_t v0 = sub_21E41EEF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267D2BC48);
    }
  }
}

float ComplicationCurvedTextMetrics.angularRange.getter()
{
  return *(float *)v0;
}

void ComplicationCurvedTextMetrics.angularRange.setter(float a1, float a2)
{
  *unint64_t v2 = a1;
  v2[1] = a2;
}

uint64_t (*ComplicationCurvedTextMetrics.angularRange.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextMetrics.accessoryCenter.getter()
{
  return *(double *)(v0 + 8);
}

void ComplicationCurvedTextMetrics.accessoryCenter.setter(double a1, double a2)
{
  *(double *)(v2 + 8) = a1;
  *(double *)(v2 + 16) = a2;
}

uint64_t (*ComplicationCurvedTextMetrics.accessoryCenter.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextMetrics.accessoryRotation.getter()
{
  return *(double *)(v0 + 24);
}

void ComplicationCurvedTextMetrics.accessoryRotation.setter(double a1)
{
  *(double *)(v1 + 24) = a1;
}

uint64_t (*ComplicationCurvedTextMetrics.accessoryRotation.modify())()
{
  return nullsub_1;
}

void ComplicationCurvedTextMetrics.init(angularRange:accessoryCenter:accessoryRotation:)(uint64_t a1@<X8>, float a2@<S0>, float a3@<S1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  *(float *)a1 = a2;
  *(float *)(a1 + 4) = a3;
  *(double *)(a1 + 8) = a4;
  *(double *)(a1 + 16) = a5;
  *(double *)(a1 + 24) = a6;
  *(unsigned char *)(a1 + 32) = 0;
}

double sub_21E408A98()
{
  byte_267D2E490 = 0;
  double result = 0.0;
  xmmword_267D2E470 = 0u;
  unk_267D2E480 = 0u;
  return result;
}

double sub_21E408AB0()
{
  if (qword_267D2B728 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_267D2E488;
  qword_267D2E498 = xmmword_267D2E470;
  unk_267D2E4A0 = *(long long *)((char *)&xmmword_267D2E470 + 8);
  qword_267D2E4B0 = qword_267D2E488;
  byte_267D2E4B8 = 1;
  return result;
}

double sub_21E408B2C()
{
  if (qword_267D2B730 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_267D2E4B0;
  qword_267D2BCC0 = qword_267D2E498;
  *(_OWORD *)algn_267D2BCC8 = unk_267D2E4A0;
  qword_267D2BCD8 = qword_267D2E4B0;
  byte_267D2BCE0 = byte_267D2E4B8;
  return result;
}

double static ComplicationCurvedTextMetricsKey.defaultValue.getter@<D0>(uint64_t a1@<X8>)
{
  if (qword_267D2B738 != -1) {
    swift_once();
  }
  swift_beginAccess();
  double result = *(double *)&qword_267D2BCD8;
  char v3 = byte_267D2BCE0;
  *(void *)a1 = qword_267D2BCC0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)algn_267D2BCC8;
  *(double *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 32) = v3;
  return result;
}

uint64_t static ComplicationCurvedTextMetricsKey.defaultValue.setter(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  char v5 = *(unsigned char *)(a1 + 32);
  if (qword_267D2B738 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  qword_267D2BCC0 = v1;
  *(void *)algn_267D2BCC8 = v2;
  qword_267D2BCD0 = v3;
  qword_267D2BCD8 = v4;
  byte_267D2BCE0 = v5;
  return result;
}

uint64_t (*static ComplicationCurvedTextMetricsKey.defaultValue.modify())()
{
  if (qword_267D2B738 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void *static ComplicationCurvedTextMetricsKey.reduce(value:nextValue:)(void *result, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t v2 = result;
  if (*((unsigned char *)result + 32) == 1)
  {
    uint64_t result = a2(&v7);
    uint64_t v3 = v7;
    long long v4 = v8;
    uint64_t v5 = v9;
    char v6 = v10;
  }
  else
  {
    char v6 = 0;
    uint64_t v3 = *result;
    long long v4 = *(_OWORD *)(result + 1);
    uint64_t v5 = result[3];
  }
  *uint64_t v2 = v3;
  *(_OWORD *)(v2 + 1) = v4;
  _OWORD v2[3] = v5;
  *((unsigned char *)v2 + 32) = v6;
  return result;
}

double sub_21E408DCC@<D0>(uint64_t a1@<X8>)
{
  if (qword_267D2B738 != -1) {
    swift_once();
  }
  swift_beginAccess();
  double result = *(double *)&qword_267D2BCD8;
  char v3 = byte_267D2BCE0;
  *(void *)a1 = qword_267D2BCC0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)algn_267D2BCC8;
  *(double *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 32) = v3;
  return result;
}

void *sub_21E408E60(void *result, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t v2 = result;
  if (*((unsigned char *)result + 32) == 1)
  {
    double result = a2(&v7);
    uint64_t v3 = v7;
    long long v4 = v8;
    uint64_t v5 = v9;
    char v6 = v10;
  }
  else
  {
    char v6 = 0;
    uint64_t v3 = *result;
    long long v4 = *(_OWORD *)(result + 1);
    uint64_t v5 = result[3];
  }
  *uint64_t v2 = v3;
  *(_OWORD *)(v2 + 1) = v4;
  _OWORD v2[3] = v5;
  *((unsigned char *)v2 + 32) = v6;
  return result;
}

double sub_21E408ED8@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_21E4094A4();
  sub_21E41EE30();
  swift_release();
  double result = *(double *)(v1 + 40);
  char v4 = *(unsigned char *)(v1 + 48);
  *(void *)a1 = *(void *)(v1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 24);
  *(double *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 32) = v4;
  return result;
}

double sub_21E408F68@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_21E4094A4();
  sub_21E41EE30();
  swift_release();
  double result = *(double *)(v3 + 40);
  char v5 = *(unsigned char *)(v3 + 48);
  *(void *)a2 = *(void *)(v3 + 16);
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(v3 + 24);
  *(double *)(a2 + 24) = result;
  *(unsigned char *)(a2 + 32) = v5;
  return result;
}

uint64_t sub_21E408FF8()
{
  return swift_release();
}

__n128 sub_21E4090A4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 32);
  return result;
}

uint64_t sub_21E4090B8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay39ComplicationCurvedTextMetricsObservable___observationRegistrar;
  uint64_t v2 = sub_21E41EE70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

__n128 sub_21E409158@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  swift_getKeyPath();
  sub_21E4094A4();
  sub_21E41EE30();
  swift_release();
  __n128 v12 = *(__n128 *)(v5 + 24);
  uint64_t v6 = *(void *)(v5 + 40);
  char v7 = *(unsigned char *)(v5 + 48);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BD08);
  uint64_t v9 = *(void *)(v5 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  uint64_t v10 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D2BD10) + 36);
  *(void *)uint64_t v10 = v9;
  __n128 result = v12;
  *(__n128 *)(v10 + 8) = v12;
  *(void *)(v10 + 24) = v6;
  *(unsigned char *)(v10 + 32) = v7;
  return result;
}

uint64_t _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(float *)a1 != *(float *)a2
    || *(float *)(a1 + 4) != *(float *)(a2 + 4)
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16))
  {
    return 0;
  }
  int v6 = *(unsigned __int8 *)(a1 + 32);
  int v7 = *(unsigned __int8 *)(a2 + 32);
  if (sub_21E41F560()) {
    return v6 ^ v7 ^ 1u;
  }
  else {
    return 0;
  }
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedTextMetrics(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedTextMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextMetrics()
{
  return &type metadata for ComplicationCurvedTextMetrics;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextMetricsKey()
{
  return &type metadata for ComplicationCurvedTextMetricsKey;
}

uint64_t sub_21E409380()
{
  return type metadata accessor for ComplicationCurvedTextMetricsObservable();
}

uint64_t type metadata accessor for ComplicationCurvedTextMetricsObservable()
{
  uint64_t result = qword_267D2BCF0;
  if (!qword_267D2BCF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E4093D4()
{
  uint64_t result = sub_21E41EE70();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextMetricsObservableViewModifier()
{
  return &type metadata for ComplicationCurvedTextMetricsObservableViewModifier;
}

uint64_t sub_21E409480()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21E4094A4()
{
  unint64_t result = qword_267D2BD00;
  if (!qword_267D2BD00)
  {
    type metadata accessor for ComplicationCurvedTextMetricsObservable();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BD00);
  }
  return result;
}

__n128 sub_21E4094FC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  __n128 result = *(__n128 *)v2;
  long long v4 = *(_OWORD *)(v2 + 16);
  *(unsigned char *)(v1 + 48) = *(unsigned char *)(v2 + 32);
  *(__n128 *)(v1 + 16) = result;
  *(_OWORD *)(v1 + 32) = v4;
  return result;
}

unint64_t sub_21E409518()
{
  unint64_t result = qword_267D2BD18;
  if (!qword_267D2BD18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BD10);
    sub_21E3FD70C(&qword_267D2BD20, &qword_267D2BD08);
    sub_21E3FD70C(&qword_267D2BD28, &qword_267D2BD30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BD18);
  }
  return result;
}

uint64_t sub_21E4095E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

double ComplicationCornerViewConfiguration.contentSize.getter()
{
  return *(double *)v0;
}

void ComplicationCornerViewConfiguration.contentSize.setter(double a1, double a2)
{
  *uint64_t v2 = a1;
  v2[1] = a2;
}

uint64_t (*ComplicationCornerViewConfiguration.contentSize.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCornerViewConfiguration.outerLabelProviders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComplicationCornerViewConfiguration.outerLabelProviders.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*ComplicationCornerViewConfiguration.outerLabelProviders.modify())()
{
  return nullsub_1;
}

void *ComplicationCornerViewConfiguration.innerContent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  char v5 = *(unsigned char *)(v1 + 48);
  *(unsigned char *)(a1 + 24) = v5;
  return sub_21E4096B8(v2, v3, v4, v5);
}

void *sub_21E4096B8(void *result, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    if (a4 != 1) {
      return result;
    }
    id v4 = result;
    swift_bridgeObjectRetain();
  }
  return (void *)swift_bridgeObjectRetain();
}

__n128 ComplicationCornerViewConfiguration.innerContent.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unsigned __int8 v3 = a1[1].n128_u8[8];
  sub_21E40977C(*(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48));
  __n128 result = v5;
  *(__n128 *)(v1 + 24) = v5;
  *(void *)(v1 + 40) = v2;
  *(unsigned char *)(v1 + 48) = v3;
  return result;
}

void *sub_21E40977C(void *result, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    if (a4 != 1) {
      return result;
    }

    swift_bridgeObjectRelease();
  }
  return (void *)swift_bridgeObjectRelease();
}

uint64_t (*ComplicationCornerViewConfiguration.innerContent.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCornerViewConfiguration.position.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t ComplicationCornerViewConfiguration.position.setter(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t (*ComplicationCornerViewConfiguration.position.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCornerViewConfiguration.fontStyle.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t ComplicationCornerViewConfiguration.fontStyle.setter(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  return result;
}

uint64_t (*ComplicationCornerViewConfiguration.fontStyle.modify())()
{
  return nullsub_1;
}

id ComplicationCornerViewConfiguration.monochromeModel.getter()
{
  return *(id *)(v0 + 72);
}

__n128 ComplicationCornerViewConfiguration.init(contentSize:outerLabelProviders:innerContent:position:fontStyle:monochromeModel:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  unint64_t v8 = a2[1].n128_u64[0];
  unsigned __int8 v9 = a2[1].n128_u8[8];
  *(double *)a6 = a7;
  *(double *)(a6 + 8) = a8;
  *(void *)(a6 + 16) = a1;
  __n128 result = *a2;
  *(__n128 *)(a6 + 24) = *a2;
  *(void *)(a6 + 40) = v8;
  *(unsigned char *)(a6 + 48) = v9;
  *(void *)(a6 + 56) = a3;
  *(void *)(a6 + 64) = a4;
  *(void *)(a6 + 72) = a5;
  return result;
}

__n128 CornerComplicationView.init(configuration:content:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 72);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(void *)(a4 + 16) = v4;
  *(_OWORD *)(a4 + 24) = *(_OWORD *)(a1 + 24);
  *(void *)(a4 + 40) = v5;
  *(unsigned char *)(a4 + 48) = v6;
  __n128 result = *(__n128 *)(a1 + 56);
  *(__n128 *)(a4 + 56) = result;
  *(void *)(a4 + 72) = v7;
  *(void *)(a4 + 80) = a2;
  *(void *)(a4 + 88) = a3;
  return result;
}

void sub_21E4098D8(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v7 = *(void *)(v3 + 56);
  id v8 = objc_msgSend(self, sel_currentDevice);
  if (v8)
  {
    unsigned __int8 v9 = v8;
    id v10 = objc_msgSend(self, sel_hitTestPathWithViewBounds_position_forDevice_, v7, v8, 0.0, 0.0, a2, a3);

    id v11 = objc_msgSend(v10, sel_CGPath);
    sub_21E41F490();

    *(_OWORD *)a1 = v12;
    *(_OWORD *)(a1 + 16) = v13;
    *(unsigned char *)(a1 + 32) = v14;
  }
  else
  {
    __break(1u);
  }
}

uint64_t CornerComplicationView.body.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  long long v4 = v2[3];
  v34[2] = v2[2];
  v34[3] = v4;
  long long v5 = v2[5];
  v34[4] = v2[4];
  v34[5] = v5;
  long long v6 = v2[1];
  v34[0] = *v2;
  v34[1] = v6;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = *(void *)(a1 + 24);
  *(void *)(v7 + 16) = *(void *)(a1 + 16);
  *(void *)(v7 + 24) = v8;
  long long v9 = v2[3];
  *(_OWORD *)(v7 + 64) = v2[2];
  *(_OWORD *)(v7 + 80) = v9;
  long long v10 = v2[5];
  *(_OWORD *)(v7 + 96) = v2[4];
  *(_OWORD *)(v7 + 112) = v10;
  long long v11 = v2[1];
  *(_OWORD *)(v7 + 32) = *v2;
  *(_OWORD *)(v7 + 48) = v11;
  sub_21E40A360((uint64_t)v34);
  type metadata accessor for ComplicationCornerCircularView();
  type metadata accessor for ComplicationCornerTextView();
  sub_21E41F2B0();
  sub_21E41F2B0();
  type metadata accessor for ComplicationCornerGaugeView();
  sub_21E41F2B0();
  sub_21E41F2B0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BD38);
  sub_21E41F050();
  sub_21E41F050();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v31 = sub_21E40A3D8();
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v29 = WitnessTable;
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  unint64_t v27 = sub_21E40A42C();
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v25 = v13;
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v24 = sub_21E3FD70C(qword_267D2BD50, &qword_267D2BD38);
  uint64_t v21 = swift_getWitnessTable();
  unint64_t v22 = sub_21E401E30();
  swift_getWitnessTable();
  uint64_t v19 = sub_21E41EFF0();
  uint64_t v20 = v14;
  uint64_t v15 = sub_21E41F000();
  swift_getWitnessTable();
  double v16 = *(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v15 - 8) + 16);
  v16(v33, &v19, v15);
  swift_release();
  uint64_t v19 = v33[0];
  uint64_t v20 = v33[1];
  v16(a2, &v19, v15);
  return swift_release();
}

uint64_t sub_21E409D34@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, char *a3@<X8>)
{
  v40[0] = a1;
  uint64_t v48 = a3;
  uint64_t v4 = sub_21E41F090();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  long long v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40[1] = type metadata accessor for ComplicationCornerCircularView();
  v40[3] = type metadata accessor for ComplicationCornerTextView();
  v40[4] = sub_21E41F2B0();
  v40[2] = sub_21E41F2B0();
  v40[5] = type metadata accessor for ComplicationCornerGaugeView();
  uint64_t v42 = sub_21E41F2B0();
  sub_21E41F2B0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BD38);
  uint64_t v7 = sub_21E41F050();
  uint64_t v47 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v41 = (char *)v40 - v8;
  uint64_t v9 = sub_21E41F050();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v43 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v44 = (char *)v40 - v13;
  long long v14 = a2[3];
  long long v66 = a2[2];
  long long v67 = v14;
  long long v15 = a2[5];
  long long v68 = a2[4];
  long long v69 = v15;
  long long v16 = a2[1];
  long long v64 = *a2;
  long long v65 = v16;
  uint64_t v17 = type metadata accessor for CornerComplicationView();
  sub_21E40A480(v17, (uint64_t)&v70);
  long long v64 = v70;
  long long v65 = v71;
  long long v66 = v72;
  long long v67 = v73;
  long long v68 = v74;
  LOWORD(v69) = v75;
  sub_21E41F080();
  sub_21E41EF70();
  sub_21E4098D8((uint64_t)v76, v18, v19);
  long long v61 = v76[0];
  long long v62 = v76[1];
  char v63 = v77;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v21 = sub_21E40A3D8();
  uint64_t v22 = swift_getWitnessTable();
  unint64_t v59 = v21;
  uint64_t v60 = v22;
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v57 = WitnessTable;
  uint64_t v58 = v23;
  uint64_t v24 = swift_getWitnessTable();
  unint64_t v25 = sub_21E40A42C();
  uint64_t v26 = swift_getWitnessTable();
  unint64_t v55 = v25;
  uint64_t v56 = v26;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v53 = v24;
  uint64_t v54 = v27;
  uint64_t v28 = swift_getWitnessTable();
  sub_21E40D5D4();
  uint64_t v29 = v41;
  sub_21E41F4E0();
  sub_21E40D628((uint64_t)v76);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v6, v46);
  sub_21E40D660(v64, *((uint64_t *)&v64 + 1), (void *)v65, *((uint64_t *)&v65 + 1), (void *)v66, *((void **)&v66 + 1), v67, *((uint64_t *)&v67 + 1), v68, *((uint64_t *)&v68 + 1), v69, SBYTE1(v69));
  sub_21E41EF70();
  sub_21E4098D8((uint64_t)&v70, v30, v31);
  long long v64 = v70;
  long long v65 = v71;
  LOBYTE(v66) = v72;
  uint64_t v32 = sub_21E3FD70C(qword_267D2BD50, &qword_267D2BD38);
  uint64_t v51 = v28;
  uint64_t v52 = v32;
  uint64_t v33 = swift_getWitnessTable();
  double v34 = v43;
  View.complicationContainerPath(_:)((uint64_t)&v64, v7, v33);
  sub_21E40D628((uint64_t)&v70);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v29, v7);
  unint64_t v35 = sub_21E401E30();
  uint64_t v49 = v33;
  unint64_t v50 = v35;
  swift_getWitnessTable();
  double v36 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  int64_t v37 = v44;
  v36(v44, v34, v9);
  unint64_t v38 = *(void (**)(char *, uint64_t))(v10 + 8);
  v38(v34, v9);
  v36(v48, v37, v9);
  return ((uint64_t (*)(char *, uint64_t))v38)(v37, v9);
}

uint64_t sub_21E40A2FC()
{
  swift_bridgeObjectRelease();
  sub_21E40977C(*(void **)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));

  swift_release();
  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_21E40A354@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_21E409D34(a1, (long long *)(v2 + 32), a2);
}

uint64_t sub_21E40A360(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 72);
  char v6 = *(unsigned char *)(a1 + 48);
  swift_bridgeObjectRetain();
  sub_21E4096B8(v2, v3, v4, v6);
  id v7 = v5;
  swift_retain();
  return a1;
}

unint64_t sub_21E40A3D8()
{
  unint64_t result = qword_267D2BD40;
  if (!qword_267D2BD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BD40);
  }
  return result;
}

unint64_t sub_21E40A42C()
{
  unint64_t result = qword_267D2BD48;
  if (!qword_267D2BD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BD48);
  }
  return result;
}

uint64_t sub_21E40A480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = *(double *)v2;
  double v3 = *(double *)(v2 + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 32);
  uint64_t v6 = *(void *)(v2 + 40);
  uint64_t v8 = *(void *)(v2 + 56);
  uint64_t v9 = *(void *)(v2 + 64);
  uint64_t v11 = *(void **)(v2 + 72);
  uint64_t v10 = *(void *)(v2 + 80);
  uint64_t v12 = *(void *)(v2 + 88);
  if (*(unsigned char *)(v2 + 48))
  {
    if (*(unsigned char *)(v2 + 48) == 1)
    {
      v109 = *(void **)(v2 + 24);
      if (*(void *)(v5 + 16))
      {
        uint64_t v13 = *(void **)(v2 + 24);
        sub_21E4096B8(v13, v7, v6, 1);
        id v14 = v11;
        swift_bridgeObjectRetain();
        sub_21E405D9C(v8, v9, v14, v5, v13, v7, v6, &v146);
        swift_bridgeObjectRelease();
        long long v136 = v146;
        long long v137 = v147;
        *(_OWORD *)v138 = v148;
        *(void *)&v138[16] = v149;
        type metadata accessor for ComplicationCornerGaugeView();
        sub_21E40A42C();
        swift_getWitnessTable();
        sub_21E412F1C((uint64_t)&v136, (uint64_t)&type metadata for ComplicationCornerStackedGaugeView);
        sub_21E40D7F8((uint64_t)&v146);
      }
      else
      {
        uint64_t v27 = *(void **)(v2 + 24);
        swift_retain();
        sub_21E4096B8(v27, v7, v6, 1);
        sub_21E3FDA68(v8, v9, v11, v27, v7, v6, v10, v12, (uint64_t)&v146, v4, v3);
        swift_bridgeObjectRelease();
        *(_OWORD *)v143 = v148;
        *(_OWORD *)&v143[16] = v149;
        *(_OWORD *)&v143[32] = v150;
        long long v141 = v146;
        long long v142 = v147;
        uint64_t v28 = type metadata accessor for ComplicationCornerGaugeView();
        swift_getWitnessTable();
        uint64_t v29 = *(void (**)(long long *, long long *, uint64_t))(*(void *)(v28 - 8) + 16);
        v29(&v136, &v141, v28);
        sub_21E40D854((uint64_t)&v146);
        long long v30 = *(_OWORD *)v138;
        long long v141 = v136;
        long long v142 = v137;
        *(_OWORD *)v143 = *(_OWORD *)v138;
        *(_OWORD *)&v143[24] = *(_OWORD *)&v138[24];
        *(void *)&v143[16] = *(void *)&v138[16];
        *(void *)&v143[40] = v139;
        v29(&v129, &v141, v28);
        long long v31 = *(_OWORD *)v131;
        long long v112 = v129;
        long long v113 = v130;
        *(_OWORD *)v114 = *(_OWORD *)v131;
        long long v115 = *(_OWORD *)&v131[24];
        *(void *)&v114[16] = *(void *)&v131[16];
        uint64_t v116 = v132;
        sub_21E40A42C();
        sub_21E413014((uint64_t)&v112, (uint64_t)&type metadata for ComplicationCornerStackedGaugeView, v28);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v88 = *(void *)&v143[40];
      uint64_t v90 = *(void *)&v143[32];
      char v91 = v144;
      uint64_t v93 = *((void *)&v142 + 1);
      v96 = (void *)v142;
      uint64_t v99 = *((void *)&v141 + 1);
      uint64_t v102 = v141;
      long long v32 = *(_OWORD *)v143;
      long long v33 = *(_OWORD *)&v143[16];
      type metadata accessor for ComplicationCornerGaugeView();
      uint64_t v34 = sub_21E41F2B0();
      unint64_t v35 = sub_21E40A42C();
      uint64_t WitnessTable = swift_getWitnessTable();
      unint64_t v134 = v35;
      uint64_t v135 = WitnessTable;
      swift_getWitnessTable();
      (*(void (**)(long long *, long long *, uint64_t))(*(void *)(v34 - 8) + 16))(&v136, &v141, v34);
      uint64_t v85 = *((void *)&v136 + 1);
      uint64_t v87 = v136;
      uint64_t v81 = *((void *)&v137 + 1);
      id v83 = (void *)v137;
      v78 = *(void **)&v138[8];
      id v79 = *(void **)v138;
      uint64_t v76 = *(void *)&v138[24];
      uint64_t v77 = *(void *)&v138[16];
      uint64_t v37 = *(void *)&v138[32];
      uint64_t v38 = v139;
      char v39 = v140;
      long long v129 = v136;
      long long v130 = v137;
      *(_OWORD *)v131 = *(_OWORD *)v138;
      *(_OWORD *)&v131[16] = *(_OWORD *)&v138[16];
      *(void *)&v131[32] = *(void *)&v138[32];
      uint64_t v132 = v139;
      char v133 = v140;
      type metadata accessor for ComplicationCornerCircularView();
      type metadata accessor for ComplicationCornerTextView();
      sub_21E41F2B0();
      uint64_t v40 = sub_21E41F2B0();
      uint64_t v41 = swift_getWitnessTable();
      unint64_t v42 = sub_21E40A3D8();
      uint64_t v43 = swift_getWitnessTable();
      unint64_t v127 = v42;
      uint64_t v128 = v43;
      uint64_t v44 = swift_getWitnessTable();
      uint64_t v125 = v41;
      uint64_t v126 = v44;
      swift_getWitnessTable();
      sub_21E413014((uint64_t)&v129, v40, v34);

      sub_21E40D740(v102, v99, v96, v93, (void *)v32, *((void **)&v32 + 1), v33, *((uint64_t *)&v33 + 1), v90, v88, v91);
      sub_21E40D740(v87, v85, v83, v81, v79, v78, v77, v76, v37, v38, v39);
    }
    else
    {
      *(void *)&long long v141 = nullsub_1(v8, v10, v12, *(void *)(a1 + 16), *(void *)(a1 + 24));
      *((void *)&v141 + 1) = v18;
      *(void *)&long long v142 = v19;
      uint64_t v20 = type metadata accessor for ComplicationCornerCircularView();
      swift_getWitnessTable();
      unint64_t v21 = *(void (**)(long long *, long long *, uint64_t))(*(void *)(v20 - 8) + 16);
      v21(&v146, &v141, v20);
      swift_retain();
      swift_release();
      long long v136 = v146;
      *(void *)&long long v137 = v147;
      v21(&v141, &v136, v20);
      long long v129 = v141;
      *(void *)&long long v130 = v142;
      type metadata accessor for ComplicationCornerTextView();
      sub_21E41F2B0();
      sub_21E40A3D8();
      swift_getWitnessTable();
      swift_getWitnessTable();
      sub_21E412F1C((uint64_t)&v129, v20);
      swift_release();
      long long v22 = v136;
      long long v23 = v137;
      uint64_t v101 = *(void *)&v138[8];
      v104 = *(void **)v138;
      uint64_t v95 = *(void *)&v138[24];
      uint64_t v98 = *(void *)&v138[16];
      char v24 = v138[32];
      char v25 = v138[33];
      long long v129 = v136;
      long long v130 = v137;
      *(_OWORD *)v131 = *(_OWORD *)v138;
      *(_OWORD *)&v131[16] = *(_OWORD *)&v138[16];
      *(_WORD *)&v131[32] = *(_WORD *)&v138[32];
      uint64_t v26 = sub_21E41F2B0();
      type metadata accessor for ComplicationCornerGaugeView();
      sub_21E41F2B0();
      swift_getWitnessTable();
      sub_21E40A42C();
      swift_getWitnessTable();
      swift_getWitnessTable();
      sub_21E412F1C((uint64_t)&v129, v26);
      sub_21E40D694(v22, *((uint64_t *)&v22 + 1), (void *)v23, *((uint64_t *)&v23 + 1), v104, v101, v98, v95, v24, v25);
      swift_release();
    }
  }
  else
  {
    if (*(void *)(v5 + 16))
    {
      long long v15 = *(void **)(v2 + 24);
      sub_21E4096B8(v15, *(void *)(v2 + 32), *(void *)(v2 + 40), 0);
      id v16 = v11;
      swift_bridgeObjectRetain();
      sub_21E40E9EC(v8, v9, v16, v5, (uint64_t)v15, &v146);
      sub_21E40977C(v15, v7, v6, 0);
      *(void *)&long long v112 = *((void *)&v147 + 1);
      uint64_t v17 = (void *)v147;
      v151[0] = v148;
      long long v136 = v146;
      long long v137 = v147;
      *(void *)v138 = v148;
      type metadata accessor for ComplicationCornerTextView();
      sub_21E40A3D8();
      swift_getWitnessTable();
      sub_21E412F1C((uint64_t)&v136, (uint64_t)&type metadata for ComplicationCornerStackedTextView);

      sub_21E40D8B0((uint64_t)&v112);
      sub_21E40D8B0((uint64_t)v151);
    }
    else
    {
      uint64_t v45 = *(void **)(v2 + 24);
      swift_retain();
      sub_21E4096B8(v45, v7, v6, 0);
      sub_21E40488C(v8, v9, v11, (uint64_t)v45, v10, v12, (uint64_t)&v146, v4, v3);
      sub_21E40977C(v45, v7, v6, 0);
      long long v141 = v146;
      long long v142 = v147;
      *(_OWORD *)v143 = v148;
      *(_OWORD *)&v143[16] = v149;
      uint64_t v46 = type metadata accessor for ComplicationCornerTextView();
      swift_getWitnessTable();
      uint64_t v47 = *(void (**)(long long *, long long *, uint64_t))(*(void *)(v46 - 8) + 16);
      v47(&v136, &v141, v46);
      sub_21E40D8DC((uint64_t)&v146);
      uint64_t v48 = *(void **)v138;
      long long v141 = v136;
      long long v142 = v137;
      *(_OWORD *)&v143[8] = *(_OWORD *)&v138[8];
      *(void *)v143 = *(void *)v138;
      *(void *)&v143[24] = *(void *)&v138[24];
      v47(&v129, &v141, v46);
      uint64_t v49 = *(void **)v131;
      long long v112 = v129;
      long long v113 = v130;
      *(_OWORD *)&v114[8] = *(_OWORD *)&v131[8];
      *(void *)v114 = *(void *)v131;
      *(void *)&long long v115 = *(void *)&v131[24];
      sub_21E40A3D8();
      sub_21E413014((uint64_t)&v112, (uint64_t)&type metadata for ComplicationCornerStackedTextView, v46);
      swift_release();
      swift_bridgeObjectRelease();

      swift_release();
      swift_bridgeObjectRelease();
    }
    char v92 = v143[32];
    uint64_t v94 = *((void *)&v142 + 1);
    v97 = (void *)v142;
    uint64_t v100 = *((void *)&v141 + 1);
    uint64_t v103 = v141;
    long long v50 = *(_OWORD *)v143;
    long long v51 = *(_OWORD *)&v143[16];
    long long v136 = v141;
    long long v137 = v142;
    *(_OWORD *)v138 = *(_OWORD *)v143;
    *(_OWORD *)&v138[16] = *(_OWORD *)&v143[16];
    v138[32] = v143[32];
    type metadata accessor for ComplicationCornerTextView();
    uint64_t v52 = sub_21E41F2B0();
    sub_21E40A3D8();
    swift_getWitnessTable();
    swift_getWitnessTable();
    (*(void (**)(long long *, long long *, uint64_t))(*(void *)(v52 - 8) + 16))(&v141, &v136, v52);
    long long v53 = v141;
    long long v54 = v142;
    long long v55 = *(_OWORD *)v143;
    long long v56 = *(_OWORD *)&v143[16];
    char v57 = v143[32];
    long long v129 = v141;
    long long v130 = v142;
    *(_OWORD *)v131 = *(_OWORD *)v143;
    *(_OWORD *)&v131[16] = *(_OWORD *)&v143[16];
    v131[32] = v143[32];
    uint64_t v58 = type metadata accessor for ComplicationCornerCircularView();
    swift_getWitnessTable();
    sub_21E413014((uint64_t)&v129, v58, v52);
    sub_21E40D6B4(v53, *((uint64_t *)&v53 + 1), (void *)v54, *((uint64_t *)&v54 + 1), (void *)v55, *((uint64_t *)&v55 + 1), v56, *((uint64_t *)&v56 + 1), v57);
    uint64_t v59 = *((void *)&v136 + 1);
    long long v60 = v137;
    uint64_t v89 = v136;
    uint64_t v84 = *(void *)&v138[8];
    v86 = *(void **)v138;
    uint64_t v80 = *(void *)&v138[24];
    uint64_t v82 = *(void *)&v138[16];
    char v61 = v138[32];
    char v62 = v138[33];
    long long v129 = v136;
    long long v130 = v137;
    *(_OWORD *)v131 = *(_OWORD *)v138;
    *(_OWORD *)&v131[16] = *(_OWORD *)&v138[16];
    *(_WORD *)&v131[32] = *(_WORD *)&v138[32];
    uint64_t v63 = sub_21E41F2B0();
    type metadata accessor for ComplicationCornerGaugeView();
    sub_21E41F2B0();
    swift_getWitnessTable();
    sub_21E40A42C();
    swift_getWitnessTable();
    swift_getWitnessTable();
    sub_21E412F1C((uint64_t)&v129, v63);
    sub_21E40D6B4(v103, v100, v97, v94, (void *)v50, *((uint64_t *)&v50 + 1), v51, *((uint64_t *)&v51 + 1), v92);
    sub_21E40D694(v89, v59, (void *)v60, *((uint64_t *)&v60 + 1), v86, v84, v82, v80, v61, v62);
  }
  char v64 = v144;
  char v65 = v145;
  long long v105 = v141;
  long long v106 = v142;
  long long v107 = *(_OWORD *)v143;
  long long v108 = *(_OWORD *)&v143[16];
  long long v110 = *(_OWORD *)&v143[32];
  type metadata accessor for ComplicationCornerCircularView();
  type metadata accessor for ComplicationCornerTextView();
  sub_21E41F2B0();
  sub_21E41F2B0();
  type metadata accessor for ComplicationCornerGaugeView();
  sub_21E41F2B0();
  uint64_t v66 = sub_21E41F2B0();
  uint64_t v67 = swift_getWitnessTable();
  unint64_t v68 = sub_21E40A3D8();
  uint64_t v69 = swift_getWitnessTable();
  unint64_t v123 = v68;
  uint64_t v124 = v69;
  uint64_t v70 = swift_getWitnessTable();
  uint64_t v121 = v67;
  uint64_t v122 = v70;
  uint64_t v71 = swift_getWitnessTable();
  unint64_t v72 = sub_21E40A42C();
  uint64_t v73 = swift_getWitnessTable();
  unint64_t v119 = v72;
  uint64_t v120 = v73;
  uint64_t v74 = swift_getWitnessTable();
  uint64_t v117 = v71;
  uint64_t v118 = v74;
  swift_getWitnessTable();
  (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v66 - 8) + 16))(a2, &v141, v66);
  return sub_21E40D660(v105, *((uint64_t *)&v105 + 1), (void *)v106, *((uint64_t *)&v106 + 1), (void *)v107, *((void **)&v107 + 1), v108, *((uint64_t *)&v108 + 1), v110, *((uint64_t *)&v110 + 1), v64, v65);
}

id sub_21E40B590(uint64_t a1)
{
  unint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v2; ++i)
    {
      id v6 = *(id *)(a1 + 8 * i + 32);
      id v7 = objc_msgSend(v6, sel_textProvider);
      if (v7)
      {
        uint64_t v8 = v7;
        self;
        uint64_t v9 = swift_dynamicCastObjCClass();
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          id v11 = v8;
          id v12 = objc_msgSend(v10, sel_textProviders);
          sub_21E40D29C();
          unint64_t v5 = sub_21E41F800();
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BDE0);
          uint64_t v13 = swift_allocObject();
          *(_OWORD *)(v13 + 16) = xmmword_21E423700;
          *(void *)(v13 + 32) = v8;
          unint64_t v18 = v13;
          sub_21E41F810();
          unint64_t v5 = v18;
        }
      }
      else
      {

        unint64_t v5 = MEMORY[0x263F8EE78];
      }
      sub_21E40D0D0(v5);
    }
    swift_bridgeObjectRelease();
    unint64_t v1 = v19;
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_21E41F930();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_12;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_14;
  }
LABEL_12:
  sub_21E40D29C();
  id v14 = (void *)sub_21E41F7F0();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(self, sel_providerWithProviders_, v14);

  return v15;
}

id ComplicationCornerViewConfiguration.outerLabel.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  id v1 = sub_21E40B590(v0);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_21E40B7E4(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  double v4 = *(void **)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 72);
  char v8 = *(unsigned char *)(a1 + 48);
  swift_bridgeObjectRetain_n();
  sub_21E4096B8(v4, v5, v6, v8);
  id v9 = v7;
  id v10 = sub_21E40B590(v3);
  swift_bridgeObjectRelease_n();
  sub_21E40977C(v4, v5, v6, v8);

  *a2 = v10;
}

uint64_t ComplicationCornerViewConfiguration.outerLabel.setter(void *a1)
{
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_21E422BD0;
    *(void *)(v3 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a1, 0);

    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v1 + 16) = v3;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  }
  return result;
}

void (*ComplicationCornerViewConfiguration.outerLabel.modify(void *a1))(id *a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  id v4 = sub_21E40B590(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_21E40B990;
}

void sub_21E40B990(id *a1, char a2)
{
  id v3 = *a1;
  if (a2)
  {
    id v9 = *a1;
    if (v3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_21E422BD0;
      id v5 = objc_allocWithZone((Class)CDLabelProvider);
      id v9 = v9;
      *(void *)(v4 + 32) = objc_msgSend(v5, sel_initWithTextProvider_imageProvider_, v9, 0);
    }
    else
    {
      uint64_t v4 = MEMORY[0x263F8EE78];
    }
    id v7 = a1[1];
    swift_bridgeObjectRelease();
    v7[2] = v4;
  }
  else
  {
    if (v3)
    {
      id v10 = *a1;
      __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_21E422BD0;
      *(void *)(v6 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v10, 0);
    }
    else
    {
      uint64_t v6 = MEMORY[0x263F8EE78];
    }
    char v8 = a1[1];
    swift_bridgeObjectRelease();
    _OWORD v8[2] = v6;
  }
}

void ComplicationCornerViewConfiguration.label.getter(uint64_t a1@<X8>)
{
  uint64_t v4 = *(void **)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  int v6 = *(unsigned __int8 *)(v1 + 48);
  if (*(unsigned char *)(v1 + 48))
  {
    if (v6 == 1)
    {
      sub_21E4096B8(*(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), 1);
      id v7 = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v8 = sub_21E40B590(v3);
      swift_bridgeObjectRelease();
      id v9 = sub_21E40B590(v5);
      sub_21E40977C(v4, v3, v5, 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = 0;
      id v8 = 0;
      id v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = swift_bridgeObjectRetain();
    id v11 = sub_21E40B590(v10);
    sub_21E40977C(v4, v3, v5, 0);
    id v8 = 0;
    id v9 = 0;
    LOBYTE(v6) = 2 * (v11 == 0);
    uint64_t v4 = v11;
  }
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 24) = v6;
}

double sub_21E40BC04@<D0>(uint64_t a1@<X8>)
{
  ComplicationCornerViewConfiguration.label.getter((uint64_t)&v5);
  uint64_t v2 = v6;
  char v3 = v7;
  double result = *(double *)&v5;
  *(_OWORD *)a1 = v5;
  *(void *)(a1 + 16) = v2;
  *(unsigned char *)(a1 + 24) = v3;
  return result;
}

void *sub_21E40BC88(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  uint64_t v2 = *(void **)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  v5[0] = *(id *)a1;
  v5[1] = v1;
  _OWORD v5[2] = v2;
  char v6 = v3;
  sub_21E40C238(v5[0], v1, v2, v3);
  return ComplicationCornerViewConfiguration.label.setter((uint64_t)v5);
}

void *ComplicationCornerViewConfiguration.label.setter(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  char v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a1 + 24);
  if (*(unsigned char *)(a1 + 24))
  {
    if (v5 == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_21E422BD0;
      id v7 = objc_allocWithZone((Class)CDLabelProvider);
      id v8 = v4;
      id v9 = v2;
      id v14 = v3;
      id v10 = v3;
      *(void *)(v6 + 32) = objc_msgSend(v7, sel_initWithTextProvider_imageProvider_, v10, 0);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_21E422BD0;
      *(void *)(v11 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v8, 0);

      sub_21E40C0A4(v2, v14, v4, 1);
    }
    else
    {
      uint64_t v2 = 0;
      uint64_t v6 = 0;
      uint64_t v11 = 0;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_21E422BD0;
    *(void *)(v12 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v2, 0);
    sub_21E40C0A4(v2, v3, v4, 0);
    sub_21E40C0A4(v2, v3, v4, 0);
    uint64_t v6 = 0;
    uint64_t v11 = 0;
    uint64_t v2 = (void *)v12;
  }
  double result = sub_21E40977C(*(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48));
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v6;
  *(void *)(v1 + 40) = v11;
  *(unsigned char *)(v1 + 48) = v5;
  return result;
}

void sub_21E40BEC4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *(void **)a1;
  uint64_t v4 = *(void **)(a1 + 8);
  int v5 = *(void **)(a1 + 16);
  int v6 = *(unsigned __int8 *)(a1 + 24);
  if (*(unsigned char *)(a1 + 24))
  {
    if (v6 == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_21E422BD0;
      id v8 = objc_allocWithZone((Class)CDLabelProvider);
      id v9 = v5;
      id v10 = v3;
      id v14 = v4;
      id v11 = v4;
      *(void *)(v7 + 32) = objc_msgSend(v8, sel_initWithTextProvider_imageProvider_, v11, 0);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_21E422BD0;
      *(void *)(v12 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v9, 0);

      sub_21E40C0A4(v3, v14, v5, 1);
    }
    else
    {
      char v3 = 0;
      uint64_t v7 = 0;
      uint64_t v12 = 0;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_21E422BD0;
    *(void *)(v13 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v3, 0);
    sub_21E40C0A4(v3, v4, v5, 0);
    sub_21E40C0A4(v3, v4, v5, 0);
    uint64_t v7 = 0;
    uint64_t v12 = 0;
    char v3 = (void *)v13;
  }
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v12;
  *(unsigned char *)(a2 + 24) = v6;
}

void sub_21E40C0A4(void *a1, void *a2, void *a3, char a4)
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }

    a1 = a3;
  }
}

void (*ComplicationCornerViewConfiguration.label.modify(void *a1))(void ***a1, char a2)
{
  char v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  ComplicationCornerViewConfiguration.label.getter((uint64_t)v3);
  return sub_21E40C1A4;
}

void sub_21E40C1A4(void ***a1, char a2)
{
  char v3 = *a1;
  uint64_t v4 = **a1;
  int v5 = v3[1];
  int v6 = v3[2];
  char v7 = *((unsigned char *)v3 + 24);
  v8[0] = v4;
  v8[1] = v5;
  _OWORD v8[2] = v6;
  char v9 = v7;
  if (a2)
  {
    sub_21E40C238(v4, v5, v6, v7);
    ComplicationCornerViewConfiguration.label.setter((uint64_t)v8);
    sub_21E40C0A4(*v3, v3[1], v3[2], *((unsigned char *)v3 + 24));
  }
  else
  {
    ComplicationCornerViewConfiguration.label.setter((uint64_t)v8);
  }
  free(v3);
}

id sub_21E40C238(id result, id a2, void *a3, char a4)
{
  id v4 = result;
  if (a4)
  {
    if (a4 != 1) {
      return result;
    }
    id v5 = a3;
    id v6 = v4;
    double result = a2;
  }
  return result;
}

__n128 ComplicationCornerViewConfiguration.init(contentSize:label:position:fontStyle:monochromeModel:)@<Q0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v13 = *((void *)a1 + 2);
  char v14 = *((unsigned char *)a1 + 24);
  long long v20 = *a1;
  uint64_t v21 = v13;
  char v22 = v14;
  sub_21E40BEC4((uint64_t)&v20, (uint64_t)&v23);
  __n128 v19 = v23;
  uint64_t v15 = v24;
  char v16 = v25;
  id v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MonochromeModel()), sel_init);

  *(double *)a5 = a6;
  *(double *)(a5 + 8) = a7;
  *(void *)(a5 + 16) = MEMORY[0x263F8EE78];
  __n128 result = v19;
  *(__n128 *)(a5 + 24) = v19;
  *(void *)(a5 + 40) = v15;
  *(unsigned char *)(a5 + 48) = v16;
  *(void *)(a5 + 56) = a2;
  *(void *)(a5 + 64) = a3;
  *(void *)(a5 + 72) = v17;
  return result;
}

__n128 ComplicationCornerViewConfiguration.init(contentSize:outerLabel:label:position:fontStyle:monochromeModel:)@<Q0>(void *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  long long v15 = *a2;
  uint64_t v16 = *((void *)a2 + 2);
  char v17 = *((unsigned char *)a2 + 24);
  if (a1)
  {
    long long v24 = *a2;
    __swift_instantiateConcreteTypeFromMangledName(qword_267D2B990);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_21E422BD0;
    id v19 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a1, 0);
    long long v15 = v24;
    *(void *)(v18 + 32) = v19;
  }
  else
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  long long v26 = v15;
  uint64_t v27 = v16;
  char v28 = v17;
  sub_21E40BEC4((uint64_t)&v26, (uint64_t)&v29);
  __n128 v25 = v29;
  uint64_t v20 = v30;
  char v21 = v31;
  id v22 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MonochromeModel()), sel_init);

  *(double *)a6 = a7;
  *(double *)(a6 + 8) = a8;
  *(void *)(a6 + 16) = v18;
  __n128 result = v25;
  *(__n128 *)(a6 + 24) = v25;
  *(void *)(a6 + 40) = v20;
  *(unsigned char *)(a6 + 48) = v21;
  *(void *)(a6 + 56) = a3;
  *(void *)(a6 + 64) = a4;
  *(void *)(a6 + 72) = v22;
  return result;
}

uint64_t sub_21E40C4C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E40C50C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  return ComplicationCornerViewConfiguration.outerLabel.setter(v1);
}

void destroy for ComplicationCornerViewConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_21E40977C(*(void **)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  id v2 = *(void **)(a1 + 72);
}

uint64_t initializeWithCopy for ComplicationCornerViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  id v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_21E4096B8(v4, v5, v6, v7);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  id v8 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for ComplicationCornerViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  sub_21E4096B8(v4, v5, v6, v7);
  id v8 = *(void **)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v7;
  sub_21E40977C(v8, v9, v10, v11);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v12 = *(void **)(a2 + 72);
  uint64_t v13 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v12;
  id v14 = v12;

  return a1;
}

uint64_t assignWithTake for ComplicationCornerViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void **)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  char v9 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v5;
  sub_21E40977C(v6, v7, v8, v9);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v10 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerViewConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerViewConfiguration()
{
  return &type metadata for ComplicationCornerViewConfiguration;
}

void *destroy for ComplicationCornerViewConfiguration.InnerContent(uint64_t a1)
{
  return sub_21E40977C(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for ComplicationCornerViewConfiguration.InnerContent(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_21E40CC2C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_21E4096B8);
}

uint64_t *assignWithCopy for ComplicationCornerViewConfiguration.InnerContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_21E40CCC0(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_21E4096B8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21E40977C);
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for ComplicationCornerViewConfiguration.InnerContent(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_21E40CD58(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21E40977C);
}

uint64_t sub_21E40C890(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_21E40C8A8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerViewConfiguration.InnerContent()
{
  return &type metadata for ComplicationCornerViewConfiguration.InnerContent;
}

uint64_t sub_21E40C8D4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_21E40977C(*(void **)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));

  return swift_release();
}

uint64_t sub_21E40C928(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_21E4096B8(v4, v5, v6, v7);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 88);
  long long v9 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v9;
  *(void *)(a1 + 88) = v8;
  id v10 = (id)v9;
  swift_retain();
  return a1;
}

uint64_t sub_21E40C9C4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  sub_21E4096B8(v4, v5, v6, v7);
  uint64_t v8 = *(void **)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v7;
  sub_21E40977C(v8, v9, v10, v11);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v12 = *(void **)(a2 + 72);
  uint64_t v13 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v12;
  id v14 = v12;

  uint64_t v15 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v15;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t sub_21E40CAB8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void **)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  char v9 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v5;
  sub_21E40977C(v6, v7, v8, v9);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  uint64_t v10 = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = v10;
  swift_release();
  return a1;
}

uint64_t sub_21E40CB48(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E40CB90(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for CornerComplicationView()
{
  return __swift_instantiateGenericMetadata();
}

void destroy for ComplicationCornerViewConfiguration.Label(uint64_t a1)
{
}

uint64_t initializeWithCopy for ComplicationCornerViewConfiguration.Label(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_21E40CC2C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_21E40C238);
}

uint64_t sub_21E40CC2C(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v6, v7, v8);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  return a1;
}

uint64_t *assignWithCopy for ComplicationCornerViewConfiguration.Label(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_21E40CCC0(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_21E40C238, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21E40C0A4);
}

uint64_t *sub_21E40CCC0(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v8, v9, v10);
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = a1[2];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  uint64_t v14 = *((unsigned __int8 *)a1 + 24);
  *((unsigned char *)a1 + 24) = v10;
  a5(v11, v12, v13, v14);
  return a1;
}

uint64_t *assignWithTake for ComplicationCornerViewConfiguration.Label(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_21E40CD58(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21E40C0A4);
}

uint64_t *sub_21E40CD58(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v9 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v6;
  uint64_t v11 = *((unsigned __int8 *)a1 + 24);
  *((unsigned char *)a1 + 24) = v7;
  a4(v8, v10, v9, v11);
  return a1;
}

uint64_t _s19ComplicationDisplay35ComplicationCornerViewConfigurationV12InnerContentOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s19ComplicationDisplay35ComplicationCornerViewConfigurationV12InnerContentOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerViewConfiguration.Label()
{
  return &type metadata for ComplicationCornerViewConfiguration.Label;
}

uint64_t sub_21E40CE50()
{
  return swift_getWitnessTable();
}

uint64_t sub_21E40D0D0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E41F930();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21E41F930();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x223C26390](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *id v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_21E40D414(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_21E41F930();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_21E41F810();
}

unint64_t sub_21E40D29C()
{
  unint64_t result = qword_267D2BDD8;
  if (!qword_267D2BDD8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D2BDD8);
  }
  return result;
}

void (*sub_21E40D2DC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_21E40D38C(v6, a2, a3);
  return sub_21E40D344;
}

void sub_21E40D344(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21E40D38C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x223C26380](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_21E40D40C;
  }
  __break(1u);
  return result;
}

void sub_21E40D40C(id *a1)
{
}

uint64_t sub_21E40D414(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21E41F930();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_21E41F930();
      unint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21E3FD70C(&qword_267D2BDF0, &qword_267D2BDE8);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BDE8);
            uint64_t v10 = sub_21E40D2DC(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_21E40D29C();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_21E40D5D4()
{
  unint64_t result = qword_267D2BDF8;
  if (!qword_267D2BDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BDF8);
  }
  return result;
}

uint64_t sub_21E40D628(uint64_t a1)
{
  return a1;
}

uint64_t sub_21E40D660(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if (a12) {
    return sub_21E40D740(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 & 1);
  }
  else {
    return sub_21E40D694(a1, a2, a3, a4, a5, (uint64_t)a6, a7, a8, a9, (unsigned __int16)(a9 & 0x1FF) >> 8);
  }
}

uint64_t sub_21E40D694(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10)
{
  if (a10) {
    return sub_21E40D6B4(a1, a2, a3, a4, a5, a6, a7, a8, a9 & 1);
  }
  else {
    return swift_release();
  }
}

uint64_t sub_21E40D6B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a9)
  {

    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21E40D740(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21E40D7F8(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21E40D854(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t sub_21E40D8B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_21E40D8DC(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  swift_release();
  swift_bridgeObjectRelease();

  return a1;
}

id ComplicationLabelProvider.textProvider.getter()
{
  id v1 = objc_msgSend(*v0, sel_textProvider);
  return v1;
}

ComplicationDisplay::ComplicationLabelProvider __swiftcall ComplicationLabelProvider.init(textProvider:imageProvider:)(CLKTextProvider_optional textProvider, CLKImageProvider_optional *imageProvider)
{
  uint64_t v3 = *(void **)&textProvider.is_nil;
  Class isa = textProvider.value.super.isa;
  uint64_t v5 = v2;
  id v6 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, textProvider.value.super.isa, *(void *)&textProvider.is_nil);

  void *v5 = v6;
  result._labelProvider._imageProvider = v9;
  result._labelProvider._textProvider = v8;
  result._labelProvider.super.Class isa = v7;
  return result;
}

id Sequence<>.fallbackTextProvider.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BDE8);
  sub_21E40DE4C();
  unint64_t v0 = sub_21E41F7E0();
  if (v0 >> 62)
  {
    if (sub_21E41F930()) {
      goto LABEL_3;
    }
LABEL_5:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_21E40D29C();
  id v1 = (void *)sub_21E41F7F0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(self, sel_providerWithProviders_, v1);

  return v2;
}

id ComplicationLabelProvider.imageProvider.getter()
{
  id v1 = objc_msgSend(*v0, sel_imageProvider);
  return v1;
}

uint64_t ComplicationLabelProvider.snapshotMetadata.getter()
{
  v19[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = *v0;
  id v2 = objc_msgSend(*v0, sel_imageProvider);
  if (v2)
  {
    uint64_t v3 = v2;
    type metadata accessor for WidgetNamedImageProvider(0);
    if (swift_dynamicCastClass())
    {
      uint64_t v4 = sub_21E4197F8();
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        id v6 = objc_msgSend(self, sel_imageProviderWithOnePieceImage_, v4);
      }
      else
      {
        id v6 = 0;
      }
      id v12 = objc_msgSend(v1, sel_textProvider);
      id v13 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v12, v6);

      v19[0] = 0;
      id v14 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v13, 1, v19);
      id v15 = v19[0];
      if (v14)
      {
        uint64_t v9 = sub_21E41EE10();

        return v9;
      }
      uint64_t v16 = v15;
      char v17 = (void *)sub_21E41EDD0();

      swift_willThrow();
      return 0;
    }
  }
  v19[0] = 0;
  id v7 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v19);
  id v8 = v19[0];
  if (!v7)
  {
    uint64_t v10 = v8;
    uint64_t v11 = (void *)sub_21E41EDD0();

    swift_willThrow();
    return 0;
  }
  uint64_t v9 = sub_21E41EE10();

  return v9;
}

void sub_21E40DD40(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_textProvider);
  if (v3)
  {
    uint64_t v4 = v3;
    self;
    uint64_t v5 = swift_dynamicCastObjCClass();
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = v4;
      id v8 = objc_msgSend(v6, sel_textProviders);
      sub_21E40D29C();
      uint64_t v9 = sub_21E41F800();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BDE0);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_21E423700;
      *(void *)(v10 + 32) = v4;
      uint64_t v11 = v10;
      sub_21E41F810();
      uint64_t v9 = v11;
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  *a2 = v9;
}

unint64_t sub_21E40DE4C()
{
  unint64_t result = qword_267D2BE00;
  if (!qword_267D2BE00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BDE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BE00);
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationLabelProvider()
{
  return &type metadata for ComplicationLabelProvider;
}

uint64_t sub_21E40DEB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  sub_21E41F8F0();
  if (v2)
  {
    id v3 = (void **)(a1 + 32);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v4 = *v3++;
      id v5 = v4;
      sub_21E41F8D0();
      sub_21E41F900();
      sub_21E41F910();
      sub_21E41F8E0();
      --v2;
    }
    while (v2);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v7;
}

void sub_21E40DF88(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B810);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  id v6 = (uint64_t *)((char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = sub_21E41F040();
  uint64_t v7 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v11 = (void *)v1[2];
  uint64_t v24 = v1[1];
  uint64_t v25 = v10;
  uint64_t v12 = v1[3];
  uint64_t v13 = v1[4];
  type metadata accessor for MonochromeModel();
  sub_21E4045E8();
  id v14 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_21E41F030();
  uint64_t v16 = v15;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = v23;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F18DC8], v23);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v6 + *(int *)(v4 + 36), v9, v18);
  *id v6 = KeyPath;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BE08);
  sub_21E405AE4((uint64_t)v6, (uint64_t)a1 + *(int *)(v19 + 36));
  uint64_t v20 = v24;
  *a1 = v25;
  a1[1] = v20;
  a1[2] = v22;
  a1[3] = v16;
  a1[4] = v12;
  a1[5] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v21 = v16;
  sub_21E405B4C((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_21E40E1D0(void *a1)
{
  long long v11 = *(_OWORD *)(v1 + 16);
  objc_msgSend(a1, sel_setFilterProvider_, *((void *)&v11 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(void *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(void *)(v1 + 8));
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_21E40DEB8(v3);
  swift_bridgeObjectRelease();
  sub_21E404F98(0, &qword_267D2BBA0);
  uint64_t v4 = (void *)sub_21E41F7F0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setOuterLabelProviders_, v4);

  uint64_t v5 = swift_bridgeObjectRetain();
  sub_21E40DEB8(v5);
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_21E41F7F0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInnerLabelProviders_, v6);

  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  id v7 = *((id *)&v11 + 1);
  sub_21E41EED0();
  swift_release();
  swift_release();
  sub_21E3FE608((uint64_t)&v11);
  if (v10 >= 1.0) {
    return objc_msgSend(a1, sel_updateMonochromeColor, v10);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v8 = v7;
  sub_21E41EED0();
  swift_release();
  swift_release();
  sub_21E3FE608((uint64_t)&v11);
  return objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v10);
}

uint64_t sub_21E40E408()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_21E40E834;
  *(void *)(v3 + 24) = v2;
  void v8[4] = sub_21E3FD880;
  v8[5] = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_21E41611C;
  void v8[3] = &block_descriptor_2;
  uint64_t v4 = _Block_copy(v8);
  id v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

id sub_21E40E5F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView()
{
  return self;
}

uint64_t destroy for ComplicationCornerStackedTextView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedTextView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  id v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComplicationCornerStackedTextView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComplicationCornerStackedTextView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedTextView()
{
  return &type metadata for ComplicationCornerStackedTextView;
}

uint64_t sub_21E40E7D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E40E7FC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21E40E834()
{
  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_21E40E874()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

id sub_21E40E89C()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4], v0[5]);
  sub_21E40E1D0(v1);
  return v1;
}

uint64_t sub_21E40E8FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E40F240();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_21E40E960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21E40F240();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_21E40E9C4()
{
}

void sub_21E40E9EC(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v9 = self;
  id v46 = a3;
  id v10 = objc_msgSend(v9, sel_sharedRenderingContext);
  id v11 = objc_msgSend(v10, sel_device);

  double v12 = CDRichComplicationCornerTextOuterImageMaxSize(v11);
  uint64_t v14 = MEMORY[0x263F8EE78];
  int64_t v15 = *(void *)(a4 + 16);
  long long v50 = v11;
  if (v15)
  {
    double v16 = v12;
    double v17 = v13;
    uint64_t v52 = MEMORY[0x263F8EE78];
    sub_21E40095C(0, v15, 0);
    for (uint64_t i = 0; i != v15; ++i)
    {
      id v19 = *(id *)(a4 + 8 * i + 32);
      id v20 = objc_msgSend(v19, sel_textProvider);
      objc_msgSend(v20, sel_finalize);
      id v21 = objc_msgSend(v19, sel_imageProvider);
      uint64_t v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, sel_copy);

        sub_21E41F890();
        swift_unknownObjectRelease();
        sub_21E404F98(0, (unint64_t *)&qword_267D2B850);
        if (swift_dynamicCast())
        {
          uint64_t v22 = v51;
          type metadata accessor for WidgetNamedImageProvider(0);
          uint64_t v23 = swift_dynamicCastClass();
          if (v23)
          {
            uint64_t v24 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(unsigned char *)(v23 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              uint64_t v25 = (double *)(v23 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              *uint64_t v25 = v16;
              v25[1] = v17;
              *(unsigned char *)(v23 + v24) = 1;
            }
          }
          else
          {
            objc_msgSend(v51, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v16, v17, v16, v17);
          }
        }
        else
        {
          uint64_t v22 = 0;
        }
      }
      id v26 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v20, v22);

      uint64_t v27 = v52;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v52 + 16) + 1, 1);
        uint64_t v27 = v52;
      }
      unint64_t v29 = *(void *)(v27 + 16);
      unint64_t v28 = *(void *)(v27 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_21E40095C((char *)(v28 > 1), v29 + 1, 1);
        uint64_t v27 = v52;
      }
      *(void *)(v27 + 16) = v29 + 1;
      *(void *)(v27 + 8 * v29 + 32) = v26;
    }
    swift_bridgeObjectRelease();
    id v11 = v50;
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = MEMORY[0x263F8EE78];
  }
  double v30 = CDRichComplicationCornerInnerImageMaxSize(v11);
  int64_t v32 = *(void *)(a5 + 16);
  if (v32)
  {
    double v33 = v30;
    double v34 = v31;
    uint64_t v53 = v14;
    sub_21E40095C(0, v32, 0);
    unint64_t v35 = (id *)(a5 + 32);
    do
    {
      id v36 = *v35;
      id v37 = objc_msgSend(v36, sel_textProvider);
      objc_msgSend(v37, sel_finalize);
      id v38 = objc_msgSend(v36, sel_imageProvider);
      char v39 = v38;
      if (v38)
      {
        objc_msgSend(v38, sel_copy);

        sub_21E41F890();
        swift_unknownObjectRelease();
        sub_21E404F98(0, (unint64_t *)&qword_267D2B850);
        if (swift_dynamicCast())
        {
          char v39 = v51;
          type metadata accessor for WidgetNamedImageProvider(0);
          uint64_t v40 = swift_dynamicCastClass();
          if (v40)
          {
            uint64_t v41 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(unsigned char *)(v40 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              unint64_t v42 = (double *)(v40 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              double *v42 = v33;
              v42[1] = v34;
              *(unsigned char *)(v40 + v41) = 1;
            }
          }
          else
          {
            objc_msgSend(v51, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v33, v34, v33, v34);
          }
        }
        else
        {
          char v39 = 0;
        }
      }
      id v43 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v37, v39);

      uint64_t v14 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E40095C(0, *(void *)(v53 + 16) + 1, 1);
        uint64_t v14 = v53;
      }
      unint64_t v45 = *(void *)(v14 + 16);
      unint64_t v44 = *(void *)(v14 + 24);
      if (v45 >= v44 >> 1)
      {
        sub_21E40095C((char *)(v44 > 1), v45 + 1, 1);
        uint64_t v14 = v53;
      }
      *(void *)(v14 + 16) = v45 + 1;
      *(void *)(v14 + 8 * v45 + 32) = v43;
      ++v35;
      --v32;
    }
    while (v32);
  }
  else
  {
  }
  *a6 = a1;
  a6[1] = a2;
  a6[2] = v46;
  a6[3] = v27;
  a6[4] = v14;
}

uint64_t destroy for ComplicationCornerStackedTextViewRepresentable(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComplicationCornerStackedTextViewRepresentable(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ComplicationCornerStackedTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerStackedTextViewRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerStackedTextViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedTextViewRepresentable()
{
  return &type metadata for ComplicationCornerStackedTextViewRepresentable;
}

unint64_t sub_21E40F164()
{
  unint64_t result = qword_267D2BE10;
  if (!qword_267D2BE10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BE08);
    sub_21E40F1E0();
    sub_21E406874();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BE10);
  }
  return result;
}

unint64_t sub_21E40F1E0()
{
  unint64_t result = qword_267D2BE18;
  if (!qword_267D2BE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BE18);
  }
  return result;
}

unint64_t sub_21E40F240()
{
  unint64_t result = qword_267D2BE20;
  if (!qword_267D2BE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BE20);
  }
  return result;
}

float ComplicationCurvedTextConfiguration.fontSize.getter()
{
  return *(float *)v0;
}

void ComplicationCurvedTextConfiguration.fontSize.setter(float a1)
{
  *id v1 = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.fontSize.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedTextConfiguration.color.getter()
{
  return swift_retain();
}

uint64_t ComplicationCurvedTextConfiguration.color.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.color.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedTextConfiguration.interior.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ComplicationCurvedTextConfiguration.interior.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.interior.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.tracking.getter()
{
  return *(float *)(v0 + 20);
}

void ComplicationCurvedTextConfiguration.tracking.setter(float a1)
{
  *(float *)(v1 + 20) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.tracking.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextConfiguration.circleCenter.getter()
{
  return *(double *)(v0 + 24);
}

void ComplicationCurvedTextConfiguration.circleCenter.setter(double a1, double a2)
{
  *(double *)(v2 + 24) = a1;
  *(double *)(v2 + 32) = a2;
}

uint64_t (*ComplicationCurvedTextConfiguration.circleCenter.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.circleRadius.getter()
{
  return *(float *)(v0 + 40);
}

void ComplicationCurvedTextConfiguration.circleRadius.setter(float a1)
{
  *(float *)(v1 + 40) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.circleRadius.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.maximumAngularWidth.getter()
{
  return *(float *)(v0 + 44);
}

void ComplicationCurvedTextConfiguration.maximumAngularWidth.setter(float a1)
{
  *(float *)(v1 + 44) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.maximumAngularWidth.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.centerAngle.getter()
{
  return *(float *)(v0 + 48);
}

void ComplicationCurvedTextConfiguration.centerAngle.setter(float a1)
{
  *(float *)(v1 + 48) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.centerAngle.modify())()
{
  return nullsub_1;
}

void ComplicationCurvedTextConfiguration.textAlignment.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 52);
}

unsigned char *ComplicationCurvedTextConfiguration.textAlignment.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 52) = *result;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.textAlignment.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.baselineOffset.getter()
{
  return *(float *)(v0 + 56);
}

void ComplicationCurvedTextConfiguration.baselineOffset.setter(float a1)
{
  *(float *)(v1 + 56) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.baselineOffset.modify())()
{
  return nullsub_1;
}

void *ComplicationCurvedTextConfiguration.path.getter()
{
  uint64_t v1 = *(void **)(v0 + 64);
  id v2 = v1;
  return v1;
}

void ComplicationCurvedTextConfiguration.path.setter(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.path.modify())()
{
  return nullsub_1;
}

void ComplicationCurvedTextConfiguration.accessoryContentPlacement.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 72);
}

unsigned char *ComplicationCurvedTextConfiguration.accessoryContentPlacement.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 72) = *result;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.accessoryContentPlacement.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.accessoryContentPadding.getter()
{
  return *(float *)(v0 + 76);
}

void ComplicationCurvedTextConfiguration.accessoryContentPadding.setter(float a1)
{
  *(float *)(v1 + 76) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.accessoryContentPadding.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextConfiguration.accessoryContentMaxSize.getter()
{
  return *(double *)(v0 + 80);
}

void ComplicationCurvedTextConfiguration.accessoryContentMaxSize.setter(double a1, double a2)
{
  *(double *)(v2 + 80) = a1;
  *(double *)(v2 + 88) = a2;
}

uint64_t (*ComplicationCurvedTextConfiguration.accessoryContentMaxSize.modify())()
{
  return nullsub_1;
}

BOOL static ComplicationCurvedTextConfiguration.CurvedTextAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComplicationCurvedTextConfiguration.CurvedTextAlignment.hash(into:)()
{
  return sub_21E41F980();
}

uint64_t _s19ComplicationDisplay0A23CurvedTextConfigurationV16ContentPlacementO9hashValueSivg_0()
{
  return sub_21E41F990();
}

BOOL sub_21E40F644(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21E40F658()
{
  return sub_21E41F980();
}

uint64_t sub_21E40F684()
{
  return sub_21E41F990();
}

uint64_t ComplicationCurvedTextConfiguration.init(fontSize:color:interior:tracking:circleCenter:circleRadius:maximumAngularWidth:centerAngle:accessoryContentPlacement:accessoryContentPadding:accessoryContentMaxSize:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char *a3@<X2>, uint64_t a4@<X8>, float a5@<S0>, float a6@<S1>, double a7@<D2>, double a8@<D3>, float a9@<S4>, float a10@<S5>, float a11@<S6>, float a12@<S7>, uint64_t a13, uint64_t a14)
{
  char v14 = *a3;
  *(float *)a4 = a5;
  *(void *)(a4 + 8) = result;
  *(unsigned char *)(a4 + 16) = a2;
  *(float *)(a4 + 20) = a6;
  *(double *)(a4 + 24) = a7;
  *(double *)(a4 + 32) = a8;
  *(float *)(a4 + 40) = a9;
  *(float *)(a4 + 44) = a10;
  *(float *)(a4 + 48) = a11;
  *(unsigned char *)(a4 + 52) = 0;
  *(_DWORD *)(a4 + 56) = 0;
  *(void *)(a4 + 64) = 0;
  *(unsigned char *)(a4 + 72) = v14;
  *(float *)(a4 + 76) = a12;
  *(void *)(a4 + 80) = a13;
  *(void *)(a4 + 88) = a14;
  return result;
}

__n128 ComplicationCurvedTextConfiguration.init(fontSize:color:path:accessoryContentPlacement:accessoryContentPadding:accessoryContentMaxSize:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>, float a5@<S0>, float a6@<S1>, double a7@<D2>, double a8@<D3>)
{
  char v8 = *a3;
  *(float *)a4 = a5;
  *(void *)(a4 + 8) = a1;
  *(unsigned char *)(a4 + 16) = 0;
  *(_DWORD *)(a4 + 20) = 0;
  __n128 result = *(__n128 *)MEMORY[0x263F00148];
  *(_OWORD *)(a4 + 24) = *MEMORY[0x263F00148];
  *(void *)(a4 + 40) = 0;
  *(void *)(a4 + 45) = 0;
  *(_DWORD *)(a4 + 56) = 0;
  *(void *)(a4 + 64) = a2;
  *(unsigned char *)(a4 + 72) = v8;
  *(float *)(a4 + 76) = a6;
  *(double *)(a4 + 80) = a7;
  *(double *)(a4 + 88) = a8;
  return result;
}

__n128 ComplicationCurvedTextConfiguration.init(fontSize:color:tracking:textAlignment:baselineOffset:path:accessoryContentPlacement:accessoryContentPadding:accessoryContentMaxSize:)@<Q0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>, float a6@<S0>, float a7@<S1>, float a8@<S2>, float a9@<S3>, double a10@<D4>, double a11@<D5>)
{
  char v11 = *a2;
  char v12 = *a4;
  *(float *)a5 = a6;
  *(void *)(a5 + 8) = a1;
  *(unsigned char *)(a5 + 16) = 0;
  *(float *)(a5 + 20) = a7;
  __n128 result = *(__n128 *)MEMORY[0x263F00148];
  *(_OWORD *)(a5 + 24) = *MEMORY[0x263F00148];
  *(void *)(a5 + 40) = 0;
  *(_DWORD *)(a5 + 48) = 0;
  *(unsigned char *)(a5 + 52) = v11;
  *(float *)(a5 + 56) = a8;
  *(void *)(a5 + 64) = a3;
  *(unsigned char *)(a5 + 72) = v12;
  *(float *)(a5 + 76) = a9;
  *(double *)(a5 + 80) = a10;
  *(double *)(a5 + 88) = a11;
  return result;
}

unint64_t sub_21E40F79C()
{
  unint64_t result = qword_267D2BE28;
  if (!qword_267D2BE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BE28);
  }
  return result;
}

unint64_t sub_21E40F7F4()
{
  unint64_t result = qword_267D2BE30;
  if (!qword_267D2BE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BE30);
  }
  return result;
}

void destroy for ComplicationCurvedTextConfiguration(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 64);
}

uint64_t initializeWithCopy for ComplicationCurvedTextConfiguration(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v3 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v3;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_retain();
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ComplicationCurvedTextConfiguration(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  id v4 = *(void **)(a1 + 64);
  id v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t assignWithTake for ComplicationCurvedTextConfiguration(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  id v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedTextConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedTextConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration()
{
  return &type metadata for ComplicationCurvedTextConfiguration;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration.ContentPlacement()
{
  return &type metadata for ComplicationCurvedTextConfiguration.ContentPlacement;
}

uint64_t _s19ComplicationDisplay35ComplicationCurvedTextConfigurationV19CurvedTextAlignmentOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s19ComplicationDisplay35ComplicationCurvedTextConfigurationV19CurvedTextAlignmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21E40FCB4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_21E40FCDC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21E40FCE4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration.CurvedTextAlignment()
{
  return &type metadata for ComplicationCurvedTextConfiguration.CurvedTextAlignment;
}

uint64_t sub_21E40FD70()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  return MEMORY[0x223C270B0](v1);
}

uint64_t sub_21E40FE10()
{
  return swift_unknownObjectRelease();
}

void (*sub_21E40FE6C(void *a1))(void **a1, char a2)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C270B0](v5);
  return sub_21E40FEF0;
}

void sub_21E40FEF0(void **a1, char a2)
{
  int v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id _ComplicationHosting.view.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view);
}

uint64_t _ComplicationHosting.rendersAsynchronously.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously);
}

uint64_t sub_21E41008C()
{
  return sub_21E410E34(&OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler, (void (*)(void, void))sub_21E4100AC);
}

uint64_t sub_21E4100AC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_21E4100BC(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = *(void (**)(uint64_t, double, double))(a1 + 32);
  uint64_t v6 = swift_retain();
  v5(v6, a2, a3);
  return swift_release();
}

uint64_t sub_21E4101BC(uint64_t a1, uint64_t a2)
{
  return sub_21E410F50(a1, a2, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21E4101DC);
}

uint64_t sub_21E4101DC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21E4101EC@<X0>(void *a1@<X0>, uint64_t (**a2)(double *a1, double *a2)@<X8>)
{
  int v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    BOOL v7 = sub_21E412D28;
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(double *, double *))v6;
  return sub_21E4100AC(v4);
}

uint64_t sub_21E41028C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_21E412CEC;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  BOOL v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_21E4100AC(v3);
  return sub_21E4101DC(v8);
}

uint64_t (*sub_21E410354())()
{
  return j__swift_endAccess;
}

uint64_t sub_21E4103F8()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21E41048C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21E4104D8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E41057C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21E410610(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21E41065C())()
{
  return j_j__swift_endAccess;
}

char *sub_21E4106D8()
{
  return sub_21E4106F0(1);
}

char *sub_21E4106E8()
{
  return sub_21E4106F0(0);
}

char *sub_21E4106F0(char a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for _ComplicationHosting());
  return _s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a1);
}

char *sub_21E41072C(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for _ComplicationHosting());
  uint64_t v5 = _s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a3);
  return v5;
}

char *_ComplicationHosting.__allocating_init(frame:async:)(char a1)
{
  id v3 = objc_allocWithZone(v1);
  return _s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a1);
}

uint64_t type metadata accessor for _ComplicationHosting()
{
  return self;
}

void sub_21E4107CC(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_statistics);
  type metadata accessor for RBDrawableStatisticsKey(0);
  sub_21E412E00(&qword_267D2B880, type metadata accessor for RBDrawableStatisticsKey);
  uint64_t v5 = sub_21E41F780();

  if (!*(void *)(v5 + 16))
  {
    long long v20 = 0u;
    long long v21 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  id v6 = (id)*MEMORY[0x263F63910];
  unint64_t v7 = sub_21E411B30((uint64_t)v6);
  if ((v8 & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;

    goto LABEL_8;
  }
  sub_21E412EA8(*(void *)(v5 + 56) + 32 * v7, (uint64_t)&v20);

  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_9:
    sub_21E412E48((uint64_t)&v20);
    goto LABEL_10;
  }
  if (swift_dynamicCast())
  {
    double v9 = v19;
    goto LABEL_11;
  }
LABEL_10:
  double v9 = 0.0;
LABEL_11:
  uint64_t v10 = a2 + 16;
  id v11 = objc_msgSend(a1, sel_statistics);
  uint64_t v12 = sub_21E41F780();

  if (*(void *)(v12 + 16))
  {
    id v13 = (id)*MEMORY[0x263F63918];
    unint64_t v14 = sub_21E411B30((uint64_t)v13);
    if (v15)
    {
      sub_21E412EA8(*(void *)(v12 + 56) + 32 * v14, (uint64_t)&v20);
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v21 + 1))
  {
    if (swift_dynamicCast())
    {
      double v16 = v19;
      goto LABEL_22;
    }
  }
  else
  {
    sub_21E412E48((uint64_t)&v20);
  }
  double v16 = 0.0;
LABEL_22:
  swift_beginAccess();
  uint64_t v17 = MEMORY[0x223C270B0](v10);
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    sub_21E411368(v16, v9);
  }
}

uint64_t sub_21E410A30(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id _ComplicationHosting.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController];
  swift_getObjectType();
  id v3 = v2;
  sub_21E41F6E0();
  sub_21E41F1A0();

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for _ComplicationHosting();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

uint64_t sub_21E410C9C()
{
  return sub_21E41F160();
}

uint64_t sub_21E410E14()
{
  return sub_21E410E34(&OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData, (void (*)(void, void))sub_21E412308);
}

uint64_t sub_21E410E34(void *a1, void (*a2)(void, void))
{
  id v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_21E410F30(uint64_t a1, uint64_t a2)
{
  return sub_21E410F50(a1, a2, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData, (uint64_t (*)(uint64_t, uint64_t))sub_21E412374);
}

uint64_t sub_21E410F50(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  char v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *char v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_21E410FB4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return sub_21E412308(v4, v5);
}

uint64_t sub_21E41100C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = (uint64_t *)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  uint64_t *v4 = v2;
  v4[1] = v3;
  sub_21E412308(v2, v3);
  return sub_21E412374(v5, v6);
}

uint64_t (*sub_21E411088())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E41112C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21E4111C0(char a1)
{
  unint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21E41120C())()
{
  return j_j__swift_endAccess;
}

void sub_21E411268()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously) == 1)
  {
    objc_msgSend(self, sel_flush);
    swift_getObjectType();
    if (sub_21E41F170())
    {
      self;
      uint64_t v1 = (void *)swift_dynamicCastObjCClass();
      if (v1) {
        objc_msgSend(v1, sel_waitUntilAsyncRenderingCompleted);
      }
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_21E411368(double a1, double a2)
{
  uint64_t v5 = sub_21E41F740();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E41F760();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v2 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler;
  uint64_t result = swift_beginAccess();
  char v15 = *(void (**)(uint64_t, double, double))v13;
  if (*(void *)v13)
  {
    uint64_t v16 = *(void *)(v13 + 8);
    uint64_t v17 = (unsigned char *)(v2
                  + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
    swift_beginAccess();
    if (*v17 == 1)
    {
      sub_21E404F98(0, &qword_267D2BF10);
      swift_retain();
      uint64_t v24 = sub_21E41F850();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v15;
      *(void *)(v18 + 24) = v16;
      *(double *)(v18 + 32) = a1;
      *(double *)(v18 + 40) = a2;
      aBlock[4] = sub_21E412AB0;
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_21E4163C8;
      aBlock[3] = &block_descriptor_3;
      double v19 = _Block_copy(aBlock);
      uint64_t v23 = v9;
      long long v20 = v19;
      swift_retain();
      swift_release();
      sub_21E41F750();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_21E412E00(&qword_267D2BF18, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BF20);
      sub_21E412AF8();
      sub_21E41F8A0();
      long long v21 = (void *)v24;
      MEMORY[0x223C26330](0, v12, v8, v20);
      _Block_release(v20);

      sub_21E4101DC((uint64_t)v15);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v23);
    }
    else
    {
      uint64_t v22 = swift_retain();
      v15(v22, a1, a2);
      return sub_21E4101DC((uint64_t)v15);
    }
  }
  return result;
}

id _ComplicationHosting.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void _ComplicationHosting.init()()
{
}

Swift::Void __swiftcall _ComplicationHosting.updateMonochromeColor()()
{
  objc_msgSend(v0, sel_transitionToMonochromeWithFraction_, 1.0);
}

void _ComplicationHosting.transitionToMonochrome(withFraction:)()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_isMonochrome) = CLKFloatEqualsFloat();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x223C270B0](v1);
  id v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(v2, sel_colorForView_accented_, *(void *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view), 1);
    swift_unknownObjectRelease();
    if (v4)
    {
      uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model);
      id v3 = v4;
      MEMORY[0x223C26050]();
      swift_getKeyPath();
      swift_getKeyPath();
      id v6 = v5;
      sub_21E41EEE0();
    }
    else
    {
      id v3 = 0;
    }
  }
  uint64_t v7 = (void *)MEMORY[0x223C270B0](v1);
  id v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, sel_colorForView_accented_, *(void *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view), 0);
    swift_unknownObjectRelease();
    if (v9)
    {
      uint64_t v10 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model);
      id v8 = v9;
      MEMORY[0x223C26050](v8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v11 = v10;
      sub_21E41EEE0();
    }
    else
    {
      id v8 = 0;
    }
  }
  uint64_t v12 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model);
  sub_21E4119E8();
  swift_getKeyPath();
  swift_getKeyPath();
  id v13 = v12;
  sub_21E41EEE0();
  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = v13;
  sub_21E41EEE0();
}

uint64_t sub_21E4119E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x223C270B0](v1);
  if (v2)
  {
    id v3 = v2;
    if (objc_msgSend(v2, sel_respondsToSelector_, sel_viewShouldIgnoreTwoPieceImage_))
    {
      unsigned __int8 v4 = objc_msgSend(v3, sel_viewShouldIgnoreTwoPieceImage_, *(void *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view));
      swift_unknownObjectRelease();
      if (v4) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground)) {
    return 0;
  }
LABEL_8:
  id v6 = (unsigned char *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
  swift_beginAccess();
  if (*v6) {
    return 3;
  }
  else {
    return 1;
  }
}

unint64_t sub_21E411B30(uint64_t a1)
{
  sub_21E41F7C0();
  sub_21E41F970();
  sub_21E41F7D0();
  uint64_t v2 = sub_21E41F990();
  swift_bridgeObjectRelease();
  return sub_21E411BC4(a1, v2);
}

unint64_t sub_21E411BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_21E41F7C0();
    uint64_t v8 = v7;
    if (v6 == sub_21E41F7C0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_21E41F960();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_21E41F7C0();
          uint64_t v15 = v14;
          if (v13 == sub_21E41F7C0() && v15 == v16) {
            break;
          }
          char v18 = sub_21E41F960();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

char *_s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(char a1)
{
  uint64_t v3 = sub_21E41F2F0();
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v5 = (uint64_t *)((char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_21E41F340();
  uint64_t v49 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  uint64_t v9 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model;
  id v10 = objc_allocWithZone((Class)type metadata accessor for MonochromeModel());
  char v11 = v1;
  *(void *)&v1[v9] = objc_msgSend(v10, sel_init);
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_isMonochrome] = 0;
  uint64_t v12 = &v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue] = 1;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView] = 0;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground] = 0;
  *(_OWORD *)&v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData] = xmmword_21E423C70;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused] = 0;
  char v13 = CLKIsUVPreviewApp();
  uint64_t v46 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_inPreview;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_inPreview] = v13;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously] = a1;
  sub_21E41F6E0();
  uint64_t v14 = (void *)sub_21E41F380();
  swift_release();
  swift_getObjectType();
  sub_21E404F98(0, (unint64_t *)&unk_267D2BF30);
  uint64_t v15 = dynamic_cast_existential_1_superclass_unconditional((uint64_t)v14);
  uint64_t v16 = &v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController];
  *(void *)uint64_t v16 = v15;
  *((void *)v16 + 1) = v17;
  sub_21E41F330();
  sub_21E41F310();
  sub_21E41F320();
  swift_getObjectType();
  uint64_t v18 = swift_allocBox();
  double v19 = *(void (**)(uint64_t, char *, uint64_t))(v49 + 16);
  unint64_t v44 = v8;
  uint64_t v45 = v6;
  v19(v20, v8, v6);
  uint64_t *v5 = v18;
  (*(void (**)(uint64_t *, void, uint64_t))(v47 + 104))(v5, *MEMORY[0x263F19F70], v48);
  long long v21 = (void (*)(void *, void))sub_21E41F190();
  sub_21E41F350();
  v21(aBlock, 0);
  id v22 = v14;
  uint64_t v23 = (void (*)(void *, void))sub_21E41F190();
  sub_21E41F300();
  v23(aBlock, 0);

  uint64_t v24 = *(void **)v16;
  swift_getObjectType();
  id v25 = v24;
  sub_21E41F180();

  uint64_t result = (char *)objc_msgSend(*(id *)v16, sel_view);
  if (result)
  {
    uint64_t v27 = result;
    *(void *)&v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view] = result;
    unint64_t v28 = self;
    unint64_t v29 = v27;
    id v30 = objc_msgSend(v28, sel_clearColor);
    objc_msgSend(v29, sel_setBackgroundColor_, v30);

    double v31 = (objc_class *)type metadata accessor for _ComplicationHosting();
    v51.receiver = v11;
    v51.super_class = v31;
    int64_t v32 = (char *)objc_msgSendSuper2(&v51, sel_init);
    double v33 = *(void **)&v32[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController];
    swift_getObjectType();
    double v34 = v32;
    id v35 = v33;
    uint64_t v36 = sub_21E41F170();

    if (v36)
    {
      self;
      id v37 = (void *)swift_dynamicCastObjCClass();
      char v39 = v44;
      uint64_t v38 = v45;
      uint64_t v40 = v49;
      if (v37)
      {
        uint64_t v41 = v37;
        objc_msgSend(v37, sel_resetStatistics_alpha_, 6, 0.0);
        uint64_t v42 = swift_allocObject();
        swift_unknownObjectWeakInit();
        aBlock[4] = sub_21E412DF8;
        aBlock[5] = v42;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_21E410A30;
        aBlock[3] = &block_descriptor_60;
        id v43 = _Block_copy(aBlock);
        swift_release();
        objc_msgSend(v41, sel_setStatisticsHandler_, v43);

        _Block_release(v43);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    else
    {

      char v39 = v44;
      uint64_t v38 = v45;
      uint64_t v40 = v49;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v38);
    return v34;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21E412308(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21E41231C(a1, a2);
  }
  return a1;
}

uint64_t sub_21E41231C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21E412374(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21E412388(a1, a2);
  }
  return a1;
}

uint64_t sub_21E412388(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21E412400@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C270B0](v3);
  *a2 = result;
  return result;
}

uint64_t sub_21E412458()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_21E4124B8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue, a2);
}

uint64_t sub_21E4124C4(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_28Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
}

uint64_t sub_21E4124D0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView, a2);
}

uint64_t sub_21E4124DC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_28Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
}

uint64_t sub_21E4124F0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused, a2);
}

uint64_t keypath_get_27Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_21E41254C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_28Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused);
}

uint64_t keypath_set_28Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t method lookup function for _ComplicationHosting(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _ComplicationHosting);
}

uint64_t dispatch thunk of _ComplicationHosting.filterProvider.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of _ComplicationHosting.filterProvider.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of _ComplicationHosting.filterProvider.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of _ComplicationHosting.renderStatsHandler.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of _ComplicationHosting.renderStatsHandler.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of _ComplicationHosting.renderStatsHandler.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldCallRenderStatsHandlerOnMainQueue.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldCallRenderStatsHandlerOnMainQueue.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldCallRenderStatsHandlerOnMainQueue.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldAccentDesaturatedView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldAccentDesaturatedView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldAccentDesaturatedView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of static _ComplicationHosting.async()()
{
  return (*(uint64_t (**)(void))(v0 + 328))();
}

uint64_t dispatch thunk of static _ComplicationHosting.sync()()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of _ComplicationHosting.__allocating_init(frame:async:)()
{
  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of _ComplicationHosting.sizeThatFits(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of _ComplicationHosting.viewData.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of _ComplicationHosting.viewData.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of _ComplicationHosting.viewData.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of _ComplicationHosting.paused.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of _ComplicationHosting.paused.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of _ComplicationHosting.paused.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of _ComplicationHosting.waitForAsyncRendering()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t sub_21E412A78()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21E412AB0()
{
  return (*(uint64_t (**)(double, double))(v0 + 16))(*(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_21E412AF8()
{
  unint64_t result = qword_267D2BF28;
  if (!qword_267D2BF28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BF20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2BF28);
  }
  return result;
}

void sub_21E412B54()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MonochromeModel()), sel_init);
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_isMonochrome] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler];
  *uint64_t v2 = 0;
  v2[1] = 0;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue] = 1;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView] = 0;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground] = 0;
  *(_OWORD *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData] = xmmword_21E423C70;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused] = 0;

  sub_21E41F920();
  __break(1u);
}

uint64_t sub_21E412C44()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E412C7C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_21E412C8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_21E412CB4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E412CEC(double a1, double a2)
{
  uint64_t v3 = *(uint64_t (**)(double *, double *))(v2 + 16);
  double v5 = a2;
  double v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_21E412D28(double *a1, double *a2)
{
  return (*(uint64_t (**)(double, double))(v2 + 16))(*a1, *a2);
}

uint64_t dynamic_cast_existential_1_superclass_unconditional(uint64_t a1)
{
  uint64_t result = swift_dynamicCastMetatype();
  if (result)
  {
    uint64_t result = swift_conformsToProtocol2();
    if (result) {
      return a1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21E412DC0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21E412DF8(void *a1)
{
  sub_21E4107CC(a1, v1);
}

uint64_t sub_21E412E00(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E412E48(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2BF40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E412EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21E412F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21E41F290();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_21E41F2A0();
}

uint64_t sub_21E413014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21E41F290();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_21E41F2A0();
}

double ComplicationCircularBezelView.contentCenter.getter()
{
  return *(double *)v0;
}

uint64_t ComplicationCircularBezelView.curvedLabelViewConfiguration.getter@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = v1[6];
  long long v12 = v1[5];
  long long v2 = v12;
  long long v13 = v3;
  long long v14 = v1[7];
  long long v4 = v14;
  long long v5 = v1[2];
  v9[0] = v1[1];
  v9[1] = v5;
  long long v6 = v1[4];
  long long v10 = v1[3];
  long long v7 = v10;
  long long v11 = v6;
  *a1 = v9[0];
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v6;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  return sub_21E3FF4FC((uint64_t)v9);
}

uint64_t ComplicationCircularBezelView.circularContent.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_retain();
  return v1;
}

uint64_t ComplicationCircularBezelView.body.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v21[1] = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BF50);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = a1[4];
  v21[0] = a1[5];
  *(void *)&long long v22 = v5;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v6;
  *((void *)&v23 + 1) = v21[0];
  type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
  sub_21E41F050();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B808);
  sub_21E41F050();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_267D2BF58);
  sub_21E41F050();
  sub_21E41F050();
  swift_getTupleTypeMetadata2();
  sub_21E41F700();
  swift_getWitnessTable();
  uint64_t v7 = sub_21E41F6D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  long long v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  long long v13 = (char *)v21 - v12;
  long long v14 = v2[7];
  long long v28 = v2[6];
  long long v29 = v14;
  long long v30 = v2[8];
  long long v15 = v2[3];
  long long v24 = v2[2];
  long long v25 = v15;
  long long v16 = v2[5];
  long long v26 = v2[4];
  long long v27 = v16;
  long long v17 = v2[1];
  long long v22 = *v2;
  long long v23 = v17;
  v21[4] = v5;
  v21[5] = v4;
  v21[6] = v6;
  v21[7] = v21[0];
  v21[8] = &v22;
  sub_21E41F6F0();
  sub_21E41F6C0();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_21E4095DC(v11, v7, WitnessTable);
  double v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  sub_21E4095DC(v13, v7, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v19)(v13, v7);
}

uint64_t type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier()
{
  return swift_getGenericMetadata();
}

void *sub_21E41347C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v63 = a6;
  uint64_t v56 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v52 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2B808);
  uint64_t v54 = sub_21E41F050();
  uint64_t v60 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  objc_super v51 = (char *)&v48 - v12;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_267D2BF58);
  uint64_t v57 = sub_21E41F050();
  uint64_t v61 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v53 = (char *)&v48 - v13;
  uint64_t v58 = sub_21E41F050();
  uint64_t v62 = *(void *)(v58 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v58);
  long long v55 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v59 = (char *)&v48 - v16;
  __n128 v17 = *(__n128 *)(a1 + 64);
  __n128 v18 = *(__n128 *)(a1 + 96);
  __n128 v74 = *(__n128 *)(a1 + 80);
  __n128 v75 = v18;
  __n128 v19 = *(__n128 *)(a1 + 96);
  __n128 v76 = *(__n128 *)(a1 + 112);
  __n128 v20 = *(__n128 *)(a1 + 32);
  __n128 v70 = *(__n128 *)(a1 + 16);
  __n128 v71 = v20;
  __n128 v21 = *(__n128 *)(a1 + 64);
  __n128 v23 = *(__n128 *)(a1 + 16);
  __n128 v22 = *(__n128 *)(a1 + 32);
  __n128 v72 = *(__n128 *)(a1 + 48);
  __n128 v73 = v21;
  v83[4] = v74;
  v83[5] = v19;
  v83[6] = *(__n128 *)(a1 + 112);
  v83[0] = v23;
  v83[1] = v22;
  v83[3] = v17;
  v83[2] = v72;
  sub_21E3FF4FC((uint64_t)&v70);
  ComplicationCurvedLabelView<>.init(configuration:)(v83, (uint64_t)v77);
  v81[6] = v77[6];
  v81[7] = v77[7];
  *(void *)&v81[8] = v78;
  v81[2] = v77[2];
  v81[3] = v77[3];
  v81[5] = v77[5];
  v81[4] = v77[4];
  v81[1] = v77[1];
  v81[0] = v77[0];
  v83[4] = v74;
  v83[5] = v75;
  v83[6] = v76;
  v83[0] = v70;
  v83[1] = v71;
  v83[3] = v73;
  v83[2] = v72;
  memset(v82, 0, 32);
  LOBYTE(v82[2]) = 2;
  sub_21E3FF4FC((uint64_t)&v70);
  sub_21E413C90(v83, (uint64_t)v79);
  v82[6] = v79[6];
  v82[7] = v79[7];
  v82[8] = v79[8];
  v82[9] = v79[9];
  v82[2] = v79[2];
  v82[3] = v79[3];
  v82[4] = v79[4];
  v82[5] = v79[5];
  v82[0] = v79[0];
  v82[1] = v79[1];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BF50);
  v83[0].n128_u64[0] = a2;
  v83[0].n128_u64[1] = a3;
  v83[1].n128_u64[0] = a4;
  v83[1].n128_u64[1] = a5;
  uint64_t v25 = a5;
  uint64_t v26 = type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
  uint64_t v27 = sub_21E3FD70C(&qword_267D2C070, &qword_267D2BF50);
  MEMORY[0x223C26000](v83, v82, v24, v26, v27);
  sub_21E4159D0((uint64_t)v79);
  sub_21E415A34((uint64_t)v77);
  memcpy(v80, v83, sizeof(v80));
  memcpy(v82, v83, 0x128uLL);
  uint64_t v28 = sub_21E41F050();
  uint64_t v49 = v28;
  uint64_t WitnessTable = swift_getWitnessTable();
  v68[8] = v27;
  v68[9] = WitnessTable;
  uint64_t v50 = swift_getWitnessTable();
  sub_21E4095DC(v82, v28, v50);
  long long v30 = sub_21E415AB0(v80);
  double v31 = v52;
  (*(void (**)(void *))(a1 + 128))(v30);
  sub_21E3FD6B8();
  int64_t v32 = v51;
  sub_21E41F550();
  (*(void (**)(char *, unint64_t))(v56 + 8))(v31, a3);
  sub_21E41F6F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C078);
  uint64_t v33 = sub_21E3FD70C(&qword_267D2B838, &qword_267D2B808);
  v68[6] = v25;
  v68[7] = v33;
  uint64_t v34 = v54;
  uint64_t v35 = swift_getWitnessTable();
  sub_21E3FD70C(&qword_267D2C080, &qword_267D2C078);
  uint64_t v36 = v53;
  sub_21E41F520();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v32, v34);
  uint64_t v37 = sub_21E3FD70C(&qword_267D2C088, qword_267D2BF58);
  v68[4] = v35;
  v68[5] = v37;
  uint64_t v38 = v57;
  uint64_t v39 = swift_getWitnessTable();
  uint64_t v40 = (uint64_t)v55;
  sub_21E41F540();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v36, v38);
  unint64_t v41 = sub_21E3FD750();
  void v68[2] = v39;
  v68[3] = v41;
  uint64_t v42 = v58;
  uint64_t v43 = swift_getWitnessTable();
  unint64_t v44 = v59;
  sub_21E4095DC(v40, v42, v43);
  uint64_t v45 = v62;
  uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
  v46(v40, v42);
  memcpy(v81, v69, 0x128uLL);
  memcpy(v67, v69, sizeof(v67));
  v68[0] = (uint64_t)v67;
  (*(void (**)(uint64_t, char *, uint64_t))(v45 + 16))(v40, v44, v42);
  v68[1] = v40;
  sub_21E415B78(v81);
  v66[0] = v49;
  v66[1] = v42;
  uint64_t v64 = v50;
  uint64_t v65 = v43;
  sub_21E402EC4(v68, 2uLL, (uint64_t)v66);
  v46((uint64_t)v44, v42);
  memcpy(v82, v69, 0x128uLL);
  sub_21E415AB0(v82);
  v46(v40, v42);
  memcpy(v83, v67, 0x128uLL);
  return sub_21E415AB0(v83);
}

void *sub_21E413C6C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E41347C(*(void *)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

double sub_21E413C7C@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = 2;
  return result;
}

double sub_21E413C90@<D0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = a1[5];
  *(_OWORD *)(a2 + 64) = a1[4];
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 96) = a1[6];
  long long v4 = a1[1];
  *(_OWORD *)a2 = *a1;
  *(_OWORD *)(a2 + 16) = v4;
  long long v5 = a1[3];
  *(_OWORD *)(a2 + 32) = a1[2];
  *(_OWORD *)(a2 + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B980);
  sub_21E41F640();
  double result = *(double *)&v7;
  *(_OWORD *)(a2 + 112) = v7;
  *(_OWORD *)(a2 + 128) = v8;
  *(unsigned char *)(a2 + 144) = v9;
  *(void *)(a2 + 152) = v10;
  return result;
}

void sub_21E413D1C(double (**a1)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  *a1 = sub_21E413D34;
  a1[1] = 0;
}

double sub_21E413D34@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21E41F2C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E41F360();
  sub_21E41EF80();
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v20.origin.CGFloat x = v7;
  v20.origin.CGFloat y = v9;
  v20.size.CGFloat width = v11;
  v20.size.CGFloat height = v13;
  CGRectInset(v20, -5.0, -5.0);
  uint64_t v14 = sub_21E41F590();
  sub_21E41F470();
  char v15 = v19;
  *(void *)a1 = v14;
  double result = *(double *)v18;
  long long v17 = v18[1];
  *(_OWORD *)(a1 + 8) = v18[0];
  *(_OWORD *)(a1 + 24) = v17;
  *(unsigned char *)(a1 + 40) = v15;
  return result;
}

__n128 ComplicationCircularBezelView<>.init(curvedLabelViewConfiguration:contentCenter:content:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  double v12 = *(void **)(a1 + 104);
  if (v12)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v13 = v12;
    sub_21E41EEE0();
  }
  long long v14 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a4 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a4 + 96) = v14;
  uint64_t v15 = *(void *)(a1 + 96);
  long long v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 32) = v16;
  __n128 result = *(__n128 *)(a1 + 48);
  *(_OWORD *)(a4 + 48) = *(_OWORD *)(a1 + 32);
  *(__n128 *)(a4 + 64) = result;
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(void *)(a4 + 112) = v15;
  *(void *)(a4 + 120) = v12;
  *(void *)(a4 + 128) = a2;
  *(void *)(a4 + 136) = a3;
  return result;
}

uint64_t sub_21E413F74()
{
  return sub_21E4148D0();
}

uint64_t sub_21E413F8C(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_21E413FE0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  uint64_t v3 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v3;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v4 = *(void *)(a2 + 136);
  long long v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  *(void *)(a1 + 136) = v4;
  swift_retain();
  id v5 = v3;
  swift_bridgeObjectRetain();
  id v6 = (id)v8;
  swift_retain();
  return a1;
}

uint64_t sub_21E4140C4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  uint64_t v4 = *(void **)(a1 + 80);
  id v5 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  CGFloat v7 = *(void **)(a1 + 120);
  long long v8 = *(void **)(a2 + 120);
  *(void *)(a1 + 120) = v8;
  id v9 = v8;

  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21E4141E4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  uint64_t v4 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 120);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);

  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_release();
  return a1;
}

uint64_t sub_21E4142B4(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E4142FC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCircularBezelView()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21E414378()
{
  return swift_getWitnessTable();
}

uint64_t sub_21E4144B8(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_21E41450C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v3 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v3;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  uint64_t v4 = *(void **)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v4;
  long long v5 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v5;
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  id v6 = v3;
  swift_bridgeObjectRetain();
  id v7 = v4;
  swift_retain();
  return a1;
}

uint64_t sub_21E4145E4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  long long v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v5;
  id v6 = v5;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a1 + 104);
  long long v8 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v8;
  id v9 = v8;

  long long v10 = *(_OWORD *)(a2 + 112);
  long long v11 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v10;
  *(_OWORD *)(a1 + 128) = v11;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t sub_21E414730(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  long long v5 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  long long v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  return a1;
}

uint64_t sub_21E414808(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 160)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E414850(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 160) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 160) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_21E4148B8()
{
  return sub_21E4148D0();
}

uint64_t sub_21E4148D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E414904()
{
  return sub_21E41F640();
}

uint64_t sub_21E414958()
{
  return sub_21E41F650();
}

uint64_t sub_21E4149B0()
{
  return sub_21E41F660();
}

double sub_21E414A18@<D0>(uint64_t a1@<X8>)
{
  sub_21E41F480();
  sub_21E41F440();
  sub_21E41F450();
  sub_21E41F430();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_21E414AE8(unsigned int *a1)
{
  unsigned int v3 = *a1;
  unsigned int v2 = a1[1];
  uint64_t v4 = *((void *)a1 + 1);
  uint64_t v5 = *((void *)a1 + 2);
  uint64_t v6 = *((void *)a1 + 3);
  char v7 = *((unsigned char *)a1 + 32);
  uint64_t v8 = *((void *)v1 + 14);
  uint64_t v9 = *((void *)v1 + 15);
  uint64_t v10 = *((void *)v1 + 16);
  uint64_t v11 = *((void *)v1 + 17);
  char v12 = *((unsigned char *)v1 + 144);
  uint64_t v13 = *((void *)v1 + 19);
  *(void *)&long long v23 = v8;
  *((void *)&v23 + 1) = v9;
  *(void *)&long long v24 = v10;
  *((void *)&v24 + 1) = v11;
  LOBYTE(v25) = v12;
  *((void *)&v25 + 1) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA58);
  sub_21E41F650();
  if (v39 == 2) {
    goto LABEL_3;
  }
  long long v23 = v37;
  long long v24 = v38;
  LOBYTE(v25) = v39;
  v18[0] = v3;
  v18[1] = v2;
  uint64_t v19 = v4;
  uint64_t v20 = v5;
  uint64_t v21 = v6;
  char v22 = v7;
  uint64_t result = _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0((uint64_t)&v23, (uint64_t)v18);
  if ((result & 1) == 0)
  {
LABEL_3:
    long long v15 = v1[5];
    long long v27 = v1[4];
    long long v28 = v15;
    long long v29 = v1[6];
    long long v16 = v1[1];
    long long v23 = *v1;
    long long v24 = v16;
    long long v17 = v1[3];
    long long v25 = v1[2];
    long long v26 = v17;
    uint64_t v30 = v8;
    uint64_t v31 = v9;
    uint64_t v32 = v10;
    uint64_t v33 = v11;
    char v34 = v12;
    *(_DWORD *)&v35[3] = *((_DWORD *)v1 + 37);
    *(_DWORD *)uint64_t v35 = *(_DWORD *)((char *)v1 + 145);
    uint64_t v36 = v13;
    *(void *)&long long v37 = v3 | ((unint64_t)v2 << 32);
    *((void *)&v37 + 1) = v4;
    *(void *)&long long v38 = v5;
    *((void *)&v38 + 1) = v6;
    char v39 = v7;
    return sub_21E4149B0();
  }
  return result;
}

uint64_t sub_21E414C38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v102 = a1;
  uint64_t v109 = a3;
  uint64_t v6 = sub_21E41F090();
  uint64_t v98 = *(void *)(v6 - 8);
  uint64_t v99 = v6;
  MEMORY[0x270FA5388](v6);
  v96 = &v88[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getWitnessTable();
  uint64_t v101 = a2;
  uint64_t v8 = sub_21E41F2E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BA90);
  uint64_t v110 = v8;
  uint64_t v9 = sub_21E41F050();
  uint64_t v104 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  *(void *)&long long v92 = &v88[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v103 = &v88[-v12];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2BD38);
  uint64_t v13 = sub_21E41F050();
  uint64_t v95 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v93 = &v88[-v14];
  uint64_t v112 = v15;
  uint64_t v16 = sub_21E41F050();
  uint64_t v100 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v94 = &v88[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v17);
  v97 = &v88[-v19];
  uint64_t v107 = v20;
  uint64_t v108 = v9;
  uint64_t v21 = sub_21E41F2B0();
  uint64_t v105 = *(void *)(v21 - 8);
  uint64_t v106 = v21;
  MEMORY[0x270FA5388](v21);
  v111 = &v88[-v22];
  uint64_t v24 = *((void *)v4 + 14);
  uint64_t v23 = *((void *)v4 + 15);
  uint64_t v25 = *((void *)v4 + 16);
  uint64_t v26 = *((void *)v4 + 17);
  char v27 = *((unsigned char *)v4 + 144);
  long long v28 = (_DWORD *)((char *)v4 + 145);
  uint64_t v29 = *((void *)v4 + 19);
  *(void *)&long long v138 = v24;
  *((void *)&v138 + 1) = v23;
  *(void *)&long long v139 = v25;
  *((void *)&v139 + 1) = v26;
  char v30 = v27;
  LOBYTE(v140) = v27;
  uint64_t v31 = v29;
  *((void *)&v140 + 1) = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BA58);
  sub_21E41F650();
  if (v137 == 2)
  {
    long long v32 = v4[5];
    long long v142 = v4[4];
    long long v143 = v32;
    long long v144 = v4[6];
    long long v33 = v4[1];
    long long v138 = *v4;
    long long v139 = v33;
    long long v34 = v4[3];
    long long v140 = v4[2];
    long long v141 = v34;
    uint64_t v145 = v24;
    uint64_t v146 = v23;
    uint64_t v147 = v25;
    uint64_t v148 = v26;
    char v149 = v30;
    *(_DWORD *)long long v150 = *v28;
    *(_DWORD *)&v150[3] = *((_DWORD *)v4 + 37);
    uint64_t v151 = v31;
    uint64_t v35 = swift_allocObject();
    long long v36 = *(_OWORD *)(v101 + 32);
    *(_OWORD *)(v35 + 16) = *(_OWORD *)(v101 + 16);
    *(_OWORD *)(v35 + 32) = v36;
    long long v37 = v4[5];
    *(_OWORD *)(v35 + 112) = v4[4];
    *(_OWORD *)(v35 + 128) = v37;
    *(_OWORD *)(v35 + 144) = v4[6];
    long long v38 = v4[1];
    *(_OWORD *)(v35 + 48) = *v4;
    *(_OWORD *)(v35 + 64) = v38;
    long long v39 = v4[3];
    *(_OWORD *)(v35 + 80) = v4[2];
    *(_OWORD *)(v35 + 96) = v39;
    *(void *)(v35 + 160) = v24;
    *(void *)(v35 + 168) = v23;
    *(void *)(v35 + 176) = v25;
    *(void *)(v35 + 184) = v26;
    *(unsigned char *)(v35 + 192) = v30;
    *(_DWORD *)(v35 + 193) = *v28;
    *(_DWORD *)(v35 + 196) = *((_DWORD *)v4 + 37);
    *(void *)(v35 + 200) = v31;
    sub_21E4158F0((uint64_t)&v138);
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_21E415840();
    sub_21E415894();
    uint64_t v41 = v92;
    sub_21E41F500();
    swift_release();
    uint64_t v42 = sub_21E3FD70C(&qword_267D2BA88, &qword_267D2BA90);
    uint64_t v131 = WitnessTable;
    uint64_t v132 = v42;
    uint64_t v43 = v108;
    uint64_t v44 = swift_getWitnessTable();
    uint64_t v45 = v103;
    sub_21E4095DC(v41, v43, v44);
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
    v46(v41, v43);
    sub_21E4095DC(v45, v43, v44);
    uint64_t v47 = sub_21E3FD70C(qword_267D2BD50, &qword_267D2BD38);
    uint64_t v129 = v44;
    uint64_t v130 = v47;
    uint64_t v48 = swift_getWitnessTable();
    unint64_t v49 = sub_21E401E30();
    uint64_t v127 = v48;
    unint64_t v128 = v49;
    uint64_t v50 = v107;
    swift_getWitnessTable();
    sub_21E413014(v41, v50, v43);
    v46(v41, v43);
    v46((uint64_t)v45, v43);
  }
  else
  {
    long long v51 = v4[5];
    long long v142 = v4[4];
    long long v143 = v51;
    long long v144 = v4[6];
    long long v52 = v4[1];
    long long v138 = *v4;
    long long v139 = v52;
    long long v53 = v4[3];
    long long v140 = v4[2];
    long long v141 = v53;
    uint64_t v145 = v24;
    uint64_t v146 = v23;
    uint64_t v147 = v25;
    uint64_t v148 = v26;
    char v149 = v30;
    *(_DWORD *)long long v150 = *v28;
    *(_DWORD *)&v150[3] = *((_DWORD *)v4 + 37);
    uint64_t v151 = v31;
    v137 &= 1u;
    sub_21E414A18((uint64_t)&v133);
    long long v92 = v133;
    uint64_t v90 = *((void *)&v134 + 1);
    uint64_t v91 = v134;
    int v89 = v135;
    long long v54 = v4[5];
    long long v142 = v4[4];
    long long v143 = v54;
    long long v144 = v4[6];
    long long v55 = v4[1];
    long long v138 = *v4;
    long long v139 = v55;
    long long v56 = v4[3];
    long long v140 = v4[2];
    long long v141 = v56;
    uint64_t v145 = v24;
    uint64_t v146 = v23;
    uint64_t v147 = v25;
    uint64_t v148 = v26;
    char v149 = v30;
    *(_DWORD *)long long v150 = *v28;
    *(_DWORD *)&v150[3] = *((_DWORD *)v4 + 37);
    uint64_t v151 = v31;
    uint64_t v57 = swift_allocObject();
    long long v58 = *(_OWORD *)(v101 + 32);
    *(_OWORD *)(v57 + 16) = *(_OWORD *)(v101 + 16);
    *(_OWORD *)(v57 + 32) = v58;
    long long v59 = v4[5];
    *(_OWORD *)(v57 + 112) = v4[4];
    *(_OWORD *)(v57 + 128) = v59;
    *(_OWORD *)(v57 + 144) = v4[6];
    long long v60 = v4[1];
    *(_OWORD *)(v57 + 48) = *v4;
    *(_OWORD *)(v57 + 64) = v60;
    long long v61 = v4[3];
    *(_OWORD *)(v57 + 80) = v4[2];
    *(_OWORD *)(v57 + 96) = v61;
    *(void *)(v57 + 160) = v24;
    *(void *)(v57 + 168) = v23;
    *(void *)(v57 + 176) = v25;
    *(void *)(v57 + 184) = v26;
    *(unsigned char *)(v57 + 192) = v30;
    *(_DWORD *)(v57 + 193) = *v28;
    *(_DWORD *)(v57 + 196) = *((_DWORD *)v4 + 37);
    *(void *)(v57 + 200) = v31;
    sub_21E4158F0((uint64_t)&v138);
    uint64_t v62 = swift_getWitnessTable();
    sub_21E415840();
    sub_21E415894();
    uint64_t v63 = v103;
    sub_21E41F500();
    swift_release();
    uint64_t v64 = v96;
    sub_21E41F080();
    long long v138 = v133;
    long long v139 = v134;
    LOBYTE(v140) = v135;
    uint64_t v65 = sub_21E3FD70C(&qword_267D2BA88, &qword_267D2BA90);
    uint64_t v117 = v62;
    uint64_t v118 = v65;
    uint64_t v66 = v108;
    uint64_t v67 = swift_getWitnessTable();
    sub_21E40D5D4();
    unint64_t v68 = v93;
    sub_21E41F4E0();
    (*(void (**)(unsigned char *, uint64_t))(v98 + 8))(v64, v99);
    (*(void (**)(unsigned char *, uint64_t))(v104 + 8))(v63, v66);
    long long v138 = v92;
    *(void *)&long long v139 = v91;
    *((void *)&v139 + 1) = v90;
    LOBYTE(v140) = v89;
    sub_21E401A18((uint64_t)&v133, (uint64_t)v136);
    sub_21E401AB8((uint64_t)v136, (void (*)(void, void, void, void, void))sub_21E401A74);
    uint64_t v69 = sub_21E3FD70C(qword_267D2BD50, &qword_267D2BD38);
    uint64_t v115 = v67;
    uint64_t v116 = v69;
    uint64_t v70 = v112;
    uint64_t v71 = swift_getWitnessTable();
    uint64_t v72 = (uint64_t)v94;
    View.complicationContainerPath(_:)((uint64_t)&v138, v70, v71);
    sub_21E401AB8((uint64_t)&v133, (void (*)(void, void, void, void, void))sub_21E401AF8);
    (*(void (**)(unsigned char *, uint64_t))(v95 + 8))(v68, v70);
    unint64_t v73 = sub_21E401E30();
    uint64_t v113 = v71;
    unint64_t v114 = v73;
    uint64_t v74 = v107;
    uint64_t v75 = swift_getWitnessTable();
    __n128 v76 = v97;
    sub_21E4095DC(v72, v74, v75);
    uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v100 + 8);
    v77(v72, v74);
    sub_21E4095DC(v76, v74, v75);
    sub_21E412F1C(v72, v74);
    sub_21E401AB8((uint64_t)&v133, (void (*)(void, void, void, void, void))sub_21E401AF8);
    v77(v72, v74);
    v77((uint64_t)v76, v74);
  }
  uint64_t v78 = swift_getWitnessTable();
  uint64_t v79 = sub_21E3FD70C(&qword_267D2BA88, &qword_267D2BA90);
  uint64_t v125 = v78;
  uint64_t v126 = v79;
  uint64_t v80 = swift_getWitnessTable();
  uint64_t v81 = sub_21E3FD70C(qword_267D2BD50, &qword_267D2BD38);
  uint64_t v123 = v80;
  uint64_t v124 = v81;
  uint64_t v82 = swift_getWitnessTable();
  unint64_t v83 = sub_21E401E30();
  uint64_t v121 = v82;
  unint64_t v122 = v83;
  uint64_t v119 = swift_getWitnessTable();
  uint64_t v120 = v80;
  uint64_t v84 = v106;
  uint64_t v85 = swift_getWitnessTable();
  v86 = v111;
  sub_21E4095DC(v111, v84, v85);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v105 + 8))(v86, v84);
}

uint64_t sub_21E4157D8(uint64_t *a1)
{
  uint64_t v1 = a1[3];
  char v2 = *((unsigned char *)a1 + 32);
  uint64_t v4 = *a1;
  long long v5 = *(_OWORD *)(a1 + 1);
  uint64_t v6 = v1;
  char v7 = v2;
  type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
  return sub_21E414AE8((unsigned int *)&v4);
}

unint64_t sub_21E415840()
{
  unint64_t result = qword_267D2C060;
  if (!qword_267D2C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C060);
  }
  return result;
}

unint64_t sub_21E415894()
{
  unint64_t result = qword_267D2C068;
  if (!qword_267D2C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C068);
  }
  return result;
}

uint64_t sub_21E4158F0(uint64_t a1)
{
  char v2 = *(void **)(a1 + 64);
  unsigned int v3 = *(void **)(a1 + 104);
  swift_retain();
  swift_retain();
  id v4 = v2;
  swift_bridgeObjectRetain();
  id v5 = v3;
  return a1;
}

uint64_t objectdestroyTm()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 208, 7);
}

uint64_t sub_21E4159AC(uint64_t *a1)
{
  return sub_21E4157D8(a1);
}

uint64_t sub_21E4159D0(uint64_t a1)
{
  char v2 = *(void **)(a1 + 64);
  unsigned int v3 = *(void **)(a1 + 104);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return a1;
}

uint64_t sub_21E415A34(uint64_t a1)
{
  char v2 = *(void **)(a1 + 64);
  unsigned int v3 = *(void **)(a1 + 104);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return a1;
}

void *sub_21E415AB0(void *a1)
{
  char v2 = (void *)a1[8];
  unsigned int v3 = (void *)a1[13];
  id v4 = (void *)a1[25];
  uint64_t v6 = (void *)a1[30];
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return a1;
}

void *sub_21E415B78(void *a1)
{
  char v2 = (void *)a1[8];
  unsigned int v3 = (void *)a1[13];
  id v4 = (void *)a1[25];
  uint64_t v10 = (void *)a1[30];
  swift_retain();
  swift_retain();
  id v5 = v2;
  swift_bridgeObjectRetain();
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v7 = v4;
  swift_bridgeObjectRetain();
  id v8 = v10;
  return a1;
}

uint64_t sub_21E415C40()
{
  return swift_getWitnessTable();
}

uint64_t EnvironmentValues._complicationInvertsAccentFilterStyle.getter()
{
  sub_21E415E5C();
  sub_21E41F140();
  return v1;
}

unint64_t sub_21E415E5C()
{
  unint64_t result = qword_267D2C090;
  if (!qword_267D2C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C090);
  }
  return result;
}

uint64_t sub_21E415EB0@<X0>(unsigned char *a1@<X8>)
{
  sub_21E415E5C();
  uint64_t result = sub_21E41F140();
  *a1 = v3;
  return result;
}

uint64_t sub_21E415F00()
{
  return sub_21E41F150();
}

uint64_t EnvironmentValues._complicationInvertsAccentFilterStyle.setter()
{
  return sub_21E41F150();
}

void sub_21E415F88(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_21E415F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D510]);
}

uint64_t (*EnvironmentValues._complicationInvertsAccentFilterStyle.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_21E415E5C();
  sub_21E41F140();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_21E416010;
}

uint64_t sub_21E416010(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_21E41F150();
}

uint64_t sub_21E416048@<X0>(unsigned char *a1@<X8>)
{
  sub_21E415E5C();
  uint64_t result = sub_21E41F140();
  *a1 = v3;
  return result;
}

uint64_t sub_21E416098()
{
  return sub_21E41F150();
}

ValueMetadata *_s39ComplicationInvertsAccentFilterStyleKeyVMa()
{
  return &_s39ComplicationInvertsAccentFilterStyleKeyVN;
}

uint64_t sub_21E4160F4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21E41611C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_21E416144@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, id a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (uint64_t *)(a5 + *(int *)(type metadata accessor for ComplicationCurvedTextViewRepresentable() + 32));
  *uint64_t v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
  uint64_t result = swift_storeEnumTagMultiPayload();
  long long v12 = a1[3];
  *(_OWORD *)(a5 + 32) = a1[2];
  *(_OWORD *)(a5 + 48) = v12;
  long long v13 = a1[5];
  *(_OWORD *)(a5 + 64) = a1[4];
  *(_OWORD *)(a5 + 80) = v13;
  long long v14 = a1[1];
  *(_OWORD *)a5 = *a1;
  *(_OWORD *)(a5 + 16) = v14;
  *(void *)(a5 + 112) = a2;
  *(void *)(a5 + 96) = a3;
  if (!a4)
  {
    id v15 = objc_allocWithZone((Class)type metadata accessor for MonochromeModel());
    swift_retain();
    id v16 = objc_msgSend(v15, sel_init);
    swift_getKeyPath();
    swift_getKeyPath();
    id v17 = v16;
    sub_21E41EEE0();
    sub_21E41F5A0();
    swift_getKeyPath();
    swift_getKeyPath();
    id v18 = v17;
    sub_21E41EEE0();
    sub_21E41F5A0();
    swift_getKeyPath();
    swift_getKeyPath();
    a4 = v18;
    sub_21E41EEE0();
    uint64_t result = swift_release();
  }
  *(void *)(a5 + 104) = a4;
  return result;
}

void ComplicationCurvedTextConfiguration.ContentProvider.init(_:)(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = *a1;
  id v4 = objc_msgSend(*a1, sel_textProvider);
  id v5 = v4;
  id v6 = objc_msgSend(v3, sel_imageProvider);

  *a2 = v4;
  a2[1] = v6;
}

id ComplicationCurvedTextConfiguration.ContentProvider.labelProvider.getter@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, *v1, v1[1]);
  *a1 = result;
  return result;
}

uint64_t sub_21E4163C8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

char *sub_21E41640C()
{
  uint64_t v1 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  id v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CenteringCurvedTextView()), sel_init);
  uint64_t v5 = OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView;
  id v6 = *(void **)&v4[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_21E3FF84C(v0, (uint64_t)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  sub_21E418E60((uint64_t)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  aBlock[4] = sub_21E418EC4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21E4163C8;
  aBlock[3] = &block_descriptor_4;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v6;
  swift_release();
  objc_msgSend(v11, sel_setNeedsResizeHandler_, v10);
  _Block_release(v10);

  long long v12 = *(void **)&v4[v5];
  objc_msgSend(v12, sel_setUppercase_, 1);
  objc_msgSend(v12, sel_setUsesLegibility_, 0);
  return v4;
}

void sub_21E41660C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (char *)MEMORY[0x223C270B0](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_layoutSubviews);
    sub_21E416674(v3);
  }
}

uint64_t sub_21E416674(char *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  id v4 = objc_msgSend(v3, sel_path);

  if (v4)
  {
    CGFloat v5 = *(double *)(v1 + 112);
    goto LABEL_12;
  }
  v33.a = 0.0;
  v33.b = 0.0;
  double v29 = 0.0;
  v28[0] = 0.0;
  objc_msgSend(v3, sel_getTextCenter_startAngle_endAngle_, &v33, &v29, v28);
  double v6 = v29;
  double v7 = v28[0];
  if (v29 >= v28[0]) {
    goto LABEL_6;
  }
  float v8 = v29;
  float v9 = v28[0];
  if (v8 > v9)
  {
    __break(1u);
LABEL_6:
    float v8 = v7;
    float v9 = v6;
    if (v8 > v9) {
      __break(1u);
    }
  }
  CGFloat v5 = *(double *)(v1 + 112);
  swift_getKeyPath();
  sub_21E418B3C((unint64_t *)&qword_267D2BD00, (void (*)(uint64_t))type metadata accessor for ComplicationCurvedTextMetricsObservable);
  sub_21E41EE30();
  swift_release();
  if (*(float *)(*(void *)&v5 + 16) != v8 || *(float *)(*(void *)&v5 + 20) != v9)
  {
    swift_getKeyPath();
    sub_21E41EE30();
    swift_release();
    swift_getKeyPath();
    sub_21E41EE50();
    swift_release();
    *(float *)(*(void *)&v5 + 16) = v8;
    *(float *)(*(void *)&v5 + 20) = v9;
    swift_getKeyPath();
    sub_21E41EE40();
    swift_release();
  }
LABEL_12:
  swift_getKeyPath();
  v33.a = v5;
  sub_21E418B3C((unint64_t *)&qword_267D2BD00, (void (*)(uint64_t))type metadata accessor for ComplicationCurvedTextMetricsObservable);
  sub_21E41EE30();
  swift_release();
  unsigned int v11 = *(_DWORD *)(*(void *)&v5 + 16);
  unsigned int v12 = *(_DWORD *)(*(void *)&v5 + 20);
  char v13 = *(unsigned char *)(*(void *)&v5 + 48);
  objc_msgSend(v3, sel_centerForImage);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  objc_msgSend(v3, sel_transformForImage);
  v35.CGFloat x = v15;
  v35.CGFloat y = v17;
  CGPoint v18 = CGPointApplyAffineTransform(v35, &v33);
  objc_msgSend(a1, sel_convertPoint_fromCoordinateSpace_, v3, v18.x, v18.y);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  objc_msgSend(v3, sel_transformForImage);
  long double v23 = atan2(v33.b, v33.a);
  *(void *)&v33.a = __PAIR64__(v12, v11);
  v33.b = v20;
  v33.c = v22;
  v33.d = v23;
  LOBYTE(v33.tx) = v13;
  swift_getKeyPath();
  double v29 = v5;
  sub_21E41EE30();
  swift_release();
  uint64_t v24 = *(void *)(*(void *)&v5 + 40);
  char v25 = *(unsigned char *)(*(void *)&v5 + 48);
  double v29 = *(double *)(*(void *)&v5 + 16);
  long long v30 = *(_OWORD *)(*(void *)&v5 + 24);
  uint64_t v31 = v24;
  char v32 = v25;
  uint64_t result = _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0((uint64_t)&v33, (uint64_t)&v29);
  if ((result & 1) == 0)
  {
    *(void *)&v33.a = __PAIR64__(v12, v11);
    v33.b = v20;
    v33.c = v22;
    v33.d = v23;
    LOBYTE(v33.tx) = v13;
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    double v29 = v5;
    sub_21E41EE20();
    return swift_release();
  }
  return result;
}

void sub_21E416AAC(char *a1)
{
  id v3 = objc_msgSend(self, sel_systemFontOfSize_weight_design_, *MEMORY[0x263EFCF58], *(float *)v1, *MEMORY[0x263F81828]);
  id v4 = objc_msgSend(v3, sel_CLKFontWithAlternativePunctuation);

  if (!v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v9 = objc_msgSend(v4, sel_CLKFontWithLooplessThaiFallback);

  if (!v9)
  {
LABEL_10:
    __break(1u);
    return;
  }
  CGFloat v5 = *(void **)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  objc_msgSend(v5, sel_setTracking_, *(float *)(v1 + 20));
  objc_msgSend(v5, sel_setFont_, v9);
  id v6 = sub_21E416CBC();
  objc_msgSend(v5, sel_setTextColor_, v6);

  if (*(void *)(v1 + 64))
  {
    objc_msgSend(v5, sel_setPath_);
    objc_msgSend(v5, sel_setTextAlignment_, qword_21E4242D8[*(char *)(v1 + 52)]);
    double v7 = (float *)(v1 + 56);
    float v8 = &selRef_setBaselineOffset_;
  }
  else
  {
    *(_OWORD *)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter] = *(_OWORD *)(v1 + 24);
    objc_msgSend(v5, sel_setInterior_, *(unsigned __int8 *)(v1 + 16));
    objc_msgSend(v5, sel_setImagePlacement_, *(unsigned __int8 *)(v1 + 72));
    objc_msgSend(v5, sel_setCircleRadius_, *(float *)(v1 + 40));
    objc_msgSend(v5, sel_setMaxAngularWidth_, *(float *)(v1 + 44));
    double v7 = (float *)(v1 + 48);
    float v8 = &selRef_setCenterAngle_;
  }
  objc_msgSend(v5, *v8, *v7);
  sub_21E416E14(a1);
  sub_21E416674(a1);
}

id sub_21E416CBC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E41EED0();
  swift_release();
  swift_release();
  if (v4 == 0.0)
  {
    uint64_t v0 = (void *)sub_21E41F570();
    if (v0)
    {
LABEL_3:
      id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithCGColor_, v0);

      return v1;
    }
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21E41EED0();
    swift_release();
    swift_release();
    uint64_t v0 = (void *)sub_21E41F570();
    swift_release();
    if (v0) {
      goto LABEL_3;
    }
  }
  id v3 = objc_msgSend(self, sel_whiteColor);
  return v3;
}

void sub_21E416E14(char *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v39 = *(void *)(v3 + 16);
  if (v39)
  {
    double v4 = self;
    CGFloat v5 = *(void **)&v2[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    uint64_t v37 = v1;
    long long v38 = v2;
    uint64_t v35 = v3;
    long long v36 = v4;
    while (1)
    {
      id v40 = *(id *)(v3 + 8 * v6 + 32);
      id v7 = objc_msgSend(v40, sel_imageProvider);
      if (v7)
      {
        type metadata accessor for WidgetNamedImageProvider(0);
        uint64_t v8 = swift_dynamicCastClass();
        if (v8)
        {
          uint64_t v9 = v8;
          id v10 = v7;
          id v11 = objc_msgSend(v5, sel_font);
          unsigned int v12 = (void **)(v9 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
          swift_beginAccess();
          char v13 = *v12;
          void *v12 = v11;
          uint64_t v1 = v37;
          uint64_t v2 = v38;

          double v14 = (void *)(v9 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
          swift_beginAccess();
          void *v14 = 2;
        }
      }
      id v15 = objc_msgSend(v5, sel_imageView);
      if (v15)
      {
        double v16 = v15;
        CGFloat v17 = (void *)swift_dynamicCastObjCProtocolConditional();
        if (!v17) {
      }
        }
      else
      {
        CGFloat v17 = 0;
      }
      if ((objc_msgSend(v4, sel_existingImageView_supportsImageProvider_, v17, v7) & 1) == 0)
      {
        id v18 = objc_msgSend(v4, sel_viewForImageProvider_, v7);
        objc_msgSend(v5, sel_setImageView_, v18);

        CGFloat v17 = v18;
      }
      if (v17)
      {
        type metadata accessor for WidgetNamedImageView();
        uint64_t v19 = swift_dynamicCastClass();
        if (v19)
        {
          uint64_t v20 = v19;
          swift_getKeyPath();
          swift_getKeyPath();
          id v21 = v17;
          sub_21E41EED0();
          swift_release();
          swift_release();
          *(void *)(v20 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_monochromeFraction) = v41;
          CGFloat v22 = *(void **)(v20 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
          if (v22 && (type metadata accessor for WidgetNamedImageProvider(0), (uint64_t v23 = swift_dynamicCastClass()) != 0))
          {
            uint64_t v24 = v23;
            char v25 = *(void **)(v20 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color);
            id v26 = v22;
            if (v25) {
              MEMORY[0x223C26050](v25);
            }
            swift_getObjectType();
            uint64_t v41 = v24;
            sub_21E418C34();
            id v27 = v22;
            swift_retain();
            sub_21E41F6E0();
            sub_21E41F1A0();

            swift_release();
          }
          else
          {
          }
          uint64_t v3 = v35;
          uint64_t v1 = v37;
          uint64_t v2 = v38;
        }
        id v28 = v17;
        id v29 = sub_21E416CBC();
        objc_msgSend(v28, sel_setColor_, v29);

        objc_msgSend(v28, sel_setImageProvider_, v7);
        double v4 = v36;
      }
      id v30 = objc_msgSend(v40, sel_textProvider);
      objc_msgSend(v5, sel_setTextProvider_, v30);
      if (!v7 || v30)
      {
        double v32 = *(float *)(v1 + 76);
      }
      else
      {
        uint64_t v31 = (void *)sub_21E41F790();
        objc_msgSend(v5, sel_setText_, v31);

        double v32 = 0.0;
      }
      objc_msgSend(v5, sel_setImagePadding_, v32);
      objc_msgSend(v2, sel_layoutSubviews);
      unsigned __int8 v33 = objc_msgSend(v5, sel_isTextTruncated);

      if ((v33 & 1) == 0) {
        break;
      }
      ++v6;

      if (v39 == v6)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v34 = *(void **)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
    objc_msgSend(v34, sel_setTextProvider_, 0);
  }
}

uint64_t sub_21E417308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21E418B3C((unint64_t *)&unk_267D2C0F0, (void (*)(uint64_t))type metadata accessor for ComplicationCurvedTextViewRepresentable);
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_21E41739C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21E418B3C((unint64_t *)&unk_267D2C0F0, (void (*)(uint64_t))type metadata accessor for ComplicationCurvedTextViewRepresentable);
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_21E417430()
{
}

uint64_t sub_21E4175C4()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_21E418F78;
  *(void *)(v3 + 24) = v2;
  void v8[4] = sub_21E418F90;
  v8[5] = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_21E41611C;
  void v8[3] = &block_descriptor_28;
  double v4 = _Block_copy(v8);
  id v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

id sub_21E417724(char *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for CenteringCurvedTextView();
  objc_msgSendSuper2(&v11, sel_layoutSubviews);
  uint64_t v2 = *(void **)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  id v3 = objc_msgSend(v2, sel_path);

  if (!v3)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    objc_msgSend(v2, sel_getTextCenter_startAngle_endAngle_, &v9, &v8, &v7);
    double v4 = *(double *)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter] - v9;
    double v5 = *(double *)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter + 8] - v10;
    objc_msgSend(v2, sel_frame);
    objc_msgSend(v2, sel_setFrame_, v4, v5);
  }
  return objc_msgSend(v2, sel_sizeToFit);
}

id sub_21E417890()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CenteringCurvedTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id ComplicationCurvedTextConfiguration.ContentProvider.textProvider.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

void ComplicationCurvedTextConfiguration.ContentProvider.textProvider.setter(void *a1)
{
  *id v1 = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.ContentProvider.textProvider.modify())()
{
  return nullsub_1;
}

void *ComplicationCurvedTextConfiguration.ContentProvider.imageProvider.getter()
{
  id v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void ComplicationCurvedTextConfiguration.ContentProvider.imageProvider.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.ContentProvider.imageProvider.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedTextConfiguration.ContentProvider.init(textProvider:imageProvider:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t type metadata accessor for CenteringCurvedTextView()
{
  return self;
}

void *_s15ContentProviderVwCP(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  double v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void _s15ContentProviderVwxx(uint64_t a1)
{
  id v2 = *(void **)(a1 + 8);
}

uint64_t _s15ContentProviderVwca(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  return a1;
}

uint64_t _s15ContentProviderVwta(uint64_t a1, _OWORD *a2)
{
  double v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t _s15ContentProviderVwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s15ContentProviderVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration.ContentProvider()
{
  return &type metadata for ComplicationCurvedTextConfiguration.ContentProvider;
}

void *sub_21E417BAC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(_DWORD *)(a1 + 20) = *((_DWORD *)a2 + 5);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    *(void *)(a1 + 40) = a2[5];
    *(_DWORD *)(a1 + 48) = *((_DWORD *)a2 + 12);
    *(unsigned char *)(a1 + 52) = *((unsigned char *)a2 + 52);
    *(_DWORD *)(a1 + 56) = *((_DWORD *)a2 + 14);
    id v5 = (void *)a2[8];
    *(void *)(a1 + 64) = v5;
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    *(_DWORD *)(a1 + 76) = *((_DWORD *)a2 + 19);
    *(_OWORD *)(a1 + 80) = *((_OWORD *)a2 + 5);
    id v6 = (void *)a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v6;
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = (void *)(a1 + v7);
    id v9 = (uint64_t *)((char *)a2 + v7);
    *(void *)(a1 + 112) = a2[14];
    swift_retain();
    id v10 = v5;
    swift_bridgeObjectRetain();
    id v11 = v6;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_21E41F060();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0C0);
        memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v8, v9, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
      }
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t sub_21E417E08(uint64_t a1, uint64_t a2)
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_21E41F060();
    uint64_t v8 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
    if (!result)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
      return v7(v4, v5);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_21E417F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v4 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v4;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  uint64_t v5 = *(void **)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_retain();
  id v9 = v4;
  swift_bridgeObjectRetain();
  id v10 = v5;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_21E41F060();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0C0);
      memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v7, v8, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
    }
  }
  else
  {
    void *v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_21E41815C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  uint64_t v6 = *(void **)(a1 + 64);
  uint64_t v7 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v7;
  id v8 = v7;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v9 = *(void **)(a2 + 104);
  id v10 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = v9;
  id v11 = v9;

  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 32);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)(a2 + v12);
    sub_21E4183C4(a1 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_21E41F060();
      uint64_t v16 = *(void *)(v15 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0C0);
        memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      }
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21E4183C4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E418424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v7 = *(int *)(a3 + 32);
  id v8 = (void *)(a1 + v7);
  id v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_21E41F060();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0C0);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v8, v9, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  return a1;
}

uint64_t sub_21E4185C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  long long v6 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);

  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 32);
    id v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_21E4183C4(a1 + v8);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_21E41F060();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0C0);
        memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_21E4187FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E418810);
}

uint64_t sub_21E418810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2C0C8);
    id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_21E4188C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E4188D8);
}

uint64_t sub_21E4188D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D2C0C8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCurvedTextViewRepresentable()
{
  uint64_t result = qword_267D2C0D8;
  if (!qword_267D2C0D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21E4189D0()
{
  sub_21E418A90();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_21E418A90()
{
  if (!qword_267D2C0E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C0C0);
    unint64_t v0 = sub_21E41EF20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267D2C0E8);
    }
  }
}

uint64_t sub_21E418AEC()
{
  return sub_21E418B3C((unint64_t *)&qword_267D2BA28, (void (*)(uint64_t))type metadata accessor for ComplicationCurvedTextViewRepresentable);
}

uint64_t sub_21E418B3C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E418B84(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0C0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_21E418FE8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_21E41F110();
}

double sub_21E418C10()
{
  *(void *)&double result = sub_21E4090A4(*(void *)(v0 + 16), *(void *)(v0 + 24)).n128_u64[0];
  return result;
}

unint64_t sub_21E418C34()
{
  unint64_t result = qword_267D2C100;
  if (!qword_267D2C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C100);
  }
  return result;
}

uint64_t sub_21E418C90()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E418CC8()
{
  uint64_t v1 = (int *)(type metadata accessor for ComplicationCurvedTextViewRepresentable() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_21E41F060();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_21E418E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21E418EC4()
{
  type metadata accessor for ComplicationCurvedTextViewRepresentable();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_21E41660C(v1);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_21E418F40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21E418F78()
{
  return sub_21E417724(*(char **)(v0 + 16));
}

uint64_t sub_21E418F80()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E418F90()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21E418FB8()
{
  return sub_21E41F100();
}

uint64_t sub_21E418FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C0C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id ApricotNamedImageProvider.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v3 = sub_21E41F3F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  id v8 = WidgetNamedImageProvider.init(_:)((uint64_t)v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id ApricotNamedImageProvider.init(_:)(uint64_t a1)
{
  uint64_t v2 = sub_21E41F3F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  id v6 = WidgetNamedImageProvider.init(_:)((uint64_t)v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

id WidgetNamedImageProvider.init(_:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font] = 0;
  *(void *)&v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale] = 2;
  v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize];
  *uint64_t v3 = 0;
  v3[1] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
  uint64_t v5 = sub_21E41F3F0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for WidgetNamedImageProvider(0);
  id v7 = objc_msgSendSuper2(&v12, sel_initPrivate);
  v11[4] = sub_21E41A1AC;
  void v11[5] = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_21E41A1F0;
  v11[3] = &block_descriptor_5;
  uint64_t v8 = _Block_copy(v11);
  id v9 = v7;
  objc_msgSend(v9, sel_setImageViewCreationHandler_, v8);
  _Block_release(v8);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v9;
}

uint64_t type metadata accessor for WidgetNamedImageProvider(uint64_t a1)
{
  return sub_21E41A290(a1, (uint64_t *)&unk_267D2C1F8);
}

id ApricotNamedImageProvider.__deallocating_deinit()
{
  return sub_21E41A8B0(0, (uint64_t (*)(void))type metadata accessor for ApricotNamedImageProvider);
}

uint64_t sub_21E419470@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  uint64_t v4 = sub_21E41F3F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_21E4194F4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  uint64_t v4 = sub_21E41F3F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_21E419580())()
{
  return j_j__swift_endAccess;
}

void *sub_21E4195DC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_21E41962C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_21E419680())()
{
  return j__swift_endAccess;
}

uint64_t sub_21E4196DC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21E419724(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_21E419770())()
{
  return j_j__swift_endAccess;
}

void sub_21E4197CC(double a1, double a2)
{
  uint64_t v3 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
  if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
  {
    uint64_t v4 = (double *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
    double *v4 = a1;
    v4[1] = a2;
    *(unsigned char *)(v2 + v3) = 1;
  }
}

uint64_t sub_21E4197F8()
{
  uint64_t v50 = sub_21E41EDF0();
  uint64_t v48 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v47 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_21E41F3D0();
  uint64_t v2 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v4 = (unsigned __int8 *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21E41F3F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v45 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v45 - v12;
  uint64_t v45 = v0;
  uint64_t v14 = v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  unint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v49(v13, v14, v5);
  sub_21E41F3E0();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v16 = v13;
  uint64_t v17 = v51;
  v15(v16, v5);
  int v18 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v2 + 88))(v4, v17);
  if (v18 == *MEMORY[0x263F1A390])
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v2 + 96))(v4, v17);
    uint64_t v20 = v47;
    uint64_t v19 = v48;
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v48 + 32))(v47, v4, v50);
    id v21 = (void *)sub_21E41EDE0();
    id v22 = (id)CLKUniqueBundle();

    v49(v11, v14, v5);
    sub_21E41F3A0();
    v15(v11, v5);
    uint64_t v23 = (void *)sub_21E41F790();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v23, v22, 0);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v50);
  }
  else
  {
    char v25 = v46;
    uint64_t v47 = v11;
    uint64_t v48 = v14;
    uint64_t v50 = v5;
    if (v18 == *MEMORY[0x263F1A398])
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v2 + 96))(v4, v17);
      int v26 = *v4;
      id v27 = v25;
      uint64_t v28 = v50;
      v49(v25, v48, v50);
      uint64_t v29 = sub_21E41F3B0();
      id v30 = v15;
      v15(v27, v28);
      if ((v29 & 0x100000000) != 0) {
        double v31 = 1.0;
      }
      else {
        double v31 = *(float *)&v29;
      }
      uint64_t v32 = v45;
      unsigned __int8 v33 = (uint64_t *)(v45 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
      swift_beginAccess();
      uint64_t v34 = *v33;
      if (v34)
      {
        uint64_t v35 = (void *)(v32 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
        swift_beginAccess();
        id v36 = objc_msgSend(self, sel_configurationWithFont_scale_, v34, *v35);
      }
      else
      {
        uint64_t v37 = (void *)(v32 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
        swift_beginAccess();
        id v36 = objc_msgSend(self, sel_configurationWithScale_, *v37);
      }
      long long v38 = v47;
      id v39 = v36;
      if (v26)
      {
        id v40 = self;
        uint64_t v41 = v50;
        v49(v38, v48, v50);
        sub_21E41F3A0();
        v30(v38, v41);
        uint64_t v42 = (void *)sub_21E41F790();
        swift_bridgeObjectRelease();
        id v24 = objc_msgSend(v40, sel_cd_internalSystemName_variableValue_withConfiguration_, v42, v39, v31);
      }
      else
      {
        sub_21E404F98(0, &qword_267D2C1E0);
        uint64_t v43 = v50;
        v49(v38, v48, v50);
        sub_21E41F3A0();
        v30(v38, v43);
        return sub_21E41F880();
      }
    }
    else
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v2 + 8))(v4, v17);
      return 0;
    }
  }
  return (uint64_t)v24;
}

uint64_t sub_21E419E30@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  uint64_t v4 = sub_21E41F3F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_21E419EB8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_21E41F3F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

void sub_21E41A080(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

id WidgetNamedImageProvider.__allocating_init(_:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return WidgetNamedImageProvider.init(_:)(a1);
}

char *sub_21E41A1AC(double a1, double a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for WidgetNamedImageView());
  return sub_21E41B5EC(a1, a2);
}

id sub_21E41A1F0(uint64_t a1, double a2, double a3)
{
  id v5 = *(uint64_t (**)(uint64_t, double, double))(a1 + 32);
  uint64_t v6 = swift_retain();
  uint64_t v7 = (void *)v5(v6, a2, a3);
  swift_release();
  return v7;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t type metadata accessor for ApricotNamedImageProvider(uint64_t a1)
{
  return sub_21E41A290(a1, (uint64_t *)&unk_267D2C1E8);
}

uint64_t sub_21E41A290(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

__n128 sub_21E41A374@<Q0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21E41F3F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = (objc_class *)type metadata accessor for WidgetNamedImageProvider(0);
  id v10 = objc_allocWithZone(v9);
  uint64_t v11 = WidgetNamedImageProvider.init(_:)((uint64_t)v7);
  uint64_t v12 = (void **)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  uint64_t v13 = *v12;
  uint64_t v14 = (void **)&v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font];
  swift_beginAccess();
  uint64_t v15 = *v14;
  void *v14 = v13;
  id v16 = v13;

  uint64_t v17 = (uint64_t *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  swift_beginAccess();
  uint64_t v18 = *v17;
  uint64_t v19 = &v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale];
  swift_beginAccess();
  *uint64_t v19 = v18;
  v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized] = *(unsigned char *)(v2
                                                                                            + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized);
  __n128 result = *(__n128 *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  *(__n128 *)&v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize] = result;
  a1[3] = v9;
  *a1 = v11;
  return result;
}

double sub_21E41A5BC()
{
  return *(double *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
}

id WidgetNamedImageProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WidgetNamedImageProvider.init()()
{
}

id WidgetNamedImageProvider.__allocating_init(jsonObjectRepresentation:bundle:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_21E41F770();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONObjectRepresentation_bundle_, v5, a2);

  return v6;
}

void WidgetNamedImageProvider.init(jsonObjectRepresentation:bundle:)()
{
}

id WidgetNamedImageProvider.__allocating_init(private:)()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_initPrivate);
}

void WidgetNamedImageProvider.init(private:)()
{
}

id WidgetNamedImageProvider.__allocating_init(foregroundAccentImage:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithForegroundAccentImage_, a1);

  return v3;
}

void WidgetNamedImageProvider.init(foregroundAccentImage:)()
{
}

id WidgetNamedImageProvider.__deallocating_deinit()
{
  return sub_21E41A8B0(0, (uint64_t (*)(void))type metadata accessor for WidgetNamedImageProvider);
}

id sub_21E41A8B0(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_21E41A8F0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  objc_super v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_21E41A958@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21E41A9AC(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

uint64_t sub_21E41A9FC()
{
  return type metadata accessor for ApricotNamedImageProvider(0);
}

uint64_t sub_21E41AA04()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_21E41AABC()
{
  return type metadata accessor for WidgetNamedImageProvider(0);
}

uint64_t sub_21E41AAC4()
{
  uint64_t result = sub_21E41F3F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for WidgetNamedImageProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WidgetNamedImageProvider);
}

uint64_t dispatch thunk of WidgetNamedImageProvider.named.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.named.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.named.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.font.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.font.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.font.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.scale.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.scale.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.scale.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.finalize(maxSize:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.uiImage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t sub_21E41ADF0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v51 = a3;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C350);
  uint64_t v4 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  id v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C358);
  MEMORY[0x270FA5388](v49);
  uint64_t v50 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C360);
  MEMORY[0x270FA5388](v47);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C368);
  MEMORY[0x270FA5388](v42);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C370);
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (uint64_t)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C378);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C380);
  MEMORY[0x270FA5388](v44);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C388);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C390);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v46 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && (uint64_t v24 = a2[2]) != 0)
  {
    uint64_t v41 = v22;
    if (v24 == 2)
    {
      uint64_t v34 = a2[4];
      uint64_t v35 = a2[5];
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v11, v48, v52);
      id v36 = &v11[*(int *)(v42 + 36)];
      *(void *)id v36 = v34;
      *((void *)v36 + 1) = v35;
      sub_21E401958((uint64_t)v11, (uint64_t)v15, &qword_267D2C368);
      swift_storeEnumTagMultiPayload();
      sub_21E41E35C();
      sub_21E41E420();
      swift_retain();
      swift_retain();
      sub_21E41F2A0();
      sub_21E401958((uint64_t)v17, v45, &qword_267D2C380);
      swift_storeEnumTagMultiPayload();
      sub_21E41E320();
      sub_21E41E4E4();
      uint64_t v28 = (uint64_t)v46;
      sub_21E41F2A0();
      sub_21E4019BC((uint64_t)v17, &qword_267D2C380);
      uint64_t v29 = (uint64_t)v11;
      id v30 = &qword_267D2C368;
    }
    else if (v24 == 1)
    {
      uint64_t v25 = a2[4];
      uint64_t KeyPath = swift_getKeyPath();
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v20, v48, v52);
      id v27 = (uint64_t *)&v20[*(int *)(v18 + 36)];
      *id v27 = KeyPath;
      v27[1] = v25;
      sub_21E401958((uint64_t)v20, (uint64_t)v15, &qword_267D2C388);
      swift_storeEnumTagMultiPayload();
      sub_21E41E35C();
      sub_21E41E420();
      swift_retain();
      sub_21E41F2A0();
      sub_21E401958((uint64_t)v17, v45, &qword_267D2C380);
      swift_storeEnumTagMultiPayload();
      sub_21E41E320();
      sub_21E41E4E4();
      uint64_t v28 = (uint64_t)v46;
      sub_21E41F2A0();
      sub_21E4019BC((uint64_t)v17, &qword_267D2C380);
      uint64_t v29 = (uint64_t)v20;
      id v30 = &qword_267D2C388;
    }
    else
    {
      uint64_t v37 = a2[4];
      uint64_t v38 = a2[5];
      uint64_t v39 = a2[6];
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v48, v52);
      id v40 = &v9[*(int *)(v47 + 36)];
      *(void *)id v40 = v37;
      *((void *)v40 + 1) = v38;
      *((void *)v40 + 2) = v39;
      sub_21E401958((uint64_t)v9, v45, &qword_267D2C360);
      swift_storeEnumTagMultiPayload();
      sub_21E41E320();
      sub_21E41E4E4();
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v28 = (uint64_t)v46;
      sub_21E41F2A0();
      uint64_t v29 = (uint64_t)v9;
      id v30 = &qword_267D2C360;
    }
    sub_21E4019BC(v29, v30);
    sub_21E401958(v28, (uint64_t)v50, &qword_267D2C390);
    swift_storeEnumTagMultiPayload();
    sub_21E41E298(&qword_267D2C398, &qword_267D2C390, (void (*)(void))sub_21E41E320, (void (*)(void))sub_21E41E4E4);
    sub_21E3FD70C(&qword_267D2C3B0, &qword_267D2C350);
    sub_21E41F2A0();
    return sub_21E4019BC(v28, &qword_267D2C390);
  }
  else
  {
    double v31 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v32 = v52;
    v31(v6, v48, v52);
    v31(v50, (uint64_t)v6, v32);
    swift_storeEnumTagMultiPayload();
    sub_21E41E298(&qword_267D2C398, &qword_267D2C390, (void (*)(void))sub_21E41E320, (void (*)(void))sub_21E41E4E4);
    sub_21E3FD70C(&qword_267D2C3B0, &qword_267D2C350);
    sub_21E41F2A0();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v32);
  }
}

uint64_t sub_21E41B5E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21E41ADF0(a1, *v2, a2);
}

char *sub_21E41B5EC(double a1, double a2)
{
  *(void *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline] = 0;
  *(void *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider] = 0;
  *(void *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_monochromeFraction] = 0;
  *(void *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color] = 0;
  v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility] = 0;
  *(void *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor] = 0;
  uint64_t v5 = (double *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_maxSize];
  double *v5 = a1;
  v5[1] = a2;
  id v6 = v2;
  sub_21E41F6E0();
  uint64_t v7 = sub_21E41F380();
  swift_release();
  swift_getObjectType();
  sub_21E404F98(0, (unint64_t *)&unk_267D2BF30);
  uint64_t v8 = (void *)dynamic_cast_existential_1_superclass_unconditional(v7);
  uint64_t v9 = &v6[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController];
  *(void *)uint64_t v9 = v8;
  *((void *)v9 + 1) = v10;
  uint64_t result = (char *)objc_msgSend(v8, sel_view);
  if (result)
  {
    uint64_t v12 = result;
    id v13 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v13);

    v18.receiver = v6;
    v18.super_class = (Class)type metadata accessor for WidgetNamedImageView();
    uint64_t v14 = (char *)objc_msgSendSuper2(&v18, sel_initWithFrame_, 0.0, 0.0, a1, a2);
    uint64_t v15 = *(void **)&v14[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController];
    uint64_t v16 = v14;
    uint64_t result = (char *)objc_msgSend(v15, sel_view);
    if (result)
    {
      uint64_t v17 = result;
      objc_msgSend(v16, sel_addSubview_, result);

      return v16;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_21E41B808()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for WidgetNamedImageView();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  id v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController], sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v0, sel_bounds);
    CGRect v5 = CGRectOffset(v4, 0.0, *(CGFloat *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline]);
    objc_msgSend(v2, sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  }
  else
  {
    __break(1u);
  }
}

void sub_21E41B978(void *a1)
{
  uint64_t v2 = v1;
  objc_super v3 = *(void **)&v1[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider];
  if (a1)
  {
    if (v3) {
      BOOL v4 = a1 == v3;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      return;
    }
  }
  else if (!v3)
  {
    return;
  }
  type metadata accessor for WidgetNamedImageProvider(0);
  if (swift_dynamicCastClass())
  {
    id v11 = v3;
    sub_21E41BAC0();
    swift_getObjectType();
    sub_21E41F160();
    uint64_t v5 = 0;
    objc_msgSend(v2, sel_setBounds_, 0.0, 0.0, v6, v7);
    uint64_t v8 = (void *)sub_21E4197F8();
    if (v8)
    {
      uint64_t v9 = v8;
      objc_msgSend(v8, sel_cd_baselineOffsetFromBottom);
      uint64_t v5 = v10;
    }
    *(void *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline] = v5;
    objc_msgSend(v2, sel_setNeedsLayout);
  }
}

void sub_21E41BAC0()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
  if (v1)
  {
    type metadata accessor for WidgetNamedImageProvider(0);
    if (swift_dynamicCastClass())
    {
      uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color);
      id v3 = v1;
      if (v2) {
        MEMORY[0x223C26050](v2);
      }
      swift_getObjectType();
      sub_21E418C34();
      id v4 = v1;
      swift_retain();
      sub_21E41F6E0();
      sub_21E41F1A0();

      swift_release();
    }
  }
}

uint64_t sub_21E41BCB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v115 = a3;
  uint64_t v101 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2B0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E41F3D0();
  uint64_t v114 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v113 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2B8);
  MEMORY[0x270FA5388](v102);
  uint64_t v107 = (uint64_t *)((char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v108 = sub_21E41F610();
  uint64_t v106 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  uint64_t v105 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2C0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v103 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2C8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_21E41F3F0();
  uint64_t v118 = *(void *)(v18 - 8);
  uint64_t v119 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v111 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v92 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v92 - v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2D0);
  MEMORY[0x270FA5388](v26);
  uint64_t v116 = (uint64_t *)((char *)&v92 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2D8);
  MEMORY[0x270FA5388](v104);
  uint64_t v110 = (uint64_t)&v92 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2E0);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v109 = (uint64_t)&v92 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v112 = (uint64_t)&v92 - v32;
  if (!sub_21E41D6EC(a1))
  {
    swift_storeEnumTagMultiPayload();
    sub_21E41DBFC();
    return sub_21E41F2A0();
  }
  uint64_t v94 = v26;
  uint64_t v95 = v29;
  uint64_t v96 = v9;
  uint64_t v100 = (char *)a1;
  uint64_t v97 = v6;
  uint64_t v98 = v8;
  uint64_t v99 = a4;
  char v33 = v115;
  if ((v115 & 1) == 0)
  {
    uint64_t v34 = &v100[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
    swift_beginAccess();
    uint64_t v35 = v118;
    uint64_t v36 = v119;
    uint64_t v93 = *(void (**)(char *, char *, uint64_t))(v118 + 16);
    v93(v25, v34, v119);
    uint64_t v37 = sub_21E41F3C0();
    uint64_t v38 = *(void (**)(char *, uint64_t))(v35 + 8);
    v38(v25, v36);
    swift_bridgeObjectRelease();
    if (!v37) {
      goto LABEL_9;
    }
    uint64_t v39 = v34;
    uint64_t v40 = v119;
    v93(v23, v39, v119);
    uint64_t v41 = sub_21E41F3C0();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v38)(v23, v40);
    if (!v41)
    {
      __break(1u);
      return result;
    }
    uint64_t v43 = *(void *)(v41 + 16);
    swift_bridgeObjectRelease();
    if (!v43)
    {
LABEL_9:
      swift_retain();
      goto LABEL_10;
    }
  }
  uint64_t v44 = *MEMORY[0x263F1B510];
  uint64_t v45 = sub_21E41F600();
  uint64_t v46 = *(void *)(v45 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 104))(v17, v44, v45);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v17, 0, 1, v45);
  sub_21E41F5D0();
  sub_21E4019BC((uint64_t)v17, &qword_267D2C2C8);
  if ((v33 & 1) == 0)
  {
LABEL_10:
    uint64_t v49 = v100;
    uint64_t v50 = v102;
    uint64_t v51 = v101;
    uint64_t v52 = &v100[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
    swift_beginAccess();
    uint64_t v54 = v118;
    uint64_t v53 = v119;
    (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v25, v52, v119);
    uint64_t v47 = (uint64_t)v103;
    sub_21E41F390();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v25, v53);
    goto LABEL_11;
  }
  uint64_t v47 = (uint64_t)v103;
  sub_21E41F1B0();
  uint64_t v48 = sub_21E41F1C0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v47, 0, 1, v48);
  uint64_t v49 = v100;
  uint64_t v50 = v102;
  uint64_t v51 = v101;
LABEL_11:
  uint64_t v55 = sub_21E41F5F0();
  swift_release();
  sub_21E4019BC(v47, &qword_267D2C2C0);
  uint64_t v56 = sub_21E41C844((uint64_t)v49, v51, v33 & 1);
  uint64_t v57 = &v49[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale];
  swift_beginAccess();
  unint64_t v58 = *(void *)v57 - 1;
  uint64_t v59 = v94;
  if (v58 > 2) {
    long long v60 = (unsigned int *)MEMORY[0x263F1B540];
  }
  else {
    long long v60 = (unsigned int *)qword_2644A57B8[v58];
  }
  uint64_t v61 = v114;
  uint64_t v62 = v108;
  uint64_t v63 = v106;
  uint64_t v64 = v105;
  (*(void (**)(char *, void, uint64_t))(v106 + 104))(v105, *v60, v108);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v66 = *(int *)(v50 + 28);
  uint64_t v67 = v107;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))((char *)v107 + v66, v64, v62);
  *uint64_t v67 = KeyPath;
  uint64_t v68 = *(int *)(v59 + 36);
  uint64_t v69 = v116;
  sub_21E401958((uint64_t)v67, (uint64_t)v116 + v68, &qword_267D2C2B8);
  *uint64_t v69 = v55;
  v69[1] = v56;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21E4019BC((uint64_t)v67, &qword_267D2C2B8);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v62);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v70 = (id *)&v49[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font];
  swift_beginAccess();
  if (*v70)
  {
    id v71 = *v70;
    uint64_t v72 = sub_21E41F400();
  }
  else
  {
    uint64_t v72 = 0;
  }
  uint64_t v73 = v104;
  uint64_t v74 = (uint64_t)v98;
  uint64_t v75 = swift_getKeyPath();
  uint64_t v76 = (uint64_t)v116;
  uint64_t v77 = v110;
  sub_21E401958((uint64_t)v116, v110, &qword_267D2C2D0);
  uint64_t v78 = (uint64_t *)(v77 + *(int *)(v73 + 36));
  uint64_t *v78 = v75;
  v78[1] = v72;
  sub_21E4019BC(v76, &qword_267D2C2D0);
  uint64_t v79 = &v49[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
  swift_beginAccess();
  uint64_t v81 = v118;
  uint64_t v80 = v119;
  uint64_t v82 = v111;
  (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v111, v79, v119);
  unint64_t v83 = v113;
  sub_21E41F3E0();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v80);
  uint64_t v84 = v96;
  LOBYTE(v82) = (*(unsigned int (**)(char *, uint64_t))(v61 + 88))(v83, v96) != *MEMORY[0x263F1A390];
  (*(void (**)(char *, uint64_t))(v61 + 8))(v83, v84);
  objc_msgSend(v49, sel_maxSize);
  uint64_t v86 = v85;
  uint64_t v88 = v87;
  uint64_t v89 = v109;
  sub_21E401958(v77, v109, &qword_267D2C2D8);
  uint64_t v90 = v89 + *(int *)(v95 + 36);
  *(unsigned char *)uint64_t v90 = (_BYTE)v82;
  *(void *)(v90 + 8) = v86;
  *(void *)(v90 + 16) = v88;
  *(unsigned char *)(v90 + 24) = 0;
  sub_21E4019BC(v77, &qword_267D2C2D8);
  uint64_t v91 = v112;
  sub_21E41DF5C(v89, v112);
  sub_21E401958(v91, v74, &qword_267D2C2E0);
  swift_storeEnumTagMultiPayload();
  sub_21E41DBFC();
  sub_21E41F2A0();
  swift_release();
  return sub_21E4019BC(v91, &qword_267D2C2E0);
}

uint64_t sub_21E41C844(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_21E41F3F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = sub_21E41F3C0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (a3)
  {
    if (!a2) {
      return v11;
    }
    goto LABEL_12;
  }
  if (!v11)
  {
    if (!a2) {
      return 0;
    }
    goto LABEL_12;
  }
  if (*(void *)(v11 + 16)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = a2 == 0;
  }
  if (!v12)
  {
LABEL_12:
    swift_retain();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C338);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_21E422BD0;
    *(void *)(v13 + 32) = a2;
    uint64_t v15 = v13;
    sub_21E41F810();
    return v15;
  }
  return v11;
}

uint64_t sub_21E41C9DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21E41BCB0(*(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16), a1);
}

id sub_21E41CA18(uint64_t a1)
{
  return sub_21E41A8B0(a1, type metadata accessor for WidgetNamedImageView);
}

uint64_t type metadata accessor for WidgetNamedImageView()
{
  return self;
}

uint64_t sub_21E41CAC0@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  int v24 = a5;
  uint64_t v23 = a4;
  uint64_t v25 = a6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C3F8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C400);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C408);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v19(v12, a1, v9);
    v19(v15, (uint64_t)v12, v9);
    swift_storeEnumTagMultiPayload();
    sub_21E41E600();
    sub_21E3FD70C(&qword_267D2C428, &qword_267D2C3F8);
    sub_21E41F2A0();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    uint64_t v21 = v23;
    *(void *)uint64_t v18 = a3;
    *((void *)v18 + 1) = v21;
    v18[16] = v24 & 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(&v18[*(int *)(v16 + 44)], a1, v9);
    sub_21E401958((uint64_t)v18, (uint64_t)v15, &qword_267D2C408);
    swift_storeEnumTagMultiPayload();
    sub_21E41E600();
    sub_21E3FD70C(&qword_267D2C428, &qword_267D2C3F8);
    sub_21E41F2A0();
    return sub_21E4019BC((uint64_t)v18, &qword_267D2C408);
  }
}

uint64_t sub_21E41CDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v13[1] = a6;
  uint64_t v6 = sub_21E41EFB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E41F020();
  sub_21E41F070();
  char v15 = v10 & 1;
  char v14 = v11 & 1;
  sub_21E41EF90();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_21E41CF5C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v6;
  sub_21E41F010();
  sub_21E41EB24();
  sub_21E41F820();
  sub_21E41F840();
  uint64_t result = sub_21E41F830();
  if (result == 1) {
    return sub_21E41CDA0(a1, a2 & 1, a3, a4 & 1, a5, v12);
  }
  return result;
}

uint64_t sub_21E41D044(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_21E41E950(a9, a1, a2, a3, a4, a10, *v10);
}

uint64_t sub_21E41D058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_21E41D0C8(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B668]);
}

uint64_t sub_21E41D090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_21E41D0C8(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B670]);
}

uint64_t sub_21E41D0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_21E41D10C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_21E41EF00();
  return sub_21E41D17C;
}

void sub_21E41D17C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_21E41D1C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21E41CAC0(a1, *(unsigned char *)v2, *(void *)(v2 + 8), *(void *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), a2);
}

uint64_t sub_21E41D1D8(uint64_t a1)
{
  uint64_t v2 = sub_21E41F610();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21E41F0B0();
}

void sub_21E41D2A0()
{
  *(void *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_monochromeFraction] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color] = 0;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor] = 0;

  sub_21E41F920();
  __break(1u);
}

void sub_21E41D348(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color);
  *(void *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color) = a1;
  id v4 = a1;

  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
  if (v5)
  {
    type metadata accessor for WidgetNamedImageProvider(0);
    if (swift_dynamicCastClass())
    {
      uint64_t v6 = *(void **)(v1 + v2);
      id v7 = v5;
      if (v6) {
        MEMORY[0x223C26050](v6);
      }
      swift_getObjectType();
      sub_21E418C34();
      id v8 = v5;
      swift_retain();
      sub_21E41F6E0();
      sub_21E41F1A0();

      swift_release();
    }
  }
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t destroy for WidgetNamedImageView.NamedImageView(id *a1)
{
  return swift_release();
}

uint64_t _s19ComplicationDisplay20WidgetNamedImageViewC14NamedImageViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WidgetNamedImageView.NamedImageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for WidgetNamedImageView.NamedImageView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetNamedImageView.NamedImageView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetNamedImageView.NamedImageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetNamedImageView.NamedImageView()
{
  return &type metadata for WidgetNamedImageView.NamedImageView;
}

uint64_t sub_21E41D6D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E41D6EC(uint64_t a1)
{
  uint64_t v2 = sub_21E41F5C0();
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v41 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_21E41EDF0();
  uint64_t v40 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v39 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_21E41F3D0();
  uint64_t v5 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  id v7 = (unsigned __int8 *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21E41F3F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v38 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v37 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v37 - v15;
  uint64_t v17 = a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18(v16, v17, v8);
  uint64_t v45 = sub_21E41F3A0();
  uint64_t v46 = v19;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v16, v8);
  v18(v14, v17, v8);
  sub_21E41F3E0();
  uint64_t v21 = v47;
  v20(v14, v8);
  int v22 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v5 + 88))(v7, v21);
  if (v22 == *MEMORY[0x263F1A390])
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 96))(v7, v21);
    int v24 = v39;
    uint64_t v23 = v40;
    uint64_t v25 = v42;
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v40 + 32))(v39, v7, v42);
    uint64_t v26 = (void *)sub_21E41EDE0();
    id v27 = (id)CLKUniqueBundle();

    id v28 = v27;
    sub_21E41F630();
    uint64_t v30 = v43;
    uint64_t v29 = v44;
    uint64_t v31 = v41;
    (*(void (**)(char *, void, uint64_t))(v43 + 104))(v41, *MEMORY[0x263F1B4B8], v44);
    uint64_t v32 = sub_21E41F620();

    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v29);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
  }
  else
  {
    char v33 = v38;
    if (v22 == *MEMORY[0x263F1A398])
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 96))(v7, v21);
      int v34 = *v7;
      v18(v33, v17, v8);
      sub_21E41F3B0();
      v20(v33, v8);
      if (v34 == 1) {
        return sub_21E41F5E0();
      }
      else {
        return sub_21E41F5B0();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(v7, v21);
      return 0;
    }
  }
  return v32;
}

unint64_t sub_21E41DBFC()
{
  unint64_t result = qword_267D2C2E8;
  if (!qword_267D2C2E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C2E0);
    sub_21E41DC78();
    sub_21E41DE88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C2E8);
  }
  return result;
}

unint64_t sub_21E41DC78()
{
  unint64_t result = qword_267D2C2F0;
  if (!qword_267D2C2F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C2D8);
    sub_21E41DD18();
    sub_21E3FD70C(&qword_267D2C320, &qword_267D2C328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C2F0);
  }
  return result;
}

unint64_t sub_21E41DD18()
{
  unint64_t result = qword_267D2C2F8;
  if (!qword_267D2C2F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C2D0);
    sub_21E41DDB8();
    sub_21E3FD70C(&qword_267D2C318, &qword_267D2C2B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C2F8);
  }
  return result;
}

unint64_t sub_21E41DDB8()
{
  unint64_t result = qword_267D2C300;
  if (!qword_267D2C300)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C308);
    sub_21E41DE34();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C300);
  }
  return result;
}

unint64_t sub_21E41DE34()
{
  unint64_t result = qword_267D2C310;
  if (!qword_267D2C310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C310);
  }
  return result;
}

unint64_t sub_21E41DE88()
{
  unint64_t result = qword_267D2C330;
  if (!qword_267D2C330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C330);
  }
  return result;
}

uint64_t sub_21E41DEDC()
{
  return sub_21E41F0A0();
}

uint64_t sub_21E41DF04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E41F120();
  *a1 = result;
  return result;
}

uint64_t sub_21E41DF30()
{
  return sub_21E41F130();
}

uint64_t sub_21E41DF5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2C2E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for _ShrinkToFitModifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[25]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for _ShrinkToFitModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _ShrinkToFitModifier()
{
  return &type metadata for _ShrinkToFitModifier;
}

void *initializeBufferWithCopyOfBuffer for MetadataForegroundColorsModifier(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MetadataForegroundColorsModifier()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for MetadataForegroundColorsModifier(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for MetadataForegroundColorsModifier(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MetadataForegroundColorsModifier(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MetadataForegroundColorsModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MetadataForegroundColorsModifier()
{
  return &type metadata for MetadataForegroundColorsModifier;
}

unint64_t sub_21E41E1E4()
{
  unint64_t result = qword_267D2C340;
  if (!qword_267D2C340)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C348);
    sub_21E41DBFC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C340);
  }
  return result;
}

uint64_t sub_21E41E260()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E41E27C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E41E298(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E41E320()
{
  return sub_21E41E298(&qword_267D2C3A0, &qword_267D2C380, (void (*)(void))sub_21E41E35C, (void (*)(void))sub_21E41E420);
}

unint64_t sub_21E41E35C()
{
  unint64_t result = qword_267D2C3A8;
  if (!qword_267D2C3A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C388);
    sub_21E3FD70C(&qword_267D2C3B0, &qword_267D2C350);
    sub_21E3FD70C(&qword_267D2C3B8, &qword_267D2C3C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C3A8);
  }
  return result;
}

unint64_t sub_21E41E420()
{
  unint64_t result = qword_267D2C3C8;
  if (!qword_267D2C3C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C368);
    sub_21E3FD70C(&qword_267D2C3B0, &qword_267D2C350);
    sub_21E3FD70C(&qword_267D2C3D0, &qword_267D2C3D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C3C8);
  }
  return result;
}

unint64_t sub_21E41E4E4()
{
  unint64_t result = qword_267D2C3E0;
  if (!qword_267D2C3E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C360);
    sub_21E3FD70C(&qword_267D2C3B0, &qword_267D2C350);
    sub_21E3FD70C(&qword_267D2C3E8, &qword_267D2C3F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C3E0);
  }
  return result;
}

uint64_t sub_21E41E5A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E41F0C0();
  *a1 = result;
  return result;
}

uint64_t sub_21E41E5D4()
{
  return sub_21E41F0D0();
}

unint64_t sub_21E41E600()
{
  unint64_t result = qword_267D2C410;
  if (!qword_267D2C410)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C408);
    sub_21E3FD70C(&qword_267D2C418, &qword_267D2C420);
    sub_21E3FD70C(&qword_267D2C428, &qword_267D2C3F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C410);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for _ShrinkToFitModifier._ShrinkToFitLayout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for _ShrinkToFitModifier._ShrinkToFitLayout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for _ShrinkToFitModifier._ShrinkToFitLayout()
{
  return &type metadata for _ShrinkToFitModifier._ShrinkToFitLayout;
}

unint64_t sub_21E41E724()
{
  unint64_t result = qword_267D2C430;
  if (!qword_267D2C430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C438);
    sub_21E41E298(&qword_267D2C398, &qword_267D2C390, (void (*)(void))sub_21E41E320, (void (*)(void))sub_21E41E4E4);
    sub_21E3FD70C(&qword_267D2C3B0, &qword_267D2C350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C430);
  }
  return result;
}

unint64_t sub_21E41E800()
{
  unint64_t result = qword_267D2C440;
  if (!qword_267D2C440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D2C448);
    sub_21E41E600();
    sub_21E3FD70C(&qword_267D2C428, &qword_267D2C3F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C440);
  }
  return result;
}

unint64_t sub_21E41E8A4()
{
  unint64_t result = qword_267D2C450;
  if (!qword_267D2C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C450);
  }
  return result;
}

unint64_t sub_21E41E8FC()
{
  unint64_t result = qword_267D2C458;
  if (!qword_267D2C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C458);
  }
  return result;
}

uint64_t sub_21E41E950(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = sub_21E41EFB0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21E41F010();
  sub_21E41EB24();
  sub_21E41F820();
  sub_21E41F840();
  uint64_t result = sub_21E41F830();
  if (result == 1)
  {
    sub_21E41F020();
    sub_21E41F720();
    char v17 = 0;
    v16[0] = 0;
    sub_21E41CDA0(*(uint64_t *)&a4, 0, *(uint64_t *)&a5, 0, a1, a7);
    char v17 = 0;
    v16[0] = 0;
    sub_21E41EFA0();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return result;
}

unint64_t sub_21E41EB24()
{
  unint64_t result = qword_267D2C460;
  if (!qword_267D2C460)
  {
    sub_21E41F010();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2C460);
  }
  return result;
}

uint64_t sub_21E41EDD0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21E41EDE0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21E41EDF0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21E41EE00()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21E41EE10()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21E41EE20()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_21E41EE30()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_21E41EE40()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_21E41EE50()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_21E41EE60()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_21E41EE70()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_21E41EE80()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21E41EE90()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_21E41EEA0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_21E41EEB0()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_21E41EEC0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_21E41EED0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_21E41EEE0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_21E41EEF0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_21E41EF00()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_21E41EF10()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_21E41EF20()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_21E41EF30()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_21E41EF40()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_21E41EF50()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_21E41EF60()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_21E41EF70()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_21E41EF80()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_21E41EF90()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_21E41EFA0()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_21E41EFB0()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_21E41EFC0()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_21E41EFD0()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_21E41EFF0()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_21E41F000()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_21E41F010()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_21E41F020()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_21E41F030()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_21E41F040()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_21E41F050()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_21E41F060()
{
  return MEMORY[0x270F00470]();
}

uint64_t sub_21E41F070()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_21E41F080()
{
  return MEMORY[0x270F00720]();
}

uint64_t sub_21E41F090()
{
  return MEMORY[0x270F00738]();
}

uint64_t sub_21E41F0A0()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_21E41F0B0()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_21E41F0C0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_21E41F0D0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_21E41F0E0()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_21E41F0F0()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_21E41F100()
{
  return MEMORY[0x270F00AA8]();
}

uint64_t sub_21E41F110()
{
  return MEMORY[0x270F00AB0]();
}

uint64_t sub_21E41F120()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_21E41F130()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_21E41F140()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_21E41F150()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_21E41F160()
{
  return MEMORY[0x270F01398]();
}

uint64_t sub_21E41F170()
{
  return MEMORY[0x270F013A0]();
}

uint64_t sub_21E41F180()
{
  return MEMORY[0x270F013A8]();
}

uint64_t sub_21E41F190()
{
  return MEMORY[0x270F013B0]();
}

uint64_t sub_21E41F1A0()
{
  return MEMORY[0x270F013B8]();
}

uint64_t sub_21E41F1B0()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_21E41F1C0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_21E41F1D0()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_21E41F1E0()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_21E41F1F0()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_21E41F210()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_21E41F220()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_21E41F230()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_21E41F240()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_21E41F250()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_21E41F260()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_21E41F280()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_21E41F290()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_21E41F2A0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_21E41F2B0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_21E41F2C0()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_21E41F2D0()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_21E41F2E0()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_21E41F2F0()
{
  return MEMORY[0x270F01E98]();
}

uint64_t sub_21E41F300()
{
  return MEMORY[0x270F01EA0]();
}

uint64_t sub_21E41F310()
{
  return MEMORY[0x270F01EA8]();
}

uint64_t sub_21E41F320()
{
  return MEMORY[0x270F01EB0]();
}

uint64_t sub_21E41F330()
{
  return MEMORY[0x270F01EB8]();
}

uint64_t sub_21E41F340()
{
  return MEMORY[0x270F01EC0]();
}

uint64_t sub_21E41F350()
{
  return MEMORY[0x270F01EC8]();
}

uint64_t sub_21E41F360()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_21E41F370()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_21E41F380()
{
  return MEMORY[0x270F02258]();
}

uint64_t sub_21E41F390()
{
  return MEMORY[0x270F02590]();
}

uint64_t sub_21E41F3A0()
{
  return MEMORY[0x270F02598]();
}

uint64_t sub_21E41F3B0()
{
  return MEMORY[0x270F025A0]();
}

uint64_t sub_21E41F3C0()
{
  return MEMORY[0x270F025A8]();
}

uint64_t sub_21E41F3D0()
{
  return MEMORY[0x270F025B0]();
}

uint64_t sub_21E41F3E0()
{
  return MEMORY[0x270F025B8]();
}

uint64_t sub_21E41F3F0()
{
  return MEMORY[0x270F025C0]();
}

uint64_t sub_21E41F400()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_21E41F410()
{
  return MEMORY[0x270F02E20]();
}

uint64_t sub_21E41F420()
{
  return MEMORY[0x270F02E28]();
}

uint64_t sub_21E41F430()
{
  return MEMORY[0x270F02E68]();
}

uint64_t sub_21E41F440()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_21E41F450()
{
  return MEMORY[0x270F02EA0]();
}

uint64_t sub_21E41F460()
{
  return MEMORY[0x270F02ED8]();
}

uint64_t sub_21E41F470()
{
  return MEMORY[0x270F02EE0]();
}

uint64_t sub_21E41F480()
{
  return MEMORY[0x270F02EE8]();
}

uint64_t sub_21E41F490()
{
  return MEMORY[0x270F02F00]();
}

uint64_t sub_21E41F4A0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_21E41F4B0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_21E41F4C0()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_21E41F4D0()
{
  return MEMORY[0x270F03518]();
}

uint64_t sub_21E41F4E0()
{
  return MEMORY[0x270F03588]();
}

uint64_t sub_21E41F4F0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_21E41F500()
{
  return MEMORY[0x270F03A88]();
}

uint64_t sub_21E41F510()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_21E41F520()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_21E41F530()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_21E41F540()
{
  return MEMORY[0x270F041C0]();
}

uint64_t sub_21E41F550()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_21E41F560()
{
  return MEMORY[0x270F04350]();
}

uint64_t sub_21E41F570()
{
  return MEMORY[0x270F04368]();
}

uint64_t sub_21E41F580()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_21E41F590()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_21E41F5A0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_21E41F5B0()
{
  return MEMORY[0x270F04648]();
}

uint64_t sub_21E41F5C0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_21E41F5D0()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_21E41F5E0()
{
  return MEMORY[0x270F046B8]();
}

uint64_t sub_21E41F5F0()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_21E41F600()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_21E41F610()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_21E41F620()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_21E41F630()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_21E41F640()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_21E41F650()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_21E41F660()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_21E41F670()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_21E41F680()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_21E41F690()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_21E41F6A0()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_21E41F6B0()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_21E41F6C0()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_21E41F6D0()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_21E41F6E0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_21E41F6F0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_21E41F700()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_21E41F710()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_21E41F720()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_21E41F730()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_21E41F740()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21E41F750()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21E41F760()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21E41F770()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21E41F780()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21E41F790()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E41F7A0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21E41F7B0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21E41F7C0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21E41F7D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E41F7E0()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_21E41F7F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21E41F800()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21E41F810()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21E41F820()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_21E41F830()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_21E41F840()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_21E41F850()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21E41F860()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21E41F870()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_21E41F880()
{
  return MEMORY[0x270F82920]();
}

uint64_t sub_21E41F890()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21E41F8A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21E41F8B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21E41F8C0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21E41F8D0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21E41F8E0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21E41F8F0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21E41F900()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21E41F910()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21E41F920()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21E41F930()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21E41F950()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21E41F960()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E41F970()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E41F980()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21E41F990()
{
  return MEMORY[0x270F9FC90]();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x270EE7068](path1, path2);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return MEMORY[0x270EE3168]();
}

uint64_t CLKCompressFraction()
{
  return MEMORY[0x270EE3170]();
}

uint64_t CLKDegreesToRadians()
{
  return MEMORY[0x270EE3178]();
}

uint64_t CLKDeviceCategoryForSizeClass()
{
  return MEMORY[0x270EE3180]();
}

uint64_t CLKFloatEqualsFloat()
{
  return MEMORY[0x270EE3190]();
}

uint64_t CLKFloorForDevice()
{
  return MEMORY[0x270EE3198]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x270EE31B0]();
}

uint64_t CLKIsUVPreviewApp()
{
  return MEMORY[0x270EE31E8]();
}

uint64_t CLKLargeDialDiameterForDevice()
{
  return MEMORY[0x270EE31F8]();
}

uint64_t CLKPixelAlignRectForDevice()
{
  return MEMORY[0x270EE3218]();
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return MEMORY[0x270EE3228]();
}

uint64_t CLKRectGetCenter()
{
  return MEMORY[0x270EE3240]();
}

uint64_t CLKUIMonochromeFiltersForStyle()
{
  return MEMORY[0x270F16928]();
}

uint64_t CLKUIShadowImage()
{
  return MEMORY[0x270F16930]();
}

uint64_t CLKUIShadowImageFromView()
{
  return MEMORY[0x270F16938]();
}

uint64_t CLKUniqueBundle()
{
  return MEMORY[0x270EE3260]();
}

uint64_t CLKValueForLuxoDeviceMetrics()
{
  return MEMORY[0x270EE3268]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}