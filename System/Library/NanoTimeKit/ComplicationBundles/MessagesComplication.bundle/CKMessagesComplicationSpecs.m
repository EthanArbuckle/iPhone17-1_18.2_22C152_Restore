@interface CKMessagesComplicationSpecs
+ (id)bubbleTintColor;
- (BOOL)needToScaleToFillForFamily:(int64_t)a3;
- (BOOL)unreadCountShouldBeDrawnOnBubbleForFamily:(int64_t)a3;
- (CGSize)canvasSizeCircular;
- (CGSize)canvasSizeCircularMedium;
- (CGSize)canvasSizeCircularSmall;
- (CGSize)canvasSizeCircularXL;
- (CGSize)canvasSizeCorner;
- (CGSize)canvasSizeCornerSmall;
- (CGSize)canvasSizeExtraLarge;
- (CGSize)canvasSizeForFamily:(int64_t)a3;
- (CGSize)canvasSizeForFamily:(int64_t)a3 andTemplate:(id)a4;
- (CGSize)canvasSizeModularSmall;
- (CGSize)canvasSizeUtilitarianLarge;
- (CGSize)canvasSizeUtilitarianSmall;
- (CGSize)canvasSizeUtilitarianSmallFlat;
- (CKMessagesComplicationSpecs)initWithDevice:(id)a3;
- (UIColor)bubbleTextColor;
- (UIColor)canvasBackgroundColor;
- (double)imageFramePaddingForFamily:(int64_t)a3;
- (double)verticalTextOffsetForFamily:(int64_t)a3;
- (void)configureDeviceDependentSpecsForDevice:(id)a3;
@end

@implementation CKMessagesComplicationSpecs

- (CKMessagesComplicationSpecs)initWithDevice:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKMessagesComplicationSpecs;
  v5 = [(CKMessagesComplicationSpecs *)&v13 init];
  v11 = v5;
  if (v5) {
    objc_msgSend_configureDeviceDependentSpecsForDevice_(v5, v6, v7, v8, v9, v10, v4);
  }

  return v11;
}

- (void)configureDeviceDependentSpecsForDevice:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFD188];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v63 = (id)objc_msgSend_initWithDevice_identitySizeClass_(v6, v7, v8, v9, v10, v11, v5, 2);

  objc_msgSend_scaledSize_withOverride_forSizeClass_(v63, v12, 29.0, 29.0, 26.0, 26.0, 0);
  self->_canvasSizeModularSmall.width = v13;
  self->_canvasSizeModularSmall.height = v14;
  objc_msgSend_scaledSize_(v63, v15, 18.0, 18.0, v16, v17);
  self->_canvasSizeUtilitarianSmall.width = v18;
  self->_canvasSizeUtilitarianSmall.height = v19;
  objc_msgSend_scaledSize_(v63, v20, 12.0, 12.0, v21, v22);
  self->_canvasSizeUtilitarianSmallFlat.width = v23;
  self->_canvasSizeUtilitarianSmallFlat.height = v24;
  objc_msgSend_scaledSize_(v63, v25, 10.0, 10.0, v26, v27);
  self->_canvasSizeUtilitarianLarge.width = v28;
  self->_canvasSizeUtilitarianLarge.height = v29;
  objc_msgSend_scaledSize_withOverride_forSizeClass_(v63, v30, 18.0, 18.0, 16.0, 16.0, 0);
  self->_canvasSizeCircularSmall.width = v31;
  self->_canvasSizeCircularSmall.height = v32;
  objc_msgSend_scaledSize_(v63, v33, 42.0, 42.0, v34, v35);
  self->_canvasSizeCircular.width = v36;
  self->_canvasSizeCircular.height = v37;
  objc_msgSend_scaledSize_(v63, v38, 25.0, 25.0, v39, v40);
  self->_canvasSizeCircularMedium.width = v41;
  self->_canvasSizeCircularMedium.height = v42;
  objc_msgSend_scaledSize_(v63, v43, 120.0, 120.0, v44, v45);
  self->_canvasSizeCircularXL.width = v46;
  self->_canvasSizeCircularXL.height = v47;
  objc_msgSend_scaledSize_(v63, v48, 32.0, 32.0, v49, v50);
  self->_canvasSizeCorner.width = v51;
  self->_canvasSizeCorner.height = v52;
  objc_msgSend_scaledSize_(v63, v53, 20.0, 20.0, v54, v55);
  self->_canvasSizeCornerSmall.width = v56;
  self->_canvasSizeCornerSmall.height = v57;
  objc_msgSend_scaledSize_(v63, v58, 101.5, 101.5, v59, v60);
  self->_canvasSizeExtraLarge.width = v61;
  self->_canvasSizeExtraLarge.height = v62;
}

- (UIColor)canvasBackgroundColor
{
  return (UIColor *)MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_colorWithRed_green_blue_alpha_, 0.0, 0.13, 0.07, 1.0);
}

+ (id)bubbleTintColor
{
  return (id)((uint64_t (*)(void, char *))MEMORY[0x270F9A6D0])(MEMORY[0x263F1C550], sel_systemGreenColor);
}

- (UIColor)bubbleTextColor
{
  return (UIColor *)objc_msgSend_blackColor(MEMORY[0x263F1C550], a2, v2, v3, v4, v5);
}

- (double)verticalTextOffsetForFamily:(int64_t)a3
{
  double v8 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], a2, v3, v4, v5, v6);
  unint64_t v14 = objc_msgSend_deviceCategory(v8, v9, v10, v11, v12, v13);

  double result = 0.0;
  if (v14 <= 1 && *MEMORY[0x263EFCF20] != a3)
  {
    double result = -1.0;
    if ((unint64_t)(a3 - 2) <= 0xA) {
      return dbl_238841730[a3 - 2];
    }
  }
  return result;
}

- (double)imageFramePaddingForFamily:(int64_t)a3
{
  if (*MEMORY[0x263EFCF20] == a3) {
    return 0.1;
  }
  double result = 0.0;
  if ((unint64_t)(a3 - 8) <= 4) {
    return dbl_238841788[a3 - 8];
  }
  return result;
}

- (BOOL)unreadCountShouldBeDrawnOnBubbleForFamily:(int64_t)a3
{
  if (*MEMORY[0x263EFCF20] == a3) {
    return 1;
  }
  if ((unint64_t)a3 <= 0xC) {
    return (0x16D5u >> a3) & 1;
  }
  return 0;
}

- (CGSize)canvasSizeForFamily:(int64_t)a3
{
  objc_msgSend_canvasSizeForFamily_andTemplate_(self, a2, v3, v4, v5, v6, a3, 0);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)canvasSizeForFamily:(int64_t)a3 andTemplate:(id)a4
{
  id v7 = a4;
  if (*MEMORY[0x263EFCF20] == a3)
  {
    objc_msgSend_canvasSizeCircularMedium(self, v6, v8, v9, v10, v11);
LABEL_3:
    double v14 = v12;
    double v15 = v13;
  }
  else
  {
    switch(a3)
    {
      case 0:
        objc_msgSend_canvasSizeModularSmall(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      case 2:
        objc_msgSend_canvasSizeUtilitarianSmall(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      case 3:
        objc_msgSend_canvasSizeUtilitarianLarge(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      case 4:
        objc_msgSend_canvasSizeCircularSmall(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      case 6:
        objc_msgSend_canvasSizeUtilitarianSmallFlat(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      case 7:
        objc_msgSend_canvasSizeExtraLarge(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      case 8:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_canvasSizeCornerSmall(self, v18, v19, v20, v21, v22);
        }
        else {
          objc_msgSend_canvasSizeCorner(self, v18, v19, v20, v21, v22);
        }
        goto LABEL_3;
      case 9:
      case 10:
        objc_msgSend_canvasSizeCircular(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      case 12:
        objc_msgSend_canvasSizeCircularXL(self, v6, v8, v9, v10, v11);
        goto LABEL_3;
      default:
        double v14 = *MEMORY[0x263F001B0];
        double v15 = *(double *)(MEMORY[0x263F001B0] + 8);
        break;
    }
  }

  double v16 = v14;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)needToScaleToFillForFamily:(int64_t)a3
{
  return a3 == 6;
}

- (CGSize)canvasSizeModularSmall
{
  double width = self->_canvasSizeModularSmall.width;
  double height = self->_canvasSizeModularSmall.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeUtilitarianSmall
{
  double width = self->_canvasSizeUtilitarianSmall.width;
  double height = self->_canvasSizeUtilitarianSmall.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeUtilitarianSmallFlat
{
  double width = self->_canvasSizeUtilitarianSmallFlat.width;
  double height = self->_canvasSizeUtilitarianSmallFlat.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeUtilitarianLarge
{
  double width = self->_canvasSizeUtilitarianLarge.width;
  double height = self->_canvasSizeUtilitarianLarge.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeCircular
{
  double width = self->_canvasSizeCircular.width;
  double height = self->_canvasSizeCircular.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeCircularSmall
{
  double width = self->_canvasSizeCircularSmall.width;
  double height = self->_canvasSizeCircularSmall.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeCircularMedium
{
  double width = self->_canvasSizeCircularMedium.width;
  double height = self->_canvasSizeCircularMedium.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeCircularXL
{
  double width = self->_canvasSizeCircularXL.width;
  double height = self->_canvasSizeCircularXL.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeCorner
{
  double width = self->_canvasSizeCorner.width;
  double height = self->_canvasSizeCorner.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeCornerSmall
{
  double width = self->_canvasSizeCornerSmall.width;
  double height = self->_canvasSizeCornerSmall.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)canvasSizeExtraLarge
{
  double width = self->_canvasSizeExtraLarge.width;
  double height = self->_canvasSizeExtraLarge.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end