@interface LayoutConstants
@end

@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v4 scaledValue:63.0];
  _LayoutConstants___constants_0 = v2;
  [v4 scaledValue:91.0];
  _LayoutConstants___constants_1 = v3;
}

double ___LayoutConstants_block_invoke_0(uint64_t a1, void *a2)
{
  id v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  *(void *)&_LayoutConstants___constants = v3;
  CLKValueForLuxoDeviceMetrics();
  *((void *)&_LayoutConstants___constants + 1) = v4;
  CLKValueForLuxoDeviceMetrics();
  qword_267D2C4B0 = v5;
  CLKValueForLuxoDeviceMetrics();
  qword_267D2C4B8 = v6;
  CLKValueForLuxoDeviceMetrics();
  *(void *)&xmmword_267D2C4C0 = v7;
  CLKValueForLuxoDeviceMetrics();
  *((void *)&xmmword_267D2C4C0 + 1) = v8;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v11 = v9;

  _LayoutConstants___constantsXL = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constants, v11);
  xmmword_267D2C4E0 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_267D2C4B0, v11);
  xmmword_267D2C4F0 = xmmword_267D2C4C0;
  double result = v11 * *(double *)&xmmword_267D2C4C0;
  *(double *)&xmmword_267D2C4F0 = v11 * *(double *)&xmmword_267D2C4C0;
  return result;
}

void ___LayoutConstants_block_invoke_1(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v4 scaledValue:62.0];
  _LayoutConstants___constants_0_0 = v2;
  [v4 scaledValue:88.0];
  _LayoutConstants___constants_1_0 = v3;
}

void ___LayoutConstants_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_0_1 = v3;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_1_1 = v4;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_2 = v5;
  CLKValueForLuxoDeviceMetrics();
  uint64_t v7 = v6;

  _LayoutConstants___constants_3 = v7;
}

void ___LayoutConstants_block_invoke_3(uint64_t a1, uint64_t a2)
{
  v11[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:20.0];
  _LayoutConstants___constants_0_2 = v3;
  v10[0] = &unk_26CF5AFE8;
  v10[1] = &unk_26CF5B000;
  v11[0] = &unk_26CF5B3F0;
  v11[1] = &unk_26CF5B400;
  v10[2] = &unk_26CF5B018;
  v11[2] = &unk_26CF5B410;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v2 scaledValue:v4 withOverrides:20.5];
  _LayoutConstants___constants_1_2 = v5;

  v8[0] = &unk_26CF5B030;
  v8[1] = &unk_26CF5AFE8;
  v9[0] = &unk_26CF5B420;
  v9[1] = &unk_26CF5B430;
  v8[2] = &unk_26CF5B000;
  v8[3] = &unk_26CF5B018;
  v9[2] = &unk_26CF5B440;
  v9[3] = &unk_26CF5B450;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  [v2 scaledValue:v6 withOverrides:14.5];
  _LayoutConstants___constants_2_0 = v7;
}

void ___LayoutConstants_block_invoke_4(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v4 setRoundingBehavior:0];
  v9[0] = &unk_26CF5B048;
  v9[1] = &unk_26CF5B060;
  v10[0] = &unk_26CF5B460;
  v10[1] = &unk_26CF5B460;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 scaledValue:v5 withOverrides:1.5];
  _LayoutConstants___constantsGraphicRegular = v6;

  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v8 = v7;

  *(double *)&_LayoutConstants___constantsGraphicExtraLarge = v8
                                                            * *(double *)&_LayoutConstants___constantsGraphicRegular;
}

void ___LayoutConstants_block_invoke_5(uint64_t a1, void *a2)
{
  v29[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  v28[0] = &unk_26CF5B078;
  v28[1] = &unk_26CF5B090;
  v29[0] = &unk_26CF5B470;
  v29[1] = &unk_26CF5B480;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v4 scaledValue:v5 withOverrides:17.0];
  *(void *)&_LayoutConstants___constants_0 = v6;

  *((void *)&_LayoutConstants___constants_0 + 1) = 0x4043000000000000;
  qword_267D2C630 = CDCornerComplicationOuterUpperTextBaselineRadius(v3);
  qword_267D2C638 = CDCornerComplicationOuterLowerTextBaselineRadius(v3);
  [v4 scaledValue:11.0];
  *(void *)&xmmword_267D2C640 = v7;
  *((void *)&xmmword_267D2C640 + 1) = 0x4012000000000000;
  double v8 = CDCornerComplicationTopLeftCenterAngle(v3);

  qword_267D2C650 = *(void *)&v8;
  v26[0] = &unk_26CF5B078;
  v26[1] = &unk_26CF5B090;
  v27[0] = &unk_26CF5B490;
  v27[1] = &unk_26CF5B490;
  double v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v4 constantValue:v9 withOverrides:-60.0];
  qword_267D2C658 = v10;

  v24[0] = &unk_26CF5B078;
  v24[1] = &unk_26CF5B090;
  v25[0] = &unk_26CF5B4A0;
  v25[1] = &unk_26CF5B4A0;
  double v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v4 constantValue:v11 withOverrides:95.0];
  *(void *)&xmmword_267D2C660 = v12;

  v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 57.5, 12.5, &unk_26CF5B0A8);
  v23[0] = v13;
  v22[1] = &unk_26CF5B0C0;
  v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 55.5, 12.0);
  v23[1] = v14;
  v22[2] = &unk_26CF5B0D8;
  v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 62.5, 13.5);
  v23[2] = v15;
  v22[3] = &unk_26CF5B0F0;
  v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 62.5, 13.5);
  v23[3] = v16;
  v22[4] = &unk_26CF5B078;
  v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 57.5, 12.5);
  v23[4] = v17;
  v22[5] = &unk_26CF5B090;
  v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 62.5, 13.5);
  v23[5] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];
  objc_msgSend(v4, "scaledSize:withOverrides:", v19, 52.5, 11.5);
  *((void *)&xmmword_267D2C660 + 1) = v20;
  qword_267D2C670 = v21;
}

void ___LayoutConstants_block_invoke_6(uint64_t a1, void *a2)
{
  v29[6] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  *(void *)&_LayoutConstants___constants_1 = CDRichComplicationCornerInnerFontSize(v3);
  qword_267D2C6A8 = CDCornerComplicationInnerUpperTextBaselineRadius(v3);
  v28[0] = &unk_26CF5B108;
  v28[1] = &unk_26CF5B120;
  v29[0] = &unk_26CF5B4B0;
  v29[1] = &unk_26CF5B4C0;
  void v28[2] = &unk_26CF5B138;
  v28[3] = &unk_26CF5B150;
  v29[2] = &unk_26CF5B4D0;
  v29[3] = &unk_26CF5B4D0;
  v28[4] = &unk_26CF5B168;
  v28[5] = &unk_26CF5B180;
  void v29[4] = &unk_26CF5B4E0;
  v29[5] = &unk_26CF5B4F0;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  [v4 scaledValue:v5 withOverrides:86.5];
  *(void *)&xmmword_267D2C6B0 = v6;

  v26[0] = &unk_26CF5B168;
  v26[1] = &unk_26CF5B180;
  v27[0] = &unk_26CF5B500;
  v27[1] = &unk_26CF5B500;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v4 constantValue:v7 withOverrides:3.0];
  *((void *)&xmmword_267D2C6B0 + 1) = v8;

  v24[0] = &unk_26CF5B108;
  v24[1] = &unk_26CF5B168;
  v25[0] = &unk_26CF5B510;
  v25[1] = &unk_26CF5B500;
  void v24[2] = &unk_26CF5B180;
  void v25[2] = &unk_26CF5B500;
  double v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v4 constantValue:v9 withOverrides:3.0];
  qword_267D2C6C0 = v10;

  qword_267D2C6C8 = CDCornerComplicationTopLeftCenterAngle(v3);
  v22[0] = &unk_26CF5B168;
  v22[1] = &unk_26CF5B180;
  v23[0] = &unk_26CF5B520;
  v23[1] = &unk_26CF5B520;
  double v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v4 constantValue:v11 withOverrides:0.0];
  *(void *)&xmmword_267D2C6D0 = v12;

  v20[0] = &unk_26CF5B168;
  v20[1] = &unk_26CF5B180;
  v21[0] = &unk_26CF5B530;
  v21[1] = &unk_26CF5B530;
  v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v4 constantValue:v13 withOverrides:55.0];
  *((void *)&xmmword_267D2C6D0 + 1) = v14;

  v18[0] = &unk_26CF5B168;
  v18[1] = &unk_26CF5B180;
  v19[0] = &unk_26CF5B540;
  v19[1] = &unk_26CF5B540;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v4 constantValue:v15 withOverrides:140.0];
  qword_267D2C6E0 = v16;

  double v17 = CDCornerComplicationClippingSliceAngle((uint64_t)v3);
  qword_267D2C6A0 = *(void *)&v17;
}

void ___LayoutConstants_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  id v9 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v9 scaledValue:5.5];
  *(void *)&_LayoutConstants___constants_2 = v4;
  *((double *)&_LayoutConstants___constants_2 + 1) = CDCornerComplicationInnerUpperCircleRadius(v3) * 2.0 + -1.0;
  [v9 scaledValue:3 withOverride:6.5 forSizeClass:7.5];
  qword_267D2C710 = v5;
  CLKDegreesToRadians();
  qword_267D2C718 = v6;
  [v9 scaledValue:3 withOverride:15.0 forSizeClass:17.0];
  *(void *)&xmmword_267D2C720 = v7;
  *((void *)&xmmword_267D2C720 + 1) = CDRichComplicationCornerInnerFontSize(v3);
  qword_267D2C730 = CDCornerComplicationInnerUpperCircleRadius(v3);
  qword_267D2C738 = CDCornerComplicationInnerLowerTextBaselineRadius(v3);
  xmmword_267D2C740 = xmmword_21E4223C0;
  CDCornerComplicationTopLeftCenterAngle(v3);

  CLKDegreesToRadians();
  qword_267D2C750 = v8;
}

void ___LayoutConstants_block_invoke_8(uint64_t a1, void *a2)
{
  v36[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  v35[0] = &unk_26CF5B1B0;
  v35[1] = &unk_26CF5B1C8;
  v36[0] = &unk_26CF5B560;
  v36[1] = &unk_26CF5B570;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v4 scaledValue:v5 withOverrides:13.0];
  *(void *)&_LayoutConstants___constants_3 = v6;

  *((void *)&_LayoutConstants___constants_3 + 1) = 0x4043000000000000;
  v33[0] = &unk_26CF5B1E0;
  v33[1] = &unk_26CF5B1B0;
  v34[0] = &unk_26CF5B580;
  v34[1] = &unk_26CF5B590;
  v33[2] = &unk_26CF5B1C8;
  v34[2] = &unk_26CF5B5A0;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  [v4 scaledValue:v7 withOverrides:94.0];
  qword_267D2C7C8 = v8;

  v31[0] = &unk_26CF5B1E0;
  v31[1] = &unk_26CF5B1B0;
  v32[0] = &unk_26CF5B5B0;
  v32[1] = &unk_26CF5B5A0;
  v31[2] = &unk_26CF5B1C8;
  v32[2] = &unk_26CF5B5C0;
  id v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  [v4 scaledValue:v9 withOverrides:102.5];
  qword_267D2C7D0 = v10;

  double v11 = CDCornerComplicationTopLeftCenterAngle(v3);
  *(double *)&xmmword_267D2C7D8 = v11;
  v29[0] = &unk_26CF5B1B0;
  v29[1] = &unk_26CF5B1C8;
  v30[0] = &unk_26CF5B5D0;
  v30[1] = &unk_26CF5B5D0;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v4 constantValue:v12 withOverrides:15.0];
  *((void *)&xmmword_267D2C7D8 + 1) = v13;

  v27[0] = &unk_26CF5B1B0;
  v27[1] = &unk_26CF5B1C8;
  v28[0] = &unk_26CF5B5E0;
  v28[1] = &unk_26CF5B5E0;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v4 constantValue:v14 withOverrides:115.0];
  qword_267D2C7E8 = v15;

  uint64_t v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 25.0, 12.0, &unk_26CF5B1E0);
  v26[0] = v16;
  v25[1] = &unk_26CF5B1F8;
  double v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 24.0, 11.5);
  v26[1] = v17;
  void v25[2] = &unk_26CF5B210;
  v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 27.5, 12.5);
  void v26[2] = v18;
  void v25[3] = &unk_26CF5B228;
  v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 27.5, 12.5);
  v26[3] = v19;
  v25[4] = &unk_26CF5B1B0;
  uint64_t v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 25.0, 12.0);
  v26[4] = v20;
  v25[5] = &unk_26CF5B1C8;
  uint64_t v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 27.5, 12.5);
  v26[5] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:6];
  objc_msgSend(v4, "scaledSize:withOverrides:", v22, 22.5, 11.0);
  qword_267D2C7F0 = v23;
  *(void *)&xmmword_267D2C7F8 = v24;

  *((void *)&xmmword_267D2C7F8 + 1) = 0x3FF0000000000000;
}

void ___LayoutConstants_block_invoke_9(uint64_t a1, uint64_t a2)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v16[0] = &unk_26CF5B240;
  v16[1] = &unk_26CF5B258;
  v17[0] = &unk_26CF5B5F0;
  v17[1] = &unk_26CF5B600;
  id v3 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v2 scaledValue:v3 withOverrides:10.0];
  _LayoutConstants_constants_0 = v4;

  v14[0] = &unk_26CF5B270;
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 21.0, 9.5);
  v15[0] = v5;
  v14[1] = &unk_26CF5B288;
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 20.0, 9.0);
  v15[1] = v6;
  v14[2] = &unk_26CF5B2A0;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 22.5, 10.0);
  v15[2] = v7;
  v14[3] = &unk_26CF5B2B8;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 22.5, 10.0);
  v15[3] = v8;
  v14[4] = &unk_26CF5B240;
  id v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 21.0, 9.5);
  v15[4] = v9;
  v14[5] = &unk_26CF5B258;
  uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 22.5, 10.0);
  v15[5] = v10;
  double v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:6];
  objc_msgSend(v2, "scaledSize:withOverrides:", v11, 19.0, 8.5);
  _LayoutConstants_constants_1 = v12;
  _LayoutConstants_constants_2 = v13;

  _LayoutConstants_constants_3 = 0x3FF0000000000000;
}

void ___LayoutConstants_block_invoke_10(uint64_t a1, void *a2)
{
  void v11[4] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  double v5 = CDCircularSmallComplicationDiameter(v3);

  _LayoutConstants___constants_0_4 = *(void *)&v5;
  v10[0] = &unk_26CF5B390;
  v10[1] = &unk_26CF5B3A8;
  v11[0] = &unk_26CF5B8B0;
  v11[1] = &unk_26CF5B8C0;
  v10[2] = &unk_26CF5B3C0;
  void v10[3] = &unk_26CF5B3D8;
  v11[2] = &unk_26CF5B8D0;
  v11[3] = &unk_26CF5B8E0;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  [v4 scaledValue:v6 withOverrides:4.0];
  _LayoutConstants___constants_1_4 = v7;

  [v4 scaledValue:3 withOverride:63.0 forSizeClass:70.0];
  _LayoutConstants___constants_2_1 = v8;
  [v4 scaledValue:3 withOverride:80.0 forSizeClass:89.0];
  _LayoutConstants___constants_3_0 = v9;
}

@end