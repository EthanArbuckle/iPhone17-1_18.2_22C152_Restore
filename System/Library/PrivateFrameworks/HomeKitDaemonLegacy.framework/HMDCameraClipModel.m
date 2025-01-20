@interface HMDCameraClipModel
+ (HMBModelCountMatchesQuery)countOfClipsWithQualityBetweenDatesQuery;
+ (HMBModelInfiniteQuery)clipsBeforeDateQuery;
+ (HMBModelInfiniteQuery)clipsWithNeedsUploadFeedbackStatusQuery;
+ (HMBModelInfiniteQuery)clipsWithQualityBetweenDatesAscendingQuery;
+ (HMBModelInfiniteQuery)clipsWithQualityBetweenDatesDescendingQuery;
+ (HMBModelInfiniteQuery)incompleteClipsQuery;
+ (NSUUID)sentinelParentUUID;
+ (id)hmbExternalRecordType;
+ (id)hmbProperties;
+ (id)hmbQueries;
+ (id)qualityPredicate;
- (id)createClipWithSignificantEvents:(id)a3;
- (int64_t)quality;
- (unint64_t)feedbackStatus;
- (void)setFeedbackStatus:(unint64_t)a3;
- (void)setQuality:(int64_t)a3;
@end

@implementation HMDCameraClipModel

+ (id)qualityPredicate
{
  return @"IFNULL(qualityField, X'0000000000000000') == :quality";
}

+ (HMBModelCountMatchesQuery)countOfClipsWithQualityBetweenDatesQuery
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HMDCameraClipModel_countOfClipsWithQualityBetweenDatesQuery__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (countOfClipsWithQualityBetweenDatesQuery_onceToken != -1) {
    dispatch_once(&countOfClipsWithQualityBetweenDatesQuery_onceToken, block);
  }
  v2 = (void *)countOfClipsWithQualityBetweenDatesQuery_query;
  return (HMBModelCountMatchesQuery *)v2;
}

void __62__HMDCameraClipModel_countOfClipsWithQualityBetweenDatesQuery__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) qualityPredicate];
  v3 = [v1 stringWithFormat:@"%@ AND startDate >= :dateAfter AND startDate < :dateBefore", v2];

  v4 = (void *)MEMORY[0x1E4F69E90];
  v11[0] = @"quality";
  v5 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"qualityField"];
  v12[0] = v5;
  v11[1] = @"dateAfter";
  v6 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"startDate"];
  v12[1] = v6;
  v11[2] = @"dateBefore";
  v7 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"startDate"];
  v12[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v9 = [v4 queryWithSQLPredicate:v3 indexedProperties:&unk_1F2DC7120 arguments:v8];
  v10 = (void *)countOfClipsWithQualityBetweenDatesQuery_query;
  countOfClipsWithQualityBetweenDatesQuery_query = v9;
}

+ (HMBModelInfiniteQuery)clipsWithQualityBetweenDatesDescendingQuery
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDCameraClipModel_clipsWithQualityBetweenDatesDescendingQuery__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (clipsWithQualityBetweenDatesDescendingQuery_onceToken != -1) {
    dispatch_once(&clipsWithQualityBetweenDatesDescendingQuery_onceToken, block);
  }
  v2 = (void *)clipsWithQualityBetweenDatesDescendingQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __65__HMDCameraClipModel_clipsWithQualityBetweenDatesDescendingQuery__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) qualityPredicate];
  v3 = [v1 stringWithFormat:@"%@ AND startDate > :dateAfter AND startDate <= :dateBefore ORDER BY startDate DESC", v2];

  v4 = (void *)MEMORY[0x1E4F69EA8];
  v11[0] = @"quality";
  v5 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"qualityField"];
  v12[0] = v5;
  v11[1] = @"dateAfter";
  v6 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"startDate"];
  v12[1] = v6;
  v11[2] = @"dateBefore";
  v7 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"startDate"];
  v12[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v9 = [v4 queryWithSQLPredicate:v3 sequenceArgumentName:@"dateBefore" indexedProperties:&unk_1F2DC7108 arguments:v8];
  v10 = (void *)clipsWithQualityBetweenDatesDescendingQuery_query;
  clipsWithQualityBetweenDatesDescendingQuery_query = v9;
}

+ (HMBModelInfiniteQuery)clipsWithQualityBetweenDatesAscendingQuery
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HMDCameraClipModel_clipsWithQualityBetweenDatesAscendingQuery__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (clipsWithQualityBetweenDatesAscendingQuery_onceToken != -1) {
    dispatch_once(&clipsWithQualityBetweenDatesAscendingQuery_onceToken, block);
  }
  v2 = (void *)clipsWithQualityBetweenDatesAscendingQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __64__HMDCameraClipModel_clipsWithQualityBetweenDatesAscendingQuery__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) qualityPredicate];
  v3 = [v1 stringWithFormat:@"%@ AND startDate >= :dateAfter AND startDate < :dateBefore ORDER BY startDate ASC", v2];

  v4 = (void *)MEMORY[0x1E4F69EA8];
  v11[0] = @"quality";
  v5 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"qualityField"];
  v12[0] = v5;
  v11[1] = @"dateAfter";
  v6 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"startDate"];
  v12[1] = v6;
  v11[2] = @"dateBefore";
  v7 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"startDate"];
  v12[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v9 = [v4 queryWithSQLPredicate:v3 sequenceArgumentName:@"dateAfter" indexedProperties:&unk_1F2DC70F0 arguments:v8];
  v10 = (void *)clipsWithQualityBetweenDatesAscendingQuery_query;
  clipsWithQualityBetweenDatesAscendingQuery_query = v9;
}

+ (HMBModelInfiniteQuery)clipsBeforeDateQuery
{
  if (clipsBeforeDateQuery_onceToken != -1) {
    dispatch_once(&clipsBeforeDateQuery_onceToken, &__block_literal_global_81_188448);
  }
  v2 = (void *)clipsBeforeDateQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __42__HMDCameraClipModel_clipsBeforeDateQuery__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F69EA8];
  v5 = @"dateBefore";
  v1 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"startDate"];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"startDate <= :dateBefore ORDER BY startDate DESC" sequenceArgumentName:@"dateBefore" indexedProperties:&unk_1F2DC70D8 arguments:v2];
  v4 = (void *)clipsBeforeDateQuery_query;
  clipsBeforeDateQuery_query = v3;
}

+ (HMBModelInfiniteQuery)clipsWithNeedsUploadFeedbackStatusQuery
{
  if (clipsWithNeedsUploadFeedbackStatusQuery_onceToken != -1) {
    dispatch_once(&clipsWithNeedsUploadFeedbackStatusQuery_onceToken, &__block_literal_global_72_188453);
  }
  v2 = (void *)clipsWithNeedsUploadFeedbackStatusQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __61__HMDCameraClipModel_clipsWithNeedsUploadFeedbackStatusQuery__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F69EA8];
  v5 = @"feedbackStatusField";
  v1 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"feedbackStatusField" defaultValue:&unk_1F2DC9F58];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"feedbackStatusField == :feedbackStatusField" sequenceArgumentName:@"feedbackStatusField" indexedProperties:&unk_1F2DC70C0 arguments:v2];
  v4 = (void *)clipsWithNeedsUploadFeedbackStatusQuery_query;
  clipsWithNeedsUploadFeedbackStatusQuery_query = v3;
}

+ (HMBModelInfiniteQuery)incompleteClipsQuery
{
  if (incompleteClipsQuery_onceToken != -1) {
    dispatch_once(&incompleteClipsQuery_onceToken, &__block_literal_global_65_188464);
  }
  v2 = (void *)incompleteClipsQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __42__HMDCameraClipModel_incompleteClipsQuery__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F69EA8];
  v8[0] = @"isComplete";
  v1 = objc_msgSend(MEMORY[0x1E4F69EB0], "argumentWithPropertyName:defaultValue:");
  v8[1] = @"startDate";
  v9[0] = v1;
  v2 = (void *)MEMORY[0x1E4F69EB0];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v4 = [v2 argumentWithPropertyName:@"startDate" defaultValue:v3];
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v6 = [v0 queryWithSQLPredicate:@"isComplete == :isComplete AND startDate <= :startDate ORDER BY startDate DESC" sequenceArgumentName:@"startDate" indexedProperties:&unk_1F2DC70A8 arguments:v5];
  v7 = (void *)incompleteClipsQuery_query;
  incompleteClipsQuery_query = v6;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_188476 != -1) {
    dispatch_once(&sentinelParentUUID_onceToken_188476, &__block_literal_global_59_188477);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID_188478;
  return (NSUUID *)v2;
}

uint64_t __40__HMDCameraClipModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C795FE32-95CB-4EE4-9197-6E572C6C2365"];
  uint64_t v1 = sentinelParentUUID_sentinelParentUUID_188478;
  sentinelParentUUID_sentinelParentUUID_188478 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)hmbQueries
{
  v11[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 incompleteClipsQuery];
  v11[0] = v3;
  v4 = [a1 clipsWithNeedsUploadFeedbackStatusQuery];
  v11[1] = v4;
  v5 = [a1 clipsBeforeDateQuery];
  v11[2] = v5;
  uint64_t v6 = [a1 clipsWithQualityBetweenDatesAscendingQuery];
  void v11[3] = v6;
  v7 = [a1 clipsWithQualityBetweenDatesDescendingQuery];
  v11[4] = v7;
  v8 = [a1 countOfClipsWithQualityBetweenDatesQuery];
  v11[5] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

+ (id)hmbExternalRecordType
{
  return @"CameraClip";
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_188488 != -1) {
    dispatch_once(&hmbProperties_onceToken_188488, &__block_literal_global_188489);
  }
  v2 = (void *)hmbProperties_properties_188490;
  return v2;
}

void __35__HMDCameraClipModel_hmbProperties__block_invoke()
{
  v52[14] = *MEMORY[0x1E4F143B8];
  v51[0] = @"startDate";
  uint64_t v0 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v1 = objc_opt_class();
  v43 = [MEMORY[0x1E4F69EA0] queryableField];
  v50 = v43;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v41 = [v0 fieldWithClass:v1 options:v42];
  v52[0] = v41;
  v51[1] = @"isComplete";
  v2 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v3 = objc_opt_class();
  v40 = [MEMORY[0x1E4F69EA0] queryableField];
  v49 = v40;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v38 = [v2 fieldWithClass:v3 options:v39];
  v52[1] = v38;
  v51[2] = @"duration";
  v37 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v52[2] = v37;
  v51[3] = @"targetFragmentDuration";
  v36 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v52[3] = v36;
  v51[4] = @"maximumClipDuration";
  v35 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v52[4] = v35;
  v51[5] = @"recordedLocally";
  v4 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v5 = objc_opt_class();
  v34 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v48 = v34;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v32 = [v4 fieldWithClass:v5 options:v33];
  v52[5] = v32;
  v51[6] = @"streamingAssetVersion";
  v31 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v52[6] = v31;
  v51[7] = @"encryptionKey";
  v30 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v52[7] = v30;
  v51[8] = @"encryptionScheme";
  v29 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v52[8] = v29;
  v51[9] = @"videoStreamingAsset";
  uint64_t v6 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v7 = objc_opt_class();
  v28 = [MEMORY[0x1E4F69EA0] externalRecordField:@"sa00"];
  v47 = v28;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v26 = [v6 fieldWithClass:v7 options:v27];
  v52[9] = v26;
  v51[10] = @"videoMetadata";
  v25 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v52[10] = v25;
  v51[11] = @"videoMetadataArray";
  v8 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v9 = objc_opt_class();
  v10 = [MEMORY[0x1E4F69EA0] encryptedExternalRecordField:@"ebl00"];
  v46 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v12 = [v8 fieldWithClass:v9 options:v11];
  v52[11] = v12;
  v51[12] = @"feedbackStatusField";
  v13 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v14 = objc_opt_class();
  v15 = [MEMORY[0x1E4F69EA0] queryableField];
  v45 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v17 = [v13 fieldWithClass:v14 options:v16];
  v52[12] = v17;
  v51[13] = @"qualityField";
  v18 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v19 = objc_opt_class();
  v20 = [MEMORY[0x1E4F69EA0] queryableField];
  v44 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v22 = [v18 fieldWithClass:v19 options:v21];
  v52[13] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:14];
  v24 = (void *)hmbProperties_properties_188490;
  hmbProperties_properties_188490 = v23;
}

- (void)setQuality:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HMDCameraClipModel *)self setQualityField:v4];
}

- (int64_t)quality
{
  v2 = [(HMDCameraClipModel *)self qualityField];
  int64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setFeedbackStatus:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HMDCameraClipModel *)self setFeedbackStatusField:v4];
}

- (unint64_t)feedbackStatus
{
  v2 = [(HMDCameraClipModel *)self feedbackStatusField];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)createClipWithSignificantEvents:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  if (!v49) {
    _HMFPreconditionFailure();
  }
  id v4 = [(HMDCameraClipModel *)self encryptionKey];
  uint64_t v5 = [(HMDCameraClipModel *)self encryptionScheme];
  uint64_t v6 = [(HMDCameraClipModel *)self startDate];
  uint64_t v7 = [(HMDCameraClipModel *)self duration];
  v8 = [(HMDCameraClipModel *)self targetFragmentDuration];
  uint64_t v9 = [(HMDCameraClipModel *)self isComplete];
  uint64_t v10 = [(HMDCameraClipModel *)self streamingAssetVersion];
  v11 = (void *)v10;
  if (v4 && v5 && v6 && v7 && v8 && v9 && v10)
  {
    v43 = v7;
    v45 = v6;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E6E0]), "initWithKey:scheme:", v4, objc_msgSend(v5, "unsignedIntegerValue"));
    v13 = [(HMDCameraClipModel *)self videoMetadataArray];
    uint64_t v14 = v13;
    v47 = v5;
    v48 = v4;
    v42 = v11;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [(HMDCameraClipModel *)self videoMetadata];
    }
    v25 = v15;
    v41 = v15;

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __54__HMDCameraClipModel_createClipWithSignificantEvents___block_invoke;
    v50[3] = &unk_1E6A19598;
    v50[4] = self;
    v26 = objc_msgSend(v25, "na_map:", v50);
    id v27 = objc_alloc(MEMORY[0x1E4F2E6D0]);
    v28 = [(HMBModel *)self hmbModelID];
    uint64_t v7 = v43;
    [v43 floatValue];
    double v30 = v29;
    [v8 floatValue];
    double v32 = v31;
    uint64_t v33 = [v9 BOOLValue];
    BOOL v34 = [(HMDCameraClipModel *)self feedbackStatus] != 0;
    int64_t v35 = [(HMDCameraClipModel *)self quality];
    v36 = (void *)MEMORY[0x1E4F1CBF0];
    if (v26) {
      v36 = v26;
    }
    uint64_t v40 = v12;
    v37 = v27;
    v38 = (void *)v12;
    uint64_t v6 = v45;
    v24 = (void *)[v37 initWithUniqueIdentifier:v28 startDate:v45 duration:v33 targetFragmentDuration:v34 isComplete:v35 isDonated:v42 quality:v30 streamingAssetVersion:v32 encryptionContext:v40 videoSegments:v36 significantEvents:v49];

    v11 = v42;
    uint64_t v5 = v47;
    id v4 = v48;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = v8;
      v46 = v9;
      v20 = uint64_t v19 = v7;
      [(HMBModel *)v17 debugDescription];
      v21 = v11;
      uint64_t v23 = v22 = v6;
      *(_DWORD *)buf = 138543618;
      v52 = v20;
      __int16 v53 = 2112;
      v54 = v23;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot create clip from model: %@", buf, 0x16u);

      uint64_t v6 = v22;
      v11 = v21;

      uint64_t v7 = v19;
      v8 = v44;
      uint64_t v9 = v46;
    }

    v24 = 0;
  }

  return v24;
}

id __54__HMDCameraClipModel_createClipWithSignificantEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[HMDCameraClipSegmentMetadata alloc] initWithData:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([(HMDCameraClipSegmentMetadata *)v4 type])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F2E708]);
      uint64_t v7 = [(HMDCameraClipSegmentMetadata *)v5 byteLength];
      uint64_t v8 = [(HMDCameraClipSegmentMetadata *)v5 byteOffset];
      [(HMDCameraClipSegmentMetadata *)v5 duration];
      double v10 = v9;
      [(HMDCameraClipSegmentMetadata *)v5 timeOffset];
      uint64_t v12 = [v6 initWithByteLength:v7 byteOffset:v8 duration:v10 timeOffset:v11];
    }
    else
    {
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E710]), "initWithByteLength:byteOffset:", -[HMDCameraClipSegmentMetadata byteLength](v5, "byteLength"), -[HMDCameraClipSegmentMetadata byteOffset](v5, "byteOffset"));
    }
    v18 = (void *)v12;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      v17 = [*(id *)(a1 + 32) hmbModelID];
      int v20 = 138543618;
      v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode video segment metadata for clip %@", (uint8_t *)&v20, 0x16u);
    }
    v18 = 0;
  }

  return v18;
}

@end