@interface NTKParmesanColorPalette
+ (id)colorRampFiltersForMonochromeColorMatrix:(id)a3 fromPalette:(id)a4 toPalette:(id)a5 transitionFraction:(double)a6;
- (BOOL)duotone;
- (BOOL)isCompositePalette;
- (BOOL)isPlainOption;
- (BOOL)isTritoneOption;
- (BOOL)isVibrantOption;
- (NTKParmesanColorPalette)init;
- (id)_monocolorRampColor;
- (id)colorRampImage;
- (id)colorRampsIndex;
- (id)colorRampsIndexByColorName;
- (id)imageAsset;
- (id)monocolorRampImage;
- (id)swatchImageForSize:(CGSize)a3;
- (id)swatchPrimaryColor;
- (id)tritoneColors;
- (void)setDuotone:(BOOL)a3;
@end

@implementation NTKParmesanColorPalette

- (NTKParmesanColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKParmesanColorPalette;
  return [(NTKFaceColorPalette *)&v5 initWithFaceClass:v3];
}

- (BOOL)isPlainOption
{
  v4 = objc_msgSend_configuration(self, a2, v2, v3);
  v8 = objc_msgSend_colorOption(v4, v5, v6, v7);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"plain", v10);

  return isEqualToString;
}

- (BOOL)isVibrantOption
{
  v4 = objc_msgSend_configuration(self, a2, v2, v3);
  v8 = objc_msgSend_colorOption(v4, v5, v6, v7);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"vibrant", v10);

  return isEqualToString;
}

- (BOOL)isTritoneOption
{
  v4 = objc_msgSend_configuration(self, a2, v2, v3);
  v8 = objc_msgSend_colorOption(v4, v5, v6, v7);
  char v11 = objc_msgSend_containsString_(v8, v9, @"tritone", v10);

  return v11;
}

- (id)tritoneColors
{
  v20[3] = *MEMORY[0x263EF8340];
  if (objc_msgSend_isTritoneOption(self, a2, v2, v3))
  {
    v8 = objc_msgSend_toColor1(self, v5, v6, v7);
    v12 = objc_msgSend_toColor2(self, v9, v10, v11, v8);
    v20[1] = v12;
    v16 = objc_msgSend_toColor3(self, v13, v14, v15);
    v20[2] = v16;
    v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v17, (uint64_t)v20, 3);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (objc_msgSend_isPlainOption(self, a2, v3, v4))
  {
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      objc_msgSend_sizeForSwatchStyle_(MEMORY[0x263F579C0], v8, 0, v10);
      double width = v12;
      double height = v13;
    }
    objc_msgSend_blackColor(MEMORY[0x263F825C8], v8, v9, v10);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v69.double width = width;
    v69.double height = height;
    UIGraphicsBeginImageContextWithOptions(v69, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend_set(v14, v16, v17, v18);
    v73.origin.x = 0.0;
    v73.origin.y = 0.0;
    v73.size.double width = width;
    v73.size.double height = height;
    CGContextFillEllipseInRect(CurrentContext, v73);
    v19 = UIGraphicsGetCurrentContext();
    Image = CGBitmapContextCreateImage(v19);
    UIGraphicsEndImageContext();
    v70.double width = width;
    v70.double height = height;
    UIGraphicsBeginImageContextWithOptions(v70, 0, 0.0);
    v21 = UIGraphicsGetCurrentContext();
    v74.origin.x = 0.0;
    v74.origin.y = 0.0;
    v74.size.double width = width;
    v74.size.double height = height;
    CGContextClipToMask(v21, v74, Image);
    objc_msgSend_set(v14, v22, v23, v24);
    transform.b = 0.0;
    transform.c = 0.0;
    transform.a = 1.0;
    *(_OWORD *)&transform.d = xmmword_246C32CD0;
    transform.ty = height;
    CGContextConcatCTM(v21, &transform);
    NTKImageNamed();
    id v25 = objc_claimAutoreleasedReturnValue();
    v29 = (CGImage *)objc_msgSend_CGImage(v25, v26, v27, v28);
    v75.origin.x = 0.0;
    v75.origin.y = 0.0;
    v75.size.double width = width;
    v75.size.double height = height;
    CGContextDrawImage(v21, v75, v29);
    v30 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(Image);

    goto LABEL_21;
  }
  if (objc_msgSend_isVibrantOption(self, v8, v9, v10))
  {
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v31, v32, v33, 0.874509804, 0.874509804, 0.874509804, 1.0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F825C8], v34, v35, v36, 0.435294118, 0.435294118, 0.435294118, 1.0);
    v30 = NTKSwatchTwoColorGradientImage();

LABEL_21:
    goto LABEL_22;
  }
  if (objc_msgSend_isTritoneOption(self, v31, v32, v33))
  {
    objc_msgSend_tritoneColors(self, v38, v39, v40);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v30 = NTKSwatchColorSectorsImage();
    goto LABEL_21;
  }
  if (objc_msgSend_isCompositePalette(self, v38, v39, v40))
  {
    v46 = objc_msgSend_colorRampImage(self, v41, v42, v43);
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      objc_msgSend_sizeForSwatchStyle_(MEMORY[0x263F579C0], v44, 0, v45);
      double width = v48;
      double height = v49;
    }
    v71.double width = width;
    v71.double height = height;
    UIGraphicsBeginImageContextWithOptions(v71, 0, 0.0);
    v50 = UIGraphicsGetCurrentContext();
    v54 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v51, v52, v53);
    objc_msgSend_set(v54, v55, v56, v57);

    v76.origin.x = 0.0;
    v76.origin.y = 0.0;
    v76.size.double width = width;
    v76.size.double height = height;
    CGContextFillEllipseInRect(v50, v76);
    v58 = UIGraphicsGetCurrentContext();
    v59 = CGBitmapContextCreateImage(v58);
    UIGraphicsEndImageContext();
    v72.double width = width;
    v72.double height = height;
    UIGraphicsBeginImageContextWithOptions(v72, 0, 0.0);
    v60 = UIGraphicsGetCurrentContext();
    v77.origin.x = 0.0;
    v77.origin.y = 0.0;
    v77.size.double width = width;
    v77.size.double height = height;
    CGContextClipToMask(v60, v77, v59);
    CGContextTranslateCTM(v60, width * 0.5, height * 0.5);
    CGContextRotateCTM(v60, -2.35619449);
    CGContextTranslateCTM(v60, width * -0.5, height * -0.5);
    id v14 = v46;
    v64 = (CGImage *)objc_msgSend_CGImage(v14, v61, v62, v63);
    v78.origin.x = 0.0;
    v78.origin.y = 0.0;
    v78.size.double width = width;
    v78.size.double height = height;
    CGContextDrawImage(v60, v78, v64);
    v30 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(v59);
    goto LABEL_21;
  }
  v66.receiver = self;
  v66.super_class = (Class)NTKParmesanColorPalette;
  v30 = -[NTKFaceColorPalette swatchImageForSize:](&v66, sel_swatchImageForSize_, width, height);
LABEL_22:

  return v30;
}

- (id)imageAsset
{
  return (id)NTKImageNamed();
}

- (BOOL)isCompositePalette
{
  objc_super v5 = (void *)MEMORY[0x263F57A50];
  uint64_t v6 = objc_msgSend_pigmentEditOption(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_identifier(v6, v7, v8, v9);
  double v13 = objc_msgSend_multitoneColorNames_(v5, v11, (uint64_t)v10, v12);

  v19.receiver = self;
  v19.super_class = (Class)NTKParmesanColorPalette;
  BOOL v17 = [(NTKFaceColorPalette *)&v19 isCompositePalette]
     || (unint64_t)objc_msgSend_count(v13, v14, v15, v16) > 1;

  return v17;
}

- (id)colorRampsIndex
{
  objc_super v5 = objc_msgSend_pigmentEditOption(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_identifier(v5, v6, v7, v8);

  if (objc_msgSend_duotone(self, v10, v11, v12)
    && (objc_msgSend_isCompositePalette(self, v13, v14, v15) & 1) == 0)
  {
    uint64_t v16 = objc_msgSend_duotoneNameWithName_otherName_(MEMORY[0x263F57A50], v13, (uint64_t)v9, @"duotone");

    uint64_t v9 = (void *)v16;
  }
  BOOL v17 = objc_msgSend_colorRampsIndexByColorName(self, v13, v14, v15);
  v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v9, v19);

  if (!v20)
  {
    uint64_t v24 = objc_msgSend_colorRampsIndexByColorName(self, v21, v22, v23);
    uint64_t v28 = objc_msgSend_configuration(self, v25, v26, v27);
    uint64_t v32 = objc_msgSend_colorOption(v28, v29, v30, v31);
    v20 = objc_msgSend_objectForKeyedSubscript_(v24, v33, (uint64_t)v32, v34);
  }

  return v20;
}

- (id)colorRampImage
{
  if ((objc_msgSend_isPlainOption(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isVibrantOption(self, v5, v6, v7) & 1) != 0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_imageAsset(self, v8, v9, v10);
    uint64_t v16 = objc_msgSend_colorRampsIndex(self, v13, v14, v15);
    v20 = v16;
    if (v16)
    {
      objc_msgSend_intValue(v16, v17, v18, v19);
    }
    else
    {
      objc_msgSend_size(v12, v17, v18, v19);
      double v26 = v25;
      objc_msgSend_scale(v12, v27, v28, v29);
      double v24 = v26 * v30 + -1.0;
    }
    objc_msgSend_size(v12, v21, v22, v23, v24);
    uint64_t v11 = NTKCropImage();
  }

  return v11;
}

- (id)monocolorRampImage
{
  if ((objc_msgSend_isPlainOption(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isVibrantOption(self, v5, v6, v7) & 1) != 0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend__monocolorRampColor(self, v8, v9, v10);
    v18.double width = 1.0;
    v18.double height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v18, 1, 1.0);
    objc_msgSend_setFill(v12, v13, v14, v15);
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.double width = 1.0;
    v19.size.double height = 1.0;
    UIRectFill(v19);
    uint64_t v11 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v11;
}

- (id)_monocolorRampColor
{
  if (objc_msgSend_isCompositePalette(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_paletteAtIndex_(self, v5, 0, v7);
    uint64_t v12 = objc_msgSend_primaryColor(v8, v9, v10, v11);
  }
  else
  {
    uint64_t v12 = objc_msgSend_primaryColor(self, v5, v6, v7);
  }

  return v12;
}

- (id)swatchPrimaryColor
{
  if (objc_msgSend_isCompositePalette(self, a2, v2, v3))
  {
    objc_super v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKParmesanColorPalette;
    objc_super v5 = [(NTKFaceColorPalette *)&v7 swatchPrimaryColor];
  }

  return v5;
}

- (id)colorRampsIndexByColorName
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246B704B8;
  block[3] = &unk_2651FC2E0;
  block[4] = v5;
  if (qword_2691D8E70 != -1) {
    dispatch_once(&qword_2691D8E70, block);
  }
  id v2 = (id)qword_2691D8E78;
  _Block_object_dispose(v5, 8);

  return v2;
}

- (BOOL)duotone
{
  return self->_duotone;
}

- (void)setDuotone:(BOOL)a3
{
  self->_duotone = a3;
}

+ (id)colorRampFiltersForMonochromeColorMatrix:(id)a3 fromPalette:(id)a4 toPalette:(id)a5 transitionFraction:(double)a6
{
  v59[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  int v13 = NTKIsDefaultMonochromeColorMatrix();
  if (objc_msgSend_isPlainOption(v10, v14, v15, v16))
  {
    v20 = NTKInterpolateColorMatrixToIdentity();

    double v24 = v11;
    if (v13)
    {
LABEL_3:
      uint64_t v25 = objc_msgSend_monocolorRampImage(v24, v21, v22, v23);
      goto LABEL_7;
    }
  }
  else
  {
    if (!objc_msgSend_isPlainOption(v11, v17, v18, v19))
    {
      if (v13)
      {
        v50 = objc_msgSend_monocolorRampImage(v10, v28, v29, v30);
        objc_msgSend_monocolorRampImage(v11, v51, v52, v53);
      }
      else
      {
        v50 = objc_msgSend_colorRampImage(v10, v28, v29, v30);
        objc_msgSend_colorRampImage(v11, v54, v55, v56);
      uint64_t v57 = };
      uint64_t v31 = NTKInterpolateBetweenImages();

      a6 = 1.0;
      v20 = v12;
      if (v31) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    v20 = NTKInterpolateColorMatrixToIdentity();

    a6 = 1.0 - a6;
    double v24 = v10;
    if (v13) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = objc_msgSend_colorRampImage(v24, v21, v22, v23);
LABEL_7:
  uint64_t v31 = (void *)v25;
  if (v25)
  {
LABEL_8:
    uint64_t v32 = objc_msgSend_filterWithType_(MEMORY[0x263F157C8], v26, *MEMORY[0x263F15B40], v27);
    objc_msgSend_setValue_forKey_(v32, v33, (uint64_t)v20, @"inputColorMatrix");
    uint64_t v36 = objc_msgSend_filterWithType_(MEMORY[0x263F157C8], v34, *MEMORY[0x263F15CF0], v35);
    uint64_t v40 = objc_msgSend_numberWithDouble_(NSNumber, v37, v38, v39, a6);
    objc_msgSend_setValue_forKey_(v36, v41, (uint64_t)v40, @"inputAmount");

    id v42 = v31;
    uint64_t v46 = objc_msgSend_CGImage(v42, v43, v44, v45);
    objc_msgSend_setValue_forKey_(v36, v47, v46, @"inputColorMap");
    v59[0] = v32;
    v59[1] = v36;
    double v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v48, (uint64_t)v59, 2);

    goto LABEL_14;
  }
LABEL_13:
  double v49 = (void *)MEMORY[0x263EFFA68];
LABEL_14:

  return v49;
}

@end