@interface _MKMarkerStyle
+ (id)markerStyleForTraitCollection:(id)a3 state:(int64_t)a4 styleAttributes:(id)a5 coordinate:(CLLocationCoordinate2D)a6;
- (UIColor)glyphColor;
- (UIColor)markerColor;
- (UIColor)strokeColor;
- (UIImage)glyphImage;
- (double)shadowAlpha;
- (double)strokeWidth;
@end

@implementation _MKMarkerStyle

+ (id)markerStyleForTraitCollection:(id)a3 state:(int64_t)a4 styleAttributes:(id)a5 coordinate:(CLLocationCoordinate2D)a6
{
  double longitude = a6.longitude;
  double latitude = a6.latitude;
  id v11 = a3;
  id v12 = a5;
  [v11 displayScale];
  if (v13 == 0.0)
  {
    v14 = [MEMORY[0x1E4F42D90] mainScreen];
    [v14 scale];
    double v16 = v15;
  }
  else
  {
    double v16 = v13;
  }
  if (qword_1EB315BB0 != -1) {
    dispatch_once(&qword_1EB315BB0, &__block_literal_global_7);
  }
  uint64_t v17 = [v11 userInterfaceStyle];
  uint64_t v18 = 1000;
  if (v17 != 2) {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [NSNumber numberWithInteger:100 * a4 + (int)v16 + v18];
  v20 = (void *)v19;
  if (v12)
  {
    id v71 = v11;
    v72 = (void *)v19;
    v21 = [MEMORY[0x1E4F645A0] styleAttributesForSearchResultWithAttributes:v12];
    goto LABEL_10;
  }
  id v42 = [(id)_MergedGlobals_7 objectForKey:v19];
  if (!v42)
  {
    id v71 = v11;
    v72 = v20;
    v21 = [MEMORY[0x1E4F645A0] annotationViewProvidedCustomFeatureStyleAttributes];
LABEL_10:
    v22 = v21;
    v23 = [v21 styleAttributesWithElevatedGround:0];

    int64_t v24 = a4;
    unint64_t v25 = a4 - 1;
    id v26 = a1;
    if (v25 <= 1)
    {
      uint64_t v27 = [MEMORY[0x1E4F645A0] styleAttributesForCalloutWithAttributes:v23];

      v23 = (void *)v27;
    }
    BOOL v28 = v17 == 2;
    id v29 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
    [v29 setNightMode:v28];
    [v29 setSearchResult:1];
    id v30 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
    [v30 setGlyphOnly:1];
    [v30 setNightMode:v28];
    [v30 setSearchResult:1];
    v31 = off_1E54B7000;
    v32 = +[MKIconManager iconManager];
    float v33 = v16;
    *(float *)&double v34 = v33;
    v35 = [v32 imageForStyleAttributes:v23 withStylesheetName:@"default" contentScale:8 sizeGroup:v30 modifiers:v34];

    v36 = +[MKIconManager iconManager];
    *(float *)&double v37 = v16;
    v38 = [v36 imageForStyleAttributes:v23 withStylesheetName:@"default" contentScale:8 sizeGroup:v29 modifiers:v37];

    if (v35) {
      BOOL v39 = v38 == 0;
    }
    else {
      BOOL v39 = 1;
    }
    BOOL v40 = !v39 || v12 == 0;
    char v41 = !v40;
    char v70 = v41;
    if (!v40)
    {
      id v11 = v71;
      objc_msgSend(v26, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", latitude, longitude);
      v31 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
      id v42 = 0;
      goto LABEL_44;
    }
    id v42 = objc_alloc_init((Class)v26);
    [v42 strokeWidth];
    *((void *)v42 + 4) = v43;
    if (!v38)
    {
LABEL_36:
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", objc_msgSend(v35, "image"), 0, v16);
        v31 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
        uint64_t v64 = [v31 imageWithRenderingMode:2];
        v65 = (void *)*((void *)v42 + 6);
        *((void *)v42 + 6) = v64;
      }
      if (!v24)
      {
        [*((id *)v42 + 6) size];
        if (v66 > 28.0)
        {
          objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", objc_msgSend(*((id *)v42 + 6), "CGImage"), 0, v16 + v16);
          v31 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
          uint64_t v67 = [v31 imageWithRenderingMode:2];
          v68 = (void *)*((void *)v42 + 6);
          *((void *)v42 + 6) = v67;
        }
      }
      if (!v12) {
        [(id)_MergedGlobals_7 setObject:v42 forKey:v72];
      }
      id v11 = v71;
LABEL_44:

      v20 = v72;
      if (v70) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
    if ([v38 calloutHaloColor])
    {
      uint64_t v44 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v38, "calloutHaloColor"));
      v45 = (void *)*((void *)v42 + 1);
      *((void *)v42 + 1) = v44;
    }
    else
    {
      uint64_t v46 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v38, "fillColor"));
      v47 = (void *)*((void *)v42 + 1);
      *((void *)v42 + 1) = v46;

      if (*((double *)v42 + 4) <= 0.0)
      {
LABEL_31:
        v31 = (__objc2_class **)MEMORY[0x1E4F428B8];
        uint64_t v49 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v38, "glyphColor"));
        v50 = (void *)*((void *)v42 + 5);
        *((void *)v42 + 5) = v49;

        [v38 opacity];
        if (v51 < 1.0)
        {
          [v38 opacity];
          if (v52 > 0.01)
          {
            v53 = (void *)*((void *)v42 + 1);
            [v38 opacity];
            uint64_t v55 = objc_msgSend(v53, "colorWithAlphaComponent:", CGColorGetAlpha((CGColorRef)objc_msgSend(*((id *)v42 + 1), "CGColor")) * v54);
            v56 = (void *)*((void *)v42 + 1);
            *((void *)v42 + 1) = v55;

            v57 = (void *)*((void *)v42 + 3);
            if (v57)
            {
              [v38 opacity];
              uint64_t v59 = objc_msgSend(v57, "colorWithAlphaComponent:", CGColorGetAlpha((CGColorRef)objc_msgSend(*((id *)v42 + 3), "CGColor")) * v58);
              v60 = (void *)*((void *)v42 + 3);
              *((void *)v42 + 3) = v59;
            }
            v31 = (__objc2_class **)*((void *)v42 + 5);
            [v38 opacity];
            uint64_t v62 = objc_msgSend(v31, "colorWithAlphaComponent:", CGColorGetAlpha((CGColorRef)objc_msgSend(*((id *)v42 + 5), "CGColor")) * v61);
            v63 = (void *)*((void *)v42 + 5);
            *((void *)v42 + 5) = v62;
          }
        }
        goto LABEL_36;
      }
      uint64_t v48 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v38, "haloColor"));
      v45 = (void *)*((void *)v42 + 3);
      *((void *)v42 + 3) = v48;
    }

    goto LABEL_31;
  }
LABEL_45:
  id v42 = v42;
  v31 = (__objc2_class **)v42;
LABEL_46:

  return v31;
}

- (UIColor)markerColor
{
  return self->_markerColor;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_markerColor, 0);
}

@end