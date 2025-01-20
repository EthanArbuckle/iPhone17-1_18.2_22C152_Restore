@interface VNANFDMultiDetectorANODv4
+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3;
+ (Class)detectorClass;
+ (NSArray)knownAnimalHeadIdentifiers;
+ (NSArray)knownSportBallIdentifiers;
+ (NSDictionary)recognizedAnimalHeadObjectClassToAnimalHeadCategoryName;
+ (NSDictionary)recognizedSportBallObjectClassToSportBallCategoryName;
+ (id)detectedObjectClassToRequestKey;
+ (id)detectedObjectRequestKeyToRequestInfo;
- (BOOL)processDetectedObject:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 imageBuffer:(id)a7 qosClass:(unsigned int)a8 session:(id)a9 warningRecorder:(id)a10 detectedObjectResults:(id)a11 error:(id *)a12;
- (id)splitDetectedClassResultsIntoSubclasses:(id)a3;
@end

@implementation VNANFDMultiDetectorANODv4

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

+ (id)detectedObjectRequestKeyToRequestInfo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VNANFDMultiDetectorANODv4_detectedObjectRequestKeyToRequestInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::onceToken, block);
  }
  v2 = (void *)+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;

  return v2;
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return [a3 requestRevision] != 3737841669;
}

+ (NSArray)knownSportBallIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VNANFDMultiDetectorANODv4_knownSportBallIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::onceToken, block);
  }
  v2 = (void *)+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::knownSportBallIdentifiers;

  return (NSArray *)v2;
}

void __54__VNANFDMultiDetectorANODv4_knownSportBallIdentifiers__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) recognizedSportBallObjectClassToSportBallCategoryName];
  v1 = [v4 allValues];
  uint64_t v2 = [v1 copy];
  v3 = (void *)+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::knownSportBallIdentifiers;
  +[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::knownSportBallIdentifiers = v2;
}

+ (NSDictionary)recognizedSportBallObjectClassToSportBallCategoryName
{
  if (+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::onceToken, &__block_literal_global_51);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::recognizedSportBallObjectClassToSportBallCategoryName;

  return (NSDictionary *)v2;
}

void __82__VNANFDMultiDetectorANODv4_recognizedSportBallObjectClassToSportBallCategoryName__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = &unk_1EF7A6C50;
  v3[0] = @"GenericSportBall";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::recognizedSportBallObjectClassToSportBallCategoryName;
  +[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::recognizedSportBallObjectClassToSportBallCategoryName = v0;
}

+ (NSArray)knownAnimalHeadIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VNANFDMultiDetectorANODv4_knownAnimalHeadIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::onceToken, block);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::knownAnimalHeadIdentifiers;

  return (NSArray *)v2;
}

void __55__VNANFDMultiDetectorANODv4_knownAnimalHeadIdentifiers__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) recognizedAnimalHeadObjectClassToAnimalHeadCategoryName];
  v1 = [v4 allValues];
  uint64_t v2 = [v1 copy];
  v3 = (void *)+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::knownAnimalHeadIdentifiers;
  +[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::knownAnimalHeadIdentifiers = v2;
}

+ (NSDictionary)recognizedAnimalHeadObjectClassToAnimalHeadCategoryName
{
  if (+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::onceToken, &__block_literal_global_149);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::recognizedAnimalHeadObjectClassToAnimalHeadCategoryName;

  return (NSDictionary *)v2;
}

void __84__VNANFDMultiDetectorANODv4_recognizedAnimalHeadObjectClassToAnimalHeadCategoryName__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7A6C20;
  v2[1] = &unk_1EF7A6C38;
  v3[0] = @"CatHead";
  v3[1] = @"DogHead";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::recognizedAnimalHeadObjectClassToAnimalHeadCategoryName;
  +[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::recognizedAnimalHeadObjectClassToAnimalHeadCategoryName = v0;
}

void __66__VNANFDMultiDetectorANODv4_detectedObjectRequestKeyToRequestInfo__block_invoke(uint64_t a1)
{
  v16.receiver = *(id *)(a1 + 32);
  v16.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv4;
  v1 = objc_msgSendSuper2(&v16, sel_detectedObjectRequestKeyToRequestInfo);
  uint64_t v2 = (void *)[v1 mutableCopy];

  v3 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_AnimalHeadsRecognitionOriginatingRequestSpecifier" originalRequestResultsIndex:5];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v2 setObject:v3 forKey:v5];

  v6 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_SportBallsRecognitionOriginatingRequestSpecifier" originalRequestResultsIndex:6];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v2 setObject:v6 forKey:v8];

  v9 = [(VNMultiDetectorOriginalRequestInfo *)[VNANFDMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNANFDMultiDetectorProcessingOption_HumanDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:7];
  id v10 = [NSString alloc];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = (void *)[v10 initWithFormat:@"%@%@%@", v12, @"_", MEMORY[0x1E4F1CC28]];
  [v2 setObject:v9 forKey:v13];

  uint64_t v14 = [v2 copy];
  v15 = (void *)+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
  +[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo = v14;
}

+ (id)detectedObjectClassToRequestKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VNANFDMultiDetectorANODv4_detectedObjectClassToRequestKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::onceToken, block);
  }
  uint64_t v2 = (void *)+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;

  return v2;
}

void __60__VNANFDMultiDetectorANODv4_detectedObjectClassToRequestKey__block_invoke(uint64_t a1)
{
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv4;
  v1 = objc_msgSendSuper2(&v15, sel_detectedObjectClassToRequestKey);
  uint64_t v2 = (void *)[v1 mutableCopy];

  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [v2 setObject:v4 forKey:&unk_1EF7A6C20];

  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v2 setObject:v6 forKey:&unk_1EF7A6C38];

  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v2 setObject:v8 forKey:&unk_1EF7A6C50];

  id v9 = [NSString alloc];
  id v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = (void *)[v9 initWithFormat:@"%@%@%@", v11, @"_", MEMORY[0x1E4F1CC28]];
  [v2 setObject:v12 forKey:&unk_1EF7A6C68];

  uint64_t v13 = [v2 copy];
  uint64_t v14 = (void *)+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
  +[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey = v13;
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
          BOOL v12 = [(VNANFDMultiDetector *)self isDetectedObject:v11 ofAGivenObjectSubClass:@"DogHead"];
          uint64_t v13 = v5;
          if (!v12)
          {
            BOOL v14 = [(VNANFDMultiDetector *)self isDetectedObject:v11 ofAGivenObjectSubClass:@"CatHead"];
            uint64_t v13 = v6;
            if (!v14)
            {
              v18.receiver = self;
              v18.super_class = (Class)VNANFDMultiDetectorANODv4;
              objc_super v15 = [(VNANFDMultiDetectorANODv3 *)&v18 splitDetectedClassResultsIntoSubclasses:v7];

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
    objc_super v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, v6, 0);
LABEL_14:
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VNANFDMultiDetectorANODv4;
    objc_super v15 = [(VNANFDMultiDetectorANODv3 *)&v23 splitDetectedClassResultsIntoSubclasses:v4];
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
  id v44 = a7;
  id v43 = a9;
  id v25 = a10;
  id v26 = a11;
  v27 = [(id)objc_opt_class() recognizedAnimalHeadObjectClassToAnimalHeadCategoryName];
  v28 = [(id)objc_opt_class() recognizedSportBallObjectClassToSportBallCategoryName];
  int v29 = [v22 labelKey];
  if ((v29 - 9) < 2)
  {
    v35 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v22, "labelKey"));
    v34 = [v27 objectForKey:v35];

    [v22 confidence];
    LODWORD(v37) = v36;
    -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v34, v23, v24, v26, x, y, width, height, v37);
  }
  else if (v29 == 11)
  {
    v38 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v22, "labelKey"));
    v34 = [v28 objectForKey:v38];

    [v22 confidence];
    LODWORD(v40) = v39;
    -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v34, v23, v24, v26, x, y, width, height, v40);
  }
  else
  {
    if (v29 != 12)
    {
      v45.receiver = self;
      v45.super_class = (Class)VNANFDMultiDetectorANODv4;
      BOOL v41 = -[VNANFDMultiDetectorANODv3 processDetectedObject:originatingRequestSpecifier:objectBoundingBox:objectGroupId:imageBuffer:qosClass:session:warningRecorder:detectedObjectResults:error:](&v45, sel_processDetectedObject_originatingRequestSpecifier_objectBoundingBox_objectGroupId_imageBuffer_qosClass_session_warningRecorder_detectedObjectResults_error_, v22, v23, v24, v44, v13, v43, x, y, width, height, v25, v26, a12);
      goto LABEL_11;
    }
    v30 = [VNHumanObservation alloc];
    [v22 confidence];
    LODWORD(v32) = v31;
    uint64_t v33 = -[VNHumanObservation initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:](v30, "initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:", v23, 0, x, y, width, height, v32);
    v34 = (void *)v33;
    if (v24) {
      -[VNDetectedObjectObservation setGroupId:](v33, v24);
    }
    [v26 addObject:v34];
  }

  BOOL v41 = 1;
LABEL_11:

  return v41;
}

@end