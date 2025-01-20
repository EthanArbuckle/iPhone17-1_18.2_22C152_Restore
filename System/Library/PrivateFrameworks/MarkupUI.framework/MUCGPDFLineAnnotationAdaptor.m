@interface MUCGPDFLineAnnotationAdaptor
+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4;
+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4;
@end

@implementation MUCGPDFLineAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v5)
  {
    CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    id v5 = (id)objc_opt_new();
    +[MUPDFAnnotationAdaptorHelper migrateAKStrokedAnnotationPropertiesTo:v5 fromAnnotationDictionary:CGPDFDictionary ofPDFPage:a4];
    +[MUPDFAnnotationAdaptorHelper migrateAKTextAnnotationPropertiesTo:v5 fromAnnotationDictionary:CGPDFDictionary ofPDFPage:a4];
    [v5 strokeWidth];
    if (v7 == 0.0) {
      [v5 setStrokeWidth:1.0];
    }
    CGPDFArrayRef value = 0;
    if (CGPDFDictionaryGetArray(CGPDFDictionary, "L", &value) && CGPDFArrayGetCount(value) == 4)
    {
      double v8 = *MEMORY[0x263F00148];
      double v9 = *(double *)(MEMORY[0x263F00148] + 8);
      *(double *)&__s1 = 0.0;
      if (CGPDFArrayGetNumber(value, 0, (CGPDFReal *)&__s1)) {
        v10 = __s1;
      }
      else {
        *(double *)&v10 = v8;
      }
      if (CGPDFArrayGetNumber(value, 1uLL, (CGPDFReal *)&__s1)) {
        v11 = __s1;
      }
      else {
        *(double *)&v11 = v9;
      }
      if (CGPDFArrayGetNumber(value, 2uLL, (CGPDFReal *)&__s1)) {
        double v8 = *(double *)&__s1;
      }
      if (CGPDFArrayGetNumber(value, 3uLL, (CGPDFReal *)&__s1)) {
        double v9 = *(double *)&__s1;
      }
      objc_msgSend(v5, "setStartPoint:", *(double *)&v10, *(double *)&v11);
      objc_msgSend(v5, "setEndPoint:", v8, v9);
      objc_msgSend(v5, "setMidPoint:", (*(double *)&v10 + v8) * 0.5, (*(double *)&v11 + v9) * 0.5);
      BOOL Array = CGPDFDictionaryGetArray(CGPDFDictionary, "LE", &value);
      uint64_t v13 = 0;
      if (Array)
      {
        if (CGPDFArrayGetCount(value) == 2)
        {
          *(double *)&__s1 = 0.0;
          uint64_t v13 = 0;
          if (CGPDFArrayGetName(value, 0, (const char **)&__s1))
          {
            v14 = __s1;
            uint64_t v13 = !strcmp(__s1, "OpenArrow") || !strcmp(v14, "ClosedArrow");
          }
          if (CGPDFArrayGetName(value, 1uLL, (const char **)&__s1))
          {
            v15 = __s1;
            if (!strcmp(__s1, "OpenArrow") || !strcmp(v15, "ClosedArrow")) {
              v13 |= 2uLL;
            }
          }
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      [v5 setArrowHeadStyle:v13];
    }
    else
    {

      id v5 = 0;
    }
  }
  return v5;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  v34[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v8 = (void *)MEMORY[0x263EFF9A0];
    id v9 = v5;
    v10 = [v8 dictionary];
    [v10 setValue:@"/Annot" forKey:@"/Type"];
    [v10 setValue:@"/Line" forKey:@"/Subtype"];
    +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:v9 forPage:a4 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:v9 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:v9 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:v9 toDictionary:v10];
    [v9 startPoint];
    double v12 = v11;
    double v14 = v13;
    [v9 endPoint];
    double v16 = v15;
    double v18 = v17;
    v19 = [NSNumber numberWithDouble:v12];
    v34[0] = v19;
    v20 = [NSNumber numberWithDouble:v14];
    v34[1] = v20;
    v21 = [NSNumber numberWithDouble:v16];
    v34[2] = v21;
    v22 = [NSNumber numberWithDouble:v18];
    v34[3] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];

    [v10 setValue:v23 forKey:@"/L"];
    +[MUPDFAnnotationAdaptorHelper addBorderStyleOfAnnotation:v9 toDictionary:v10];
    v24 = [v9 strokeColor];
    +[MUPDFAnnotationAdaptorHelper addRGBColor:v24 forKey:@"/C" toDictionary:v10];

    +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:v9 toDictionary:v10];
    v25 = [v9 strokeColor];
    +[MUPDFAnnotationAdaptorHelper addRGBColor:v25 forKey:@"/IC" toDictionary:v10];

    if ([v9 arrowHeadStyle]) {
      v26 = @"/ClosedArrow";
    }
    else {
      v26 = @"/None";
    }
    v27 = v26;
    if (([v9 arrowHeadStyle] & 2) != 0) {
      v28 = @"/ClosedArrow";
    }
    else {
      v28 = @"/None";
    }
    v33[0] = v27;
    v33[1] = v28;
    v29 = (void *)MEMORY[0x263EFF8C0];
    v30 = v28;
    v31 = [v29 arrayWithObjects:v33 count:2];
    [v10 setValue:v31 forKey:@"/LE"];
    +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:v9 forPage:a4 toDictionary:v10];
    +[MUPDFAnnotationAdaptorHelper addAKAnnotation:v9 toAnnotationDictionary:v10];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end