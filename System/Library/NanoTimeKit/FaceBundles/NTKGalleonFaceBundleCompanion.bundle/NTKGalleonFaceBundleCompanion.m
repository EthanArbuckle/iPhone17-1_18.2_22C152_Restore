void sub_246B33680(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void v4[3];
  void v5[4];

  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB19158;
  v4[1] = &unk_26FB19128;
  v5[0] = @"lat-long";
  v5[1] = @"elev-incl";
  v4[2] = &unk_26FB19140;
  v5[2] = @"empty";
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 3);
  v3 = (void *)qword_2691D5760;
  qword_2691D5760 = v2;
}

id sub_246B3373C(void *a1)
{
  id v1 = a1;
  objc_sync_enter(v1);
  WeakRetained = objc_loadWeakRetained(&qword_2691D5770);
  if (!WeakRetained)
  {
    WeakRetained = objc_msgSend_galleon_newFontDescriptorWithMonospacedDigits_(v1, v2, 1, v3);
    objc_storeWeak(&qword_2691D5770, WeakRetained);
  }
  objc_sync_exit(v1);

  return WeakRetained;
}

void sub_246B337BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_246B337D0(uint64_t a1, const char *a2, int a3)
{
  v37[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F1D218];
  v36[0] = *MEMORY[0x263F1D220];
  uint64_t v4 = v36[0];
  v36[1] = v5;
  v37[0] = &unk_26FB19170;
  v37[1] = &unk_26FB19188;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v37, (uint64_t)v36, 2);
  v34[0] = v4;
  v34[1] = v5;
  v35[0] = &unk_26FB19170;
  v35[1] = &unk_26FB191A0;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v35, (uint64_t)v34, 2);
  v33[0] = v6;
  v33[1] = v8;
  v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, (uint64_t)v33, 2);
  if (a3)
  {
    v31[0] = v4;
    v31[1] = v5;
    v32[0] = &unk_26FB191B8;
    v32[1] = &unk_26FB191D0;
    v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v32, (uint64_t)v31, 2);
    uint64_t v16 = objc_msgSend_arrayByAddingObject_(v12, v14, (uint64_t)v13, v15);

    v12 = (void *)v16;
  }
  v17 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263F1C658], v10, *MEMORY[0x263F1D240], v11, 10.0, *MEMORY[0x263F1D318]);
  v21 = objc_msgSend_fontDescriptor(v17, v18, v19, v20);
  uint64_t v22 = *MEMORY[0x263F03AF8];
  v29[0] = *MEMORY[0x263F1D1E8];
  v29[1] = v22;
  v30[0] = v12;
  v30[1] = &unk_26FB19938;
  v29[2] = *MEMORY[0x263F03BB8];
  v30[2] = &unk_26FB191D0;
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v30, (uint64_t)v29, 3);
  v27 = objc_msgSend_fontDescriptorByAddingAttributes_(v21, v25, (uint64_t)v24, v26);

  return v27;
}

id sub_246B33A0C(void *a1)
{
  id v1 = a1;
  objc_sync_enter(v1);
  WeakRetained = objc_loadWeakRetained(&qword_2691D5778);
  if (!WeakRetained)
  {
    WeakRetained = objc_msgSend_galleon_newFontDescriptorWithMonospacedDigits_(v1, v2, 0, v3);
    objc_storeWeak(&qword_2691D5778, WeakRetained);
  }
  objc_sync_exit(v1);

  return WeakRetained;
}

void sub_246B33A8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_246B33AA0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_monospacedSystemFontOfSize_weight_(MEMORY[0x263F1C658], a2, a3, a4, 16.0, *MEMORY[0x263F1D318]);
  v9 = objc_msgSend_fontDescriptor(v5, v6, v7, v8);
  v12 = objc_msgSend_fontWithDescriptor_size_(MEMORY[0x263EFD198], v10, (uint64_t)v9, v11, 16.0);
  v14 = objc_msgSend__galleon_imageViewWithSymbolName_font_(a1, v13, @"chevron.up", (uint64_t)v12);

  return v14;
}

id sub_246B33B50(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = (void *)MEMORY[0x263F1C6C8];
  id v6 = a3;
  v9 = objc_msgSend_configurationWithFont_(v5, v7, a4, v8);
  uint64_t v11 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v10, (uint64_t)v6, (uint64_t)v9);

  v14 = objc_msgSend_imageWithRenderingMode_(v11, v12, 2, v13);
  id v15 = objc_alloc(MEMORY[0x263F1C6D0]);
  v18 = objc_msgSend_initWithImage_(v15, v16, (uint64_t)v14, v17);

  return v18;
}

id sub_246B33C08()
{
  if (qword_2691D5788 != -1) {
    dispatch_once(&qword_2691D5788, &unk_26FB12610);
  }
  v0 = (void *)qword_2691D5780;

  return v0;
}

void sub_246B33C5C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v9[15] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_null(MEMORY[0x263EFF9D0], a2, a3, a4);
  v8[0] = @"instanceTransform";
  v8[1] = @"instanceCount";
  v9[0] = v4;
  v9[1] = v4;
  v8[2] = @"instanceDelay";
  v8[3] = @"contentsMultiplyColor";
  v9[2] = v4;
  v9[3] = v4;
  v8[4] = @"hidden";
  v8[5] = @"backgroundColor";
  v9[4] = v4;
  v9[5] = v4;
  v8[6] = @"borderColor";
  v8[7] = @"borderWidth";
  v9[6] = v4;
  v9[7] = v4;
  v8[8] = @"cornerCurve";
  v8[9] = @"cornerRadius";
  v9[8] = v4;
  v9[9] = v4;
  v8[10] = @"affineTransform";
  v8[11] = @"transform";
  v9[10] = v4;
  v9[11] = v4;
  v8[12] = @"bounds";
  v8[13] = @"position";
  v9[12] = v4;
  v9[13] = v4;
  v8[14] = @"opacity";
  v9[14] = v4;
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v9, (uint64_t)v8, 15);
  uint64_t v7 = (void *)qword_2691D5780;
  qword_2691D5780 = v6;
}

void sub_246B33DA8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_galleon_disabledLayerActions(MEMORY[0x263F157E8], a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActions_(a1, v5, (uint64_t)v7, v6);
}

void sub_246B34474(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_246B34CEC(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D57C8);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D57D0);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_2691D57D0);
    if (v5 == obj)
    {
      uint64_t v8 = objc_msgSend_version(obj, (const char *)obj, v6, v7);
      uint64_t v9 = qword_2691D57D8;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&qword_2691D57D0, obj);
  qword_2691D57D8 = objc_msgSend_version(obj, v11, v12, v13);

  sub_246B350B8(v14, (const char *)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D57C8);
  long long v15 = *(_OWORD *)&qword_2691D57A8;
  *a2 = xmmword_2691D5798;
  a2[1] = v15;
  a2[2] = xmmword_2691D57B8;
}

void sub_246B350B8(uint64_t a1, const char *a2)
{
  objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 6);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scaledValue_(v26, v2, v3, v4, 96.0);
  qword_2691D57A8 = v5;
  objc_msgSend_scaledValue_(v26, v6, v7, v8, 62.0);
  *((void *)&xmmword_2691D57B8 + 1) = v9;
  objc_msgSend_scaledValue_(v26, v10, v11, v12, 83.0);
  *((void *)&xmmword_2691D5798 + 1) = v13;
  objc_msgSend_scaledValue_(v26, v14, v15, v16, 51.0);
  *(void *)&xmmword_2691D57B8 = v17;
  objc_msgSend_scaledValue_(v26, v18, v19, v20, 44.5);
  *(void *)&xmmword_2691D5798 = v21;
  objc_msgSend_scaledValue_(v26, v22, v23, v24, 34.5);
  qword_2691D57B0 = v25;
}

void sub_246B35B20(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_CGContext(a2, (const char *)a2, a3, a4);
  objc_msgSend_layer(*(void **)(a1 + 32), v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_renderInContext_(v11, v9, v5, v10);
}

void sub_246B35D58(void **a1, void *a2)
{
  id v18 = a2;
  uint64_t v6 = objc_msgSend_superview(a1[4], v3, v4, v5);

  if (!v6) {
    objc_msgSend_addSubview_(a1[5], v7, (uint64_t)a1[4], v9);
  }
  uint64_t v10 = objc_msgSend_superview(a1[6], v7, v8, v9);

  if (v10) {
    objc_msgSend_removeFromSuperview(a1[6], v11, v12, v13);
  }
  objc_msgSend_image(a1[4], v11, v12, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = v18;
  if (v14 != v18)
  {
    objc_msgSend_setImage_(a1[4], v15, (uint64_t)v18, v16);
    uint64_t v17 = v18;
  }
}

void sub_246B35FAC(uint64_t a1, const char *a2)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB19320;
  v4[1] = &unk_26FB19338;
  v5[0] = @"hour";
  v5[1] = @"minute";
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 2);
  uint64_t v3 = (void *)qword_2691D57E0;
  qword_2691D57E0 = v2;
}

void sub_246B37374(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 416);
  id v3 = a2;
  objc_msgSend_layer(v2, v4, v5, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_CGContext(v3, v7, v8, v9);

  objc_msgSend_renderInContext_(v13, v11, v10, v12);
}

void *_NTKGalleonLayoutConstants@<X0>(void *a1@<X8>)
{
  if (qword_2691D5908 != -1) {
    dispatch_once(&qword_2691D5908, &unk_26FB12650);
  }

  return memcpy(a1, &xmmword_2691D57F0, 0x118uLL);
}

__n128 sub_246B376B8()
{
  xmmword_2691D57F0 = xmmword_246B47470;
  unk_2691D5800 = xmmword_246B47480;
  xmmword_2691D5810 = xmmword_246B47490;
  unk_2691D5820 = xmmword_246B474A0;
  xmmword_2691D5830 = xmmword_246B474B0;
  unk_2691D5840 = xmmword_246B474C0;
  xmmword_2691D5850 = xmmword_246B474D0;
  unk_2691D5860 = xmmword_246B474E0;
  xmmword_2691D5870 = xmmword_246B474F0;
  unk_2691D5880 = xmmword_246B47500;
  xmmword_2691D5890 = xmmword_246B47510;
  unk_2691D58A0 = xmmword_246B47520;
  xmmword_2691D58B0 = xmmword_246B47530;
  unk_2691D58C0 = xmmword_246B47540;
  xmmword_2691D58D0 = xmmword_246B47550;
  unk_2691D58E0 = xmmword_246B47560;
  qword_2691D58F0 = 0x3FF0000000000000;
  __n128 result = *(__n128 *)MEMORY[0x263F001B0];
  xmmword_2691D58F8 = *MEMORY[0x263F001B0];
  return result;
}

void sub_246B37800(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_246B37C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_drawInRect_withAttributes_, *(void *)(a1 + 40), a4);
}

void sub_246B37D7C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_CGContext(a2, (const char *)a2, a3, a4);
  objc_msgSend_layer(*(void **)(a1 + 32), v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_renderInContext_(v11, v9, v5, v10);
}

uint64_t sub_246B38200(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = objc_msgSend_CGContext(a2, (const char *)a2, a3, a4);
  uint64_t v8 = *(void **)(a1 + 32);

  return objc_msgSend_renderInContext_(v8, v5, v6, v7);
}

void sub_246B383E8()
{
  qword_2691D5918 = 0x4024000000000000;
  qword_2691D5920 = 0x4014000000000000;
  qword_2691D5928 = 0x3FF0000000000000;
  qword_2691D5930 = 0x4008000000000000;
  qword_2691D5938 = 0x3FE0000000000000;
  qword_2691D5940 = 0x4000000000000000;
}

id sub_246B38434(void *a1)
{
  id v1 = a1;
  objc_sync_enter(v1);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D5950);
  if (!WeakRetained)
  {
    id WeakRetained = objc_msgSend_galleon_newHeadingFont(v1, v2, v3, v4);
    objc_storeWeak(&qword_2691D5950, WeakRetained);
  }
  objc_sync_exit(v1);

  return WeakRetained;
}

void sub_246B384B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_246B384C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (void *)MEMORY[0x263EFD198];
  uint64_t v5 = objc_msgSend_galleon_fontDescriptor(MEMORY[0x263F1C660], a2, a3, a4);
  uint64_t v8 = objc_msgSend_fontWithDescriptor_size_(v4, v6, (uint64_t)v5, v7, 11.0);

  return v8;
}

id sub_246B3852C(void *a1)
{
  id v1 = a1;
  objc_sync_enter(v1);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D5958);
  if (!WeakRetained)
  {
    id WeakRetained = objc_msgSend_galleon_newDegreeFont(v1, v2, v3, v4);
    objc_storeWeak(&qword_2691D5958, WeakRetained);
  }
  objc_sync_exit(v1);

  return WeakRetained;
}

void sub_246B385A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_246B385BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (void *)MEMORY[0x263EFD198];
  uint64_t v5 = objc_msgSend_galleon_degreeFontDescriptor(MEMORY[0x263F1C660], a2, a3, a4);
  uint64_t v8 = objc_msgSend_fontWithDescriptor_size_(v4, v6, (uint64_t)v5, v7, 11.0);

  return v8;
}

CGAffineTransform *NTKGalleonRotationTransform@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v12 = MEMORY[0x263F000D0];
  long long v13 = *MEMORY[0x263F000D0];
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a2 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a2 + 16) = v14;
  long long v15 = *(_OWORD *)(v12 + 32);
  *(_OWORD *)(a2 + 32) = v15;
  *(_OWORD *)&v28.a = v13;
  *(_OWORD *)&v28.c = v14;
  *(_OWORD *)&v28.tx = v15;
  CGAffineTransformTranslate((CGAffineTransform *)a2, &v28, 0.0, a6);
  CGFloat v16 = (a3 - a5) * 0.5 - a6;
  long long v17 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v27.a = *(_OWORD *)a2;
  *(_OWORD *)&v27.c = v17;
  *(_OWORD *)&v27.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformTranslate(&v28, &v27, 0.0, v16);
  long long v18 = *(_OWORD *)&v28.c;
  *(_OWORD *)a2 = *(_OWORD *)&v28.a;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v28.tx;
  CLKDegreesToRadians();
  long long v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v27.a = *(_OWORD *)a2;
  *(_OWORD *)&v27.c = v19;
  *(_OWORD *)&v27.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate(&v28, &v27, v20);
  long long v21 = *(_OWORD *)&v28.c;
  *(_OWORD *)a2 = *(_OWORD *)&v28.a;
  *(_OWORD *)(a2 + 16) = v21;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v28.tx;
  long long v22 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v27.a = *(_OWORD *)a2;
  *(_OWORD *)&v27.c = v22;
  *(_OWORD *)&v27.tx = *(_OWORD *)(a2 + 32);
  __n128 result = CGAffineTransformTranslate(&v28, &v27, 0.0, -v16);
  long long v24 = *(_OWORD *)&v28.c;
  *(_OWORD *)a2 = *(_OWORD *)&v28.a;
  *(_OWORD *)(a2 + 16) = v24;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v28.tx;
  if (a4 < 270.0 && a4 > 90.0)
  {
    if (a1)
    {
      long long v25 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)&v27.a = *(_OWORD *)a2;
      *(_OWORD *)&v27.c = v25;
      *(_OWORD *)&v27.tx = *(_OWORD *)(a2 + 32);
      __n128 result = CGAffineTransformRotate(&v28, &v27, 3.14159265);
      long long v26 = *(_OWORD *)&v28.c;
      *(_OWORD *)a2 = *(_OWORD *)&v28.a;
      *(_OWORD *)(a2 + 16) = v26;
      *(_OWORD *)(a2 + 32) = *(_OWORD *)&v28.tx;
    }
  }
  return result;
}

void sub_246B39504(void *a1, double a2, double a3, double a4, double a5, double a6, CGFloat a7, uint64_t a8, int a9)
{
  double v14 = a2 * 0.5;
  double v15 = a3 - a2 * 0.5;
  double v16 = a4 - a2 * 0.5;
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v27 = *MEMORY[0x263F000D0];
  long long v28 = v17;
  long long v29 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  id v18 = a1;
  objc_msgSend_setTransform_(v18, v19, (uint64_t)&v27, v20);
  objc_msgSend_setCenter_(v18, v21, v22, v23, v14 + v15, v16 + a6 * 0.5);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  NTKGalleonRotationTransform(a9, (uint64_t)&v27, a2, a5, a6, a7);
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  objc_msgSend_setTransform_(v18, v24, (uint64_t)v26, v25);
}

uint64_t sub_246B3ADA0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = qword_2691D5960;
  qword_2691D5960 = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_246B3B7BC(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D5A18);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D5A20);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_2691D5A20);
    if (v5 == obj)
    {
      uint64_t v8 = objc_msgSend_version(obj, (const char *)obj, v6, v7);
      uint64_t v9 = qword_2691D5A28;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&qword_2691D5A20, obj);
  qword_2691D5A28 = objc_msgSend_version(obj, v11, v12, v13);

  sub_246B40274(v14, (const char *)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D5A18);
  long long v15 = *(_OWORD *)&qword_2691D59E8;
  a2[4] = xmmword_2691D59D8;
  a2[5] = v15;
  long long v16 = *(_OWORD *)&qword_2691D5A08;
  a2[6] = xmmword_2691D59F8;
  a2[7] = v16;
  long long v17 = unk_2691D59A8;
  *a2 = xmmword_2691D5998;
  a2[1] = v17;
  long long v18 = *(_OWORD *)&qword_2691D59C8;
  a2[2] = xmmword_2691D59B8;
  a2[3] = v18;
}

void sub_246B3C75C(uint64_t a1, uint64_t a2)
{
  CGFloat v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  memset(&v71, 0, sizeof(v71));
  CGAffineTransformMakeScale(&v71, v4, v4);
  uint64_t v8 = objc_msgSend_complicationLayoutforSlot_(*(void **)(a1 + 32), v6, *MEMORY[0x263F57808], v7);
  id v11 = objc_msgSend_defaultLayoutRuleForState_(v8, v9, a2, v10);
  CGAffineTransform v70 = v71;
  objc_msgSend_setContentTransform_(v11, v12, (uint64_t)&v70, v13);
  objc_msgSend_referenceFrame(v11, v14, v15, v16);
  CGRect v73 = CGRectInset(v72, 0.0, 0.0);
  objc_msgSend_setReferenceFrame_(v11, v17, v18, v19, v5 + v73.origin.x, v73.origin.y, v73.size.width, v73.size.height);
  uint64_t v22 = objc_msgSend_complicationLayoutforSlot_(*(void **)(a1 + 32), v20, *MEMORY[0x263F57810], v21);

  uint64_t v25 = objc_msgSend_defaultLayoutRuleForState_(v22, v23, a2, v24);

  CGAffineTransform v69 = v71;
  objc_msgSend_setContentTransform_(v25, v26, (uint64_t)&v69, v27);
  objc_msgSend_referenceFrame(v25, v28, v29, v30);
  CGRect v75 = CGRectInset(v74, 0.0, 0.0);
  objc_msgSend_setReferenceFrame_(v25, v31, v32, v33, v75.origin.x - v5, v75.origin.y, v75.size.width, v75.size.height);
  v36 = objc_msgSend_complicationLayoutforSlot_(*(void **)(a1 + 32), v34, *MEMORY[0x263F57818], v35);

  v39 = objc_msgSend_defaultLayoutRuleForState_(v36, v37, a2, v38);

  CGAffineTransform v68 = v71;
  objc_msgSend_setContentTransform_(v39, v40, (uint64_t)&v68, v41);
  objc_msgSend_referenceFrame(v39, v42, v43, v44);
  CGRect v77 = CGRectInset(v76, 0.0, 0.0);
  objc_msgSend_setReferenceFrame_(v39, v45, v46, v47, v77.origin.x, v77.origin.y - v5, v77.size.width, v77.size.height);
  v50 = objc_msgSend_complicationLayoutforSlot_(*(void **)(a1 + 32), v48, *MEMORY[0x263F57848], v49);

  v53 = objc_msgSend_defaultLayoutRuleForState_(v50, v51, a2, v52);

  objc_msgSend_referenceFrame(v53, v54, v55, v56);
  CGRect v79 = CGRectInset(v78, 3.0, 3.0);
  CGRect v80 = CGRectOffset(v79, 0.0, -0.0);
  double x = v80.origin.x;
  double y = v80.origin.y;
  double width = v80.size.width;
  double height = v80.size.height;
  CGAffineTransformMakeScale(&v67, 0.7, 0.7);
  CGAffineTransform v66 = v67;
  objc_msgSend_setContentTransform_(v53, v61, (uint64_t)&v66, v62);
  objc_msgSend_setReferenceFrame_(v53, v63, v64, v65, x, y, width, height);
}

id sub_246B3E1AC(double a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v11 = objc_msgSend_blackColor(MEMORY[0x263F1C550], v8, v9, v10);
  double v25 = 0.0;
  double v26 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_(v6, v12, 0, 0, 0, &v26);
  objc_msgSend_getRed_green_blue_alpha_(v7, v13, 0, 0, 0, &v25);
  if (v26 != 1.0 || v25 != 1.0)
  {
    uint64_t v18 = objc_msgSend_colorWithAlphaComponent_(v11, v14, v15, v16, (v26 + v25) * 0.5);

    id v11 = (void *)v18;
  }
  double v19 = 1.0 - a1 / 0.6;
  if (a1 / 0.6 >= 1.0) {
    double v19 = 0.0;
  }
  double v20 = (a1 + -0.4) / 0.6;
  if (a1 + -0.4 < 0.0) {
    double v20 = 0.0;
  }
  double v21 = 1.0 - v19 - v20;
  uint64_t v22 = MEMORY[0x24C542630](v6, v7, v20 / (v19 + v20));
  uint64_t v23 = MEMORY[0x24C542630](v22, v11, v21);

  return v23;
}

uint64_t sub_246B3E7D8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__applyComplicationColor_withPalette_slot_(*(void **)(a1 + 32), a2, a3, *(void *)(a1 + 40), a2);
}

void sub_246B3F5D0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  uint64_t v8 = objc_msgSend_integerValue(a2, v5, v6, v7);
  if (v8 != *(void *)(a1 + 40)) {
    objc_msgSend_setOption_forCustomEditMode_slot_(*(void **)(a1 + 32), v9, (uint64_t)v10, v8, 0);
  }
}

void sub_246B3FC94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v30[2] = *MEMORY[0x263EF8340];
  CGFloat v4 = objc_msgSend_systemFontOfSize_weight_(MEMORY[0x263EFD198], a2, a3, a4, 10.0, *MEMORY[0x263F1D318]);
  uint64_t v6 = *MEMORY[0x263F1D218];
  v29[0] = *MEMORY[0x263F1D220];
  uint64_t v5 = v29[0];
  v29[1] = v6;
  v30[0] = &unk_26FB19518;
  v30[1] = &unk_26FB19530;
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v30, (uint64_t)v29, 2);
  v27[0] = v5;
  v27[1] = v6;
  v28[0] = &unk_26FB19518;
  v28[1] = &unk_26FB19548;
  id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v28, (uint64_t)v27, 2);
  v26[0] = v8;
  v26[1] = v10;
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v26, 2);
  uint64_t v16 = objc_msgSend_fontDescriptor(v4, v13, v14, v15);
  uint64_t v17 = *MEMORY[0x263F03AF8];
  v24[0] = *MEMORY[0x263F1D1E8];
  v24[1] = v17;
  v25[0] = v12;
  v25[1] = &unk_26FB19968;
  v24[2] = *MEMORY[0x263F03BB8];
  v25[2] = &unk_26FB19560;
  double v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v25, (uint64_t)v24, 3);
  uint64_t v22 = objc_msgSend_fontDescriptorByAddingAttributes_(v16, v20, (uint64_t)v19, v21);
  uint64_t v23 = (void *)qword_2691D5978;
  qword_2691D5978 = v22;
}

void sub_246B3FEB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v30[2] = *MEMORY[0x263EF8340];
  CGFloat v4 = objc_msgSend_systemFontOfSize_weight_(MEMORY[0x263EFD198], a2, a3, a4, 10.0, *MEMORY[0x263F1D340]);
  uint64_t v6 = *MEMORY[0x263F1D218];
  v29[0] = *MEMORY[0x263F1D220];
  uint64_t v5 = v29[0];
  v29[1] = v6;
  v30[0] = &unk_26FB19518;
  v30[1] = &unk_26FB19530;
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v30, (uint64_t)v29, 2);
  v27[0] = v5;
  v27[1] = v6;
  v28[0] = &unk_26FB19518;
  v28[1] = &unk_26FB19548;
  id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v28, (uint64_t)v27, 2);
  v26[0] = v8;
  v26[1] = v10;
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v26, 2);
  uint64_t v16 = objc_msgSend_fontDescriptor(v4, v13, v14, v15);
  uint64_t v17 = *MEMORY[0x263F03AF8];
  v24[0] = *MEMORY[0x263F1D1E8];
  v24[1] = v17;
  v25[0] = v12;
  v25[1] = &unk_26FB19968;
  v24[2] = *MEMORY[0x263F03BB8];
  v25[2] = &unk_26FB19560;
  double v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v25, (uint64_t)v24, 3);
  uint64_t v22 = objc_msgSend_fontDescriptorByAddingAttributes_(v16, v20, (uint64_t)v19, v21);
  uint64_t v23 = (void *)qword_2691D5988;
  qword_2691D5988 = v22;
}

void sub_246B40274(uint64_t a1, const char *a2)
{
  v53[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 6);
  objc_msgSend_scaledValue_(v2, v3, v4, v5, 193.0);
  *(void *)&xmmword_2691D5998 = v6;
  *(long long *)((char *)&xmmword_2691D5998 + 8) = xmmword_246B47620;
  unk_2691D59B0 = xmmword_246B47630;
  objc_msgSend_scaledValue_(v2, v7, v8, v9, 0.0);
  *((void *)&xmmword_2691D59B8 + 1) = v10;
  objc_msgSend_scaledValue_(v2, v11, v12, v13, 2.0);
  qword_2691D59C8 = v14;
  objc_msgSend_scaledValue_(v2, v15, v16, v17, 0.0);
  qword_2691D59D0 = v18;
  objc_msgSend_scaledValue_(v2, v19, v20, v21, 3.0);
  *(void *)&xmmword_2691D59D8 = v22;
  uint64_t v52 = &unk_26FB19578;
  v53[0] = &unk_26FB19978;
  uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v53, (uint64_t)&v52, 1);
  objc_msgSend_scaledValue_withOverrides_(v2, v25, (uint64_t)v24, v26, -61.0);
  *((void *)&xmmword_2691D59D8 + 1) = v27;

  objc_msgSend_scaledValue_(v2, v28, v29, v30, 15.0);
  qword_2691D59E8 = v31;
  objc_msgSend_scaledValue_(v2, v32, v33, v34, 60.0);
  qword_2691D59F0 = v35;
  objc_msgSend_scaledValue_(v2, v36, v37, v38, 10.0);
  *(void *)&xmmword_2691D59F8 = v39;
  objc_msgSend_scaledValue_(v2, v40, v41, v42, 19.0);
  *((void *)&xmmword_2691D59F8 + 1) = v43;
  objc_msgSend_scaledValue_(v2, v44, v45, v46, 36.0);
  qword_2691D5A08 = v47;
  objc_msgSend_scaledValue_(v2, v48, v49, v50, 9.0);
  qword_2691D5A10 = v51;
}

double NTKGalleonFloatRangePercentageValue(double a1, double a2, double a3)
{
  return a1 * (1.0 - a3) + a2 * a3;
}

double NTKGalleonTickSizePercentageValue(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * (1.0 - a5) + a2 * a5;
}

void sub_246B41248(uint64_t a1, void *a2)
{
  id v20 = a2;
  if (objc_msgSend_length(v20, v3, v4, v5))
  {
    uint64_t v8 = objc_msgSend_rasterizedImageWithFont_(v20, v6, *(void *)(a1 + 40), v7);
    id v9 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v12 = objc_msgSend_initWithImage_(v9, v10, (uint64_t)v8, v11);
    objc_msgSend_sizeToFit(v12, v13, v14, v15);
    objc_msgSend_addSubview_(*(void **)(a1 + 32), v16, (uint64_t)v12, v17);
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    objc_msgSend_addSubview_(*(void **)(a1 + 32), v18, (uint64_t)v8, v19);
  }
}

uint64_t sub_246B41400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](a2, sel_galleon_rotateAroundDialWithDiameter_centeredAtPoint_angleInDegrees_height_padding_rightSideUp_, *(unsigned __int8 *)(a1 + 72), a4);
}

double sub_246B41CB0(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D5A48);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D5A50);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_2691D5A50);
  if (v4 != v1)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_2691D5A50, v1);
    qword_2691D5A58 = objc_msgSend_version(v1, v11, v12, v13);

    sub_246B43AC0(v14, (const char *)v1);
    goto LABEL_6;
  }
  uint64_t v8 = objc_msgSend_version(v1, v5, v6, v7);
  uint64_t v9 = qword_2691D5A58;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D5A48);
  double v15 = *(double *)&qword_2691D5A30;

  return v15;
}

id sub_246B41DBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_layer(MEMORY[0x263F157E8], a2, a3, a4);
  objc_msgSend_setCornerCurve_(v5, v6, *MEMORY[0x263F15A10], v7);
  objc_msgSend_setMasksToBounds_(v5, v8, 0, v9);
  objc_msgSend_setActions_(v5, v10, *(void *)(a1 + 32), v11);
  objc_msgSend_setFrame_(v5, v12, v13, v14, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  return v5;
}

void sub_246B43AC0(uint64_t a1, const char *a2)
{
  objc_msgSend_metricsWithDevice_identitySizeClass_(MEMORY[0x263EFD188], a2, (uint64_t)a2, 6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scaledValue_(v14, v2, v3, v4, 10.25);
  qword_2691D5A30 = v5;
  objc_msgSend_scaledValue_(v14, v6, v7, v8, 4.75);
  qword_2691D5A38 = v9;
  objc_msgSend_scaledValue_(v14, v10, v11, v12, 4.0);
  qword_2691D5A40 = v13;
}

void sub_246B43B48(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v9[10] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_null(MEMORY[0x263EFF9D0], a2, a3, a4);
  v8[0] = @"backgroundColor";
  v8[1] = @"borderColor";
  v9[0] = v4;
  v9[1] = v4;
  v8[2] = @"borderWidth";
  v8[3] = @"cornerCurve";
  v9[2] = v4;
  v9[3] = v4;
  v8[4] = @"cornerRadius";
  v8[5] = @"affineTransform";
  v9[4] = v4;
  v9[5] = v4;
  v8[6] = @"transform";
  v8[7] = @"bounds";
  v9[6] = v4;
  v9[7] = v4;
  v8[8] = @"position";
  v8[9] = @"opacity";
  v9[8] = v4;
  v9[9] = v4;
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v9, (uint64_t)v8, 10);
  uint64_t v7 = (void *)qword_2691D5A60;
  qword_2691D5A60 = v6;
}

id sub_246B44B3C(void *a1, uint64_t a2, void *a3)
{
  v34[1] = *MEMORY[0x263EF8340];
  uint64_t v33 = *MEMORY[0x263F1C238];
  v34[0] = a3;
  uint64_t v4 = NSDictionary;
  id v5 = a3;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v34, (uint64_t)&v33, 1);
  objc_msgSend_sizeWithAttributes_(a1, v8, (uint64_t)v7, v9);
  double v11 = v10;
  double v13 = v12;
  id v14 = objc_alloc(MEMORY[0x263F1C680]);
  uint64_t v18 = objc_msgSend_initWithSize_(v14, v15, v16, v17, v11, v13);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  void v27[2] = sub_246B44CC0;
  v27[3] = &unk_2651F8E10;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  double v31 = v11;
  double v32 = v13;
  v27[4] = a1;
  id v28 = v7;
  id v19 = v7;
  uint64_t v22 = objc_msgSend_imageWithActions_(v18, v20, (uint64_t)v27, v21);
  double v25 = objc_msgSend_imageWithRenderingMode_(v22, v23, 2, v24);

  return v25;
}

uint64_t sub_246B44CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_drawInRect_withAttributes_, *(void *)(a1 + 40), a4);
}

void sub_246B44E0C(uint64_t a1, const char *a2)
{
  void v5[3] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26FB19788;
  v4[1] = &unk_26FB197A0;
  v5[0] = @"off";
  v5[1] = @"on";
  void v4[2] = &unk_26FB19770;
  v5[2] = @"auto";
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 3);
  uint64_t v3 = (void *)qword_2691D5A70;
  qword_2691D5A70 = v2;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
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
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

uint64_t CLKDegreesToRadians()
{
  return MEMORY[0x270EE3178]();
}

uint64_t CLKFloatEqualsFloat()
{
  return MEMORY[0x270EE3190]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x270EE31B0]();
}

uint64_t CLKLanguageIsTallScript()
{
  return MEMORY[0x270EE31F0]();
}

uint64_t CLKRectGetCenter()
{
  return MEMORY[0x270EE3240]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

uint64_t NTKAllSignatureCircularTypes()
{
  return MEMORY[0x270F4D8D0]();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return MEMORY[0x270F4D8D8]();
}

uint64_t NTKAllSimpleTextComplicationTypes()
{
  return MEMORY[0x270F4D8E8]();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return MEMORY[0x270F4D8F8]();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return MEMORY[0x270F4D940]();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return MEMORY[0x270F4D948]();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return MEMORY[0x270F4D950]();
}

uint64_t NTKEnumerateComplicationStates()
{
  return MEMORY[0x270F4D968]();
}

uint64_t NTKHasRegionalGeoRestrictions()
{
  return MEMORY[0x270F4D9B0]();
}

uint64_t NTKIdealizedDate()
{
  return MEMORY[0x270F4D9C0]();
}

uint64_t NTKInterpolateBetweenColors()
{
  return MEMORY[0x270F4D9E8]();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return MEMORY[0x270F4DA30]();
}

uint64_t NTKLocationComponentStringsShowSecondsAndLatLongTitle()
{
  return MEMORY[0x270F4DA38]();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return MEMORY[0x270F4DA90]();
}

uint64_t NTKSwatchTwoColorImage()
{
  return MEMORY[0x270F4DAB0]();
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

uint64_t _NTKLoggingObjectForDomain()
{
  return MEMORY[0x270F4DAE0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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