@interface HMIVideoAnalyzerEvent
+ (BOOL)supportsSecureCoding;
+ (Class)eventClassForShortName:(id)a3;
+ (NSArray)eventClassesArray;
+ (NSSet)eventClasses;
+ (id)defaultConfidenceThreshold:(Class)a3 confidenceLevel:(int64_t)a4;
+ (id)defaultConfidenceThresholdsFeedback;
+ (id)defaultConfidenceThresholdsHigh;
+ (id)defaultConfidenceThresholdsMedium;
+ (id)eventConfidenceThresholdsHigh;
+ (id)eventConfidenceThresholdsMedium;
+ (id)eventsWithContentsOfFile:(id)a3;
+ (id)rgbColorCodeForEventClass:(Class)a3;
+ (id)shortNameForEventClass:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingBox;
- (HMIConfidence)confidence;
- (HMIVideoAnalyzerEvent)initWithCoder:(id)a3;
- (HMIVideoAnalyzerEvent)initWithConfidence:(id)a3 boundingBox:(CGRect)a4;
- (HMIVideoAnalyzerEvent)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 userInfo:(id)a5;
- (NSArray)allEvents;
- (NSDictionary)userInfo;
- (NSString)description;
- (id)attributeDescriptions;
- (id)shortDescription;
- (int64_t)confidenceLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerEvent

+ (NSArray)eventClassesArray
{
  if (eventClassesArray_onceToken != -1) {
    dispatch_once(&eventClassesArray_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)eventClassesArray_classes;
  return (NSArray *)v2;
}

void __42__HMIVideoAnalyzerEvent_eventClassesArray__block_invoke()
{
  v2[7] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:7];
  v1 = (void *)eventClassesArray_classes;
  eventClassesArray_classes = v0;
}

+ (NSSet)eventClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a1 eventClassesArray];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (HMIVideoAnalyzerEvent)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  return -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](self, "initWithConfidence:boundingBox:userInfo:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEvent)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 userInfo:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  if (v12)
  {
    v14 = v13;
    v20.receiver = self;
    v20.super_class = (Class)HMIVideoAnalyzerEvent;
    v15 = [(HMIVideoAnalyzerEvent *)&v20 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_confidence, a3);
      v16->_boundingBox.origin.CGFloat x = x;
      v16->_boundingBox.origin.CGFloat y = y;
      v16->_boundingBox.size.CGFloat width = width;
      v16->_boundingBox.size.CGFloat height = height;
      objc_storeStrong((id *)&v16->_userInfo, a5);
    }

    return v16;
  }
  else
  {
    v18 = (HMIVideoAnalyzerEvent *)_HMFPreconditionFailure();
    return (HMIVideoAnalyzerEvent *)[(HMIVideoAnalyzerEvent *)v18 allEvents];
  }
}

- (NSArray)allEvents
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (id)attributeDescriptions
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = NSNumber;
  v5 = [(HMIVideoAnalyzerEvent *)self confidence];
  [v5 value];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)[v3 initWithName:@"Confidence" value:v6];
  v13[0] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoAnalyzerEvent *)self boundingBox];
  v9 = NSStringFromRect(v15);
  v10 = (void *)[v8 initWithName:@"Bounding Box" value:v9];
  v13[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v11;
}

- (id)shortDescription
{
  id v3 = NSString;
  v4 = +[HMIVideoAnalyzerEvent shortNameForEventClass:objc_opt_class()];
  [(HMIVideoAnalyzerEvent *)self boundingBox];
  v9 = HMICGRectDescription(v5, v6, v7, v8);
  v10 = [(HMIVideoAnalyzerEvent *)self confidence];
  v11 = [v10 shortDescription];
  id v12 = [v3 stringWithFormat:@"P(%@|[%@])=%@", v4, v9, v11];

  return v12;
}

- (int64_t)confidenceLevel
{
  v2 = [(HMIVideoAnalyzerEvent *)self confidence];
  int64_t v3 = [v2 level];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMIVideoAnalyzerEvent *)a3;
  if (v4 == self)
  {
    LOBYTE(v25) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double v6 = [(HMIVideoAnalyzerEvent *)self confidence];
      double v7 = [(HMIVideoAnalyzerEvent *)v5 confidence];
      int v8 = HMFEqualObjects();

      [(HMIVideoAnalyzerEvent *)self boundingBox];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [(HMIVideoAnalyzerEvent *)v5 boundingBox];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;

      v27.origin.CGFloat x = v10;
      v27.origin.CGFloat y = v12;
      v27.size.CGFloat width = v14;
      v27.size.CGFloat height = v16;
      v28.origin.CGFloat x = v18;
      v28.origin.CGFloat y = v20;
      v28.size.CGFloat width = v22;
      v28.size.CGFloat height = v24;
      BOOL v25 = v8 & CGRectEqualToRect(v27, v28);
    }
    else
    {
      LOBYTE(v25) = 0;
    }
  }

  return v25;
}

- (unint64_t)hash
{
  int64_t v3 = [(HMIVideoAnalyzerEvent *)self confidence];
  uint64_t v4 = [v3 hash];
  [(HMIVideoAnalyzerEvent *)self boundingBox];
  unint64_t v9 = HMIHashCGRect(v5, v6, v7, v8) ^ v4;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerEvent)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = NSStringFromSelector(sel_confidence);
  double v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  double v8 = NSStringFromSelector(sel_boundingBox);
  [v4 decodeRectForKey:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = (void *)MEMORY[0x263EFFA08];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  CGFloat v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  double v19 = [v17 setWithArray:v18];
  CGFloat v20 = NSStringFromSelector(sel_userInfo);
  double v21 = [v4 decodeObjectOfClasses:v19 forKey:v20];

  CGFloat v22 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](self, "initWithConfidence:boundingBox:userInfo:", v7, v21, v10, v12, v14, v16);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMIVideoAnalyzerEvent *)self confidence];
  double v6 = NSStringFromSelector(sel_confidence);
  [v4 encodeObject:v5 forKey:v6];

  [(HMIVideoAnalyzerEvent *)self boundingBox];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = NSStringFromSelector(sel_boundingBox);
  objc_msgSend(v4, "encodeRect:forKey:", v15, v8, v10, v12, v14);

  id v17 = [(HMIVideoAnalyzerEvent *)self userInfo];
  double v16 = NSStringFromSelector(sel_userInfo);
  [v4 encodeObject:v17 forKey:v16];
}

+ (id)eventsWithContentsOfFile:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v22 = 0;
    double v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4 options:0 error:&v22];
    id v8 = v22;
    if (v7)
    {
      v23[0] = @"Pet";
      v24[0] = objc_opt_class();
      v23[1] = @"Package";
      v24[1] = objc_opt_class();
      v23[2] = @"Person";
      v24[2] = objc_opt_class();
      v23[3] = @"Vehicle";
      void v24[3] = objc_opt_class();
      v23[4] = @"Face";
      v24[4] = objc_opt_class();
      v23[5] = @"Torso";
      v24[5] = objc_opt_class();
      v23[6] = @"Motion";
      v24[6] = objc_opt_class();
      v23[7] = @"Confidence";
      v24[7] = objc_opt_class();
      double v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:8];
      double v10 = (void *)MEMORY[0x263EFFA08];
      double v11 = +[HMIJSONUnarchiver objectWithJSONData:v7 classMap:v9];
      double v12 = [v10 setWithArray:v11];
    }
    else
    {
      id v17 = (void *)MEMORY[0x22A641C70]();
      id v18 = a1;
      double v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        CGFloat v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v26 = v20;
        __int16 v27 = 2112;
        id v28 = v4;
        __int16 v29 = 2112;
        id v30 = v8;
        _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot read events from file \"%@\", error: %@", buf, 0x20u);
      }
      double v12 = 0;
    }
  }
  else
  {
    double v13 = (void *)MEMORY[0x22A641C70]();
    id v14 = a1;
    double v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_ERROR, "%{public}@Events file \"%@\" does not exist.", buf, 0x16u);
    }
    double v12 = 0;
  }

  return v12;
}

+ (id)shortNameForEventClass:(Class)a3
{
  if (shortNameForEventClass__onceToken != -1) {
    dispatch_once(&shortNameForEventClass__onceToken, &__block_literal_global_58_0);
  }
  id v4 = (void *)shortNameForEventClass__map;
  return (id)[v4 objectForKeyedSubscript:a3];
}

void __48__HMIVideoAnalyzerEvent_shortNameForEventClass___block_invoke()
{
  v3[8] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = @"Event";
  v2[1] = objc_opt_class();
  v3[1] = @"Motion";
  v2[2] = objc_opt_class();
  v3[2] = @"Person";
  v2[3] = objc_opt_class();
  v3[3] = @"Pet";
  v2[4] = objc_opt_class();
  v3[4] = @"Package";
  v2[5] = objc_opt_class();
  v3[5] = @"Vehicle";
  v2[6] = objc_opt_class();
  v3[6] = @"Face";
  v2[7] = objc_opt_class();
  v3[7] = @"Torso";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)shortNameForEventClass__map;
  shortNameForEventClass__map = v0;
}

+ (Class)eventClassForShortName:(id)a3
{
  uint64_t v3 = eventClassForShortName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&eventClassForShortName__onceToken, &__block_literal_global_63);
  }
  uint64_t v5 = (void *)eventClassForShortName__map;
  char v6 = [v4 lowercaseString];

  double v7 = [v5 objectForKeyedSubscript:v6];

  return (Class)v7;
}

void __48__HMIVideoAnalyzerEvent_eventClassForShortName___block_invoke()
{
  v3[8] = *MEMORY[0x263EF8340];
  v2[0] = @"event";
  v3[0] = objc_opt_class();
  v2[1] = @"motion";
  v3[1] = objc_opt_class();
  v2[2] = @"person";
  v3[2] = objc_opt_class();
  v2[3] = @"pet";
  v3[3] = objc_opt_class();
  v2[4] = @"vehicle";
  v3[4] = objc_opt_class();
  v2[5] = @"package";
  v3[5] = objc_opt_class();
  v2[6] = @"face";
  v3[6] = objc_opt_class();
  v2[7] = @"torso";
  v3[7] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)eventClassForShortName__map;
  eventClassForShortName__map = v0;
}

+ (id)rgbColorCodeForEventClass:(Class)a3
{
  if (rgbColorCodeForEventClass__onceToken != -1) {
    dispatch_once(&rgbColorCodeForEventClass__onceToken, &__block_literal_global_89);
  }
  id v4 = (void *)rgbColorCodeForEventClass__map;
  return (id)[v4 objectForKeyedSubscript:a3];
}

void __51__HMIVideoAnalyzerEvent_rgbColorCodeForEventClass___block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = @"#D62728";
  v2[1] = objc_opt_class();
  v3[1] = @"#2CA02C";
  v2[2] = objc_opt_class();
  v3[2] = @"#1F77B4";
  v2[3] = objc_opt_class();
  v3[3] = @"#9467BD";
  v2[4] = objc_opt_class();
  v3[4] = @"#FF7F0E";
  v2[5] = objc_opt_class();
  v3[5] = @"#8C564B";
  v2[6] = objc_opt_class();
  v3[6] = @"#7F7F7F";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)rgbColorCodeForEventClass__map;
  rgbColorCodeForEventClass__map = v0;
}

+ (id)defaultConfidenceThresholdsFeedback
{
  if (defaultConfidenceThresholdsFeedback_onceToken != -1) {
    dispatch_once(&defaultConfidenceThresholdsFeedback_onceToken, &__block_literal_global_112);
  }
  v2 = (void *)defaultConfidenceThresholdsFeedback_confidenceThresholdsFeedback;
  return v2;
}

void __60__HMIVideoAnalyzerEvent_defaultConfidenceThresholdsFeedback__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  v3[0] = &unk_26D9A9AC0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)defaultConfidenceThresholdsFeedback_confidenceThresholdsFeedback;
  defaultConfidenceThresholdsFeedback_confidenceThresholdsFeedback = v0;
}

+ (id)defaultConfidenceThresholdsMedium
{
  if (defaultConfidenceThresholdsMedium_onceToken != -1) {
    dispatch_once(&defaultConfidenceThresholdsMedium_onceToken, &__block_literal_global_114);
  }
  uint64_t v2 = (void *)defaultConfidenceThresholdsMedium_confidenceThresholdsMedium;
  return v2;
}

void __58__HMIVideoAnalyzerEvent_defaultConfidenceThresholdsMedium__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = &unk_26D9A9AD0;
  v2[1] = objc_opt_class();
  v3[1] = &unk_26D9A9AE0;
  v2[2] = objc_opt_class();
  void v3[2] = &unk_26D9A9AF0;
  v2[3] = objc_opt_class();
  v3[3] = &unk_26D9A9B00;
  v2[4] = objc_opt_class();
  v3[4] = &unk_26D9A9B10;
  v2[5] = objc_opt_class();
  v3[5] = &unk_26D9A9B20;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)defaultConfidenceThresholdsMedium_confidenceThresholdsMedium;
  defaultConfidenceThresholdsMedium_confidenceThresholdsMedium = v0;
}

+ (id)defaultConfidenceThresholdsHigh
{
  if (defaultConfidenceThresholdsHigh_onceToken != -1) {
    dispatch_once(&defaultConfidenceThresholdsHigh_onceToken, &__block_literal_global_128);
  }
  uint64_t v2 = (void *)defaultConfidenceThresholdsHigh_confidenceThresholdsHigh;
  return v2;
}

void __56__HMIVideoAnalyzerEvent_defaultConfidenceThresholdsHigh__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = &unk_26D9A9B30;
  v2[1] = objc_opt_class();
  v3[1] = &unk_26D9A9B40;
  v2[2] = objc_opt_class();
  void v3[2] = &unk_26D9A9B50;
  v2[3] = objc_opt_class();
  v3[3] = &unk_26D9A9B00;
  v2[4] = objc_opt_class();
  v3[4] = &unk_26D9A9B10;
  v2[5] = objc_opt_class();
  v3[5] = &unk_26D9A9B20;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)defaultConfidenceThresholdsHigh_confidenceThresholdsHigh;
  defaultConfidenceThresholdsHigh_confidenceThresholdsHigh = v0;
}

+ (id)defaultConfidenceThreshold:(Class)a3 confidenceLevel:(int64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v5 = [a1 defaultConfidenceThresholdsMedium];
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    uint64_t v5 = [a1 defaultConfidenceThresholdsHigh];
LABEL_5:
    char v6 = v5;
    double v7 = [v5 objectForKeyedSubscript:a3];

    goto LABEL_7;
  }
  double v7 = 0;
LABEL_7:
  return v7;
}

+ (id)eventConfidenceThresholdsMedium
{
  if (eventConfidenceThresholdsMedium_onceToken != -1) {
    dispatch_once(&eventConfidenceThresholdsMedium_onceToken, &__block_literal_global_136_0);
  }
  uint64_t v3 = objc_msgSend((id)eventConfidenceThresholdsMedium_eventClassToConfidenceKey, "na_dictionaryByMappingValues:", &__block_literal_global_139);
  id v4 = [a1 defaultConfidenceThresholdsMedium];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 addEntriesFromDictionary:v3];
  return v5;
}

void __56__HMIVideoAnalyzerEvent_eventConfidenceThresholdsMedium__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = @"confidenceThresholdPersonMedium";
  v2[1] = objc_opt_class();
  v3[1] = @"confidenceThresholdPetMedium";
  v2[2] = objc_opt_class();
  void v3[2] = @"confidenceThresholdVehicleMedium";
  v2[3] = objc_opt_class();
  v3[3] = @"confidenceThresholdFaceMedium";
  v2[4] = objc_opt_class();
  v3[4] = @"confidenceThresholdTorsoMedium";
  v2[5] = objc_opt_class();
  v3[5] = @"confidenceThresholdPackageMedium";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)eventConfidenceThresholdsMedium_eventClassToConfidenceKey;
  eventConfidenceThresholdsMedium_eventClassToConfidenceKeCGFloat y = v0;
}

id __56__HMIVideoAnalyzerEvent_eventConfidenceThresholdsMedium__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = +[HMIPreference sharedInstance];
  uint64_t v5 = [v4 numberPreferenceForKey:v3];

  return v5;
}

+ (id)eventConfidenceThresholdsHigh
{
  if (eventConfidenceThresholdsHigh_onceToken != -1) {
    dispatch_once(&eventConfidenceThresholdsHigh_onceToken, &__block_literal_global_142);
  }
  id v3 = objc_msgSend((id)eventConfidenceThresholdsHigh_eventClassToConfidenceKey, "na_dictionaryByMappingValues:", &__block_literal_global_144);
  id v4 = [a1 defaultConfidenceThresholdsHigh];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 addEntriesFromDictionary:v3];
  return v5;
}

void __54__HMIVideoAnalyzerEvent_eventConfidenceThresholdsHigh__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = @"confidenceThresholdPersonHigh";
  v2[1] = objc_opt_class();
  v3[1] = @"confidenceThresholdPetHigh";
  v2[2] = objc_opt_class();
  void v3[2] = @"confidenceThresholdVehicleHigh";
  v2[3] = objc_opt_class();
  v3[3] = @"confidenceThresholdFaceHigh";
  v2[4] = objc_opt_class();
  v3[4] = @"confidenceThresholdTorsoHigh";
  v2[5] = objc_opt_class();
  v3[5] = @"confidenceThresholdPackageHigh";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)eventConfidenceThresholdsHigh_eventClassToConfidenceKey;
  eventConfidenceThresholdsHigh_eventClassToConfidenceKeCGFloat y = v0;
}

id __54__HMIVideoAnalyzerEvent_eventConfidenceThresholdsHigh__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = +[HMIPreference sharedInstance];
  uint64_t v5 = [v4 numberPreferenceForKey:v3];

  return v5;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
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

- (HMIConfidence)confidence
{
  return (HMIConfidence *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
}

@end