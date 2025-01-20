uint64_t sub_1DAFCFCDC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDefaultLayoutRule:*(void *)(a1 + 40) forState:a2];
}

void sub_1DAFCFCEC(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) defaultLayoutRuleForState:a2];
  [v4 setVerticalLayout:3];
  [v4 setHorizontalLayout:1];
  [*(id *)(a1 + 32) setDefaultLayoutRule:v4 forState:a2];
  [v4 referenceFrame];
  CLKRectCenteredXInRectForDevice();
  objc_msgSend(v4, "setReferenceFrame:");
}

int *_NTKAegirLayoutForDevice(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA8FC850);
  id WeakRetained = objc_loadWeakRetained(&qword_1EA8FC858);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_1EA8FC858);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_1EA8FC858, v1);
    qword_1EA8FC860 = [v1 version];

    sub_1DAFD0990(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = qword_1EA8FC860;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA8FC850);

  return &dword_1EA8FC818;
}

void sub_1DAFD0990(uint64_t a1, uint64_t a2)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:3];
  v28[0] = &unk_1F3527600;
  v28[1] = &unk_1F3527618;
  v29[0] = &unk_1F3527A98;
  v29[1] = &unk_1F3527AA8;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v2 scaledValue:v3 withOverrides:16.0];
  *(float *)&double v4 = v4;
  dword_1EA8FC818 = LODWORD(v4);

  v26 = &unk_1F3527630;
  v27 = &unk_1F3527AB8;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v2 scaledValue:v5 withOverrides:13.0];
  *(float *)&double v6 = v6;
  dword_1EA8FC82C = LODWORD(v6);

  v24[0] = &unk_1F3527600;
  v24[1] = &unk_1F3527630;
  v25[0] = &unk_1F3527AC8;
  v25[1] = &unk_1F3527AD8;
  v24[2] = &unk_1F3527648;
  v25[2] = &unk_1F3527AE8;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v2 scaledValue:v7 withOverrides:8.0];
  *(float *)&double v8 = v8;
  dword_1EA8FC81C = LODWORD(v8);

  *(float *)&int v9 = *(float *)&dword_1EA8FC81C + *(float *)&dword_1EA8FC82C * 2.0;
  dword_1EA8FC820 = v9;
  [v2 scaledValue:20.0];
  *(float *)&double v10 = v10;
  dword_1EA8FC824 = LODWORD(v10);
  [v2 scaledValue:16.0];
  *(float *)&double v11 = v11;
  dword_1EA8FC828 = LODWORD(v11);
  v22[0] = &unk_1F3527600;
  v22[1] = &unk_1F3527660;
  v23[0] = &unk_1F3527AF8;
  v23[1] = &unk_1F3527AF8;
  v22[2] = &unk_1F3527618;
  v22[3] = &unk_1F3527630;
  v23[2] = &unk_1F3527B08;
  v23[3] = &unk_1F3527B18;
  v22[4] = &unk_1F3527648;
  v22[5] = &unk_1F3527678;
  v23[4] = &unk_1F3527B28;
  v23[5] = &unk_1F3527B28;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];
  [v2 scaledValue:v12 withOverrides:6.0];
  qword_1EA8FC830 = v13;

  qword_1EA8FC838 = 0x3FF8000000000000;
  v20[0] = &unk_1F3527690;
  v20[1] = &unk_1F3527630;
  v21[0] = &unk_1F3527AA8;
  v21[1] = &unk_1F3527B38;
  v20[2] = &unk_1F3527648;
  v21[2] = &unk_1F3527B48;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v2 scaledValue:v14 withOverrides:19.5];
  qword_1EA8FC840 = v15;

  v18[0] = &unk_1F3527690;
  v18[1] = &unk_1F3527630;
  v19[0] = &unk_1F3527B58;
  v19[1] = &unk_1F3527B68;
  v18[2] = &unk_1F3527648;
  v19[2] = &unk_1F3527B78;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  [v2 scaledValue:v16 withOverrides:-38.5];
  qword_1EA8FC848 = v17;
}

void sub_1DAFD1854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

void sub_1DAFD186C(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained + 928;
    uint64_t v4 = *(int *)(a1 + 56);
    if (!*(void *)&WeakRetained[8 * v4 + 928])
    {
      uint64_t v5 = NSString;
      v22 = WeakRetained;
      double v6 = off_1E6BE3A70[v4];
      id v7 = objc_msgSend(v5, "stringWithFormat:", @"PLANET%d", v4);
      double v8 = *(void **)(a1 + 32);
      int v9 = +[NTKFaceBundle localizedStringForKey:v6 comment:v7];
      [v8 setText:v9];

      [*(id *)(a1 + 32) sizeToFit];
      [*(id *)(a1 + 32) bounds];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      v14 = [v22 device];
      [v14 screenScale];
      CGFloat v16 = v15;
      v24.width = v11;
      v24.height = v13;
      UIGraphicsBeginImageContextWithOptions(v24, 0, v16);

      uint64_t v17 = [*(id *)(a1 + 32) layer];
      [v17 renderInContext:UIGraphicsGetCurrentContext()];

      v18 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v18];
      uint64_t v20 = *(int *)(a1 + 56);
      v21 = *(void **)&v3[8 * v20];
      *(void *)&v3[8 * v20] = v19;

      [*(id *)&v3[8 * *(int *)(a1 + 56)] setAlpha:0.0];
      [*(id *)(a1 + 40) addSubview:*(void *)&v3[8 * *(int *)(a1 + 56)]];

      [v22 _layoutSpheroidLabel:*(unsigned int *)(a1 + 56)];
      id WeakRetained = v22;
    }
  }
}

uint64_t sub_1DAFD2964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_1DAFD2974(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = a1;
  if (a4) {
    a1 = (void *)[a1 shuffleRandomStyle];
  }
  return sub_1DAFD2964((uint64_t)a1, a2, v4[148]);
}

id sub_1DAFD2E34()
{
  if (qword_1EA8FC8A0 != -1) {
    dispatch_once(&qword_1EA8FC8A0, &unk_1F3524EB8);
  }
  v0 = (void *)qword_1EA8FC898;

  return v0;
}

void sub_1DAFD2F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAFD2F88(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[112] updateLocation:v8 fallbackLocation:v5];
  }
}

void sub_1DAFD313C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLocaleAnimated:1];
}

void sub_1DAFD3224(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[112] updateTimeAnimated:1];
    id WeakRetained = v2;
  }
}

id sub_1DAFD3B48(double a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (NTKShowIndicScriptNumerals())
  {
    if (a4 >= 3)
    {
LABEL_6:
      id v7 = [MEMORY[0x1E4F7A028] numericFontOfSize:round(a1 * 0.95) weight:*MEMORY[0x1E4F43930]];
      goto LABEL_16;
    }
    if (a3)
    {
      if (a3 != 2)
      {
        if (a3 == 1) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_11:
    double v8 = round(a1 * 0.9);
    uint64_t v9 = +[NTKAegirFontLoader nyNumeralsFontDescriptorOutlined:0];
    goto LABEL_13;
  }
  if (a3 == 2)
  {
LABEL_12:
    double v8 = round(a1 * 0.9);
    uint64_t v9 = +[NTKAegirFontLoader tokyoFontDescriptorOutlined:0];
    goto LABEL_13;
  }
  if (a3 != 1)
  {
LABEL_14:
    double v10 = 0;
    double v8 = 0.0;
    goto LABEL_15;
  }
  double v8 = round(a1 * 0.95);
  uint64_t v9 = +[NTKAegirFontLoader sfNumeralsFontDescriptorOutlined:0];
LABEL_13:
  double v10 = (void *)v9;
LABEL_15:
  id v7 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v10 size:v8];

LABEL_16:

  return v7;
}

id sub_1DAFD3C9C(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  id v7 = objc_msgSend(MEMORY[0x1E4F79FE0], "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, a2, a1, a3, a4, a5, a6, 0.0, round(a6 * 0.3125));
  double v8 = [v7 layoutRule];
  [v8 referenceFrame];
  double v10 = v9;
  double v12 = v11;

  CGFloat v13 = [v7 layoutRule];
  objc_msgSend(v13, "setReferenceFrame:", 0.0, v10, a5, v12);

  v14 = [v7 layoutRule];
  [v14 setHorizontalLayout:1];

  return v7;
}

id sub_1DAFD3D74(void *a1, double a2, double a3, double a4, double a5)
{
  double v9 = (void *)MEMORY[0x1E4F79FE0];
  double v10 = *MEMORY[0x1E4F43930];
  id v11 = a1;
  double v12 = objc_msgSend((id)objc_msgSend(v9, "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v11, a2, a3, a4, a5, v10), "designatorFont");
  [v12 pointSize];
  double v14 = v13;

  double v15 = sub_1DAFD3FCC(v14);

  return v15;
}

id sub_1DAFD3FCC(double a1)
{
  int v2 = NTKShowIndicScriptNumerals();
  double v3 = *MEMORY[0x1E4F43930];
  if (!v2
    || ([MEMORY[0x1E4F7A028] numericFontOfSize:a1 weight:*MEMORY[0x1E4F43930]],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [MEMORY[0x1E4F19A50] systemFontOfSize:a1 weight:v3];
    double v6 = [v5 CLKFontWithMonospacedNumbers];
    uint64_t v4 = [v6 CLKFontWithAlternativePunctuation];
  }
  id v7 = [v4 CLKFontWithMonospacedNumbers];
  double v8 = [v7 CLKFontWithAlternativePunctuation];

  return v8;
}

void sub_1DAFD42D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAFD42F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _wheelDelayedBlockFired];
}

uint64_t sub_1DAFD4B88()
{
  qword_1EA8FC868 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

void sub_1DAFD4E34(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  id v8 = a2;
  objc_msgSend(v3, "drawInRect:", v4, v5, v6, v7);
  id v10 = [*(id *)(a1 + 40) layer];
  uint64_t v9 = [v8 CGContext];

  [v10 renderInContext:v9];
}

uint64_t sub_1DAFD506C()
{
  qword_1EA8FC878 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

void sub_1DAFD52C0(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  id v8 = a2;
  objc_msgSend(v3, "drawInRect:", v4, v5, v6, v7);
  id v10 = [*(id *)(a1 + 40) layer];
  uint64_t v9 = [v8 CGContext];

  [v10 renderInContext:v9];
}

uint64_t sub_1DAFD54B4()
{
  qword_1EA8FC888 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DAFD5768(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_1DAFD5ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1DAFD5AE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _date];
  }
  else {
  double v3 = [MEMORY[0x1E4F1C9C8] date];
  }

  return v3;
}

uint64_t sub_1DAFD6D84()
{
  qword_1EA8FC898 = +[NTKFaceBundle localizedStringForKey:@"FACE_DATE_NOW" comment:@"FACE_DATE_NOW"];

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DAFD6E44()
{
  uint64_t v0 = [MEMORY[0x1E4F79FF8] fontDescriptorForSectName:@"__NYNumerals" fromMachO:&dword_1DAFCE000];
  id v1 = (void *)qword_1EA8FC8A8;
  qword_1EA8FC8A8 = v0;

  qword_1EA8FC8B0 = [MEMORY[0x1E4F79FF8] fontDescriptorForSectName:@"__NYNumeralsO" fromMachO:&dword_1DAFCE000];

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DAFD6F3C()
{
  uint64_t v0 = [MEMORY[0x1E4F79FF8] fontDescriptorForSectName:@"__SFNumerals" fromMachO:&dword_1DAFCE000];
  id v1 = (void *)qword_1EA8FC8C0;
  qword_1EA8FC8C0 = v0;

  qword_1EA8FC8C8 = [MEMORY[0x1E4F79FF8] fontDescriptorForSectName:@"__SFNumeralsO" fromMachO:&dword_1DAFCE000];

  return MEMORY[0x1F41817F8]();
}

void sub_1DAFD7034()
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F43850];
  v16[0] = *MEMORY[0x1E4F43858];
  v16[1] = v0;
  v17[0] = &unk_1F3527708;
  v17[1] = &unk_1F3527720;
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v2 = *MEMORY[0x1E4F43808];
  double v13 = v1;
  uint64_t v14 = v2;
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  double v15 = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  uint64_t v5 = [MEMORY[0x1E4F79FF8] fontDescriptorForSectName:@"__Tokyo" fromMachO:&dword_1DAFCE000];
  double v6 = (void *)qword_1EA8FC8D8;
  qword_1EA8FC8D8 = v5;

  uint64_t v7 = [(id)qword_1EA8FC8D8 fontDescriptorByAddingAttributes:v4];
  id v8 = (void *)qword_1EA8FC8D8;
  qword_1EA8FC8D8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F79FF8] fontDescriptorForSectName:@"__TokyoO" fromMachO:&dword_1DAFCE000];
  id v10 = (void *)qword_1EA8FC8E0;
  qword_1EA8FC8E0 = v9;

  uint64_t v11 = [(id)qword_1EA8FC8E0 fontDescriptorByAddingAttributes:v4];
  double v12 = (void *)qword_1EA8FC8E0;
  qword_1EA8FC8E0 = v11;
}

void sub_1DAFD73C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) defaultFaceForDevice:*(void *)(a1 + 40)];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x1E4F7A010];
    uint64_t v7 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
    id v8 = objc_msgSend(v6, "optionWithNumeral:forDevice:", objc_msgSend(v7, "unsignedIntValue"), *(void *)(a1 + 40));

    [v5 selectOption:v8 forCustomEditMode:19 slot:0];
    uint64_t v9 = +[NTKAegirVistaEditOption optionWithVista:forDevice:](NTKAegirVistaEditOption, "optionWithVista:forDevice:", [v10 unsignedIntValue], *(void *)(a1 + 40));
    [v5 selectOption:v9 forCustomEditMode:12 slot:0];
    [*(id *)(a1 + 56) addObject:v5];
  }
}

uint64_t sub_1DAFD7704()
{
  if ([MEMORY[0x1E4F79FC8] aegirShowAllOptions])
  {
    uint64_t v0 = _EnumValueRange();
  }
  else
  {
    uint64_t v0 = &unk_1F3527A68;
  }
  qword_1EA8FC8F0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8]();
}

void sub_1DAFD77D4()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F3527798;
  v2[1] = &unk_1F35277C8;
  v3[0] = @"full";
  v3[1] = @"crop01";
  v2[2] = &unk_1F35277E0;
  v2[3] = &unk_1F35277F8;
  v3[2] = @"crop02";
  v3[3] = @"crop03";
  v2[4] = &unk_1F3527810;
  v2[5] = &unk_1F3527828;
  v3[4] = @"crop04";
  v3[5] = @"crop05";
  v2[6] = &unk_1F3527840;
  v2[7] = &unk_1F35277B0;
  v3[6] = @"crop06";
  v3[7] = @"random";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  id v1 = (void *)qword_1EA8FC910;
  qword_1EA8FC910 = v0;
}

uint64_t sub_1DAFD7A64()
{
  if ([MEMORY[0x1E4F79FC8] aegirShowAllOptions])
  {
    uint64_t v0 = _EnumValueRange();
  }
  else
  {
    uint64_t v0 = &unk_1F3527A80;
  }
  qword_1EA8FC920 = (uint64_t)v0;

  return MEMORY[0x1F41817F8]();
}

void sub_1DAFD7BC4()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F3527858;
  v2[1] = &unk_1F3527870;
  v3[0] = @"earth";
  v3[1] = @"luna";
  v2[2] = &unk_1F3527888;
  v2[3] = &unk_1F35278B8;
  v3[2] = @"orrery";
  v3[3] = @"mercury";
  v2[4] = &unk_1F35278D0;
  v2[5] = &unk_1F35278E8;
  v3[4] = @"venus";
  v3[5] = @"mars";
  v2[6] = &unk_1F3527900;
  v2[7] = &unk_1F3527918;
  v3[6] = @"jupiter";
  v3[7] = @"saturn";
  void v2[8] = &unk_1F3527930;
  v2[9] = &unk_1F3527948;
  v3[8] = @"uranus";
  void v3[9] = @"neptune";
  v2[10] = &unk_1F35278A0;
  v3[10] = @"random";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  id v1 = (void *)qword_1EA8FC940;
  qword_1EA8FC940 = v0;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x1F40D5E60]();
}

uint64_t CLKLayoutIsRTL()
{
  return MEMORY[0x1F40D5EE8]();
}

uint64_t CLKLocaleIs24HourMode()
{
  return MEMORY[0x1F40D5EF8]();
}

uint64_t CLKLocaleNumberSystemForFirstLanguage()
{
  return MEMORY[0x1F40D5F00]();
}

uint64_t CLKLocaleNumberSystemFromNumeralOption()
{
  return MEMORY[0x1F4130708]();
}

uint64_t CLKMapFractionIntoRange()
{
  return MEMORY[0x1F40D5F20]();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return MEMORY[0x1F40D5F50]();
}

uint64_t CLKRoundForDevice()
{
  return MEMORY[0x1F40D5FA8]();
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return MEMORY[0x1F4130710]();
}

uint64_t NTKAllUtilitySmallFlatComplicationTypes()
{
  return MEMORY[0x1F4130718]();
}

uint64_t NTKClockFaceLocalizedString()
{
  return MEMORY[0x1F4130720]();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return MEMORY[0x1F4130728]();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return MEMORY[0x1F4130730]();
}

uint64_t NTKEnumerateComplicationStates()
{
  return MEMORY[0x1F4130738]();
}

uint64_t NTKIdealizedDate()
{
  return MEMORY[0x1F4130740]();
}

uint64_t NTKNumeralOptionFromCLKLocaleNumberSystem()
{
  return MEMORY[0x1F4130750]();
}

uint64_t NTKShowIndicScriptNumerals()
{
  return MEMORY[0x1F4130758]();
}

uint64_t NTKStarbearEnabled()
{
  return MEMORY[0x1F4130760]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

uint64_t _EnumValueRange()
{
  return MEMORY[0x1F4130768]();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return MEMORY[0x1F4130770]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}