@interface MPModelPlaylistEntry
+ (BOOL)supportsKeepLocalStatusObservation;
+ (BOOL)supportsLibraryAddStatusObservation;
+ (BOOL)supportsLibraryRemoval;
+ (id)___artworkCatalog_KEY;
+ (id)__movie_KEY;
+ (id)__playlist_KEY;
+ (id)__positionUniversalIdentifier_KEY;
+ (id)__position_KEY;
+ (id)__socialContributor_KEY;
+ (id)__song_KEY;
+ (id)__tvEpisode_KEY;
+ (id)__universalIdentifier_KEY;
+ (id)kindWithKinds:(id)a3;
+ (id)requiredKeepLocalStatusObservationProperties;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredLibraryRemovalProperties;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyPlaylistEntryPositionUniversalIdentifier__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistEntryPosition__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistEntryUniversalIdentifier__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistEntryMovie__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistEntryPlaylist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistEntrySocialContributor__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistEntrySong__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistEntryTVEpisode__MAPPING_MISSING__;
+ (void)___MPModelPropertyPlaylistEntryArtwork__MAPPING_MISSING__;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (id)anyObject;
- (id)humanDescription;
- (id)mediaItemPropertyValues;
- (id)newKeepLocalStatusObserverConfiguration;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)relativeModelObjectForStoreLibraryPersonalization;
- (int64_t)libraryRemovalSupportedOptions;
- (int64_t)type;
@end

@implementation MPModelPlaylistEntry

+ (id)__universalIdentifier_KEY
{
  return @"MPModelPropertyPlaylistEntryUniversalIdentifier";
}

+ (id)__tvEpisode_KEY
{
  return @"MPModelRelationshipPlaylistEntryTVEpisode";
}

+ (id)__song_KEY
{
  return @"MPModelRelationshipPlaylistEntrySong";
}

+ (id)__socialContributor_KEY
{
  return @"MPModelRelationshipPlaylistEntrySocialContributor";
}

+ (id)__position_KEY
{
  return @"MPModelPropertyPlaylistEntryPosition";
}

+ (id)__positionUniversalIdentifier_KEY
{
  return @"MPModelPropertyPlaylistEntryPositionUniversalIdentifier";
}

+ (id)__playlist_KEY
{
  return @"MPModelRelationshipPlaylistEntryPlaylist";
}

+ (id)__movie_KEY
{
  return @"MPModelRelationshipPlaylistEntryMovie";
}

+ (id)___artworkCatalog_KEY
{
  return @"_MPModelPropertyPlaylistEntryArtwork";
}

+ (id)kindWithKinds:(id)a3
{
  return +[MPModelPlaylistEntryKind kindWithKinds:a3];
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v9[0] = @"MPModelRelationshipPlaylistEntrySong";
  v3 = +[MPModelSong requiredStoreLibraryPersonalizationProperties];
  v10[0] = v3;
  v9[1] = @"MPModelRelationshipPlaylistEntryMovie";
  v4 = +[MPModelMovie requiredStoreLibraryPersonalizationProperties];
  v10[1] = v4;
  v9[2] = @"MPModelRelationshipPlaylistEntryTVEpisode";
  v5 = +[MPModelTVEpisode requiredStoreLibraryPersonalizationProperties];
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  v7 = [(MPPropertySet *)v2 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v6];

  return v7;
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v7 = @"MPModelRelationshipPlaylistEntrySong";
  v3 = +[MPModelSong requiredLibraryAddStatusObservationProperties];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [(MPPropertySet *)v2 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v4];

  return v5;
}

+ (id)requiredLibraryRemovalProperties
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v7 = @"MPModelRelationshipPlaylistEntrySong";
  v3 = +[MPModelSong requiredLibraryRemovalProperties];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [(MPPropertySet *)v2 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v4];

  return v5;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v7 = @"MPModelRelationshipPlaylistEntrySong";
  v3 = +[MPModelSong requiredKeepLocalStatusObservationProperties];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [(MPPropertySet *)v2 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v4];

  return v5;
}

- (id)mediaItemPropertyValues
{
  int64_t v3 = [(MPModelPlaylistEntry *)self type];
  switch(v3)
  {
    case 3:
      v4 = [(MPModelPlaylistEntry *)self movie];
      goto LABEL_7;
    case 2:
      v4 = [(MPModelPlaylistEntry *)self tvEpisode];
      goto LABEL_7;
    case 1:
      v4 = [(MPModelPlaylistEntry *)self song];
LABEL_7:
      v5 = v4;
      v6 = [v4 mediaItemPropertyValues];

      goto LABEL_9;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  v2 = [(MPModelPlaylistEntry *)self song];
  uint64_t v3 = [v2 libraryAddStatusObserverConfiguration];

  return (MPLibraryAddStatusObserverConfiguration)v3;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  v2 = [(MPModelPlaylistEntry *)self song];
  int64_t v3 = [v2 libraryRemovalSupportedOptions];

  return v3;
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  v2 = [(MPModelPlaylistEntry *)self song];
  int64_t v3 = (void *)[v2 newKeepLocalStatusObserverConfiguration];

  return v3;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (int64_t)genericObjectType
{
  return 5;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4 = a3;
  v5 = [(MPModelObject *)self identifiers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  void v9[3] = &unk_1E57F61C0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = [(MPModelObject *)self copyWithIdentifiers:v5 block:v9];

  return v7;
}

void __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke_2;
  v6[3] = &unk_1E57FA038;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  +[MPModelObject performWithoutEnforcement:v6];
}

void __119__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) song];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) song];
    id v4 = [v9 objectWithStoreLibraryPersonalizationRelativeModelObject:*(void *)(a1 + 48)];
    [v3 setSong:v4];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) movie];

    if (v5)
    {
      id v6 = *(void **)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) movie];
      id v4 = [v9 objectWithStoreLibraryPersonalizationRelativeModelObject:*(void *)(a1 + 48)];
      [v6 setMovie:v4];
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) tvEpisode];

      if (!v7) {
        return;
      }
      id v8 = *(void **)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) tvEpisode];
      id v4 = [v9 objectWithStoreLibraryPersonalizationRelativeModelObject:*(void *)(a1 + 48)];
      [v8 setTvEpisode:v4];
    }
  }
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__167;
  id v9 = __Block_byref_object_dispose__168;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __111__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__relativeModelObjectForStoreLibraryPersonalization__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  v2 = [(id)v6[5] relativeModelObjectForStoreLibraryPersonalization];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __111__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__relativeModelObjectForStoreLibraryPersonalization__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) song];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) movie];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v8 = [*(id *)(a1 + 32) tvEpisode];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__167;
  v15 = __Block_byref_object_dispose__168;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __107__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__personalizationScopedPropertiesForProperties___block_invoke;
  v8[3] = &unk_1E57F9F48;
  id v9 = v4;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  +[MPModelObject performWithoutEnforcement:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __107__MPModelPlaylistEntry_MPStoreLibraryPersonalizingAdditions__personalizationScopedPropertiesForProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) song];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v13 = [v3 song];
    id v4 = [*(id *)(a1 + 40) relationships];
    id v5 = [v4 objectForKey:@"MPModelRelationshipPlaylistEntrySong"];
    id v6 = v5;
    if (!v5)
    {
      id v6 = +[MPPropertySet emptyPropertySet];
    }
  }
  else
  {
    uint64_t v7 = [v3 movie];

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      id v13 = [v8 movie];
      id v4 = [*(id *)(a1 + 40) relationships];
      id v5 = [v4 objectForKey:@"MPModelRelationshipPlaylistEntryMovie"];
      id v6 = v5;
      if (!v5)
      {
        id v6 = +[MPPropertySet emptyPropertySet];
      }
    }
    else
    {
      id v9 = [v8 tvEpisode];

      if (!v9) {
        return;
      }
      id v13 = [*(id *)(a1 + 32) tvEpisode];
      id v4 = [*(id *)(a1 + 40) relationships];
      id v5 = [v4 objectForKey:@"MPModelRelationshipPlaylistEntryTVEpisode"];
      id v6 = v5;
      if (!v5)
      {
        id v6 = +[MPPropertySet emptyPropertySet];
      }
    }
  }
  uint64_t v10 = [v13 personalizationScopedPropertiesForProperties:v6];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (!v5)
  {

    id v5 = 0;
  }
}

- (int64_t)type
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__MPModelPlaylistEntry_type__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __28__MPModelPlaylistEntry_type__block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) song];

  if (v2)
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) tvEpisode];

    if (v4)
    {
      uint64_t v3 = 2;
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 32) movie];

      if (!v5) {
        return;
      }
      uint64_t v3 = 3;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (id)anyObject
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__46690;
  id v9 = __Block_byref_object_dispose__46691;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__MPModelPlaylistEntry_anyObject__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __33__MPModelPlaylistEntry_anyObject__block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) song];
  id v8 = (id)v3;
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = (void *)v3;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) tvEpisode];
    v1 = (void *)v6;
    if (v6)
    {
      int v4 = 0;
      uint64_t v5 = (void *)v6;
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 32) movie];
      int v4 = 1;
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  if (v4) {

  }
  uint64_t v7 = v8;
  if (!v8)
  {

    uint64_t v7 = 0;
  }
}

- (id)humanDescription
{
  uint64_t v3 = NSString;
  int v4 = [(MPModelPlaylistEntry *)self anyObject];
  uint64_t v5 = [v4 humanDescription];
  uint64_t v6 = [(MPModelObject *)self identifiers];
  uint64_t v7 = [v6 humanDescription];
  id v8 = [v3 stringWithFormat:@"playlist entry %@+%@", v5, v7];

  return v8;
}

+ (void)___MPModelPropertyPlaylistEntryArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:86 description:@"Translator was missing mapping for _MPModelPropertyPlaylistEntryArtwork"];
}

+ (void)__MPModelRelationshipPlaylistEntrySocialContributor__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:84 description:@"Translator was missing mapping for MPModelRelationshipPlaylistEntrySocialContributor"];
}

+ (void)__MPModelRelationshipPlaylistEntryMovie__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:83 description:@"Translator was missing mapping for MPModelRelationshipPlaylistEntryMovie"];
}

+ (void)__MPModelRelationshipPlaylistEntryTVEpisode__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:82 description:@"Translator was missing mapping for MPModelRelationshipPlaylistEntryTVEpisode"];
}

+ (void)__MPModelRelationshipPlaylistEntrySong__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:81 description:@"Translator was missing mapping for MPModelRelationshipPlaylistEntrySong"];
}

+ (void)__MPModelRelationshipPlaylistEntryPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:80 description:@"Translator was missing mapping for MPModelRelationshipPlaylistEntryPlaylist"];
}

+ (void)__MPModelPropertyPlaylistEntryPositionUniversalIdentifier__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:79 description:@"Translator was missing mapping for MPModelPropertyPlaylistEntryPositionUniversalIdentifier"];
}

+ (void)__MPModelPropertyPlaylistEntryUniversalIdentifier__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:78 description:@"Translator was missing mapping for MPModelPropertyPlaylistEntryUniversalIdentifier"];
}

+ (void)__MPModelPropertyPlaylistEntryPosition__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntry.m" lineNumber:77 description:@"Translator was missing mapping for MPModelPropertyPlaylistEntryPosition"];
}

@end