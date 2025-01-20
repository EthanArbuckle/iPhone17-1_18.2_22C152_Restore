__n64 generateTransform(__n64 result, float a2, float a3, float a4)
{
  result.n64_f32[1] = (float)(a4 - a3) / (float)(a2 - result.n64_f32[0]);
  return result;
}

__n128 stringToColor(void *a1, int a2)
{
  id v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 componentsSeparatedByString:@","];
    long long v17 = 0u;
    if ([v5 count] == (char *)&dword_0 + 3)
    {
      v6 = [v5 objectAtIndexedSubscript:0];
      [v6 floatValue];
      unsigned int v18 = v7;

      v8 = [v5 objectAtIndexedSubscript:1];
      [v8 floatValue];
      if (a2)
      {
        uint64_t v16 = v9;

        v10 = objc_msgSend(v5, "objectAtIndexedSubscript:", 2, v16);
        [v10 floatValue];

        v11 = NTKColorWithRGBA();
        CLKUIConvertToRGBfFromUIColor();
        long long v17 = v12;
      }
      else
      {
        *(float32x2_t *)&long long v9 = vdiv_f32((float32x2_t)__PAIR64__(v9, v18), (float32x2_t)vdup_n_s32(0x437F0000u));
        long long v19 = v9;

        v11 = [v5 objectAtIndexedSubscript:2];
        [v11 floatValue];
        long long v13 = v19;
        *((float *)&v13 + 2) = v14 / 255.0;
        long long v17 = v13;
      }
    }
  }
  else
  {
    long long v17 = 0u;
  }

  return (__n128)v17;
}

__n128 stringToTwoFloats(void *a1, double a2, float a3)
{
  *(double *)&long long v14 = a2;
  id v3 = a1;
  v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  v5 = [v3 componentsSeparatedByString:@","];
  if ([v5 count] != (char *)&dword_0 + 2)
  {

LABEL_5:
    long long v11 = v14;
    *((float *)&v11 + 1) = a3;
    long long v15 = v11;
    goto LABEL_6;
  }
  v6 = [v5 objectAtIndexedSubscript:0];
  [v6 floatValue];
  *(void *)&long long v14 = v7;

  v8 = [v5 objectAtIndexedSubscript:1];
  [v8 floatValue];
  long long v9 = v14;
  DWORD1(v9) = v10;
  long long v15 = v9;

LABEL_6:
  return (__n128)v15;
}

void parseColorway(void *a1, uint64_t a2)
{
  id v99 = a1;
  id v3 = [v99 objectForKey:@"customTime"];
  v4 = v3;
  if (v3) {
    LODWORD(v3) = [v3 integerValue];
  }
  *(_DWORD *)(a2 + 4) = v3;

  v5 = [v99 objectForKey:@"overallScale"];
  v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.1;
  }
  *(double *)(a2 + 8) = v8;

  long long v9 = [v99 objectForKey:@"additiveBlend"];
  int v10 = v9;
  if (v9)
  {
    [v9 floatValue];
    double v12 = v11;
  }
  else
  {
    double v12 = 0.3;
  }
  *(double *)(a2 + 16) = v12;

  long long v13 = [v99 objectForKey:@"linearDim"];
  long long v14 = v13;
  if (v13)
  {
    [v13 floatValue];
    double v16 = v15;
  }
  else
  {
    double v16 = 0.5;
  }
  *(double *)(a2 + 24) = v16;

  long long v17 = [v99 objectForKey:@"tritiumSolidLayerIdx"];
  unsigned int v18 = v17;
  if (v17) {
    unsigned int v19 = [v17 integerValue];
  }
  else {
    unsigned int v19 = 1;
  }
  *(_DWORD *)(a2 + 32) = v19;

  --*(_DWORD *)(a2 + 32);
  v20 = [v99 objectForKey:@"tritiumSolidLayerLengthMultiplier"];
  v21 = v20;
  if (v20)
  {
    [v20 floatValue];
    double v23 = v22;
  }
  else
  {
    double v23 = 1.0;
  }
  *(double *)(a2 + 40) = v23;

  v24 = [v99 objectForKey:@"jitterScaleNear"];
  v25 = v24;
  double v26 = 0.6;
  double v27 = 0.6;
  if (v24)
  {
    objc_msgSend(v24, "floatValue", 0.6);
    double v27 = v28;
  }
  *(double *)(a2 + 48) = v27;

  v29 = [v99 objectForKey:@"jitterScaleFar"];
  v30 = v29;
  if (v29)
  {
    [v29 floatValue];
    double v26 = v31;
  }
  *(double *)(a2 + 56) = v26;

  v32 = [v99 objectForKey:@"jitterAspectRatio"];
  v33 = v32;
  if (v32)
  {
    [v32 floatValue];
    double v35 = v34;
  }
  else
  {
    double v35 = 1.0;
  }
  *(double *)(a2 + 64) = v35;

  v36 = [v99 objectForKey:@"fontEnlargement"];
  v37 = v36;
  if (v36)
  {
    [v36 floatValue];
    double v39 = v38;
  }
  else
  {
    double v39 = 0.8;
  }
  *(double *)(a2 + 72) = v39;

  v40 = [v99 objectForKey:@"darkenEdges"];
  v41 = v40;
  if (v40)
  {
    [v40 floatValue];
    double v43 = v42;
  }
  else
  {
    double v43 = 1.0;
  }
  *(double *)(a2 + 80) = v43;

  v44 = [v99 objectForKey:@"segmentRampLength"];
  v45 = v44;
  if (v44)
  {
    [v44 floatValue];
    double v47 = v46;
  }
  else
  {
    double v47 = 0.35;
  }
  *(double *)(a2 + 88) = v47;

  v48 = [v99 objectForKey:@"segmentGlobalSpeedMultiplier"];
  v49 = v48;
  double v50 = 1.0;
  double v51 = 1.0;
  if (v48)
  {
    objc_msgSend(v48, "floatValue", 1.0);
    double v51 = v52;
  }
  *(double *)(a2 + 96) = v51;

  v53 = [v99 objectForKey:@"segmentGlobalLengthMultiplier"];
  v54 = v53;
  if (v53)
  {
    [v53 floatValue];
    double v50 = v55;
  }
  *(double *)(a2 + 104) = v50;

  v56 = [v99 objectForKey:@"bloomTextLayerInputMult"];
  v57 = v56;
  if (v56) {
    [v56 floatValue];
  }
  else {
    float v58 = 1.5;
  }
  *(float *)(a2 + 112) = v58;

  v59 = [v99 objectForKey:@"bloomLayerInputMult"];
  v60 = v59;
  if (v59) {
    [v59 floatValue];
  }
  else {
    int v61 = 1067030938;
  }
  *(_DWORD *)(a2 + 116) = v61;

  v62 = [v99 objectForKey:@"bloomTextContrast"];
  v63 = v62;
  if (v62) {
    [v62 floatValue];
  }
  else {
    float v64 = 1.0;
  }
  *(float *)(a2 + 120) = v64;

  v65 = [v99 objectForKey:@"bloomContrast"];
  v66 = v65;
  if (v65) {
    [v65 floatValue];
  }
  else {
    int v67 = 1066192077;
  }
  *(_DWORD *)(a2 + 124) = v67;

  v68 = [v99 objectForKey:@"bloomCombinedContrast"];
  v69 = v68;
  float v70 = 1.5;
  LODWORD(v71) = 1.5;
  if (v68) {
    objc_msgSend(v68, "floatValue", v71);
  }
  *(_DWORD *)(a2 + 128) = LODWORD(v71);

  v72 = [v99 objectForKey:@"bloomFinalMult"];
  v73 = v72;
  if (v72)
  {
    [v72 floatValue];
    float v70 = v74;
  }
  *(float *)(a2 + 132) = v70;

  v75 = [v99 objectForKey:@"bloomWhitePoint"];
  v76 = v75;
  if (v75) {
    [v75 floatValue];
  }
  else {
    int v77 = 1050253722;
  }
  *(_DWORD *)(a2 + 136) = v77;

  v78 = [v99 objectForKey:@"bloomIterations"];
  v79 = v78;
  if (v78) {
    unsigned int v80 = [v78 integerValue];
  }
  else {
    unsigned int v80 = 8;
  }
  *(_DWORD *)(a2 + 140) = v80;

  v81 = [v99 objectForKey:@"jitterScaleMidpoint"];
  LODWORD(v82) = 0.5;
  *(void *)(a2 + 144) = stringToTwoFloats(v81, v82, 0.4).n128_u64[0];

  v83 = [v99 objectForKey:@"jitterAspectRatioMidpoint"];
  LODWORD(v84) = 0.5;
  *(void *)(a2 + 152) = stringToTwoFloats(v83, v84, 3.0).n128_u64[0];

  v85 = [v99 objectForKey:@"bloomLayerInputMultMidpoint"];
  LODWORD(v86) = 0.5;
  *(void *)(a2 + 160) = stringToTwoFloats(v85, v86, 1.5).n128_u64[0];

  v87 = [v99 objectForKey:@"bloomWhitePointMidpoint"];
  LODWORD(v88) = 0.5;
  *(void *)(a2 + 168) = stringToTwoFloats(v87, v88, 0.8).n128_u64[0];

  v89 = [v99 objectForKey:@"overallScaleMidpoint"];
  LODWORD(v90) = 0.5;
  *(void *)(a2 + 176) = stringToTwoFloats(v89, v90, 1.2).n128_u64[0];

  v91 = [v99 objectForKey:@"convertToSRGB"];
  v92 = v91;
  if (v91) {
    unsigned __int8 v93 = [v91 BOOLValue];
  }
  else {
    unsigned __int8 v93 = 1;
  }
  *(unsigned char *)(a2 + 184) = v93;

  uint64_t v94 = 0;
  do
  {
    uint64_t v95 = v94 + 1;
    v96 = +[NSString stringWithFormat:@"color%d", v94 + 1];
    v97 = [v99 objectForKey:v96];

    if (v97)
    {
      __n128 v98 = stringToColor(v97, *(unsigned __int8 *)(a2 + 184));
LABEL_66:
      *(__n128 *)(a2 + 192 + 16 * v94) = v98;
    }
    else
    {
      switch(v94 / 3u)
      {
        case 0u:
          *(_OWORD *)(a2 + 192) = xmmword_9210;
          break;
        case 1u:
          *(_OWORD *)(a2 + 208) = xmmword_9210;
          break;
        case 2u:
          *(_OWORD *)(a2 + 224) = xmmword_9200;
          break;
        case 3u:
          *(_OWORD *)(a2 + 240) = xmmword_91F0;
          break;
        case 4u:
          *(_OWORD *)(a2 + 256) = xmmword_91E0;
          break;
        case 5u:
          *(_OWORD *)(a2 + 272) = xmmword_91D0;
          break;
        case 6u:
          *(_OWORD *)(a2 + 288) = xmmword_91C0;
          break;
        default:
          __n128 v98 = 0uLL;
          goto LABEL_66;
      }
    }

    ++v94;
  }
  while (v95 != 20);
}

id performParentingOverlays(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v6) {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
  }
  double v8 = [v6 objectForKey:v7];
  long long v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    float v11 = [v7 objectForKey:@"parent"];
    if (v11 && ([v5 objectForKey:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v13 = (void *)v12;
      long long v14 = performParentingOverlays(v5, v6, v12);
      id v10 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v14];
      [v10 addEntriesFromDictionary:v7];
      [v10 removeObjectForKey:@"parent"];
      [v6 addEntriesFromDictionary:v10];
    }
    else
    {
      float v15 = [v7 objectForKey:@"parents"];
      long long v13 = v15;
      if (v15)
      {
        v25 = v11;
        v24 = v15;
        double v16 = [v15 componentsSeparatedByString:@","];
        id v10 = objc_alloc_init((Class)NSMutableDictionary);
        if ([v16 count])
        {
          unint64_t v17 = 0;
          do
          {
            unsigned int v18 = [v16 objectAtIndexedSubscript:v17];
            unsigned int v19 = +[NSCharacterSet whitespaceCharacterSet];
            v20 = [v18 stringByTrimmingCharactersInSet:v19];

            if ([v20 length])
            {
              v21 = [v5 objectForKey:v20];
              if (v21)
              {
                float v22 = performParentingOverlays(v5, v6, v21);
                [v10 addEntriesFromDictionary:v22];
              }
            }

            ++v17;
          }
          while ((unint64_t)[v16 count] > v17);
        }
        [v10 addEntriesFromDictionary:v7];
        [v10 removeObjectForKey:@"parents"];
        [v6 addEntriesFromDictionary:v10];

        long long v13 = v24;
        float v11 = v25;
      }
      else
      {
        id v10 = v7;
      }
    }
  }

  return v10;
}

void NTKPlumeriaSettingsResetToDefaults(_DWORD *a1)
{
  id v10 = objc_alloc_init((Class)NSDictionary);
  for (uint64_t i = 0; i != 5; ++i)
  {
    uint64_t v3 = (uint64_t)&a1[128 * i];
    *(_DWORD *)(v3 + 16) = i;
    v3 += 16;
    uint64_t v4 = v3 + 2560;
    *(_DWORD *)(v3 + 2560) = i;
    parseColorway(v10, v3);
    parseColorway(v10, v4);
    uint64_t v5 = 0;
    id v6 = a1;
    do
    {
      for (uint64_t j = 0; j != 80; j += 4)
      {
        double v8 = &v6[j];
        long long v9 = *(_OWORD *)&v6[j + 52];
        if (!v5) {
          goto LABEL_9;
        }
        if (v5)
        {
          if ((v5 & 2) != 0) {
            goto LABEL_7;
          }
        }
        else
        {
          LODWORD(v9) = 0;
          if ((v5 & 2) != 0)
          {
LABEL_7:
            if ((v5 & 4) != 0) {
              goto LABEL_9;
            }
LABEL_8:
            DWORD2(v9) = 0;
            goto LABEL_9;
          }
        }
        DWORD1(v9) = 0;
        if ((v5 & 4) == 0) {
          goto LABEL_8;
        }
LABEL_9:
        *((_OWORD *)v8 + 13) = v9;
        *((_OWORD *)v8 + 173) = v9;
      }
      ++v5;
      v6 += 128;
    }
    while (v5 != 5);
  }
  *a1 = 2371;
}

uint64_t NTKPlumeriaSettingsLoadFromDictionary(void *a1, unsigned int *a2)
{
  id v3 = a1;
  unsigned int v18 = [v3 objectForKey:@"global"];
  uint64_t v4 = [v18 objectForKey:@"randomSeed"];
  uint64_t v5 = v4;
  if (v4) {
    unsigned int v6 = [v4 integerValue];
  }
  else {
    unsigned int v6 = 2371;
  }
  *a2 = v6;

  uint64_t v7 = 0;
  uint64_t v8 = (uint64_t)(a2 + 644);
  uint64_t v9 = -5;
  do
  {
    id v10 = +[NSString stringWithFormat:@"colorway%d", v9 + 6];
    float v11 = [v3 objectForKey:v10];

    if (v11)
    {
      uint64_t v12 = performParentingOverlays(v3, 0, v11);

      parseColorway(v12, v8 - 2560);
      uint64_t v7 = (v7 + 1);
    }
    long long v13 = +[NSString stringWithFormat:@"tritium%d", v9 + 6];
    long long v14 = [v3 objectForKey:v13];

    if (v14)
    {
      float v15 = performParentingOverlays(v3, 0, v14);

      parseColorway(v15, v8);
      uint64_t v7 = (v7 + 1);
    }
    v8 += 512;
  }
  while (!__CFADD__(v9++, 1));

  return v7;
}

uint64_t NTKPlumeriaSettingsLoadFromPlistResource(void *a1, void *a2, unsigned int *a3)
{
  id v5 = a1;
  id v6 = a2;
  NTKPlumeriaSettingsResetToDefaults(a3);
  if (v5)
  {
    uint64_t v7 = [v5 pathForResource:v6 ofType:@"plist"];
    uint64_t v8 = +[NSDictionary dictionaryWithContentsOfFile:v7];
    uint64_t v9 = NTKPlumeriaSettingsLoadFromDictionary(v8, a3);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t NTKPlumeriaSettingsLoadFromFile(void *a1, unsigned int *a2)
{
  id v3 = a1;
  NTKPlumeriaSettingsResetToDefaults(a2);
  uint64_t v4 = +[NSURL fileURLWithPath:v3];

  id v12 = 0;
  id v5 = +[NSData dataWithContentsOfURL:v4 options:0 error:&v12];
  id v6 = v12;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
  }
  else
  {
    id v11 = 0;
    uint64_t v9 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v11];
    id v7 = v11;
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = NTKPlumeriaSettingsLoadFromDictionary(v9, a2);
    }
  }
  return v8;
}

uint64_t NTKPlumeriaSettingIndexFromColorwayName(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1 && [v1 length])
  {
    int v3 = (char)objc_msgSend(v2, "characterAtIndex:", (char *)objc_msgSend(v2, "length") - 1);
    if (v3 >= 52) {
      int v3 = 52;
    }
    if (v3 <= 48) {
      int v3 = 48;
    }
    uint64_t v4 = (v3 - 48);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id generateColorArray(int a1)
{
  switch(a1)
  {
    case 1:
      id v1 = NTKColorWithRGBA();
      v15[0] = v1;
      v2 = NTKColorWithRGBA();
      v15[1] = v2;
      int v3 = NTKColorWithRGBA();
      v15[2] = v3;
      uint64_t v4 = NTKColorWithRGBA();
      v15[3] = v4;
      id v5 = NTKColorWithRGBA();
      v15[4] = v5;
      id v6 = v15;
      goto LABEL_6;
    case 2:
      id v1 = NTKColorWithRGBA();
      v14[0] = v1;
      v2 = NTKColorWithRGBA();
      v14[1] = v2;
      int v3 = NTKColorWithRGBA();
      v14[2] = v3;
      uint64_t v4 = NTKColorWithRGBA();
      v14[3] = v4;
      id v5 = NTKColorWithRGBA();
      v14[4] = v5;
      id v6 = v14;
      goto LABEL_6;
    case 3:
      id v1 = NTKColorWithRGBA();
      v13[0] = v1;
      v2 = NTKColorWithRGBA();
      v13[1] = v2;
      int v3 = NTKColorWithRGBA();
      v13[2] = v3;
      uint64_t v4 = NTKColorWithRGBA();
      v13[3] = v4;
      id v5 = NTKColorWithRGBA();
      v13[4] = v5;
      id v6 = v13;
LABEL_6:
      id v10 = +[NSArray arrayWithObjects:v6 count:5];
      goto LABEL_7;
    case 4:
      id v1 = NTKColorWithRGBA();
      v12[0] = v1;
      v2 = NTKColorWithRGBA();
      v12[1] = v2;
      int v3 = NTKColorWithRGBA();
      v12[2] = v3;
      uint64_t v4 = NTKColorWithRGBA();
      v12[3] = v4;
      id v10 = +[NSArray arrayWithObjects:v12 count:4];
      goto LABEL_8;
    default:
      id v1 = NTKColorWithRGBA();
      v16[0] = v1;
      v2 = NTKColorWithRGBA();
      v16[1] = v2;
      int v3 = NTKColorWithRGBA();
      v16[2] = v3;
      uint64_t v4 = NTKColorWithRGBA();
      v16[3] = v4;
      id v5 = NTKColorWithRGBA();
      v16[4] = v5;
      id v7 = NTKColorWithRGBA();
      v16[5] = v7;
      uint64_t v8 = NTKColorWithRGBA();
      v16[6] = v8;
      uint64_t v9 = NTKColorWithRGBA();
      v16[7] = v9;
      id v10 = +[NSArray arrayWithObjects:v16 count:8];

LABEL_7:
LABEL_8:

      return v10;
  }
}

void sub_41D4(id a1)
{
  qword_13560 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

id sub_43BC()
{
  if (qword_13580 != -1) {
    dispatch_once(&qword_13580, &stru_C3E0);
  }
  v0 = (void *)qword_13578;

  return v0;
}

void seedRandomNumberGenerator(unsigned int a1)
{
  dword_13570 = a1;
}

float breeuwsmaInterpolation(float a1, float a2, float a3, float a4, float a5)
{
  return a2
       + a5
       * 0.5
       * ((float)(a3 - a1) + a5 * (a2 * -5.0 + a1 * 2.0 + a3 * 4.0 - a4 + a5 * (a4 + (float)(a2 - a3) * 3.0 - a1)));
}

float splineInterpolation(float result, float a2, float a3, float a4, float a5)
{
  if (a5 > 0.0)
  {
    if (a5 >= 1.0)
    {
      return a4;
    }
    else
    {
      if (a5 >= a2)
      {
        float v11 = (float)(a5 - a2) / (float)(1.0 - a2);
        double v6 = a3;
        double v7 = v11;
        double v8 = v7 * 0.5;
        double v9 = (float)(a4 - result);
        double v10 = a3 * -5.0 + result * 2.0 + a4 * 4.0 - a3 + v7 * (a3 + (float)(a3 - a4) * 3.0 - result);
      }
      else
      {
        float v5 = a5 / a2;
        double v6 = result;
        double v7 = v5;
        double v8 = v7 * 0.5;
        double v9 = (float)(a3 - a3);
        double v10 = result * -5.0 + a3 * 2.0 + a3 * 4.0 - a4 + v7 * (a4 + (float)(result - a3) * 3.0 - a3);
      }
      return v6 + v8 * (v9 + v7 * v10);
    }
  }
  return result;
}

void sub_6840(id a1)
{
  qword_13578 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_689C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id drawTriangle(void *a1, const char *a2)
{
  return [a1 drawPrimitives:3 vertexStart:0 vertexCount:3];
}

id sub_6EC8(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = +[MTLRenderPassDescriptor renderPassDescriptor];
  float v5 = [v4 colorAttachments];
  double v6 = [v5 objectAtIndexedSubscript:0];
  [v6 setTexture:v3];

  double v7 = [v4 colorAttachments];
  double v8 = [v7 objectAtIndexedSubscript:0];
  [v8 setLevel:a2];

  return v4;
}

void sub_701C()
{
  sub_68B8();
  sub_689C(&dword_0, v0, v1, "Plumeria: Failed to load metal binary archives: %@", v2, v3, v4, v5, v6);
}

void sub_7084()
{
  sub_68B8();
  sub_689C(&dword_0, v0, v1, "Failed to create Plumeria pipeline: %@", v2, v3, v4, v5, v6);
}

void sub_70EC()
{
  sub_68B8();
  sub_689C(&dword_0, v0, v1, "Failed to create Plumeria pipeline from binary archive: %@", v2, v3, v4, v5, v6);
}

void sub_7154(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412546;
  CFStringRef v4 = @"plumeriaFragmentShader";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Plumeria: Failed to create %@ shader for device %@", (uint8_t *)&v3, 0x16u);
}

void sub_71EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Plumeria: failure loading one or more font meshes.", v1, 2u);
}

void sub_7230()
{
  sub_68B8();
  sub_689C(&dword_0, v0, v1, "Failed to create Plumeria bloom pipeline: %@", v2, v3, v4, v5, v6);
}

void sub_7298()
{
  sub_68B8();
  sub_689C(&dword_0, v0, v1, "Failed to create Plumeria bloom pipeline from binary archive: %@", v2, v3, v4, v5, v6);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
}

uint64_t CLKUIConvertToRGBfFromUIColor()
{
  return _CLKUIConvertToRGBfFromUIColor();
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return _CTFontCreateWithNameAndOptions(name, size, matrix, options);
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  return _CTFontGetBoundingRectsForGlyphs(font, orientation, glyphs, boundingRects, count);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTLineCreateWithAttributedString(attrString);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return _CTLineGetGlyphRuns(line);
}

void CTRunGetAdvances(CTRunRef run, CFRange range, CGSize *buffer)
{
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKColorWithRGBA()
{
  return _NTKColorWithRGBA();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKGizmoOrCompanionAreRussian()
{
  return _NTKGizmoOrCompanionAreRussian();
}

uint64_t NTKImageNamedFromBundle()
{
  return _NTKImageNamedFromBundle();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKSwatchColorSectorsImage()
{
  return _NTKSwatchColorSectorsImage();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

float log2f(float a1)
{
  return _log2f(a1);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int rand(void)
{
  return _rand();
}

void srand(unsigned int a1)
{
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__loadMetalBinaryArchives(void *a1, const char *a2, ...)
{
  return [a1 _loadMetalBinaryArchives];
}

id objc_msgSend__setUpMetalView(void *a1, const char *a2, ...)
{
  return [a1 _setUpMetalView];
}

id objc_msgSend__tearDownMetalView(void *a1, const char *a2, ...)
{
  return [a1 _tearDownMetalView];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boundingBox(void *a1, const char *a2, ...)
{
  return [a1 boundingBox];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorOption(void *a1, const char *a2, ...)
{
  return [a1 colorOption];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_effectiveOptionName(void *a1, const char *a2, ...)
{
  return [a1 effectiveOptionName];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_faceClass(void *a1, const char *a2, ...)
{
  return [a1 faceClass];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return [a1 fontName];
}

id objc_msgSend_getDesiredFPS(void *a1, const char *a2, ...)
{
  return [a1 getDesiredFPS];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexBuffer(void *a1, const char *a2, ...)
{
  return [a1 indexBuffer];
}

id objc_msgSend_indexCount(void *a1, const char *a2, ...)
{
  return [a1 indexCount];
}

id objc_msgSend_indexType(void *a1, const char *a2, ...)
{
  return [a1 indexType];
}

id objc_msgSend_initDigitStructs(void *a1, const char *a2, ...)
{
  return [a1 initDigitStructs];
}

id objc_msgSend_initLayerAndInstanceStructs(void *a1, const char *a2, ...)
{
  return [a1 initLayerAndInstanceStructs];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_popDebugGroup(void *a1, const char *a2, ...)
{
  return [a1 popDebugGroup];
}

id objc_msgSend_primitiveType(void *a1, const char *a2, ...)
{
  return [a1 primitiveType];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptor];
}

id objc_msgSend_rootContainerView(void *a1, const char *a2, ...)
{
  return [a1 rootContainerView];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_setFontToSFRoundedNumericSemibold10Point(void *a1, const char *a2, ...)
{
  return [a1 setFontToSFRoundedNumericSemibold10Point];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_springStep(void *a1, const char *a2, ...)
{
  return [a1 springStep];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_submeshes(void *a1, const char *a2, ...)
{
  return [a1 submeshes];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return [a1 uniqueId];
}

id objc_msgSend_vertexBuffers(void *a1, const char *a2, ...)
{
  return [a1 vertexBuffers];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}