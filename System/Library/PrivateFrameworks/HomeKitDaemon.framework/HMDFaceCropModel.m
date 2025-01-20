@interface HMDFaceCropModel
+ (HMBModelInfiniteQuery)faceCropsForPersonUUIDQuery;
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
    dispatch_once(&faceCropsWithUnassociatedFaceCropUUIDQuery_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)faceCropsWithUnassociatedFaceCropUUIDQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __62__HMDFaceCropModel_faceCropsWithUnassociatedFaceCropUUIDQuery__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F492D0];
  v5 = @"unassociatedFaceCropUUID";
  v1 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"unassociatedFaceCropUUID"];
  v6[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"unassociatedFaceCropUUID == :unassociatedFaceCropUUID" sequenceArgumentName:@"unassociatedFaceCropUUID" indexedProperties:&unk_26E473D50 arguments:v2];
  v4 = (void *)faceCropsWithUnassociatedFaceCropUUIDQuery_query;
  faceCropsWithUnassociatedFaceCropUUIDQuery_query = v3;
}

+ (HMBModelInfiniteQuery)faceCropsForPersonUUIDQuery
{
  if (faceCropsForPersonUUIDQuery_onceToken != -1) {
    dispatch_once(&faceCropsForPersonUUIDQuery_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)faceCropsForPersonUUIDQuery_query;
  return (HMBModelInfiniteQuery *)v2;
}

void __47__HMDFaceCropModel_faceCropsForPersonUUIDQuery__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F492D0];
  v5 = @"personUUID";
  v1 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"personUUID"];
  v6[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 queryWithSQLPredicate:@"personUUID == :personUUID" sequenceArgumentName:@"personUUID" indexedProperties:&unk_26E473D38 arguments:v2];
  v4 = (void *)faceCropsForPersonUUIDQuery_query;
  faceCropsForPersonUUIDQuery_query = v3;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken != -1) {
    dispatch_once(&sentinelParentUUID_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID;
  return (NSUUID *)v2;
}

void __38__HMDFaceCropModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C8C08B78-9E10-41CD-AC46-E879D4DF6FFA"];
  v1 = (void *)sentinelParentUUID_sentinelParentUUID;
  sentinelParentUUID_sentinelParentUUID = v0;
}

+ (id)hmbQueries
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 faceCropsForPersonUUIDQuery];
  v7[0] = v3;
  v4 = [a1 faceCropsWithUnassociatedFaceCropUUIDQuery];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken != -1) {
    dispatch_once(&hmbProperties_onceToken, &__block_literal_global_703);
  }
  v2 = (void *)hmbProperties_properties;
  return v2;
}

void __33__HMDFaceCropModel_hmbProperties__block_invoke()
{
  v26[7] = *MEMORY[0x263EF8340];
  v25[0] = @"dataRepresentation";
  v21 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v26[0] = v21;
  v25[1] = @"dateCreated";
  v20 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v26[1] = v20;
  v25[2] = @"faceBoundingBoxData";
  v19 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v26[2] = v19;
  v25[3] = @"person";
  uint64_t v0 = (void *)MEMORY[0x263F492C0];
  uint64_t v1 = objc_opt_class();
  v18 = [MEMORY[0x263F492C8] externalRecordField:@"r00"];
  v24[0] = v18;
  v17 = [MEMORY[0x263F492C8] queryableField];
  v24[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v15 = [v0 fieldWithClass:v1 options:v16];
  v26[3] = v15;
  v25[4] = @"personUUID";
  v2 = (void *)MEMORY[0x263F492C0];
  uint64_t v3 = objc_opt_class();
  v4 = [MEMORY[0x263F492C8] queryableField];
  v23 = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  v6 = [v2 fieldWithClass:v3 options:v5];
  v26[4] = v6;
  v25[5] = @"unassociatedFaceCropUUID";
  v7 = (void *)MEMORY[0x263F492C0];
  uint64_t v8 = objc_opt_class();
  v9 = [MEMORY[0x263F492C8] queryableField];
  v22 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v11 = [v7 fieldWithClass:v8 options:v10];
  v26[5] = v11;
  v25[6] = @"sourceField";
  v12 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v26[6] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];
  v14 = (void *)hmbProperties_properties;
  hmbProperties_properties = v13;
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
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v11 = 0;
  int64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    [(HMDFaceCropModel *)self setFaceBoundingBoxData:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      v15 = v4;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not serialize face bounding box value %@: %@", buf, 0x20u);
    }
  }
}

- (CGRect)faceBoundingBox
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDFaceCropModel *)self faceBoundingBoxData];
  if (v3)
  {
    id v22 = 0;
    id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v22];
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
      __int16 v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        __int16 v25 = 2112;
        id v26 = v5;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not deserialize face bounding box value: %@", buf, 0x16u);
      }
      double v7 = *MEMORY[0x263F001A8];
      double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
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
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDFaceCropModel *)self dataRepresentation];
  id v4 = [(HMDFaceCropModel *)self dateCreated];
  id v5 = [(HMDFaceCropModel *)self personUUID];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    double v8 = [(HMDFaceCropModel *)self person];
    id v7 = [v8 hmbModelID];
  }
  if (v3 && v4 && v7)
  {
    id v9 = objc_alloc(MEMORY[0x263F0E5C8]);
    double v10 = [(HMBModel *)self hmbModelID];
    [(HMDFaceCropModel *)self faceBoundingBox];
    double v11 = objc_msgSend(v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v10, v3, v4, v7);

    double v12 = [(HMDFaceCropModel *)self unassociatedFaceCropUUID];
    [v11 setUnassociatedFaceCropUUID:v12];

    objc_msgSend(v11, "setSource:", -[HMDFaceCropModel source](self, "source"));
    double v13 = (void *)[v11 copy];
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      double v18 = [(HMBModel *)v15 debugDescription];
      int v20 = 138543618;
      double v21 = v17;
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot create person face crop from model: %@", (uint8_t *)&v20, 0x16u);
    }
    double v13 = 0;
  }

  return v13;
}

- (HMDFaceCropModel)initWithPersonFaceCrop:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUID];
  double v6 = [(id)objc_opt_class() sentinelParentUUID];
  id v7 = [(HMBModel *)self initWithModelID:v5 parentModelID:v6];

  double v8 = [v4 dataRepresentation];
  [(HMDFaceCropModel *)v7 setDataRepresentation:v8];

  id v9 = [v4 dateCreated];
  [(HMDFaceCropModel *)v7 setDateCreated:v9];

  [v4 faceBoundingBox];
  -[HMDFaceCropModel setFaceBoundingBox:](v7, "setFaceBoundingBox:");
  double v10 = [v4 personUUID];
  [(HMDFaceCropModel *)v7 setPersonUUID:v10];

  double v11 = [v4 unassociatedFaceCropUUID];
  [(HMDFaceCropModel *)v7 setUnassociatedFaceCropUUID:v11];

  uint64_t v12 = [v4 source];
  [(HMDFaceCropModel *)v7 setSource:v12];

  return v7;
}

@end