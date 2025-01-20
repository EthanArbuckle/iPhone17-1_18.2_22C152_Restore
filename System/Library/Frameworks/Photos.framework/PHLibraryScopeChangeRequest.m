@interface PHLibraryScopeChangeRequest
+ (id)changeRequestForLibraryScope:(id)a3;
+ (id)creationRequestForOwnedLibraryScopeInPreviewStateWithTitle:(id)a3;
+ (void)_expungeLibraryScopes:(id)a3 ignorePhotosctlExpungeOverride:(BOOL)a4;
+ (void)expungeLibraryScopes:(id)a3;
+ (void)trashLibraryScopes:(id)a3;
+ (void)untrashLibraryScopes:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)runningAsUnitTest;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSArray)assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
- (NSArray)assetUUIDsManuallyAddedToLibraryScope;
- (NSArray)assetUUIDsManuallyRemovedFromLibraryScope;
- (NSArray)assetUUIDsPhotosSuggestedAddedToLibraryScope;
- (NSArray)assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
- (NSArray)assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
- (NSArray)assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
- (NSArray)participantsAddedToLibraryScope;
- (NSArray)participantsRemovedFromLibraryScope;
- (NSDate)creationDate;
- (NSString)managedEntityName;
- (NSString)title;
- (PHLibraryScope)originalLibraryScope;
- (PHLibraryScopeChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHLibraryScopeChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHObjectPlaceholder)placeholderForCreatedLibraryScope;
- (PHShareRelationshipChangeRequestHelper)participantsHelper;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)lastParticipantAssetTrashNotificationDate;
- (id)rulesData;
- (id)scopeIdentifier;
- (id)trashedDate;
- (int64_t)scopeType;
- (signed)autoSharePolicy;
- (signed)exitState;
- (signed)localPublishState;
- (signed)participantCloudUpdateState;
- (signed)previewState;
- (signed)scopeSyncingState;
- (signed)status;
- (void)_updateParticipantCloudUpdateStateIfNecessary;
- (void)addParticipants:(id)a3;
- (void)addPreviewAssetsSuggestedByPhotos:(id)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)markAssetsAsRejectedByPhotosSuggester:(id)a3;
- (void)moveToPersonalLibrary:(id)a3;
- (void)moveToSharedLibrary:(id)a3;
- (void)rejectPreviewAssetsSuggestedByPhotos:(id)a3;
- (void)removeParticipants:(id)a3;
- (void)removePreviewAssetsSuggestedByPhotos:(id)a3;
- (void)setAssetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope:(id)a3;
- (void)setAssetUUIDsManuallyAddedToLibraryScope:(id)a3;
- (void)setAssetUUIDsManuallyRemovedFromLibraryScope:(id)a3;
- (void)setAssetUUIDsPhotosSuggestedAddedToLibraryScope:(id)a3;
- (void)setAssetUUIDsPhotosSuggestedRejectedFromLibraryScope:(id)a3;
- (void)setAssetUUIDsPhotosSuggestedRemovedFromLibraryScope:(id)a3;
- (void)setAssetUUIDsPhotosSuggestedUnRejectedFromLibraryScope:(id)a3;
- (void)setAutoSharePolicy:(signed __int16)a3;
- (void)setCreationDate:(id)a3;
- (void)setExitState:(signed __int16)a3;
- (void)setLastParticipantAssetTrashNotificationDate:(id)a3;
- (void)setLocalPublishState:(signed __int16)a3;
- (void)setOriginalLibraryScope:(id)a3;
- (void)setParticipantCloudUpdateState:(signed __int16)a3;
- (void)setParticipantsAddedToLibraryScope:(id)a3;
- (void)setParticipantsRemovedFromLibraryScope:(id)a3;
- (void)setPendingLibraryScopeInvitationToPreviewState;
- (void)setPreviewState:(signed __int16)a3;
- (void)setRulesData:(id)a3;
- (void)setRunningAsUnitTest:(BOOL)a3;
- (void)setScopeIdentifier:(id)a3;
- (void)setScopeSyncingState:(signed __int16)a3;
- (void)setScopeType:(int64_t)a3;
- (void)setStatus:(signed __int16)a3;
- (void)setTitle:(id)a3;
- (void)setTrashedDate:(id)a3;
- (void)unRejectPreviewAssetsSuggestedByPhotos:(id)a3;
- (void)updateWithCustomRules:(id)a3;
@end

@implementation PHLibraryScopeChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsRemovedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_participantsAddedToLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedAddedToLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsManuallyRemovedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsManuallyAddedToLibraryScope, 0);
  objc_destroyWeak((id *)&self->_originalLibraryScope);

  objc_storeStrong((id *)&self->_participantsHelper, 0);
}

- (void)setParticipantsRemovedFromLibraryScope:(id)a3
{
}

- (NSArray)participantsRemovedFromLibraryScope
{
  return self->_participantsRemovedFromLibraryScope;
}

- (void)setParticipantsAddedToLibraryScope:(id)a3
{
}

- (NSArray)participantsAddedToLibraryScope
{
  return self->_participantsAddedToLibraryScope;
}

- (void)setAssetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope:(id)a3
{
}

- (NSArray)assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope
{
  return self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedUnRejectedFromLibraryScope:(id)a3
{
}

- (NSArray)assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedRejectedFromLibraryScope:(id)a3
{
}

- (NSArray)assetUUIDsPhotosSuggestedRejectedFromLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedRemovedFromLibraryScope:(id)a3
{
}

- (NSArray)assetUUIDsPhotosSuggestedRemovedFromLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedAddedToLibraryScope:(id)a3
{
}

- (NSArray)assetUUIDsPhotosSuggestedAddedToLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
}

- (void)setAssetUUIDsManuallyRemovedFromLibraryScope:(id)a3
{
}

- (NSArray)assetUUIDsManuallyRemovedFromLibraryScope
{
  return self->_assetUUIDsManuallyRemovedFromLibraryScope;
}

- (void)setAssetUUIDsManuallyAddedToLibraryScope:(id)a3
{
}

- (NSArray)assetUUIDsManuallyAddedToLibraryScope
{
  return self->_assetUUIDsManuallyAddedToLibraryScope;
}

- (void)setRunningAsUnitTest:(BOOL)a3
{
  self->_runningAsUnitTest = a3;
}

- (BOOL)runningAsUnitTest
{
  return self->_runningAsUnitTest;
}

- (void)setOriginalLibraryScope:(id)a3
{
}

- (PHLibraryScope)originalLibraryScope
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalLibraryScope);

  return (PHLibraryScope *)WeakRetained;
}

- (PHShareRelationshipChangeRequestHelper)participantsHelper
{
  return self->_participantsHelper;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v219[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHChangeRequest *)self helper];
  id v192 = 0;
  int v11 = [v10 applyMutationsToManagedObject:v8 error:&v192];
  id v12 = v192;

  if (v11)
  {
    v13 = [(PHLibraryScopeChangeRequest *)self participantsAddedToLibraryScope];
    if ([v13 count])
    {
    }
    else
    {
      [(PHLibraryScopeChangeRequest *)self participantsRemovedFromLibraryScope];
      v15 = id v14 = v12;
      uint64_t v16 = [v15 count];

      id v12 = v14;
      if (!v16) {
        goto LABEL_6;
      }
    }
    v17 = (void *)MEMORY[0x1E4F8A8D8];
    [(PHLibraryScopeChangeRequest *)self participantsAddedToLibraryScope];
    v19 = id v18 = v12;
    [v17 informRapportToAddShareParticipantUUIDs:v19 photoLibrary:v9];

    v20 = (void *)MEMORY[0x1E4F8A8D8];
    v21 = [(PHLibraryScopeChangeRequest *)self participantsRemovedFromLibraryScope];
    v22 = [v9 libraryBundle];
    [v20 informRapportToRemoveShareParticipantUUIDs:v21 photoLibraryBundle:v22];

    id v12 = v18;
  }
LABEL_6:
  id v23 = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PHLibraryScopeChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke;
  aBlock[3] = &unk_1E5846408;
  id v24 = v9;
  id v191 = v24;
  v25 = (void (**)(void *, void *))_Block_copy(aBlock);
  v160 = self;
  if (!v11)
  {
    int v41 = 0;
    goto LABEL_109;
  }
  v26 = [(PHLibraryScopeChangeRequest *)self assetUUIDsManuallyAddedToLibraryScope];
  uint64_t v27 = [v26 count];

  v159 = a5;
  if (v27)
  {
    v28 = (void *)MEMORY[0x1E4F8A950];
    v29 = [(PHLibraryScopeChangeRequest *)self assetUUIDsManuallyAddedToLibraryScope];
    v30 = [v28 assetsWithUUIDs:v29 options:1 inLibrary:v24];
    v31 = v25[2](v25, v30);

    uint64_t v32 = [v23 currentUserParticipant];
    if (!v32)
    {
      v48 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v218 = *MEMORY[0x1E4F28568];
      v219[0] = @"Attemping to move assets to a LibraryScope that doesn't have a current user participant. This is an invalid action.";
      id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v219 forKeys:&v218 count:1];
      uint64_t v50 = objc_msgSend(v48, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 8506, v49);
      goto LABEL_106;
    }
    v33 = (void *)v32;
    long long v188 = 0u;
    long long v189 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    id v34 = v31;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v186 objects:v217 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      v155 = v25;
      v157 = v12;
      uint64_t v37 = *(void *)v187;
      while (2)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v187 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v186 + 1) + 8 * i);
          if (([v39 canPerformEditOperation:32] & 1) == 0)
          {
            v42 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v215 = *MEMORY[0x1E4F28568];
            v43 = NSString;
            v44 = [v39 uuid];
            v45 = [v43 stringWithFormat:@"Attemping to move asset %@ that cannot be moved to shared library. Check with -[PHAsset canPerformEditOperation:PHAssetEditOperationMoveToSharedLibrary] first", v44];
            v216 = v45;
            v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v216 forKeys:&v215 count:1];
            uint64_t v47 = objc_msgSend(v42, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v46);

            int v11 = 0;
            id v12 = (id)v47;
            goto LABEL_20;
          }
          v40 = [MEMORY[0x1E4F1CAD0] setWithObject:v33];
          [v39 setLibraryScope:v23 withContributors:v40];

          [v39 libraryScopeShareState];
          PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue();
          PLLibraryScopeAssetResetValues();
          PLLibraryScopeAssetSetSuggestedByClientType();
          PLLibraryScopeAssetSetUserManuallyAddedState();
          [v23 libraryScopeIsActive];
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v186 objects:v217 count:16];
        if (v36) {
          continue;
        }
        break;
      }
      id v12 = v157;
LABEL_20:
      v25 = v155;
    }
    else
    {
      int v11 = 1;
    }

    self = v160;
    if (!v11)
    {
      int v41 = 0;
      goto LABEL_108;
    }
    a5 = v159;
  }
  v51 = [(PHLibraryScopeChangeRequest *)self assetUUIDsManuallyRemovedFromLibraryScope];
  uint64_t v52 = [v51 count];

  v156 = v25;
  v158 = v12;
  if (v52)
  {
    v53 = (void *)MEMORY[0x1E4F8A950];
    v54 = [(PHLibraryScopeChangeRequest *)self assetUUIDsManuallyRemovedFromLibraryScope];
    id v154 = v24;
    v55 = [v53 assetsWithUUIDs:v54 options:1 inLibrary:v24];
    v56 = v25[2](v25, v55);

    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    id v49 = v56;
    uint64_t v57 = [v49 countByEnumeratingWithState:&v182 objects:v214 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v183;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v183 != v59) {
            objc_enumerationMutation(v49);
          }
          v61 = *(void **)(*((void *)&v182 + 1) + 8 * j);
          if (![v61 canPerformEditOperation:64])
          {
            v117 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v212 = *MEMORY[0x1E4F28568];
            v118 = NSString;
            uint64_t v119 = [v61 uuid];
            v120 = [v118 stringWithFormat:@"Attemping to move asset %@ that cannot be moved to personal library. Check with -[PHAsset canPerformEditOperation:PHAssetEditOperationMoveToPersonalLibrary] first", v119];
            v213 = v120;
            v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v213 forKeys:&v212 count:1];
            uint64_t v50 = objc_msgSend(v117, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v121);

            id v12 = (id)v119;
            v31 = v49;
            id v24 = v154;
            goto LABEL_105;
          }
          [v61 removeLibraryScopeAndContributors];
          [v61 libraryScopeShareState];
          PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue();
          PLLibraryScopeAssetResetValues();
          PLLibraryScopeAssetSetSuggestedByClientType();
          PLLibraryScopeAssetSetUserManuallyRejectedState();
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        uint64_t v58 = [v49 countByEnumeratingWithState:&v182 objects:v214 count:16];
      }
      while (v58);
    }

    v25 = v156;
    id v12 = v158;
    id v24 = v154;
  }
  v62 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedAddedToLibraryScope];
  uint64_t v63 = [v62 count];

  if (v63)
  {
    v64 = (void *)MEMORY[0x1E4F8A950];
    v65 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedAddedToLibraryScope];
    v66 = [v64 assetsWithUUIDs:v65 options:1 inLibrary:v24];
    v67 = v25[2](v25, v66);

    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    id v49 = v67;
    uint64_t v68 = [v49 countByEnumeratingWithState:&v178 objects:v211 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v179;
      do
      {
        for (uint64_t k = 0; k != v69; ++k)
        {
          if (*(void *)v179 != v70) {
            objc_enumerationMutation(v49);
          }
          v72 = *(void **)(*((void *)&v178 + 1) + 8 * k);
          if (![v72 canPerformEditOperation:32])
          {
            v122 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v209 = *MEMORY[0x1E4F28568];
            v123 = NSString;
            uint64_t v124 = [v72 uuid];
            v125 = [v123 stringWithFormat:@"Attemping to move asset %@ that cannot be moved to shared library. Check with -[PHAsset canPerformEditOperation:PHAssetEditOperationMoveToSharedLibrary] first", v124];
            v210 = v125;
            v126 = (void *)MEMORY[0x1E4F1C9E8];
            v127 = &v210;
            v128 = &v209;
            goto LABEL_94;
          }
          PLLibraryScopeAssetRemoveSuggestedByClientType();
          PLLibraryScopeAssetSetSuggestedByClientType();
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        uint64_t v69 = [v49 countByEnumeratingWithState:&v178 objects:v211 count:16];
      }
      while (v69);
    }

    v25 = v156;
    id v12 = v158;
  }
  v73 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedRemovedFromLibraryScope];
  uint64_t v74 = [v73 count];

  if (v74)
  {
    v75 = (void *)MEMORY[0x1E4F8A950];
    v76 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedRemovedFromLibraryScope];
    v77 = [v75 assetsWithUUIDs:v76 options:1 inLibrary:v24];
    v78 = v25[2](v25, v77);

    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    id v49 = v78;
    uint64_t v79 = [v49 countByEnumeratingWithState:&v174 objects:v208 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v175;
      do
      {
        for (uint64_t m = 0; m != v80; ++m)
        {
          if (*(void *)v175 != v81) {
            objc_enumerationMutation(v49);
          }
          v83 = *(void **)(*((void *)&v174 + 1) + 8 * m);
          [v83 libraryScopeShareState];
          if (PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue() == -1)
          {
            v129 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v206 = *MEMORY[0x1E4F28568];
            v130 = NSString;
            id v12 = [v83 uuid];
            v131 = [v130 stringWithFormat:@"Attemping to remove an asset %@ that is not in a suggested state", v12];
            v207 = v131;
            v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
            uint64_t v50 = objc_msgSend(v129, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v132);

            goto LABEL_104;
          }
          PLLibraryScopeAssetRemoveSuggestedByClientType();
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        uint64_t v80 = [v49 countByEnumeratingWithState:&v174 objects:v208 count:16];
      }
      while (v80);
    }

    v25 = v156;
    id v12 = v158;
  }
  v84 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedRejectedFromLibraryScope];
  uint64_t v85 = [v84 count];

  if (!v85) {
    goto LABEL_65;
  }
  v86 = (void *)MEMORY[0x1E4F8A950];
  v87 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedRejectedFromLibraryScope];
  v88 = [v86 assetsWithUUIDs:v87 options:1 inLibrary:v24];
  v89 = v25[2](v25, v88);

  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v49 = v89;
  uint64_t v90 = [v49 countByEnumeratingWithState:&v170 objects:v205 count:16];
  if (!v90) {
    goto LABEL_64;
  }
  uint64_t v91 = v90;
  uint64_t v92 = *(void *)v171;
  do
  {
    for (uint64_t n = 0; n != v91; ++n)
    {
      if (*(void *)v171 != v92) {
        objc_enumerationMutation(v49);
      }
      v94 = *(void **)(*((void *)&v170 + 1) + 8 * n);
      [v94 libraryScopeShareState];
      if (PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue() == -1)
      {
        v122 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v203 = *MEMORY[0x1E4F28568];
        v133 = NSString;
        uint64_t v124 = [v94 uuid];
        v125 = [v133 stringWithFormat:@"Attemping to reject an asset %@ that is not in a suggested state", v124];
        v204 = v125;
        v126 = (void *)MEMORY[0x1E4F1C9E8];
        v127 = &v204;
        v128 = &v203;
LABEL_94:
        v134 = [v126 dictionaryWithObjects:v127 forKeys:v128 count:1];
        uint64_t v50 = objc_msgSend(v122, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v134);

        id v12 = (id)v124;
LABEL_104:
        v31 = v49;
LABEL_105:
        v25 = v156;
LABEL_106:

        int v41 = 0;
        id v12 = (id)v50;
        goto LABEL_107;
      }
      PLLibraryScopeAssetSetUserManuallyRejectedState();
      PLLibraryScopeAssetSetAddToSharedZoneState();
    }
    uint64_t v91 = [v49 countByEnumeratingWithState:&v170 objects:v205 count:16];
  }
  while (v91);
LABEL_64:

  v25 = v156;
  id v12 = v158;
LABEL_65:
  v95 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope];
  uint64_t v96 = [v95 count];

  if (!v96) {
    goto LABEL_76;
  }
  v97 = (void *)MEMORY[0x1E4F8A950];
  v98 = [(PHLibraryScopeChangeRequest *)self assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope];
  v99 = [v97 assetsWithUUIDs:v98 options:1 inLibrary:v24];
  v100 = v25[2](v25, v99);

  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id v49 = v100;
  uint64_t v101 = [v49 countByEnumeratingWithState:&v166 objects:v202 count:16];
  if (!v101) {
    goto LABEL_75;
  }
  uint64_t v102 = v101;
  uint64_t v103 = *(void *)v167;
  while (2)
  {
    uint64_t v104 = 0;
    while (2)
    {
      if (*(void *)v167 != v103) {
        objc_enumerationMutation(v49);
      }
      v105 = *(void **)(*((void *)&v166 + 1) + 8 * v104);
      [v105 libraryScopeShareState];
      if ((PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue() & 1) == 0)
      {
        v135 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v200 = *MEMORY[0x1E4F28568];
        v136 = NSString;
        uint64_t v137 = [v105 uuid];
        v138 = [v136 stringWithFormat:@"Attemping to unreject an asset %@ that is not in a manually rejected state", v137];
        v201 = v138;
        v139 = (void *)MEMORY[0x1E4F1C9E8];
        v140 = &v201;
        v141 = &v200;
        goto LABEL_98;
      }
      if (PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue() == -1)
      {
        v135 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v198 = *MEMORY[0x1E4F28568];
        v142 = NSString;
        uint64_t v137 = [v105 uuid];
        v138 = [v142 stringWithFormat:@"Attemping to unreject an asset %@ that does not have a suggested bit set", v137];
        v199 = v138;
        v139 = (void *)MEMORY[0x1E4F1C9E8];
        v140 = &v199;
        v141 = &v198;
LABEL_98:
        v143 = [v139 dictionaryWithObjects:v140 forKeys:v141 count:1];
        uint64_t v50 = objc_msgSend(v135, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v143);

LABEL_103:
        id v12 = (id)v137;
        goto LABEL_104;
      }
      PLLibraryScopeAssetSetAddToSharedZoneState();
      PLLibraryScopeAssetSetUserManuallyRejectedState();
      if (v102 != ++v104) {
        continue;
      }
      break;
    }
    uint64_t v102 = [v49 countByEnumeratingWithState:&v166 objects:v202 count:16];
    a5 = v159;
    if (v102) {
      continue;
    }
    break;
  }
LABEL_75:

  v25 = v156;
  id v12 = v158;
LABEL_76:
  v106 = [(PHLibraryScopeChangeRequest *)self assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope];
  uint64_t v107 = [v106 count];

  if (v107)
  {
    v108 = (void *)MEMORY[0x1E4F8A950];
    v109 = [(PHLibraryScopeChangeRequest *)self assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope];
    int v41 = 1;
    v110 = [v108 assetsWithUUIDs:v109 options:1 inLibrary:v24];
    v111 = v25[2](v25, v110);

    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id v49 = v111;
    uint64_t v112 = [v49 countByEnumeratingWithState:&v162 objects:v197 count:16];
    if (v112)
    {
      uint64_t v113 = v112;
      uint64_t v114 = *(void *)v163;
      id v12 = v158;
      while (2)
      {
        for (iuint64_t i = 0; ii != v113; ++ii)
        {
          if (*(void *)v163 != v114) {
            objc_enumerationMutation(v49);
          }
          v116 = *(void **)(*((void *)&v162 + 1) + 8 * ii);
          [v116 libraryScopeShareState];
          if ((PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue() & 1) != 0
            || PLLibraryScopeAssetGetRejectedByPhotosSuggesterFromShareStateValue())
          {
            v144 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v195 = *MEMORY[0x1E4F28568];
            v145 = NSString;
            uint64_t v137 = [v116 uuid];
            v138 = [v145 stringWithFormat:@"Attemping to PhotosSuggester reject an asset %@ that is already in a rejected state", v137];
            v196 = v138;
            v146 = (void *)MEMORY[0x1E4F1C9E8];
            v147 = &v196;
            v148 = &v195;
LABEL_102:
            v143 = [v146 dictionaryWithObjects:v147 forKeys:v148 count:1];
            uint64_t v50 = objc_msgSend(v144, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v143);

            goto LABEL_103;
          }
          if ((PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue() & 1) != 0
            || [v116 hasLibraryScope])
          {
            v144 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v193 = *MEMORY[0x1E4F28568];
            v149 = NSString;
            uint64_t v137 = [v116 uuid];
            v138 = [v149 stringWithFormat:@"Attemping to PhotosSuggester reject an asset %@ that is already added to shared zone", v137];
            v194 = v138;
            v146 = (void *)MEMORY[0x1E4F1C9E8];
            v147 = &v194;
            v148 = &v193;
            goto LABEL_102;
          }
          PLLibraryScopeAssetRemoveSuggestedByClientType();
          PLLibraryScopeAssetSetAddToSharedZoneState();
          PLLibraryScopeAssetSetUserManuallyRejectedState();
          PLLibraryScopeAssetSetPhotosSuggesterRejectedState();
        }
        uint64_t v113 = [v49 countByEnumeratingWithState:&v162 objects:v197 count:16];
        int v41 = 1;
        if (v113) {
          continue;
        }
        break;
      }
      v31 = v49;
      v25 = v156;
    }
    else
    {
      v31 = v49;
      id v12 = v158;
    }
LABEL_107:

LABEL_108:
    a5 = v159;
  }
  else
  {
    int v41 = 1;
  }
LABEL_109:

  if (v41)
  {
    v150 = [(PHLibraryScopeChangeRequest *)v160 participantsHelper];
    id v161 = v12;
    char v151 = [v150 applyMutationsToManagedObject:v23 error:&v161];
    id v152 = v161;

    id v12 = v152;
    if (!a5) {
      goto LABEL_115;
    }
LABEL_113:
    if ((v151 & 1) == 0) {
      *a5 = v12;
    }
  }
  else
  {
    char v151 = 0;
    if (a5) {
      goto LABEL_113;
    }
  }
LABEL_115:

  return v151;
}

id __80__PHLibraryScopeChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v10, (void)v17);
        if ([v10 isPartOfBurst])
        {
          int v11 = (void *)MEMORY[0x1E4F8A6B8];
          id v12 = [v10 avalancheUUID];
          v13 = [*(id *)(a1 + 32) managedObjectContext];
          id v14 = [v11 assetsWithAvalancheUUID:v12 inManagedObjectContext:v13];

          [v4 addObjectsFromArray:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = [v4 allObjects];

  return v15;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  v48[13] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHChangeRequest *)self helper];
  id v39 = 0;
  int v11 = [v10 allowMutationToManagedObject:v8 propertyKey:v9 error:&v39];
  id v12 = v39;

  if (v11)
  {
    v48[0] = @"title";
    v48[1] = @"autoSharePolicy";
    v48[2] = @"rulesData";
    v48[3] = @"participantCloudUpdateState";
    v48[4] = @"scopeSyncingState";
    v48[5] = @"status";
    v48[6] = @"scopeType";
    v48[7] = @"localPublishState";
    v48[8] = @"scopeIdentifier";
    v48[9] = @"previewState";
    v48[10] = @"exitState";
    v48[11] = @"trashedDate";
    v48[12] = @"lastParticipantAssetTrashNotificationDate";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:13];
    if (-[PHChangeRequest isNewRequest](self, "isNewRequest") || ([v13 containsObject:v9] & 1) != 0)
    {
      BOOL v14 = 1;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      uint64_t v16 = [NSString stringWithFormat:@"Invalid operation on key %@", v9];
      uint64_t v47 = v16;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      uint64_t v18 = objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v17);

      BOOL v14 = 0;
      id v12 = (id)v18;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  if (([v9 isEqualToString:@"autoSharePolicy"] & 1) != 0
    || [v9 isEqualToString:@"rulesData"])
  {
    id v19 = v8;
    long long v20 = [(PHChangeRequest *)self helper];
    v21 = [v20 mutations];
    uint64_t v22 = [v21 objectForKey:@"autoSharePolicy"];

    if (v22) {
      __int16 v23 = [v22 intValue];
    }
    else {
      __int16 v23 = [v19 autoSharePolicy];
    }
    if (v23 == 2 && v14)
    {
      v25 = [(PHLibraryScopeChangeRequest *)self rulesData];

      if (!v25)
      {
        v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        v45 = @"AutoSharePolicy set to CustomRuleShare but customRulesData is NOT set. This is an invalid configuration. Use updateWithCustomRules: to add custom rules.";
        uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
        v28 = &v45;
        v29 = &v44;
LABEL_25:
        uint64_t v32 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
        uint64_t v33 = objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v32);

        id v12 = (id)v32;
LABEL_26:

        LOBYTE(v14) = 0;
        id v12 = (id)v33;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      if (v23 == 2 || !v14) {
        goto LABEL_28;
      }
      v31 = [(PHLibraryScopeChangeRequest *)self rulesData];

      if (v31)
      {
        v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v43 = @"AutoSharePolicy NOT set to CustomRuleShare but customRulesData is set. This is an invalid configuration. Use updateWithCustomRules: to remove all rules.";
        uint64_t v27 = (void *)MEMORY[0x1E4F1C9E8];
        v28 = &v43;
        v29 = &v42;
        goto LABEL_25;
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_28;
  }
  if (![v9 isEqualToString:@"previewState"]) {
    goto LABEL_30;
  }
  id v35 = v8;
  BOOL v36 = [v35 status] == 2 && objc_msgSend(v35, "localPublishState") == 2;
  BOOL v37 = [v35 status] == 1 && objc_msgSend(v35, "localPublishState") == 0;
  if (v14 && !v36 && !v37)
  {
    v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    int v41 = @"Unable to set previewState on a LibraryScope that's not in pending intiviation state.";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v33 = objc_msgSend(v38, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v22);
    goto LABEL_26;
  }
LABEL_29:

LABEL_30:
  if (a5 && !v14) {
    *a5 = v12;
  }

  return v14;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F8A8D8];
  id v7 = a3;
  id v8 = [(PHChangeRequest *)self uuid];
  id v9 = [(PHLibraryScopeChangeRequest *)self creationDate];
  v10 = [(PHLibraryScopeChangeRequest *)self title];
  int v11 = [v6 createOwnedShareWithUUID:v8 creationDate:v9 title:v10 unitTestMode:self->_runningAsUnitTest inPhotoLibrary:v7];

  if (a4 && !v11)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__28940;
  uint64_t v27 = __Block_byref_object_dispose__28941;
  id v28 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v8 = 1;
  char v22 = 1;
  if (!self->_runningAsUnitTest)
  {
    if (([v6 isCloudPhotoLibraryEnabled] & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      *((unsigned char *)v20 + 24) = 0;
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"Unable to insert a new LibraryScope since iCPL is disabled";
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      uint64_t v11 = objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v10);
      id v12 = (void *)v24[5];
      v24[5] = v11;
    }
    int v8 = *((unsigned __int8 *)v20 + 24);
    if (*((unsigned char *)v20 + 24))
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __68__PHLibraryScopeChangeRequest_validateInsertIntoPhotoLibrary_error___block_invoke;
      v15[3] = &unk_1E58485C8;
      id v16 = v7;
      long long v17 = &v19;
      uint64_t v18 = &v23;
      [v16 performBlockAndWait:v15];

      int v8 = *((unsigned __int8 *)v20 + 24);
    }
    if (a4 && !v8)
    {
      *a4 = (id) v24[5];
      int v8 = *((unsigned __int8 *)v20 + 24);
    }
  }
  BOOL v13 = v8 != 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __68__PHLibraryScopeChangeRequest_validateInsertIntoPhotoLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8A8D8];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v4 = [*(id *)(a1 + 32) managedObjectContext];
  id v5 = [v2 sharesWithPredicate:v3 fetchLimit:0 inManagedObjectContext:v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "status", (void)v17) == 1
          || [v11 status] == 3)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          id v12 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v21 = *MEMORY[0x1E4F28568];
          char v22 = @"Unable to insert a new LibraryScope as a owned or accepted LibraryScope already exists";
          BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          uint64_t v14 = objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v13);
          uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
          id v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)updateWithCustomRules:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    v4 = objc_msgSend(v6, "_pl_map:", &__block_literal_global_28951);
    id v5 = [MEMORY[0x1E4F8A8F8] dataForLibraryScopeRules:v4];
    [(PHLibraryScopeChangeRequest *)self setRulesData:v5];
  }
  else
  {
    [(PHLibraryScopeChangeRequest *)self setRulesData:0];
  }
}

uint64_t __53__PHLibraryScopeChangeRequest_updateWithCustomRules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 plRepresentation];
}

- (void)removeParticipants:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHLibraryScopeChangeRequest *)self participantsHelper];
  [v5 removeParticipants:v4 toChangeRequest:self];

  [(PHLibraryScopeChangeRequest *)self _updateParticipantCloudUpdateStateIfNecessary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        participantsRemovedFromLibraryScope = self->_participantsRemovedFromLibraryScope;
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "uuid", (void)v15);
        BOOL v13 = [(NSArray *)participantsRemovedFromLibraryScope arrayByAddingObject:v12];
        uint64_t v14 = self->_participantsRemovedFromLibraryScope;
        self->_participantsRemovedFromLibraryScope = v13;

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  +[PHShareParticipantChangeRequest deleteShareParticipants:v6];
}

- (void)addParticipants:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHLibraryScopeChangeRequest *)self participantsHelper];
  [v5 addParticipants:v4 toChangeRequest:self];

  [(PHLibraryScopeChangeRequest *)self _updateParticipantCloudUpdateStateIfNecessary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        participantsAddedToLibraryScope = self->_participantsAddedToLibraryScope;
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "uuid", (void)v15);
        BOOL v13 = [(NSArray *)participantsAddedToLibraryScope arrayByAddingObject:v12];
        uint64_t v14 = self->_participantsAddedToLibraryScope;
        self->_participantsAddedToLibraryScope = v13;

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_updateParticipantCloudUpdateStateIfNecessary
{
  p_originalLibraryScope = &self->_originalLibraryScope;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalLibraryScope);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_originalLibraryScope);
    int v7 = [v6 publishState];

    if (v7 == 2)
    {
      [(PHLibraryScopeChangeRequest *)self setParticipantCloudUpdateState:1];
    }
  }
}

- (void)markAssetsAsRejectedByPhotosSuggester:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "localIdentifier", (void)v15);
        id v12 = +[PHObject uuidFromLocalIdentifier:v11];
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v13 = [(NSArray *)self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope arrayByAddingObjectsFromArray:v5];
    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v13;

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)unRejectPreviewAssetsSuggestedByPhotos:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "localIdentifier", (void)v15);
        id v12 = +[PHObject uuidFromLocalIdentifier:v11];
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v13 = [(NSArray *)self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope arrayByAddingObjectsFromArray:v5];
    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v13;

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)rejectPreviewAssetsSuggestedByPhotos:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "localIdentifier", (void)v15);
        id v12 = +[PHObject uuidFromLocalIdentifier:v11];
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v13 = [(NSArray *)self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope arrayByAddingObjectsFromArray:v5];
    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v13;

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)removePreviewAssetsSuggestedByPhotos:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "localIdentifier", (void)v15);
        id v12 = +[PHObject uuidFromLocalIdentifier:v11];
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v13 = [(NSArray *)self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope arrayByAddingObjectsFromArray:v5];
    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v13;

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)addPreviewAssetsSuggestedByPhotos:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "localIdentifier", (void)v15);
        id v12 = +[PHObject uuidFromLocalIdentifier:v11];
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v13 = [(NSArray *)self->_assetUUIDsPhotosSuggestedAddedToLibraryScope arrayByAddingObjectsFromArray:v5];
    assetUUIDsPhotosSuggestedAddedToLibraryScope = self->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    self->_assetUUIDsPhotosSuggestedAddedToLibraryScope = v13;

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)moveToPersonalLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "localIdentifier", (void)v15);
        id v12 = +[PHObject uuidFromLocalIdentifier:v11];
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v13 = [(NSArray *)self->_assetUUIDsManuallyRemovedFromLibraryScope arrayByAddingObjectsFromArray:v5];
    assetUUIDsManuallyRemovedFromLibraryScope = self->_assetUUIDsManuallyRemovedFromLibraryScope;
    self->_assetUUIDsManuallyRemovedFromLibraryScope = v13;

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)moveToSharedLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "localIdentifier", (void)v15);
        id v12 = +[PHObject uuidFromLocalIdentifier:v11];
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    BOOL v13 = [(NSArray *)self->_assetUUIDsManuallyAddedToLibraryScope arrayByAddingObjectsFromArray:v5];
    assetUUIDsManuallyAddedToLibraryScope = self->_assetUUIDsManuallyAddedToLibraryScope;
    self->_assetUUIDsManuallyAddedToLibraryScope = v13;

    [(PHChangeRequest *)self didMutate];
  }
}

- (void)setAutoSharePolicy:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v6 = [NSNumber numberWithShort:v3];
  uint64_t v7 = [(PHChangeRequest *)self helper];
  uint64_t v8 = [v7 mutations];
  [v8 setObject:v6 forKeyedSubscript:@"autoSharePolicy"];

  if (v3 != 2)
  {
    [(PHLibraryScopeChangeRequest *)self updateWithCustomRules:0];
  }
}

- (signed)autoSharePolicy
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"autoSharePolicy"];

  if (v5)
  {
    signed __int16 v6 = [v5 intValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_originalLibraryScope);
    signed __int16 v6 = [WeakRetained autoSharePolicy];
  }
  return v6;
}

- (void)setPendingLibraryScopeInvitationToPreviewState
{
}

- (void)setExitState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  signed __int16 v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"exitState"];
}

- (signed)exitState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"exitState"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setLocalPublishState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  signed __int16 v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"localPublishState"];
}

- (signed)localPublishState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"localPublishState"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setScopeType:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  signed __int16 v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"scopeType"];
}

- (int64_t)scopeType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"scopeType"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setStatus:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"status"];
}

- (signed)status
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"status"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setScopeSyncingState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"scopeSyncingState"];
}

- (signed)scopeSyncingState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"scopeSyncingState"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setPreviewState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"previewState"];
}

- (signed)previewState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"previewState"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setParticipantCloudUpdateState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  uint64_t v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"participantCloudUpdateState"];
}

- (signed)participantCloudUpdateState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"participantCloudUpdateState"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setLastParticipantAssetTrashNotificationDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"lastParticipantAssetTrashNotificationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"lastParticipantAssetTrashNotificationDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"lastParticipantAssetTrashNotificationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"lastParticipantAssetTrashNotificationDate"];
  }
}

- (id)lastParticipantAssetTrashNotificationDate
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"lastParticipantAssetTrashNotificationDate"];

  return v5;
}

- (void)setTrashedDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"trashedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"trashedDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"trashedDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"trashedDate"];
  }
}

- (id)trashedDate
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"trashedDate"];

  return v5;
}

- (void)setScopeIdentifier:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"scopeIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"scopeIdentifier"];
  }
  else
  {
    [v6 removeObjectForKey:@"scopeIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"scopeIdentifier"];
  }
}

- (id)scopeIdentifier
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"scopeIdentifier"];

  return v5;
}

- (void)setRulesData:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"rulesData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"rulesData"];
  }
  else
  {
    [v6 removeObjectForKey:@"rulesData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"rulesData"];
  }
}

- (id)rulesData
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"rulesData"];

  return v5;
}

- (void)setCreationDate:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
  uint64_t v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"creationDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"creationDate"];
  }
}

- (NSDate)creationDate
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"creationDate"];

  return (NSDate *)v5;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int64_t v6 = [v5 mutations];
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
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (PHObjectPlaceholder)placeholderForCreatedLibraryScope
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (NSString)managedEntityName
{
  return (NSString *)@"LibraryScope";
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 encodeToXPCDict:xdict];

  id v5 = [(PHLibraryScopeChangeRequest *)self participantsHelper];
  [v5 encodeToXPCDict:xdict];

  xpc_dictionary_set_BOOL(xdict, "runningAsUnitTest", self->_runningAsUnitTest);
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
}

- (PHLibraryScopeChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v34 = a4;
  id v33 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PHLibraryScopeChangeRequest;
  uint64_t v9 = [(PHChangeRequest *)&v35 init];
  if (v9)
  {
    id v10 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v9 request:v34 clientAuthorization:v33];
    helper = v9->super._helper;
    v9->super._helper = v10;

    id v12 = [(PHRelationshipChangeRequestHelper *)[PHShareRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"participants" xpcDict:v8 changeRequestHelper:v9->super._helper];
    participantsHelper = v9->_participantsHelper;
    v9->_participantsHelper = v12;

    v9->_runningAsUnitTest = xpc_dictionary_get_BOOL(v8, "runningAsUnitTest");
    uint64_t v14 = PLArrayFromXPCDictionary();
    assetUUIDsManuallyAddedToLibraryScope = v9->_assetUUIDsManuallyAddedToLibraryScope;
    v9->_assetUUIDsManuallyAddedToLibraryScope = (NSArray *)v14;

    uint64_t v16 = PLArrayFromXPCDictionary();
    assetUUIDsManuallyRemovedFromLibraryScope = v9->_assetUUIDsManuallyRemovedFromLibraryScope;
    v9->_assetUUIDsManuallyRemovedFromLibraryScope = (NSArray *)v16;

    uint64_t v18 = PLArrayFromXPCDictionary();
    assetUUIDsPhotosSuggestedAddedToLibraryScope = v9->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    v9->_assetUUIDsPhotosSuggestedAddedToLibraryScope = (NSArray *)v18;

    uint64_t v20 = PLArrayFromXPCDictionary();
    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v9->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    v9->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = (NSArray *)v20;

    uint64_t v22 = PLArrayFromXPCDictionary();
    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v9->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    v9->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = (NSArray *)v22;

    uint64_t v24 = PLArrayFromXPCDictionary();
    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v9->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    v9->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = (NSArray *)v24;

    uint64_t v26 = PLArrayFromXPCDictionary();
    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v9->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    v9->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = (NSArray *)v26;

    uint64_t v28 = PLArrayFromXPCDictionary();
    participantsAddedToLibraryScope = v9->_participantsAddedToLibraryScope;
    v9->_participantsAddedToLibraryScope = (NSArray *)v28;

    uint64_t v30 = PLArrayFromXPCDictionary();
    participantsRemovedFromLibraryScope = v9->_participantsRemovedFromLibraryScope;
    v9->_participantsRemovedFromLibraryScope = (NSArray *)v30;

    if (v9->_runningAsUnitTest
      || v9->_assetUUIDsManuallyAddedToLibraryScope
      || v9->_assetUUIDsManuallyRemovedFromLibraryScope
      || v9->_assetUUIDsPhotosSuggestedAddedToLibraryScope
      || v9->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope
      || v9->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope
      || v9->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope
      || v9->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope
      || v9->_participantsAddedToLibraryScope
      || v9->_participantsRemovedFromLibraryScope)
    {
      -[PHChangeRequestHelper setMutated:](v9->super._helper, "setMutated:", 1, 64);
      [v34 recordUpdateRequest:v9];
    }
  }

  return v9;
}

- (PHLibraryScopeChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHLibraryScopeChangeRequest;
  id v8 = [(PHChangeRequest *)&v24 init];
  if (v8)
  {
    uint64_t v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    uint64_t v11 = [(PHRelationshipChangeRequestHelper *)[PHShareRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"participants" changeRequestHelper:v8->super._helper];
    participantsHelper = v8->_participantsHelper;
    v8->_participantsHelper = v11;

    v8->_runningAsUnitTest = MEMORY[0x19F388C70]();
    assetUUIDsManuallyAddedToLibraryScope = v8->_assetUUIDsManuallyAddedToLibraryScope;
    uint64_t v14 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v8->_assetUUIDsManuallyAddedToLibraryScope = (NSArray *)MEMORY[0x1E4F1CBF0];

    assetUUIDsManuallyRemovedFromLibraryScope = v8->_assetUUIDsManuallyRemovedFromLibraryScope;
    v8->_assetUUIDsManuallyRemovedFromLibraryScope = v14;

    assetUUIDsPhotosSuggestedAddedToLibraryScope = v8->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    v8->_assetUUIDsPhotosSuggestedAddedToLibraryScope = v14;

    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v8->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    v8->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v14;

    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v8->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    v8->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v14;

    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v8->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    v8->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v14;

    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v8->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    v8->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v14;

    participantsAddedToLibraryScope = v8->_participantsAddedToLibraryScope;
    v8->_participantsAddedToLibraryScope = v14;

    participantsRemovedFromLibraryScope = v8->_participantsRemovedFromLibraryScope;
    v8->_participantsRemovedFromLibraryScope = v14;
  }
  return v8;
}

- (id)initForNewObject
{
  v18.receiver = self;
  v18.super_class = (Class)PHLibraryScopeChangeRequest;
  v2 = [(PHChangeRequest *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [(PHRelationshipChangeRequestHelper *)[PHShareRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"participants" changeRequestHelper:v2->super._helper];
    participantsHelper = v2->_participantsHelper;
    v2->_participantsHelper = v5;

    v2->_runningAsUnitTest = MEMORY[0x19F388C70]();
    assetUUIDsManuallyAddedToLibraryScope = v2->_assetUUIDsManuallyAddedToLibraryScope;
    id v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_assetUUIDsManuallyAddedToLibraryScope = (NSArray *)MEMORY[0x1E4F1CBF0];

    assetUUIDsManuallyRemovedFromLibraryScope = v2->_assetUUIDsManuallyRemovedFromLibraryScope;
    v2->_assetUUIDsManuallyRemovedFromLibraryScope = v8;

    assetUUIDsPhotosSuggestedAddedToLibraryScope = v2->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    v2->_assetUUIDsPhotosSuggestedAddedToLibraryScope = v8;

    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v2->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    v2->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v8;

    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v2->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    v2->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v8;

    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v2->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    v2->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v8;

    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v2->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    v2->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v8;

    participantsAddedToLibraryScope = v2->_participantsAddedToLibraryScope;
    v2->_participantsAddedToLibraryScope = v8;

    participantsRemovedFromLibraryScope = v2->_participantsRemovedFromLibraryScope;
    v2->_participantsRemovedFromLibraryScope = v8;
  }
  return v2;
}

+ (void)_expungeLibraryScopes:(id)a3 ignorePhotosctlExpungeOverride:(BOOL)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  +[PHPhotoLibrary assertTransaction];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v19 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v20 = *MEMORY[0x1E4F1C3C8];
          uint64_t v21 = NSString;
          uint64_t v22 = NSStringFromSelector(a2);
          uint64_t v23 = [v21 stringWithFormat:@"Invalid object %@ passed to %@, objects must be of type PHLibraryScope", v12, v22];
          id v24 = [v19 exceptionWithName:v20 reason:v23 userInfo:0];

          objc_exception_throw(v24);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = +[PHObjectDeleteRequest deleteRequestForObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        [v18 setOperation:2];
        if (PLIsInternalTool() && !a4) {
          [v18 setPhotosctlExpungeOverride:1];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }
}

+ (void)expungeLibraryScopes:(id)a3
{
}

+ (void)untrashLibraryScopes:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[PHPhotoLibrary assertTransaction];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v17 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v18 = *MEMORY[0x1E4F1C3C8];
          long long v19 = NSString;
          uint64_t v20 = NSStringFromSelector(a2);
          uint64_t v21 = [v19 stringWithFormat:@"Invalid object %@ passed to %@, objects must be of type PHLibraryScope", v10, v20];
          id v22 = [v17 exceptionWithName:v18 reason:v21 userInfo:0];

          objc_exception_throw(v22);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = +[PHObjectDeleteRequest deleteRequestForObject:*(void *)(*((void *)&v23 + 1) + 8 * j)];
        [v16 setOperation:1];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }
}

+ (void)trashLibraryScopes:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[PHPhotoLibrary assertTransaction];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v17 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v18 = *MEMORY[0x1E4F1C3C8];
          long long v19 = NSString;
          uint64_t v20 = NSStringFromSelector(a2);
          uint64_t v21 = [v19 stringWithFormat:@"Invalid object %@ passed to %@, objects must be of type PHLibraryScope", v10, v20];
          id v22 = [v17 exceptionWithName:v18 reason:v21 userInfo:0];

          objc_exception_throw(v22);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = +[PHObjectDeleteRequest deleteRequestForObject:*(void *)(*((void *)&v23 + 1) + 8 * j)];
        [v16 setOperation:0];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }
}

+ (id)creationRequestForOwnedLibraryScopeInPreviewStateWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = [[PHLibraryScopeChangeRequest alloc] initForNewObject];
  [v4 setTitle:v3];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setCreationDate:v5];

  [v4 setPreviewState:1];

  return v4;
}

+ (id)changeRequestForLibraryScope:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [PHLibraryScopeChangeRequest alloc];
    id v5 = [v3 uuid];
    uint64_t v6 = [v3 objectID];
    uint64_t v7 = [(PHLibraryScopeChangeRequest *)v4 initWithUUID:v5 objectID:v6];

    [(PHLibraryScopeChangeRequest *)v7 setOriginalLibraryScope:v3];
    uint64_t v8 = [(PHLibraryScopeChangeRequest *)v7 participantsHelper];
    [v8 setOriginalShare:v3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end