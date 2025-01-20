@interface MPCModelStorePlaybackItemsRequestAccumulator
- (BOOL)_isFatalError:(id)a3;
- (ICURLAggregatedPerformanceMetrics)performanceMetrics;
- (MPCModelStorePlaybackItemsRequestAccumulator)initWithRequest:(id)a3;
- (MPCModelStorePlaybackItemsRequestAccumulator)initWithRequest:(id)a3 serverObjectDatabase:(id)a4;
- (MPCModelStorePlaybackItemsRequestAccumulatorResult)accumulatorResult;
- (MPCModelStorePlaybackItemsRequestAccumulatorResult)handleResponse:(id)a3 error:(id)a4;
- (MPSectionedCollection)unpersonalizedContentDescriptors;
- (NSDictionary)abc_stateDump;
- (NSDictionary)equivalencyMapping;
- (NSError)accumulationError;
- (_MPCModelStorePlaybackItemEligibility)_eligibilityForItem:(id)a3;
- (id)_mergedObjectWithRequestedObjectIfNeeded:(id)a3 forIndexPath:(id)a4;
- (id)_playlistEntryForObject:(id)a3 containerUniqueID:(id)a4;
- (id)_serverObjectFromPlaceholderContentDescriptor:(id)a3 propertySet:(id)a4 error:(id *)a5;
- (id)_userIdentityWithRequest:(id)a3;
- (id)newStoreItemMetadataRequest;
- (void)_addEquivalencyForMetadata:(id)a3 requestStoreIdentifier:(id)a4;
- (void)_finalizeABCStateDump;
- (void)_resolveContentDescriptorsUsingServerObjectDatabase;
@end

@implementation MPCModelStorePlaybackItemsRequestAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulationError, 0);
  objc_storeStrong((id *)&self->_mutableABCStateDump, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_progressiveContentDescriptors, 0);
  objc_storeStrong((id *)&self->_pendingCollectionItemAuthorizationTokenRequests, 0);
  objc_storeStrong((id *)&self->_pendingCollectionItemTokenRenewalRequests, 0);
  objc_storeStrong((id *)&self->_pendingCollectionItemMetadataRequests, 0);
  objc_storeStrong((id *)&self->_pendingCollectionMetadataRequests, 0);
  objc_storeStrong((id *)&self->_storeIDToCollectionMetadataRequestMap, 0);
  objc_storeStrong((id *)&self->_sectionIndexToTokenRenewalRequestMap, 0);
  objc_storeStrong((id *)&self->_sectionIndexToCollectionItemAuthTokenRequestMap, 0);
  objc_storeStrong((id *)&self->_sectionIndexToCollectionItemMetadataRequestMap, 0);
  objc_storeStrong((id *)&self->_pendingStoreIDs, 0);
  objc_storeStrong((id *)&self->_equivalencyMapping, 0);
  objc_storeStrong((id *)&self->_importResults, 0);
  objc_storeStrong((id *)&self->_requestPropertySet, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_sod, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (NSError)accumulationError
{
  return self->_accumulationError;
}

- (NSDictionary)equivalencyMapping
{
  return &self->_equivalencyMapping->super;
}

- (BOOL)_isFatalError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F08570]);
    uint64_t v6 = [v5 code];

    v7 = objc_msgSend(v4, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F88F00]);
    uint64_t v8 = [v7 code];

    if (v8 == -7100 || v8 == -7003 || v8 == -7007) {
      LOBYTE(v11) = 0;
    }
    else {
      unsigned int v11 = ((unint64_t)(v6 + 1009) > 0xA) | (0x2FEu >> (v6 - 15));
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11 & 1;
}

- (id)_userIdentityWithRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 playbackRequestEnvironment];
  v5 = [v4 delegationProperties];
  uint64_t v6 = [v5 storeAccountID];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263F893C0];
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:v6];
    v9 = [v7 specificAccountWithDSID:v8];
    v10 = [v9 identityAllowingDelegation:1];
  }
  else
  {
    uint64_t v8 = [v3 playbackRequestEnvironment];
    v10 = [v8 userIdentity];
  }

  return v10;
}

- (id)_mergedObjectWithRequestedObjectIfNeeded:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && self->_requestUsesSectionedModelObjects)
  {
    uint64_t v9 = [v7 length];
    v10 = [(MPCModelStorePlaybackItemsRequest *)self->_request sectionedModelObjects];
    unsigned int v11 = v10;
    if (v9 == 1) {
      objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v8, "indexAtPosition:", 0));
    }
    else {
    v13 = [v10 itemAtIndexPath:v8];
    }

    v14 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v13];
    if ([v14 type] == 5)
    {
      v15 = [v14 playlistEntry];
      v16 = [v15 anyObject];

      if (!v16)
      {
        v17 = [v6 anyObject];
        v18 = (objc_class *)objc_opt_class();
        if (!v18) {
          v18 = (objc_class *)objc_opt_class();
        }

        id v19 = [v18 alloc];
        v20 = [v14 identifiers];
        v16 = (void *)[v19 initWithIdentifiers:v20];
      }
      uint64_t v21 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v16];

      v14 = (void *)v21;
    }
    v22 = [v14 mergeWithObject:v6];

    id v12 = v22;
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

- (id)_serverObjectFromPlaceholderContentDescriptor:(id)a3 propertySet:(id)a4 error:(id *)a5
{
  id v7 = a3;
  if (_NSIsNSString())
  {
    id v8 = v7;
    id v9 = objc_alloc(MEMORY[0x263F11DB0]);
    v10 = [MEMORY[0x263F12030] identityKind];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke;
    v27 = &unk_2643C0B38;
    id v28 = v8;
    v29 = self;
    id v11 = v8;
    id v12 = (void *)[v9 initWithSource:@"Accumulator-SODLookup" modelKind:v10 block:&v24];

    id v13 = 0;
    if (v12) {
      goto LABEL_3;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = 0;
    id v13 = 0;
    goto LABEL_13;
  }
  id v13 = v7;
  uint64_t v21 = [v13 identifiers];
  int v22 = [v21 isPlaceholder];

  if (!v22)
  {
    id v12 = 0;
    goto LABEL_13;
  }
  id v12 = [v13 identifiers];
  if (!v12) {
    goto LABEL_13;
  }
LABEL_3:
  v14 = -[MPServerObjectDatabase modelObjectMatchingIdentifierSet:propertySet:error:](self->_sod, "modelObjectMatchingIdentifierSet:propertySet:error:", v12, self->_requestPropertySet, a5, v24, v25, v26, v27);
  if (self->_mutableABCStateDump)
  {
    v15 = [v12 personalizedStore];
    v16 = [v15 personID];

    if (![v16 length])
    {
      id v17 = (id)*MEMORY[0x263F89090];

      v16 = v17;
    }
    v18 = [v12 prioritizedStoreStringIdentifiersForPersonID:v16];
    id v19 = [MEMORY[0x263EFF9A0] dictionary];
    [v19 setObject:@"object-resolution" forKeyedSubscript:@"reason"];
    [v19 setObject:v16 forKeyedSubscript:@"personID"];
    [v19 setObject:v18 forKeyedSubscript:@"identifiers"];
    v20 = [(NSMutableDictionary *)self->_mutableABCStateDump objectForKeyedSubscript:@"SOD-Lookups"];
    [v20 addObject:v19];
  }
LABEL_14:

  return v14;
}

void __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke(uint64_t a1, void *a2)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_2;
  v10[3] = &unk_2643C4988;
  id v11 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 setUniversalStoreIdentifiersWithBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_3;
  v8[3] = &unk_2643C49B0;
  id v9 = *(id *)(a1 + 32);
  [v4 setRadioIdentifiersWithBlock:v8];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_4;
  v6[3] = &unk_2643C4960;
  id v7 = *(id *)(a1 + 32);
  [v4 setPersonalStoreIdentifiersWithPersonID:v5 block:v6];
}

void __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v3, "longLongValue"));
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(v4, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  [v4 setGlobalPlaylistID:*(void *)(a1 + 32)];
  [v4 setUniversalCloudLibraryID:*(void *)(a1 + 32)];
}

uint64_t __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setStationStringID:*(void *)(a1 + 32)];
}

void __112__MPCModelStorePlaybackItemsRequestAccumulator__serverObjectFromPlaceholderContentDescriptor_propertySet_error___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "longLongValue"));
}

- (void)_resolveContentDescriptorsUsingServerObjectDatabase
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (!self->_accumulationError)
  {
    id v4 = [MEMORY[0x263F089C8] indexSet];
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263EFF9B0] orderedSet];
    pendingStoreIDs = self->_pendingStoreIDs;
    self->_pendingStoreIDs = v6;

    id v8 = [MEMORY[0x263EFF980] array];
    pendingCollectionItemMetadataRequests = self->_pendingCollectionItemMetadataRequests;
    self->_pendingCollectionItemMetadataRequests = v8;

    v10 = [MEMORY[0x263EFF980] array];
    pendingCollectionItemTokenRenewalRequests = self->_pendingCollectionItemTokenRenewalRequests;
    self->_pendingCollectionItemTokenRenewalRequests = v10;

    id v12 = [MEMORY[0x263EFF980] array];
    pendingCollectionItemAuthorizationTokenRequests = self->_pendingCollectionItemAuthorizationTokenRequests;
    self->_pendingCollectionItemAuthorizationTokenRequests = v12;

    v14 = [MEMORY[0x263EFF980] array];
    pendingCollectionMetadataRequests = self->_pendingCollectionMetadataRequests;
    self->_pendingCollectionMetadataRequests = v14;

    v16 = [MEMORY[0x263EFF9A0] dictionary];
    sectionIndexToTokenRenewalRequestMap = self->_sectionIndexToTokenRenewalRequestMap;
    self->_sectionIndexToTokenRenewalRequestMap = v16;

    v18 = [MEMORY[0x263EFF9A0] dictionary];
    sectionIndexToCollectionItemMetadataRequestMap = self->_sectionIndexToCollectionItemMetadataRequestMap;
    self->_sectionIndexToCollectionItemMetadataRequestMap = v18;

    v20 = [MEMORY[0x263EFF9A0] dictionary];
    sectionIndexToCollectionItemAuthTokenRequestMap = self->_sectionIndexToCollectionItemAuthTokenRequestMap;
    self->_sectionIndexToCollectionItemAuthTokenRequestMap = v20;

    int v22 = [MEMORY[0x263EFF9A0] dictionary];
    storeIDToCollectionMetadataRequestMap = self->_storeIDToCollectionMetadataRequestMap;
    self->_storeIDToCollectionMetadataRequestMap = v22;

    progressiveContentDescriptors = self->_progressiveContentDescriptors;
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke;
    v66[3] = &unk_2643BF0D0;
    v66[4] = self;
    id v25 = v4;
    id v67 = v25;
    [(MPMutableSectionedCollection *)progressiveContentDescriptors replaceSectionsUsingBlock:v66];
    if (!self->_accumulationError)
    {
      v26 = self->_progressiveContentDescriptors;
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_108;
      v63[3] = &unk_2643BF0F8;
      v63[4] = self;
      id v27 = v5;
      id v64 = v27;
      SEL v65 = a2;
      [(MPMutableSectionedCollection *)v26 replaceItemsUsingBlock:v63];
      if (!self->_accumulationError)
      {
        SEL v48 = a2;
        v49 = v5;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        obuint64_t j = v27;
        uint64_t v53 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v53)
        {
          uint64_t v28 = 0;
          uint64_t v51 = *(void *)v60;
          id v52 = v25;
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v60 != v51) {
                objc_enumerationMutation(obj);
              }
              v30 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              v31 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v30, "item", v48), objc_msgSend(v30, "section") + v28);
              uint64_t v32 = -[MPMutableSectionedCollection numberOfItemsInSection:](self->_progressiveContentDescriptors, "numberOfItemsInSection:", [v31 section]);
              v33 = [(MPMutableSectionedCollection *)self->_progressiveContentDescriptors itemAtIndexPath:v30];
              uint64_t v34 = [v30 item];
              uint64_t v35 = [v31 section];
              uint64_t v36 = v35;
              v56 = v31;
              uint64_t v57 = v28;
              if (v34)
              {
                uint64_t v36 = v35 + 1;
                [(MPMutableSectionedCollection *)self->_progressiveContentDescriptors insertSection:v33 atIndex:v35 + 1];
                uint64_t v54 = 1;
              }
              else
              {
                -[MPMutableSectionedCollection replaceSectionAtIndex:withObject:](self->_progressiveContentDescriptors, "replaceSectionAtIndex:withObject:", [v31 section], v33);
                uint64_t v54 = 0;
              }
              v55 = v33;
              v37 = [v33 identifiers];
              v38 = [v37 preferredStoreStringIdentifierForPersonID:self->_personID];

              [(NSMutableOrderedSet *)self->_pendingStoreIDs addObject:v38];
              [(MPMutableSectionedCollection *)self->_progressiveContentDescriptors removeItemAtIndexPath:v30];

              uint64_t v39 = v32 + ~[v30 item];
              if (v39 < 1)
              {
                id v25 = v52;
                uint64_t v45 = v54;
              }
              else
              {
                v40 = self->_progressiveContentDescriptors;
                v41 = [MEMORY[0x263F08C38] UUID];
                [(MPMutableSectionedCollection *)v40 insertSection:v41 atIndex:v36 + 1];

                for (uint64_t j = 0; j != v39; ++j)
                {
                  v43 = self->_progressiveContentDescriptors;
                  v44 = [MEMORY[0x263F088C8] indexPathForItem:j inSection:v36 + 1];
                  [(MPMutableSectionedCollection *)v43 moveItemFromIndexPath:v30 toIndexPath:v44];
                }
                uint64_t v45 = v54 + 1;
                id v25 = v52;
              }
              [v25 shiftIndexesStartingAtIndex:v36 by:v45];
              [v25 addIndex:v36];
              uint64_t v28 = v45 + v57;
            }
            uint64_t v53 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
          }
          while (v53);
        }

        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_3;
        v58[3] = &unk_2643BF120;
        v58[4] = self;
        v58[5] = v48;
        [v25 enumerateIndexesUsingBlock:v58];
        v46 = self->_pendingStoreIDs;
        v47 = _MPCSPIRCopyFailedStoreIDs();
        [(NSMutableOrderedSet *)v46 minusSet:v47];

        uint64_t v5 = v49;
      }
    }
  }
}

id __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[5];
  id v24 = 0;
  id v8 = [v6 _serverObjectFromPlaceholderContentDescriptor:v5 propertySet:v7 error:&v24];
  id v9 = v24;
  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 69, v9, @"Found non-playable section: %@", v5);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 192);
    *(void *)(v11 + 192) = v10;

    id v13 = v5;
LABEL_3:

    goto LABEL_4;
  }
  if (v8)
  {
    unint64_t v15 = [v8 type];
    if (v15 > 0xD || ((1 << v15) & 0x2014) == 0)
    {
      id v13 = [MEMORY[0x263F08C38] UUID];
      int v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218498;
        uint64_t v26 = v23;
        __int16 v27 = 2114;
        id v28 = v13;
        __int16 v29 = 2114;
        v30 = v8;
        _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_ERROR, "[PIA] %p using UUID [section object is not a section type] uuid=%{public}@ section=%{public}@", buf, 0x20u);
      }

      goto LABEL_3;
    }
    id v17 = *(void **)(a1 + 32);
    v18 = [MEMORY[0x263F088C8] indexPathWithIndex:a3];
    id v13 = [v17 _mergedObjectWithRequestedObjectIfNeeded:v8 forIndexPath:v18];

    if (![*(id *)(*(void *)(a1 + 32) + 168) numberOfItemsInSection:a3])
    {
      [*(id *)(a1 + 40) addIndex:a3];
      id v19 = *(void **)(*(void *)(a1 + 32) + 88);
      v20 = [v13 identifiers];
      uint64_t v21 = [v20 preferredStoreStringIdentifierForPersonID:*(void *)(*(void *)(a1 + 32) + 32)];
      [v19 addObject:v21];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![*(id *)(*(void *)(a1 + 32) + 168) numberOfItemsInSection:a3]) {
        [*(id *)(a1 + 40) addIndex:a3];
      }
    }
    else if (_NSIsNSString())
    {
      [*(id *)(*(void *)(a1 + 32) + 88) addObject:v5];
    }
    id v13 = v5;
  }
LABEL_4:

  return v13;
}

id __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  v36[6] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[5];
  id v35 = 0;
  id v9 = [v7 _serverObjectFromPlaceholderContentDescriptor:v5 propertySet:v8 error:&v35];
  id v10 = v35;
  if (v10)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 69, v10, @"Found non-playable item: %@", v5);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 192);
    *(void *)(v12 + 192) = v11;

    id v14 = v5;
    unint64_t v15 = v9;
    goto LABEL_17;
  }
  unint64_t v15 = [*(id *)(a1 + 32) _mergedObjectWithRequestedObjectIfNeeded:v9 forIndexPath:v6];

  if (!v15)
  {
    if (_NSIsNSString()) {
      [*(id *)(*(void *)(a1 + 32) + 88) addObject:v5];
    }
    goto LABEL_15;
  }
  unint64_t v16 = [v15 type];
  if (v16 > 9)
  {
LABEL_12:
    dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
    v30 = (void *)MEMORY[0x263F54EC8];
    uint64_t v29 = *MEMORY[0x263F54E80];
    uint64_t v32 = [*(id *)(*(void *)(a1 + 32) + 168) description];
    v36[0] = v32;
    uint64_t v31 = [v6 description];
    v36[1] = v31;
    uint64_t v18 = [v15 description];
    id v19 = (void *)v18;
    v20 = @"null";
    if (v18) {
      v20 = (__CFString *)v18;
    }
    v36[2] = v20;
    id v28 = [v5 description];
    v36[3] = v28;
    uint64_t v21 = [v15 description];
    v36[4] = v21;
    int v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "type"));
    v36[5] = v22;
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:6];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_2;
    v33[3] = &unk_2643C5FC8;
    dispatch_semaphore_t v34 = dsema;
    dsemaa = dsema;
    [v30 snapshotWithDomain:v29 type:@"Bug" subType:@"UnplayableObjectInSOD" context:@"progressiveContentDescriptors" triggerThresholdValues:0 events:v23 completion:v33];

    dispatch_semaphore_wait(dsemaa, 0xFFFFFFFFFFFFFFFFLL);
    id v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"MPCModelStorePlaybackItemsRequestAccumulator.m", 791, @"Found unplayable object in SOD: %@", v15 object file lineNumber description];

LABEL_15:
    id v17 = v5;
    goto LABEL_16;
  }
  if (((1 << v16) & 0x260) == 0)
  {
    if (((1 << v16) & 0x14) != 0)
    {
      [*(id *)(a1 + 40) addObject:v6];
      goto LABEL_11;
    }
    if (v16 == 1) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_11:
  id v17 = v15;
  unint64_t v15 = v17;
LABEL_16:
  id v14 = v17;
LABEL_17:

  return v14;
}

void __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v67[4] = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 168) sectionAtIndex:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SEL v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"MPCModelStorePlaybackItemsRequestAccumulator.m", 849, @"Attempting to populate items for non model object: %@", v4 object file lineNumber description];
  }
  uint64_t v5 = [v4 type];
  id v6 = (id *)MEMORY[0x263F11490];
  if (v5 != 4) {
    id v6 = (id *)MEMORY[0x263F11488];
  }
  id v7 = *v6;
  uint64_t v8 = [v4 identifiers];
  long long v60 = [v8 versionHash];
  v58 = v7;
  id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "relatedIdentifierSetsForParentIdentifierSet:parentVersionHash:childKey:", v8);
  if (*(void *)(*(void *)(a1 + 32) + 184))
  {
    id v10 = [v8 personalizedStore];
    uint64_t v11 = [v10 personID];

    if (![v11 length])
    {
      id v12 = (id)*MEMORY[0x263F89090];

      uint64_t v11 = v12;
    }
    id v13 = [v8 prioritizedStoreStringIdentifiersForPersonID:v11];
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
    [v14 setObject:@"related-identifiers" forKeyedSubscript:@"reason"];
    [v14 setObject:v11 forKeyedSubscript:@"personID"];
    [v14 setObject:v13 forKeyedSubscript:@"identifiers"];
    [v14 setObject:v60 forKeyedSubscript:@"versionHash"];
    unint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:@"SOD-Lookups"];
    [v15 addObject:v14];
  }
  uint64_t v57 = v8;
  if ([v9 count])
  {
    unint64_t v16 = [v4 identifiers];
    id v17 = [v16 preferredStoreStringIdentifierForPersonID:*(void *)(*(void *)(a1 + 32) + 32)];

    [*(id *)(*(void *)(a1 + 32) + 88) removeObject:v17];
  }
  long long v59 = v4;
  if ([v9 count])
  {
    unint64_t v18 = 0;
    unint64_t v19 = 0x263F08000uLL;
    v55 = (void *)*MEMORY[0x263F89090];
    uint64_t v54 = *MEMORY[0x263F54E80];
    long long v61 = v9;
    uint64_t v62 = v2;
    do
    {
      v20 = [*(id *)(v19 + 2248) indexPathForItem:v18 inSection:v2];
      uint64_t v21 = [v9 objectAtIndexedSubscript:v18];
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void **)(v22 + 24);
      uint64_t v24 = *(void *)(v22 + 40);
      id v66 = 0;
      id v25 = [v23 modelObjectMatchingIdentifierSet:v21 propertySet:v24 error:&v66];
      id v26 = v66;
      if (v26)
      {
        uint64_t v27 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 69, v26, @"Found non-playable item: %@", v21);
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v29 = *(void **)(v28 + 192);
        *(void *)(v28 + 192) = v27;
      }
      else
      {
        uint64_t v30 = *(void *)(a1 + 32);
        if (*(void *)(v30 + 184))
        {
          uint64_t v31 = [v21 personalizedStore];
          uint64_t v32 = [v31 personID];

          if (![v32 length])
          {
            id v33 = v55;

            uint64_t v32 = v33;
          }
          dispatch_semaphore_t v34 = [v21 prioritizedStoreStringIdentifiersForPersonID:v32];
          id v35 = [MEMORY[0x263EFF9A0] dictionary];
          [v35 setObject:@"object-resolution" forKeyedSubscript:@"reason"];
          [v35 setObject:v32 forKeyedSubscript:@"personID"];
          [v35 setObject:v34 forKeyedSubscript:@"identifiers"];
          uint64_t v36 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:@"SOD-Lookups"];
          [v36 addObject:v35];

          uint64_t v30 = *(void *)(a1 + 32);
          id v9 = v61;
          uint64_t v2 = v62;
          unint64_t v19 = 0x263F08000;
        }
        uint64_t v29 = [v21 preferredStoreStringIdentifierForPersonID:*(void *)(v30 + 32)];
        if (v25)
        {
          unint64_t v37 = [v25 type];
          if (v37 > 9 || ((1 << v37) & 0x242) == 0)
          {
            uint64_t v39 = *(void **)(*(void *)(a1 + 32) + 24);
            id v65 = 0;
            uint64_t v40 = [v39 payloadDataForIdentifierSet:v21 outError:&v65];
            id v41 = v65;
            id v52 = (void *)v40;
            uint64_t v53 = v41;
            if (v41)
            {
              uint64_t v42 = [NSString stringWithFormat:@"%@", v41];
            }
            else
            {
              uint64_t v42 = [[NSString alloc] initWithData:v40 encoding:4];
            }
            v56 = (void *)v42;
            dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
            v49 = (void *)MEMORY[0x263F54EC8];
            uint64_t v51 = [v9 description];
            v67[0] = v51;
            v50 = [v21 description];
            v67[1] = v50;
            v44 = [v25 description];
            v67[2] = v44;
            v67[3] = v56;
            uint64_t v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:4];
            v63[0] = MEMORY[0x263EF8330];
            v63[1] = 3221225472;
            v63[2] = __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_4;
            v63[3] = &unk_2643C5FC8;
            dispatch_semaphore_t v64 = v43;
            v46 = v43;
            [v49 snapshotWithDomain:v54 type:@"Bug" subType:@"UnplayableObjectInSOD" context:@"childIdentifierSets" triggerThresholdValues:0 events:v45 completion:v63];

            id v9 = v61;
            dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);
            v47 = [MEMORY[0x263F08690] currentHandler];
            [v47 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"MPCModelStorePlaybackItemsRequestAccumulator.m", 924, @"Found unplayable object in SOD: %@", v25 object file lineNumber description];

            uint64_t v2 = v62;
            unint64_t v19 = 0x263F08000;
          }
          else
          {
            [*(id *)(*(void *)(a1 + 32) + 168) insertItem:v25 atIndexPath:v20];
          }
        }
        else
        {
          [*(id *)(*(void *)(a1 + 32) + 168) insertItem:v29 atIndexPath:v20];
          [*(id *)(*(void *)(a1 + 32) + 88) addObject:v29];
        }
      }

      if (v26) {
        break;
      }
      ++v18;
    }
    while (v18 < [v9 count]);
  }
}

intptr_t __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __99__MPCModelStorePlaybackItemsRequestAccumulator__resolveContentDescriptorsUsingServerObjectDatabase__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_playlistEntryForObject:(id)a3 containerUniqueID:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 identifiers];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke;
  v36[3] = &unk_2643C49D8;
  id v10 = v8;
  id v37 = v10;
  uint64_t v11 = (void *)[v9 copyWithSource:@"Accumulator-PlaylistEntry" block:v36];
  id v12 = (void *)[v7 copyWithIdentifiers:v11];

  id v13 = [v12 identifiers];
  if (![v13 isPlaceholder])
  {

    goto LABEL_5;
  }
  uint64_t v14 = [v12 type];

  if (v14)
  {
LABEL_5:
    SEL v29 = a2;
    unint64_t v16 = [v7 identifiers];
    id v17 = [v16 modelKind];

    if (v17)
    {
      unint64_t v18 = (void *)MEMORY[0x263F11FA0];
      v38[0] = v17;
      unint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
      v20 = [v18 kindWithKinds:v19];
    }
    else
    {
      v20 = [MEMORY[0x263F11FA8] identityKind];
    }
    id v21 = objc_alloc(MEMORY[0x263F11DB0]);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_2;
    v34[3] = &unk_2643C49D8;
    id v35 = v10;
    uint64_t v22 = (void *)[v21 initWithSource:@"Accumulator-PlaylistEntry" modelKind:v20 block:v34];
    uint64_t v23 = [v7 identifiers];
    uint64_t v24 = [v23 unionSet:v22];

    id v25 = (void *)MEMORY[0x263F11EE0];
    id v26 = objc_alloc(MEMORY[0x263F11FA0]);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_3;
    v30[3] = &unk_2643BF0A8;
    uint64_t v32 = self;
    SEL v33 = v29;
    id v31 = v7;
    uint64_t v27 = (void *)[v26 initWithIdentifiers:v24 block:v30];
    id v15 = [v25 genericObjectWithModelObject:v27];

    goto LABEL_9;
  }
  id v15 = v12;
LABEL_9:

  return v15;
}

uint64_t __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContainerUniqueID:*(void *)(a1 + 32)];
}

uint64_t __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setContainerUniqueID:*(void *)(a1 + 32)];
}

void __90__MPCModelStorePlaybackItemsRequestAccumulator__playlistEntryForObject_containerUniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) type];
  switch(v3)
  {
    case 9:
      id v4 = [*(id *)(a1 + 32) movie];
      [v5 setMovie:v4];
      break;
    case 6:
      id v4 = [*(id *)(a1 + 32) tvEpisode];
      [v5 setTvEpisode:v4];
      break;
    case 1:
      id v4 = [*(id *)(a1 + 32) song];
      [v5 setSong:v4];
      break;
    default:
      id v4 = [MEMORY[0x263F08690] currentHandler];
      [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"MPCModelStorePlaybackItemsRequestAccumulator.m", 700, @"Unknown playlist entry: %@", *(void *)(a1 + 32) object file lineNumber description];
      break;
  }
}

- (void)_finalizeABCStateDump
{
  v73[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableDictionary *)self->_mutableABCStateDump objectForKeyedSubscript:@"SOD-Lookups"];
  if ([v3 count])
  {
    id v4 = [(MPServerObjectDatabase *)self->_sod valueForKey:@"database"];
    v72[0] = @"object-resolution";
    id v5 = [v4 statementWithString:@"SELECT * FROM objects WHERE identifier = @identifier" error:0];
    v72[1] = @"related-identifiers";
    v73[0] = v5;
    uint64_t v42 = v4;
    id v6 = [v4 statementWithString:@"SELECT * FROM object_relationships WHERE parent_identifier = @identifier" error:0];
    v73[1] = v6;
    uint64_t v36 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    SEL v33 = v3;
    obuint64_t j = v3;
    uint64_t v37 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v65;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v7;
          id v8 = *(void **)(*((void *)&v64 + 1) + 8 * v7);
          id v9 = [v8 objectForKeyedSubscript:@"identifiers"];
          uint64_t v45 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
          uint64_t v39 = v8;
          v38 = [v8 objectForKeyedSubscript:@"reason"];
          id v10 = objc_msgSend(v36, "objectForKeyedSubscript:");
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v41 = v9;
          uint64_t v46 = [v41 countByEnumeratingWithState:&v60 objects:v70 count:16];
          if (v46)
          {
            uint64_t v43 = *(void *)v61;
            v44 = v10;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v61 != v43) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v48 = *(void *)(*((void *)&v60 + 1) + 8 * v11);
                uint64_t v49 = v11;
                objc_msgSend(v10, "bindStringValue:toParameterNamed:");
                id v12 = [v42 resultsForStatement:v10];
                uint64_t v51 = [MEMORY[0x263EFF980] array];
                uint64_t v13 = [v12 columnCount];
                uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:v13];
                if (v13 >= 1)
                {
                  for (uint64_t i = 0; i != v13; ++i)
                  {
                    unint64_t v16 = [v12 columnNameAtIndex:i];
                    [v14 addObject:v16];
                  }
                }
                v47 = v14;
                [v51 addObject:v14];
                long long v58 = 0u;
                long long v59 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                id v50 = v12;
                uint64_t v17 = [v50 countByEnumeratingWithState:&v56 objects:v69 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v57;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v57 != v19) {
                        objc_enumerationMutation(v50);
                      }
                      id v21 = *(void **)(*((void *)&v56 + 1) + 8 * j);
                      uint64_t v22 = [MEMORY[0x263EFF980] arrayWithCapacity:v13];
                      if (v13 >= 1)
                      {
                        for (uint64_t k = 0; k != v13; ++k)
                        {
                          uint64_t v24 = [v21 objectValueAtColumnIndex:k];
                          uint64_t v25 = [v24 description];
                          id v26 = (void *)v25;
                          if (v25) {
                            uint64_t v27 = (__CFString *)v25;
                          }
                          else {
                            uint64_t v27 = @"<null>";
                          }
                          [v22 addObject:v27];
                        }
                      }
                      [v51 addObject:v22];
                    }
                    uint64_t v18 = [v50 countByEnumeratingWithState:&v56 objects:v69 count:16];
                  }
                  while (v18);
                }

                [v45 setObject:v51 forKeyedSubscript:v48];
                id v10 = v44;
                [v44 reset];

                uint64_t v11 = v49 + 1;
              }
              while (v49 + 1 != v46);
              uint64_t v46 = [v41 countByEnumeratingWithState:&v60 objects:v70 count:16];
            }
            while (v46);
          }

          [v39 setObject:v45 forKeyedSubscript:@"databaseResults"];
          uint64_t v7 = v40 + 1;
        }
        while (v40 + 1 != v37);
        uint64_t v37 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v37);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v28 = [v36 allValues];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v68 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v53;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v53 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * m) invalidate];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v68 count:16];
      }
      while (v30);
    }

    uint64_t v3 = v33;
  }
}

- (_MPCModelStorePlaybackItemEligibility)_eligibilityForItem:(id)a3
{
  id v4 = a3;
  int IsRestricted = 0;
  id v6 = 0;
  BOOL allowsExplicitContent = 1;
  switch([v4 type])
  {
    case 1:
      id v8 = [v4 song];
      int IsRestricted = [v8 isExplicitSong];
      BOOL allowsExplicitContent = self->_allowsExplicitContent;
      id v6 = [v8 storeAsset];
      goto LABEL_14;
    case 5:
      id v9 = [v4 playlistEntry];
      uint64_t v41 = 0;
      uint64_t v42 = &v41;
      uint64_t v43 = 0x3032000000;
      v44 = __Block_byref_object_copy__1855;
      uint64_t v45 = __Block_byref_object_dispose__1856;
      id v46 = 0;
      uint64_t v35 = 0;
      uint64_t v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__1855;
      uint64_t v39 = __Block_byref_object_dispose__1856;
      id v40 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x3032000000;
      uint64_t v32 = __Block_byref_object_copy__1855;
      SEL v33 = __Block_byref_object_dispose__1856;
      id v34 = 0;
      id v10 = (void *)MEMORY[0x263F11F78];
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      uint64_t v23 = __68__MPCModelStorePlaybackItemsRequestAccumulator__eligibilityForItem___block_invoke;
      uint64_t v24 = &unk_2643BF080;
      id v26 = &v41;
      id v8 = v9;
      id v25 = v8;
      uint64_t v27 = &v35;
      uint64_t v28 = &v29;
      [v10 performWithoutEnforcement:&v21];
      uint64_t v11 = (void *)v42[5];
      if (v11)
      {
        int IsRestricted = objc_msgSend(v11, "isExplicitSong", v21, v22, v23, v24);
        BOOL v12 = self->_allowsExplicitContent;
        id v6 = [(id)v42[5] storeAsset];
        BOOL allowsExplicitContent = v12;
        goto LABEL_13;
      }
      if (v36[5])
      {
        int IsRestricted = MPModelTVEpisodeIsRestricted();
        uint64_t v15 = objc_msgSend((id)v36[5], "storeAsset", v21, v22, v23, v24);
LABEL_12:
        id v6 = (void *)v15;
        BOOL allowsExplicitContent = 0;
        goto LABEL_13;
      }
      if (v30[5])
      {
        int IsRestricted = MPModelMovieIsRestricted();
        uint64_t v15 = objc_msgSend((id)v30[5], "storeAsset", v21, v22, v23, v24);
        goto LABEL_12;
      }
      id v6 = 0;
      int IsRestricted = 0;
      BOOL allowsExplicitContent = 1;
LABEL_13:

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(&v41, 8);
LABEL_14:

LABEL_15:
      uint64_t v16 = objc_msgSend(v6, "endpointType", v21, v22, v23, v24);
      uint64_t v17 = 64;
      if (!v16) {
        uint64_t v17 = 72;
      }
      int64_t v18 = *(int64_t *)((char *)&self->super.isa + v17);

      uint64_t v19 = allowsExplicitContent | IsRestricted ^ 1u;
      int64_t v20 = v18;
      result.var1 = v20;
      result.var0 = v19;
      return result;
    case 6:
      uint64_t v13 = [v4 tvEpisode];
      int v14 = MPModelTVEpisodeIsRestricted();
      goto LABEL_7;
    case 9:
      uint64_t v13 = [v4 movie];
      int v14 = MPModelMovieIsRestricted();
LABEL_7:
      int IsRestricted = v14;
      id v6 = [v13 storeAsset];

      BOOL allowsExplicitContent = 0;
      goto LABEL_15;
    default:
      goto LABEL_15;
  }
}

void __68__MPCModelStorePlaybackItemsRequestAccumulator__eligibilityForItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) song];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) tvEpisode];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) movie];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)_addEquivalencyForMetadata:(id)a3 requestStoreIdentifier:(id)a4
{
  id v7 = a4;
  uint64_t v5 = MPStoreItemMetadataStringNormalizeStoreIDValue();
  uint64_t v6 = v5;
  if (v5 && ([v5 isEqualToString:v7] & 1) == 0) {
    [(NSMutableDictionary *)self->_equivalencyMapping setObject:v6 forKey:v7];
  }
}

- (NSDictionary)abc_stateDump
{
  if (self->_mutableABCStateDump)
  {
    [(MPCModelStorePlaybackItemsRequestAccumulator *)self _finalizeABCStateDump];
    uint64_t v3 = (void *)[(NSMutableDictionary *)self->_mutableABCStateDump copy];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v3;
}

- (id)newStoreItemMetadataRequest
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F12298]);
  id v4 = [(MPCModelStorePlaybackItemsRequest *)self->_request clientIdentifier];
  [v3 setClientIdentifier:v4];

  [v3 setReason:3];
  [v3 setTimeoutInterval:&unk_26CC196E8];
  [v3 setRetryDelay:2.0];
  objc_msgSend(v3, "setAllowLocalEquivalencies:", -[MPCModelStorePlaybackItemsRequest allowLocalEquivalencies](self->_request, "allowLocalEquivalencies"));
  uint64_t v30 = v3;
  [v3 setPersonalizationStyle:self->_storePersonalizationStyle];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableOrderedSet count](self->_pendingStoreIDs, "count"));
  uint64_t v6 = (void *)[(NSMutableOrderedSet *)self->_pendingStoreIDs mutableCopy];
  progressiveContentDescriptors = self->_progressiveContentDescriptors;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __75__MPCModelStorePlaybackItemsRequestAccumulator_newStoreItemMetadataRequest__block_invoke;
  v37[3] = &unk_2643BF058;
  v37[4] = self;
  id v8 = v6;
  id v38 = v8;
  id v31 = v5;
  id v39 = v31;
  [(MPMutableSectionedCollection *)progressiveContentDescriptors enumerateSectionsUsingBlock:v37];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = [(MPCModelStorePlaybackItemsRequest *)self->_request playbackPrioritizedIndexPaths];
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        int v14 = [(MPCModelStorePlaybackItemsRequest *)self->_request sectionedModelObjects];
        uint64_t v15 = [v14 itemAtIndexPath:v13];

        uint64_t v16 = [v15 identifiers];
        uint64_t v17 = [v16 preferredStoreStringIdentifierForPersonID:self->_personID];

        uint64_t v18 = [v8 indexOfObject:v17];
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v19 = v18;
          int64_t v20 = [v8 objectAtIndex:v18];
          [v31 addObject:v20];

          [v8 removeObjectAtIndex:v19];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v10);
  }

  if ([v31 count])
  {
    uint64_t v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_msgSend(v31, "msv_compactDescription");
      *(_DWORD *)buf = 134218242;
      uint64_t v41 = self;
      __int16 v42 = 2112;
      uint64_t v43 = v22;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[PIA] %p Only requesting prioritized IDs requestedIDs=[%@]", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v21 = [v8 array];
    [v31 addObjectsFromArray:v21];
  }

  [v30 setItemIdentifiers:v31];
  uint64_t v23 = [(MPCModelStorePlaybackItemsRequest *)self->_request playbackRequestEnvironment];
  uint64_t v24 = [v23 _createStoreRequestContext];

  id v25 = [v24 clientInfo];
  [v30 setClientInfo:v25];

  id v26 = [v24 delegatedIdentity];
  [v30 setDelegatedUserIdentity:v26];

  uint64_t v27 = [v24 identity];
  [v30 setUserIdentity:v27];

  uint64_t v28 = [v24 identityStore];
  [v30 setUserIdentityStore:v28];

  return v30;
}

void __75__MPCModelStorePlaybackItemsRequestAccumulator_newStoreItemMetadataRequest__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (_NSIsNSString())
  {
    id v3 = v9;
    if (!v3) {
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = 0;
      goto LABEL_9;
    }
    id v4 = [v9 identifiers];
    id v3 = [v4 preferredStoreStringIdentifierForPersonID:*(void *)(*(void *)(a1 + 32) + 32)];

    if (!v3) {
      goto LABEL_9;
    }
  }
  uint64_t v5 = [*(id *)(a1 + 40) indexOfObject:v3];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    id v7 = *(void **)(a1 + 48);
    id v8 = [*(id *)(a1 + 40) objectAtIndex:v5];
    [v7 addObject:v8];

    [*(id *)(a1 + 40) removeObjectAtIndex:v6];
  }
LABEL_9:
}

- (MPCModelStorePlaybackItemsRequestAccumulatorResult)handleResponse:(id)a3 error:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08570], -1009);

  if (v8
    && ([MEMORY[0x263F89110] sharedMonitor],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isRemoteServerReachable],
        v9,
        (v10 & 1) == 0))
  {
    uint64_t v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v49 = [v6 requestItemIdentifiers];
      id v50 = objc_msgSend(v49, "msv_compactDescription");
      *(_DWORD *)buf = 134218498;
      v71 = self;
      __int16 v72 = 2048;
      id v73 = v6;
      __int16 v74 = 2114;
      *(void *)v75 = v50;
      _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_ERROR, "[PIA] %p Handling SP response=%p marking remaining IDs as failed [EnvironmentMonitor.isRemoteServerReachable returned NO] failedIDs=%{public}@", buf, 0x20u);
    }
    uint64_t v51 = (void *)MEMORY[0x263F89390];
    performanceMetrics = self->_performanceMetrics;
    long long v53 = [v6 performanceMetrics];
    long long v54 = [v51 aggregatedMetricsFromAggregatedMetrics:performanceMetrics addingAggregatedMetrics:v53];
    long long v55 = self->_performanceMetrics;
    self->_performanceMetrics = v54;

    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 56, v7, @"EnvironmentMonitor.isRemoteServerReachable returned NO");
    long long v56 = (NSError *)objc_claimAutoreleasedReturnValue();
    accumulationError = self->_accumulationError;
    self->_accumulationError = v56;

    int v47 = (int)[(MPCModelStorePlaybackItemsRequestAccumulator *)self accumulatorResult];
  }
  else
  {
    uint64_t v11 = [v6 lastBatchStoreItemDictionaries];
    BOOL v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v11 count];
      int v14 = [v6 requestItemIdentifiers];
      uint64_t v15 = objc_msgSend(v14, "msv_compactDescription");
      *(_DWORD *)buf = 134218754;
      v71 = self;
      __int16 v72 = 2048;
      id v73 = v6;
      __int16 v74 = 2048;
      *(void *)v75 = v13;
      *(_WORD *)&v75[8] = 2112;
      *(void *)&v75[10] = v15;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[PIA] %p Importing response %p storeDictionaryCount=%ld requestedIDs=[%@]", buf, 0x2Au);
    }
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F12230]) initWithPayload:v11];
    uint64_t v17 = [(MPCModelStorePlaybackItemsRequestAccumulator *)self _userIdentityWithRequest:self->_request];
    [v16 setUserIdentity:v17];

    sod = self->_sod;
    id v68 = 0;
    long long v61 = v16;
    uint64_t v19 = [(MPServerObjectDatabase *)sod importObjectsFromRequest:v16 options:0 error:&v68];
    id v20 = v68;
    id v21 = v20;
    if (!v19 || v20)
    {
      uint64_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v71 = self;
        __int16 v72 = 2048;
        id v73 = v6;
        __int16 v74 = 2114;
        *(void *)v75 = v21;
        _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_ERROR, "[PIA] %p Failed to import response %p. error=%{public}@", buf, 0x20u);
      }
    }
    long long v62 = v11;
    [(NSMutableArray *)self->_importResults addObject:v19];
    BOOL v23 = [(MPCModelStorePlaybackItemsRequestAccumulator *)self _isFatalError:v7];
    if (v7)
    {
      uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v71 = self;
        __int16 v72 = 2048;
        id v73 = v6;
        __int16 v74 = 1024;
        *(_DWORD *)v75 = v23;
        *(_WORD *)&v75[4] = 2114;
        *(void *)&v75[6] = v7;
        _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_ERROR, "[PIA] %p Handling SP response=%p isFatalError=%{BOOL}u error=%{public}@", buf, 0x26u);
      }
    }
    long long v59 = v21;
    long long v60 = (void *)v19;
    id v63 = v7;
    id v25 = [MEMORY[0x263EFF980] array];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v26 = [v6 lastBatchItemIdentifiers];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v65 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v32 = [v6 storeItemMetadataForItemIdentifier:v31];
          if (v32)
          {
            [(MPCModelStorePlaybackItemsRequestAccumulator *)self _addEquivalencyForMetadata:v32 requestStoreIdentifier:v31];
          }
          else if (v23)
          {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v28);
    }

    if ([v25 count])
    {
      long long v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v71 = self;
        __int16 v72 = 2114;
        id v73 = v25;
        _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "[PIA] %p Adding identifiers=%{public}@ as permanently failed items", buf, 0x16u);
      }

      _MPCSPIRAddFailedStoreIDs(v25);
    }
    [(MPCModelStorePlaybackItemsRequestAccumulator *)self _resolveContentDescriptorsUsingServerObjectDatabase];
    id v7 = v63;
    if ([v6 isFinalResponse])
    {
      long long v34 = (void *)MEMORY[0x263EFF9C0];
      long long v35 = [v6 requestItemIdentifiers];
      long long v36 = [v34 setWithArray:v35];

      uint64_t v37 = [(NSMutableOrderedSet *)self->_pendingStoreIDs set];
      [v36 intersectSet:v37];

      id v38 = [v36 allObjects];
      id v39 = v38;
      if (v23 && [v38 count])
      {
        id v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = objc_msgSend(v39, "msv_compactDescription");
          *(_DWORD *)buf = 134218242;
          v71 = self;
          __int16 v72 = 2114;
          id v73 = v41;
          _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_ERROR, "[PIA] %p Permanently failed items: [fatal final response] identifiers=[%{public}@]", buf, 0x16u);
        }
        _MPCSPIRAddFailedStoreIDs(v39);
      }
      [(NSMutableOrderedSet *)self->_pendingStoreIDs removeObjectsInArray:v39];
    }
    __int16 v42 = (void *)MEMORY[0x263F89390];
    uint64_t v43 = self->_performanceMetrics;
    v44 = [v6 performanceMetrics];
    uint64_t v45 = [v42 aggregatedMetricsFromAggregatedMetrics:v43 addingAggregatedMetrics:v44];
    id v46 = self->_performanceMetrics;
    self->_performanceMetrics = v45;

    int v47 = (int)[(MPCModelStorePlaybackItemsRequestAccumulator *)self accumulatorResult];
  }

  return (MPCModelStorePlaybackItemsRequestAccumulatorResult)v47;
}

- (MPCModelStorePlaybackItemsRequestAccumulatorResult)accumulatorResult
{
  v51[1] = *MEMORY[0x263EF8340];
  BOOL v3 = 1;
  if (self->_accumulationError)
  {
    int v4 = 0;
    int v5 = 1;
  }
  else
  {
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    if (self->_requestUsesSectionedModelObjects)
    {
      id v7 = [(MPCModelStorePlaybackItemsRequest *)self->_request sectionedModelObjects];
      BOOL v8 = [v7 totalItemCount] > 0;

      if (v8)
      {
        id v9 = [(MPCModelStorePlaybackItemsRequest *)self->_request playbackPrioritizedIndexPaths];
        if (![v9 count])
        {
          char v10 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
          v51[0] = v10;
          id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];

          id v9 = v2;
        }
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __65__MPCModelStorePlaybackItemsRequestAccumulator_accumulatorResult__block_invoke;
        v33[3] = &unk_2643BF030;
        void v33[4] = self;
        v33[5] = &v34;
        [v9 enumerateObjectsUsingBlock:v33];
        int v4 = *((unsigned char *)v35 + 24) == 0;
      }
      else
      {
        int v4 = 0;
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v11 = [(MPMutableSectionedCollection *)self->_progressiveContentDescriptors allSections];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v50 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v30 != v13) {
              objc_enumerationMutation(v11);
            }
            id v2 = *(id *)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
            }
            else
            {
              id v2 = v2;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

LABEL_22:
                int v4 = 1;
                goto LABEL_23;
              }
              uint64_t v15 = [v2 identifiers];
              char v16 = [v15 isPlaceholder];

              if (v16) {
                goto LABEL_22;
              }
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v50 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      int v4 = 0;
LABEL_23:

      if ([(MPMutableSectionedCollection *)self->_progressiveContentDescriptors numberOfItemsInSection:0])
      {
        progressiveContentDescriptors = self->_progressiveContentDescriptors;
        uint64_t v18 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
        uint64_t v19 = [(MPMutableSectionedCollection *)progressiveContentDescriptors itemAtIndexPath:v18];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v19 identifiers],
              id v20 = objc_claimAutoreleasedReturnValue(),
              id v2 = (id)[v20 isPlaceholder],
              v20,
              v2))
        {
          *((unsigned char *)v35 + 24) = 0;
        }
      }
      else
      {
        *((unsigned char *)v35 + 24) = 0;
      }
    }
    uint64_t v21 = [(NSMutableOrderedSet *)self->_pendingStoreIDs count];
    BOOL v3 = v21 == 0;
    BOOL v22 = [(NSMutableArray *)self->_pendingCollectionItemMetadataRequests count]
       || [(NSMutableArray *)self->_pendingCollectionItemTokenRenewalRequests count]
       || [(NSMutableArray *)self->_pendingCollectionMetadataRequests count]
       || [(NSMutableArray *)self->_pendingCollectionItemAuthorizationTokenRequests count] != 0;
    BOOL v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = v21 == 0;
      int v25 = *((unsigned __int8 *)v35 + 24);
      uint64_t v26 = [(NSMutableOrderedSet *)self->_pendingStoreIDs count];
      if (v26)
      {
        id v2 = [(NSMutableOrderedSet *)self->_pendingStoreIDs array];
        objc_msgSend(v2, "msv_compactDescription");
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v27 = @"{}";
      }
      *(_DWORD *)buf = 134219266;
      id v39 = self;
      __int16 v40 = 1024;
      BOOL v41 = v24;
      __int16 v42 = 1024;
      int v43 = v25;
      __int16 v44 = 1024;
      BOOL v45 = v22;
      __int16 v46 = 1024;
      int v47 = v4;
      __int16 v48 = 2114;
      uint64_t v49 = v27;
      _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[PIA] %p computed accumulatorResult didFinishEntireRequest=%{BOOL}u didFinishPrioritizedBatch=%{BOOL}u hasCollectionItemsWithPlaybackAuthTokens=%{BOOL}u hasPrioritizedItemsToLoad=%{BOOL}u pendingStoreIDs=[%{public}@]", buf, 0x2Eu);
      if (v26)
      {
      }
    }

    int v5 = *((unsigned __int8 *)v35 + 24);
    _Block_object_dispose(&v34, 8);
  }
  return (MPCModelStorePlaybackItemsRequestAccumulatorResult)((v5 << 8) | (v4 << 16) | v3);
}

void __65__MPCModelStorePlaybackItemsRequestAccumulator_accumulatorResult__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "sectionAtIndex:", objc_msgSend(v13, "section"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_5;
  }
  id v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  BOOL v8 = [v7 identifiers];
  int v9 = [v8 isPlaceholder];

  if (v9)
  {
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_11;
  }
LABEL_5:
  char v10 = [*(id *)(*(void *)(a1 + 32) + 168) itemAtIndexPath:v13];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v10 identifiers],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isPlaceholder],
        v11,
        v12))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

LABEL_11:
}

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  if (self->_accumulationError)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F12200]);
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F120D8]);
    progressiveContentDescriptors = self->_progressiveContentDescriptors;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke;
    v9[3] = &unk_2643BF008;
    v9[4] = self;
    id v6 = v4;
    id v10 = v6;
    [(MPMutableSectionedCollection *)progressiveContentDescriptors enumerateSectionsUsingBlock:v9];
    id v7 = v10;
    id v2 = v6;
  }

  return (MPSectionedCollection *)v2;
}

void __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v6 + 16)) {
      goto LABEL_4;
    }
    id v7 = (void *)MEMORY[0x263F11EE0];
    BOOL v8 = [*(id *)(v6 + 8) sectionedModelObjects];
    int v9 = [v8 sectionAtIndex:a3];
    id v10 = [v7 genericObjectWithModelObject:v9];
    uint64_t v11 = (void *)[v10 copyWithPropertySet:*(void *)(*(void *)(a1 + 32) + 40)];

    if (!v11)
    {
LABEL_4:
      id v12 = objc_alloc(MEMORY[0x263F11EE0]);
      id v13 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
      uint64_t v11 = (void *)[v12 initWithIdentifiers:v13 block:&__block_literal_global_1876];
LABEL_8:
    }
  }
  else
  {
    uint64_t v11 = v5;
    if (_NSIsNSString())
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v11 = v5;
      if (*(unsigned char *)(v14 + 16))
      {
        uint64_t v15 = [*(id *)(v14 + 8) sectionedModelObjects];
        id v13 = [v15 sectionAtIndex:a3];

        char v16 = [v13 identifiers];
        uint64_t v17 = (void *)[v16 copyWithSource:@"Accumulator-SectionPlaceholder" block:&__block_literal_global_30];
        uint64_t v18 = (void *)[v13 copyWithIdentifiers:v17];

        uint64_t v19 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v18];
        uint64_t v11 = (void *)[v19 copyWithPropertySet:*(void *)(*(void *)(a1 + 32) + 40)];

        goto LABEL_8;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = (void *)[v11 copyWithPropertySet:*(void *)(*(void *)(a1 + 32) + 40)];

    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F122A8]) initWithModel:v20 personalizationStyle:*(void *)(*(void *)(a1 + 32) + 64)];
    [*(id *)(a1 + 40) appendSection:v21];
    uint64_t v22 = [v20 type];
    BOOL v23 = v22 == 4;
    if (v22 == 4)
    {
      BOOL v24 = objc_msgSend(MEMORY[0x263F08760], "setWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "numberOfItemsInSection:", a3));
    }
    else
    {
      BOOL v24 = 0;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void **)(v25 + 168);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_4;
    v28[3] = &unk_2643BEFE0;
    uint64_t v31 = a3;
    BOOL v32 = v23;
    v28[4] = v25;
    id v29 = v24;
    id v30 = *(id *)(a1 + 40);
    id v27 = v24;
    [v26 enumerateItemsInSectionAtIndex:a3 usingBlock:v28];

    uint64_t v11 = v20;
  }
}

void __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (_NSIsNSString())
  {
    uint64_t v6 = v5;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
    {
      id v7 = _MPCSPIRCopyFailedStoreIDs();
      int v8 = [v7 containsObject:v5];

      if (v8)
      {
        int v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v5;
          _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "[PIA] %p skipping item [store lookup failed] itemID=%{public}@", buf, 0x16u);
        }
        uint64_t v6 = v5;
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) sectionedModelObjects];
      id v12 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:*(void *)(a1 + 56)];
      id v13 = [v11 itemAtIndexPath:v12];

      uint64_t v14 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v13];
      uint64_t v15 = [v13 identifiers];
      char v16 = (void *)[v15 copyWithSource:@"Accumulator-ItemPlaceholder" block:&__block_literal_global_39];
      uint64_t v6 = (void *)[v14 copyWithIdentifiers:v16 propertySet:*(void *)(*(void *)(a1 + 32) + 40)];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([*(id *)(a1 + 32) _eligibilityForItem:v6])
    {
      uint64_t v20 = v17;
      if (*(unsigned char *)(a1 + 64) && [v6 type] != 5)
      {
        id v21 = v6;
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        *(void *)&buf[24] = 8;
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x2020000000;
        char v37 = 0;
        v35[0] = 0;
        v35[1] = v35;
        v35[2] = 0x2020000000;
        v35[3] = 3;
        uint64_t v22 = (void *)MEMORY[0x263F11F78];
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        id v29 = __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_2_41;
        id v30 = &unk_2643BF080;
        id v23 = v21;
        id v31 = v23;
        BOOL v32 = buf;
        long long v33 = v36;
        uint64_t v34 = v35;
        [v22 performWithoutEnforcement:&v27];
        BOOL v24 = objc_msgSend(v23, "identifiers", v27, v28, v29, v30);
        uint64_t v25 = MPContainerUniqueIDPrefix();

        uint64_t v26 = MEMORY[0x21D49CC00](v25, [*(id *)(a1 + 40) countForObject:v25]);
        [*(id *)(a1 + 40) addObject:v25];
        uint64_t v6 = [*(id *)(a1 + 32) _playlistEntryForObject:v23 containerUniqueID:v26];

        _Block_object_dispose(v35, 8);
        _Block_object_dispose(v36, 8);
        _Block_object_dispose(buf, 8);
      }
      int v9 = [objc_alloc(MEMORY[0x263F122A8]) initWithModel:v6 personalizationStyle:v20];
      [*(id *)(a1 + 48) appendItem:v9];
    }
    else
    {
      int v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v19 = *(unsigned __int8 *)(v18 + 56);
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v19;
        *(_WORD *)&buf[18] = 2114;
        *(void *)&buf[20] = v6;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[PIA] %p skipping item [not eligible] allowExplicitContent=%{BOOL}u item=%{public}@ ", buf, 0x1Cu);
      }
    }
    goto LABEL_16;
  }
LABEL_17:
}

void __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_2_41(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) type];
  switch(v2)
  {
    case 9:
      uint64_t v6 = [*(id *)(a1 + 32) movie];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 isLibraryAdded];

      id v5 = [*(id *)(a1 + 32) movie];
      break;
    case 6:
      id v7 = [*(id *)(a1 + 32) tvEpisode];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 isLibraryAdded];

      id v5 = [*(id *)(a1 + 32) tvEpisode];
      break;
    case 1:
      BOOL v3 = [*(id *)(a1 + 32) song];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 cloudStatus];

      id v4 = [*(id *)(a1 + 32) song];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 isLibraryAdded];

      id v5 = [*(id *)(a1 + 32) song];
      break;
    default:
      return;
  }
  id v9 = v5;
  int v8 = [v5 storeAsset];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 endpointType];
}

uint64_t __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_37(uint64_t a1, void *a2)
{
  return [a2 setPlaceholder:1];
}

uint64_t __80__MPCModelStorePlaybackItemsRequestAccumulator_unpersonalizedContentDescriptors__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setPlaceholder:1];
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (MPCModelStorePlaybackItemsRequestAccumulator)initWithRequest:(id)a3 serverObjectDatabase:(id)a4
{
  v186[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v168.receiver = self;
  v168.super_class = (Class)MPCModelStorePlaybackItemsRequestAccumulator;
  int v8 = [(MPCModelStorePlaybackItemsRequestAccumulator *)&v168 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    request = v8->_request;
    v8->_request = (MPCModelStorePlaybackItemsRequest *)v9;

    uint64_t v11 = [(MPCModelStorePlaybackItemsRequest *)v8->_request sectionedModelObjects];
    v8->_requestUsesSectionedModelObjects = v11 != 0;

    objc_storeStrong((id *)&v8->_sod, a4);
    id v12 = [(MPCModelStorePlaybackItemsRequest *)v8->_request abc_siriAssetInfo];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
      mutableABCStateDump = v8->_mutableABCStateDump;
      v8->_mutableABCStateDump = (NSMutableDictionary *)v14;
    }
    char v16 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    v8->_BOOL allowsExplicitContent = [v16 allowsExplicitContent];

    uint64_t v17 = [v6 playbackRequestEnvironment];
    uint64_t v18 = [v17 delegationProperties];
    uint64_t v19 = [v18 storeAccountID];

    id v159 = v6;
    if (v19)
    {
      uint64_t v20 = (char *)v172 + 1;
      uint64_t quot = v19;
      do
      {
        lldiv_t v22 = lldiv(quot, 10);
        uint64_t quot = v22.quot;
        if (v22.rem >= 0) {
          LOBYTE(v23) = v22.rem;
        }
        else {
          uint64_t v23 = -v22.rem;
        }
        *(v20 - 2) = v23 + 48;
        BOOL v24 = (const UInt8 *)(v20 - 2);
        --v20;
      }
      while (v22.quot);
      if (v19 < 0)
      {
        *(v20 - 2) = 45;
        BOOL v24 = (const UInt8 *)(v20 - 2);
      }
      CFStringRef v25 = CFStringCreateWithBytes(0, v24, (char *)v172 - (char *)v24, 0x8000100u, 0);
      personID = v8->_personID;
      v8->_personID = &v25->isa;
    }
    else
    {
      uint64_t v27 = [v6 playbackRequestEnvironment];
      personID = [v27 userIdentity];

      uint64_t v28 = [MEMORY[0x263F893C8] defaultIdentityStore];
      id v29 = [v28 DSIDForUserIdentity:personID outError:0];

      if (personID && v29)
      {
        uint64_t v30 = [v29 longLongValue];
        uint64_t v31 = v30;
        BOOL v32 = (char *)v172 + 1;
        do
        {
          lldiv_t v33 = lldiv(v30, 10);
          uint64_t v30 = v33.quot;
          if (v33.rem >= 0) {
            LOBYTE(v34) = v33.rem;
          }
          else {
            uint64_t v34 = -v33.rem;
          }
          *(v32 - 2) = v34 + 48;
          long long v35 = (const UInt8 *)(v32 - 2);
          --v32;
        }
        while (v33.quot);
        if (v31 < 0)
        {
          *(v32 - 2) = 45;
          long long v35 = (const UInt8 *)(v32 - 2);
        }
        CFStringRef v36 = CFStringCreateWithBytes(0, v35, (char *)v172 - (char *)v35, 0x8000100u, 0);
        char v37 = v8->_personID;
        v8->_personID = &v36->isa;

        id v38 = (void *)MEMORY[0x263F11DA8];
        uint64_t v39 = [MEMORY[0x263F893C8] defaultIdentityStore];
        __int16 v40 = [v38 userMonitorWithUserIdentity:personID fromUserIdentityStore:v39];

        if ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory] && v40) {
          v8->_BOOL allowsExplicitContent = [v40 isExplicitSettingEnabled];
        }
      }
      else
      {
        BOOL v41 = (NSString *)(id)*MEMORY[0x263F89090];
        __int16 v40 = v8->_personID;
        v8->_personID = v41;
      }
    }
    __int16 v42 = v8->_request;
    int v43 = [(MPCModelStorePlaybackItemsRequest *)v42 sectionProperties];
    __int16 v44 = [(MPCModelStorePlaybackItemsRequest *)v42 sectionKind];
    BOOL v45 = objc_msgSend((id)objc_msgSend(v44, "modelClass"), "requiredStoreLibraryPersonalizationProperties");
    v160 = [v43 propertySetByCombiningWithPropertySet:v45];

    __int16 v46 = [(MPCModelStorePlaybackItemsRequest *)v42 itemProperties];

    v157 = v46;
    int v47 = [v46 relationships];
    uint64_t v154 = *MEMORY[0x263F11A18];
    __int16 v48 = objc_msgSend(v47, "objectForKey:");
    uint64_t v49 = v48;
    id v158 = v7;
    if (v48)
    {
      id v50 = v48;
    }
    else
    {
      id v50 = [MEMORY[0x263F12180] emptyPropertySet];
    }
    uint64_t v51 = v50;

    v155 = [(id)objc_opt_class() requiredStoreLibraryPersonalizationProperties];
    long long v52 = objc_msgSend(v51, "propertySetByCombiningWithPropertySet:");

    id v53 = objc_alloc(MEMORY[0x263F12180]);
    v186[0] = *MEMORY[0x263F11820];
    long long v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:1];
    uint64_t v184 = *MEMORY[0x263F11AD8];
    long long v55 = (void *)MEMORY[0x263F12180];
    uint64_t v56 = *MEMORY[0x263F118D8];
    uint64_t v183 = *MEMORY[0x263F118D8];
    long long v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v183 count:1];
    long long v58 = [v55 propertySetWithProperties:v57];
    v185 = v58;
    long long v59 = [NSDictionary dictionaryWithObjects:&v185 forKeys:&v184 count:1];
    uint64_t v60 = [v53 initWithProperties:v54 relationships:v59];

    v153 = (void *)v60;
    v152 = [v52 propertySetByCombiningWithPropertySet:v60];

    uint64_t v150 = *MEMORY[0x263F119D0];
    long long v61 = objc_msgSend(v47, "objectForKey:");
    long long v62 = v61;
    if (v61)
    {
      id v63 = v61;
    }
    else
    {
      id v63 = [MEMORY[0x263F12180] emptyPropertySet];
    }
    long long v64 = v63;

    v151 = [(id)objc_opt_class() requiredStoreLibraryPersonalizationProperties];
    long long v65 = objc_msgSend(v64, "propertySetByCombiningWithPropertySet:");

    id v66 = objc_alloc(MEMORY[0x263F12180]);
    uint64_t v182 = *MEMORY[0x263F115C0];
    long long v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v182 count:1];
    uint64_t v68 = *MEMORY[0x263F11A50];
    uint64_t v179 = v56;
    uint64_t v180 = v68;
    uint64_t v69 = (void *)MEMORY[0x263F12180];
    v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v179 count:1];
    v71 = [v69 propertySetWithProperties:v70];
    v181 = v71;
    __int16 v72 = [NSDictionary dictionaryWithObjects:&v181 forKeys:&v180 count:1];
    uint64_t v73 = [v66 initWithProperties:v67 relationships:v72];

    v149 = (void *)v73;
    v148 = [v65 propertySetByCombiningWithPropertySet:v73];

    uint64_t v146 = *MEMORY[0x263F11A20];
    __int16 v74 = objc_msgSend(v47, "objectForKey:");
    v75 = v74;
    if (v74)
    {
      id v76 = v74;
    }
    else
    {
      id v76 = [MEMORY[0x263F12180] emptyPropertySet];
    }
    v77 = v76;

    v147 = [(id)objc_opt_class() requiredStoreLibraryPersonalizationProperties];
    v78 = objc_msgSend(v77, "propertySetByCombiningWithPropertySet:");

    id v79 = objc_alloc(MEMORY[0x263F12180]);
    uint64_t v178 = *MEMORY[0x263F11918];
    v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v178 count:1];
    uint64_t v81 = *MEMORY[0x263F11B00];
    uint64_t v175 = v56;
    uint64_t v176 = v81;
    v82 = (void *)MEMORY[0x263F12180];
    v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v175 count:1];
    v84 = [v82 propertySetWithProperties:v83];
    v177 = v84;
    v85 = [NSDictionary dictionaryWithObjects:&v177 forKeys:&v176 count:1];
    uint64_t v86 = [v79 initWithProperties:v80 relationships:v85];

    v145 = (void *)v86;
    v144 = [v78 propertySetByCombiningWithPropertySet:v86];

    v87 = [v160 relationships];
    uint64_t v142 = *MEMORY[0x263F11998];
    v88 = objc_msgSend(v87, "objectForKey:");
    v89 = v88;
    if (v88)
    {
      id v90 = v88;
    }
    else
    {
      id v90 = [MEMORY[0x263F12180] emptyPropertySet];
    }
    v91 = v90;
    v156 = v47;

    v143 = [(id)objc_opt_class() requiredStoreLibraryPersonalizationProperties];
    v92 = objc_msgSend(v91, "propertySetByCombiningWithPropertySet:");

    v93 = (void *)MEMORY[0x263F12180];
    uint64_t v174 = *MEMORY[0x263F114D0];
    v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v174 count:1];
    uint64_t v95 = [v93 propertySetWithProperties:v94];

    v141 = (void *)v95;
    v140 = [v92 propertySetByCombiningWithPropertySet:v95];

    v96 = [v160 relationships];
    uint64_t v97 = *MEMORY[0x263F119D8];
    v98 = [v96 objectForKey:*MEMORY[0x263F119D8]];
    v99 = v98;
    if (v98)
    {
      id v100 = v98;
    }
    else
    {
      id v100 = [MEMORY[0x263F12180] emptyPropertySet];
    }
    v101 = v100;

    v139 = [(id)objc_opt_class() requiredStoreLibraryPersonalizationProperties];
    v102 = objc_msgSend(v101, "propertySetByCombiningWithPropertySet:");

    v103 = (void *)MEMORY[0x263F12180];
    uint64_t v173 = *MEMORY[0x263F11690];
    v104 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v173 count:1];
    v105 = [v103 propertySetWithProperties:v104];

    v106 = [v102 propertySetByCombiningWithPropertySet:v105];

    v107 = [v160 relationships];
    uint64_t v108 = *MEMORY[0x263F119F8];
    v109 = [v107 objectForKey:*MEMORY[0x263F119F8]];
    v110 = v109;
    if (v109)
    {
      id v111 = v109;
    }
    else
    {
      id v111 = [MEMORY[0x263F12180] emptyPropertySet];
    }
    v112 = v111;

    id v113 = objc_alloc(MEMORY[0x263F12180]);
    v170[0] = v150;
    v170[1] = v146;
    *(void *)buf = v148;
    *(void *)&buf[8] = v144;
    v170[2] = v142;
    v170[3] = v97;
    *(void *)&buf[16] = v140;
    v172[0] = v106;
    v170[4] = v154;
    v170[5] = v108;
    v172[1] = v152;
    v172[2] = v112;
    v114 = [NSDictionary dictionaryWithObjects:buf forKeys:v170 count:6];
    uint64_t v115 = [v113 initWithProperties:MEMORY[0x263EFFA68] relationships:v114];

    requestPropertySet = v8->_requestPropertySet;
    v8->_requestPropertySet = (MPPropertySet *)v115;

    uint64_t v117 = [MEMORY[0x263EFF980] array];
    importResults = v8->_importResults;
    v8->_importResults = (NSMutableArray *)v117;

    v119 = [(MPCModelStorePlaybackItemsRequest *)v8->_request playbackRequestEnvironment];
    v120 = [v119 delegationProperties];
    BOOL v121 = v120 == 0;

    v8->_defaultLibraryPersonalizationStyle = v121;
    v8->_unknownEndpointLibraryPersonalizationStyle = 2 * v121;
    v122 = _MPCSPIRCopyFailedStoreIDs();
    id v7 = v158;
    if ([v122 count])
    {
      v123 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v122;
        _os_log_impl(&dword_21BB87000, v123, OS_LOG_TYPE_DEFAULT, "[PIA] %p will not run requests for itemIdentifiers=%{public}@", buf, 0x16u);
      }
    }
    v124 = (MPMutableSectionedCollection *)objc_alloc_init(MEMORY[0x263F120D8]);
    progressiveContentDescriptors = v8->_progressiveContentDescriptors;
    v8->_progressiveContentDescriptors = v124;

    if (v8->_requestUsesSectionedModelObjects)
    {
      v126 = [(MPCModelStorePlaybackItemsRequest *)v8->_request sectionedModelObjects];
      v165[0] = MEMORY[0x263EF8330];
      v165[1] = 3221225472;
      v165[2] = __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke;
      v165[3] = &unk_2643C0AC0;
      v166 = v8;
      id v167 = v126;
      id v127 = v126;
      [v127 enumerateSectionsUsingBlock:v165];
    }
    else
    {
      v128 = v8->_progressiveContentDescriptors;
      v129 = [MEMORY[0x263F08C38] UUID];
      [(MPMutableSectionedCollection *)v128 appendSection:v129];

      long long v163 = 0u;
      long long v164 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      id v127 = [(MPCModelStorePlaybackItemsRequest *)v8->_request storeIDs];
      uint64_t v130 = [v127 countByEnumeratingWithState:&v161 objects:v169 count:16];
      if (v130)
      {
        uint64_t v131 = v130;
        uint64_t v132 = *(void *)v162;
        do
        {
          for (uint64_t i = 0; i != v131; ++i)
          {
            if (*(void *)v162 != v132) {
              objc_enumerationMutation(v127);
            }
            [(MPMutableSectionedCollection *)v8->_progressiveContentDescriptors appendItem:*(void *)(*((void *)&v161 + 1) + 8 * i)];
          }
          uint64_t v131 = [v127 countByEnumeratingWithState:&v161 objects:v169 count:16];
        }
        while (v131);
      }
    }

    v134 = [MEMORY[0x263EFF980] array];
    [(NSMutableDictionary *)v8->_mutableABCStateDump setObject:v134 forKeyedSubscript:@"SOD-Lookups"];

    v135 = _MPCSPIRCopyFailedStoreIDs();
    if ([v135 count])
    {
      v136 = [v135 allObjects];
      v137 = objc_msgSend(v136, "msv_compactDescription");
      [(NSMutableDictionary *)v8->_mutableABCStateDump setObject:v137 forKeyedSubscript:@"permanently-failed-ids"];
    }
    [(MPCModelStorePlaybackItemsRequestAccumulator *)v8 _resolveContentDescriptorsUsingServerObjectDatabase];

    id v6 = v159;
  }

  return v8;
}

void __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 identifiers];
  id v7 = [v6 universalStore];
  int v8 = [v7 universalCloudLibraryID];
  uint64_t v9 = [v8 length];

  if (v9) {
    *(void *)(*(void *)(a1 + 32) + 96) = 1;
  }
  uint64_t v10 = [v5 identifiers];
  uint64_t v11 = [v10 preferredStoreStringIdentifierForPersonID:*(void *)(*(void *)(a1 + 32) + 32)];

  id v12 = [v5 identifiers];
  uint64_t v13 = [v12 modelKind];
  id v14 = [v13 identityKind];
  id v15 = [MEMORY[0x263F11F00] identityKind];
  if (v14 == v15)
  {

LABEL_8:
    id v18 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v19 = [v5 identifiers];
    uint64_t v20 = [v19 opaqueID];
    id v21 = (void *)[v18 initWithUUIDString:v20];

    if (v21)
    {
LABEL_15:
      [*(id *)(*(void *)(a1 + 32) + 168) appendSection:v21];

      goto LABEL_16;
    }
    id v21 = [MEMORY[0x263F08C38] UUID];
    lldiv_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v23;
      __int16 v31 = 2114;
      BOOL v32 = v21;
      __int16 v33 = 2114;
      id v34 = v5;
      BOOL v24 = "[PIA] %p using UUID [section is Group, but opaqueID was not a valid UUID] uuid=%{public}@ section=%{public}@";
LABEL_13:
      _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);
    }
LABEL_14:

    goto LABEL_15;
  }
  char v16 = v15;
  char v17 = [v14 isEqual:v15];

  if (v17) {
    goto LABEL_8;
  }
  if (![v11 length])
  {
    id v21 = [MEMORY[0x263F08C38] UUID];
    lldiv_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v25;
      __int16 v31 = 2114;
      BOOL v32 = v21;
      __int16 v33 = 2114;
      id v34 = v5;
      BOOL v24 = "[PIA] %p using UUID [section object has no preferred storeID] uuid=%{public}@ section=%{public}@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  [*(id *)(*(void *)(a1 + 32) + 168) appendSection:v11];
LABEL_16:
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke_13;
  v27[3] = &unk_2643C0A98;
  uint64_t v26 = *(void **)(a1 + 40);
  id v28 = *(id *)(a1 + 32);
  [v26 enumerateItemsInSectionAtIndex:a3 usingBlock:v27];
}

void __85__MPCModelStorePlaybackItemsRequestAccumulator_initWithRequest_serverObjectDatabase___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 identifiers];
  id v5 = [v4 universalStore];
  id v6 = [v5 universalCloudLibraryID];
  uint64_t v7 = [v6 length];

  if (v7) {
    *(void *)(*(void *)(a1 + 32) + 96) = 1;
  }
  int v8 = [v3 identifiers];
  uint64_t v9 = [v8 preferredStoreStringIdentifierForPersonID:*(void *)(*(void *)(a1 + 32) + 32)];

  if ([v9 length])
  {
    [*(id *)(*(void *)(a1 + 32) + 168) appendItem:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 134218498;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      char v16 = v10;
      __int16 v17 = 2114;
      id v18 = v3;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[PIA] %p using UUID [item object has no preferred storeID] uuid=%{public}@ item=%{public}@", (uint8_t *)&v13, 0x20u);
    }

    [*(id *)(*(void *)(a1 + 32) + 168) appendItem:v10];
  }
}

- (MPCModelStorePlaybackItemsRequestAccumulator)initWithRequest:(id)a3
{
  id v4 = (void *)MEMORY[0x263F12218];
  id v5 = a3;
  id v6 = [v4 sharedServerObjectDatabase];
  uint64_t v7 = [(MPCModelStorePlaybackItemsRequestAccumulator *)self initWithRequest:v5 serverObjectDatabase:v6];

  return v7;
}

@end