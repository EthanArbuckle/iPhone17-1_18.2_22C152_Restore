@interface HMDCameraSignificantEventNotificationModel
+ (id)hmbExternalRecordType;
+ (id)hmbProperties;
+ (id)hmbQueries;
+ (id)significantEventsBetweenDatesQueryWithIsAscending:(BOOL)a3;
- (id)createClipSignificantEventWithCameraProfileUUID:(id)a3 faceClassification:(id)a4;
@end

@implementation HMDCameraSignificantEventNotificationModel

+ (id)significantEventsBetweenDatesQueryWithIsAscending:(BOOL)a3
{
  BOOL v3 = a3;
  if (significantEventsBetweenDatesQueryWithIsAscending__onceToken != -1) {
    dispatch_once(&significantEventsBetweenDatesQueryWithIsAscending__onceToken, &__block_literal_global_40_40728);
  }
  v4 = &significantEventsBetweenDatesQueryWithIsAscending__ascendingQuery;
  if (!v3) {
    v4 = &significantEventsBetweenDatesQueryWithIsAscending__descendingQuery;
  }
  v5 = (void *)*v4;
  return v5;
}

void __96__HMDCameraSignificantEventNotificationModel_significantEventsBetweenDatesQueryWithIsAscending___block_invoke()
{
  v15[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F492D0];
  v14[0] = @"dateAfter";
  v1 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateOfOccurrence"];
  v14[1] = @"dateBefore";
  v15[0] = v1;
  v2 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateOfOccurrence"];
  v15[1] = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  uint64_t v4 = [v0 queryWithSQLPredicate:@"dateOfOccurrence >= :dateAfter AND dateOfOccurrence < :dateBefore ORDER BY dateOfOccurrence ASC" sequenceArgumentName:@"dateAfter" indexedProperties:&unk_26E473EE8 arguments:v3];
  v5 = (void *)significantEventsBetweenDatesQueryWithIsAscending__ascendingQuery;
  significantEventsBetweenDatesQueryWithIsAscending__ascendingQuery = v4;

  v6 = (void *)MEMORY[0x263F492D0];
  v12[0] = @"dateAfter";
  v7 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateOfOccurrence"];
  v12[1] = @"dateBefore";
  v13[0] = v7;
  v8 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateOfOccurrence"];
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = [v6 queryWithSQLPredicate:@"dateOfOccurrence > :dateAfter AND dateOfOccurrence <= :dateBefore ORDER BY dateOfOccurrence DESC" sequenceArgumentName:@"dateBefore" indexedProperties:&unk_26E473F00 arguments:v9];
  v11 = (void *)significantEventsBetweenDatesQueryWithIsAscending__descendingQuery;
  significantEventsBetweenDatesQueryWithIsAscending__descendingQuery = v10;
}

+ (id)hmbQueries
{
  v7[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 significantEventsBetweenDatesQueryWithIsAscending:1];
  v7[0] = v3;
  uint64_t v4 = [a1 significantEventsBetweenDatesQueryWithIsAscending:0];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)hmbExternalRecordType
{
  return @"CameraClipNotification";
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_40755 != -1) {
    dispatch_once(&hmbProperties_onceToken_40755, &__block_literal_global_40756);
  }
  v2 = (void *)hmbProperties__properties_40757;
  return v2;
}

void __59__HMDCameraSignificantEventNotificationModel_hmbProperties__block_invoke()
{
  v30[7] = *MEMORY[0x263EF8340];
  v29[0] = @"significantEvent";
  v24 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v30[0] = v24;
  v29[1] = @"dateOfOccurrence";
  v0 = (void *)MEMORY[0x263F492C0];
  uint64_t v1 = objc_opt_class();
  v23 = [MEMORY[0x263F492C8] queryableField];
  v28 = v23;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v21 = [v0 fieldWithClass:v1 options:v22];
  v30[1] = v21;
  v29[2] = @"timeOffsetWithinClip";
  v20 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v30[2] = v20;
  v29[3] = @"associatedClip";
  v2 = (void *)MEMORY[0x263F492C0];
  uint64_t v3 = objc_opt_class();
  v19 = [MEMORY[0x263F492C8] externalRecordField:@"r00"];
  v27 = v19;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  v5 = [v2 fieldWithClass:v3 options:v4];
  v30[3] = v5;
  v29[4] = @"heroFrameAsset";
  v6 = (void *)MEMORY[0x263F492C0];
  uint64_t v7 = objc_opt_class();
  v8 = [MEMORY[0x263F492C8] externalRecordField:@"a00"];
  v26 = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  uint64_t v10 = [v6 fieldWithClass:v7 options:v9];
  v30[4] = v10;
  v29[5] = @"faceCropAsset";
  v11 = (void *)MEMORY[0x263F492C0];
  uint64_t v12 = objc_opt_class();
  v13 = [MEMORY[0x263F492C8] externalRecordField:@"a01"];
  v25 = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  v15 = [v11 fieldWithClass:v12 options:v14];
  v30[5] = v15;
  v29[6] = @"confidenceLevel";
  v16 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v30[6] = v16;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];
  v18 = (void *)hmbProperties__properties_40757;
  hmbProperties__properties_40757 = v17;
}

- (id)createClipSignificantEventWithCameraProfileUUID:(id)a3 faceClassification:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v39 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  uint64_t v7 = [(HMDCameraSignificantEventNotificationModel *)self significantEvent];
  v8 = [(HMDCameraSignificantEventNotificationModel *)self dateOfOccurrence];
  v9 = [(HMDCameraSignificantEventNotificationModel *)self confidenceLevel];
  uint64_t v10 = [(HMDCameraSignificantEventNotificationModel *)self timeOffsetWithinClip];
  uint64_t v11 = [(HMDCameraSignificantEventNotificationModel *)self associatedClip];
  uint64_t v12 = (void *)v11;
  if (v7 && v8 && v9 && v10 && v11)
  {
    v37 = v8;
    id v13 = objc_alloc(MEMORY[0x263F0E1C0]);
    v14 = [(HMBModel *)self hmbModelID];
    uint64_t v15 = [v7 unsignedIntegerValue];
    uint64_t v16 = [v9 unsignedIntegerValue];
    [v10 doubleValue];
    double v18 = v17;
    [v12 hmbModelID];
    v19 = v12;
    v20 = v10;
    v21 = v9;
    v22 = v7;
    v24 = id v23 = v6;
    v25 = v13;
    v8 = v37;
    v26 = (void *)[v25 initWithUniqueIdentifier:v14 reason:v15 dateOfOccurrence:v37 confidenceLevel:v16 cameraProfileUUID:v23 faceClassification:v39 timeOffsetWithinClip:v18 clipUUID:v24];

    id v6 = v23;
    uint64_t v7 = v22;
    v9 = v21;
    uint64_t v10 = v20;
    uint64_t v12 = v19;
  }
  else
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      [(HMBModel *)v28 debugDescription];
      v38 = v12;
      v31 = v9;
      v32 = v8;
      v33 = v7;
      v35 = v34 = v27;
      *(_DWORD *)buf = 138543618;
      v41 = v30;
      __int16 v42 = 2112;
      v43 = v35;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot create significant event from model: %@", buf, 0x16u);

      v27 = v34;
      uint64_t v7 = v33;
      v8 = v32;
      v9 = v31;
      uint64_t v12 = v38;
    }
    v26 = 0;
  }

  return v26;
}

@end