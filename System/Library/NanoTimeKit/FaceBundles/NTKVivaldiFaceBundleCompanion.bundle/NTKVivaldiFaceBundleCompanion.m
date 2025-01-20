void sub_246CB1AD8(void *a1@<X0>, uint64_t a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  long long v10;
  id obj;
  uint64_t vars8;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691E2630);
  WeakRetained = objc_loadWeakRetained(&qword_2691E2638);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&qword_2691E2638);
    if (v5 == obj)
    {
      v6 = [obj version];
      v7 = qword_2691E2640;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v8 = objc_storeWeak(&qword_2691E2638, obj);
  qword_2691E2640 = [obj version];

  sub_246CB2D8C(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691E2630);
  v10 = unk_2691E2618;
  *(_OWORD *)a2 = xmmword_2691E2608;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = qword_2691E2628;
}

uint64_t sub_246CB1F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _applyComplicationColor:a3 withPalette:*(void *)(a1 + 40) slot:a2];
}

void sub_246CB2618(uint64_t a1, long long *a2, uint64_t a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_246CB2708;
  v5[3] = &unk_265200F58;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a3;
  long long v3 = a2[1];
  long long v6 = *a2;
  long long v7 = v3;
  long long v8 = a2[2];
  v4 = (void (**)(void, void))MEMORY[0x24C546C30](v5);
  v4[2](v4, *MEMORY[0x263F57858]);
  v4[2](v4, *MEMORY[0x263F57860]);
  v4[2](v4, *MEMORY[0x263F57830]);
  v4[2](v4, *MEMORY[0x263F57838]);
}

void sub_246CB2708(uint64_t a1, uint64_t a2)
{
  long long v3 = [*(id *)(a1 + 32) complicationLayoutforSlot:a2];
  v4 = [v3 defaultLayoutRuleForState:*(void *)(a1 + 40)];
  long long v5 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v5;
  v6[2] = *(_OWORD *)(a1 + 80);
  [v4 setContentTransform:v6];
}

void sub_246CB2D8C(uint64_t a1, void *a2)
{
  v29[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [MEMORY[0x263F57940] largeDialDiameterForDevice:v3];
  uint64_t v6 = v5;

  *(void *)&xmmword_2691E2608 = v6;
  v28[0] = &unk_26FB3D328;
  long long v23 = xmmword_246CB7740;
  long long v7 = [MEMORY[0x263F08D40] valueWithBytes:&v23 objCType:"{CGSize=dd}"];
  v29[0] = v7;
  v28[1] = &unk_26FB3D340;
  long long v22 = xmmword_246CB7750;
  long long v8 = [MEMORY[0x263F08D40] valueWithBytes:&v22 objCType:"{CGSize=dd}"];
  v29[1] = v8;
  v28[2] = &unk_26FB3D358;
  long long v21 = xmmword_246CB7760;
  v9 = [MEMORY[0x263F08D40] valueWithBytes:&v21 objCType:"{CGSize=dd}"];
  v29[2] = v9;
  v28[3] = &unk_26FB3D370;
  long long v20 = xmmword_246CB7770;
  v10 = [MEMORY[0x263F08D40] valueWithBytes:&v20 objCType:"{CGSize=dd}"];
  v29[3] = v10;
  v28[4] = &unk_26FB3D388;
  long long v19 = xmmword_246CB7770;
  v11 = [MEMORY[0x263F08D40] valueWithBytes:&v19 objCType:"{CGSize=dd}"];
  v29[4] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];
  objc_msgSend(v4, "scaledSize:withOverrides:", v12, 31.5, 11.5);
  *((void *)&xmmword_2691E2608 + 1) = v13;
  unk_2691E2618 = v14;

  v26[0] = &unk_26FB3D328;
  v26[1] = &unk_26FB3D340;
  v27[0] = &unk_26FB3D4F0;
  v27[1] = &unk_26FB3D500;
  v26[2] = &unk_26FB3D358;
  v26[3] = &unk_26FB3D370;
  v27[2] = &unk_26FB3D510;
  v27[3] = &unk_26FB3D520;
  v26[4] = &unk_26FB3D388;
  v26[5] = &unk_26FB3D3A0;
  v27[4] = &unk_26FB3D530;
  v27[5] = &unk_26FB3D540;
  v26[6] = &unk_26FB3D3B8;
  v27[6] = &unk_26FB3D530;
  v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:7];
  [v4 scaledValue:v15 withOverrides:148.5];
  qword_2691E2620 = v16;

  v24[0] = &unk_26FB3D328;
  v24[1] = &unk_26FB3D340;
  v25[0] = &unk_26FB3D550;
  v25[1] = &unk_26FB3D560;
  v24[2] = &unk_26FB3D358;
  v24[3] = &unk_26FB3D370;
  v25[2] = &unk_26FB3D570;
  v25[3] = &unk_26FB3D580;
  v24[4] = &unk_26FB3D388;
  v24[5] = &unk_26FB3D3A0;
  v25[4] = &unk_26FB3D590;
  v25[5] = &unk_26FB3D5A0;
  v24[6] = &unk_26FB3D3B8;
  v25[6] = &unk_26FB3D5B0;
  v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];
  [v4 scaledValue:v17 withOverrides:65.0];
  qword_2691E2628 = v18;
}

void sub_246CB3488(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) defaultFaceForDevice:*(void *)(a1 + 40)];
  if (v3)
  {
    v4 = [MEMORY[0x263F57A50] pigmentNamed:v5];
    [v3 selectOption:v4 forCustomEditMode:10 slot:0];
    [*(id *)(a1 + 48) addObject:v3];
  }
}

void sub_246CB3978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_246CB399C(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGlobeImage];
}

void sub_246CB3A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_246CB3A14()
{
  return @"NTKVivaldiGlobeView globe update";
}

void sub_246CB3D20(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) _tritiumGlobe];
    os_unfair_lock_lock(WeakRetained + 116);
    v4 = *(void **)&WeakRetained[110]._os_unfair_lock_opaque;
    *(void *)&WeakRetained[110]._os_unfair_lock_opaque = v3;
    id v5 = v3;

    LOBYTE(WeakRetained[108]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(WeakRetained + 116);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_246CB3E64;
    block[3] = &unk_265201018;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_246CB0000, v5, OS_LOG_TYPE_DEFAULT, "Vivaldi globe view went away while loading default image", buf, 2u);
    }
  }
}

uint64_t sub_246CB3E64(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setImage:*(void *)(*(void *)(a1 + 32) + 440)];
}

void sub_246CB4114(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 116);
    if (*(void *)&v3[122]._os_unfair_lock_opaque == -1) {
      uint64_t v4 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v4 = -1;
    }
    if (*(void *)&v3[126]._os_unfair_lock_opaque == -1) {
      uint64_t v6 = *(void *)(a1 + 56);
    }
    else {
      uint64_t v6 = -1;
    }
    os_unfair_lock_unlock(v3 + 116);
    if (v4 != -1)
    {
      uint64_t v7 = [*(id *)(a1 + 32) _globeImageForSecond:v4];
      if (v7)
      {
        id v5 = v7;
        os_unfair_lock_lock(v3 + 116);
        *(void *)&v3[122]._os_unfair_lock_opaque = v4;
        objc_storeStrong((id *)&v3[124], v5);
        os_unfair_lock_unlock(v3 + 116);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = sub_246CB4434;
        v14[3] = &unk_265201068;
        v14[4] = *(void *)(a1 + 32);
        char v15 = *(unsigned char *)(a1 + 64);
        dispatch_async(MEMORY[0x263EF83A0], v14);
LABEL_17:
        v10 = [*(id *)(a1 + 32) _globeImageForSecond:v6];
        os_unfair_lock_lock(v3 + 116);
        if (v10)
        {
          *(void *)&v3[126]._os_unfair_lock_opaque = v6;
          id v11 = v10;
          v12 = *(NSObject **)&v3[128]._os_unfair_lock_opaque;
          *(void *)&v3[128]._os_unfair_lock_opaque = v11;
        }
        else
        {
          v12 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [*(id *)(a1 + 32) _assetNameForSecond:v6];
            *(_DWORD *)buf = 138412290;
            v17 = v13;
            _os_log_impl(&dword_246CB0000, v12, OS_LOG_TYPE_DEFAULT, "Vivaldi globe image failed to load %@", buf, 0xCu);
          }
        }

        LOBYTE(v3[120]._os_unfair_lock_opaque) = 0;
        os_unfair_lock_unlock(v3 + 116);

        goto LABEL_22;
      }
      long long v8 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [*(id *)(a1 + 32) _assetNameForSecond:v4];
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_246CB0000, v8, OS_LOG_TYPE_DEFAULT, "Vivaldi globe image failed to load %@", buf, 0xCu);
      }
    }
    id v5 = 0;
    goto LABEL_17;
  }
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_246CB0000, v5, OS_LOG_TYPE_DEFAULT, "Vivaldi globe view went away while loading images", buf, 2u);
  }
LABEL_22:
}

uint64_t sub_246CB4434(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayCurrentGlobeImage:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t sub_246CB45D0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

uint64_t sub_246CB45E8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setImage:0];
}

void sub_246CB54B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_246CB54D8(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691E26E8);
  id WeakRetained = objc_loadWeakRetained(&qword_2691E26F0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_2691E26F0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_2691E26F0, v1);
    qword_2691E26F8 = [v1 version];

    sub_246CB6740(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = qword_2691E26F8;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691E26E8);
  double v9 = *(double *)&qword_2691E26D0;

  return v9;
}

void sub_246CB55E4(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLabels];
}

void sub_246CB5648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_246CB565C()
{
  return @"NTKVivaldiTimeView";
}

void sub_246CB5C58()
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1D218];
  v13[0] = *MEMORY[0x263F1D220];
  v13[1] = v0;
  v14[0] = &unk_26FB3D3D0;
  v14[1] = &unk_26FB3D3E8;
  id v1 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v2 = [(id)objc_opt_class() vivaldiFontDescriptor];
  id v3 = (void *)qword_2691E2670;
  qword_2691E2670 = v2;

  id v4 = (void *)qword_2691E2670;
  uint64_t v5 = *MEMORY[0x263F1D1E8];
  v10 = v1;
  uint64_t v11 = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v12 = v6;
  id v7 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v8 = [v4 fontDescriptorByAddingAttributes:v7];
  double v9 = (void *)qword_2691E2670;
  qword_2691E2670 = v8;
}

void sub_246CB5E44()
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1D218];
  v13[0] = *MEMORY[0x263F1D220];
  v13[1] = v0;
  v14[0] = &unk_26FB3D3D0;
  v14[1] = &unk_26FB3D400;
  id v1 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v2 = [(id)objc_opt_class() vivaldiFontDescriptor];
  id v3 = (void *)qword_2691E2680;
  qword_2691E2680 = v2;

  id v4 = (void *)qword_2691E2680;
  uint64_t v5 = *MEMORY[0x263F1D1E8];
  v10 = v1;
  uint64_t v11 = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v12 = v6;
  id v7 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v8 = [v4 fontDescriptorByAddingAttributes:v7];
  double v9 = (void *)qword_2691E2680;
  qword_2691E2680 = v8;
}

void sub_246CB6030()
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1D218];
  v16[0] = *MEMORY[0x263F1D220];
  v16[1] = v0;
  v17[0] = &unk_26FB3D3D0;
  v17[1] = &unk_26FB3D3E8;
  id v1 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v2 = [NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  uint64_t v14 = v2;
  char v15 = &unk_26FB3D418;
  id v3 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  uint64_t v4 = *MEMORY[0x263F1D1E8];
  uint64_t v11 = v1;
  v12[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v12[1] = *MEMORY[0x263F03BC0];
  v13[0] = v5;
  v13[1] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  uint64_t v7 = [(id)objc_opt_class() vivaldiOutlineFontDescriptor];
  uint64_t v8 = (void *)qword_2691E2690;
  qword_2691E2690 = v7;

  uint64_t v9 = [(id)qword_2691E2690 fontDescriptorByAddingAttributes:v6];
  v10 = (void *)qword_2691E2690;
  qword_2691E2690 = v9;
}

void sub_246CB6284()
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1D218];
  v16[0] = *MEMORY[0x263F1D220];
  v16[1] = v0;
  v17[0] = &unk_26FB3D3D0;
  v17[1] = &unk_26FB3D400;
  id v1 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v2 = [NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  uint64_t v14 = v2;
  char v15 = &unk_26FB3D418;
  id v3 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  uint64_t v4 = *MEMORY[0x263F1D1E8];
  uint64_t v11 = v1;
  v12[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v12[1] = *MEMORY[0x263F03BC0];
  v13[0] = v5;
  v13[1] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  uint64_t v7 = [(id)objc_opt_class() vivaldiOutlineFontDescriptor];
  uint64_t v8 = (void *)qword_2691E26A0;
  qword_2691E26A0 = v7;

  uint64_t v9 = [(id)qword_2691E26A0 fontDescriptorByAddingAttributes:v6];
  v10 = (void *)qword_2691E26A0;
  qword_2691E26A0 = v9;
}

uint64_t sub_246CB648C()
{
  qword_2691E26B0 = [MEMORY[0x263F57A00] fontDescriptorForSectName:@"__Vivaldi-Reg" fromMachO:&dword_246CB0000];

  return MEMORY[0x270F9A758]();
}

uint64_t sub_246CB6530()
{
  qword_2691E26C0 = [MEMORY[0x263F57A00] fontDescriptorForSectName:@"__Vivaldi-Otl" fromMachO:&dword_246CB0000];

  return MEMORY[0x270F9A758]();
}

void sub_246CB6740(uint64_t a1, uint64_t a2)
{
  v14[7] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v13[0] = &unk_26FB3D430;
  v13[1] = &unk_26FB3D448;
  v14[0] = &unk_26FB3D5C0;
  v14[1] = &unk_26FB3D5D0;
  void v13[2] = &unk_26FB3D460;
  v13[3] = &unk_26FB3D478;
  v14[2] = &unk_26FB3D5E0;
  void v14[3] = &unk_26FB3D5F0;
  v13[4] = &unk_26FB3D490;
  v13[5] = &unk_26FB3D4A8;
  v14[4] = &unk_26FB3D5F0;
  void v14[5] = &unk_26FB3D600;
  v13[6] = &unk_26FB3D4C0;
  v14[6] = &unk_26FB3D610;
  id v3 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];
  [v2 scaledValue:v3 withOverrides:70.0];
  *(double *)&qword_2691E26D0 = v4 * 0.9;

  v11[0] = &unk_26FB3D430;
  v11[1] = &unk_26FB3D448;
  v12[0] = &unk_26FB3D620;
  v12[1] = &unk_26FB3D630;
  v11[2] = &unk_26FB3D460;
  v11[3] = &unk_26FB3D478;
  void v12[2] = &unk_26FB3D640;
  v12[3] = &unk_26FB3D650;
  v11[4] = &unk_26FB3D490;
  v11[5] = &unk_26FB3D4A8;
  v12[4] = &unk_26FB3D660;
  v12[5] = &unk_26FB3D670;
  v11[6] = &unk_26FB3D4C0;
  v12[6] = &unk_26FB3D680;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];
  [v2 scaledValue:v5 withOverrides:93.5];
  *(double *)&qword_2691E26D8 = v6 + *(double *)&qword_2691E26D0 * 0.04;

  v9[0] = &unk_26FB3D430;
  v9[1] = &unk_26FB3D448;
  v10[0] = &unk_26FB3D690;
  v10[1] = &unk_26FB3D6A0;
  v9[2] = &unk_26FB3D460;
  v9[3] = &unk_26FB3D478;
  v10[2] = &unk_26FB3D6B0;
  v10[3] = &unk_26FB3D6C0;
  v9[4] = &unk_26FB3D490;
  v9[5] = &unk_26FB3D4A8;
  v10[4] = &unk_26FB3D6D0;
  v10[5] = &unk_26FB3D6E0;
  v9[6] = &unk_26FB3D4C0;
  v10[6] = &unk_26FB3D6F0;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];
  [v2 scaledValue:v7 withOverrides:147.0];
  *(double *)&qword_2691E26E0 = v8 - *(double *)&qword_2691E26D0 * 0.04;
}

uint64_t sub_246CB6B08()
{
  qword_2691E2700 = (uint64_t)objc_alloc_init(MEMORY[0x263F579A8]);

  return MEMORY[0x270F9A758]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

uint64_t CLKInterpolateBetweenColors()
{
  return MEMORY[0x270EE31A8]();
}

uint64_t CLKLocaleIs24HourMode()
{
  return MEMORY[0x270EE3200]();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return MEMORY[0x270F4D8F8]();
}

uint64_t NTKColorByBrightening()
{
  return MEMORY[0x270F4D930]();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return MEMORY[0x270F4DA30]();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return MEMORY[0x270F4DA90]();
}

uint64_t TextToFourCharCode()
{
  return MEMORY[0x270F247A8]();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return MEMORY[0x270F4DAE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
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