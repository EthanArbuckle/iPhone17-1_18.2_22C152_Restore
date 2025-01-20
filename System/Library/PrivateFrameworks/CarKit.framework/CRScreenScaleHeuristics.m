@interface CRScreenScaleHeuristics
+ (BOOL)viewAreas:(id)a3 containsSize:(CGSize)a4;
+ (double)getPrimaryDisplayScale:(CGSize)a3 viewAreas:(id)a4;
+ (double)getPrimaryDisplayScale:(CGSize)a3 viewAreas:(id)a4 widthThreshold:(double)a5 heightThreshold:(double)a6;
+ (double)getSecondaryDisplayScale:(CGSize)a3 physicalSize:(CGSize)a4;
+ (void)scaledDisplays:(id)a3 reply:(id)a4;
@end

@implementation CRScreenScaleHeuristics

+ (void)scaledDisplays:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v6 = (void (**)(id, id, void))a4;
    id v7 = a3;
    v8 = objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__CRScreenScaleHeuristics_scaledDisplays_reply___block_invoke;
    v11[3] = &unk_1E5E3B080;
    id v13 = a1;
    id v9 = v8;
    id v12 = v9;
    [v7 enumerateObjectsUsingBlock:v11];

    v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_DEFAULT, "CRScreenScaleHeuristics: displays: %@", buf, 0xCu);
    }

    v6[2](v6, v9, 0);
  }
}

void __48__CRScreenScaleHeuristics_scaledDisplays_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F211A0];
  id v6 = a2;
  CFDictionaryRef v7 = [v6 objectForKey:v5];
  uint64_t v8 = *MEMORY[0x1E4F211A8];
  CFDictionaryRef v9 = [v6 objectForKey:*MEMORY[0x1E4F211A8]];
  v27.double width = 0.0;
  v27.double height = 0.0;
  v26.double width = 0.0;
  v26.double height = 0.0;
  CRSizeFromDictionary(v7, &v27);
  CRSizeFromDictionary(v9, &v26);
  double width = v26.width;
  double height = v26.height;
  double v12 = 684.0;
  double v13 = v27.width / v27.height;
  v14 = [v6 objectForKey:@"ViewAreas"];

  if (v27.height > 80.0 || v26.height < 600.0 || v26.height >= 684.0 || v13 < 1.6)
  {
    if (v27.height == 156.0 && v26.height == 1172.0 && v13 <= 1.0)
    {
      signed int v15 = ((int)(v13 * 1380.0) + 1) & 0xFFFFFFFE;
      int v16 = 1380;
    }
    else
    {
      signed int v15 = (int)width;
      int v16 = (int)height;
      if (v27.height == 91.0 && v26.height == 720.0)
      {
        BOOL v17 = v13 < 2.4 || v14 == 0;
        if (!v17 && objc_msgSend(*(id *)(a1 + 40), "viewAreas:containsSize:", v14, 1760.0, 660.0))
        {
          signed int v15 = ((int)(v13 * 774.0) + 1) & 0xFFFFFFFE;
          int v16 = 774;
          double v12 = 660.0;
        }
      }
    }
  }
  else
  {
    signed int v15 = ((int)(v13 * 720.0) + 1) & 0xFFFFFFFE;
    int v16 = 720;
  }
  double v18 = (double)v15;
  double v19 = (double)v16;
  v30.double width = (double)v15;
  v30.double height = (double)v16;
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v30);
  if (a3)
  {
    v21 = +[CARPrototypePref force3xCluster];
    char v22 = [v21 valueBool];

    double v23 = 3.0;
    if ((v22 & 1) == 0) {
      objc_msgSend(*(id *)(a1 + 40), "getSecondaryDisplayScale:physicalSize:", v18, v19, v27.width, v27.height);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "getPrimaryDisplayScale:viewAreas:widthThreshold:heightThreshold:", v14, v18, (double)v16, 1122.0, v12);
  }
  v28[0] = v5;
  v28[1] = v8;
  v29[0] = v7;
  v29[1] = DictionaryRepresentation;
  v28[2] = @"preferredUIScale";
  v24 = [NSNumber numberWithUnsignedInteger:(unint64_t)v23];
  v29[2] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];

  [*(id *)(a1 + 32) addObject:v25];
}

+ (double)getPrimaryDisplayScale:(CGSize)a3 viewAreas:(id)a4 widthThreshold:(double)a5 heightThreshold:(double)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a4;
  v11 = v10;
  uint64_t v16 = 0;
  BOOL v17 = (float *)&v16;
  uint64_t v18 = 0x2020000000;
  float v12 = 2.0;
  if (width >= a5 && height >= a6) {
    float v12 = 3.0;
  }
  float v19 = v12;
  if (v10 && width >= a5 && height >= a6 && [v10 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__CRScreenScaleHeuristics_getPrimaryDisplayScale_viewAreas_widthThreshold_heightThreshold___block_invoke;
    v15[3] = &unk_1E5E3B0A8;
    *(double *)&v15[5] = a5;
    *(double *)&v15[6] = a6;
    v15[4] = &v16;
    [v11 enumerateObjectsUsingBlock:v15];
  }
  double v13 = v17[6];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __91__CRScreenScaleHeuristics_getPrimaryDisplayScale_viewAreas_widthThreshold_heightThreshold___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  CFDictionaryRef v7 = [v6 objectForKey:@"safeArea"];

  uint64_t v8 = v6;
  if (v7)
  {
    uint64_t v8 = [v6 objectForKey:@"safeArea"];
  }
  if (v8)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    CRSizeFromAirPlayDictionary(v8, &v11);
    if (v11 < *(double *)(a1 + 40)) {
      goto LABEL_8;
    }
    double v9 = 2.0;
    if (v12 >= *(double *)(a1 + 48)) {
      double v9 = 3.0;
    }
    float v10 = v9;
    if (v10 < 3.0)
    {
LABEL_8:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0x40000000;
      *a4 = 1;
    }
  }
}

+ (double)getPrimaryDisplayScale:(CGSize)a3 viewAreas:(id)a4
{
  objc_msgSend(a1, "getPrimaryDisplayScale:viewAreas:widthThreshold:heightThreshold:", a4, a3.width, a3.height, 1122.0, 684.0);
  return result;
}

+ (double)getSecondaryDisplayScale:(CGSize)a3 physicalSize:(CGSize)a4
{
  return 2.0;
}

+ (BOOL)viewAreas:(id)a3 containsSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__CRScreenScaleHeuristics_viewAreas_containsSize___block_invoke;
  v9[3] = &unk_1E5E3B0A8;
  *(CGFloat *)&v9[5] = width;
  *(CGFloat *)&v9[6] = height;
  v9[4] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __50__CRScreenScaleHeuristics_viewAreas_containsSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v9 = 0.0;
  double v10 = 0.0;
  uint64_t result = CRSizeFromAirPlayDictionary(a2, &v9);
  if (v9 == *(double *)(a1 + 40)
    && v10 == *(double *)(a1 + 48)
    && (v9 != *MEMORY[0x1E4F1DB30] || v10 != *(double *)(MEMORY[0x1E4F1DB30] + 8)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end