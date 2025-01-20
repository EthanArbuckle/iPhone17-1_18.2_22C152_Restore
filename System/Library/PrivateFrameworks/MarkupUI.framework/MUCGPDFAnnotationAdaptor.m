@interface MUCGPDFAnnotationAdaptor
+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4;
+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4;
+ (id)newAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4;
+ (id)newPlaceholderAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4;
+ (id)pdfDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4;
+ (id)supportedAnnotationTypes;
@end

@implementation MUCGPDFAnnotationAdaptor

+ (id)supportedAnnotationTypes
{
  if (supportedAnnotationTypes_onceToken != -1) {
    dispatch_once(&supportedAnnotationTypes_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)supportedAnnotationTypes_sSupportedTypes;
  return v2;
}

uint64_t __52__MUCGPDFAnnotationAdaptor_supportedAnnotationTypes__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Circle", @"Popup", @"Widget", @"FreeText", @"Line", @"Square", @"Stamp", @"Highlight", @"StrikeOut", @"Underline", 0);
  uint64_t v1 = supportedAnnotationTypes_sSupportedTypes;
  supportedAnnotationTypes_sSupportedTypes = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)newAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
  v7 = 0;
  switch(CGPDFAnnotationGetType())
  {
    case 2u:
    case 4u:
    case 5u:
    case 7u:
    case 0xCu:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x17u:
      goto LABEL_4;
    case 0x19u:
      value = 0;
      if (CGPDFDictionaryGetName(CGPDFDictionary, "FT", (const char **)&value)) {
        strcmp(value, "Tx");
      }
LABEL_4:
      id v8 = self;
      if (v8)
      {
        v9 = [v8 _concreteAKAnnotationWithCGPDFAnnotation:a3 ofPage:a4];
        v7 = v9;
        if (v9)
        {
          [v9 originalModelBaseScaleFactor];
          if (v10 == 0.0) {
            [v7 setOriginalModelBaseScaleFactor:1.0];
          }
          if (![v7 originalExifOrientation]) {
            objc_msgSend(v7, "setOriginalExifOrientation:", +[MUPDFUtilities exifOrientationOfPage:](MUPDFUtilities, "exifOrientationOfPage:", a4));
          }
          v11 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            +[MUPDFAnnotationAdaptorHelper migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:](MUPDFAnnotationAdaptorHelper, "migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:", CGPDFDictionary, v7, +[MUPDFUtilities normalizedRotationAngleOfPage:a4]);
          }
        }
      }
      else
      {
        v7 = 0;
      }
      break;
    default:
      return v7;
  }
  return v7;
}

+ (id)newPlaceholderAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  v5 = +[MUCGPDFStampAnnotationAdaptor _concreteAKAnnotationWithCGPDFAnnotation:ofPage:](MUCGPDFStampAnnotationAdaptor, "_concreteAKAnnotationWithCGPDFAnnotation:ofPage:");
  v6 = v5;
  if (v5)
  {
    [v5 originalModelBaseScaleFactor];
    if (v7 == 0.0) {
      [v6 setOriginalModelBaseScaleFactor:1.0];
    }
    if (![v6 originalExifOrientation]) {
      objc_msgSend(v6, "setOriginalExifOrientation:", +[MUPDFUtilities exifOrientationOfPage:](MUPDFUtilities, "exifOrientationOfPage:", a4));
    }
    +[MUPDFAnnotationAdaptorHelper migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:](MUPDFAnnotationAdaptorHelper, "migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:", CGPDFAnnotationGetCGPDFDictionary(), v6, +[MUPDFUtilities normalizedRotationAngleOfPage:a4]);
  }
  return v6;
}

+ (id)pdfDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5 = a3;
  v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v8 = self;
    char v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0)
    {
      double v10 = self;
      char v11 = objc_opt_isKindOfClass();

      if ((v11 & 1) == 0)
      {
        v12 = self;
        char v13 = objc_opt_isKindOfClass();

        if ((v13 & 1) == 0)
        {
          v14 = self;
          char v15 = objc_opt_isKindOfClass();

          if ((v15 & 1) == 0)
          {
            v16 = self;
            if (objc_opt_isKindOfClass())
            {
LABEL_20:

              goto LABEL_21;
            }
            v17 = self;
            if (objc_opt_isKindOfClass())
            {
LABEL_19:

              goto LABEL_20;
            }
            v18 = self;
            if (objc_opt_isKindOfClass())
            {
LABEL_18:

              goto LABEL_19;
            }
            v19 = self;
            if (objc_opt_isKindOfClass())
            {
LABEL_17:

              goto LABEL_18;
            }
            v20 = self;
            if (objc_opt_isKindOfClass())
            {
LABEL_16:

              goto LABEL_17;
            }
            v21 = self;
            if (objc_opt_isKindOfClass())
            {
LABEL_15:

              goto LABEL_16;
            }
            v22 = self;
            if (objc_opt_isKindOfClass())
            {

              goto LABEL_15;
            }
            v25 = self;
            char v35 = objc_opt_isKindOfClass();

            if ((v35 & 1) == 0)
            {
              v16 = self;
              if (objc_opt_isKindOfClass()) {
                goto LABEL_20;
              }
              v17 = self;
              if (objc_opt_isKindOfClass()) {
                goto LABEL_19;
              }
              v18 = self;
              if (objc_opt_isKindOfClass()) {
                goto LABEL_18;
              }
              v19 = self;
              if (objc_opt_isKindOfClass()) {
                goto LABEL_17;
              }
              v26 = self;
              char v27 = objc_opt_isKindOfClass();

              if ((v27 & 1) == 0)
              {
                v28 = self;
                char v29 = objc_opt_isKindOfClass();

                if ((v29 & 1) == 0)
                {
                  v30 = self;
                  char v31 = objc_opt_isKindOfClass();

                  if ((v31 & 1) == 0)
                  {
                    v32 = self;
                    char v33 = objc_opt_isKindOfClass();

                    if ((v33 & 1) == 0) {
                      NSLog(&cfstr_SUnsupportedAn.isa, "+[MUCGPDFAnnotationAdaptor pdfDictionaryRepresentationOfAKAnnotation:forPage:]", v5);
                    }
                    goto LABEL_33;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_21:
  id v23 = self;
  if (v23)
  {
    v24 = [v23 _concreteDictionaryRepresentationOfAKAnnotation:v5 forPage:a4];
    goto LABEL_34;
  }
LABEL_33:
  v24 = 0;
LABEL_34:

  return v24;
}

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  return 0;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  return 0;
}

@end