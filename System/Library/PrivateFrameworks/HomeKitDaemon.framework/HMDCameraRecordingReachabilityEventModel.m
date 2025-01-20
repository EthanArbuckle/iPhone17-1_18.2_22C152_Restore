@interface HMDCameraRecordingReachabilityEventModel
+ (id)hmbExternalRecordType;
+ (id)hmbProperties;
- (BOOL)reachable;
- (id)createEvent;
- (void)setReachable:(BOOL)a3;
@end

@implementation HMDCameraRecordingReachabilityEventModel

+ (id)hmbExternalRecordType
{
  return @"CameraClip";
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_144588 != -1) {
    dispatch_once(&hmbProperties_onceToken_144588, &__block_literal_global_144589);
  }
  v2 = (void *)hmbProperties__properties_144590;
  return v2;
}

void __57__HMDCameraRecordingReachabilityEventModel_hmbProperties__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"dateOfOccurrence";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v4[1] = @"reachableField";
  v5[0] = v0;
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)hmbProperties__properties_144590;
  hmbProperties__properties_144590 = v2;
}

- (id)createEvent
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(HMDCameraRecordingReachabilityEventModel *)self dateOfOccurrence];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F0E1F8]);
    v5 = [(HMBModel *)self hmbModelID];
    v6 = [(HMDCameraRecordingReachabilityEventModel *)self dateOfOccurrence];
    v7 = objc_msgSend(v4, "initWithUniqueIdentifier:dateOfOccurrence:reachable:", v5, v6, -[HMDCameraRecordingReachabilityEventModel reachable](self, "reachable"));
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [(HMBModel *)v9 debugDescription];
      int v14 = 138543618;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot create reachability event from model: %@", (uint8_t *)&v14, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)reachable
{
  uint64_t v2 = [(HMDCameraRecordingReachabilityEventModel *)self reachableField];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setReachable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HMDCameraRecordingReachabilityEventModel *)self setReachableField:v4];
}

@end