@interface MPMediaKitEntityTranslator
+ (id)createGenericObjectTranslator;
+ (id)createTranslatorForMPModelClass:(Class)a3;
+ (id)translatorForType:(id)a3;
+ (void)buildSchemaIfNeeded;
- (id)identifiersForPayload:(id)a3 context:(id)a4;
- (id)objectForPropertySet:(id)a3 payload:(id)a4 context:(id)a5;
- (void)mapIdentifierCreationKeyPaths:(id)a3 transformBlock:(id)a4;
- (void)mapPropertyKey:(id)a3 toPayloadKeyPath:(id)a4;
- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformer:(id)a5;
- (void)mapPropertyKey:(id)a3 toPayloadKeyPaths:(id)a4 valueTransformerFunction:(void *)a5;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5 attributePayloadTransform:(id)a6;
- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5 payloadTransform:(id)a6;
@end

@implementation MPMediaKitEntityTranslator

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  v11 = [(MPBaseEntityTranslator *)self MPModelClass];
  if (v11 != (objc_class *)objc_opt_class())
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPMediaKitEntityTranslator.m", 259, @"Can only call %s on generic object translators.", "-[MPMediaKitEntityTranslator mapRelationshipKey:toModelClass:mediaKitType:]");
  }
  v13 = [[_MPMediaKitEntityRelationshipTranslator alloc] initWithRelatedMPModelClass:a4 mediaKitType:v9 payloadTransformBlock:&__block_literal_global_225_25633];

  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v10, v13);
}

void __75__MPMediaKitEntityTranslator_mapRelationshipKey_toModelClass_mediaKitType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"id"];
  [v5 setIdentifier:v7];

  v8 = [v5 attributes];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"attributes"];
  id v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E4F1CC08];
  if (v9) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CC08];
  }
  [v8 addEntriesFromDictionary:v12];

  v13 = [v5 meta];
  uint64_t v14 = [v6 objectForKeyedSubscript:@"meta"];
  v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = (uint64_t)v11;
  }
  [v13 addEntriesFromDictionary:v16];

  id v19 = [v5 relationships];

  v17 = [v6 objectForKeyedSubscript:@"relationships"];

  if (v17) {
    v18 = v17;
  }
  else {
    v18 = v11;
  }
  [v19 addEntriesFromDictionary:v18];
}

- (id)identifiersForPayload:(id)a3 context:(id)a4
{
  return -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)a3, (uint64_t)a4);
}

- (id)objectForPropertySet:(id)a3 payload:(id)a4 context:(id)a5
{
  return -[MPBaseEntityTranslator objectForPropertySet:source:context:](self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5 attributePayloadTransform:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__MPMediaKitEntityTranslator_mapRelationshipKey_toModelClass_mediaKitType_attributePayloadTransform___block_invoke;
  v12[3] = &unk_1E57F2938;
  id v13 = v10;
  id v11 = v10;
  [(MPMediaKitEntityTranslator *)self mapRelationshipKey:a3 toModelClass:a4 mediaKitType:a5 payloadTransform:v12];
}

void __101__MPMediaKitEntityTranslator_mapRelationshipKey_toModelClass_mediaKitType_attributePayloadTransform___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v16 objectForKeyedSubscript:@"attributes"];
  int v10 = _NSIsNSDictionary();

  if (v10)
  {
    id v11 = [v7 attributes];
    uint64_t v12 = [v16 objectForKeyedSubscript:@"attributes"];
    [v11 addEntriesFromDictionary:v12];
  }
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = [v16 objectForKeyedSubscript:@"attributes"];
  v15 = [v7 attributes];
  (*(void (**)(uint64_t, void *, id, void *))(v13 + 16))(v13, v14, v8, v15);
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 mediaKitType:(id)a5 payloadTransform:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [[_MPMediaKitEntityRelationshipTranslator alloc] initWithRelatedMPModelClass:a4 mediaKitType:v11 payloadTransformBlock:v10];

  -[MPBaseEntityTranslator mapRelationshipKey:ofModelClass:toRelationshipTranslator:]((uint64_t)self, v12, v13);
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
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v11 count:1];
  id v10 = +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:valueTransformFunction:](_MPMediaKitEntityPropertyTranslator, "translatorForKeyPaths:valueTransformFunction:", v9, _MPKeyPathValueTransformFirstKeyPath, v11, v12);

  -[MPBaseEntityTranslator mapPropertyKey:toPropertyTranslator:]((id *)&self->super.super.isa, v8, v10);
}

- (void)mapIdentifierCreationKeyPaths:(id)a3 transformBlock:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke;
  v9[3] = &unk_1E57F2910;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  id v8 = +[_MPKeyPathEntityPropertyTranslator translatorForKeyPaths:a3 valueTransformBlock:v9];
  -[MPBaseEntityTranslator mapIdentifiersToPropertyTranslator:]((id *)&self->super.super.isa, v8);
}

MPIdentifierSet *__75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MPIdentifierSet alloc];
  id v8 = +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", [*(id *)(a1 + 32) MPModelClass]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2;
  v14[3] = &unk_1E57F6E38;
  id v9 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v9;
  id v15 = v5;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = [(MPIdentifierSet *)v7 initWithSource:@"MediaAPI" modelKind:v8 block:v14];

  return v12;
}

uint64_t __75__MPMediaKitEntityTranslator_mapIdentifierCreationKeyPaths_transformBlock___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

+ (id)translatorForType:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18[0] = @"songs";
  v18[1] = @"music-videos";
  v18[2] = @"uploaded-audios";
  v18[3] = @"uploaded-videos";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  char v6 = [v5 containsObject:v4];

  if (v6) {
    goto LABEL_13;
  }
  v17[0] = @"playlists";
  v17[1] = @"library-playlists";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  char v8 = [v7 containsObject:v4];

  if (v8) {
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"artists"]) {
    goto LABEL_13;
  }
  v16[0] = @"albums";
  v16[1] = @"library-albums";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  char v10 = [v9 containsObject:v4];

  if (v10) {
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"stations"]) {
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"station-events"]) {
    goto LABEL_13;
  }
  v15[0] = @"curators";
  v15[1] = @"activities";
  v15[2] = @"apple-curators";
  v15[3] = @"editorial-items";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  char v12 = [v11 containsObject:v4];

  if ((v12 & 1) != 0
    || ([v4 isEqualToString:@"tv-shows"] & 1) != 0
    || ([v4 isEqualToString:@"tv-episodes"] & 1) != 0
    || ([v4 isEqualToString:@"music-movies"] & 1) != 0
    || ([v4 isEqualToString:@"social-profiles"] & 1) != 0
    || ([v4 isEqualToString:@"personal-social-profiles"] & 1) != 0
    || ([v4 isEqualToString:@"record-labels"] & 1) != 0
    || [v4 isEqualToString:@"credit-artists"])
  {
LABEL_13:
    uint64_t v13 = [a1 translatorForMPModelClass:objc_opt_class()];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)createTranslatorForMPModelClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"MPMediaKitEntityTranslator.m" lineNumber:159 description:@"Use +createGenericObjectTranslator instead."];
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___MPMediaKitEntityTranslator;
  char v6 = objc_msgSendSuper2(&v9, sel_createTranslatorForMPModelClass_, a3);

  return v6;
}

+ (id)createGenericObjectTranslator
{
  uint64_t v3 = objc_opt_class();
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MPMediaKitEntityTranslator;
  id v4 = objc_msgSendSuper2(&v6, sel_createTranslatorForMPModelClass_, v3);
  [v4 mapIdentifierCreationKeyPaths:MEMORY[0x1E4F1CBF0] transformBlock:&__block_literal_global_193];

  return v4;
}

+ (void)buildSchemaIfNeeded
{
  if (buildSchemaIfNeeded_onceToken_25670 != -1) {
    dispatch_once(&buildSchemaIfNeeded_onceToken_25670, &__block_literal_global_25671);
  }
}

void __49__MPMediaKitEntityTranslator_buildSchemaIfNeeded__block_invoke()
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v0 = +[MPMediaKitEntityTranslator createGenericObjectTranslator];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericSong" toModelClass:objc_opt_class() mediaKitType:@"songs"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericArtist" toModelClass:objc_opt_class() mediaKitType:@"artists"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericAlbum" toModelClass:objc_opt_class() mediaKitType:@"albums"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericPlaylist" toModelClass:objc_opt_class() mediaKitType:@"playlists"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericRadioStation" toModelClass:objc_opt_class() mediaKitType:@"stations"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericRadioStationEvent" toModelClass:objc_opt_class() mediaKitType:@"station-events"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericGenre" toModelClass:objc_opt_class() mediaKitType:@"genres"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericCurator" toModelClass:objc_opt_class() mediaKitType:@"curators"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericTVShow" toModelClass:objc_opt_class() mediaKitType:@"tv-shows"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericTVEpisode" toModelClass:objc_opt_class() mediaKitType:@"tv-episodes"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericMovie" toModelClass:objc_opt_class() mediaKitType:@"music-movies"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericSocialPerson" toModelClass:objc_opt_class() mediaKitType:@"social-profiles"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericRecordLabel" toModelClass:objc_opt_class() mediaKitType:@"record-labels"];
  [v0 mapRelationshipKey:@"MPModelRelationshipGenericCreditsArtist" toModelClass:objc_opt_class() mediaKitType:@"credit-artists"];

  v1 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  v31 = @"id";
  v32 = @"meta.formerIds";
  v33 = @"type";
  v34 = @"_MPMKT_transformedType";
  v35 = @"attributes.playParams";
  v36 = @"attributes.offers.kind";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:6];
  [v1 mapIdentifierCreationKeyPaths:v2 transformBlock:&__block_literal_global_28314];

  [v1 mapPropertyKey:@"MPModelPropertySongTitle" toPayloadKeyPath:@"attributes.name"];
  [v1 mapPropertyKey:@"MPModelPropertySongDuration" toPayloadKeyPaths:&unk_1EE6ED778 valueTransformerFunction:MPTranslatorUtilitiesTransformMillisecondsToSeconds];
  [v1 mapUnsupportedPropertyKey:@"_MPModelPropertySongTrackCount"];
  [v1 mapPropertyKey:@"MPModelPropertySongDiscNumber" toPayloadKeyPath:@"attributes.discNumber"];
  [v1 mapPropertyKey:@"MPModelPropertySongTrackNumber" toPayloadKeyPath:@"attributes.trackNumber"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongGrouping"];
  [v1 mapPropertyKey:@"MPModelPropertySongHasCredits" toPayloadKeyPath:@"attributes.hasCredits"];
  [v1 mapPropertyKey:@"MPModelPropertySongExplicit" toPayloadKeyPaths:&unk_1EE6ED790 valueTransformer:&__block_literal_global_62];
  v40 = @"type";
  v41 = @"_MPMKT_transformedType";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:2];
  [v1 mapPropertyKey:@"MPModelPropertySongArtistUploadedContent" toPayloadKeyPaths:v3 valueTransformer:&__block_literal_global_68_28320];

  v37 = @"type";
  v38 = @"_MPMKT_transformedType";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:2];
  [v1 mapPropertyKey:@"MPModelPropertySongHasVideo" toPayloadKeyPaths:v4 valueTransformer:&__block_literal_global_70_28321];

  [v1 mapPropertyKey:@"MPModelPropertySongArtwork" toPayloadKeyPaths:&unk_1EE6ED7A8 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v1 mapPropertyKey:@"MPModelPropertySongShouldShowComposer" toPayloadKeyPaths:&unk_1EE6ED7C0 valueTransformer:&__block_literal_global_84];
  [v1 mapPropertyKey:@"MPModelPropertySongCopyrightText" toPayloadKeyPath:@"attributes.copyright"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongVolumeNormalization"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongLibraryAdded"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongDownloadedDate"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalEnableState"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalManagedStatus"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalManagedStatusReason"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongKeepLocalConstraints"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongIsFavorite"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongIsDisliked"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongDateFavorited"];
  [v1 mapPropertyKey:@"MPModelPropertySongLibraryAddEligible" toPayloadKeyPaths:&unk_1EE6ED7D8 valueTransformerFunction:_MPKeyPathValueTransformHasNonnullValue];
  [v1 mapPropertyKey:@"MPModelPropertySongClassicalWork" toPayloadKeyPath:@"attributes.workName"];
  [v1 mapPropertyKey:@"MPModelPropertySongClassicalMovement" toPayloadKeyPath:@"attributes.movementName"];
  [v1 mapPropertyKey:@"MPModelPropertySongClassicalMovementCount" toPayloadKeyPath:@"attributes.movementCount"];
  [v1 mapPropertyKey:@"MPModelPropertySongClassicalMovementNumber" toPayloadKeyPath:@"attributes.movementNumber"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongHasCloudSyncSource"];
  [v1 mapPropertyKey:@"MPModelPropertySongYear" toPayloadKeyPaths:&unk_1EE6ED7F0 valueTransformer:&__block_literal_global_113_28327];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongUserRating"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongCloudStatus"];
  [v1 mapUnsupportedPropertyKey:@"MPModelPropertySongGaplessInfo"];
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  [v1 mapPropertyKey:@"MPModelPropertySongVolumeAdjustment" toPayloadKeyPaths:MEMORY[0x1E4F1CBF0] valueTransformer:&__block_literal_global_115];
  [v1 mapPropertyKey:@"MPModelPropertySongTraits" toPayloadKeyPaths:&unk_1EE6ED808 valueTransformer:&__block_literal_global_127];
  [v1 mapPropertyKey:@"MPModelPropertySongSupportsExtendedLyricsAttribute" toPayloadKeyPath:@"attributes.isVocalAttenuationAllowed"];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongAlbum" toModelClass:objc_opt_class() mediaKitType:@"albums" payloadTransform:&__block_literal_global_150_28329];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongArtist" toModelClass:objc_opt_class() mediaKitType:@"artists" payloadTransform:&__block_literal_global_162];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongComposer" toModelClass:objc_opt_class() mediaKitType:@"_composers" attributePayloadTransform:&__block_literal_global_173];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongGenre" toModelClass:objc_opt_class() mediaKitType:@"genres" attributePayloadTransform:&__block_literal_global_176_28330];
  [v1 mapUnsupportedRelationshipKey:@"MPModelRelationshipSongLocalFileAsset"];
  [v1 mapUnsupportedRelationshipKey:@"MPModelRelationshipSongHomeSharingAsset"];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongLyrics" toModelClass:objc_opt_class() mediaKitType:@"_lyrics" attributePayloadTransform:&__block_literal_global_183];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongStoreAsset" toModelClass:objc_opt_class() mediaKitType:@"_storeAsset" attributePayloadTransform:&__block_literal_global_193_28331];
  [v1 mapRelationshipKey:@"MPModelRelationshipSongPreviewAsset" toModelClass:objc_opt_class() mediaKitType:@"_previewAsset" attributePayloadTransform:&__block_literal_global_203];
  [v1 mapUnsupportedRelationshipKey:@"MPModelRelationshipSongPlaybackPosition"];

  objc_super v6 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v6 mapIdentifierCreationKeyPaths:&unk_1EE6ED820 transformBlock:&__block_literal_global_227_28332];
  [v6 mapPropertyKey:@"MPModelPropertyLyricsHasStoreLyrics" toPayloadKeyPath:@"attributes.hasLyrics"];
  [v6 mapPropertyKey:@"MPModelPropertyLyricsHasTimeSyncedLyrics" toPayloadKeyPath:@"attributes.hasTimeSyncedLyrics"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyLyricsHasLibraryLyrics"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyLyricsText"];
  [v6 mapUnsupportedPropertyKey:@"MPModelPropertyLyricsTTML"];

  id v7 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v7 mapIdentifierCreationKeyPaths:&unk_1EE6ED838 transformBlock:&__block_literal_global_241];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumTitle" toPayloadKeyPath:@"attributes.name"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumTrackCount" toPayloadKeyPath:@"attributes.trackCount"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumMaximumItemTrackNumber" toPayloadKeyPath:@"attributes.trackCount"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumDiscCount" toPayloadKeyPath:@"attributes.discCount"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumHasCleanContent" toPayloadKeyPaths:&unk_1EE6ED850 valueTransformer:&__block_literal_global_254];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumHasExplicitContent" toPayloadKeyPaths:&unk_1EE6ED868 valueTransformer:&__block_literal_global_262];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumIsCompilation" toPayloadKeyPath:@"attributes.isCompilation"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsClassical"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumReleaseDateComponents" toPayloadKeyPaths:&unk_1EE6ED880 valueTransformer:&__block_literal_global_270];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumArtwork" toPayloadKeyPaths:&unk_1EE6ED898 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumLibraryAddEligible" toPayloadKeyPaths:&unk_1EE6ED8B0 valueTransformerFunction:_MPKeyPathValueTransformHasNonnullValue];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumYear" toPayloadKeyPaths:&unk_1EE6ED8C8 valueTransformer:&__block_literal_global_281];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumLibraryAdded"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumDownloadedDate"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalEnableState"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalManagedStatus"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalManagedStatusReason"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumKeepLocalConstraints"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumCopyrightText" toPayloadKeyPath:@"attributes.copyright"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumPreorder" toPayloadKeyPath:@"attributes.isPrerelease"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumEditorNotes" toPayloadKeyPaths:&unk_1EE6ED8E0 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumShortEditorNotes" toPayloadKeyPaths:&unk_1EE6ED8F8 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumVolumeNormalization" toPayloadKeyPaths:v5 valueTransformer:&__block_literal_global_298];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumSongPopularity" toPayloadKeyPaths:&unk_1EE6ED910 valueTransformer:&__block_literal_global_306];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumTraits" toPayloadKeyPaths:&unk_1EE6ED928 valueTransformer:&__block_literal_global_330];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumVersionHash" toPayloadKeyPath:@"attributes.versionHash"];
  [v7 mapPropertyKey:@"MPModelPropertyAlbumClassicalExperienceAvailable" toPayloadKeyPaths:&unk_1EE6ED940 valueTransformer:&__block_literal_global_338];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsFavorite"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsDisliked"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumDateFavorited"];
  [v7 mapUnsupportedPropertyKey:@"MPModelPropertyAlbumIsStoreRedownloadable"];
  [v7 mapRelationshipKey:@"MPModelRelationshipAlbumArtist" toModelClass:objc_opt_class() mediaKitType:@"artists" payloadTransform:&__block_literal_global_340];
  [v7 mapRelationshipKey:@"MPModelRelationshipAlbumGenre" toModelClass:objc_opt_class() mediaKitType:@"genres" attributePayloadTransform:&__block_literal_global_342];
  [v7 mapUnsupportedRelationshipKey:@"MPModelRelationshipAlbumRepresentativeSong"];

  char v8 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v8 mapIdentifierCreationKeyPaths:&unk_1EE6ED958 transformBlock:&__block_literal_global_347];
  [v8 mapPropertyKey:@"MPModelPropertyPersonName" toPayloadKeyPath:@"attributes.name"];
  [v8 mapUnsupportedPropertyKey:@"MPModelPropertyArtistHasBiography"];
  [v8 mapUnsupportedPropertyKey:@"MPModelPropertyPersonHasSocialPosts"];
  [v8 mapPropertyKey:@"MPModelPropertyArtistArtwork" toPayloadKeyPaths:&unk_1EE6ED970 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v8 mapUnsupportedPropertyKey:@"MPModelPropertyArtistEditorialArtwork"];
  [v8 mapPropertyKey:@"MPModelPropertyArtistClassicalExperienceAvailable" toPayloadKeyPaths:&unk_1EE6ED988 valueTransformer:&__block_literal_global_357];
  [v8 mapUnsupportedPropertyKey:@"MPModelPropertyArtistIsFavorite"];
  [v8 mapUnsupportedPropertyKey:@"MPModelPropertyArtistIsDisliked"];
  [v8 mapUnsupportedPropertyKey:@"MPModelPropertyArtistDateFavorited"];
  [v8 mapUnsupportedPropertyKey:@"MPModelPropertyArtistLibraryAdded"];
  [v8 mapRelationshipKey:@"MPModelRelationshipArtistGenre" toModelClass:objc_opt_class() mediaKitType:@"genres" attributePayloadTransform:&__block_literal_global_359];

  objc_super v9 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v9 mapIdentifierCreationKeyPaths:&unk_1EE6ED9A0 transformBlock:&__block_literal_global_367];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistName" toPayloadKeyPath:@"attributes.name"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistTrackCount"];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistEditorNotes" toPayloadKeyPaths:&unk_1EE6ED9B8 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistShortEditorNotes" toPayloadKeyPaths:&unk_1EE6ED9D0 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistReleaseDateComponents" toPayloadKeyPaths:&unk_1EE6ED9E8 valueTransformer:&__block_literal_global_380];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistLastModifiedDateComponents" toPayloadKeyPaths:&unk_1EE6EDA00 valueTransformer:&__block_literal_global_388];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistArtwork" toPayloadKeyPaths:&unk_1EE6EDA18 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistEditorialArtwork"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistTracksTiledArtwork"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistHasCleanContent"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistHasExplicitContent"];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistType" toPayloadKeyPaths:&unk_1EE6EDA30 valueTransformer:&__block_literal_global_402];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistLibraryAdded"];
  [v9 mapUnsupportedPropertyKey:MPModelPropertyPlaylistDownloadedDate];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistKeepLocalEnableState"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistKeepLocalManagedStatus"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistKeepLocalManagedStatusReason"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistKeepLocalConstraints"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsOwner"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCuratorPlaylist"];
  uint64_t v10 = MEMORY[0x1E4F1CBF0];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistPublicPlaylist" toPayloadKeyPaths:MEMORY[0x1E4F1CBF0] valueTransformerFunction:_MPKeyPathValueTransformConstantYES];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistVisiblePlaylist"];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistSubscribed" toPayloadKeyPaths:v10 valueTransformerFunction:_MPKeyPathValueTransformConstantYES];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistUserEditableComponents"];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistShareURL" toPayloadKeyPaths:&unk_1EE6EDA48 valueTransformer:&__block_literal_global_422];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistShareShortURL"];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistDescriptionText" toPayloadKeyPaths:&unk_1EE6EDA60 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistVersionHash" toPayloadKeyPath:@"attributes.versionHash"];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistCloudVersionHash" toPayloadKeyPath:@"attributes.playParams.versionHash"];
  [v9 mapPropertyKey:@"MPModelPropertyPlaylistTraits" toPayloadKeyPaths:&unk_1EE6EDA78 valueTransformer:&__block_literal_global_440];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsFavorite"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsDisliked"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistDateFavorited"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsFavoriteSongsPlaylist"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistParentPersistentID"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCoverArtworkRecipe"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistIsCollaborative"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationSharingMode"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationMode"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaboratorPermissions"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationInvitationURL"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaborationJoinRequestIsPending"];
  [v9 mapUnsupportedPropertyKey:@"MPModelPropertyPlaylistCollaboratorStatus"];
  [v9 mapRelationshipKey:@"MPModelRelationshipPlaylistCurator" toModelClass:objc_opt_class() mediaKitType:@"curators" attributePayloadTransform:&__block_literal_global_442];

  id v11 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v11 mapIdentifierCreationKeyPaths:&unk_1EE6EDA90 transformBlock:&__block_literal_global_458];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationName" toPayloadKeyPath:@"attributes.name"];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationLive" toPayloadKeyPath:@"attributes.isLive"];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationProviderName" toPayloadKeyPath:@"attributes.stationProviderName"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationBeats1"];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationEditorNotes" toPayloadKeyPaths:&unk_1EE6EDAA8 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationShortEditorNotes" toPayloadKeyPaths:&unk_1EE6EDAC0 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationHasExplicitContent"];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationArtwork" toPayloadKeyPaths:&unk_1EE6EDAD8 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationGlyph" toPayloadKeyPaths:&unk_1EE6EDAF0 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationSubtype" toPayloadKeyPaths:&unk_1EE6EDB08 valueTransformer:&__block_literal_global_490];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationStartingAirDate" toPayloadKeyPaths:&unk_1EE6EDB20 valueTransformer:&__block_literal_global_504];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationEndingAirDate" toPayloadKeyPaths:&unk_1EE6EDB38 valueTransformer:&__block_literal_global_512];
  [v11 mapPropertyKey:@"MPModelPropertyRadioStationSubscriptionRequired" toPayloadKeyPath:@"attributes.requiresSubscription"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationAllowsItemLiking"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationType"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationAttributionLabel"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationProviderUniversalLink"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationProviderBundleIdentifier"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationProviderID"];
  [v11 mapUnsupportedPropertyKey:@"MPModelPropertyRadioStationContainsVideo"];

  char v12 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v12 mapIdentifierCreationKeyPaths:&unk_1EE6EDB50 transformBlock:&__block_literal_global_520];
  [v12 mapPropertyKey:@"MPModelPropertyRadioStationEventTitle" toPayloadKeyPath:@"attributes.title"];
  [v12 mapPropertyKey:@"MPModelPropertyRadioStationEventDescriptionText" toPayloadKeyPaths:&unk_1EE6EDB68 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v12 mapPropertyKey:@"MPModelPropertyRadioStationEventStartTime" toPayloadKeyPaths:&unk_1EE6EDB80 valueTransformer:&__block_literal_global_536];
  [v12 mapPropertyKey:@"MPModelPropertyRadioStationEventEndTime" toPayloadKeyPaths:&unk_1EE6EDB98 valueTransformer:&__block_literal_global_544];
  [v12 mapPropertyKey:@"MPModelPropertyRadioStationEventArtwork" toPayloadKeyPaths:&unk_1EE6EDBB0 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v12 mapPropertyKey:@"MPModelPropertyRadioStationEventHeroArtwork" toPayloadKeyPaths:&unk_1EE6EDBC8 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];

  uint64_t v13 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v13 mapIdentifierCreationKeyPaths:&unk_1EE6EDBE0 transformBlock:&__block_literal_global_558];
  [v13 mapPropertyKey:@"MPModelPropertyPersonName" toPayloadKeyPath:@"attributes.name"];

  uint64_t v14 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v14 mapIdentifierCreationKeyPaths:&unk_1EE6EDBF8 transformBlock:&__block_literal_global_565];
  [v14 mapPropertyKey:@"MPModelPropertyPersonName" toPayloadKeyPaths:&unk_1EE6EDC10 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v14 mapPropertyKey:@"MPModelPropertyCuratorHandle" toPayloadKeyPath:@"attributes.handle"];
  [v14 mapUnsupportedPropertyKey:@"MPModelPropertyPersonHasSocialPosts"];
  [v14 mapUnsupportedPropertyKey:@"MPModelPropertyCuratorShortName"];
  [v14 mapPropertyKey:@"MPModelPropertyCuratorEditorNotes" toPayloadKeyPaths:&unk_1EE6EDC28 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v14 mapPropertyKey:@"MPModelPropertyCuratorShortEditorNotes" toPayloadKeyPaths:&unk_1EE6EDC40 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  v31 = @"attributes.kind";
  v32 = @"_MPMKT_transformedType";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:2];
  [v14 mapPropertyKey:@"MPModelPropertyCuratorSubKind" toPayloadKeyPaths:v15 valueTransformer:&__block_literal_global_587];

  v40 = @"type";
  v41 = @"_MPMKT_transformedType";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:2];
  [v14 mapPropertyKey:@"MPModelPropertyCuratorKind" toPayloadKeyPaths:v16 valueTransformer:&__block_literal_global_598];

  [v14 mapPropertyKey:@"MPModelPropertyCuratorEditorialArtwork" toPayloadKeyPaths:&unk_1EE6EDC58 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v14 mapPropertyKey:@"MPModelPropertyCuratorBrandLogoArtwork" toPayloadKeyPaths:&unk_1EE6EDC70 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];

  id v17 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v17 mapIdentifierCreationKeyPaths:&unk_1EE6EDC88 transformBlock:&__block_literal_global_615];
  [v17 mapPropertyKey:@"MPModelPropertyGenreName" toPayloadKeyPath:@"attributes.name"];

  v18 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v18 mapIdentifierCreationKeyPaths:&unk_1EE6EDCA0 transformBlock:&__block_literal_global_622];
  [v18 mapPropertyKey:@"MPModelPropertyTVShowTitle" toPayloadKeyPath:@"attributes.name"];
  [v18 mapPropertyKey:@"MPModelPropertyTVShowEpisodeCount" toPayloadKeyPath:@"attributes.episodeCount"];
  [v18 mapPropertyKey:@"MPModelPropertyTVShowEditorNotes" toPayloadKeyPath:@"attributes.editorialNotes.standard"];
  [v18 mapPropertyKey:@"MPModelPropertyTVShowTagline" toPayloadKeyPath:@"attributes.editorialNotes.tagline"];
  [v18 mapPropertyKey:@"MPModelPropertyTVShowArtwork" toPayloadKeyPaths:&unk_1EE6EDCB8 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v18 mapUnsupportedPropertyKey:@"MPModelPropertyTVShowShortTitle"];
  [v18 mapUnsupportedPropertyKey:@"MPModelPropertyTVShowShortEditorNotes"];
  [v18 mapUnsupportedPropertyKey:@"MPModelPropertyTVShowEditorialArtwork"];
  [v18 mapUnsupportedPropertyKey:@"MPModelPropertyTVShowStoreCanonicalID"];
  [v18 mapUnsupportedRelationshipKey:@"MPModelRelationshipTVShowCreator"];

  id v19 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  v31 = @"id";
  v32 = @"meta.formerIds";
  v33 = @"type";
  v34 = @"_MPMKT_transformedType";
  v35 = @"attributes.playParams";
  v36 = @"attributes.offers.kind";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:6];
  [v19 mapIdentifierCreationKeyPaths:v20 transformBlock:&__block_literal_global_635];

  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeTitle" toPayloadKeyPath:@"attributes.name"];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeDescriptionText" toPayloadKeyPaths:&unk_1EE6EDCD0 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeDuration" toPayloadKeyPaths:&unk_1EE6EDCE8 valueTransformer:&__block_literal_global_651];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeNumber" toPayloadKeyPath:@"attributes.episodeNumber"];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeExplicitRating" toPayloadKeyPaths:&unk_1EE6EDD18 valueTransformer:&__block_literal_global_674];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeReleaseDate" toPayloadKeyPaths:&unk_1EE6EDD30 valueTransformer:&__block_literal_global_682];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeArtwork" toPayloadKeyPaths:&unk_1EE6EDD48 valueTransformer:&__block_literal_global_690];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeLibraryAddEligible" toPayloadKeyPaths:&unk_1EE6EDD78 valueTransformer:&__block_literal_global_704_28348];
  [v19 mapPropertyKey:@"MPModelPropertyTVEpisodeMusicShow" toPayloadKeyPaths:MEMORY[0x1E4F1CBF0] valueTransformerFunction:_MPKeyPathValueTransformConstantYES];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeType"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeTypeDisplayName"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeHasCloudSyncSource"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeLibraryAdded"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeLibraryAddedDate"];
  [v19 mapUnsupportedPropertyKey:MPModelPropertyTVEpisodeDownloadedDate];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeLastDevicePlaybackDate"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalEnableState"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalManagedStatus"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalManagedStatusReason"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeKeepLocalConstraints"];
  [v19 mapUnsupportedPropertyKey:@"MPModelPropertyTVEpisodeStoreCanonicalID"];
  [v19 mapUnsupportedRelationshipKey:@"MPModelRelationshipTVEpisodeLocalFileAsset"];
  [v19 mapUnsupportedRelationshipKey:@"MPModelRelationshipTVEpisodePlaybackPosition"];
  [v19 mapUnsupportedRelationshipKey:@"MPModelRelationshipTVEpisodeSeason"];
  [v19 mapRelationshipKey:@"MPModelRelationshipTVEpisodeShow" toModelClass:objc_opt_class() mediaKitType:@"tv-shows" attributePayloadTransform:&__block_literal_global_709];
  [v19 mapRelationshipKey:@"MPModelRelationshipTVEpisodeStoreAsset" toModelClass:objc_opt_class() mediaKitType:@"_storeAsset" attributePayloadTransform:&__block_literal_global_714];

  v21 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  v31 = @"id";
  v32 = @"meta.formerIds";
  v33 = @"type";
  v34 = @"_MPMKT_transformedType";
  v35 = @"attributes.playParams";
  v36 = @"attributes.offers.kind";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:6];
  [v21 mapIdentifierCreationKeyPaths:v22 transformBlock:&__block_literal_global_716];

  [v21 mapPropertyKey:@"MPModelPropertyMovieTitle" toPayloadKeyPath:@"attributes.name"];
  [v21 mapPropertyKey:@"MPModelPropertyMovieDescriptionText" toPayloadKeyPaths:&unk_1EE6EDDA8 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v21 mapPropertyKey:@"MPModelPropertyMovieDuration" toPayloadKeyPaths:&unk_1EE6EDDC0 valueTransformer:&__block_literal_global_726];
  [v21 mapPropertyKey:@"MPModelPropertyMovieExplicitRating" toPayloadKeyPaths:&unk_1EE6EDDF0 valueTransformer:&__block_literal_global_734];
  [v21 mapPropertyKey:@"MPModelPropertyMovieTagline" toPayloadKeyPath:@"attributes.editorialNotes.tagline"];
  [v21 mapPropertyKey:@"MPModelPropertyMovieReleaseDate" toPayloadKeyPaths:&unk_1EE6EDE08 valueTransformer:&__block_literal_global_739];
  [v21 mapPropertyKey:@"MPModelPropertyMovieArtwork" toPayloadKeyPaths:&unk_1EE6EDE20 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v21 mapPropertyKey:@"MPModelPropertyMovieLibraryAddEligible" toPayloadKeyPaths:&unk_1EE6EDE38 valueTransformer:&__block_literal_global_747];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieInfoDictionary"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieHasCloudSyncSource"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieLibraryAdded"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieLibraryAddedDate"];
  [v21 mapUnsupportedPropertyKey:MPModelPropertyMovieDownloadedDate];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieLastDevicePlaybackDate"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieKeepLocalEnableState"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieKeepLocalManagedStatus"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieKeepLocalManagedStatusReason"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieKeepLocalConstraints"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieEditorialArtwork"];
  [v21 mapUnsupportedPropertyKey:@"MPModelPropertyMovieStoreCanonicalID"];
  [v21 mapUnsupportedRelationshipKey:@"MPModelRelationshipMovieClips"];
  [v21 mapUnsupportedRelationshipKey:@"MPModelRelationshipMovieLocalFileAsset"];
  [v21 mapUnsupportedRelationshipKey:@"MPModelRelationshipMoviePlaybackPosition"];
  [v21 mapRelationshipKey:@"MPModelRelationshipMovieStoreAsset" toModelClass:objc_opt_class() mediaKitType:@"_storeAsset" attributePayloadTransform:&__block_literal_global_752];

  v23 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v23 mapIdentifierCreationKeyPaths:&unk_1EE6EDE68 transformBlock:&__block_literal_global_757];
  [v23 mapPropertyKey:@"MPModelPropertyPersonName" toPayloadKeyPath:@"attributes.name"];
  [v23 mapPropertyKey:@"MPModelPropertySocialPersonHandle" toPayloadKeyPath:@"attributes.handle"];
  [v23 mapPropertyKey:@"MPModelPropertySocialPersonIsPrivate" toPayloadKeyPath:@"attributes.isPrivate"];
  [v23 mapPropertyKey:@"MPModelPropertySocialPersonIsVerified" toPayloadKeyPath:@"attributes.isVerified"];
  [v23 mapPropertyKey:@"MPModelPropertySocialPersonPendingRequestsCount" toPayloadKeyPath:@"attributes.pendingFollowersCount"];
  [v23 mapPropertyKey:@"MPModelPropertySocialPersonArtwork" toPayloadKeyPaths:&unk_1EE6EDE80 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v23 mapUnsupportedPropertyKey:@"MPModelPropertySocialPersonUncensoredName"];
  [v23 mapUnsupportedPropertyKey:@"MPModelPropertySocialPersonBiography"];
  [v23 mapUnsupportedPropertyKey:@"MPModelPropertySocialPersonHasLightweightProfile"];

  v24 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v24 mapIdentifierCreationKeyPaths:&unk_1EE6EDE98 transformBlock:&__block_literal_global_776];
  [v24 mapPropertyKey:@"MPModelPropertyRecordLabelName" toPayloadKeyPath:@"attributes.name"];
  [v24 mapPropertyKey:@"MPModelPropertyRecordLabelDescriptionText" toPayloadKeyPaths:&unk_1EE6EDEB0 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v24 mapPropertyKey:@"MPModelPropertyRecordLabelShortDescriptionText" toPayloadKeyPaths:&unk_1EE6EDEC8 valueTransformerFunction:_MPKeyPathValueTransformFirstNonnullKeyPath];
  [v24 mapPropertyKey:@"MPModelPropertyRecordLabelArtwork" toPayloadKeyPaths:&unk_1EE6EDEE0 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v24 mapPropertyKey:@"MPModelPropertyRecordLabelEditorialArtwork" toPayloadKeyPaths:&unk_1EE6EDEF8 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];

  v25 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v25 mapIdentifierCreationKeyPaths:&unk_1EE6EDF10 transformBlock:&__block_literal_global_798];
  [v25 mapPropertyKey:@"MPModelPropertyPersonName" toPayloadKeyPath:@"attributes.name"];
  [v25 mapPropertyKey:@"MPModelPropertyCreditsArtistArtwork" toPayloadKeyPaths:&unk_1EE6EDF28 valueTransformerFunction:MPMediaKitEntityTranslatorTransformArtwork];
  [v25 mapRelationshipKey:@"MPModelRelationshipCreditsArtistRelatedArtist" toModelClass:objc_opt_class() mediaKitType:@"artists" payloadTransform:&__block_literal_global_805];

  v26 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v26 mapIdentifierCreationKeyPaths:&unk_1EE6EDF40 transformBlock:&__block_literal_global_810];
  v31 = @"_MPMKT_transformedType";
  v32 = @"attributes.playParams";
  v33 = @"attributes.offers.kind";
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:3];
  [v26 mapPropertyKey:@"MPModelPropertyStoreAssetEndpointType" toPayloadKeyPaths:v27 valueTransformer:&__block_literal_global_814];

  [v26 mapUnsupportedPropertyKey:@"MPModelPropertyStoreAssetRedownloadParameters"];
  v40 = @"_MPMKT_transformedType";
  v41 = @"attributes.playParams";
  v42 = @"attributes.offers.kind";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:3];
  [v26 mapPropertyKey:@"MPModelPropertyStoreAssetRedownloadable" toPayloadKeyPaths:v28 valueTransformer:&__block_literal_global_816];

  [v26 mapUnsupportedPropertyKey:@"MPModelPropertyStoreAssetAccountIdentifier"];
  [v26 mapPropertyKey:@"MPModelPropertyStoreAssetShouldReportPlayEvents" toPayloadKeyPaths:&unk_1EE6EDF58 valueTransformer:&__block_literal_global_824];
  [v26 mapUnsupportedPropertyKey:MPModelPropertyStoreAssetNeedsUserUpload];
  v37 = @"_MPMKT_transformedType";
  v38 = @"attributes.playParams";
  v39 = @"attributes.videoKind";
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:3];
  [v26 mapPropertyKey:@"MPModelPropertyStoreAssetSubscriptionRequired" toPayloadKeyPaths:v29 valueTransformer:&__block_literal_global_829];

  v30 = +[MPMediaKitEntityTranslator createTranslatorForMPModelClass:objc_opt_class()];
  [v30 mapIdentifierCreationKeyPaths:&unk_1EE6EDF70 transformBlock:&__block_literal_global_837];
  [v30 mapPropertyKey:@"MPModelPropertyPreviewAssetURL" toPayloadKeyPaths:&unk_1EE6EDF88 valueTransformer:&__block_literal_global_847];
}

@end