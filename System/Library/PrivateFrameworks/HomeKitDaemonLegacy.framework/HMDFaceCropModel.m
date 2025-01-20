@interface HMDFaceCropModel
+ (HMBModelInfiniteQuery)faceCropsForPersonQuery;
+ (HMBModelInfiniteQuery)faceCropsWithUnassociatedFaceCropUUIDQuery;
+ (NSUUID)sentinelParentUUID;
+ (id)hmbProperties;
+ (id)hmbQueries;
- (CGRect)faceBoundingBox;
- (HMDFaceCropModel)initWithPersonFaceCrop:(id)a3;
- (id)createPersonFaceCrop;
- (int64_t)source;
- (void)setFaceBoundingBox:(CGRect)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation HMDFaceCropModel

+ (HMBModelInfiniteQuery)faceCropsWithUnassociatedFaceCropUUIDQuery
{
  if (faceCropsWithUnassociatedFaceCropUUIDQuery_onceToken != -1) {
    dispatch_once(&faceCropsWithUnassociatedFaceCropUUIDQuery_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)faceCropsWithUnassociatedFaceCropUUIDQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __62__HMDFaceCropModel_faceCropsWithUnassociatedFaceCropUUIDQuery__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F69EA8];
  v5 = @"unassociatedFaceCropUUID";
  v1 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"unassociatedFaceCropUUID"];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"unassociatedFaceCropUUID == :unassociatedFaceCropUUID" sequenceArgumentName:@"unassociatedFaceCropUUID" indexedProperties:&unk_1F2DC6928 arguments:v2];
  v4 = (void *)faceCropsWithUnassociatedFaceCropUUIDQuery_query;
  faceCropsWithUnassociatedFaceCropUUIDQuery_query = v3;
}

+ (HMBModelInfiniteQuery)faceCropsForPersonQuery
{
  if (faceCropsForPersonQuery_onceToken != -1) {
    dispatch_once(&faceCropsForPersonQuery_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)faceCropsForPersonQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __43__HMDFaceCropModel_faceCropsForPersonQuery__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F69EA8];
  v5 = @"person";
  v1 = [MEMORY[0x1E4F69EB0] argumentWithPropertyName:@"person"];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"person == :person" sequenceArgumentName:@"person" indexedProperties:&unk_1F2DC6910 arguments:v2];
  v4 = (void *)faceCropsForPersonQuery_query;
  faceCropsForPersonQuery_query = v3;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken != -1) {
    dispatch_once(&sentinelParentUUID_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID;
  return (NSUUID *)v2;
}

uint64_t __38__HMDFaceCropModel_sentinelParentUUID__block_invoke()
{
  sentinelParentUUID_sentinelParentUUID = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C8C08B78-9E10-41CD-AC46-E879D4DF6FFA"];
  return MEMORY[0x1F41817F8]();
}

+ (id)hmbQueries
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 faceCropsForPersonQuery];
  v7[0] = v3;
  v4 = [a1 faceCropsWithUnassociatedFaceCropUUIDQuery];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken != -1) {
    dispatch_once(&hmbProperties_onceToken, &__block_literal_global_462);
  }
  v2 = (void *)hmbProperties_properties;
  return v2;
}

void __33__HMDFaceCropModel_hmbProperties__block_invoke()
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v19[0] = @"dataRepresentation";
  v16 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v20[0] = v16;
  v19[1] = @"dateCreated";
  v15 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v20[1] = v15;
  v19[2] = @"faceBoundingBoxData";
  v14 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v20[2] = v14;
  v19[3] = @"person";
  v0 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v1 = objc_opt_class();
  v2 = [MEMORY[0x1E4F69EA0] externalRecordField:@"r00"];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F69EA0] queryableField];
  v18[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v5 = [v0 fieldWithClass:v1 options:v4];
  v20[3] = v5;
  v19[4] = @"unassociatedFaceCropUUID";
  v6 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v7 = objc_opt_class();
  v8 = [MEMORY[0x1E4F69EA0] queryableField];
  v17 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v10 = [v6 fieldWithClass:v7 options:v9];
  v20[4] = v10;
  v19[5] = @"sourceField";
  v11 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v20[5] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v13 = (void *)hmbProperties_properties;
  hmbProperties_properties = v12;
}

- (void)setSource:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HMDFaceCropModel *)self setSourceField:v4];
}

- (int64_t)source
{
  uint64_t v3 = [(HMDFaceCropModel *)self sourceField];
  if (v3)
  {
    id v4 = [(HMDFaceCropModel *)self sourceField];
    int64_t v5 = [v4 integerValue];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)setFaceBoundingBox:(CGRect)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v11 = 0;
  int64_t v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    [(HMDFaceCropModel *)self setFaceBoundingBoxData:v5];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v4;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not serialize face bounding box value %@: %@", buf, 0x20u);
    }
  }
}

- (CGRect)faceBoundingBox
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDFaceCropModel *)self faceBoundingBoxData];
  if (v3)
  {
    id v22 = 0;
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v22];
    id v5 = v22;
    if (v4)
    {
      [v4 rectValue];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      __int16 v14 = (void *)MEMORY[0x1D9452090]();
      v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        __int16 v25 = 2112;
        id v26 = v5;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not deserialize face bounding box value: %@", buf, 0x16u);
      }
      double v7 = *MEMORY[0x1E4F1DB28];
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)createPersonFaceCrop
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDFaceCropModel *)self dataRepresentation];
  id v4 = [(HMDFaceCropModel *)self dateCreated];
  id v5 = [(HMDFaceCropModel *)self person];
  double v6 = [v5 hmbModelID];

  if (v3 && v4 && v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F2E990]);
    double v8 = [(HMBModel *)self hmbModelID];
    [(HMDFaceCropModel *)self faceBoundingBox];
    double v9 = objc_msgSend(v7, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v8, v3, v4, v6);

    double v10 = [(HMDFaceCropModel *)self unassociatedFaceCropUUID];
    [v9 setUnassociatedFaceCropUUID:v10];

    objc_msgSend(v9, "setSource:", -[HMDFaceCropModel source](self, "source"));
    double v11 = (void *)[v9 copy];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1D9452090]();
    double v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      __int16 v16 = [(HMBModel *)v13 debugDescription];
      int v18 = 138543618;
      double v19 = v15;
      __int16 v20 = 2112;
      double v21 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create person face crop from model: %@", (uint8_t *)&v18, 0x16u);
    }
    double v11 = 0;
  }

  return v11;
}

- (HMDFaceCropModel)initWithPersonFaceCrop:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUID];
  double v6 = [(id)objc_opt_class() sentinelParentUUID];
  id v7 = [(HMBModel *)self initWithModelID:v5 parentModelID:v6];

  double v8 = [v4 dataRepresentation];
  [(HMDFaceCropModel *)v7 setDataRepresentation:v8];

  double v9 = [v4 dateCreated];
  [(HMDFaceCropModel *)v7 setDateCreated:v9];

  [v4 faceBoundingBox];
  -[HMDFaceCropModel setFaceBoundingBox:](v7, "setFaceBoundingBox:");
  id v10 = objc_alloc(MEMORY[0x1E4F69E80]);
  double v11 = [v4 personUUID];
  double v12 = (void *)[v10 initWithModelID:v11 action:1];
  [(HMDFaceCropModel *)v7 setPerson:v12];

  double v13 = [v4 unassociatedFaceCropUUID];
  [(HMDFaceCropModel *)v7 setUnassociatedFaceCropUUID:v13];

  uint64_t v14 = [v4 source];
  [(HMDFaceCropModel *)v7 setSource:v14];

  return v7;
}

@end