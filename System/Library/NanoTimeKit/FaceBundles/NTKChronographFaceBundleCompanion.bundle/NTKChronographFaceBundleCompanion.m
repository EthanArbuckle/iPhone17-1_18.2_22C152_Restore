uint64_t NTKDefaultPaletteColorForDeviceCollection(void *a1, uint64_t a2)
{
  id v3;
  int v4;
  char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v4 = NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues();
  v5 = (char *)[v3 collectionType];
  if (v5 == (unsigned char *)&dword_0 + 3)
  {
    [v3 materialType];
    if (v4) {
      v8 = 19;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    if (a2 == 18) {
      v6 = v4;
    }
    else {
      v6 = 1;
    }
    if (v6) {
      v7 = a2;
    }
    else {
      v7 = 0;
    }
    if (v5 == (unsigned char *)&dword_4 + 2) {
      v7 = 9;
    }
    if (v5 == (unsigned char *)&dword_4 + 1) {
      v8 = 7;
    }
    else {
      v8 = v7;
    }
  }

  return v8;
}

id NTKPaletteColorsForGreenfieldColorMapping()
{
  if (qword_238D8 != -1) {
    dispatch_once(&qword_238D8, &stru_1C548);
  }
  v0 = (void *)qword_238D0;

  return v0;
}

void sub_38B0(id a1)
{
  v3[2] = xmmword_16948;
  v3[3] = unk_16958;
  v3[4] = xmmword_16968;
  v3[0] = xmmword_16928;
  v3[1] = unk_16938;
  uint64_t v1 = +[NSIndexSet indexSetWithIndexes:v3 count:10];
  v2 = (void *)qword_238D0;
  qword_238D0 = v1;
}

uint64_t sub_3C10(uint64_t a1, uint64_t a2)
{
  qword_238E0 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_3EBC(id a1)
{
  v3[0] = &off_1D7B8;
  v3[1] = &off_1D620;
  v4[0] = NTKFaceBundleColorBlackDeprecated;
  v4[1] = NTKFaceBundleColorDarkBlue;
  v3[2] = &off_1D638;
  v3[3] = &off_1D650;
  v4[2] = NTKFaceBundleColorDarkBrown;
  v4[3] = NTKFaceBundleColorDarkGreen;
  v3[4] = &off_1D668;
  _OWORD v3[5] = &off_1D680;
  v4[4] = NTKFaceBundleColorDarkGray;
  v4[5] = NTKFaceBundleColorLightGray;
  v3[6] = &off_1D698;
  v3[7] = &off_1D5F0;
  v4[6] = NTKFaceBundleColorLightYellow;
  v4[7] = NTKFaceBundleColorZeus;
  v3[8] = &off_1D6B0;
  v3[9] = &off_1D608;
  v4[8] = NTKFaceBundleColorLightBlue;
  v4[9] = NTKFaceBundleColorVictory;
  v3[10] = &off_1D6E0;
  v3[11] = &off_1D6F8;
  v4[10] = NTKFaceBundleColorRed;
  v4[11] = NTKFaceBundleColorPapaya;
  v3[12] = &off_1D710;
  v3[13] = &off_1D728;
  v4[12] = NTKFaceBundleColorYellow;
  v4[13] = NTKFaceBundleColorFlash;
  v3[14] = &off_1D740;
  v3[15] = &off_1D758;
  v4[14] = NTKFaceBundleColorGreen;
  v4[15] = NTKFaceBundleColorBlue;
  v3[16] = &off_1D770;
  v3[17] = &off_1D788;
  v4[16] = NTKFaceBundleColorPurple;
  v4[17] = NTKFaceBundleColorPink;
  v3[18] = &off_1D6C8;
  v3[19] = &off_1D7A0;
  v4[18] = NTKFaceBundleColorBlack;
  v4[19] = NTKFaceBundleColorGoldGeneric1;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:20];
  v2 = (void *)qword_23900;
  qword_23900 = v1;
}

uint64_t sub_48A0()
{
  qword_23910 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_49A8(id a1)
{
  v3[0] = &off_1D7D0;
  v3[1] = &off_1D7E8;
  v4[0] = NTKFaceBundleChronoTimeScale60Seconds;
  v4[1] = NTKFaceBundleChronoTimeScale30Seconds;
  v3[2] = &off_1D800;
  v3[3] = &off_1D818;
  v4[2] = NTKFaceBundleChronoTimeScale6Seconds;
  v4[3] = NTKFaceBundleChronoTimeScale3Seconds;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  v2 = (void *)qword_23930;
  qword_23930 = v1;
}

void sub_4D28(id a1)
{
  uint64_t v1 = NTKAllUtilitySmallComplicationTypes();
  id v4 = [v1 mutableCopy];

  [v4 removeIndex:4];
  id v2 = [objc_alloc((Class)NSIndexSet) initWithIndexSet:v4];
  v3 = (void *)qword_23940;
  qword_23940 = (uint64_t)v2;
}

void sub_5434(id a1)
{
  uint64_t v1 = NTKAllSignatureCornerTypes();
  id v4 = [v1 mutableCopy];

  [v4 removeIndex:4];
  id v2 = [objc_alloc((Class)NSIndexSet) initWithIndexSet:v4];
  v3 = (void *)qword_23950;
  qword_23950 = (uint64_t)v2;
}

void sub_57B4(id a1)
{
  qword_23960 = (uint64_t)[objc_alloc((Class)BSUIMappedImageCache) initWithUniqueIdentifier:@"com.apple.nanotimekit.face.chrono"];

  _objc_release_x1();
}

void sub_5ADC(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_23A28);
  id WeakRetained = objc_loadWeakRetained(&qword_23A30);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_23A30);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_23A38;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_23A30, obj);
  qword_23A38 = (uint64_t)[obj version];

  sub_8890(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_23A28);
  long long v10 = unk_23A00;
  *(_OWORD *)(a2 + 128) = xmmword_239F0;
  *(_OWORD *)(a2 + 144) = v10;
  *(_OWORD *)(a2 + 160) = xmmword_23A10;
  *(void *)(a2 + 176) = qword_23A20;
  long long v11 = *(_OWORD *)&qword_239C0;
  *(_OWORD *)(a2 + 64) = xmmword_239B0;
  *(_OWORD *)(a2 + 80) = v11;
  long long v12 = unk_239E0;
  *(_OWORD *)(a2 + 96) = xmmword_239D0;
  *(_OWORD *)(a2 + 112) = v12;
  long long v13 = *(_OWORD *)&qword_23980;
  *(_OWORD *)a2 = xmmword_23970;
  *(_OWORD *)(a2 + 16) = v13;
  long long v14 = *(_OWORD *)&qword_239A0;
  *(_OWORD *)(a2 + 32) = xmmword_23990;
  *(_OWORD *)(a2 + 48) = v14;
}

void sub_691C(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setForegroundColor:", objc_msgSend(v3, "CGColor"));
}

void sub_6D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_6DB4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = 12;
  }
  id v8 = +[NSString localizedStringWithFormat:@"%i", v7];
  if (a3 == 10) {
    objc_msgSend(v5, "setAnchorPoint:", 0.4, 0.5);
  }
  [v5 setFont:*(void *)(a1 + 32)];
  [v5 setFontSize:*(double *)(a1 + 48)];
  [v5 setString:v8];
  [WeakRetained _boundsForText:v8 font:*(void *)(a1 + 32)];
  objc_msgSend(v5, "setBounds:");
  double v9 = *(double *)(a1 + 72);

  return v9;
}

void sub_701C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_7038(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  LODWORD(v8) = 15 * a3;
  if (a3) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = 60;
  }
  double v9 = +[NSString localizedStringWithFormat:@"%2i", v8];
  [v6 setFont:*(void *)(a1 + 32)];
  [v6 setFontSize:*(double *)(a1 + 48)];
  [v6 setString:v9];
  [WeakRetained _boundsForText:v9 font:*(void *)(a1 + 32)];
  objc_msgSend(v6, "setBounds:");

  double v10 = *(double *)(a1 + 88);
  return v10;
}

void sub_7288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_72A4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v7) = 5 * a3;
  if (a3) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 60;
  }
  uint64_t v8 = +[NSString localizedStringWithFormat:@"%i", v7];
  if (a3 >= 8) {
    objc_msgSend(v5, "setAnchorPoint:", 0.4, 0.5);
  }
  [v5 setFont:*(void *)(a1 + 32)];
  [v5 setFontSize:*(double *)(a1 + 48)];
  [v5 setString:v8];
  [WeakRetained _boundsForText:v8 font:*(void *)(a1 + 32)];
  objc_msgSend(v5, "setBounds:");
  double v9 = *(double *)(a1 + 72);

  return v9;
}

void sub_7510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_752C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  LODWORD(v8) = 5 * a3;
  if (a3) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = 30;
  }
  double v9 = +[NSString localizedStringWithFormat:@"%02i", v8];
  [v6 setFont:*(void *)(a1 + 32)];
  [v6 setFontSize:*(double *)(a1 + 48)];
  [v6 setString:v9];
  [WeakRetained _boundsForText:v9 font:*(void *)(a1 + 32)];
  objc_msgSend(v6, "setBounds:");

  double v10 = *(double *)(a1 + 88);
  return v10;
}

void sub_7778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_7794(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v7) = 2 * a3;
  if (a3) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 30;
  }
  uint64_t v8 = +[NSString localizedStringWithFormat:@"%i", v7];
  if (a3 >= 8) {
    objc_msgSend(v5, "setAnchorPoint:", 0.4, 0.5);
  }
  [v5 setFont:*(void *)(a1 + 32)];
  [v5 setFontSize:*(double *)(a1 + 48)];
  [v5 setString:v8];
  [WeakRetained _boundsForText:v8 font:*(void *)(a1 + 32)];
  objc_msgSend(v5, "setBounds:");
  double v9 = *(double *)(a1 + 72);

  return v9;
}

void sub_7A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_7A1C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  LODWORD(v8) = 3 * a3;
  if (a3) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = 15;
  }
  double v9 = +[NSString localizedStringWithFormat:@"%2i", v8];
  [v6 setFont:*(void *)(a1 + 32)];
  [v6 setFontSize:*(double *)(a1 + 48)];
  [v6 setString:v9];
  [WeakRetained _boundsForText:v9 font:*(void *)(a1 + 32)];
  objc_msgSend(v6, "setBounds:");

  double v10 = *(double *)(a1 + 88);
  return v10;
}

void sub_7CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location)
{
  objc_destroyWeak(v42);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_7CD0(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v7 = a3 % 5;
  if (a3 % 5)
  {
    id v8 = *(id *)(a1 + 40);
    double v9 = *(double *)(a1 + 64);
    double v10 = +[NSString localizedStringWithFormat:@"%i", (10 * v7)];
    LODWORD(v11) = 1050253722;
    [v5 setOpacity:v11];
  }
  else
  {
    id v8 = *(id *)(a1 + 32);
    double v9 = *(double *)(a1 + 56);
    if (a3) {
      uint64_t v12 = (a3 / 5);
    }
    else {
      uint64_t v12 = 6;
    }
    double v10 = +[NSString localizedStringWithFormat:@"%i", v12];
  }
  [v5 setFont:v8];
  [v5 setFontSize:v9];
  [v5 setString:v10];
  [WeakRetained _boundsForText:v10 font:v8];
  objc_msgSend(v5, "setBounds:");
  uint64_t v13 = 96;
  if (!v7) {
    uint64_t v13 = 88;
  }
  double v14 = *(double *)(a1 + v13);

  return v14;
}

void sub_7FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_7FD0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  if (a3) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 3;
  }
  double v9 = +[NSString localizedStringWithFormat:@"%2i", v8];
  [v6 setFont:*(void *)(a1 + 32)];
  [v6 setFontSize:*(double *)(a1 + 48)];
  [v6 setString:v9];
  [WeakRetained _boundsForText:v9 font:*(void *)(a1 + 32)];
  objc_msgSend(v6, "setBounds:");

  double v10 = *(double *)(a1 + 88);
  return v10;
}

void sub_8264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location)
{
  objc_destroyWeak(v42);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_8280(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v7 = a3 % 0xA;
  if (a3 % 0xA)
  {
    id v8 = *(id *)(a1 + 40);
    double v9 = *(double *)(a1 + 64);
    double v10 = +[NSString localizedStringWithFormat:@"%i", (10 * v7)];
    LODWORD(v11) = 1050253722;
    [v5 setOpacity:v11];
  }
  else
  {
    id v8 = *(id *)(a1 + 32);
    double v9 = *(double *)(a1 + 56);
    if (a3) {
      uint64_t v12 = (a3 / 0xA);
    }
    else {
      uint64_t v12 = 3;
    }
    double v10 = +[NSString localizedStringWithFormat:@"%i", v12];
  }
  [v5 setFont:v8];
  [v5 setFontSize:v9];
  [v5 setString:v10];
  [WeakRetained _boundsForText:v10 font:v8];
  objc_msgSend(v5, "setBounds:");
  uint64_t v13 = 96;
  if (!v7) {
    uint64_t v13 = 88;
  }
  double v14 = *(double *)(a1 + v13);

  return v14;
}

void sub_8560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_857C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  if (a3) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 2;
  }
  double v9 = +[NSString localizedStringWithFormat:@"%2i", v8];
  [v6 setFont:*(void *)(a1 + 32)];
  [v6 setFontSize:*(double *)(a1 + 48)];
  [v6 setString:v9];
  [WeakRetained _boundsForText:v9 font:*(void *)(a1 + 32)];
  objc_msgSend(v6, "setBounds:");

  double v10 = *(double *)(a1 + 88);
  return v10;
}

void sub_8890(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v2 deviceCategory];
  +[NTKAnalogUtilities dialDiameterForDevice:v2];
  uint64_t v5 = v4;

  *(void *)&xmmword_23970 = v5;
  [v3 scaledValue:14.0];
  qword_23980 = v6;
  [v3 scaledValue:12.0];
  qword_23988 = v7;
  uint64_t v8 = CLKLocaleCurrentNumberSystem();
  switch(v8)
  {
    case 2:
      [v3 scaledValue:9.5];
      *(void *)&xmmword_239B0 = v16;
      *((UIFontWeight *)&xmmword_239B0 + 1) = UIFontWeightRegular;
      v90[0] = &off_1D998;
      v90[1] = &off_1D9B0;
      v91[0] = &off_1E0B8;
      v91[1] = &off_1E0C8;
      v17 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
      [v3 scaledValue:v17 withOverrides:17.0];
      *((void *)&xmmword_23990 + 1) = v18;

      v88[0] = &off_1D998;
      v88[1] = &off_1D9B0;
      v89[0] = &off_1E0D8;
      v89[1] = &off_1E0E8;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
      double v19 = 11.0;
LABEL_7:
      [v3 scaledValue:v12 withOverrides:v19];
      double v14 = 12.5;
      double v15 = 15.0;
      goto LABEL_8;
    case 1:
      [v3 scaledValue:9.5];
      *(void *)&xmmword_239B0 = v20;
      *((UIFontWeight *)&xmmword_239B0 + 1) = UIFontWeightRegular;
      v94[0] = &off_1D998;
      v94[1] = &off_1D9B0;
      v95[0] = &off_1E078;
      v95[1] = &off_1E088;
      v21 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
      [v3 scaledValue:v21 withOverrides:16.0];
      *((void *)&xmmword_23990 + 1) = v22;

      v92[0] = &off_1D998;
      v92[1] = &off_1D9B0;
      v93[0] = &off_1E098;
      v93[1] = &off_1E0A8;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
      double v19 = 10.0;
      goto LABEL_7;
    case 0:
      [v3 scaledValue:6.5];
      *(void *)&xmmword_239B0 = v9;
      *((UIFontWeight *)&xmmword_239B0 + 1) = UIFontWeightSemibold;
      v98[0] = &off_1D998;
      v98[1] = &off_1D9B0;
      v99[0] = &off_1E038;
      v99[1] = &off_1E048;
      double v10 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];
      [v3 scaledValue:v10 withOverrides:13.0];
      *((void *)&xmmword_23990 + 1) = v11;

      v96[0] = &off_1D998;
      v96[1] = &off_1D9B0;
      v97[0] = &off_1E058;
      v97[1] = &off_1E068;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
      [v3 scaledValue:v12 withOverrides:8.0];
      double v14 = 12.0;
      double v15 = 14.0;
LABEL_8:
      qword_239A0 = v13;

      [v3 scaledValue:v15];
      qword_23980 = v23;
      [v3 scaledValue:v14];
      qword_23988 = v24;
      break;
  }
  v86[0] = &off_1D998;
  v86[1] = &off_1D9B0;
  v87[0] = &off_1E0F8;
  v87[1] = &off_1E108;
  v25 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
  [v3 scaledValue:v25 withOverrides:50.0];
  qword_239C0 = v26;

  v84[0] = &off_1D998;
  v84[1] = &off_1D9B0;
  v85[0] = &off_1E118;
  v85[1] = &off_1E058;
  v27 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
  [v3 scaledValue:v27 withOverrides:7.0];
  qword_239A8 = v28;

  [v3 scaledValue:10.0];
  *(void *)&xmmword_23990 = v29;
  v82[0] = &off_1D998;
  long long v69 = xmmword_16990;
  v30 = +[NSValue valueWithBytes:&v69 objCType:"{CGSize=dd}"];
  v82[1] = &off_1D9B0;
  v83[0] = v30;
  long long v68 = xmmword_169A0;
  v31 = +[NSValue valueWithBytes:&v68 objCType:"{CGSize=dd}"];
  v83[1] = v31;
  v32 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
  objc_msgSend(v3, "scaledSize:withOverrides:", v32, 1.0, 6.5);
  qword_239C8 = v33;
  *(void *)&xmmword_239D0 = v34;

  v80[0] = &off_1D998;
  long long v67 = xmmword_169B0;
  v35 = +[NSValue valueWithBytes:&v67 objCType:"{CGSize=dd}"];
  v80[1] = &off_1D9B0;
  v81[0] = v35;
  long long v66 = xmmword_169C0;
  v36 = +[NSValue valueWithBytes:&v66 objCType:"{CGSize=dd}"];
  v81[1] = v36;
  v37 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
  objc_msgSend(v3, "scaledSize:withOverrides:", v37, 0.5, 6.5);
  *((void *)&xmmword_239D0 + 1) = v38;
  unk_239E0 = v39;

  v78[0] = &off_1D998;
  long long v65 = xmmword_169D0;
  v40 = +[NSValue valueWithBytes:&v65 objCType:"{CGSize=dd}"];
  v78[1] = &off_1D9B0;
  v79[0] = v40;
  long long v64 = xmmword_169E0;
  v41 = +[NSValue valueWithBytes:&v64 objCType:"{CGSize=dd}"];
  v79[1] = v41;
  v42 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
  objc_msgSend(v3, "scaledSize:withOverrides:", v42, 0.5, 3.5);
  qword_239E8 = v43;
  *(void *)&xmmword_239F0 = v44;

  v76 = &off_1D9B0;
  long long v63 = xmmword_169F0;
  v45 = +[NSValue valueWithBytes:&v63 objCType:"{CGSize=dd}"];
  v77 = v45;
  v46 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  objc_msgSend(v3, "scaledSize:withOverrides:", v46, 1.0, 4.0);
  *((void *)&xmmword_239F0 + 1) = v47;
  unk_23A00 = v48;

  v74 = &off_1D9B0;
  long long v62 = xmmword_169E0;
  v49 = +[NSValue valueWithBytes:&v62 objCType:"{CGSize=dd}"];
  v75 = v49;
  v50 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  objc_msgSend(v3, "scaledSize:withOverrides:", v50, 0.5, 3.5);
  qword_23A08 = v51;
  *(void *)&xmmword_23A10 = v52;

  v72[0] = &off_1D998;
  long long v61 = xmmword_16A00;
  v53 = +[NSValue valueWithBytes:&v61 objCType:"{CGSize=dd}"];
  v72[1] = &off_1D9B0;
  v73[0] = v53;
  long long v60 = xmmword_16A10;
  v54 = +[NSValue valueWithBytes:&v60 objCType:"{CGSize=dd}"];
  v73[1] = v54;
  v55 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
  objc_msgSend(v3, "scaledSize:withOverrides:", v55, 0.5, 2.5);
  *((void *)&xmmword_23A10 + 1) = v56;
  qword_23A20 = v57;

  [v3 setRoundingBehavior:2];
  v70[0] = &off_1D998;
  v70[1] = &off_1D9B0;
  v71[0] = &off_1E128;
  v71[1] = &off_1E138;
  v58 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
  [v3 scaledValue:v58 withOverrides:44.0];
  *((void *)&xmmword_23970 + 1) = v59;
}

void sub_9EF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_9FD4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x4010000000000000;
  uint64_t v2 = +[UIColor colorWithRed:0.658823529 green:0.580392157 blue:0.364705882 alpha:1.0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  uint64_t v5 = +[UIColor colorWithRed:0.160784314 green:0.137254902 blue:0.0784313725 alpha:1.0];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v5;

  uint64_t v8 = +[UIColor colorWithRed:0.898039216 green:0.796078431 blue:0.482352941 alpha:1.0];
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = +[UIColor colorWithRed:0.360784314 green:0.317647059 blue:0.192156863 alpha:1.0];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v11;

  uint64_t v14 = +[UIColor whiteColor];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 72);
  *(void *)(v15 + 72) = v14;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(*(void *)(a1 + 32) + 40));
  uint64_t v17 = +[UIColor whiteColor];
  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = *(void **)(v18 + 64);
  *(void *)(v18 + 64) = v17;

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
}

void sub_A13C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x4010000000000000;
  uint64_t v2 = +[UIColor colorWithRed:0.658823529 green:0.474509804 blue:0.329411765 alpha:1.0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  uint64_t v5 = +[UIColor colorWithRed:0.180392157 green:0.137254902 blue:0.109803922 alpha:1.0];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v5;

  uint64_t v8 = +[UIColor colorWithRed:0.91372549 green:0.705882353 blue:0.549019608 alpha:1.0];
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = +[UIColor colorWithRed:0.364705882 green:0.282352941 blue:0.219607843 alpha:1.0];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v11;

  uint64_t v14 = +[UIColor whiteColor];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 72);
  *(void *)(v15 + 72) = v14;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(*(void *)(a1 + 32) + 40));
  uint64_t v17 = +[UIColor whiteColor];
  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = *(void **)(v18 + 64);
  *(void *)(v18 + 64) = v17;

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
}

void sub_A2A4(uint64_t a1)
{
  uint64_t v2 = +[UIColor whiteColor];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = +[UIColor whiteColor];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
}

void sub_A9CC(id a1, NTKHandView *a2)
{
  uint64_t v2 = a2;
  [(NTKHandView *)v2 zRotation];
  double v4 = v3 / -6.28318531;
  if (v4 > 0.5) {
    double v4 = 1.0 - v4;
  }
  if (v4 <= 0.25) {
    double v5 = v4;
  }
  else {
    double v5 = 0.25;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_AAA4;
  v7[3] = &unk_1C7B0;
  uint64_t v8 = v2;
  uint64_t v6 = v2;
  +[UIView animateWithDuration:v7 animations:v5];
}

id sub_AAA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setZRotation:0.0];
}

id sub_AB88(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[4];
  double v4 = *(double *)(a1 + 48);
  *(float *)&double v4 = v4;
  [v2 zRotationForTime:*(double *)(a1 + 40) withDuration:v4];
  [v3 setZRotation:v5];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)v6[6];
  double v8 = *(double *)(a1 + 56);
  *(float *)&double v8 = v8;
  [v6 zRotationForTime:*(double *)(a1 + 40) withDuration:v8];
  [v7 setZRotation:v9];
  double v10 = *(void **)(a1 + 32);
  uint64_t v11 = (void *)v10[5];
  double v12 = *(double *)(a1 + 48);
  *(float *)&double v12 = v12;
  [v10 zRotationForTime:*(double *)(a1 + 64) withDuration:v12];
  [v11 setZRotation:v13];
  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = (void *)v14[7];
  double v16 = *(double *)(a1 + 56);
  *(float *)&double v16 = v16;
  [v14 zRotationForTime:*(double *)(a1 + 64) withDuration:v16];
  double v18 = v17;

  return [v15 setZRotation:v18];
}

void sub_AEFC(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  double v7 = a3;
  if (a3 < 0.0) {
    double v7 = *(double *)(a1 + 40) + a3;
  }
  float v9 = *(void **)(a1 + 32);
  id v10 = a2;
  uint64_t v11 = +[NSNumber numberWithDouble:v7];
  [v9 setFromValue:v11];

  double v12 = *(void **)(a1 + 32);
  float v13 = +[NSNumber numberWithDouble:v7 + *(double *)(a1 + 40)];
  [v12 setToValue:v13];

  [*(id *)(a1 + 32) setDuration:a4];
  [*(id *)(a1 + 32) setFrameInterval:1.0 / a5];
  id v14 = [v10 layer];

  [v14 addAnimation:*(void *)(a1 + 32) forKey:@"chrono"];
}

void sub_B054(id a1, NTKHandView *a2)
{
  id v5 = [(NTKHandView *)a2 layer];
  uint64_t v2 = [v5 animationForKey:@"chrono"];

  if (v2)
  {
    double v3 = [v5 presentationLayer];
    double v4 = [v3 valueForKeyPath:@"transform.rotation"];
    [v5 setValue:v4 forKeyPath:@"transform.rotation"];

    [v5 removeAnimationForKey:@"chrono"];
  }
}

id sub_B1BC(uint64_t a1, void *a2)
{
  return [a2 setHidden:*(unsigned __int8 *)(a1 + 32)];
}

id sub_B870(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  CGAffineTransformMakeScale(&v3, 0.9, 0.9);
  return [v1 setTransform:&v3];
}

id sub_B8C4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_B954;
  v2[3] = &unk_1C7B0;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:0x20000 delay:v2 options:0 animations:0.2 completion:0.0];
}

id sub_B954(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v1 setTransform:v4];
}

void sub_C280(uint64_t a1, void *a2)
{
  id v2 = a2;
  CGAffineTransform v3 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_1D9E0, &off_1D9F8, &off_1DA10, &off_1DA28, &off_1DA40, &off_1DA58, &off_1DA70, 0);
  if (NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues())
  {
    if ((char *)[v2 materialType] - 5 >= (unsigned char *)&dword_0 + 2) {
      double v4 = &off_1DAA0;
    }
    else {
      double v4 = &off_1DA88;
    }
  }
  else
  {
    double v4 = &off_1DAB8;
  }
  [v3 addObject:v4];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)qword_23A40;
  qword_23A40 = v5;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = objc_msgSend((id)objc_opt_class(), "optionWithPaletteColor:forDevice:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "unsignedIntegerValue"), v2);
        if (v12) {
          [(id)qword_23A40 addObject:v12];
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

void sub_CA18(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_23A98);
  id WeakRetained = objc_loadWeakRetained(&qword_23AA0);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_23AA0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_23AA8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_23AA0, obj);
  qword_23AA8 = (uint64_t)[obj version];

  sub_11D78(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_23A98);
  long long v10 = *(_OWORD *)&qword_23A78;
  *a2 = xmmword_23A68;
  a2[1] = v10;
  a2[2] = xmmword_23A88;
}

void sub_CCE0(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_23B20);
  id WeakRetained = objc_loadWeakRetained(&qword_23B28);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_23B28);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_23B30;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_23B28, obj);
  qword_23B30 = (uint64_t)[obj version];

  sub_11FDC(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_23B20);
  long long v10 = *(_OWORD *)&qword_23B00;
  a2[4] = xmmword_23AF0;
  a2[5] = v10;
  a2[6] = xmmword_23B10;
  long long v11 = *(_OWORD *)&qword_23AC0;
  *a2 = xmmword_23AB0;
  a2[1] = v11;
  long long v12 = *(_OWORD *)&qword_23AE0;
  a2[2] = xmmword_23AD0;
  a2[3] = v12;
}

void sub_DACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_DAFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && (CGAffineTransform v3 = (void *)*((void *)WeakRetained + 12)) != 0)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSDate date];
  }
  id v5 = v4;

  return v5;
}

id sub_DB6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && (CGAffineTransform v3 = (void *)*((void *)WeakRetained + 12)) != 0)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSDate date];
  }
  id v5 = v4;

  return v5;
}

double sub_E094(void *a1, int a2)
{
  id v3 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_23B58);
  id WeakRetained = objc_loadWeakRetained(&qword_23B60);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&qword_23B60);
    if (v6 == v3)
    {
      id v7 = [v3 version];
      uint64_t v8 = qword_23B68;

      if (v7 == (id)v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&qword_23B60, v3);
  qword_23B68 = (uint64_t)[v3 version];

  sub_1253C(v10, (uint64_t)v3);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_23B58);
  long long v11 = &qword_23B48;
  if (!a2) {
    long long v11 = &qword_23B38;
  }
  double v12 = *(double *)v11;

  return v12;
}

void sub_EF1C(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = [a3 display];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v6 = v5;
    [v6 setForegroundAlpha:*(double *)(a1 + 40)];
    [v6 setForegroundImageAlpha:*(double *)(a1 + 48)];
    if ([v13 isEqualToString:NTKComplicationSlotDate])
    {
      id v7 = [*(id *)(a1 + 32) _dateForegroundColorForEditMode:*(void *)(a1 + 56)];
      uint64_t v8 = [*(id *)(a1 + 32) _dateForegroundColorForEditMode:*(void *)(a1 + 64)];
      id v9 = NTKInterpolateBetweenColors();
      [v6 setForegroundColor:v9];

      uint64_t v10 = [*(id *)(a1 + 32) _dateAccentColorForEditMode:*(void *)(a1 + 56)];
      long long v11 = [*(id *)(a1 + 32) _dateAccentColorForEditMode:*(void *)(a1 + 64)];
      double v12 = NTKInterpolateBetweenColors();
      [v6 setAccentColor:v12];
    }
  }
}

void sub_FC20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_FC3C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[1] setAlpha:*(double *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

id sub_10290(uint64_t a1, void *a2)
{
  id v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 48), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 56), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 64), "drawInRect:", v5, v7, v9, v11);
  double v12 = *(void **)(a1 + 72);

  return objc_msgSend(v12, "drawInRect:", v5, v7, v9, v11);
}

void sub_1056C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10588(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[2];
    long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v6 = v9[0];
    v9[1] = v7;
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    long long v5 = v10;
    [v3 setTransform:v9];
    double v4 = (void *)v2[3];
    v8[0] = v6;
    v8[1] = v7;
    v8[2] = v5;
    [v4 setTransform:v8];
  }
}

uint64_t sub_10814(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10C28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10C50(id a1, UIView *a2)
{
  id v2 = a2;
  [(UIView *)v2 setHidden:0];
  [(UIView *)v2 setAlpha:0.0];
}

void sub_10C9C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[19] setAlpha:1.0];
  [WeakRetained _enumerateTimeModeViewsWithBlock:&stru_1C9F8];
  [WeakRetained _enumerateChronoModeViewsWithBlock:&stru_1CA18];
}

void sub_10D0C(id a1, UIView *a2)
{
}

void sub_10D18(id a1, UIView *a2)
{
}

uint64_t sub_10D24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 13) == 1)
    {
      double v4 = WeakRetained;
      if (([*(id *)(a1 + 32) editing] & 1) == 0) {
        [v4 _enumerateChronoModeViewsWithBlock:&stru_1CA38];
      }
    }
  }

  return _objc_release_x1();
}

void sub_10DA8(id a1, UIView *a2)
{
}

void sub_11024(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1104C(id a1, UIView *a2)
{
  id v2 = a2;
  [(UIView *)v2 setHidden:0];
  [(UIView *)v2 setAlpha:0.0];
}

void sub_11098(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enumerateChronoModeViewsWithBlock:&stru_1CAA0];
  [WeakRetained _enumerateTimeModeViewsWithBlock:&stru_1CAC0];
}

void sub_110F0(id a1, UIView *a2)
{
}

void sub_110FC(id a1, UIView *a2)
{
}

uint64_t sub_11108(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 13) == 2)
    {
      double v4 = WeakRetained;
      if (([*(id *)(a1 + 32) editing] & 1) == 0) {
        [v4 _enumerateTimeModeViewsWithBlock:&stru_1CAE0];
      }
    }
  }

  return _objc_release_x1();
}

void sub_1118C(id a1, UIView *a2)
{
}

void sub_11524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_11540(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  uint64_t v3 = [v2 display];
  [v3 setAlpha:*(double *)(a1 + 40)];
}

void sub_11D78(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v22[0] = &off_1DB48;
  v22[1] = &off_1DB60;
  v23[0] = &off_1E148;
  v23[1] = &off_1E158;
  v22[2] = &off_1DB78;
  v23[2] = &off_1E168;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  [v2 scaledValue:v3 withOverrides:10.5];
  *(void *)&xmmword_23A68 = v4;

  v20[0] = &off_1DB48;
  v20[1] = &off_1DB60;
  v21[0] = &off_1E148;
  v21[1] = &off_1E158;
  v20[2] = &off_1DB78;
  v21[2] = &off_1E178;
  long long v5 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v2 scaledValue:v5 withOverrides:11.5];
  *((void *)&xmmword_23A68 + 1) = v6;

  [v2 scaledValue:3 withOverride:31.0 forSizeClass:31.0];
  qword_23A78 = v7;
  v18[0] = &off_1DB48;
  v18[1] = &off_1DB78;
  v19[0] = &off_1E188;
  v19[1] = &off_1E198;
  double v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v2 scaledValue:v8 withOverrides:52.5];
  qword_23A80 = v9;

  v16[0] = &off_1DB48;
  v16[1] = &off_1DB78;
  v17[0] = &off_1E1A8;
  v17[1] = &off_1E1B8;
  long long v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v2 scaledValue:v10 withOverrides:34.0];
  *(void *)&xmmword_23A88 = v11;

  v14[0] = &off_1DB48;
  v14[1] = &off_1DB78;
  v15[0] = &off_1E1C8;
  v15[1] = &off_1E1D8;
  double v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 scaledValue:v12 withOverrides:27.5];
  *((void *)&xmmword_23A88 + 1) = v13;
}

void sub_11FDC(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v2 = +[CLKDeviceMetrics metricsWithDevice:v21 identitySizeClass:2];
  v34[0] = &off_1DB48;
  v34[1] = &off_1DB60;
  v35[0] = &off_1E1E8;
  v35[1] = &off_1E1F8;
  v34[2] = &off_1DB90;
  v34[3] = &off_1DBC0;
  v35[2] = &off_1DBA8;
  v35[3] = &off_1E148;
  v34[4] = &off_1DBD8;
  v34[5] = &off_1DBF0;
  v35[4] = &off_1E208;
  v35[5] = &off_1E218;
  v34[6] = &off_1DC08;
  v35[6] = &off_1E228;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:7];
  [v2 scaledValue:v3 withOverrides:2.0];
  *(void *)&xmmword_23AB0 = v4;

  v32[0] = &off_1DB48;
  v32[1] = &off_1DB60;
  v33[0] = &off_1E238;
  v33[1] = &off_1E238;
  v32[2] = &off_1DB78;
  v32[3] = &off_1DBD8;
  v33[2] = &off_1E248;
  v33[3] = &off_1E1C8;
  v32[4] = &off_1DBF0;
  v32[5] = &off_1DC08;
  v33[4] = &off_1E258;
  v33[5] = &off_1E268;
  long long v5 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
  [v2 scaledValue:v5 withOverrides:16.0];
  *((void *)&xmmword_23AB0 + 1) = v6;

  v30[0] = &off_1DB48;
  v30[1] = &off_1DB60;
  v31[0] = &off_1E278;
  v31[1] = &off_1E1F8;
  v30[2] = &off_1DB90;
  v30[3] = &off_1DBC0;
  v31[2] = &off_1DBA8;
  v31[3] = &off_1E148;
  v30[4] = &off_1DBD8;
  v30[5] = &off_1DBF0;
  v31[4] = &off_1E288;
  v31[5] = &off_1E148;
  v30[6] = &off_1DC08;
  v31[6] = &off_1E298;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];
  [v2 scaledValue:v7 withOverrides:2.0];
  qword_23AC0 = v8;

  qword_23AC8 = *((void *)&xmmword_23AB0 + 1);
  v28[0] = &off_1DB48;
  v28[1] = &off_1DB60;
  v29[0] = &off_1E1F8;
  v29[1] = &off_1E278;
  v28[2] = &off_1DB78;
  v28[3] = &off_1DB90;
  v29[2] = &off_1E238;
  v29[3] = &off_1DC20;
  v28[4] = &off_1DBC0;
  v28[5] = &off_1DBD8;
  v29[4] = &off_1E2A8;
  v29[5] = &off_1E288;
  v28[6] = &off_1DBF0;
  v28[7] = &off_1DC08;
  v29[6] = &off_1E2A8;
  v29[7] = &off_1E298;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:8];
  [v2 scaledValue:v9 withOverrides:2.0];
  *(void *)&xmmword_23AD0 = v10;

  v26[0] = &off_1DB48;
  v26[1] = &off_1DB60;
  v27[0] = &off_1E1F8;
  v27[1] = &off_1E278;
  v26[2] = &off_1DB78;
  v26[3] = &off_1DB90;
  v26[4] = &off_1DBC0;
  v27[2] = &off_1E238;
  v27[3] = &off_1DC20;
  v26[5] = &off_1DBD8;
  v26[6] = &off_1DBF0;
  v27[4] = &off_1E2A8;
  v27[5] = &off_1E288;
  v26[7] = &off_1DC08;
  v27[6] = &off_1E2A8;
  v27[7] = &off_1E298;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:8];
  [v2 scaledValue:v11 withOverrides:2.0];
  *((void *)&xmmword_23AD0 + 1) = v12;

  qword_23AE0 = 0x4018000000000000;
  v24[0] = &off_1DB48;
  v24[1] = &off_1DB60;
  v25[0] = &off_1E278;
  v25[1] = &off_1E278;
  v24[2] = &off_1DB78;
  v24[3] = &off_1DB90;
  v25[2] = &off_1E298;
  v25[3] = &off_1DC38;
  v24[4] = &off_1DBC0;
  v24[5] = &off_1DBD8;
  v25[4] = &off_1DC38;
  v25[5] = &off_1DC50;
  v24[6] = &off_1DBF0;
  v24[7] = &off_1DC08;
  v25[6] = &off_1E208;
  v25[7] = &off_1E2B8;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:8];
  [v2 scaledValue:v13 withOverrides:5.0];
  qword_23AE8 = v14;

  *(void *)&xmmword_23AF0 = 0xC02C000000000000;
  [v2 scaledValue:28.5];
  qword_23B08 = v15;
  [v2 scaledValue:3 withOverride:13.5 forSizeClass:13.5];
  qword_23B00 = v16;
  +[NTKAnalogUtilities dialDiameterForDevice:v21];
  uint64_t v18 = v17;

  *(void *)&xmmword_23B10 = v18;
  *((void *)&xmmword_23AF0 + 1) = v18;
  [v2 setRoundingBehavior:2];
  v22[0] = &off_1DB48;
  v22[1] = &off_1DB78;
  v23[0] = &off_1E2C8;
  v23[1] = &off_1E2D8;
  double v19 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v2 scaledValue:v19 withOverrides:30.0];
  *((void *)&xmmword_23B10 + 1) = v20;
}

void sub_1253C(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v14[0] = &off_1DB78;
  v14[1] = &off_1DB90;
  v15[0] = &off_1E2E8;
  v15[1] = &off_1E2F8;
  void v14[2] = &off_1DBC0;
  v14[3] = &off_1DBD8;
  void v15[2] = &off_1E308;
  v15[3] = &off_1E308;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  [v2 scaledValue:v3 withOverrides:32.0];
  qword_23B48 = v4;

  v12[0] = &off_1DB78;
  v12[1] = &off_1DB90;
  v13[0] = &off_1E218;
  v13[1] = &off_1E228;
  v12[2] = &off_1DBC0;
  v12[3] = &off_1DBD8;
  v13[2] = &off_1E288;
  v13[3] = &off_1E318;
  v12[4] = &off_1DBF0;
  v12[5] = &off_1DC08;
  v13[4] = &off_1E208;
  v13[5] = &off_1E2B8;
  long long v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
  [v2 scaledValue:v5 withOverrides:4.0];
  qword_23B50 = v6;

  [v2 scaledValue:3 withOverride:24.0 forSizeClass:26.0];
  qword_23B38 = v7;
  v10[0] = &off_1DB48;
  v10[1] = &off_1DB60;
  v11[0] = &off_1E328;
  v11[1] = &off_1E338;
  v10[2] = &off_1DB78;
  v10[3] = &off_1DB90;
  v11[2] = &off_1E348;
  v11[3] = &off_1DC68;
  v10[4] = &off_1DBC0;
  v11[4] = &off_1DC80;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];
  [v2 scaledValue:v8 withOverrides:10.5];
  qword_23B40 = v9;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKFloorForDevice()
{
  return _CLKFloorForDevice();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKLocaleNumberSystemPrefix()
{
  return _CLKLocaleNumberSystemPrefix();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectCenteredAboutPointForDevice()
{
  return _CLKRectCenteredAboutPointForDevice();
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return _CLKRectCenteredIntegralRectForDevice();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllUtilitySmallComplicationTypes()
{
  return _NTKAllUtilitySmallComplicationTypes();
}

uint64_t NTKColorByBrightening()
{
  return _NTKColorByBrightening();
}

uint64_t NTKColorByPremultiplyingAlpha()
{
  return _NTKColorByPremultiplyingAlpha();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues()
{
  return _NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues();
}

uint64_t NTKFaceColorNameAndCollection()
{
  return _NTKFaceColorNameAndCollection();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKKeylineCornerRadiusSmall()
{
  return _NTKKeylineCornerRadiusSmall();
}

uint64_t NTKKeylineViewWithCircle()
{
  return _NTKKeylineViewWithCircle();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CLKFontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithMonospacedNumbers];
}

id objc_msgSend__chronoDefaultOption(void *a1, const char *a2, ...)
{
  return [a1 _chronoDefaultOption];
}

id objc_msgSend__chronoLabelFontSize(void *a1, const char *a2, ...)
{
  return [a1 _chronoLabelFontSize];
}

id objc_msgSend__dateComplicationCenterOffset(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationCenterOffset];
}

id objc_msgSend__dateComplicationRightAlignment(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationRightAlignment];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return [a1 _imageThatSuppressesAccessibilityHairlineThickening];
}

id objc_msgSend__isStopwatchUIVisible(void *a1, const char *a2, ...)
{
  return [a1 _isStopwatchUIVisible];
}

id objc_msgSend__loadChronoModeViews(void *a1, const char *a2, ...)
{
  return [a1 _loadChronoModeViews];
}

id objc_msgSend__loadDialViews(void *a1, const char *a2, ...)
{
  return [a1 _loadDialViews];
}

id objc_msgSend__loadTimeModeViews(void *a1, const char *a2, ...)
{
  return [a1 _loadTimeModeViews];
}

id objc_msgSend__lowerSubdialCenter(void *a1, const char *a2, ...)
{
  return [a1 _lowerSubdialCenter];
}

id objc_msgSend__reconsiderStopwatchUpdates(void *a1, const char *a2, ...)
{
  return [a1 _reconsiderStopwatchUpdates];
}

id objc_msgSend__removeModeRelatedUIs(void *a1, const char *a2, ...)
{
  return [a1 _removeModeRelatedUIs];
}

id objc_msgSend__startButtonLayoutConstants(void *a1, const char *a2, ...)
{
  return [a1 _startButtonLayoutConstants];
}

id objc_msgSend__stopStopwatchUpdates(void *a1, const char *a2, ...)
{
  return [a1 _stopStopwatchUpdates];
}

id objc_msgSend__stopwatchCurrentLapTime(void *a1, const char *a2, ...)
{
  return [a1 _stopwatchCurrentLapTime];
}

id objc_msgSend__stopwatchCurrentTime(void *a1, const char *a2, ...)
{
  return [a1 _stopwatchCurrentTime];
}

id objc_msgSend__stopwatchIsRunning(void *a1, const char *a2, ...)
{
  return [a1 _stopwatchIsRunning];
}

id objc_msgSend__stopwatchIsStopped(void *a1, const char *a2, ...)
{
  return [a1 _stopwatchIsStopped];
}

id objc_msgSend__stopwatchLapCount(void *a1, const char *a2, ...)
{
  return [a1 _stopwatchLapCount];
}

id objc_msgSend__synchronizeChronoTimeLabelsWithStopwatch(void *a1, const char *a2, ...)
{
  return [a1 _synchronizeChronoTimeLabelsWithStopwatch];
}

id objc_msgSend__unloadDialViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadDialViews];
}

id objc_msgSend__upperSubdialCenter(void *a1, const char *a2, ...)
{
  return [a1 _upperSubdialCenter];
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return [a1 _value];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_alternativeTickColor(void *a1, const char *a2, ...)
{
  return [a1 alternativeTickColor];
}

id objc_msgSend_anchorPointFromConfiguration(void *a1, const char *a2, ...)
{
  return [a1 anchorPointFromConfiguration];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_chronoDuration(void *a1, const char *a2, ...)
{
  return [a1 chronoDuration];
}

id objc_msgSend_chronoFlybackSecondHandView(void *a1, const char *a2, ...)
{
  return [a1 chronoFlybackSecondHandView];
}

id objc_msgSend_chronoHandColor(void *a1, const char *a2, ...)
{
  return [a1 chronoHandColor];
}

id objc_msgSend_chronoSecondHandView(void *a1, const char *a2, ...)
{
  return [a1 chronoSecondHandView];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorOption(void *a1, const char *a2, ...)
{
  return [a1 colorOption];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createClockSubdialText(void *a1, const char *a2, ...)
{
  return [a1 createClockSubdialText];
}

id objc_msgSend_createClockText(void *a1, const char *a2, ...)
{
  return [a1 createClockText];
}

id objc_msgSend_createSubdialText(void *a1, const char *a2, ...)
{
  return [a1 createSubdialText];
}

id objc_msgSend_createText(void *a1, const char *a2, ...)
{
  return [a1 createText];
}

id objc_msgSend_createTicks(void *a1, const char *a2, ...)
{
  return [a1 createTicks];
}

id objc_msgSend_createTimescaleLabel(void *a1, const char *a2, ...)
{
  return [a1 createTimescaleLabel];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationColor];
}

id objc_msgSend_dateStyle(void *a1, const char *a2, ...)
{
  return [a1 dateStyle];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dialComplicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 dialComplicationContainerView];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceViewWantsComplicationKeylineFramesReloaded(void *a1, const char *a2, ...)
{
  return [a1 faceViewWantsComplicationKeylineFramesReloaded];
}

id objc_msgSend_faceViewWantsUnadornedSnapshotViewRemoved(void *a1, const char *a2, ...)
{
  return [a1 faceViewWantsUnadornedSnapshotViewRemoved];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_glyphBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 glyphBackgroundColor];
}

id objc_msgSend_glyphColor(void *a1, const char *a2, ...)
{
  return [a1 glyphColor];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_inlayColor(void *a1, const char *a2, ...)
{
  return [a1 inlayColor];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_largeTickValue(void *a1, const char *a2, ...)
{
  return [a1 largeTickValue];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_materialType(void *a1, const char *a2, ...)
{
  return [a1 materialType];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return [a1 overrideDate];
}

id objc_msgSend_paletteColor(void *a1, const char *a2, ...)
{
  return [a1 paletteColor];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_secondsAnimationFPS(void *a1, const char *a2, ...)
{
  return [a1 secondsAnimationFPS];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return [a1 sharedCache];
}

id objc_msgSend_shouldShowUnsnapshotableContent(void *a1, const char *a2, ...)
{
  return [a1 shouldShowUnsnapshotableContent];
}

id objc_msgSend_showChronoMode(void *a1, const char *a2, ...)
{
  return [a1 showChronoMode];
}

id objc_msgSend_showTimeMode(void *a1, const char *a2, ...)
{
  return [a1 showTimeMode];
}

id objc_msgSend_showsShadows(void *a1, const char *a2, ...)
{
  return [a1 showsShadows];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_smallTickValue(void *a1, const char *a2, ...)
{
  return [a1 smallTickValue];
}

id objc_msgSend_startStop(void *a1, const char *a2, ...)
{
  return [a1 startStop];
}

id objc_msgSend_stopChronoAnimation(void *a1, const char *a2, ...)
{
  return [a1 stopChronoAnimation];
}

id objc_msgSend_subdial(void *a1, const char *a2, ...)
{
  return [a1 subdial];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_systemTealColor(void *a1, const char *a2, ...)
{
  return [a1 systemTealColor];
}

id objc_msgSend_tickColor(void *a1, const char *a2, ...)
{
  return [a1 tickColor];
}

id objc_msgSend_tickGroups(void *a1, const char *a2, ...)
{
  return [a1 tickGroups];
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return [a1 timeLabel];
}

id objc_msgSend_timeScale(void *a1, const char *a2, ...)
{
  return [a1 timeScale];
}

id objc_msgSend_timeScrubbing(void *a1, const char *a2, ...)
{
  return [a1 timeScrubbing];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_timescale(void *a1, const char *a2, ...)
{
  return [a1 timescale];
}

id objc_msgSend_tinyBabyHandConfiguration(void *a1, const char *a2, ...)
{
  return [a1 tinyBabyHandConfiguration];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateLapHandsVisibility(void *a1, const char *a2, ...)
{
  return [a1 updateLapHandsVisibility];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_updateStartSessionButtonGlyph(void *a1, const char *a2, ...)
{
  return [a1 updateStartSessionButtonGlyph];
}

id objc_msgSend_upperDuration(void *a1, const char *a2, ...)
{
  return [a1 upperDuration];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_zRotation(void *a1, const char *a2, ...)
{
  return [a1 zRotation];
}

id objc_msgSend_zRotationForTime_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zRotationForTime:withDuration:");
}