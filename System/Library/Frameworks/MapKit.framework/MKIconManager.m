@interface MKIconManager
+ (CGColor)newFillColorForStyleAttributes:(id)a3 forScale:(double)a4;
+ (CGColor)newGlyphColorForStyleAttributes:(id)a3 forScale:(double)a4;
+ (CGColor)newHaloColorForStyleAttributes:(id)a3 forScale:(double)a4;
+ (id)_imageForFeatureStyleAttributes:(id)a3 iconText:(id)a4 size:(unint64_t)a5 forScale:(double)a6 navMode:(BOOL)a7 nightMode:(BOOL)a8;
+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5;
+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 navMode:(BOOL)a6;
+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 navMode:(BOOL)a6 nightMode:(BOOL)a7;
+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6;
+ (id)iconManager;
+ (id)imageForIconID:(unsigned int)a3 contentScale:(double)a4 sizeGroup:(unint64_t)a5 nightMode:(BOOL)a6;
+ (id)imageForMapItem:(id)a3 forScale:(double)a4;
+ (id)imageForMapItem:(id)a3 forScale:(double)a4 fallbackToBundleIcon:(BOOL)a5;
+ (id)imageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6;
+ (id)imageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 fallbackToBundleIcon:(BOOL)a7;
+ (id)imageForRouteAnnotationStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 nightMode:(BOOL)a9;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 nightMode:(BOOL)a10;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 isCarplay:(BOOL)a12;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 isCarplay:(BOOL)a12 nightMode:(BOOL)a13;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 nightMode:(BOOL)a12;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 nightMode:(BOOL)a11;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 nightMode:(BOOL)a8;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 nightMode:(BOOL)a7;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 nightMode:(BOOL)a8;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 interactive:(BOOL)a9;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 interactive:(BOOL)a9 nightMode:(BOOL)a10;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 isCarplay:(BOOL)a9;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 isCarplay:(BOOL)a9 nightMode:(BOOL)a10;
+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 nightMode:(BOOL)a9;
+ (id)imageForTrafficCamera:(id)a3 size:(unint64_t)a4 forScale:(double)a5;
+ (id)imageForTrafficCamera:(id)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6;
+ (id)imageForTrafficIncidentType:(int64_t)a3 size:(unint64_t)a4 forScale:(double)a5;
+ (id)imageForTrafficIncidentType:(int64_t)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6;
+ (void)requestImageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 completionHandler:(id)a6;
+ (void)requestImageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 completionHandler:(id)a6;
+ (void)setDiskCacheURL:(id)a3;
@end

@implementation MKIconManager

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 nightMode:(BOOL)a12
{
  BYTE3(v14) = a12;
  BYTE2(v14) = 0;
  LOWORD(v14) = __PAIR16__(a11, a10);
  v12 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:", a3, a4, *(void *)&a6, a7, a8, a9, a5, v14);

  return v12;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7
{
  v7 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:0 customIconID:0 fallbackToBundleIcon:a7 transparent:a5];

  return v7;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9
{
  LOBYTE(v11) = 0;
  v9 = [a1 imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:a7 customIconID:a8 fallbackToBundleIcon:a9 transparent:a5 transitmode:v11];

  return v9;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10
{
  LOWORD(v12) = a10;
  v10 = objc_msgSend(a1, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:", a3, a4, *(void *)&a6, a7, a8, a9, a5, v12);

  return v10;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11
{
  BYTE2(v13) = 0;
  LOWORD(v13) = __PAIR16__(a11, a10);
  uint64_t v11 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:", a3, a4, *(void *)&a6, a7, a8, a9, a5, v13);

  return v11;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 isCarplay:(BOOL)a12
{
  BYTE3(v14) = 0;
  *(_WORD *)((char *)&v14 + 1) = __PAIR16__(a12, a11);
  LOBYTE(v14) = a10;
  uint64_t v12 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:", a3, a4, *(void *)&a6, a7, a8, a9, a5, v14);

  return v12;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 isCarplay:(BOOL)a12 nightMode:(BOOL)a13
{
  BOOL v13 = a9;
  BOOL v14 = a8;
  uint64_t v16 = *(void *)&a6;
  id v20 = a3;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __142__MKIconManager_imageForStyle_size_forScale_format_customIconID_fallbackToBundleIcon_transparent_transitmode_interactive_isCarplay_nightMode___block_invoke;
  v36[3] = &unk_1E54BA728;
  BOOL v41 = a12;
  BOOL v42 = a10;
  BOOL v43 = v13;
  BOOL v44 = a13;
  id v34 = v20;
  id v37 = v34;
  id v38 = a1;
  double v39 = a5;
  unint64_t v40 = a4;
  v21 = (void (**)(void))MEMORY[0x18C139AE0](v36);
  if (qword_1EB315DB0 != -1) {
    dispatch_once(&qword_1EB315DB0, &__block_literal_global_192);
  }
  id v22 = (id)qword_1EB315DA8;
  v23 = v22;
  if (!a7 && v22 && GEOConfigGetBOOL())
  {
    uint64_t v24 = [v23 imageForStyleAttributes:v34 size:a4 scale:a12 isCarplay:a10 isTransit:v13 isTransparent:a13 isNightMode:a5 drawingBlock:v21];
  }
  else
  {
    uint64_t v24 = v21[2](v21);
  }
  v25 = (void *)v24;
  if (!v24 && v14)
  {
    double v35 = a5;
    uint64_t v26 = [MEMORY[0x1E4F42A80] _iconVariantForUIApplicationIconFormat:v16 scale:&v35];
    v27 = [MEMORY[0x1E4F28B50] _mapkitBundle];
    uint64_t v28 = [v27 _cfBundle];

    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    v29 = _MergedGlobals_143;
    v53 = _MergedGlobals_143;
    if (!_MergedGlobals_143)
    {
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      v47 = __getLICreateIconForBundleSymbolLoc_block_invoke;
      v48 = &unk_1E54BA700;
      v49 = &v50;
      v30 = (void *)MobileIconsLibrary();
      v31 = dlsym(v30, "LICreateIconForBundle");
      *(void *)(v49[1] + 24) = v31;
      _MergedGlobals_143 = *(_UNKNOWN **)(v49[1] + 24);
      v29 = (void *)v51[3];
    }
    _Block_object_dispose(&v50, 8);
    if (!v29)
    {
      dlerror();
      id result = (id)abort_report_np();
      __break(1u);
      return result;
    }
    v32 = (CGImage *)((uint64_t (*)(uint64_t, void, uint64_t, void))v29)(v28, 0, v26, 0);
    if (v32)
    {
      v25 = [MEMORY[0x1E4F42A80] imageWithCGImage:v32 scale:0 orientation:v35];
      CGImageRelease(v32);
    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

+ (id)imageForIconID:(unsigned int)a3 contentScale:(double)a4 sizeGroup:(unint64_t)a5 nightMode:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = *(void *)&a3;
  id v11 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
  [v11 setNightMode:v6];
  uint64_t v12 = [a1 iconManager];
  BOOL v14 = v12;
  if (a5 > 5) {
    uint64_t v15 = 5;
  }
  else {
    uint64_t v15 = qword_18BD1B1F8[a5];
  }
  *(float *)&double v13 = a4;
  uint64_t v16 = [v12 imageForIconID:v9 contentScale:v15 sizeGroup:v11 modifiers:v13];

  if (v16)
  {
    v17 = (void *)[v16 image];
    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F42A80]);
      [v16 contentScale];
      v17 = (void *)[v18 initWithCGImage:v17 scale:0 orientation:v19];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (CGColor)newFillColorForStyleAttributes:(id)a3 forScale:(double)a4
{
  id v6 = a3;
  v7 = [a1 iconManager];
  *(float *)&double v8 = a4;
  uint64_t v9 = [v7 imageForStyleAttributes:v6 withStylesheetName:@"default-search" contentScale:4 sizeGroup:0 modifiers:v8];

  if (v9) {
    v10 = CGColorRetain((CGColorRef)[v9 fillColor]);
  }
  else {
    v10 = 0;
  }

  return v10;
}

id __142__MKIconManager_imageForStyle_size_forScale_format_customIconID_fallbackToBundleIcon_transparent_transitmode_interactive_isCarplay_nightMode___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && GEOConfigGetBOOL())
  {
    if (*(unsigned char *)(a1 + 64)) {
      v2 = @"default-search-car";
    }
    else {
      v2 = @"default-search";
    }
    int v3 = *(unsigned __int8 *)(a1 + 65);
    id v4 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
    v5 = v4;
    if (*(unsigned char *)(a1 + 66)) {
      [v4 setGlyphOnly:1];
    }
    [v5 setTransitMode:v3 != 0];
    if (*(unsigned char *)(a1 + 67)) {
      [v5 setNightMode:1];
    }
    id v6 = [*(id *)(a1 + 40) iconManager];
    v7 = v6;
    double v8 = *(double *)(a1 + 48);
    *(float *)&double v8 = v8;
    unint64_t v9 = *(void *)(a1 + 56);
    if (v9 > 5) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = qword_18BD1B1F8[v9];
    }
    uint64_t v12 = [v6 imageForStyleAttributes:*(void *)(a1 + 32) withStylesheetName:v2 contentScale:v10 sizeGroup:v5 modifiers:v8];

    if (v12)
    {
      double v13 = CGImageRetain((CGImageRef)[v12 image]);
      if (v13)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F42A80]);
        [v12 contentScale];
        id v11 = (void *)[v14 initWithCGImage:v13 scale:0 orientation:v15];
      }
      else
      {
        id v11 = 0;
      }
      CGImageRelease(v13);
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)iconManager
{
  return (id)[MEMORY[0x1E4FB3A20] sharedManager];
}

+ (void)setDiskCacheURL:(id)a3
{
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 nightMode:(BOOL)a8
{
  LOBYTE(v10) = a8;
  double v8 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:0 customIconID:0 fallbackToBundleIcon:a7 transparent:a5 nightMode:v10];

  return v8;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 nightMode:(BOOL)a10
{
  BYTE1(v12) = a10;
  LOBYTE(v12) = 0;
  uint64_t v10 = objc_msgSend(a1, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:nightMode:", a3, a4, *(void *)&a6, a7, a8, a9, a5, v12);

  return v10;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 nightMode:(BOOL)a11
{
  BYTE2(v13) = a11;
  LOWORD(v13) = a10;
  id v11 = objc_msgSend(a1, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:nightMode:", a3, a4, *(void *)&a6, a7, a8, a9, a5, v13);

  return v11;
}

+ (CGColor)newHaloColorForStyleAttributes:(id)a3 forScale:(double)a4
{
  id v6 = a3;
  v7 = [a1 iconManager];
  *(float *)&double v8 = a4;
  unint64_t v9 = [v7 imageForStyleAttributes:v6 withStylesheetName:@"default-search" contentScale:4 sizeGroup:0 modifiers:v8];

  if (v9) {
    uint64_t v10 = CGColorRetain((CGColorRef)[v9 haloColor]);
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (CGColor)newGlyphColorForStyleAttributes:(id)a3 forScale:(double)a4
{
  id v6 = a3;
  v7 = [a1 iconManager];
  *(float *)&double v8 = a4;
  unint64_t v9 = [v7 imageForStyleAttributes:v6 withStylesheetName:@"default-search" contentScale:4 sizeGroup:0 modifiers:v8];

  if (v9) {
    uint64_t v10 = CGColorRetain((CGColorRef)[v9 glyphColor]);
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 navMode:(BOOL)a6
{
  id v6 = [a1 _imageForFeatureStyleAttributes:a3 iconText:0 size:a4 forScale:a6 navMode:0 nightMode:a5];

  return v6;
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 navMode:(BOOL)a6 nightMode:(BOOL)a7
{
  v7 = [a1 _imageForFeatureStyleAttributes:a3 iconText:0 size:a4 forScale:a6 navMode:a7 nightMode:a5];

  return v7;
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 iconText:(id)a4 size:(unint64_t)a5 forScale:(double)a6 navMode:(BOOL)a7 nightMode:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
  [v16 setNightMode:v8];
  [v16 setNavMode:v9];
  [v16 setText:v15];
  v17 = [a1 iconManager];
  float v19 = v17;
  if (a5 > 5) {
    uint64_t v20 = 5;
  }
  else {
    uint64_t v20 = qword_18BD1B1F8[a5];
  }
  *(float *)&double v18 = a6;
  v21 = [v17 imageForStyleAttributes:v14 withStylesheetName:@"default-search" contentScale:v20 sizeGroup:v16 modifiers:v18];

  if (v21)
  {
    id v22 = (void *)[v21 image];
    if (v22)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F42A80]);
      [v21 contentScale];
      id v22 = (void *)[v23 initWithCGImage:v22 scale:0 orientation:v24];
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5
{
  v5 = [a1 _imageForFeatureStyleAttributes:a3 size:a4 forScale:0 navMode:a5];

  return v5;
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6
{
  id v6 = [a1 _imageForFeatureStyleAttributes:a3 size:a4 forScale:0 navMode:a6 nightMode:a5];

  return v6;
}

+ (id)imageForTrafficCamera:(id)a3 size:(unint64_t)a4 forScale:(double)a5
{
  v5 = [a1 imageForTrafficCamera:a3 size:a4 forScale:0 nightMode:a5];

  return v5;
}

+ (id)imageForTrafficCamera:(id)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = objc_msgSend(MEMORY[0x1E4F645A0], "styleAttributesForTrafficCameraType:isAboveThreshold:", objc_msgSend(v10, "type"), objc_msgSend(v10, "isAboveSpeedThreshold"));
  if ([v10 isSpeedLimitCamera])
  {
    uint64_t v12 = [v10 speedLimitText];
    uint64_t v13 = [a1 _imageForFeatureStyleAttributes:v11 iconText:v12 size:a4 forScale:1 navMode:v6 nightMode:a5];
  }
  else
  {
    uint64_t v13 = [a1 _imageForFeatureStyleAttributes:v11 size:a4 forScale:1 navMode:v6 nightMode:a5];
  }

  return v13;
}

+ (id)imageForTrafficIncidentType:(int64_t)a3 size:(unint64_t)a4 forScale:(double)a5
{
  return (id)[a1 imageForTrafficIncidentType:a3 size:a4 forScale:0 nightMode:a5];
}

+ (id)imageForTrafficIncidentType:(int64_t)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = [MEMORY[0x1E4F645A0] styleAttributesForTrafficIncidentType:a3];
  id v11 = [a1 _imageForFeatureStyleAttributes:v10 size:a4 forScale:v6 nightMode:a5];

  return v11;
}

+ (id)imageForRouteAnnotationStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5
{
  v5 = [a1 _imageForFeatureStyleAttributes:a3 size:a4 forScale:0 nightMode:a5];

  return v5;
}

+ (id)imageForMapItem:(id)a3 forScale:(double)a4
{
  id v4 = +[MKIconManager imageForMapItem:a3 forScale:1 fallbackToBundleIcon:a4];

  return v4;
}

+ (id)imageForMapItem:(id)a3 forScale:(double)a4 fallbackToBundleIcon:(BOOL)a5
{
  v5 = +[MKIconManager imageForMapItem:a3 size:3 forScale:0 format:a5 fallbackToBundleIcon:a4];

  return v5;
}

+ (id)imageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6
{
  BOOL v6 = +[MKIconManager imageForMapItem:a3 size:a4 forScale:*(void *)&a6 format:1 fallbackToBundleIcon:a5];

  return v6;
}

+ (id)imageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 fallbackToBundleIcon:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  uint64_t v12 = [v11 _styleAttributes];
  uint64_t v13 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:", v12, a4, v8, [v11 _customIconID], v7, a5);

  return v13;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6
{
  BOOL v6 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:0 customIconID:0 fallbackToBundleIcon:a5];

  return v6;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 nightMode:(BOOL)a7
{
  BOOL v7 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:0 customIconID:0 fallbackToBundleIcon:a7 nightMode:a5];

  return v7;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8
{
  uint64_t v8 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:a7 transparent:a8 transitMode:0 isCarplay:a5];

  return v8;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 nightMode:(BOOL)a9
{
  LOBYTE(v11) = a9;
  BOOL v9 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:a7 transparent:a8 transitMode:0 isCarplay:a5 nightMode:v11];

  return v9;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 isCarplay:(BOOL)a9
{
  BYTE2(v11) = a9;
  LOWORD(v11) = a8;
  BOOL v9 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:", a3, a4, *(void *)&a6, 0, 0, a7, a5, v11);

  return v9;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 isCarplay:(BOOL)a9 nightMode:(BOOL)a10
{
  BYTE3(v12) = a10;
  BYTE2(v12) = a9;
  LOWORD(v12) = a8;
  id v10 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:", a3, a4, *(void *)&a6, 0, 0, a7, a5, v12);

  return v10;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 interactive:(BOOL)a9
{
  BYTE1(v11) = a9;
  LOBYTE(v11) = a8;
  BOOL v9 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:", a3, a4, *(void *)&a6, 0, 0, a7, a5, v11);

  return v9;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 interactive:(BOOL)a9 nightMode:(BOOL)a10
{
  BYTE2(v12) = a10;
  BYTE1(v12) = a9;
  LOBYTE(v12) = a8;
  id v10 = +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:nightMode:", a3, a4, *(void *)&a6, 0, 0, a7, a5, v12);

  return v10;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7
{
  BOOL v7 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:a7 customIconID:0 fallbackToBundleIcon:a5];

  return v7;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 nightMode:(BOOL)a8
{
  uint64_t v8 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:a7 customIconID:0 fallbackToBundleIcon:a8 nightMode:a5];

  return v8;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8
{
  uint64_t v8 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:a7 customIconID:a8 fallbackToBundleIcon:0 transparent:a5];

  return v8;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 nightMode:(BOOL)a9
{
  LOBYTE(v11) = a9;
  BOOL v9 = +[MKIconManager imageForStyle:a3 size:a4 forScale:*(void *)&a6 format:a7 customIconID:a8 fallbackToBundleIcon:0 transparent:a5 nightMode:v11];

  return v9;
}

+ (void)requestImageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.MapKit.SnapshotService"];
  uint64_t v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA43378];
  [v11 setRemoteObjectInterface:v12];

  [v11 resume];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke;
  v21[3] = &unk_1E54BA750;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v22 = v14;
  id v15 = [v14 remoteObjectProxyWithErrorHandler:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke_2;
  v18[3] = &unk_1E54BA778;
  id v16 = v13;
  id v20 = v16;
  id v17 = v14;
  id v19 = v17;
  [v15 requestIconWithStyleAttributes:v9 size:a4 scale:v18 completionHandler:a5];
}

uint64_t __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)requestImageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [v9 _identifier];

  if (v11)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__13;
    float v24 = __Block_byref_object_dispose__13;
    id v25 = 0;
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke;
    block[3] = &unk_1E54BA7C8;
    id v17 = buf;
    id v15 = v9;
    unint64_t v18 = a4;
    double v19 = a5;
    id v16 = v10;
    dispatch_async(v12, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v13 = GEOGetMKIconManagerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_INFO, "Cannot request an image for MapItem with no identifier.", buf, 2u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[MKIconManager imageForMapItem:*(void *)(a1 + 32) size:*(void *)(a1 + 56) forScale:0 format:1 fallbackToBundleIcon:*(double *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke_2;
  v7[3] = &unk_1E54BA7A0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

@end