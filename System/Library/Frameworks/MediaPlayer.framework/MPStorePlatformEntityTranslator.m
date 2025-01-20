@interface MPStorePlatformEntityTranslator
+ (id)translatorForKind:(id)a3;
+ (void)buildSchemaIfNeeded;
- (id)identifiersForPayload:(id)a3 context:(id)a4;
- (id)objectForPropertySet:(id)a3 payload:(id)a4 context:(id)a5;
- (id)prepareSource:(id)a3 context:(id)a4 properties:(id)a5;
- (void)mapIdentifierCreationKeyPaths:(id)a3 transformBlock:(id)a4;
- (void)mapPropertyKey:(id)a3 toPayloadKeyPath:(id)a4;
- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformer:(id)a5;
- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformerFunction:(void *)a5;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 payloadTransform:(id)a5;
@end

@implementation MPStorePlatformEntityTranslator

- (id)identifiersForPayload:(id)a3 context:(id)a4
{
  return -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)a3, (uint64_t)a4);
}

- (id)objectForPropertySet:(id)a3 payload:(id)a4 context:(id)a5
{
  return -[MPBaseEntityTranslator objectForPropertySet:source:context:](self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 payloadTransform:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[_MPStorePlatformEntityRelationshipTranslator alloc] initWithRelatedMPModelClass:a4 payloadTransformBlock:v8];

  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v9, v10);
}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformerFunction:(void *)a5
{
  id v8 = a3;
  id v9 = +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:a4 valueTransformFunction:a5];
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v9);
}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformer:(id)a5
{
  id v8 = a3;
  id v9 = +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:a4 valueTransformBlock:a5];
  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v9);
}

- (void)mapPropertyKey:(id)a3 toPayloadKeyPath:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v11 count:1];
  v10 = +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformFunction:](_MPStorePlatformEntityPropertyTranslator, "translatorForKeyPaths:valueTransformFunction:", v9, _MPKeyPathValueTransformFirstKeyPath, v11, v12);

  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v10);
}

- (void)mapIdentifierCreationKeyPaths:(id)a3 transformBlock:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke;
  v9[3] = &unk_1E57F6E60;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  id v8 = +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:a3 valueTransformBlock:v9];
  -[MPBaseEntityTranslator mapIdentifiersToPropertyTranslator:]((id *)&self->super.super.isa, v8);
}

MPIdentifierSet *__80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MPIdentifierSet alloc];
  id v8 = +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", [*(id *)(a1 + 32) MPModelClass]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2;
  v14[3] = &unk_1E57F6E38;
  id v9 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v9;
  id v15 = v5;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = [(MPIdentifierSet *)v7 initWithSource:@"StorePlatform" modelKind:v8 block:v14];

  return v12;
}

uint64_t __80__MPStorePlatformEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

- (id)prepareSource:(id)a3 context:(id)a4 properties:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v35.receiver = self;
  v35.super_class = (Class)MPStorePlatformEntityTranslator;
  id v9 = [(MPBaseEntityTranslator *)&v35 prepareSource:a3 context:a4 properties:v8];
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = -[MPBaseEntityTranslator propertyTranslatorForPropertyKey:]((id *)&self->super.super.isa, *(void **)(*((void *)&v31 + 1) + 8 * i));
        id v17 = [v16 sourceKeyPaths];
        [v10 addObjectsFromArray:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v13);
  }

  v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        v25 = objc_msgSend(v9, "valueForKeyPath:", v24, (void)v27);
        [v18 setObject:v25 forKeyedSubscript:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v21);
  }

  return v18;
}

+ (id)translatorForKind:(id)a3
{
  v9[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9[0] = @"song";
  v9[1] = @"musicVideo";
  v9[2] = @"uploadedAudio";
  v9[3] = @"uploadedVideo";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) != 0
    || ([v4 isEqualToString:@"playlist"] & 1) != 0
    || ([v4 isEqualToString:@"artist"] & 1) != 0
    || ([v4 isEqualToString:@"album"] & 1) != 0
    || ([v4 isEqualToString:@"radioStation"] & 1) != 0
    || ([v4 isEqualToString:@"tvEpisode"] & 1) != 0
    || ([v4 isEqualToString:@"tvSeason"] & 1) != 0
    || ([v4 isEqualToString:@"tvShow"] & 1) != 0
    || [v4 isEqualToString:@"movie"])
  {
    id v7 = [a1 translatorForMPModelClass:objc_opt_class()];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)buildSchemaIfNeeded
{
  if (buildSchemaIfNeeded_onceToken_43542 != -1) {
    dispatch_once(&buildSchemaIfNeeded_onceToken_43542, &__block_literal_global_43543);
  }
}

void __54__MPStorePlatformEntityTranslator_buildSchemaIfNeeded__block_invoke()
{
  v0 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  uint64_t v1 = MEMORY[0x1E4F1CBF0];
  [v0 mapIdentifierCreationKeyPaths:MEMORY[0x1E4F1CBF0] transformBlock:&__block_literal_global_44111];

  v2 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v2 mapIdentifierCreationKeyPaths:&unk_1EE6EE048 transformBlock:&__block_literal_global_20];
  [v2 mapPropertyKey:@"MPModelPropertySongTitle" toPayloadKeyPaths:&unk_1EE6EE060 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v2 mapPropertyKey:@"MPModelPropertySongDuration" toPayloadKeyPaths:&unk_1EE6EE078 valueTransformer:&__block_literal_global_43_44114];
  [v2 mapPropertyKey:@"_MPModelPropertySongTrackCount" toPayloadKeyPaths:&unk_1EE6EE090 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v2 mapPropertyKey:@"MPModelPropertySongTrackNumber" toPayloadKeyPath:@"trackNumber"];
  [v2 mapPropertyKey:@"MPModelPropertySongDiscNumber" toPayloadKeyPath:@"discNumber"];
  [v2 mapPropertyKey:@"MPModelPropertySongHasCredits" toPayloadKeyPath:@"hasCredits"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongGrouping"];
  [v2 mapPropertyKey:@"MPModelPropertySongExplicit" toPayloadKeyPaths:&unk_1EE6EE0A8 valueTransformerFunction:MPTranslatorUtilitiesTransformIsExplicit];
  [v2 mapPropertyKey:@"MPModelPropertySongArtistUploadedContent" toPayloadKeyPaths:&unk_1EE6EE0C0 valueTransformer:&__block_literal_global_79];
  [v2 mapPropertyKey:@"MPModelPropertySongHasVideo" toPayloadKeyPaths:&unk_1EE6EE0D8 valueTransformer:&__block_literal_global_90];
  [v2 mapPropertyKey:@"MPModelPropertySongArtwork" toPayloadKeyPaths:v1 valueTransformer:&__block_literal_global_95_44118];
  [v2 mapPropertyKey:@"MPModelPropertySongShouldShowComposer" toPayloadKeyPath:@"showComposer"];
  [v2 mapPropertyKey:@"MPModelPropertySongCopyrightText" toPayloadKeyPath:@"copyright"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongVolumeNormalization"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongLibraryAdded"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalEnableState"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalManagedStatus"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalManagedStatusReason"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalConstraints"];
  [v2 mapPropertyKey:@"MPModelPropertySongLibraryAddEligible" toPayloadKeyPaths:&unk_1EE6EE0F0 valueTransformer:&__block_literal_global_109_44121];
  [v2 mapPropertyKey:@"MPModelPropertySongClassicalWork" toPayloadKeyPath:@"workName"];
  [v2 mapPropertyKey:@"MPModelPropertySongClassicalMovement" toPayloadKeyPath:@"movementName"];
  [v2 mapPropertyKey:@"MPModelPropertySongClassicalMovementCount" toPayloadKeyPath:@"movementCount"];
  [v2 mapPropertyKey:@"MPModelPropertySongClassicalMovementNumber" toPayloadKeyPath:@"movementNumber"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongHasCloudSyncSource"];
  [v2 mapPropertyKey:@"MPModelPropertySongYear" toPayloadKeyPaths:&unk_1EE6EE108 valueTransformer:&__block_literal_global_132_44126];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongUserRating"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongCloudStatus"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongGaplessInfo"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongIsFavorite"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongIsDisliked"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongDateFavorited"];
  [v2 mapUnsupportedPropertyKey:@"MPModelPropertySongSupportsExtendedLyricsAttribute"];
  [v2 mapPropertyKey:@"MPModelPropertySongVolumeAdjustment" toPayloadKeyPaths:v1 valueTransformer:&__block_literal_global_134_44127];
  [v2 mapRelationshipKey:@"MPModelRelationshipSongAlbum" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_139];
  [v2 mapRelationshipKey:@"MPModelRelationshipSongArtist" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_164];
  [v2 mapRelationshipKey:@"MPModelRelationshipSongComposer" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_174_44128];
  [v2 mapRelationshipKey:@"MPModelRelationshipSongGenre" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_181_44129];
  [v2 mapUnsupportedRelationshipKey:@"MPModelRelationshipSongLocalFileAsset"];
  [v2 mapRelationshipKey:@"MPModelRelationshipSongLyrics" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_185_44130];
  [v2 mapRelationshipKey:@"MPModelRelationshipSongStoreAsset" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_195];
  [v2 mapRelationshipKey:@"MPModelRelationshipSongPlaybackPosition" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_199];

  v3 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v3 mapIdentifierCreationKeyPaths:&unk_1EE6EE120 transformBlock:&__block_literal_global_227_44132];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumTitle" toPayloadKeyPaths:&unk_1EE6EE138 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumTrackCount" toPayloadKeyPaths:&unk_1EE6EE150 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumMaximumItemTrackNumber" toPayloadKeyPath:@"@max.children.trackNumber"];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumDiscCount" toPayloadKeyPath:@"discCount"];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumHasCleanContent" toPayloadKeyPaths:&unk_1EE6EE168 valueTransformer:&__block_literal_global_244_44135];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumHasExplicitContent" toPayloadKeyPaths:&unk_1EE6EE180 valueTransformer:&__block_literal_global_252_44136];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumIsCompilation" toPayloadKeyPath:@"isCompilation"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsClassical"];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumReleaseDateComponents" toPayloadKeyPaths:&unk_1EE6EE198 valueTransformer:&__block_literal_global_263_44138];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumArtwork" toPayloadKeyPaths:v1 valueTransformer:&__block_literal_global_265_44139];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumLibraryAddEligible" toPayloadKeyPaths:&unk_1EE6EE1B0 valueTransformer:&__block_literal_global_276];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumYear" toPayloadKeyPaths:&unk_1EE6EE1C8 valueTransformer:&__block_literal_global_281_44141];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumVersionHash"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumLibraryAdded"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalEnableState"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalManagedStatus"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalManagedStatusReason"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalConstraints"];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumCopyrightText" toPayloadKeyPath:@"copyright"];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumPreorder" toPayloadKeyPath:@"isPreorder"];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumEditorNotes" toPayloadKeyPaths:&unk_1EE6EE1E0 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumShortEditorNotes" toPayloadKeyPaths:&unk_1EE6EE1F8 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumVolumeNormalization" toPayloadKeyPaths:v1 valueTransformer:&__block_literal_global_295];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumSongPopularity" toPayloadKeyPaths:&unk_1EE6EE210 valueTransformer:&__block_literal_global_300];
  [v3 mapPropertyKey:@"MPModelPropertyAlbumClassicalExperienceAvailable" toPayloadKeyPaths:&unk_1EE6EE228 valueTransformer:&__block_literal_global_308];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsFavorite"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsDisliked"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumDateFavorited"];
  [v3 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsStoreRedownloadable"];
  [v3 mapRelationshipKey:@"MPModelRelationshipAlbumArtist" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_310];
  [v3 mapRelationshipKey:@"MPModelRelationshipAlbumGenre" toModelClass:objc_opt_class() payloadTransform:&__block_literal_global_312];

  id v4 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v4 mapIdentifierCreationKeyPaths:&unk_1EE6EE240 transformBlock:&__block_literal_global_317];
  [v4 mapPropertyKey:@"MPModelPropertyArtistClassicalExperienceAvailable" toPayloadKeyPaths:&unk_1EE6EE258 valueTransformer:&__block_literal_global_324_44145];
  [v4 mapUnsupportedPropertyKey:@"MPModelPropertyArtistIsFavorite"];
  [v4 mapUnsupportedPropertyKey:@"MPModelPropertyArtistIsDisliked"];
  [v4 mapUnsupportedPropertyKey:@"MPModelPropertyArtistDateFavorited"];
  [v4 mapUnsupportedPropertyKey:@"MPModelPropertyArtistLibraryAdded"];
  [v4 mapPropertyKey:@"MPModelPropertyPlaylistName" toPayloadKeyPath:@"name"];

  id v5 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v5 mapIdentifierCreationKeyPaths:&unk_1EE6EE270 transformBlock:&__block_literal_global_333];
  [v5 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsFavorite"];
  [v5 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsDisliked"];
  [v5 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistDateFavorited"];
  [v5 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsFavoriteSongsPlaylist"];
  [v5 mapPropertyKey:@"MPModelPropertyPersonName" toPayloadKeyPath:@"name"];

  char v6 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v6 mapIdentifierCreationKeyPaths:&unk_1EE6EE288 transformBlock:&__block_literal_global_341];
  [v6 mapPropertyKey:@"MPModelPropertyTVEpisodeTitle" toPayloadKeyPath:@"name"];

  id v7 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v7 mapIdentifierCreationKeyPaths:&unk_1EE6EE2A0 transformBlock:&__block_literal_global_347_44148];
  [v7 mapPropertyKey:@"MPModelPropertyMovieTitle" toPayloadKeyPath:@"name"];

  id v8 = +[MPBaseEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v8 mapIdentifierCreationKeyPaths:&unk_1EE6EE2B8 transformBlock:&__block_literal_global_353_44149];
  [v8 mapPropertyKey:@"MPModelPropertyRadioStationName" toPayloadKeyPath:@"name"];
}

@end