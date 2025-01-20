@interface NTKFoghornFaceFontLoader
+ (CGSize)_discretizedTypographicSizeForTypographicSize:(CGSize)a3;
+ (id)_foghornFaceFontDescriptorWithTypographicSize:(CGSize)a3 weight:(double)a4 stylisticSet:(unint64_t)a5;
+ (id)_fontVariationAttributesForTypographicSize:(CGSize)a3 weight:(double)a4 stylisticSet:(unint64_t)a5;
- (NTKFoghornFaceFontLoader)initWithFontSize:(double)a3;
- (double)fontSize;
- (id)_cachedFontWithTypographicSize:(CGSize)a3 weight:(double)a4 horizontalScale:(double)a5 stylisticSet:(unint64_t)a6;
- (id)foregroundFontWithTypographicSize:(CGSize)a3 horizontalScale:(double)a4 stylisticSet:(unint64_t)a5;
- (id)foregroundFontWithTypographicSize:(CGSize)a3 stylisticSet:(unint64_t)a4;
- (id)foregroundFontWithTypographicSize:(CGSize)a3 weight:(double)a4 horizontalScale:(double)a5 stylisticSet:(unint64_t)a6;
@end

@implementation NTKFoghornFaceFontLoader

- (NTKFoghornFaceFontLoader)initWithFontSize:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKFoghornFaceFontLoader;
  v4 = [(NTKFoghornFaceFontLoader *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_fontSize = a3;
    uint64_t v6 = objc_opt_new();
    fontCache = v5->_fontCache;
    v5->_fontCache = (NSCache *)v6;
  }
  return v5;
}

- (id)foregroundFontWithTypographicSize:(CGSize)a3 weight:(double)a4 horizontalScale:(double)a5 stylisticSet:(unint64_t)a6
{
  return (id)((uint64_t (*)(NTKFoghornFaceFontLoader *, char *, unint64_t))MEMORY[0x270F9A6D0])(self, sel__cachedFontWithTypographicSize_weight_horizontalScale_stylisticSet_, a6);
}

- (id)foregroundFontWithTypographicSize:(CGSize)a3 horizontalScale:(double)a4 stylisticSet:(unint64_t)a5
{
  return (id)objc_msgSend_foregroundFontWithTypographicSize_weight_horizontalScale_stylisticSet_(self, a2, a5, v5, a3.width, a3.height, 450.0, a4);
}

- (id)foregroundFontWithTypographicSize:(CGSize)a3 stylisticSet:(unint64_t)a4
{
  return (id)((uint64_t (*)(NTKFoghornFaceFontLoader *, char *, unint64_t))MEMORY[0x270F9A6D0])(self, sel_foregroundFontWithTypographicSize_horizontalScale_stylisticSet_, a4);
}

- (id)_cachedFontWithTypographicSize:(CGSize)a3 weight:(double)a4 horizontalScale:(double)a5 stylisticSet:(unint64_t)a6
{
  double height = a3.height;
  double width = a3.width;
  double fontSize = self->_fontSize;
  if (a5 < 1.0)
  {
    double fontSize = floor(fontSize * a5 + fontSize * a5) * 0.5;
    double height = floor((1.0 / a5 + -1.0) * 55.0 / 0.12 + 1.0 / a5 * a3.height);
    double width = floor(a3.width + 0.0);
  }
  v12 = objc_opt_class();
  objc_msgSend__discretizedTypographicSizeForTypographicSize_(v12, v13, v14, v15, width, height);
  double v17 = v16;
  double v18 = v37.height;
  *(float *)&double v16 = a4;
  double v19 = roundf(*(float *)&v16);
  v20 = NSString;
  v37.double width = v17;
  v21 = NSStringFromCGSize(v37);
  v24 = objc_msgSend_stringWithFormat_(v20, v22, @"(%.1f)-(%.1f)-(%@)-(%u)", v23, *(void *)&fontSize, *(void *)&v19, v21, a6);

  v27 = objc_msgSend_objectForKey_(self->_fontCache, v25, (uint64_t)v24, v26);
  if (!v27)
  {
    v28 = objc_opt_class();
    v31 = objc_msgSend__foghornFaceFontDescriptorWithTypographicSize_weight_stylisticSet_(v28, v29, a6, v30, v17, v18, a4);
    v27 = objc_msgSend_fontWithDescriptor_size_(MEMORY[0x263EFD198], v32, (uint64_t)v31, v33, fontSize);
    objc_msgSend_setObject_forKey_(self->_fontCache, v34, (uint64_t)v27, (uint64_t)v24);
  }

  return v27;
}

+ (CGSize)_discretizedTypographicSizeForTypographicSize:(CGSize)a3
{
  float width = a3.width;
  double v4 = roundf(width);
  float height = a3.height;
  double v6 = roundf(height);
  result.float height = v6;
  result.float width = v4;
  return result;
}

+ (id)_foghornFaceFontDescriptorWithTypographicSize:(CGSize)a3 weight:(double)a4 stylisticSet:(unint64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  if (qword_2691D4C78 != -1) {
    dispatch_once(&qword_2691D4C78, &unk_26FB0CA08);
  }
  v11 = objc_msgSend_copy((void *)qword_2691D4C70, a2, a5, v5);
  v12 = objc_opt_new();
  uint64_t v15 = objc_msgSend__fontVariationAttributesForTypographicSize_weight_stylisticSet_(a1, v13, a5, v14, width, height, a4);
  objc_msgSend_setObject_forKey_(v12, v16, (uint64_t)v15, *MEMORY[0x263F03BC0]);
  double v19 = objc_msgSend_fontDescriptorByAddingAttributes_(v11, v17, (uint64_t)v12, v18);

  return v19;
}

+ (id)_fontVariationAttributesForTypographicSize:(CGSize)a3 weight:(double)a4 stylisticSet:(unint64_t)a5
{
  uint64_t width = (unint64_t)a3.width;
  uint64_t height = (unint64_t)a3.height;
  objc_super v9 = objc_opt_new();
  v12 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v10, width, v11);
  v13 = NSNumber;
  uint64_t v14 = TextToFourCharCode();
  double v17 = objc_msgSend_numberWithUnsignedInt_(v13, v15, v14, v16);
  objc_msgSend_setObject_forKey_(v9, v18, (uint64_t)v12, (uint64_t)v17);

  v21 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, height, v20);
  v22 = NSNumber;
  uint64_t v23 = TextToFourCharCode();
  uint64_t v26 = objc_msgSend_numberWithUnsignedInt_(v22, v24, v23, v25);
  objc_msgSend_setObject_forKey_(v9, v27, (uint64_t)v21, (uint64_t)v26);

  v31 = objc_msgSend_numberWithDouble_(NSNumber, v28, v29, v30, a4);
  v32 = NSNumber;
  uint64_t v33 = TextToFourCharCode();
  v36 = objc_msgSend_numberWithUnsignedInt_(v32, v34, v33, v35);
  objc_msgSend_setObject_forKey_(v9, v37, (uint64_t)v31, (uint64_t)v36);

  if (a5)
  {
    v38 = NSNumber;
    uint64_t v39 = TextToFourCharCode();
    v42 = objc_msgSend_numberWithUnsignedInt_(v38, v40, v39, v41);
    objc_msgSend_setObject_forKey_(v9, v43, MEMORY[0x263EFFA88], (uint64_t)v42);
  }

  return v9;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void).cxx_destruct
{
}

@end