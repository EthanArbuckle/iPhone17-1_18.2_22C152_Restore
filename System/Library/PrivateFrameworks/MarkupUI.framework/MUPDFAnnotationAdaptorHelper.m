@interface MUPDFAnnotationAdaptorHelper
+ (BOOL)_shouldUseAKAnnotation:(id)a3 toRepresentCGPDFAnnotation:(CGPDFAnnotation *)a4;
+ (double)_pointSizeFromAppearanceTokens:(id)a3;
+ (id)_colorFromAppearanceTokens:(id)a3;
+ (id)_colorFromPDFArray:(CGPDFArray *)a3;
+ (id)_fontNameFromAppearanceTokens:(id)a3;
+ (id)_getColorFromAppearanceString:(CGPDFString *)a3;
+ (id)_getFontFromAppearanceString:(CGPDFString *)a3 ofPDFPage:(CGPDFPage *)a4;
+ (id)_tokenizeAppearanceString:(id)a3;
+ (id)getFullFieldNameFromAnnotationDictionary:(CGPDFDictionary *)a3;
+ (id)getRGBColorForKey:(const char *)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4;
+ (id)getTextStringForKey:(const char *)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4;
+ (id)newAKAnnotationFromCGPDFAnnotation:(CGPDFAnnotation *)a3;
+ (void)addAKAnnotation:(id)a3 toAnnotationDictionary:(__CFDictionary *)a4;
+ (void)addAppearanceStreamOfAnnotation:(id)a3 forPage:(CGPDFPage *)a4 toDictionary:(id)a5;
+ (void)addBorderStyleOfAnnotation:(id)a3 toDictionary:(id)a4;
+ (void)addBoundsOfAnnotation:(id)a3 forPage:(CGPDFPage *)a4 toDictionary:(id)a5;
+ (void)addContentsStringOfAnnotation:(id)a3 toDictionary:(id)a4;
+ (void)addDefaultAppearanceStreamOfAnnotation:(id)a3 toDictionary:(id)a4;
+ (void)addFlagsOfAnnotation:(id)a3 toDictionary:(id)a4;
+ (void)addModificationDateOfAnnotation:(id)a3 toDictionary:(id)a4;
+ (void)addQuaddingOfAnnotation:(id)a3 toDictionary:(id)a4;
+ (void)addRGBColor:(id)a3 forKey:(id)a4 toDictionary:(id)a5;
+ (void)addString:(id)a3 toDictionary:(id)a4 forKey:(id)a5;
+ (void)addTextOfAnnotation:(id)a3 toDictionary:(id)a4 forKey:(id)a5 canUsePlaceholder:(BOOL)a6;
+ (void)migrateAKFilledAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5;
+ (void)migrateAKRectangularShapeAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5;
+ (void)migrateAKStrokedAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5;
+ (void)migrateAKTextAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5;
+ (void)migrateAppearanceStreamFromCGPDFAnnotationDict:(CGPDFDictionary *)a3 toAKAnnotation:(id)a4 compensatingForPageRotation:(unint64_t)a5;
+ (void)readDefaultAppearanceStringFromPDFDictionary:(CGPDFDictionary *)a3 ofPage:(CGPDFPage *)a4 toDictionary:(id)a5;
+ (void)readQuaddingFromPDFDictionary:(CGPDFDictionary *)a3 toDictionary:(id)a4;
@end

@implementation MUPDFAnnotationAdaptorHelper

+ (void)migrateAppearanceStreamFromCGPDFAnnotationDict:(CGPDFDictionary *)a3 toAKAnnotation:(id)a4 compensatingForPageRotation:(unint64_t)a5
{
  id v6 = a4;
  uint64_t v7 = _MUReadAppearanceStreams_cachedValue;
  if (_MUReadAppearanceStreams_cachedValue == -2)
  {
    v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v9 = [v8 objectForKey:@"MUReadAppearanceStreams"];

    if (v9)
    {
      v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
      _MUReadAppearanceStreams_cachedValue = [v10 BOOLForKey:@"MUReadAppearanceStreams"];

      if (_MUReadAppearanceStreams_cachedValue) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      NSLog(&stru_26E181F88.isa, @"MUReadAppearanceStreams", v11);
    }
    else
    {
      _MUReadAppearanceStreams_cachedValue = 1;
    }

    uint64_t v7 = _MUReadAppearanceStreams_cachedValue;
  }
  if (v7)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        v36.a = 0.0;
        value.a = 0.0;
        CGPDFDictionaryGetDictionary(a3, "AP", (CGPDFDictionaryRef *)&value);
        if (*(void *)&value.a)
        {
          CGPDFDictionaryGetObject(*(CGPDFDictionaryRef *)&value.a, "N", (CGPDFObjectRef *)&v36);
          if (*(void *)&v36.a)
          {
            t2.a = 0.0;
            CGPDFObjectGetValue(*(CGPDFObjectRef *)&v36.a, kCGPDFObjectTypeStream, &t2);
            if (*(void *)&t2.a
              || (CGPDFDictionaryRef v38 = 0, CGPDFObjectGetValue(*(CGPDFObjectRef *)&v36.a, kCGPDFObjectTypeDictionary, &v38), v38)
              && (*(_OWORD *)&info.a = (unint64_t)v38,
                  CGPDFDictionaryApplyFunction(v38, (CGPDFDictionaryApplierFunction)_getStreams, &info),
                  *(void *)&info.b))
            {
              uint64_t v13 = CGPDFFormCreate();
              if (v13)
              {
                memset(&info, 0, sizeof(info));
                CGPDFFormGetMatrix();
                CGPDFFormGetBBox();
                CGAffineTransform v36 = info;
                CGRect v40 = CGRectApplyAffineTransform(v39, &v36);
                CGFloat x = v40.origin.x;
                CGFloat y = v40.origin.y;
                CGFloat width = v40.size.width;
                CGFloat height = v40.size.height;
                double MidX = CGRectGetMidX(v40);
                v41.origin.CGFloat x = x;
                v41.origin.CGFloat y = y;
                v41.size.CGFloat width = width;
                v41.size.CGFloat height = height;
                double MidY = CGRectGetMidY(v41);
                v42.origin.CGFloat x = x;
                v42.origin.CGFloat y = y;
                v42.size.CGFloat width = width;
                v42.size.CGFloat height = height;
                if (CGRectGetWidth(v42) <= 0.0
                  || (v43.origin.CGFloat x = x,
                      v43.origin.CGFloat y = y,
                      v43.size.CGFloat width = width,
                      v43.size.CGFloat height = height,
                      CGRectGetHeight(v43) <= 0.0))
                {
                  [v6 setAppearanceOverride:&__block_literal_global_1];
                }
                else
                {
                  [v6 drawingBounds];
                  CGFloat v20 = v44.origin.x;
                  CGFloat v21 = v44.origin.y;
                  CGFloat v22 = v44.size.width;
                  CGFloat v23 = v44.size.height;
                  CGFloat v24 = CGRectGetMidX(v44);
                  v45.origin.CGFloat x = v20;
                  v45.origin.CGFloat y = v21;
                  v45.size.CGFloat width = v22;
                  v45.size.CGFloat height = v23;
                  CGFloat v25 = CGRectGetMidY(v45);
                  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
                  *(_OWORD *)&v36.a = *MEMORY[0x263F000D0];
                  *(_OWORD *)&v36.c = v26;
                  *(_OWORD *)&v36.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
                  *(_OWORD *)&value.c = v26;
                  *(_OWORD *)&value.tCGFloat x = *(_OWORD *)&v36.tx;
                  CGAffineTransform t2 = info;
                  *(_OWORD *)&value.a = *(_OWORD *)&v36.a;
                  CGAffineTransformConcat(&v36, &value, &t2);
                  CGAffineTransformMakeTranslation(&v33, -MidX, -MidY);
                  CGAffineTransform t2 = v36;
                  CGAffineTransformConcat(&value, &t2, &v33);
                  CGAffineTransform v36 = value;
                  CGAffineTransformMakeTranslation(&v32, v24, v25);
                  CGAffineTransform t2 = v36;
                  CGAffineTransformConcat(&value, &t2, &v32);
                  CGAffineTransform v36 = value;
                  v27 = [[MUCGPDFFormWrapper alloc] initWithForm:v13];
                  v29[0] = MEMORY[0x263EF8330];
                  v29[1] = 3221225472;
                  CGAffineTransform v31 = v36;
                  v29[2] = __122__MUPDFAnnotationAdaptorHelper_migrateAppearanceStreamFromCGPDFAnnotationDict_toAKAnnotation_compensatingForPageRotation___block_invoke_2;
                  v29[3] = &unk_2649C2E28;
                  v30 = v27;
                  v28 = v27;
                  [v6 setAppearanceOverride:v29];
                }
              }
            }
          }
        }
      }
    }
  }
}

void __122__MUPDFAnnotationAdaptorHelper_migrateAppearanceStreamFromCGPDFAnnotationDict_toAKAnnotation_compensatingForPageRotation___block_invoke_2(uint64_t a1, CGContextRef c)
{
  CGContextSaveGState(c);
  long long v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tCGFloat x = *(_OWORD *)(a1 + 72);
  CGContextConcatCTM(c, &v5);
  [*(id *)(a1 + 32) pdfForm];
  CGPDFFormGetStream();
  CGPDFFormGetResources();
  if (CGPDFDrawingContextCreateWithStream())
  {
    CGPDFDrawingContextDraw();
    CGPDFDrawingContextRelease();
  }
  CGContextRestoreGState(c);
}

+ (void)migrateAKStrokedAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v7 = a3;
  CGPDFDictionaryRef value = 0;
  if (CGPDFDictionaryGetDictionary(a4, "BS", &value))
  {
    __s1 = 0;
    CGPDFReal v10 = 0.0;
    if (CGPDFDictionaryGetNumber(value, "W", &v10)) {
      [v7 setStrokeWidth:v10];
    }
    if (CGPDFDictionaryGetName(value, "S", (const char **)&__s1)) {
      objc_msgSend(v7, "setDashed:", strcmp(__s1, "D") == 0);
    }
  }
  CGPDFReal v10 = 0.0;
  if (CGPDFDictionaryGetArray(a4, "C", (CGPDFArrayRef *)&v10))
  {
    v8 = [a1 _colorFromPDFArray:*(void *)&v10];
    [v7 setStrokeColor:v8];
  }
}

+ (void)migrateAKFilledAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v7 = a3;
  CGPDFArrayRef value = 0;
  if (CGPDFDictionaryGetArray(a4, "IC", &value))
  {
    v8 = [a1 _colorFromPDFArray:value];
    [v7 setFillColor:v8];
  }
}

+ (void)migrateAKRectangularShapeAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v5 = a3;
  if (CGPDFDictionaryGetRect()) {
    objc_msgSend(v5, "setRectangle:", 0.0, 0.0, 0.0, 0.0);
  }
}

+ (void)migrateAKTextAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v8 = a3;
  CGPDFArrayRef value = 0;
  if (CGPDFDictionaryGetName(a4, "Subtype", (const char **)&value))
  {
    id v9 = v8;
    if (!strcmp(value, "Widget"))
    {
      CGPDFStringRef string = 0;
      CGPDFDictionaryRef dict = 0;
      if (!CGPDFDictionaryGetDictionary(a4, "Parent", &dict)) {
        CGPDFDictionaryRef dict = 0;
      }
      if (CGPDFDictionaryGetString(a4, "V", &string) || dict && CGPDFDictionaryGetString(dict, "V", &string)) {
        CGPDFReal v10 = (void *)CGPDFStringCopyTextString(string);
      }
      else {
        CGPDFReal v10 = 0;
      }
      if (CGPDFDictionaryGetString(a4, "DV", &string) || dict && CGPDFDictionaryGetString(dict, "DV", &string))
      {
        v11 = (void *)CGPDFStringCopyTextString(string);
        if (v11) {
          [v9 setCustomPlaceholderText:v11];
        }
      }
      else
      {
        v11 = 0;
      }
      uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
      [a1 readDefaultAppearanceStringFromPDFDictionary:a4 ofPage:a5 toDictionary:v13];
      [a1 readQuaddingFromPDFDictionary:a4 toDictionary:v13];
      if ([v10 length])
      {
        v14 = (void *)[MEMORY[0x263F24C58] newTextStorageOriginalFontSavvyWithString:v10 attributes:v13];
        [v9 setAnnotationText:v14];
      }
      else if (![v11 length])
      {
        [v9 setShouldUsePlaceholderText:0];
      }
      [v9 setTypingAttributes:v13];
    }
    else
    {
      CGPDFReal v10 = [a1 getTextStringForKey:"Contents" fromAnnotationDictionary:a4];
      if (![v10 length])
      {
        [v9 setShouldUsePlaceholderText:0];
LABEL_28:

        goto LABEL_29;
      }
      v11 = [MEMORY[0x263EFF9A0] dictionary];
      if (!strcmp(value, "FreeText"))
      {
        [a1 readDefaultAppearanceStringFromPDFDictionary:a4 ofPage:a5 toDictionary:v11];
        [a1 readQuaddingFromPDFDictionary:a4 toDictionary:v11];
      }
      v12 = (void *)[MEMORY[0x263F24C58] newTextStorageOriginalFontSavvyWithString:v10 attributes:v11];
      [v9 setAnnotationText:v12];
    }
    goto LABEL_28;
  }
  NSLog(&cfstr_SFailedToFindS.isa, "+[MUPDFAnnotationAdaptorHelper migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:]");
LABEL_29:
}

+ (id)getRGBColorForKey:(const char *)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4
{
  CGPDFArrayRef value = 0;
  ArraCGFloat y = CGPDFDictionaryGetArray(a4, a3, &value);
  id v6 = 0;
  if (Array)
  {
    id v6 = [a1 _colorFromPDFArray:value];
  }
  return v6;
}

+ (id)getTextStringForKey:(const char *)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4
{
  CGPDFStringRef value = 0;
  BOOL String = CGPDFDictionaryGetString(a4, a3, &value);
  id v5 = 0;
  if (String)
  {
    id v5 = (__CFString *)CGPDFStringCopyTextString(value);
    if (!v5) {
      id v5 = 0;
    }
  }
  return v5;
}

+ (id)getFullFieldNameFromAnnotationDictionary:(CGPDFDictionary *)a3
{
  CGPDFDictionaryRef dict = 0;
  CGPDFStringRef value = 0;
  MutableCopCGFloat y = 0;
  if (CGPDFDictionaryGetString(a3, "T", &value))
  {
    CFStringRef v5 = CGPDFStringCopyTextString(value);
    if (v5)
    {
      CFStringRef v6 = v5;
      MutableCopCGFloat y = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v5);
      CFRelease(v6);
    }
    else
    {
      MutableCopCGFloat y = 0;
    }
  }
  if (!CGPDFDictionaryGetDictionary(a3, "Parent", &dict)) {
    goto LABEL_23;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v8 = dict;
  uint64_t v9 = 1;
  while (1)
  {
    unint64_t v10 = v9;
    if (!CGPDFDictionaryGetString(v8, "T", &value))
    {
      CGPDFDictionaryRef dict = 0;
      goto LABEL_23;
    }
    if (MutableCopy)
    {
      CFStringInsert(MutableCopy, 0, @".");
      CFStringRef v11 = CGPDFStringCopyTextString(value);
      if (!v11) {
        goto LABEL_14;
      }
      CFStringRef v12 = v11;
      CFStringInsert(MutableCopy, 0, v11);
      goto LABEL_13;
    }
    CFStringRef v13 = CGPDFStringCopyTextString(value);
    if (v13)
    {
      CFStringRef v12 = v13;
      MutableCopCGFloat y = CFStringCreateMutableCopy(v7, 0, v13);
LABEL_13:
      CFRelease(v12);
      goto LABEL_14;
    }
    MutableCopCGFloat y = 0;
LABEL_14:
    if (!CGPDFDictionaryGetDictionary(v8, "Parent", &dict)) {
      break;
    }
    id v8 = dict;
    if (dict)
    {
      uint64_t v9 = v10 + 1;
      if (v10 < 0x63) {
        continue;
      }
    }
    goto LABEL_21;
  }
  CGPDFDictionaryRef dict = 0;
LABEL_21:
  if (v10 >= 0x63) {
    NSLog(&cfstr_Getfullfieldna.isa);
  }
LABEL_23:
  if (MutableCopy)
  {
    v14 = [MEMORY[0x263F089D8] stringWithString:MutableCopy];
    CFRelease(MutableCopy);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (void)readDefaultAppearanceStringFromPDFDictionary:(CGPDFDictionary *)a3 ofPage:(CGPDFPage *)a4 toDictionary:(id)a5
{
  id v8 = a5;
  CGPDFStringRef value = 0;
  if (CGPDFDictionaryGetString(a3, "DA", &value))
  {
    uint64_t v9 = [a1 _getFontFromAppearanceString:value ofPDFPage:a4];
    if (v9) {
      [v8 setObject:v9 forKey:*MEMORY[0x263F1C238]];
    }
    unint64_t v10 = [a1 _getColorFromAppearanceString:value];
    if (v10) {
      [v8 setObject:v10 forKey:*MEMORY[0x263F1C240]];
    }
  }
}

+ (void)readQuaddingFromPDFDictionary:(CGPDFDictionary *)a3 toDictionary:(id)a4
{
  uint64_t v5 = *MEMORY[0x263F1C268];
  id v6 = a4;
  CFAllocatorRef v7 = [v6 objectForKey:v5];
  if (!v7)
  {
    CFAllocatorRef v7 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  }
  id v8 = (void *)[v7 mutableCopy];
  CGPDFInteger value = 0;
  BOOL Integer = CGPDFDictionaryGetInteger(a3, "Q", &value);
  uint64_t v10 = 0;
  if (Integer)
  {
    if (value == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (value == 2);
    }
  }
  [v8 setAlignment:v10];
  [v6 setObject:v8 forKey:v5];
}

+ (void)addBoundsOfAnnotation:(id)a3 forPage:(CGPDFPage *)a4 toDictionary:(id)a5
{
  v22[4] = *MEMORY[0x263EF8340];
  id v7 = a5;
  [a3 drawingBounds];
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  BOOL IsInfinite = CGRectIsInfinite(v23);
  if (a4 && IsInfinite)
  {
    CGRect BoxRect = CGPDFPageGetBoxRect(a4, kCGPDFMediaBox);
    CGFloat x = BoxRect.origin.x;
    CGFloat y = BoxRect.origin.y;
    CGFloat width = BoxRect.size.width;
    CGFloat height = BoxRect.size.height;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v28);
  v17 = [NSNumber numberWithDouble:MinX];
  v22[0] = v17;
  v18 = [NSNumber numberWithDouble:MinY];
  v22[1] = v18;
  v19 = [NSNumber numberWithDouble:MaxX];
  v22[2] = v19;
  CGFloat v20 = [NSNumber numberWithDouble:MaxY];
  v22[3] = v20;
  CGFloat v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];

  [v7 setObject:v21 forKey:@"/Rect"];
}

+ (void)addModificationDateOfAnnotation:(id)a3 toDictionary:(id)a4
{
  long long v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a4;
  id v6 = [v4 date];
  id v7 = +[MUPDFUtilities createPDFDateString:v6];

  [v5 setObject:v7 forKey:@"/M"];
}

+ (void)addFlagsOfAnnotation:(id)a3 toDictionary:(id)a4
{
  long long v4 = NSNumber;
  id v5 = a4;
  id v6 = [v4 numberWithUnsignedInteger:4];
  [v5 setValue:v6 forKey:@"/F"];
}

+ (void)addContentsStringOfAnnotation:(id)a3 toDictionary:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [MEMORY[0x263F24C58] actualOrPlaceholderTextOfAnnotation:v11];
    id v8 = [v7 string];
  }
  else
  {
    id v8 = &stru_26E1811C8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v11 childAnnotation];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 contents];

        id v8 = (__CFString *)v10;
      }
    }
  }
  [a1 addString:v8 toDictionary:v6 forKey:@"/Contents"];
}

+ (void)addTextOfAnnotation:(id)a3 toDictionary:(id)a4 forKey:(id)a5 canUsePlaceholder:(BOOL)a6
{
  if (a6)
  {
    uint64_t v10 = (void *)MEMORY[0x263F24C58];
    id v11 = a5;
    id v12 = a4;
    [v10 actualOrPlaceholderTextOfAnnotation:a3];
  }
  else
  {
    id v13 = a5;
    id v14 = a4;
    [a3 annotationText];
  v15 = };
  id v16 = [v15 string];

  [a1 addString:v16 toDictionary:a4 forKey:a5];
}

+ (void)addString:(id)a3 toDictionary:(id)a4 forKey:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v10 length])
  {
    uint64_t v9 = (__CFString *)[v10 mutableCopy];
    [(__CFString *)v9 replaceOccurrencesOfString:@"/", @"//", 2, 0, 1 withString options range];
  }
  else
  {
    uint64_t v9 = &stru_26E1811C8;
  }
  [v7 setValue:v9 forKey:v8];
}

+ (void)addBorderStyleOfAnnotation:(id)a3 toDictionary:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 conformsToAKStrokedAnnotationProtocol])
  {
    id v7 = v5;
    [v7 strokeWidth];
    double v9 = v8;
    if (v8 != 1.0 || [v7 isDashed])
    {
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
      [v7 strokeWidth];
      if (v11 != 1.0)
      {
        id v12 = [NSNumber numberWithDouble:v9];
        [v10 setObject:v12 forKey:@"/W"];
      }
      if ([v7 isDashed])
      {
        [v10 setValue:@"/D" forKey:@"/S"];
        id v13 = [NSNumber numberWithDouble:v9 + 7.0];
        v16[0] = v13;
        id v14 = [NSNumber numberWithDouble:v9 * 3.0 + 4.0];
        v16[1] = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
        [v10 setValue:v15 forKey:@"/D"];
      }
      [v6 setValue:v10 forKey:@"/BS"];
    }
  }
}

+ (void)addRGBColor:(id)a3 forKey:(id)a4 toDictionary:(id)a5
{
  v18[3] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  double v16 = 0.0;
  double v17 = 0.0;
  double v14 = 1.0;
  double v15 = 0.0;
  double v9 = [a3 colorUsingSRGBColorSpace];
  [v9 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
  if (v14 >= 0.5)
  {
    id v10 = [NSNumber numberWithDouble:v17];
    v18[0] = v10;
    double v11 = [NSNumber numberWithDouble:v16];
    v18[1] = v11;
    id v12 = [NSNumber numberWithDouble:v15];
    v18[2] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
    [v8 setValue:v13 forKey:v7];
  }
}

+ (void)addAppearanceStreamOfAnnotation:(id)a3 forPage:(CGPDFPage *)a4 toDictionary:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = _MUWriteAppearanceStreams_cachedValue;
  if (_MUWriteAppearanceStreams_cachedValue == -2)
  {
    id v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v11 = [v10 objectForKey:@"MUWriteAppearanceStreams"];

    if (v11)
    {
      id v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
      _MUWriteAppearanceStreams_cachedValue = [v12 BOOLForKey:@"MUWriteAppearanceStreams"];

      if (_MUWriteAppearanceStreams_cachedValue) {
        id v13 = @"YES";
      }
      else {
        id v13 = @"NO";
      }
      NSLog(&stru_26E181F88.isa, @"MUWriteAppearanceStreams", v13);
    }
    else
    {
      _MUWriteAppearanceStreams_cachedValue = 1;
    }

    uint64_t v9 = _MUWriteAppearanceStreams_cachedValue;
  }
  if (v9)
  {
    uint64_t v14 = CGDisplayListCreate();
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = CGDisplayListContextCreate();
      if (v16)
      {
        double v17 = (CGContext *)v16;
        [v7 drawingBounds];
        BOOL IsInfinite = CGRectIsInfinite(v22);
        if (a4 && IsInfinite) {
          CGPDFPageGetBoxRect(a4, kCGPDFMediaBox);
        }
        CGDisplayListSetBoundingBox();
        [MEMORY[0x263F24BB8] renderAnnotation:v7 inContext:v17];
        CGFloat v20 = @"/N";
        v21[0] = v15;
        v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
        [v8 setValue:v19 forKey:@"/AP"];

        CGContextRelease(v17);
      }
      CGDisplayListRelease();
    }
  }
}

+ (void)addDefaultAppearanceStreamOfAnnotation:(id)a3 toDictionary:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = 0;
  CGRect v26 = &v25;
  uint64_t v27 = 0x3032000000;
  CGRect v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  uint64_t v19 = 0;
  CGFloat v20 = &v19;
  uint64_t v21 = 0x3032000000;
  CGRect v22 = __Block_byref_object_copy__1;
  CGRect v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  long long v31 = xmmword_22D938A08;
  *(_OWORD *)CGAffineTransform v32 = unk_22D938A18;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    id v8 = 0;
    id v10 = 0;
    double v11 = 0;
    if (!v26[5]) {
      goto LABEL_25;
    }
    goto LABEL_8;
  }
  id v7 = [MEMORY[0x263F24C58] actualOrPlaceholderTextOfAnnotation:v5];
  if (![v7 length])
  {

    goto LABEL_7;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __84__MUPDFAnnotationAdaptorHelper_addDefaultAppearanceStreamOfAnnotation_toDictionary___block_invoke;
  v18[3] = &unk_2649C2E50;
  void v18[4] = &v25;
  v18[5] = &v19;
  [MEMORY[0x263F24C58] enumerateFontAttributesOfAttributedString:v7 usingBlock:v18];
  id v8 = [v7 attribute:*MEMORY[0x263F1C240] atIndex:0 effectiveRange:0];

  if (!v26[5])
  {
    id v10 = 0;
    double v11 = 0;
    goto LABEL_25;
  }
  if (v8)
  {
    uint64_t v9 = [v8 colorUsingSRGBColorSpace];

    [v9 getRed:&v31 green:(char *)&v31 + 8 blue:v32 alpha:&v32[1]];
    id v8 = v9;
  }
LABEL_8:
  double v12 = *(double *)&v31 * 1000.0;
  double v13 = round(*(double *)&v31 * 1000.0);
  if (*(double *)&v31 == *((double *)&v31 + 1) && *(double *)&v31 == v32[0])
  {
    if (v13 == v12)
    {
      if (round(*(double *)&v31 * 100.0) == *(double *)&v31 * 100.0)
      {
        double v14 = round(*(double *)&v31);
        if (round(*(double *)&v31 * 10.0) == *(double *)&v31 * 10.0) {
          uint64_t v15 = @"%.0f g";
        }
        else {
          uint64_t v15 = @"%.1f g";
        }
      }
      else
      {
        double v14 = round(*(double *)&v31);
        uint64_t v15 = @"%.2f g";
      }
    }
    else
    {
      double v14 = round(*(double *)&v31);
      uint64_t v15 = @"%.3f g";
    }
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", v15, *(void *)&v14);
  }
  else
  {
    if (v13 == v12
      && round(*((double *)&v31 + 1) * 1000.0) == *((double *)&v31 + 1) * 1000.0
      && round(v32[0] * 1000.0) == v32[0] * 1000.0)
    {
      if (round(*(double *)&v31 * 100.0) == *(double *)&v31 * 100.0
        && round(*((double *)&v31 + 1) * 100.0) == *((double *)&v31 + 1) * 100.0
        && round(v32[0] * 100.0) == v32[0] * 100.0)
      {
        if (round(*(double *)&v31 * 10.0) == *(double *)&v31 * 10.0
          && round(*((double *)&v31 + 1) * 10.0) == *((double *)&v31 + 1) * 10.0
          && round(v32[0] * 10.0) == v32[0] * 10.0)
        {
          uint64_t v16 = @"%.0f %.0f %.0f rg";
        }
        else
        {
          uint64_t v16 = @"%.1f %.1f %.1f rg";
        }
      }
      else
      {
        uint64_t v16 = @"%.2f %.2f %.2f rg";
      }
    }
    else
    {
      uint64_t v16 = @"%.3f %.3f %.3f rg";
    }
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", v16, v31, *(void *)&v32[0]);
  }
  id v10 = (void *)v17;
  double v11 = [NSString stringWithFormat:@"//%@ %@ Tf %@", v26[5], v20[5], v17];
  [v6 setValue:v11 forKey:@"/DA"];
LABEL_25:

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
}

void __84__MUPDFAnnotationAdaptorHelper_addDefaultAppearanceStreamOfAnnotation_toDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if (v7)
  {
    id v16 = v7;
    uint64_t v8 = [v7 fontName];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    double v11 = NSString;
    [v16 pointSize];
    uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", @"%.0f", round(v12));
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v7 = v16;
    if (a5) {
      *a5 = 1;
    }
  }
}

+ (void)addQuaddingOfAnnotation:(id)a3 toDictionary:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if ([v11 conformsToAKTextAnnotationProtocol])
  {
    id v6 = [MEMORY[0x263F24C58] actualOrPlaceholderTextOfAnnotation:v11];
    if ([v6 length])
    {
      id v7 = [v6 attribute:*MEMORY[0x263F1C268] atIndex:0 effectiveRange:0];
      uint64_t v8 = [v7 alignment];
      if (v8)
      {
        if (v8 == 1) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = 2 * (v8 == 2);
        }
        id v10 = [NSNumber numberWithInt:v9];
        [v5 setValue:v10 forKey:@"/Q"];
      }
    }
  }
}

+ (id)newAKAnnotationFromCGPDFAnnotation:(CGPDFAnnotation *)a3
{
  uint64_t v5 = _MUReadEmbeddedAKAnnotation_cachedValue;
  if (_MUReadEmbeddedAKAnnotation_cachedValue == -2)
  {
    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v7 = [v6 objectForKey:@"MUReadEmbeddedAKAnnotation"];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
      _MUReadEmbeddedAKAnnotation_cachedValue = [v8 BOOLForKey:@"MUReadEmbeddedAKAnnotation"];

      if (_MUReadEmbeddedAKAnnotation_cachedValue) {
        uint64_t v9 = @"YES";
      }
      else {
        uint64_t v9 = @"NO";
      }
      NSLog(&stru_26E181F88.isa, @"MUReadEmbeddedAKAnnotation", v9);
    }
    else
    {
      _MUReadEmbeddedAKAnnotation_cachedValue = 1;
    }

    uint64_t v5 = _MUReadEmbeddedAKAnnotation_cachedValue;
  }
  if (v5)
  {
    CGPDFDictionarCGFloat y = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    if (CGPDFDictionary)
    {
      id v11 = (void *)MEMORY[0x230F8EA40]();
      CGPDFDictionaryRef value = 0;
      if (CGPDFDictionaryGetDictionary(CGPDFDictionary, "AAPL:AKExtras", &value)
        && (CGPDFStringRef string = 0, CGPDFDictionaryGetString(value, "AAPL:AKAnnotationObject", &string))
        && (CFStringRef v12 = CGPDFStringCopyTextString(string)) != 0)
      {
        CFStringRef v13 = v12;
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
        CGPDFDictionarCGFloat y = [MEMORY[0x263F24B98] annotationWithData:v14];
        CFRelease(v13);

        if (CGPDFDictionary
          && ([a1 _shouldUseAKAnnotation:CGPDFDictionary toRepresentCGPDFAnnotation:a3] & 1) == 0)
        {
          goto LABEL_16;
        }
      }
      else
      {
        CGPDFDictionarCGFloat y = 0;
      }
      CGPDFDictionarCGFloat y = CGPDFDictionary;
      uint64_t v15 = CGPDFDictionary;
      goto LABEL_20;
    }
LABEL_16:
    uint64_t v15 = 0;
LABEL_20:

    return v15;
  }
  return 0;
}

+ (void)addAKAnnotation:(id)a3 toAnnotationDictionary:(__CFDictionary *)a4
{
  id v17 = a3;
  uint64_t v5 = _MUWriteEmbeddedAKAnnotation_cachedValue;
  if (_MUWriteEmbeddedAKAnnotation_cachedValue == -2)
  {
    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v7 = [v6 objectForKey:@"MUWriteEmbeddedAKAnnotation"];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
      _MUWriteEmbeddedAKAnnotation_cachedValue = [v8 BOOLForKey:@"MUWriteEmbeddedAKAnnotation"];

      if (_MUWriteEmbeddedAKAnnotation_cachedValue) {
        uint64_t v9 = @"YES";
      }
      else {
        uint64_t v9 = @"NO";
      }
      NSLog(&stru_26E181F88.isa, @"MUWriteEmbeddedAKAnnotation", v9);
    }
    else
    {
      _MUWriteEmbeddedAKAnnotation_cachedValue = 0;
    }

    uint64_t v5 = _MUWriteEmbeddedAKAnnotation_cachedValue;
  }
  if (v5)
  {
    id v10 = (void *)MEMORY[0x230F8EA40]();
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
    CFStringRef v12 = [v17 dataRepresentation];
    CFStringRef v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 base64EncodedStringWithOptions:0];
      [v11 setObject:v14 forKey:@"/AAPL:AKAnnotationObject"];
      CopCGFloat y = CFDictionaryCreateCopy(0, a4);
      if (Copy)
      {
        CFDictionaryRef v16 = Copy;
        [v11 setObject:Copy forKey:@"/AAPL:AKPDFAnnotationDictionary"];
      }
      CFDictionarySetValue(a4, @"/AAPL:AKExtras", v11);
    }
  }
}

+ (id)_colorFromPDFArray:(CGPDFArray *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v12 = xmmword_22D938A28;
  *(_OWORD *)CFStringRef v13 = unk_22D938A38;
  size_t Count = CGPDFArrayGetCount(a3);
  switch(Count)
  {
    case 4uLL:
      uint64_t v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00240]);
      CGPDFArrayGetNumber(a3, 0, (CGPDFReal *)&v12);
      CGPDFArrayGetNumber(a3, 1uLL, (CGPDFReal *)&v12 + 1);
      CGPDFArrayGetNumber(a3, 2uLL, v13);
      id v6 = &v13[1];
      id v7 = a3;
      size_t v8 = 3;
      break;
    case 3uLL:
      uint64_t v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
      CGPDFArrayGetNumber(a3, 0, (CGPDFReal *)&v12);
      CGPDFArrayGetNumber(a3, 1uLL, (CGPDFReal *)&v12 + 1);
      id v6 = v13;
      id v7 = a3;
      size_t v8 = 2;
      break;
    case 1uLL:
      uint64_t v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00250]);
      id v6 = (CGPDFReal *)&v12;
      id v7 = a3;
      size_t v8 = 0;
      break;
    default:
      goto LABEL_9;
  }
  CGPDFArrayGetNumber(v7, v8, v6);
  CGColorRef v9 = CGColorCreate(v5, (const CGFloat *)&v12);
  CGColorSpaceRelease(v5);
  if (v9)
  {
    id v10 = objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:", v9, v12, *(_OWORD *)v13);
    CFRelease(v9);
    goto LABEL_10;
  }
LABEL_9:
  id v10 = 0;
LABEL_10:
  return v10;
}

+ (id)_getFontFromAppearanceString:(CGPDFString *)a3 ofPDFPage:(CGPDFPage *)a4
{
  id v6 = (__CFString *)CGPDFStringCopyTextString(a3);
  if (!v6)
  {
    id v10 = 0;
    id v7 = 0;
    uint64_t v21 = (void *)MEMORY[0x263F1C658];
LABEL_35:
    double v9 = 12.0;
    goto LABEL_36;
  }
  id v7 = [a1 _tokenizeAppearanceString:v6];
  [a1 _pointSizeFromAppearanceTokens:v7];
  double v9 = v8;
  id v10 = [a1 _fontNameFromAppearanceTokens:v7];
  if (!v10) {
    goto LABEL_34;
  }
  CGPDFDictionaryRef value = 0;
  CGPDFObjectRef v29 = 0;
  CGPDFDictionaryRef dict = 0;
  Document = CGPDFPageGetDocument(a4);
  Catalog = CGPDFDocumentGetCatalog(Document);
  if (!Catalog
    || !CGPDFDictionaryGetDictionary(Catalog, "AcroForm", &value)
    || !CGPDFDictionaryGetDictionary(value, "DR", &dict))
  {
    goto LABEL_21;
  }
  CGPDFDictionaryRef v26 = 0;
  CFStringRef v13 = 0;
  if (!CGPDFDictionaryGetDictionary(dict, "Font", &v26)) {
    goto LABEL_22;
  }
  if (CGPDFDictionaryGetObject(v26, (const char *)[v10 cStringUsingEncoding:1], &v29)&& CGPDFFontCreateWithObject())
  {
    Font = (CGFont *)CGPDFFontGetFont();
    CFStringRef v15 = CGFontCopyPostScriptName(Font);
    if (v15)
    {
      CFStringRef v16 = v15;
      CFStringRef v13 = [MEMORY[0x263F1C658] fontWithName:v15 size:v9];
      if (!v13)
      {
        CGPDFFontGetFontDescriptor();
        char Flags = CGPDFFontDescriptorGetFlags();
        v18 = @"Courier";
        if ((Flags & 1) == 0) {
          v18 = @"Times";
        }
        uint64_t v19 = @"Helvetica";
        if (Flags) {
          uint64_t v19 = @"Monaco";
        }
        if ((Flags & 2) != 0) {
          CGFloat v20 = v18;
        }
        else {
          CGFloat v20 = v19;
        }
        CFStringRef v13 = [MEMORY[0x263F1C658] fontWithName:v20 size:v9];
      }
      CFRelease(v16);
    }
    else
    {
      CFStringRef v13 = 0;
    }
    CGPDFFontRelease();
    if (v13)
    {
LABEL_33:
      if (v13) {
        goto LABEL_38;
      }
LABEL_34:
      uint64_t v21 = (void *)MEMORY[0x263F1C658];
      if (v9 <= 0.0) {
        goto LABEL_35;
      }
LABEL_36:
      uint64_t v22 = [v21 fontWithName:@"Helvetica" size:v9];
      goto LABEL_37;
    }
  }
  else
  {
LABEL_21:
    CFStringRef v13 = 0;
  }
LABEL_22:
  if (v9 <= 0.0) {
    goto LABEL_33;
  }
  uint64_t v22 = [MEMORY[0x263F1C658] fontWithName:v10 size:v9];
  if (!v22)
  {
    if ([v10 isEqualToString:@"Helv"])
    {
      uint64_t v21 = (void *)MEMORY[0x263F1C658];
      CGRect v23 = @"Helvetica";
    }
    else if ([v10 isEqualToString:@"HeBo"])
    {
      uint64_t v21 = (void *)MEMORY[0x263F1C658];
      CGRect v23 = @"Helvetica-Bold";
    }
    else if ([v10 isEqualToString:@"Cour"])
    {
      uint64_t v21 = (void *)MEMORY[0x263F1C658];
      CGRect v23 = @"Courier";
    }
    else
    {
      int v24 = [v10 isEqualToString:@"ZaDb"];
      uint64_t v21 = (void *)MEMORY[0x263F1C658];
      if (!v24) {
        goto LABEL_36;
      }
      CGRect v23 = @"ZapfDingbats";
    }
    CFStringRef v13 = [v21 fontWithName:v23 size:v9];
    goto LABEL_33;
  }
LABEL_37:
  CFStringRef v13 = (void *)v22;
LABEL_38:

  return v13;
}

+ (id)_getColorFromAppearanceString:(CGPDFString *)a3
{
  long long v4 = (__CFString *)CGPDFStringCopyTextString(a3);
  if (v4)
  {
    uint64_t v5 = [a1 _tokenizeAppearanceString:v4];
    id v6 = [a1 _colorFromAppearanceTokens:v5];
  }
  else
  {
    id v6 = 0;
    uint64_t v5 = 0;
  }

  return v6;
}

+ (id)_tokenizeAppearanceString:(id)a3
{
  id v3 = a3;
  long long v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  uint64_t v5 = [v3 length];
  uint64_t v6 = 0;
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ([v3 characterAtIndex:i] == 32)
      {
        if (i == v6)
        {
          ++v6;
        }
        else
        {
          double v8 = objc_msgSend(v3, "substringWithRange:", v6, i - v6);
          [v4 addObject:v8];

          uint64_t v6 = i + 1;
        }
      }
    }
  }
  double v9 = objc_msgSend(v3, "substringWithRange:", v6, v5 - v6);
  [v4 addObject:v9];

  return v4;
}

+ (double)_pointSizeFromAppearanceTokens:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  double v5 = 0.0;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    while (1)
    {
      if (v7)
      {
        double v8 = [v3 objectAtIndex:v7];
        int v9 = [v8 isEqualToString:@"Tf"];

        if (v9) {
          break;
        }
      }
      if (v6 == ++v7) {
        goto LABEL_8;
      }
    }
    id v10 = [v3 objectAtIndex:v7 - 1];
    [v10 floatValue];
    double v5 = v11;
  }
LABEL_8:

  return v5;
}

+ (id)_fontNameFromAppearanceTokens:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[v3 count];
  if (v4)
  {
    unint64_t v5 = 0;
    while (1)
    {
      if (v5 >= 2)
      {
        uint64_t v6 = [v3 objectAtIndex:v5];
        int v7 = [v6 isEqualToString:@"Tf"];

        if (v7)
        {
          double v8 = [v3 objectAtIndex:v5 - 2];
          uint64_t v9 = [v8 length];

          if (v9) {
            break;
          }
        }
      }
      if (v4 == (void *)++v5)
      {
        uint64_t v4 = 0;
        goto LABEL_9;
      }
    }
    id v10 = [v3 objectAtIndex:v5 - 2];
    uint64_t v4 = objc_msgSend(v10, "substringWithRange:", 1, v9 - 1);
  }
LABEL_9:

  return v4;
}

+ (id)_colorFromAppearanceTokens:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (!v4)
  {
LABEL_9:
    uint64_t v22 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  while (v6 < 3)
  {
    if (v6) {
      goto LABEL_7;
    }
LABEL_8:
    if (v5 == ++v6) {
      goto LABEL_9;
    }
  }
  int v7 = [v3 objectAtIndex:v6];
  int v8 = [v7 isEqualToString:@"rg"];

  if (v8)
  {
    CFStringRef v13 = (void *)MEMORY[0x263F1C550];
    uint64_t v14 = [v3 objectAtIndex:v6 - 3];
    [v14 floatValue];
    double v16 = v15;
    id v17 = [v3 objectAtIndex:v6 - 2];
    [v17 floatValue];
    double v19 = v18;
    CGFloat v20 = [v3 objectAtIndex:v6 - 1];
    [v20 floatValue];
    uint64_t v22 = [v13 akColorWithSRGBRed:v16 green:v19 blue:v21 alpha:1.0];

    goto LABEL_11;
  }
LABEL_7:
  uint64_t v9 = [v3 objectAtIndex:v6];
  int v10 = [v9 isEqualToString:@"g"];

  if (!v10) {
    goto LABEL_8;
  }
  float v11 = (void *)MEMORY[0x263F1C550];
  uint64_t v14 = [v3 objectAtIndex:v6 - 1];
  [v14 floatValue];
  uint64_t v22 = [v11 akColorWithWhite:v12 alpha:1.0];
LABEL_11:

LABEL_12:
  return v22;
}

+ (BOOL)_shouldUseAKAnnotation:(id)a3 toRepresentCGPDFAnnotation:(CGPDFAnnotation *)a4
{
  id v4 = a3;
  if (!CGPDFAnnotationIsVersioned())
  {
    CGPDFDictionarCGFloat y = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    if (CGPDFDictionary)
    {
      int v7 = CGPDFDictionary;
      CGPDFDictionaryRef value = 0;
      if (!CGPDFDictionaryGetDictionary(CGPDFDictionary, "AAPL:AKExtras", &value))
      {
LABEL_11:
        char IsPristine = 0;
        goto LABEL_15;
      }
      CGPDFDictionaryRef v29 = 0;
      if (CGPDFDictionaryGetDictionary(value, "AAPL:AKPDFAnnotationDictionary", &v29))
      {
        int v8 = [MEMORY[0x263F08968] mapTableWithKeyOptions:1282 valueOptions:512];
        _dictionaryForPDFDictionary(v29, v8);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v10 = [MEMORY[0x263F08968] mapTableWithKeyOptions:1282 valueOptions:512];
        float v11 = _dictionaryForPDFDictionary(v7, v10);
        [v11 removeObjectForKey:@"AAPL:AKExtras"];
        [v11 removeObjectForKey:@"AP"];
        [(__CFString *)v9 removeObjectForKey:@"AP"];
        char IsPristine = [v11 isEqualToDictionary:v9];

LABEL_7:
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        float64x2_t v12 = *(float64x2_t *)(MEMORY[0x263F001A8] + 16);
        float64x2_t v27 = *(float64x2_t *)MEMORY[0x263F001A8];
        float64x2_t v28 = v12;
        if (CGPDFDictionaryGetRect())
        {
          [v4 drawingBounds];
          float64_t v25 = v13;
          [v4 drawingBounds];
          float64_t v24 = v14;
          [v4 drawingBounds];
          float64_t v23 = v15;
          [v4 drawingBounds];
          v16.f64[0] = v25;
          v16.f64[1] = v24;
          v17.f64[1] = v23;
          float64x2_t v18 = vabdq_f64(v28, v17);
          float64x2_t v19 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
          if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_f64(v19, vabdq_f64(v27, v16)), (int32x4_t)vcgeq_f64(v19, v18))))))goto LABEL_11; {
          objc_opt_class();
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if ((objc_opt_respondsToSelector() & 1) == 0
                || ([v4 annotationText],
                    float v21 = objc_claimAutoreleasedReturnValue(),
                    [v21 string],
                    int v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                    v21,
                    !v8))
              {
                int v8 = &stru_26E1811C8;
              }
              CGPDFStringRef string = 0;
              uint64_t v9 = &stru_26E1811C8;
              if (CGPDFDictionaryGetString(v7, "Contents", &string))
              {
                CFStringRef v22 = CGPDFStringCopyTextString(string);
                if (v22) {
                  uint64_t v9 = (__CFString *)v22;
                }
              }
              char IsPristine = [(__CFString *)v8 isEqualToString:v9];
              goto LABEL_7;
            }
          }
        }
      }
    }
    char IsPristine = 1;
    goto LABEL_15;
  }
  char IsPristine = CGPDFAnnotationIsPristine();
LABEL_15:

  return IsPristine;
}

@end