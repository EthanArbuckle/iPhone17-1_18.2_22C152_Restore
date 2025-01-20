@interface MUCGPDFMarkupAnnotationAdaptor
+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4;
+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4;
@end

@implementation MUCGPDFMarkupAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v4 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v4)
  {
    CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    id v4 = (id)objc_opt_new();
    value = 0;
    if (!CGPDFDictionaryGetName(CGPDFDictionary, "Subtype", (const char **)&value))
    {
LABEL_15:

      id v4 = 0;
      goto LABEL_16;
    }
    v6 = value;
    if (!strcmp(value, "Highlight"))
    {
      uint64_t v7 = 1;
    }
    else if (!strcmp(v6, "Underline"))
    {
      uint64_t v7 = 2;
    }
    else if (!strcmp(v6, "StrikeOut"))
    {
      uint64_t v7 = 3;
    }
    else
    {
      NSLog(&cfstr_SUnexpectedVal.isa, "+[MUCGPDFMarkupAnnotationAdaptor _concreteAKAnnotationWithCGPDFAnnotation:ofPage:]", v6);
      uint64_t v7 = 0;
    }
    [v4 setStyle:v7];
    v8 = +[MUPDFAnnotationAdaptorHelper getRGBColorForKey:"C" fromAnnotationDictionary:CGPDFDictionary];
    if (v8) {
      [v4 setColor:v8];
    }
    CGPDFArrayRef array = 0;
    if (!CGPDFDictionaryGetArray(CGPDFDictionary, "QuadPoints", &array)
      || (size_t Count = CGPDFArrayGetCount(array), (Count & 7) != 0))
    {

      goto LABEL_15;
    }
    size_t v11 = Count;
    v12 = [MEMORY[0x263EFF980] arrayWithCapacity:Count >> 3];
    if (v11)
    {
      for (size_t i = 0; i < v11; i += 8)
      {
        CGPDFReal v23 = 0.0;
        CGPDFArrayGetNumber(array, i, &v23);
        CGPDFReal v14 = v23;
        CGPDFArrayGetNumber(array, i + 1, &v23);
        CGPDFReal v15 = v23;
        CGPDFArrayGetNumber(array, i + 2, &v23);
        CGPDFReal v16 = v23;
        CGPDFArrayGetNumber(array, i + 3, &v23);
        CGPDFReal v17 = v23;
        CGPDFArrayGetNumber(array, i + 4, &v23);
        CGPDFReal v18 = v23;
        CGPDFArrayGetNumber(array, i + 5, &v23);
        CGPDFReal v19 = v23;
        CGPDFArrayGetNumber(array, i + 6, &v23);
        CGPDFReal v20 = v23;
        CGPDFArrayGetNumber(array, i + 7, &v23);
        *(CGPDFReal *)v22 = v18;
        *(CGPDFReal *)&v22[1] = v19;
        *(CGPDFReal *)&v22[2] = v14;
        *(CGPDFReal *)&v22[3] = v15;
        *(CGPDFReal *)&v22[4] = v16;
        *(CGPDFReal *)&v22[5] = v17;
        *(CGPDFReal *)&v22[6] = v20;
        *(CGPDFReal *)&v22[7] = v23;
        v21 = [MEMORY[0x263F08D40] valueWithQuadrilateral:v22];
        [v12 addObject:v21];
      }
    }
    [v4 setQuadPoints:v12];
  }
LABEL_16:
  return v4;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  [v6 setObject:@"/Annot" forKey:@"/Type"];
  unint64_t v7 = [v5 style] - 1;
  if (v7 <= 2) {
    [v6 setObject:off_2649C2FF0[v7] forKey:@"/Subtype"];
  }
  v8 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v9 = [v5 quadPoints];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        CGPDFReal v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (v14) {
          [v14 quadrilateralValue];
        }
        CGPDFReal v15 = objc_msgSend(NSNumber, "numberWithDouble:", 0.0, 0);
        [v8 addObject:v15];

        CGPDFReal v16 = [NSNumber numberWithDouble:0.0];
        [v8 addObject:v16];

        CGPDFReal v17 = [NSNumber numberWithDouble:0.0];
        [v8 addObject:v17];

        CGPDFReal v18 = [NSNumber numberWithDouble:0.0];
        [v8 addObject:v18];

        CGPDFReal v19 = [NSNumber numberWithDouble:v25];
        [v8 addObject:v19];

        CGPDFReal v20 = [NSNumber numberWithDouble:0.0];
        [v8 addObject:v20];

        v21 = [NSNumber numberWithDouble:0.0];
        [v8 addObject:v21];

        v22 = [NSNumber numberWithDouble:0.0];
        [v8 addObject:v22];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  [v6 setObject:v8 forKey:@"/QuadPoints"];
  +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:v5 forPage:a4 toDictionary:v6];
  CGPDFReal v23 = [v5 color];
  +[MUPDFAnnotationAdaptorHelper addRGBColor:v23 forKey:@"/C" toDictionary:v6];

  +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:v5 toDictionary:v6];
  +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:v5 toDictionary:v6];
  +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:v5 toDictionary:v6];
  +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:v5 toDictionary:v6];
  +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:v5 forPage:a4 toDictionary:v6];
  +[MUPDFAnnotationAdaptorHelper addAKAnnotation:v5 toAnnotationDictionary:v6];

  return v6;
}

@end