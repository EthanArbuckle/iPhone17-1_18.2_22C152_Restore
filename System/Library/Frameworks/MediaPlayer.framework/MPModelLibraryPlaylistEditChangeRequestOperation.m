@interface MPModelLibraryPlaylistEditChangeRequestOperation
+ (id)requiredPlaylistEntryProperties;
- (BOOL)_isCloudLibraryEnabled;
- (MPModelLibraryPlaylistEditChangeRequest)request;
- (id)_collaborationTrackEdits;
- (id)_updatedPlaylistProperties;
- (id)completeResponseHandler;
- (id)localPersistenceResponseHandler;
- (void)_loadUpdatedTrackListWithCompletion:(id)a3;
- (void)execute;
- (void)setCompleteResponseHandler:(id)a3;
- (void)setLocalPersistenceResponseHandler:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation MPModelLibraryPlaylistEditChangeRequestOperation

+ (id)requiredPlaylistEntryProperties
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v7 = @"MPModelRelationshipPlaylistEntrySong";
  v3 = +[MPPropertySet emptyPropertySet];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [(MPPropertySet *)v2 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completeResponseHandler, 0);
  objc_storeStrong(&self->_localPersistenceResponseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setCompleteResponseHandler:(id)a3
{
}

- (id)completeResponseHandler
{
  return self->_completeResponseHandler;
}

- (void)setLocalPersistenceResponseHandler:(id)a3
{
}

- (id)localPersistenceResponseHandler
{
  return self->_localPersistenceResponseHandler;
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryPlaylistEditChangeRequest)request
{
  return self->_request;
}

- (id)_collaborationTrackEdits
{
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self request];
  v6 = [v5 trackListChanges];
  v7 = v6;
  if (v6 && [v6 hasChanges])
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = objc_msgSend(v5, "playlistEntries", v8);
    v18 = [v9 allItems];

    v10 = [v7 insertedIndexes];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke;
    v31[3] = &unk_1E57F4170;
    id v11 = v18;
    SEL v35 = a2;
    id v32 = v11;
    v33 = self;
    id v12 = v8;
    id v34 = v12;
    [v10 enumerateIndexesUsingBlock:v31];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_2;
    v26[3] = &unk_1E57F4198;
    id v13 = v11;
    SEL v30 = a2;
    id v27 = v13;
    v28 = self;
    id v14 = v12;
    id v29 = v14;
    [v7 enumerateMovesUsingBlock:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_4;
    v24[3] = &unk_1E57F41E0;
    id v15 = v4;
    id v25 = v15;
    objc_msgSend(v14, "msv_enumerateKeysAndObjectsOrderedByKeyComparator:usingBlock:", &__block_literal_global_67, v24);
    v16 = [v7 deletedIndexes];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_5;
    v19[3] = &unk_1E57F4170;
    SEL v23 = a2;
    id v20 = v5;
    v21 = self;
    id v22 = v15;
    [v16 enumerateIndexesUsingBlock:v19];
  }

  return v4;
}

void __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke(uint64_t a1, uint64_t a2)
{
  id v18 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  v4 = [v18 song];
  v5 = [v4 identifiers];

  if (!v18)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"MPModelLibraryPlaylistEditChangeRequestOperation.mm", 388, @"No playlist entry at index %lu", a2);
  }
  v6 = [v5 universalStore];
  uint64_t v7 = [v6 subscriptionAdamID];

  if (!v7)
  {
    v8 = [v5 universalStore];
    uint64_t v7 = [v8 adamID];
  }
  v9 = [v18 universalIdentifier];
  v10 = [v18 positionUniversalIdentifier];
  if (a2)
  {
    id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2 - 1];
    id v12 = (void *)MEMORY[0x1E4FB85D0];
    id v13 = [v11 positionUniversalIdentifier];
    id v14 = [v12 paramsForAddingTrackWithAdamID:v7 itemUUID:v9 itemPositionUUID:v10 afterReferencePositionUUD:v13];
  }
  else
  {
    id v14 = [MEMORY[0x1E4FB85D0] paramsForAddingTrackWithAdamID:v7 itemUUID:v9 itemPositionUUID:v10 atPosition:1];
  }
  id v15 = *(void **)(a1 + 48);
  v16 = [NSNumber numberWithUnsignedInteger:a2];
  [v15 setObject:v14 forKey:v16];
}

void __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  id v15 = v5;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"MPModelLibraryPlaylistEditChangeRequestOperation.mm", 411, @"No playlist entry at index %lu", a3);

    v5 = 0;
  }
  v6 = [v5 universalIdentifier];
  uint64_t v7 = [v15 positionUniversalIdentifier];
  if (a3)
  {
    v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1];
    v9 = (void *)MEMORY[0x1E4FB85D0];
    v10 = [v8 positionUniversalIdentifier];
    id v11 = [v9 paramsForMovingTrackWithItemUUID:v6 withNewItemPositionUUID:v7 afterReferencePositionUUD:v10];
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB85D0] paramsForMovingTrackWithItemUUID:v6 withNewItemPositionUUID:v7 toPosition:1];
  }
  id v12 = *(void **)(a1 + 48);
  id v13 = [NSNumber numberWithInteger:a3];
  [v12 setObject:v11 forKey:v13];
}

uint64_t __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_5(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) deletedEntryUUIDs];
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v9 = [v4 objectForKey:v5];

  if (!v9)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"MPModelLibraryPlaylistEditChangeRequestOperation.mm", 436, @"No uuid for deleted entry at position %lu", a2);
  }
  v6 = *(void **)(a1 + 48);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB85D0], "paramsForRemovingTrackWithItemUUID:");
  [v6 addObject:v7];
}

uint64_t __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_loadUpdatedTrackListWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self request];
  v6 = [v5 playlistEntries];
  uint64_t v7 = [v5 mediaLibrary];
  if (v6)
  {
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__32102;
    v39[4] = __Block_byref_object_dispose__32103;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "totalItemCount"));
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x4812000000;
    v35[3] = __Block_byref_object_copy__47;
    v35[4] = __Block_byref_object_dispose__48;
    v35[5] = &unk_1956C748F;
    v37 = 0;
    uint64_t v38 = 0;
    v36 = 0;
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x4812000000;
    id v29 = __Block_byref_object_copy__49;
    SEL v30 = __Block_byref_object_dispose__50;
    v31 = &unk_1956C748F;
    v33 = 0;
    uint64_t v34 = 0;
    id v32 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke;
    v21[3] = &unk_1E57F40F8;
    id v22 = v6;
    SEL v23 = v35;
    v24 = &v26;
    id v25 = v39;
    [v22 enumerateItemIdentifiersUsingBlock:v21];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke_2;
    v15[3] = &unk_1E57F4120;
    v19 = v35;
    id v10 = v9;
    id v16 = v10;
    id v11 = v8;
    id v17 = v11;
    id v18 = v4;
    id v20 = v39;
    uint64_t v12 = MEMORY[0x19971E0F0](v15);
    id v13 = (void *)v12;
    if (v27[7] != v27[6])
    {
      id v14 = (mlcore *)MEMORY[0x19971BEF0]();
      mlcore::PlaylistItemPropertyPersistentID(v14);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
    }
    (*(void (**)(uint64_t))(v12 + 16))(v12);

    _Block_object_dispose(&v26, 8);
    if (v32)
    {
      v33 = v32;
      operator delete(v32);
    }
    _Block_object_dispose(v35, 8);
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }

    _Block_object_dispose(v39, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v58 = a2;
  id v5 = a3;
  v6 = [v5 library];
  uint64_t v7 = [v6 persistentID];

  if (v7)
  {
    id v8 = *(void **)(*(void *)(a1 + 40) + 8);
    id v10 = (char *)v8[7];
    unint64_t v9 = v8[8];
    if ((unint64_t)v10 >= v9)
    {
      v21 = (char *)v8[6];
      uint64_t v22 = (v10 - v21) >> 4;
      unint64_t v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) >> 60) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v24 = v9 - (void)v21;
      if (v24 >> 3 > v23) {
        unint64_t v23 = v24 >> 3;
      }
      BOOL v25 = (unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0;
      unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
      if (!v25) {
        unint64_t v26 = v23;
      }
      if (v26)
      {
        unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v26);
        v21 = (char *)v8[6];
        id v10 = (char *)v8[7];
      }
      else
      {
        uint64_t v27 = 0;
      }
      unint64_t v28 = v26 + 16 * v22;
      unint64_t v29 = v26 + 16 * v27;
      *(unsigned char *)unint64_t v28 = 0;
      *(void *)(v28 + 8) = v7;
      id v11 = (void *)(v28 + 16);
      if (v10 != v21)
      {
        do
        {
          *(_OWORD *)(v28 - 16) = *((_OWORD *)v10 - 1);
          v28 -= 16;
          v10 -= 16;
        }
        while (v10 != v21);
        v21 = (char *)v8[6];
      }
      v8[6] = v28;
      v8[7] = v11;
      v8[8] = v29;
      if (v21) {
        operator delete(v21);
      }
    }
    else
    {
      char *v10 = 0;
      *((void *)v10 + 1) = v7;
      id v11 = v10 + 16;
    }
    v8[7] = v11;
    SEL v30 = *(void **)(*(void *)(a1 + 48) + 8);
    id v32 = (uint64_t *)v30[7];
    unint64_t v31 = v30[8];
    if ((unint64_t)v32 >= v31)
    {
      uint64_t v34 = (uint64_t *)v30[6];
      uint64_t v35 = v32 - v34;
      unint64_t v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v37 = v31 - (void)v34;
      if (v37 >> 2 > v36) {
        unint64_t v36 = v37 >> 2;
      }
      BOOL v25 = (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v25) {
        unint64_t v38 = v36;
      }
      if (v38)
      {
        unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v38);
        uint64_t v34 = (uint64_t *)v30[6];
        id v32 = (uint64_t *)v30[7];
      }
      else
      {
        uint64_t v39 = 0;
      }
      id v40 = (uint64_t *)(v38 + 8 * v35);
      unint64_t v41 = v38 + 8 * v39;
      *id v40 = v7;
      v33 = v40 + 1;
      while (v32 != v34)
      {
        uint64_t v42 = *--v32;
        *--id v40 = v42;
      }
      v30[6] = v40;
      v30[7] = v33;
      v30[8] = v41;
      if (v34) {
        operator delete(v34);
      }
    }
    else
    {
      *id v32 = v7;
      v33 = v32 + 1;
    }
    v30[7] = v33;
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 32) itemAtIndexPath:v58];
    id v13 = [v12 song];
    id v14 = [v13 identifiers];
    id v15 = [v14 library];
    uint64_t v16 = [v15 persistentID];

    if (v16)
    {
      id v17 = *(void **)(*(void *)(a1 + 40) + 8);
      v19 = (char *)v17[7];
      unint64_t v18 = v17[8];
      if ((unint64_t)v19 >= v18)
      {
        v43 = (char *)v17[6];
        uint64_t v44 = (v19 - v43) >> 4;
        unint64_t v45 = v44 + 1;
        if ((unint64_t)(v44 + 1) >> 60) {
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v46 = v18 - (void)v43;
        if (v46 >> 3 > v45) {
          unint64_t v45 = v46 >> 3;
        }
        BOOL v25 = (unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0;
        unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
        if (!v25) {
          unint64_t v47 = v45;
        }
        if (v47)
        {
          unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v47);
          v43 = (char *)v17[6];
          v19 = (char *)v17[7];
        }
        else
        {
          uint64_t v48 = 0;
        }
        unint64_t v49 = v47 + 16 * v44;
        unint64_t v50 = v47 + 16 * v48;
        *(unsigned char *)unint64_t v49 = 1;
        *(void *)(v49 + 8) = v16;
        id v20 = (void *)(v49 + 16);
        if (v19 != v43)
        {
          do
          {
            *(_OWORD *)(v49 - 16) = *((_OWORD *)v19 - 1);
            v49 -= 16;
            v19 -= 16;
          }
          while (v19 != v43);
          v43 = (char *)v17[6];
        }
        v17[6] = v49;
        v17[7] = v20;
        v17[8] = v50;
        if (v43) {
          operator delete(v43);
        }
      }
      else
      {
        char *v19 = 1;
        *((void *)v19 + 1) = v16;
        id v20 = v19 + 16;
      }
      v17[7] = v20;
    }
  }
  v51 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v52 = [*(id *)(a1 + 32) itemAtIndexPath:v58];
  if ([v52 hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryUniversalIdentifier"])
  {
    v53 = [v52 universalIdentifier];
    [v51 setObject:v53 forKey:@"entryUniversalIdentifier"];
  }
  if ([v52 hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryPositionUniversalIdentifier"])
  {
    v54 = [v52 positionUniversalIdentifier];
    [v51 setObject:v54 forKey:@"entryPositionUniversalIdentifier"];
  }
  uint64_t v55 = [v58 indexAtPosition:1];
  v56 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v57 = [NSNumber numberWithUnsignedInteger:v55];
  [v56 setObject:v51 forKeyedSubscript:v57];
}

uint64_t __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(a1[7] + 8);
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 56);
  if (v3 != v4)
  {
    while (!*(unsigned char *)v3)
    {
      v6 = (void *)a1[4];
      uint64_t v7 = [NSNumber numberWithLongLong:*(void *)(v3 + 8)];
      id v8 = [v6 objectForKey:v7];
      uint64_t v5 = [v8 longLongValue];

      if (v5) {
        goto LABEL_7;
      }
LABEL_8:
      v3 += 16;
      if (v3 == v4) {
        goto LABEL_9;
      }
    }
    if (*(unsigned char *)v3 != 1) {
      goto LABEL_8;
    }
    uint64_t v5 = *(void *)(v3 + 8);
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    unint64_t v9 = (void *)a1[5];
    id v10 = [NSNumber numberWithLongLong:v5];
    [v9 addObject:v10];

    goto LABEL_8;
  }
LABEL_9:
  id v11 = *(uint64_t (**)(void))(a1[6] + 16);

  return v11();
}

void __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v7[0] = &unk_1EE672B88;
    v7[1] = a1 + 32;
    v7[3] = v7;
    mlcore::PropertiesQueryResult::enumerateResults();
    std::__function::__value_func<void ()(mlcore::PropertyCache const&,BOOL &)>::~__value_func[abi:ne180100](v7);
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (id)_updatedPlaylistProperties
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self request];
  int v5 = [v4 shouldCreatePlaylist];
  v6 = [v4 playlistName];
  if (v6) {
    [v3 setObject:v6 forKey:@"name"];
  }
  LODWORD(v25) = v5;
  unint64_t v29 = objc_msgSend(v4, "parentPlaylist", v25);
  if (v29)
  {
    uint64_t v7 = NSNumber;
    id v8 = [v29 identifiers];
    unint64_t v9 = [v8 library];
    id v10 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v9, "persistentID"));

    [v3 setObject:v10 forKey:@"parentPersistentID"];
  }
  if (v6) {
    [v3 setObject:v6 forKey:@"name"];
  }
  uint64_t v11 = [v4 playlistDescription];
  unint64_t v28 = (void *)v11;
  if (v11) {
    [v3 setObject:v11 forKey:@"descriptionInfo"];
  }
  uint64_t v12 = [v4 isPublicPlaylist];
  uint64_t v27 = (void *)v12;
  if (v12) {
    [v3 setObject:v12 forKey:@"cloudIsPublic"];
  }
  id v13 = [v4 isVisiblePlaylist];
  if (v13) {
    [v3 setObject:v13 forKey:@"cloudIsVisible"];
  }
  id v14 = [v4 isCuratorPlaylist];
  if (v14) {
    [v3 setObject:v14 forKey:@"cloudIsCuratorPlaylist"];
  }
  id v15 = [v4 isOwner];
  if (v15) {
    [v3 setObject:v15 forKey:@"iO"];
  }
  uint64_t v16 = [v4 authorStoreIdentifier];
  id v17 = v16;
  if (v16)
  {
    unint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
    [v3 setObject:v18 forKey:@"cloudAuthorStoreID"];
  }
  v19 = [v4 coverArtworkRecipe];
  uint64_t v20 = [v4 playlistEntries];
  v21 = (void *)v20;
  if (v26)
  {
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
    [v3 setObject:v22 forKey:@"dateCreated"];
LABEL_27:

    goto LABEL_28;
  }
  if (v6 || v28 || v20 || v19 || [v4 didSetPlaylistUserImage])
  {
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
    [v3 setObject:v22 forKey:@"dateModified"];
    goto LABEL_27;
  }
LABEL_28:
  unint64_t v23 = [v4 playlistUserImage];
  if (v23)
  {

    v19 = @"{\"version\":\"0.0\"}";
  }
  else if (!v19)
  {
    goto LABEL_32;
  }
  [v3 setObject:v19 forKey:@"coverArtworkRecipe"];
LABEL_32:

  return v3;
}

- (BOOL)_isCloudLibraryEnabled
{
  uint64_t v2 = [(MPAsyncOperation *)self userIdentity];
  id v3 = +[MPCloudController controllerWithUserIdentity:v2];
  char v4 = [v3 isCloudLibraryEnabled];

  return v4;
}

- (void)execute
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self request];
  char v4 = [v3 playlist];
  int v5 = [v3 mediaLibrary];
  char v6 = [v3 shouldCreatePlaylist];
  if ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsCollaborative"]) {
    char v7 = [v4 isCollaborative];
  }
  else {
    char v7 = 0;
  }
  uint64_t v8 = [v3 coverArtworkRecipe];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__32102;
  v22[4] = __Block_byref_object_dispose__32103;
  id v23 = 0;
  unint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unint64_t v38 = self;
    __int16 v39 = 2114;
    id v40 = v4;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation with playlist %{public}@", buf, 0x16u);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke;
  v36[3] = &unk_1E57F3FD8;
  v36[4] = self;
  uint64_t v10 = MEMORY[0x19971E0F0](v36);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3;
  v35[3] = &unk_1E57F3FD8;
  v35[4] = self;
  v19 = (void *)MEMORY[0x19971E0F0](v35);
  uint64_t v20 = (void *)v10;
  v21 = (void *)v8;
  uint64_t v11 = [(MPModelLibraryPlaylistEditChangeRequestOperation *)self _updatedPlaylistProperties];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_5;
  v24[3] = &unk_1E57F40A0;
  char v33 = v6;
  void v24[4] = self;
  id v25 = v11;
  id v18 = v3;
  id v26 = v18;
  id v12 = v5;
  id v27 = v12;
  id v32 = v22;
  id v13 = v4;
  id v28 = v13;
  id v14 = v20;
  id v30 = v14;
  id v15 = v19;
  id v31 = v15;
  id v16 = v21;
  id v29 = v16;
  char v34 = v7;
  id v17 = v11;
  -[MPModelLibraryPlaylistEditChangeRequestOperation _loadUpdatedTrackListWithCompletion:](self, "_loadUpdatedTrackListWithCompletion:", v24, v3);

  _Block_object_dispose(v22, 8);
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = [*(id *)(a1 + 32) localPersistenceResponseHandler];
  if (v5)
  {
    char v6 = dispatch_get_global_queue(33, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2;
    v7[3] = &unk_1E57F9140;
    id v9 = v5;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(a1 + 32) completeResponseHandler];
  if (v7)
  {
    id v8 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4;
    block[3] = &unk_1E57F8408;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  int v8 = *(unsigned __int8 *)(a1 + 104);
  id v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = [v5 count];
      uint64_t v26 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v24;
      __int16 v60 = 2048;
      uint64_t v61 = v25;
      __int16 v62 = 2114;
      uint64_t v63 = v26;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating existing playlist with %lu tracks and properties: '%{public}@", buf, 0x20u);
    }

    id v27 = [*(id *)(a1 + 64) identifiers];
    id v28 = [v27 library];
    uint64_t v29 = [v28 persistentID];

    if (v29)
    {
      id v30 = [*(id *)(a1 + 56) playlistWithPersistentID:v29];
      id v15 = v30;
      if (v30)
      {
        id v23 = [v30 valueForProperty:@"coverArtworkRecipe"];
        uint64_t v31 = *(void *)(a1 + 40);
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_17;
        v53[3] = &unk_1E57FA170;
        v54 = v7;
        [v15 setValuesForProperties:v31 trackList:v5 andEntryProperties:v6 withCompletionBlock:v53];

LABEL_14:
        uint64_t v32 = *(void *)(*(void *)(a1 + 96) + 8);
        id v33 = *(id *)(a1 + 64);
        id v14 = *(void **)(v32 + 40);
        *(void *)(v32 + 40) = v33;
        goto LABEL_15;
      }
    }
    else
    {
      id v15 = 0;
    }
    id v23 = &stru_1EE680640;
    goto LABEL_14;
  }
  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = [v5 count];
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v59 = v11;
    __int16 v60 = 2048;
    uint64_t v61 = v12;
    __int16 v62 = 2114;
    uint64_t v63 = v13;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating new playlist with %lu tracks and properties: '%{public}@", buf, 0x20u);
  }

  id v14 = [*(id *)(a1 + 48) playlistName];
  id v15 = [*(id *)(a1 + 56) addPlaylistWithName:v14 properties:*(void *)(a1 + 40) trackList:v5 playlistEntryProperties:v6];
  if (v15)
  {
    id v16 = [MPModelPlaylist alloc];
    id v17 = [MPIdentifierSet alloc];
    id v18 = +[MPModelPlaylistKind identityKind];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_11;
    v55[3] = &unk_1E57F95D0;
    id v56 = *(id *)(a1 + 56);
    id v57 = v15;
    v19 = [(MPIdentifierSet *)v17 initWithSource:@"LibraryPlaylistEdit" modelKind:v18 block:v55];
    uint64_t v20 = [(MPModelObject *)v16 initWithIdentifiers:v19 block:&__block_literal_global_32130];
    uint64_t v21 = *(void *)(*(void *)(a1 + 96) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  dispatch_group_leave(v7);
  id v23 = &stru_1EE680640;
LABEL_15:

  char v34 = dispatch_get_global_queue(33, 0);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_19;
  v40[3] = &unk_1E57F4078;
  uint64_t v35 = *(void *)(a1 + 32);
  id v41 = v15;
  uint64_t v42 = v35;
  id v48 = *(id *)(a1 + 80);
  id v49 = *(id *)(a1 + 88);
  char v51 = *(unsigned char *)(a1 + 104);
  id v43 = *(id *)(a1 + 72);
  uint64_t v44 = v23;
  id v36 = *(id *)(a1 + 48);
  uint64_t v37 = *(void *)(a1 + 96);
  id v45 = v36;
  uint64_t v50 = v37;
  id v46 = *(id *)(a1 + 40);
  char v52 = *(unsigned char *)(a1 + 105);
  id v47 = *(id *)(a1 + 64);
  unint64_t v38 = v23;
  id v39 = v15;
  dispatch_group_notify(v7, v34, v40);
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_12;
  v5[3] = &unk_1E57F96A0;
  id v6 = *(id *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v5];
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_17(uint64_t a1)
{
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_19(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (!*(unsigned char *)(a1 + 112) && *(void *)(a1 + 48))
    {
      id v16 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v17;
        __int16 v43 = 2114;
        uint64_t v44 = v18;
        _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating cover artwork recipe: '%{public}@", buf, 0x16u);
      }

      if (([*(id *)(a1 + 48) isEqualToString:*(void *)(a1 + 56)] & 1) == 0)
      {
        id v19 = *(id *)(a1 + 32);
        uint64_t v20 = *(void **)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 48);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_24;
        v38[3] = &unk_1E57F4000;
        id v39 = v19;
        id v40 = *(id *)(a1 + 64);
        id v22 = v19;
        [v20 setValue:v21 forProperty:@"coverArtworkRecipe" withCompletionBlock:v38];
      }
    }
    if ([*(id *)(a1 + 64) didSetPlaylistUserImage])
    {
      uint64_t v2 = *(void **)(a1 + 32);
      id v3 = [*(id *)(a1 + 64) playlistUserImage];
      [v2 setUserSelectedArtworkImage:v3];
    }
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    if (![*(id *)(a1 + 40) _isCloudLibraryEnabled])
    {
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
      return;
    }
    id v4 = +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:*(void *)(a1 + 32)];
    if (![*(id *)(a1 + 72) count] && !v4) {
      goto LABEL_23;
    }
    if (*(unsigned char *)(a1 + 112))
    {
      id v5 = [*(id *)(a1 + 40) userIdentity];
      id v6 = +[MPCloudController controllerWithUserIdentity:v5];
      uint64_t v7 = [*(id *)(a1 + 32) persistentID];
      uint64_t v8 = *(void *)(a1 + 72);
      id v9 = v37;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_27;
      v37[3] = &unk_1E57F4028;
      id v10 = *(id *)(a1 + 96);
      uint64_t v11 = *(void *)(a1 + 104);
      v37[4] = v10;
      v37[5] = v11;
      [v6 createPlaylistWithPersistentID:v7 properties:v8 trackList:v4 completionHandler:v37];
    }
    else
    {
      if (*(unsigned char *)(a1 + 113))
      {
        id v23 = [*(id *)(a1 + 80) identifiers];
        uint64_t v24 = [v23 library];
        uint64_t v25 = [v24 persistentID];

        id v5 = [*(id *)(a1 + 40) userIdentity];
        id v6 = +[MPCloudController controllerWithUserIdentity:v5];
        uint64_t v26 = *(void *)(a1 + 72);
        id v27 = [*(id *)(a1 + 40) _collaborationTrackEdits];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3_29;
        v35[3] = &unk_1E57F4050;
        id v28 = *(id *)(a1 + 96);
        uint64_t v29 = *(void *)(a1 + 104);
        v36[0] = v28;
        v36[1] = v29;
        [v6 editCollaborationWithPersistentID:v25 properties:v26 trackEdits:v27 completion:v35];

        uint64_t v12 = (id *)v36;
        goto LABEL_22;
      }
      id v5 = [*(id *)(a1 + 40) userIdentity];
      id v6 = +[MPCloudController controllerWithUserIdentity:v5];
      uint64_t v30 = *(void *)(a1 + 72);
      uint64_t v31 = [*(id *)(a1 + 32) persistentID];
      id v9 = v34;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4_31;
      v34[3] = &unk_1E57F4050;
      id v32 = *(id *)(a1 + 96);
      uint64_t v33 = *(void *)(a1 + 104);
      v34[4] = v32;
      v34[5] = v33;
      [v6 setPlaylistProperties:v30 trackList:v4 forPlaylistWithPersistentID:v31 completionHandler:v34];
    }
    uint64_t v12 = (id *)(v9 + 4);
LABEL_22:

LABEL_23:
    return;
  }
  uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v42 = v14;
    _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create playlist", buf, 0xCu);
  }

  id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPModelLibraryPlaylistEditChangeRequestOperationErrorDomain" code:-10004 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_24(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) removeArtworkWithSourceType:200];
    [*(id *)(a1 + 32) removeArtworkWithSourceType:600];
    id v3 = [*(id *)(a1 + 40) playlistUserImage];

    if (!v3)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 removeArtworkWithSourceType:100];
    }
  }
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

@end