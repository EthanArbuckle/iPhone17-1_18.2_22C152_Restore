@interface PHFaceClusteringProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSString)groupingIdentifier;
- (PHFaceClusteringProperties)initWithFetchDictionary:(id)a3 face:(id)a4 prefetched:(BOOL)a5;
- (PHFaceprint)faceprint;
@end

@implementation PHFaceClusteringProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);

  objc_storeStrong((id *)&self->_faceprint, 0);
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (PHFaceprint)faceprint
{
  return self->_faceprint;
}

- (PHFaceClusteringProperties)initWithFetchDictionary:(id)a3 face:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PHFaceClusteringProperties;
  v9 = [(PHFaceClusteringProperties *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._face, v8);
    if (v7)
    {
      uint64_t v11 = [v7 objectForKeyedSubscript:@"groupingIdentifier"];
      groupingIdentifier = v10->_groupingIdentifier;
      v10->_groupingIdentifier = (NSString *)v11;

      v13 = [v7 objectForKeyedSubscript:@"faceprint.data"];
      v14 = [v7 objectForKeyedSubscript:@"faceprint.faceprintVersion"];
      v15 = v14;
      if (v13 && v14)
      {
        v16 = -[PHFaceprint initWithFaceprintData:faceprintVersion:]([PHFaceprint alloc], "initWithFaceprintData:faceprintVersion:", v13, [v14 integerValue]);
        faceprint = v10->_faceprint;
        v10->_faceprint = v16;
      }
    }
  }

  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_24_31686;

  return v2;
}

void __47__PHFaceClusteringProperties_propertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"groupingIdentifier";
  v3[1] = @"faceprint.data";
  v3[2] = @"faceprint.faceprintVersion";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_24_31686;
  propertiesToFetch_pl_once_object_24_31686 = v1;
}

+ (id)entityName
{
  return @"DetectedFace";
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)propertySetName
{
  return @"PHFacePropertySetClustering";
}

@end