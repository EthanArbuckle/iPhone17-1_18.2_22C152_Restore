@interface _BCUCoverEffectsAssets
- (CGColor)overlayColor;
- (CGImage)edges;
- (CGImage)spineLinearBurnBlend;
- (CGImage)spineNormalBlend;
- (CGImage)spineSoftLightBlend;
- (_BCUCoverEffectsAssets)initWithBundle:(id)a3 rtl:(BOOL)a4 night:(BOOL)a5;
- (_BCUCoverEffectsAssets)initWithBundle:(id)a3 rtl:(BOOL)a4 night:(BOOL)a5 small:(BOOL)a6;
@end

@implementation _BCUCoverEffectsAssets

- (_BCUCoverEffectsAssets)initWithBundle:(id)a3 rtl:(BOOL)a4 night:(BOOL)a5
{
  return (_BCUCoverEffectsAssets *)objc_msgSend_initWithBundle_rtl_night_small_(self, a2, (uint64_t)a3, a4, a5, 0);
}

- (_BCUCoverEffectsAssets)initWithBundle:(id)a3 rtl:(BOOL)a4 night:(BOOL)a5 small:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v51.receiver = self;
  v51.super_class = (Class)_BCUCoverEffectsAssets;
  v11 = [(_BCUCoverEffectsAssets *)&v51 init];
  if (v11)
  {
    v12 = @"_RTL";
    if (!v8) {
      v12 = &stru_26E9DCDC8;
    }
    v13 = v12;
    v14 = @"~Night";
    if (!v7) {
      v14 = &stru_26E9DCDC8;
    }
    v15 = v14;
    v16 = @"L";
    if (v6) {
      v16 = @"S";
    }
    v17 = v16;
    v11->_overlayColor = 0;
    v19 = objc_msgSend_stringWithFormat_(NSString, v18, @"iBooks_Covers%@_Flat-%@_Spine_NormalBlend%@", v13, v17, v15);
    objc_msgSend_URLForResource_withExtension_(v10, v20, (uint64_t)v19, @"png");
    CFURLRef v21 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLRef v22 = v21;
    if (v21 && (v23 = CGDataProviderCreateWithURL(v21)) != 0)
    {
      v24 = v23;
      CGImageRef v25 = CGImageCreateWithPNGDataProvider(v23, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v24);
    }
    else
    {
      CGImageRef v25 = 0;
    }

    v11->_spineNormalBlend = v25;
    v27 = objc_msgSend_stringWithFormat_(NSString, v26, @"iBooks_Covers%@_Flat-%@_Spine_SoftLightBlend%@", v13, v17, v15);
    objc_msgSend_URLForResource_withExtension_(v10, v28, (uint64_t)v27, @"png");
    CFURLRef v29 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLRef v30 = v29;
    if (v29 && (v31 = CGDataProviderCreateWithURL(v29)) != 0)
    {
      v32 = v31;
      CGImageRef v33 = CGImageCreateWithPNGDataProvider(v31, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v32);
    }
    else
    {
      CGImageRef v33 = 0;
    }

    v11->_spineSoftLightBlend = v33;
    v35 = objc_msgSend_stringWithFormat_(NSString, v34, @"iBooks_Covers%@_Flat-%@_Spine_LinearBurnBlend%@", v13, v17, v15);
    objc_msgSend_URLForResource_withExtension_(v10, v36, (uint64_t)v35, @"png");
    CFURLRef v37 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLRef v38 = v37;
    if (v37 && (v39 = CGDataProviderCreateWithURL(v37)) != 0)
    {
      v40 = v39;
      CGImageRef v41 = CGImageCreateWithPNGDataProvider(v39, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v40);
    }
    else
    {
      CGImageRef v41 = 0;
    }

    v11->_spineLinearBurnBlend = v41;
    v43 = objc_msgSend_stringWithFormat_(NSString, v42, @"iBooks_Covers%@_Flat-%@_Edges%@", v13, v17, v15);
    objc_msgSend_URLForResource_withExtension_(v10, v44, (uint64_t)v43, @"png");
    CFURLRef v45 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLRef v46 = v45;
    if (v45 && (v47 = CGDataProviderCreateWithURL(v45)) != 0)
    {
      v48 = v47;
      CGImageRef v49 = CGImageCreateWithPNGDataProvider(v47, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v48);
    }
    else
    {
      CGImageRef v49 = 0;
    }

    v11->_edges = v49;
  }

  return v11;
}

- (CGImage)spineNormalBlend
{
  return self->_spineNormalBlend;
}

- (CGImage)spineLinearBurnBlend
{
  return self->_spineLinearBurnBlend;
}

- (CGImage)spineSoftLightBlend
{
  return self->_spineSoftLightBlend;
}

- (CGImage)edges
{
  return self->_edges;
}

- (CGColor)overlayColor
{
  return self->_overlayColor;
}

@end