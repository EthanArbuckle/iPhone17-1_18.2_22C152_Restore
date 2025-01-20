@interface HMICameraVideoFrameResult
+ (BOOL)supportsSecureCoding;
+ (id)_annotationScoresFromAnalyzerEvents:(id)a3;
+ (id)_detectionsFromAnalyzerEvents:(id)a3;
+ (id)_faceClassificationsFromAnalyzerEvents:(id)a3;
+ (int64_t)_eventsFromAnalyzerEvents:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)regionOfInterest;
- (HMICameraVideoFrame)frame;
- (HMICameraVideoFrameResult)initWithCoder:(id)a3;
- (HMICameraVideoFrameResult)initWithFrame:(id)a3 events:(int64_t)a4 annotationScores:(id)a5 detections:(id)a6 regionOfInterest:(CGRect)a7 faceClassifications:(id)a8;
- (HMICameraVideoFrameResult)initWithFrame:(id)a3 regionOfInterest:(CGRect)a4 analyzerEvents:(id)a5;
- (NSArray)detections;
- (NSDictionary)annotationScores;
- (NSSet)analyzerEvents;
- (NSSet)faceClassifications;
- (id)maxConfidenceEventForEventClass:(Class)a3;
- (int64_t)events;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMICameraVideoFrameResult

- (HMICameraVideoFrameResult)initWithFrame:(id)a3 events:(int64_t)a4 annotationScores:(id)a5 detections:(id)a6 regionOfInterest:(CGRect)a7 faceClassifications:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMICameraVideoFrameResult;
  v22 = [(HMICameraVideoFrameResult *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_frame, a3);
    v23->_events = a4;
    objc_storeStrong((id *)&v23->_annotationScores, a5);
    objc_storeStrong((id *)&v23->_detections, a6);
    v23->_regionOfInterest.origin.CGFloat x = x;
    v23->_regionOfInterest.origin.CGFloat y = y;
    v23->_regionOfInterest.size.CGFloat width = width;
    v23->_regionOfInterest.size.CGFloat height = height;
    objc_storeStrong((id *)&v23->_faceClassifications, a8);
  }

  return v23;
}

- (HMICameraVideoFrameResult)initWithFrame:(id)a3 regionOfInterest:(CGRect)a4 analyzerEvents:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMICameraVideoFrameResult;
  v14 = [(HMICameraVideoFrameResult *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_frame, a3);
    v15->_regionOfInterest.origin.CGFloat x = x;
    v15->_regionOfInterest.origin.CGFloat y = y;
    v15->_regionOfInterest.size.CGFloat width = width;
    v15->_regionOfInterest.size.CGFloat height = height;
    objc_storeStrong((id *)&v15->_analyzerEvents, a5);
    v15->_events = [(id)objc_opt_class() _eventsFromAnalyzerEvents:v13];
    uint64_t v16 = [(id)objc_opt_class() _annotationScoresFromAnalyzerEvents:v13];
    annotationScores = v15->_annotationScores;
    v15->_annotationScores = (NSDictionary *)v16;

    uint64_t v18 = [(id)objc_opt_class() _detectionsFromAnalyzerEvents:v13];
    detections = v15->_detections;
    v15->_detections = (NSArray *)v18;

    uint64_t v20 = [(id)objc_opt_class() _faceClassificationsFromAnalyzerEvents:v13];
    faceClassifications = v15->_faceClassifications;
    v15->_faceClassifications = (NSSet *)v20;
  }
  return v15;
}

+ (id)_faceClassificationsFromAnalyzerEvents:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = [MEMORY[0x263EFF9C0] set];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__HMICameraVideoFrameResult__faceClassificationsFromAnalyzerEvents___block_invoke;
  v6[3] = &unk_26477BE58;
  v6[4] = &v7;
  objc_msgSend(v3, "na_each:", v6);
  v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __68__HMICameraVideoFrameResult__faceClassificationsFromAnalyzerEvents___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v15;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 face];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      v8 = [v5 face];
      uint64_t v9 = [v8 faceRecognition];

      if (v9)
      {
        v10 = [v5 face];
        v11 = [v10 faceRecognition];

        id v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        id v13 = [v11 classifications];
        v14 = [v13 allObjects];
        [v12 addObjectsFromArray:v14];
      }
    }
  }
}

+ (int64_t)_eventsFromAnalyzerEvents:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke;
  v7[3] = &unk_26477C188;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = &v10;
  objc_msgSend(v4, "na_each:", v7);
  int64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke_2;
  v3[3] = &unk_26477BE58;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    uint64_t v8 = 2;
LABEL_8:
    uint64_t v7 = v9;
    goto LABEL_9;
  }
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    uint64_t v8 = 8;
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class();
  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v8;
  }
}

+ (id)_annotationScoresFromAnalyzerEvents:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HMICameraVideoFrameResult__annotationScoresFromAnalyzerEvents___block_invoke;
  v6[3] = &unk_26477BE58;
  v6[4] = &v7;
  objc_msgSend(v3, "na_each:", v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__HMICameraVideoFrameResult__annotationScoresFromAnalyzerEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = a2;
  uint64_t v5 = [v4 confidence];
  [v5 value];
  objc_msgSend(v3, "numberWithDouble:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v6 = NSNumber;
  uint64_t v7 = objc_opt_class();

  uint64_t v8 = [v6 numberWithInteger:HMIEventClassToCameraVideoAnalyzerEventType(v7)];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v8];
  if (!v9 || ([v13 doubleValue], double v11 = v10, objc_msgSend(v9, "doubleValue"), v11 > v12)) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v13 forKey:v8];
  }
}

+ (id)_detectionsFromAnalyzerEvents:(id)a3
{
  id v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_8);
  id v4 = [v3 allObjects];

  return v4;
}

HMIObjectDetection *__59__HMICameraVideoFrameResult__detectionsFromAnalyzerEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    if (v4 == objc_opt_class())
    {
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v5 = objc_opt_class();
      if (v5 == objc_opt_class()) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 7;
      }
    }
  }
  uint64_t v7 = [HMIObjectDetection alloc];
  uint64_t v8 = [v2 confidence];
  [v8 value];
  double v10 = v9;
  [v2 boundingBox];
  id v15 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](v7, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v6, 0, 0, v10, v11, v12, v13, v14);

  return v15;
}

- (id)maxConfidenceEventForEventClass:(Class)a3
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__2;
  double v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  uint64_t v4 = [(HMICameraVideoFrameResult *)self analyzerEvents];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke;
  v9[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v9[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v9);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke_2;
  v8[3] = &unk_26477BE58;
  v8[4] = &v10;
  objc_msgSend(v5, "na_each:", v8);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

BOOL __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke(uint64_t a1)
{
  return objc_opt_class() == *(void *)(a1 + 32);
}

void __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v14 = v4;
  if (v7)
  {
    uint64_t v8 = [v4 confidence];
    [v8 value];
    double v10 = v9;
    double v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) confidence];
    [v11 value];
    double v13 = v12;

    if (v10 <= v13) {
      goto LABEL_5;
    }
    id v6 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_storeStrong(v6, a2);
LABEL_5:
}

- (HMICameraVideoFrame)frame
{
  return (HMICameraVideoFrame *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)annotationScores
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)events
{
  return self->_events;
}

- (NSArray)detections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (CGRect)regionOfInterest
{
  objc_copyStruct(v6, &self->_regionOfInterest, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (NSSet)faceClassifications
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)analyzerEvents
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerEvents, 0);
  objc_storeStrong((id *)&self->_faceClassifications, 0);
  objc_storeStrong((id *)&self->_detections, 0);
  objc_storeStrong((id *)&self->_annotationScores, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

- (HMICameraVideoFrameResult)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMICVFR.f"];
  [v4 decodeRectForKey:@"HMICVFR.roi"];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = (void *)MEMORY[0x263EFFA08];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v16 = [v14 setWithArray:v15];
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"HMICVFR.ae"];

  uint64_t v18 = -[HMICameraVideoFrameResult initWithFrame:regionOfInterest:analyzerEvents:](self, "initWithFrame:regionOfInterest:analyzerEvents:", v5, v17, v7, v9, v11, v13);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(HMICameraVideoFrameResult *)self frame];
  [v4 encodeObject:v5 forKey:@"HMICVFR.f"];

  [(HMICameraVideoFrameResult *)self regionOfInterest];
  objc_msgSend(v4, "encodeRect:forKey:", @"HMICVFR.roi");
  id v6 = [(HMICameraVideoFrameResult *)self analyzerEvents];
  [v4 encodeObject:v6 forKey:@"HMICVFR.ae"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMICameraVideoFrameResult *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      id v6 = [(HMICameraVideoFrameResult *)self frame];
      double v7 = [(HMICameraVideoFrameResult *)v5 frame];
      int v8 = [v6 isEqual:v7];

      double v9 = [(HMICameraVideoFrameResult *)self analyzerEvents];
      double v10 = [(HMICameraVideoFrameResult *)v5 analyzerEvents];

      int v11 = v8 & [v9 isEqualToSet:v10];
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  double v3 = [(HMICameraVideoFrameResult *)self frame];
  uint64_t v4 = [v3 hash];
  double v5 = [(HMICameraVideoFrameResult *)self analyzerEvents];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

@end