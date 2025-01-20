@interface VNANFDMultiDetectorANODv3
+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3;
+ (Class)detectorClass;
+ (NSArray)knownFoodAndDrinkIdentifiers;
+ (NSDictionary)recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName;
+ (id)detectedObjectClassToRequestKey;
+ (id)detectedObjectRequestKeyToRequestInfo;
- (BOOL)processDetectedObject:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 imageBuffer:(id)a7 qosClass:(unsigned int)a8 session:(id)a9 warningRecorder:(id)a10 detectedObjectResults:(id)a11 error:(id *)a12;
- (id)splitDetectedClassResultsIntoSubclasses:(id)a3;
@end

@implementation VNANFDMultiDetectorANODv3

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return [a3 requestRevision] != 3737841668;
}

+ (NSArray)knownFoodAndDrinkIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VNANFDMultiDetectorANODv3_knownFoodAndDrinkIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv3 knownFoodAndDrinkIdentifiers]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv3 knownFoodAndDrinkIdentifiers]::onceToken, block);
  }
  v2 = (void *)+[VNANFDMultiDetectorANODv3 knownFoodAndDrinkIdentifiers]::knownFoodAndDrinkIdentifiers;

  return (NSArray *)v2;
}

void __57__VNANFDMultiDetectorANODv3_knownFoodAndDrinkIdentifiers__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName];
  v1 = [v4 allValues];
  uint64_t v2 = [v1 copy];
  v3 = (void *)+[VNANFDMultiDetectorANODv3 knownFoodAndDrinkIdentifiers]::knownFoodAndDrinkIdentifiers;
  +[VNANFDMultiDetectorANODv3 knownFoodAndDrinkIdentifiers]::knownFoodAndDrinkIdentifiers = v2;
}

+ (NSDictionary)recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName
{
  if (+[VNANFDMultiDetectorANODv3 recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv3 recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName]::onceToken, &__block_literal_global_11938);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetectorANODv3 recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName]::recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName;

  return (NSDictionary *)v2;
}

void __88__VNANFDMultiDetectorANODv3_recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7A7178;
  v2[1] = &unk_1EF7A7190;
  v3[0] = @"Food";
  v3[1] = @"Drink";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)+[VNANFDMultiDetectorANODv3 recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName]::recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName;
  +[VNANFDMultiDetectorANODv3 recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName]::recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName = v0;
}

+ (id)detectedObjectRequestKeyToRequestInfo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VNANFDMultiDetectorANODv3_detectedObjectRequestKeyToRequestInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv3 detectedObjectRequestKeyToRequestInfo]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv3 detectedObjectRequestKeyToRequestInfo]::onceToken, block);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetectorANODv3 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;

  return v2;
}

void __66__VNANFDMultiDetectorANODv3_detectedObjectRequestKeyToRequestInfo__block_invoke(uint64_t a1)
{
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv3;
  v1 = objc_msgSendSuper2(&v8, sel_detectedObjectRequestKeyToRequestInfo);
  uint64_t v2 = (void *)[v1 mutableCopy];

  v3 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_FoodAndDrinkRecognitionOriginatingRequestSpecifier" originalRequestResultsIndex:4];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v2 setObject:v3 forKey:v5];

  uint64_t v6 = [v2 copy];
  v7 = (void *)+[VNANFDMultiDetectorANODv3 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
  +[VNANFDMultiDetectorANODv3 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo = v6;
}

+ (id)detectedObjectClassToRequestKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VNANFDMultiDetectorANODv3_detectedObjectClassToRequestKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv3 detectedObjectClassToRequestKey]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv3 detectedObjectClassToRequestKey]::onceToken, block);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetectorANODv3 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;

  return v2;
}

void __60__VNANFDMultiDetectorANODv3_detectedObjectClassToRequestKey__block_invoke(uint64_t a1)
{
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv3;
  v1 = objc_msgSendSuper2(&v9, sel_detectedObjectClassToRequestKey);
  uint64_t v2 = (void *)[v1 mutableCopy];

  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [v2 setObject:v4 forKey:&unk_1EF7A7178];

  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v2 setObject:v6 forKey:&unk_1EF7A7190];

  uint64_t v7 = [v2 copy];
  objc_super v8 = (void *)+[VNANFDMultiDetectorANODv3 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
  +[VNANFDMultiDetectorANODv3 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey = v7;
}

- (id)splitDetectedClassResultsIntoSubclasses:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v17 = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          BOOL v12 = [(VNANFDMultiDetector *)self isDetectedObject:v11 ofAGivenObjectSubClass:@"Food"];
          v13 = v5;
          if (!v12)
          {
            BOOL v14 = [(VNANFDMultiDetector *)self isDetectedObject:v11 ofAGivenObjectSubClass:@"Drink"];
            v13 = v6;
            if (!v14)
            {
              v18.receiver = self;
              v18.super_class = (Class)VNANFDMultiDetectorANODv3;
              v15 = [(VNANFDMultiDetector *)&v18 splitDetectedClassResultsIntoSubclasses:v7];

              id v4 = v17;
              goto LABEL_14;
            }
          }
          [v13 addObject:v11];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v4 = v17;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, v6, 0);
LABEL_14:
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VNANFDMultiDetectorANODv3;
    v15 = [(VNANFDMultiDetector *)&v23 splitDetectedClassResultsIntoSubclasses:v4];
  }

  return v15;
}

- (BOOL)processDetectedObject:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 imageBuffer:(id)a7 qosClass:(unsigned int)a8 session:(id)a9 warningRecorder:(id)a10 detectedObjectResults:(id)a11 error:(id *)a12
{
  uint64_t v13 = *(void *)&a8;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v22 = a3;
  id v23 = a4;
  id v24 = a6;
  id v35 = a7;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  v28 = [(id)objc_opt_class() recognizedFoodAndDrinkObjectClassToFoodAndDrinkCategoryName];
  if ([v22 labelKey] - 7 >= 2)
  {
    v36.receiver = self;
    v36.super_class = (Class)VNANFDMultiDetectorANODv3;
    BOOL v33 = -[VNANFDMultiDetector processDetectedObject:originatingRequestSpecifier:objectBoundingBox:objectGroupId:imageBuffer:qosClass:session:warningRecorder:detectedObjectResults:error:](&v36, sel_processDetectedObject_originatingRequestSpecifier_objectBoundingBox_objectGroupId_imageBuffer_qosClass_session_warningRecorder_detectedObjectResults_error_, v22, v23, v24, v35, v13, v25, x, y, width, height, v26, v27, a12);
  }
  else
  {
    v29 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v22, "labelKey"));
    v30 = [v28 objectForKey:v29];

    [v22 confidence];
    LODWORD(v32) = v31;
    -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v30, v23, v24, v27, x, y, width, height, v32);

    BOOL v33 = 1;
  }

  return v33;
}

@end