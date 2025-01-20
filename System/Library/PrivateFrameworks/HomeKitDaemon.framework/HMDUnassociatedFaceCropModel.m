@interface HMDUnassociatedFaceCropModel
+ (NSUUID)sentinelParentUUID;
+ (id)hmbExternalRecordType;
+ (id)hmbProperties;
+ (id)hmbQueries;
+ (id)unassociatedFaceCropsBetweenDatesQueryWithIsAscending:(BOOL)a3;
- (CGRect)faceBoundingBox;
- (HMDUnassociatedFaceCropModel)initWithFaceCrop:(id)a3;
- (id)createFaceCrop;
- (void)setFaceBoundingBox:(CGRect)a3;
@end

@implementation HMDUnassociatedFaceCropModel

+ (id)unassociatedFaceCropsBetweenDatesQueryWithIsAscending:(BOOL)a3
{
  BOOL v3 = a3;
  if (unassociatedFaceCropsBetweenDatesQueryWithIsAscending__onceToken != -1) {
    dispatch_once(&unassociatedFaceCropsBetweenDatesQueryWithIsAscending__onceToken, &__block_literal_global_23_59756);
  }
  v4 = &unassociatedFaceCropsBetweenDatesQueryWithIsAscending__ascendingQuery;
  if (!v3) {
    v4 = &unassociatedFaceCropsBetweenDatesQueryWithIsAscending__descendingQuery;
  }
  v5 = (void *)*v4;
  return v5;
}

void __86__HMDUnassociatedFaceCropModel_unassociatedFaceCropsBetweenDatesQueryWithIsAscending___block_invoke()
{
  v15[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F492D0];
  v14[0] = @"dateAfter";
  v1 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateCreated"];
  v14[1] = @"dateBefore";
  v15[0] = v1;
  v2 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateCreated"];
  v15[1] = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  uint64_t v4 = [v0 queryWithSQLPredicate:@"dateCreated >= :dateAfter AND dateCreated < :dateBefore ORDER BY dateCreated ASC" sequenceArgumentName:@"dateAfter" indexedProperties:&unk_26E473F60 arguments:v3];
  v5 = (void *)unassociatedFaceCropsBetweenDatesQueryWithIsAscending__ascendingQuery;
  unassociatedFaceCropsBetweenDatesQueryWithIsAscending__ascendingQuery = v4;

  v6 = (void *)MEMORY[0x263F492D0];
  v12[0] = @"dateAfter";
  v7 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateCreated"];
  v12[1] = @"dateBefore";
  v13[0] = v7;
  v8 = [MEMORY[0x263F492D8] argumentWithPropertyName:@"dateCreated"];
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = [v6 queryWithSQLPredicate:@"dateCreated > :dateAfter AND dateCreated <= :dateBefore ORDER BY dateCreated DESC" sequenceArgumentName:@"dateBefore" indexedProperties:&unk_26E473F78 arguments:v9];
  v11 = (void *)unassociatedFaceCropsBetweenDatesQueryWithIsAscending__descendingQuery;
  unassociatedFaceCropsBetweenDatesQueryWithIsAscending__descendingQuery = v10;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_59779 != -1) {
    dispatch_once(&sentinelParentUUID_onceToken_59779, &__block_literal_global_17_59780);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID_59781;
  return (NSUUID *)v2;
}

void __50__HMDUnassociatedFaceCropModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"58F70219-F689-486A-B16D-8143BD41ABDF"];
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_59781;
  sentinelParentUUID_sentinelParentUUID_59781 = v0;
}

+ (id)hmbQueries
{
  v7[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 unassociatedFaceCropsBetweenDatesQueryWithIsAscending:1];
  v7[0] = v3;
  uint64_t v4 = [a1 unassociatedFaceCropsBetweenDatesQueryWithIsAscending:0];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)hmbExternalRecordType
{
  return @"CameraClip";
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_59791 != -1) {
    dispatch_once(&hmbProperties_onceToken_59791, &__block_literal_global_59792);
  }
  v2 = (void *)hmbProperties_properties_59793;
  return v2;
}

void __45__HMDUnassociatedFaceCropModel_hmbProperties__block_invoke()
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"dataRepresentation";
  uint64_t v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[0] = v0;
  v10[1] = @"dateCreated";
  v1 = (void *)MEMORY[0x263F492C0];
  uint64_t v2 = objc_opt_class();
  BOOL v3 = [MEMORY[0x263F492C8] queryableField];
  v9 = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  v5 = [v1 fieldWithClass:v2 options:v4];
  v11[1] = v5;
  v10[2] = @"faceBoundingBoxData";
  v6 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v11[2] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  v8 = (void *)hmbProperties_properties_59793;
  hmbProperties_properties_59793 = v7;
}

- (void)setFaceBoundingBox:(CGRect)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v11 = 0;
  v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    [(HMDUnassociatedFaceCropModel *)self setFaceBoundingBoxData:v5];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
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
  BOOL v3 = [(HMDUnassociatedFaceCropModel *)self faceBoundingBoxData];
  if (v3)
  {
    id v22 = 0;
    uint64_t v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v22];
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

- (id)createFaceCrop
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDUnassociatedFaceCropModel *)self dataRepresentation];
  uint64_t v4 = [(HMDUnassociatedFaceCropModel *)self dateCreated];
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = objc_alloc(MEMORY[0x263F0E358]);
    double v7 = [(HMBModel *)self hmbModelID];
    [(HMDUnassociatedFaceCropModel *)self faceBoundingBox];
    double v8 = objc_msgSend(v6, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v7, v3, v5);
  }
  else
  {
    double v9 = (void *)MEMORY[0x230FBD990]();
    double v10 = self;
    double v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot create face crop from model: %@", (uint8_t *)&v14, 0x16u);
    }
    double v8 = 0;
  }

  return v8;
}

- (HMDUnassociatedFaceCropModel)initWithFaceCrop:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUID];
  id v6 = [(id)objc_opt_class() sentinelParentUUID];
  double v7 = [(HMBModel *)self initWithModelID:v5 parentModelID:v6];

  double v8 = [v4 dataRepresentation];
  [(HMDUnassociatedFaceCropModel *)v7 setDataRepresentation:v8];

  double v9 = [v4 dateCreated];
  [(HMDUnassociatedFaceCropModel *)v7 setDateCreated:v9];

  [v4 faceBoundingBox];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[HMDUnassociatedFaceCropModel setFaceBoundingBox:](v7, "setFaceBoundingBox:", v11, v13, v15, v17);
  return v7;
}

@end