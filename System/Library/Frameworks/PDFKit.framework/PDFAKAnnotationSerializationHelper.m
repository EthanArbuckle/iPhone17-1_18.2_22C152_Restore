@interface PDFAKAnnotationSerializationHelper
+ (BOOL)_annotationClassHasSeniority:(id)a3;
+ (BOOL)_shouldUseAKAnnotation:(id)a3 toRepresentCGPDFDictionary:(CGPDFDictionary *)a4;
+ (id)akAnnotationFromCGPDFAnnotation:(CGPDFAnnotation *)a3 andDictionary:(CGPDFDictionary *)a4;
+ (void)addAKAnnotation:(id)a3 toAnnotationDictionary:(__CFDictionary *)a4;
@end

@implementation PDFAKAnnotationSerializationHelper

+ (void)addAKAnnotation:(id)a3 toAnnotationDictionary:(__CFDictionary *)a4
{
  id v15 = a3;
  v6 = (void *)MEMORY[0x2166A0EA0]();
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v9 = [v15 dataRepresentation];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 base64EncodedStringWithOptions:0];
    if ([a1 _annotationClassHasSeniority:v15]) {
      v12 = @"/AAPL:AKAnnotationObject";
    }
    else {
      v12 = @"/AAPL:AKAnnotationV2";
    }
    CFDictionarySetValue(Mutable, v12, v11);
    MutableCopy = CFDictionaryCreateMutableCopy(v7, 0, a4);
    if (MutableCopy)
    {
      v14 = MutableCopy;
      CFDictionaryRemoveValue(MutableCopy, @"/AAPL:PaperKit");
      CFDictionarySetValue(Mutable, @"/AAPL:AKPDFAnnotationDictionary", v14);
      CFRelease(v14);
    }
    CFDictionarySetValue(a4, @"/AAPL:AKExtras", Mutable);
    CFRelease(Mutable);
  }
}

+ (id)akAnnotationFromCGPDFAnnotation:(CGPDFAnnotation *)a3 andDictionary:(CGPDFDictionary *)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    int IsVersioned = CGPDFAnnotationIsVersioned();
    v8 = (void *)MEMORY[0x2166A0EA0]();
    if (!IsVersioned || CGPDFAnnotationIsPristine())
    {
      CGPDFDictionaryRef value = 0;
      if (CGPDFDictionaryGetDictionary(a4, "AAPL:AKExtras", &value)
        && ((CGPDFStringRef string = 0, CGPDFDictionaryGetString(value, "AAPL:AKAnnotationObject", &string))
         || CGPDFDictionaryGetString(value, "AAPL:AKAnnotationV2", &string))
        && (CFStringRef v9 = CGPDFStringCopyTextString(string)) != 0)
      {
        v10 = (__CFString *)v9;
        v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v9 options:0];

        id v12 = [AKAnnotationClass() annotationWithData:v11];

        if (v12) {
          char v13 = IsVersioned;
        }
        else {
          char v13 = 1;
        }
        if ((v13 & 1) == 0
          && ([a1 _shouldUseAKAnnotation:v12 toRepresentCGPDFDictionary:a4] & 1) == 0)
        {
          goto LABEL_18;
        }
      }
      else
      {
        id v12 = 0;
      }
      id v12 = v12;
      v4 = v12;
LABEL_19:

      goto LABEL_20;
    }
    id v12 = 0;
LABEL_18:
    v4 = 0;
    goto LABEL_19;
  }
LABEL_20:

  return v4;
}

+ (BOOL)_annotationClassHasSeniority:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:AKInkAnnotationClass()])
  {
    char v4 = 0;
  }
  else if (([v3 isMemberOfClass:AKDoodleAnnotationClass()] & 1) != 0 {
         || ([v3 isMemberOfClass:AKArrowAnnotationClass()] & 1) != 0
  }
         || ([v3 isMemberOfClass:AKRectAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKOvalAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKTextBoxAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKTextFieldAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKArrowShapeAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKBorderMaskAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKCropAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKHeartAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKImageAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKLoupeAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKPolygonAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKSignatureAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKSpeechBubbleAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKStarAnnotationClass()] & 1) != 0
         || ([v3 isMemberOfClass:AKThoughtBubbleAnnotationClass()] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isMemberOfClass:AKTriangleAnnotationClass()];
  }

  return v4;
}

+ (BOOL)_shouldUseAKAnnotation:(id)a3 toRepresentCGPDFDictionary:(CGPDFDictionary *)a4
{
  id v5 = a3;
  if (!a4) {
    goto LABEL_12;
  }
  CGPDFDictionaryRef value = 0;
  if (!CGPDFDictionaryGetDictionary(a4, "AAPL:AKExtras", &value))
  {
LABEL_9:
    char v10 = 0;
    goto LABEL_13;
  }
  CGPDFDictionaryRef v28 = 0;
  if (!CGPDFDictionaryGetDictionary(value, "AAPL:AKPDFAnnotationDictionary", &v28))
  {
    AKBorderMaskAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      float64x2_t v11 = *(float64x2_t *)(MEMORY[0x263F001A8] + 16);
      float64x2_t v26 = *(float64x2_t *)MEMORY[0x263F001A8];
      float64x2_t v27 = v11;
      if (CGPDFDictionaryGetRect())
      {
        [v5 drawingBounds];
        float64_t v24 = v12;
        [v5 drawingBounds];
        float64_t v23 = v13;
        [v5 drawingBounds];
        float64_t v22 = v14;
        [v5 drawingBounds];
        v15.f64[0] = v24;
        v15.f64[1] = v23;
        v16.f64[1] = v22;
        float64x2_t v17 = vabdq_f64(v27, v16);
        float64x2_t v18 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
        if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_f64(v18, vabdq_f64(v26, v15)), (int32x4_t)vcgeq_f64(v18, v17))))))goto LABEL_9; {
        AKArrowShapeAnnotationClass();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          AKArrowAnnotationClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0
              || ([v5 annotationText],
                  v20 = objc_claimAutoreleasedReturnValue(),
                  [v20 string],
                  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                  v20,
                  !v6))
            {
              v6 = &stru_26C516768;
            }
            CGPDFStringRef string = 0;
            CFAllocatorRef v7 = &stru_26C516768;
            if (CGPDFDictionaryGetString(a4, "Contents", &string))
            {
              CFStringRef v21 = CGPDFStringCopyTextString(string);
              if (v21) {
                CFAllocatorRef v7 = (__CFString *)v21;
              }
            }
            char v10 = [(__CFString *)v6 isEqualToString:v7];
            goto LABEL_5;
          }
        }
      }
    }
LABEL_12:
    char v10 = 1;
    goto LABEL_13;
  }
  v6 = [MEMORY[0x263F08968] mapTableWithKeyOptions:1282 valueOptions:512];
  _dictionaryForPDFDictionary(v28, v6);
  CFAllocatorRef v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = [MEMORY[0x263F08968] mapTableWithKeyOptions:1282 valueOptions:512];
  CFStringRef v9 = _dictionaryForPDFDictionary(a4, v8);
  [(__CFString *)v7 removeObjectForKey:@"AAPL:AKExtras"];
  [v9 removeObjectForKey:@"AAPL:AKExtras"];
  [v9 removeObjectForKey:@"AP"];
  [(__CFString *)v7 removeObjectForKey:@"AP"];
  [v9 removeObjectForKey:@"Parent"];
  [(__CFString *)v7 removeObjectForKey:@"Popup"];
  char v10 = [v9 isEqualToDictionary:v7];

LABEL_5:
LABEL_13:

  return v10;
}

@end