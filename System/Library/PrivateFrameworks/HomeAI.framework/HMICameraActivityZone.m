@interface HMICameraActivityZone
+ (BOOL)supportsSecureCoding;
+ (id)activityZonesFromString:(id)a3 isInclusion:(BOOL)a4;
+ (id)filterEvents:(id)a3 withActivityZones:(id)a4 motionDetection:(id)a5 insetPercentageInclusion:(float)a6 insetPercentageExclusion:(float)a7;
+ (void)generateAndSubmitStats:(id)a3 filteredEvents:(id)a4 motionDetection:(id)a5 activityZones:(id)a6;
+ (void)submitCoreAnalyticsEvent:(id)a3 filteringLevel:(id)a4 numberOfDetectedObjects:(id)a5;
- (BOOL)checkIfObjectIsStaticWithBoundingBox:(CGRect)a3 motionDetection:(id)a4 eventClass:(Class)a5;
- (BOOL)containsEvent:(id)a3 withInsetPercentage:(float)a4;
- (BOOL)containsVectorWithSource:(CGPoint)a3 destination:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInclusion;
- (BOOL)overlapsWithElipseInsideRect:(CGRect)a3;
- (BOOL)overlapsWithElipseInsideRect:(CGRect)a3 withInsetPercentage:(float)a4;
- (BOOL)saveToJsonActivityZones:(id)a3 motionDetection:(id)a4 videoFragmentUrl:(id)a5 frameId:(id)a6 UUID:(id)a7 detectionID:(id)a8 zoneID:(id)a9;
- (HMICameraActivityZone)initWithCoder:(id)a3;
- (HMICameraActivityZone)initWithPoints:(id)a3;
- (HMICameraActivityZone)initWithPoints:(id)a3 isInclusion:(BOOL)a4;
- (NSArray)points;
- (NSString)description;
- (id)jsonReperesentaionOfDetectedObject:(id)a3 motionDetection:(id)a4 eventClass:(id)a5;
- (unint64_t)activityZoneType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMICameraActivityZone

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMICameraActivityZone)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"HMIAZ.p"];
  uint64_t v9 = [v5 decodeBoolForKey:@"HMIAZ.i"];

  v10 = [(HMICameraActivityZone *)self initWithPoints:v8 isInclusion:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(HMICameraActivityZone *)self points];
  [v5 encodeObject:v4 forKey:@"HMIAZ.p"];

  objc_msgSend(v5, "encodeBool:forKey:", -[HMICameraActivityZone isInclusion](self, "isInclusion"), @"HMIAZ.i");
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMICameraActivityZone *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(HMICameraActivityZone *)self points];
      v7 = [(HMICameraActivityZone *)v5 points];
      char v8 = [(id)v6 isEqualToArray:v7];

      BOOL v9 = [(HMICameraActivityZone *)self isInclusion];
      LOBYTE(v6) = [(HMICameraActivityZone *)v5 isInclusion];

      char v10 = v8 & (v9 ^ v6 ^ 1);
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(HMICameraActivityZone *)self points];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMICameraActivityZone)initWithPoints:(id)a3 isInclusion:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMICameraActivityZone;
  v7 = [(HMICameraActivityZone *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    points = v7->_points;
    v7->_points = (NSArray *)v8;

    v7->_inclusion = a4;
  }

  return v7;
}

- (HMICameraActivityZone)initWithPoints:(id)a3
{
  return [(HMICameraActivityZone *)self initWithPoints:a3 isInclusion:1];
}

- (unint64_t)activityZoneType
{
  unint64_t v3 = [(HMICameraActivityZone *)self points];
  if ([v3 count] == 5)
  {
    BOOL v4 = [(HMICameraActivityZone *)self isInclusion];

    if (!v4) {
      return 2;
    }
  }
  else
  {
  }
  return [(HMICameraActivityZone *)self isInclusion] ^ 1;
}

- (BOOL)overlapsWithElipseInsideRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat MidX = CGRectGetMidX(a3);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  v61.size.double width = width;
  v61.size.CGFloat height = height;
  v70.size.double width = width;
  v70.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v70);
  uint64_t v10 = [(HMICameraActivityZone *)self points];
  objc_super v11 = HMICreatePathFromPoints((void *)v10);

  double v65 = MidY;
  double v66 = MidX;
  v68.CGFloat x = MidX;
  v68.CGFloat y = MidY;
  LOBYTE(v10) = CGPathContainsPoint(v11, 0, v68, 0);
  CGPathRelease(v11);
  if (v10) {
    return 1;
  }
  v13 = [(HMICameraActivityZone *)self points];
  uint64_t v14 = [v13 count];

  if (v14 != 1)
  {
    float v15 = width * 0.5;
    float v16 = v61.size.height * 0.5;
    float v67 = v15 * v15;
    float v63 = v16 * v16;
    double v62 = v16;
    for (uint64_t i = 1; v14 != i; ++i)
    {
      v18 = [(HMICameraActivityZone *)self points];
      v19 = [v18 objectAtIndexedSubscript:i - 1];
      [v19 point];
      double v21 = v20 - v66;
      v22 = [(HMICameraActivityZone *)self points];
      v23 = [v22 objectAtIndexedSubscript:i - 1];
      [v23 point];
      double v25 = v24 - v65;

      v26 = [(HMICameraActivityZone *)self points];
      v27 = [v26 objectAtIndexedSubscript:i];
      [v27 point];
      double v29 = v28 - v66;
      v30 = [(HMICameraActivityZone *)self points];
      v31 = [v30 objectAtIndexedSubscript:i];
      [v31 point];
      double v33 = v32 - v65;

      if (vabdd_f64(v21, v29) >= 0.000001)
      {
        float v39 = (v25 - v33) / (v21 - v29);
        float v40 = v25 - v39 * v21;
        float v41 = v63 + (float)(v67 * (float)(v39 * v39));
        float v42 = (float)((float)(v67 + v67) * v39) * v40;
        float v43 = (float)((float)(v41 * -4.0) * (float)(v67 * (float)((float)(v40 * v40) - v63))) + (float)(v42 * v42);
        if (v43 < 0.0) {
          continue;
        }
        double v44 = (float)-v42;
        double v45 = sqrt(v43);
        double v46 = (float)(v41 + v41);
        float v38 = (v45 + v44) / v46;
        float v34 = (v44 - v45) / v46;
        float v36 = v40 + (float)(v38 * v39);
        float v64 = v40 + (float)(v34 * v39);
      }
      else
      {
        float v34 = v21;
        if ((float)(v34 * v34) > v67) {
          continue;
        }
        double v35 = (1.0 - sqrt((float)((float)(v34 * v34) / v67))) * v62;
        float v36 = v35;
        float v37 = -v35;
        float v64 = v37;
        float v38 = v21;
      }
      if (v21 >= v29) {
        double v47 = v29;
      }
      else {
        double v47 = v21;
      }
      float v48 = v47;
      if (v21 >= v29) {
        double v49 = v21;
      }
      else {
        double v49 = v29;
      }
      float v50 = v49;
      if (v25 >= v33) {
        double v51 = v33;
      }
      else {
        double v51 = v25;
      }
      if (v25 < v33) {
        double v25 = v33;
      }
      BOOL v52 = HMILessThanOrEqualWithAccuracy(v38, v50, 0.001) && HMIGreaterThanOrEqualWithAccuracy(v38, v48, 0.001);
      float v53 = v25;
      if (HMILessThanOrEqualWithAccuracy(v36, v53, 0.001))
      {
        float v54 = v51;
        if (v52 & HMIGreaterThanOrEqualWithAccuracy(v36, v54, 0.001)) {
          return 1;
        }
      }
      BOOL v55 = HMILessThanOrEqualWithAccuracy(v34, v50, 0.001) && HMIGreaterThanOrEqualWithAccuracy(v34, v48, 0.001);
      if (HMILessThanOrEqualWithAccuracy(v64, v53, 0.001))
      {
        float v56 = v51;
        if (v55 & HMIGreaterThanOrEqualWithAccuracy(v64, v56, 0.001)) {
          return 1;
        }
      }
    }
  }
  v57 = CGPathCreateWithRect(v61, 0);
  v58 = [(HMICameraActivityZone *)self points];
  v59 = [v58 objectAtIndexedSubscript:0];
  [v59 point];
  BOOL v60 = CGPathContainsPoint(v57, 0, v69, 0);

  CGPathRelease(v57);
  return v60;
}

- (BOOL)overlapsWithElipseInsideRect:(CGRect)a3 withInsetPercentage:(float)a4
{
  double v5 = HMICGRectScaleAroundCenter(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  return [(HMICameraActivityZone *)self overlapsWithElipseInsideRect:v5];
}

- (NSString)description
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@", objc_opt_class()];
  objc_msgSend(v3, "appendFormat:", @" isInclusion:%d ", -[HMICameraActivityZone isInclusion](self, "isInclusion"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = [(HMICameraActivityZone *)self points];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@" %@", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];
  BOOL v9 = (void *)[v3 copy];

  return (NSString *)v9;
}

- (id)jsonReperesentaionOfDetectedObject:(id)a3 motionDetection:(id)a4 eventClass:(id)a5
{
  v55[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(HMICameraActivityZone *)self activityZoneType])
  {
    float v13 = 0.21;
    LODWORD(v12) = 1045891645;
    BOOL v14 = [(HMICameraActivityZone *)self containsEvent:v8 withInsetPercentage:v12];
  }
  else
  {
    [v8 boundingBox];
    float v13 = 0.16;
    if (-[HMICameraActivityZone overlapsWithElipseInsideRect:withInsetPercentage:](self, "overlapsWithElipseInsideRect:withInsetPercentage:"))
    {
      [v8 boundingBox];
      BOOL v14 = -[HMICameraActivityZone checkIfObjectIsStaticWithBoundingBox:motionDetection:eventClass:](self, "checkIfObjectIsStaticWithBoundingBox:motionDetection:eventClass:", v9, objc_opt_class(), v15, v16, v17, v18) ^ 1;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  [v8 boundingBox];
  double v23 = HMICGRectScaleAroundCenter(v19, v20, v21, v22, v13);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  uint64_t v30 = objc_opt_class();
  if (v30 == objc_opt_class() && [(HMICameraActivityZone *)self activityZoneType] == 2)
  {
    double v23 = HMICGRectDivideAlongHeight(v23, v25, v27, v29, 0.7);
    CGFloat v25 = v31;
    CGFloat v27 = v32;
    CGFloat v29 = v33;
  }
  v55[0] = v10;
  v54[0] = @"class-label";
  v54[1] = @"coordinates";
  v58.origin.CGFloat x = v23;
  v58.origin.CGFloat y = v25;
  v58.size.double width = v27;
  v58.size.CGFloat height = v29;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v58);
  v55[1] = DictionaryRepresentation;
  v54[2] = @"overlap";
  double v35 = [NSNumber numberWithBool:v14];
  v55[2] = v35;
  v54[3] = @"inclusion";
  float v36 = objc_msgSend(NSNumber, "numberWithBool:", -[HMICameraActivityZone isInclusion](self, "isInclusion"));
  v55[3] = v36;
  float v37 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
  [v11 addObject:v37];

  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  float v39 = [(HMICameraActivityZone *)self points];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(v39);
        }
        [*(id *)(*((void *)&v47 + 1) + 8 * i) point];
        CFDictionaryRef v44 = CGPointCreateDictionaryRepresentation(v57);
        [v38 addObject:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v41);
  }

  double v51 = @"activityZone";
  id v52 = v38;
  double v45 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  [v11 addObject:v45];

  return v11;
}

- (BOOL)containsEvent:(id)a3 withInsetPercentage:(float)a4
{
  id v6 = a3;
  [v6 boundingBox];
  double v11 = HMICGRectScaleAroundCenter(v7, v8, v9, v10, a4);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  uint64_t v18 = objc_opt_class();

  if (v18 == objc_opt_class() && [(HMICameraActivityZone *)self activityZoneType] == 2)
  {
    double v11 = HMICGRectDivideAlongHeight(v11, v13, v15, v17, 0.7);
    CGFloat v13 = v19;
    CGFloat v15 = v20;
    CGFloat v17 = v21;
  }
  CGFloat v22 = [(HMICameraActivityZone *)self points];
  double v23 = HMICreatePathFromPoints(v22);

  v28.CGFloat x = v11;
  v28.CGFloat y = v13;
  BOOL v24 = 0;
  if (CGPathContainsPoint(v23, 0, v28, 0))
  {
    double v25 = v11 + v15;
    v29.CGFloat x = v25;
    v29.CGFloat y = v13;
    BOOL v24 = 0;
    if (CGPathContainsPoint(v23, 0, v29, 0))
    {
      double v26 = v13 + v17;
      v30.CGFloat x = v25;
      v30.CGFloat y = v26;
      BOOL v24 = 0;
      if (CGPathContainsPoint(v23, 0, v30, 0))
      {
        v31.CGFloat x = v11;
        v31.CGFloat y = v26;
        BOOL v24 = CGPathContainsPoint(v23, 0, v31, 0);
      }
    }
  }
  CGPathRelease(v23);
  return v24;
}

- (BOOL)saveToJsonActivityZones:(id)a3 motionDetection:(id)a4 videoFragmentUrl:(id)a5 frameId:(id)a6 UUID:(id)a7 detectionID:(id)a8 zoneID:(id)a9
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v67 = a8;
  id v20 = a9;
  double v66 = +[HMIVideoAnalyzerEvent shortNameForEventClass:objc_opt_class()];
  double v21 = [v17 absoluteString];
  LODWORD(a7) = [v21 hasPrefix:@"HKD://"];

  id v63 = v19;
  CGRect v61 = v17;
  if (a7)
  {
    id v22 = v19;
  }
  else
  {
    double v23 = [v17 lastPathComponent];
    id v22 = [v23 stringByDeletingPathExtension];
  }
  float v64 = v18;
  double v62 = v22;
  BOOL v24 = [NSString stringWithFormat:@"%@-%@-%@-%@.json", v22, v18, v20, v67];
  double v25 = NSString;
  double v26 = NSTemporaryDirectory();
  CGFloat v27 = [v25 stringWithFormat:@"%@/%@", v26, @"analyzed-video-frames"];

  CGPoint v28 = [MEMORY[0x263F08850] defaultManager];
  id v70 = 0;
  char v29 = [v28 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:&v70];
  id v30 = v70;

  double v65 = v16;
  if (v29)
  {
    CGRect v58 = v24;
    id v59 = v20;
    CGPoint v31 = [NSString stringWithFormat:@"%@/activityzone-%@", v27, v24];
    double v32 = (void *)MEMORY[0x22A641C70]();
    double v33 = self;
    float v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      double v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v72 = v35;
      __int16 v73 = 2112;
      id v74 = v31;
      _os_log_impl(&dword_225DC6000, v34, OS_LOG_TYPE_INFO, "%{public}@Activity zone file path:%@", buf, 0x16u);
    }
    id v60 = v15;
    float v36 = [(HMICameraActivityZone *)v33 jsonReperesentaionOfDetectedObject:v15 motionDetection:v16 eventClass:v66];
    id v69 = v30;
    float v37 = [MEMORY[0x263F08900] dataWithJSONObject:v36 options:1 error:&v69];
    id v38 = v69;

    if (v37)
    {
      float v39 = (void *)[[NSString alloc] initWithData:v37 encoding:4];
      uint64_t v40 = [NSURL fileURLWithPath:v31];
      id v68 = v38;
      char v41 = [v39 writeToURL:v40 atomically:1 encoding:4 error:&v68];
      id v42 = v68;

      if ((v41 & 1) == 0)
      {
        context = (void *)MEMORY[0x22A641C70]();
        float v43 = v33;
        CFDictionaryRef v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          float v56 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v72 = v56;
          __int16 v73 = 2112;
          id v74 = v42;
          _os_log_impl(&dword_225DC6000, v44, OS_LOG_TYPE_ERROR, "%{public}@Error writing activity zone results JSON to file: %@", buf, 0x16u);
        }
      }

      id v38 = v42;
    }
    else
    {
      double v51 = (void *)MEMORY[0x22A641C70]();
      id v52 = v33;
      float v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        float v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v72 = v54;
        __int16 v73 = 2112;
        id v74 = v38;
        _os_log_impl(&dword_225DC6000, v53, OS_LOG_TYPE_ERROR, "%{public}@Error converting activity zone results to JSON: %@", buf, 0x16u);
      }
      char v41 = 0;
    }

    id v30 = v38;
    id v20 = v59;
    id v15 = v60;
    long long v50 = v63;
    BOOL v24 = v58;
  }
  else
  {
    double v45 = (void *)MEMORY[0x22A641C70]();
    double v46 = self;
    long long v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = id v48 = v20;
      *(_DWORD *)buf = 138543618;
      v72 = v49;
      __int16 v73 = 2112;
      id v74 = v30;
      _os_log_impl(&dword_225DC6000, v47, OS_LOG_TYPE_ERROR, "%{public}@Error creating activity zone result directory: %@", buf, 0x16u);

      id v20 = v48;
    }

    char v41 = 0;
    long long v50 = v63;
  }

  return v41;
}

- (BOOL)checkIfObjectIsStaticWithBoundingBox:(CGRect)a3 motionDetection:(id)a4 eventClass:(Class)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v11 = a4;
  if ((Class)objc_opt_class() != a5) {
    goto LABEL_25;
  }
  double v12 = [MEMORY[0x263EFF980] array];
  CGFloat v13 = [(HMICameraActivityZone *)self points];
  double v14 = HMICreatePathFromPoints(v13);

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v15 = [v11 motionVectors];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [v20 target];
        if (CGPathContainsPoint(v14, 0, v55, 0)) {
          [v12 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v17);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v21 = v12;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    float v25 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        CGFloat v27 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        objc_msgSend(v27, "target", (void)v40);
        v56.CGFloat x = v28;
        v56.CGFloat y = v29;
        v57.origin.CGFloat x = x;
        v57.origin.CGFloat y = y;
        v57.size.double width = width;
        v57.size.double height = height;
        if (CGRectContainsPoint(v57, v56))
        {
          [v27 motion];
          long double v31 = v30;
          [v27 motion];
          float v25 = hypot(v31, v32) + v25;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v23);
  }
  else
  {
    float v25 = 0.0;
  }

  CGPathRelease(v14);
  float v33 = v25 / (height * width + 0.00000011920929);
  float v34 = (void *)MEMORY[0x22A641C70]();
  double v35 = self;
  float v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    float v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v49 = v37;
    __int16 v50 = 2048;
    double v51 = v33;
    _os_log_impl(&dword_225DC6000, v36, OS_LOG_TYPE_DEBUG, "%{public}@motionScore %f", buf, 0x16u);
  }

  if (v33 < 1.0) {
    BOOL v38 = 1;
  }
  else {
LABEL_25:
  }
    BOOL v38 = 0;

  return v38;
}

- (BOOL)containsVectorWithSource:(CGPoint)a3 destination:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  CGFloat v8 = [(HMICameraActivityZone *)self points];
  CGFloat v9 = HMICreatePathFromPoints(v8);

  v12.CGFloat x = v7;
  v12.CGFloat y = v6;
  BOOL v10 = 0;
  if (CGPathContainsPoint(v9, 0, v12, 0))
  {
    v13.CGFloat x = x;
    v13.CGFloat y = y;
    BOOL v10 = CGPathContainsPoint(v9, 0, v13, 0);
  }
  CGPathRelease(v9);
  return v10;
}

+ (id)filterEvents:(id)a3 withActivityZones:(id)a4 motionDetection:(id)a5 insetPercentageInclusion:(float)a6 insetPercentageExclusion:(float)a7
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v12 count])
  {
    double v14 = [v12 firstObject];
    int v15 = [v14 isInclusion];

    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __122__HMICameraActivityZone_filterEvents_withActivityZones_motionDetection_insetPercentageInclusion_insetPercentageExclusion___block_invoke;
    v78[3] = &__block_descriptor_33_e31_B16__0__HMICameraActivityZone_8l;
    int v59 = v15;
    char v79 = v15;
    objc_msgSend(v12, "na_all:", v78);
    CGRect v58 = [MEMORY[0x263EFF9C0] set];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v56 = v11;
    obuint64_t j = v11;
    id v61 = v12;
    id v63 = (id)[obj countByEnumeratingWithState:&v74 objects:v92 count:16];
    if (v63)
    {
      uint64_t v62 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v63; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v75 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v18 = v12;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v91 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v71;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v71 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                if (objc_msgSend(v23, "activityZoneType", v56))
                {
                  *(float *)&double v24 = a7;
                  if ([v23 containsEvent:v17 withInsetPercentage:v24])
                  {
                    CGFloat v29 = (void *)MEMORY[0x22A641C70]();
                    id v30 = a1;
                    long double v31 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                    {
                      float v33 = HMFGetLogIdentifier();
                      uint64_t v34 = objc_opt_class();
                      [v17 boundingBox];
                      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v95);
                      *(_DWORD *)buf = 138544386;
                      v82 = v33;
                      __int16 v83 = 2112;
                      uint64_t v84 = (uint64_t)v23;
                      __int16 v85 = 2112;
                      uint64_t v86 = v34;
                      __int16 v87 = 2112;
                      double v88 = *(double *)&DictionaryRepresentation;
                      __int16 v89 = 2048;
                      double v90 = a7;
                      _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_INFO, "%{public}@Exclusion zone:%@ intersecting with:(%@) Object coordinate %@ insetThreshold %f", buf, 0x34u);
                    }

                    id v12 = v61;
                    goto LABEL_28;
                  }
                }
                else
                {
                  [v17 boundingBox];
                  if (objc_msgSend(v23, "overlapsWithElipseInsideRect:withInsetPercentage:"))
                  {
                    [v17 boundingBox];
                    if ((objc_msgSend(v23, "checkIfObjectIsStaticWithBoundingBox:motionDetection:eventClass:", v13, objc_opt_class(), v25, v26, v27, v28) & 1) == 0)
                    {
                      float v36 = (void *)MEMORY[0x22A641C70]();
                      id v37 = a1;
                      BOOL v38 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        float v39 = v57 = v36;
                        uint64_t v40 = objc_opt_class();
                        [v17 boundingBox];
                        CFDictionaryRef v41 = CGRectCreateDictionaryRepresentation(v96);
                        *(_DWORD *)buf = 138544386;
                        v82 = v39;
                        __int16 v83 = 2112;
                        uint64_t v84 = (uint64_t)v23;
                        __int16 v85 = 2112;
                        uint64_t v86 = v40;
                        __int16 v87 = 2112;
                        double v88 = *(double *)&v41;
                        __int16 v89 = 2048;
                        double v90 = a6;
                        _os_log_impl(&dword_225DC6000, v38, OS_LOG_TYPE_INFO, "%{public}@Inclusion zone:%@ intersecting with:(%@) Object coordinate %@ insetThreshold %f", buf, 0x34u);

                        float v36 = v57;
                      }

                      id v12 = v61;
                      goto LABEL_27;
                    }
                  }
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v70 objects:v91 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          if ((v59 & 1) == 0) {
LABEL_27:
          }
            objc_msgSend(v58, "addObject:", v17, v56);
LABEL_28:
          ;
        }
        id v63 = (id)[obj countByEnumeratingWithState:&v74 objects:v92 count:16];
      }
      while (v63);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v64 = v58;
    uint64_t v42 = [v64 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v67;
      if (v59) {
        float v45 = a6;
      }
      else {
        float v45 = a7;
      }
      double v46 = v45;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v67 != v44) {
            objc_enumerationMutation(v64);
          }
          id v48 = *(void **)(*((void *)&v66 + 1) + 8 * k);
          long long v49 = (void *)MEMORY[0x22A641C70]();
          id v50 = a1;
          double v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            id v52 = HMFGetLogIdentifier();
            uint64_t v53 = objc_opt_class();
            [v48 boundingBox];
            CFDictionaryRef v54 = CGRectCreateDictionaryRepresentation(v97);
            *(_DWORD *)buf = 138544130;
            v82 = v52;
            __int16 v83 = 2112;
            uint64_t v84 = v53;
            __int16 v85 = 2112;
            uint64_t v86 = (uint64_t)v54;
            __int16 v87 = 2048;
            double v88 = v46;
            _os_log_impl(&dword_225DC6000, v51, OS_LOG_TYPE_INFO, "%{public}@Events after activity zone filtering:(%@) Object coordinate %@ insetPercentage %f", buf, 0x2Au);
          }
        }
        uint64_t v43 = [v64 countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v43);
    }

    id v11 = v56;
    id v12 = v61;
  }
  else
  {
    id v64 = v11;
  }

  return v64;
}

BOOL __122__HMICameraActivityZone_filterEvents_withActivityZones_motionDetection_insetPercentageInclusion_insetPercentageExclusion___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == [a2 isInclusion];
}

+ (id)activityZonesFromString:(id)a3 isInclusion:(BOOL)a4
{
  BOOL v31 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"{}"];
  CGFloat v29 = v4;
  CGFloat v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v6;
  uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(obj);
        }
        CGFloat v8 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v8 length])
        {
          uint64_t v35 = i;
          CGFloat v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"()"];
          BOOL v10 = [v8 componentsSeparatedByCharactersInSet:v9];

          id v11 = [MEMORY[0x263EFF980] array];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v12 = v10;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v37;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v37 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                if ([v17 length])
                {
                  id v18 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@","];
                  uint64_t v19 = [v17 componentsSeparatedByCharactersInSet:v18];

                  uint64_t v20 = [HMIPoint alloc];
                  uint64_t v21 = [v19 objectAtIndexedSubscript:0];
                  [v21 doubleValue];
                  double v23 = v22;
                  double v24 = [v19 objectAtIndexedSubscript:1];
                  [v24 doubleValue];
                  double v26 = -[HMIPoint initWithPoint:](v20, "initWithPoint:", v23, v25);

                  [v11 addObject:v26];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v14);
          }

          double v27 = [[HMICameraActivityZone alloc] initWithPoints:v11 isInclusion:v31];
          [v32 addObject:v27];

          uint64_t i = v35;
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v34);
  }

  return v32;
}

+ (void)submitCoreAnalyticsEvent:(id)a3 filteringLevel:(id)a4 numberOfDetectedObjects:(id)a5
{
  CGFloat v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 dictionary];
  [v11 setObject:v10 forKeyedSubscript:@"zoneType"];

  [v11 setObject:v9 forKeyedSubscript:@"filteringLevel"];
  [v11 setObject:v8 forKeyedSubscript:@"numDetectedObjects"];

  id v12 = v11;
  AnalyticsSendEventLazy();
}

id __89__HMICameraActivityZone_submitCoreAnalyticsEvent_filteringLevel_numberOfDetectedObjects___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)generateAndSubmitStats:(id)a3 filteredEvents:(id)a4 motionDetection:(id)a5 activityZones:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 firstObject];
  int v15 = [v14 isInclusion];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  if (v15)
  {
    uint64_t v17 = @"inclusion";
    [a1 submitCoreAnalyticsEvent:@"inclusion" filteringLevel:@"noFiltering" numberOfDetectedObjects:v16];

    id v18 = NSNumber;
    uint64_t v19 = [v12 count];

    uint64_t v20 = [v18 numberWithUnsignedInteger:v19];
    [a1 submitCoreAnalyticsEvent:@"inclusion" filteringLevel:@"resize_0" numberOfDetectedObjects:v20];

    LODWORD(v21) = 1028443341;
    double v22 = [a1 filterEvents:v13 withActivityZones:v10 motionDetection:v11 insetPercentageInclusion:v21 insetPercentageExclusion:0.0];
    double v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    [a1 submitCoreAnalyticsEvent:@"inclusion" filteringLevel:@"resize_10" numberOfDetectedObjects:v23];

    LODWORD(v24) = 1036831949;
    id v34 = [a1 filterEvents:v13 withActivityZones:v10 motionDetection:v11 insetPercentageInclusion:v24 insetPercentageExclusion:0.0];

    double v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
    double v26 = @"resize_20";
  }
  else
  {
    uint64_t v17 = @"exclusion";
    [a1 submitCoreAnalyticsEvent:@"exclusion" filteringLevel:@"noFiltering" numberOfDetectedObjects:v16];

    double v27 = NSNumber;
    uint64_t v28 = [v12 count];

    CGFloat v29 = [v27 numberWithUnsignedInteger:v28];
    [a1 submitCoreAnalyticsEvent:@"exclusion" filteringLevel:@"resize_20" numberOfDetectedObjects:v29];

    LODWORD(v30) = 1040522936;
    BOOL v31 = [a1 filterEvents:v13 withActivityZones:v10 motionDetection:v11 insetPercentageInclusion:0.0 insetPercentageExclusion:v30];
    id v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
    [a1 submitCoreAnalyticsEvent:@"exclusion" filteringLevel:@"resize_26" numberOfDetectedObjects:v32];

    LODWORD(v33) = 1043878380;
    id v34 = [a1 filterEvents:v13 withActivityZones:v10 motionDetection:v11 insetPercentageInclusion:0.0 insetPercentageExclusion:v33];

    double v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
    double v26 = @"resize_36";
  }
  [a1 submitCoreAnalyticsEvent:v17 filteringLevel:v26 numberOfDetectedObjects:v25];
}

- (NSArray)points
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isInclusion
{
  return self->_inclusion;
}

- (void).cxx_destruct
{
}

@end