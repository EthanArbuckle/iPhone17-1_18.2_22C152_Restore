@interface MPModelLibrarySearchSectionedCollectionDataSource
- (BOOL)hasMoreResultsForSectionAtIndex:(int64_t)a3;
- (MPModelLibrarySearchRequest)request;
- (MPModelLibrarySearchSectionedCollectionDataSource)initWithEntitiesQueryResultContainers:(id)a3 libraryObjectDatabase:(id)a4;
- (NSArray)resultContainers;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (int64_t)searchWeightForIndexPath:(id)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)setRequest:(id)a3;
@end

@implementation MPModelLibrarySearchSectionedCollectionDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_resultContainers, 0);

  objc_storeStrong((id *)&self->_lod, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibrarySearchRequest)request
{
  return self->_request;
}

- (NSArray)resultContainers
{
  return self->_resultContainers;
}

- (int64_t)searchWeightForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", [v4 section]);
  v6 = v5;
  if (v5)
  {
    [v5 entityQueryResult];
    v7 = v15;
  }
  else
  {
    v7 = 0;
    v16 = 0;
  }
  [v4 item];
  mlcore::EntityQueryResult::entityAtIndex(v7);
  v8 = (ModelPropertyBase *)mlcore::LocalizedSearchPropertyWeight((mlcore *)+[MPMediaLibrary logDatabaseAccess]);
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v9 = (int8x8_t *)mlcore::Entity::propertyCache(v13);
  v10 = MPMediaLibraryPropertyCacheValueForProperty(v8, v9);
  int64_t v11 = [v10 integerValue];

  if (v14)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }

  return v11;
}

- (BOOL)hasMoreResultsForSectionAtIndex:(int64_t)a3
{
  v5 = -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:");
  v6 = v5;
  if (v5)
  {
    [v5 entityQueryResult];
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  unint64_t v7 = -[MPModelLibrarySearchSectionedCollectionDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", a3, v10);
  unint64_t v8 = mlcore::EntityQueryResult::entityCount(v11);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }

  return v7 < v8;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", [v4 section]);
  v6 = v5;
  if (v5)
  {
    [v5 entityQueryResult];
    unint64_t v7 = v30;
  }
  else
  {
    unint64_t v7 = 0;
    v30 = 0;
    v32 = 0;
  }
  objc_msgSend(v4, "item", v30);
  uint64_t v8 = mlcore::EntityQueryResult::persistentIDAtIndex(v7);
  v9 = [v6 entityTranslationContext];
  v10 = [v9 mediaLibrary];
  int64_t v11 = [v10 uniqueIdentifier];

  v12 = [MPIdentifierSet alloc];
  v13 = [@"LibrarySearch-" stringByAppendingString:v11];
  v14 = [v6 scope];
  v15 = [v14 itemKind];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke;
  v35[3] = &unk_1E57F7AD0;
  id v16 = v11;
  id v36 = v16;
  uint64_t v37 = v8;
  v17 = [(MPIdentifierSet *)v12 initWithSource:v13 modelKind:v15 block:v35];

  [v4 item];
  mlcore::EntityQueryResult::idEntityAtIndex(v31);
  uint64_t v18 = (*(uint64_t (**)())(*(void *)v33 + 48))();
  if (MEMORY[0x19971D490]() == v18)
  {
    v20 = MPModelRelationshipGenericSong;
  }
  else if (MEMORY[0x19971D500]() == v18)
  {
    v20 = MPModelRelationshipGenericAlbum;
  }
  else if (MEMORY[0x19971D560]() == v18)
  {
    v20 = MPModelRelationshipGenericArtist;
  }
  else if (MEMORY[0x19971D610]() == v18)
  {
    v20 = MPModelRelationshipGenericPlaylist;
  }
  else if (MEMORY[0x19971BEF0]() == v18)
  {
    v20 = MPModelRelationshipGenericPlaylistEntry;
  }
  else if (MEMORY[0x19971D640]() == v18)
  {
    v20 = MPModelRelationshipGenericTVEpisode;
  }
  else if (MEMORY[0x19971D630]() == v18)
  {
    v20 = MPModelRelationshipGenericTVSeason;
  }
  else if (MEMORY[0x19971D5A0]() == v18)
  {
    v20 = MPModelRelationshipGenericTVShow;
  }
  else if (MEMORY[0x19971D530]() == v18)
  {
    v20 = MPModelRelationshipGenericMovie;
  }
  else if (MEMORY[0x19971D5D0]() == v18)
  {
    v20 = MPModelRelationshipGenericPodcast;
  }
  else if (MEMORY[0x19971BF50]() == v18)
  {
    v20 = MPModelRelationshipGenericPodcastEpisode;
  }
  else if (MEMORY[0x19971D5F0]() == v18)
  {
    v20 = MPModelRelationshipGenericComposer;
  }
  else
  {
    if (MEMORY[0x19971D510]() != v18)
    {
      v19 = 0;
      goto LABEL_32;
    }
    v20 = &MPModelRelationshipGenericGenre;
  }
  v19 = *v20;
LABEL_32:
  v21 = [MPPropertySet alloc];
  v38 = v19;
  v22 = +[MPPropertySet emptyPropertySet];
  v39[0] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v24 = [(MPPropertySet *)v21 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v23];

  uint64_t v25 = [(MPLibraryObjectDatabase *)self->_lod identifiersMatchingIdentifierSet:v17 propertySet:v24 options:0 error:0];
  v26 = (void *)v25;
  if (v25) {
    v27 = (void *)v25;
  }
  else {
    v27 = v17;
  }
  id v28 = v27;

  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }

  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }

  return v28;
}

uint64_t __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke_2;
  v4[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 setLibraryIdentifiersWithDatabaseID:v2 block:v4];
}

uint64_t __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", [v4 section]);
  v6 = v5;
  if (v5)
  {
    [v5 entityQueryResult];
    unint64_t v7 = v18;
  }
  else
  {
    unint64_t v7 = 0;
    uint64_t v18 = 0;
    v19 = 0;
  }
  objc_msgSend(v4, "item", v18);
  mlcore::EntityQueryResult::entityAtIndex(v7);
  +[MPMediaLibrary logDatabaseAccess];
  if (v20)
  {
    uint64_t v8 = [v6 scope];
    v9 = [v8 itemKind];
    v10 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", [v9 modelClass]);

    int64_t v11 = [v6 scope];
    v12 = [v11 itemProperties];
    uint64_t v13 = (*(uint64_t (**)())(*(void *)v20 + 48))();
    uint64_t v14 = mlcore::Entity::propertyCache(v20);
    v15 = [v6 entityTranslationContext];
    id v16 = [v10 objectForPropertySet:v12 entityClass:v13 propertyCache:v14 context:v15];
  }
  else
  {
    id v16 = 0;
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }

  return v16;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  id v4 = [(NSArray *)self->_resultContainers objectAtIndex:a3];
  v5 = v4;
  if (v4)
  {
    [v4 entityQueryResult];
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  if ([(MPModelLibrarySearchRequest *)self->_request maximumResultsPerScope] < 1
    || (unint64_t v6 = [(MPModelLibrarySearchRequest *)self->_request maximumResultsPerScope],
        v6 >= mlcore::EntityQueryResult::entityCount(v11)))
  {
    uint64_t v7 = mlcore::EntityQueryResult::entityCount(v11);
  }
  else
  {
    uint64_t v7 = [(MPModelLibrarySearchRequest *)self->_request maximumResultsPerScope];
  }
  unint64_t v8 = v7;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }

  return v8;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_resultContainers objectAtIndex:a3];
  id v4 = [v3 scope];

  return v4;
}

- (unint64_t)numberOfSections
{
  return [(NSArray *)self->_resultContainers count];
}

- (MPModelLibrarySearchSectionedCollectionDataSource)initWithEntitiesQueryResultContainers:(id)a3 libraryObjectDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelLibrarySearchSectionedCollectionDataSource;
  unint64_t v8 = [(MPModelLibrarySearchSectionedCollectionDataSource *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    resultContainers = v8->_resultContainers;
    v8->_resultContainers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_lod, a4);
  }

  return v8;
}

@end