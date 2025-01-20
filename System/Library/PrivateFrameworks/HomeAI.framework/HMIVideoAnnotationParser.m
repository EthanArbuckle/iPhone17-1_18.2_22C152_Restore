@interface HMIVideoAnnotationParser
+ (id)eventForClass:(Class)a3 boundingBox:(CGRect)a4 UUID:(id)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastKnownTimeStamp;
- (HMIVideoAnnotationParser)initWithArray:(id)a3;
- (NSArray)tracks;
- (id)eventsForFragment;
- (id)eventsForTimeStamp:(id *)a3;
@end

@implementation HMIVideoAnnotationParser

- (HMIVideoAnnotationParser)initWithArray:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnnotationParser;
  v5 = [(HMIVideoAnnotationParser *)&v13 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__HMIVideoAnnotationParser_initWithArray___block_invoke;
    v11[3] = &unk_26477C1F8;
    id v12 = v6;
    id v7 = v6;
    uint64_t v8 = objc_msgSend(v4, "na_map:", v11);
    tracks = v5->_tracks;
    v5->_tracks = (NSArray *)v8;
  }
  return v5;
}

objc_class *__42__HMIVideoAnnotationParser_initWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"class"];
  v5 = [v3 objectForKeyedSubscript:@"timestamp"];
  v6 = [v3 objectForKeyedSubscript:@"box"];
  id v7 = +[HMIVideoAnalyzerEvent eventClassForShortName:v4];
  if (v7)
  {
    uint64_t v8 = [v3 objectForKeyedSubscript:@"uuid"];
    if (v8)
    {
      v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

      if (!v9)
      {
        v10 = [MEMORY[0x263F08C38] UUID];
        [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v8];
      }
      uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263F08C38] UUID];
    }
    id v12 = (void *)v11;
    objc_super v13 = [MEMORY[0x263EFF980] array];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __42__HMIVideoAnnotationParser_initWithArray___block_invoke_2;
    v20 = &unk_26477C1D0;
    id v21 = v5;
    id v22 = v13;
    id v14 = v13;
    [v6 enumerateObjectsUsingBlock:&v17];
    v15 = [HMIVideoAnnotationParserTrack alloc];
    id v7 = -[HMIVideoAnnotationParserTrack initWithEventClass:records:UUID:](v15, "initWithEventClass:records:UUID:", v7, v14, v12, v17, v18, v19, v20);
  }
  return v7;
}

void __42__HMIVideoAnnotationParser_initWithArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [v7 floatValue];
  double v9 = v8;

  v10 = [v6 objectAtIndexedSubscript:0];
  [v10 floatValue];
  float v12 = v11;

  double v13 = v12;
  if (v12 > 1.0) {
    double v13 = 1.0;
  }
  float v14 = fmax(v13, 0.0);
  v15 = [v6 objectAtIndexedSubscript:1];
  [v15 floatValue];
  float v17 = v16;

  double v18 = v17;
  if (v17 > 1.0) {
    double v18 = 1.0;
  }
  float v19 = fmax(v18, 0.0);
  v20 = [v6 objectAtIndexedSubscript:2];
  [v20 floatValue];
  float v22 = v21;

  double v23 = v22;
  if (v22 > 1.0) {
    double v23 = 1.0;
  }
  float v24 = fmax(v23, 0.0);
  v25 = [v6 objectAtIndexedSubscript:3];

  [v25 floatValue];
  float v27 = v26;

  double v28 = v27;
  if (v27 > 1.0) {
    double v28 = 1.0;
  }
  float v29 = fmax(v28, 0.0);
  v30 = *(void **)(a1 + 40);
  v31 = -[HMIVideoAnnotationParserRecord initWithBoundingBox:timeStamp:]([HMIVideoAnnotationParserRecord alloc], "initWithBoundingBox:timeStamp:", v19, v14, (float)(v29 - v19), (float)(v24 - v14), v9);
  [v30 addObject:v31];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastKnownTimeStamp
{
  uint64_t v7 = 0;
  float v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v4 = [(HMIVideoAnnotationParser *)self tracks];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__HMIVideoAnnotationParser_lastKnownTimeStamp__block_invoke;
  v6[3] = &unk_26477C220;
  v6[4] = &v7;
  objc_msgSend(v4, "na_each:", v6);

  CMTimeMakeWithSeconds((CMTime *)retstr, fmax(v8[3] + -0.05, 0.0), 1000);
  _Block_object_dispose(&v7, 8);
  return result;
}

void __46__HMIVideoAnnotationParser_lastKnownTimeStamp__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = [a2 records];
  v5 = [v4 lastObject];
  [v5 timeStamp];
  double v7 = v6;

  if (v3 >= v7) {
    double v8 = v3;
  }
  else {
    double v8 = v7;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
}

- (id)eventsForTimeStamp:(id *)a3
{
  CMTime time = *(CMTime *)a3;
  Float64 Seconds = CMTimeGetSeconds(&time);
  v5 = [(HMIVideoAnnotationParser *)self tracks];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HMIVideoAnnotationParser_eventsForTimeStamp___block_invoke_2;
  v9[3] = &unk_26477C268;
  Float64 v11 = Seconds;
  uint64_t v12 = 0x3F9999DCB5781C72;
  id v10 = &__block_literal_global_9;
  double v6 = objc_msgSend(v5, "na_map:", v9);

  double v7 = [MEMORY[0x263EFFA08] setWithArray:v6];

  return v7;
}

CGFloat __47__HMIVideoAnnotationParser_eventsForTimeStamp___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, float a9, float a10)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v31.origin.x = a5;
  v31.origin.y = a6;
  v31.size.width = a7;
  v31.size.height = a8;
  CGFloat v24 = (CGRectGetMinX(v31) * a9 + a10 * MinX) / (float)(a9 + a10);
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  CGRectGetMinY(v32);
  v33.origin.x = a5;
  v33.size.height = a8;
  v33.origin.y = a6;
  v33.size.width = a7;
  CGRectGetMinY(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  CGRectGetWidth(v34);
  v35.origin.x = a5;
  v35.origin.y = a6;
  v35.size.width = a7;
  v35.size.height = a8;
  CGRectGetWidth(v35);
  v36.origin.x = a1;
  v36.size.width = a3;
  v36.origin.y = a2;
  v36.size.height = a4;
  CGRectGetHeight(v36);
  v37.origin.x = a5;
  v37.origin.y = a6;
  v37.size.width = a7;
  v37.size.height = a8;
  CGRectGetHeight(v37);
  return v24;
}

id __47__HMIVideoAnnotationParser_eventsForTimeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 records];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    while (1)
    {
      double v7 = *(double *)(a1 + 40) + *(double *)(a1 + 48);
      double v8 = [v3 records];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v6];
      [v9 timeStamp];
      double v11 = v10;

      if (v7 < v11) {
        goto LABEL_10;
      }
      double v12 = *(double *)(a1 + 40) - *(double *)(a1 + 48);
      double v13 = [v3 records];
      float v14 = [v13 objectAtIndexedSubscript:v6];
      [v14 timeStamp];
      double v16 = v15;

      if (v12 < v16) {
        break;
      }
      unint64_t v17 = v6 + 1;
      double v18 = [v3 records];
      if (v6 + 1 >= [v18 count])
      {
      }
      else
      {
        double v19 = *(double *)(a1 + 40) + *(double *)(a1 + 48);
        v20 = [v3 records];
        float v21 = [v20 objectAtIndexedSubscript:v6 + 1];
        [v21 timeStamp];
        double v23 = v22;

        if (v19 < v23)
        {
          uint64_t v37 = *(void *)(a1 + 32);
          v76 = [v3 records];
          v38 = [v76 objectAtIndexedSubscript:v6];
          [v38 boundingBox];
          double v75 = v39;
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          v46 = [v3 records];
          unint64_t v47 = v6 + 1;
          v48 = [v46 objectAtIndexedSubscript:v6 + 1];
          [v48 boundingBox];
          double v50 = v49;
          double v52 = v51;
          double v54 = v53;
          double v56 = v55;
          double v57 = *(double *)(a1 + 40);
          v58 = [v3 records];
          v59 = [v58 objectAtIndexedSubscript:v6];
          [v59 timeStamp];
          *(float *)&double v57 = v57 - v60;
          v61 = [v3 records];
          v62 = [v61 objectAtIndexedSubscript:v47];
          [v62 timeStamp];
          *(float *)&double v63 = v63 - *(double *)(a1 + 40);
          double v64 = (*(double (**)(uint64_t, double, double, double, double, double, double, double, double, double))(v37 + 16))(v37, v75, v41, v43, v45, v50, v52, v54, v56, COERCE_DOUBLE(__PAIR64__(LODWORD(v63), LODWORD(v57))));
          double v66 = v65;
          double v68 = v67;
          double v70 = v69;

          uint64_t v71 = [v3 eventClass];
          v72 = [v3 UUID];
          v73 = +[HMIVideoAnnotationParser eventForClass:boundingBox:UUID:](HMIVideoAnnotationParser, "eventForClass:boundingBox:UUID:", v71, v72, v64, v66, v68, v70);
LABEL_12:

          goto LABEL_13;
        }
      }
      CGFloat v24 = [v3 records];
      unint64_t v25 = [v24 count];

      unint64_t v6 = v17;
      if (v17 >= v25) {
        goto LABEL_10;
      }
    }
    uint64_t v26 = [v3 eventClass];
    v72 = [v3 records];
    float v27 = [v72 objectAtIndexedSubscript:v6];
    [v27 boundingBox];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    CGRect v36 = [v3 UUID];
    v73 = +[HMIVideoAnnotationParser eventForClass:boundingBox:UUID:](HMIVideoAnnotationParser, "eventForClass:boundingBox:UUID:", v26, v36, v29, v31, v33, v35);

    goto LABEL_12;
  }
LABEL_10:
  v73 = 0;
LABEL_13:

  return v73;
}

- (id)eventsForFragment
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(HMIVideoAnnotationParser *)self tracks];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HMIVideoAnnotationParser_eventsForFragment__block_invoke;
  v8[3] = &unk_26477C290;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  unint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_67);

  return v6;
}

void __45__HMIVideoAnnotationParser_eventsForFragment__block_invoke(uint64_t a1, void *a2)
{
  id v32 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v32, "eventClass")) & 1) == 0)
  {
    uint64_t v3 = [v32 eventClass];
    if (v3 != objc_opt_class())
    {
      id v5 = [v32 records];
      uint64_t v6 = [v5 count];

      if (!v6) {
        goto LABEL_11;
      }
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = v7++;
        id v9 = [v32 records];
        unint64_t v10 = [v9 count];

        unint64_t v11 = v7;
        if (v7 < v10) {
          break;
        }
LABEL_8:
        double v30 = [v32 records];
        unint64_t v31 = [v30 count];

        if (v7 >= v31) {
          goto LABEL_11;
        }
      }
      while (1)
      {
        double v12 = [v32 records];
        double v13 = [v12 objectAtIndexedSubscript:v8];
        [v13 boundingBox];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        double v22 = [v32 records];
        double v23 = [v22 objectAtIndexedSubscript:v11];
        [v23 boundingBox];
        LODWORD(v15) = HMICGRectMaxParallelEdgeDistanceRatio(v15, v17, v19, v21, v24, v25, v26, v27);

        double v4 = *(float *)&v15;
        if (*(float *)&v15 > 0.05) {
          break;
        }
        ++v11;
        double v28 = objc_msgSend(v32, "records", v4);
        unint64_t v29 = [v28 count];

        if (v11 >= v29) {
          goto LABEL_8;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v32, "eventClass", v4));
  }
LABEL_11:
}

id __45__HMIVideoAnnotationParser_eventsForFragment__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  double v4 = +[HMIVideoAnnotationParser eventForClass:boundingBox:UUID:](HMIVideoAnnotationParser, "eventForClass:boundingBox:UUID:", a2, v3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v4;
}

+ (id)eventForClass:(Class)a3 boundingBox:(CGRect)a4 UUID:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a5;
  unint64_t v11 = [[HMIConfidence alloc] initWithValue:&unk_26D9A96F0 levelThresholds:1.0];
  if ((Class)objc_opt_class() == a3)
  {
    double v13 = [HMIFaceCrop alloc];
    double v14 = [MEMORY[0x263F08C38] UUID];
    CGFloat v15 = [MEMORY[0x263EFF8F8] data];
    double v16 = [MEMORY[0x263EFF910] date];
    double v17 = *MEMORY[0x263F001A8];
    double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
    CGFloat v21 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v13, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v14, v15, v16, *MEMORY[0x263F001A8], v18, v19, v20);

    double v22 = [HMIFaceprint alloc];
    double v23 = [MEMORY[0x263F08C38] UUID];
    CGFloat v24 = [MEMORY[0x263EFF8F8] data];
    CGFloat v25 = [MEMORY[0x263F08C38] UUID];
    CGFloat v26 = [MEMORY[0x263F08C38] UUID];
    CGFloat v27 = [(HMIFaceprint *)v22 initWithUUID:v23 data:v24 modelUUID:v25 faceCropUUID:v26];

    double v28 = [HMIFaceClassification alloc];
    unint64_t v29 = [MEMORY[0x263F08C38] UUID];
    double v30 = [(HMIFaceClassification *)v28 initWithPersonUUID:0 sourceUUID:v29 sessionEntityUUID:v10 confidence:2 familiarity:1.0];

    unint64_t v31 = [HMIFaceRecognition alloc];
    id v32 = [MEMORY[0x263EFFA08] setWithObject:v30];
    double v33 = [(HMIFaceRecognition *)v31 initWithFaceCrop:v21 faceprint:v27 classifications:v32 predictedLinkedEntityUUIDs:0 faceQualityScore:1 sessionEntityAssignment:v10 sessionEntityUUID:-1.0];

    double v34 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:faceRecognition:]([HMIVideoAnalyzerEventFace alloc], "initWithConfidence:boundingBox:faceRecognition:", v11, v33, v17, v18, v19, v20);
    double v12 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:]([HMIVideoAnalyzerEventPerson alloc], "initWithConfidence:boundingBox:face:", v11, v34, x, y, width, height);
  }
  else
  {
    double v12 = (HMIVideoAnalyzerEventPerson *)objc_msgSend([a3 alloc], "initWithConfidence:boundingBox:", v11, x, y, width, height);
  }

  return v12;
}

- (NSArray)tracks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end