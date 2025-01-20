@interface PHLibraryScope
+ (BOOL)managedObjectSupportsShareExitingState;
+ (BOOL)managedObjectSupportsShareExpiredState;
+ (BOOL)managedObjectSupportsShareTrashedState;
+ (BOOL)removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)_estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:(BOOL)a3 options:(id)a4 error:(id *)a5;
+ (id)entityKeyMap;
+ (id)fetchActiveLibraryScopeWithOptions:(id)a3;
+ (id)fetchLibraryScopesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchLibraryScopesWithOptions:(id)a3;
+ (id)fetchPendingLibraryScopeInvitationWithOptions:(id)a3;
+ (id)fetchPreviewLibraryScopeWithOptions:(id)a3;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)localIdentifierWithUUID:(id)a3;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (unint64_t)estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7 options:(id)a8 error:(id *)a9;
+ (void)fetchLibraryScopeFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
+ (void)fetchLibraryScopeFromShareURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
+ (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary:(id)a3 completion:(id)a4;
- (BOOL)libraryScopeInLocalMode;
- (Class)changeRequestClass;
- (NSData)rulesData;
- (NSDate)creationDate;
- (NSDate)expiryDate;
- (NSString)scopeIdentifier;
- (NSString)title;
- (NSURL)shareURL;
- (PHLibraryScope)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)activateLibraryScopeWithCompletion:(id)a3;
- (id)markOnboardingPreviewAssetsByProcessingRulesWithCompletion:(id)a3;
- (int64_t)exitState;
- (signed)autoSharePolicy;
- (signed)participantCloudUpdateState;
- (signed)previewState;
- (signed)publicPermission;
- (signed)publishState;
- (signed)scopeSyncingState;
- (unint64_t)cloudItemCount;
- (unint64_t)cloudPhotoCount;
- (unint64_t)cloudVideoCount;
- (unsigned)status;
- (unsigned)trashedState;
- (void)acceptLibraryScopeWithCompletion:(id)a3;
- (void)deactivateLibraryScopeWithCompletion:(id)a3;
- (void)getCloudStatusCountsWithCompletionHandler:(id)a3;
- (void)publishLibraryScopeWithCompletionHandler:(id)a3;
- (void)refreshLibraryScopeWithCompletion:(id)a3;
- (void)removeParticipants:(id)a3 exitSource:(int64_t)a4 completion:(id)a5;
- (void)startExitFromLibraryScopeWithRetentionPolicy:(int64_t)a3 exitSource:(int64_t)a4 completion:(id)a5;
- (void)unsharePendingAssetsSharedToScope;
@end

@implementation PHLibraryScope

+ (id)managedEntityName
{
  return @"LibraryScope";
}

+ (BOOL)managedObjectSupportsShareTrashedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsShareExpiredState
{
  return 1;
}

+ (BOOL)managedObjectSupportsShareExitingState
{
  return 1;
}

id __53__PHLibraryScope_fetchActiveLibraryScopeWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForActiveLibraryScopeWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

void __54__PHLibraryScope_transformValueExpression_forKeyPath___block_invoke()
{
  v4[18] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"title";
  v4[1] = @"creationDate";
  v4[2] = @"uuid";
  v4[3] = @"status";
  v4[4] = @"shareURL";
  v4[5] = @"scopeIdentifier";
  v4[6] = @"expiryDate";
  v4[7] = @"trashedState";
  v4[8] = @"publishState";
  v4[9] = @"participantCloudUpdateState";
  v4[10] = @"autoSharePolicy";
  v4[11] = @"previewState";
  v4[12] = @"publicPermission";
  v4[13] = @"rulesData";
  v4[14] = @"cloudPhotoCount";
  v4[15] = @"cloudVideoCount";
  v4[16] = @"cloudItemCount";
  v4[17] = @"exitState";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:18];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_30665;
  transformValueExpression_forKeyPath___passThroughSet_30665 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_30674;

  return v2;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PHLibraryScope_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_30664 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_30664, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_30665 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

id __64__PHLibraryScope_fetchPendingLibraryScopeInvitationWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForPendingLibraryScopeInvitationWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

id __54__PHLibraryScope_fetchPreviewLibraryScopeWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForPreviewLibraryScopeWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchActiveLibraryScopeWithOptions:(id)a3
{
  id v5 = a3;
  id v6 = [v5 photoLibrary];

  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHLibraryScope.m" lineNumber:231 description:@"Valid PHPhotoLibrary must be specified via fetch options"];
  }
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v5 fetchBlock:&__block_literal_global_133];

  return v7;
}

void __30__PHLibraryScope_entityKeyMap__block_invoke()
{
  v43[19] = *MEMORY[0x1E4F143B8];
  v17 = [PHEntityKeyMap alloc];
  v41 = @"title";
  v42[0] = @"title";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v43[0] = v22;
  v42[1] = @"creationDate";
  v40 = @"creationDate";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v43[1] = v21;
  v42[2] = @"uuid";
  v39 = @"uuid";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v43[2] = v20;
  v42[3] = @"status";
  v38 = @"status";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v43[3] = v19;
  v42[4] = @"shareURL";
  v37 = @"shareURL";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v43[4] = v18;
  v42[5] = @"scopeIdentifier";
  v36 = @"scopeIdentifier";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v43[5] = v16;
  v42[6] = @"expiryDate";
  v35 = @"expiryDate";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v43[6] = v15;
  v42[7] = @"trashedState";
  v34 = @"trashedState";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v43[7] = v14;
  v42[8] = @"localPublishState";
  v33 = @"publishState";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v43[8] = v13;
  v42[9] = @"participantCloudUpdateState";
  v32 = @"participantCloudUpdateState";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v43[9] = v12;
  v42[10] = @"autoSharePolicy";
  v31 = @"autoSharePolicy";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v43[10] = v0;
  v42[11] = @"scopeSyncingState";
  v30 = @"scopeSyncingState";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v43[11] = v1;
  v42[12] = @"previewState";
  v29 = @"previewState";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v43[12] = v2;
  v42[13] = @"publicPermission";
  v28 = @"publicPermission";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v43[13] = v3;
  v42[14] = @"rulesData";
  v27 = @"rulesData";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v43[14] = v4;
  v42[15] = @"cloudPhotoCount";
  v26 = @"cloudPhotoCount";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v43[15] = v5;
  v42[16] = @"cloudVideoCount";
  v25 = @"cloudVideoCount";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v43[16] = v6;
  v42[17] = @"cloudItemCount";
  v24 = @"cloudItemCount";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v43[17] = v7;
  v42[18] = @"exitState";
  v23 = @"exitState";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v43[18] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:19];
  uint64_t v10 = [(PHEntityKeyMap *)v17 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_15_30674;
  entityKeyMap_pl_once_object_15_30674 = v10;
}

+ (id)fetchPreviewLibraryScopeWithOptions:(id)a3
{
  id v5 = a3;
  id v6 = [v5 photoLibrary];

  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHLibraryScope.m" lineNumber:239 description:@"Valid PHPhotoLibrary must be specified via fetch options"];
  }
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v5 fetchBlock:&__block_literal_global_135];

  return v7;
}

+ (id)fetchPendingLibraryScopeInvitationWithOptions:(id)a3
{
  id v5 = a3;
  id v6 = [v5 photoLibrary];

  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHLibraryScope.m" lineNumber:247 description:@"Valid PHPhotoLibrary must be specified via fetch options"];
  }
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v5 fetchBlock:&__block_literal_global_137];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_rulesData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_shareURL, 0);
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (unint64_t)cloudItemCount
{
  return self->_cloudItemCount;
}

- (unint64_t)cloudVideoCount
{
  return self->_cloudVideoCount;
}

- (unint64_t)cloudPhotoCount
{
  return self->_cloudPhotoCount;
}

- (BOOL)libraryScopeInLocalMode
{
  return self->_libraryScopeInLocalMode;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)exitState
{
  return self->_exitState;
}

- (signed)scopeSyncingState
{
  return self->_scopeSyncingState;
}

- (NSData)rulesData
{
  return self->_rulesData;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (signed)previewState
{
  return self->_previewState;
}

- (signed)autoSharePolicy
{
  return self->_autoSharePolicy;
}

- (signed)participantCloudUpdateState
{
  return self->_participantCloudUpdateState;
}

- (signed)publishState
{
  return self->_publishState;
}

- (unsigned)trashedState
{
  return self->_trashedState;
}

- (signed)publicPermission
{
  return self->_publicPermission;
}

- (unsigned)status
{
  return self->_status;
}

- (id)markOnboardingPreviewAssetsByProcessingRulesWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PHLibraryScope.m", 353, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v6 = [(PHObject *)self photoLibrary];
  id v7 = [v6 assetsdClient];

  id v8 = [PHUserFeedbackCalculator alloc];
  v9 = [(PHObject *)self photoLibrary];
  uint64_t v10 = [(PHUserFeedbackCalculator *)v8 initWithPhotoLibrary:v9];

  v11 = [(PHUserFeedbackCalculator *)v10 personUUIDsWithNegativeFeedback];
  v12 = [v7 cloudInternalClient];
  v13 = [(PHObject *)self uuid];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__PHLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithCompletion___block_invoke;
  v18[3] = &unk_1E58489C0;
  id v19 = v5;
  id v14 = v5;
  v15 = [v12 markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope:v13 excludePersonUUIDs:v11 completionHandler:v18];

  return v15;
}

void __77__PHLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = a2 == 0;
  id v4 = +[PHShare PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, BOOL, id))(v2 + 16))(v2, v3, v4);
}

- (void)unsharePendingAssetsSharedToScope
{
  BOOL v3 = [(PHObject *)self photoLibrary];
  id v6 = [v3 assetsdClient];

  id v4 = [v6 cloudInternalClient];
  id v5 = [(PHLibraryScope *)self scopeIdentifier];
  [v4 unsharePendingAssetsSharedToScopeWithIdentifier:v5];
}

- (void)getCloudStatusCountsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PHLibraryScope.m", 337, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v6 = [(PHObject *)self photoLibrary];
  id v7 = [v6 assetsdClient];

  id v8 = [v7 cloudInternalClient];
  v9 = [(PHObject *)self photoLibrary];
  uint64_t v10 = [v9 mainScopeIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PHLibraryScope_getCloudStatusCountsWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E58466B0;
  id v14 = v5;
  id v11 = v5;
  [v8 getLibraryScopeStatusCountsForScopeWithIdentifier:v10 completionHandler:v13];
}

uint64_t __60__PHLibraryScope_getCloudStatusCountsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshLibraryScopeWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHLibraryScope.m", 329, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v6 = [(PHObject *)self photoLibrary];
  id v7 = [v6 assetsdClient];

  id v8 = [v7 cloudInternalClient];
  v9 = [(PHLibraryScope *)self scopeIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PHLibraryScope_refreshLibraryScopeWithCompletion___block_invoke;
  v12[3] = &unk_1E5846688;
  id v13 = v5;
  id v10 = v5;
  [v8 refreshLibraryScopeWithIdentifier:v9 completionHandler:v12];
}

uint64_t __52__PHLibraryScope_refreshLibraryScopeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeParticipants:(id)a3 exitSource:(int64_t)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PHLibraryScope.m", 315, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v10 = [(PHObject *)self photoLibrary];
  id v11 = [v10 assetsdClient];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v19 = [v18 uuid];

        if (v19)
        {
          v20 = [v18 uuid];
          [v12 addObject:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  v21 = [v11 cloudInternalClient];
  v22 = [(PHLibraryScope *)self scopeIdentifier];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __59__PHLibraryScope_removeParticipants_exitSource_completion___block_invoke;
  v26[3] = &unk_1E58489C0;
  id v27 = v9;
  id v23 = v9;
  [v21 removeParticipantsWithParticipantUUIDs:v12 fromLibraryScopeWithIdentifier:v22 retentionPolicy:0 exitSource:a4 completionHandler:v26];
}

void __59__PHLibraryScope_removeParticipants_exitSource_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = a2 == 0;
  id v4 = +[PHShare PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, BOOL, id))(v2 + 16))(v2, v3, v4);
}

- (void)startExitFromLibraryScopeWithRetentionPolicy:(int64_t)a3 exitSource:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHLibraryScope.m", 307, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v10 = [(PHObject *)self photoLibrary];
  id v11 = [v10 assetsdClient];

  id v12 = [v11 cloudInternalClient];
  id v13 = [(PHLibraryScope *)self scopeIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PHLibraryScope_startExitFromLibraryScopeWithRetentionPolicy_exitSource_completion___block_invoke;
  v16[3] = &unk_1E58489C0;
  id v17 = v9;
  id v14 = v9;
  [v12 startExitFromLibraryScopeWithIdentifier:v13 retentionPolicy:a3 exitSource:a4 completionHandler:v16];
}

void __85__PHLibraryScope_startExitFromLibraryScopeWithRetentionPolicy_exitSource_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = a2 == 0;
  id v4 = +[PHShare PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, BOOL, id))(v2 + 16))(v2, v3, v4);
}

- (void)deactivateLibraryScopeWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHLibraryScope.m", 299, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v6 = [(PHObject *)self photoLibrary];
  id v7 = [v6 assetsdClient];

  id v8 = [v7 cloudInternalClient];
  id v9 = [(PHObject *)self uuid];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PHLibraryScope_deactivateLibraryScopeWithCompletion___block_invoke;
  v12[3] = &unk_1E58489C0;
  id v13 = v5;
  id v10 = v5;
  [v8 deactivateLibraryScope:v9 completionHandler:v12];
}

void __55__PHLibraryScope_deactivateLibraryScopeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = a2 == 0;
  id v4 = +[PHShare PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, BOOL, id))(v2 + 16))(v2, v3, v4);
}

- (id)activateLibraryScopeWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHLibraryScope.m", 291, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v6 = [(PHObject *)self photoLibrary];
  id v7 = [v6 assetsdClient];

  id v8 = [v7 cloudInternalClient];
  id v9 = [(PHObject *)self uuid];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__PHLibraryScope_activateLibraryScopeWithCompletion___block_invoke;
  v14[3] = &unk_1E58489C0;
  id v15 = v5;
  id v10 = v5;
  id v11 = [v8 activateLibraryScope:v9 completionHandler:v14];

  return v11;
}

void __53__PHLibraryScope_activateLibraryScopeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = a2 == 0;
  id v4 = +[PHShare PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, BOOL, id))(v2 + 16))(v2, v3, v4);
}

- (void)acceptLibraryScopeWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(PHObject *)self uuid];
  id v5 = [(PHObject *)self photoLibrary];
  +[PHShare acceptShareWithUUID:v6 photoLibrary:v5 completion:v4];
}

- (void)publishLibraryScopeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(PHObject *)self uuid];
  id v5 = [(PHObject *)self photoLibrary];
  +[PHShare publishShareWithUUID:v6 photoLibrary:v5 completion:v4];
}

- (PHLibraryScope)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PHLibraryScope;
  id v9 = [(PHObject *)&v35 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"title"];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"creationDate"];
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v12;

    id v14 = [v8 objectForKeyedSubscript:@"status"];
    v9->_status = [v14 integerValue];

    uint64_t v15 = [v8 objectForKeyedSubscript:@"shareURL"];
    shareURL = v9->_shareURL;
    v9->_shareURL = (NSURL *)v15;

    uint64_t v17 = [v8 objectForKeyedSubscript:@"scopeIdentifier"];
    scopeIdentifier = v9->_scopeIdentifier;
    v9->_scopeIdentifier = (NSString *)v17;

    uint64_t v19 = [v8 objectForKeyedSubscript:@"expiryDate"];
    expiryDate = v9->_expiryDate;
    v9->_expiryDate = (NSDate *)v19;

    v21 = [v8 objectForKeyedSubscript:@"trashedState"];
    v9->_trashedState = [v21 unsignedIntegerValue];

    v22 = [v8 objectForKeyedSubscript:@"localPublishState"];
    v9->_publishState = [v22 unsignedIntegerValue];

    id v23 = [v8 objectForKeyedSubscript:@"participantCloudUpdateState"];
    v9->_participantCloudUpdateState = [v23 unsignedIntegerValue];

    v24 = [v8 objectForKeyedSubscript:@"autoSharePolicy"];
    v9->_autoSharePolicy = [v24 unsignedIntegerValue];

    v25 = [v8 objectForKeyedSubscript:@"publicPermission"];
    v9->_publicPermission = [v25 unsignedIntegerValue];

    uint64_t v26 = [v8 objectForKeyedSubscript:@"rulesData"];
    rulesData = v9->_rulesData;
    v9->_rulesData = (NSData *)v26;

    v9->_libraryScopeInLocalMode = [MEMORY[0x1E4F8A8D8] libraryScopeScopeIdentifierWasCreatedInLocalOnlyMode:v9->_scopeIdentifier];
    long long v28 = [v8 objectForKeyedSubscript:@"scopeSyncingState"];
    v9->_scopeSyncingState = [v28 unsignedIntegerValue];

    long long v29 = [v8 objectForKeyedSubscript:@"previewState"];
    v9->_previewState = [v29 unsignedIntegerValue];

    long long v30 = [v8 objectForKeyedSubscript:@"cloudPhotoCount"];
    v9->_cloudPhotoCount = [v30 unsignedIntegerValue];

    long long v31 = [v8 objectForKeyedSubscript:@"cloudVideoCount"];
    v9->_cloudVideoCount = [v31 unsignedIntegerValue];

    v32 = [v8 objectForKeyedSubscript:@"cloudItemCount"];
    v9->_cloudItemCount = [v32 unsignedIntegerValue];

    uint64_t v33 = [v8 objectForKeyedSubscript:@"exitState"];
    v9->_exitState = [v33 unsignedIntegerValue];
  }
  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 librarySpecificFetchOptions];
  id v7 = +[PHLibraryScope fetchActiveLibraryScopeWithOptions:v6];

  if ([v7 count])
  {
    id v8 = [v7 firstObject];
    if ([v8 autoSharePolicy] == 2)
    {
      id v9 = [v5 librarySpecificFetchOptions];
      v25 = v8;
      uint64_t v10 = +[PHLibraryScopeRule fetchLibraryScopeRulesForLibraryScope:v8 options:v9];

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v18 = [v17 personCondition];

            if (v18) {
              [v17 removeConditionOfType:objc_opt_class()];
            }
            uint64_t v19 = [v17 dateRangeCondition];

            if (v19) {
              [v11 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v14);
      }

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __78__PHLibraryScope_removePersonRulesOnActiveLibraryScopeWithPhotoLibrary_error___block_invoke;
      v27[3] = &unk_1E5848DF0;
      id v8 = v25;
      id v28 = v25;
      id v20 = v11;
      id v29 = v20;
      id v26 = 0;
      char v21 = [v5 performChangesAndWait:v27 error:&v26];
      id v22 = v26;
      id v23 = v22;
      if (a4) {
        *a4 = v22;
      }
    }
    else
    {
      char v21 = 1;
    }
  }
  else
  {
    char v21 = 1;
  }

  return v21;
}

void __78__PHLibraryScope_removePersonRulesOnActiveLibraryScopeWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  id v2 = +[PHLibraryScopeChangeRequest changeRequestForLibraryScope:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) count]) {
    [v2 updateWithCustomRules:*(void *)(a1 + 40)];
  }
  else {
    [v2 setAutoSharePolicy:0];
  }
}

+ (id)_estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:(BOOL)a3 options:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F28BA0];
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyContentContributedByCurrentUser];
    v23[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F8A950] predicateForAssetSharingFilter:1];
    v23[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v12 = [v8 andPredicateWithSubpredicates:v11];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F8A950] predicateForAssetSharingFilter:1];
    id v22 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    id v12 = [v8 andPredicateWithSubpredicates:v10];
  }

  if (v12)
  {
    [v7 setShouldPrefetchCount:1];
    [v7 setInternalPredicate:v12];
    uint64_t v13 = +[PHAsset fetchAssetsWithOptions:v7];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"estimatedAssetCountToMoveForExitRetentionPolicy: generated predate is nil", *MEMORY[0x1E4F28568]);
    char v21 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v17 = [v14 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v16];
    v18 = v17;
    if (a5) {
      *a5 = v17;
    }

    uint64_t v13 = 0;
  }

  return v13;
}

+ (unint64_t)estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7 options:(id)a8 error:(id *)a9
{
  uint64_t v13 = [a1 _estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:a3 options:a8 error:a9];
  uint64_t v14 = v13;
  if (a4) {
    *a4 = [v13 countOfAssetsWithMediaType:1];
  }
  if (a5) {
    *a5 = [v14 countOfAssetsWithMediaType:2];
  }
  if (a6) {
    *a6 = [v14 countOfAssetsWithMediaType:3];
  }
  if (a7) {
    *a7 = [v14 countOfAssetsWithMediaType:0];
  }
  unint64_t v15 = [v14 count];

  return v15;
}

+ (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PHLibraryScope.m", 363, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = [v7 assetsdClient];
  uint64_t v10 = [v9 cloudInternalClient];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__PHLibraryScope_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary_completion___block_invoke;
  v13[3] = &unk_1E58489C0;
  id v14 = v8;
  id v11 = v8;
  [v10 resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler:v13];
}

void __102__PHLibraryScope_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = a2 == 0;
  id v4 = +[PHShare PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, BOOL, id))(v2 + 16))(v2, v3, v4);
}

+ (void)fetchLibraryScopeFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PHLibraryScope.m" lineNumber:259 description:@"Valid PHPhotoLibrary must be specified"];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__PHLibraryScope_fetchLibraryScopeFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke;
  v17[3] = &unk_1E5846660;
  id v18 = v12;
  id v19 = v13;
  id v14 = v12;
  id v15 = v13;
  +[PHShare fetchShareFromShareURL:v11 ignoreExistingShare:v8 photoLibrary:v14 completionHandler:v17];
}

void __99__PHLibraryScope_fetchLibraryScopeFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = +[PHShare PHShareErrorFromError:v6];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
    [v9 setIncludeExitingShares:1];
    [v9 setIncludeExpiredShares:1];
    [v9 setIncludeTrashedShares:1];
    v18[0] = v5;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v11 = +[PHLibraryScope fetchLibraryScopesWithLocalIdentifiers:v10 options:v9];
    id v12 = [v11 firstObject];

    if (v12)
    {
      id v7 = 0;
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      id v14 = [NSString stringWithFormat:@"Unable to fetch libraryScope with UUID %@", v5];
      uint64_t v17 = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v7 = [v13 errorWithDomain:@"PHPhotosErrorDomain" code:6003 userInfo:v15];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)fetchLibraryScopeFromShareURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 photoLibrary];
  [a1 fetchLibraryScopeFromShareURL:v9 ignoreExistingShare:0 photoLibrary:v10 completionHandler:v8];
}

+ (id)fetchLibraryScopesWithOptions:(id)a3
{
  id v5 = a3;
  id v6 = [v5 photoLibrary];

  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHLibraryScope.m" lineNumber:223 description:@"Valid PHPhotoLibrary must be specified via fetch options"];
  }
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v5 fetchBlock:&__block_literal_global_131];

  return v7;
}

id __48__PHLibraryScope_fetchLibraryScopesWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForLibraryScopesWithOptions:a2];
  BOOL v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchLibraryScopesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 photoLibrary];

  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:a1 file:@"PHLibraryScope.m" lineNumber:215 description:@"Valid PHPhotoLibrary must be specified via fetch options"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PHLibraryScope_fetchLibraryScopesWithLocalIdentifiers_options___block_invoke;
  v14[3] = &unk_1E5849048;
  id v15 = v7;
  id v10 = v7;
  id v11 = +[PHObject authorizationAwareFetchResultWithOptions:v8 fetchBlock:v14];

  return v11;
}

id __65__PHLibraryScope_fetchLibraryScopesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryforLibraryScopesWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  BOOL v3 = [v2 executeQuery];

  return v3;
}

+ (id)localIdentifierWithUUID:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [a1 identifierCode];
  id v7 = [v4 stringWithFormat:@"%@/L0/%@", v5, v6];

  return v7;
}

+ (id)identifierCode
{
  return @"210";
}

+ (id)fetchType
{
  uint64_t v2 = @"PHLibraryScope";
  return @"PHLibraryScope";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_30682 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_30682, &__block_literal_global_30683);
  }
  BOOL v3 = (void *)propertiesToFetchWithHint__array_30684;

  return v3;
}

void __44__PHLibraryScope_propertiesToFetchWithHint___block_invoke()
{
  v3[20] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"title";
  v3[2] = @"creationDate";
  v3[3] = @"uuid";
  v3[4] = @"status";
  v3[5] = @"shareURL";
  v3[6] = @"scopeIdentifier";
  v3[7] = @"expiryDate";
  v3[8] = @"trashedState";
  v3[9] = @"localPublishState";
  v3[10] = @"participantCloudUpdateState";
  v3[11] = @"autoSharePolicy";
  v3[12] = @"scopeSyncingState";
  v3[13] = @"previewState";
  v3[14] = @"publicPermission";
  v3[15] = @"rulesData";
  v3[16] = @"cloudPhotoCount";
  v3[17] = @"cloudVideoCount";
  v3[18] = @"cloudItemCount";
  v3[19] = @"exitState";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:20];
  uint64_t v2 = (void *)propertiesToFetchWithHint__array_30684;
  propertiesToFetchWithHint__array_30684 = v1;
}

@end