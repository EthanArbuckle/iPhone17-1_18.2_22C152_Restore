void sub_2BE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_2C00(void *a1)
{
  v1 = [a1 nrDeviceUUID];
  if (!v1)
  {
    v1 = +[NSNull null];
  }

  return v1;
}

void sub_2CC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NTKGetCharacterFaceBundle()
{
  if (qword_26220 != -1) {
    dispatch_once(&qword_26220, &stru_1C7D8);
  }
  v0 = (void *)qword_26218;

  return v0;
}

void sub_43A0(id a1)
{
  qword_26218 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

double sub_4A84(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26238);
  id WeakRetained = objc_loadWeakRetained(&qword_26240);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_26240);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_26240, v1);
    qword_26248 = (uint64_t)[v1 version];

    sub_5D58(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_26248;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26238);
  double v9 = *(double *)&qword_26228;

  return v9;
}

void sub_4E6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
    id v5 = a2;
    [v5 prepareToAnimateToDate:v2 forOrb:v3];
  }
  else
  {
    id v4 = a2;
    id v5 = +[NTKDate faceDate];
    objc_msgSend(v4, "prepareToAnimateToDate:forOrb:");
  }
}

void sub_4F08(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    [v6 prepareToAnimateToDate:v3 forOrb:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    id v5 = +[NTKDate faceDate];
    [v6 prepareToAnimateToDate:v5 forOrb:*(unsigned __int8 *)(a1 + 40)];
  }
  LODWORD(v4) = 1.0;
  [v6 setOverrideDateFraction:v4];
  [v6 forceUpdateTimeVariables];
  [v6 cleanupToOverrideDate:*(void *)(a1 + 32)];
}

id sub_5040(uint64_t a1, void *a2)
{
  return [a2 cleanupToOverrideDate:*(void *)(a1 + 32)];
}

void sub_53B0(uint64_t a1, void *a2)
{
  float v3 = NTKEditModeDimmedAlpha;
  if (*(void *)(a1 + 32)) {
    float v4 = NTKEditModeDimmedAlpha;
  }
  else {
    float v4 = 1.0;
  }
  id v7 = a2;
  *(float *)&double v5 = v4;
  [v7 setNumbersBrightness:v5];
  if (*(void *)(a1 + 32) == 1) {
    *(float *)&double v6 = v3;
  }
  else {
    *(float *)&double v6 = 1.0;
  }
  [v7 setGlowBrightness:v6];
}

void sub_54F8(uint64_t a1, void *a2)
{
  id v4 = a2;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v2 = v2;
  [v4 setNumbersBrightness:v2];
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v3 = v3;
  [v4 setGlowBrightness:v3];
}

void sub_5944(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_5A1C(uint64_t a1, void *a2)
{
  if (*(double *)(a1 + 32) <= *(double *)(a1 + 40))
  {
    __asm { FMOV            V0.2S, #1.0 }
    *((float *)&_D0 + 1) = *(float *)(a1 + 52) / *(float *)(a1 + 48);
  }
  else
  {
    __asm { FMOV            V0.2S, #1.0 }
    *(float *)&_D0 = *(float *)(a1 + 48) / *(float *)(a1 + 52);
  }
  return [a2 setGlobalScale:_D0];
}

void sub_5C08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_5C24(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _endScrubbing];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_5D58(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 deviceCategory] == (char *)&dword_0 + 1
    || [v7 deviceCategory] == (char *)&dword_0 + 3)
  {
    [v7 screenBounds];
    qword_26228 = v2;
    qword_26230 = v3;
  }
  else
  {
    id v4 = +[CLKDeviceMetrics metricsWithDevice:v7 identitySizeClass:2];
    objc_msgSend(v4, "scaledSize:", 162.0, 197.0);
    qword_26228 = v5;
    qword_26230 = v6;
  }
}

void sub_6098(id a1)
{
  v3[0] = &off_1DF08;
  v3[1] = &off_1DF20;
  v4[0] = @"Mickey Mouse";
  v4[1] = @"Minnie Mouse";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_26270;
  qword_26270 = v1;
}

id sub_6224(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 != 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_262B8);
    id WeakRetained = objc_loadWeakRetained(&qword_262C0);
    if (WeakRetained)
    {
      uint64_t v8 = WeakRetained;
      id v9 = objc_loadWeakRetained(&qword_262C0);
      if (v9 == v3)
      {
        id v16 = [v3 version];
        uint64_t v17 = qword_262C8;

        if (v16 == (id)v17)
        {
          v14 = &qword_262B0;
LABEL_14:
          v15 = (os_unfair_lock_s *)&unk_262B8;
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    v14 = &qword_262B0;
    id v18 = objc_storeWeak(&qword_262C0, v3);
    qword_262C8 = (uint64_t)[v3 version];

    v19 = (void *)qword_262B0;
    qword_262B0 = (uint64_t)&off_1EA18;

    goto LABEL_14;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26298);
  id v4 = objc_loadWeakRetained(&qword_262A0);
  if (!v4)
  {
LABEL_9:
    id v12 = objc_storeWeak(&qword_262A0, v3);
    qword_262A8 = (uint64_t)[v3 version];

    sub_7CC4(v13, (uint64_t)v3);
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  id v6 = objc_loadWeakRetained(&qword_262A0);
  if (v6 != v3)
  {

    goto LABEL_9;
  }
  id v10 = [v3 version];
  uint64_t v11 = qword_262A8;

  if (v10 != (id)v11) {
    goto LABEL_9;
  }
LABEL_10:
  v14 = &qword_26290;
  v15 = (os_unfair_lock_s *)&unk_26298;
LABEL_15:
  os_unfair_lock_unlock(v15);
  id v20 = (id)*v14;

  return v20;
}

void sub_66D0(id a1)
{
  v3[0] = &off_1DF38;
  v3[1] = &off_1DF50;
  v4[0] = NTKFaceBundleColorPink;
  v4[1] = NTKFaceBundleColorPurple;
  void v3[2] = &off_1DF68;
  v3[3] = &off_1DF80;
  void v4[2] = NTKFaceBundleColorBlue;
  v4[3] = NTKFaceBundleColorGreen;
  v3[4] = &off_1DF98;
  v3[5] = &off_1DFB0;
  v4[4] = NTKFaceBundleColorYellow;
  v4[5] = NTKFaceBundleColorOrange;
  v3[6] = &off_1DFC8;
  v3[7] = &off_1DFE0;
  v4[6] = NTKFaceBundleColorRed;
  v4[7] = NTKFaceBundleColorWhite;
  v3[8] = &off_1DFF8;
  v3[9] = &off_1E010;
  v4[8] = NTKFaceBundleColorEditionDeprecated;
  v4[9] = NTKFaceBundleColorSportPlusDeprecated;
  v3[10] = &off_1E028;
  v3[11] = &off_1E040;
  v4[10] = NTKFaceBundleColorGoldGeneric1;
  v4[11] = NTKFaceBundleColorGoldGeneric2;
  v3[12] = &off_1E058;
  v3[13] = &off_1E070;
  v4[12] = NTKFaceBundleColorGoldGeneric3;
  v4[13] = NTKFaceBundleColorZeus;
  v3[14] = &off_1E088;
  v3[15] = &off_1E0A0;
  v4[14] = NTKFaceBundleColorVictory;
  v4[15] = NTKFaceBundleColorExplorer;
  v3[16] = &off_1E0B8;
  v3[17] = &off_1E0D0;
  v4[16] = NTKFaceBundleColorMulticolor;
  v4[17] = NTKFaceBundleColorDarkOrange;
  v3[18] = &off_1E0E8;
  v3[19] = &off_1E100;
  v4[18] = NTKFaceBundleColorTurquoise;
  v4[19] = NTKFaceBundleColorMidnightBlue;
  v3[20] = &off_1E118;
  v3[21] = &off_1E130;
  v4[20] = NTKFaceBundleColorLavender;
  v4[21] = NTKFaceBundleColorVintageRose;
  v3[22] = &off_1E148;
  v3[23] = &off_1E160;
  v4[22] = NTKFaceBundleColorWalnut;
  v4[23] = NTKFaceBundleColorStone;
  v3[24] = &off_1E178;
  v3[25] = &off_1E190;
  v4[24] = NTKFaceBundleColorAntiqueWhite;
  v4[25] = NTKFaceBundleColorLightBlue;
  v3[26] = &off_1E1A8;
  v3[27] = &off_1E1C0;
  v4[26] = NTKFaceBundleColorGray;
  v4[27] = @"vintage";
  v3[28] = &off_1E1D8;
  v3[29] = &off_1E1F0;
  v4[28] = NTKFaceBundleColorMint;
  v4[29] = NTKFaceBundleColorLilac;
  v3[30] = &off_1E208;
  v3[31] = &off_1E220;
  v4[30] = NTKFaceBundleColorRoyalBlue;
  v4[31] = NTKFaceBundleColorLightPink;
  v3[32] = &off_1E238;
  v3[33] = &off_1E250;
  v4[32] = NTKFaceBundleColorApricot;
  v4[33] = NTKFaceBundleColorOceanBlue;
  v3[34] = &off_1E268;
  v3[35] = &off_1E280;
  v4[34] = NTKFaceBundleColorCocoa;
  v4[35] = NTKFaceBundleColorIceWhite;
  v3[36] = &off_1E298;
  v3[37] = &off_1E2B0;
  v4[36] = NTKFaceBundleColorPinkSand;
  v4[37] = NTKFaceBundleColorPebble;
  v3[38] = &off_1E2C8;
  v3[39] = &off_1E2E0;
  v4[38] = NTKFaceBundleColorAzure;
  v4[39] = NTKFaceBundleColorCamellia;
  v3[40] = &off_1E2F8;
  v3[41] = &off_1E310;
  v4[40] = NTKFaceBundleColorMistBlue;
  v4[41] = NTKFaceBundleColorFlamingo;
  v3[42] = &off_1E328;
  v3[43] = &off_1E340;
  v4[42] = NTKFaceBundleColorPollen;
  v4[43] = NTKFaceBundleColorSoftWhite;
  v3[44] = &off_1E358;
  v3[45] = &off_1E370;
  v4[44] = NTKFaceBundleColorBlueCobalt;
  v4[45] = NTKFaceBundleColorDarkOlive;
  v3[46] = &off_1E388;
  v3[47] = &off_1E3A0;
  v4[46] = NTKFaceBundleColorViolet;
  v4[47] = NTKFaceBundleColorRoseRed;
  v3[48] = &off_1E3B8;
  v3[49] = &off_1E3D0;
  v4[48] = NTKFaceBundleColorFlash;
  v4[49] = NTKFaceBundleColorDarkTeal;
  v3[50] = &off_1E3E8;
  v3[51] = &off_1E400;
  v4[50] = NTKFaceBundleColorElectricPink;
  v4[51] = NTKFaceBundleColorNectarine;
  v3[52] = &off_1E418;
  v3[53] = &off_1E430;
  v4[52] = NTKFaceBundleColorMellowYellow;
  v4[53] = NTKFaceBundleColorStormGray;
  v3[54] = &off_1E448;
  v3[55] = &off_1E460;
  v4[54] = NTKFaceBundleColorPacificGreen;
  v4[55] = NTKFaceBundleColorBlueHorizon;
  v3[56] = &off_1E478;
  v3[57] = &off_1E490;
  v4[56] = NTKFaceBundleColorIndigo;
  v4[57] = NTKFaceBundleColorLavenderGray;
  v3[58] = &off_1E4A8;
  v3[59] = &off_1E4C0;
  v4[58] = NTKFaceBundleColorHibiscus;
  v4[59] = NTKFaceBundleColorPeach;
  v3[60] = &off_1E4D8;
  v3[61] = &off_1E4F0;
  v4[60] = NTKFaceBundleColorDenimBlue;
  v4[61] = NTKFaceBundleColorFlashLight;
  v3[62] = &off_1E508;
  v3[63] = &off_1E520;
  v4[62] = NTKFaceBundleColorPapaya;
  v4[63] = NTKFaceBundleColorCanaryYellow;
  v3[64] = &off_1E538;
  v4[64] = NTKFaceBundleColorSpearmint;
  v3[65] = &off_1E550;
  v4[65] = NTKFaceBundleColorCerulean;
  v3[66] = &off_1E568;
  v4[66] = NTKFaceBundleColorDelftBlue;
  v3[67] = &off_1E580;
  v4[67] = NTKFaceBundleColorDragonFruit;
  v3[68] = &off_1E598;
  v4[68] = NTKFaceBundleColorPineGreen;
  v3[69] = &off_1E5B0;
  v4[69] = NTKFaceBundleColorLemonCream;
  v3[70] = &off_1E5C8;
  v4[70] = NTKFaceBundleColorAlaskanBlue;
  v3[71] = &off_1E5E0;
  v4[71] = NTKFaceBundleColorPomegranate;
  v3[72] = &off_1E5F8;
  v4[72] = NTKFaceBundleColorKhaki;
  v3[73] = &off_1E610;
  v4[73] = NTKFaceBundleColorBeryl;
  v3[74] = &off_1E628;
  v4[74] = NTKFaceBundleColorCamel;
  v3[75] = &off_1E640;
  v4[75] = NTKFaceBundleColorSeaFoam;
  v3[76] = &off_1E658;
  v4[76] = NTKFaceBundleColorSurfBlue;
  v3[77] = &off_1E670;
  v4[77] = NTKFaceBundleColorCactus;
  v3[78] = &off_1E688;
  v4[78] = NTKFaceBundleColorLinenBlue;
  v3[79] = &off_1E6A0;
  v4[79] = NTKFaceBundleColorGrapefruit;
  v3[80] = &off_1E6B8;
  v4[80] = NTKFaceBundleColorNeonPink;
  v3[81] = &off_1E6D0;
  v4[81] = NTKFaceBundleColorCoastalGray;
  v3[82] = &off_1E6E8;
  v4[82] = NTKFaceBundleColorPinkCitrus;
  v3[83] = &off_1E700;
  v4[83] = NTKFaceBundleColorDeepNavy;
  v3[84] = &off_1E718;
  v4[84] = NTKFaceBundleColorCyprusGreen;
  v3[85] = &off_1E730;
  v4[85] = NTKFaceBundleColorCream;
  v3[86] = &off_1E748;
  v4[86] = NTKFaceBundleColorKumquat;
  v3[87] = &off_1E760;
  v4[87] = NTKFaceBundleColorNorthernBlue;
  v3[88] = &off_1E778;
  v4[88] = NTKFaceBundleColorPlum;
  v3[89] = &off_1E790;
  v4[89] = NTKFaceBundleColorElectricOrange;
  v3[90] = &off_1E7A8;
  v4[90] = NTKFaceBundleColorSunflower;
  v3[91] = &off_1E7C0;
  v4[91] = NTKFaceBundleColorPistachio;
  v3[92] = &off_1E7D8;
  v4[92] = NTKFaceBundleColorCloudBlue;
  v3[93] = &off_1E7F0;
  v4[93] = NTKFaceBundleColorAbyss;
  v3[94] = &off_1E808;
  v4[94] = NTKFaceBundleColorSeaSalt;
  v3[95] = &off_1E820;
  v4[95] = NTKFaceBundleColorOlive;
  v3[96] = &off_1E838;
  v4[96] = NTKFaceBundleColorMallardGreen;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:97];
  uint64_t v2 = (void *)qword_26280;
  qword_26280 = v1;
}

void sub_7CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[NTKFaceColorEditOption __orderedValuesForDevice:a2];
  id v3 = [v2 mutableCopy];

  id v4 = [v3 indexOfObject:&off_1DFE0];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "White has been removed from list of colors. Adding vintage color at beginning of list.", v7, 2u);
    }

    [v3 insertObject:&off_1E1C0 atIndex:0];
  }
  else
  {
    [v3 setObject:&off_1E1C0 atIndexedSubscript:v4];
  }
  id v6 = (void *)qword_26290;
  qword_26290 = (uint64_t)v3;
}

void *sub_8044(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = +[NSMutableDictionary dictionary];
      uint64_t v5 = (void *)v2[2];
      v2[2] = v4;

      id v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void *sub_80B4(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[3];
    if (!v3)
    {
      id v4 = objc_alloc((Class)NTKPigmentEditOptionProvider);
      uint64_t v5 = [(id)objc_opt_class() pigmentFaceDomain];
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [v4 initWithDomain:v5 bundle:v6];
      uint64_t v8 = (void *)v2[3];
      v2[3] = v7;

      id v3 = (void *)v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void *sub_8184(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[4];
    if (!v3)
    {
      id v4 = objc_alloc((Class)NTKPigmentEditOptionProvider);
      uint64_t v5 = NTKColorPaletteDomainMinnie;
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [v4 initWithDomain:v5 bundle:v6];
      uint64_t v8 = (void *)v2[4];
      v2[4] = v7;

      id v3 = (void *)v2[4];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_8FAC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

void sub_8FC4(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_8FDC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

double sub_9F34(double *a1, double *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  [a4 getHour:&v14 minute:&v13 second:&v12 nanosecond:&v11 fromDate:a3];
  if (a1)
  {
    float v7 = ((double)v12 + (double)v13 * 60.0 + (double)(v14 % 12) * 60.0 * 60.0) / 43200.0;
    float v8 = modff(v7, &v15);
    if (v8 < 0.0) {
      float v8 = v8 + 1.0;
    }
    double result = v8;
    *a1 = result;
  }
  if (a2)
  {
    float v9 = ((double)v12 + (double)v13 * 60.0) / 3600.0;
    float v10 = modff(v9, &v15);
    if (v10 < 0.0) {
      float v10 = v10 + 1.0;
    }
    double result = v10;
    *a2 = result;
  }
  return result;
}

void sub_F3F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 display];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = (void *)v4[5];
    id v6 = v7;
    objc_msgSend(v5, "foregroundAlphaForEditing:", objc_msgSend(v4, "editing"));
    objc_msgSend(v6, "setForegroundAlpha:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "foregroundImageAlphaForEditing:", objc_msgSend(*(id *)(a1 + 32), "editing"));
    objc_msgSend(v6, "setForegroundImageAlpha:");
  }
}

id sub_F4BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateComplicationDisplayWrappersWithBlock:*(void *)(a1 + 40)];
}

id sub_F8EC(uint64_t a1, void *a2)
{
  id v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v5, v7, v9, v11);
  uint64_t v12 = *(void **)(a1 + 40);

  return objc_msgSend(v12, "drawInRect:", v5, v7, v9, v11);
}

void sub_100D0()
{
  __assert_rtn("+[NTKCharacterResourceLoader sharedInstanceForDevice:withPixelFormat:]", "NTKCharacterResourceLoader.m", 152, "((NTKCharacterResourceLoader*)sharedInstance)->_viewMtlPixelFormat == pixFmt");
}

void sub_100FC(void *a1, NSObject *a2)
{
  double v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a1 _value]);
  int v5 = 138412546;
  double v6 = a1;
  __int16 v7 = 2112;
  double v8 = v4;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%@: invalid value (%@)", (uint8_t *)&v5, 0x16u);
}

void sub_101C0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "NTKCharacterFace - incorrect type for toOption %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10238(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "NTKCharacterFace - incorrect type for fromOption %{public}@", (uint8_t *)&v2, 0xCu);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
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

uint64_t CLKUIOrderedSuffixesForDevice()
{
  return _CLKUIOrderedSuffixesForDevice();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllUtilityLargeComplicationTypes()
{
  return _NTKAllUtilityLargeComplicationTypes();
}

uint64_t NTKAllUtilitySmallComplicationTypes()
{
  return _NTKAllUtilitySmallComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKFaceColorName()
{
  return _NTKFaceColorName();
}

uint64_t NTKFaceColorNameAndCollection()
{
  return _NTKFaceColorNameAndCollection();
}

uint64_t NTKForegroundColor()
{
  return _NTKForegroundColor();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NUNILoadMtlTextureFromMemory()
{
  return _NUNILoadMtlTextureFromMemory();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

float cosf(float a1)
{
  return _cosf(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

float modff(float a1, float *a2)
{
  return _modff(a1, a2);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float sinf(float a1)
{
  return _sinf(a1);
}

id objc_msgSend__doneWaitingForFootRaise(void *a1, const char *a2, ...)
{
  return [a1 _doneWaitingForFootRaise];
}

id objc_msgSend__endScrubbing(void *a1, const char *a2, ...)
{
  return [a1 _endScrubbing];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__footIsRaisedEnoughToStartAnimation(void *a1, const char *a2, ...)
{
  return [a1 _footIsRaisedEnoughToStartAnimation];
}

id objc_msgSend__getBlinkDuration(void *a1, const char *a2, ...)
{
  return [a1 _getBlinkDuration];
}

id objc_msgSend__idleBodyAfterAnimation(void *a1, const char *a2, ...)
{
  return [a1 _idleBodyAfterAnimation];
}

id objc_msgSend__layoutRenderer(void *a1, const char *a2, ...)
{
  return [a1 _layoutRenderer];
}

id objc_msgSend__loadContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadContentViews];
}

id objc_msgSend__loadMTLBufferData(void *a1, const char *a2, ...)
{
  return [a1 _loadMTLBufferData];
}

id objc_msgSend__loadPrograms(void *a1, const char *a2, ...)
{
  return [a1 _loadPrograms];
}

id objc_msgSend__loadTextures(void *a1, const char *a2, ...)
{
  return [a1 _loadTextures];
}

id objc_msgSend__lowerFootAfterBodyAnimation(void *a1, const char *a2, ...)
{
  return [a1 _lowerFootAfterBodyAnimation];
}

id objc_msgSend__newScaleView(void *a1, const char *a2, ...)
{
  return [a1 _newScaleView];
}

id objc_msgSend__raiseFootForBodyAnimation(void *a1, const char *a2, ...)
{
  return [a1 _raiseFootForBodyAnimation];
}

id objc_msgSend__resetTimeVariable(void *a1, const char *a2, ...)
{
  return [a1 _resetTimeVariable];
}

id objc_msgSend__selectedCharacter(void *a1, const char *a2, ...)
{
  return [a1 _selectedCharacter];
}

id objc_msgSend__startAnimation(void *a1, const char *a2, ...)
{
  return [a1 _startAnimation];
}

id objc_msgSend__tapToSpeakRect(void *a1, const char *a2, ...)
{
  return [a1 _tapToSpeakRect];
}

id objc_msgSend__unloadContentViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadContentViews];
}

id objc_msgSend__updateStateAndPose(void *a1, const char *a2, ...)
{
  return [a1 _updateStateAndPose];
}

id objc_msgSend__updateTimeVariables(void *a1, const char *a2, ...)
{
  return [a1 _updateTimeVariables];
}

id objc_msgSend__updateWaitingForFootRaise(void *a1, const char *a2, ...)
{
  return [a1 _updateWaitingForFootRaise];
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return [a1 _value];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_addClient(void *a1, const char *a2, ...)
{
  return [a1 addClient];
}

id objc_msgSend_animFrame(void *a1, const char *a2, ...)
{
  return [a1 animFrame];
}

id objc_msgSend_animationDirection(void *a1, const char *a2, ...)
{
  return [a1 animationDirection];
}

id objc_msgSend_animationFrame(void *a1, const char *a2, ...)
{
  return [a1 animationFrame];
}

id objc_msgSend_arms(void *a1, const char *a2, ...)
{
  return [a1 arms];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_blinkTexs(void *a1, const char *a2, ...)
{
  return [a1 blinkTexs];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_bone(void *a1, const char *a2, ...)
{
  return [a1 bone];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bufferOffsetArm(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetArm];
}

id objc_msgSend_bufferOffsetBackground(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetBackground];
}

id objc_msgSend_bufferOffsetBody(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetBody];
}

id objc_msgSend_bufferOffsetFlower(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetFlower];
}

id objc_msgSend_bufferOffsetFoot(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetFoot];
}

id objc_msgSend_bufferOffsetHand(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetHand];
}

id objc_msgSend_bufferOffsetHead(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetHead];
}

id objc_msgSend_bufferOffsetSkirt(void *a1, const char *a2, ...)
{
  return [a1 bufferOffsetSkirt];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_character(void *a1, const char *a2, ...)
{
  return [a1 character];
}

id objc_msgSend_characterScale(void *a1, const char *a2, ...)
{
  return [a1 characterScale];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorOption(void *a1, const char *a2, ...)
{
  return [a1 colorOption];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_curHeadTilt(void *a1, const char *a2, ...)
{
  return [a1 curHeadTilt];
}

id objc_msgSend_curHeadX(void *a1, const char *a2, ...)
{
  return [a1 curHeadX];
}

id objc_msgSend_curLeftBend(void *a1, const char *a2, ...)
{
  return [a1 curLeftBend];
}

id objc_msgSend_curPose(void *a1, const char *a2, ...)
{
  return [a1 curPose];
}

id objc_msgSend_curRightBend(void *a1, const char *a2, ...)
{
  return [a1 curRightBend];
}

id objc_msgSend_curState(void *a1, const char *a2, ...)
{
  return [a1 curState];
}

id objc_msgSend_curTimeMod1Sec(void *a1, const char *a2, ...)
{
  return [a1 curTimeMod1Sec];
}

id objc_msgSend_currentDisplayDate(void *a1, const char *a2, ...)
{
  return [a1 currentDisplayDate];
}

id objc_msgSend_dampenBones(void *a1, const char *a2, ...)
{
  return [a1 dampenBones];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_desaturation(void *a1, const char *a2, ...)
{
  return [a1 desaturation];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_deviceSupportsPigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsPigmentEditOption];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceColor(void *a1, const char *a2, ...)
{
  return [a1 faceColor];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_foot(void *a1, const char *a2, ...)
{
  return [a1 foot];
}

id objc_msgSend_forceUpdateTimeVariables(void *a1, const char *a2, ...)
{
  return [a1 forceUpdateTimeVariables];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frameDisplayTime60th(void *a1, const char *a2, ...)
{
  return [a1 frameDisplayTime60th];
}

id objc_msgSend_globalOffset(void *a1, const char *a2, ...)
{
  return [a1 globalOffset];
}

id objc_msgSend_globalScale(void *a1, const char *a2, ...)
{
  return [a1 globalScale];
}

id objc_msgSend_glowTex(void *a1, const char *a2, ...)
{
  return [a1 glowTex];
}

id objc_msgSend_head(void *a1, const char *a2, ...)
{
  return [a1 head];
}

id objc_msgSend_headMatrix(void *a1, const char *a2, ...)
{
  return [a1 headMatrix];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_inAnimation(void *a1, const char *a2, ...)
{
  return [a1 inAnimation];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isVintageColor(void *a1, const char *a2, ...)
{
  return [a1 isVintageColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leftShoulderAdjustment(void *a1, const char *a2, ...)
{
  return [a1 leftShoulderAdjustment];
}

id objc_msgSend_leftShoulderX(void *a1, const char *a2, ...)
{
  return [a1 leftShoulderX];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadBackgroundTextures(void *a1, const char *a2, ...)
{
  return [a1 loadBackgroundTextures];
}

id objc_msgSend_loadBodyTextures(void *a1, const char *a2, ...)
{
  return [a1 loadBodyTextures];
}

id objc_msgSend_loadFootTextures(void *a1, const char *a2, ...)
{
  return [a1 loadFootTextures];
}

id objc_msgSend_loadHeadBlinkTextures(void *a1, const char *a2, ...)
{
  return [a1 loadHeadBlinkTextures];
}

id objc_msgSend_loadHeadTextures(void *a1, const char *a2, ...)
{
  return [a1 loadHeadTextures];
}

id objc_msgSend_loadNumbersTexture(void *a1, const char *a2, ...)
{
  return [a1 loadNumbersTexture];
}

id objc_msgSend_loader(void *a1, const char *a2, ...)
{
  return [a1 loader];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return [a1 localizedCapitalizedString];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mtlBufArmOffset(void *a1, const char *a2, ...)
{
  return [a1 mtlBufArmOffset];
}

id objc_msgSend_mtlBufHandOffset(void *a1, const char *a2, ...)
{
  return [a1 mtlBufHandOffset];
}

id objc_msgSend_mtlBufOffset(void *a1, const char *a2, ...)
{
  return [a1 mtlBufOffset];
}

id objc_msgSend_mtlBuffer(void *a1, const char *a2, ...)
{
  return [a1 mtlBuffer];
}

id objc_msgSend_mtlTexture(void *a1, const char *a2, ...)
{
  return [a1 mtlTexture];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_neckBone(void *a1, const char *a2, ...)
{
  return [a1 neckBone];
}

id objc_msgSend_nrDeviceUUID(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceUUID];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numbersTex(void *a1, const char *a2, ...)
{
  return [a1 numbersTex];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_optionName(void *a1, const char *a2, ...)
{
  return [a1 optionName];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_pigmentFaceDomain(void *a1, const char *a2, ...)
{
  return [a1 pigmentFaceDomain];
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return [a1 prefix];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllQuads(void *a1, const char *a2, ...)
{
  return [a1 removeAllQuads];
}

id objc_msgSend_removeClient(void *a1, const char *a2, ...)
{
  return [a1 removeClient];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderOneFrame(void *a1, const char *a2, ...)
{
  return [a1 renderOneFrame];
}

id objc_msgSend_rightShoulderAdjustment(void *a1, const char *a2, ...)
{
  return [a1 rightShoulderAdjustment];
}

id objc_msgSend_rightShoulderX(void *a1, const char *a2, ...)
{
  return [a1 rightShoulderX];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupBodyState(void *a1, const char *a2, ...)
{
  return [a1 setupBodyState];
}

id objc_msgSend_setupGeometry(void *a1, const char *a2, ...)
{
  return [a1 setupGeometry];
}

id objc_msgSend_setupPipelineState(void *a1, const char *a2, ...)
{
  return [a1 setupPipelineState];
}

id objc_msgSend_setupTextures(void *a1, const char *a2, ...)
{
  return [a1 setupTextures];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_shiftTexs12(void *a1, const char *a2, ...)
{
  return [a1 shiftTexs12];
}

id objc_msgSend_shiftTexs13(void *a1, const char *a2, ...)
{
  return [a1 shiftTexs13];
}

id objc_msgSend_shiftTexs14(void *a1, const char *a2, ...)
{
  return [a1 shiftTexs14];
}

id objc_msgSend_shiftTexs23(void *a1, const char *a2, ...)
{
  return [a1 shiftTexs23];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_tex(void *a1, const char *a2, ...)
{
  return [a1 tex];
}

id objc_msgSend_texArm(void *a1, const char *a2, ...)
{
  return [a1 texArm];
}

id objc_msgSend_texHandHour(void *a1, const char *a2, ...)
{
  return [a1 texHandHour];
}

id objc_msgSend_texHandMnut(void *a1, const char *a2, ...)
{
  return [a1 texHandMnut];
}

id objc_msgSend_texs(void *a1, const char *a2, ...)
{
  return [a1 texs];
}

id objc_msgSend_timeScrubbing(void *a1, const char *a2, ...)
{
  return [a1 timeScrubbing];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_waitingForFootRaise(void *a1, const char *a2, ...)
{
  return [a1 waitingForFootRaise];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}