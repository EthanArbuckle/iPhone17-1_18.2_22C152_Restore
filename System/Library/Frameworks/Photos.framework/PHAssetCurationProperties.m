@interface PHAssetCurationProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)isDetectedScreenshot;
- (NSArray)objectSaliencyRects;
- (NSDate)addedDate;
- (NSDate)lastSharedDate;
- (NSString)importedByBundleIdentifier;
- (NSString)importedByDisplayName;
- (NSString)syndicationIdentifier;
- (PHAssetCurationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (float)_semanticScoreFromBehavioralScore:(double)a3;
- (float)behavioralScore;
- (float)interactionScore;
- (float)interestingSubjectScore;
- (float)semanticScore;
@end

@implementation PHAssetCurationProperties

- (NSString)syndicationIdentifier
{
  return self->_syndicationIdentifier;
}

- (PHAssetCurationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PHAssetCurationProperties;
  v10 = [(PHAssetCurationProperties *)&v36 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    uint64_t v12 = [v8 objectForKeyedSubscript:@"additionalAttributes.importedByBundleIdentifier"];
    importedByBundleIdentifier = v11->_importedByBundleIdentifier;
    v11->_importedByBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v8 objectForKeyedSubscript:@"additionalAttributes.importedByDisplayName"];
    importedByDisplayName = v11->_importedByDisplayName;
    v11->_importedByDisplayName = (NSString *)v14;

    uint64_t v16 = [v8 objectForKeyedSubscript:@"addedDate"];
    addedDate = v11->_addedDate;
    v11->_addedDate = (NSDate *)v16;

    v18 = [v8 objectForKey:@"computedAttributes.interestingSubjectScore"];
    v19 = v18;
    if (v18) {
      [v18 floatValue];
    }
    else {
      float v20 = 0.5;
    }
    v11->_interestingSubjectScore = v20;
    if (v5) {
      v21 = @"computedAttributes.behavioralScore";
    }
    else {
      v21 = @"behavioralScore";
    }
    if (v5) {
      v22 = @"computedAttributes.interactionScore";
    }
    else {
      v22 = @"interactionScore";
    }
    v23 = [v8 objectForKeyedSubscript:v21];
    [v23 floatValue];
    v11->_behavioralScore = v24;

    v25 = [v8 objectForKeyedSubscript:v22];
    [v25 floatValue];
    v11->_interactionScore = v26;

    uint64_t v27 = [v8 objectForKeyedSubscript:@"lastSharedDate"];
    lastSharedDate = v11->_lastSharedDate;
    v11->_lastSharedDate = (NSDate *)v27;

    [(PHAssetCurationProperties *)v11 _semanticScoreFromBehavioralScore:v11->_behavioralScore];
    v11->_semanticScore = v29;
    uint64_t v30 = [v8 objectForKeyedSubscript:@"additionalAttributes.objectSaliencyRectsData"];
    objectSaliencyRectsData = v11->_objectSaliencyRectsData;
    v11->_objectSaliencyRectsData = (NSData *)v30;

    uint64_t v32 = [v8 objectForKeyedSubscript:@"additionalAttributes.syndicationIdentifier"];
    syndicationIdentifier = v11->_syndicationIdentifier;
    v11->_syndicationIdentifier = (NSString *)v32;

    v34 = [v8 objectForKeyedSubscript:@"isDetectedScreenshot"];
    v11->_isDetectedScreenshot = [v34 BOOLValue];
  }
  return v11;
}

- (float)_semanticScoreFromBehavioralScore:(double)a3
{
  return fmod(a3, 0.1) * 100.0;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetCuration";
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_55;

  return v2;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_importedByDisplayName, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedObjectSaliencyRects, 0);

  objc_storeStrong((id *)&self->_objectSaliencyRectsData, 0);
}

- (BOOL)isDetectedScreenshot
{
  return self->_isDetectedScreenshot;
}

- (NSDate)lastSharedDate
{
  return self->_lastSharedDate;
}

- (float)interactionScore
{
  return self->_interactionScore;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (float)behavioralScore
{
  return self->_behavioralScore;
}

- (float)interestingSubjectScore
{
  return self->_interestingSubjectScore;
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (NSString)importedByDisplayName
{
  return self->_importedByDisplayName;
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (NSArray)objectSaliencyRects
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  cachedObjectSaliencyRects = self->_cachedObjectSaliencyRects;
  if (!cachedObjectSaliencyRects)
  {
    if (self->_objectSaliencyRectsData)
    {
      v4 = (void *)MEMORY[0x1E4F28DC0];
      BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = objc_opt_class();
      v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
      objectSaliencyRectsData = self->_objectSaliencyRectsData;
      id v14 = 0;
      id v9 = [v4 unarchivedObjectOfClasses:v7 fromData:objectSaliencyRectsData error:&v14];
      id v10 = v14;
      v11 = self->_cachedObjectSaliencyRects;
      self->_cachedObjectSaliencyRects = v9;

      if (!self->_cachedObjectSaliencyRects)
      {
        uint64_t v12 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = v10;
          _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Failed to unarchive objectSaliencyRectsData: %@", buf, 0xCu);
        }
      }
      cachedObjectSaliencyRects = self->_cachedObjectSaliencyRects;
    }
    else
    {
      cachedObjectSaliencyRects = 0;
    }
  }

  return cachedObjectSaliencyRects;
}

void __46__PHAssetCurationProperties_propertiesToFetch__block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v3[0] = @"addedDate";
  v3[1] = @"computedAttributes.interestingSubjectScore";
  v3[2] = @"computedAttributes.behavioralScore";
  v3[3] = @"computedAttributes.interactionScore";
  v3[4] = @"lastSharedDate";
  v3[5] = @"additionalAttributes.objectSaliencyRectsData";
  v3[6] = @"additionalAttributes.importedByBundleIdentifier";
  v3[7] = @"additionalAttributes.importedByDisplayName";
  v3[8] = @"additionalAttributes.syndicationIdentifier";
  v3[9] = @"isDetectedScreenshot";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:10];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_55;
  propertiesToFetch_pl_once_object_55 = v1;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

@end