@interface MPCSonicQueueFeeder
+ (BOOL)usesIdentifierRegistry;
- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4;
- (BOOL)containsLiveStream;
- (BOOL)containsTransportableContentWithReason:(id *)a3;
- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4;
- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4;
- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4;
- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4;
- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4;
- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment;
- (MPCSonicQueueFeeder)init;
- (MPCSonicQueueFeeder_Swift)swift;
- (MPModelGenericObject)fallbackSectionRepresentation;
- (MSVSectionedCollection)responseContentIDs;
- (NSString)rtcReportingPlayQueueSourceIdentifier;
- (id)_sectionedModelObjectsRepresentationForSectionedContentIDs:(id)a3;
- (id)_supplementalLibraryRequestWithError:(id *)a3;
- (id)accountIDForItem:(id)a3 inSection:(id)a4;
- (id)firstItemIntersectingIdentifierSet:(id)a3;
- (id)firstModelPlayEvent;
- (id)identifiersForItem:(id)a3 inSection:(id)a4;
- (id)itemForItem:(id)a3 inSection:(id)a4;
- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4;
- (id)playbackInfoForItem:(id)a3;
- (id)supplementalPlaybackContextWithReason:(int64_t)a3;
- (id)uniqueIdentifier;
- (id)updatedPlaybackContext;
- (int64_t)supplementalPlaybackContextBehavior;
- (void)applyVolumeNormalizationForItem:(id)a3;
- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)loadPlaybackContext:(id)a3 completion:(id)a4;
- (void)reloadSection:(id)a3 completion:(id)a4;
- (void)setFallbackSectionRepresentation:(id)a3;
- (void)setPlaybackRequestEnvironment:(id)a3;
@end

@implementation MPCSonicQueueFeeder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseContentIDs, 0);
  objc_storeStrong((id *)&self->_fallbackSectionRepresentation, 0);
  objc_storeStrong((id *)&self->_swift, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_rtcReportingPlayQueueSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);

  objc_storeStrong((id *)&self->_startTimeModifications, 0);
}

- (MSVSectionedCollection)responseContentIDs
{
  return self->_responseContentIDs;
}

- (void)setFallbackSectionRepresentation:(id)a3
{
}

- (MPModelGenericObject)fallbackSectionRepresentation
{
  return self->_fallbackSectionRepresentation;
}

- (MPCSonicQueueFeeder_Swift)swift
{
  return self->_swift;
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (id)_supplementalLibraryRequestWithError:(id *)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  v4 = (void *)[(MPCModelPlaybackRequest *)self->_request copy];
  objc_opt_class();
  v5 = v4;
  if (objc_opt_isKindOfClass())
  {
    v6 = [(MPCModelPlaybackRequest *)self->_request mediaLibrary];
    [v4 setMediaLibrary:v6];
  }
  v68 = [v4 allowedSectionIdentifiers];
  v69 = v4;
  if ([v68 count])
  {
    v71 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v68, "count"));
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v7 = v68;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v99 objects:v105 count:16];
    if (!v8) {
      goto LABEL_22;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v100;
    obuint64_t j = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v100 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        v13 = [v12 personalizedStore];
        uint64_t v14 = [v12 universalStore];
        v15 = (void *)v14;
        if (v13)
        {
          BOOL v16 = [v13 cloudID] != 0;
          if (!v15) {
            goto LABEL_14;
          }
        }
        else
        {
          BOOL v16 = 0;
          if (!v14)
          {
LABEL_14:
            BOOL v18 = 0;
            if (!v16) {
              goto LABEL_18;
            }
            goto LABEL_19;
          }
        }
        v17 = [v15 globalPlaylistID];
        if ([v17 length])
        {
          BOOL v18 = 1;
        }
        else
        {
          v19 = [v15 universalCloudLibraryID];
          BOOL v18 = [v19 length] != 0;
        }
        if (!v16)
        {
LABEL_18:
          if (!v18) {
            goto LABEL_20;
          }
        }
LABEL_19:
        id v20 = objc_alloc(MEMORY[0x263F11DB0]);
        v21 = [v12 modelKind];
        v94[0] = MEMORY[0x263EF8330];
        v94[1] = 3221225472;
        v94[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke;
        v94[3] = &unk_2643C1950;
        BOOL v97 = v16;
        id v95 = v13;
        BOOL v98 = v18;
        id v96 = v15;
        v22 = (void *)[v20 initWithSource:@"ModelQueueFeeder" modelKind:v21 block:v94];

        [v71 addObject:v22];
LABEL_20:
      }
      id v7 = obj;
      uint64_t v9 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
      if (!v9)
      {
LABEL_22:

        v5 = v69;
        [v69 setAllowedSectionIdentifiers:v71];
        if ([v71 count])
        {

          break;
        }
        if (!a3)
        {
          id v59 = 0;
          v23 = v71;
          goto LABEL_80;
        }
        v60 = (void *)MEMORY[0x263F087E8];
        objc_msgSend(v7, "msv_compactDescription");
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 72, @"Failed to create transportable allowedSectionIDs: %@", v40);
        id v59 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_78:
        v23 = v71;
        goto LABEL_79;
      }
    }
  }
  v23 = [v5 allowedItemIdentifiers];
  v71 = v23;
  if (![v23 count]) {
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  id obja = (id)objc_claimAutoreleasedReturnValue();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v90 objects:v104 count:16];
  if (!v25) {
    goto LABEL_43;
  }
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)v91;
  do
  {
    for (uint64_t j = 0; j != v26; ++j)
    {
      if (*(void *)v91 != v27) {
        objc_enumerationMutation(v24);
      }
      v29 = *(void **)(*((void *)&v90 + 1) + 8 * j);
      v30 = [v29 personalizedStore];
      uint64_t v31 = [v29 universalStore];
      v32 = (void *)v31;
      if (v30)
      {
        BOOL v33 = [v30 cloudID] != 0;
        if (!v32) {
          goto LABEL_35;
        }
      }
      else
      {
        BOOL v33 = 0;
        if (!v31)
        {
LABEL_35:
          BOOL v35 = 0;
          if (!v33) {
            goto LABEL_39;
          }
          goto LABEL_40;
        }
      }
      v34 = [v32 universalCloudLibraryID];
      if ([v34 length]) {
        BOOL v35 = 1;
      }
      else {
        BOOL v35 = [v32 purchasedAdamID] != 0;
      }

      if (!v33)
      {
LABEL_39:
        if (!v35) {
          goto LABEL_41;
        }
      }
LABEL_40:
      id v36 = v24;
      id v37 = objc_alloc(MEMORY[0x263F11DB0]);
      v38 = [v29 modelKind];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4;
      v85[3] = &unk_2643C1950;
      BOOL v88 = v33;
      id v86 = v30;
      BOOL v89 = v35;
      id v87 = v32;
      v39 = (void *)[v37 initWithSource:@"ModelQueueFeeder" modelKind:v38 block:v85];

      [obja addObject:v39];
      id v24 = v36;

LABEL_41:
    }
    uint64_t v26 = [v24 countByEnumeratingWithState:&v90 objects:v104 count:16];
  }
  while (v26);
LABEL_43:

  v5 = v69;
  v23 = v24;
  id v40 = obja;
  [v69 setAllowedItemIdentifiers:obja];
  if (![obja count])
  {
    if (a3)
    {
      v61 = (void *)MEMORY[0x263F087E8];
      v62 = objc_msgSend(v23, "msv_compactDescription");
      objc_msgSend(v61, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 72, @"Failed to create transportable allowedItemIDs: %@", v62);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v69;
    }
    id v59 = 0;
    goto LABEL_79;
  }

  v23 = v71;
LABEL_45:
  id v40 = [v5 scopedContainers];
  if (![v40 count]) {
    goto LABEL_69;
  }
  v41 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v40, "count"));
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v66 = v40;
  id v40 = v40;
  uint64_t v72 = [v40 countByEnumeratingWithState:&v81 objects:v103 count:16];
  if (!v72) {
    goto LABEL_67;
  }
  uint64_t v42 = *(void *)v82;
  id objb = v40;
  uint64_t v70 = *(void *)v82;
  while (2)
  {
    uint64_t v43 = 0;
    while (2)
    {
      if (*(void *)v82 != v42) {
        objc_enumerationMutation(objb);
      }
      v44 = *(void **)(*((void *)&v81 + 1) + 8 * v43);
      v45 = [v44 identifiers];
      v46 = [v45 personalizedStore];

      v47 = [v44 identifiers];
      v48 = [v47 universalStore];

      if (v46)
      {
        BOOL v49 = [v46 cloudID] != 0;
        if (v48) {
          goto LABEL_53;
        }
LABEL_56:
        BOOL v51 = 0;
        if (v49) {
          goto LABEL_64;
        }
LABEL_63:
        if (v51) {
          goto LABEL_64;
        }
      }
      else
      {
        BOOL v49 = 0;
        if (!v48) {
          goto LABEL_56;
        }
LABEL_53:
        v50 = [v48 globalPlaylistID];
        if ([v50 length])
        {
          BOOL v51 = 1;
        }
        else
        {
          v52 = [v48 universalCloudLibraryID];
          if ([v52 length]) {
            BOOL v51 = 1;
          }
          else {
            BOOL v51 = [v48 purchasedAdamID] != 0;
          }
        }
        if (!v49) {
          goto LABEL_63;
        }
LABEL_64:
        id v53 = objc_alloc(MEMORY[0x263F11DB0]);
        v54 = [v44 identifiers];
        [v54 modelKind];
        v56 = v55 = v41;
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7;
        v76[3] = &unk_2643C1950;
        BOOL v79 = v49;
        id v77 = v46;
        BOOL v80 = v51;
        id v78 = v48;
        v57 = (void *)[v53 initWithSource:@"ModelQueueFeeder" modelKind:v56 block:v76];

        v41 = v55;
        uint64_t v42 = v70;

        v58 = (void *)[v44 copyWithIdentifiers:v57 block:&__block_literal_global_438];
        [v41 addObject:v58];
      }
      if (v72 != ++v43) {
        continue;
      }
      break;
    }
    id v40 = objb;
    uint64_t v72 = [objb countByEnumeratingWithState:&v81 objects:v103 count:16];
    if (v72) {
      continue;
    }
    break;
  }
LABEL_67:

  v5 = v69;
  [v69 setScopedContainers:v41];
  if (![v41 count])
  {
    if (a3)
    {
      v63 = (void *)MEMORY[0x263F087E8];
      v64 = objc_msgSend(v40, "msv_compactDescription");
      objc_msgSend(v63, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 72, @"Failed to create transportable scopedContainers: %@", v64);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v69;
    }

    id v59 = 0;
    goto LABEL_78;
  }

  v23 = v71;
  id v40 = v66;
LABEL_69:
  id v59 = v5;
LABEL_79:

LABEL_80:

  return v59;
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [*(id *)(a1 + 32) personID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2;
    v7[3] = &unk_2643C4960;
    id v8 = *(id *)(a1 + 32);
    [v3 setPersonalStoreIdentifiersWithPersonID:v4 block:v7];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3;
    v5[3] = &unk_2643C4988;
    id v6 = *(id *)(a1 + 40);
    [v3 setUniversalStoreIdentifiersWithBlock:v5];
  }
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [*(id *)(a1 + 32) personID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5;
    v7[3] = &unk_2643C4960;
    id v8 = *(id *)(a1 + 32);
    [v3 setPersonalStoreIdentifiersWithPersonID:v4 block:v7];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6;
    v5[3] = &unk_2643C4988;
    id v6 = *(id *)(a1 + 40);
    [v3 setUniversalStoreIdentifiersWithBlock:v5];
  }
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [*(id *)(a1 + 32) personID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8;
    v7[3] = &unk_2643C4960;
    id v8 = *(id *)(a1 + 32);
    [v3 setPersonalStoreIdentifiersWithPersonID:v4 block:v7];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9;
    v5[3] = &unk_2643C4988;
    id v6 = *(id *)(a1 + 40);
    [v3 setUniversalStoreIdentifiersWithBlock:v5];
  }
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  v4 = [v3 globalPlaylistID];
  [v6 setGlobalPlaylistID:v4];

  v5 = [*(id *)(a1 + 32) universalCloudLibraryID];
  [v6 setUniversalCloudLibraryID:v5];

  objc_msgSend(v6, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  v4 = [v3 universalCloudLibraryID];
  [v5 setUniversalCloudLibraryID:v4];

  objc_msgSend(v5, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 globalPlaylistID];
  [v4 setGlobalPlaylistID:v5];

  id v6 = [*(id *)(a1 + 32) universalCloudLibraryID];
  [v4 setUniversalCloudLibraryID:v6];
}

- (id)_sectionedModelObjectsRepresentationForSectionedContentIDs:(id)a3
{
  return 0;
}

- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4
{
  id v5 = a4;
  id v6 = [(MPCSonicQueueFeeder *)self swift];
  char v7 = [v6 shouldShuffleExcludeContentID:v5];

  return v7;
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return a4 != 2;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_storeStrong((id *)&self->_section, a3);
  id v8 = a4;
  uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
    int v12 = 138543874;
    v13 = v10;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2048;
    id v17 = v7;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] reloadSection: | connecting to section [] section=%p", (uint8_t *)&v12, 0x20u);
  }
  v11 = [(MPCSonicQueueFeeder *)self swift];
  [v11 reloadSection:v7 completion:v8];
}

- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = [(MPCSonicQueueFeeder *)self swift];
  char v7 = [v6 shouldUsePlaceholderForContentID:v5];

  return v7;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPCSonicQueueFeeder *)self swift];
  id v25 = 0;
  uint64_t v9 = [v8 genericModelObjectForContentID:v6 error:&v25];
  id v10 = v25;

  if (v10)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v12;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      id v31 = v10;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] itemForItem:inSection | returning nil [failed to get item] error=%{public}@", buf, 0x20u);
    }
    v13 = 0;
    goto LABEL_12;
  }
  if (_os_feature_enabled_impl())
  {
    __int16 v14 = [MPCSonicAVItem alloc];
    v15 = [(MPCModelPlaybackRequest *)self->_request itemProperties];
    v13 = [(MPCSonicAVItem *)v14 initWithGenericObject:v9 itemProperties:v15 playbackRequestEnvironment:self->_playbackRequestEnvironment identityPropertySet:self->_identityPropertySet contentID:v6];
  }
  else
  {
    __int16 v16 = [MPCModelGenericAVItem alloc];
    id v17 = [(MPCModelPlaybackRequest *)self->_request itemProperties];
    v13 = [(MPCModelGenericAVItem *)v16 initWithGenericObject:v9 itemProperties:v17 playbackRequestEnvironment:self->_playbackRequestEnvironment identityPropertySet:self->_identityPropertySet];

    v15 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
    uint64_t v18 = +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:v15];
    [(MPCModelGenericAVItem *)v13 setAssetCacheProvider:v18];
  }
  v19 = [NSNumber numberWithBool:self->_isSiriInitiated];
  [(MPCModelGenericAVItem *)v13 setSiriInitiated:v19];

  id v20 = [(MPCModelPlaybackContext *)self->_playbackContext queueDescriptor];
  -[MPCModelGenericAVItem setPrioritizeStartupOverQuality:](v13, "setPrioritizeStartupOverQuality:", [v20 prioritizeStartupOverQuality]);

  if (objc_opt_respondsToSelector())
  {
    v21 = [(MPCModelPlaybackRequest *)self->_request mediaLibrary];
    [(MPCModelGenericAVItem *)v13 setMediaLibrary:v21];
  }
  if (v13)
  {
    [(MPCSonicAVItem *)v13 setFeeder:self];
    [(MPCSonicAVItem *)v13 setQueueIdentifier:v6];
    v22 = [(MPCSonicQueueFeeder *)self modelPlayEventForItem:v6 inSection:v7];
    [(MPCSonicAVItem *)v13 setModelPlayEvent:v22];

    v23 = [(MPCSonicQueueFeeder *)self playbackInfoForItem:v13];
    [(MPCSonicAVItem *)v13 setPlaybackInfo:v23];

    v11 = [(MPCModelPlaybackContext *)self->_playbackContext associatedParticipantIdentifier];
    [(MPCSonicAVItem *)v13 setAssociatedParticipantIdentifier:v11];
LABEL_12:
  }

  return v13;
}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = [(MPCSonicQueueFeeder *)self swift];
  id v7 = [v6 identifiersForContentID:v5];

  return v7;
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
  v140[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v118 = a4;
  objc_storeStrong((id *)&self->_playbackContext, a3);
  uint64_t v9 = [v8 fallbackSectionRepresentation];
  id v10 = (MPModelGenericObject *)[v9 copy];
  fallbackSectionRepresentation = self->_fallbackSectionRepresentation;
  self->_fallbackSectionRepresentation = v10;

  int v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v136 = (uint64_t (*)(uint64_t, uint64_t))v8;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] loadPlaybackContext: | [] playbackContext=%{public}@", buf, 0x20u);
  }
  __int16 v14 = [v8 playActivityRecommendationData];
  [(MPCSonicQueueFeeder *)self setPlayActivityRecommendationData:v14];

  v15 = [v8 playActivityQueueGroupingID];
  [(MPCSonicQueueFeeder *)self setPlayActivityQueueGroupingID:v15];

  __int16 v16 = [v8 playActivityFeatureName];
  [(MPCSonicQueueFeeder *)self setPlayActivityFeatureName:v16];

  id v17 = [v8 siriReferenceIdentifier];
  [(MPCSonicQueueFeeder *)self setSiriReferenceIdentifier:v17];

  uint64_t v18 = [v8 siriWHAMetricsInfo];
  [(MPCSonicQueueFeeder *)self setSiriWHAMetricsInfo:v18];

  v19 = [v8 startItemIdentifiers];
  startItemIdentifiers = self->_startItemIdentifiers;
  self->_startItemIdentifiers = v19;

  v21 = [v8 startTimeModifications];
  startTimeModifications = self->_startTimeModifications;
  self->_startTimeModifications = v21;

  v23 = [v8 endTimeModifications];
  endTimeModifications = self->_endTimeModifications;
  self->_endTimeModifications = v23;

  id v25 = [v8 siriReferenceIdentifier];
  self->_isSiriInitiated = v25 != 0;

  uint64_t v26 = [v8 siriAssetInfo];
  v119 = (uint64_t (*)(uint64_t, uint64_t))[v26 copy];

  if ([v119 length])
  {
    uint64_t v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v136 = v119;
      _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] loadPlaybackContext: | processing siriAssetInfo [] siriAssetInfo=%{public}@", buf, 0x20u);
    }
  }
  v29 = [v8 request];
  __int16 v30 = (MPCModelPlaybackRequest *)[v29 copy];
  request = self->_request;
  self->_request = v30;

  if (([(MPCModelPlaybackRequest *)self->_request conformsToProtocol:&unk_26CC36B50] & 1) == 0)
  {
    v113 = [MEMORY[0x263F08690] currentHandler];
    [v113 handleFailureInMethod:a2, self, @"MPCSonicQueueFeeder.m", 355, @"Request class (%@) must conform to MPCModelPlaybackRequest", objc_opt_class() object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v32 = self->_request;
    [(MPCModelPlaybackRequest *)v32 setUseUniversalAccumulator:1];
    if (_os_feature_enabled_impl()) {
      [(MPCModelPlaybackRequest *)v32 setAllowLocalEquivalencies:1];
    }
    if (self->_isSiriInitiated && ![v119 length])
    {
      BOOL v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] loadPlaybackContext: | generating ABC [missing siriAssetInfo for siri initiated storePlayback]", buf, 0x16u);
      }
      BOOL v35 = (void *)MEMORY[0x263F54EC8];
      v138[0] = @"siriReferenceIdentifier";
      uint64_t v36 = [v8 siriReferenceIdentifier];
      id v37 = (void *)v36;
      if (v36) {
        v38 = (__CFString *)v36;
      }
      else {
        v38 = @"<missing>";
      }
      v138[1] = @"storeItemsRequest.identifiers";
      v139[0] = v38;
      uint64_t v39 = [(MPCModelPlaybackRequest *)v32 identifiers];
      id v40 = (void *)v39;
      v41 = @"nil";
      if (v39) {
        v41 = (__CFString *)v39;
      }
      v139[1] = v41;
      uint64_t v42 = [NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:2];
      v140[0] = v42;
      uint64_t v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:1];
      [v35 snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"MissingSiriAssetInfo" context:@"SetPlaybackQueue" triggerThresholdValues:&stru_26CBCA930 events:v43 completion:0];
    }
  }
  v44 = [(MPCModelPlaybackRequest *)self->_request itemKind];
  v45 = (void *)[v44 modelClass];

  v117 = objc_msgSend(v45, "mqf_requiredItemPlaybackProperties");
  if (v117)
  {
    -[MPCModelPlaybackRequest setItemProperties:](self->_request, "setItemProperties:");
    v46 = [(MPCModelPlaybackRequest *)self->_request sectionKind];
    v47 = (void *)[v46 modelClass];

    v116 = objc_msgSend(v47, "mqf_requiredSectionPlaybackProperties");
    [(MPCModelPlaybackRequest *)self->_request setSectionProperties:v116];
    if (objc_opt_respondsToSelector()) {
      [(MPCModelPlaybackRequest *)self->_request setDisableImplicitSectioning:1];
    }
    if (objc_opt_respondsToSelector()) {
      [(MPCModelPlaybackRequest *)self->_request setShouldBatchResultsWithPlaceholderObjects:1];
    }
    if ([(MPCModelPlaybackRequest *)self->_request conformsToProtocol:&unk_26CC36BB0])
    {
      v48 = self->_request;
      BOOL v49 = [(MPCModelPlaybackRequest *)v48 rtcReportingPlayQueueSourceIdentifier];
      rtcReportingPlayQueueSourceIdentifier = self->_rtcReportingPlayQueueSourceIdentifier;
      self->_rtcReportingPlayQueueSourceIdentifier = v49;
    }
    BOOL v51 = [v8 playbackRequestEnvironment];
    playbackRequestEnvironment = self->_playbackRequestEnvironment;
    self->_playbackRequestEnvironment = v51;

    if ([(MPCModelPlaybackRequest *)self->_request conformsToProtocol:&unk_26CC28748])
    {
      id v53 = self->_request;
      v54 = [(MPCModelPlaybackRequest *)v53 playbackRequestEnvironment];
      BOOL v55 = v54 == self->_playbackRequestEnvironment;

      if (!v55)
      {
        v56 = [(MPCModelPlaybackRequest *)v53 playbackRequestEnvironment];
        v57 = [v56 userIdentity];
        v58 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
        id v59 = [MEMORY[0x263F893C8] defaultIdentityStore];
        char v60 = [v57 isEqualToIdentity:v58 inStore:v59];

        if ((v60 & 1) == 0)
        {
          v61 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            v62 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
            v63 = [(MPCModelPlaybackRequest *)v53 playbackRequestEnvironment];
            v64 = self->_playbackRequestEnvironment;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v62;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2114;
            v136 = v63;
            LOWORD(v137) = 2114;
            *(void *)((char *)&v137 + 2) = v64;
            _os_log_impl(&dword_21BB87000, v61, OS_LOG_TYPE_FAULT, "[SQF:%{public}@:%p] loadPlaybackContext: | recovering user identity mismatch [self correcting] request.playbackRequestEnvironment=%{public}@ context.playbackRequestEnvironment=%{public}@", buf, 0x2Au);
          }
        }
        [(MPCModelPlaybackRequest *)v53 setPlaybackRequestEnvironment:self->_playbackRequestEnvironment];
      }
    }
    p_request = &self->_request;
    uint64_t v66 = [(MPCModelPlaybackRequest *)self->_request label];
    v67 = (void *)v66;
    if (v66) {
      v68 = (__CFString *)v66;
    }
    else {
      v68 = @"<missing request label>";
    }
    v69 = [@"com.apple.MediaPlayer.MPCSonicQueueFeeder: " stringByAppendingString:v68];
    [(MPCModelPlaybackRequest *)*p_request setLabel:v69];

    id v70 = objc_alloc_init(MEMORY[0x263F12008]);
    [(MPRequestResponseController *)self->_requestController setRequest:v70];

    v71 = [(MPRequestResponseController *)self->_requestController request];
    [v71 setTimeoutInterval:0.0];

    uint64_t v72 = [(MPRequestResponseController *)self->_requestController request];
    [v72 setQualityOfService:25];

    v73 = [(MPCModelPlaybackRequest *)*p_request label];
    v74 = [(MPRequestResponseController *)self->_requestController request];
    [v74 setLabel:v73];

    v75 = *p_request;
    v76 = [(MPRequestResponseController *)self->_requestController request];
    [v76 setModelRequest:v75];

    id v77 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment _createStoreRequestContext];
    id v123 = 0;
    id v78 = [[MPCModelGenericAVItemUserIdentityPropertySet alloc] initWithRequestContext:v77 error:&v123];
    uint64_t v79 = (uint64_t)v123;
    identityPropertySet = self->_identityPropertySet;
    self->_identityPropertySet = v78;

    if (!((uint64_t)self->_identityPropertySet | v79))
    {
      uint64_t v79 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 67, @"Missing error when identity properties failed to load");
    }
    if (v79)
    {
      long long v81 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        long long v82 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
        objc_msgSend((id)v79, "msv_description");
        long long v83 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v82;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        v136 = v83;
        _os_log_impl(&dword_21BB87000, v81, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] loadPlaybackContext: | failed to load identity properties [] error=%{public}@", buf, 0x20u);
      }
      (*((void (**)(id, void, void, uint64_t))v118 + 2))(v118, 0, 0, v79);
      goto LABEL_69;
    }
    [(MPRequestResponseController *)self->_requestController setNeedsReload];
    long long v84 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    os_signpost_id_t v85 = os_signpost_id_make_with_pointer(v84, self);

    id v86 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    id v87 = v86;
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v87, OS_SIGNPOST_INTERVAL_BEGIN, v85, "ModelShimRequest", "", buf, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_68:
      [(MPRequestResponseController *)self->_requestController beginAutomaticResponseLoading];
      long long v99 = [(MPCSonicQueueFeeder *)self swift];
      v120[0] = MEMORY[0x263EF8330];
      v120[1] = 3221225472;
      v120[2] = __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke_149;
      v120[3] = &unk_2643C0028;
      id v121 = v118;
      [v99 loadWithContext:v8 completion:v120];

LABEL_69:
      goto LABEL_70;
    }
    BOOL v88 = self->_request;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v136 = __Block_byref_object_copy_;
    *(void *)&long long v137 = __Block_byref_object_dispose_;
    *((void *)&v137 + 1) = 0;
    v115 = v88;
    BOOL v89 = [(MPCModelPlaybackRequest *)v88 identifiers];
    uint64_t v90 = [(__CFString *)v89 totalItemCount];
    long long v91 = [(MPCModelPlaybackRequest *)v115 sectionedModelObjects];
    if (v91 && v90 >= 1 && !self->_startItemIdentifiers)
    {
      BOOL v92 = [v8 shuffleType] == 0;

      if (v92)
      {
LABEL_60:
        uint64_t v96 = *(void *)&buf[8];
        if (self->_startItemIdentifiers && !*(void *)(*(void *)&buf[8] + 40))
        {
          v122[0] = MEMORY[0x263EF8330];
          v122[1] = 3221225472;
          v122[2] = __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke;
          v122[3] = &unk_2643C1888;
          v122[4] = self;
          v122[5] = buf;
          [(__CFString *)v89 enumerateItemIdentifiersUsingBlock:v122];
          uint64_t v96 = *(void *)&buf[8];
        }
        if (*(void *)(v96 + 40))
        {
          uint64_t v97 = -[__CFString globalIndexForIndexPath:](v89, "globalIndexForIndexPath:");
          BOOL v98 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
          [v98 addObject:*(void *)(*(void *)&buf[8] + 40)];
          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            if (v97 <= 1) {
              uint64_t v110 = 1;
            }
            else {
              uint64_t v110 = v97;
            }
            for (uint64_t i = v110 - 1; (unint64_t)[v98 count] <= 2 && i < v90; ++i)
            {
              if (v97 != i)
              {
                v112 = [(__CFString *)v89 indexPathForGlobalIndex:i];
                if (v112) {
                  [v98 addObject:v112];
                }
              }
            }
          }
          [(MPCModelPlaybackRequest *)v115 setPlaybackPrioritizedIndexPaths:v98];
        }
        else
        {
          if (!v119 || !self->_startItemIdentifiers) {
            goto LABEL_67;
          }
          long long v100 = _MPCLogCategoryPlayback_Oversize();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            long long v101 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
            long long v102 = self->_startItemIdentifiers;
            *(_DWORD *)v127 = 138544130;
            v128 = v101;
            __int16 v129 = 2048;
            v130 = self;
            __int16 v131 = 2114;
            v132 = v102;
            __int16 v133 = 2114;
            v134 = v89;
            _os_log_impl(&dword_21BB87000, v100, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] loadPlaybackContext: | clearing startItemIdentifiers [SiriAssetInfo contains item not in the request] startItemIdentifiers=%{public}@ storeItemsRequest.identifiers=%{public}@", v127, 0x2Au);
          }
          v103 = (void *)MEMORY[0x263F54EC8];
          v125[0] = self->_startItemIdentifiers;
          v124[0] = @"startItemIdentifiers";
          v124[1] = @"storeItemsRequest.sectionedModelObjects";
          uint64_t v104 = [(MPCModelPlaybackRequest *)v115 sectionedModelObjects];
          v105 = (void *)v104;
          uint64_t v106 = @"nil";
          if (v104) {
            v107 = (__CFString *)v104;
          }
          else {
            v107 = @"nil";
          }
          v124[2] = @"identifiers";
          if (v89) {
            uint64_t v106 = v89;
          }
          v125[1] = v107;
          v125[2] = v106;
          v108 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:3];
          v126 = v108;
          v109 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
          [v103 snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"SiriAssetInfoBug" context:@"StartItemNotInRequest" triggerThresholdValues:&stru_26CBCA930 events:v109 completion:0];

          BOOL v98 = self->_startItemIdentifiers;
          self->_startItemIdentifiers = 0;
        }

LABEL_67:
        _Block_object_dispose(buf, 8);

        goto LABEL_68;
      }
      uint64_t v93 = [(__CFString *)v89 indexPathForGlobalIndex:arc4random_uniform(v90)];
      v94 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v93;

      id v95 = [(__CFString *)v89 identifiersForItemAtIndexPath:*(void *)(*(void *)&buf[8] + 40)];
      long long v91 = self->_startItemIdentifiers;
      self->_startItemIdentifiers = v95;
    }

    goto LABEL_60;
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    v114 = [MEMORY[0x263F08690] currentHandler];
    [v114 handleFailureInMethod:a2, self, @"MPCSonicQueueFeeder.m", 376, @"Invalid request item class: %@ for %@", v45, self->_request object file lineNumber description];
  }
  v116 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Invalid request item class: %@ for %@", v45, self->_request);
  (*((void (**)(id, void, void, void *))v118 + 2))(v118, 0, 0, v116);
LABEL_70:
}

void __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 intersectsSet:*(void *)(*(void *)(a1 + 32) + 128)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke_149(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)firstItemIntersectingIdentifierSet:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(MPMutableIdentifierListSection *)self->_section itemIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(MPCSonicQueueFeeder *)self swift];
        int v12 = [v11 identifiersForContentID:v10];

        if ([v4 intersectsSet:v12])
        {
          id v13 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet delegatedIdentityProperties];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 DSID];
  }
  else
  {
    uint64_t v8 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet identityProperties];
    uint64_t v7 = [v8 DSID];
  }
  if (v7)
  {
    uint64_t quot = [v7 longLongValue];
    uint64_t v10 = quot;
    v11 = (char *)&v17 + 1;
    do
    {
      lldiv_t v12 = lldiv(quot, 10);
      uint64_t quot = v12.quot;
      if (v12.rem >= 0) {
        LOBYTE(v13) = v12.rem;
      }
      else {
        uint64_t v13 = -v12.rem;
      }
      *(v11 - 2) = v13 + 48;
      __int16 v14 = (const UInt8 *)(v11 - 2);
      --v11;
    }
    while (v12.quot);
    if (v10 < 0)
    {
      *(v11 - 2) = 45;
      __int16 v14 = (const UInt8 *)(v11 - 2);
    }
    long long v15 = (__CFString *)CFStringCreateWithBytes(0, v14, (char *)&v17 - (char *)v14, 0x8000100u, 0);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(MPCSonicQueueFeeder *)self swift];
  char v7 = [v6 supportsAutoPlayForContentID:v5];

  return v7;
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  return 1;
}

- (BOOL)containsLiveStream
{
  return 0;
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  return 1;
}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return self->_rtcReportingPlayQueueSourceIdentifier;
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"MPCSonicQueueFeeder.m" lineNumber:282 description:@"DO NOT USE FOR representativeMetadata"];
}

- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  __int16 v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  responseContentIDs = self->_responseContentIDs;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __55__MPCSonicQueueFeeder_modelPlayEventForItem_inSection___block_invoke;
  v22[3] = &unk_2643BE2F8;
  id v9 = v6;
  id v24 = self;
  id v25 = &v26;
  id v23 = v9;
  [(MSVSectionedCollection *)responseContentIDs enumerateItemsUsingBlock:v22];
  uint64_t v10 = self->_fallbackSectionRepresentation;
  if ([(id)v27[5] length])
  {
    v11 = [(MPCSonicQueueFeeder *)self swift];
    uint64_t v12 = v27[5];
    id v21 = 0;
    uint64_t v13 = [v11 genericModelObjectForContentID:v12 error:&v21];
    id v14 = v21;

    if (v14)
    {
      long long v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        long long v16 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
        *(_DWORD *)buf = 138543874;
        BOOL v33 = v16;
        __int16 v34 = 2048;
        BOOL v35 = self;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] modelPlayEventForItem:inSection | failed to get firstSectionModelObject [] error=%{public}@", buf, 0x20u);
      }
    }

    uint64_t v10 = (MPModelGenericObject *)v13;
  }
  uint64_t v17 = (void *)MEMORY[0x263F11F88];
  long long v18 = [(MPCSonicQueueFeeder *)self playActivityFeatureName];
  v19 = [v17 playEventWithModelObject:v10 featureName:v18];

  _Block_object_dispose(&v26, 8);

  return v19;
}

void __55__MPCSonicQueueFeeder_modelPlayEventForItem_inSection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  if (v8 == v17)
  {
  }
  else
  {
    int v9 = [v17 isEqual:v8];

    if (!v9) {
      goto LABEL_12;
    }
  }
  uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 176);
  uint64_t v11 = [v7 section];
  id v12 = v10;
  if ([v12 numberOfSections] <= v11)
  {
    id v14 = 0;
  }
  else
  {
    uint64_t v13 = [v12 sectionAtIndex:v11];
    if (_NSIsNSString()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  *a4 = 1;
LABEL_12:
}

- (id)firstModelPlayEvent
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = self->_fallbackSectionRepresentation;
  id v4 = self->_responseContentIDs;
  if ([(MSVSectionedCollection *)v4 numberOfSections] < 1)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(MSVSectionedCollection *)v4 sectionAtIndex:0];
    id v6 = 0;
    if (_NSIsNSString()) {
      id v6 = v5;
    }
  }
  if ([v6 length])
  {
    id v7 = [(MPCSonicQueueFeeder *)self swift];
    id v16 = 0;
    uint64_t v8 = [v7 genericModelObjectForContentID:v6 error:&v16];
    id v9 = v16;

    if (v9)
    {
      uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
        *(_DWORD *)buf = 138543874;
        long long v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = self;
        __int16 v21 = 2114;
        id v22 = v9;
        _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] firstModelPlayEvent: | failed to get firstSectionModelObject [] error=%{public}@", buf, 0x20u);
      }
    }

    id v3 = (MPModelGenericObject *)v8;
  }
  id v12 = (void *)MEMORY[0x263F11F88];
  uint64_t v13 = [(MPCSonicQueueFeeder *)self playActivityFeatureName];
  id v14 = [v12 playEventWithModelObject:v3 featureName:v13];

  return v14;
}

- (id)uniqueIdentifier
{
  return (id)[(MPMutableIdentifierListSection *)self->_section sectionIdentifier];
}

- (id)updatedPlaybackContext
{
  return self->_playbackContext;
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([(MPCSonicQueueFeeder *)self supplementalPlaybackContextBehavior] != 1
    || ([(MPMutableIdentifierListSection *)self->_section itemIdentifiers],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
  if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2)
    {
      if (a3 != 3)
      {
LABEL_11:
        uint64_t v10 = objc_alloc_init(MPCModelPlaybackContext);
        [(MPCModelStorePlaybackItemsRequest *)v8 setClientIdentifier:@"com.apple.Music"];
        [(MPCModelPlaybackContext *)v10 setRequest:v8];
        [(MPCModelPlaybackContext *)v10 setPlaybackRequestEnvironment:self->_playbackRequestEnvironment];
        uint64_t v13 = [(MPCSonicQueueFeeder *)self playActivityQueueGroupingID];
        [(MPCModelPlaybackContext *)v10 setPlayActivityQueueGroupingID:v13];

        id v14 = [(MPCSonicQueueFeeder *)self playActivityFeatureName];
        [(MPCModelPlaybackContext *)v10 setPlayActivityFeatureName:v14];

        uint64_t v15 = [(MPCSonicQueueFeeder *)self playActivityRecommendationData];
        [(MPCModelPlaybackContext *)v10 setPlayActivityRecommendationData:v15];

        id v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
          int v19 = 138544130;
          uint64_t v20 = v17;
          __int16 v21 = 2048;
          id v22 = self;
          __int16 v23 = 2048;
          int64_t v24 = a3;
          __int16 v25 = 2114;
          uint64_t v26 = v10;
          _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] supplementalPlaybackContextWithReason:%ld | created supplemental [] supplementalContext=%{public}@", (uint8_t *)&v19, 0x2Au);
        }
        goto LABEL_15;
      }
      id v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"MPCSonicQueueFeeder.m" lineNumber:199 description:@"Not implemented (yet)"];
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    id v9 = [(MPCSonicQueueFeeder *)self _sectionedModelObjectsRepresentationForSectionedContentIDs:self->_responseContentIDs];
    [(MPCModelStorePlaybackItemsRequest *)v8 setSectionedModelObjects:v9];
    goto LABEL_10;
  }
  uint64_t v11 = [MEMORY[0x263F12178] standardUserDefaults];
  int v12 = [v11 forceLibrarySupplementalContexts];

  if (v12) {
    goto LABEL_9;
  }
  uint64_t v10 = 0;
LABEL_15:

LABEL_16:

  return v10;
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)playbackInfoForItem:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [v4 modelGenericObject];
  uint64_t v7 = [v6 identifiers];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  uint64_t v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  startTimeModifications = self->_startTimeModifications;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke;
  v25[3] = &unk_2643BE2D0;
  id v9 = v7;
  id v26 = v9;
  uint64_t v27 = &v28;
  [(NSDictionary *)startTimeModifications enumerateKeysAndObjectsUsingBlock:v25];
  if (v29[5])
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
      int v12 = (uint64_t (*)(uint64_t, uint64_t))v29[5];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v43 = v12;
      LOWORD(v44) = 2114;
      *(void *)((char *)&v44 + 2) = v4;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] playbackInfoForItem | setting override start time [] startTime=%{public}@ item=%{public}@", buf, 0x2Au);
    }
    [v5 setObject:v29[5] forKey:*MEMORY[0x263F11130]];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy_;
  *(void *)&long long v44 = __Block_byref_object_dispose_;
  *((void *)&v44 + 1) = 0;
  endTimeModifications = self->_endTimeModifications;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  __int16 v21 = __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke_5;
  id v22 = &unk_2643BE2D0;
  id v14 = v9;
  id v23 = v14;
  int64_t v24 = buf;
  [(NSDictionary *)endTimeModifications enumerateKeysAndObjectsUsingBlock:&v19];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(MPCSonicQueueFeeder *)self uniqueIdentifier];
      uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)__int16 v34 = 138544130;
      BOOL v35 = v16;
      __int16 v36 = 2048;
      id v37 = self;
      __int16 v38 = 2114;
      uint64_t v39 = v17;
      __int16 v40 = 2114;
      id v41 = v4;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] playbackInfoForItem | setting override stop time [] stopTime=%{public}@ item=%{public}@", v34, 0x2Au);
    }
    [v5 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:*MEMORY[0x263F11118]];
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v28, 8);

  return v5;
}

void __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 intersectsSet:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke_5(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 intersectsSet:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)applyVolumeNormalizationForItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 modelPlayEvent];
  if ([v4 itemType] == 1)
  {
    id v5 = [v3 modelGenericObject];
    if ([v5 type] == 1)
    {
      id v6 = [v5 song];
      uint64_t v7 = [v6 album];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v7 hasLoadedValueForKey:*MEMORY[0x263F114D8]])
  {
    [v7 volumeNormalization];
    float v9 = v8;
  }
  else
  {
    float v9 = NAN;
  }
  uint64_t v10 = [MEMORY[0x263F12178] standardUserDefaults];
  int v11 = [v10 soundCheckEnabled];

  int v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Preferences");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v11;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "MPCSonicQueueFeeder applyVolumeNormalizationForItem: soundCheckEnabled=%{BOOL}u", (uint8_t *)v15, 8u);
  }

  double v13 = 0.0;
  if (v11) {
    *(float *)&double v13 = v9;
  }
  [v3 setSoundCheckVolumeNormalization:v13];
  *(float *)&double v14 = v9;
  [v3 setLoudnessInfoVolumeNormalization:v14];
}

- (MPCSonicQueueFeeder)init
{
  v11.receiver = self;
  v11.super_class = (Class)MPCSonicQueueFeeder;
  v2 = [(MPCSonicQueueFeeder *)&v11 init];
  if (v2)
  {
    id v3 = [[MPCSonicQueueFeeder_Swift alloc] initWithQueueFeeder:v2];
    swift = v2->_swift;
    v2->_swift = v3;

    if (!v2->_playbackRequestEnvironment)
    {
      uint64_t v5 = +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment];
      playbackRequestEnvironment = v2->_playbackRequestEnvironment;
      v2->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v5;
    }
    uint64_t v7 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x263F121E0]);
    requestController = v2->_requestController;
    v2->_requestController = v7;

    float v9 = [(MPCSonicQueueFeeder *)v2 swift];
    [(MPRequestResponseController *)v2->_requestController setDelegate:v9];
  }
  return v2;
}

+ (BOOL)usesIdentifierRegistry
{
  return 0;
}

@end