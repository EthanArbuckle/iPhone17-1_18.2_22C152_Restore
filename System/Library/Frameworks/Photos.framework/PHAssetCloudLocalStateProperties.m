@interface PHAssetCloudLocalStateProperties
+ (BOOL)inverseIsToMany;
+ (id)additionalPropertiesToFetchOnPrimaryObject;
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
+ (unsigned)_assetCloudLocalStateFromAssetLocalState:(signed __int16)a3 masterLocalState:(signed __int16)a4;
- (NSManagedObjectID)cloudMasterObjectID;
- (PHAssetCloudLocalStateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (unsigned)assetCloudLocalState;
@end

@implementation PHAssetCloudLocalStateProperties

- (void).cxx_destruct
{
}

- (NSManagedObjectID)cloudMasterObjectID
{
  return self->_cloudMasterObjectID;
}

- (unsigned)assetCloudLocalState
{
  return self->_assetCloudLocalState;
}

- (PHAssetCloudLocalStateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PHAssetCloudLocalStateProperties;
  v10 = [(PHAssetCloudLocalStateProperties *)&v20 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    uint64_t v12 = [v8 objectForKeyedSubscript:@"master"];
    cloudMasterObjectID = v11->_cloudMasterObjectID;
    v11->_cloudMasterObjectID = (NSManagedObjectID *)v12;

    v14 = [v8 objectForKeyedSubscript:@"cloudLocalState"];
    __int16 v15 = [v14 integerValue];

    if (v5) {
      v16 = @"master.cloudLocalState";
    }
    else {
      v16 = @"cloudLocalState";
    }
    v17 = [v8 objectForKeyedSubscript:v16];
    __int16 v18 = [v17 integerValue];

    v11->_assetCloudLocalState = [(id)objc_opt_class() _assetCloudLocalStateFromAssetLocalState:v15 masterLocalState:v18];
  }

  return v11;
}

+ (unsigned)_assetCloudLocalStateFromAssetLocalState:(signed __int16)a3 masterLocalState:(signed __int16)a4
{
  switch(a3)
  {
    case 1:
    case 3:
      unint64_t v4 = 0x4000200030001uLL >> (16 * (a4 - 1));
      if ((a4 - 1) >= 4) {
        LOWORD(v4) = 0;
      }
      break;
    case 2:
      LOWORD(v4) = 3;
      break;
    case 4:
      LOWORD(v4) = 4;
      break;
    default:
      LOWORD(v4) = 0;
      break;
  }
  return v4;
}

+ (BOOL)inverseIsToMany
{
  return 1;
}

+ (id)additionalPropertiesToFetchOnPrimaryObject
{
  pl_dispatch_once();
  v2 = (void *)additionalPropertiesToFetchOnPrimaryObject_pl_once_object_71;

  return v2;
}

void __78__PHAssetCloudLocalStateProperties_additionalPropertiesToFetchOnPrimaryObject__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"cloudLocalState";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)additionalPropertiesToFetchOnPrimaryObject_pl_once_object_71;
  additionalPropertiesToFetchOnPrimaryObject_pl_once_object_71 = v1;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_70;

  return v2;
}

void __53__PHAssetCloudLocalStateProperties_propertiesToFetch__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"objectID";
  v3[1] = @"cloudLocalState";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_70;
  propertiesToFetch_pl_once_object_70 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetCloudLocalState";
}

+ (id)keyPathFromPrimaryObject
{
  return @"master";
}

+ (id)entityName
{
  return @"CloudMaster";
}

@end