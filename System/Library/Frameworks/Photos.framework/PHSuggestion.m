@interface PHSuggestion
+ (BOOL)hasPersonLocalIdentifierInContextForSuggestionSubype:(unsigned __int16)a3;
+ (BOOL)managedObjectSupportsSharingComposition;
+ (BOOL)managedObjectSupportsTrashedState;
+ (double)lifetimeAfterBecomingActive;
+ (id)allAmbientSuggestionSubtypes;
+ (id)allCollectionSuggestionSubtypes;
+ (id)allFeaturedStateEnabledSuggestionTypes;
+ (id)allFeaturedStateEnabledSuggestionTypesForWallpaper;
+ (id)allFeaturedStateEnabledSuggestionTypesForWidget;
+ (id)allShuffleWallpaperAlbumSuggestionSubtypes;
+ (id)allShuffleWallpaperSuggestionSubtypes;
+ (id)allTopWallpaperSuggestionSubtypes;
+ (id)availableSuggestionTypeInfosWithOptions:(id)a3 photoLibrary:(id)a4;
+ (id)entityKeyMap;
+ (id)fetchAllFeaturedStateEnabledSuggestionsWithOptions:(id)a3;
+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3;
+ (id)fetchRecentInterestSuggestionsForAsset:(id)a3;
+ (id)fetchSuggestionsWithOptions:(id)a3;
+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 ofType:(unsigned __int16)a4 subtype:(unsigned __int16)a5 withOptions:(id)a6;
+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 ofType:(unsigned __int16)a4 withOptions:(id)a5;
+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 withOptions:(id)a4;
+ (id)fetchType;
+ (id)fetchWallpaperSuggestionsWithFeaturedState:(unsigned __int16)a3 withOptions:(id)a4;
+ (id)fetchWidgetSuggestionsWithFeaturedState:(unsigned __int16)a3 withOptions:(id)a4;
+ (id)identifierCode;
+ (id)localIdentifierWithUUID:(id)a3;
+ (id)managedEntityName;
+ (id)predicateForAllAmbientSuggestions;
+ (id)predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper;
+ (id)predicateForAllFeaturedStateEnabledSuggestionTypesForWidget;
+ (id)predicateForAllShuffleWallpaperAlbumSuggestions;
+ (id)predicateForAllShuffleWallpaperSuggestions;
+ (id)predicateForAllTopWallpaperSuggestions;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)suggestionInfosWithOptions:(id)a3 photoLibrary:(id)a4;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (id)transientSuggestionWithInfo:(id)a3 photoLibrary:(id)a4;
- (BOOL)containsUnverifiedPersons;
- (NSDate)activationDate;
- (NSDate)expungeDate;
- (NSDate)relevantUntilDate;
- (NSDictionary)actionProperties;
- (NSDictionary)featuresProperties;
- (NSString)context;
- (NSString)relatedCollectionUUID;
- (NSString)subtitle;
- (PHSuggestion)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)assets;
- (id)creationDate;
- (id)debugDescription;
- (id)description;
- (id)localizedSubtitle;
- (id)predicateForAllAssets;
- (id)predicateForAllMomentsFromRepresentativeAssets;
- (int64_t)version;
- (unint64_t)availableFeatures;
- (unint64_t)estimatedAssetCount;
- (unint64_t)estimatedPhotosCount;
- (unint64_t)estimatedVideosCount;
- (unsigned)featuredState;
- (unsigned)notificationState;
- (unsigned)sharingComposition;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
@end

@implementation PHSuggestion

+ (id)managedEntityName
{
  return @"Suggestion";
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 1;
}

void __52__PHSuggestion_transformValueExpression_forKeyPath___block_invoke()
{
  v4[21] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"uuid";
  v4[1] = @"type";
  v4[2] = @"subtype";
  v4[3] = @"state";
  v4[4] = @"notificationState";
  v4[5] = @"featuredState";
  v4[6] = @"version";
  v4[7] = @"creationDate";
  v4[8] = @"startDate";
  v4[9] = @"endDate";
  v4[10] = @"activationDate";
  v4[11] = @"relevantUntilDate";
  v4[12] = @"expungeDate";
  v4[13] = @"title";
  v4[14] = @"subtitle";
  v4[15] = @"context";
  v4[16] = @"estimatedAssetCount";
  v4[17] = @"estimatedPhotosCount";
  v4[18] = @"estimatedVideosCount";
  v4[19] = @"sharingComposition";
  v4[20] = @"availableFeatures";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:21];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_37416;
  transformValueExpression_forKeyPath___passThroughSet_37416 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_37427;

  return v2;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PHSuggestion_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_37415 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_37415, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_37416 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)fetchSuggestionsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_37398];
}

id __44__PHSuggestion_fetchSuggestionsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForSuggestionsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

void __28__PHSuggestion_entityKeyMap__block_invoke()
{
  v47[21] = *MEMORY[0x1E4F143B8];
  v19 = [PHEntityKeyMap alloc];
  v45 = @"uuid";
  v46[0] = @"uuid";
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v47[0] = v24;
  v46[1] = @"type";
  v44 = @"type";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v47[1] = v23;
  v46[2] = @"subtype";
  v43 = @"subtype";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v47[2] = v22;
  v46[3] = @"state";
  v42 = @"state";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v47[3] = v21;
  v46[4] = @"notificationState";
  v41 = @"notificationState";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v47[4] = v20;
  v46[5] = @"featuredState";
  v40 = @"featuredState";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v47[5] = v18;
  v46[6] = @"version";
  v39 = @"version";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v47[6] = v17;
  v46[7] = @"creationDate";
  v38 = @"creationDate";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v47[7] = v16;
  v46[8] = @"startDate";
  v37 = @"startDate";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v47[8] = v15;
  v46[9] = @"endDate";
  v36 = @"endDate";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v47[9] = v14;
  v46[10] = @"activationDate";
  v35 = @"activationDate";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v47[10] = v13;
  v46[11] = @"relevantUntilDate";
  v34 = @"relevantUntilDate";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v47[11] = v12;
  v46[12] = @"expungeDate";
  v33 = @"expungeDate";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v47[12] = v0;
  v46[13] = @"title";
  v32[0] = @"title";
  v32[1] = @"localizedTitle";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v47[13] = v1;
  v46[14] = @"subtitle";
  v31[0] = @"subtitle";
  v31[1] = @"localizedSubtitle";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v47[14] = v2;
  v46[15] = @"suggestionContext";
  v30 = @"context";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v47[15] = v3;
  v46[16] = @"cachedCount";
  v29 = @"estimatedAssetCount";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v47[16] = v4;
  v46[17] = @"cachedPhotosCount";
  v28 = @"estimatedPhotosCount";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v47[17] = v5;
  v46[18] = @"cachedVideosCount";
  v27 = @"estimatedVideosCount";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v47[18] = v6;
  v46[19] = @"sharingComposition";
  v26 = @"sharingComposition";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v47[19] = v7;
  v46[20] = @"availableFeatures";
  v25 = @"availableFeatures";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v47[20] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:21];
  uint64_t v10 = [(PHEntityKeyMap *)v19 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_15_37427;
  entityKeyMap_pl_once_object_15_37427 = v10;
}

- (id)localizedSubtitle
{
  return self->_subtitle;
}

+ (id)predicateForAllFeaturedStateEnabledSuggestionTypesForWidget
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = [a1 allFeaturedStateEnabledSuggestionTypesForWidget];
  v4 = [v2 predicateWithFormat:@"%K IN %@", @"type", v3];

  return v4;
}

+ (id)allFeaturedStateEnabledSuggestionTypesForWidget
{
  return &unk_1EEB26CB8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_expungeDate, 0);
  objc_storeStrong((id *)&self->_relevantUntilDate, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_featuresProperties, 0);
  objc_storeStrong((id *)&self->_actionProperties, 0);
  objc_storeStrong((id *)&self->_relatedCollectionUUID, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_featuresData, 0);

  objc_storeStrong((id *)&self->_actionData, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSDate)expungeDate
{
  return self->_expungeDate;
}

- (NSDate)relevantUntilDate
{
  return self->_relevantUntilDate;
}

- (NSDate)activationDate
{
  return self->_activationDate;
}

- (NSString)context
{
  return self->_context;
}

- (int64_t)version
{
  return self->_version;
}

- (unint64_t)availableFeatures
{
  return self->_availableFeatures;
}

- (unsigned)featuredState
{
  return self->_featuredState;
}

- (unsigned)notificationState
{
  return self->_notificationState;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (id)assets
{
  assets = self->_assets;
  if (assets)
  {
    v3 = assets;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHSuggestion;
    v3 = [(PHAssetCollection *)&v5 assets];
  }

  return v3;
}

- (BOOL)containsUnverifiedPersons
{
  uint64_t v2 = [(PHSuggestion *)self featuresProperties];
  v3 = [v2 objectForKeyedSubscript:@"containsUnverifiedPersons"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(PHSuggestion *)self description];
  objc_super v5 = [v3 stringWithString:v4];

  id v6 = [(PHSuggestion *)self actionProperties];
  [v5 appendFormat:@"\nactionProperties: %@", v6];

  id v7 = [(PHSuggestion *)self featuresProperties];
  [v5 appendFormat:@"\nfeaturesProperties: %@", v7];

  return v5;
}

- (id)description
{
  v20.receiver = self;
  v20.super_class = (Class)PHSuggestion;
  v3 = [(PHAssetCollection *)&v20 description];
  unsigned int v4 = [(PHSuggestion *)self type] - 1;
  if (v4 > 0xA) {
    objc_super v5 = @"Unknown Type";
  }
  else {
    objc_super v5 = off_1E5847408[(unsigned __int16)v4];
  }
  id v6 = PHSuggestionStringWithSubtype([(PHSuggestion *)self subtype]);
  unsigned int v7 = [(PHSuggestion *)self state];
  if (v7 > 4) {
    id v8 = @"Unknown State";
  }
  else {
    id v8 = off_1E5847460[v7];
  }
  unsigned int v9 = [(PHSuggestion *)self notificationState];
  uint64_t v10 = @"Unknown State";
  if (v9 <= 2) {
    uint64_t v10 = off_1E5847488[v9];
  }
  int v11 = [(PHSuggestion *)self featuredState];
  v12 = @"Currently Featured";
  if (v11 != 1) {
    v12 = @"Unknown State";
  }
  if (!v11) {
    v12 = @"Not Featured";
  }
  v13 = v12;
  int64_t v14 = [(PHSuggestion *)self version];
  v15 = [(PHSuggestion *)self creationDate];
  v16 = [(PHSuggestion *)self relevantUntilDate];
  v17 = [(PHSuggestion *)self activationDate];
  v18 = [v3 stringByAppendingFormat:@", type: %@, subtype: %@, state: %@, notificationState: %@, featuredState: %@ version: %ld, created: %@, onlyRelevantUntil: %@, activationDate: %@", v5, v6, v8, v10, v13, v14, v15, v16, v17];

  return v18;
}

- (NSString)relatedCollectionUUID
{
  unsigned int v4 = [(PHSuggestion *)self type];
  if (v4 < 9 || v4 == 11)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHSuggestion.m", 701, @"%s cannot be called on %hu type Suggestion", "-[PHSuggestion relatedCollectionUUID]", -[PHSuggestion type](self, "type"));
  }
  relatedCollectionUUID = self->_relatedCollectionUUID;

  return relatedCollectionUUID;
}

- (NSDictionary)featuresProperties
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  featuresProperties = self->_featuresProperties;
  if (!featuresProperties)
  {
    if (self->_featuresData)
    {
      v17 = (void *)MEMORY[0x1E4F28DC0];
      unsigned int v4 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      int v11 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
      featuresData = self->_featuresData;
      id v18 = 0;
      v13 = [v17 unarchivedObjectOfClasses:v11 fromData:featuresData error:&v18];
      id v14 = v18;
      v15 = self->_featuresProperties;
      self->_featuresProperties = v13;

      if (!self->_featuresProperties)
      {
        self->_featuresProperties = (NSDictionary *)MEMORY[0x1E4F1CC08];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v14;
          _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving featuresData from Suggestion: %@", buf, 0xCu);
        }
      }

      featuresProperties = self->_featuresProperties;
    }
    else
    {
      featuresProperties = 0;
    }
  }

  return featuresProperties;
}

- (NSDictionary)actionProperties
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  actionProperties = self->_actionProperties;
  if (!actionProperties)
  {
    if (self->_actionData)
    {
      unsigned int v4 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
      actionData = self->_actionData;
      id v16 = 0;
      v12 = [v4 unarchivedObjectOfClasses:v10 fromData:actionData error:&v16];
      id v13 = v16;
      id v14 = self->_actionProperties;
      self->_actionProperties = v12;

      if (!self->_actionProperties)
      {
        self->_actionProperties = (NSDictionary *)MEMORY[0x1E4F1CC08];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v13;
          _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving actionData from Suggestion: %@", buf, 0xCu);
        }
      }

      actionProperties = self->_actionProperties;
    }
    else
    {
      actionProperties = 0;
    }
  }

  return actionProperties;
}

- (id)predicateForAllMomentsFromRepresentativeAssets
{
  v3 = (void *)MEMORY[0x1E4F8AC28];
  unsigned int v4 = [(PHObject *)self objectID];
  uint64_t v5 = [(PHObject *)self photoLibrary];
  uint64_t v6 = [v5 managedObjectContextForCurrentQueueQoS];
  uint64_t v7 = [v3 predicateForAllMomentsFromRepresentativeAssetsInSuggestion:v4 managedObjectContext:v6];

  return v7;
}

- (id)predicateForAllAssets
{
  v3 = (void *)MEMORY[0x1E4F8AC28];
  unsigned int v4 = [(PHObject *)self objectID];
  uint64_t v5 = [(PHObject *)self photoLibrary];
  uint64_t v6 = [v5 managedObjectContextForCurrentQueueQoS];
  uint64_t v7 = [v3 predicateForAllAssetsInSuggestion:v4 managedObjectContext:v6];

  return v7;
}

- (PHSuggestion)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PHSuggestion;
  uint64_t v9 = [(PHAssetCollection *)&v48 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"type"];
    int v11 = (unsigned __int16)[v10 integerValue];
    if ((v11 - 1) >= 0xB) {
      LOWORD(v11) = 0;
    }
    v9->_type = v11;

    v12 = [v8 objectForKeyedSubscript:@"subtype"];
    v9->_subtype = PHSuggestionSubtypeForCPLSuggestionSubtype((unsigned __int16)[v12 integerValue]);

    id v13 = [v8 objectForKeyedSubscript:@"state"];
    int v14 = (unsigned __int16)[v13 integerValue];
    if ((v14 - 1) >= 4) {
      LOWORD(v14) = 0;
    }
    v9->_state = v14;

    v15 = [v8 objectForKeyedSubscript:@"notificationState"];
    int v16 = (unsigned __int16)[v15 integerValue];
    if (v16 == 2) {
      __int16 v17 = 2;
    }
    else {
      __int16 v17 = v16 == 1;
    }
    v9->_notificationState = v17;

    id v18 = [v8 objectForKeyedSubscript:@"featuredState"];
    v9->_featuredState = (unsigned __int16)[v18 integerValue] != 0;

    uint64_t v19 = [v8 objectForKeyedSubscript:@"version"];
    v9->_version = [v19 integerValue];

    uint64_t v20 = [v8 objectForKeyedSubscript:@"creationDate"];
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v20;

    uint64_t v22 = [v8 objectForKeyedSubscript:@"startDate"];
    startDate = v9->super._startDate;
    v9->super._startDate = (NSDate *)v22;

    uint64_t v24 = [v8 objectForKeyedSubscript:@"endDate"];
    endDate = v9->super._endDate;
    v9->super._endDate = (NSDate *)v24;

    uint64_t v26 = [v8 objectForKeyedSubscript:@"activationDate"];
    activationDate = v9->_activationDate;
    v9->_activationDate = (NSDate *)v26;

    uint64_t v28 = [v8 objectForKeyedSubscript:@"relevantUntilDate"];
    relevantUntilDate = v9->_relevantUntilDate;
    v9->_relevantUntilDate = (NSDate *)v28;

    uint64_t v30 = [v8 objectForKeyedSubscript:@"expungeDate"];
    expungeDate = v9->_expungeDate;
    v9->_expungeDate = (NSDate *)v30;

    uint64_t v32 = [v8 objectForKeyedSubscript:@"actionData"];
    actionData = v9->_actionData;
    v9->_actionData = (NSData *)v32;

    uint64_t v34 = [v8 objectForKeyedSubscript:@"featuresData"];
    featuresData = v9->_featuresData;
    v9->_featuresData = (NSData *)v34;

    uint64_t v36 = [v8 objectForKeyedSubscript:@"subtitle"];
    subtitle = v9->_subtitle;
    v9->_subtitle = (NSString *)v36;

    uint64_t v38 = [v8 objectForKeyedSubscript:@"suggestionContext"];
    context = v9->_context;
    v9->_context = (NSString *)v38;

    uint64_t v40 = [v8 objectForKeyedSubscript:@"relatedCollectionUUID"];
    relatedCollectionUUID = v9->_relatedCollectionUUID;
    v9->_relatedCollectionUUID = (NSString *)v40;

    v42 = [v8 objectForKeyedSubscript:@"cachedCount"];
    v9->_approximateCount = [v42 integerValue];

    v43 = [v8 objectForKeyedSubscript:@"cachedPhotosCount"];
    v9->_approximatePhotosCount = [v43 integerValue];

    v44 = [v8 objectForKeyedSubscript:@"cachedVideosCount"];
    v9->_approximateVideosCount = [v44 integerValue];

    v9->super._assetCollectionType = 8;
    v45 = [v8 objectForKeyedSubscript:@"sharingComposition"];
    v9->_sharingComposition = [v45 unsignedIntegerValue];

    v46 = [v8 objectForKeyedSubscript:@"availableFeatures"];
    v9->_availableFeatures = [v46 unsignedIntegerValue];
  }
  return v9;
}

- (unint64_t)estimatedVideosCount
{
  return self->_approximateVideosCount;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_approximatePhotosCount;
}

- (unint64_t)estimatedAssetCount
{
  return self->_approximateCount;
}

- (id)creationDate
{
  return self->_creationDate;
}

+ (id)suggestionInfosWithOptions:(id)a3 photoLibrary:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 photoAnalysisClient];
  id v11 = 0;
  uint64_t v7 = [v6 requestSuggestionInfosWithOptions:v5 error:&v11];

  id v8 = v11;
  if (!v7)
  {
    uint64_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "suggestionInfosWithOptions encountered error:%@", buf, 0xCu);
    }
  }

  return v7;
}

+ (id)availableSuggestionTypeInfosWithOptions:(id)a3 photoLibrary:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 photoAnalysisClient];
  id v11 = 0;
  uint64_t v7 = [v6 requestAvailableSuggestionTypeInfosWithOptions:v5 error:&v11];

  id v8 = v11;
  if (!v7)
  {
    uint64_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "suggesterInfosWithOptions encountered error:%@", buf, 0xCu);
    }
  }

  return v7;
}

+ (id)transientSuggestionWithInfo:(id)a3 photoLibrary:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [v9 UUIDString];
  [v8 setObject:v10 forKeyedSubscript:@"uuid"];

  uint64_t v11 = [v5 objectForKeyedSubscript:@"type"];
  if (v11) {
    [v8 setObject:v11 forKeyedSubscript:@"type"];
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:@"subtype"];
  if (v12) {
    [v8 setObject:v12 forKeyedSubscript:@"subtype"];
  }
  uint64_t v13 = [v5 objectForKeyedSubscript:@"title"];
  if (v13) {
    [v8 setObject:v13 forKeyedSubscript:@"title"];
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:@"subtitle"];
  if (v14) {
    [v8 setObject:v14 forKeyedSubscript:@"subtitle"];
  }
  uint64_t v34 = (void *)v11;
  uint64_t v15 = [v5 objectForKeyedSubscript:@"context"];
  uint64_t v30 = (void *)v15;
  if (v15)
  {
    [v8 setObject:v15 forKeyedSubscript:@"suggestionContext"];
    uint64_t v28 = [v5 objectForKeyedSubscript:@"relatedCollectionUUID"];
    objc_msgSend(v8, "setObject:forKeyedSubscript:");
  }
  else
  {
    uint64_t v28 = [v5 objectForKeyedSubscript:@"relatedCollectionUUID"];
  }
  int v16 = objc_msgSend(v5, "objectForKeyedSubscript:", @"creationDate", v28);
  if (v16) {
    [v8 setObject:v16 forKeyedSubscript:@"creationDate"];
  }
  __int16 v17 = [v5 objectForKeyedSubscript:@"universalStartDate"];
  if (v17) {
    [v8 setObject:v17 forKeyedSubscript:@"startDate"];
  }
  v31 = (void *)v14;
  uint64_t v32 = (void *)v13;
  v33 = (void *)v12;
  id v18 = [v5 objectForKeyedSubscript:@"universalEndDate"];
  if (v18) {
    [v8 setObject:v18 forKeyedSubscript:@"endDate"];
  }
  uint64_t v19 = [[PHSuggestion alloc] initWithFetchDictionary:v8 propertyHint:-1 photoLibrary:v7];
  uint64_t v20 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v7 orObject:0];

  uint64_t v21 = [v5 objectForKeyedSubscript:@"keyAssetUUID"];
  uint64_t v22 = +[PHObject localIdentifierWithUUID:v21];

  v35[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  uint64_t v24 = +[PHAsset fetchAssetsWithLocalIdentifiers:v23 options:v20];
  uint64_t v25 = [v24 fetchedObjects];
  assets = v19->_assets;
  v19->_assets = (NSArray *)v25;

  return v19;
}

+ (id)fetchRecentInterestSuggestionsForAsset:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  uint64_t v6 = [v5 librarySpecificFetchOptions];

  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = [a1 allFeaturedStateEnabledSuggestionTypesForWidget];
  uint64_t v9 = [v7 predicateWithFormat:@"%K IN (%@)", @"type", v8];
  [v6 setPredicate:v9];

  v14[0] = v4;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v11 = +[PHQuery queryForAssetCollectionsContainingAssets:v10 withType:8 options:v6];

  uint64_t v12 = [v11 executeQuery];

  return v12;
}

+ (id)fetchWallpaperSuggestionsWithFeaturedState:(unsigned __int16)a3 withOptions:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PHSuggestion_fetchWallpaperSuggestionsWithFeaturedState_withOptions___block_invoke;
  v6[3] = &__block_descriptor_42_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6[4] = a1;
  unsigned __int16 v7 = a3;
  id v4 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v6];

  return v4;
}

id __71__PHSuggestion_fetchWallpaperSuggestionsWithFeaturedState_withOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 allFeaturedStateEnabledSuggestionTypesForWallpaper];
  uint64_t v6 = +[PHQuery queryForSuggestionsWithFeaturedState:*(unsigned __int16 *)(a1 + 40) types:v5 options:v4];

  unsigned __int16 v7 = [v6 executeQuery];

  return v7;
}

+ (id)fetchWidgetSuggestionsWithFeaturedState:(unsigned __int16)a3 withOptions:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PHSuggestion_fetchWidgetSuggestionsWithFeaturedState_withOptions___block_invoke;
  v6[3] = &__block_descriptor_42_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6[4] = a1;
  unsigned __int16 v7 = a3;
  id v4 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v6];

  return v4;
}

id __68__PHSuggestion_fetchWidgetSuggestionsWithFeaturedState_withOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 allFeaturedStateEnabledSuggestionTypesForWidget];
  uint64_t v6 = +[PHQuery queryForSuggestionsWithFeaturedState:*(unsigned __int16 *)(a1 + 40) types:v5 options:v4];

  unsigned __int16 v7 = [v6 executeQuery];

  return v7;
}

+ (id)fetchAllFeaturedStateEnabledSuggestionsWithOptions:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PHSuggestion_fetchAllFeaturedStateEnabledSuggestionsWithOptions___block_invoke;
  v5[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v5[4] = a1;
  v3 = +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:v5];

  return v3;
}

id __67__PHSuggestion_fetchAllFeaturedStateEnabledSuggestionsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 allFeaturedStateEnabledSuggestionTypes];
  id v5 = +[PHQuery queryForSuggestionsWithTypes:v4 options:v3];

  uint64_t v6 = [v5 executeQuery];

  return v6;
}

+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 ofType:(unsigned __int16)a4 subtype:(unsigned __int16)a5 withOptions:(id)a6
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PHSuggestion_fetchSuggestionsWithState_ofType_subtype_withOptions___block_invoke;
  v8[3] = &__block_descriptor_38_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  unsigned __int16 v9 = a3;
  unsigned __int16 v10 = a4;
  unsigned __int16 v11 = a5;
  uint64_t v6 = +[PHObject authorizationAwareFetchResultWithOptions:a6 fetchBlock:v8];

  return v6;
}

id __69__PHSuggestion_fetchSuggestionsWithState_ofType_subtype_withOptions___block_invoke(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForSuggestionsWithState:a1[16] type:a1[17] subtype:a1[18] options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 ofType:(unsigned __int16)a4 withOptions:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PHSuggestion_fetchSuggestionsWithState_ofType_withOptions___block_invoke;
  v7[3] = &__block_descriptor_36_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  unsigned __int16 v8 = a3;
  unsigned __int16 v9 = a4;
  id v5 = +[PHObject authorizationAwareFetchResultWithOptions:a5 fetchBlock:v7];

  return v5;
}

id __61__PHSuggestion_fetchSuggestionsWithState_ofType_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForSuggestionsWithState:*(unsigned __int16 *)(a1 + 32) type:*(unsigned __int16 *)(a1 + 34) subtype:0 options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 withOptions:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PHSuggestion_fetchSuggestionsWithState_withOptions___block_invoke;
  v6[3] = &__block_descriptor_34_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  unsigned __int16 v7 = a3;
  id v4 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v6];

  return v4;
}

id __54__PHSuggestion_fetchSuggestionsWithState_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForSuggestionsWithState:*(unsigned __int16 *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)allFeaturedStateEnabledSuggestionTypesForWallpaper
{
  return &unk_1EEB26CD0;
}

+ (id)allFeaturedStateEnabledSuggestionTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [a1 allFeaturedStateEnabledSuggestionTypesForWidget];
  [v3 addObjectsFromArray:v4];

  id v5 = [a1 allFeaturedStateEnabledSuggestionTypesForWallpaper];
  [v3 addObjectsFromArray:v5];

  [v3 addObject:&unk_1EEB26208];

  return v3;
}

+ (id)predicateForAllAmbientSuggestions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"type", 8);
  v11[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [a1 allAmbientSuggestionSubtypes];
  unsigned __int16 v7 = [v5 predicateWithFormat:@"%K IN %@", @"subtype", v6];
  v11[1] = v7;
  unsigned __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  unsigned __int16 v9 = [v3 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForAllShuffleWallpaperAlbumSuggestions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"type", 6);
  v11[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [a1 allShuffleWallpaperAlbumSuggestionSubtypes];
  unsigned __int16 v7 = [v5 predicateWithFormat:@"%K IN %@", @"subtype", v6];
  v11[1] = v7;
  unsigned __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  unsigned __int16 v9 = [v3 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForAllShuffleWallpaperSuggestions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"type", 6);
  v11[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [a1 allShuffleWallpaperSuggestionSubtypes];
  unsigned __int16 v7 = [v5 predicateWithFormat:@"%K IN %@", @"subtype", v6];
  v11[1] = v7;
  unsigned __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  unsigned __int16 v9 = [v3 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForAllTopWallpaperSuggestions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"type", 6);
  v11[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [a1 allTopWallpaperSuggestionSubtypes];
  unsigned __int16 v7 = [v5 predicateWithFormat:@"%K IN %@", @"subtype", v6];
  v11[1] = v7;
  unsigned __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  unsigned __int16 v9 = [v3 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (BOOL)hasPersonLocalIdentifierInContextForSuggestionSubype:(unsigned __int16)a3
{
  BOOL result = 1;
  if ((a3 - 602) > 0x33 || ((1 << (a3 - 90)) & 0xC000000000003) == 0) {
    return (a3 - 803) < 2;
  }
  return result;
}

+ (id)allCollectionSuggestionSubtypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEB26CA0];
}

+ (id)allAmbientSuggestionSubtypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEB26C88];
}

+ (id)allShuffleWallpaperAlbumSuggestionSubtypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEB26C70];
}

+ (id)allShuffleWallpaperSuggestionSubtypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEB26C58];
}

+ (id)allTopWallpaperSuggestionSubtypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEB26C40];
}

+ (id)predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  id v3 = [a1 allFeaturedStateEnabledSuggestionTypesForWallpaper];
  id v4 = [v2 predicateWithFormat:@"%K IN %@", @"type", v3];

  return v4;
}

+ (double)lifetimeAfterBecomingActive
{
  return 5184000.0;
}

+ (id)identifierCode
{
  return @"160";
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  if (!a3)
  {
LABEL_4:
    id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"sharingComposition", a3, v3);
    return v5;
  }
  if (a3 == 1)
  {
    *(void *)&a3 = 1;
    goto LABEL_4;
  }
  id v5 = 0;
  return v5;
}

+ (id)fetchType
{
  uint64_t v2 = @"PHSuggestion";
  return @"PHSuggestion";
}

+ (id)localIdentifierWithUUID:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [a1 identifierCode];
  unsigned __int16 v7 = [v4 stringWithFormat:@"%@/L0/%@", v5, v6];

  return v7;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PHSuggestion_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_37447 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_37447, block);
  }
  uint64_t v3 = (void *)propertiesToFetchWithHint__array_37448;

  return v3;
}

void __42__PHSuggestion_propertiesToFetchWithHint___block_invoke()
{
  v4[25] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"uuid";
  v4[2] = @"type";
  v4[3] = @"subtype";
  v4[4] = @"state";
  v4[5] = @"notificationState";
  v4[6] = @"featuredState";
  v4[7] = @"version";
  v4[8] = @"creationDate";
  v4[9] = @"startDate";
  v4[10] = @"endDate";
  v4[11] = @"activationDate";
  v4[12] = @"relevantUntilDate";
  v4[13] = @"expungeDate";
  v4[14] = @"title";
  v4[15] = @"subtitle";
  v4[16] = @"suggestionContext";
  v4[17] = @"relatedCollectionUUID";
  v4[18] = @"actionData";
  v4[19] = @"featuresData";
  v4[20] = @"cachedCount";
  v4[21] = @"cachedPhotosCount";
  void v4[22] = @"cachedVideosCount";
  v4[23] = @"sharingComposition";
  v4[24] = @"availableFeatures";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:25];
  uint64_t v3 = (void *)propertiesToFetchWithHint__array_37448;
  propertiesToFetchWithHint__array_37448 = v2;
}

@end