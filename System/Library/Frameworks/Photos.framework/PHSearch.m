@interface PHSearch
+ (id)spotlightContentRatingFromPhotosSceneClassifications:(id)a3 algorithmVersion:(int64_t)a4;
+ (id)spotlightSceneClassificationsFromDetectionTraits:(id)a3;
+ (id)spotlightSceneClassificationsFromPhotosSceneClassifications:(id)a3 algorithmVersion:(int64_t)a4;
+ (id)spotlightTextLinesFromDocumentObservation:(id)a3 algorithmVersion:(int64_t)a4;
@end

@implementation PHSearch

+ (id)spotlightSceneClassificationsFromDetectionTraits:(id)a3
{
  return (id)[MEMORY[0x1E4F8AC18] spotlightScenesFromDetectionTraits:a3];
}

+ (id)spotlightContentRatingFromPhotosSceneClassifications:(id)a3 algorithmVersion:(int64_t)a4
{
  return (id)[MEMORY[0x1E4F8AC18] contentRatingFromScenes:a3 algorithmVersion:(__int16)a4];
}

+ (id)spotlightSceneClassificationsFromPhotosSceneClassifications:(id)a3 algorithmVersion:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  id v7 = objc_alloc_init(MEMORY[0x1E4F8ABA8]);
  v8 = [v7 searchIndexSceneTaxonomyForSceneAnalysisVersion:(__int16)a4];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F8AC18] spotlightScenesFromScenes:v5 sceneTaxonomy:v8];
    [v6 addObjectsFromArray:v9];
    v10 = [MEMORY[0x1E4F8AC18] spotlightAudioClassificationsFromScenes:v5];
    [v6 addObjectsFromArray:v10];
    v11 = (void *)[v6 copy];
  }
  else
  {
    v12 = PLSearchBackendSceneTaxonomyGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134217984;
      int64_t v15 = a4;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Failed to load Scene Taxonomy for analysis version: %ld. Unable to translate scenes.", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

+ (id)spotlightTextLinesFromDocumentObservation:(id)a3 algorithmVersion:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F8ABB0], "spotlightTextLinesFromDocumentObservation:", a3, a4);
}

@end