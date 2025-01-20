id sub_23760F85C(double a1, double a2, double a3, double a4)
{
  void *v4;
  void v6[4];
  uint64_t vars8;

  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x263F08D40] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  return v4;
}

double sub_23760F8AC(void *a1)
{
  [a1 getValue:&v2 size:32];
  return v2;
}

id sub_237615A3C(uint64_t a1, uint64_t a2, const CGPath *a3)
{
  v4 = [MEMORY[0x263EFF990] data];
  if (a3) {
    CGPathApply(a3, v4, (CGPathApplierFunction)sub_237615AA4);
  }

  return v4;
}

void sub_237615AA4(void *a1, int *a2)
{
  id v3 = a1;
  v4 = v3;
  uint64_t v5 = *a2;
  int v13 = v5;
  if (v5 > 4)
  {
    NSLog(&cfstr_SSkippingEncod.isa, "void _encodePathElementIntoData(void *, const CGPathElement *)", v5);
  }
  else
  {
    unsigned int v12 = dword_2376F4000[v5];
    [v3 appendBytes:&v13 length:4];
    [v4 appendBytes:&v12 length:4];
    if (v12)
    {
      uint64_t v6 = 0;
      for (unint64_t i = 0; i < v12; ++i)
      {
        float v8 = *(double *)(*((void *)a2 + 1) + v6);
        float v11 = v8;
        [v4 appendBytes:&v11 length:4];
        float v9 = *(double *)(*((void *)a2 + 1) + v6 + 8);
        float v10 = v9;
        [v4 appendBytes:&v10 length:4];
        v6 += 16;
      }
    }
  }
}

CGPath *sub_237615BA4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 length])
  {
LABEL_24:
    Mutable = 0;
    goto LABEL_25;
  }
  unint64_t v4 = [v3 length];
  Mutable = CGPathCreateMutable();
  uint64_t v6 = [v3 bytes];
  long long v15 = *MEMORY[0x263F00148];
  long long v16 = v15;
  *(_OWORD *)v17 = v15;
  if (v4 >= 8)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 8;
    float v10 = @"%s: Unknown element type for path. Aborting read due to data corruption.";
    while (1)
    {
      uint64_t v11 = *(int *)(v7 + v8);
      if (v11 > 4) {
        break;
      }
      uint64_t v12 = *(unsigned int *)(v7 + v8 + 4);
      if (dword_2376F4000[v11] != v12)
      {
        NSLog(&cfstr_SUnexpectedPoi.isa, "+[NSData(CGPathExtensions) newCGPathDecodedFromData:]");
        goto LABEL_23;
      }
      if (v9 + 8 * v12 > v4)
      {
        float v10 = @"%s: Number of points left to read exceeds buffer length. Aborting read due to data corruption.";
        break;
      }
      if (v12)
      {
        int v13 = (float64x2_t *)&v15;
        do
        {
          uint64_t v8 = v9 + 8;
          *v13++ = vcvtq_f64_f32(*(float32x2_t *)(v7 + v9));
          v9 += 8;
          --v12;
        }
        while (v12);
      }
      else
      {
        uint64_t v8 = v9;
      }
      switch((int)v11)
      {
        case 0:
          CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1));
          break;
        case 1:
          CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1));
          break;
        case 2:
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1));
          break;
        case 3:
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1), v17[0], v17[1]);
          break;
        case 4:
          CGPathCloseSubpath(Mutable);
          break;
        default:
          break;
      }
      uint64_t v9 = v8 + 8;
      if (v8 + 8 > v4) {
        goto LABEL_25;
      }
    }
    NSLog(&v10->isa, "+[NSData(CGPathExtensions) newCGPathDecodedFromData:]");
LABEL_23:
    CGPathRelease(Mutable);
    goto LABEL_24;
  }
LABEL_25:

  return Mutable;
}

id AKQuadrilateralCreateDictionaryRepresentation(double *a1)
{
  v25[4] = *MEMORY[0x263EF8340];
  v24[0] = @"bottomLeft";
  v22[0] = @"X";
  long long v15 = [NSNumber numberWithDouble:*a1];
  v22[1] = @"Y";
  v23[0] = v15;
  v14 = [NSNumber numberWithDouble:a1[1]];
  v23[1] = v14;
  int v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v25[0] = v13;
  v24[1] = @"topLeft";
  v20[0] = @"X";
  uint64_t v12 = [NSNumber numberWithDouble:a1[2]];
  v20[1] = @"Y";
  v21[0] = v12;
  double v2 = [NSNumber numberWithDouble:a1[3]];
  v21[1] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v25[1] = v3;
  v24[2] = @"topRight";
  v18[0] = @"X";
  unint64_t v4 = [NSNumber numberWithDouble:a1[4]];
  v18[1] = @"Y";
  v19[0] = v4;
  uint64_t v5 = [NSNumber numberWithDouble:a1[5]];
  v19[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v25[2] = v6;
  v24[3] = @"bottomRight";
  v16[0] = @"X";
  uint64_t v7 = [NSNumber numberWithDouble:a1[6]];
  v16[1] = @"Y";
  v17[0] = v7;
  uint64_t v8 = [NSNumber numberWithDouble:a1[7]];
  v17[1] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v25[3] = v9;
  float v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

  return v10;
}

void AKQuadrilateralMakeWithDictionaryRepresentation(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  id v3 = a1;
  unint64_t v4 = [v3 objectForKeyedSubscript:@"bottomLeft"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"X"];
  [v5 doubleValue];
  *(void *)a2 = v6;

  uint64_t v7 = [v4 objectForKeyedSubscript:@"Y"];
  [v7 doubleValue];
  *(void *)(a2 + 8) = v8;

  uint64_t v9 = [v3 objectForKeyedSubscript:@"topLeft"];

  float v10 = [v9 objectForKeyedSubscript:@"X"];
  [v10 doubleValue];
  *(void *)(a2 + 16) = v11;

  uint64_t v12 = [v9 objectForKeyedSubscript:@"Y"];
  [v12 doubleValue];
  *(void *)(a2 + 24) = v13;

  v14 = [v3 objectForKeyedSubscript:@"topRight"];

  long long v15 = [v14 objectForKeyedSubscript:@"X"];
  [v15 doubleValue];
  *(void *)(a2 + 32) = v16;

  v17 = [v14 objectForKeyedSubscript:@"Y"];
  [v17 doubleValue];
  *(void *)(a2 + 40) = v18;

  id v23 = [v3 objectForKeyedSubscript:@"bottomRight"];

  v19 = [v23 objectForKeyedSubscript:@"X"];
  [v19 doubleValue];
  *(void *)(a2 + 48) = v20;

  v21 = [v23 objectForKeyedSubscript:@"Y"];
  [v21 doubleValue];
  *(void *)(a2 + 56) = v22;
}

uint64_t sub_23761790C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x263F08D40] valueWithBytes:a3 objCType:"{AKQuadrilateral={CGPoint=dd}{CGPoint=dd}{CGPoint=dd}{CGPoint=dd}}"];
}

const char *sub_237617920@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  NSUInteger sizep = 0;
  id v3 = a1;
  result = NSGetSizeAndAlignment((const char *)[v3 objCType], &sizep, 0);
  NSUInteger v5 = sizep;
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  if (v5 == 64) {
    return (const char *)[v3 getValue:a2 size:64];
  }
  return result;
}

id sub_23761798C()
{
  return +[AKSecureSerializationHelper encodeColor:](AKSecureSerializationHelper, "encodeColor:");
}

void sub_237617998(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = +[AKSecureSerializationHelper encodeColor:a3];
  [a1 setObject:v7 forKey:v6];
}

id sub_237617A18(void *a1)
{
  v1 = objc_msgSend(a1, "dataForKey:");
  double v2 = +[AKSecureSerializationHelper decodeColor:v1];

  return v2;
}

id sub_237617A70()
{
  return +[AKSecureSerializationHelper encodeFont:](AKSecureSerializationHelper, "encodeFont:");
}

void sub_237617A7C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = +[AKSecureSerializationHelper encodeFont:a3];
  [a1 setObject:v7 forKey:v6];
}

id sub_237617AFC(void *a1)
{
  v1 = objc_msgSend(a1, "dataForKey:");
  double v2 = +[AKSecureSerializationHelper decodeFont:v1];

  return v2;
}

id sub_237617B54()
{
  return +[AKSecureSerializationHelper encodeTextAttributes:](AKSecureSerializationHelper, "encodeTextAttributes:");
}

void sub_237617B60(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = +[AKSecureSerializationHelper encodeTextAttributes:a3];
  [a1 setObject:v7 forKey:v6];
}

id sub_237617BE0(void *a1)
{
  v1 = objc_msgSend(a1, "dataForKey:");
  double v2 = +[AKSecureSerializationHelper decodeTextAttributes:v1];

  return v2;
}

double sub_2376199F4(void *a1, uint64_t a2, void *a3)
{
  double v11 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  id v4 = a3;
  [a1 getL:&v11 a:&v10 b:&v9];
  [v4 getL:&v8 a:&v7 b:&v6];

  return sqrt((v8 - v11) * (v8 - v11) + (v7 - v10) * (v7 - v10) + (v6 - v9) * (v6 - v9));
}

void sub_237619A9C(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t v9 = [(id)objc_opt_class() _getCIELABColorSpace];
  if (v9)
  {
    double v10 = (CGColorSpace *)v9;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = sub_237619C60;
    v21 = &unk_264CDADD0;
    uint64_t v22 = v9;
    if (qword_2689240B0 != -1) {
      dispatch_once(&qword_2689240B0, &block);
    }
    if (qword_2689240A8)
    {
      id v11 = a1;
      objc_msgSend(v11, "CGColor", block, v19, v20, v21, v22, v23);
      uint64_t v12 = CGColorTransformConvertColor();
      if (v12)
      {
        uint64_t v13 = (CGColor *)v12;
        size_t v14 = 8 * CGColorSpaceGetNumberOfComponents(v10) + 8;
        MEMORY[0x270FA5388]();
        uint64_t v16 = (uint64_t *)((char *)&block - ((v15 + 23) & 0xFFFFFFFFFFFFFFF0));
        Components = CGColorGetComponents(v13);
        memcpy(v16, Components, v14);
        if (a3) {
          *a3 = *v16;
        }
        if (a4) {
          *a4 = v16[1];
        }
        if (a5) {
          *a5 = v16[2];
        }
        CFRelease(v13);
      }
    }
  }
}

uint64_t sub_237619C60(uint64_t a1)
{
  uint64_t result = MEMORY[0x237E1D120](*(void *)(a1 + 32), 0);
  qword_2689240A8 = result;
  return result;
}

uint64_t sub_237619C88()
{
  if (qword_2689240C0 != -1) {
    dispatch_once(&qword_2689240C0, &unk_26EA574F8);
  }
  return qword_2689240B8;
}

CGColorSpaceRef sub_237619CCC()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_OWORD *)whitePoint = xmmword_2376F4058;
  uint64_t v4 = 0x3FF16BD900000000;
  memset(blackPoint, 0, sizeof(blackPoint));
  v1[0] = xmmword_2376F4070;
  v1[1] = unk_2376F4080;
  CGColorSpaceRef result = CGColorSpaceCreateLab(whitePoint, blackPoint, (const CGFloat *)v1);
  qword_2689240B8 = (uint64_t)result;
  return result;
}

id sub_23761A888(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:@"a"];
    double v6 = v5;
    if (v5)
    {
      [v5 floatValue];
      double v8 = v7;
    }
    else
    {
      double v8 = 1.0;
    }
    double v10 = [v4 objectForKey:@"w"];
    id v11 = v10;
    if (v10)
    {
      int v12 = [v10 intValue];
      uint64_t v9 = [MEMORY[0x263F1C550] akColorWithSRGBRed:(double)v12 / 255.0 green:(double)v12 / 255.0 blue:(double)v12 / 255.0 alpha:v8];
    }
    else
    {
      uint64_t v13 = [v4 objectForKey:@"r"];
      size_t v14 = v13;
      double v15 = 0.0;
      double v16 = 0.0;
      if (v13) {
        double v16 = (double)(int)[v13 intValue] / 255.0;
      }
      v17 = [v4 objectForKey:@"g"];
      uint64_t v18 = v17;
      if (v17) {
        double v15 = (double)(int)[v17 intValue] / 255.0;
      }
      uint64_t v19 = [v4 objectForKey:@"b"];
      uint64_t v20 = v19;
      if (v19) {
        double v21 = (double)(int)[v19 intValue] / 255.0;
      }
      else {
        double v21 = 0.0;
      }
      uint64_t v9 = [MEMORY[0x263F1C550] akColorWithSRGBRed:v16 green:v15 blue:v21 alpha:v8];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_23761AAB4()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 pathForResource:@"AKAnnotationTheme" ofType:@"plist"];

  uint64_t v1 = [objc_alloc(NSDictionary) initWithContentsOfFile:v3];
  double v2 = (void *)qword_2689240D0;
  qword_2689240D0 = v1;
}

uint64_t sub_23761B05C(uint64_t a1)
{
  qword_2689240E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B0C4(uint64_t a1)
{
  qword_2689240F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B12C(uint64_t a1)
{
  qword_268924100 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B194(uint64_t a1)
{
  qword_268924110 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B1FC(uint64_t a1)
{
  qword_268924120 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B568(uint64_t a1)
{
  qword_268924130 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B5D0(uint64_t a1)
{
  qword_268924140 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B638(uint64_t a1)
{
  qword_268924150 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B6A0(uint64_t a1)
{
  qword_268924160 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761B708(uint64_t a1)
{
  qword_268924170 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761BA74(uint64_t a1)
{
  qword_268924180 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761BADC(uint64_t a1)
{
  qword_268924190 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761BB44(uint64_t a1)
{
  qword_2689241A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761BBAC(uint64_t a1)
{
  qword_2689241B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761BC14(uint64_t a1)
{
  qword_2689241C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761BF80(uint64_t a1)
{
  qword_2689241D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761BFE8(uint64_t a1)
{
  qword_2689241E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C050(uint64_t a1)
{
  qword_2689241F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C0B8(uint64_t a1)
{
  qword_268924200 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C120(uint64_t a1)
{
  qword_268924210 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C48C(uint64_t a1)
{
  qword_268924220 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C4F4(uint64_t a1)
{
  qword_268924230 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C55C(uint64_t a1)
{
  qword_268924240 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C5C4(uint64_t a1)
{
  qword_268924250 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C62C(uint64_t a1)
{
  qword_268924260 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761C998(uint64_t a1)
{
  qword_268924270 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CA00(uint64_t a1)
{
  qword_268924280 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CA68(uint64_t a1)
{
  qword_268924290 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CAD0(uint64_t a1)
{
  qword_2689242A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CB38(uint64_t a1)
{
  qword_2689242B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CEA4(uint64_t a1)
{
  qword_2689242C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CF0C(uint64_t a1)
{
  qword_2689242D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CF74(uint64_t a1)
{
  qword_2689242E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761CFDC(uint64_t a1)
{
  qword_2689242F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761D044(uint64_t a1)
{
  qword_268924300 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void sub_23761D13C(uint64_t a1)
{
  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", [*(id *)(a1 + 32) annotationStyle], @"is_underline");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_268924310 = [v1 BOOLValue];
}

uint64_t sub_23761D4B8(uint64_t a1)
{
  qword_268924320 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761D520(uint64_t a1)
{
  qword_268924330 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761D588(uint64_t a1)
{
  qword_268924340 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761D5F0(uint64_t a1)
{
  qword_268924350 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761D658(uint64_t a1)
{
  qword_268924360 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761D9C4(uint64_t a1)
{
  qword_268924370 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761DA2C(uint64_t a1)
{
  qword_268924380 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761DA94(uint64_t a1)
{
  qword_268924390 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761DAFC(uint64_t a1)
{
  qword_2689243A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761DB64(uint64_t a1)
{
  qword_2689243B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761DED0(uint64_t a1)
{
  qword_2689243C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761DF38(uint64_t a1)
{
  qword_2689243D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761DFA0(uint64_t a1)
{
  qword_2689243E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E008(uint64_t a1)
{
  qword_2689243F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E070(uint64_t a1)
{
  qword_268924400 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E3DC(uint64_t a1)
{
  qword_268924410 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E444(uint64_t a1)
{
  qword_268924420 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E4AC(uint64_t a1)
{
  qword_268924430 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E514(uint64_t a1)
{
  qword_268924440 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E57C(uint64_t a1)
{
  qword_268924450 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E8E8(uint64_t a1)
{
  qword_268924460 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E950(uint64_t a1)
{
  qword_268924470 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761E9B8(uint64_t a1)
{
  qword_268924480 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761EA20(uint64_t a1)
{
  qword_268924490 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761EA88(uint64_t a1)
{
  qword_2689244A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761EDF4(uint64_t a1)
{
  qword_2689244B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761EE5C(uint64_t a1)
{
  qword_2689244C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761EEC4(uint64_t a1)
{
  qword_2689244D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761EF2C(uint64_t a1)
{
  qword_2689244E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761EF94(uint64_t a1)
{
  qword_2689244F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761F300(uint64_t a1)
{
  qword_268924500 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761F368(uint64_t a1)
{
  qword_268924510 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761F3D0(uint64_t a1)
{
  qword_268924520 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761F438(uint64_t a1)
{
  qword_268924530 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761F4A0(uint64_t a1)
{
  qword_268924540 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void sub_23761F598(uint64_t a1)
{
  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", [*(id *)(a1 + 32) annotationStyle], @"is_underline");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_268924550 = [v1 BOOLValue];
}

uint64_t sub_23761F914(uint64_t a1)
{
  qword_268924560 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761F97C(uint64_t a1)
{
  qword_268924570 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761F9E4(uint64_t a1)
{
  qword_268924580 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761FA4C(uint64_t a1)
{
  qword_268924590 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761FAB4(uint64_t a1)
{
  qword_2689245A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761FE20(uint64_t a1)
{
  qword_2689245B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761FE88(uint64_t a1)
{
  qword_2689245C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761FEF0(uint64_t a1)
{
  qword_2689245D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761FF58(uint64_t a1)
{
  qword_2689245E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23761FFC0(uint64_t a1)
{
  qword_2689245F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762032C(uint64_t a1)
{
  qword_268924600 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620394(uint64_t a1)
{
  qword_268924610 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376203FC(uint64_t a1)
{
  qword_268924620 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620464(uint64_t a1)
{
  qword_268924630 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376204CC(uint64_t a1)
{
  qword_268924640 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620838(uint64_t a1)
{
  qword_268924650 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376208A0(uint64_t a1)
{
  qword_268924660 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620908(uint64_t a1)
{
  qword_268924670 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620970(uint64_t a1)
{
  qword_268924680 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376209D8(uint64_t a1)
{
  qword_268924690 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620D44(uint64_t a1)
{
  qword_2689246A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620DAC(uint64_t a1)
{
  qword_2689246B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620E14(uint64_t a1)
{
  qword_2689246C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620E7C(uint64_t a1)
{
  qword_2689246D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237620EE4(uint64_t a1)
{
  qword_2689246E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621250(uint64_t a1)
{
  qword_2689246F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376212B8(uint64_t a1)
{
  qword_268924700 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621320(uint64_t a1)
{
  qword_268924710 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621388(uint64_t a1)
{
  qword_268924720 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376213F0(uint64_t a1)
{
  qword_268924730 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762175C(uint64_t a1)
{
  qword_268924740 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376217C4(uint64_t a1)
{
  qword_268924750 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762182C(uint64_t a1)
{
  qword_268924760 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621894(uint64_t a1)
{
  qword_268924770 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376218FC(uint64_t a1)
{
  qword_268924780 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void sub_2376219F4(uint64_t a1)
{
  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", [*(id *)(a1 + 32) annotationStyle], @"is_underline");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_268924790 = [v1 BOOLValue];
}

uint64_t sub_237621D70(uint64_t a1)
{
  qword_2689247A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621DD8(uint64_t a1)
{
  qword_2689247B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621E40(uint64_t a1)
{
  qword_2689247C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621EA8(uint64_t a1)
{
  qword_2689247D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237621F10(uint64_t a1)
{
  qword_2689247E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762227C(uint64_t a1)
{
  qword_2689247F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376222E4(uint64_t a1)
{
  qword_268924800 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762234C(uint64_t a1)
{
  qword_268924810 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376223B4(uint64_t a1)
{
  qword_268924820 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762241C(uint64_t a1)
{
  qword_268924830 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622788(uint64_t a1)
{
  qword_268924840 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376227F0(uint64_t a1)
{
  qword_268924850 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622858(uint64_t a1)
{
  qword_268924860 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376228C0(uint64_t a1)
{
  qword_268924870 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622928(uint64_t a1)
{
  qword_268924880 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622C94(uint64_t a1)
{
  qword_268924890 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622CFC(uint64_t a1)
{
  qword_2689248A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622D64(uint64_t a1)
{
  qword_2689248B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622DCC(uint64_t a1)
{
  qword_2689248C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237622E34(uint64_t a1)
{
  qword_2689248D0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376231A0(uint64_t a1)
{
  qword_2689248E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623208(uint64_t a1)
{
  qword_2689248F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623270(uint64_t a1)
{
  qword_268924900 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376232D8(uint64_t a1)
{
  qword_268924910 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623340(uint64_t a1)
{
  qword_268924920 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376236AC(uint64_t a1)
{
  qword_268924930 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623714(uint64_t a1)
{
  qword_268924940 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762377C(uint64_t a1)
{
  qword_268924950 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376237E4(uint64_t a1)
{
  qword_268924960 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762384C(uint64_t a1)
{
  qword_268924970 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623BB8(uint64_t a1)
{
  qword_268924980 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623C20(uint64_t a1)
{
  qword_268924990 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623C88(uint64_t a1)
{
  qword_2689249A0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623CF0(uint64_t a1)
{
  qword_2689249B0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237623D58(uint64_t a1)
{
  qword_2689249C0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void sub_237623E50(uint64_t a1)
{
  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", [*(id *)(a1 + 32) annotationStyle], @"is_underline");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_2689249D0 = [v1 BOOLValue];
}

uint64_t sub_2376241CC(uint64_t a1)
{
  qword_2689249E0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624234(uint64_t a1)
{
  qword_2689249F0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762429C(uint64_t a1)
{
  qword_268924A00 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624304(uint64_t a1)
{
  qword_268924A10 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762436C(uint64_t a1)
{
  qword_268924A20 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376246D8(uint64_t a1)
{
  qword_268924A30 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624740(uint64_t a1)
{
  qword_268924A40 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376247A8(uint64_t a1)
{
  qword_268924A50 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624810(uint64_t a1)
{
  qword_268924A60 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624878(uint64_t a1)
{
  qword_268924A70 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624BE4(uint64_t a1)
{
  qword_268924A80 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624C4C(uint64_t a1)
{
  qword_268924A90 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624CB4(uint64_t a1)
{
  qword_268924AA0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624D1C(uint64_t a1)
{
  qword_268924AB0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237624D84(uint64_t a1)
{
  qword_268924AC0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376250F0(uint64_t a1)
{
  qword_268924AD0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625158(uint64_t a1)
{
  qword_268924AE0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376251C0(uint64_t a1)
{
  qword_268924AF0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625228(uint64_t a1)
{
  qword_268924B00 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625290(uint64_t a1)
{
  qword_268924B10 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376255FC(uint64_t a1)
{
  qword_268924B20 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625664(uint64_t a1)
{
  qword_268924B30 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376256CC(uint64_t a1)
{
  qword_268924B40 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625734(uint64_t a1)
{
  qword_268924B50 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762579C(uint64_t a1)
{
  qword_268924B60 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625B08(uint64_t a1)
{
  qword_268924B70 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625B70(uint64_t a1)
{
  qword_268924B80 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625BD8(uint64_t a1)
{
  qword_268924B90 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625C40(uint64_t a1)
{
  qword_268924BA0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237625CA8(uint64_t a1)
{
  qword_268924BB0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626014(uint64_t a1)
{
  qword_268924BC0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762607C(uint64_t a1)
{
  qword_268924BD0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376260E4(uint64_t a1)
{
  qword_268924BE0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762614C(uint64_t a1)
{
  qword_268924BF0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376261B4(uint64_t a1)
{
  qword_268924C00 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void sub_2376262AC(uint64_t a1)
{
  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", [*(id *)(a1 + 32) annotationStyle], @"is_underline");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_268924C10 = [v1 BOOLValue];
}

uint64_t sub_237626628(uint64_t a1)
{
  qword_268924C20 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626690(uint64_t a1)
{
  qword_268924C30 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376266F8(uint64_t a1)
{
  qword_268924C40 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626760(uint64_t a1)
{
  qword_268924C50 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376267C8(uint64_t a1)
{
  qword_268924C60 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626B34(uint64_t a1)
{
  qword_268924C70 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626B9C(uint64_t a1)
{
  qword_268924C80 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626C04(uint64_t a1)
{
  qword_268924C90 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626C6C(uint64_t a1)
{
  qword_268924CA0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237626CD4(uint64_t a1)
{
  qword_268924CB0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627040(uint64_t a1)
{
  qword_268924CC0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376270A8(uint64_t a1)
{
  qword_268924CD0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627110(uint64_t a1)
{
  qword_268924CE0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627178(uint64_t a1)
{
  qword_268924CF0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376271E0(uint64_t a1)
{
  qword_268924D00 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_text_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762754C(uint64_t a1)
{
  qword_268924D10 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376275B4(uint64_t a1)
{
  qword_268924D20 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762761C(uint64_t a1)
{
  qword_268924D30 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627684(uint64_t a1)
{
  qword_268924D40 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376276EC(uint64_t a1)
{
  qword_268924D50 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"highlight_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627A58(uint64_t a1)
{
  qword_268924D60 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627AC0(uint64_t a1)
{
  qword_268924D70 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627B28(uint64_t a1)
{
  qword_268924D80 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627B90(uint64_t a1)
{
  qword_268924D90 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627BF8(uint64_t a1)
{
  qword_268924DA0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_fill_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627F64(uint64_t a1)
{
  qword_268924DB0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237627FCC(uint64_t a1)
{
  qword_268924DC0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237628034(uint64_t a1)
{
  qword_268924DD0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23762809C(uint64_t a1)
{
  qword_268924DE0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237628104(uint64_t a1)
{
  qword_268924DF0 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_marker_border_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237628470(uint64_t a1)
{
  qword_268924E00 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376284D8(uint64_t a1)
{
  qword_268924E10 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237628540(uint64_t a1)
{
  qword_268924E20 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376285A8(uint64_t a1)
{
  qword_268924E30 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237628610(uint64_t a1)
{
  qword_268924E40 = +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", [*(id *)(a1 + 32) annotationStyle], @"note_sidebar_bar_color", *(unsigned int *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void sub_237628708(uint64_t a1)
{
  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", [*(id *)(a1 + 32) annotationStyle], @"is_underline");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_268924E50 = [v1 BOOLValue];
}

void sub_237628828()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v3 = [v0 objectForKey:@"note_strikethrough_color"];

  if (v3) {
    objc_msgSend(MEMORY[0x263F1C550], "im_colorWithSRGBDescription:", v3);
  }
  else {
  uint64_t v1 = [MEMORY[0x263F1C550] blackColor];
  }
  double v2 = (void *)qword_268924E60;
  qword_268924E60 = v1;
}

void sub_237628918()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v3 = [v0 objectForKey:@"note_sidebar_text_color"];

  if (v3) {
    objc_msgSend(MEMORY[0x263F1C550], "im_colorWithSRGBDescription:", v3);
  }
  else {
  uint64_t v1 = [MEMORY[0x263F1C550] blackColor];
  }
  double v2 = (void *)qword_268924E70;
  qword_268924E70 = v1;
}

uint64_t sub_237628CA0(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeGreen);
  id v3 = (void *)qword_268924E80;
  qword_268924E80 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924E80;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237628CF4(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeGreen);
  id v3 = (void *)qword_268924E90;
  qword_268924E90 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924E90;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237628D48(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeGreen);
  id v3 = (void *)qword_268924EA0;
  qword_268924EA0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924EA0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237628D9C(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeGreen);
  id v3 = (void *)qword_268924EB0;
  qword_268924EB0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924EB0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237628DF0(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeGreen);
  id v3 = (void *)qword_268924EC0;
  qword_268924EC0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924EC0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629130(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeBlue);
  id v3 = (void *)qword_268924ED0;
  qword_268924ED0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924ED0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629184(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeBlue);
  id v3 = (void *)qword_268924EE0;
  qword_268924EE0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924EE0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_2376291D8(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeBlue);
  id v3 = (void *)qword_268924EF0;
  qword_268924EF0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924EF0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_23762922C(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeBlue);
  id v3 = (void *)qword_268924F00;
  qword_268924F00 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F00;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629280(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeBlue);
  id v3 = (void *)qword_268924F10;
  qword_268924F10 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F10;

  return [v5 setPageTheme:v4];
}

uint64_t sub_2376295C0(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeYellow);
  id v3 = (void *)qword_268924F20;
  qword_268924F20 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F20;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629614(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeYellow);
  id v3 = (void *)qword_268924F30;
  qword_268924F30 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F30;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629668(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeYellow);
  id v3 = (void *)qword_268924F40;
  qword_268924F40 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F40;

  return [v5 setPageTheme:v4];
}

uint64_t sub_2376296BC(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeYellow);
  id v3 = (void *)qword_268924F50;
  qword_268924F50 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F50;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629710(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeYellow);
  id v3 = (void *)qword_268924F60;
  qword_268924F60 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F60;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629A50(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePink);
  id v3 = (void *)qword_268924F70;
  qword_268924F70 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F70;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629AA4(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePink);
  id v3 = (void *)qword_268924F80;
  qword_268924F80 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F80;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629AF8(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePink);
  id v3 = (void *)qword_268924F90;
  qword_268924F90 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924F90;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629B4C(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePink);
  id v3 = (void *)qword_268924FA0;
  qword_268924FA0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924FA0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629BA0(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePink);
  id v3 = (void *)qword_268924FB0;
  qword_268924FB0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924FB0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629EE0(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePurple);
  id v3 = (void *)qword_268924FC0;
  qword_268924FC0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924FC0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629F34(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePurple);
  id v3 = (void *)qword_268924FD0;
  qword_268924FD0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924FD0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629F88(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePurple);
  id v3 = (void *)qword_268924FE0;
  qword_268924FE0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924FE0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_237629FDC(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePurple);
  id v3 = (void *)qword_268924FF0;
  qword_268924FF0 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268924FF0;

  return [v5 setPageTheme:v4];
}

uint64_t sub_23762A030(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemePurple);
  id v3 = (void *)qword_268925000;
  qword_268925000 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268925000;

  return [v5 setPageTheme:v4];
}

uint64_t sub_23762A370(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  id v3 = (void *)qword_268925010;
  qword_268925010 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268925010;

  return [v5 setPageTheme:v4];
}

uint64_t sub_23762A3C4(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  id v3 = (void *)qword_268925020;
  qword_268925020 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268925020;

  return [v5 setPageTheme:v4];
}

uint64_t sub_23762A418(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  id v3 = (void *)qword_268925030;
  qword_268925030 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268925030;

  return [v5 setPageTheme:v4];
}

uint64_t sub_23762A46C(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  id v3 = (void *)qword_268925040;
  qword_268925040 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268925040;

  return [v5 setPageTheme:v4];
}

uint64_t sub_23762A4C0(uint64_t a1)
{
  double v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  id v3 = (void *)qword_268925050;
  qword_268925050 = (uint64_t)v2;

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  uint64_t v5 = (void *)qword_268925050;

  return [v5 setPageTheme:v4];
}

void sub_23762A9C4(uint64_t a1)
{
  double v2 = +[AKAnnotationTheme themeDescriptions];
  id v7 = [v2 objectForKey:@"highlight_text_color"];

  uint64_t v3 = [*(id *)(a1 + 32) colorForThemeItem:v7 pageTheme:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = (void *)qword_268925060;
  qword_268925060 = v3;

  if (qword_268925060)
  {
    id v5 = (id)qword_268925060;
  }
  else
  {
    id v5 = [MEMORY[0x263F1C550] blackColor];
  }
  double v6 = (void *)qword_268925060;
  qword_268925060 = (uint64_t)v5;
}

void sub_23762AA7C(uint64_t a1)
{
  double v2 = +[AKAnnotationTheme themeDescriptions];
  id v7 = [v2 objectForKey:@"highlight_text_color"];

  uint64_t v3 = [*(id *)(a1 + 32) colorForThemeItem:v7 pageTheme:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = (void *)qword_268925070;
  qword_268925070 = v3;

  if (qword_268925070)
  {
    id v5 = (id)qword_268925070;
  }
  else
  {
    id v5 = [MEMORY[0x263F1C550] blackColor];
  }
  double v6 = (void *)qword_268925070;
  qword_268925070 = (uint64_t)v5;
}

void sub_23762AB34(uint64_t a1)
{
  double v2 = +[AKAnnotationTheme themeDescriptions];
  id v7 = [v2 objectForKey:@"highlight_text_color"];

  uint64_t v3 = [*(id *)(a1 + 32) colorForThemeItem:v7 pageTheme:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = (void *)qword_268925080;
  qword_268925080 = v3;

  if (qword_268925080)
  {
    id v5 = (id)qword_268925080;
  }
  else
  {
    id v5 = [MEMORY[0x263F1C550] blackColor];
  }
  double v6 = (void *)qword_268925080;
  qword_268925080 = (uint64_t)v5;
}

void sub_23762ABEC(uint64_t a1)
{
  double v2 = +[AKAnnotationTheme themeDescriptions];
  id v7 = [v2 objectForKey:@"highlight_text_color"];

  uint64_t v3 = [*(id *)(a1 + 32) colorForThemeItem:v7 pageTheme:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = (void *)qword_268925090;
  qword_268925090 = v3;

  if (qword_268925090)
  {
    id v5 = (id)qword_268925090;
  }
  else
  {
    id v5 = [MEMORY[0x263F1C550] blackColor];
  }
  double v6 = (void *)qword_268925090;
  qword_268925090 = (uint64_t)v5;
}

void sub_23762ACA4(uint64_t a1)
{
  double v2 = +[AKAnnotationTheme themeDescriptions];
  id v7 = [v2 objectForKey:@"highlight_text_color"];

  uint64_t v3 = [*(id *)(a1 + 32) colorForThemeItem:v7 pageTheme:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = (void *)qword_2689250A0;
  qword_2689250A0 = v3;

  if (qword_2689250A0)
  {
    id v5 = (id)qword_2689250A0;
  }
  else
  {
    id v5 = [MEMORY[0x263F1C550] blackColor];
  }
  double v6 = (void *)qword_2689250A0;
  qword_2689250A0 = (uint64_t)v5;
}

void sub_23762ADA0()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v3 = [v0 objectForKey:@"note_shadow"];

  uint64_t v1 = [v3 objectForKey:@"radius"];
  [v1 floatValue];
  *(double *)&qword_2689250B0 = v2;
}

void sub_23762AE74()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v3 = [v0 objectForKey:@"note_shadow"];

  uint64_t v1 = [v3 objectForKey:@"opacity"];
  [v1 floatValue];
  *(double *)&qword_2689250C0 = v2;
}

void sub_23762AF58()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v4 = [v0 objectForKey:@"note_shadow"];

  uint64_t v1 = [v4 objectForKey:@"color"];
  if (v1) {
    objc_msgSend(MEMORY[0x263F1C550], "im_colorWithSRGBDescription:", v1);
  }
  else {
  uint64_t v2 = [MEMORY[0x263F1C550] blackColor];
  }
  id v3 = (void *)qword_2689250D0;
  qword_2689250D0 = v2;
}

void sub_23762B058()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v6 = [v0 objectForKey:@"note_shadow"];

  uint64_t v1 = [v6 objectForKey:@"offset_x"];
  uint64_t v2 = [v6 objectForKey:@"offset_y"];
  [v1 floatValue];
  *(double *)&uint64_t v4 = v3;
  [v2 floatValue];
  qword_2689250E0 = v4;
  *(double *)&qword_2689250E8 = v5;
}

void sub_23762B178()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v7 = [v0 objectForKey:@"note_font"];

  uint64_t v1 = [v7 objectForKey:@"name"];
  uint64_t v2 = [v7 objectForKey:@"size"];
  float v3 = (void *)MEMORY[0x263F1C658];
  [v2 floatValue];
  uint64_t v5 = [v3 fontWithName:v1 size:v4];
  id v6 = (void *)qword_2689250F8;
  qword_2689250F8 = v5;
}

void sub_23762B2A0()
{
  v0 = +[AKAnnotationTheme themeDescriptions];
  id v7 = [v0 objectForKey:@"note_font_table"];

  uint64_t v1 = [v7 objectForKey:@"name"];
  uint64_t v2 = [v7 objectForKey:@"size"];
  float v3 = (void *)MEMORY[0x263F1C658];
  [v2 floatValue];
  uint64_t v5 = [v3 fontWithName:v1 size:v4];
  id v6 = (void *)qword_268925108;
  qword_268925108 = v5;
}

void sub_23762B79C(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) tintColor];
  uint64_t v2 = [v4 CGColor];
  float v3 = [*(id *)(a1 + 32) layer];
  [v3 setBackgroundColor:v2];
}

void sub_23762B810(uint64_t a1)
{
  id v4 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v2 = [v4 CGColor];
  float v3 = [*(id *)(a1 + 32) layer];
  [v3 setBackgroundColor:v2];
}

uint64_t sub_23762BE88()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F08D40], sel_valueWithCGPoint_);
}

uint64_t sub_23762BE94()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F08D40], sel_valueWithCGSize_);
}

uint64_t sub_23762BEA0()
{
  return objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");
}

const CGPath *sub_23762BEB8(void *a1)
{
  CGColorSpaceRef result = (const CGPath *)[a1 CGPath];
  if (result)
  {
    return CGPathCreateMutableCopy(result);
  }
  return result;
}

void sub_23762DF7C(__IOSurface *a1)
{
  IOSurfaceDecrementUseCount(a1);

  CFRelease(a1);
}

uint64_t sub_23762E2A8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_23762E3E8(uint64_t a1, uint64_t a2)
{
  id v3 = +[AKTextAnnotationAttributeHelper font:a2 byApplyingScaleFactor:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) addObject:v3];
}

uint64_t sub_23762E570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F1C238], *(void *)(a1 + 40), a3, a4);
}

uint64_t sub_23762E8B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t sub_23762E9C8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_23762F3A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [(id)objc_opt_class() font:v7 byApplyingScaleFactor:*(double *)(a1 + 48)];

  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F1C238], v8, a3, a4);
}

void sub_23762F61C(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1C260]];
  if (!v3)
  {
    id v3 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_237630030()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 != 1) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v4;
  }
  return v7 > 768.0;
}

void sub_237630C4C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) toolPicker];
  int v3 = [v2 isVisible];

  if (v3)
  {
    double v4 = *(void **)(a1 + 32);
    [v4 _forceToolPickerVisibleForViewStateChange:0];
  }
}

void sub_237631E18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_237631E34(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[51] setAlpha:*(double *)(a1 + 40)];
  [WeakRetained[52] setAlpha:*(double *)(a1 + 40)];
}

uint64_t sub_237631EA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldUseCachedSafeAreaInsets:0];
}

void sub_237632390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 152));
  _Unwind_Resume(a1);
}

uint64_t sub_2376323D8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_2376323F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _undo:0];
  [WeakRetained _cleanupAfterUndoAlert];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_237632458(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _undoAll:0];
  [WeakRetained _cleanupAfterUndoAlert];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2376324C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_237633178(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 presentingViewController];
  BOOL v2 = v1 != 0;

  return v2;
}

uint64_t sub_2376331B8(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (v1)
  {
    if ([v1 isBeingPresented]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [v2 isBeingDismissed];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t sub_2376339AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) signaturesViewControllerContinueToCreateSignature:0];
}

void sub_2376339B8(uint64_t a1)
{
  BOOL v2 = [[AKSignaturesViewController_iOS alloc] initWithController:*(void *)(a1 + 32)];
  [(AKSignaturesViewController_iOS *)v2 setDelegate:*(void *)(a1 + 40)];
  [(AKSignaturesViewController_iOS *)v2 setPresentedInAlert:1];
  [(AKSignaturesViewController_iOS *)v2 setShowsNavigationBar:0];
  [(AKSignaturesViewController_iOS *)v2 setAllowsEdits:0];
  uint64_t v3 = [MEMORY[0x263F1C550] clearColor];
  [(AKSignaturesViewController_iOS *)v2 setTableBackgroundColor:v3];

  double v4 = +[AKAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v4 setModalPresentationStyle:7];
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = [v4 popoverPresentationController];
  [v6 setDelegate:v5];

  double v7 = [v4 popoverPresentationController];
  [v7 setPermittedArrowDirections:3];

  [v4 setContentViewController:v2];
  id v8 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v9 = +[AKController akBundle];
  double v10 = [v9 localizedStringForKey:@"Add or Remove Signature" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_237633CBC;
  v27[3] = &unk_264CDB0C0;
  v27[4] = *(void *)(a1 + 40);
  id v11 = v2;
  v28 = v11;
  int v12 = [v8 actionWithTitle:v10 style:0 handler:v27];
  [v4 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F1C3F0];
  size_t v14 = +[AKController akBundle];
  double v15 = [v14 localizedStringForKey:@"Cancel" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_237633CC8;
  v24 = &unk_264CDB0C0;
  uint64_t v25 = *(void *)(a1 + 40);
  v26 = v11;
  double v16 = v11;
  uint64_t v17 = [v13 actionWithTitle:v15 style:1 handler:&v21];
  objc_msgSend(v4, "addAction:", v17, v21, v22, v23, v24, v25);

  objc_msgSend(*(id *)(a1 + 40), "_setPopoverPresentationSource:fromSender:sourceRect:", v4, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 40) _presentViewController:v4 animated:1];
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void **)(v18 + 496);
  *(void *)(v18 + 496) = v4;
  id v20 = v4;
}

uint64_t sub_237633CBC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_signaturesViewControllerContinueToManageSignatures_);
}

uint64_t sub_237633CC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) signaturesViewControllerDidCancel:*(void *)(a1 + 40)];
}

void sub_237633D6C(uint64_t a1)
{
  [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:1];
  id v15 = [*(id *)(a1 + 32) annotationController];
  BOOL v2 = [[AKTextAttributesViewController alloc] initWithController:v15];
  [(AKTextAttributesViewController *)v2 setModalPresentationStyle:7];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = [(AKTextAttributesViewController *)v2 popoverPresentationController];
  [v4 setDelegate:v3];

  uint64_t v5 = [*(id *)(a1 + 32) _toolPickerPopoverConfiguration];
  double v6 = [v5 passthroughViews];
  double v7 = [(AKTextAttributesViewController *)v2 popoverPresentationController];
  [v7 setPassthroughViews:v6];

  id v8 = [(AKTextAttributesViewController *)v2 popoverPresentationController];
  [v8 _setShouldDisableInteractionDuringTransitions:0];

  uint64_t v9 = [*(id *)(a1 + 32) _toolPickerPopoverConfiguration];
  uint64_t v10 = [v9 permittedArrowDirections];
  id v11 = [(AKTextAttributesViewController *)v2 popoverPresentationController];
  [v11 setPermittedArrowDirections:v10];

  int v12 = [(AKTextAttributesViewController *)v2 popoverPresentationController];
  [v12 _setIgnoresKeyboardNotifications:1];

  [*(id *)(a1 + 32) _setPopoverPresentationSource:v2 fromSender:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _presentViewController:v2 animated:1];
  uint64_t v13 = *(void *)(a1 + 32);
  size_t v14 = *(void **)(v13 + 512);
  *(void *)(v13 + 512) = v2;
}

void sub_2376340A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2376340C0(uint64_t a1)
{
  [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 didDismissPopover];
}

uint64_t sub_237634118(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_237634128(uint64_t a1)
{
}

uint64_t sub_237634130(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) popoverPresentationController];
  [v2 setDelegate:0];

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  [*(id *)(a1 + 32) _clearPresentedPopoverPointers];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

void sub_237634410(uint64_t a1)
{
  [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:1];
  uint64_t v2 = objc_alloc_init(AKToolsListViewController);
  [(AKToolsListViewController *)v2 setDelegate:*(void *)(a1 + 32)];
  [(AKToolsListViewController *)v2 setModalPresentationStyle:7];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = [(AKToolsListViewController *)v2 popoverPresentationController];
  [v4 setDelegate:v3];

  uint64_t v5 = [(AKToolsListViewController *)v2 traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v6 == 2) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  double v7 = [MEMORY[0x263F1C550] whiteColor];
  }
  id v8 = [(AKToolsListViewController *)v2 popoverPresentationController];
  [v8 setBackgroundColor:v7];

  uint64_t v9 = [*(id *)(a1 + 32) _toolPickerPopoverConfiguration];
  uint64_t v10 = [v9 permittedArrowDirections];
  id v11 = [(AKToolsListViewController *)v2 popoverPresentationController];
  [v11 setPermittedArrowDirections:v10];

  int v12 = [(AKToolsListViewController *)v2 popoverPresentationController];
  [v12 _setIgnoresKeyboardNotifications:1];

  uint64_t v13 = [*(id *)(a1 + 32) _paletteView];

  if (v13)
  {
    size_t v14 = [*(id *)(a1 + 32) _toolPickerPopoverConfiguration];
    [v14 layoutSceneMargins];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = [(AKToolsListViewController *)v2 popoverPresentationController];
    objc_msgSend(v23, "setPopoverLayoutMargins:", v16, v18, v20, v22);
  }
  [*(id *)(a1 + 32) _setPopoverPresentationSource:v2 fromSender:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _presentViewController:v2 animated:1];
  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v25 = *(void **)(v24 + 536);
  *(void *)(v24 + 536) = v2;
}

void sub_2376346DC(uint64_t a1)
{
  [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:1];
  id v23 = [*(id *)(a1 + 32) annotationController];
  uint64_t v2 = [v23 currentPageController];
  uint64_t v3 = [v2 pageModelController];

  double v4 = [v3 selectedAnnotations];
  uint64_t v5 = [[AKAttributePickerViewController alloc] initWithController:v23 selectedAnnotations:v4];
  [(AKAttributePickerViewController *)v5 setDelegate:*(void *)(a1 + 32)];
  [(AKAttributePickerViewController *)v5 setModalPresentationStyle:7];
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = [(AKAttributePickerViewController *)v5 popoverPresentationController];
  [v7 setDelegate:v6];

  id v8 = [(AKAttributePickerViewController *)v5 traitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];

  if (v9 == 2) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  uint64_t v10 = [MEMORY[0x263F1C550] whiteColor];
  }
  id v11 = [(AKAttributePickerViewController *)v5 popoverPresentationController];
  [v11 setBackgroundColor:v10];

  int v12 = [*(id *)(a1 + 32) _toolPickerPopoverConfiguration];
  uint64_t v13 = [v12 permittedArrowDirections];
  size_t v14 = [(AKAttributePickerViewController *)v5 popoverPresentationController];
  [v14 setPermittedArrowDirections:v13];

  double v15 = [(AKAttributePickerViewController *)v5 popoverPresentationController];
  [v15 _setShouldDisableInteractionDuringTransitions:0];

  double v16 = [*(id *)(a1 + 32) _toolPickerPopoverConfiguration];
  double v17 = [v16 passthroughViews];
  double v18 = [(AKAttributePickerViewController *)v5 popoverPresentationController];
  [v18 setPassthroughViews:v17];

  double v19 = [(AKAttributePickerViewController *)v5 popoverPresentationController];
  [v19 _setIgnoresKeyboardNotifications:1];

  uint64_t v20 = *(void *)(a1 + 32);
  double v21 = *(void **)(v20 + 544);
  *(void *)(v20 + 544) = v5;
  double v22 = v5;

  [*(id *)(a1 + 32) _setPopoverPresentationSource:v22 fromSender:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _presentViewController:v22 animated:1];
}

uint64_t sub_237634DA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) didDismissPopoverAndRestorePalette];
}

void sub_237634F84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_237634FA0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained[62] popoverPresentationController];
  [v2 setDelegate:0];

  id v3 = WeakRetained[62];
  WeakRetained[62] = 0;

  [*(id *)(a1 + 32) didDismissPopoverAndRestorePalette];
}

void sub_2376352AC(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) annotationController];
  uint64_t v2 = [v12 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 controllerWillShowSignatureCaptureView:v12];
  }
  id v3 = [*(id *)(*(void *)(a1 + 32) + 520) popoverPresentationController];
  [v3 setDelegate:0];

  [*(id *)(*(void *)(a1 + 32) + 520) setDelegate:0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 520);
  *(void *)(v4 + 520) = 0;

  uint64_t v6 = [[AKSignatureCreationViewController_iOS alloc] initWithController:v12];
  [(AKSignatureCreationViewController_iOS *)v6 setModalTransitionStyle:0];
  [*(id *)(a1 + 32) _configureCustomDetentPresentationIfNeeded:v6];
  [(AKSignatureCreationViewController_iOS *)v6 setModalPresentationStyle:2];
  [(AKSignatureCreationViewController_iOS *)v6 setModalInPresentation:1];
  [(AKSignatureCreationViewController_iOS *)v6 setDelegate:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [(AKSignatureCreationViewController_iOS *)v6 popoverPresentationController];
  [v8 setDelegate:v7];

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 528);
  *(void *)(v9 + 528) = v6;
  id v11 = v6;

  [*(id *)(a1 + 32) _presentViewController:v11 animated:1];
}

double sub_23763552C(uint64_t a1, void *a2)
{
  [a2 maximumDetentValue];
  return v2 + -44.0;
}

uint64_t sub_237635730(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__presentImageDescriptionViewController);
}

void sub_237635738(uint64_t a1)
{
  id v3 = [[AKMinimalUserInterfaceItem alloc] initWithTag:*(void *)(a1 + 40)];
  double v2 = [*(id *)(a1 + 32) annotationController];
  [v2 performActionForSender:v3];
}

void sub_237635B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_237635B8C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained[68] popoverPresentationController];
  [v1 setDelegate:0];

  id v2 = WeakRetained[68];
  WeakRetained[68] = 0;
}

uint64_t sub_23763682C()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 executablePath];
  uint64_t v2 = [v1 containsString:@"MarkupPhotoExtension.appex/"];

  return v2;
}

void sub_237638B60(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = *MEMORY[0x263F1C268];
  uint64_t v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1C268]];
  id v11 = (void *)[v10 mutableCopy];

  [v11 setTabStops:MEMORY[0x263EFFA68]];
  [v8 setObject:v11 forKeyedSubscript:v9];
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v24 = a1;
  if (qword_268925118 != -1) {
    dispatch_once(&qword_268925118, &unk_26EA57558);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = (id)qword_268925110;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        double v18 = [v7 objectForKeyedSubscript:v17];
        if (v18)
        {
          double v19 = v18;
          uint64_t v20 = [v18 colorUsingSRGBColorSpace];

          [v8 setObject:v20 forKeyedSubscript:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  uint64_t v21 = *MEMORY[0x263F1C260];
  double v22 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1C260]];
  uint64_t v23 = *MEMORY[0x263F1C238];
  if (!v22)
  {
    double v22 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
  }
  [v8 setObject:v22 forKeyedSubscript:v23];
  [v8 removeObjectForKey:v21];
  objc_msgSend(*(id *)(v24 + 32), "setAttributes:range:", v8, v25, v26);
}

void sub_237638DB4()
{
  v5[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1C210];
  v5[0] = *MEMORY[0x263F1C240];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263F1C2D0];
  v5[2] = *MEMORY[0x263F1C2A0];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x263F1C218];
  v5[4] = *MEMORY[0x263F1C290];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:6];
  uint64_t v4 = (void *)qword_268925110;
  qword_268925110 = v3;
}

void sub_237639268(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_237639284(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_23763ACD0(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 candidatePickerView];
  id v4 = [v2 superview];

  uint64_t v3 = [v1 candidatePickerView];
  [v3 removeFromSuperview];

  [v1 setCandidatePickerView:0];
  [v4 updateConstraintsIfNeeded];
}

void sub_23763C2D4(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  id v11 = a1;
  double v12 = a6 * 3.14159265 / 180.0;
  id v21 = v11;
  if (v12 > 0.785398163)
  {
    char v13 = 0;
    do
    {
      double v12 = v12 + -1.57079633;
      ++v13;
    }
    while (v12 > 0.785398163);
    if (v13)
    {
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.width = a4;
      v23.size.height = a5;
      double Height = CGRectGetHeight(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.width = a4;
      v24.size.height = a5;
      double Width = CGRectGetWidth(v24);
      v25.origin.x = a2;
      v25.origin.y = a3;
      v25.size.width = a4;
      v25.size.height = a5;
      double MidX = CGRectGetMidX(v25);
      v26.origin.x = a2;
      v26.origin.y = a3;
      v26.size.width = a4;
      v26.size.height = a5;
      +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", Height, Width, MidX, CGRectGetMidY(v26));
      id v11 = v21;
      a2 = v17;
      a3 = v18;
      a4 = v19;
      a5 = v20;
    }
  }
  objc_msgSend(v11, "setRectangle:", a2, a3, a4, a5);
  [v21 setRotationAngle:v12];
}

void sub_23763D49C(uint64_t a1, uint64_t a2, void *a3, int a4, float64x2_t *a5, void *a6, void *a7, double a8, double a9, double a10, double a11)
{
  id v32 = a3;
  id v21 = a7;
  id v22 = a6;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", a2, a8, a9, a10, a11);
  if (a4)
  {
    float64x2_t v31 = vaddq_f64(a5[2], vmlaq_n_f64(vmulq_n_f64(a5[1], v24), *a5, v23));
    CGRect v25 = [v32 geometryHelper];
    [v25 screenPixelAlignedPointForPoint:*(_OWORD *)&v31];
    long long v30 = v27;
    v31.f64[0] = v26;

    double v24 = *(double *)&v30;
    double v23 = v31.f64[0];
  }
  long long v28 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v23, v24, v30);
  [v22 addObject:v28];

  long long v29 = [NSNumber numberWithUnsignedInteger:a1];
  [v21 addObject:v29];
}

id sub_23763DE40(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingLeadingCharactersInSet:v2];

  return v3;
}

id sub_23763DEA0(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingTrailingCharactersInSet:v2];

  return v3;
}

id sub_23763DF00(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingLeadingCharactersInSet:v2];

  return v3;
}

id sub_23763DF60(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingTrailingCharactersInSet:v2];

  return v3;
}

id sub_23763DFC0(void *a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [a1 length];
  MEMORY[0x270FA5388]();
  id v7 = (char *)v11 - v6;
  objc_msgSend(a1, "getCharacters:range:", (char *)v11 - v6, 0, v5);
  uint64_t v8 = 0;
  if (v5)
  {
    while ([v4 characterIsMember:*(unsigned __int16 *)&v7[2 * v8]])
    {
      if (v5 == ++v8)
      {
        uint64_t v8 = v5;
        break;
      }
    }
  }
  uint64_t v9 = objc_msgSend(a1, "substringWithRange:", v8, v5 - v8);

  return v9;
}

id sub_23763E0D4(void *a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [a1 length];
  MEMORY[0x270FA5388]();
  id v7 = (char *)v12 - v6;
  objc_msgSend(a1, "getCharacters:range:", (char *)v12 - v6, 0, v5);
  uint64_t v8 = v7 - 2;
  do
  {
    uint64_t v9 = v5;
    if (!v5) {
      break;
    }
    --v5;
  }
  while (([v4 characterIsMember:*(unsigned __int16 *)&v8[2 * v9]] & 1) != 0);
  uint64_t v10 = objc_msgSend(a1, "substringWithRange:", 0, v9);

  return v10;
}

id sub_23763E1E0(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v3 = [a1 componentsSeparatedByCharactersInSet:v2];

  id v4 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = sub_23763E330;
  v11[3] = &unk_264CDB228;
  id v12 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v11];
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_23763E388;
  v9[3] = &unk_264CDB228;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

void sub_23763E330(uint64_t a1, void *a2)
{
  id v3 = [a2 stringByTrimmingTrailingWhitespace];
  [*(id *)(a1 + 32) addObject:v3];
}

void sub_23763E388(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  [*(id *)(a1 + 32) appendString:v3];
}

__CFString *sub_23763E3F4(void *a1)
{
  if (([a1 isEqualToString:@"."] & 1) != 0
    || ([a1 isEqualToString:@".."] & 1) != 0)
  {
    uint64_t v2 = &stru_26EA57918;
  }
  else
  {
    uint64_t v2 = a1;
  }

  return v2;
}

void sub_237640D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) convertFont:a2];
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F1C238], v7, a3, a4);
}

void sub_237640E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) convertTextAttributes:a2];
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v7, a3, a4);
}

void sub_237640E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = +[AKTextAnnotationAttributeHelper font:a2 byApplyingScaleFactor:*(double *)(a1 + 48)];
  uint64_t v8 = [*(id *)(a1 + 32) convertFont:v7];
  id v9 = +[AKTextAnnotationAttributeHelper font:v8 byApplyingScaleFactor:*(double *)(a1 + 56)];

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F1C238], v9, a3, a4);
}

void sub_237640F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) convertTextAttributes:a2];
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v7, a3, a4);
}

void sub_237642C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_237642CD4(uint64_t a1)
{
  [*(id *)(a1 + 32) _askAnnotationControllerDelegateToEnterFullScreen:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 becomeFirstResponder];
}

Class sub_237642E28(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_268925128)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = sub_237642F6C;
    v4[4] = &unk_264CDADD0;
    v4[5] = v4;
    long long v5 = xmmword_264CDB2C8;
    uint64_t v6 = 0;
    qword_268925128 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_268925128)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AXSSImageDescriptionViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_2376DA250();
LABEL_8:
    free(v2);
  }
  qword_268925120 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_237642F6C()
{
  uint64_t result = _sl_dlopen();
  qword_268925128 = result;
  return result;
}

double sub_2376468EC(void *a1)
{
  uint64_t v2 = [a1 view];
  [a1 locationInView:v2];
  double v4 = v3;
  double v6 = v5;

  uint64_t v7 = [a1 view];
  objc_msgSend(v7, "convertPoint:toView:", 0, v4, v6);
  double v9 = v8;

  return v9;
}

void sub_237646A08(CGContextRef c, CGFloat a2)
{
  if (a2 == 0.0)
  {
    NSLog(&cfstr_BogusLinewidth.isa);
    CGContextGetCTM(&v3, c);
    CGAffineTransformInvert(&v4, &v3);
    a2 = v4.a + v4.c;
  }
  CGContextSetLineWidth(c, a2);
}

void sub_237646CAC(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v15 = v3;
  switch(*(_DWORD *)a2)
  {
    case 0:
      objc_msgSend(v3, "moveToPoint:", **(double **)(a2 + 8), *(double *)(*(void *)(a2 + 8) + 8));
      goto LABEL_8;
    case 1:
      objc_msgSend(v3, "lineToPoint:", **(double **)(a2 + 8), *(double *)(*(void *)(a2 + 8) + 8));
      goto LABEL_8;
    case 2:
      [v3 currentPoint];
      CGAffineTransform v4 = *(double **)(a2 + 8);
      double v5 = v4[1];
      double v7 = v6 * 0.33333 + *v4 * 0.66667;
      double v9 = v8 * 0.33333 + v5 * 0.66667;
      double v10 = v4[2] * 0.33333 + *v4 * 0.66667;
      double v11 = v4[3] * 0.33333 + v5 * 0.66667;
      id v3 = v15;
      double v12 = v4[2];
      double v13 = v4[3];
      goto LABEL_6;
    case 3:
      uint64_t v14 = *(double **)(a2 + 8);
      double v12 = v14[4];
      double v13 = v14[5];
      double v7 = *v14;
      double v9 = v14[1];
      double v10 = v14[2];
      double v11 = v14[3];
LABEL_6:
      objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v12, v13, v7, v9, v10, v11);
      goto LABEL_8;
    case 4:
      [v3 closePath];
LABEL_8:
      id v3 = v15;
      break;
    default:
      break;
  }
}

void sub_2376479DC(void *a1, CGContext *a2)
{
  double v7 = a1;
  uint64_t v3 = v7[1];
  if (v3 >= 1)
  {
    unint64_t v4 = v7[3];
    unint64_t v5 = v4 + 24 * v3;
    double v6 = (CGFloat *)v7[7];
    do
    {
      switch(*(_DWORD *)v4 & 0xF)
      {
        case 0:
          CGContextMoveToPoint(a2, *(CGFloat *)(v4 + 8), *(CGFloat *)(v4 + 16));
          break;
        case 1:
          CGContextAddLineToPoint(a2, *(CGFloat *)(v4 + 8), *(CGFloat *)(v4 + 16));
          break;
        case 2:
          CGContextAddCurveToPoint(a2, *v6, v6[1], v6[2], v6[3], *(CGFloat *)(v4 + 8), *(CGFloat *)(v4 + 16));
          v6 += 4;
          break;
        case 3:
          CGContextClosePath(a2);
          break;
        default:
          break;
      }
      v4 += 24;
    }
    while (v4 < v5);
  }
}

void sub_23764AC08(uint64_t a1, float *a2)
{
  uint64_t v4 = 0;
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v5 = *(double *)a1;
  double v6 = *(double *)(a1 + 8);
  float v7 = 0.0;
  double v8 = v6;
  double v9 = *(double *)a1;
  do
  {
    double v10 = *(double *)(a1 + v4 + 16);
    double v11 = *(double *)(a1 + v4 + 24);
    float v7 = sub_237684644(v9, v8, v10, v11) + v7;
    v4 += 16;
    double v8 = v11;
    double v9 = v10;
  }
  while (v4 != 48);
  float v12 = sub_237684644(v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if ((float)(v7 - v12) <= 0.1)
  {
    *a2 = *a2 + v7;
  }
  else
  {
    long long v13 = *(_OWORD *)(a1 + 16);
    v35[0] = *(_OWORD *)a1;
    v35[1] = v13;
    long long v14 = *(_OWORD *)(a1 + 48);
    v35[2] = *(_OWORD *)(a1 + 32);
    v35[3] = v14;
    uint64_t v15 = 3;
    uint64_t v16 = 1;
    __asm { FMOV            V0.2D, #0.5 }
    id v22 = v35;
    do
    {
      uint64_t v23 = 0;
      float64x2_t v24 = (float64x2_t)v35[4 * v16 - 4];
      do
      {
        CGRect v25 = (float64x2_t *)&v22[v23];
        float64x2_t v26 = v25[1];
        v25[4] = vmlaq_f64(vmulq_f64(v26, _Q0), _Q0, v24);
        ++v23;
        float64x2_t v24 = v26;
      }
      while (v15 != v23);
      ++v16;
      --v15;
      v22 += 4;
    }
    while (v16 != 4);
    uint64_t v27 = 0;
    long long v28 = v35;
    do
    {
      long long v29 = *v28;
      v28 += 4;
      *(_OWORD *)&v34[v27] = v29;
      v27 += 16;
    }
    while (v27 != 64);
    long long v30 = v33;
    uint64_t v31 = 3;
    uint64_t v32 = 12;
    do
    {
      *v30++ = v35[v32];
      --v31;
      v32 -= 3;
    }
    while (v31 != -1);
    sub_23764AC08(v34, a2);
    sub_23764AC08(v33, a2);
  }
}

void sub_23764BC18(uint64_t a1, void *a2, int a3, float64x2_t *a4, void *a5, void *a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v34 = a2;
  id v23 = a6;
  id v24 = a5;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v34, a7, a8, a9, a10, a11, a12);
  if (a3)
  {
    float64x2_t v33 = vaddq_f64(a4[2], vmlaq_n_f64(vmulq_n_f64(a4[1], v26), *a4, v25));
    uint64_t v27 = [v34 geometryHelper];
    [v27 screenPixelAlignedPointForPoint:*(_OWORD *)&v33];
    long long v32 = v29;
    v33.f64[0] = v28;

    double v26 = *(double *)&v32;
    double v25 = v33.f64[0];
  }
  long long v30 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v25, v26, v32);
  [v24 addObject:v30];

  uint64_t v31 = [NSNumber numberWithUnsignedInteger:a1];
  [v23 addObject:v31];
}

id sub_23764D640(uint64_t a1)
{
  id v1 = [MEMORY[0x263F1C6B0] systemImageNamed:a1];
  uint64_t v2 = [MEMORY[0x263F1C6C8] configurationWithScale:3];
  uint64_t v3 = [v1 imageByApplyingSymbolConfiguration:v2];

  uint64_t v4 = [v3 configuration];
  double v5 = [v4 _configurationIgnoringDynamicType];
  double v6 = [v3 imageWithConfiguration:v5];

  return v6;
}

void *sub_23764DFC0(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_268925160)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = sub_23764E100;
    v5[4] = &unk_264CDADD0;
    v5[5] = v5;
    long long v6 = xmmword_264CDB360;
    uint64_t v7 = 0;
    qword_268925160 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_268925160;
    if (qword_268925160)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_268925160;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268925158 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23764E100()
{
  uint64_t result = _sl_dlopen();
  qword_268925160 = result;
  return result;
}

void sub_23764EA54(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"AKPeripheralAvailabilityManagerAvailabilityNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void sub_23764EC4C(void *a1, int a2)
{
  id v5 = a1;
  uint64_t v3 = [v5 currentAvailability];
  if (a2)
  {
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v4 = 0;
  }
  else
  {
    if (v3 == 1) {
      goto LABEL_7;
    }
    uint64_t v4 = 1;
  }
  [v5 setCurrentAvailability:v4];
  [v5 postConnectionStatusNotification];
LABEL_7:
}

void sub_23764ECC0(void *a1)
{
  id v1 = a1;
  if ([v1 currentAvailability])
  {
    [v1 setCurrentAvailability:0];
    [v1 postConnectionStatusNotification];
  }
}

void sub_2376501B8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) signatureView];
  [v1 setAlpha:0.0];
}

void sub_237650200(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) signatureView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) signatureView];
  [v3 clear];
}

uint64_t sub_2376504C0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) signatureView];
    [v2 setAlpha:0.0];
  }
  uint64_t v3 = [*(id *)(a1 + 40) verticalSizeClass];
  double v4 = 288.0;
  if (v3 != 1) {
    double v4 = 388.0;
  }
  id v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "setPreferredContentSize:", 540.0, v4);
}

void sub_237650540(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) signatureView];
    [v2 setAlpha:1.0];

    id v3 = [*(id *)(a1 + 32) signatureView];
    [v3 clear];
  }
}

uint64_t sub_23765081C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__notifyDidDismiss);
}

uint64_t sub_237650AA0(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__notifyDidDismiss);
}

void sub_237651014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v11 - 136));
  objc_destroyWeak((id *)(v11 - 128));
  _Unwind_Resume(a1);
}

void sub_23765107C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateSignatureDescriptionWithStringValue:*(void *)(a1 + 32)];
}

void sub_2376510CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_237651198;
  v5[3] = &unk_264CDB1F8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:v5];

  objc_destroyWeak(&v6);
}

void sub_237651184(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_237651198(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showEditCustomDescriptionAlert];
}

void sub_2376511D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2376512A4;
  v5[3] = &unk_264CDB1F8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:v5];

  objc_destroyWeak(&v6);
}

void sub_237651290(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2376512A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeSignatureDescription];
}

void sub_2376515DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 112));
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_237651634(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = +[AKController akBundle];
  double v4 = [v3 localizedStringForKey:@"Label" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  [v8 setPlaceholder:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained && [WeakRetained descriptionTag] == -1)
  {
    uint64_t v7 = [v6 customDescription];
    [v8 setText:v7];
  }
}

void sub_237651710(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_237651758(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = [WeakRetained textFields];
    double v4 = [v3 firstObject];
    uint64_t v5 = [v4 text];

    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    [v6 _updateSignatureDescriptionWithStringValue:v5];

    [v7 dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v7;
  }
}

void sub_23765506C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_237655090(uint64_t a1, double *a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained interfaceScale];
  if (a3)
  {
    uint64_t v5 = a3;
    do
    {
      if (COERCE_FLOAT(*((void *)a2 + 1)) > 0.00001)
      {
        double v8 = *a2;
        id v6 = [WeakRetained bitmapFifo];
        [v6 addPoint:v8];
      }
      a2 += 2;
      --v5;
    }
    while (v5);
  }
  objc_msgSend(WeakRetained, "setTotalPointsAdded:", objc_msgSend(WeakRetained, "totalPointsAdded") + a3);
}

void sub_2376559AC(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 432) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplayInRect:", *(double *)(*(void *)(a1 + 32) + 440), *(double *)(*(void *)(a1 + 32) + 448), *(double *)(*(void *)(a1 + 32) + 456), *(double *)(*(void *)(a1 + 32) + 464));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 576));
  [WeakRetained signatureViewSignatureUpdated:*(void *)(a1 + 32)];
}

uint64_t sub_237655B0C(uint64_t a1)
{
  [*(id *)(a1 + 32) minPressure];
  qword_268925168 = v2;
  [*(id *)(a1 + 32) maxPressure];
  qword_268925170 = v3;
  [*(id *)(a1 + 32) minThickness];
  qword_268925178 = v4;
  uint64_t result = [*(id *)(a1 + 32) maxThickness];
  qword_268925180 = v6;
  return result;
}

void sub_23765652C()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  id v1 = +[AKController akBundleIdentifier];
  id v3 = (id)[v0 initWithSuiteName:v1];

  if (v3)
  {
    uint64_t v2 = [v3 objectForKey:@"AKLegacyDoodlesEnabled"];

    if (v2) {
      byte_268925190 = [v3 BOOLForKey:@"AKLegacyDoodlesEnabled"];
    }
  }
}

uint64_t sub_237658704(uint64_t a1)
{
  return [*(id *)(a1 + 32) revalidateItems];
}

void sub_237658C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_237658C90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _undoButtonAction:0];
}

void sub_237658CD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _undoAllButtonAction:0];
}

uint64_t sub_237658F34(uint64_t a1)
{
  return [*(id *)(a1 + 32) signaturesViewControllerContinueToCreateSignature:0];
}

void sub_237658F40(uint64_t a1)
{
  uint64_t v2 = [[AKSignaturesViewController_iOS alloc] initWithController:*(void *)(a1 + 32)];
  [(AKSignaturesViewController_iOS *)v2 setDelegate:*(void *)(a1 + 40)];
  [(AKSignaturesViewController_iOS *)v2 setPresentedInAlert:1];
  [(AKSignaturesViewController_iOS *)v2 setShowsNavigationBar:0];
  [(AKSignaturesViewController_iOS *)v2 setAllowsEdits:0];
  id v3 = [MEMORY[0x263F1C550] clearColor];
  [(AKSignaturesViewController_iOS *)v2 setTableBackgroundColor:v3];

  uint64_t v4 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
  [*(id *)(a1 + 40) setSignaturesAlertController:v4];

  uint64_t v5 = [*(id *)(a1 + 40) signaturesAlertController];
  [v5 setModalPresentationStyle:7];

  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [v6 signaturesAlertController];
  double v8 = [v7 popoverPresentationController];
  [v8 setDelegate:v6];

  double v9 = [*(id *)(a1 + 40) signaturesAlertController];
  double v10 = [v9 popoverPresentationController];
  [v10 setPermittedArrowDirections:3];

  uint64_t v11 = [*(id *)(a1 + 40) signatureButton];
  float v12 = [v11 customView];

  long long v13 = [*(id *)(a1 + 40) signatureButton];
  long long v14 = v13;
  if (v12)
  {
    uint64_t v15 = [v13 customView];
    uint64_t v16 = [*(id *)(a1 + 40) signaturesAlertController];
    double v17 = [v16 popoverPresentationController];
    [v17 setSourceView:v15];

    long long v14 = [*(id *)(a1 + 40) signatureButton];
    double v18 = [v14 customView];
    [v18 bounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    uint64_t v27 = [*(id *)(a1 + 40) signaturesAlertController];
    float64_t v28 = [v27 popoverPresentationController];
    objc_msgSend(v28, "setSourceRect:", v20, v22, v24, v26);
  }
  else
  {
    double v18 = [*(id *)(a1 + 40) signaturesAlertController];
    uint64_t v27 = [v18 popoverPresentationController];
    [v27 setBarButtonItem:v14];
  }

  long long v29 = [*(id *)(a1 + 40) signaturesAlertController];
  [v29 setContentViewController:v2];

  long long v30 = [*(id *)(a1 + 40) signaturesAlertController];
  uint64_t v31 = (void *)MEMORY[0x263F1C3F0];
  long long v32 = +[AKController akBundle];
  float64x2_t v33 = [v32 localizedStringForKey:@"Add or Remove Signature" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = sub_2376594B0;
  v56[3] = &unk_264CDB0C0;
  v56[4] = *(void *)(a1 + 40);
  id v34 = v2;
  v57 = v34;
  v35 = [v31 actionWithTitle:v33 style:0 handler:v56];
  [v30 addAction:v35];

  uint64_t v36 = [*(id *)(a1 + 40) signaturesAlertController];
  v37 = (void *)MEMORY[0x263F1C3F0];
  v38 = +[AKController akBundle];
  v39 = [v38 localizedStringForKey:@"Draw a Signature" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = sub_2376594BC;
  v54[3] = &unk_264CDB0C0;
  v54[4] = *(void *)(a1 + 40);
  v40 = v34;
  v55 = v40;
  v41 = [v37 actionWithTitle:v39 style:0 handler:v54];
  [v36 addAction:v41];

  v42 = [*(id *)(a1 + 40) signaturesAlertController];
  v43 = (void *)MEMORY[0x263F1C3F0];
  v44 = +[AKController akBundle];
  v45 = [v44 localizedStringForKey:@"Cancel" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = sub_2376594C8;
  v52[3] = &unk_264CDB0C0;
  v52[4] = *(void *)(a1 + 40);
  v53 = v40;
  v46 = v40;
  v47 = [v43 actionWithTitle:v45 style:1 handler:v52];
  [v42 addAction:v47];

  v48 = *(void **)(a1 + 40);
  v49 = [v48 signaturesAlertController];
  [v48 presentViewController:v49 animated:1 completion:0];

  v50 = *(void **)(a1 + 40);
  v51 = [v50 signaturesAlertController];
  [v50 _setupPassthroughViewsForViewController:v51];
}

uint64_t sub_2376594B0(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_signaturesViewControllerContinueToManageSignatures_);
}

uint64_t sub_2376594BC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_signaturesViewControllerEnterSignatureMode_);
}

uint64_t sub_2376594C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) signaturesViewControllerDidCancel:*(void *)(a1 + 40)];
}

void sub_237659568(uint64_t a1)
{
  [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:1];
  id v31 = [*(id *)(a1 + 32) controller];
  uint64_t v2 = [[AKLineStylesViewController alloc] initWithController:v31];
  [*(id *)(a1 + 32) setLineStylesViewController:v2];

  id v3 = [*(id *)(a1 + 32) lineStylesViewController];
  [v3 setModalPresentationStyle:7];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 lineStylesViewController];
  uint64_t v6 = [v5 popoverPresentationController];
  [v6 setDelegate:v4];

  id v7 = [*(id *)(a1 + 32) lineStylesViewController];
  double v8 = [v7 popoverPresentationController];
  [v8 setPermittedArrowDirections:3];

  double v9 = [*(id *)(a1 + 32) lineStyleButton];
  double v10 = [v9 customView];

  uint64_t v11 = [*(id *)(a1 + 32) lineStyleButton];
  float v12 = v11;
  if (v10)
  {
    long long v13 = [v11 customView];
    long long v14 = [*(id *)(a1 + 32) lineStylesViewController];
    uint64_t v15 = [v14 popoverPresentationController];
    [v15 setSourceView:v13];

    float v12 = [*(id *)(a1 + 32) lineStyleButton];
    uint64_t v16 = [v12 customView];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [*(id *)(a1 + 32) lineStylesViewController];
    double v26 = [v25 popoverPresentationController];
    objc_msgSend(v26, "setSourceRect:", v18, v20, v22, v24);
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) lineStylesViewController];
    double v25 = [v16 popoverPresentationController];
    [v25 setBarButtonItem:v12];
  }

  uint64_t v27 = *(void **)(a1 + 32);
  float64_t v28 = [v27 lineStylesViewController];
  [v27 presentViewController:v28 animated:1 completion:0];

  long long v29 = *(void **)(a1 + 32);
  long long v30 = [v29 lineStylesViewController];
  [v29 _setupPassthroughViewsForViewController:v30];
}

void sub_23765987C(uint64_t a1)
{
  [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:1];
  id v31 = [*(id *)(a1 + 32) controller];
  uint64_t v2 = [[AKTextAttributesViewController alloc] initWithController:v31];
  [*(id *)(a1 + 32) setTextAttributesViewController:v2];

  id v3 = [*(id *)(a1 + 32) textAttributesViewController];
  [v3 setModalPresentationStyle:7];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 textAttributesViewController];
  uint64_t v6 = [v5 popoverPresentationController];
  [v6 setDelegate:v4];

  id v7 = [*(id *)(a1 + 32) textAttributesViewController];
  double v8 = [v7 popoverPresentationController];
  [v8 setPermittedArrowDirections:3];

  double v9 = [*(id *)(a1 + 32) textStyleButton];
  double v10 = [v9 customView];

  uint64_t v11 = [*(id *)(a1 + 32) textStyleButton];
  float v12 = v11;
  if (v10)
  {
    long long v13 = [v11 customView];
    long long v14 = [*(id *)(a1 + 32) textAttributesViewController];
    uint64_t v15 = [v14 popoverPresentationController];
    [v15 setSourceView:v13];

    float v12 = [*(id *)(a1 + 32) textStyleButton];
    uint64_t v16 = [v12 customView];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [*(id *)(a1 + 32) textAttributesViewController];
    double v26 = [v25 popoverPresentationController];
    objc_msgSend(v26, "setSourceRect:", v18, v20, v22, v24);
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) textAttributesViewController];
    double v25 = [v16 popoverPresentationController];
    [v25 setBarButtonItem:v12];
  }

  uint64_t v27 = *(void **)(a1 + 32);
  float64_t v28 = [v27 textAttributesViewController];
  [v27 presentViewController:v28 animated:1 completion:0];

  long long v29 = *(void **)(a1 + 32);
  long long v30 = [v29 textAttributesViewController];
  [v29 _setupPassthroughViewsForViewController:v30];
}

void sub_237659B90(uint64_t a1)
{
  [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:1];
  id v34 = [*(id *)(a1 + 32) controller];
  uint64_t v2 = [[AKColorPickerViewController alloc] initWithController:v34];
  [*(id *)(a1 + 32) setColorPickerPopoverViewController:v2];

  id v3 = [*(id *)(a1 + 32) colorPickerPopoverViewController];
  [v3 setModalPresentationStyle:7];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 colorPickerPopoverViewController];
  uint64_t v6 = [v5 popoverPresentationController];
  [v6 setDelegate:v4];

  id v7 = [*(id *)(a1 + 32) colorPickerPopoverViewController];
  double v8 = [v7 popoverPresentationController];
  [v8 setPermittedArrowDirections:3];

  double v9 = [*(id *)(a1 + 32) strokeColorButton];
  double v10 = [v9 customView];

  uint64_t v11 = [*(id *)(a1 + 32) strokeColorButton];
  float v12 = v11;
  if (v10)
  {
    long long v13 = [v11 customView];
    long long v14 = [*(id *)(a1 + 32) colorPickerPopoverViewController];
    uint64_t v15 = [v14 popoverPresentationController];
    [v15 setSourceView:v13];

    float v12 = [*(id *)(a1 + 32) strokeColorButton];
    uint64_t v16 = [v12 customView];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [*(id *)(a1 + 32) colorPickerPopoverViewController];
    double v26 = [v25 popoverPresentationController];
    objc_msgSend(v26, "setSourceRect:", v18, v20, v22, v24);
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) colorPickerPopoverViewController];
    double v25 = [v16 popoverPresentationController];
    [v25 setBarButtonItem:v12];
  }

  uint64_t v27 = [*(id *)(a1 + 32) _attributeTagForCurrentSelectionState];
  float64_t v28 = [*(id *)(a1 + 32) colorPickerPopoverViewController];
  [v28 setColorAttributeTag:v27];

  [*(id *)(a1 + 32) syncUIToSelectedColor];
  long long v29 = *(void **)(a1 + 32);
  long long v30 = [v29 colorPickerPopoverViewController];
  [v29 presentViewController:v30 animated:1 completion:0];

  id v31 = [*(id *)(a1 + 32) colorPickerPopoverViewController];
  [v31 addObserver:*(void *)(a1 + 32) forKeyPath:@"color" options:1 context:0];

  long long v32 = *(void **)(a1 + 32);
  float64x2_t v33 = [v32 colorPickerPopoverViewController];
  [v32 _setupPassthroughViewsForViewController:v33];
}

void sub_23765AB68(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attributeToolbarViewControllerConstraint];
  [v2 setConstant:0.0];

  [*(id *)(a1 + 40) layoutIfNeeded];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"AKAttributeToolbarDidShowNotification" object:*(void *)(a1 + 48)];
}

uint64_t sub_23765AD34(uint64_t a1)
{
  [*(id *)(a1 + 40) frame];
  double Height = CGRectGetHeight(v7);
  id v3 = [*(id *)(a1 + 32) attributeToolbarViewControllerConstraint];
  [v3 setConstant:Height];

  uint64_t v4 = *(void **)(a1 + 48);

  return [v4 layoutIfNeeded];
}

uint64_t sub_23765AD9C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attributeToolbarViewController];
  id v3 = [v2 view];
  [v3 removeFromSuperview];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setAttributeToolbarViewController:0];
}

void sub_23765B928(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) controller];
  uint64_t v2 = [v10 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 controllerWillShowSignatureCaptureView:v10];
  }
  id v3 = [*(id *)(a1 + 32) signaturesSheetViewController];
  uint64_t v4 = [v3 popoverPresentationController];
  [v4 setDelegate:0];

  uint64_t v5 = [*(id *)(a1 + 32) signaturesSheetViewController];
  [v5 setDelegate:0];

  [*(id *)(a1 + 32) setSignaturesSheetViewController:0];
  uint64_t v6 = [[AKSignatureCreationViewController_iOS alloc] initWithController:v10];
  [(AKSignatureCreationViewController_iOS *)v6 setModalTransitionStyle:0];
  CGRect v7 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v7 userInterfaceIdiom] == 1) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 5;
  }
  [(AKSignatureCreationViewController_iOS *)v6 setModalPresentationStyle:v8];

  [(AKSignatureCreationViewController_iOS *)v6 setDelegate:*(void *)(a1 + 32)];
  [(AKSignatureCreationViewController_iOS *)v6 setModalInPresentation:1];
  double v9 = [v10 toolPicker];
  [v9 setVisible:0 forFirstResponder:v6];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void sub_23765E1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,id a22,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  objc_destroyWeak(&a22);
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v26 - 104));
  _Unwind_Resume(a1);
}

void sub_23765E1F4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v2 = objc_loadWeakRetained(a1 + 6);
  id v3 = objc_loadWeakRetained(a1 + 7);
  id v4 = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained && v2 && v3 && v4)
  {
    uint64_t v5 = objc_alloc_init(AKInkAnnotation2);
    [a1[4] bounds];
    objc_msgSend(WeakRetained, "_convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:", v3, v2);
    -[AKInkAnnotation setRectangle:](v5, "setRectangle:");
    uint64_t v6 = (void *)[a1[4] copy];
    [(AKInkAnnotation *)v5 setDrawing:v6];

    [v2 modelBaseScaleFactor];
    -[AKAnnotation setOriginalModelBaseScaleFactor:](v5, "setOriginalModelBaseScaleFactor:");
    [(AKAnnotation *)v5 setOriginalExifOrientation:1];
    CGRect v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "currentModelToScreenExifOrientation"));
    objc_setAssociatedObject(v5, @"com.apple.AnnotationKit.AnnotationImageHelperAdditionalExifHintKey", v7, (void *)0x301);

    [WeakRetained setIgnoreAnnotationAndSelectionKVO:1];
    uint64_t v8 = [a1[4] CHDrawing];
    double v9 = [WeakRetained _convertCHDrawing:v8 fromDrawingInCanvasView:v3 toInkOverlayView:v4];
    [v9 bounds];
    double x = v19.origin.x;
    double y = v19.origin.y;
    double width = v19.size.width;
    double height = v19.size.height;
    double MidX = CGRectGetMidX(v19);
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    double MidY = CGRectGetMidY(v20);
    uint64_t v16 = [WeakRetained shapeDetectionController];
    objc_msgSend(v16, "performRecognitionOnDrawing:withDrawing:annotation:boundsInInputView:center:", v9, a1[4], v5, x, y, width, height, MidX, MidY);

    [WeakRetained setIgnoreAnnotationAndSelectionKVO:0];
  }
}

double sub_23765F600(void *a1)
{
  [a1 bounds];
  double v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id v10 = [a1 akEnclosingScrollView];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 bounds];
    objc_msgSend(v11, "convertRect:toView:", a1);
    v18.origin.double x = v12;
    v18.origin.double y = v13;
    v18.size.double width = v14;
    v18.size.double height = v15;
    v17.origin.double x = v3;
    v17.origin.double y = v5;
    v17.size.double width = v7;
    v17.size.double height = v9;
    *(void *)&double v3 = (unint64_t)CGRectIntersection(v17, v18);
  }

  return v3;
}

id sub_23765F6B4(void *a1)
{
  id v1 = a1;
  do
  {
    double v2 = v1;
    id v1 = [v1 superview];

    if (!v1) {
      break;
    }
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);

  return v1;
}

id sub_2376639DC(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.97;
  }
  if (a3) {
    double v4 = 0.5;
  }
  else {
    double v4 = -1.0;
  }
  CGFloat v5 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:v3];
  double v6 = [MEMORY[0x263F14B48] inkWithIdentifier:*MEMORY[0x263F14CA8] color:v5 weight:v4];

  return v6;
}

id sub_237663A80(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  CGFloat v7 = (void *)MEMORY[0x263F14B48];
  id v8 = a5;
  id v9 = a4;
  [v7 inkWeightFromAKValue:a1];
  id v10 = objc_msgSend(MEMORY[0x263F14B48], "inkWithIdentifier:color:weight:", v9, v8);

  return v10;
}

id sub_237663B0C(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  CGFloat v5 = (void *)MEMORY[0x263F14B48];
  id v6 = a4;
  CGFloat v7 = [v6 color];
  id v8 = [v5 inkFromInk:v6 color:v7];

  [MEMORY[0x263F14B48] inkWeightFromAKValue:a1];
  objc_msgSend(v8, "setWeight:");

  return v8;
}

id sub_237663BA0(double a1)
{
  double v2 = objc_msgSend(MEMORY[0x263F14B48], "inkFromInk:color:");
  [MEMORY[0x263F14B48] inkWeightFromAKValue:a1];
  objc_msgSend(v2, "setWeight:");

  return v2;
}

double sub_237663C04(double a1)
{
  double v1 = (a1 + -1.0) * 0.142857143 + -1.0;
  double v2 = 1.0;
  if (v1 <= 1.0) {
    double v2 = v1;
  }
  if (v1 >= -1.0) {
    return v2;
  }
  else {
    return -1.0;
  }
}

void sub_237665174(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) rectangle];
    objc_msgSend(*(id *)(a1 + 32), "setRectangle:");
    id WeakRetained = v3;
  }
}

void sub_2376668C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2376668F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_237666908(uint64_t a1)
{
}

void sub_237666910(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave((dispatch_group_t)qword_2689251A8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  CGFloat v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_2376669B8()
{
  id v0 = (void *)qword_2689251A0;
  qword_2689251A0 = 0;

  NSLog(&cfstr_PurgedSharedRe.isa);
}

uint64_t sub_237666DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2376672F0()
{
  uint64_t result = MGGetBoolAnswer();
  byte_2689251B8 = result;
  return result;
}

void sub_23766735C()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  byte_2689251C8 = [v0 _supportsForceTouch];
}

void sub_2376673F0()
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  id v0 = [v2 arguments];
  double v1 = [v0 firstObject];

  if (v1) {
    byte_2689251D8 = [v1 containsString:@".appex/"];
  }
}

id sub_237669EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = (void *)MEMORY[0x263F1C708];
  id v9 = a5;
  id v10 = [v8 keyCommandWithInput:a2 modifierFlags:a3 action:a4];
  [v10 setDiscoverabilityTitle:v9];

  return v10;
}

BOOL sub_23766AC40(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void sub_23766ADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23766ADE8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

BOOL sub_23766B0A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL sub_23766B42C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL sub_23766B630(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

uint64_t sub_23766D6FC(void *a1)
{
  double v1 = objc_getAssociatedObject(a1, sel_akToolbarButtonItemType);
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

uint64_t sub_23766EDB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) openPopoverForHighlightAnnotation:*(void *)(a1 + 40)];
}

uint64_t sub_237670154(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  CGFloat v5 = [a2 objectForKeyedSubscript:@"characterIndexes"];
  id v6 = [v4 objectForKeyedSubscript:@"characterIndexes"];

  unint64_t v7 = [v5 firstIndex];
  if (v7 <= [v6 firstIndex])
  {
    unint64_t v9 = [v5 firstIndex];
    if (v9 >= [v6 firstIndex]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t sub_237670204(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"annotation"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"characterIndexes"];

  uint64_t v9 = [v7 style];
  if (v9 == [*(id *)(a1 + 32) style]) {
    uint64_t v10 = objc_msgSend(v8, "containsIndex:", objc_msgSend(*(id *)(a1 + 40), "firstIndex"));
  }
  else {
    uint64_t v10 = 0;
  }
  *a4 = v10;

  return v10;
}

uint64_t sub_2376702BC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"annotation"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"characterIndexes"];

  uint64_t v9 = [v7 style];
  if (v9 == [*(id *)(a1 + 32) style]) {
    uint64_t v10 = objc_msgSend(v8, "containsIndex:", objc_msgSend(*(id *)(a1 + 40), "lastIndex"));
  }
  else {
    uint64_t v10 = 0;
  }
  *a4 = v10;

  return v10;
}

double sub_2376714F0(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], a3), a1[2], a2));
  return result;
}

BOOL sub_237671860(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 horizontalSizeClass] == 2 && objc_msgSend(v1, "verticalSizeClass") == 2;

  return v2;
}

BOOL sub_2376718B0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 horizontalSizeClass];
  if (v5 == [v4 horizontalSizeClass])
  {
    uint64_t v6 = [v3 verticalSizeClass];
    BOOL v7 = v6 == [v4 verticalSizeClass];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void sub_237674870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237674960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237674A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237674B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237674BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_237674CB4()
{
  if (qword_268925210 != -1) {
    dispatch_once(&qword_268925210, &unk_26EA57618);
  }
  id v0 = (void *)qword_268925218;

  return v0;
}

void sub_237674D08(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!qword_2689251F8
    || ([(id)qword_2689251F8 objectForKey:*(void *)(a1 + 32)],
        BOOL v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    id v34 = +[AKTSDBrushStroke cacheDirectory];
    if (!qword_2689251F0)
    {
      id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v4 = (void *)qword_2689251F0;
      qword_2689251F0 = (uint64_t)v3;

      id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v6 = (void *)qword_2689251F8;
      qword_2689251F8 = (uint64_t)v5;

      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v8 = (void *)qword_268925200;
      qword_268925200 = (uint64_t)v7;

      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v10 = (void *)qword_268925208;
      qword_268925208 = (uint64_t)v9;

      uint64_t v11 = [v34 stringByAppendingString:@"/TSDBrushCacheVersion.txt"];
      CGFloat v12 = [NSString stringWithContentsOfFile:v11 encoding:4 error:0];
      CGFloat v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 9);
      if (!v12 || ([v12 isEqualToString:v13] & 1) == 0)
      {
        CGFloat v14 = [MEMORY[0x263F08850] defaultManager];
        id v39 = 0;
        CGFloat v15 = [v14 contentsOfDirectoryAtPath:v34 error:&v39];
        id v33 = v39;

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(v16);
              }
              [*(id *)(*((void *)&v35 + 1) + 8 * i) hasPrefix:@"TSDBrush"];
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
          }
          while (v17);
        }

        [v13 writeToFile:v11 atomically:0 encoding:4 error:0];
      }
    }
    CGRect v20 = [(id)qword_2689251F8 objectForKey:*(void *)(a1 + 32)];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      double v22 = [@"TSDBrush_" stringByAppendingString:*(void *)(a1 + 32)];
      id v23 = objc_alloc(MEMORY[0x263F1C318]);
      double v24 = +[AKController akBundle];
      double v25 = (void *)[v23 initWithName:v22 bundle:v24];

      uint64_t v26 = [v25 data];
      int v27 = [v26 length];
      if (!((unint64_t)[v26 length] >> 31))
      {
        Memordouble y = xmlReadMemory((const char *)[v26 bytes], v27, "", 0, 1);
        long long v29 = sub_2376751EC(Memory, @"//svg:split-at-sharp-angles[1]");
        BOOL v30 = [v29 count] != 0;

        v40 = @"split-at-sharp-angles";
        id v31 = [NSNumber numberWithBool:v30];
        v41 = v31;
        long long v32 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        [(id)qword_2689251F8 setObject:v32 forKeyedSubscript:*(void *)(a1 + 32)];

        +[AKTSDBrushStroke loadLineEndsForBrush:*(void *)(a1 + 32) inSVGDoc:Memory];
        +[AKTSDBrushStroke loadSectionsForBrush:*(void *)(a1 + 32) inSVGDoc:Memory];
        xmlFreeDoc(Memory);
      }
    }
  }
}

void sub_237675110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_2376751EC(xmlDoc *a1, void *a2)
{
  id v3 = a2;
  id v4 = xmlXPathNewContext(a1);
  id v5 = v4;
  if (!v4)
  {
    NSLog(&cfstr_UnableToCreate.isa);
LABEL_12:
    id v9 = 0;
    goto LABEL_13;
  }
  xmlXPathRegisterNs(v4, (const xmlChar *)"svg", (const xmlChar *)"http://www.w3.org/2000/svg");
  uint64_t v6 = MEMORY[0x237E1E500]([v3 cStringUsingEncoding:4], v5);
  id v7 = (xmlXPathObject *)v6;
  if (!v6)
  {
    NSLog(&cfstr_UnableToEvalua.isa);
    goto LABEL_12;
  }
  uint64_t v8 = *(int **)(v6 + 8);
  if (!v8)
  {
    NSLog(&cfstr_NodesWasNil.isa);
    goto LABEL_12;
  }
  id v9 = [MEMORY[0x263EFF980] array];
  if (*v8 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = sub_237677BDC(*(void **)(*((void *)v8 + 1) + 8 * v10), 0);
      if (v11) {
        [v9 addObject:v11];
      }

      ++v10;
    }
    while (v10 < *v8);
  }
  xmlXPathFreeObject(v7);
  xmlXPathFreeContext(v5);
LABEL_13:

  return v9;
}

void sub_237675334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237675934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_237675F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_237676240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_23767625C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23767626C(uint64_t a1)
{
}

uint64_t sub_237676274(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)qword_268925200 objectForKey:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

void sub_237676414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_237676430(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)qword_268925208 objectForKey:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

void sub_2376766A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2376766D8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)qword_2689251F0 objectForKey:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

void sub_2376768C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237676A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237676B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237676C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237677310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_237677944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_2376779B0(uint64_t a1)
{
  BOOL v2 = (void *)qword_2689251F8;
  id v5 = [*(id *)(a1 + 32) strokeName];
  id v3 = objc_msgSend(v2, "objectForKeyedSubscript:");
  id v4 = [v3 objectForKeyedSubscript:@"split-at-sharp-angles"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 BOOLValue];
}

void sub_237677A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_237677BDC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = a1[2];
  if (v5)
  {
    uint64_t v6 = [NSString stringWithCString:v5 encoding:4];
    [v4 setObject:v6 forKey:@"nodeName"];
  }
  if ((unint64_t)(a1[10] + 1) >= 2)
  {
    CGRect v20 = objc_msgSend(NSString, "stringWithCString:encoding:");
    BOOL v21 = [v4 objectForKey:@"nodeName"];
    char v22 = [v21 isEqual:@"text"];

    char v23 = v22 ^ 1;
    if (!v3) {
      char v23 = 1;
    }
    if ((v23 & 1) == 0)
    {
      double v24 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      double v25 = [v20 stringByTrimmingCharactersInSet:v24];

      uint64_t v26 = [v3 objectForKey:@"nodeContent"];
      int v27 = v26;
      if (v26)
      {
        id v28 = [v26 stringByAppendingString:v25];
      }
      else
      {
        id v28 = v25;
      }
      long long v29 = v28;
      [v3 setObject:v28 forKey:@"nodeContent"];

      id v18 = 0;
      goto LABEL_22;
    }
    [v4 setObject:v20 forKey:@"nodeContent"];
  }
  id v7 = (void *)a1[11];
  if (v7)
  {
    id v30 = v3;
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    do
    {
      id v9 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v10 = [NSString stringWithCString:v7[2] encoding:4];
      uint64_t v11 = v7[3];
      if (v11) {
        id v12 = (id)sub_237677BDC(v11, v9);
      }
      if (v10)
      {
        CGFloat v13 = [v9 objectForKey:@"nodeContent"];

        if (v13)
        {
          CGFloat v14 = [v9 objectForKey:@"nodeContent"];
          [v8 setObject:v14 forKey:v10];
        }
      }
      id v7 = (void *)v7[6];
    }
    while (v7);
    [v4 setObject:v8 forKey:@"nodeAttributes"];

    id v3 = v30;
  }
  uint64_t v15 = a1[3];
  if (v15)
  {
    id v16 = [MEMORY[0x263EFF980] array];
    do
    {
      uint64_t v17 = sub_237677BDC(v15, v4);
      if (v17) {
        [v16 addObject:v17];
      }
      uint64_t v15 = *(void *)(v15 + 48);
    }
    while (v15);
    if ([v16 count]) {
      [v4 setObject:v16 forKey:@"nodeChildArray"];
    }
  }
  id v18 = v4;
LABEL_22:

  return v18;
}

void sub_237677EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_237677FB0()
{
  qword_268925218 = (uint64_t)dispatch_queue_create("AKTSDBrushStrokeLoadQueue", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_237678420(void *a1)
{
  id v1 = a1;

  return [v1 CGImage];
}

id sub_237678448(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (void *)MEMORY[0x263F1C6B0];
  id v4 = a3;
  uint64_t v5 = +[AKController akBundle];
  uint64_t v6 = [v3 imageNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

void sub_2376784CC(void *a1, uint64_t a2, UIImage *a3, void *a4)
{
  id v6 = a4;
  UIImagePNGRepresentation(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v7 forKey:v6];
}

id sub_237678540(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v5];

  return v6;
}

uint64_t sub_237679118(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t sub_2376792E8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void sub_237679B98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[AKPageModelController alloc] initWithArchivableRepresentation:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

double sub_237679C1C(void *a1)
{
  [a1 value];
  return v1;
}

uint64_t sub_237679C38(void *a1, const char *a2, double a3)
{
  *(float *)&a3 = a3;
  return [a1 setValue:a3];
}

double sub_237679C40(void *a1)
{
  [a1 minimumValue];
  return v1;
}

uint64_t sub_237679C5C(void *a1, const char *a2, double a3)
{
  *(float *)&a3 = a3;
  return [a1 setMinimumValue:a3];
}

double sub_237679C64(void *a1)
{
  [a1 maximumValue];
  return v1;
}

uint64_t sub_237679C80(void *a1, const char *a2, double a3)
{
  *(float *)&a3 = a3;
  return [a1 setMaximumValue:a3];
}

double sub_23767BE38(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) overlayView];
  objc_msgSend(v5, "convertPoint:toView:", 0, a2, a3);
  double v7 = v6;

  return v7;
}

void sub_23767C680(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v6 = [v5 integerValue];

  if (*(unsigned char *)(a1 + 56)) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    [v18 akPointValue];
    double v9 = v8;
    double v11 = v10;
    id v12 = [*(id *)(a1 + 40) geometryHelper];
    CGFloat v13 = [*(id *)(a1 + 48) handleContainerLayer];
    objc_msgSend(v12, "convertPoint:fromModelToLayer:", v13, v9, v11);
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(*(id *)(a1 + 48), "_addHandleSublayerAtPoint:withStyle:", v6, v15, v17);
  }
}

void sub_23767C770(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v17 = a2;
  uint64_t v6 = [v5 objectAtIndex:a3];
  [v6 akPointValue];
  double v8 = v7;
  double v10 = v9;

  double v11 = [*(id *)(a1 + 40) geometryHelper];
  id v12 = [*(id *)(a1 + 48) handleContainerLayer];
  objc_msgSend(v11, "convertPoint:fromModelToLayer:", v12, v8, v10);
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v17, "setPosition:", v14, v16);
}

void sub_23767D4A0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) highlight];
  [v1 setAlpha:0.0];
}

void sub_237681594(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 annotation];
  objc_msgSend(v1, "p_removeAnnotation:", v2);
}

void sub_237681ABC(uint64_t a1)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = sub_237681BF0;
  v12[3] = &unk_264CDB758;
  v12[4] = *(void *)(a1 + 32);
  id v1 = (void (**)(void, void))MEMORY[0x237E1E250](v12);
  uint64_t v2 = v1[2](v1, 4);
  id v3 = (void *)qword_268925228;
  qword_268925228 = v2;

  uint64_t v4 = v1[2](v1, 0);
  uint64_t v5 = (void *)qword_268925230;
  qword_268925230 = v4;

  uint64_t v6 = v1[2](v1, 1);
  double v7 = (void *)qword_268925238;
  qword_268925238 = v6;

  uint64_t v8 = v1[2](v1, 2);
  double v9 = (void *)qword_268925240;
  qword_268925240 = v8;

  uint64_t v10 = v1[2](v1, 3);
  double v11 = (void *)qword_268925248;
  qword_268925248 = v10;
}

id sub_237681BF0(uint64_t a1, uint64_t a2)
{
  v19[6] = *MEMORY[0x263EF8340];
  v18[0] = &unk_26EA76778;
  id v17 = objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 1, a2);
  double v16 = [v17 highlightColor];
  v19[0] = v16;
  v18[1] = &unk_26EA76790;
  double v15 = objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 2, a2);
  uint64_t v4 = [v15 highlightColor];
  v19[1] = v4;
  void v18[2] = &unk_26EA767A8;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 3, a2);
  uint64_t v6 = [v5 highlightColor];
  void v19[2] = v6;
  v18[3] = &unk_26EA767C0;
  double v7 = objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 4, a2);
  uint64_t v8 = [v7 highlightColor];
  v19[3] = v8;
  v18[4] = &unk_26EA767D8;
  double v9 = objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 5, a2);
  uint64_t v10 = [v9 highlightColor];
  v19[4] = v10;
  v18[5] = &unk_26EA767F0;
  double v11 = objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 6, a2);
  id v12 = [v11 noteFillColor];
  v19[5] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:6];

  return v13;
}

void sub_2376821CC(uint64_t a1)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = sub_237682300;
  v12[3] = &unk_264CDB758;
  v12[4] = *(void *)(a1 + 32);
  id v1 = (void (**)(void, void))MEMORY[0x237E1E250](v12);
  uint64_t v2 = v1[2](v1, 4);
  id v3 = (void *)qword_268925258;
  qword_268925258 = v2;

  uint64_t v4 = v1[2](v1, 0);
  uint64_t v5 = (void *)qword_268925260;
  qword_268925260 = v4;

  uint64_t v6 = v1[2](v1, 1);
  double v7 = (void *)qword_268925268;
  qword_268925268 = v6;

  uint64_t v8 = v1[2](v1, 2);
  double v9 = (void *)qword_268925270;
  qword_268925270 = v8;

  uint64_t v10 = v1[2](v1, 3);
  double v11 = (void *)qword_268925278;
  qword_268925278 = v10;
}

id sub_237682300(uint64_t a1, uint64_t a2)
{
  v23[6] = *MEMORY[0x263EF8340];
  v22[0] = &unk_26EA76778;
  uint64_t v4 = *(void **)(a1 + 32);
  BOOL v21 = objc_msgSend(v4, "p_colorForTag:pageTheme:", 1, a2);
  CGRect v20 = objc_msgSend(v4, "p_colorControlImageForColor:", v21);
  v23[0] = v20;
  v22[1] = &unk_26EA76790;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = objc_msgSend(v5, "p_colorForTag:pageTheme:", 2, a2);
  double v7 = objc_msgSend(v5, "p_colorControlImageForColor:", v6);
  v23[1] = v7;
  void v22[2] = &unk_26EA767A8;
  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = objc_msgSend(v8, "p_colorForTag:pageTheme:", 3, a2);
  uint64_t v10 = objc_msgSend(v8, "p_colorControlImageForColor:", v9);
  void v23[2] = v10;
  v22[3] = &unk_26EA767C0;
  double v11 = *(void **)(a1 + 32);
  id v12 = objc_msgSend(v11, "p_colorForTag:pageTheme:", 4, a2);
  double v13 = objc_msgSend(v11, "p_colorControlImageForColor:", v12);
  v23[3] = v13;
  v22[4] = &unk_26EA767D8;
  double v14 = *(void **)(a1 + 32);
  double v15 = objc_msgSend(v14, "p_colorForTag:pageTheme:", 5, a2);
  double v16 = objc_msgSend(v14, "p_colorControlImageForColor:", v15);
  v23[4] = v16;
  v22[5] = &unk_26EA767F0;
  id v17 = objc_msgSend(*(id *)(a1 + 32), "p_colorControlUnderlineImageForPageTheme:", a2);
  v23[5] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];

  return v18;
}

void sub_237682BB4(uint64_t a1)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = sub_237682CE8;
  v12[3] = &unk_264CDB758;
  v12[4] = *(void *)(a1 + 32);
  id v1 = (void (**)(void, void))MEMORY[0x237E1E250](v12);
  uint64_t v2 = v1[2](v1, 4);
  id v3 = (void *)qword_268925288;
  qword_268925288 = v2;

  uint64_t v4 = v1[2](v1, 0);
  uint64_t v5 = (void *)qword_268925290;
  qword_268925290 = v4;

  uint64_t v6 = v1[2](v1, 1);
  double v7 = (void *)qword_268925298;
  qword_268925298 = v6;

  uint64_t v8 = v1[2](v1, 2);
  double v9 = (void *)qword_2689252A0;
  qword_2689252A0 = v8;

  uint64_t v10 = v1[2](v1, 3);
  double v11 = (void *)qword_2689252A8;
  qword_2689252A8 = v10;
}

id sub_237682CE8(uint64_t a1, uint64_t a2)
{
  v13[6] = *MEMORY[0x263EF8340];
  v12[0] = &unk_26EA76778;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 1, 2, 3, a2);
  v13[0] = v4;
  v12[1] = &unk_26EA76790;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 2, 3, 5, a2);
  v13[1] = v5;
  void v12[2] = &unk_26EA767A8;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 3, 4, 5, a2);
  v13[2] = v6;
  v12[3] = &unk_26EA767C0;
  double v7 = objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 4, 5, 2, a2);
  v13[3] = v7;
  v12[4] = &unk_26EA767D8;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 5, 1, 2, a2);
  v13[4] = v8;
  void v12[5] = &unk_26EA767F0;
  double v9 = objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 6, 2, 3, a2);
  v13[5] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];

  return v10;
}

void sub_237683148(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F1C6B0] akImageNamed:@"ib_text_pop_icon_note"];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2376832B4;
  v15[3] = &unk_264CDB780;
  v15[4] = *(void *)(a1 + 32);
  id v16 = v2;
  id v3 = v2;
  uint64_t v4 = (void (**)(void, void))MEMORY[0x237E1E250](v15);
  uint64_t v5 = v4[2](v4, 4);
  uint64_t v6 = (void *)qword_2689252B8;
  qword_2689252B8 = v5;

  uint64_t v7 = v4[2](v4, 0);
  uint64_t v8 = (void *)qword_2689252C0;
  qword_2689252C0 = v7;

  uint64_t v9 = v4[2](v4, 1);
  uint64_t v10 = (void *)qword_2689252C8;
  qword_2689252C8 = v9;

  uint64_t v11 = v4[2](v4, 2);
  id v12 = (void *)qword_2689252D0;
  qword_2689252D0 = v11;

  uint64_t v13 = v4[2](v4, 3);
  double v14 = (void *)qword_2689252D8;
  qword_2689252D8 = v13;
}

id sub_2376832B4(uint64_t a1, uint64_t a2)
{
  v31[6] = *MEMORY[0x263EF8340];
  v30[0] = &unk_26EA76778;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v29 = objc_msgSend(v4, "p_colorForTag:pageTheme:", 1, a2);
  id v28 = objc_msgSend(v4, "p_monochromaticImageFromImage:withColor:", v5, v29);
  v31[0] = v28;
  v30[1] = &unk_26EA76790;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  int v27 = objc_msgSend(v6, "p_colorForTag:pageTheme:", 2, a2);
  uint64_t v26 = objc_msgSend(v6, "p_monochromaticImageFromImage:withColor:", v7, v27);
  v31[1] = v26;
  v30[2] = &unk_26EA767A8;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = objc_msgSend(v8, "p_colorForTag:pageTheme:", 3, a2);
  uint64_t v11 = objc_msgSend(v8, "p_monochromaticImageFromImage:withColor:", v9, v10);
  v31[2] = v11;
  v30[3] = &unk_26EA767C0;
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  double v14 = objc_msgSend(v12, "p_colorForTag:pageTheme:", 4, a2);
  double v15 = objc_msgSend(v12, "p_monochromaticImageFromImage:withColor:", v13, v14);
  v31[3] = v15;
  v30[4] = &unk_26EA767D8;
  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = objc_msgSend(v16, "p_colorForTag:pageTheme:", 5, a2);
  CGRect v19 = objc_msgSend(v16, "p_monochromaticImageFromImage:withColor:", v17, v18);
  v31[4] = v19;
  v30[5] = &unk_26EA767F0;
  CGRect v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 40);
  char v22 = objc_msgSend(v20, "p_colorForTag:pageTheme:", 6, a2);
  char v23 = objc_msgSend(v20, "p_monochromaticImageFromImage:withColor:", v21, v22);
  v31[5] = v23;
  double v24 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];

  return v24;
}

double sub_237684604(double a1, double a2, double a3)
{
  return a1 + a3;
}

double sub_237684610(double a1, double a2, double a3)
{
  return a1 - a3;
}

double sub_23768461C(double a1, double a2, double a3)
{
  return a1 * a3;
}

double sub_237684628(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double sub_237684638(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double sub_237684644(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double sub_23768465C(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double sub_23768467C(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double sub_237684688(long double a1, long double a2)
{
  return atan2(a2, a1);
}

double sub_237684698(double a1)
{
  if (a1 == 0.0) {
    return 1.0;
  }
  return __sincos_stret(a1).__cosval;
}

double sub_2376846D4(int a1, double a2, double a3)
{
  if (a1) {
    return -a3;
  }
  else {
    return a3;
  }
}

void sub_237684864(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_237684934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)AKLegacyDoodleController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_237684970(void *a1)
{
}

void sub_237684A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237684C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237684DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23768519C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23768532C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2376853B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237685434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2376854B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2376855A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237685610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237685668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2376856D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2376857F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237685A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237685B9C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 104));

  _Unwind_Resume(a1);
}

void sub_237685BD0(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = [WeakRetained shapeDetectionController];
    objc_msgSend(v4, "performRecognitionOnDrawing:withPath:boundsInInputView:center:isPrestroked:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 104), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  uint64_t v5 = *(const CGPath **)(a1 + 48);

  CGPathRelease(v5);
}

void sub_237685C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237685CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237685EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23768611C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23768620C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2376862D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237686678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2376867C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237686B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

BOOL sub_237686BF0(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] containsObject:v3])
  {
    uint64_t v4 = [a1[5] shapeDetectionController];
    id v5 = [v4 candidateAnnotation];

    BOOL v6 = v5 != v3;
    if (v5 == v3)
    {
      uint64_t v7 = [a1[5] shapeDetectionController];
      [v7 setIsPreviousCandidateAnnotationUndecided:1];
    }
    [a1[6] removeObject:v3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void sub_237686C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_237688C78()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  id v0 = (unsigned int (*)(void))off_2689252E8;
  uint64_t v7 = off_2689252E8;
  if (!off_2689252E8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_237688F2C;
    v3[3] = &unk_264CDB2A8;
    v3[4] = &v4;
    sub_237688F2C((uint64_t)v3);
    id v0 = (unsigned int (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v2 = (_Unwind_Exception *)sub_2376DA278();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0(0) - 1 < 2;
}

void *sub_237688F2C(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_2689252F0)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = sub_23768906C;
    void v5[4] = &unk_264CDADD0;
    v5[5] = v5;
    long long v6 = xmmword_264CDB7F0;
    uint64_t v7 = 0;
    qword_2689252F0 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_2689252F0;
    if (qword_2689252F0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_2689252F0;
LABEL_5:
  double result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_2689252E8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23768906C()
{
  uint64_t result = _sl_dlopen();
  qword_2689252F0 = result;
  return result;
}

__n128 sub_23768A16C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPointFromModelToOverlay:");
  double v3 = v2;
  double v5 = v4;
  long long v6 = [*(id *)(a1 + 40) superview];
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", v6, v3, v5);
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [v6 window];
  id v12 = [v11 screen];
  uint64_t v13 = [v12 coordinateSpace];
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v13, v8, v10);
  double v17 = v15;
  double v18 = v14;

  CGAffineTransformMakeScale(&v20, 1.0, -1.0);
  float64x2_t v19 = vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v17), *(float64x2_t *)&v20.a, v18));

  return (__n128)v19;
}

uint64_t sub_23768B474(uint64_t a1)
{
  return [*(id *)(a1 + 32) openPopupAnnotation:*(void *)(a1 + 40)];
}

uint64_t sub_23768B830(uint64_t a1)
{
  return [*(id *)(a1 + 32) openPopupAnnotation:*(void *)(a1 + 40)];
}

void sub_23768C1AC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_23768D490(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) signaturesAlertViewController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_23768D524;
  v3[3] = &unk_264CDAE40;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t sub_23768D524(uint64_t a1)
{
  [*(id *)(a1 + 32) setSignaturesAlertViewController:0];
  uint64_t v2 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v2, sel__continueToManageSignatures);
}

void sub_23768D564(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) signaturesAlertViewController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_23768D5F8;
  v3[3] = &unk_264CDAE40;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t sub_23768D5F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSignaturesSheetViewController:0];
}

uint64_t sub_23768D808(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSignaturesSheetViewController:0];
}

uint64_t sub_23768D8F0(uint64_t a1)
{
  [*(id *)(a1 + 32) setSignaturesSheetViewController:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _continueToCreateSignature];
}

uint64_t sub_23768DB30(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSignaturesCreationViewController:0];
}

uint64_t sub_2376960C4(double a1, double a2, double a3, double a4)
{
  double v8 = objc_opt_class();

  return objc_msgSend(v8, "stableIntegralRectForRect:", a1, a2, a3, a4);
}

void sub_237696278(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  vabdd_f64(1.0, fmod(round(*(double *)(a1 + 32) * a6), 2.0));
  v10.origin.double x = a2;
  v10.origin.double y = a3;
  v10.size.double width = a4;
  v10.size.double height = a5;
  CGRectIntegral(v10);
}

uint64_t sub_237696400(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "integralRect:withOptions:", 983040);
}

void sub_237696864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2376968E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237696954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237696A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237696B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237696E6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_237696EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  for (uint64_t i = [WeakRetained bitmapFifo];
  {
    if (COERCE_FLOAT(*(void *)(a2 + 8)) > 0.00001) {
      [i addPoint:*(double *)a2];
    }
    a2 += 16;
  }
  if (([WeakRetained isAddingPointWithoutSmoothing] & 1) == 0) {
    [WeakRetained setDisableSingleDotSpecialCase:1];
  }
}

void sub_237696FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237696FF0(uint64_t a1, long long *a2, uint64_t a3)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isAddingPointWithoutSmoothing])
  {
    double v5 = WeakRetained[51];
    double v6 = WeakRetained[52];
    if (a3 != 1) {
      NSLog(&cfstr_SSingleDotSpec.isa, "-[AKSmoothPathView _setupFilterChainWithBitmapFifo:]_block_invoke_2");
    }
    long long v7 = *a2;
    double v8 = COERCE_FLOAT(*((void *)a2 + 1));
    double v9 = WeakRetained;
    if (v8 > 0.00001)
    {
      double v10 = v6 * (v5 * v8);
      double v11 = *(float *)&v7 - v10 * 0.5;
      double v12 = *((float *)&v7 + 1) - v10 * 0.5;
      objc_msgSend(WeakRetained, "setSingleDotRect:", v11, v12, v10, v10);
      objc_msgSend(WeakRetained, "setNeedsDisplayInRect:", v11, v12, v10, v10);
      double v9 = WeakRetained;
    }
  }
  else
  {
    [WeakRetained setDisableSingleDotSpecialCase:1];
    double v9 = WeakRetained;
  }
}

void sub_237697118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2376971A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237697364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237697440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237697568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2376975D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237697AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237697D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_237697DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_237697EB8(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_callDelegate);
}

void sub_237697F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2376980B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2376981D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2376982D0(uint64_t a1)
{
  [*(id *)(a1 + 32) minPressure];
  qword_268925300 = v2;
  [*(id *)(a1 + 32) maxPressure];
  qword_268925308 = v3;
  [*(id *)(a1 + 32) minThickness];
  qword_268925310 = v4;
  uint64_t result = [*(id *)(a1 + 32) maxThickness];
  qword_268925318 = v6;
  return result;
}

void sub_2376984A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2376985B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23769864C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237698798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23769889C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2376989EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237698AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237698B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23769992C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_237699944(uint64_t a1, int a2, CGPathRef path)
{
  BoundingBodouble x = CGPathGetBoundingBox(path);
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), BoundingBox);
  return 0;
}

uint64_t sub_237699AE0(uint64_t a1, int a2, CGPathRef path)
{
  return 0;
}

void sub_237699BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_237699C14(uint64_t a1, int a2, CGPathRef path)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGPathContainsPoint(path, 0, *(CGPoint *)(a1 + 40), 1);
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void sub_23769B174(_Unwind_Exception *a1)
{
}

void sub_23769B194(void *a1, int a2)
{
  id v3 = objc_begin_catch(a1);
  if (a2 == 2)
  {
    sub_2376DA5D0(v3);
    JUMPOUT(0x23769B114);
  }
  JUMPOUT(0x23769B11CLL);
}

uint64_t sub_23769B7E8()
{
  qword_268925320 = [MEMORY[0x263EFFA08] setWithArray:&unk_26EA76118];

  return MEMORY[0x270F9A758]();
}

void sub_23769B830(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 32) && !*((unsigned char *)WeakRetained + 33))
  {
    *((unsigned char *)WeakRetained + 33) = 1;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          if ((objc_msgSend((id)qword_268925320, "containsObject:", v9, (void)v10) & 1) == 0) {
            [v3 addObserver:v3 forKeyPath:v9 options:3 context:@"AKAnnotation.annotationPropertyObservationForIsEditedContext"];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

uint64_t sub_23769BCE4()
{
  qword_268925330 = [MEMORY[0x263EFFA08] setWithArray:&unk_26EA76130];

  return MEMORY[0x270F9A758]();
}

void sub_23769BD2C(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 16) && !*((unsigned char *)WeakRetained + 17))
  {
    *((unsigned char *)WeakRetained + 17) = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          if ((objc_msgSend((id)qword_268925330, "containsObject:", v9, (void)v10) & 1) == 0) {
            [v3 addObserver:v3 forKeyPath:v9 options:3 context:@"AKAnnotation.annotationPropertyObservationForAppearanceContext"];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

void sub_23769CA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23769CA7C(uint64_t a1, CGContext *a2)
{
  id WeakRetained = (CGPDFDocumentRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    Page = CGPDFDocumentGetPage(WeakRetained[3], 1uLL);
    CGContextDrawPDFPage(a2, Page);
    id WeakRetained = v5;
  }
}

void sub_23769D574()
{
}

id sub_23769D6E4(void *a1)
{
  uint64_t v2 = [a1 indexPathForSelectedRow];
  if (v2)
  {
    id v3 = [a1 cellForRowAtIndexPath:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_23769EAB4(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  v31[4] = *MEMORY[0x263EF8340];
  id v12 = a7;
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a1 addSubview:v12];
  long long v13 = [v12 leadingAnchor];
  double v14 = [a1 leadingAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14 constant:a3];

  LODWORD(v16) = 1148829696;
  [v15 setPriority:v16];
  double v17 = [v12 trailingAnchor];
  double v18 = [a1 trailingAnchor];
  float64x2_t v19 = [v17 constraintEqualToAnchor:v18 constant:a5];

  LODWORD(v20) = 1148829696;
  [v19 setPriority:v20];
  uint64_t v21 = [v12 topAnchor];
  char v22 = [a1 topAnchor];
  char v23 = [v21 constraintEqualToAnchor:v22 constant:a2];

  LODWORD(v24) = 1148829696;
  [v23 setPriority:v24];
  double v25 = [v12 bottomAnchor];

  uint64_t v26 = [a1 bottomAnchor];
  int v27 = [v25 constraintEqualToAnchor:v26 constant:a4];

  LODWORD(v28) = 1148829696;
  [v27 setPriority:v28];
  long long v29 = (void *)MEMORY[0x263F08938];
  v31[0] = v15;
  v31[1] = v19;
  v31[2] = v23;
  v31[3] = v27;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  [v29 activateConstraints:v30];
}

id sub_2376A3AE8(uint64_t a1)
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"client";
  uint64_t v2 = [*(id *)(a1 + 32) clientPrefix];
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = @"<nil>";
  }
  v12[0] = v4;
  v11[1] = @"documentType";
  uint64_t v5 = [*(id *)(a1 + 32) documentType];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"<nil>";
  }
  void v11[2] = @"action";
  double v8 = *(__CFString **)(a1 + 40);
  if (!v8) {
    double v8 = @"<nil>";
  }
  v12[1] = v7;
  void v12[2] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

id sub_2376A3C88(uint64_t a1)
{
  void v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"client";
  uint64_t v2 = [*(id *)(a1 + 32) clientPrefix];
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = @"<nil>";
  }
  v12[0] = v4;
  v11[1] = @"documentType";
  uint64_t v5 = [*(id *)(a1 + 32) documentType];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"<nil>";
  }
  v12[1] = v7;
  void v12[2] = @"pick";
  void v11[2] = @"action";
  void v11[3] = @"annotationType";
  double v8 = *(__CFString **)(a1 + 40);
  if (!v8) {
    double v8 = @"<nil>";
  }
  v12[3] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

id sub_2376A3E44(uint64_t a1)
{
  v14[5] = *MEMORY[0x263EF8340];
  v13[0] = @"client";
  uint64_t v2 = [*(id *)(a1 + 32) clientPrefix];
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = @"<nil>";
  }
  v14[0] = v4;
  v13[1] = @"documentType";
  uint64_t v5 = [*(id *)(a1 + 32) documentType];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"<nil>";
  }
  v14[1] = v7;
  v14[2] = @"create";
  v13[2] = @"action";
  v13[3] = @"annotationType";
  uint64_t v9 = *(__CFString **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  if (!v9) {
    uint64_t v9 = @"<nil>";
  }
  v14[3] = v9;
  v13[4] = @"annotationCount";
  long long v10 = [NSNumber numberWithUnsignedInteger:v8];
  v14[4] = v10;
  long long v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

uint64_t sub_2376A78F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_convertPointToScreenBacking:");
}

void sub_2376A875C(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) visualEffectView];
  id v4 = [v3 contentView];
  [v4 setAlpha:v2];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) visualEffectView];
  [v6 setEffect:v5];
}

uint64_t sub_2376A87F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_2376A8F70(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setSelected:1];
  double v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.4];
  [v2 setBackgroundColor:v3];

  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [MEMORY[0x263F1C550] blackColor];
    [v4 setTintColor:v5];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(MEMORY[0x263F1C550], "clearColor", (void)v14);
        [v11 setBackgroundColor:v12];

        if (*(unsigned char *)(a1 + 48))
        {
          long long v13 = [MEMORY[0x263F1C550] whiteColor];
          [v11 setTintColor:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

uint64_t sub_2376A9120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2376A9360(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  int v7 = [a1 _isScrollingToTop];
  objc_msgSend(a1, "_swizzled_scrollViewAnimationEnded:finished:", v6, a4);

  if (v7)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"AKScrollViewDidScrollToTopNotification" object:a1];
  }
}

void sub_2376A9434()
{
  id v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__scrollViewAnimationEnded_finished_);
  double v2 = (objc_class *)objc_opt_class();
  id v3 = class_getInstanceMethod(v2, sel__swizzled_scrollViewAnimationEnded_finished_);

  method_exchangeImplementations(InstanceMethod, v3);
}

void sub_2376AB478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2376AB49C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2376AB4AC(uint64_t a1)
{
}

void sub_2376AB4B4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v7 = *(void **)(a1 + 32);
  [a2 akPointValue];
  objc_msgSend(v7, "convertPointFromModelToOverlay:");
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 40) objectAtIndex:a3];
  uint64_t v13 = [v12 integerValue];

  [*(id *)(a1 + 32) currentModelToScreenScaleFactor];
  double v15 = 1.0 / v14;
  if (v13 == 1)
  {
    uint64_t v16 = &AKPointOfInterestRadius_Handle_Alternate;
    goto LABEL_5;
  }
  if (!v13)
  {
    uint64_t v16 = &AKPointOfInterestSize_Handle;
LABEL_5:
    +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", v15 * *(double *)v16, v15 * *(double *)v16, v9, v11);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    goto LABEL_7;
  }
  CGFloat v18 = *MEMORY[0x263F001A8];
  CGFloat v20 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v22 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v24 = *(double *)(MEMORY[0x263F001A8] + 24);
LABEL_7:
  v29.origin.double x = v18;
  v29.origin.double y = v20;
  v29.size.double width = v22;
  v29.size.double height = v24;
  if (CGRectContainsPoint(v29, *(CGPoint *)(a1 + 64)))
  {
    double v25 = *(CGFloat **)(*(void *)(a1 + 48) + 8);
    v25[4] = v18;
    v25[5] = v20;
    void v25[6] = v22;
    v25[7] = v24;
    uint64_t v26 = [NSNumber numberWithUnsignedInteger:v13];
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    double v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    *a4 = 1;
  }
}

uint64_t sub_2376AB9F4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeFromSuperview];
}

void sub_2376AC468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2376AC484(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _removeLiftOffHandleViewForRegion:*(void *)(a1 + 32)];
  }
}

id sub_2376AE808(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  double v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  if (v8)
  {
    double v9 = v8;
    components[0] = a1;
    components[1] = a2;
    components[2] = a3;
    components[3] = a4;
    CGColorRef v10 = CGColorCreate(v8, components);
    if (v10)
    {
      CGColorRef v11 = v10;
      uint64_t v12 = [MEMORY[0x263F1C550] colorWithCGColor:v10];
      CFRelease(v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id sub_2376AE8FC(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x263EF8340];
  id v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00250]);
  if (v4)
  {
    uint64_t v5 = v4;
    components[0] = a1;
    components[1] = a2;
    CGColorRef v6 = CGColorCreate(v4, components);
    if (v6)
    {
      CGColorRef v7 = v6;
      double v8 = [MEMORY[0x263F1C550] colorWithCGColor:v6];
      CFRelease(v7);
    }
    else
    {
      double v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

id sub_2376AE9DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (objc_class *)MEMORY[0x263F1C550];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithCIColor:v4];

  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 1.0;
  double v9 = 0.0;
  [v5 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];
  CGColorRef v6 = [MEMORY[0x263F1C550] akColorWithSRGBRed:v11 green:v10 blue:v9 alpha:v8];

  return v6;
}

uint64_t sub_2376AEA88()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:0.0 green:0.0 blue:0.0 alpha:0.08];
}

uint64_t sub_2376AEAA8()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:0.0 green:0.450980392 blue:0.858823529 alpha:1.0];
}

uint64_t sub_2376AEACC()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_systemRedColor);
}

uint64_t sub_2376AEAD8()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_systemYellowColor);
}

uint64_t sub_2376AEAE4()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_systemGreenColor);
}

uint64_t sub_2376AEAF0()
{
  return [MEMORY[0x263F1C550] systemBlueColor];
}

uint64_t sub_2376AEAFC()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_systemPinkColor);
}

uint64_t sub_2376AEB08()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_systemPurpleColor);
}

uint64_t sub_2376AEB14()
{
  return [MEMORY[0x263F1C550] akColorWithWhite:0.901961 alpha:1.0];
}

uint64_t sub_2376AEB2C()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:0.988235294 green:0.192156863 blue:0.258823529 alpha:1.0];
}

uint64_t sub_2376AEB54()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
}

uint64_t sub_2376AEB74()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:1.0 green:0.8 blue:0.0 alpha:1.0];
}

uint64_t sub_2376AEB94()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:0.388235294 green:0.854901961 blue:0.219607843 alpha:1.0];
}

uint64_t sub_2376AEBBC()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:0.105882353 green:0.678431373 blue:0.97254902 alpha:1.0];
}

uint64_t sub_2376AEBE4()
{
  return [MEMORY[0x263F1C550] akColorWithSRGBRed:0.8 green:0.450980392 blue:0.882352941 alpha:1.0];
}

double sub_2376AEC0C(void *a1)
{
  double v2 = 0.0;
  [a1 getWhite:0 alpha:&v2];
  return v2;
}

uint64_t sub_2376AEC3C(id a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 == a1)
  {
    uint64_t v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CGColorRef v6 = [a1 colorUsingSRGBColorSpace];
    CGColorRef v7 = [v5 colorUsingSRGBColorSpace];
    double v22 = 0.0;
    double v20 = 0.0;
    double v21 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    [v6 getRed:&v22 green:&v20 blue:&v21 alpha:&v19];
    [v7 getRed:&v18 green:&v16 blue:&v17 alpha:&v15];
    double v8 = round(v21 * 255.0);
    double v9 = round(v19 * 255.0);
    double v10 = round(v17 * 255.0);
    double v11 = round(v15 * 255.0);
    BOOL v12 = round(v22 * 255.0) == round(v18 * 255.0);
    if (round(v20 * 255.0) != round(v16 * 255.0)) {
      BOOL v12 = 0;
    }
    if (v8 != v10) {
      BOOL v12 = 0;
    }
    uint64_t v13 = v9 == v11 && v12;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

BOOL sub_2376AED9C(void *a1, double a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 0;
  }
  id v6 = a4;
  CGColorRef v7 = [a1 colorUsingSRGBColorSpace];
  double v8 = [v6 colorUsingSRGBColorSpace];

  double v14 = 0.0;
  double v15 = 0.0;
  if (([v7 getHue:&v15 saturation:0 brightness:0 alpha:0] & 1) == 0) {
    double v15 = 0.0;
  }
  int v9 = [v8 getHue:&v14 saturation:0 brightness:0 alpha:0];
  double v10 = v14;
  if (!v9) {
    double v10 = 0.0;
  }
  double v11 = vabdd_f64(v10, v15);
  BOOL v12 = fabs(v11 + -1.0) <= a2 || v11 <= a2;

  return v12;
}

id sub_2376AEE8C(void *a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
  if (v2)
  {
    id v3 = v2;
    id v4 = a1;
    CGColorSpaceRef ColorSpace = CGColorGetColorSpace((CGColorRef)[v4 CGColor]);
    if (CFEqual(ColorSpace, v3))
    {
      id v6 = v4;
    }
    else
    {
      uint64_t v7 = MEMORY[0x237E1D120](v3, 0);
      if (v7)
      {
        double v8 = (const void *)v7;
        [v4 CGColor];
        uint64_t v9 = CGColorTransformConvertColor();
        if (v9)
        {
          double v10 = (CGColor *)v9;
          size_t v11 = 8 * CGColorSpaceGetNumberOfComponents(v3);
          BOOL v12 = (char *)v17 - ((v11 + 23) & 0xFFFFFFFFFFFFFFF0);
          Components = CGColorGetComponents(v10);
          memcpy(v12, Components, v11 + 8);
          CGColorRef v14 = CGColorCreate(v3, (const CGFloat *)v12);
          if (v14)
          {
            CGColorRef v15 = v14;
            id v6 = [MEMORY[0x263F1C550] colorWithCGColor:v14];
            CFRelease(v15);
          }
          else
          {
            id v6 = 0;
          }
          CFRelease(v10);
        }
        else
        {
          id v6 = 0;
        }
        CFRelease(v8);
      }
      else
      {
        id v6 = 0;
      }
    }
    CFRelease(v3);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id sub_2376AF02C(void *a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = [a1 colorUsingSRGBColorSpace];
  double v8 = [v6 colorUsingSRGBColorSpace];

  id v9 = v7;
  Components = CGColorGetComponents((CGColorRef)[v9 CGColor]);
  id v11 = v8;
  BOOL v12 = CGColorGetComponents((CGColorRef)[v11 CGColor]);
  uint64_t v13 = [MEMORY[0x263F1C550] akColorWithSRGBRed:*v12 * a2 + (1.0 - a2) * *Components green:v12[1] * a2 + (1.0 - a2) * Components[1] blue:v12[2] * a2 + (1.0 - a2) * Components[2] alpha:v12[3] * a2 + (1.0 - a2) * Components[3]];

  return v13;
}

void sub_2376AF120(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v9 = [a3 colorUsingSRGBColorSpace];
  if (v9) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F00608]) initWithColor:v9];
  }
  else {
    uint64_t v7 = 0;
  }
  double v8 = [v7 stringRepresentation];
  [a1 encodeObject:v8 forKey:v6];
}

id sub_2376AF1D0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x263F00608] colorWithString:v5];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x263F1C550] akColorWithCIColor:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_2376B1B10(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t sub_2376B1B58(uint64_t a1)
{
  CGColorSpaceRef v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:1];

  uint64_t v3 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v3, sel_didShow);
}

uint64_t sub_2376B1EA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) hide];
}

void sub_2376B214C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void sub_2376B2194(uint64_t a1)
{
  CGColorSpaceRef v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:1];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 removeFromSuperview];
}

double sub_2376BD6F8(void *a1, uint64_t a2, double *a3)
{
  double v5 = 0.0;
  [a1 scanDouble:&v5];
  double result = v5;
  *a3 = v5;
  return result;
}

double sub_2376BD9D4(float64x2_t *a1, double a2)
{
  __asm { FMOV            V5.2D, #3.0 }
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(a1[1], _Q5), a2), 1.0 - a2), 1.0 - a2), vmulq_n_f64(vmulq_n_f64(*a1, 1.0 - a2), 1.0 - a2), 1.0 - a2), vmulq_n_f64(vmulq_n_f64(vmulq_f64(a1[2], _Q5), a2), a2), 1.0 - a2), vmulq_n_f64(vmulq_n_f64(a1[3], a2), a2), a2);
  return result;
}

void sub_2376BDA2C(float64x2_t *a1, uint64_t a2, double a3, double a4)
{
  double v8 = 1.0 - a3;
  *(double *)a2 = sub_2376BFC78(a1, 1.0 - a3, a3, 1.0 - a3, a3, 1.0 - a3, a3);
  *(void *)(a2 + 8) = v9;
  *(double *)(a2 + 16) = sub_2376BFC78(a1, v8, a3, v8, a3, 1.0 - a4, a4);
  *(void *)(a2 + 24) = v10;
  *(double *)(a2 + 32) = sub_2376BFC78(a1, v8, a3, 1.0 - a4, a4, 1.0 - a4, a4);
  *(void *)(a2 + 40) = v11;
  *(double *)(a2 + 48) = sub_2376BFC78(a1, 1.0 - a4, a4, 1.0 - a4, a4, 1.0 - a4, a4);
  *(void *)(a2 + 56) = v12;
}

uint64_t sub_2376BDB00(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v5 = a1[1];
  double v6 = a1[2] - *a1;
  double v7 = a1[3] - v5;
  double v8 = a2[1];
  double v9 = a2[2] - *a2;
  double v10 = a2[3] - v8;
  double v11 = (v7 * (*a2 - *a1) + (v5 - v8) * v6) / (v10 * v6 - v9 * v7);
  *a4 = v11;
  if (v11 >= 0.0)
  {
    BOOL v13 = v11 == 1.0;
    BOOL v12 = v11 >= 1.0;
  }
  else
  {
    BOOL v12 = 1;
    BOOL v13 = 0;
  }
  if (!v13 && v12) {
    return 0;
  }
  double v14 = (v10 * (*a1 - *a2) + (a2[1] - a1[1]) * v9) / (v7 * v9 - v6 * v10);
  *a3 = v14;
  if (v14 >= 0.0)
  {
    BOOL v16 = v14 == 1.0;
    BOOL v15 = v14 >= 1.0;
  }
  else
  {
    BOOL v15 = 1;
    BOOL v16 = 0;
  }
  if (!v16 && v15) {
    return 0;
  }
  double v17 = a1[1];
  *a5 = *a1 + v14 * v6;
  a5[1] = v17 + *a3 * v7;
  return 1;
}

void sub_2376BDBAC(float64x2_t *a1, double *a2, uint64_t a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  double v6 = a2[2];
  double v5 = a2[3];
  double v7 = v5 - a2[1];
  double v8 = v6 - *a2;
  float v9 = v8 * v8 + v7 * v7;
  double v10 = (float)(1.0 / sqrtf(v9));
  double v11 = v7 * v10;
  double v12 = -(v8 * v10);
  double v13 = v5 * v12 + v11 * v6;
  float64_t v14 = a1->f64[1] * v12 + v11 * a1->f64[0] - v13;
  v31.f64[0] = 0.0;
  v31.f64[1] = v14;
  double v15 = a1[1].f64[1] * v12 + v11 * a1[1].f64[0] - v13;
  uint64_t v32 = 0x3FD5555560000000;
  double v33 = v15;
  double v16 = a1[2].f64[1] * v12 + v11 * a1[2].f64[0] - v13;
  uint64_t v34 = 0x3FE5555560000000;
  double v35 = v16;
  double v17 = v12 * a1[3].f64[1] + v11 * a1[3].f64[0] - v13;
  uint64_t v36 = 0x3FF0000000000000;
  double v37 = v17;
  *(float *)&double v17 = v15 * 9.0 + v14 * -3.0 + v16 * -9.0 + v17 * 3.0;
  *(float *)&double v16 = v15 * -12.0 + v14 * 6.0 + v16 * 6.0;
  *(float *)&float64_t v14 = v15 * 3.0 + v14 * -3.0;
  *(float *)&float64_t v14 = sqrtf((float)((float)(*(float *)&v17 * -4.0) * *(float *)&v14) + (float)(*(float *)&v16
                                                                                          * *(float *)&v16));
  *(float *)&double v17 = *(float *)&v17 + *(float *)&v17;
  float v18 = (float)((float)-*(float *)&v16 - *(float *)&v14) / *(float *)&v17;
  double v19 = sub_2376BD9D4(&v31, (float)((float)(*(float *)&v14 - *(float *)&v16) / *(float *)&v17));
  double v21 = v20;
  double v22 = sub_2376BD9D4(&v31, v18);
  double v23 = fabs(v21);
  double v25 = fabs(v24);
  BOOL v27 = v22 > 1.0 || v22 < 0.0 || v23 < v25;
  if (v27 && (v19 >= 0.0 ? (BOOL v28 = v19 > 1.0) : (BOOL v28 = 1), !v28)
    || (v22 >= 0.0 ? (v29 = v22 > 1.0) : (v29 = 1), double v19 = v22, !v29))
  {
    *(double *)a3 = sub_2376BD9D4(a1, v19);
    *(void *)(a3 + 8) = v30;
  }
}

void *sub_2376BDDDC(void *result)
{
  return result;
}

uint64_t sub_2376BDDEC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (*(void *)result == v2)
  {
    *(_DWORD *)(result + 16) = *(_DWORD *)a2;
    *(_OWORD *)(result + 72) = *(_OWORD *)(*(void *)(a2 + 8) + 48);
    *(_OWORD *)(result + 56) = *(_OWORD *)(*(void *)(a2 + 8) + 32);
    *(_OWORD *)(result + 40) = *(_OWORD *)(*(void *)(a2 + 8) + 16);
    *(_OWORD *)(result + 24) = *(_OWORD *)*(void *)(a2 + 8);
  }
  *(void *)(result + 8) = v2 + 1;
  return result;
}

void sub_2376BE150(double *a1, double *a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v11 = a6;
  double v12 = *a1;
  double v13 = a1[2];
  double v14 = a1[4];
  double v15 = a1[5];
  double v16 = a1[6];
  double v17 = a1[7];
  double v19 = a2[2];
  double v18 = a2[3];
  double v20 = v18 - a2[1];
  double v21 = v19 - *a2;
  float v22 = v21 * v21 + v20 * v20;
  double v23 = (float)(1.0 / sqrtf(v22));
  double v24 = v20 * v23;
  double v25 = -(v21 * v23);
  double v26 = v18 * v25 + v24 * v19;
  double v57 = a1[3];
  double v58 = a1[1];
  v59.f64[0] = 0.0;
  v59.f64[1] = v58 * v25 + v24 * v12 - v26;
  uint64_t v60 = 0x3FD5555555555555;
  double v61 = v57 * v25 + v24 * v13 - v26;
  double v55 = v17;
  double v56 = v15;
  uint64_t v62 = 0x3FE5555555555555;
  double v63 = v15 * v25 + v24 * v14 - v26;
  uint64_t v64 = 0x3FF0000000000000;
  double v65 = v17 * v25 + v24 * v16 - v26;
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  sub_2376C2D34(&v59, (uint64_t)&v59, v27, 1.0);
  uint64_t v28 = [v27 count];
  if (v28 >= 1)
  {
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    double v54 = v14;
    do
    {
      float64x2_t v31 = [v27 objectAtIndex:v30];
      [v31 doubleValue];
      double v33 = v32;

      double v35 = v33 * (v33 * (v16 * v33 + (1.0 - v33) * v14) + (1.0 - v33) * (v14 * v33 + (1.0 - v33) * v13))
          + (1.0 - v33) * (v33 * (v14 * v33 + (1.0 - v33) * v13) + (1.0 - v33) * (v13 * v33 + (1.0 - v33) * v12));
      double v36 = a2[2] - *a2;
      double v37 = v35 - *a2;
      if (v36 * v37 > -0.001)
      {
        double v34 = 1.0 - v33;
        double v38 = v33 * (v33 * (v55 * v33 + v34 * v56) + v34 * (v56 * v33 + v34 * v57))
            + v34 * (v33 * (v56 * v33 + v34 * v57) + v34 * (v57 * v33 + v34 * v58));
        double v39 = a2[1];
        double v40 = a2[3] - v39;
        double v41 = v40 * v40 + v36 * v36;
        double v42 = (v38 - v39) * (v38 - v39) + v37 * v37;
        if (v40 * (v38 - v39) > -0.001 && v42 <= v41)
        {
          if (!v11) {
            break;
          }
          double v44 = v13;
          double v45 = v16;
          double v46 = v12;
          double v47 = sqrt(v42) / sqrt(v41);
          v48 = [AKTSDPathIntersection alloc];
          if (a5)
          {
            uint64_t v49 = a4;
            double v50 = v47;
            uint64_t v51 = a3;
            double v52 = v33;
          }
          else
          {
            uint64_t v49 = a3;
            double v50 = v33;
            uint64_t v51 = a4;
            double v52 = v47;
          }
          v53 = -[AKTSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](v48, "initWithSegment:atT:onSegmentB:atT:atPoint:", v49, v51, v50, v52, v35, v38);
          [v11 addObject:v53];

          double v12 = v46;
          double v16 = v45;
          double v13 = v44;
          double v14 = v54;
        }
      }
      ++v30;
    }
    while (v29 != v30);
  }
}

void sub_2376BE470(double *a1, double *a2, uint64_t a3, uint64_t a4, void *a5)
{
  double v12 = 0.0;
  double v13 = 0.0;
  long long v11 = *MEMORY[0x263F00148];
  if (sub_2376BDB00(a1, a2, &v13, &v12, (double *)&v11))
  {
    id v8 = a5;
    float v9 = [AKTSDPathIntersection alloc];
    double v10 = [(AKTSDPathIntersection *)v9 initWithSegment:a3 atT:a4 onSegmentB:v13 atT:v12 atPoint:v11];
    [v8 addObject:v10];
  }
}

double sub_2376BFC78(float64x2_t *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  float64x2_t v7 = a1[1];
  float64x2_t v8 = a1[2];
  float64x2_t v9 = vmlaq_n_f64(vmulq_n_f64(v8, a7), v7, a6);
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(a1[3], a7), v8, a6), a5), v9, a4), a3), vmlaq_n_f64(vmulq_n_f64(v9, a5), vmlaq_n_f64(vmulq_n_f64(v7, a7), *a1, a6), a4), a2);
  return result;
}

void sub_2376BFCBC(float64x2_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, int a7, uint64_t a8)
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v15 = a2;
  id v16 = a5;
  id v17 = a6;
  float v101 = 0.0;
  uint64_t v100 = 0;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, a1->f64[0], a1->f64[1]);
  double v98 = v18;
  double v99 = v19;
  v104.f64[0] = v18;
  v104.f64[1] = v19;
  [v15 curvatureAt:v100 fromElement:v101];
  float v21 = v20;
  *(float *)&double v20 = v101;
  [v15 myGradientAt:v100 fromElement:v20];
  double v94 = v22;
  double v92 = v23;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, a1[3].f64[0], a1[3].f64[1]);
  double v25 = v24;
  double v97 = v26;
  double v109 = v26;
  double v110 = v24;
  [v15 curvatureAt:v100 fromElement:v101];
  float v28 = v27;
  *(float *)&double v27 = v101;
  [v15 myGradientAt:v100 fromElement:v27];
  double v93 = v29;
  double v91 = v30;
  float v31 = 0.5;
  if (v21 <= 0.5) {
    float v32 = v21;
  }
  else {
    float v32 = 0.5;
  }
  if (v32 >= -0.5) {
    float v33 = v32;
  }
  else {
    float v33 = -0.5;
  }
  if (v28 <= 0.5) {
    float v31 = v28;
  }
  if (v31 < -0.5) {
    float v31 = -0.5;
  }
  float v90 = v31;
  [v15 lineWidth];
  float v35 = v34;
  double v36 = a1->f64[1];
  double v96 = v25;
  if (v16)
  {
    [v16 pressureAt:a1->f64[0]];
    double v38 = v35;
    double v39 = v36 * v37 * v38;
    double v40 = a1[1].f64[1];
    [v16 pressureAt:a1[1].f64[0]];
    double v42 = v40 * v41 * v38;
    double v43 = a1[2].f64[1];
    [v16 pressureAt:a1[2].f64[0]];
    double v45 = v43 * v44 * v38;
    double v46 = a1[3].f64[1];
    [v16 pressureAt:a1[3].f64[0]];
  }
  else
  {
    double v38 = v35;
    double v39 = v36 * v38;
    double v42 = a1[1].f64[1] * v38;
    double v45 = a1[2].f64[1] * v38;
    double v46 = a1[3].f64[1];
    double v47 = 1.0;
  }
  float v48 = v42;
  float v49 = v39;
  float v50 = v45;
  float v51 = v38 * (v46 * v47);
  float64_t v52 = a1[1].f64[0] - a1->f64[0];
  double v53 = (float)(v48 - v49);
  double v54 = sub_23768461C(v94, v92, 1.0 - (float)(v33 * v49));
  double v55 = sub_23768465C(-v92, v94);
  double v56 = sub_237684604(v98, v99, v55 * v53 + v52 * v54);
  double v105 = v56;
  double v106 = v57;
  double v95 = v57;
  float64_t v58 = a1[2].f64[0] - a1[3].f64[0];
  double v59 = sub_23768461C(v93, v91, 1.0 - (float)(v90 * v51));
  double v60 = sub_23768465C(-v91, v93);
  double v61 = sub_237684604(v97, v96, v60 * (float)(v50 - v51) + v58 * v59);
  double v63 = v62;
  double v107 = v61;
  double v108 = v62;
  if (a7)
  {
    if (a7 > 19) {
      goto LABEL_19;
    }
    double v64 = sub_237684610(v97, v96, v98);
    if (sub_237684638(v64, v65) <= 0.5) {
      goto LABEL_19;
    }
  }
  double v66 = sub_2376BD9D4(&v104, 0.33);
  double v68 = v67;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, sub_2376BD9D4(a1, 0.33));
  double v70 = sub_237684610(v66, v68, v69);
  *(float *)&double v68 = sub_237684638(v70, v71) + 0.0;
  double v72 = sub_2376BD9D4(&v104, 0.5);
  double v74 = v73;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, sub_2376BD9D4(a1, 0.5));
  double v76 = sub_237684610(v72, v74, v75);
  float v78 = sub_237684638(v76, v77) + *(float *)&v68;
  double v79 = sub_2376BD9D4(&v104, 0.66);
  double v81 = v80;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, sub_2376BD9D4(a1, 0.66));
  double v83 = sub_237684610(v79, v81, v82);
  float v85 = sub_237684638(v83, v84) + v78;
  if (v85 <= 0.2)
  {
LABEL_19:
    if (a8)
    {
      objc_msgSend(v17, "moveToPoint:", v98, v99);
    }
    else
    {
      [v17 currentPoint];
      double v88 = sub_237684610(v98, v99, v87);
      if (sub_237684638(v88, v89) > 1.0) {
        objc_msgSend(v17, "lineToPoint:", v98, v99);
      }
    }
    objc_msgSend(v17, "curveToPoint:controlPoint1:controlPoint2:", v97, v96, v56, v95, v61, v63);
  }
  else
  {
    sub_2376BDA2C(a1, (uint64_t)v103, 0.0, 0.5);
    sub_2376BDA2C(a1, (uint64_t)v102, 0.5, 1.0);
    uint64_t v86 = (a7 + 1);
    sub_2376BFCBC(v103, v15, a3, a4, v16, v17, v86, a8);
    sub_2376BFCBC(v102, v15, a3, a4, v16, v17, v86, 0);
  }
}

void sub_2376C0254(float64x2_t *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v131 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [v13 count];
  uint64_t v15 = v14 - 1;
  v127 = v12;
  if ((unint64_t)(v14 - 1) < 2)
  {
    id v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_23;
  }
  uint64_t v16 = v14;
  uint64_t v129 = v14 - 1;
  id v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  double v20 = a1[1].f64[0];
  double v21 = a1[2].f64[0];
  double v22 = a1[3].f64[0];
  float v23 = fmin(a1->f64[0], fmin(v20, fmin(v21, v22)));
  float v24 = fmax(a1->f64[0], fmax(v20, fmax(v21, v22)));
  uint64_t v25 = 2;
  do
  {
    double v26 = [v13 objectAtIndex:v25 - 1];
    [v26 t];
    float v28 = v27;
    if (v28 > v23 && v28 < v24)
    {
      if (!v17) {
        id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      double v30 = v28;
      v132.f64[0] = v30;
      v132.f64[1] = -100.0;
      v133.f64[0] = v30;
      v133.f64[1] = 100.0;
      sub_2376BE150(a1->f64, v132.f64, v25 - 1, v25 - 1, 0, v17);
    }
    else
    {
      double v30 = v28;
    }
    double v31 = a1[3].f64[0];
    if (v31 > v30) {
      uint64_t v18 = v25 - 1;
    }
    if (v31 < v30) {
      uint64_t v32 = v25 - 1;
    }
    else {
      uint64_t v32 = 0;
    }
    if (!v19) {
      uint64_t v19 = v32;
    }

    ++v25;
  }
  while (v16 != v25);
  id v12 = v127;
  uint64_t v15 = v129;
  if (!v19)
  {
LABEL_23:
    uint64_t v19 = v15;
    if (!v17) {
      goto LABEL_37;
    }
    goto LABEL_24;
  }
  if (!v17)
  {
LABEL_37:
    double v89 = [v13 objectAtIndex:v18];
    float v90 = [v13 objectAtIndex:v19];
    [v89 t];
    double v92 = v91;
    [v90 t];
    double v94 = v93;
    [v89 skew];
    double v96 = v95;
    [v90 skew];
    double v98 = v97;
    [v131 lineWidth];
    double v100 = v99;
    [v131 length];
    uint64_t v101 = 0;
    float64x2_t v102 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    float v103 = v96;
    *(double *)&uint64_t v104 = (float)-v103;
    float v105 = v98;
    *(double *)&uint64_t v106 = (float)(v103 + v105);
    float v108 = v100 / v107;
    *(float *)&double v107 = v94;
    float v109 = v92;
    *(double *)&uint64_t v110 = (float)(*(float *)&v107 - v109);
    float64x2_t v111 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v109), 0);
    float64x2_t v112 = (float64x2_t)vdupq_lane_s64(v110, 0);
    float64x2_t v113 = (float64x2_t)vdupq_lane_s64(v106, 0);
    double v114 = v108;
    float64x2_t v115 = (float64x2_t)vdupq_lane_s64(v104, 0);
    __asm
    {
      FMOV            V6.2D, #0.5
      FMOV            V7.2D, #1.0
    }
    do
    {
      f64 = a1[v101].f64;
      float64x2x2_t v139 = vld2q_f64(f64);
      float64x2_t v119 = vdivq_f64(vsubq_f64(v139.val[0], v111), v112);
      float64x2_t v120 = vabsq_f64(v119);
      v139.val[0] = vmlaq_f64(v139.val[0], v139.val[1], vmulq_n_f64(vmlaq_f64(v115, v113, vmaxnmq_f64(vminnmq_f64((float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcgtq_f64(v102, v120), (int8x16_t)vcgtq_f64(v120, v102)), (int8x16_t)v119, _Q6), _Q7), (float64x2_t)0)), v114));
      double *f64 = v139.val[0].f64[0];
      a1[v101 + 1].f64[0] = v139.val[0].f64[1];
      v101 += 2;
    }
    while (v101 != 4);
    sub_2376BFCBC(a1, v131, [v89 segment] + 1, objc_msgSend(v90, "segment"), v11, v12, 0, a5);

    goto LABEL_40;
  }
LABEL_24:
  if (![v17 count]) {
    goto LABEL_37;
  }
  v128 = v11;
  [v17 sortUsingSelector:sel_compareT_];
  v121 = -[AKTSDPathIntersection initWithSegment:atT:atPoint:]([AKTSDPathIntersection alloc], "initWithSegment:atT:atPoint:", v18, 1.0, 1000.0, 0.0);
  objc_msgSend(v17, "addObject:");
  uint64_t v126 = [v17 count];
  if (v126)
  {
    uint64_t v33 = 0;
    uint64_t v122 = v126 - 1;
    float v34 = 0.0;
    __asm { FMOV            V0.2D, #0.5 }
    int8x16_t v124 = _Q0;
    float64x2_t v125 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    __asm { FMOV            V0.2D, #1.0 }
    float64x2_t v123 = _Q0;
    do
    {
      float v40 = v34;
      double v41 = [v17 objectAtIndex:v33];
      [v41 t];
      float64x2_t v42 = a1[1];
      float64x2_t v132 = *a1;
      float64x2_t v133 = v42;
      float64x2_t v43 = a1[3];
      float64x2_t v134 = a1[2];
      float64x2_t v135 = v43;
      float v34 = v44;
      v43.f64[0] = 1.0 - v40;
      float64x2_t v45 = vmlaq_n_f64(vmulq_n_f64(v134, v40), v133, v43.f64[0]);
      float64x2_t v130 = vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(v135, v40), v134, v43.f64[0]), v40), v45, v43.f64[0]), v40), vmlaq_n_f64(vmulq_n_f64(v45, v40), vmlaq_n_f64(vmulq_n_f64(v133, v40), v132, v43.f64[0]), v43.f64[0]), v43.f64[0]);
      double v46 = 1.0 - v34;
      float64x2_t v47 = vmlaq_n_f64(vmulq_n_f64(v133, v34), v132, v46);
      float64x2_t v48 = vmlaq_n_f64(vmulq_n_f64(v134, v34), v133, v46);
      float64x2_t v49 = vmlaq_n_f64(vmulq_n_f64(v135, v34), v134, v46);
      float64x2_t v132 = v130;
      float64x2_t v133 = vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(v49, v40), v48, v43.f64[0]), v40), vmlaq_n_f64(vmulq_n_f64(v48, v40), v47, v43.f64[0]), v43.f64[0]);
      float64x2_t v50 = vmlaq_n_f64(vmulq_n_f64(v48, v34), v47, v46);
      float64x2_t v51 = vmlaq_n_f64(vmulq_n_f64(v49, v34), v48, v46);
      float64x2_t v134 = vmlaq_n_f64(vmulq_n_f64(v51, v40), v50, v43.f64[0]);
      float64x2_t v135 = vmlaq_n_f64(vmulq_n_f64(v51, v34), v50, v46);
      [v41 point];
      double v53 = v52;
      uint64_t v54 = [v41 segment];
      uint64_t v55 = [v41 segment];
      if (v130.f64[0] <= v53)
      {
        if (v33 == v122) {
          uint64_t v56 = v55 + 1;
        }
        else {
          uint64_t v56 = v55;
        }
        v54 -= v33 != v122;
      }
      else
      {
        uint64_t v56 = v55 + 1;
      }
      double v57 = objc_msgSend(v13, "objectAtIndex:", v54, v130.f64[0]);
      float64_t v58 = [v13 objectAtIndex:v56];
      [v57 t];
      double v60 = v59;
      [v58 t];
      double v62 = v61;
      [v57 skew];
      double v64 = v63;
      [v58 skew];
      double v66 = v65;
      [v131 lineWidth];
      double v68 = v67;
      [v131 length];
      uint64_t v69 = 0;
      float v70 = v64;
      *(double *)&uint64_t v71 = (float)-v70;
      float v72 = v66;
      *(double *)&uint64_t v73 = (float)(v70 + v72);
      *(float *)&double v74 = v68 / v74;
      double v75 = *(float *)&v74;
      float v76 = v62;
      float v77 = v60;
      *(double *)&uint64_t v78 = (float)(v76 - v77);
      float64x2_t v79 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v77), 0);
      float64x2_t v80 = (float64x2_t)vdupq_lane_s64(v78, 0);
      float64x2_t v81 = (float64x2_t)vdupq_lane_s64(v73, 0);
      float64x2_t v82 = (float64x2_t)vdupq_lane_s64(v71, 0);
      do
      {
        double v83 = &v132.f64[v69];
        float64x2x2_t v138 = vld2q_f64(v83);
        float64x2_t v84 = vdivq_f64(vsubq_f64(v138.val[0], v79), v80);
        float64x2_t v85 = vabsq_f64(v84);
        v138.val[0] = vmlaq_f64(v138.val[0], v138.val[1], vmulq_n_f64(vmlaq_f64(v82, v81, vmaxnmq_f64(vminnmq_f64((float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcgtq_f64(v125, v85), (int8x16_t)vcgtq_f64(v85, v125)), (int8x16_t)v84, v124), v123), (float64x2_t)0)), v75));
        *double v83 = v138.val[0].f64[0];
        *(float64_t *)((char *)&v132 + v69 * 8 + 16) = v138.val[0].f64[1];
        v69 += 4;
      }
      while (v69 != 8);
      uint64_t v86 = [v57 segment] + 1;
      uint64_t v87 = [v58 segment];
      uint64_t v88 = v86;
      id v12 = v127;
      sub_2376BFCBC(&v132, v131, v88, v87, v128, v127, 0, a5 & 1);

      LOBYTE(a5) = 0;
      ++v33;
    }
    while (v33 != v126);
  }

  id v11 = v128;
LABEL_40:
}

CGPath *sub_2376C171C(int a1, int a2, double a3, double a4, double a5, double a6, long double a7, double a8, double a9)
{
  double v15 = (a3 - a8) * 0.5;
  double v16 = (a4 - a9) * 0.5;
  long double v17 = fmod(a7, 360.0);
  __double2 v18 = __sincos_stret(v17 * 3.14159265 / 180.0);
  double v19 = v18.__sinval * v16 + v18.__cosval * v15;
  double v20 = v18.__cosval * v16 - v18.__sinval * v15;
  double v21 = fabs(a5);
  double v22 = fabs(a6);
  double v23 = a5 * a5;
  double v24 = a6 * a6;
  double v25 = v19 * v19 / (a5 * a5) + v20 * v20 / (a6 * a6);
  if (v25 > 1.0)
  {
    double v26 = sqrt(v25);
    double v21 = v21 * v26;
    double v22 = v22 * v26;
    double v23 = v21 * v21;
    double v24 = v22 * v22;
  }
  double v27 = (v23 * v24 - v23 * (v20 * v20) - v24 * (v19 * v19)) / (v19 * v19 * v24 + v23 * (v20 * v20));
  if (v27 < 0.0) {
    double v27 = 0.0;
  }
  double v28 = sqrt(v27);
  if (a1 == a2) {
    double v28 = -v28;
  }
  double v29 = v20 * v21 / v22 * v28;
  double v30 = -(v22 * v19) / v21 * v28;
  double v31 = (a4 + a9) * 0.5;
  double v46 = (a3 + a8) * 0.5 + v30 * -v18.__sinval + v18.__cosval * v29;
  double v32 = v31 + v18.__cosval * v30 + v18.__sinval * v29;
  double v33 = (v20 - v30) / v22;
  double v34 = (-v19 - v29) / v21;
  double v35 = (-v20 - v30) / v22;
  double v36 = acos((v19 - v29) / v21 / sqrt(v33 * v33 + (v19 - v29) / v21 * ((v19 - v29) / v21)));
  if (v33 < 0.0) {
    double v36 = -v36;
  }
  double v37 = v36 * 180.0 / 3.14159265;
  double v38 = acos(v34 / sqrt(v35 * v35 + v34 * v34));
  if (v35 < 0.0) {
    double v38 = -v38;
  }
  long double v39 = fmod(v38 * 180.0 / 3.14159265, 360.0);
  long double v40 = fmod(v37, 360.0);
  Mutable = CGPathCreateMutable();
  long long v42 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&m.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&m.c = v42;
  *(_OWORD *)&m.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v49.a = *(_OWORD *)&m.a;
  *(_OWORD *)&v49.c = v42;
  *(_OWORD *)&v49.tdouble x = *(_OWORD *)&m.tx;
  CGAffineTransformTranslate(&m, &v49, v46, v32);
  CGAffineTransform v48 = m;
  CGAffineTransformRotate(&v49, &v48, a7 * 180.0 / 3.14159265);
  CGAffineTransform m = v49;
  CGAffineTransform v48 = v49;
  CGAffineTransformScale(&v49, &v48, 1.0, v22 / v21);
  CGAffineTransform m = v49;
  CGAffineTransform v48 = v49;
  CGAffineTransformTranslate(&v49, &v48, -v46, -v32);
  CGAffineTransform m = v49;
  CGPathMoveToPoint(Mutable, &m, 0.0, 0.0);
  CGPathAddArc(Mutable, &m, v46, v32, v21, v40, v39, a2 != 1);
  return Mutable;
}

CGPath *sub_2376C1A48(const CGPath *a1, const CGPath *a2, uint64_t a3, uint64_t a4)
{
  MutableCopdouble y = CGPathCreateMutableCopy(a1);
  if (a3 < a4)
  {
    do
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v10 = 0u;
      uint64_t info = a3;
      CGPathApply(a2, &info, (CGPathApplierFunction)sub_2376BDDEC);
      if (DWORD2(v10) == 3)
      {
        CGPathAddCurveToPoint(MutableCopy, 0, *(CGFloat *)&v11, *((CGFloat *)&v11 + 1), *(CGFloat *)&v12, *((CGFloat *)&v12 + 1), *(CGFloat *)&v13, *((CGFloat *)&v13 + 1));
      }
      else if (DWORD2(v10))
      {
        if (DWORD2(v10) == 1)
        {
          CGPathAddLineToPoint(MutableCopy, 0, *(CGFloat *)&v11, *(CGFloat *)&v11);
        }
        else if (DWORD2(v10) == 4)
        {
          CGPathCloseSubpath(MutableCopy);
        }
      }
      else
      {
        CGPathMoveToPoint(MutableCopy, 0, *(CGFloat *)&v11, *((CGFloat *)&v11 + 1));
      }
      ++a3;
    }
    while (a4 != a3);
  }
  return MutableCopy;
}

const CGPath *sub_2376C1B48(void *a1)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v1 = a1;
  Mutable = CGPathCreateMutable();
  double v86 = 0.0;
  double v87 = 0.0;
  double v4 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v73 = v1;
  double v5 = [MEMORY[0x263F08B08] scannerWithString:v1];
  uint64_t v88 = *(void *)asc_2376F45D0;
  int v89 = 2883717;
  double v6 = (void *)MEMORY[0x263F08708];
  float64x2_t v7 = [NSString stringWithCharacters:&v88 length:6];
  float64x2_t v8 = [v6 characterSetWithCharactersInString:v7];
  [v5 setCharactersToBeSkipped:v8];

  id v9 = 0;
  unsigned __int16 v10 = 0;
  double v11 = v3;
  double v12 = v4;
  while (1)
  {
    long long v13 = v9;
    long long v14 = [MEMORY[0x263F08708] letterCharacterSet];
    id v85 = v9;
    int v15 = [v5 scanCharactersFromSet:v14 intoString:&v85];
    id v9 = v85;

    if (!v15) {
      break;
    }
    int v16 = [v9 characterAtIndex:0];
    unsigned __int16 v17 = v16;
    if (v16 > 96)
    {
      switch(v16)
      {
        case 'a':
          CGPoint CurrentPoint = CGPathGetCurrentPoint(Mutable);
          double v76 = 0.0;
          double v74 = 0.0;
          uint64_t v83 = 0;
          long double v84 = 0.0;
          double v81 = 0.0;
          uint64_t v82 = 0;
          double v80 = 0.0;
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v74];
          [v5 scanCGFloat:&v84];
          [v5 scanInteger:&v83];
          [v5 scanInteger:&v82];
          [v5 scanCGFloat:&v81];
          [v5 scanCGFloat:&v80];
          double v80 = CurrentPoint.y + v80;
          double v81 = CurrentPoint.x + v81;
          double v23 = sub_2376C171C(v83 != 0, v82 != 0, CurrentPoint.x, CurrentPoint.y, v76, v74, v84, v81, v80);
          double info = 0.0;
          CGPathApply(v23, &info, (CGPathApplierFunction)sub_2376BDDDC);
          double v24 = sub_2376C1A48(Mutable, v23, 1, *(uint64_t *)&info);
          CGPathRelease(v23);
          CGPathRelease(Mutable);
          Mutable = CGPathCreateMutableCopy(v24);
          double v21 = v24;
LABEL_8:
          CGPathRelease(v21);
          break;
        case 'b':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'i':
        case 'j':
        case 'k':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
        case 'u':
          goto LABEL_10;
        case 'c':
          CGPoint v54 = CGPathGetCurrentPoint(Mutable);
          double info = 0.0;
          double v79 = 0.0;
          double v76 = 0.0;
          double v77 = 0.0;
          double v74 = 0.0;
          double v75 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v77];
          [v5 scanCGFloat:&v74];
          [v5 scanCGFloat:&v75];
          double v25 = v54.x + info;
          double v27 = v54.x + v76;
          double v29 = v54.x + v74;
          double v26 = v54.y + v79;
          double info = v54.x + info;
          double v79 = v54.y + v79;
          double v28 = v54.y + v77;
          double v76 = v54.x + v76;
          double v77 = v54.y + v77;
          double v30 = v54.y + v75;
          double v74 = v54.x + v74;
          double v75 = v54.y + v75;
LABEL_31:
          CGPathAddCurveToPoint(Mutable, 0, v25, v26, v27, v28, v29, v30);
          double v12 = v76;
          double v11 = v77;
          break;
        case 'h':
          [v5 scanCGFloat:&v86];
          CGPoint v55 = CGPathGetCurrentPoint(Mutable);
          double y = v55.y;
          double v32 = v86 - v55.x;
          goto LABEL_52;
        case 'l':
          unsigned __int16 v10 = v16;
          if (![v5 scanCGFloat:&v86]) {
            continue;
          }
          do
          {
            [v5 scanCGFloat:&v87];
            CGPoint v56 = CGPathGetCurrentPoint(Mutable);
            CGPathAddLineToPoint(Mutable, 0, v86 - v56.x, v87 - v56.y);
          }
          while (([v5 scanCGFloat:&v86] & 1) != 0);
          break;
        case 'm':
          CGPoint v57 = CGPathGetCurrentPoint(Mutable);
          [v5 scanCGFloat:&v86];
          [v5 scanCGFloat:&v87];
          double info = 0.0;
          CGPathApply(Mutable, &info, (CGPathApplierFunction)sub_2376BDDDC);
          if (*(uint64_t *)&info < 1)
          {
            double v58 = v86;
            double v59 = v87;
          }
          else
          {
            double v58 = v86 - v57.x;
            double v59 = v87 - v57.y;
          }
          CGPathMoveToPoint(Mutable, 0, v58, v59);
          unsigned __int16 v10 = v17;
          if (![v5 scanCGFloat:&v86]) {
            continue;
          }
          do
          {
            [v5 scanCGFloat:&v87];
            CGPoint v71 = CGPathGetCurrentPoint(Mutable);
            CGPathAddLineToPoint(Mutable, 0, v86 - v71.x, v87 - v71.y);
          }
          while (([v5 scanCGFloat:&v86] & 1) != 0);
          break;
        case 'q':
          CGPoint v60 = CGPathGetCurrentPoint(Mutable);
          double info = 0.0;
          double v79 = 0.0;
          double v76 = 0.0;
          double v77 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v77];
          double v34 = v60.x + info;
          double v35 = v60.y + v79;
          double info = v34;
          double v79 = v35;
          double v39 = v60.x + v76;
          double v40 = v60.y + v77;
          double v76 = v60.x + v76;
          double v77 = v60.y + v77;
          double v36 = 3.0;
          double v37 = v60.x + (v34 - v60.x + v34 - v60.x) / 3.0;
          double v38 = v60.y + (v35 - v60.y + v35 - v60.y) / 3.0;
LABEL_39:
          CGPathAddCurveToPoint(Mutable, 0, v37, v38, v34 + (v39 - v34) / v36, v35 + (v40 - v35) / v36, v39, v40);
          double v4 = info;
          double v3 = v79;
          break;
        case 's':
          CGPoint v61 = CGPathGetCurrentPoint(Mutable);
          __int16 v62 = (unsigned __int16)(v10 - 67) >> 4;
          double v63 = v61.x - v12;
          if (v62 & 0xFFFC | (unsigned __int16)((v10 - 67) << 12)) {
            double v63 = -0.0;
          }
          double v64 = v61.x + v63;
          if (v62 & 0xFFFC | (unsigned __int16)((v10 - 67) << 12)) {
            double v65 = -0.0;
          }
          else {
            double v65 = v61.y - v11;
          }
          double info = 0.0;
          double v79 = 0.0;
          CGFloat v66 = v61.y + v65;
          double v76 = 0.0;
          double v77 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v77];
          double v44 = v61.x + info;
          double v45 = v61.y + v79;
          double info = v61.x + info;
          double v79 = v61.y + v79;
          double v46 = v61.x + v76;
          double v47 = v61.y + v77;
          double v76 = v61.x + v76;
          double v77 = v61.y + v77;
          CGAffineTransform v48 = Mutable;
          CGFloat v49 = v64;
          double v50 = v66;
LABEL_46:
          CGPathAddCurveToPoint(v48, 0, v49, v50, v44, v45, v46, v47);
          double v12 = info;
          double v11 = v79;
          break;
        case 't':
          CGPoint v67 = CGPathGetCurrentPoint(Mutable);
          if (v10 - 81 > 0x23)
          {
            double x = v67.x;
            double v69 = v67.y;
          }
          else
          {
            double x = v67.x;
            double v69 = v67.y;
            if (((1 << (v10 - 81)) & 0x900000009) != 0)
            {
              double x = v67.x + v67.x - v4;
              double v69 = v67.y + v67.y - v3;
            }
          }
          double info = 0.0;
          double v79 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          double info = v67.x + info;
          double v79 = v67.y + v79;
          CGPathAddCurveToPoint(Mutable, 0, x, v67.y + (v69 - v67.y + v69 - v67.y) / 3.0, x + (info - x) / 3.0, v69 + (v79 - v69) / 3.0, info, v79);
          double v3 = v69;
          double v4 = x;
          break;
        case 'v':
          [v5 scanCGFloat:&v87];
          CGPoint v70 = CGPathGetCurrentPoint(Mutable);
          double v32 = v70.x;
          double y = v87 - v70.y;
LABEL_52:
          CGPathAddLineToPoint(Mutable, 0, v32, y);
          break;
        default:
          if (v16 == 122) {
LABEL_12:
          }
            CGPathCloseSubpath(Mutable);
          else {
LABEL_10:
          }
            NSLog(&cfstr_CannotProcessP.isa, v9);
          break;
      }
    }
    else
    {
      switch(v16)
      {
        case 'A':
          CGPoint v18 = CGPathGetCurrentPoint(Mutable);
          double v76 = 0.0;
          double v74 = 0.0;
          uint64_t v83 = 0;
          long double v84 = 0.0;
          double v81 = 0.0;
          uint64_t v82 = 0;
          double v80 = 0.0;
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v74];
          [v5 scanCGFloat:&v84];
          [v5 scanInteger:&v83];
          [v5 scanInteger:&v82];
          [v5 scanCGFloat:&v81];
          [v5 scanCGFloat:&v80];
          double v19 = sub_2376C171C(v83 != 0, v82 != 0, v18.x, v18.y, v76, v74, v84, v81, v80);
          double info = 0.0;
          CGPathApply(v19, &info, (CGPathApplierFunction)sub_2376BDDDC);
          double v20 = sub_2376C1A48(Mutable, v19, 2, *(uint64_t *)&info);
          CGPathRelease(v19);
          CGPathRelease(Mutable);
          Mutable = CGPathCreateMutableCopy(v20);
          double v21 = v20;
          goto LABEL_8;
        case 'B':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'P':
        case 'R':
        case 'U':
          goto LABEL_10;
        case 'C':
          double info = 0.0;
          double v79 = 0.0;
          double v76 = 0.0;
          double v77 = 0.0;
          double v74 = 0.0;
          double v75 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v77];
          [v5 scanCGFloat:&v74];
          [v5 scanCGFloat:&v75];
          double v25 = info;
          double v26 = v79;
          double v27 = v76;
          double v28 = v77;
          double v29 = v74;
          double v30 = v75;
          goto LABEL_31;
        case 'H':
          [v5 scanCGFloat:&v86];
          double y = CGPathGetCurrentPoint(Mutable).y;
          double v32 = v86;
          goto LABEL_52;
        case 'L':
          unsigned __int16 v10 = v16;
          if (![v5 scanCGFloat:&v86]) {
            continue;
          }
          do
          {
            [v5 scanCGFloat:&v87];
            CGPathAddLineToPoint(Mutable, 0, v86, v87);
          }
          while (([v5 scanCGFloat:&v86] & 1) != 0);
          break;
        case 'M':
          [v5 scanCGFloat:&v86];
          [v5 scanCGFloat:&v87];
          CGPathMoveToPoint(Mutable, 0, v86, v87);
          unsigned __int16 v10 = v17;
          if (![v5 scanCGFloat:&v86]) {
            continue;
          }
          do
          {
            [v5 scanCGFloat:&v87];
            CGPathAddLineToPoint(Mutable, 0, v86, v87);
          }
          while (([v5 scanCGFloat:&v86] & 1) != 0);
          break;
        case 'Q':
          CGPoint v33 = CGPathGetCurrentPoint(Mutable);
          double info = 0.0;
          double v79 = 0.0;
          double v76 = 0.0;
          double v77 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v77];
          double v34 = info;
          double v35 = v79;
          double v36 = 3.0;
          double v37 = v33.x + (info - v33.x + info - v33.x) / 3.0;
          double v38 = v33.y + (v79 - v33.y + v79 - v33.y) / 3.0;
          double v39 = v76;
          double v40 = v77;
          goto LABEL_39;
        case 'S':
          CGPoint v41 = CGPathGetCurrentPoint(Mutable);
          double v42 = v41.x - v12;
          if (((unsigned __int16)(v10 - 67) >> 4) & 0xFFFC | (unsigned __int16)((v10 - 67) << 12)) {
            double v42 = -0.0;
          }
          CGFloat v43 = v41.x + v42;
          double info = 0.0;
          double v79 = 0.0;
          double v76 = 0.0;
          double v77 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          [v5 scanCGFloat:&v76];
          [v5 scanCGFloat:&v77];
          double v44 = info;
          double v45 = v79;
          double v46 = v76;
          double v47 = v77;
          CGAffineTransform v48 = Mutable;
          CGFloat v49 = v43;
          double v50 = v41.y + v41.x;
          goto LABEL_46;
        case 'T':
          CGPoint v51 = CGPathGetCurrentPoint(Mutable);
          if (v10 - 81 > 0x23)
          {
            double v52 = v51.x;
            double v53 = v51.y;
          }
          else
          {
            double v52 = v51.x;
            double v53 = v51.y;
            if (((1 << (v10 - 81)) & 0x900000009) != 0)
            {
              double v52 = v51.x + v51.x - v4;
              double v53 = v51.y + v51.y - v3;
            }
          }
          double info = 0.0;
          double v79 = 0.0;
          [v5 scanCGFloat:&info];
          [v5 scanCGFloat:&v79];
          CGPathAddCurveToPoint(Mutable, 0, v51.x + (v52 - v51.x + v52 - v51.x) / 3.0, v51.y + (v53 - v51.y + v53 - v51.y) / 3.0, v52 + (info - v52) / 3.0, v53 + (v79 - v53) / 3.0, info, v79);
          double v3 = v53;
          double v4 = v52;
          break;
        case 'V':
          [v5 scanCGFloat:&v87];
          *(void *)&double v32 = *(_OWORD *)&CGPathGetCurrentPoint(Mutable);
          double y = v87;
          goto LABEL_52;
        default:
          if (v16 != 90) {
            goto LABEL_10;
          }
          goto LABEL_12;
      }
    }
    unsigned __int16 v10 = v17;
  }

  return Mutable;
}

void sub_2376C27EC(float64x2_t *a1, double *a2, uint64_t a3, uint64_t a4, int a5, void *a6, double a7, double a8, double a9, double a10)
{
  v43[8] = *(double *)MEMORY[0x263EF8340];
  id v38 = a6;
  double v41 = 0.0;
  double v42 = 0.0;
  sub_2376C2AA4(a1->f64, a2, &v42, &v41);
  double v19 = v42;
  if (v42 <= 1.0)
  {
    double v20 = v41;
    if (v41 >= 0.0)
    {
      if ((v41 - v42) * a7 >= 0.0001)
      {
        if (v41 - v42 >= 0.8)
        {
          double v35 = (v42 + v41) * 0.5;
          sub_2376BDA2C(a1, (uint64_t)v43, v42, v35);
          uint64_t v36 = a5 ^ 1u;
          sub_2376C27EC(a2, v43, a4, a3, v36, v38, a9, a10, (v20 - v35) * a7, a8 + v19 * a7);
          sub_2376BDA2C(a1, (uint64_t)v43, (v19 + v20) * 0.5, v20);
          double v27 = a8 + v35 * a7;
          double v29 = a2;
          double v30 = a9;
          double v31 = a10;
          double v32 = (v20 - v35) * a7;
          uint64_t v33 = a4;
          uint64_t v34 = a3;
          uint64_t v28 = v36;
        }
        else
        {
          sub_2376BDA2C(a1, (uint64_t)v43, v42, v41);
          double v27 = a8 + v19 * a7;
          uint64_t v28 = a5 ^ 1u;
          double v29 = a2;
          double v30 = a9;
          double v31 = a10;
          double v32 = (v20 - v19) * a7;
          uint64_t v33 = a4;
          uint64_t v34 = a3;
        }
        sub_2376C27EC(v29, v43, v33, v34, v28, v38, v30, v31, v32, v27);
      }
      else
      {
        double v39 = 0.0;
        double v40 = 0.0;
        sub_2376BDA2C(a1, (uint64_t)v43, v42, v41);
        sub_2376C2AA4(a2, v43, &v40, &v39);
        if ((v39 - v40) * a9 < 0.1)
        {
          double v21 = (v39 + v40) * a9 * 0.5 + a10;
          double v22 = [AKTSDPathIntersection alloc];
          if (a5)
          {
            uint64_t v23 = a4;
            double v24 = v21;
            uint64_t v25 = a3;
            double v26 = (v19 + v20) * a7 * 0.5 + a8;
          }
          else
          {
            uint64_t v23 = a3;
            double v24 = (v19 + v20) * a7 * 0.5 + a8;
            uint64_t v25 = a4;
            double v26 = v21;
          }
          double v37 = -[AKTSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](v22, "initWithSegment:atT:onSegmentB:atT:atPoint:", v23, v25, v24, v26, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v38);
          [v38 addObject:v37];
        }
      }
    }
  }
}

double *sub_2376C2AA4(double *a1, double *a2, double *a3, double *a4)
{
  v28[8] = *MEMORY[0x263EF8340];
  double v6 = a2[6];
  double v7 = a2[7];
  double v8 = v7 - a2[1];
  double v9 = v6 - *a2;
  float v10 = v9 * v9 + v8 * v8;
  double v11 = (float)(1.0 / sqrtf(v10));
  double v12 = v8 * v11;
  double v13 = -(v9 * v11);
  double v14 = v7 * v13 + v12 * v6;
  double v15 = a1[1] * v13 + v12 * *a1 - v14;
  v28[0] = 0;
  *(double *)&v28[1] = v15;
  double v16 = a1[3] * v13 + v12 * a1[2] - v14;
  v28[2] = 0x3FD5555555555555;
  *(double *)&v28[3] = v16;
  double v17 = v13 * a1[5] + v12 * a1[4] - v14;
  v28[4] = 0x3FE5555555555555;
  *(double *)&v28[5] = v17;
  double v18 = v13 * a1[7] + v12 * a1[6] - v14;
  v28[6] = 0x3FF0000000000000;
  *(double *)&v28[7] = v18;
  double v19 = v13 * a2[3] + v12 * a2[2] - v14;
  double v20 = v13 * a2[5] + v12 * a2[4] - v14;
  double v21 = fmin(v19, fmin(v20, 0.0));
  double v22 = fmax(v19, fmax(v20, 0.0));
  *a3 = 2.0;
  *a4 = -1.0;
  sub_2376C2C6C(a3, a4, (uint64_t)v28, v21);
  double result = sub_2376C2C6C(a3, a4, (uint64_t)v28, v22);
  for (uint64_t i = 0; i != 8; i += 2)
  {
    double v25 = *(double *)&v28[i + 1];
    if (v25 > v21 && v25 < v22)
    {
      double v27 = *(double *)&v28[i];
      *a3 = fmin(*a3, v27);
      *a4 = fmax(*a4, v27);
    }
  }
  return result;
}

double *sub_2376C2C6C(double *result, double *a2, uint64_t a3, double a4)
{
  unint64_t v4 = 0;
  double v5 = (double *)(a3 + 24);
  uint64_t v6 = 3;
  do
  {
    if (v4 <= 2)
    {
      double v7 = (double *)(a3 + 16 * v4);
      double v8 = v7 + 1;
      double v9 = v5;
      uint64_t v10 = v6;
      do
      {
        double v11 = *v8;
        if ((*v8 <= a4 || *v9 <= a4) && (v11 >= a4 || *v9 >= a4))
        {
          double v12 = *v7;
          double v13 = *(v9 - 1) - *v7;
          if (v13 != 0.0) {
            double v12 = v13 * (a4 - (v11 - v12 * (*v9 - v11) / v13)) / (*v9 - v11);
          }
          if (v12 < *result) {
            double *result = v12;
          }
          if (v12 > *a2) {
            *a2 = v12;
          }
        }
        v9 += 2;
        --v10;
      }
      while (v10);
    }
    ++v4;
    --v6;
    v5 += 2;
  }
  while (v4 != 4);
  return result;
}

void sub_2376C2D34(float64x2_t *a1, uint64_t a2, void *a3, double a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v15 = 2.0;
  id v13 = a3;
  double v14 = -1.0;
  sub_2376C2C6C(&v15, &v14, a2, 0.0);
  double v7 = v15;
  if (v15 <= 1.0)
  {
    double v8 = v14;
    if (v14 >= 0.0)
    {
      if (v14 - v15 >= 0.00005)
      {
        if (v14 - v15 >= a4 * 0.8)
        {
          double v12 = (v15 + v14) * 0.5;
          sub_2376BDA2C(a1, (uint64_t)v16, v15, v12);
          sub_2376C2D34(a1, v16, v13, v12 - v7);
          sub_2376BDA2C(a1, (uint64_t)v16, (v7 + v8) * 0.5, v8);
          double v11 = v8 - v12;
          uint64_t v10 = a1;
        }
        else
        {
          sub_2376BDA2C(a1, (uint64_t)v16, v15, v14);
          uint64_t v10 = a1;
          double v11 = v8 - v7;
        }
        sub_2376C2D34(v10, v16, v13, v11);
      }
      else
      {
        double v9 = [NSNumber numberWithDouble:(v15 + v14) * 0.5];
        [v13 addObject:v9];
      }
    }
  }
}

void sub_2376C3708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2376C3724(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v17 rectangle];
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
      CGFloat v10 = CGRectGetHeight(v19) * 0.25;
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGRect v21 = CGRectInset(v20, 0.0, v10);
      CGFloat v11 = v21.origin.x;
      CGFloat v12 = v21.origin.y;
      CGFloat v13 = v21.size.width;
      CGFloat v14 = v21.size.height;
      if (CGRectIntersectsRect(v21, *(CGRect *)(a1 + 40)))
      {
        double v15 = j__NSStringFromCGRect(*(CGRect *)(a1 + 40));
        v22.origin.CGFloat x = v11;
        v22.origin.CGFloat y = v12;
        v22.size.CGFloat width = v13;
        v22.size.CGFloat height = v14;
        double v16 = j__NSStringFromCGRect(v22);
        AKLog(@"Proposed rectangle feature %@ intersects an existing annotation %@!");

        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
}

id sub_2376C4650()
{
  if (qword_268925348 != -1) {
    dispatch_once(&qword_268925348, &unk_26EA57698);
  }
  id v0 = (void *)qword_268923EE0;

  return v0;
}

void sub_2376C490C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_2376C4920(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _actuallySendAnnotationChange];
}

void sub_2376C5B78(void *a1, void *a2)
{
  double v3 = a2;
  id v4 = a1;
  if ([v4 groupsByEvent])
  {
    [v4 setGroupsByEvent:0];
    [v4 beginUndoGrouping];
    v3[2](v3);

    [v4 endUndoGrouping];
    [v4 setGroupsByEvent:1];
  }
  else
  {
    [v4 beginUndoGrouping];
    v3[2](v3);

    [v4 endUndoGrouping];
  }
}

void sub_2376C5C30(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) drawing];
  double v3 = [*(id *)(a1 + 32) inkCanvasAnnotation];
  [v3 setDrawing:v2];

  [*(id *)(a1 + 40) rectangle];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) inkCanvasAnnotation];
  objc_msgSend(v12, "setRectangle:", v5, v7, v9, v11);
}

uint64_t sub_2376C5CF0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 56) >= *(void *)(a1 + 64)) {
    uint64_t v3 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v3 = *(void *)(a1 + 56);
  }
  [v2 insertObject:*(void *)(a1 + 40) inAnnotationsAtIndex:v3];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 48) BOOLValue];
    if (result)
    {
      double v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      return [v5 selectAnnotation:v6 byExtendingSelection:1];
    }
  }
  return result;
}

uint64_t sub_2376C5FC4(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__removeAnnotationUUID_fromPageModelController_);
}

uint64_t sub_2376C67CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) textEditorController];
  uint64_t v3 = [v2 annotation];
  double v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    double v5 = [*(id *)(a1 + 32) textEditorController];
    [v5 endEditing];
  }
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v6 setValuesForKeysWithDictionary:v7];
}

uint64_t sub_2376C6850(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValuesForKeysWithDictionary:*(void *)(a1 + 40)];
}

uint64_t sub_2376C685C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) textEditorController];
  uint64_t v3 = [v2 annotation];
  double v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    double v5 = [*(id *)(a1 + 32) textEditorController];
    [v5 endEditing];
  }
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v6 setValuesForKeysWithDictionary:v7];
}

uint64_t sub_2376C6ECC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__handleLiveStrokeUpdate);
}

uint64_t AKSidecarMarkupGetApplicationFromDictionary(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 objectForKeyedSubscript:&unk_26EA769D0];
  uint64_t v7 = [v5 objectForKeyedSubscript:&unk_26EA769E8];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    *a2 = v6;
    *a3 = v7;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_2376C894C()
{
  qword_268923EE0 = (uint64_t)os_log_create("com.apple.annotationkit", "continuityannotations");

  return MEMORY[0x270F9A758]();
}

void sub_2376C89A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_2376C89C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2376C8A00(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2376C8A20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_2376C9528()
{
  if (qword_268925358 != -1) {
    dispatch_once(&qword_268925358, &unk_26EA576B8);
  }
  return byte_268925350;
}

void sub_2376C956C()
{
  id v0 = [MEMORY[0x263F08AB0] processInfo];
  id v2 = [v0 environment];

  id v1 = [v2 objectForKeyedSubscript:@"AKUnitTests"];
  byte_268925350 = v1 != 0;
}

void *sub_2376C95F0()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v1 = v0;
  if (v0)
  {
    id v2 = [v0 objectForKey:@"PDFKit2_HighlightAnnotations"];

    if (v2) {
      id v2 = (void *)[v1 BOOLForKey:@"PDFKit2_HighlightAnnotations"];
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_2376CAC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2376CAC80(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 akPointValue];
  double v8 = v7;
  double v10 = v9;
  double v11 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v12 = [v11 integerValue];

  if (!v12)
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "_point:isInCircleWithRadius:atPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)&AKPointOfInterestSize_Handle / *(double *)(a1 + 72), v8, v10))return; {
    goto LABEL_4;
    }
  }
  if (v12 == 1
    && (objc_msgSend(*(id *)(a1 + 48), "_point:isInCircleWithRadius:atPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)&AKPointOfInterestRadius_Handle_Alternate / *(double *)(a1 + 72), v8, v10) & 1) != 0)
  {
LABEL_4:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t sub_2376CB708(void *a1, const char *a2)
{
  return [a1 setItems:MEMORY[0x263EFFA68]];
}

void sub_2376CB714(void *a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "setIsBeingCopied:", 1, (void)v14);
        uint64_t v12 = [v11 dataRepresentation];
        [v11 setIsBeingCopied:0];
        if (v12)
        {
          double v18 = @"com.apple.AnnotationKit.AnnotationItem";
          CGRect v19 = v12;
          CGFloat v13 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }

  [a1 setItems:v5];
}

BOOL sub_2376CB8B4(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = @"com.apple.AnnotationKit.AnnotationItem";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v3 = [a1 itemSetWithPasteboardTypes:v2];

  BOOL v4 = [v3 count] != 0;
  return v4;
}

id sub_2376CB968(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = [a1 dataForPasteboardType:@"com.apple.AnnotationKit.AnnotationItem" inItemSet:0];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = +[AKAnnotation annotationWithData:](AKAnnotation, "annotationWithData:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_2376CC164(void *a1, int a2, float64x2_t *a3, void *a4, void *a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  id v32 = a1;
  id v21 = a5;
  id v22 = a4;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v32, a6, a7, a8, a9, a10, a11);
  if (a2)
  {
    float64x2_t v31 = vaddq_f64(a3[2], vmlaq_n_f64(vmulq_n_f64(a3[1], v24), *a3, v23));
    double v25 = [v32 geometryHelper];
    [v25 screenPixelAlignedPointForPoint:*(_OWORD *)&v31];
    long long v30 = v27;
    v31.f64[0] = v26;

    double v24 = *(double *)&v30;
    double v23 = v31.f64[0];
  }
  uint64_t v28 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v23, v24, v30);
  [v22 addObject:v28];

  double v29 = [NSNumber numberWithUnsignedInteger:0];
  [v21 addObject:v29];
}

id sub_2376CC2EC(CGFloat a1, CGFloat a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v9 = a5;
  v33.origin.CGFloat x = 0.0;
  v33.origin.CGFloat y = 0.0;
  v33.size.CGFloat width = a1;
  v33.size.CGFloat height = a2;
  CGRect v34 = CGRectInset(v33, 1.0, 1.0);
  CGFloat y = v34.origin.y;
  CGFloat x = v34.origin.x;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (a6)
  {
    CGFloat v14 = 2.0;
    CGFloat v15 = 2.0;
  }
  else
  {
    CGFloat v14 = 1.0;
    CGFloat v15 = 1.0;
  }
  CGFloat v16 = a1;
  CGFloat v17 = a2;
  CGRect v35 = CGRectInset(*(CGRect *)&v12, v14, v15);
  CGFloat v18 = v35.origin.x;
  CGFloat v19 = v35.origin.y;
  CGFloat v20 = v35.size.width;
  CGFloat v21 = v35.size.height;
  id v22 = [MEMORY[0x263F1C550] systemBlueColor];
  v32.CGFloat width = a1;
  v32.CGFloat height = a2;
  UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v36.origin.CGFloat x = v18;
  v36.origin.CGFloat y = v19;
  v36.size.CGFloat width = v20;
  v36.size.CGFloat height = v21;
  CGContextClearRect(CurrentContext, v36);
  id v24 = v9;
  double v25 = (CGColor *)[v24 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v25);
  v37.origin.CGFloat x = v18;
  v37.origin.CGFloat y = v19;
  v37.size.CGFloat width = v20;
  v37.size.CGFloat height = v21;
  CGContextFillEllipseInRect(CurrentContext, v37);
  if (a6)
  {
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v22 CGColor]);
    CGContextSetLineWidth(CurrentContext, 2.0);
    v38.origin.CGFloat y = y;
    v38.origin.CGFloat x = x;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGContextStrokeEllipseInRect(CurrentContext, v38);
  }
  float64_t v26 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  long long v27 = [v26 imageWithRenderingMode:1];

  return v27;
}

id sub_2376CC4B4(CGFloat a1, CGFloat a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v9 = a5;
  v27.origin.CGFloat x = 0.0;
  v27.origin.CGFloat y = 0.0;
  v27.size.CGFloat width = a1;
  v27.size.CGFloat height = a2;
  CGRect v28 = CGRectInset(v27, 1.0, 1.0);
  CGFloat y = v28.origin.y;
  CGFloat x = v28.origin.x;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  v28.origin.CGFloat x = 0.0;
  v28.origin.CGFloat y = 0.0;
  v28.size.CGFloat width = a1;
  v28.size.CGFloat height = a2;
  CGRect v29 = CGRectInset(v28, 3.0, 3.0);
  CGFloat v12 = v29.origin.x;
  CGFloat v13 = v29.origin.y;
  CGFloat v14 = v29.size.width;
  CGFloat v15 = v29.size.height;
  CGFloat v16 = [MEMORY[0x263F1C550] systemBlueColor];
  v26.CGFloat width = a1;
  v26.CGFloat height = a2;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v30.origin.CGFloat x = v12;
  v30.origin.CGFloat y = v13;
  v30.size.CGFloat width = v14;
  v30.size.CGFloat height = v15;
  CGContextClearRect(CurrentContext, v30);
  id v18 = v9;
  CGFloat v19 = (CGColor *)[v18 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v19);
  v31.origin.CGFloat x = v12;
  v31.origin.CGFloat y = v13;
  v31.size.CGFloat width = v14;
  v31.size.CGFloat height = v15;
  CGContextFillEllipseInRect(CurrentContext, v31);
  if (a6)
  {
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v16 CGColor]);
    CGContextSetLineWidth(CurrentContext, 2.0);
    v32.origin.CGFloat y = y;
    v32.origin.CGFloat x = x;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGContextStrokeEllipseInRect(CurrentContext, v32);
  }
  CGFloat v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGFloat v21 = [v20 imageWithRenderingMode:1];

  return v21;
}

id sub_2376CC66C()
{
  id v0 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  id v1 = (void *)[v0 mutableCopyWithZone:0];

  id v2 = [MEMORY[0x263F1C658] boldSystemFontOfSize:15.0];
  [v1 setAlignment:1];
  v8.CGFloat width = 20.0;
  v8.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  id v3 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x263F1C238], v1, *MEMORY[0x263F1C268], 0);
  objc_msgSend(@"B", "drawInRect:withAttributes:", v3, 0.0, 0.0, 20.0, 20.0);

  uint64_t v4 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v5 = [v4 imageWithRenderingMode:0];

  UIGraphicsEndImageContext();

  return v5;
}

id sub_2376CC790()
{
  id v0 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  id v1 = (void *)[v0 mutableCopyWithZone:0];

  id v2 = [MEMORY[0x263F1C658] italicSystemFontOfSize:15.0];
  [v1 setAlignment:1];
  v8.CGFloat width = 20.0;
  v8.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  id v3 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x263F1C238], v1, *MEMORY[0x263F1C268], 0);
  objc_msgSend(@"I", "drawInRect:withAttributes:", v3, 0.0, 0.0, 20.0, 20.0);

  uint64_t v4 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v5 = [v4 imageWithRenderingMode:0];

  UIGraphicsEndImageContext();

  return v5;
}

id sub_2376CC8B4()
{
  id v0 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  id v1 = (void *)[v0 mutableCopyWithZone:0];

  id v2 = [MEMORY[0x263F1C658] systemFontOfSize:15.0];
  [v1 setAlignment:1];
  v11.CGFloat width = 20.0;
  v11.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  id v3 = NSDictionary;
  uint64_t v4 = *MEMORY[0x263F1C238];
  uint64_t v5 = [NSNumber numberWithInt:1];
  uint64_t v6 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v2, v4, v5, *MEMORY[0x263F1C2D8], v1, *MEMORY[0x263F1C268], 0);
  objc_msgSend(@"U", "drawInRect:withAttributes:", v6, 0.0, 0.0, 20.0, 20.0);

  uint64_t v7 = UIGraphicsGetImageFromCurrentImageContext();
  CGSize v8 = [v7 imageWithRenderingMode:0];

  UIGraphicsEndImageContext();

  return v8;
}

id sub_2376CCA10()
{
  id v0 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  id v1 = (void *)[v0 mutableCopyWithZone:0];

  id v2 = [MEMORY[0x263F1C658] systemFontOfSize:15.0];
  [v1 setAlignment:1];
  v11.CGFloat width = 20.0;
  v11.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  id v3 = NSDictionary;
  uint64_t v4 = *MEMORY[0x263F1C238];
  uint64_t v5 = [NSNumber numberWithInt:1];
  uint64_t v6 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v2, v4, v5, *MEMORY[0x263F1C298], v1, *MEMORY[0x263F1C268], 0);
  objc_msgSend(@"S", "drawInRect:withAttributes:", v6, 0.0, 0.0, 20.0, 20.0);

  uint64_t v7 = UIGraphicsGetImageFromCurrentImageContext();
  CGSize v8 = [v7 imageWithRenderingMode:0];

  UIGraphicsEndImageContext();

  return v8;
}

void sub_2376CEBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2376CEBF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained undoController];
  id v2 = [v1 undoManager];
  [v2 beginUndoGrouping];
}

void sub_2376CEC58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained undoController];
  id v2 = [v1 undoManager];
  [v2 endUndoGrouping];
}

void sub_2376D004C()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v1 = (void *)qword_268925360;
  qword_268925360 = (uint64_t)v0;

  [(id)qword_268925360 setFormatterBehavior:1040];
  [(id)qword_268925360 setPaddingPosition:0];
  [(id)qword_268925360 setRoundingMode:4];
  [(id)qword_268925360 setPaddingCharacter:@"*"];
  [(id)qword_268925360 setMinimum:&unk_26EA76A60];
  [(id)qword_268925360 setMaximum:&unk_26EA76A78];
  [(id)qword_268925360 setGroupingSize:3];
  [(id)qword_268925360 setSecondaryGroupingSize:0];
  id v2 = +[AKController akBundle];
  id v4 = [v2 localizedStringForKey:@"%@ pt" value:&stru_26EA57918 table:@"AKTextAttributesViewController_iOS"];

  id v3 = [NSString stringWithValidatedFormat:v4, @"%@", 0, @"#,##0" validFormatSpecifiers error];
  [(id)qword_268925360 setPositiveFormat:v3];
  [(id)qword_268925360 setNegativeFormat:v3];
}

uint64_t sub_2376D1EB8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedAnnotations];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

uint64_t sub_2376D2050(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedAnnotations];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

uint64_t sub_2376D2240(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedAnnotations];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

uint64_t sub_2376D23B4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedAnnotations];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

void sub_2376D2778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2376D2790(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_2376D2BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2376D2BC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2376D2BD4(uint64_t a1)
{
}

uint64_t sub_2376D2BDC(uint64_t a1, uint64_t a2)
{
  uint64_t isKindOfClass = +[AKAnnotation annotationWithData:a2];
  uint64_t v4 = isKindOfClass;
  if (isKindOfClass)
  {
    id obj = (id)isKindOfClass;
    uint64_t isKindOfClass = [*(id *)(a1 + 32) addObject:isKindOfClass];
    uint64_t v4 = (uint64_t)obj;
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v4 = (uint64_t)obj;
      if (isKindOfClass)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
        uint64_t v4 = (uint64_t)obj;
      }
    }
  }

  return MEMORY[0x270F9A758](isKindOfClass, v4);
}

void sub_2376D60A8(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  id v3 = AKAnnotationLayerSetupCompleteNotification;
  uint64_t v4 = [*(id *)(a1 + 32) controller];
  uint64_t v7 = AKAnnotationChangeObjectKey;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "pageIndex"));
  v8[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 postNotificationName:v3 object:v4 userInfo:v6];
}

uint64_t sub_2376D7730(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__beginEditingAnnotation_withPageController_selectAllText_withPencil_);
}

uint64_t sub_2376D77B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitToModelWithoutEndingEditing];
}

uint64_t sub_2376D7828(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endEditing];
}

void sub_2376D9F3C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = objc_begin_catch(a1);
  uint64_t v5 = os_log_create("com.apple.annotationkit", "Serialization");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = a3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_fault_impl(&dword_23760E000, v5, OS_LOG_TYPE_FAULT, "Failed to encode object %@: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_end_catch();
}

void sub_2376DA020(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2376DA08C()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Decoding text properties that requires the migrator service is not supported anymore.", v2, v3, v4, v5, v6);
}

void sub_2376DA0C0(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[AKSecureSerializationHelper _decodeTextPropertiesForAnnotation:withSecureCoder:]";
  _os_log_error_impl(&dword_23760E000, log, OS_LOG_TYPE_ERROR, "%s: Annotation version was > 0, but the text annotation was not encoded with a typingAttributesRTF property. This should not happen, except for some documents edited with earlier prelease versions.", (uint8_t *)&v1, 0xCu);
}

void sub_2376DA144(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2376DA1B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2376DA21C()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Dummy string was of incorrect length. Won't attempt to extract text attributes.", v2, v3, v4, v5, v6);
}

uint64_t sub_2376DA250()
{
  uint64_t v0 = abort_report_np();
  return sub_2376DA278(v0);
}

uint64_t sub_2376DA278()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_2376DA29C(v0);
}

void sub_2376DA29C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_23760E000, log, OS_LOG_TYPE_FAULT, "Image annotation contains a legacy NSImage instance - can't decode on iOS.", v1, 2u);
}

void sub_2376DA2E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23760E000, log, OS_LOG_TYPE_ERROR, "Unable to load legacy annotations that were encoded insecurely.", v1, 2u);
}

void sub_2376DA324(void *a1)
{
  [a1 pageIndex];
  sub_23768C1CC();
  sub_23768C1AC(&dword_23760E000, v1, v2, "%s: Attempting geometric calculations, but this page's overlay view isn't hosted in a window. (page index: %lu)", v3, v4, v5, v6, 2u);
}

void sub_2376DA3A8(void *a1)
{
  [a1 pageIndex];
  sub_23768C1CC();
  sub_23768C1AC(&dword_23760E000, v1, v2, "%s: Attempting geometric calculations, but this page's overlay view isn't hosted in a window. (page index: %lu)", v3, v4, v5, v6, 2u);
}

void sub_2376DA42C(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AKPageController newContentSnapshotPDFDataAtScale:inRect:forLoupeAnnotation:]";
  _os_log_fault_impl(&dword_23760E000, log, OS_LOG_TYPE_FAULT, "%s: Delegate didn't return a content snapshot. Loupe will show blank.", (uint8_t *)&v1, 0xCu);
}

void sub_2376DA4B0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23760E000, a2, OS_LOG_TYPE_ERROR, "Failed to load ink annotation drawing: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2376DA528()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Failed to deserialize an AKAnnotation. The data was nil.", v2, v3, v4, v5, v6);
}

void sub_2376DA55C()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Failed to deserialize an AKAnnotation. The data length was 0.", v2, v3, v4, v5, v6);
}

void sub_2376DA590()
{
  sub_2376392A0();
  _os_log_fault_impl(&dword_23760E000, v0, OS_LOG_TYPE_FAULT, "Failed to deserialize an AKAnnotation. Decoding failed.", v1, 2u);
}

void sub_2376DA5D0(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = os_log_create("com.apple.annotationkit", "Serialization");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412290;
    id v4 = v1;
    _os_log_fault_impl(&dword_23760E000, v2, OS_LOG_TYPE_FAULT, "Failed to deserialize an AKAnnotation. Exception: %@", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_2376DA694()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Failed to get dataRepresentation for AKAnnotation. Data length was 0.", v2, v3, v4, v5, v6);
}

void sub_2376DA6C8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23760E000, a2, OS_LOG_TYPE_ERROR, "Failed to archive annotation: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2376DA740(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_23760E000, log, OS_LOG_TYPE_DEBUG, "Highlights should be created via AKHighlightAnnotationController.", v1, 2u);
}

void sub_2376DA784()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Invalid protocool version on initial setup", v2, v3, v4, v5, v6);
}

void sub_2376DA7B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2376DA828()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Invalid application data type on initial message", v2, v3, v4, v5, v6);
}

void sub_2376DA85C()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Closing connection on error", v2, v3, v4, v5, v6);
}

void sub_2376DA890()
{
  sub_2376C8990();
  sub_2376C89A4(&dword_23760E000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
}

void sub_2376DA900()
{
  sub_2376C89DC();
  sub_2376C89C0(&dword_23760E000, v0, v1, "Unexpected message %ld", v2, v3, v4, v5, v6);
}

void sub_2376DA968()
{
  sub_2376C89DC();
  sub_2376C8A20(&dword_23760E000, v0, v1, "Handling incoming message %lu", v2, v3, v4, v5, v6);
}

void sub_2376DA9D0()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Incoming message empty or not of NSDictionary type", v2, v3, v4, v5, v6);
}

void sub_2376DAA04()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Unable to decode annotation", v2, v3, v4, v5, v6);
}

void sub_2376DAA38()
{
  sub_2376392A0();
  _os_log_debug_impl(&dword_23760E000, v0, OS_LOG_TYPE_DEBUG, "Updating existing ink annotation", v1, 2u);
}

void sub_2376DAA78(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 UUID];
  int v5 = 138543618;
  uint8_t v6 = v4;
  __int16 v7 = 2114;
  __int16 v8 = a1;
  _os_log_debug_impl(&dword_23760E000, a2, OS_LOG_TYPE_DEBUG, "Added annotation %{public}@ %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_2376DAB28()
{
  sub_2376C89DC();
  sub_2376C89C0(&dword_23760E000, v0, v1, "page model controller index out of bounds %lu", v2, v3, v4, v5, v6);
}

void sub_2376DAB90()
{
  sub_2376C8990();
  sub_2376C89A4(&dword_23760E000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
}

void sub_2376DAC00()
{
  sub_2376C89DC();
  sub_2376C8A20(&dword_23760E000, v0, v1, "Removing annotation with uuid %{public}@", v2, v3, v4, v5, v6);
}

void sub_2376DAC68()
{
  sub_2376C8990();
  sub_2376C89A4(&dword_23760E000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
}

void sub_2376DACD8()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Changed annotation should not be nil", v2, v3, v4, v5, v6);
}

void sub_2376DAD0C()
{
  sub_2376C89E8();
  sub_2376C8A00(&dword_23760E000, v0, v1, "Modifying annotation (with properties) uuid: %{public}@ %{public}@");
}

void sub_2376DAD74()
{
  sub_2376C8990();
  sub_2376C89A4(&dword_23760E000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
}

void sub_2376DADE4()
{
  sub_2376C89E8();
  sub_2376C8A00(&dword_23760E000, v0, v1, "Modifying ink annotation uuid: %{public}@ %{public}@");
}

void sub_2376DAE4C()
{
  sub_2376C89E8();
  sub_2376C8A00(&dword_23760E000, v0, v1, "Modifying annotation uuid: %{public}@ %{public}@");
}

void sub_2376DAEB4()
{
  sub_2376392A0();
  sub_237639268(&dword_23760E000, v0, v1, "Change data expected to be an NSDictionary", v2, v3, v4, v5, v6);
}

void sub_2376DAEE8()
{
  sub_2376C8990();
  sub_2376C89A4(&dword_23760E000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
}

void sub_2376DAF58()
{
  sub_2376C8990();
  sub_2376C89A4(&dword_23760E000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
}

void sub_2376DAFC8()
{
  sub_2376C89DC();
  sub_2376C8A20(&dword_23760E000, v0, v1, "Updating selection: %{public}@", v2, v3, v4, v5, v6);
}

void sub_2376DB030()
{
  sub_2376C8990();
  sub_2376C89A4(&dword_23760E000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
}

void sub_2376DB0A0(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  sub_2376C89DC();
  _os_log_error_impl(&dword_23760E000, a2, OS_LOG_TYPE_ERROR, "KVO object was of type %{public}@, not expected type AKPageModelController", v5, 0xCu);
}

void sub_2376DB138()
{
  sub_2376C89DC();
  sub_2376C89C0(&dword_23760E000, v0, v1, "Couldn't create dataRepresentation of %{public}@ when added", v2, v3, v4, v5, v6);
}

void sub_2376DB1A0()
{
  sub_2376C89DC();
  sub_2376C8A20(&dword_23760E000, v0, v1, "Sending %{public}@", v2, v3, v4, v5, v6);
}

double sub_2376DB208()
{
  uint64_t v0 = malloc_type_malloc(0x48uLL, 0x108004092497B1AuLL);
  if (v0)
  {
    v0[2] = xmmword_2376F4650;
    v0[3] = unk_2376F4660;
    *((void *)v0 + 8) = 0;
    double result = dbl_2376F4640[0];
    _OWORD *v0 = xmmword_2376F4630;
    v0[1] = *(_OWORD *)dbl_2376F4640;
  }
  return result;
}

void *sub_2376DB258(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = 0;
  uint64_t v5 = *(void (**)(uint64_t, double))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);
  uint64_t v9 = malloc_type_malloc(0x18uLL, 0x1020040F89CB87BuLL);
  if (!v9) {
    return v9;
  }
  double v18 = 0.0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if (!v5)
  {
    *(void *)&long long v15 = 0;
    if (!sub_2376DB848(a2, &v19, (_DWORD *)a1, (uint64_t)&v15)) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (v7 * 0.1 + v6 * 0.9 - (v6 + v7 * 0.0) >= v8)
  {
    *(void *)&long long v15 = v5;
    *((void *)&v15 + 1) = v4;
    *(double *)&long long v16 = v6 + v7 * 0.0;
    *((double *)&v16 + 1) = v7 * 0.1 + v6 * 0.9;
    *(double *)&long long v17 = v8;
    double v18 = v6;
    if (!sub_2376DB848(a2, &v19, (_DWORD *)a1, (uint64_t)&v15)) {
      goto LABEL_10;
    }
LABEL_7:
    free(v9);
    return 0;
  }
  *(void *)&long long v15 = 0;
  *((void *)&v17 + 1) = 0x3FB999999999999ALL;
  if (sub_2376DB848(a2, &v19, (_DWORD *)a1, (uint64_t)&v15)) {
    goto LABEL_7;
  }
LABEL_10:
  *(_DWORD *)uint64_t v9 = 0;
  v9[1] = v19;
  v9[2] = 0;
  if (!v5)
  {
    *(void *)&long long v15 = 0;
    double v11 = v6;
    if (!sub_2376DC5F4(v19, a1, (double *)&v15)) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if ((void)v15)
  {
    double v11 = v18;
  }
  else
  {
    double v14 = v7 * *((double *)&v17 + 1) + v6 * (1.0 - *((double *)&v17 + 1));
    if (*((double *)&v17 + 1) == 1.0 || (double v11 = v6, v14 >= v6 + v8))
    {
      v5(v4, v7 * *((double *)&v17 + 1) + v6 * (1.0 - *((double *)&v17 + 1)));
      double v11 = v14;
    }
  }
  if (v7 + v6 * 0.0 - (v7 * 0.1 + v6 * 0.9) < v8)
  {
    *(void *)&long long v15 = 0;
    *((void *)&v17 + 1) = 0x3FF0000000000000;
    if (!sub_2376DC5F4(v19, a1, (double *)&v15)) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  *(void *)&long long v15 = v5;
  *((void *)&v15 + 1) = v4;
  *(double *)&long long v16 = v7 * 0.1 + v6 * 0.9;
  *((double *)&v16 + 1) = v7 + v6 * 0.0;
  *(double *)&long long v17 = v8;
  double v18 = v11;
  if (sub_2376DC5F4(v19, a1, (double *)&v15)) {
LABEL_22:
  }
    *(_DWORD *)uint64_t v9 = 1;
LABEL_23:
  if (v5)
  {
    if (!(void)v15)
    {
      v13.n128_u64[0] = *((void *)&v17 + 1);
      v12.n128_f64[0] = v7 * *((double *)&v17 + 1) + v6 * (1.0 - *((double *)&v17 + 1));
      if (*((double *)&v17 + 1) == 1.0 || (v13.n128_f64[0] = v8 + v11, v12.n128_f64[0] >= v8 + v11)) {
        ((void (*)(uint64_t, __n128, __n128))v5)(v4, v12, v13);
      }
    }
  }
  return v9;
}

void sub_2376DB4DC(void **a1)
{
  sub_2376DB6AC(a1[1]);

  free(a1);
}

void *sub_2376DB51C()
{
  uint64_t v0 = malloc_type_calloc(1uLL, 0x40uLL, 0x10B0040D092B76AuLL);
  uint64_t v1 = v0;
  if (v0
    && (v0[2] = 0u,
        v0[3] = 0u,
        _OWORD *v0 = 0u,
        v0[1] = 0u,
        (uint64_t v2 = malloc_type_calloc(1uLL, 0xC0uLL, 0x10B0040EAA15328uLL)) != 0))
  {
    v2[10] = 0u;
    v2[11] = 0u;
    v2[8] = 0u;
    v2[9] = 0u;
    v2[6] = 0u;
    v2[7] = 0u;
    v2[4] = 0u;
    v2[5] = 0u;
    v2[2] = 0u;
    v2[3] = 0u;
    *uint64_t v2 = 0u;
    v2[1] = 0u;
    v1[7] = v2;
    return v1;
  }
  else
  {
    free(v1);
    return 0;
  }
}

void sub_2376DB5C8(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1[7];
    if (v2)
    {
      free(*(void **)(v2 + 8));
      free(*(void **)(a1[7] + 16));
      free(*(void **)(a1[7] + 32));
      free(*(void **)(a1[7] + 48));
      uint64_t v3 = (void **)a1[7];
      free(v3[8]);
      free(v3[9]);
      free(v3[11]);
      free(v3[12]);
      free(v3[13]);
      free(v3[14]);
      uint64_t v4 = (void **)a1[7];
      free(v4[16]);
      free(v4[17]);
      free(v4[19]);
      free(v4[20]);
      free(v4[21]);
      free(v4[22]);
      uint64_t v5 = (void *)a1[7];
    }
    else
    {
      uint64_t v5 = 0;
    }
    free(v5);
  }

  free(a1);
}

void *sub_2376DB6AC(void *result)
{
  if (result)
  {
    do
    {
      uint64_t v1 = (void *)result[4];
      result[4] = 0;
      sub_2376DB5C8(result);
      double result = v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_2376DB6E4(uint64_t a1, int a2)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a2;
  size_t v3 = a2;
  uint64_t v4 = malloc_type_calloc(a2, 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 8) = v4;
  if (v4)
  {
    uint64_t v5 = malloc_type_calloc(v3, 0x30uLL, 0x1000040EED21634uLL);
    *(void *)(a1 + 16) = v5;
    if (v5)
    {
      double v6 = malloc_type_calloc(v3, 0x10uLL, 0x1000040451B5BE8uLL);
      *(void *)(a1 + 32) = v6;
      if (v6)
      {
        double v7 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
        *(void *)(a1 + 40) = v7;
        if (v7)
        {
          double v8 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
          *(void *)(a1 + 48) = v8;
          if (v8)
          {
            uint64_t v9 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
            *(void *)(a1 + 56) = v9;
            if (v9) {
              return 0;
            }
          }
        }
      }
    }
  }
  free(*(void **)(a1 + 8));
  free(*(void **)(a1 + 16));
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 40));
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
  return 1;
}

__n128 sub_2376DB834(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a2 = *(_DWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_2376DB848(uint64_t a1, void *a2, _DWORD *a3, uint64_t a4)
{
  v152 = 0;
  int v4 = *(_DWORD *)a1;
  int v5 = *(_DWORD *)(a1 + 4);
  int v6 = *(_DWORD *)a1 - 1;
  if (*(int *)a1 < 1) {
    int v6 = *(_DWORD *)a1 + 62;
  }
  int v7 = v6 >> 6;
  if (v4) {
    int v8 = v7 + 1;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = *(int *)(a1 + 4) * (uint64_t)v8;
  if (v9 < 0 || (int64_t v14 = 8 * v9, v5) && v8 && v14 / v5 / v8 != 8)
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  long long v15 = (int *)malloc_type_malloc(0x18uLL, 0x1010040B3F21DC8uLL);
  if (!v15) {
    return 0xFFFFFFFFLL;
  }
  long long v16 = v15;
  *long long v15 = v4;
  v15[1] = v5;
  v15[2] = v8;
  long long v17 = malloc_type_malloc(v14, 0x5B779544uLL);
  *((void *)v16 + 2) = v17;
  if (!v17)
  {
    free(v16);
    return 0xFFFFFFFFLL;
  }
  v143 = a2;
  uint64_t v146 = a1;
  uint64_t v147 = a4;
  memcpy(v17, *(const void **)(a1 + 16), 8 * *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 4));
  uint64_t v18 = v16[1];
  if (*v16 >= 0) {
    int v19 = *v16;
  }
  else {
    int v19 = *v16 + 63;
  }
  if (*v16 != (v19 & 0xFFFFFFC0))
  {
    if ((int)v18 < 1) {
      goto LABEL_114;
    }
    uint64_t v20 = 0;
    int v21 = v19 >> 6;
    unint64_t v22 = -1 << ((v19 & 0xC0u) - *(unsigned char *)v16);
    uint64_t v23 = *((void *)v16 + 2);
    int v24 = v16[2];
    uint64_t v25 = v24;
    if (v18 < 4) {
      goto LABEL_22;
    }
    if (v24 != 1) {
      goto LABEL_22;
    }
    uint64_t v20 = v18 & 0x7FFFFFFC;
    int8x16_t v26 = (int8x16_t)vdupq_n_s64(v22);
    CGRect v27 = (int8x16_t *)(v23 + 8 * v21 + 16);
    uint64_t v28 = v18 & 0xFFFFFFFC;
    do
    {
      int8x16_t v29 = vandq_s8(*v27, v26);
      v27[-1] = vandq_s8(v27[-1], v26);
      *CGRect v27 = v29;
      v27 += 2 * v25;
      v28 -= 4;
    }
    while (v28);
    if (v20 != v18)
    {
LABEL_22:
      uint64_t v30 = v18 - v20;
      CGRect v31 = (void *)(v23 + 8 * v20 * v25 + 8 * v21);
      do
      {
        *v31 &= v22;
        v31 += v25;
        --v30;
      }
      while (v30);
    }
  }
  if ((int)v18 >= 1)
  {
    int v32 = 0;
    LODWORD(v33) = v18 - 1;
    v141 = &v152;
    v142 = a3;
    v151 = v16;
LABEL_31:
    v32 &= 0xFFFFFFC0;
    int v35 = *v16;
    uint64_t v33 = v33;
    while (v32 >= v35)
    {
LABEL_32:
      int v32 = 0;
      BOOL v36 = v33-- <= 0;
      if (v36) {
        goto LABEL_114;
      }
    }
    uint64_t v37 = *((void *)v16 + 2) + 8 * v33 * v16[2];
    while (!*(void *)(v37 + 8 * (v32 >> 6)))
    {
      v32 += 64;
      if (v32 >= v35) {
        goto LABEL_32;
      }
    }
    while (1)
    {
      if ((v32 & 0x80000000) == 0 && v32 < v35 && v16[1] > (int)v33)
      {
        uint64_t v38 = v32 >> 6;
        if ((*(void *)(v37 + 8 * v38) & (0x8000000000000000 >> v32)) != 0) {
          break;
        }
      }
      ++v32;
    }
    BOOL v39 = 0;
    if (v32 < *(_DWORD *)v146 && (v33 & 0x80000000) == 0) {
      BOOL v39 = *(_DWORD *)(v146 + 4) > (int)v33
    }
         && (*(void *)(*(void *)(v146 + 16) + 8 * v33 * (uint64_t)*(int *)(v146 + 8) + 8 * v38) & (0x8000000000000000 >> v32)) != 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    int v44 = 0;
    double v45 = 0;
    int v46 = a3[1];
    BOOL v47 = v46 == 0;
    BOOL v48 = !v39;
    if (v48) {
      int v49 = 45;
    }
    else {
      int v49 = 43;
    }
    int v145 = v49;
    int v144 = v33;
    int v50 = v33 + 1;
    if (v48) {
      BOOL v47 = 0;
    }
    if (v46 != 1) {
      BOOL v48 = 0;
    }
    if (v46 == 3) {
      BOOL v47 = 1;
    }
    BOOL v148 = v48 || v47;
    int v149 = v33 + 1;
    uint64_t v51 = 0xFFFFFFFFLL;
    int v52 = v32;
    int v53 = v50;
    int v150 = v46;
    while (1)
    {
      if (v41 >= (int)v43)
      {
        int v55 = v44;
        uint64_t v56 = (int)((double)((int)v43 + 100) * 1.3);
        CGPoint v57 = (char *)malloc_type_realloc(v45, 16 * (int)v56, 0x1000040451B5BE8uLL);
        if (!v57) {
          goto LABEL_180;
        }
        double v45 = v57;
        int v44 = v55;
        int v46 = v150;
        uint64_t v43 = v56;
      }
      double v58 = &v45[v40];
      *(void *)double v58 = v52;
      *((void *)v58 + 1) = v53;
      v52 += v42;
      v53 += v51;
      v44 += v52 * v51;
      if (v52 == v32 && v53 == v149)
      {
        int v79 = v44;
        double v80 = sub_2376DB51C();
        if (v80)
        {
          uint64_t v33 = (uint64_t)v80;
          uint64_t v81 = v80[7];
          *(void *)(v81 + 8) = v45;
          *(_DWORD *)uint64_t v81 = v41 + 1;
          *(_DWORD *)double v80 = v79;
          *((_DWORD *)v80 + 1) = v145;
          long long v16 = v151;
          sub_2376DC2CC((uint64_t)v151, (unsigned int *)v81);
          a3 = v142;
          if (*(_DWORD *)v33 <= *v142)
          {
            sub_2376DB5C8((void *)v33);
            LODWORD(v33) = v144;
            int v82 = v151[1];
            if (v82 < 1) {
              goto LABEL_30;
            }
          }
          else
          {
            *(void *)(v33 + 32) = *v141;
            *v141 = (void *)v33;
            v141 = (void **)(v33 + 32);
            LODWORD(v33) = v144;
            int v82 = v151[1];
            if (v82 < 1) {
              goto LABEL_30;
            }
          }
          if (v147)
          {
            if (*(void *)v147)
            {
              double v83 = 1.0 - (double)(int)v33 / (double)v82;
              double v84 = v83 * *(double *)(v147 + 24) + *(double *)(v147 + 16) * (1.0 - v83);
              if (v83 == 1.0 || v84 >= *(double *)(v147 + 48) + *(double *)(v147 + 32))
              {
                (*(void (**)(void, double))v147)(*(void *)(v147 + 8), v84);
                *(double *)(v147 + 48) = v84;
              }
            }
          }
LABEL_30:
          if ((v33 & 0x80000000) == 0) {
            goto LABEL_31;
          }
          break;
        }
LABEL_180:
        free(v45);
        free(*((void **)v151 + 2));
        free(v151);
        float64x2x2_t v139 = v152;
        if (v152)
        {
          do
          {
            v140 = (void *)v139[4];
            v139[4] = 0;
            sub_2376DB5C8(v139);
            float64x2x2_t v139 = v140;
          }
          while (v140);
        }
        return 0xFFFFFFFFLL;
      }
      int v59 = v42 + v51;
      if ((int)v42 + (int)v51 - 1 >= 0) {
        int v59 = v42 + v51 - 1;
      }
      int v60 = v59 >> 1;
      int v61 = v60 + v52;
      if (v60 + v52 < 0)
      {
        LODWORD(v65) = 0;
        __int16 v62 = v151;
      }
      else
      {
        __int16 v62 = v151;
        if (v61 >= *v151) {
          goto LABEL_75;
        }
        int v63 = v51 + ~v42;
        if (v63 < 0) {
          int v63 = v51 - v42;
        }
        uint64_t v64 = (v53 + (v63 >> 1));
        if ((int)v64 < 0 || (int)v64 >= v151[1]) {
LABEL_75:
        }
          LODWORD(v65) = 0;
        else {
          uint64_t v65 = *(void *)(*((void *)v151 + 2) + 8 * v151[2] * v64 + 8 * (v61 >> 6)) << v61 >> 63;
        }
      }
      int v66 = v42 + ~v51;
      if (v66 < 0) {
        int v66 = v42 - v51;
      }
      int v67 = v52 + (v66 >> 1);
      if (v67 < 0 || v67 >= *v62 || (uint64_t v68 = (v60 + v53), (int)v68 < 0) || (int)v68 >= v62[1])
      {
        LODWORD(v69) = 0;
        if (!v65) {
          goto LABEL_58;
        }
      }
      else
      {
        uint64_t v69 = *(void *)(*((void *)v62 + 2) + 8 * v62[2] * v68 + 8 * (v67 >> 6)) << v67 >> 63;
        if (!v65) {
          goto LABEL_58;
        }
      }
      if (v69)
      {
LABEL_58:
        if (v65) {
          goto LABEL_59;
        }
        if (v69) {
          uint64_t v70 = v42;
        }
        else {
          uint64_t v70 = -(int)v51;
        }
        if (v69) {
          uint64_t v42 = v51;
        }
        else {
          uint64_t v42 = v42;
        }
        uint64_t v51 = v70;
        goto LABEL_60;
      }
      if (v148) {
        goto LABEL_59;
      }
      if (v46 == 4)
      {
        uint64_t v71 = (uint64_t)v62;
        int v72 = v44;
        uint64_t v73 = v43;
        int v74 = sub_2376DC3E4(v71, v52, v53);
        uint64_t v43 = v73;
        int v46 = v150;
        int v44 = v72;
        if (!v74) {
          goto LABEL_59;
        }
      }
      else if (v46 == 5)
      {
        uint64_t v75 = (uint64_t)v62;
        int v76 = v44;
        uint64_t v77 = v43;
        int v78 = sub_2376DC3E4(v75, v52, v53);
        uint64_t v43 = v77;
        int v46 = v150;
        int v44 = v76;
        if (v78) {
          goto LABEL_59;
        }
      }
      else if (v46 == 6 {
             && (byte_2376F4680[(unsigned __int16)(-4205 * ((-7307 * v52) ^ v53)) >> 8] ^ byte_2376F4680[((94957459 * ((78898037 * v52) ^ v53)) >> 16)] ^ byte_2376F4680[(-109 * ((117 * v52) ^ v53))]) != byte_2376F4680[(unint64_t)(94957459 * ((78898037 * v52) ^ v53)) >> 24])
      }
      {
LABEL_59:
        uint64_t v42 = -(int)v42;
        goto LABEL_60;
      }
      uint64_t v51 = -(int)v51;
LABEL_60:
      uint64_t v54 = v42;
      v40 += 16;
      ++v41;
      uint64_t v42 = v51;
      uint64_t v51 = v54;
    }
  }
LABEL_114:
  id v85 = v152;
  v153 = 0;
  v154 = (void **)v152;
  bzero(*((void **)v16 + 2), 8 * v16[2] * (uint64_t)v16[1]);
  if (!v85) {
    goto LABEL_176;
  }
  double v86 = v85;
  do
  {
    double v87 = (void *)v86[4];
    v86[5] = 0;
    v86[6] = v87;
    double v86 = v87;
  }
  while (v87);
  uint64_t v88 = (unsigned int *)v85;
  do
  {
    double v91 = (unsigned int *)*((void *)v88 + 5);
    uint64_t v90 = (unsigned int **)(v88 + 10);
    int v89 = v91;
    double v93 = v90 - 1;
    uint64_t v92 = (uint64_t)*(v90 - 1);
    *uint64_t v90 = 0;
    *(v90 - 1) = 0;
    sub_2376DC2CC((uint64_t)v16, v90[2]);
    double v94 = v90[2];
    uint64_t v95 = *v94;
    if ((int)v95 < 1)
    {
      int v96 = 0;
      int v97 = 0;
      int v101 = 0x7FFFFFFF;
      int v102 = 0x7FFFFFFF;
      if (!v92) {
        goto LABEL_152;
      }
    }
    else
    {
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = (int *)(*((void *)v94 + 1) + 8);
      int v101 = 0x7FFFFFFF;
      int v102 = 0x7FFFFFFF;
      int v103 = 0x7FFFFFFF;
      int v104 = 0x7FFFFFFF;
      do
      {
        int v105 = *(v100 - 2);
        int v107 = *v100;
        v100 += 4;
        int v106 = v107;
        if (v104 > v105) {
          int v101 = v105;
        }
        if (v104 >= v105) {
          int v104 = v105;
        }
        if (v99 < v105) {
          int v96 = v105;
        }
        if (v99 <= v105) {
          int v99 = v105;
        }
        if (v103 > v106) {
          int v102 = v106;
        }
        if (v103 >= v106) {
          int v103 = v106;
        }
        if (v98 < v106) {
          int v97 = v106;
        }
        if (v98 <= v106) {
          int v98 = v106;
        }
        --v95;
      }
      while (v95);
      if (!v92) {
        goto LABEL_152;
      }
    }
    float v108 = v90 - 1;
    float v109 = v90;
    while (1)
    {
      uint64_t v111 = *(void *)(v92 + 32);
      *(void *)(v92 + 32) = 0;
      float64x2_t v112 = *(uint64_t **)(*(void *)(v92 + 56) + 8);
      uint64_t v113 = v112[1];
      if (v113 <= v102) {
        break;
      }
      uint64_t v114 = *v112;
      if ((v114 & 0x80000000) != 0
        || *v16 <= (int)v114
        || (uint64_t v115 = v113 - 1, (v115 & 0x80000000) != 0)
        || v16[1] <= (int)v115
        || ((*(void *)(*((void *)v16 + 2) + 8 * v115 * v16[2] + 8 * (v114 / 64)) << v114) & 0x8000000000000000) == 0)
      {
        uint64_t v110 = v108;
        float v108 = (unsigned int **)(v92 + 32);
        *(void *)(v92 + 32) = *v110;
        *uint64_t v110 = (unsigned int *)v92;
        uint64_t v92 = v111;
        if (!v111) {
          goto LABEL_152;
        }
      }
      else
      {
        v116 = v109;
        float v109 = (unsigned int **)(v92 + 32);
        *(void *)(v92 + 32) = *v116;
        *v116 = (unsigned int *)v92;
        uint64_t v92 = v111;
        if (!v111) {
          goto LABEL_152;
        }
      }
    }
    *float v108 = (unsigned int *)v92;
    *(void *)(v92 + 32) = v111;
LABEL_152:
    int v117 = v101 + (v101 < 0 ? 0x3F : 0);
    int v118 = v96 + 63;
    BOOL v36 = v96 < -63;
    int v119 = v96 + 126;
    if (v36) {
      int v118 = v119;
    }
    uint64_t v120 = (v97 - v102);
    if (v97 > v102)
    {
      int v121 = v117 >> 6;
      int v122 = v118 >> 6;
      if (v117 >> 6 < v118 >> 6)
      {
        uint64_t v123 = v16[2];
        size_t v124 = 8 * (v122 + ~v121) + 8;
        float64x2_t v125 = (char *)(*((void *)v16 + 2) + 8 * (v121 + (int)v123 * (uint64_t)v102));
        uint64_t v126 = 8 * v123;
        do
        {
          bzero(v125, v124);
          v125 += v126;
          --v120;
        }
        while (v120);
      }
    }
    v127 = *v93;
    if (*v93)
    {
      *((void *)v127 + 5) = v89;
      int v89 = v127;
    }
    if (*v90)
    {
      *((void *)*v90 + 5) = v89;
      int v89 = *v90;
    }
    uint64_t v88 = v89;
  }
  while (v89);
  v128 = v154;
  if (v154)
  {
    uint64_t v129 = v154;
    do
    {
      float64x2_t v130 = (void **)v129[6];
      v129[6] = v129[4];
      uint64_t v129 = v130;
    }
    while (v130);
    v128[4] = 0;
    v154 = 0;
    id v131 = (void **)&v154;
    do
    {
      v153 = (void **)v128[4];
      do
      {
        v128[4] = *v131;
        float64x2_t v132 = v128 + 4;
        *id v131 = v128;
        float64x2_t v133 = (void **)v128[5];
        if (v133)
        {
          do
          {
            v133[4] = *v132;
            id v131 = v133 + 4;
            *float64x2_t v132 = v133;
            float64x2_t v134 = (void **)v133[5];
            if (v134)
            {
              float64x2_t v135 = &v153;
              do
              {
                uint64_t v136 = v135;
                v137 = *v135;
                float64x2_t v135 = (void ***)(*v135 + 4);
              }
              while (v137);
              v134[4] = 0;
              *uint64_t v136 = v134;
            }
            float64x2_t v133 = (void **)v133[6];
            float64x2_t v132 = v131;
          }
          while (v133);
        }
        else
        {
          id v131 = v128 + 4;
        }
        v128 = (void **)v128[6];
      }
      while (v128);
      v128 = v153;
    }
    while (v153);
  }
LABEL_176:
  free(*((void **)v16 + 2));
  free(v16);
  void *v143 = v85;
  if (!v147 || !*(void *)v147) {
    return 0;
  }
  double v138 = *(double *)(v147 + 24) + *(double *)(v147 + 16) * 0.0;
  (*(void (**)(void, double))v147)(*(void *)(v147 + 8), v138);
  uint64_t result = 0;
  *(double *)(v147 + 48) = v138;
  return result;
}

uint64_t sub_2376DC2CC(uint64_t result, unsigned int *a2)
{
  uint64_t v2 = *a2;
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0;
    int v4 = (_DWORD *)*((void *)a2 + 1);
    uint64_t v5 = v4[4 * (v2 - 1) + 2];
    signed int v6 = *v4 & 0xFFFFFFC0;
    do
    {
      uint64_t v7 = v4[4 * v3 + 2];
      if (v5 == v7)
      {
        uint64_t v7 = v5;
      }
      else
      {
        int v8 = v4[4 * v3];
        if ((int)v5 >= (int)v7) {
          int v9 = v4[4 * v3 + 2];
        }
        else {
          int v9 = v5;
        }
        signed int v10 = v8 & 0xFFFFFFC0;
        if ((int)(v8 & 0xFFFFFFC0) >= v6)
        {
          if (v10 > v6)
          {
            uint64_t v13 = *(void *)(result + 16) + 8 * *(int *)(result + 8) * (uint64_t)v9;
            int v14 = v6;
            do
            {
              *(void *)(v13 + 8 * (v14 >> 6)) = ~*(void *)(v13 + 8 * (v14 >> 6));
              v14 += 64;
            }
            while (v14 < v10);
          }
        }
        else
        {
          uint64_t v11 = *(void *)(result + 16) + 8 * *(int *)(result + 8) * (uint64_t)v9;
          signed int v12 = v8 & 0xFFFFFFC0;
          do
          {
            *(void *)(v11 + 8 * (v12 >> 6)) = ~*(void *)(v11 + 8 * (v12 >> 6));
            v12 += 64;
          }
          while (v12 < v6);
        }
        int v15 = v8 & 0x3F;
        if (v15)
        {
          uint64_t v16 = *(void *)(result + 16) + 8 * *(int *)(result + 8) * (uint64_t)v9;
          *(void *)(v16 + 8 * (v10 >> 6)) ^= -1 << -(char)v15;
        }
      }
      ++v3;
      uint64_t v5 = v7;
    }
    while (v3 != v2);
  }
  return result;
}

uint64_t sub_2376DC3E4(uint64_t a1, int a2, int a3)
{
  int v3 = -2;
  uint64_t v4 = 2;
  while (2)
  {
    int v5 = 0;
    int v6 = v4 + a3;
    int v7 = v4 + a2;
    uint64_t v8 = (a3 - v4);
    unsigned int v9 = a2 - v4;
    int v10 = v3;
    do
    {
      int v11 = a2 + v10 + 1;
      if (v11 < 0
        || (v11 < *(_DWORD *)a1 ? (BOOL v12 = v6 < 1) : (BOOL v12 = 1),
            v12
         || v6 > *(_DWORD *)(a1 + 4)
         || ((*(void *)(*(void *)(a1 + 16)
                        + 8 * *(int *)(a1 + 8) * (unint64_t)(v6 - 1)
                        + 8 * (v11 >> 6)) << v11) & 0x8000000000000000) == 0))
      {
        int v13 = -1;
        if (v7 < 1) {
          goto LABEL_18;
        }
      }
      else
      {
        int v13 = 1;
        if (v7 < 1) {
          goto LABEL_18;
        }
      }
      uint64_t v14 = (a3 + v10);
      int v15 = v14 + 1;
      BOOL v16 = v7 > *(_DWORD *)a1 || v15 < 1;
      if (v16
        || v15 > *(_DWORD *)(a1 + 4)
        || (*(void *)(*(void *)(a1 + 16) + 8 * *(int *)(a1 + 8) * v14 + 8 * ((v7 - 1) >> 6)) & (0x8000000000000000 >> (v4 + a2 - 1))) == 0)
      {
LABEL_18:
        int v17 = -1;
        if (v11 < 1) {
          goto LABEL_28;
        }
        goto LABEL_19;
      }
      int v17 = 1;
      if (v11 < 1) {
        goto LABEL_28;
      }
LABEL_19:
      if (v11 > *(_DWORD *)a1
        || (v8 & 0x80000000) != 0
        || (int)v8 >= *(_DWORD *)(a1 + 4)
        || ((*(void *)(*(void *)(a1 + 16) + 8 * *(int *)(a1 + 8) * v8 + 8 * ((a2 + v10) >> 6)) << (a2 + v10)) & 0x8000000000000000) == 0)
      {
LABEL_28:
        int v18 = -1;
        if ((v9 & 0x80000000) != 0) {
          goto LABEL_34;
        }
        goto LABEL_29;
      }
      int v18 = 1;
      if ((v9 & 0x80000000) != 0) {
        goto LABEL_34;
      }
LABEL_29:
      if ((signed int)v9 < *(_DWORD *)a1)
      {
        uint64_t v19 = (a3 + v10 + 1);
        if (a3 + v10 + 1 >= 0
          && (int)v19 < *(_DWORD *)(a1 + 4)
          && (*(void *)(*(void *)(a1 + 16) + 8 * *(int *)(a1 + 8) * v19 + 8 * (v9 >> 6)) & (0x8000000000000000 >> (a2 - v4))) != 0)
        {
          int v20 = 1;
          goto LABEL_35;
        }
      }
LABEL_34:
      int v20 = -1;
LABEL_35:
      v5 += v13 + v17 + v18 + v20;
      uint64_t v21 = (v10 + 2);
      ++v10;
    }
    while (v4 != v21);
    if (v5 <= 0)
    {
      if (v5) {
        return 0;
      }
      ++v4;
      --v3;
      if (v4 == 5) {
        return 0;
      }
      continue;
    }
    return 1;
  }
}

uint64_t sub_2376DC5F4(uint64_t a1, uint64_t a2, double *a3)
{
  int v3 = a3;
  uint64_t v4 = a1;
  uint64_t v560 = *MEMORY[0x263EF8340];
  int v5 = *(void (**)(void, double))a3;
  double v6 = 0.0;
  if (*(void *)a3) {
    _ZF = a1 == 0;
  }
  else {
    _ZF = 1;
  }
  if (!_ZF)
  {
    uint64_t v8 = a1;
    do
    {
      double v6 = v6 + (double)**(int **)(v8 + 56);
      uint64_t v8 = *(void *)(v8 + 32);
    }
    while (v8);
  }
  if (!a1)
  {
LABEL_572:
    if (!v5) {
      return 0;
    }
    double v541 = v3[3] + v3[2] * 0.0;
    v5(*((void *)v3 + 1), v541);
    uint64_t result = 0;
    v3[6] = v541;
    return result;
  }
  double v9 = 4.0;
  double v10 = -0.5;
  double v11 = 1.0;
  double v546 = 0.0;
LABEL_9:
  BOOL v12 = *(int **)(v4 + 56);
  uint64_t v13 = *v12;
  uint64_t v14 = (char *)malloc_type_calloc(v13 + 1, 0x28uLL, 0x10000400A747E1EuLL);
  *((void *)v12 + 4) = v14;
  if (!v14) {
    return 1;
  }
  uint64_t v15 = v13;
  BOOL v16 = (int *)*((void *)v12 + 1);
  int v17 = *v16;
  void v12[6] = *v16;
  int v18 = v16[2];
  v12[7] = v18;
  *((void *)v14 + 4) = 0;
  *(_OWORD *)uint64_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  if ((int)v13 >= 1)
  {
    uint64_t v19 = v16 + 2;
    int v20 = (double *)(v14 + 72);
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    double v25 = 0.0;
    do
    {
      int v26 = *(v19 - 2) - v17;
      int v27 = *v19;
      v19 += 4;
      double v25 = v25 + (double)v26;
      double v24 = v24 + (double)(v27 - v18);
      double v23 = v23 + (double)(v26 * v26);
      *(v20 - 4) = v25;
      *(v20 - 3) = v24;
      double v22 = v22 + (double)((v27 - v18) * v26);
      *(v20 - 2) = v23;
      *(v20 - 1) = v22;
      double v21 = v21 + (double)((v27 - v18) * (v27 - v18));
      *int v20 = v21;
      v20 += 5;
      --v15;
    }
    while (v15);
  }
  uint64_t v28 = *(int **)(v4 + 56);
  uint64_t v29 = *((void *)v28 + 1);
  int v30 = *v28;
  CGRect v31 = (double *)malloc_type_calloc(*v28, 4uLL, 0x100004052888210uLL);
  if (!v31)
  {
    uint64_t v33 = 0;
    goto LABEL_570;
  }
  int v32 = (char *)malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
  uint64_t v33 = v32;
  if (!v32) {
    goto LABEL_570;
  }
  uint64_t v550 = v4;
  if (v30 < 1)
  {
    int v94 = v30 - 1;
    BOOL v39 = malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
    *((void *)v28 + 2) = v39;
    if (v39)
    {
      uint64_t v85 = v94;
      uint64_t v95 = v94;
      int v87 = *(_DWORD *)((char *)v31 + v95 * 4);
      v39[v95] = v87;
      goto LABEL_133;
    }
    goto LABEL_570;
  }
  int v34 = 0;
  uint64_t v35 = (v30 - 1);
  BOOL v36 = (void *)(v29 + 16 * v35 + 8);
  int v37 = v30;
  uint64_t v38 = v35;
  do
  {
    if (*(v36 - 1) != *(void *)(v29 + 16 * v34) && *v36 != *(void *)(v29 + 16 * v34 + 8)) {
      int v34 = v37;
    }
    *(_DWORD *)&v32[4 * v38] = v34;
    --v37;
    v36 -= 2;
    BOOL v58 = v38-- <= 0;
  }
  while (!v58);
  int v556 = v30 - 1;
  BOOL v39 = malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
  *((void *)v28 + 2) = v39;
  if (!v39) {
    goto LABEL_570;
  }
  while (2)
  {
    int32x4_t v559 = 0uLL;
    if (v35 + 1 >= v30) {
      uint64_t v41 = (((int)v35 + 1) % v30);
    }
    else {
      uint64_t v41 = (v35 + 1);
    }
    uint64_t v42 = *(void *)(v29 + 16 * v35);
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    int v46 = 0;
    uint64_t v47 = *(void *)(v29 + 16 * v35 + 8);
    uint64_t v48 = 3 * (*(void *)(v29 + 16 * v41) - v42) + *(void *)(v29 + 16 * v41 + 8) - v47;
    uint64_t v49 = v48 + 3;
    uint64_t v50 = v48 + 4;
    if (v49 >= 0) {
      uint64_t v50 = v49;
    }
    ++*(__int32 *)((char *)v559.i32 + ((v50 << 31 >> 30) & 0xFFFFFFFFFFFFFFFCLL));
    int v51 = *(_DWORD *)&v33[4 * v35];
    int v52 = (uint64_t *)(v29 + 16 * (int)v35);
    uint64_t v54 = *v52;
    uint64_t v53 = v52[1];
    int v40 = v35;
    do
    {
      while (1)
      {
        int v55 = (uint64_t *)(v29 + 16 * v51);
        uint64_t v57 = *v55;
        uint64_t v56 = v55[1];
        BOOL v58 = *v55 <= v54;
        if (*v55 == v54) {
          int v59 = 3;
        }
        else {
          int v59 = 0;
        }
        if (!v58) {
          int v59 = 6;
        }
        if (v56 == v53) {
          int v60 = 0;
        }
        else {
          int v60 = -1;
        }
        if (v56 > v53) {
          int v60 = 1;
        }
        uint64_t v61 = ((unint64_t)(v60 + v59 + (((v60 + v59) & 0x80u) >> 7)) >> 1);
        ++v559.i32[v61];
        if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v559))) & 1) == 0) {
          goto LABEL_24;
        }
        int v62 = v51;
        uint64_t v63 = v57 - v42;
        uint64_t v64 = v56 - v47;
        if ((v56 - v47) * v46 - (v57 - v42) * v45 < 0
          || (int)v64 * v44 - (int)v63 * v43 > 0)
        {
          LODWORD(v63) = v54 - v42;
          LODWORD(v64) = v53 - v47;
          int v62 = v40;
          goto LABEL_81;
        }
        if (v63 >= 0) {
          unint64_t v65 = v57 - v42;
        }
        else {
          unint64_t v65 = v42 - v57;
        }
        if (v64 >= 0) {
          unint64_t v66 = v56 - v47;
        }
        else {
          unint64_t v66 = v47 - v56;
        }
        if (v65 > 1 || v66 >= 2)
        {
          BOOL v67 = v63 > 0;
          BOOL v68 = v63 < 0;
          if (v64 < 0) {
            BOOL v67 = 1;
          }
          BOOL v69 = v57 != v42;
          if (v64 < 0) {
            BOOL v69 = 1;
          }
          if (v56 != v47) {
            BOOL v68 = 1;
          }
          if (v64 >= 0 && v68) {
            int v70 = v63 + 1;
          }
          else {
            int v70 = v63 - 1;
          }
          if (v63 < 1 && v69) {
            int v71 = v64 + 1;
          }
          else {
            int v71 = v64 - 1;
          }
          if (((v71 * v46 - v70 * v45) & 0x80000000) == 0)
          {
            int v45 = v71;
            int v46 = v70;
          }
          if (v64 < 1 && v68) {
            int v72 = v63 + 1;
          }
          else {
            int v72 = v63 - 1;
          }
          if (v63 >= 0 && v67) {
            int v73 = v64 + 1;
          }
          else {
            int v73 = v64 - 1;
          }
          if (v73 * v44 - v72 * v43 < 1)
          {
            int v43 = v73;
            int v44 = v72;
          }
        }
        int v51 = *(_DWORD *)&v33[4 * v62];
        if (v51 <= v62) {
          break;
        }
        uint64_t v53 = v56;
        uint64_t v54 = v57;
        int v40 = v62;
        if (v35 >= v62) {
          goto LABEL_32;
        }
      }
      if (v35 >= v62) {
        break;
      }
LABEL_32:
      uint64_t v53 = v56;
      uint64_t v54 = v57;
      int v40 = v62;
    }
    while (v35 >= v51);
    int v74 = (uint64_t *)(v29 + 16 * v51);
    uint64_t v53 = v56;
    uint64_t v54 = v57;
    uint64_t v57 = *v74;
    uint64_t v56 = v74[1];
LABEL_81:
    if (v57 == v54) {
      int v75 = 0;
    }
    else {
      int v75 = -1;
    }
    if (v57 > v54) {
      int v75 = 1;
    }
    if (v56 == v53) {
      int v76 = 0;
    }
    else {
      int v76 = -1;
    }
    if (v56 > v53) {
      int v76 = 1;
    }
    int v77 = v46 * v76 - v45 * v75;
    if ((v77 & 0x80000000) == 0)
    {
      int v78 = 10000000;
      int v79 = v44 * v76 - v75 * v43;
      if (v79 < 1) {
        goto LABEL_93;
      }
LABEL_99:
      unsigned int v82 = v43 * v63 - v44 * v64;
      if ((v82 & 0x80000000) != 0)
      {
        unsigned int v84 = ~v82 / v79;
        if (v78 >= (int)~v84) {
          int v78 = ~v84;
        }
        int v40 = v78 + v62;
        if (v78 + v62 < v30) {
          goto LABEL_107;
        }
      }
      else
      {
        int v83 = v82 / v79;
        if (v78 >= v83) {
          int v78 = v83;
        }
        int v40 = v78 + v62;
        if (v78 + v62 < v30) {
          goto LABEL_107;
        }
      }
LABEL_23:
      v40 %= v30;
      goto LABEL_24;
    }
    unsigned int v80 = v46 * v64 - v45 * v63;
    unsigned int v81 = -v77;
    if ((v80 & 0x80000000) != 0)
    {
      int v78 = ~(~v80 / v81);
      int v79 = v44 * v76 - v75 * v43;
      if (v79 >= 1) {
        goto LABEL_99;
      }
    }
    else
    {
      int v78 = v80 / v81;
      int v79 = v44 * v76 - v75 * v43;
      if (v79 >= 1) {
        goto LABEL_99;
      }
    }
LABEL_93:
    int v40 = v78 + v62;
    if (v78 + v62 >= v30) {
      goto LABEL_23;
    }
LABEL_107:
    if (v40 < 0) {
      int v40 = v30 + ~(~v40 % v30);
    }
LABEL_24:
    *((_DWORD *)v31 + v35) = v40;
    BOOL v58 = v35-- <= 0;
    if (!v58) {
      continue;
    }
    break;
  }
  uint64_t v85 = v556;
  uint64_t v86 = v556;
  int v87 = *(_DWORD *)((char *)v31 + v86 * 4);
  v39[v86] = v87;
  uint64_t v88 = (v30 - 2);
  if (v30 < 2)
  {
    uint64_t v4 = v550;
  }
  else
  {
    uint64_t v4 = v550;
    do
    {
      uint64_t v89 = *((int *)v31 + v88);
      BOOL v91 = (int)v89 < v87 || v88 < v89;
      BOOL v93 = (int)v89 < v87 && v88 < v89;
      if (v88 < v87) {
        BOOL v91 = v93;
      }
      if (v91) {
        int v87 = *((_DWORD *)v31 + v88);
      }
      v39[v88] = v87;
      BOOL v58 = v88-- <= 0;
    }
    while (!v58);
  }
LABEL_133:
  int v96 = -2 - v85;
  while (2)
  {
    int v98 = v30 + ~(v96 % v30);
    if (v85 >= -1) {
      int v98 = v85 + 1;
    }
    if (v85 + 1 >= v30) {
      int v98 = ((int)v85 + 1) % v30;
    }
    int v99 = v39[v85];
    if (v98 <= v99)
    {
      if (v98 > v87 || v87 >= v99) {
        break;
      }
      goto LABEL_139;
    }
    if (v98 <= v87 || v87 < v99)
    {
LABEL_139:
      v39[v85--] = v87;
      ++v96;
      continue;
    }
    break;
  }
  free(v31);
  free(v33);
  int v101 = *(unsigned int **)(v4 + 56);
  size_t v102 = *v101;
  if ((v102 & 0x80000000) != 0) {
    return 1;
  }
  int v103 = malloc_type_calloc(v102 + 1, 8uLL, 0x100004000313F17uLL);
  if (v103)
  {
    int v104 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    if (!v104) {
      goto LABEL_559;
    }
    int v105 = malloc_type_calloc(v102, 4uLL, 0x100004052888210uLL);
    if (!v105) {
      goto LABEL_560;
    }
    int v106 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    if (!v106) {
      goto LABEL_561;
    }
    int v107 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    if (!v107) {
      goto LABEL_562;
    }
    float v108 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    float v109 = v108;
    if (!v108) {
      goto LABEL_563;
    }
    if (v102)
    {
      uint64_t v110 = *((void *)v101 + 2);
      int v111 = *(_DWORD *)(v110 + 4 * (v102 - 1));
      int v112 = v111 - 1;
      if (v111 > (int)v102)
      {
        v112 %= (int)v102;
        if (!v112) {
          goto LABEL_159;
        }
LABEL_163:
        if ((v112 & 0x80000000) == 0) {
          goto LABEL_164;
        }
        *int v105 = v102;
        if (v102 == 1) {
          goto LABEL_167;
        }
LABEL_198:
        uint64_t v156 = 0;
        uint64_t v157 = 0;
        while (2)
        {
          int v159 = *(_DWORD *)(v110 + (v157 >> 30));
          int v158 = v159 - 1;
          if (v159 <= (int)v102)
          {
            if (v159 <= 0)
            {
              int v158 = v102 + ~(-v159 % (int)v102);
              uint64_t v160 = v156 + 1;
              if (v156 + 1 == v158) {
                goto LABEL_207;
              }
            }
            else
            {
              uint64_t v160 = v156 + 1;
              if (v156 + 1 == v158) {
                goto LABEL_207;
              }
            }
LABEL_199:
            if (v160 > v158) {
              int v158 = v102;
            }
          }
          else
          {
            v158 %= (int)v102;
            uint64_t v160 = v156 + 1;
            if (v156 + 1 != v158) {
              goto LABEL_199;
            }
LABEL_207:
            int v158 = v156 + 2;
            if (v156 + 2 >= v102)
            {
              if (v102 - 2 == v156) {
                int v158 = 0;
              }
              goto LABEL_199;
            }
          }
          v105[v156 + 1] = v158;
          v157 += 0x100000000;
          if (v102 - 1 == ++v156) {
            goto LABEL_167;
          }
          continue;
        }
      }
      if (v111 <= 0)
      {
        int v112 = v102 + ~(-v111 % (int)v102);
        if (v112) {
          goto LABEL_163;
        }
      }
      else if (v111 != 1)
      {
        goto LABEL_163;
      }
LABEL_159:
      int v112 = v102 > 1;
LABEL_164:
      *int v105 = v112;
      if (v102 != 1) {
        goto LABEL_198;
      }
LABEL_167:
      uint64_t v115 = 0;
      LODWORD(v116) = 1;
      do
      {
        if ((int)v116 <= v105[v115])
        {
          uint64_t v116 = (int)v116;
          do
          {
            v106[v116] = v115;
            int v117 = v116 + 1;
            BOOL v58 = v116++ < (int)v105[v115];
          }
          while (v58);
          LODWORD(v116) = v117;
        }
        ++v115;
      }
      while (v115 != v102);
      uint64_t v113 = 0;
      int v118 = 0;
      do
      {
        v107[v113] = v118;
        int v118 = v105[v118];
        ++v113;
      }
      while (v118 < (int)v102);
      v107[v113] = v102;
      if ((int)v113 >= 1)
      {
        unint64_t v119 = v113;
        int v120 = v102;
        do
        {
          v108[v119] = v120;
          int v120 = v106[v120];
          BOOL v58 = v119-- > 1;
        }
        while (v58);
      }
      *float v108 = 0;
      *int v103 = 0;
      if (v113)
      {
        uint64_t v121 = 1;
        do
        {
          uint64_t v122 = (int)v108[v121];
          int v123 = v107[v121];
          if ((int)v122 <= v123)
          {
            do
            {
              while (1)
              {
                uint64_t v124 = (int)v107[v121 - 1];
                int v125 = v106[v122];
                if ((int)v124 >= v125) {
                  break;
                }
                *(double *)&v103[v122] = -1.0;
                BOOL v58 = v122++ < v123;
                if (!v58) {
                  goto LABEL_180;
                }
              }
              uint64_t v126 = (uint64_t *)*((void *)v101 + 1);
              uint64_t v127 = *((void *)v101 + 4);
              v128 = (float64x2_t *)(v127 + 40 * (v122 + 1));
              double v129 = (double)*v126;
              double v130 = (double)v126[1];
              int v131 = v122 - v124 + 1;
              float64x2_t v132 = (double *)(v127 + 40 * (int)v124 + 32);
              float64x2_t v133 = &v126[2 * v124 + 1];
              double v134 = -1.0;
              do
              {
                uint64_t v135 = (int)*v101;
                if (v122 >= v135)
                {
                  int v139 = v122 - v135;
                  v141 = (float64x2_t *)(v127 + 40 * ((int)v122 - (int)v135 + 1));
                  v142 = (float64x2_t *)(v127 + 40 * (int)v135);
                  *(void *)&double v136 = *(_OWORD *)&vaddq_f64(vsubq_f64(v141[1], *(float64x2_t *)(v132 - 2)), v142[1]);
                  _Q3 = vaddq_f64(vsubq_f64(*v141, *(float64x2_t *)(v132 - 4)), *v142);
                  double v138 = v141[2].f64[0] - *v132 + v142[2].f64[0];
                  int v140 = v122 + 1 - v124;
                }
                else
                {
                  *(void *)&double v136 = *(_OWORD *)&vsubq_f64(v128[1], *(float64x2_t *)(v132 - 2));
                  _Q3 = vsubq_f64(*v128, *(float64x2_t *)(v132 - 4));
                  double v138 = v128[2].f64[0] - *v132;
                  int v139 = v122;
                  int v140 = v131;
                }
                double v143 = (double)v140;
                uint64_t v144 = *(v133 - 1);
                int v145 = &v126[2 * v139];
                uint64_t v147 = *v145;
                uint64_t v146 = v145[1];
                _D7 = (double)(v147 + v144) * 0.5 - v129;
                _D16 = (double)(v146 + *v133) * 0.5 - v130;
                double v150 = (v136 + -2.0 * _Q3.f64[0] * _D7) / v143 + _D7 * _D7;
                __asm
                {
                  FMLS            D4, D16, V3.D[0]
                  FMLS            D4, D7, V3.D[1]
                }
                double v155 = *(double *)&v103[v124]
                     + sqrt(((double)(*v133 - v146) + (double)(*v133 - v146))* (double)(v147 - v144)* (_D4 / v143 + _D7 * _D16)+ (double)(*v133 - v146) * (double)(*v133 - v146) * v150+ (double)(v147 - v144)* (double)(v147 - v144)* ((v138 + vmuld_lane_f64(-2.0, _Q3, 1) * _D16) / v143 + _D16 * _D16));
                if (v134 < 0.0 || v155 < v134)
                {
                  v104[v122] = v124;
                  int v125 = v106[v122];
                  double v134 = v155;
                }
                BOOL v58 = v124-- <= v125;
                ++v131;
                v132 -= 5;
                v133 -= 2;
              }
              while (!v58);
              int v123 = v107[v121];
              *(double *)&v103[v122] = v134;
              BOOL v58 = v122++ < v123;
            }
            while (v58);
          }
LABEL_180:
          ++v121;
        }
        while (v121 != v113 + 1);
        size_t v114 = v113;
      }
      else
      {
        size_t v114 = 0;
      }
    }
    else
    {
      LODWORD(v113) = 0;
      size_t v114 = 0;
      *int v107 = 0;
      *float v109 = 0;
      *int v103 = 0;
    }
    v101[10] = v113;
    v161 = (char *)malloc_type_calloc(v114, 4uLL, 0x100004052888210uLL);
    *((void *)v101 + 6) = v161;
    if (!v161) {
      goto LABEL_563;
    }
    if (v102)
    {
      v162 = &v161[4 * (int)v113 - 4];
      do
      {
        LODWORD(v102) = v104[v102];
        *(_DWORD *)v162 = v102;
        v162 -= 4;
      }
      while ((int)v102 > 0);
    }
    free(v103);
    free(v104);
    free(v105);
    free(v106);
    free(v107);
    free(v109);
    uint64_t v163 = *(void *)(v550 + 56);
    int64_t v164 = *(int *)(v163 + 40);
    uint64_t v165 = *(void *)(v163 + 48);
    int v166 = *(_DWORD *)v163;
    uint64_t v554 = *(void *)(v163 + 8);
    uint64_t v167 = *(int *)(v163 + 24);
    uint64_t v168 = *(int *)(v163 + 28);
    v169 = (float64x2_t *)malloc_type_calloc(v164, 0x10uLL, 0x1000040451B5BE8uLL);
    if (!v169)
    {
      CGRect v31 = 0;
      uint64_t v33 = 0;
      goto LABEL_569;
    }
    v557 = v169;
    CGRect v31 = (double *)malloc_type_calloc(v164, 0x10uLL, 0x1000040451B5BE8uLL);
    if (v31)
    {
      uint64_t v33 = (char *)malloc_type_calloc(v164, 0x48uLL, 0x1000040FF89C88EuLL);
      if (!v33 || sub_2376DB6E4(v163 + 56, v164)) {
        goto LABEL_568;
      }
      if ((int)v164 >= 1)
      {
        uint64_t v170 = 0;
        while (1)
        {
          int64_t v171 = v170 + 1;
          if (v170 + 1 == v164) {
            int v172 = 0;
          }
          else {
            int v172 = v170 + 1;
          }
          if (v171 < v164) {
            int v172 = v170 + 1;
          }
          int v173 = *(_DWORD *)(v165 + 4 * v172);
          int v174 = *(_DWORD *)(v165 + 4 * v170);
          int v175 = v173 - v174;
          int v176 = v166 + ~(~v175 % v166);
          if (v175 >= 0) {
            int v176 = v175;
          }
          if (v175 >= v166) {
            int v177 = v175 % v166;
          }
          else {
            int v177 = v176;
          }
          int v178 = v177 + v174;
          int v179 = *(_DWORD *)v163;
          if (v178 >= *(_DWORD *)v163)
          {
            int v180 = 0;
            do
            {
              v178 -= v179;
              ++v180;
            }
            while (v178 >= v179);
          }
          else
          {
            int v180 = 0;
          }
          while (v174 >= v179)
          {
            v174 -= v179;
            --v180;
          }
          for (; v178 < 0; --v180)
            v178 += v179;
          if (v174 < 0)
          {
            do
            {
              ++v180;
              v174 += v179;
            }
            while (v174 < 0);
          }
          v181 = (char *)&v31[2 * v170];
          uint64_t v182 = *(void *)(v163 + 32);
          uint64_t v183 = v178 + 1;
          v184 = (float64x2_t *)(v182 + 40 * v183);
          v185 = (float64x2_t *)(v182 + 40 * v174);
          v186 = (float64x2_t *)(v182 + 40 * v179);
          float64_t v187 = v184[1].f64[0] - v185[1].f64[0] + (double)v180 * v186[1].f64[0];
          float64_t v188 = v184[1].f64[1] - v185[1].f64[1] + (double)v180 * v186[1].f64[1];
          int v189 = v183 - v174 + v180 * v179;
          float64_t v190 = v184[2].f64[0] - v185[2].f64[0] + (double)v180 * v186[2].f64[0];
          float64x2_t v191 = vmlaq_n_f64(vsubq_f64(*v184, *v185), *v186, (double)v180);
          v557[v170] = vdivq_f64(v191, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v189), 0));
          double v192 = (v187 - vmulq_f64(v191, v191).f64[0] / (double)v189) / (double)v189;
          double v193 = (v188 - vmuld_lane_f64(v191.f64[0], v191, 1) / (double)v189) / (double)v189;
          double v194 = (v190 - vmuld_lane_f64(v191.f64[1], v191, 1) / (double)v189) / (double)v189;
          double v195 = (v192 + v194 + sqrt(v193 * (v193 * v9) + (v192 - v194) * (v192 - v194))) * 0.5;
          double v196 = v193 * v193;
          if (vabdd_f64(v192, v195) >= vabdd_f64(v194, v195))
          {
            double v200 = v192 - v195;
            double v198 = sqrt(v196 + v200 * v200);
            if (v198 != 0.0)
            {
              *(double *)v181 = -v193 / v198;
              double v199 = v200 / v198;
              goto LABEL_251;
            }
          }
          else
          {
            double v197 = v194 - v195;
            double v198 = sqrt(v196 + v197 * v197);
            if (v198 != 0.0)
            {
              *(double *)v181 = -v197 / v198;
              double v199 = v193 / v198;
LABEL_251:
              v31[2 * v170 + 1] = v199;
            }
          }
          if (v198 == 0.0)
          {
            *(void *)v181 = 0;
            *((void *)v181 + 1) = 0;
          }
          ++v170;
          if (v171 == v164)
          {
            v201 = v33 + 32;
            v202 = v31 + 1;
            v203 = &v557->f64[1];
            uint64_t v204 = v164;
            do
            {
              while (1)
              {
                double v212 = *(v202 - 1);
                double v213 = *v202;
                double v214 = v213 * v213 + v212 * v212;
                if (v214 == 0.0) {
                  break;
                }
                double v205 = -v212;
                double v206 = v212 * *v203 - v213 * *(v203 - 1);
                double v207 = -(v212 * v213) / v214;
                *((double *)v201 - 4) = v213 * v213 / v214;
                *((double *)v201 - 3) = v207;
                double v208 = v213 * v206 / v214;
                *((double *)v201 - 2) = v208;
                *((double *)v201 - 1) = v207;
                double v209 = v212 * v212 / v214;
                *((double *)v201 + 2) = v208;
                float64x2_t v210 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v206, 0);
                v210.f64[0] = v205;
                float64x2_t v211 = vdivq_f64(vmulq_n_f64(v210, v206), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v214, 0));
                *(double *)v201 = v209;
                *((void *)v201 + 1) = *(void *)&v211.f64[0];
                *(float64x2_t *)(v201 + 24) = v211;
                v201 += 72;
                v202 += 2;
                v203 += 2;
                if (!--v204) {
                  goto LABEL_258;
                }
              }
              *((void *)v201 + 4) = 0;
              *(_OWORD *)v201 = 0uLL;
              *((_OWORD *)v201 + 1) = 0uLL;
              *((_OWORD *)v201 - 2) = 0uLL;
              *((_OWORD *)v201 - 1) = 0uLL;
              v201 += 72;
              v202 += 2;
              v203 += 2;
              --v204;
            }
            while (v204);
LABEL_258:
            uint64_t v215 = 0;
            uint64_t v216 = *(void *)(v163 + 88);
LABEL_300:
            v257 = (void *)(v554 + 16 * *(int *)(v165 + 4 * v215));
            uint64_t v258 = *v257 - v167;
            uint64_t v259 = v257[1] - v168;
            if (v215) {
              int v260 = v215;
            }
            else {
              int v260 = v164;
            }
            v261 = (double *)&v33[72 * v260 - 72];
            v262 = (double *)&v33[72 * v215];
            double v263 = *v261 + *v262;
            double v264 = v261[1] + v262[1];
            double v265 = v261[2] + v262[2];
            double v266 = v261[3] + v262[3];
            double v267 = v261[4] + v262[4];
            double v268 = v261[5] + v262[5];
            double v269 = v261[6] + v262[6];
            double v270 = v261[7] + v262[7];
            double v271 = (double)v258;
            double v272 = v261[8] + v262[8];
            double v273 = (double)v259;
            double v274 = v263 * v267 - v264 * v266;
            if (v274 == 0.0)
            {
              double v279 = -v264;
              do
              {
                double v280 = v263;
                if (v263 <= v267)
                {
                  if (v267 == 0.0)
                  {
                    double v279 = 1.0;
                    double v280 = 0.0;
                  }
                  else
                  {
                    double v279 = -v267;
                    double v280 = v266;
                  }
                }
                double v281 = v280 * v280 + v279 * v279;
                double v282 = -(v279 * v271) - v280 * v273;
                double v263 = v263 + v279 * v279 / v281;
                double v283 = v280 * v279 / v281;
                double v264 = v264 + v283;
                double v284 = v279 * v282 / v281;
                double v265 = v265 + v284;
                double v266 = v266 + v283;
                double v267 = v267 + v280 * v280 / v281;
                double v285 = v280 * v282 / v281;
                double v268 = v268 + v285;
                double v269 = v269 + v284;
                double v270 = v270 + v285;
                double v272 = v272 + v282 * v282 / v281;
                double v279 = -v264;
                double v274 = v263 * v267 - v264 * v266;
              }
              while (v274 == 0.0);
            }
            double v255 = (v264 * v268 - v265 * v267) / v274;
            double v253 = (v265 * v266 - v268 * v263) / v274;
            double v275 = vabdd_f64(v253, v273);
            if (vabdd_f64(v255, v271) <= 0.5 && v275 <= 0.5)
            {
LABEL_299:
              v256 = (double *)(v216 + 16 * v215);
              double *v256 = v255 + (double)(int)v167;
              v256[1] = v253 + (double)(int)v168;
              if (++v215 == v164) {
                break;
              }
              goto LABEL_300;
            }
            double v220 = v272
                 + v268 * v273
                 + v263 * v271 * v271
                 + 0.0
                 + v264 * v271 * v273
                 + v265 * v271
                 + v266 * v273 * v271
                 + v267 * v273 * v273
                 + v269 * v271
                 + v270 * v273;
            if (v263 == 0.0)
            {
              double v217 = (double)v258;
              double v224 = (double)v259;
              double v225 = v271 + v10;
              if (v267 != 0.0) {
                goto LABEL_311;
              }
LABEL_269:
              double v226 = v225 * v263 * v225 + 0.0;
              double v227 = v225 * v264;
              double v228 = v225 * v265;
              double v229 = v225 + v11;
              double v230 = (v225 + v11) * v263 * (v225 + v11) + 0.0;
              double v231 = (v225 + v11) * v264;
              double v232 = (v225 + v11) * v265;
            }
            else
            {
              double v217 = -(v265 + v264 * (v273 + v10)) / v263;
              BOOL v218 = vabdd_f64(v217, v271) <= 0.5;
              BOOL v219 = v272
                   + (v273 + v10) * v268
                   + v265 * v217
                   + v263 * v217 * v217
                   + 0.0
                   + v264 * v217 * (v273 + v10)
                   + (v273 + v10) * v266 * v217
                   + (v273 + v10) * v267 * (v273 + v10)
                   + v269 * v217
                   + v270 * (v273 + v10) < v220;
              if (v218 && v219) {
                double v220 = v272
              }
                     + (v273 + v10) * v268
                     + v265 * v217
                     + v263 * v217 * v217
                     + 0.0
                     + v264 * v217 * (v273 + v10)
                     + (v273 + v10) * v266 * v217
                     + (v273 + v10) * v267 * (v273 + v10)
                     + v269 * v217
                     + v270 * (v273 + v10);
              else {
                double v217 = v271;
              }
              if (v218 && v219) {
                double v221 = v273 + v10;
              }
              else {
                double v221 = v273;
              }
              double v222 = v273 + v10 + v11;
              double v223 = -(v265 + v264 * v222) / v263;
              if (vabdd_f64(v223, v271) <= 0.5
                && v272
                 + v222 * v268
                 + v265 * v223
                 + v263 * v223 * v223
                 + 0.0
                 + v264 * v223 * v222
                 + v222 * v266 * v223
                 + v222 * v267 * v222
                 + v269 * v223
                 + v270 * v222 < v220)
              {
                double v220 = v272
                     + v222 * v268
                     + v265 * v223
                     + v263 * v223 * v223
                     + 0.0
                     + v264 * v223 * v222
                     + v222 * v266 * v223
                     + v222 * v267 * v222
                     + v269 * v223
                     + v270 * v222;
                double v217 = -(v265 + v264 * v222) / v263;
                double v224 = v273 + v10 + v11;
              }
              else
              {
                double v224 = v221;
              }
              double v225 = v271 + v10;
              if (v267 == 0.0) {
                goto LABEL_269;
              }
LABEL_311:
              double v277 = -(v268 + v266 * v225) / v267;
              double v226 = v225 * v263 * v225 + 0.0;
              double v227 = v225 * v264;
              double v228 = v225 * v265;
              if (vabdd_f64(v277, v273) <= 0.5
                && v272
                 + v268 * v277
                 + v225 * v265
                 + v226
                 + v225 * v264 * v277
                 + v266 * v277 * v225
                 + v267 * v277 * v277
                 + v269 * v225
                 + v270 * v277 < v220)
              {
                double v220 = v272
                     + v268 * v277
                     + v225 * v265
                     + v226
                     + v225 * v264 * v277
                     + v266 * v277 * v225
                     + v267 * v277 * v277
                     + v269 * v225
                     + v270 * v277;
                double v217 = v225;
                double v224 = -(v268 + v266 * v225) / v267;
              }
              double v229 = v225 + v11;
              double v278 = -(v268 + v266 * (v225 + v11)) / v267;
              double v230 = (v225 + v11) * v263 * (v225 + v11) + 0.0;
              double v231 = (v225 + v11) * v264;
              double v232 = (v225 + v11) * v265;
              if (vabdd_f64(v278, v273) <= 0.5
                && v272
                 + v268 * v278
                 + v232
                 + v230
                 + v231 * v278
                 + v266 * v278 * (v225 + v11)
                 + v267 * v278 * v278
                 + v269 * (v225 + v11)
                 + v270 * v278 < v220)
              {
                double v220 = v272
                     + v268 * v278
                     + v232
                     + v230
                     + v231 * v278
                     + v266 * v278 * (v225 + v11)
                     + v267 * v278 * v278
                     + v269 * (v225 + v11)
                     + v270 * v278;
                double v217 = v225 + v11;
                double v224 = -(v268 + v266 * (v225 + v11)) / v267;
              }
            }
            double v233 = v273 + v10;
            double v234 = v233 + v11;
            double v235 = v233 * v266;
            double v236 = v233 * v267;
            double v237 = v233 * v268;
            double v238 = v272
                 + v233 * v268
                 + v228
                 + v226
                 + v227 * v233
                 + v233 * v266 * v225
                 + v233 * v267 * v233
                 + v269 * v225
                 + v270 * v233;
            if (v238 >= v220) {
              double v239 = v220;
            }
            else {
              double v239 = v272
            }
                   + v233 * v268
                   + v228
                   + v226
                   + v227 * v233
                   + v233 * v266 * v225
                   + v233 * v267 * v233
                   + v269 * v225
                   + v270 * v233;
            if (v238 < v220) {
              double v224 = v233;
            }
            double v240 = v234 * v266;
            double v241 = v234 * v267;
            double v242 = v234 * v268;
            double v243 = v272 + v242 + v228 + v226 + v227 * v234 + v240 * v225 + v241 * v234 + v269 * v225 + v270 * v234;
            _NF = v243 < v239;
            if (v243 >= v239) {
              double v243 = v239;
            }
            double v11 = 1.0;
            if (_NF) {
              double v245 = v234;
            }
            else {
              double v245 = v224;
            }
            if (!_NF && v238 >= v220) {
              double v225 = v217;
            }
            double v247 = v237 + v232 + v230 + v231 * v233 + v235 * v229 + v236 * v233 + v269 * v229 + v270 * v233;
            double v248 = v272 + v247;
            BOOL v249 = v272 + v247 < v243;
            if (v272 + v247 >= v243) {
              double v250 = v243;
            }
            else {
              double v250 = v272 + v247;
            }
            if (!v249) {
              double v233 = v245;
            }
            double v251 = v272 + v242 + v232 + v230 + v231 * v234 + v240 * v229 + v241 * v234 + v269 * v229 + v270 * v234;
            BOOL v252 = v251 < v250;
            if (v251 >= v250) {
              double v253 = v233;
            }
            else {
              double v253 = v234;
            }
            if (v252 || v248 < v243) {
              double v255 = v229;
            }
            else {
              double v255 = v225;
            }
            goto LABEL_299;
          }
        }
      }
      free(v557);
      free(v31);
      free(v33);
      uint64_t v286 = v550;
      uint64_t v287 = *(void *)(v550 + 56);
      if (*(_DWORD *)(v550 + 4) == 45)
      {
        uint64_t v288 = *(unsigned int *)(v287 + 56);
        int v3 = a3;
        uint64_t v289 = a2;
        double v290 = -1.0;
        v291 = (double *)&unk_2376F4000;
        double v292 = 0.75;
        if ((int)v288 >= 2)
        {
          uint64_t v293 = 0;
          uint64_t v294 = 0;
          uint64_t v295 = v288 - 2;
          uint64_t v296 = 16 * v288 - 16;
          do
          {
            uint64_t v297 = *(void *)(v287 + 88);
            long long v299 = *(_OWORD *)(v297 + v296);
            int32x4_t v559 = *(int32x4_t *)(v297 + v293);
            int32x4_t v298 = v559;
            *(_OWORD *)(v297 + v293) = v299;
            *(int32x4_t *)(*(void *)(v287 + 88) + v296) = v298;
            ++v294;
            v293 += 16;
            v296 -= 16;
            BOOL v58 = v294 < v295--;
          }
          while (v58);
          uint64_t v287 = *(void *)(v550 + 56);
        }
      }
      else
      {
        int v3 = a3;
        uint64_t v289 = a2;
        double v290 = -1.0;
        v291 = (double *)&unk_2376F4000;
        double v292 = 0.75;
      }
      unint64_t v300 = *(unsigned int *)(v287 + 56);
      if ((int)v300 >= 1)
      {
        unint64_t v301 = 0;
        double v302 = *(double *)(v289 + 8);
        uint64_t v303 = 8;
        do
        {
          unint64_t v308 = v301 + 1;
          if (v300 - 1 == v301) {
            int v309 = 0;
          }
          else {
            int v309 = v301 + 1;
          }
          if (v308 < v300) {
            int v309 = v301 + 1;
          }
          int v310 = v301 + 2;
          if (v310 >= (int)v300) {
            v310 %= (int)v300;
          }
          uint64_t v311 = *(void *)(v287 + 88);
          v312 = (float64x2_t *)(v311 + 16 * v310);
          uint64_t v313 = v309;
          v314 = (float64x2_t *)(v311 + 16 * v309);
          double v316 = v312->f64[0];
          double v315 = v312->f64[1];
          double v318 = v314->f64[0];
          double v317 = v314->f64[1];
          v319 = (double *)(v311 + v303);
          double v320 = *(v319 - 1);
          double v321 = *v319;
          double v322 = v312->f64[0] - v320;
          if (v322 >= 0.0) {
            double v323 = 0.0;
          }
          else {
            double v323 = v290;
          }
          double v324 = v315 - v321;
          if (v322 > 0.0) {
            double v323 = v11;
          }
          if (v324 >= 0.0) {
            double v325 = 0.0;
          }
          else {
            double v325 = v11;
          }
          if (v324 > 0.0) {
            double v325 = v290;
          }
          double v326 = v323 * v322 - v324 * v325;
          if (v326 == 0.0)
          {
            *(void *)(*(void *)(v287 + 104) + 8 * v313) = 0x3FF5555555555555;
            double v329 = 1.33333333;
            if (v302 > 1.33333333) {
              goto LABEL_357;
            }
          }
          else
          {
            double v327 = fabs(((v318 - v320) * v324 - v322 * (v317 - v321)) / v326);
            double v328 = 0.0;
            if (v327 > v11) {
              double v328 = v11 - v11 / v327;
            }
            double v329 = v328 / v292;
            *(double *)(*(void *)(v287 + 104) + 8 * v313) = v328 / v292;
            if (v328 / v292 < v302)
            {
              double v305 = v291[240];
              if (v329 >= v305)
              {
                double v305 = v329;
                if (v329 > v11) {
LABEL_357:
                }
                  double v305 = 1.0;
              }
              double v330 = v305 * 0.5 + 0.5;
              uint64_t v304 = *(void *)(v287 + 72);
              v331 = (float64x2_t *)(v304 + 48 * (int)v313);
              float64x2_t v332 = vmlaq_n_f64(*(float64x2_t *)(v319 - 1), vsubq_f64(*v314, *(float64x2_t *)(v319 - 1)), v330);
              float64x2_t v333 = vmlaq_n_f64(*v312, vsubq_f64(*v314, *v312), v330);
              *(_DWORD *)(*(void *)(v287 + 64) + 4 * v313) = 1;
              float64x2_t *v331 = v332;
              v331[1] = v333;
              goto LABEL_331;
            }
          }
          *(_DWORD *)(*(void *)(v287 + 64) + 4 * v313) = 2;
          *(float64x2_t *)(*(void *)(v287 + 72) + 48 * (int)v313 + 16) = *v314;
          uint64_t v304 = *(void *)(v287 + 72);
          double v305 = v329;
LABEL_331:
          uint64_t v306 = v304 + 48 * (int)v313;
          *(double *)(v306 + 32) = v316 + (v318 - v316) * 0.5;
          *(double *)(v306 + 40) = v315 + (v317 - v315) * 0.5;
          uint64_t v307 = 8 * v313;
          *(double *)(*(void *)(v287 + 96) + v307) = v305;
          *(void *)(*(void *)(v287 + 112) + v307) = 0x3FE0000000000000;
          v303 += 16;
          unint64_t v301 = v308;
        }
        while (v300 != v308);
      }
      *(_DWORD *)(v287 + 80) = 1;
      uint64_t v334 = *(void *)(v550 + 56);
      if (!*(_DWORD *)(v289 + 16))
      {
        *(void *)(v334 + 184) = v334 + 56;
        sub_2376DB834(v334 + 56, v550 + 8);
        v346 = *(void (**)(void, double))v3;
        if (*(void *)v3) {
          goto LABEL_411;
        }
        goto LABEL_414;
      }
      double v552 = *(double *)(v289 + 24);
      uint64_t v335 = *(unsigned int *)(v334 + 56);
      size_t v336 = (int)v335 + 1;
      v337 = malloc_type_calloc(v336, 4uLL, 0x100004052888210uLL);
      if (v337 && (v558 = malloc_type_calloc(v336, 8uLL, 0x100004000313F17uLL)) != 0)
      {
        v338 = malloc_type_calloc(v336, 4uLL, 0x100004052888210uLL);
        if (!v338) {
          goto LABEL_565;
        }
        v339 = (char *)malloc_type_calloc(v336, 0x40uLL, 0x1000040FA0F61DDuLL);
        if (!v339) {
          goto LABEL_565;
        }
        v551 = v339;
        v340 = malloc_type_calloc((int)v335, 4uLL, 0x100004052888210uLL);
        if (v340 && (v341 = malloc_type_calloc(v336, 8uLL, 0x100004000313F17uLL)) != 0)
        {
          v548 = (double *)v341;
          if ((int)v335 >= 1)
          {
            v342 = *(_DWORD **)(v334 + 64);
            if (*v342 == 1)
            {
              v343 = *(double **)(v334 + 88);
              v344 = &v343[2 * (v335 - 1)];
              double v345 = (*v343 - *v344) * (v343[2 * (v335 > 1) + 1] - v344[1])
                   - (v343[2 * (v335 > 1)] - *v344) * (v343[1] - v344[1]);
              if (v345 <= 0.0)
              {
                if (v345 >= 0.0) {
                  int v384 = 0;
                }
                else {
                  int v384 = -1;
                }
                _DWORD *v340 = v384;
                if (v335 != 1) {
                  goto LABEL_424;
                }
              }
              else
              {
                _DWORD *v340 = 1;
                if (v335 == 1) {
                  goto LABEL_438;
                }
LABEL_424:
                uint64_t v385 = 1;
                do
                {
                  while (v342[v385] != 1)
                  {
                    v340[v385++] = 0;
                    if (v385 == v335) {
                      goto LABEL_438;
                    }
                  }
                  uint64_t v386 = *(void *)(v334 + 88);
                  uint64_t v388 = v385 + 1;
                  if (v385 + 1 == v335) {
                    int v389 = 0;
                  }
                  else {
                    int v389 = v385 + 1;
                  }
                  if (v388 < (int)v335) {
                    int v389 = v385 + 1;
                  }
                  v387 = (double *)(v386 + (((v385 << 32) - 0x100000000) >> 28));
                  double v390 = (*(double *)(v386 + 16 * v385) - *v387) * (*(double *)(v386 + 16 * v389 + 8) - v387[1])
                       - (*(double *)(v386 + 16 * v389) - *v387) * (*(double *)(v386 + 16 * v385 + 8) - v387[1]);
                  if (v390 >= 0.0) {
                    int v391 = 0;
                  }
                  else {
                    int v391 = -1;
                  }
                  if (v390 > 0.0) {
                    int v391 = 1;
                  }
                  v340[v385++] = v391;
                }
                while (v388 != v335);
              }
            }
            else
            {
              _DWORD *v340 = 0;
              if (v335 != 1) {
                goto LABEL_424;
              }
            }
LABEL_438:
            uint64_t v392 = 0;
            uint64_t v393 = 0;
            void *v341 = 0;
            v394 = v341 + 1;
            v395 = *(double **)(v334 + 88);
            double v396 = *v395;
            double v397 = v395[1];
            double v398 = 0.0;
            do
            {
              uint64_t v399 = v393 + 1;
              if (v335 - 1 == v393) {
                int v400 = 0;
              }
              else {
                int v400 = v393 + 1;
              }
              if (v399 < (int)v335) {
                int v400 = v393 + 1;
              }
              if (v342[v400] == 1)
              {
                double v401 = *(double *)(*(void *)(v334 + 96) + 8 * v400);
                uint64_t v402 = *(void *)(v334 + 72);
                v403 = &v395[2 * v400];
                uint64_t v404 = v402 + 48 * v400;
                double v405 = *(double *)(v402 + v392 + 32);
                double v398 = ((v405 - v396) * (*(double *)(v404 + 40) - v397)
                      - (*(double *)(v404 + 32) - v396) * (*(double *)(v402 + v392 + 40) - v397))
                     * 0.5
                     + v398
                     + v401
                     * 0.3
                     * (v9 - v401)
                     * ((*v403 - v405) * (*(double *)(v404 + 40) - *(double *)(v402 + v392 + 40))
                      - (*(double *)(v404 + 32) - v405) * (v403[1] - *(double *)(v402 + v392 + 40)))
                     * 0.5;
              }
              *(double *)&v394[v393] = v398;
              v392 += 48;
              ++v393;
            }
            while (v335 != v399);
            unsigned int v406 = -1;
            _DWORD *v337 = -1;
            void *v558 = 0;
            _DWORD *v338 = 0;
            unint64_t v407 = 1;
            double v408 = -4.0;
            while (1)
            {
              uint64_t v409 = v407;
              v337[v409] = v407 - 1;
              v558[v407] = v558[v407 - 1];
              v338[v409] = v338[v407 - 1] + 1;
              if (v407 >= 2)
              {
                uint64_t v410 = v406;
                v411 = (double *)&v551[64 * v407];
                LODWORD(v412) = v407 == v335 ? 0 : v407;
                unint64_t v412 = (uint64_t)v407 >= (int)v335 ? v412 : v407;
                while (2)
                {
                  if (v410 != v412)
                  {
                    uint64_t v413 = *(int *)(v334 + 56);
                    uint64_t v414 = v410 + 1;
                    int v415 = v410 + 1;
                    if (v410 + 1 >= v413) {
                      int v415 = (int)v414 % (int)v413;
                    }
                    int v416 = v340[v415];
                    if (v416)
                    {
                      v417 = *(double **)(v334 + 88);
                      v418 = &v417[2 * v410];
                      v419 = &v417[2 * v415];
                      double v420 = v418[1];
                      double v421 = v419[1];
                      double v422 = sqrt((v420 - v421) * (v420 - v421) + (*v418 - *v419) * (*v418 - *v419));
                      double v423 = *v419 - *v418;
                      double v424 = v421 - v420;
                      while (v415 != v412)
                      {
                        int v425 = v415 + 1;
                        int v426 = v413 + ~((-2 - v415) % (int)v413);
                        if (v415 > -2) {
                          int v426 = v415 + 1;
                        }
                        if (v425 >= (int)v413) {
                          int v427 = v425 % (int)v413;
                        }
                        else {
                          int v427 = v426;
                        }
                        int v428 = v415 + 2;
                        if (v415 <= -3) {
                          int v429 = v413 + ~((-3 - v415) % (int)v413);
                        }
                        else {
                          int v429 = v415 + 2;
                        }
                        if (v428 >= (int)v413) {
                          int v429 = v428 % (int)v413;
                        }
                        if (v340[v427] == v416)
                        {
                          v430 = &v417[2 * v427];
                          v431 = &v417[2 * v429];
                          double v432 = v430[1];
                          double v433 = *v431;
                          double v434 = v431[1];
                          double v435 = *v431 - *v430;
                          double v436 = v423 * (v434 - v432) - v435 * v424;
                          if (v436 >= 0.0) {
                            int v437 = 0;
                          }
                          else {
                            int v437 = -1;
                          }
                          if (v436 > 0.0) {
                            int v437 = 1;
                          }
                          if (v437 == v416)
                          {
                            int v415 = v427;
                            if (v424 * (v434 - v432) + v423 * v435 >= v422
                                                                     * sqrt((v432 - v434) * (v432 - v434)+ (*v430 - v433) * (*v430 - v433))* -0.999847695)continue;
                          }
                        }
                        goto LABEL_448;
                      }
                      int v438 = (int)v413 <= (int)v410 ? (int)v410 % (int)v413 : v410;
                      int v439 = v414 >= v413 ? (int)v414 % (int)v413 : v410 + 1;
                      if ((int)v413 <= (int)v412)
                      {
                        unint64_t v440 = (int)v412 % (int)v413;
                        double v441 = -0.5;
                      }
                      else
                      {
                        unint64_t v440 = v412;
                        double v441 = -0.5;
                        if ((v412 & 0x80000000) != 0) {
                          unint64_t v440 = (int)v413 + ~(~v412 % (int)v413);
                        }
                      }
                      uint64_t v442 = *(void *)(v334 + 72);
                      double v443 = v548[(int)v412]
                           - v548[v410]
                           + ((*(double *)(v442 + 48 * v410 + 32) - *v417)
                            * (*(double *)(v442 + 48 * (int)v412 + 40) - v417[1])
                            - (*(double *)(v442 + 48 * (int)v412 + 32) - *v417)
                            * (*(double *)(v442 + 48 * v410 + 40) - v417[1]))
                           * v441;
                      if ((int)v412 <= (int)v410) {
                        double v443 = v443 + v548[v413];
                      }
                      uint64_t v444 = v442 + 48 * v438;
                      double v445 = *(double *)(v444 + 32);
                      double v446 = *(double *)(v444 + 40);
                      v447 = &v417[2 * v439];
                      double v448 = *v447;
                      double v449 = v447[1];
                      v450 = &v417[2 * v440];
                      double v451 = *v450;
                      double v452 = v450[1];
                      uint64_t v453 = v442 + 48 * v440;
                      double v454 = *(double *)(v453 + 32);
                      double v455 = *(double *)(v453 + 40);
                      double v456 = v449 - v446;
                      double v457 = (v448 - v445) * (v452 - v446) - (v451 - v445) * (v449 - v446);
                      double v458 = (v448 - v445) * (v455 - v446) - (v454 - v445) * v456;
                      if (v458 != v457)
                      {
                        double v549 = ((v452 - v446) * -(v454 - v445) + (v451 - v445) * (v455 - v446))
                             / ((v452 - v446) * -(v454 - v445)
                              + (v451 - v445) * (v455 - v446)
                              - (v457
                               + (v452 - v446) * -(v454 - v445)
                               + (v451 - v445) * (v455 - v446)
                               - v458));
                        double v459 = v458 * v549 * 0.5;
                        if (v459 != 0.0)
                        {
                          double v460 = v458 / (v458 - v457);
                          double v461 = 2.0 - sqrt(v443 / v459 / -0.3 + 4.0);
                          double v462 = v445 + v549 * v461 * (v448 - v445);
                          double v463 = v446 + v549 * v461 * v456;
                          double v543 = v461;
                          double v544 = v460;
                          double v464 = v454 + v460 * v461 * (v451 - v454);
                          double v465 = v455 + v460 * v461 * (v452 - v455);
                          if (v414 >= v413) {
                            LODWORD(v414) = (int)v414 % (int)v413;
                          }
                          double v553 = v463 - v446;
                          double v555 = v462 - v445;
                          double v466 = v464 - v462;
                          double v467 = v465 - v463;
                          double v468 = v454 - v464;
                          double v469 = v455 - v465;
                          double v470 = 0.0;
                          if (v414 == v412)
                          {
LABEL_498:
                            double v471 = v470;
                            int v472 = v410;
                            do
                            {
                              int v473 = v472 + 1;
                              int v474 = v413 + ~((-2 - v472) % (int)v413);
                              if (v472 > -2) {
                                int v474 = v472 + 1;
                              }
                              int v475 = v473 % (int)v413;
                              BOOL v58 = v473 < (int)v413;
                              uint64_t v476 = v442 + 48 * v472;
                              if (v58) {
                                int v472 = v474;
                              }
                              else {
                                int v472 = v475;
                              }
                              uint64_t v477 = v442 + 48 * v472;
                              double v478 = *(double *)(v476 + 32);
                              double v479 = *(double *)(v476 + 40);
                              double v481 = *(double *)(v477 + 32);
                              double v480 = *(double *)(v477 + 40);
                              double v482 = v481 - v478;
                              double v483 = v480 - v479;
                              double v484 = v555 * (v480 - v479) - (v481 - v478) * v553;
                              double v485 = v466 * (v480 - v479) - (v481 - v478) * v467;
                              double v486 = v468 * (v480 - v479) - (v481 - v478) * v469 + v484 + v485 * -2.0;
                              if (v486 == 0.0) {
                                goto LABEL_448;
                              }
                              double v487 = v485 + v485 + v484 * -2.0;
                              double v488 = v484 * (v486 * v408) + v487 * v487;
                              if (v488 < 0.0) {
                                goto LABEL_448;
                              }
                              double v489 = sqrt(v488);
                              double v490 = v486 + v486;
                              double v491 = (v489 - v487) / v490;
                              if (v491 < 0.0 || v491 > 1.0)
                              {
                                double v491 = (-v487 - v489) / v490;
                                if (v491 < 0.0 || v491 > 1.0) {
                                  goto LABEL_448;
                                }
                              }
                              if (v491 < -0.5) {
                                goto LABEL_448;
                              }
                              double v494 = sqrt((v479 - v480) * (v479 - v480) + (v478 - v481) * (v478 - v481));
                              if (v494 == 0.0) {
                                goto LABEL_448;
                              }
                              double v495 = 1.0 - v491;
                              double v496 = (v482
                                    * (v463 * (v491 * (v495 * v495) * 3.0)
                                     + v495 * (v495 * v495) * v446
                                     + v491 * v491 * (1.0 - v491) * 3.0 * v465
                                     + v491 * (v491 * v491) * v455
                                     - v479)
                                    - (v462 * (v491 * (v495 * v495) * 3.0)
                                     + v495 * (v495 * v495) * v445
                                     + v491 * v491 * (1.0 - v491) * 3.0 * v464
                                     + v491 * (v491 * v491) * v454
                                     - v478)
                                    * v483)
                                   / v494;
                              double v497 = (v482 * (v417[2 * v472 + 1] - v479) - (v417[2 * v472] - v478) * v483)
                                   / v494
                                   * (*(double *)(*(void *)(v334 + 96) + 8 * v472)
                                    * 0.75);
                              double v498 = -v497;
                              if (v497 >= 0.0) {
                                double v499 = v496;
                              }
                              else {
                                double v499 = -v496;
                              }
                              if (v497 >= 0.0) {
                                double v498 = v497;
                              }
                              if (v499 < v498 - v552) {
                                goto LABEL_448;
                              }
                              if (v499 < v498)
                              {
                                double v470 = v471 + (v499 - v498) * (v499 - v498);
                                double v471 = v470;
                              }
                            }
                            while (v472 != v412);
                            int v500 = v338[v407];
                            int v501 = v338[v410] + 1;
                            if (v500 > v501)
                            {
                              double v502 = v470 + *(double *)&v558[v410];
                              goto LABEL_528;
                            }
                            if (v500 == v501)
                            {
                              double v502 = v470 + *(double *)&v558[v410];
                              if (*(double *)&v558[v407] > v502)
                              {
LABEL_528:
                                v337[v407] = v410;
                                *(double *)&v558[v407] = v502;
                                v338[v407] = v338[v410] + 1;
                                double *v411 = v470;
                                v411[1] = v462;
                                v411[2] = v463;
                                v411[3] = v464;
                                v411[4] = v465;
                                v411[5] = v549;
                                v411[6] = v544;
                                v411[7] = v543;
                              }
                            }
                            BOOL v58 = (int)v410-- <= 0;
                            if (v58) {
                              break;
                            }
                            continue;
                          }
                          while (1)
                          {
                            int v503 = v414 + 1;
                            int v504 = v413 + ~((-2 - (int)v414) % (int)v413);
                            if ((int)v414 > -2) {
                              int v504 = v414 + 1;
                            }
                            int v505 = v503 % (int)v413;
                            BOOL v58 = v503 < (int)v413;
                            v506 = &v417[2 * (int)v414];
                            LODWORD(v414) = v58 ? v504 : v505;
                            v507 = &v417[2 * (int)v414];
                            double v508 = *v506;
                            double v509 = v506[1];
                            double v510 = *v507;
                            double v511 = v507[1];
                            double v512 = *v507 - *v506;
                            double v513 = v511 - v509;
                            double v514 = v555 * (v511 - v509) - v512 * v553;
                            double v515 = v466 * (v511 - v509) - v512 * v467;
                            double v516 = v468 * (v511 - v509) - v512 * v469 + v514 + v515 * -2.0;
                            if (v516 == 0.0) {
                              break;
                            }
                            double v517 = v515 + v515 + v514 * -2.0;
                            double v518 = v514 * (v516 * v408) + v517 * v517;
                            if (v518 < 0.0) {
                              break;
                            }
                            double v519 = sqrt(v518);
                            double v520 = v516 + v516;
                            double v521 = (v519 - v517) / (v516 + v516);
                            if (v521 < 0.0 || v521 > 1.0)
                            {
                              double v521 = (-v517 - v519) / v520;
                              if (v521 < 0.0 || v521 > 1.0) {
                                break;
                              }
                            }
                            if (v521 < -0.5) {
                              break;
                            }
                            double v524 = v508 - v510;
                            double v525 = v509 - v511;
                            double v526 = sqrt(v525 * v525 + v524 * v524);
                            if (v526 == 0.0) {
                              break;
                            }
                            double v527 = 1.0 - v521;
                            double v528 = v527 * (v527 * v527);
                            double v529 = v521 * (v527 * v527) * 3.0;
                            double v530 = v521 * v521 * (1.0 - v521) * 3.0;
                            double v531 = v521 * (v521 * v521);
                            double v532 = v462 * v529 + v528 * v445 + v530 * v464 + v531 * v454;
                            double v533 = v463 * v529 + v528 * v446;
                            double v408 = -4.0;
                            double v534 = v533 + v530 * v465 + v531 * v455;
                            double v535 = v532 - v508;
                            double v536 = v534 - v509;
                            double v537 = (v512 * v536 - (v532 - v508) * v513) / v526;
                            if (fabs(v537) > v552
                              || v513 * v536 + v512 * v535 < 0.0
                              || v525 * (v534 - v511) + v524 * (v532 - v510) < 0.0)
                            {
                              break;
                            }
                            double v470 = v470 + v537 * v537;
                            if (v414 == v412) {
                              goto LABEL_498;
                            }
                          }
                        }
                      }
                    }
                  }
                  break;
                }
              }
LABEL_448:
              ++v407;
              ++v406;
              if (v407 == v336) {
                goto LABEL_374;
              }
            }
          }
          void *v341 = 0;
          _DWORD *v337 = -1;
          void *v558 = 0;
          _DWORD *v338 = 0;
LABEL_374:
          int v347 = v338[(int)v335];
          if (!sub_2376DB6E4(v334 + 120, v347))
          {
            v348 = (double *)malloc_type_calloc(v347, 8uLL, 0x100004000313F17uLL);
            if (!v348) {
              goto LABEL_576;
            }
            v349 = (double *)malloc_type_calloc(v347, 8uLL, 0x100004000313F17uLL);
            if (!v349) {
              goto LABEL_576;
            }
            v350 = v349;
            double v9 = 4.0;
            double v10 = -0.5;
            double v11 = 1.0;
            if (v347 < 1) {
              goto LABEL_410;
            }
            uint64_t v351 = v347 + 1;
            LODWORD(v352) = v335;
            while (2)
            {
              while (1)
              {
                unsigned int v361 = v351 - 2;
                uint64_t v362 = (int)v352;
                if (v337[(int)v352] == v352 - 1) {
                  break;
                }
                uint64_t v370 = (v351 - 2);
                *(_DWORD *)(*(void *)(v334 + 128) + 4 * v361) = 1;
                uint64_t v371 = 48 * v370;
                v372 = &v551[64 * (uint64_t)(int)v352];
                *(_OWORD *)(*(void *)(v334 + 136) + v371) = *(_OWORD *)(v372 + 8);
                *(_OWORD *)(*(void *)(v334 + 136) + v371 + 16) = *(_OWORD *)(v372 + 24);
                if ((int)v352 < (int)v335)
                {
                  int v353 = v335 + ~(~v352 % (int)v335);
                  if ((int)v352 >= 0) {
                    int v353 = v352;
                  }
                }
                else
                {
                  int v353 = (int)v352 % (int)v335;
                }
                *(_OWORD *)(*(void *)(v334 + 136) + v371 + 32) = *(_OWORD *)(*(void *)(v334 + 72) + 48 * v353 + 32);
                v354 = (double *)&v551[64 * (uint64_t)(int)v352];
                uint64_t v355 = (int)v352 % (int)v335;
                uint64_t v356 = (int)v335 + ~(~v352 % (int)v335);
                uint64_t v357 = v352;
                if ((int)v352 >= 0) {
                  uint64_t v356 = (int)v352;
                }
                else {
                  uint64_t v357 = (int)v335 + ~(~v352 % (int)v335);
                }
                BOOL v358 = (int)v352 < (int)v335;
                if ((int)v352 < (int)v335) {
                  uint64_t v352 = v357;
                }
                else {
                  uint64_t v352 = (int)v352 % (int)v335;
                }
                if (v358) {
                  uint64_t v355 = v356;
                }
                float64x2_t v359 = *(float64x2_t *)(*(void *)(v334 + 72) + 48 * v352 + 32);
                *(float64x2_t *)(*(void *)(v334 + 152) + 16 * v370) = vmlaq_n_f64(v359, vsubq_f64(*(float64x2_t *)(*(void *)(v334 + 88)+ 16 * v355), v359), v354[6]);
                uint64_t v360 = v370;
                *(double *)(*(void *)(v334 + 160) + v360 * 8) = v354[7];
                *(double *)(*(void *)(v334 + 168) + v360 * 8) = v354[7];
                v348[v360] = v354[6];
                v350[v360] = v354[5];
                LODWORD(v352) = v337[v362];
                if ((unint64_t)--v351 <= 1)
                {
LABEL_403:
                  uint64_t v378 = 0;
                  uint64_t v379 = *(void *)(v334 + 176);
                  do
                  {
                    uint64_t v380 = v378 + 1;
                    if (v347 - 1 == v378) {
                      int v381 = 0;
                    }
                    else {
                      int v381 = v378 + 1;
                    }
                    if (v380 < v347) {
                      int v381 = v378 + 1;
                    }
                    *(double *)(v379 + 8 * v378) = v348[v378] / (v348[v378] + v350[v381]);
                    ++v378;
                  }
                  while (v347 != v380);
LABEL_410:
                  *(_DWORD *)(v334 + 144) = 1;
                  free(v337);
                  free(v558);
                  free(v338);
                  free(v551);
                  free(v348);
                  free(v350);
                  free(v340);
                  free(v548);
                  uint64_t v286 = v550;
                  uint64_t v382 = *(void *)(v550 + 56);
                  int v3 = a3;
                  *(void *)(v382 + 184) = v382 + 120;
                  sub_2376DB834(v382 + 120, v550 + 8);
                  v346 = *(void (**)(void, double))a3;
                  if (*(void *)a3)
                  {
LABEL_411:
                    double v546 = v546 + (double)**(int **)(v286 + 56);
                    double v383 = v3[3] * (v546 / v6) + v3[2] * (v11 - v546 / v6);
                    if (v546 / v6 == v11 || v383 >= v3[6] + v3[4])
                    {
                      v346(*((void *)v3 + 1), v383);
                      v3[6] = v383;
                    }
                  }
LABEL_414:
                  uint64_t v4 = *(void *)(v286 + 32);
                  if (!v4)
                  {
                    int v5 = *(void (**)(void, double))v3;
                    goto LABEL_572;
                  }
                  goto LABEL_9;
                }
              }
              uint64_t v363 = *(void *)(v334 + 64);
              if ((int)v352 >= (int)v335)
              {
                uint64_t v369 = (int)v352 % (int)v335;
                *(_DWORD *)(*(void *)(v334 + 128) + 4 * v361) = *(_DWORD *)(v363 + 4 * v369);
                uint64_t v366 = (v351 - 2);
                uint64_t v373 = 48 * v366;
                uint64_t v374 = 48 * v369;
                *(_OWORD *)(*(void *)(v334 + 136) + v373) = *(_OWORD *)(*(void *)(v334 + 72) + 48 * v369);
                *(_OWORD *)(*(void *)(v334 + 136) + v373 + 16) = *(_OWORD *)(*(void *)(v334 + 72) + 48 * v369 + 16);
                uint64_t v375 = *(void *)(v334 + 136) + 48 * v366;
              }
              else
              {
                uint64_t v364 = (int)v352;
                if ((v352 & 0x80000000) != 0) {
                  uint64_t v364 = (int)v335 + ~(~v352 % (int)v335);
                }
                int v365 = *(_DWORD *)(v363 + 4 * v364);
                uint64_t v366 = (v351 - 2);
                *(_DWORD *)(*(void *)(v334 + 128) + 4 * v361) = v365;
                v367 = (_OWORD *)(*(void *)(v334 + 136) + 48 * v361);
                uint64_t v368 = *(void *)(v334 + 72);
                if ((v352 & 0x80000000) == 0)
                {
                  _OWORD *v367 = *(_OWORD *)(v368 + 48 * (int)v352);
                  *(_OWORD *)(*(void *)(v334 + 136) + 48 * v366 + 16) = *(_OWORD *)(*(void *)(v334 + 72)
                                                                                    + 48 * (int)v352
                                                                                    + 16);
                  uint64_t v369 = v352;
                  *(_OWORD *)(*(void *)(v334 + 136) + 48 * v366 + 32) = *(_OWORD *)(*(void *)(v334 + 72)
                                                                                    + 48 * v352
                                                                                    + 32);
                  uint64_t v352 = (int)v352;
                  goto LABEL_402;
                }
                uint64_t v369 = (int)v335 + ~(~v352 % (int)v335);
                uint64_t v374 = 48 * v369;
                _OWORD *v367 = *(_OWORD *)(v368 + 48 * v369);
                *(_OWORD *)(*(void *)(v334 + 136) + 48 * v366 + 16) = *(_OWORD *)(*(void *)(v334 + 72)
                                                                                  + 48 * v369
                                                                                  + 16);
                uint64_t v375 = *(void *)(v334 + 136) + 48 * v366;
              }
              *(_OWORD *)(v375 + 32) = *(_OWORD *)(*(void *)(v334 + 72) + v374 + 32);
              uint64_t v352 = v369;
LABEL_402:
              *(_OWORD *)(*(void *)(v334 + 152) + 16 * v366) = *(_OWORD *)(*(void *)(v334 + 88) + 16 * v369);
              uint64_t v376 = 8 * v369;
              uint64_t v377 = 8 * v366;
              *(void *)(*(void *)(v334 + 160) + v377) = *(void *)(*(void *)(v334 + 96) + v376);
              *(void *)(*(void *)(v334 + 168) + v377) = *(void *)(*(void *)(v334 + 104) + v376);
              *(void *)(*(void *)(v334 + 176) + v377) = *(void *)(*(void *)(v334 + 112) + 8 * v352);
              v350[(unint64_t)v377 / 8] = 1.0;
              v348[(unint64_t)v377 / 8] = 1.0;
              LODWORD(v352) = v337[v362];
              if ((unint64_t)--v351 <= 1) {
                goto LABEL_403;
              }
              continue;
            }
          }
          v348 = 0;
LABEL_576:
          v539 = v551;
          v540 = v548;
        }
        else
        {
          v348 = 0;
          v540 = 0;
          v539 = v551;
        }
      }
      else
      {
        v558 = 0;
        v338 = 0;
LABEL_565:
        v539 = 0;
        v348 = 0;
        v340 = 0;
        v540 = 0;
      }
      free(v337);
      free(v558);
      free(v338);
      free(v539);
      free(v348);
      free(v340);
      v538 = v540;
    }
    else
    {
      uint64_t v33 = 0;
LABEL_568:
      v169 = v557;
LABEL_569:
      free(v169);
LABEL_570:
      free(v31);
      v538 = v33;
    }
  }
  else
  {
    int v104 = 0;
LABEL_559:
    int v105 = 0;
LABEL_560:
    int v106 = 0;
LABEL_561:
    int v107 = 0;
LABEL_562:
    float v109 = 0;
LABEL_563:
    free(v103);
    free(v104);
    free(v105);
    free(v106);
    free(v107);
    v538 = v109;
  }
  free(v538);
  return 1;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CARenderServerRenderLayerWithTransform()
{
  return MEMORY[0x270EFB8C8]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A20](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x270EE5A28](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x270EE5A30](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5A40](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateLab(const CGFloat *whitePoint, const CGFloat *blackPoint, const CGFloat *range)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C88](whitePoint, blackPoint, range);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB8](plist);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x270EE5D98]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x270EE5DB0]();
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

CGRect CGContextConvertRectToDeviceSpace(CGContextRef c, CGRect rect)
{
  MEMORY[0x270EE5E88](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGRect CGContextConvertRectToUserSpace(CGContextRef c, CGRect rect)
{
  MEMORY[0x270EE5E90](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGSize CGContextConvertSizeToDeviceSpace(CGContextRef c, CGSize size)
{
  MEMORY[0x270EE5E98](c, (__n128)size, *(__n128 *)&size.height);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

CGSize CGContextConvertSizeToUserSpace(CGContextRef c, CGSize size)
{
  MEMORY[0x270EE5EA0](c, (__n128)size, *(__n128 *)&size.height);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextEOFillPath(CGContextRef c)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x270EE5FC0](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE5FC8](c);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

uint64_t CGContextGetType()
{
  return MEMORY[0x270EE6038]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetFlatness(CGContextRef c, CGFloat flatness)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x270EE6298](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x270EE6858]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x270EE6910]();
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x270EE6958]();
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B90](provider);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6BF8](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

CGPDFDocumentRef CGPDFDocumentRetain(CGPDFDocumentRef document)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6C68](document);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x270EE6FD0](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE6FD8](path);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x270EE6FF0](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x270EE7038](path);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  MEMORY[0x270EE7078](path);
  result.CGFloat y = v2;
  result.CGFloat x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x270EE70C8](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x270EE7340]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x270EE7350](dict, size);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x270EF4540](allocator, *(void *)&options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x270EF4550](manager, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x270EE5598](typePtr, sizep, alignp);
}

NSRect NSIntegralRectWithOptions(NSRect aRect, NSAlignmentOptions opts)
{
  MEMORY[0x270EF2AE8](opts, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x270F06310]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x270ED7DE8](a1);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_vlim(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vthres(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vthrsc(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x270EDEF28](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF090](src, dest, *(void *)&flags, maxFloat, minFloat);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x270F9BFE0](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C3D8](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x270F9C458](doc);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x270F9C538](ctxt, prefix, ns_uri);
}