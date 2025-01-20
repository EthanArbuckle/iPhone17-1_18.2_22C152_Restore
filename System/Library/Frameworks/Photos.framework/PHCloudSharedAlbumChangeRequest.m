@interface PHCloudSharedAlbumChangeRequest
+ (id)changeRequestForCloudSharedAlbum:(id)a3;
+ (id)creationRequestForCloudSharedAlbumWithTitle:(id)a3;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)cloudMultipleContributorsEnabled;
- (BOOL)cloudMultipleContributorsEnabledLocal;
- (BOOL)cloudNotificationsEnabled;
- (BOOL)cloudPublicURLEnabled;
- (BOOL)cloudPublicURLEnabledLocal;
- (BOOL)isOwned;
- (BOOL)isPublic;
- (NSArray)assetsToPublish;
- (NSDictionary)assetsSharingInfos;
- (NSMutableArray)invitationRecordGUIDsToRemove;
- (NSMutableArray)invitationRecordGUIDsToUpdate;
- (NSMutableArray)invitationsToAdd;
- (NSMutableArray)pendingInvitationRecordGUIDs;
- (NSString)cloudOwnerEmail;
- (NSString)cloudOwnerFirstName;
- (NSString)cloudOwnerFullName;
- (NSString)cloudOwnerLastName;
- (NSString)commentText;
- (NSString)title;
- (PHCloudSharedAlbum)cloudSharedAlbum;
- (PHCloudSharedAlbumChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHCloudSharedAlbumChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)managedEntityName;
- (id)placeholderForCreatedCloudSharedAlbum;
- (int64_t)invitationState;
- (void)acceptInvitation;
- (void)addInvitationRecordWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emails:(id)a6 phones:(id)a7;
- (void)declineInvitation;
- (void)encodeToXPCDict:(id)a3;
- (void)publish;
- (void)publishBatchOfOriginalAssets:(id)a3 withBatchCommentText:(id)a4 creationOptionsPerAsset:(id)a5;
- (void)removeCloudSharedAlbumInvitationRecords:(id)a3;
- (void)resendPendingInvitationRecords:(id)a3;
- (void)sendPendingInvitations;
- (void)setAssetsSharingInfos:(id)a3;
- (void)setAssetsToPublish:(id)a3;
- (void)setCloudMultipleContributorsEnabled:(BOOL)a3;
- (void)setCloudMultipleContributorsEnabledLocal:(BOOL)a3;
- (void)setCloudNotificationsEnabled:(BOOL)a3;
- (void)setCloudOwnerEmail:(id)a3;
- (void)setCloudOwnerFirstName:(id)a3;
- (void)setCloudOwnerFullName:(id)a3;
- (void)setCloudOwnerLastName:(id)a3;
- (void)setCloudPublicURLEnabled:(BOOL)a3;
- (void)setCloudPublicURLEnabledLocal:(BOOL)a3;
- (void)setCloudSharedAlbum:(id)a3;
- (void)setCommentText:(id)a3;
- (void)setDidPublish:(BOOL)a3;
- (void)setDidSendPendingInvitations:(BOOL)a3;
- (void)setInvitationRecordGUIDsToRemove:(id)a3;
- (void)setInvitationRecordGUIDsToUpdate:(id)a3;
- (void)setInvitationState:(int64_t)a3;
- (void)setInvitationStateLocalForInvitationRecords:(id)a3 invitationStateLocal:(id)a4;
- (void)setInvitationsToAdd:(id)a3;
- (void)setIsOwned:(BOOL)a3;
- (void)setIsPublic:(BOOL)a3;
- (void)setPendingInvitationRecordGUIDs:(id)a3;
- (void)setTitle:(id)a3;
- (void)stopSharing;
@end

@implementation PHCloudSharedAlbumChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_assetsSharingInfos, 0);
  objc_storeStrong((id *)&self->_assetsToPublish, 0);
  objc_storeStrong((id *)&self->_invitationRecordGUIDsToUpdate, 0);
  objc_storeStrong((id *)&self->_invitationsToAdd, 0);
  objc_storeStrong((id *)&self->_pendingInvitationRecordGUIDs, 0);
  objc_storeStrong((id *)&self->_invitationRecordGUIDsToRemove, 0);
  objc_storeStrong((id *)&self->_cloudSharedAlbum, 0);

  objc_storeStrong((id *)&self->_cloudOwnerEmail, 0);
}

- (void)setCommentText:(id)a3
{
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setAssetsSharingInfos:(id)a3
{
}

- (NSDictionary)assetsSharingInfos
{
  return self->_assetsSharingInfos;
}

- (void)setAssetsToPublish:(id)a3
{
}

- (NSArray)assetsToPublish
{
  return self->_assetsToPublish;
}

- (void)setInvitationRecordGUIDsToUpdate:(id)a3
{
}

- (NSMutableArray)invitationRecordGUIDsToUpdate
{
  return self->_invitationRecordGUIDsToUpdate;
}

- (void)setInvitationsToAdd:(id)a3
{
}

- (NSMutableArray)invitationsToAdd
{
  return self->_invitationsToAdd;
}

- (void)setPendingInvitationRecordGUIDs:(id)a3
{
}

- (NSMutableArray)pendingInvitationRecordGUIDs
{
  return self->_pendingInvitationRecordGUIDs;
}

- (void)setInvitationRecordGUIDsToRemove:(id)a3
{
}

- (NSMutableArray)invitationRecordGUIDsToRemove
{
  return self->_invitationRecordGUIDsToRemove;
}

- (void)setCloudSharedAlbum:(id)a3
{
}

- (PHCloudSharedAlbum)cloudSharedAlbum
{
  return self->_cloudSharedAlbum;
}

- (int64_t)invitationState
{
  return self->_invitationState;
}

- (void)setCloudMultipleContributorsEnabledLocal:(BOOL)a3
{
  self->_cloudMultipleContributorsEnabledLocal = a3;
}

- (BOOL)cloudMultipleContributorsEnabledLocal
{
  return self->_cloudMultipleContributorsEnabledLocal;
}

- (void)setCloudPublicURLEnabledLocal:(BOOL)a3
{
  self->_cloudPublicURLEnabledLocal = a3;
}

- (BOOL)cloudPublicURLEnabledLocal
{
  return self->_cloudPublicURLEnabledLocal;
}

- (void)setCloudPublicURLEnabled:(BOOL)a3
{
  self->_cloudPublicURLEnabled = a3;
}

- (BOOL)cloudPublicURLEnabled
{
  return self->_cloudPublicURLEnabled;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v61 = a4;
  v9 = [(PHChangeRequest *)self helper];
  id v76 = 0;
  int v10 = [v9 applyMutationsToManagedObject:v8 error:&v76];
  id v11 = v76;

  if (!v10) {
    goto LABEL_53;
  }
  v12 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    BOOL v13 = [(PHChangeRequest *)self isMutated];
    v14 = [(PHChangeRequest *)self helper];
    v15 = [v14 mutations];
    *(_DWORD *)buf = 67109378;
    BOOL v81 = v13;
    __int16 v82 = 2112;
    v83 = v15;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update", buf, 0x12u);
  }
  id v16 = v8;
  v17 = v16;
  if (self->_cloudOwnerEmail) {
    objc_msgSend(v16, "setCloudOwnerEmail:");
  }
  if ([(NSMutableArray *)self->_invitationRecordGUIDsToRemove count])
  {
    [MEMORY[0x1E4F8A728] cloudSharedAlbumInvitationRecordsWithGUIDs:self->_invitationRecordGUIDsToRemove inLibrary:v61];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v73 != v21) {
            objc_enumerationMutation(v18);
          }
          [v17 userDeleteSubscriberRecord:*(void *)(*((void *)&v72 + 1) + 8 * i)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v72 objects:v79 count:16];
      }
      while (v20);
    }
  }
  else
  {
    id v18 = 0;
  }
  v58 = v11;
  v59 = a5;
  if ([(NSMutableArray *)self->_invitationsToAdd count])
  {
    id v55 = v18;
    v56 = self;
    id v57 = v8;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = self->_invitationsToAdd;
    uint64_t v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          v27 = v17;
          if (*(void *)v69 != v25) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          v29 = (void *)MEMORY[0x1E4F8A728];
          v30 = [v28 objectForKeyedSubscript:@"firstName"];
          v31 = [v28 objectForKeyedSubscript:@"lastName"];
          v32 = [v28 objectForKeyedSubscript:@"fullName"];
          v33 = [v28 objectForKeyedSubscript:@"emails"];
          v34 = [v28 objectForKeyedSubscript:@"phones"];
          v35 = v29;
          v17 = v27;
          id v36 = (id)[v35 insertNewInvitationRecordIntoAlbum:v27 withFirstName:v30 lastName:v31 fullName:v32 emails:v33 phones:v34 inLibrary:v61];
        }
        uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v68 objects:v78 count:16];
      }
      while (v24);
    }

    self = v56;
    id v8 = v57;
    a5 = v59;
    id v18 = v55;
  }
  if ([(NSMutableArray *)self->_invitationRecordGUIDsToUpdate count])
  {
    v37 = [MEMORY[0x1E4F8A728] cloudSharedAlbumInvitationRecordsWithGUIDs:self->_invitationRecordGUIDsToUpdate inLibrary:v61];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v18 = v37;
    uint64_t v38 = [v18 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v65;
      do
      {
        v41 = v18;
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v65 != v40) {
            objc_enumerationMutation(v41);
          }
          v43 = *(void **)(*((void *)&v64 + 1) + 8 * k);
          v44 = [NSNumber numberWithLongLong:self->_invitationStateToUpdate];
          [v43 setInvitationStateLocal:v44];
        }
        id v18 = v41;
        uint64_t v39 = [v41 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v39);
    }

    a5 = v59;
  }
  if (self->_didSetIsPublic)
  {
    v45 = [NSNumber numberWithBool:self->_isPublic];
    [v17 setCloudPublicURLEnabledLocal:v45];

    [MEMORY[0x1E4F8AAB0] updateCloudSharedAlbumPublicURLStateOnServer:v17];
  }
  if (self->_didSetCloudMultipleContributorsEnabled)
  {
    v46 = [NSNumber numberWithBool:self->_cloudMultipleContributorsEnabled];
    [v17 setCloudMultipleContributorsEnabledLocal:v46];

    [MEMORY[0x1E4F8AAB0] updateCloudSharedAlbumMultipleContributorsStateOnServer:v17];
  }
  if (self->_didSetInvitationState)
  {
    int64_t invitationState = self->_invitationState;
    if (invitationState == 4)
    {
      [MEMORY[0x1E4F8AAB0] declinePendingInvitationForAlbum:v17];
    }
    else if (invitationState == 2)
    {
      id v63 = v58;
      int v48 = [MEMORY[0x1E4F8AAB0] canAcceptPendingInvitationForAlbum:v17 error:&v63];
      id v49 = v63;

      if (v48) {
        [MEMORY[0x1E4F8AAB0] acceptPendingInvitationForAlbum:v17 completionHandler:0];
      }
      goto LABEL_45;
    }
  }
  id v49 = v58;
LABEL_45:
  if (self->_didSendPendingInvitations) {
    [MEMORY[0x1E4F8AAB0] sendPendingInvitationsForAlbum:v17 resendInvitationGUIDs:self->_pendingInvitationRecordGUIDs];
  }
  assetsToPublish = self->_assetsToPublish;
  if (assetsToPublish)
  {
    commentText = self->_commentText;
    assetsSharingInfos = self->_assetsSharingInfos;
    id v62 = v49;
    LOBYTE(v54) = 0;
    LOBYTE(v10) = [MEMORY[0x1E4F8AAB0] prepareToEnqueueBatchOfOriginalAssetUUIDs:assetsToPublish withBatchCommentText:commentText assetsSharingInfos:assetsSharingInfos customExportsInfo:0 andTrimmedVideoPathInfo:0 sharedAlbum:v17 isNewAlbum:v54 error:&v62];
    id v11 = v62;
  }
  else
  {
    LOBYTE(v10) = 1;
    id v11 = v49;
  }
  if (self->_didPublish) {
    [MEMORY[0x1E4F8AAB0] publishCloudSharedAlbumToServer:v17];
  }

LABEL_53:
  if (a5 && (v10 & 1) == 0) {
    *a5 = v11;
  }

  return v10;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F8A720];
  id v7 = a3;
  id v8 = [(PHCloudSharedAlbumChangeRequest *)self title];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  int v10 = [v6 insertNewCloudSharedAlbumWithTitle:v8 lastInterestingDate:v9 intoLibrary:v7];

  id v11 = [(PHChangeRequest *)self uuid];
  [v10 setUuid:v11];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PHCloudSharedAlbumChangeRequest isOwned](self, "isOwned"));
  [v10 setIsOwned:v12];

  if (a4 && !v10)
  {
    BOOL v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v14 = [NSString stringWithFormat:@"Failed to create cloud shared album"];
    v18[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)managedEntityName
{
  return @"CloudSharedAlbum";
}

- (void)publishBatchOfOriginalAssets:(id)a3 withBatchCommentText:(id)a4 creationOptionsPerAsset:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v27 = a4;
  id v30 = a4;
  id v9 = a5;
  v29 = self;
  p_assetsSharingInfos = &self->_assetsSharingInfos;
  if (!self->_assetsSharingInfos)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = *p_assetsSharingInfos;
    *p_assetsSharingInfos = (NSDictionary *)v11;
  }
  location = (id *)&self->_assetsSharingInfos;
  v31 = v8;
  BOOL v13 = PFMap();
  id v34 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v18 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v19 = NSNumber;
        uint64_t v20 = [v9 objectForKeyedSubscript:v17];
        uint64_t v21 = [v20 metadataCopyOptions];
        v22 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v21, "shouldCopyLocationData") ^ 1);
        [v18 setObject:v22 forKeyedSubscript:@"excludeLocation"];

        uint64_t v23 = NSNumber;
        uint64_t v24 = [v9 objectForKeyedSubscript:v17];
        uint64_t v25 = [v24 adjustmentBakeInOptions];
        v26 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v25, "flattenLivePhotoToStillIfNeeded"));
        [v18 setObject:v26 forKeyedSubscript:@"useStillImageOnly"];

        [v34 setObject:v18 forKeyedSubscript:v17];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v15);
  }

  objc_storeStrong((id *)&v29->_assetsToPublish, v13);
  objc_storeStrong(location, v34);
  if (v30 && [v30 length]) {
    objc_storeStrong((id *)&v29->_commentText, v27);
  }
  [(PHChangeRequest *)v29 didMutate];
}

uint64_t __109__PHCloudSharedAlbumChangeRequest_publishBatchOfOriginalAssets_withBatchCommentText_creationOptionsPerAsset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)declineInvitation
{
}

- (void)acceptInvitation
{
}

- (void)stopSharing
{
  id v3 = [(PHCloudSharedAlbum *)self->_cloudSharedAlbum invitationRecords];
  [(PHCloudSharedAlbumChangeRequest *)self removeCloudSharedAlbumInvitationRecords:v3];
}

- (void)setInvitationStateLocalForInvitationRecords:(id)a3 invitationStateLocal:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v16 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          invitationRecordGUIDsToUpdate = self->_invitationRecordGUIDsToUpdate;
          if (!invitationRecordGUIDsToUpdate)
          {
            objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
            BOOL v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            uint64_t v14 = self->_invitationRecordGUIDsToUpdate;
            self->_invitationRecordGUIDsToUpdate = v13;

            invitationRecordGUIDsToUpdate = self->_invitationRecordGUIDsToUpdate;
          }
          uint64_t v15 = [v11 cloudGUID];
          [(NSMutableArray *)invitationRecordGUIDsToUpdate addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  if ([(NSMutableArray *)self->_invitationRecordGUIDsToUpdate count])
  {
    self->_invitationStateToUpdate = (int)[v16 intValue];
    [(PHChangeRequest *)self didMutate];
  }
}

- (void)removeCloudSharedAlbumInvitationRecords:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          invitationRecordGUIDsToRemove = self->_invitationRecordGUIDsToRemove;
          if (!invitationRecordGUIDsToRemove)
          {
            objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
            uint64_t v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            v12 = self->_invitationRecordGUIDsToRemove;
            self->_invitationRecordGUIDsToRemove = v11;

            invitationRecordGUIDsToRemove = self->_invitationRecordGUIDsToRemove;
          }
          BOOL v13 = [v9 cloudGUID];
          [(NSMutableArray *)invitationRecordGUIDsToRemove addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  if ([(NSMutableArray *)self->_invitationRecordGUIDsToRemove count]) {
    [(PHChangeRequest *)self didMutate];
  }
}

- (void)resendPendingInvitationRecords:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          pendingInvitationRecordGUIDs = self->_pendingInvitationRecordGUIDs;
          if (!pendingInvitationRecordGUIDs)
          {
            objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
            uint64_t v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            v12 = self->_pendingInvitationRecordGUIDs;
            self->_pendingInvitationRecordGUIDs = v11;

            pendingInvitationRecordGUIDs = self->_pendingInvitationRecordGUIDs;
          }
          BOOL v13 = [v9 cloudGUID];
          [(NSMutableArray *)pendingInvitationRecordGUIDs addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  if ([(NSMutableArray *)self->_pendingInvitationRecordGUIDs count]) {
    [(PHCloudSharedAlbumChangeRequest *)self setDidSendPendingInvitations:1];
  }
}

- (void)sendPendingInvitations
{
}

- (void)setDidSendPendingInvitations:(BOOL)a3
{
  self->_didSendPendingInvitations = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)addInvitationRecordWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emails:(id)a6 phones:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v14 count] || objc_msgSend(v15, "count"))
  {
    if (!self->_invitationsToAdd)
    {
      long long v16 = [MEMORY[0x1E4F1CA48] array];
      invitationsToAdd = self->_invitationsToAdd;
      self->_invitationsToAdd = v16;
    }
    long long v18 = [MEMORY[0x1E4F1CA60] dictionary];
    [v18 setObject:v19 forKeyedSubscript:@"firstName"];
    [v18 setObject:v12 forKeyedSubscript:@"lastName"];
    [v18 setObject:v13 forKeyedSubscript:@"fullName"];
    [v18 setObject:v14 forKeyedSubscript:@"emails"];
    [v18 setObject:v15 forKeyedSubscript:@"phones"];
    [(NSMutableArray *)self->_invitationsToAdd addObject:v18];
    [(PHChangeRequest *)self didMutate];
  }
}

- (void)publish
{
}

- (void)setDidPublish:(BOOL)a3
{
  self->_didPublish = a3;
  [(PHChangeRequest *)self didMutate];
}

- (void)setInvitationState:(int64_t)a3
{
  self->_int64_t invitationState = a3;
  self->_didSetInvitationState = 1;
  [(PHChangeRequest *)self didMutate];
}

- (NSString)cloudOwnerEmail
{
  return self->_cloudOwnerEmail;
}

- (void)setCloudOwnerEmail:(id)a3
{
  objc_storeStrong((id *)&self->_cloudOwnerEmail, a3);
  self->_didSetCloudOwnerEmail = 1;

  [(PHChangeRequest *)self didMutate];
}

- (BOOL)cloudMultipleContributorsEnabled
{
  return self->_cloudMultipleContributorsEnabled;
}

- (void)setCloudMultipleContributorsEnabled:(BOOL)a3
{
  self->_cloudMultipleContributorsEnabled = a3;
  self->_didSetCloudMultipleContributorsEnabled = 1;
  [(PHChangeRequest *)self didMutate];
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (void)setIsPublic:(BOOL)a3
{
  self->_isPublic = a3;
  self->_didSetIsPublic = 1;
  [(PHChangeRequest *)self didMutate];
}

- (void)setCloudNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"cloudNotificationsEnabled"];
}

- (BOOL)cloudNotificationsEnabled
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  uint64_t v5 = [v4 objectForKey:@"cloudNotificationsEnabled"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setIsOwned:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  uint64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"isOwned"];
}

- (BOOL)isOwned
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  uint64_t v5 = [v4 objectForKey:@"isOwned"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setCloudOwnerFullName:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  uint64_t v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"cloudOwnerFullName"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"cloudOwnerFullName"];
  }
  else
  {
    [v6 removeObjectForKey:@"cloudOwnerFullName"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"cloudOwnerFullName"];
  }
}

- (NSString)cloudOwnerFullName
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  uint64_t v5 = [v4 objectForKey:@"cloudOwnerFullName"];

  return (NSString *)v5;
}

- (void)setCloudOwnerLastName:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  uint64_t v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"cloudOwnerLastName"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"cloudOwnerLastName"];
  }
  else
  {
    [v6 removeObjectForKey:@"cloudOwnerLastName"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"cloudOwnerLastName"];
  }
}

- (NSString)cloudOwnerLastName
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  uint64_t v5 = [v4 objectForKey:@"cloudOwnerLastName"];

  return (NSString *)v5;
}

- (void)setCloudOwnerFirstName:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  uint64_t v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"cloudOwnerFirstName"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"cloudOwnerFirstName"];
  }
  else
  {
    [v6 removeObjectForKey:@"cloudOwnerFirstName"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"cloudOwnerFirstName"];
  }
}

- (NSString)cloudOwnerFirstName
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  uint64_t v5 = [v4 objectForKey:@"cloudOwnerFirstName"];

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  uint64_t v5 = [(PHChangeRequest *)self helper];
  uint64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  uint64_t v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 encodeToXPCDict:xdict];

  if ([(NSMutableArray *)self->_invitationRecordGUIDsToRemove count]) {
    PLXPCDictionarySetArray();
  }
  if ([(NSMutableArray *)self->_pendingInvitationRecordGUIDs count]) {
    PLXPCDictionarySetArray();
  }
  if ([(NSMutableArray *)self->_invitationsToAdd count]) {
    PLXPCDictionarySetArray();
  }
  if ([(NSMutableArray *)self->_invitationRecordGUIDsToUpdate count])
  {
    PLXPCDictionarySetArray();
    xpc_dictionary_set_int64(xdict, "invitationStateToUpdate", self->_invitationStateToUpdate);
  }
  if (self->_didSetIsPublic) {
    xpc_dictionary_set_BOOL(xdict, "isPublic", self->_isPublic);
  }
  if (self->_didSetCloudMultipleContributorsEnabled) {
    xpc_dictionary_set_BOOL(xdict, "cloudMultipleContributorsEnabled", self->_cloudMultipleContributorsEnabled);
  }
  if (self->_didSetCloudOwnerEmail) {
    PLXPCDictionarySetString();
  }
  if (self->_didSetInvitationState) {
    xpc_dictionary_set_int64(xdict, "invitationState", self->_invitationState);
  }
  if (self->_didSendPendingInvitations) {
    xpc_dictionary_set_BOOL(xdict, "didSendPendingInvitations", 1);
  }
  if ([(NSArray *)self->_assetsToPublish count]) {
    PLXPCDictionarySetArray();
  }
  if ([(NSDictionary *)self->_assetsSharingInfos count]) {
    PLXPCDictionarySetDictionary();
  }
  if (self->_commentText) {
    PLXPCDictionarySetString();
  }
  uint64_t v5 = xdict;
  if (self->_didPublish)
  {
    xpc_dictionary_set_BOOL(xdict, "didPublish", 1);
    uint64_t v5 = xdict;
  }
}

- (PHCloudSharedAlbumChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)PHCloudSharedAlbumChangeRequest;
  uint64_t v11 = [(PHChangeRequest *)&v45 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      id v14 = PLArrayFromXPCDictionary();
      uint64_t v15 = [v14 mutableCopy];
      invitationRecordGUIDsToRemove = v11->_invitationRecordGUIDsToRemove;
      v11->_invitationRecordGUIDsToRemove = (NSMutableArray *)v15;

      if ([(NSMutableArray *)v11->_invitationRecordGUIDsToRemove count])
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      long long v17 = PLArrayFromXPCDictionary();
      uint64_t v18 = [v17 mutableCopy];
      pendingInvitationRecordGUIDs = v11->_pendingInvitationRecordGUIDs;
      v11->_pendingInvitationRecordGUIDs = (NSMutableArray *)v18;

      if ([(NSMutableArray *)v11->_pendingInvitationRecordGUIDs count])
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      long long v20 = PLArrayFromXPCDictionary();
      uint64_t v21 = [v20 mutableCopy];
      invitationsToAdd = v11->_invitationsToAdd;
      v11->_invitationsToAdd = (NSMutableArray *)v21;

      if ([(NSMutableArray *)v11->_invitationsToAdd count])
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      uint64_t v23 = PLArrayFromXPCDictionary();
      uint64_t v24 = [v23 mutableCopy];
      invitationRecordGUIDsToUpdate = v11->_invitationRecordGUIDsToUpdate;
      v11->_invitationRecordGUIDsToUpdate = (NSMutableArray *)v24;

      if ([(NSMutableArray *)v11->_invitationRecordGUIDsToUpdate count])
      {
        v11->_invitationStateToUpdate = xpc_dictionary_get_int64(v8, "invitationStateToUpdate");
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      v26 = xpc_dictionary_get_value(v8, "isPublic");
      id v27 = v26;
      if (v26)
      {
        [(PHCloudSharedAlbumChangeRequest *)v11 setIsPublic:xpc_BOOL_get_value(v26)];
        [v9 recordUpdateRequest:v11];
      }
      v28 = xpc_dictionary_get_value(v8, "cloudMultipleContributorsEnabled");
      v29 = v28;
      if (v28)
      {
        [(PHCloudSharedAlbumChangeRequest *)v11 setCloudMultipleContributorsEnabled:xpc_BOOL_get_value(v28)];
        [v9 recordUpdateRequest:v11];
      }
      id v30 = PLStringFromXPCDictionary();
      if (v30)
      {
        [(PHCloudSharedAlbumChangeRequest *)v11 setCloudOwnerEmail:v30];
        [v9 recordUpdateRequest:v11];
      }
      int64_t int64 = xpc_dictionary_get_int64(v8, "invitationState");
      if (int64)
      {
        [(PHCloudSharedAlbumChangeRequest *)v11 setInvitationState:int64];
        [v9 recordUpdateRequest:v11];
      }
      v32 = xpc_dictionary_get_value(v8, "didSendPendingInvitations");
      uint64_t v33 = v32;
      if (v32)
      {
        v11->_didSendPendingInvitations = xpc_BOOL_get_value(v32);
        [v9 recordUpdateRequest:v11];
      }
      id v34 = PLArrayFromXPCDictionary();
      uint64_t v35 = [v34 mutableCopy];
      assetsToPublish = v11->_assetsToPublish;
      v11->_assetsToPublish = (NSArray *)v35;

      if ([(NSArray *)v11->_assetsToPublish count])
      {
        uint64_t v37 = PLStringFromXPCDictionary();
        commentText = v11->_commentText;
        v11->_commentText = (NSString *)v37;

        uint64_t v39 = PLDictionaryFromXPCDictionary();
        uint64_t v40 = [v39 mutableCopy];
        assetsSharingInfos = v11->_assetsSharingInfos;
        v11->_assetsSharingInfos = (NSDictionary *)v40;

        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      v42 = xpc_dictionary_get_value(v8, "didPublish");
      v43 = v42;
      if (v42)
      {
        v11->_didPublish = xpc_BOOL_get_value(v42);
        [v9 recordUpdateRequest:v11];
      }
    }
  }

  return v11;
}

- (id)placeholderForCreatedCloudSharedAlbum
{
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return v4;
}

- (PHCloudSharedAlbumChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHCloudSharedAlbumChangeRequest;
  id v8 = [(PHChangeRequest *)&v12 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;
  }
  return v8;
}

- (id)initForNewObject
{
  v6.receiver = self;
  v6.super_class = (Class)PHCloudSharedAlbumChangeRequest;
  v2 = [(PHChangeRequest *)&v6 init];
  if (v2)
  {
    BOOL v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;
  }
  return v2;
}

+ (id)changeRequestForCloudSharedAlbum:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [PHCloudSharedAlbumChangeRequest alloc];
    uint64_t v5 = [v3 uuid];
    objc_super v6 = [v3 objectID];
    id v7 = [(PHCloudSharedAlbumChangeRequest *)v4 initWithUUID:v5 objectID:v6];

    [(PHCloudSharedAlbumChangeRequest *)v7 setCloudSharedAlbum:v3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)creationRequestForCloudSharedAlbumWithTitle:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[PHCloudSharedAlbumChangeRequest alloc] initForNewObject];
    [v4 setTitle:v3];

    [v4 setIsOwned:1];
    [v4 setCloudPublicURLEnabled:0];
    [v4 setCloudPublicURLEnabledLocal:0];
    [v4 setCloudMultipleContributorsEnabled:1];
    [v4 setCloudMultipleContributorsEnabledLocal:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end