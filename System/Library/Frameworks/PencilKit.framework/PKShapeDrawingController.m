@interface PKShapeDrawingController
+ (CGMutablePathRef)_createNormalizedPathFromPath:(uint64_t)a1;
+ (uint64_t)hasSnapToShapeEntitlement;
- (double)_arrowRadiusForStroke:(void *)a1 inputScale:(double)a2;
- (double)aspectRatioAdjustedSizeFromResult:(void *)a1;
- (id).cxx_construct;
- (id)_arrowStrokesWithInputScale:(void *)a3 firstPt:(double)a4 secondPt:(double)a5 radius:(double)a6 averageInputPoint:(double)a7 sourceStroke:(double)a8;
- (id)_generateChatBubble:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateCloud:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateHeart:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateLine:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(uint64_t *)a5 averageInputPoint:(double)a6 shapeTypeOut:;
- (id)_generateManhattanLine:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateOutlineArrow:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateOval:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generatePentagon:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateRectangle:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateStar:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_generateTriangle:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:;
- (id)_strokeFromPoints:(uint64_t)a3 inputScale:(void *)a4 averageInputPoint:(double)a5 sourceStroke:;
- (id)detectedShapeWithInputScale:(void *)a3 averageInputPoint:(void *)a4 allowedShapeTypes:(double)a5 createCurrentStrokeBlock:;
- (id)shapeFromStroke:(_OWORD *)a3 inputScale:(void *)a4 averageInputPoint:(double)a5 allowedShapeTypes:;
- (uint64_t)_shapeTypeFromResultName:(uint64_t)a1;
- (uint64_t)hasMovementStopped;
- (uint64_t)isScratchOutActive;
- (void)_addAngles:(void *)a1;
- (void)_addCurrentStrokePoint:(CGFloat)a3;
- (void)_checkDetectedStroke;
- (void)addStrokePoint:(CGFloat)a3 inputPoint:(CGFloat)a4;
- (void)beginStrokeAtPoint:(CGFloat)a3;
- (void)initWithDelegate:(void *)a1;
- (void)resetStroke;
- (void)setDetectedShape:(uint64_t)a1;
@end

@implementation PKShapeDrawingController

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

- (void)initWithDelegate:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)PKShapeDrawingController;
    id v4 = objc_msgSendSuper2(&v30, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 25, v3);
      v5 = (unsigned char *)a1[9];
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[11] - (void)v5) >> 3) <= 9)
      {
        v6 = (unsigned char *)a1[10];
        v7 = (char *)operator new(0xF0uLL);
        v8 = &v7[24 * ((v6 - v5) / 24)];
        v9 = v8;
        if (v6 != v5)
        {
          v10 = &v7[24 * ((v6 - v5) / 24)];
          do
          {
            long long v11 = *(_OWORD *)(v6 - 24);
            v9 = v10 - 24;
            *((void *)v10 - 1) = *((void *)v6 - 1);
            *(_OWORD *)(v10 - 24) = v11;
            v6 -= 24;
            v10 -= 24;
          }
          while (v6 != v5);
        }
        a1[9] = v9;
        a1[10] = v8;
        a1[11] = v7 + 240;
        if (v5) {
          operator delete(v5);
        }
      }
      a1[20] = 0x3FC999999999999ALL;
      v12 = objc_alloc_init(PKAveragePointGenerator);
      v13 = (void *)a1[15];
      a1[15] = v12;

      uint64_t v14 = objc_opt_class();
      v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v16 = [v15 objectForKey:@"internalSettings.shapeRecognition.minimumDelay"];
      v17 = PKDynamicCast(v14, v16);

      if (v17)
      {
        [v17 doubleValue];
        a1[20] = v18;
      }
      a1[21] = 0x3FE6666666666666;
      uint64_t v19 = objc_opt_class();
      v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v21 = [v20 objectForKey:@"internalSettings.shapeRecognition.maximumDelay"];
      v22 = PKDynamicCast(v19, v21);

      if (v22)
      {
        [v22 doubleValue];
        a1[21] = v23;
      }
      a1[22] = 0x3FE0000000000000;
      uint64_t v24 = objc_opt_class();
      v25 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v26 = [v25 objectForKey:@"internalSettings.shapeRecognition.maximumFastDelay"];
      v27 = PKDynamicCast(v24, v26);

      if (v27)
      {
        [v27 doubleValue];
        a1[22] = v28;
      }
    }
  }

  return a1;
}

- (uint64_t)isScratchOutActive
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 200));
  char v2 = objc_opt_respondsToSelector();

  return v2 & 1;
}

+ (CGMutablePathRef)_createNormalizedPathFromPath:(uint64_t)a1
{
  self;
  CGRect BoundingBox = CGPathGetBoundingBox(a2);
  double width = BoundingBox.size.width;
  double height = BoundingBox.size.height;
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeTranslation(&t1, -BoundingBox.origin.x, -BoundingBox.origin.y);
  CGAffineTransformMakeScale(&v6, 1.0 / width, 1.0 / height);
  CGAffineTransformConcat(&transform, &t1, &v6);
  return CGPathCreateMutableCopyByTransformingPath(a2, &transform);
}

void __48__PKShapeDrawingController__normalizedHeartPath__block_invoke()
{
  v34[6] = *(CGFloat *)MEMORY[0x1E4F143B8];
  v0 = @"M 76.9531 23.4375 C 78.1738 23.4375 79.8828 22.6562 81.1035 21.875 C 116.016 -0.634766 138.77 -26.6113 138.77 -53.125 C 138.77 -74.9023 123.779 -90.4297 104.199 -90.4297 C 92.2363 -90.4297 82.4707 -83.6914 76.9531 -73.3398 C 71.4844 -83.6426 61.7188 -90.4297 49.707 -90.4297 C 30.127 -90.4297 15.1367 -74.9023 15.1367 -53.125 C 15.1367 -26.6113 37.8906 -0.634766 72.8516 21.875 C 74.0723 22.6562 75.7812 23.4375 76.9531 23.4375 Z";
  uint64_t v32 = self;
  Mutable = CGPathCreateMutable();
  char v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v3 = [@"M 76.9531 23.4375 C 78.1738 23.4375 79.8828 22.6562 81.1035 21.875 C 116.016 -0.634766 138.77 -26.6113 138.77 -53.125 C 138.77 -74.9023 123.779 -90.4297 104.199 -90.4297 C 92.2363 -90.4297 82.4707 -83.6914 76.9531 -73.3398 C 71.4844 -83.6426 61.7188 -90.4297 49.707 -90.4297 C 30.127 -90.4297 15.1367 -74.9023 15.1367 -53.125 C 15.1367 -26.6113 37.8906 -0.634766 72.8516 21.875 C 74.0723 22.6562 75.7812 23.4375 76.9531 23.4375 Z" componentsSeparatedByCharactersInSet:v2];

  uint64_t v4 = [v3 count];
  unint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = 0;
    unint64_t v7 = v4 - 2;
    unint64_t v33 = v4 - 6;
    while (1)
    {
      v8 = [v3 objectAtIndexedSubscript:v6];
      int v9 = [v8 isEqualToString:@"M"];
      unint64_t v10 = v6 + 1;
      int v11 = v6 + 1 < v7 ? v9 : 0;
      if (v11 == 1) {
        break;
      }
      int v18 = [v8 isEqualToString:@"L"];
      if (v10 < v7) {
        int v19 = v18;
      }
      else {
        int v19 = 0;
      }
      if (v19 == 1)
      {
        v20 = [v3 objectAtIndexedSubscript:v6 + 1];
        [v20 doubleValue];
        CGFloat v22 = v21;

        uint64_t v23 = [v3 objectAtIndexedSubscript:v6 + 2];
        [v23 doubleValue];
        CGFloat v25 = v24;

        CGPathAddLineToPoint(Mutable, 0, v22, v25);
        goto LABEL_13;
      }
      int v26 = [v8 isEqualToString:@"C"];
      if (v10 < v33) {
        int v27 = v26;
      }
      else {
        int v27 = 0;
      }
      if (v27 == 1)
      {
        for (uint64_t i = 0; i != 6; ++i)
        {
          v29 = [v3 objectAtIndexedSubscript:v10 + i];
          [v29 doubleValue];
          v34[i] = v30;
        }
        CGPathAddCurveToPoint(Mutable, 0, v34[0], v34[1], v34[2], v34[3], v34[4], v34[5]);
        v10 += 6;
      }
      else if ([v8 isEqualToString:@"Z"])
      {
        CGPathCloseSubpath(Mutable);

        goto LABEL_25;
      }
LABEL_14:

      unint64_t v6 = v10;
      if (v10 >= v5) {
        goto LABEL_25;
      }
    }
    v12 = [v3 objectAtIndexedSubscript:v6 + 1];
    [v12 doubleValue];
    CGFloat v14 = v13;

    v15 = [v3 objectAtIndexedSubscript:v6 + 2];
    [v15 doubleValue];
    CGFloat v17 = v16;

    CGPathMoveToPoint(Mutable, 0, v14, v17);
LABEL_13:
    unint64_t v10 = v6 + 3;
    goto LABEL_14;
  }
LABEL_25:
  CGMutablePathRef v31 = +[PKShapeDrawingController _createNormalizedPathFromPath:](v32, Mutable);
  CGPathRelease(Mutable);

  qword_1EB3C6258 = (uint64_t)v31;
}

- (double)_arrowRadiusForStroke:(void *)a1 inputScale:(double)a2
{
  id v3 = a1;
  uint64_t v4 = [v3 path];
  unint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      [v4 radiusAtIndex:v6];
      double v7 = v7 + v8;
      ++v6;
    }
    while (v5 != v6);
    double v9 = v7 / (double)v5 + 5.0;
  }
  else
  {
    double v9 = 10.0;
  }

  return v9 * a2;
}

void __48__PKShapeDrawingController_shapeRecognizerQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.pencilkit.shapeRecognizer", attr);
  char v2 = (void *)qword_1EB3C6268;
  qword_1EB3C6268 = (uint64_t)v1;
}

void __43__PKShapeDrawingController_shapeRecognizer__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F5C070]) initWithMode:3 locale:0];
  dispatch_queue_t v1 = [v0 characterSetForStrings:&unk_1F200F060];
  [v0 setActiveCharacterSet:v1];

  [v0 setMaxRecognitionResultCount:3];
  objc_msgSend(v0, "setMinimumDrawingSize:", 0.0, 0.0);
  char v2 = (void *)qword_1EB3C6278;
  qword_1EB3C6278 = (uint64_t)v0;
}

void __57__PKShapeDrawingController_recognitionResultsForDrawing___block_invoke(void *a1)
{
  if (a1[4])
  {
    if (qword_1EB3C6280 != -1) {
      dispatch_once(&qword_1EB3C6280, &__block_literal_global_24);
    }
    id v2 = (id)qword_1EB3C6278;
  }
  else
  {
    id v2 = 0;
  }
  id v6 = v2;
  uint64_t v3 = [v2 recognitionResultsForDrawing:a1[5] options:0];
  uint64_t v4 = *(void *)(a1[6] + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __49__PKShapeDrawingController__chDrawingFromStroke___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "addPoint:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (id)_arrowStrokesWithInputScale:(void *)a3 firstPt:(double)a4 secondPt:(double)a5 radius:(double)a6 averageInputPoint:(double)a7 sourceStroke:(double)a8
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  int v18 = (double *)operator new(0x10uLL);
  double v19 = 1.0 / sqrt((a8 - a6) * (a8 - a6) + (a7 - a5) * (a7 - a5));
  double v20 = (a7 - a5) * v19;
  double v21 = (a8 - a6) * v19;
  double v22 = a5 + (a9 + a9) * v20;
  double v23 = a6 + (a9 + a9) * v21;
  double v24 = v21 * a9;
  double v25 = -(v20 * a9);
  *int v18 = v24 + v22;
  v18[1] = v25 + v23;
  v52 = v18 + 2;
  v53 = v18 + 2;
  v51 = v18;
  int v27 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v53, 2uLL);
  uint64_t v28 = v51;
  v29 = v52;
  v27[2] = a5;
  CGFloat v30 = (char *)(v27 + 2);
  v27[3] = a6;
  CGMutablePathRef v31 = v27 + 4;
  if (v29 != v28)
  {
    do
    {
      *((_OWORD *)v30 - 1) = *((_OWORD *)v29 - 1);
      v30 -= 16;
      v29 -= 2;
    }
    while (v29 != v28);
    uint64_t v28 = v51;
  }
  v51 = (double *)v30;
  v52 = v27 + 4;
  v53 = &v27[2 * v26];
  if (v28) {
    operator delete(v28);
  }
  v52 = v31;
  v48 = 0;
  v49 = 0;
  uint64_t v50 = 0;
  PKPointsFromLineSegments((uint64_t *)&v51, &v48, a4 * 6.0);
  long long v32 = a2[5];
  v47[4] = a2[4];
  v47[5] = v32;
  long long v33 = a2[7];
  v47[6] = a2[6];
  v47[7] = v33;
  long long v34 = a2[1];
  v47[0] = *a2;
  v47[1] = v34;
  long long v35 = a2[3];
  v47[2] = a2[2];
  v47[3] = v35;
  v36 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v48, (uint64_t)v47, v17, a4);
  v37 = v51;
  double *v51 = v22 - v24;
  v37[1] = v23 - v25;
  std::vector<CGPoint>::resize((uint64_t)&v48, 0);
  PKPointsFromLineSegments((uint64_t *)&v51, &v48, a4 * 6.0);
  long long v38 = a2[5];
  v46[4] = a2[4];
  v46[5] = v38;
  long long v39 = a2[7];
  v46[6] = a2[6];
  v46[7] = v39;
  long long v40 = a2[1];
  v46[0] = *a2;
  v46[1] = v40;
  long long v41 = a2[3];
  v46[2] = a2[2];
  v46[3] = v41;
  uint64_t v42 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v48, (uint64_t)v46, v17, a4);
  v43 = (void *)v42;
  v44 = 0;
  if (v36 && v42)
  {
    v54[0] = v36;
    v54[1] = v42;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  }

  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }

  return v44;
}

- (id)_strokeFromPoints:(uint64_t)a3 inputScale:(void *)a4 averageInputPoint:(double)a5 sourceStroke:
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  unint64_t v10 = v9;
  if (a2[1] == *a2)
  {
    v45 = 0;
  }
  else
  {
    double v11 = *(double *)(a1 + 152);
    v12 = [v9 path];
    double v13 = (void *)[v12 count];

    if (v13)
    {
      CGFloat v14 = [v10 ink];
      double v13 = [v14 identifier];
      int v15 = [v13 isEqualToString:@"com.apple.ink.fountainpen"];

      LODWORD(v13) = v15 ^ 1;
    }
    double v16 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v71 = [v10 ink];
      id v17 = [v71 identifier];
      int v18 = [v10 ink];
      [v18 _weight];
      uint64_t v20 = v19;
      double v21 = [v10 ink];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = [v21 _weightIsUndefined];
      _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_INFO, "Generating shape with ink: %@, weight: %g, undefined: %d", buf, 0x1Cu);
    }
    double v22 = fmax(v11, 0.1);
    if (v13)
    {
      v72 = objc_alloc_init(PKAveragePointGenerator);
      -[PKAveragePointGenerator addStroke:]((uint64_t)v72, v10);
      memset(buf, 0, sizeof(buf));
      [(PKAveragePointGenerator *)(uint64_t)v72 currentStrokePoint];
      double v24 = *a2;
      double v23 = a2[1];
      unint64_t v25 = ((char *)v23 - (char *)*a2) >> 4;
      std::vector<PKCompressedStrokePoint>::vector(&v77, v25);
      [v10 timestamp];
      double v27 = v26;
      if (v23 != v24)
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        unint64_t v30 = 0;
        double v31 = v22 / (double)v25;
        if (v25 <= 1) {
          unint64_t v25 = 1;
        }
        do
        {
          v75.location = *(CGPoint *)&(*a2)[v28];
          v75.timestamp = v27 + v31 * (double)v30;
          *(_OWORD *)&v75.radius = *(_OWORD *)&buf[24];
          *(_OWORD *)&v75.edgeWidth = *(_OWORD *)&buf[40];
          *(_OWORD *)&v75.azimuth = *(_OWORD *)&buf[56];
          *(_OWORD *)&v75.opacity = *(_OWORD *)&buf[72];
          PKCompressStrokePoint((PKCompressedStrokePoint *)&v75, v27, (float32x2_t *)v76);
          long long v32 = &v77[v29];
          long long v33 = v76[1];
          *(_OWORD *)long long v32 = v76[0];
          *((_OWORD *)v32 + 1) = v33;
          ++v30;
          v29 += 32;
          v28 += 2;
        }
        while (v25 != v30);
      }
      long long v34 = [PKStrokePath alloc];
      v36 = v77;
      long long v35 = v78;
      uint64_t v37 = [v10 _inputType];
      long long v38 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v39 = (v35 - v36) >> 5;
      long long v40 = (PKStrokeGenerator *)v72;
      long long v41 = [(PKStrokePath *)v34 initWithPoints:v36 count:v39 immutableCount:v39 inputType:v37 timestamp:v38 UUID:v27];

      id v42 = objc_alloc((Class)objc_opt_class());
      v43 = [v10 ink];
      long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v74[0] = *MEMORY[0x1E4F1DAB8];
      v74[1] = v44;
      v74[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      v45 = (void *)[v42 initWithInk:v43 strokePath:v41 transform:v74 mask:0];

      if (v77)
      {
        v78 = v77;
        operator delete(v77);
      }
    }
    else
    {
      long long v40 = [[PKStrokeGenerator alloc] initWithStrokeNoiseSmoothing:0];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 200));
      char v47 = objc_opt_respondsToSelector();

      if (v47)
      {
        id v48 = objc_loadWeakRetained((id *)(a1 + 200));
        uint64_t v49 = [v48 shapeDrawingControllerMaximumSupportedContentVersion:a1];
      }
      else
      {
        uint64_t v49 = 3;
      }
      uint64_t v50 = [v10 ink];
      [(PKStrokeGenerator *)v40 setupForInk:v50 maximumSupportedContentVersion:v49];

      [(PKStrokeGenerator *)v40 setAdditionalRollAngle:0.0];
      *(void *)(a3 + 104) = 0;
      if (v10)
      {
        v51 = [v10 path];
        uint64_t v52 = [v51 count];
        if (v52)
        {
          uint64_t v53 = 0;
          long double v54 = 0.0;
          do
          {
            long double v55 = 0.0;
            memset(buf, 0, sizeof(buf));
            if (v51)
            {
              [v51 decompressedPointAt:v53];
              long double v55 = *(double *)&buf[56];
            }
            if (v53)
            {
              DKDMixAnglesInRadians(v54, v55, 1.0 / (double)(unint64_t)(v53 + 1));
              long double v55 = v56;
            }
            ++v53;
            long double v54 = v55;
          }
          while (v52 != v53);
        }
        else
        {
          long double v55 = 0.0;
        }
        *(long double *)(a3 + 24) = v55;
      }
      v57 = *a2;
      uint64_t v58 = (((char *)a2[1] - (char *)*a2) >> 4) - 1;
      if (((char *)a2[1] - (char *)*a2) >> 4 == 1)
      {
        double v62 = 0.0;
      }
      else
      {
        double v61 = *v57;
        double v60 = v57[1];
        v59 = v57 + 3;
        double v62 = 0.0;
        do
        {
          double v63 = *(v59 - 1);
          double v64 = *v59;
          double v62 = v62 + sqrt((v60 - *v59) * (v60 - *v59) + (v61 - v63) * (v61 - v63));
          v59 += 2;
          double v60 = v64;
          double v61 = v63;
          --v58;
        }
        while (v58);
      }
      *(double *)(a3 + 40) = v62 / (v22 * a5);
      long long v65 = *(_OWORD *)(a3 + 80);
      v73[4] = *(_OWORD *)(a3 + 64);
      v73[5] = v65;
      long long v66 = *(_OWORD *)(a3 + 112);
      v73[6] = *(_OWORD *)(a3 + 96);
      v73[7] = v66;
      long long v67 = *(_OWORD *)(a3 + 16);
      v73[0] = *(_OWORD *)a3;
      v73[1] = v67;
      long long v68 = *(_OWORD *)(a3 + 48);
      v73[2] = *(_OWORD *)(a3 + 32);
      v73[3] = v68;
      v45 = [(PKStrokeGenerator *)v40 strokeFromPoints:a2 sourceStroke:v10 inputScale:v73 averageInputPoint:a5];
    }

    v69 = [v10 _clipPlane];
    [v45 _setClipPlane:v69];
  }

  return v45;
}

- (id)_generateLine:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(uint64_t *)a5 averageInputPoint:(double)a6 shapeTypeOut:
{
  id v11 = a2;
  id v12 = a3;
  uint64_t v53 = 0;
  long double v54 = 0;
  uint64_t v55 = 0;
  [v11 startLocation];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v11 endLocation];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v21 = [MEMORY[0x1E4F1CA48] array];
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v14, v16);
  [v11 controlPoint];
  CGFloat v24 = v23;
  [v11 controlPoint];
  CGPathAddQuadCurveToPoint(Mutable, 0, v24, v25, v18, v20);
  PKPointsFromPath(Mutable, (const void **)&v53, a6 * 6.0, a6 * 0.1);
  CGPathRelease(Mutable);
  long long v26 = a4[5];
  v52[4] = a4[4];
  v52[5] = v26;
  long long v27 = a4[7];
  v52[6] = a4[6];
  v52[7] = v27;
  long long v28 = a4[1];
  v52[0] = *a4;
  v52[1] = v28;
  long long v29 = a4[3];
  v52[2] = a4[2];
  v52[3] = v29;
  unint64_t v30 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v53, (uint64_t)v52, v12, a6);
  if (v30) {
    [v21 addObject:v30];
  }
  if ([v11 startEndpointType] == 1)
  {
    double v31 = -[PKShapeDrawingController _arrowRadiusForStroke:inputScale:](v12, a6);
    [v11 controlPoint];
    double v33 = v32;
    long long v34 = a4[5];
    v51[4] = a4[4];
    v51[5] = v34;
    long long v35 = a4[7];
    v51[6] = a4[6];
    v51[7] = v35;
    long long v36 = a4[1];
    v51[0] = *a4;
    v51[1] = v36;
    long long v37 = a4[3];
    v51[2] = a4[2];
    v51[3] = v37;
    uint64_t v39 = -[PKShapeDrawingController _arrowStrokesWithInputScale:firstPt:secondPt:radius:averageInputPoint:sourceStroke:](a1, v51, v12, a6, v14, v16, v38, v33, v31);
    [v21 addObjectsFromArray:v39];

    uint64_t v40 = 5;
  }
  else
  {
    double v31 = 0.0;
    uint64_t v40 = 6;
  }
  if ([v11 endEndpointType] == 1)
  {
    if (v31 == 0.0) {
      double v31 = -[PKShapeDrawingController _arrowRadiusForStroke:inputScale:](v12, a6);
    }
    [v11 controlPoint];
    double v42 = v41;
    long long v43 = a4[5];
    v50[4] = a4[4];
    v50[5] = v43;
    long long v44 = a4[7];
    v50[6] = a4[6];
    v50[7] = v44;
    long long v45 = a4[1];
    v50[0] = *a4;
    v50[1] = v45;
    long long v46 = a4[3];
    v50[2] = a4[2];
    v50[3] = v46;
    id v48 = -[PKShapeDrawingController _arrowStrokesWithInputScale:firstPt:secondPt:radius:averageInputPoint:sourceStroke:](a1, v50, v12, a6, v18, v20, v47, v42, v31);
    [v21 addObjectsFromArray:v48];

    uint64_t v40 = 5;
  }
  if (a5) {
    *a5 = v40;
  }

  if (v53)
  {
    long double v54 = v53;
    operator delete(v53);
  }

  return v21;
}

- (double)aspectRatioAdjustedSizeFromResult:(void *)a1
{
  id v1 = a1;
  [v1 size];
  if (v2 <= 0.0 || v3 <= 0.0)
  {
    double v5 = *MEMORY[0x1E4F1DB30];
  }
  else
  {
    double v4 = 1.0;
    if (v2 / v3 >= 1.0)
    {
      double v4 = v2 / v3;
      if (v2 / v3 > 1.0) {
        double v4 = 1.0;
      }
    }
    double v5 = (v2 + v3) * 0.5 * v4;
  }

  return v5;
}

- (id)_generatePentagon:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  double v12 = -[PKShapeDrawingController aspectRatioAdjustedSizeFromResult:](v9);
  double v13 = 0;
  if (v12 > 0.0)
  {
    double v14 = v11;
    if (v11 > 0.0)
    {
      long long v68 = 0;
      v69 = 0;
      uint64_t v70 = 0;
      __p = 0;
      long long v66 = 0;
      long long v67 = 0;
      [v9 center];
      float64_t v58 = v16;
      float64_t v60 = v15;
      memset(&v64, 0, sizeof(v64));
      [v9 rotation];
      CGAffineTransformMakeRotation(&v64, v17 * 3.14159265 / 180.0);
      int v18 = 0;
      double v19 = v66;
      v20.f64[0] = v60;
      v20.f64[1] = v58;
      float64x2_t v61 = v20;
      double v21 = 2.19911486;
      do
      {
        __double2 v22 = __sincos_stret(v21);
        float64x2_t v23 = vaddq_f64(v61, vaddq_f64(*(float64x2_t *)&v64.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v64.c, v14 * v22.__sinval * 0.5), *(float64x2_t *)&v64.a, v12 * v22.__cosval * 0.5)));
        if (v19 >= v67)
        {
          float64x2_t v59 = v23;
          CGFloat v24 = (float64x2_t *)__p;
          uint64_t v25 = ((char *)v19 - (unsigned char *)__p) >> 4;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 60) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v27 = (char *)v67 - (unsigned char *)__p;
          if (((char *)v67 - (unsigned char *)__p) >> 3 > v26) {
            unint64_t v26 = v27 >> 3;
          }
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v26;
          }
          if (v28)
          {
            long long v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v67, v28);
            CGFloat v24 = (float64x2_t *)__p;
            double v19 = v66;
          }
          else
          {
            long long v29 = 0;
          }
          unint64_t v30 = (float64x2_t *)&v29[16 * v25];
          *unint64_t v30 = v59;
          double v31 = v30 + 1;
          if (v19 != v24)
          {
            do
            {
              v30[-1] = v19[-1];
              --v30;
              --v19;
            }
            while (v19 != v24);
            CGFloat v24 = (float64x2_t *)__p;
          }
          __p = v30;
          long long v66 = v31;
          long long v67 = (float64x2_t *)&v29[16 * v28];
          if (v24) {
            operator delete(v24);
          }
          double v19 = v31;
        }
        else
        {
          *v19++ = v23;
        }
        long long v66 = v19;
        double v21 = v21 + 1.25663706;
        ++v18;
      }
      while (v18 != 5);
      __asm { FMOV            V2.2D, #0.5 }
      float64x2_t v63 = vmlaq_f64(vmulq_f64(v19[-1], _Q2), _Q2, *(float64x2_t *)__p);
      std::vector<CGPoint>::insert((uint64_t)&__p, (char *)__p, (char *)&v63);
      long long v37 = v66;
      if (v66 >= v67)
      {
        uint64_t v39 = ((char *)v66 - (unsigned char *)__p) >> 4;
        unint64_t v40 = v39 + 1;
        if ((unint64_t)(v39 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v41 = (char *)v67 - (unsigned char *)__p;
        if (((char *)v67 - (unsigned char *)__p) >> 3 > v40) {
          unint64_t v40 = v41 >> 3;
        }
        if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v42 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v42 = v40;
        }
        if (v42) {
          long long v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v67, v42);
        }
        else {
          long long v43 = 0;
        }
        long long v44 = (float64x2_t *)&v43[16 * v39];
        long long v45 = &v43[16 * v42];
        float64x2_t *v44 = v63;
        double v38 = v44 + 1;
        double v47 = (float64x2_t *)__p;
        long long v46 = v66;
        if (v66 != __p)
        {
          do
          {
            v44[-1] = v46[-1];
            --v44;
            --v46;
          }
          while (v46 != v47);
          long long v46 = (float64x2_t *)__p;
        }
        __p = v44;
        long long v66 = v38;
        long long v67 = (float64x2_t *)v45;
        if (v46) {
          operator delete(v46);
        }
      }
      else
      {
        *long long v66 = v63;
        double v38 = v37 + 1;
      }
      long long v66 = v38;
      PKPointsFromLineSegments((uint64_t *)&__p, &v68, a5 * 6.0);
      if ([v10 _pathHasClockwisePointOrdering])
      {
        if (v68 != v69)
        {
          id v48 = v69 - 2;
          if (v69 - 2 > v68)
          {
            uint64_t v49 = v68 + 2;
            do
            {
              long long v50 = *((_OWORD *)v49 - 1);
              *((_OWORD *)v49 - 1) = *(_OWORD *)v48;
              *(_OWORD *)id v48 = v50;
              v48 -= 2;
              _CF = v49 >= v48;
              v49 += 2;
            }
            while (!_CF);
          }
        }
      }
      long long v51 = a4[5];
      v62[4] = a4[4];
      v62[5] = v51;
      long long v52 = a4[7];
      v62[6] = a4[6];
      v62[7] = v52;
      long long v53 = a4[1];
      v62[0] = *a4;
      v62[1] = v53;
      long long v54 = a4[3];
      v62[2] = a4[2];
      v62[3] = v54;
      uint64_t v55 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v68, (uint64_t)v62, v10, a5);
      double v56 = (void *)v55;
      if (v55)
      {
        v71[0] = v55;
        double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      }
      else
      {
        double v13 = 0;
      }

      if (__p)
      {
        long long v66 = (float64x2_t *)__p;
        operator delete(__p);
      }
      if (v68)
      {
        v69 = v68;
        operator delete(v68);
      }
    }
  }

  return v13;
}

- (id)_generateRectangle:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v96[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  v93 = 0;
  v94 = 0;
  uint64_t v95 = 0;
  __p = 0;
  unint64_t v92 = 0;
  [v8 lowerLeftPoint];
  double v11 = v10;
  double v13 = v12;
  [v8 lowerRightPoint];
  double v15 = v14;
  double v17 = v16;
  [v8 upperRightPoint];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  [v8 upperLeftPoint];
  uint64_t v86 = v22;
  uint64_t v24 = v23;
  double v25 = v11 + (v15 - v11) * 0.5;
  double v87 = v13 + (v17 - v13) * 0.5;
  uint64_t v26 = 1;
  uint64_t v27 = v92 - (void)__p;
  if ((unint64_t)((uint64_t)(v92 - (void)__p) >> 3) > 1) {
    uint64_t v26 = v27 >> 3;
  }
  if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v28 = v26;
  }
  if (v28) {
    long long v29 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v28);
  }
  else {
    long long v29 = 0;
  }
  unint64_t v30 = v29;
  unint64_t v31 = (unint64_t)&v29[2 * v28];
  *unint64_t v30 = v25;
  v30[1] = v87;
  double v32 = v30 + 2;
  __p = v30;
  unint64_t v92 = v31;
  v91 = v30 + 2;
  if ((unint64_t)(v30 + 2) >= v31)
  {
    long long v34 = (double *)__p;
    uint64_t v35 = ((char *)v32 - (unsigned char *)__p) >> 4;
    unint64_t v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 60) {
      goto LABEL_106;
    }
    uint64_t v37 = v31 - (void)__p;
    if (v37 >> 3 > v36) {
      unint64_t v36 = v37 >> 3;
    }
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v38 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v38 = v36;
    }
    if (v38)
    {
      uint64_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v38);
      long long v34 = (double *)__p;
      double v32 = v91;
    }
    else
    {
      uint64_t v39 = 0;
    }
    unint64_t v40 = (double *)&v39[16 * v35];
    unint64_t v31 = (unint64_t)&v39[16 * v38];
    *unint64_t v40 = v15;
    v40[1] = v17;
    double v33 = v40 + 2;
    if (v32 != v34)
    {
      do
      {
        *((_OWORD *)v40 - 1) = *((_OWORD *)v32 - 1);
        v40 -= 2;
        v32 -= 2;
      }
      while (v32 != v34);
      long long v34 = (double *)__p;
    }
    __p = v40;
    v91 = v33;
    unint64_t v92 = v31;
    if (v34)
    {
      operator delete(v34);
      unint64_t v31 = v92;
    }
  }
  else
  {
    *double v32 = v15;
    v30[3] = v17;
    double v33 = v30 + 4;
  }
  v91 = v33;
  if ((unint64_t)v33 >= v31)
  {
    unint64_t v42 = (double *)__p;
    uint64_t v43 = ((char *)v33 - (unsigned char *)__p) >> 4;
    unint64_t v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 60) {
      goto LABEL_106;
    }
    uint64_t v45 = v31 - (void)__p;
    if (v45 >> 3 > v44) {
      unint64_t v44 = v45 >> 3;
    }
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v46 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v46 = v44;
    }
    if (v46)
    {
      double v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v46);
      unint64_t v42 = (double *)__p;
      double v33 = v91;
    }
    else
    {
      double v47 = 0;
    }
    id v48 = &v47[16 * v43];
    unint64_t v31 = (unint64_t)&v47[16 * v46];
    *(void *)id v48 = v19;
    *((void *)v48 + 1) = v21;
    uint64_t v41 = (double *)(v48 + 16);
    if (v33 != v42)
    {
      do
      {
        *((_OWORD *)v48 - 1) = *((_OWORD *)v33 - 1);
        v48 -= 16;
        v33 -= 2;
      }
      while (v33 != v42);
      unint64_t v42 = (double *)__p;
    }
    __p = v48;
    v91 = v41;
    unint64_t v92 = v31;
    if (v42)
    {
      operator delete(v42);
      unint64_t v31 = v92;
    }
  }
  else
  {
    *(void *)double v33 = v19;
    *((void *)v33 + 1) = v21;
    uint64_t v41 = v33 + 2;
  }
  v91 = v41;
  if ((unint64_t)v41 >= v31)
  {
    long long v50 = (double *)__p;
    uint64_t v51 = ((char *)v41 - (unsigned char *)__p) >> 4;
    unint64_t v52 = v51 + 1;
    if ((unint64_t)(v51 + 1) >> 60) {
      goto LABEL_106;
    }
    uint64_t v53 = v31 - (void)__p;
    if (v53 >> 3 > v52) {
      unint64_t v52 = v53 >> 3;
    }
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v54 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v54 = v52;
    }
    if (v54)
    {
      uint64_t v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v54);
      long long v50 = (double *)__p;
      uint64_t v41 = v91;
    }
    else
    {
      uint64_t v55 = 0;
    }
    double v56 = &v55[16 * v51];
    unint64_t v31 = (unint64_t)&v55[16 * v54];
    *(void *)double v56 = v24;
    *((void *)v56 + 1) = v86;
    uint64_t v49 = (double *)(v56 + 16);
    if (v41 != v50)
    {
      do
      {
        *((_OWORD *)v56 - 1) = *((_OWORD *)v41 - 1);
        v56 -= 16;
        v41 -= 2;
      }
      while (v41 != v50);
      long long v50 = (double *)__p;
    }
    __p = v56;
    v91 = v49;
    unint64_t v92 = v31;
    if (v50)
    {
      operator delete(v50);
      unint64_t v31 = v92;
    }
  }
  else
  {
    *(void *)uint64_t v41 = v24;
    *((void *)v41 + 1) = v86;
    uint64_t v49 = v41 + 2;
  }
  v91 = v49;
  if ((unint64_t)v49 >= v31)
  {
    float64_t v58 = (double *)__p;
    uint64_t v59 = ((char *)v49 - (unsigned char *)__p) >> 4;
    unint64_t v60 = v59 + 1;
    if ((unint64_t)(v59 + 1) >> 60) {
      goto LABEL_106;
    }
    uint64_t v61 = v31 - (void)__p;
    if (v61 >> 3 > v60) {
      unint64_t v60 = v61 >> 3;
    }
    if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v62 = v60;
    }
    if (v62)
    {
      float64x2_t v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v62);
      float64_t v58 = (double *)__p;
      uint64_t v49 = v91;
    }
    else
    {
      float64x2_t v63 = 0;
    }
    CGAffineTransform v64 = (double *)&v63[16 * v59];
    unint64_t v31 = (unint64_t)&v63[16 * v62];
    *CGAffineTransform v64 = v11;
    v64[1] = v13;
    v57 = v64 + 2;
    if (v49 != v58)
    {
      do
      {
        *((_OWORD *)v64 - 1) = *((_OWORD *)v49 - 1);
        v64 -= 2;
        v49 -= 2;
      }
      while (v49 != v58);
      float64_t v58 = (double *)__p;
    }
    __p = v64;
    v91 = v57;
    unint64_t v92 = v31;
    if (v58)
    {
      operator delete(v58);
      unint64_t v31 = v92;
    }
  }
  else
  {
    double *v49 = v11;
    v49[1] = v13;
    v57 = v49 + 2;
  }
  v91 = v57;
  if ((unint64_t)v57 < v31)
  {
    double *v57 = v25;
    v57[1] = v87;
    long long v65 = v57 + 2;
    goto LABEL_90;
  }
  long long v66 = (double *)__p;
  uint64_t v67 = ((char *)v57 - (unsigned char *)__p) >> 4;
  unint64_t v68 = v67 + 1;
  if ((unint64_t)(v67 + 1) >> 60) {
LABEL_106:
  }
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  uint64_t v69 = v31 - (void)__p;
  if (v69 >> 3 > v68) {
    unint64_t v68 = v69 >> 3;
  }
  if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v70 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v70 = v68;
  }
  if (v70)
  {
    v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v70);
    long long v66 = (double *)__p;
    v57 = v91;
  }
  else
  {
    v71 = 0;
  }
  v72 = (double *)&v71[16 * v67];
  v73 = &v71[16 * v70];
  double *v72 = v25;
  v72[1] = v87;
  long long v65 = v72 + 2;
  if (v57 != v66)
  {
    do
    {
      *((_OWORD *)v72 - 1) = *((_OWORD *)v57 - 1);
      v72 -= 2;
      v57 -= 2;
    }
    while (v57 != v66);
    long long v66 = (double *)__p;
  }
  __p = v72;
  v91 = v65;
  unint64_t v92 = (unint64_t)v73;
  if (v66) {
    operator delete(v66);
  }
LABEL_90:
  v91 = v65;
  PKPointsFromLineSegments((uint64_t *)&__p, (double **)&v93, a5 * 6.0);
  if ([v9 _pathHasClockwisePointOrdering])
  {
    if (v93 != v94)
    {
      v74 = v94 - 16;
      if (v94 - 16 > v93)
      {
        _PKStrokePoint v75 = (char *)v93 + 16;
        do
        {
          long long v76 = *((_OWORD *)v75 - 1);
          *((_OWORD *)v75 - 1) = *(_OWORD *)v74;
          *(_OWORD *)v74 = v76;
          v74 -= 16;
          BOOL v77 = v75 >= v74;
          v75 += 16;
        }
        while (!v77);
      }
    }
  }
  long long v78 = a4[5];
  v89[4] = a4[4];
  v89[5] = v78;
  long long v79 = a4[7];
  v89[6] = a4[6];
  v89[7] = v79;
  long long v80 = a4[1];
  v89[0] = *a4;
  v89[1] = v80;
  long long v81 = a4[3];
  v89[2] = a4[2];
  v89[3] = v81;
  uint64_t v82 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, (double **)&v93, (uint64_t)v89, v9, a5);
  v83 = (void *)v82;
  if (v82)
  {
    v96[0] = v82;
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
  }
  else
  {
    v84 = 0;
  }

  if (__p)
  {
    v91 = (double *)__p;
    operator delete(__p);
  }
  if (v93)
  {
    v94 = (char *)v93;
    operator delete(v93);
  }

  return v84;
}

- (id)_generateOutlineArrow:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  [v9 size];
  double v13 = v12;
  double v14 = 0;
  if (v12 > 0.0)
  {
    double v15 = v11;
    if (v11 > 0.0)
    {
      id v48 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      [v9 rotation];
      double v17 = v16;
      [v9 center];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [v9 controlPoint];
      CGFloat x = v22;
      double v41 = v23;
      long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&m.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&m.c = v24;
      *(_OWORD *)&m.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(_OWORD *)&v46.a = *(_OWORD *)&m.a;
      *(_OWORD *)&v46.c = v24;
      *(_OWORD *)&v46.tCGFloat x = *(_OWORD *)&m.tx;
      CGAffineTransformTranslate(&m, &v46, v19, v21);
      CGAffineTransform v44 = m;
      CGAffineTransformRotate(&v45, &v44, v17 * -3.14159265 / 180.0);
      CGAffineTransform m = v45;
      CGAffineTransform v43 = v45;
      CGAffineTransformTranslate(&v45, &v43, -v19, -v21);
      CGAffineTransform m = v45;
      Mutable = CGPathCreateMutable();
      double v39 = a5;
      CGFloat v26 = v19 - v13 * 0.5;
      double v27 = v15 * 0.5;
      CGFloat v28 = v21 - v15 * 0.5;
      v53.origin.CGFloat x = v26;
      v53.origin.y = v28;
      v53.size.double width = v13;
      v53.size.double height = v15;
      CGFloat v29 = CGRectGetMaxY(v53) - v41;
      double v30 = v15 + v29 * -2.0;
      CGFloat v31 = v28 + v29 + v30 * 0.5;
      CGPathMoveToPoint(Mutable, &m, v26, v31);
      CGPathAddLineToPoint(Mutable, &m, v26, v30 * 0.5 + v31);
      CGPathAddLineToPoint(Mutable, &m, x, v41);
      CGPathAddLineToPoint(Mutable, &m, x, v41 - (v29 + v30));
      CGPathAddLineToPoint(Mutable, &m, v13 + v26, v27 + v28);
      CGPathAddLineToPoint(Mutable, &m, x, v41 + v29);
      CGPathAddLineToPoint(Mutable, &m, x, v41 - v30);
      CGPathAddLineToPoint(Mutable, &m, v26, v28 + v29);
      CGPathCloseSubpath(Mutable);
      PKPointsFromPath(Mutable, (const void **)&v48, v39 * 6.0, v39 * 0.1);
      CGPathRelease(Mutable);
      long long v32 = a4[5];
      v42[4] = a4[4];
      v42[5] = v32;
      long long v33 = a4[7];
      v42[6] = a4[6];
      v42[7] = v33;
      long long v34 = a4[1];
      v42[0] = *a4;
      v42[1] = v34;
      long long v35 = a4[3];
      v42[2] = a4[2];
      v42[3] = v35;
      uint64_t v36 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v48, (uint64_t)v42, v10, v39);
      uint64_t v37 = (void *)v36;
      if (v36)
      {
        v51[0] = v36;
        double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      }
      else
      {
        double v14 = 0;
      }

      if (v48)
      {
        uint64_t v49 = v48;
        operator delete(v48);
      }
    }
  }

  return v14;
}

- (id)_generateTriangle:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  long long v81 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  __p = 0;
  unint64_t v80 = 0;
  [v8 vertex1];
  double v11 = v10;
  double v13 = v12;
  [v8 vertex2];
  double v15 = v14;
  double v17 = v16;
  [v8 vertex3];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  double v22 = v11 + (v15 - v11) * 0.5;
  double v23 = v13 + (v17 - v13) * 0.5;
  uint64_t v24 = 1;
  uint64_t v25 = v80 - (void)__p;
  if ((unint64_t)((uint64_t)(v80 - (void)__p) >> 3) > 1) {
    uint64_t v24 = v25 >> 3;
  }
  if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v26 = v24;
  }
  if (v26) {
    double v27 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v26);
  }
  else {
    double v27 = 0;
  }
  CGFloat v28 = v27;
  unint64_t v29 = (unint64_t)&v27[2 * v26];
  *CGFloat v28 = v22;
  v28[1] = v23;
  double v30 = v28 + 2;
  __p = v28;
  unint64_t v80 = v29;
  long long v79 = v28 + 2;
  if ((unint64_t)(v28 + 2) >= v29)
  {
    long long v32 = (double *)__p;
    uint64_t v33 = ((char *)v30 - (unsigned char *)__p) >> 4;
    unint64_t v34 = v33 + 1;
    if ((unint64_t)(v33 + 1) >> 60) {
      goto LABEL_90;
    }
    uint64_t v35 = v29 - (void)__p;
    if (v35 >> 3 > v34) {
      unint64_t v34 = v35 >> 3;
    }
    if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v36 = v34;
    }
    if (v36)
    {
      uint64_t v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v36);
      long long v32 = (double *)__p;
      double v30 = v79;
    }
    else
    {
      uint64_t v37 = 0;
    }
    unint64_t v38 = (double *)&v37[16 * v33];
    unint64_t v29 = (unint64_t)&v37[16 * v36];
    *unint64_t v38 = v15;
    v38[1] = v17;
    CGFloat v31 = v38 + 2;
    if (v30 != v32)
    {
      do
      {
        *((_OWORD *)v38 - 1) = *((_OWORD *)v30 - 1);
        v38 -= 2;
        v30 -= 2;
      }
      while (v30 != v32);
      long long v32 = (double *)__p;
    }
    __p = v38;
    long long v79 = v31;
    unint64_t v80 = v29;
    if (v32)
    {
      operator delete(v32);
      unint64_t v29 = v80;
    }
  }
  else
  {
    *double v30 = v15;
    v28[3] = v17;
    CGFloat v31 = v28 + 4;
  }
  long long v79 = v31;
  if ((unint64_t)v31 >= v29)
  {
    unint64_t v40 = (double *)__p;
    uint64_t v41 = ((char *)v31 - (unsigned char *)__p) >> 4;
    unint64_t v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 60) {
      goto LABEL_90;
    }
    uint64_t v43 = v29 - (void)__p;
    if (v43 >> 3 > v42) {
      unint64_t v42 = v43 >> 3;
    }
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v44 = v42;
    }
    if (v44)
    {
      CGAffineTransform v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v44);
      unint64_t v40 = (double *)__p;
      CGFloat v31 = v79;
    }
    else
    {
      CGAffineTransform v45 = 0;
    }
    CGAffineTransform v46 = &v45[16 * v41];
    unint64_t v29 = (unint64_t)&v45[16 * v44];
    *(void *)CGAffineTransform v46 = v19;
    *((void *)v46 + 1) = v21;
    double v39 = (double *)(v46 + 16);
    if (v31 != v40)
    {
      do
      {
        *((_OWORD *)v46 - 1) = *((_OWORD *)v31 - 1);
        v46 -= 16;
        v31 -= 2;
      }
      while (v31 != v40);
      unint64_t v40 = (double *)__p;
    }
    __p = v46;
    long long v79 = v39;
    unint64_t v80 = v29;
    if (v40)
    {
      operator delete(v40);
      unint64_t v29 = v80;
    }
  }
  else
  {
    *(void *)CGFloat v31 = v19;
    *((void *)v31 + 1) = v21;
    double v39 = v31 + 2;
  }
  long long v79 = v39;
  if ((unint64_t)v39 >= v29)
  {
    id v48 = (double *)__p;
    uint64_t v49 = ((char *)v39 - (unsigned char *)__p) >> 4;
    unint64_t v50 = v49 + 1;
    if ((unint64_t)(v49 + 1) >> 60) {
      goto LABEL_90;
    }
    uint64_t v51 = v29 - (void)__p;
    if (v51 >> 3 > v50) {
      unint64_t v50 = v51 >> 3;
    }
    if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v52 = v50;
    }
    if (v52)
    {
      CGRect v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v52);
      id v48 = (double *)__p;
      double v39 = v79;
    }
    else
    {
      CGRect v53 = 0;
    }
    unint64_t v54 = (double *)&v53[16 * v49];
    unint64_t v29 = (unint64_t)&v53[16 * v52];
    *unint64_t v54 = v11;
    v54[1] = v13;
    double v47 = v54 + 2;
    if (v39 != v48)
    {
      do
      {
        *((_OWORD *)v54 - 1) = *((_OWORD *)v39 - 1);
        v54 -= 2;
        v39 -= 2;
      }
      while (v39 != v48);
      id v48 = (double *)__p;
    }
    __p = v54;
    long long v79 = v47;
    unint64_t v80 = v29;
    if (v48)
    {
      operator delete(v48);
      unint64_t v29 = v80;
    }
  }
  else
  {
    *double v39 = v11;
    v39[1] = v13;
    double v47 = v39 + 2;
  }
  long long v79 = v47;
  if ((unint64_t)v47 < v29)
  {
    *double v47 = v22;
    v47[1] = v23;
    uint64_t v55 = v47 + 2;
    goto LABEL_74;
  }
  double v56 = (double *)__p;
  uint64_t v57 = ((char *)v47 - (unsigned char *)__p) >> 4;
  unint64_t v58 = v57 + 1;
  if ((unint64_t)(v57 + 1) >> 60) {
LABEL_90:
  }
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  uint64_t v59 = v29 - (void)__p;
  if (v59 >> 3 > v58) {
    unint64_t v58 = v59 >> 3;
  }
  if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v60 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v60 = v58;
  }
  if (v60)
  {
    uint64_t v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v60);
    double v56 = (double *)__p;
    double v47 = v79;
  }
  else
  {
    uint64_t v61 = 0;
  }
  unint64_t v62 = (double *)&v61[16 * v57];
  float64x2_t v63 = &v61[16 * v60];
  *unint64_t v62 = v22;
  v62[1] = v23;
  uint64_t v55 = v62 + 2;
  if (v47 != v56)
  {
    do
    {
      *((_OWORD *)v62 - 1) = *((_OWORD *)v47 - 1);
      v62 -= 2;
      v47 -= 2;
    }
    while (v47 != v56);
    double v56 = (double *)__p;
  }
  __p = v62;
  long long v79 = v55;
  unint64_t v80 = (unint64_t)v63;
  if (v56) {
    operator delete(v56);
  }
LABEL_74:
  long long v79 = v55;
  PKPointsFromLineSegments((uint64_t *)&__p, (double **)&v81, a5 * 6.0);
  if ([v9 _pathHasClockwisePointOrdering])
  {
    if (v81 != v82)
    {
      CGAffineTransform v64 = v82 - 16;
      if (v82 - 16 > v81)
      {
        long long v65 = (char *)v81 + 16;
        do
        {
          long long v66 = *((_OWORD *)v65 - 1);
          *((_OWORD *)v65 - 1) = *(_OWORD *)v64;
          *(_OWORD *)CGAffineTransform v64 = v66;
          v64 -= 16;
          BOOL v67 = v65 >= v64;
          v65 += 16;
        }
        while (!v67);
      }
    }
  }
  long long v68 = a4[5];
  v77[4] = a4[4];
  v77[5] = v68;
  long long v69 = a4[7];
  v77[6] = a4[6];
  v77[7] = v69;
  long long v70 = a4[1];
  v77[0] = *a4;
  v77[1] = v70;
  long long v71 = a4[3];
  v77[2] = a4[2];
  v77[3] = v71;
  uint64_t v72 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, (double **)&v81, (uint64_t)v77, v9, a5);
  v73 = (void *)v72;
  if (v72)
  {
    v84[0] = v72;
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
  }
  else
  {
    v74 = 0;
  }

  if (__p)
  {
    long long v79 = (double *)__p;
    operator delete(__p);
  }
  if (v81)
  {
    uint64_t v82 = (char *)v81;
    operator delete(v81);
  }

  return v74;
}

- (id)_generateManhattanLine:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v57 = a3;
  unint64_t v58 = v9;
  BOOL v67 = 0;
  long long v68 = 0;
  uint64_t v69 = 0;
  long long v66 = 0;
  [v9 startLocation];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  double v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v66, 1uLL);
  *(void *)double v14 = v11;
  *((void *)v14 + 1) = v13;
  __p = v14;
  long long v66 = &v14[16 * v15];
  long long v65 = v14 + 16;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  double v16 = [v9 pathPoints];
  uint64_t v17 = a1;
  uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v61 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v60 + 1) + 8 * i) CGPointValue];
        uint64_t v23 = v21;
        uint64_t v24 = v22;
        uint64_t v25 = v65;
        if (v65 >= v66)
        {
          double v27 = (char *)__p;
          uint64_t v28 = (v65 - (unsigned char *)__p) >> 4;
          unint64_t v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 60) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v30 = v66 - (unsigned char *)__p;
          if ((v66 - (unsigned char *)__p) >> 3 > v29) {
            unint64_t v29 = v30 >> 3;
          }
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v31 = v29;
          }
          if (v31)
          {
            long long v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v66, v31);
            double v27 = (char *)__p;
            uint64_t v25 = v65;
          }
          else
          {
            long long v32 = 0;
          }
          uint64_t v33 = &v32[16 * v28];
          *(void *)uint64_t v33 = v23;
          *((void *)v33 + 1) = v24;
          unint64_t v34 = v33;
          if (v25 != v27)
          {
            do
            {
              *((_OWORD *)v34 - 1) = *((_OWORD *)v25 - 1);
              v34 -= 16;
              v25 -= 16;
            }
            while (v25 != v27);
            double v27 = (char *)__p;
          }
          unint64_t v26 = v33 + 16;
          __p = v34;
          long long v65 = v33 + 16;
          long long v66 = &v32[16 * v31];
          if (v27) {
            operator delete(v27);
          }
        }
        else
        {
          *(void *)long long v65 = v21;
          *((void *)v25 + 1) = v22;
          unint64_t v26 = v25 + 16;
        }
        long long v65 = v26;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
    }
    while (v18);
  }

  [v58 endLocation];
  uint64_t v37 = v35;
  uint64_t v38 = v36;
  double v39 = v65;
  if (v65 >= v66)
  {
    uint64_t v41 = (char *)__p;
    uint64_t v42 = (v65 - (unsigned char *)__p) >> 4;
    unint64_t v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v44 = v66 - (unsigned char *)__p;
    if ((v66 - (unsigned char *)__p) >> 3 > v43) {
      unint64_t v43 = v44 >> 3;
    }
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v45 = v43;
    }
    if (v45)
    {
      CGAffineTransform v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v66, v45);
      uint64_t v41 = (char *)__p;
      double v39 = v65;
    }
    else
    {
      CGAffineTransform v46 = 0;
    }
    double v47 = &v46[16 * v42];
    id v48 = &v46[16 * v45];
    *(void *)double v47 = v37;
    *((void *)v47 + 1) = v38;
    unint64_t v40 = v47 + 16;
    if (v39 != v41)
    {
      do
      {
        *((_OWORD *)v47 - 1) = *((_OWORD *)v39 - 1);
        v47 -= 16;
        v39 -= 16;
      }
      while (v39 != v41);
      uint64_t v41 = (char *)__p;
    }
    __p = v47;
    long long v65 = v40;
    long long v66 = v48;
    if (v41) {
      operator delete(v41);
    }
  }
  else
  {
    *(void *)long long v65 = v35;
    *((void *)v39 + 1) = v36;
    unint64_t v40 = v39 + 16;
  }
  long long v65 = v40;
  PKPointsFromLineSegments((uint64_t *)&__p, (double **)&v67, a5 * 6.0);
  long long v49 = a4[5];
  v59[4] = a4[4];
  v59[5] = v49;
  long long v50 = a4[7];
  v59[6] = a4[6];
  v59[7] = v50;
  long long v51 = a4[1];
  v59[0] = *a4;
  v59[1] = v51;
  long long v52 = a4[3];
  v59[2] = a4[2];
  v59[3] = v52;
  uint64_t v53 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](v17, (double **)&v67, (uint64_t)v59, v57, a5);
  unint64_t v54 = (void *)v53;
  if (v53)
  {
    uint64_t v70 = v53;
    uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  }
  else
  {
    uint64_t v55 = 0;
  }

  if (__p)
  {
    long long v65 = (char *)__p;
    operator delete(__p);
  }
  if (v67)
  {
    long long v68 = v67;
    operator delete(v67);
  }

  return v55;
}

- (id)_generateHeart:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  double v12 = -[PKShapeDrawingController aspectRatioAdjustedSizeFromResult:](v9);
  uint64_t v13 = 0;
  if (v12 > 0.0)
  {
    CGFloat v14 = v11;
    if (v11 > 0.0)
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      [v9 center];
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformMakeTranslation(&transform, v15, v16);
      CGAffineTransform v34 = transform;
      [v9 rotation];
      CGAffineTransformRotate(&block, &v34, v17 * 3.14159265 / 180.0);
      CGAffineTransform transform = block;
      CGAffineTransform v33 = block;
      CGAffineTransformScale(&block, &v33, v12, v14);
      CGAffineTransform transform = block;
      CGAffineTransform v32 = block;
      CGAffineTransformTranslate(&block, &v32, -0.5, -0.5);
      CGAffineTransform transform = block;
      uint64_t v18 = self;
      *(void *)&block.a = MEMORY[0x1E4F143A8];
      *(void *)&block.b = 3221225472;
      *(void *)&block.c = __48__PKShapeDrawingController__normalizedHeartPath__block_invoke;
      *(void *)&block.d = &__block_descriptor_40_e5_v8__0l;
      *(void *)&block.tCGFloat x = v18;
      if (qword_1EB3C6260 != -1) {
        dispatch_once(&qword_1EB3C6260, &block);
      }
      uint64_t v19 = CGPathCreateMutableCopyByTransformingPath((CGPathRef)qword_1EB3C6258, &transform);
      PKPointsFromPath(v19, (const void **)&v37, a5 * 6.0, a5 * 0.1);
      CGPathRelease(v19);
      if (([v10 _pathHasClockwisePointOrdering] & 1) == 0 && v37 != v38)
      {
        uint64_t v20 = v38 - 2;
        if (v38 - 2 > v37)
        {
          uint64_t v21 = v37 + 2;
          do
          {
            long long v22 = *((_OWORD *)v21 - 1);
            *((_OWORD *)v21 - 1) = *(_OWORD *)v20;
            *(_OWORD *)uint64_t v20 = v22;
            v20 -= 2;
            BOOL v23 = v21 >= v20;
            v21 += 2;
          }
          while (!v23);
        }
      }
      long long v24 = a4[5];
      v31[4] = a4[4];
      v31[5] = v24;
      long long v25 = a4[7];
      v31[6] = a4[6];
      v31[7] = v25;
      long long v26 = a4[1];
      v31[0] = *a4;
      v31[1] = v26;
      long long v27 = a4[3];
      v31[2] = a4[2];
      v31[3] = v27;
      uint64_t v28 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v37, (uint64_t)v31, v10, a5);
      unint64_t v29 = (void *)v28;
      if (v28)
      {
        v40[0] = v28;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
      }
      else
      {
        uint64_t v13 = 0;
      }

      if (v37)
      {
        uint64_t v38 = v37;
        operator delete(v37);
      }
    }
  }

  return v13;
}

- (id)_generateCloud:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  __p = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  [v9 center];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v9 size];
  double v17 = v16;
  uint64_t v18 = 0;
  if (v16 > 0.0)
  {
    double v19 = v15;
    if (v15 > 0.0)
    {
      CGAffineTransform v46 = v10;
      [v9 rotation];
      if (v19 <= v17) {
        double v21 = v19;
      }
      else {
        double v21 = v17;
      }
      if (v19 <= v17) {
        double v22 = v17;
      }
      else {
        double v22 = v19;
      }
      if (v19 <= v17) {
        double v23 = v20;
      }
      else {
        double v23 = v20 + 90.0;
      }
      self;
      double v24 = v21 * 1.42857143;
      uint64_t v25 = 1;
      if (v21 * 1.42857143 < v22)
      {
        double v26 = 400.0;
        double v27 = v21 * 1.42857143;
        while (1)
        {
          double v26 = v26 + 80.0;
          double v24 = v21 * (v26 / 280.0);
          if (v24 > v22 && v24 - v22 > v22 - v27) {
            break;
          }
          ++v25;
          double v27 = v21 * (v26 / 280.0);
          if (v24 >= v22) {
            goto LABEL_20;
          }
        }
        double v24 = v27;
      }
LABEL_20:
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformMakeTranslation(&transform, v12, v14);
      CGAffineTransform v50 = transform;
      CGAffineTransformRotate(&v63, &v50, v23 * 3.14159265 / 180.0);
      CGAffineTransform transform = v63;
      CGAffineTransform v49 = v63;
      CGAffineTransformScale(&v63, &v49, v24, v21);
      CGAffineTransform transform = v63;
      CGAffineTransform v48 = v63;
      CGAffineTransformTranslate(&v63, &v48, -0.5, -0.5);
      CGAffineTransform transform = v63;
      uint64_t v29 = self;
      Mutable = CGPathCreateMutable();
      memset(&v60, 0, sizeof(v60));
      CGAffineTransformMakeTranslation(&v60, 160.0, 0.0);
      self;
      CGPathAddArc(Mutable, 0, 137.5, 59.5, 55.5, -1.03876237, 2.87379342, 1);
      CGPathAddArc(Mutable, 0, 65.5, 136.0, 65.0, -1.26852383, 2.07935753, 1);
      CGPathAddArc(Mutable, 0, 70.0, 212.0, 41.0, -2.65976523, 1.03454926, 1);
      CGPathAddArc(Mutable, 0, 132.0, 232.0, 44.0, 2.78456263, 0.869410475, 1);
      uint64_t v31 = v25;
      do
      {
        CGAffineTransform m = v60;
        self;
        CGPathAddArc(Mutable, &m, 40.0, 222.0, 58.0, 2.27242155, 0.869171107, 1);
        CGAffineTransform t1 = v60;
        CGAffineTransformMakeTranslation(&t2, 80.0, 0.0);
        CGAffineTransformConcat(&v63, &t1, &t2);
        CGAffineTransform v60 = v63;
        --v31;
      }
      while (v31);
      CGAffineTransform v56 = v60;
      self;
      CGAffineTransform v62 = v56;
      CGAffineTransformMakeTranslation(&v61, -240.0, 0.0);
      CGAffineTransformConcat(&v63, &v62, &v61);
      CGAffineTransform v56 = v63;
      CGPathAddArc(Mutable, &v56, 268.0, 232.0, 44.0, 2.2664888, 0.368228686, 1);
      CGPathAddArc(Mutable, &v56, 330.0, 212.0, 41.0, 2.09887078, -0.474399883, 1);
      CGPathAddArc(Mutable, &v56, 335.0, 136.0, 65.0, 1.05539318, -1.85885177, 1);
      CGPathAddArc(Mutable, &v56, 262.5, 59.5, 55.5, 0.279104812, -2.09669403, 1);
      uint64_t v32 = 0;
      do
      {
        CGAffineTransform v62 = v60;
        CGAffineTransformMakeTranslation(&v61, -80.0, 0.0);
        CGAffineTransformConcat(&v63, &v62, &v61);
        CGAffineTransform v60 = v63;
        CGAffineTransform v55 = v63;
        self;
        CGPathAddArc(Mutable, &v55, 40.0, 58.0, 58.0, dbl_1C482B990[v32 == 0], dbl_1C482B9A0[v25 - 1 == v32], 1);
        ++v32;
      }
      while (v25 != v32);
      CGAffineTransform v33 = +[PKShapeDrawingController _createNormalizedPathFromPath:](v29, Mutable);
      CGPathRelease(Mutable);
      id v10 = v46;
      CGAffineTransform v34 = CGPathCreateMutableCopyByTransformingPath(v33, &transform);
      CGPathRelease(v33);
      PKPointsFromPath(v34, (const void **)&__p, a5 * 6.0, a5 * 0.1);
      CGPathRelease(v34);
      if (([v46 _pathHasClockwisePointOrdering] & 1) == 0 && __p != v53)
      {
        uint64_t v35 = v53 - 16;
        if (v53 - 16 > __p)
        {
          uint64_t v36 = (char *)__p + 16;
          do
          {
            long long v37 = *((_OWORD *)v36 - 1);
            *((_OWORD *)v36 - 1) = *(_OWORD *)v35;
            *(_OWORD *)uint64_t v35 = v37;
            v35 -= 16;
            BOOL v38 = v36 >= v35;
            v36 += 16;
          }
          while (!v38);
        }
      }
      long long v39 = a4[5];
      v47[4] = a4[4];
      v47[5] = v39;
      long long v40 = a4[7];
      v47[6] = a4[6];
      v47[7] = v40;
      long long v41 = a4[1];
      v47[0] = *a4;
      v47[1] = v41;
      long long v42 = a4[3];
      v47[2] = a4[2];
      v47[3] = v42;
      uint64_t v43 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, (double **)&__p, (uint64_t)v47, v46, a5);
      uint64_t v44 = (void *)v43;
      if (v43)
      {
        v64[0] = v43;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
      }
      else
      {
        uint64_t v18 = 0;
      }

      if (__p)
      {
        uint64_t v53 = (char *)__p;
        operator delete(__p);
      }
    }
  }

  return v18;
}

- (id)_generateStar:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  double v11 = 0;
  double v42 = -[PKShapeDrawingController aspectRatioAdjustedSizeFromResult:](v9) * 0.5;
  if (v42 > 0.0)
  {
    double v41 = v12 * 0.5;
    if (v12 * 0.5 > 0.0)
    {
      CGAffineTransform v50 = 0;
      long long v51 = 0;
      uint64_t v52 = 0;
      objc_msgSend(v9, "center", v12 * 0.5);
      double v46 = v14;
      double v47 = v13;
      memset(&v49, 0, sizeof(v49));
      [v9 rotation];
      CGAffineTransformMakeRotation(&v49, v15 * 3.14159265 / 180.0);
      Mutable = CGPathCreateMutable();
      double v40 = a5;
      double v17 = v42 * 0.4;
      double v45 = v41 * 0.4;
      int v18 = 5;
      double v19 = -1.57079633;
      do
      {
        __double2 v20 = __sincos_stret(v19);
        __double2 v21 = __sincos_stret(v19 + -0.628318531);
        __double2 v22 = __sincos_stret(v19 + 0.628318531);
        double c = v49.c;
        tCGFloat x = v49.tx;
        double ty = v49.ty;
        double a = v49.a;
        double b = v49.b;
        double d = v49.d;
        double v27 = v47 + v49.tx + v45 * v21.__sinval * v49.c + v49.a * (v17 * v21.__cosval);
        double v28 = v46 + v49.ty + v45 * v21.__sinval * v49.d + v49.b * (v17 * v21.__cosval);
        if (v18 == 5) {
          CGPathMoveToPoint(Mutable, 0, v27, v28);
        }
        else {
          CGPathAddLineToPoint(Mutable, 0, v27, v28);
        }
        double v17 = v42 * 0.4;
        CGPathAddLineToPoint(Mutable, 0, v47 + tx + v41 * v20.__sinval * c + a * (v42 * v20.__cosval), v46 + ty + v41 * v20.__sinval * d + b * (v42 * v20.__cosval));
        CGPathAddLineToPoint(Mutable, 0, v47 + tx + v45 * v22.__sinval * c + a * (v17 * v22.__cosval), v46 + ty + v45 * v22.__sinval * d + b * (v17 * v22.__cosval));
        double v19 = v19 + 1.25663706;
        --v18;
      }
      while (v18);
      PKPointsFromPath(Mutable, (const void **)&v50, v40 * 6.0, v40 * 0.1);
      CGPathRelease(Mutable);
      if ([v10 _pathHasClockwisePointOrdering])
      {
        if (v50 != v51)
        {
          uint64_t v29 = v51 - 2;
          if (v51 - 2 > v50)
          {
            uint64_t v30 = v50 + 2;
            do
            {
              long long v31 = *((_OWORD *)v30 - 1);
              *((_OWORD *)v30 - 1) = *(_OWORD *)v29;
              *(_OWORD *)uint64_t v29 = v31;
              v29 -= 2;
              BOOL v32 = v30 >= v29;
              v30 += 2;
            }
            while (!v32);
          }
        }
      }
      long long v33 = a4[5];
      v48[4] = a4[4];
      v48[5] = v33;
      long long v34 = a4[7];
      v48[6] = a4[6];
      v48[7] = v34;
      long long v35 = a4[1];
      v48[0] = *a4;
      v48[1] = v35;
      long long v36 = a4[3];
      v48[2] = a4[2];
      v48[3] = v36;
      uint64_t v37 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v50, (uint64_t)v48, v10, v40);
      BOOL v38 = (void *)v37;
      if (v37)
      {
        v53[0] = v37;
        double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
      }
      else
      {
        double v11 = 0;
      }

      if (v50)
      {
        long long v51 = v50;
        operator delete(v50);
      }
    }
  }

  return v11;
}

- (id)_generateChatBubble:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  [v9 size];
  double v13 = v12;
  double v14 = 0;
  if (v12 > 0.0)
  {
    double v15 = v11;
    if (v11 > 0.0)
    {
      double v45 = a5;
      uint64_t v54 = 0;
      CGAffineTransform v55 = 0;
      uint64_t v56 = 0;
      [v9 center];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      if (v13 >= v15) {
        double v20 = v15;
      }
      else {
        double v20 = v13;
      }
      CGFloat v21 = v20 * 0.5;
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&m.double a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&m.double c = v22;
      *(_OWORD *)&m.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(_OWORD *)&v52.double a = *(_OWORD *)&m.a;
      *(_OWORD *)&v52.double c = v22;
      *(_OWORD *)&v52.tCGFloat x = *(_OWORD *)&m.tx;
      CGAffineTransformTranslate(&m, &v52, v17, v19);
      CGAffineTransform v50 = m;
      CGAffineTransformScale(&v51, &v50, v13 * 0.5 / v21, v15 * 0.5 / v21);
      CGAffineTransform m = v51;
      CGAffineTransform v49 = v51;
      CGAffineTransformTranslate(&v51, &v49, -v17, -v19);
      CGAffineTransform m = v51;
      [v9 stemLocation];
      double v24 = v23;
      double v26 = v25;
      [v9 stemWidth];
      double v28 = v27;
      CGAffineTransform v47 = m;
      CGAffineTransformInvert(&v48, &v47);
      CGFloat v29 = v48.tx + v26 * v48.c + v48.a * v24;
      CGFloat v30 = v48.ty + v26 * v48.d + v48.b * v24;
      double v31 = atan2(v30 - v19, v29 - v17);
      Mutable = CGPathCreateMutable();
      CGPathAddArc(Mutable, &m, v17, v19, v21, v31 + v28 * -0.5, v31 + v28 * 0.5, 1);
      CGPathAddLineToPoint(Mutable, &m, v29, v30);
      __double2 v33 = __sincos_stret(v31 + v28 * -0.5);
      CGPathAddLineToPoint(Mutable, &m, v17 + v33.__cosval * v21, v19 + v33.__sinval * v21);
      PKPointsFromPath(Mutable, (const void **)&v54, v45 * 6.0, v45 * 0.1);
      CGPathRelease(Mutable);
      if ([v10 _pathHasClockwisePointOrdering])
      {
        if (v54 != v55)
        {
          long long v34 = v55 - 2;
          if (v55 - 2 > v54)
          {
            long long v35 = v54 + 2;
            do
            {
              long long v36 = *((_OWORD *)v35 - 1);
              *((_OWORD *)v35 - 1) = *(_OWORD *)v34;
              *(_OWORD *)long long v34 = v36;
              v34 -= 2;
              BOOL v37 = v35 >= v34;
              v35 += 2;
            }
            while (!v37);
          }
        }
      }
      long long v38 = a4[5];
      v46[4] = a4[4];
      v46[5] = v38;
      long long v39 = a4[7];
      v46[6] = a4[6];
      v46[7] = v39;
      long long v40 = a4[1];
      v46[0] = *a4;
      v46[1] = v40;
      long long v41 = a4[3];
      v46[2] = a4[2];
      v46[3] = v41;
      uint64_t v42 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v54, (uint64_t)v46, v10, v45);
      uint64_t v43 = (void *)v42;
      if (v42)
      {
        v57[0] = v42;
        double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
      }
      else
      {
        double v14 = 0;
      }

      if (v54)
      {
        CGAffineTransform v55 = v54;
        operator delete(v54);
      }
    }
  }

  return v14;
}

- (id)_generateOval:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  [v9 size];
  double v13 = v12;
  double v14 = 0;
  if (v12 > 0.0)
  {
    double v15 = v11;
    if (v11 > 0.0)
    {
      long long v40 = 0;
      long long v41 = 0;
      uint64_t v42 = 0;
      [v9 center];
      double v17 = v16;
      double v19 = v18;
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformMakeTranslation(&transform, v16, v18);
      CGAffineTransform v37 = transform;
      [v9 rotation];
      CGAffineTransformRotate(&v38, &v37, v20 * 3.14159265 / 180.0);
      CGAffineTransform transform = v38;
      CGAffineTransform v36 = v38;
      CGAffineTransformTranslate(&v38, &v36, -v17, -v19);
      CGAffineTransform transform = v38;
      [v9 center];
      v45.origin.CGFloat x = v21 - v13 * 0.5;
      v45.origin.y = v22 - v15 * 0.5;
      v45.size.double width = v13;
      v45.size.double height = v15;
      double v23 = CGPathCreateWithEllipseInRect(v45, &transform);
      PKPointsFromPath(v23, (const void **)&v40, a5 * 6.0, a5 * 0.1);
      CGPathRelease(v23);
      if ([v10 _pathHasClockwisePointOrdering])
      {
        if (v40 != v41)
        {
          double v24 = v41 - 2;
          if (v41 - 2 > v40)
          {
            double v25 = v40 + 2;
            do
            {
              long long v26 = *((_OWORD *)v25 - 1);
              *((_OWORD *)v25 - 1) = *(_OWORD *)v24;
              *(_OWORD *)double v24 = v26;
              v24 -= 2;
              BOOL v27 = v25 >= v24;
              v25 += 2;
            }
            while (!v27);
          }
        }
      }
      long long v28 = a4[5];
      v35[4] = a4[4];
      v35[5] = v28;
      long long v29 = a4[7];
      v35[6] = a4[6];
      v35[7] = v29;
      long long v30 = a4[1];
      v35[0] = *a4;
      v35[1] = v30;
      long long v31 = a4[3];
      v35[2] = a4[2];
      v35[3] = v31;
      uint64_t v32 = -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v40, (uint64_t)v35, v10, a5);
      __double2 v33 = (void *)v32;
      if (v32)
      {
        v43[0] = v32;
        double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      }
      else
      {
        double v14 = 0;
      }

      if (v40)
      {
        long long v41 = v40;
        operator delete(v40);
      }
    }
  }

  return v14;
}

- (uint64_t)_shapeTypeFromResultName:(uint64_t)a1
{
  id v3 = a2;
  double v4 = [v3 lowercaseString];
  if (([v4 isEqualToString:@"freeform"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"rectangle"])
    {
      uint64_t v5 = 2;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"triangle"])
    {
      uint64_t v5 = 3;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"oval"])
    {
      uint64_t v5 = 1;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"star"])
    {
      uint64_t v5 = 8;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"heart"])
    {
      uint64_t v5 = 9;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"chat bubble"])
    {
      uint64_t v5 = 10;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"pentagon"])
    {
      uint64_t v5 = 4;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"line"])
    {
      uint64_t v5 = 6;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"outline arrow"])
    {
      uint64_t v5 = 11;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"arrow"])
    {
      uint64_t v5 = 5;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"manhattan line"])
    {
      uint64_t v5 = 7;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"cloud"])
    {
      uint64_t v5 = 12;
      goto LABEL_27;
    }
    if ([v4 isEqualToString:@"scratchout"]
      && _os_feature_enabled_impl()
      && (-[PKShapeDrawingController isScratchOutActive](a1) & 1) != 0)
    {
      uint64_t v5 = 13;
      goto LABEL_27;
    }
  }
  uint64_t v5 = 0;
LABEL_27:

  return v5;
}

- (id)shapeFromStroke:(_OWORD *)a3 inputScale:(void *)a4 averageInputPoint:(double)a5 allowedShapeTypes:
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v135 = a4;
  v137 = v9;
  if (!a1) {
    goto LABEL_104;
  }
  if (!memcmp(a3, &PKInputPointZero, 0x80uLL))
  {
    double v11 = [v9 path];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      double v13 = [v9 path];
      [v13 timestampAtIndex:0];
      double v15 = v14;

      CGFloat v16 = [v9 path];
      double v17 = [v9 path];
      objc_msgSend(v16, "timestampAtIndex:", objc_msgSend(v17, "count") - 1);
      double v19 = v18;

      *(double *)(a1 + 152) = v19 - v15;
    }
    id v20 = v9;
    double v21 = objc_alloc_init(PKAveragePointGenerator);
    -[PKAveragePointGenerator addStroke:]((uint64_t)v21, v20);
    [(PKAveragePointGenerator *)(uint64_t)v21 currentInputPoint];

    long long v22 = v174;
    a3[4] = v173;
    a3[5] = v22;
    long long v23 = v176;
    a3[6] = v175;
    a3[7] = v23;
    long long v24 = v170;
    *a3 = block;
    a3[1] = v24;
    double v10 = *(double *)&v171;
    long long v25 = v172;
    a3[2] = v171;
    a3[3] = v25;
  }
  uint64_t v158 = 0;
  if (*(unsigned char *)(a1 + 193))
  {
    double v26 = 1.0;
    if (a5 <= 0.0) {
      goto LABEL_16;
    }
    BOOL v27 = [v9 _strokeData];
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    uint64_t v32 = [v27 _pointsCount];
    if (v32)
    {
      for (unint64_t i = 0; i != v32; ++i)
      {
        [v27 interpolatedLocationAt:(double)i];
        v181.origin.CGFloat x = v34;
        v181.origin.CGFloat y = v35;
        v181.size.double width = 0.0;
        v181.size.double height = 0.0;
        v179.origin.CGFloat x = x;
        v179.origin.CGFloat y = y;
        v179.size.double width = width;
        v179.size.double height = height;
        CGRect v180 = CGRectUnion(v179, v181);
        CGFloat x = v180.origin.x;
        CGFloat y = v180.origin.y;
        double width = v180.size.width;
        double height = v180.size.height;
      }
    }

    double v10 = 1.0 / a5 * height;
    if (1.0 / a5 * width > 4.0 || v10 > 4.0)
    {
      double v26 = a5;
LABEL_16:
      CGAffineTransform v37 = objc_msgSend(v9, "path", v10);
      unint64_t v38 = [v37 count];

      if (v38 > 0xFA0)
      {
        uint64_t v43 = 0;
        a5 = v26;
      }
      else
      {
        id v39 = v9;
        id v40 = objc_alloc_init(MEMORY[0x1E4F5C040]);
        uint64_t v159 = 0;
        v160 = &v159;
        uint64_t v161 = 0x2020000000;
        LOBYTE(v162) = 0;
        *(void *)&long long block = MEMORY[0x1E4F143A8];
        *((void *)&block + 1) = 3221225472;
        *(void *)&long long v170 = __49__PKShapeDrawingController__chDrawingFromStroke___block_invoke;
        *((void *)&v170 + 1) = &unk_1E64C77B8;
        id v41 = v40;
        *(void *)&long long v171 = v41;
        *((void *)&v171 + 1) = &v159;
        [v39 enumeratePointsWithTimestep:&block usingBlock:0.00833333333];
        if (*((unsigned char *)v160 + 24))
        {
          [v41 endStroke];
          id v42 = v41;
        }
        else
        {
          id v42 = 0;
        }

        _Block_object_dispose(&v159, 8);
        id v44 = v42;
        uint64_t v159 = 0;
        v160 = &v159;
        uint64_t v161 = 0x3032000000;
        v162 = __Block_byref_object_copy__33;
        v163 = __Block_byref_object_dispose__33;
        id v164 = 0;
        if (qword_1EB3C6270 != -1) {
          dispatch_once(&qword_1EB3C6270, &__block_literal_global_82);
        }
        CGRect v45 = (id)qword_1EB3C6268;
        *(void *)&long long block = MEMORY[0x1E4F143A8];
        *((void *)&block + 1) = 3221225472;
        *(void *)&long long v170 = __57__PKShapeDrawingController_recognitionResultsForDrawing___block_invoke;
        *((void *)&v170 + 1) = &unk_1E64CAD88;
        *(void *)&long long v172 = &v159;
        *(void *)&long long v171 = a1;
        id v46 = v44;
        *((void *)&v171 + 1) = v46;
        dispatch_sync(v45, &block);

        id v47 = (id)v160[5];
        _Block_object_dispose(&v159, 8);

        a5 = v26;
        uint64_t v43 = v47;
      }
      goto LABEL_25;
    }
  }
  uint64_t v43 = 0;
LABEL_25:
  v136 = v43;
  if ([v43 count])
  {
    CGAffineTransform v48 = [v136 objectAtIndexedSubscript:0];
    if ((unint64_t)[v136 count] < 2)
    {
      CGAffineTransform v49 = 0;
    }
    else
    {
      CGAffineTransform v49 = [v136 objectAtIndexedSubscript:1];
    }
    CGAffineTransform v50 = [v48 string];
    uint64_t v158 = -[PKShapeDrawingController _shapeTypeFromResultName:](a1, v50);

    if (v135
      && ([NSNumber numberWithInteger:v158],
          CGAffineTransform v51 = objc_claimAutoreleasedReturnValue(),
          char v52 = [v135 containsObject:v51],
          v51,
          (v52 & 1) == 0))
    {
      uint64_t v158 = 0;
    }
    else if (v158)
    {
      uint64_t v53 = os_log_create("com.apple.pencilkit", "Actions");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v54 = [v48 string];
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = v54;
        _os_log_impl(&dword_1C44F8000, v53, OS_LOG_TYPE_DEFAULT, "Shape recognized %@.", (uint8_t *)&block, 0xCu);
      }
      switch(v158)
      {
        case 1:
          long long v67 = a3[5];
          v155[4] = a3[4];
          v155[5] = v67;
          long long v68 = a3[7];
          v155[6] = a3[6];
          v155[7] = v68;
          long long v69 = a3[1];
          v155[0] = *a3;
          v155[1] = v69;
          long long v70 = a3[3];
          v155[2] = a3[2];
          v155[3] = v70;
          uint64_t v59 = -[PKShapeDrawingController _generateOval:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v155, a5);
          goto LABEL_74;
        case 2:
          long long v71 = a3[5];
          v157[4] = a3[4];
          v157[5] = v71;
          long long v72 = a3[7];
          v157[6] = a3[6];
          v157[7] = v72;
          long long v73 = a3[1];
          v157[0] = *a3;
          v157[1] = v73;
          long long v74 = a3[3];
          v157[2] = a3[2];
          v157[3] = v74;
          uint64_t v59 = -[PKShapeDrawingController _generateRectangle:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v157, a5);
          goto LABEL_74;
        case 3:
          long long v75 = a3[5];
          v156[4] = a3[4];
          v156[5] = v75;
          long long v76 = a3[7];
          v156[6] = a3[6];
          v156[7] = v76;
          long long v77 = a3[1];
          v156[0] = *a3;
          v156[1] = v77;
          long long v78 = a3[3];
          v156[2] = a3[2];
          v156[3] = v78;
          uint64_t v59 = -[PKShapeDrawingController _generateTriangle:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v156, a5);
          goto LABEL_74;
        case 4:
          long long v79 = a3[5];
          v151[4] = a3[4];
          v151[5] = v79;
          long long v80 = a3[7];
          v151[6] = a3[6];
          v151[7] = v80;
          long long v81 = a3[1];
          v151[0] = *a3;
          v151[1] = v81;
          long long v82 = a3[3];
          v151[2] = a3[2];
          v151[3] = v82;
          uint64_t v59 = -[PKShapeDrawingController _generatePentagon:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v151, a5);
          goto LABEL_74;
        case 5:
        case 6:
          long long v55 = a3[5];
          v150[4] = a3[4];
          v150[5] = v55;
          long long v56 = a3[7];
          v150[6] = a3[6];
          v150[7] = v56;
          long long v57 = a3[1];
          v150[0] = *a3;
          v150[1] = v57;
          long long v58 = a3[3];
          v150[2] = a3[2];
          v150[3] = v58;
          uint64_t v59 = -[PKShapeDrawingController _generateLine:sourceStroke:inputScale:averageInputPoint:shapeTypeOut:](a1, v48, v137, v150, &v158, a5);
          goto LABEL_74;
        case 7:
          if ((unint64_t)[v136 count] < 2)
          {
            double v86 = 100.0;
          }
          else
          {
            uint64_t v83 = [v136 objectAtIndexedSubscript:1];
            [v83 score];
            double v85 = v84;

            double v86 = fabs(v85);
          }
          [v48 score];
          CGAffineTransform v60 = 0;
          if (fabs(v105) < 0.0001 && v86 > 2.0)
          {
            long long v106 = a3[5];
            v148[4] = a3[4];
            v148[5] = v106;
            long long v107 = a3[7];
            v148[6] = a3[6];
            v148[7] = v107;
            long long v108 = a3[1];
            v148[0] = *a3;
            v148[1] = v108;
            long long v109 = a3[3];
            v148[2] = a3[2];
            v148[3] = v109;
            CGAffineTransform v60 = -[PKShapeDrawingController _generateManhattanLine:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v148, a5);
          }
          if (v60 || !v49 || v86 >= 1.0) {
            goto LABEL_75;
          }
          v110 = [v49 string];
          uint64_t v158 = -[PKShapeDrawingController _shapeTypeFromResultName:](a1, v110);

          if ((unint64_t)(v158 - 5) > 1) {
            break;
          }
          long long v111 = a3[5];
          v147[4] = a3[4];
          v147[5] = v111;
          long long v112 = a3[7];
          v147[6] = a3[6];
          v147[7] = v112;
          long long v113 = a3[1];
          v147[0] = *a3;
          v147[1] = v113;
          long long v114 = a3[3];
          v147[2] = a3[2];
          v147[3] = v114;
          uint64_t v59 = -[PKShapeDrawingController _generateLine:sourceStroke:inputScale:averageInputPoint:shapeTypeOut:](a1, v49, v137, v147, &v158, a5);
          goto LABEL_74;
        case 8:
          long long v87 = a3[5];
          v154[4] = a3[4];
          v154[5] = v87;
          long long v88 = a3[7];
          v154[6] = a3[6];
          v154[7] = v88;
          long long v89 = a3[1];
          v154[0] = *a3;
          v154[1] = v89;
          long long v90 = a3[3];
          v154[2] = a3[2];
          v154[3] = v90;
          uint64_t v59 = -[PKShapeDrawingController _generateStar:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v154, a5);
          goto LABEL_74;
        case 9:
          long long v91 = a3[5];
          v153[4] = a3[4];
          v153[5] = v91;
          long long v92 = a3[7];
          v153[6] = a3[6];
          v153[7] = v92;
          long long v93 = a3[1];
          v153[0] = *a3;
          v153[1] = v93;
          long long v94 = a3[3];
          v153[2] = a3[2];
          v153[3] = v94;
          uint64_t v59 = -[PKShapeDrawingController _generateHeart:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v153, a5);
          goto LABEL_74;
        case 10:
          long long v95 = a3[5];
          v152[4] = a3[4];
          v152[5] = v95;
          long long v96 = a3[7];
          v152[6] = a3[6];
          v152[7] = v96;
          long long v97 = a3[1];
          v152[0] = *a3;
          v152[1] = v97;
          long long v98 = a3[3];
          v152[2] = a3[2];
          v152[3] = v98;
          uint64_t v59 = -[PKShapeDrawingController _generateChatBubble:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v152, a5);
          goto LABEL_74;
        case 11:
          long long v99 = a3[5];
          v149[4] = a3[4];
          v149[5] = v99;
          long long v100 = a3[7];
          v149[6] = a3[6];
          v149[7] = v100;
          long long v101 = a3[1];
          v149[0] = *a3;
          v149[1] = v101;
          long long v102 = a3[3];
          v149[2] = a3[2];
          v149[3] = v102;
          uint64_t v59 = -[PKShapeDrawingController _generateOutlineArrow:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v149, a5);
          goto LABEL_74;
        case 12:
          long long v63 = a3[5];
          v146[4] = a3[4];
          v146[5] = v63;
          long long v64 = a3[7];
          v146[6] = a3[6];
          v146[7] = v64;
          long long v65 = a3[1];
          v146[0] = *a3;
          v146[1] = v65;
          long long v66 = a3[3];
          v146[2] = a3[2];
          v146[3] = v66;
          uint64_t v59 = -[PKShapeDrawingController _generateCloud:sourceStroke:inputScale:averageInputPoint:](a1, v48, v137, v146, a5);
          goto LABEL_74;
        case 13:
          if (!-[PKShapeDrawingController isScratchOutActive](a1)) {
            break;
          }
          if ((unint64_t)[v137 _pointsCount] >= 0x3E9)
          {
            v115 = os_log_create("com.apple.pencilkit", "Actions");
            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v116 = [v137 _pointsCount];
              LODWORD(block) = 134217984;
              *(void *)((char *)&block + 4) = v116;
              _os_log_impl(&dword_1C44F8000, v115, OS_LOG_TYPE_DEFAULT, "Scratch Out stroke has %lu points, cancelling due to too many.", (uint8_t *)&block, 0xCu);
            }
          }
          else
          {
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 200));
            char v104 = [WeakRetained shapeDrawingController:a1 scratchOutStrokesCoveredByStroke:v137];

            if (v104) {
              break;
            }
          }
          uint64_t v158 = 0;
          v168 = v137;
          uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v168 count:1];
LABEL_74:
          CGAffineTransform v60 = (void *)v59;
LABEL_75:

          if (v60) {
            goto LABEL_76;
          }
          goto LABEL_38;
        default:
          break;
      }
    }
  }
LABEL_38:
  CGAffineTransform v60 = 0;
  if (v137 && *(unsigned char *)(a1 + 192))
  {
    int v61 = -[PKShapeDrawingController isScratchOutActive](a1);
    if (v158 == 13) {
      int v62 = 0;
    }
    else {
      int v62 = v61;
    }
    if (v62 == 1)
    {
      v167 = v137;
      CGAffineTransform v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v167 count:1];
    }
    else
    {
      CGAffineTransform v60 = 0;
    }
  }
LABEL_76:
  if ([v60 count])
  {
    v117 = [MEMORY[0x1E4F29128] UUID];
    objc_storeStrong((id *)(a1 + 224), v117);

    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v118 = v60;
    uint64_t v119 = [v118 countByEnumeratingWithState:&v142 objects:v166 count:16];
    if (v119)
    {
      uint64_t v120 = *(void *)v143;
      do
      {
        for (uint64_t j = 0; j != v119; ++j)
        {
          if (*(void *)v143 != v120) {
            objc_enumerationMutation(v118);
          }
          v122 = *(void **)(*((void *)&v142 + 1) + 8 * j);
          id v123 = *(id *)(a1 + 224);
          [v122 _setGroupID:v123];

          [v122 _setShapeType:v158];
        }
        uint64_t v119 = [v118 countByEnumeratingWithState:&v142 objects:v166 count:16];
      }
      while (v119);
    }

    if ((unint64_t)[v118 count] >= 2)
    {
      v124 = [MEMORY[0x1E4F29128] UUID];
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v125 = v118;
      uint64_t v126 = [v125 countByEnumeratingWithState:&v138 objects:v165 count:16];
      if (v126)
      {
        uint64_t v127 = *(void *)v139;
        do
        {
          for (uint64_t k = 0; k != v126; ++k)
          {
            if (*(void *)v139 != v127) {
              objc_enumerationMutation(v125);
            }
            [*(id *)(*((void *)&v138 + 1) + 8 * k) _setRenderGroupID:v124];
          }
          uint64_t v126 = [v125 countByEnumeratingWithState:&v138 objects:v165 count:16];
        }
        while (v126);
      }
    }
  }
  v129 = v136;
  if ((![v60 count] || !v158)
    && ((int v130 = -[PKShapeDrawingController isScratchOutActive](a1), v158 == 13) ? (v131 = v130) : (v131 = 0), v131 != 1)
    || (v132 = [PKShape alloc],
        (a1 = [(PKShape *)v132 initWithShapeType:v158 strokes:v60 originalStroke:v137]) == 0))
  {
    v133 = os_log_create("com.apple.pencilkit", "Actions");
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block) = 0;
      _os_log_impl(&dword_1C44F8000, v133, OS_LOG_TYPE_DEFAULT, "Shape recognized <none>.", (uint8_t *)&block, 2u);
    }

    a1 = 0;
    v129 = v136;
  }

LABEL_104:

  return (id)a1;
}

- (id)detectedShapeWithInputScale:(void *)a3 averageInputPoint:(void *)a4 allowedShapeTypes:(double)a5 createCurrentStrokeBlock:
{
  id v9 = a3;
  id v10 = a4;
  double v11 = v10;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 193) || *(void *)(a1 + 216)) && (*(unsigned char *)(a1 + 64) || *(unsigned char *)(a1 + 65)))
    {
      uint64_t v12 = (*((void (**)(id))v10 + 2))(v10);
      [v12 renderBounds];
      if (v14 * a5 < 10.0 && v13 * a5 < 10.0 || v12 == 0)
      {
        a1 = 0;
      }
      else
      {
        long long v17 = a2[5];
        v22[4] = a2[4];
        v22[5] = v17;
        long long v18 = a2[7];
        v22[6] = a2[6];
        v22[7] = v18;
        long long v19 = a2[1];
        v22[0] = *a2;
        v22[1] = v19;
        long long v20 = a2[3];
        v22[2] = a2[2];
        v22[3] = v20;
        a1 = -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:](a1, v12, v22, v9, a5);
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (void)_addAngles:(void *)a1
{
  if (a1)
  {
    double v4 = CACurrentMediaTime();
    uint64_t v6 = a1[12];
    unint64_t v5 = a1[13];
    if (v6 == v5 || *(double *)(v5 - 8) < v4 + -0.1)
    {
      unint64_t v7 = v5 - v6;
      if (v5 - v6 >= 0x121)
      {
        uint64_t v8 = a1[12];
        do
        {
          unint64_t v9 = v5 - (v6 + 32);
          if (v5 != v6 + 32)
          {
            memmove((void *)v6, (const void *)(v6 + 32), v5 - (v6 + 32));
            uint64_t v8 = a1[12];
          }
          unint64_t v5 = v6 + v9;
          a1[13] = v6 + v9;
          unint64_t v7 = v6 + v9 - v8;
          uint64_t v6 = v8;
        }
        while (v7 > 0x120);
        uint64_t v6 = v8;
      }
      uint64_t v11 = a2[3];
      uint64_t v10 = a2[4];
      uint64_t v12 = a2[13];
      unint64_t v13 = a1[14];
      if (v5 >= v13)
      {
        unint64_t v15 = v7 >> 5;
        unint64_t v16 = (v7 >> 5) + 1;
        unint64_t v17 = v13 - v6;
        unint64_t v18 = (uint64_t)(v13 - v6) >> 4;
        if (v18 <= v16) {
          unint64_t v19 = v15 + 1;
        }
        else {
          unint64_t v19 = v18;
        }
        if (v17 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v20 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v19;
        }
        double v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TimestampedAngles>>(v20);
        long long v22 = &v21[32 * v15];
        long long v24 = &v21[32 * v23];
        *(void *)long long v22 = v11;
        *((void *)v22 + 1) = v10;
        *((void *)v22 + 2) = v12;
        *((double *)v22 + 3) = v4;
        double v14 = v22 + 32;
        double v26 = (char *)a1[12];
        long long v25 = (char *)a1[13];
        if (v25 != v26)
        {
          do
          {
            long long v27 = *((_OWORD *)v25 - 1);
            *((_OWORD *)v22 - 2) = *((_OWORD *)v25 - 2);
            *((_OWORD *)v22 - 1) = v27;
            v22 -= 32;
            v25 -= 32;
          }
          while (v25 != v26);
          long long v25 = (char *)a1[12];
        }
        a1[12] = v22;
        a1[13] = v14;
        a1[14] = v24;
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        *(void *)unint64_t v5 = v11;
        *(void *)(v5 + 8) = v10;
        double v14 = (char *)(v5 + 32);
        *(void *)(v5 + 16) = v12;
        *(double *)(v5 + 24) = v4;
      }
      a1[13] = v14;
    }
  }
}

- (void)_addCurrentStrokePoint:(CGFloat)a3
{
  if (a1)
  {
    v38.size.double width = 1.0;
    v38.size.double height = 1.0;
    v38.origin.CGFloat x = a2;
    v38.origin.CGFloat y = a3;
    *(CGRect *)(a1 + 32) = CGRectUnion(*(CGRect *)(a1 + 32), v38);
    unint64_t v6 = *(void *)(a1 + 24);
    uint64_t v7 = (int)(a2 * 100.0);
    uint64_t v8 = (int)(a3 * 100.0);
    unint64_t v9 = *(char **)(a1 + 16);
    if ((unint64_t)v9 >= v6)
    {
      uint64_t v11 = *(char **)(a1 + 8);
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v11) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - (void)v11) >> 3);
      if (2 * v14 > v13) {
        unint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x555555555555555) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(a1 + 24, v15);
        uint64_t v11 = *(char **)(a1 + 8);
        unint64_t v9 = *(char **)(a1 + 16);
      }
      else
      {
        unint64_t v16 = 0;
      }
      unint64_t v17 = &v16[24 * v12];
      unint64_t v18 = &v16[24 * v15];
      *(void *)unint64_t v17 = v7;
      *((void *)v17 + 1) = v8;
      *((void *)v17 + 2) = 0x3F800000BF800000;
      uint64_t v10 = v17 + 24;
      if (v9 != v11)
      {
        do
        {
          long long v19 = *(_OWORD *)(v9 - 24);
          *((void *)v17 - 1) = *((void *)v9 - 1);
          *(_OWORD *)(v17 - 24) = v19;
          v17 -= 24;
          v9 -= 24;
        }
        while (v9 != v11);
        uint64_t v11 = *(char **)(a1 + 8);
      }
      *(void *)(a1 + 8) = v17;
      *(void *)(a1 + 16) = v10;
      *(void *)(a1 + 24) = v18;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      *(void *)unint64_t v9 = v7;
      *((void *)v9 + 1) = v8;
      *((void *)v9 + 2) = 0x3F800000BF800000;
      uint64_t v10 = v9 + 24;
    }
    *(void *)(a1 + 16) = v10;
    double v20 = CACurrentMediaTime();
    uint64_t v22 = *(void *)(a1 + 72);
    double v21 = *(double **)(a1 + 80);
    if ((double *)v22 == v21 || *(v21 - 1) < v20 + -0.1)
    {
      unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v21 - v22) >> 3);
      if (v23 >= 0xA)
      {
        uint64_t v24 = *(void *)(a1 + 72);
        do
        {
          long long v25 = (char *)v21 - v22 - 24;
          if (v21 != (double *)(v22 + 24))
          {
            memmove((void *)v22, (const void *)(v22 + 24), (size_t)v21 - v22 - 24);
            uint64_t v24 = *(void *)(a1 + 72);
          }
          double v21 = (double *)&v25[v22];
          *(void *)(a1 + 80) = &v25[v22];
          unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v25[v22 - v24] >> 3);
          uint64_t v22 = v24;
        }
        while (v23 > 9);
        uint64_t v22 = v24;
      }
      unint64_t v26 = *(void *)(a1 + 88);
      if ((unint64_t)v21 >= v26)
      {
        unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v26 - v22) >> 3);
        if (2 * v28 <= v23 + 1) {
          uint64_t v29 = v23 + 1;
        }
        else {
          uint64_t v29 = 2 * v28;
        }
        if (v28 >= 0x555555555555555) {
          unint64_t v30 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v30 = v29;
        }
        long long v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::LocalMinimum>>(v30);
        uint64_t v32 = (double *)&v31[24 * v23];
        CGFloat v34 = &v31[24 * v33];
        *uint64_t v32 = a2;
        v32[1] = a3;
        v32[2] = v20;
        long long v27 = v32 + 3;
        CGAffineTransform v36 = *(double **)(a1 + 72);
        CGFloat v35 = *(double **)(a1 + 80);
        if (v35 != v36)
        {
          do
          {
            long long v37 = *(_OWORD *)(v35 - 3);
            *(v32 - 1) = *(v35 - 1);
            *(_OWORD *)(v32 - 3) = v37;
            v32 -= 3;
            v35 -= 3;
          }
          while (v35 != v36);
          CGFloat v35 = *(double **)(a1 + 72);
        }
        *(void *)(a1 + 72) = v32;
        *(void *)(a1 + 80) = v27;
        *(void *)(a1 + 88) = v34;
        if (v35) {
          operator delete(v35);
        }
      }
      else
      {
        double *v21 = a2;
        v21[1] = a3;
        long long v27 = v21 + 3;
        v21[2] = v20;
      }
      *(void *)(a1 + 80) = v27;
    }
  }
}

- (void)beginStrokeAtPoint:(CGFloat)a3
{
  if (a1)
  {
    unint64_t v6 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = 0;

    -[PKAveragePointGenerator reset](*(void *)(a1 + 120));
    *(void *)(a1 + 128) = 0;
    *(_WORD *)(a1 + 64) = 0;
    uint64_t v7 = (_OWORD *)MEMORY[0x1E4F1DB20];
    *(unsigned char *)(a1 + 66) = 0;
    long long v8 = v7[1];
    *(_OWORD *)(a1 + 32) = *v7;
    *(_OWORD *)(a1 + 48) = v8;
    std::vector<ClipperLib::IntPoint>::resize(a1 + 8, 0);
    [(PKShapeDrawingController *)a1 _addCurrentStrokePoint:a3];
    CFTimeInterval v9 = CACurrentMediaTime();
    *(CFTimeInterval *)(a1 + 136) = v9;
    *(CFTimeInterval *)(a1 + 144) = v9;
    *(void *)(a1 + 152) = 0;
    *(unsigned char *)(a1 + 67) = 1;
    *(void *)(a1 + 184) = 0;
  }
}

- (void)addStrokePoint:(CGFloat)a3 inputPoint:(CGFloat)a4
{
  if (a1)
  {
    unint64_t v5 = (uint64_t *)(a1 + 8);
    if (*(void *)(a1 + 16) != *(void *)(a1 + 8))
    {
      long long v9 = a2[5];
      v25[4] = a2[4];
      v25[5] = v9;
      long long v10 = a2[7];
      v25[6] = a2[6];
      v25[7] = v10;
      long long v11 = a2[1];
      v25[0] = *a2;
      v25[1] = v11;
      long long v12 = a2[3];
      v25[2] = a2[2];
      v25[3] = v12;
      -[PKShapeDrawingController _addAngles:]((void *)a1, v25);
      uint64_t v13 = *(void *)(a1 + 16);
      double v14 = sqrt((a4 - (double)(*(void *)(v13 - 16) / 100)) * (a4 - (double)(*(void *)(v13 - 16) / 100))+ (a3 - (double)(*(void *)(v13 - 24) / 100)) * (a3 - (double)(*(void *)(v13 - 24) / 100)));
      double v15 = 10.0;
      if (!*(void *)(a1 + 208)) {
        double v15 = 2.0;
      }
      if (v14 > v15)
      {
        [(PKShapeDrawingController *)a1 _addCurrentStrokePoint:a4];
        uint64_t v16 = *(void *)(a1 + 120);
        long long v17 = a2[5];
        v26[4] = a2[4];
        v26[5] = v17;
        long long v18 = a2[7];
        v26[6] = a2[6];
        v26[7] = v18;
        long long v19 = a2[1];
        v26[0] = *a2;
        v26[1] = v19;
        long long v20 = a2[3];
        v26[2] = a2[2];
        v26[3] = v20;
        -[PKAveragePointGenerator addInputPoint:](v16, (long double *)v26);
        ++*(void *)(a1 + 128);
        double v21 = CACurrentMediaTime();
        if (*(void *)(a1 + 208))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 200));
          [WeakRetained shapeDrawingControllerShapeDetectionCancelled:a1];

          *(double *)(a1 + 136) = v21;
          double v23 = v21;
        }
        else
        {
          double v23 = *(double *)(a1 + 136);
        }
        *(double *)(a1 + 144) = v21;
        if (v21 - v23 > 0.3)
        {
          CGFloat v24 = a3 - (double)(*(void *)*v5 / 100);
          if (sqrt((a4 - (double)(*(void *)(*v5 + 8) / 100)) * (a4 - (double)(*(void *)(*v5 + 8) / 100))+ v24 * v24) < 20.0&& fabs(ClipperLib::Area(v5)) / 10000.0 > 500.0)
          {
            *(unsigned char *)(a1 + 64) = 1;
          }
        }
      }
      -[PKShapeDrawingController _checkDetectedStroke](a1);
    }
  }
}

- (void)_checkDetectedStroke
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 208);
    if (v2)
    {
    }
    else if (*(unsigned char *)(a1 + 67))
    {
      id v3 = *(uint64_t **)(a1 + 8);
      unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - (void)v3) >> 3);
      if (v4 >= 2)
      {
        unint64_t v5 = v4 - 1;
        if (v5)
        {
          uint64_t v8 = *v3;
          uint64_t v7 = v3[1];
          unint64_t v6 = v3 + 4;
          double v9 = 0.0;
          do
          {
            uint64_t v10 = *(v6 - 1);
            uint64_t v11 = *v6;
            double v12 = (double)(v8 / 100) - (double)(v10 / 100);
            double v9 = v9
               + sqrt(((double)(v7 / 100) - (double)(*v6 / 100)) * ((double)(v7 / 100) - (double)(*v6 / 100)) + v12 * v12);
            v6 += 3;
            uint64_t v7 = v11;
            uint64_t v8 = v10;
            --v5;
          }
          while (v5);
          if (v9 >= 10.0)
          {
            double v13 = CACurrentMediaTime();
            double v14 = *(double *)(a1 + 160);
            if (v13 - *(double *)(a1 + 136) > v14 && v13 - *(double *)(a1 + 184) >= v14)
            {
              *(double *)(a1 + 184) = v13;
              if (*(unsigned char *)(a1 + 194)) {
                BOOL v15 = *(unsigned char *)(a1 + 66) == 0;
              }
              else {
                BOOL v15 = 0;
              }
              if (*(unsigned char *)(a1 + 193))
              {
                if (-[PKShapeDrawingController hasMovementStopped](a1))
                {
                  *(unsigned char *)(a1 + 65) = 1;
                  *(double *)(a1 + 152) = *(double *)(a1 + 152) + v13 - *(double *)(a1 + 136);
                  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 200));
                  [WeakRetained shapeDrawingControllerShapeGestureDetected:a1 isFastGesture:v15];

                  *(unsigned char *)(a1 + 66) = 1;
                }
              }
              else if (*(unsigned char *)(a1 + 64) && -[PKShapeDrawingController hasMovementStopped](a1))
              {
                *(double *)(a1 + 152) = *(double *)(a1 + 152) + v13 - *(double *)(a1 + 136);
                id v17 = objc_loadWeakRetained((id *)(a1 + 200));
                [v17 shapeDrawingControllerShapeGestureDetected:a1 isFastGesture:v15];

                *(unsigned char *)(a1 + 66) = 1;
              }
            }
          }
        }
      }
    }
  }
}

- (void)resetStroke
{
  if (a1)
  {
    *(unsigned char *)(a1 + 67) = 0;
    std::vector<TimestampedPoint>::resize(a1 + 72, 0);
    std::vector<TimestampedAngles>::resize(a1 + 96, 0);
    long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(a1 + 32) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(a1 + 48) = v2;
    std::vector<ClipperLib::IntPoint>::resize(a1 + 8, 0);
    id v3 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = 0;
  }
}

- (uint64_t)hasMovementStopped
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v2 = CACurrentMediaTime();
  double v3 = 0.0;
  double v4 = 0.0;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 80) - *(void *)(a1 + 72)) >> 3) >= 2)
  {
    double v5 = CACurrentMediaTime();
    unint64_t v6 = *(double **)(a1 + 72);
    double v7 = v6[2];
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 80) - (void)v6) >> 3);
    double v4 = 0.0;
    double v9 = 0.0;
    double v10 = v7;
    if (v8 != 1)
    {
      double v11 = v5 - *(double *)(a1 + 160);
      double v9 = 0.0;
      double v10 = v6[2];
      if (v6[5] <= v11)
      {
        double v12 = v6[3];
        double v9 = sqrt((v6[4] - v6[1]) * (v6[4] - v6[1]) + (v12 - *v6) * (v12 - *v6));
        if (v8 == 2 || (double v13 = v6[8], v13 > v11))
        {
          double v10 = v6[5];
        }
        else
        {
          double v14 = v6 + 6;
          unint64_t v15 = v8 - 2;
          do
          {
            double v16 = v12;
            double v10 = v13;
            double v12 = *v14;
            double v9 = v9 + sqrt((v14[1] - *(v14 - 2)) * (v14[1] - *(v14 - 2)) + (*v14 - v16) * (*v14 - v16));
            if (!--v15) {
              break;
            }
            double v13 = v14[5];
            v14 += 3;
          }
          while (v13 <= v11);
        }
      }
    }
    if (v10 - v7 > 0.0)
    {
      double v17 = v9 / (v10 - v7);
      if (v17 >= 0.0)
      {
        double v4 = v9 / (v10 - v7);
        if (v17 > 400.0) {
          double v4 = 400.0;
        }
      }
    }
  }
  uint64_t v19 = *(void *)(a1 + 96);
  uint64_t v18 = *(void *)(a1 + 104);
  uint64_t v20 = v18 - v19;
  if ((unint64_t)(v18 - v19) >= 0x21)
  {
    double v21 = *(double *)(v19 + 24);
    double v22 = *(double *)(v18 - 24);
    double v3 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    double v25 = 0.0;
    double v26 = v21;
    uint64_t v27 = (v20 >> 5) - 1;
    if (v20 >> 5 != 1)
    {
      double v50 = *(double *)(v19 + 24);
      double v51 = *(double *)(v18 - 24);
      double v52 = v4;
      double v53 = v2;
      long double v28 = *(double *)v19;
      long double v29 = *(double *)(v19 + 8);
      unint64_t v30 = (double *)(v19 + 48);
      long double v31 = *(double *)(v19 + 16);
      do
      {
        long double v32 = *(v30 - 2);
        long double v33 = *(v30 - 1);
        double v34 = *v30;
        v30 += 4;
        long double v35 = v34;
        DKDDiffAngleInRadians(v28, v32);
        if (v36 < 0.0) {
          double v36 = -v36;
        }
        double v25 = v25 + v36;
        DKDDiffAngleInRadians(v29, v33);
        if (v37 < 0.0) {
          double v37 = -v37;
        }
        double v24 = v24 + v37;
        DKDDiffAngleInRadians(v31, v35);
        if (v38 < 0.0) {
          double v38 = -v38;
        }
        double v23 = v23 + v38;
        long double v31 = v35;
        long double v29 = v33;
        long double v28 = v32;
        --v27;
      }
      while (v27);
      double v26 = *(double *)(v20 + v19 - 8);
      double v4 = v52;
      double v2 = v53;
      double v3 = 0.0;
      double v21 = v50;
      double v22 = v51;
    }
    double v39 = v26 - v21;
    if (v39 > 0.0)
    {
      double v3 = v24 / v39;
      if (v22 > 0.15)
      {
        double v40 = v23 / v39;
        double v41 = v25 / v39;
        if (v3 >= v41) {
          double v41 = v3;
        }
        if (v41 >= v40) {
          double v3 = v41;
        }
        else {
          double v3 = v40;
        }
      }
    }
  }
  if (*(unsigned char *)(a1 + 194))
  {
    BOOL v42 = *(unsigned char *)(a1 + 66) == 0;
    uint64_t v43 = 168;
    if (!*(unsigned char *)(a1 + 66)) {
      uint64_t v43 = 176;
    }
  }
  else
  {
    BOOL v42 = 0;
    uint64_t v43 = 168;
  }
  if (v2 - *(double *)(a1 + 136) <= 0.3) {
    return 0;
  }
  double v44 = (v4 / -400.0 + 1.0) * *(double *)(a1 + v43) + *(double *)(a1 + 160) * (1.0 - (v4 / -400.0 + 1.0));
  if (v2 - *(double *)(a1 + 144) <= v44 || v3 >= 0.5) {
    return 0;
  }
  id v47 = _PKSignpostLog();
  if (os_signpost_enabled(v47))
  {
    *(_DWORD *)buf = 134218240;
    double v55 = v44;
    __int16 v56 = 1024;
    BOOL v57 = v42;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v47, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ShapeRecognition", "%.2fs delay, fast:%d", buf, 0x12u);
  }

  CGAffineTransform v48 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v48, OS_LOG_TYPE_INFO, "DISCRETE \"ShapeRecognition\"", buf, 2u);
  }

  CGAffineTransform v49 = os_log_create("com.apple.pencilkit", "Actions");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v55 = v44;
    __int16 v56 = 1024;
    BOOL v57 = v42;
    _os_log_impl(&dword_1C44F8000, v49, OS_LOG_TYPE_DEFAULT, "Shape recognition triggered with %.2fs delay, fast:%d", buf, 0x12u);
  }

  return 1;
}

+ (uint64_t)hasSnapToShapeEntitlement
{
  if (qword_1EB3C6288 != -1) {
    dispatch_once(&qword_1EB3C6288, &__block_literal_global_131);
  }
  return _MergedGlobals_157;
}

void __53__PKShapeDrawingController_hasSnapToShapeEntitlement__block_invoke()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    id v1 = v0;
    id v2 = (id)SecTaskCopyValueForEntitlement(v0, @"com.apple.PencilKit.allowsSnapToShape", 0);
    _MergedGlobals_157 = [v2 BOOLValue];
    CFRelease(v1);
  }
}

- (void)setDetectedShape:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 208), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeRecognizer, 0);
  objc_storeStrong((id *)&self->_smartFillGroupID, 0);
  objc_storeStrong((id *)&self->_smartFillRenderMask, 0);
  objc_storeStrong((id *)&self->_detectedShape, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_averageInputPointGenerator, 0);
  begin = self->_timestampedAngles.__begin_;
  if (begin)
  {
    self->_timestampedAngles.__end_ = begin;
    operator delete(begin);
  }
  double v4 = self->_timestampedPoints.__begin_;
  if (v4)
  {
    self->_timestampedPoints.__end_ = v4;
    operator delete(v4);
  }
  double v5 = self->_currentStrokePoints.__begin_;
  if (v5)
  {
    self->_currentStrokePoints.__end_ = v5;
    operator delete(v5);
  }
}

@end