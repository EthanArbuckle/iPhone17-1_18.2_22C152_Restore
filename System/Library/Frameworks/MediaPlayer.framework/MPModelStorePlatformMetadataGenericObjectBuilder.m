@interface MPModelStorePlatformMetadataGenericObjectBuilder
- (MPModelStorePlatformMetadataGenericObjectBuilder)initWithRequestedProperties:(id)a3;
- (MPPropertySet)requestedProperties;
- (id)genericObjectForStorePlatformMetadata:(id)a3 radioStationContainsVideo:(BOOL)a4 userIdentity:(id)a5;
@end

@implementation MPModelStorePlatformMetadataGenericObjectBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);

  objc_storeStrong((id *)&self->_playbackPositionBuilder, 0);
}

- (MPPropertySet)requestedProperties
{
  return self->_requestedProperties;
}

- (id)genericObjectForStorePlatformMetadata:(id)a3 radioStationContainsVideo:(BOOL)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if ((*(unsigned char *)&self->_requestedSongProperties & 1) == 0)
  {
    id v124 = v9;
    id v125 = v8;
    BOOL v126 = a4;
    v11 = [(MPModelStorePlatformMetadataGenericObjectBuilder *)self requestedProperties];
    v12 = [v11 relationships];
    v13 = [v12 objectForKey:@"MPModelRelationshipGenericSong"];

    v14 = [v13 properties];
    if ([v14 containsObject:@"MPModelPropertySongTitle"]) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFFDLL | v15;
    if ([v14 containsObject:@"MPModelPropertySongDuration"]) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFFBLL | v16;
    if ([v14 containsObject:@"MPModelPropertySongTrackNumber"]) {
      uint64_t v17 = 8;
    }
    else {
      uint64_t v17 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFF7 | v17;
    int v18 = [v14 containsObject:@"_MPModelPropertySongTrackCount"];
    uint64_t v19 = 16;
    if (!v18) {
      uint64_t v19 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFEFLL | v19;
    int v20 = [v14 containsObject:@"MPModelPropertySongDiscNumber"];
    uint64_t v21 = 32;
    if (!v20) {
      uint64_t v21 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFDFLL | v21;
    int v22 = [v14 containsObject:@"MPModelPropertySongExplicit"];
    uint64_t v23 = 128;
    if (!v22) {
      uint64_t v23 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFF7FLL | v23;
    int v24 = [v14 containsObject:@"MPModelPropertySongArtistUploadedContent"];
    uint64_t v25 = 256;
    if (!v24) {
      uint64_t v25 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFEFFLL | v25;
    int v26 = [v14 containsObject:@"MPModelPropertySongHasVideo"];
    uint64_t v27 = 512;
    if (!v26) {
      uint64_t v27 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFDFFLL | v27;
    int v28 = [v14 containsObject:@"MPModelPropertySongArtwork"];
    uint64_t v29 = 1024;
    if (!v28) {
      uint64_t v29 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFBFFLL | v29;
    int v30 = [v14 containsObject:@"MPModelPropertySongCopyrightText"];
    uint64_t v31 = 2048;
    if (!v30) {
      uint64_t v31 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFF7FFLL | v31;
    int v32 = [v14 containsObject:@"MPModelPropertySongLibraryAdded"];
    uint64_t v33 = 0x40000;
    if (!v32) {
      uint64_t v33 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFBFFFFLL | v33;
    int v34 = [v14 containsObject:@"MPModelPropertySongShouldShowComposer"];
    uint64_t v35 = 0x100000;
    if (!v34) {
      uint64_t v35 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFEFFFFFLL | v35;
    int v36 = [v14 containsObject:@"MPModelPropertySongVolumeNormalization"];
    uint64_t v37 = 0x200000;
    if (!v36) {
      uint64_t v37 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFDFFFFFLL | v37;
    int v38 = [v14 containsObject:@"MPModelPropertySongKeepLocalEnableState"];
    uint64_t v39 = 4096;
    if (!v38) {
      uint64_t v39 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFEFFFLL | v39;
    int v40 = [v14 containsObject:@"MPModelPropertySongKeepLocalManagedStatus"];
    uint64_t v41 = 0x2000;
    if (!v40) {
      uint64_t v41 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFDFFFLL | v41;
    int v42 = [v14 containsObject:@"MPModelPropertySongKeepLocalManagedStatusReason"];
    uint64_t v43 = 0x4000;
    if (!v42) {
      uint64_t v43 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFBFFFLL | v43;
    int v44 = [v14 containsObject:@"MPModelPropertySongKeepLocalConstraints"];
    uint64_t v45 = 0x8000;
    if (!v44) {
      uint64_t v45 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFF7FFFLL | v45;
    int v46 = [v14 containsObject:@"MPModelPropertySongLibraryAddEligible"];
    uint64_t v47 = 0x80000;
    if (!v46) {
      uint64_t v47 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFF7FFFFLL | v47;
    int v48 = [v14 containsObject:@"MPModelPropertySongGrouping"];
    uint64_t v49 = 64;
    if (!v48) {
      uint64_t v49 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFFFFBFLL | v49;
    int v50 = [v14 containsObject:@"MPModelPropertySongHasCloudSyncSource"];
    uint64_t v51 = 0x10000;
    if (!v50) {
      uint64_t v51 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFFEFFFFLL | v51;
    int v52 = [v14 containsObject:@"MPModelPropertySongYear"];
    uint64_t v53 = 0x400000;
    if (!v52) {
      uint64_t v53 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFFBFFFFFLL | v53;
    int v54 = [v14 containsObject:@"MPModelPropertySongUserRating"];
    uint64_t v55 = 0x800000;
    if (!v54) {
      uint64_t v55 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFF7FFFFFLL | v55;
    int v56 = [v14 containsObject:@"MPModelPropertySongCloudStatus"];
    uint64_t v57 = 0x1000000;
    if (!v56) {
      uint64_t v57 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFEFFFFFFLL | v57;
    int v58 = [v14 containsObject:@"MPModelPropertySongGaplessInfo"];
    uint64_t v59 = 0x2000000;
    if (!v58) {
      uint64_t v59 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFDFFFFFFLL | v59;
    int v60 = [v14 containsObject:@"MPModelPropertySongVolumeAdjustment"];
    uint64_t v61 = 0x4000000;
    if (!v60) {
      uint64_t v61 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFFBFFFFFFLL | v61;
    int v62 = [v14 containsObject:@"MPModelPropertySongTraits"];
    uint64_t v63 = 0x8000000;
    if (!v62) {
      uint64_t v63 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFF7FFFFFFLL | v63;
    int v64 = [v14 containsObject:@"MPModelPropertySongSupportsExtendedLyricsAttribute"];
    uint64_t v65 = 0x10000000;
    if (!v64) {
      uint64_t v65 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFEFFFFFFFLL | v65;
    int v66 = [v14 containsObject:@"MPModelPropertySongIsFavorite"];
    uint64_t v67 = 0x20000000;
    if (!v66) {
      uint64_t v67 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFDFFFFFFFLL | v67;
    int v68 = [v14 containsObject:@"MPModelPropertySongIsDisliked"];
    uint64_t v69 = 0x40000000;
    if (!v68) {
      uint64_t v69 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFFBFFFFFFFLL | v69;
    int v70 = [v14 containsObject:@"MPModelPropertySongDateFavorited"];
    uint64_t v71 = 0x80000000;
    if (!v70) {
      uint64_t v71 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFF7FFFFFFFLL | v71;
    int v72 = [v14 containsObject:@"MPModelPropertySongHasCredits"];
    uint64_t v73 = 0x100000000;
    if (!v72) {
      uint64_t v73 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFEFFFFFFFFLL | v73;
    int v74 = [v14 containsObject:@"MPModelPropertySongClassicalWork"];
    uint64_t v75 = 0x200000000;
    if (!v74) {
      uint64_t v75 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFDFFFFFFFFLL | v75;
    int v76 = [v14 containsObject:@"MPModelPropertySongClassicalMovement"];
    uint64_t v77 = 0x400000000;
    if (!v76) {
      uint64_t v77 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFFBFFFFFFFFLL | v77;
    int v78 = [v14 containsObject:@"MPModelPropertySongClassicalMovementCount"];
    uint64_t v79 = 0x800000000;
    if (!v78) {
      uint64_t v79 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFF7FFFFFFFFLL | v79;
    int v80 = [v14 containsObject:@"MPModelPropertySongClassicalMovementNumber"];
    uint64_t v81 = 0x1000000000;
    if (!v80) {
      uint64_t v81 = 0;
    }
    *(void *)&self->_requestedSongProperties = *(void *)&self->_requestedSongProperties & 0xFFFFFFEFFFFFFFFFLL | v81;
    v123 = v13;
    v82 = [v13 relationships];
    v83 = [v82 objectForKey:@"MPModelRelationshipSongAlbum"];
    v84 = v83;
    if (v83)
    {
      v85 = [v83 properties];
      *(unsigned char *)&self->_requestedSongProperties.album |= 1u;
      if ([v85 containsObject:@"MPModelPropertyAlbumTitle"]) {
        char v86 = 2;
      }
      else {
        char v86 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xFD | v86;
      if ([v85 containsObject:@"MPModelPropertyAlbumReleaseDateComponents"]) {
        char v87 = 4;
      }
      else {
        char v87 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xFB | v87;
      if ([v85 containsObject:@"MPModelPropertyAlbumYear"]) {
        char v88 = 8;
      }
      else {
        char v88 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xF7 | v88;
      v89 = [v84 relationships];
      v90 = [v89 objectForKey:@"MPModelRelationshipAlbumArtist"];
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xEF | (16 * (v90 != 0));
    }
    v91 = [v82 objectForKey:@"MPModelRelationshipSongArtist"];
    v92 = v91;
    if (v91)
    {
      v93 = [v91 properties];
      *(unsigned char *)&self->_requestedSongProperties.artist |= 1u;
      if ([v93 containsObject:@"MPModelPropertyPersonName"]) {
        char v94 = 2;
      }
      else {
        char v94 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.artist = *(unsigned char *)&self->_requestedSongProperties.artist & 0xFD | v94;
    }
    v122 = v92;
    v95 = [v82 objectForKey:@"MPModelRelationshipSongComposer"];
    v96 = v95;
    if (v95)
    {
      v97 = [v95 properties];
      *(unsigned char *)&self->_requestedSongProperties.composer |= 1u;
      if ([v97 containsObject:@"MPModelPropertyPersonName"]) {
        char v98 = 2;
      }
      else {
        char v98 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.composer = *(unsigned char *)&self->_requestedSongProperties.composer & 0xFD | v98;
    }
    v99 = [v82 objectForKey:@"MPModelRelationshipSongGenre"];
    v100 = v99;
    if (v99)
    {
      v101 = [v99 properties];
      *(unsigned char *)&self->_requestedSongProperties.genre |= 1u;
      if ([v101 containsObject:@"MPModelPropertyGenreName"]) {
        char v102 = 2;
      }
      else {
        char v102 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.genre = *(unsigned char *)&self->_requestedSongProperties.genre & 0xFD | v102;
    }
    v103 = [v82 objectForKey:@"MPModelRelationshipSongHomeSharingAsset"];
    if (v103) {
      *(unsigned char *)&self->_requestedSongProperties.homeSharingAsset |= 1u;
    }
    v104 = [v82 objectForKey:@"MPModelRelationshipSongLyrics"];
    v105 = v104;
    if (v104)
    {
      v106 = [v104 properties];
      *(unsigned char *)&self->_requestedSongProperties.lyrics |= 1u;
      if ([v106 containsObject:@"MPModelPropertyLyricsText"]) {
        char v107 = 2;
      }
      else {
        char v107 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.lyrics = *(unsigned char *)&self->_requestedSongProperties.lyrics & 0xFD | v107;
      if ([v106 containsObject:@"MPModelPropertyLyricsHasStoreLyrics"]) {
        char v108 = 4;
      }
      else {
        char v108 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.lyrics = *(unsigned char *)&self->_requestedSongProperties.lyrics & 0xFB | v108;
      if ([v106 containsObject:@"MPModelPropertyLyricsHasTimeSyncedLyrics"]) {
        char v109 = 8;
      }
      else {
        char v109 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.lyrics = *(unsigned char *)&self->_requestedSongProperties.lyrics & 0xF7 | v109;
    }
    v110 = [v82 objectForKey:@"MPModelRelationshipSongLocalFileAsset"];
    if (v110) {
      *(void *)&self->_requestedSongProperties |= 0x20000uLL;
    }
    v111 = [v82 objectForKey:@"MPModelRelationshipSongStoreAsset"];
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v111;

    v113 = [v82 objectForKey:@"MPModelRelationshipSongPlaybackPosition"];
    if (v113)
    {
      v114 = [(MPStoreModelObjectBuilder *)[MPStoreModelPlaybackPositionBuilder alloc] initWithRequestedPropertySet:v113];
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v114;
    }
    *(void *)&self->_requestedSongProperties |= 1uLL;

    a4 = v126;
    v10 = v124;
    id v8 = v125;
  }
  v116 = [MPModelGenericObject alloc];
  v117 = +[MPIdentifierSet emptyIdentifierSet];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke;
  v127[3] = &unk_1E57F8958;
  id v128 = v8;
  v129 = self;
  id v130 = v10;
  BOOL v131 = a4;
  id v118 = v10;
  id v119 = v8;
  v120 = [(MPModelObject *)v116 initWithIdentifiers:v117 block:v127];

  return v120;
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4FB8500];
  id v5 = a2;
  v6 = [v3 offerWithType:v4];
  v7 = [MPModelSong alloc];
  id v8 = [MPIdentifierSet alloc];
  id v9 = +[MPModelSongKind identityKind];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_2;
  v19[3] = &unk_1E57F95D0;
  id v20 = *(id *)(a1 + 32);
  id v21 = v6;
  id v10 = v6;
  v11 = [(MPIdentifierSet *)v8 initWithSource:@"StorePlatform" modelKind:v9 block:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_4;
  v15[3] = &unk_1E57F8930;
  int8x16_t v14 = *(int8x16_t *)(a1 + 32);
  id v12 = (id)v14.i64[0];
  int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
  id v17 = *(id *)(a1 + 48);
  char v18 = *(unsigned char *)(a1 + 56);
  v13 = [(MPModelObject *)v7 initWithIdentifiers:v11 block:v15];

  [v5 setSong:v13];
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 storeAdamID];
  v6 = [*(id *)(a1 + 32) cloudUniversalLibraryID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_3;
  v8[3] = &unk_1E57F87C8;
  uint64_t v12 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v6;
  id v7 = v6;
  [v4 setUniversalStoreIdentifiersWithBlock:v8];
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  if ((v5 & 2) != 0)
  {
    id v10 = [*(id *)(a1 + 40) name];
    if (v10)
    {
      [v3 setTitle:v10];
    }
    else
    {
      id v11 = [*(id *)(a1 + 40) title];
      [v3 setTitle:v11];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  [*(id *)(a1 + 40) duration];
  objc_msgSend(v3, "setDuration:");
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setTrackNumber:", objc_msgSend(*(id *)(a1 + 40), "trackNumber"));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_22:
    objc_msgSend(v3, "setDiscNumber:", objc_msgSend(*(id *)(a1 + 40), "discNumber"));
    uint64_t v4 = *(void *)(a1 + 32);
    if ((*(void *)(v4 + 32) & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  objc_msgSend(v3, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  if ((v5 & 0x20) != 0) {
    goto LABEL_22;
  }
LABEL_6:
  if ((v5 & 0x80) != 0)
  {
LABEL_7:
    objc_msgSend(v3, "setExplicitSong:", objc_msgSend(*(id *)(a1 + 40), "explicitRating") > 500);
    uint64_t v4 = *(void *)(a1 + 32);
  }
LABEL_8:
  v6 = *(void **)(v4 + 16);
  if (!v6 && (*(unsigned char *)(v4 + 34) & 8) == 0)
  {
    id v7 = 0;
    goto LABEL_34;
  }
  if (!*(void *)(v4 + 24))
  {
    if ((*(unsigned char *)(v4 + 34) & 8) != 0)
    {
      v87[0] = @"MPModelPropertyStoreAssetRedownloadable";
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
      id v9 = +[MPPropertySet propertySetWithProperties:v12];

      id v13 = *(id *)(*(void *)(a1 + 32) + 16);
      if (v13)
      {
        int8x16_t v14 = v13;
        if (v9)
        {
          uint64_t v15 = [v13 propertySetByCombiningWithPropertySet:v9];

          int8x16_t v14 = (void *)v15;
        }
        goto LABEL_29;
      }
    }
    else
    {
      id v8 = v6;
      id v9 = 0;
      if (v6)
      {
LABEL_28:
        int8x16_t v14 = v8;
LABEL_29:
        int8x16_t v16 = [(MPStoreModelObjectBuilder *)[MPStoreModelStoreAssetBuilder alloc] initWithRequestedPropertySet:v14];
        uint64_t v17 = *(void *)(a1 + 32);
        char v18 = *(void **)(v17 + 24);
        *(void *)(v17 + 24) = v16;

        goto LABEL_30;
      }
    }
    id v8 = v9;
    id v9 = v8;
    goto LABEL_28;
  }
LABEL_30:
  uint64_t v19 = [MPStoreItemMetadata alloc];
  id v20 = [*(id *)(a1 + 40) metadataDictionary];
  id v21 = [*(id *)(a1 + 40) expirationDate];
  int v22 = [(MPStoreItemMetadata *)v19 initWithStorePlatformDictionary:v20 expirationDate:v21];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 24) modelObjectWithStoreItemMetadata:v22 userIdentity:*(void *)(a1 + 48)];
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    [v3 setStoreAsset:v7];
  }

  if ((*(unsigned char *)(*(void *)(a1 + 32) + 34) & 8) != 0) {
    objc_msgSend(v3, "setLibraryAddEligible:", objc_msgSend(v7, "isRedownloadable"));
  }
LABEL_34:
  uint64_t v23 = [*(id *)(a1 + 40) kind];
  uint64_t IsArtistUploadedContent = MPStoreItemMetadataItemKindIsArtistUploadedContent(v23);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 33)) {
    [v3 setArtistUploadedContent:IsArtistUploadedContent];
  }
  if (!v23 && *(unsigned char *)(a1 + 56) || ([v23 isEqualToString:@"musicVideo"] & 1) != 0) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = [v23 isEqualToString:@"uploadedVideo"];
  }
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x200) != 0)
  {
    [v3 setHasVideo:v26];
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(v27 + 32);
    if ((v28 & 0x800) == 0)
    {
LABEL_43:
      if ((v28 & 0x40000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_91;
    }
  }
  else if ((v28 & 0x800) == 0)
  {
    goto LABEL_43;
  }
  int v58 = objc_msgSend(*(id *)(a1 + 40), "copyrightText", v26);
  [v3 setCopyrightText:v58];

  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x40000) == 0)
  {
LABEL_44:
    if ((v28 & 0x10000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_92;
  }
LABEL_91:
  [v3 setLibraryAdded:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x10000) == 0)
  {
LABEL_45:
    if ((v28 & 0x1000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_93;
  }
LABEL_92:
  [v3 setHasCloudSyncSource:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x1000) == 0)
  {
LABEL_46:
    if ((v28 & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_94;
  }
LABEL_93:
  [v3 setKeepLocalEnableState:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x2000) == 0)
  {
LABEL_47:
    if ((v28 & 0x4000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_95;
  }
LABEL_94:
  [v3 setKeepLocalManagedStatus:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x4000) == 0)
  {
LABEL_48:
    if ((v28 & 0x8000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_96;
  }
LABEL_95:
  [v3 setKeepLocalManagedStatusReason:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x8000) == 0)
  {
LABEL_49:
    if ((v28 & 0x100000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_97;
  }
LABEL_96:
  [v3 setKeepLocalConstraints:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x100000) == 0)
  {
LABEL_50:
    if ((v28 & 0x200000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setShouldShowComposer:", objc_msgSend(*(id *)(a1 + 40), "shouldShowComposer", v26));
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x200000) == 0)
  {
LABEL_51:
    if ((v28 & 0x20000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_98:
  objc_msgSend(v3, "setVolumeNormalization:", v26, 0.0);
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x20000) != 0)
  {
LABEL_52:
    [v3 setLocalFileAsset:0];
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(v27 + 32);
  }
LABEL_53:
  if ((v28 & 0x400) != 0)
  {
    uint64_t v59 = [MPStoreItemMetadata alloc];
    int v60 = [*(id *)(a1 + 40) metadataDictionary];
    uint64_t v61 = [*(id *)(a1 + 40) expirationDate];
    int v62 = [(MPStoreItemMetadata *)v59 initWithStorePlatformDictionary:v60 expirationDate:v61];

    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_5;
    v85[3] = &unk_1E57F8800;
    uint64_t v63 = v62;
    char v86 = v63;
    [v3 setArtworkCatalogBlock:v85];

    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(v27 + 32);
    if ((v28 & 0x400000) == 0)
    {
LABEL_55:
      if ((v28 & 0x800000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_105;
    }
  }
  else if ((v28 & 0x400000) == 0)
  {
    goto LABEL_55;
  }
  int v64 = objc_msgSend(*(id *)(a1 + 40), "releaseDate", v26);
  if (v64)
  {
    uint64_t v65 = [MEMORY[0x1E4FB8748] storeServerCalendar];
    uint64_t v66 = [v65 component:4 fromDate:v64];
  }
  else
  {
    uint64_t v66 = 0;
  }
  [v3 setYear:v66];

  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x800000) == 0)
  {
LABEL_56:
    if ((v28 & 0x1000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(v3, "setUserRating:", v26, 0.0);
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x1000000) == 0)
  {
LABEL_57:
    if ((v28 & 0x2000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_107;
  }
LABEL_106:
  [v3 setCloudStatus:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x2000000) == 0)
  {
LABEL_58:
    if ((v28 & 0x4000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v3 setGaplessInfo:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x4000000) == 0)
  {
LABEL_59:
    if ((v28 & 0x8000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_109;
  }
LABEL_108:
  LODWORD(v25) = 1.0;
  objc_msgSend(v3, "setVolumeAdjustment:", v26, v25);
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x8000000) == 0)
  {
LABEL_60:
    if ((v28 & 0x10000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_124;
  }
LABEL_109:
  uint64_t v67 = +[MPCloudController sharedCloudController];
  int v68 = [v67 isEnhancedAudioAvailable];

  if (v68)
  {
    uint64_t v69 = [*(id *)(a1 + 40) audioTraits];
    if ([v69 containsObject:@"spatial"]) {
      uint64_t v70 = 8;
    }
    else {
      uint64_t v70 = 0;
    }
    if ([v69 containsObject:@"atmos"]) {
      v70 |= 0x10uLL;
    }
    if ([v69 containsObject:@"surround"]) {
      v70 |= 0x20uLL;
    }
    if ([v69 containsObject:@"lossless"]) {
      v70 |= 2uLL;
    }
    if ([v69 containsObject:@"hi-res-lossless"]) {
      v70 |= 4uLL;
    }
  }
  else
  {
    uint64_t v70 = 0;
  }
  [v3 setTraits:v70];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x10000000) == 0)
  {
LABEL_61:
    if ((v28 & 0x40) == 0) {
      goto LABEL_62;
    }
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(v3, "setSupportsExtendedLyricsAttribute:", objc_msgSend(*(id *)(a1 + 40), "supportsVocalAttenuation", v26));
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x40) == 0)
  {
LABEL_62:
    if ((v28 & 0x200000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_126;
  }
LABEL_125:
  [v3 setGrouping:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x200000000) == 0)
  {
LABEL_63:
    if ((v28 & 0x400000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_127;
  }
LABEL_126:
  uint64_t v71 = objc_msgSend(*(id *)(a1 + 40), "workName", v26);
  [v3 setClassicalWork:v71];

  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x400000000) == 0)
  {
LABEL_64:
    if ((v28 & 0x800000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_128;
  }
LABEL_127:
  int v72 = objc_msgSend(*(id *)(a1 + 40), "movementName", v26);
  [v3 setClassicalMovement:v72];

  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x800000000) == 0)
  {
LABEL_65:
    if ((v28 & 0x1000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(v3, "setClassicalMovementCount:", objc_msgSend(*(id *)(a1 + 40), "movementCount", v26));
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x1000000000) == 0)
  {
LABEL_66:
    if ((v28 & 0x20000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(v3, "setClassicalMovementNumber:", objc_msgSend(*(id *)(a1 + 40), "movementNumber", v26));
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x20000000) == 0)
  {
LABEL_67:
    if ((v28 & 0x40000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_131;
  }
LABEL_130:
  [v3 setIsFavorite:0];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(v27 + 32);
  if ((v28 & 0x40000000) == 0)
  {
LABEL_68:
    if ((v28 & 0x80000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
LABEL_131:
  [v3 setIsDisliked:0];
  uint64_t v27 = *(void *)(a1 + 32);
  if ((*(void *)(v27 + 32) & 0x80000000) != 0)
  {
LABEL_69:
    [v3 setDateFavorited:0];
    uint64_t v27 = *(void *)(a1 + 32);
  }
LABEL_70:
  if (*(unsigned char *)(v27 + 40))
  {
    uint64_t v29 = (MPModelAlbum *)objc_msgSend(*(id *)(a1 + 40), "collectionStoreAdamID", v26);
    if (v29)
    {
      int v30 = [MPIdentifierSet alloc];
      uint64_t v31 = +[MPModelAlbumKind identityKind];
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_6;
      v84[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
      v84[4] = v29;
      int v32 = [(MPIdentifierSet *)v30 initWithSource:@"StorePlatform" modelKind:v31 block:v84];

      uint64_t v33 = [MPModelAlbum alloc];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_8;
      v82[3] = &unk_1E57F8868;
      int v34 = *(void **)(a1 + 40);
      v82[4] = *(void *)(a1 + 32);
      id v83 = v34;
      uint64_t v29 = [(MPModelObject *)v33 initWithIdentifiers:v32 block:v82];
    }
    [v3 setAlbum:v29];

    uint64_t v27 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v27 + 44))
  {
    uint64_t v35 = (MPModelArtist *)objc_msgSend(*(id *)(a1 + 40), "artistStoreAdamID", v26);
    if (v35)
    {
      int v36 = [MPIdentifierSet alloc];
      uint64_t v37 = +[MPModelArtistKind identityKind];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_9;
      v81[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
      v81[4] = v35;
      int v38 = [(MPIdentifierSet *)v36 initWithSource:@"StorePlatform" modelKind:v37 block:v81];

      uint64_t v39 = [MPModelArtist alloc];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_11;
      v79[3] = &unk_1E57F8890;
      int v40 = *(void **)(a1 + 40);
      v79[4] = *(void *)(a1 + 32);
      id v80 = v40;
      uint64_t v35 = [(MPModelObject *)v39 initWithIdentifiers:v38 block:v79];
    }
    [v3 setArtist:v35];

    uint64_t v27 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v27 + 48))
  {
    uint64_t v41 = [MPModelComposer alloc];
    int v42 = +[MPIdentifierSet emptyIdentifierSet];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_12;
    v77[3] = &unk_1E57F88B8;
    uint64_t v43 = *(void **)(a1 + 40);
    v77[4] = *(void *)(a1 + 32);
    id v78 = v43;
    int v44 = [(MPModelObject *)v41 initWithIdentifiers:v42 block:v77];

    [v3 setComposer:v44];
    uint64_t v27 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v27 + 52))
  {
    uint64_t v45 = [MPModelGenre alloc];
    int v46 = +[MPIdentifierSet emptyIdentifierSet];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_13;
    v75[3] = &unk_1E57F88E0;
    uint64_t v47 = *(void **)(a1 + 40);
    v75[4] = *(void *)(a1 + 32);
    id v76 = v47;
    int v48 = [(MPModelObject *)v45 initWithIdentifiers:v46 block:v75];

    [v3 setGenre:v48];
    uint64_t v27 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v27 + 56))
  {
    [v3 setHomeSharingAsset:0];
    uint64_t v27 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v27 + 60))
  {
    uint64_t v49 = [MPModelLyrics alloc];
    int v50 = +[MPIdentifierSet emptyIdentifierSet];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_14;
    v73[3] = &unk_1E57F8908;
    uint64_t v51 = *(void **)(a1 + 40);
    v73[4] = *(void *)(a1 + 32);
    id v74 = v51;
    int v52 = [(MPModelObject *)v49 initWithIdentifiers:v50 block:v73];

    [v3 setLyrics:v52];
    uint64_t v27 = *(void *)(a1 + 32);
  }
  if (*(void *)(v27 + 8))
  {
    uint64_t v53 = [MPStoreItemMetadata alloc];
    int v54 = [*(id *)(a1 + 40) metadataDictionary];
    uint64_t v55 = [*(id *)(a1 + 40) expirationDate];
    int v56 = [(MPStoreItemMetadata *)v53 initWithStorePlatformDictionary:v54 expirationDate:v55];

    uint64_t v57 = [*(id *)(*(void *)(a1 + 32) + 8) modelObjectWithStoreItemMetadata:v56 userIdentity:*(void *)(a1 + 48)];
    [v3 setPlaybackPosition:v57];
  }
}

MPArtworkCatalog *__129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestToken];
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    id v3 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    uint64_t v4 = [(MPArtworkCatalog *)v2 initWithToken:v1 dataSource:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_7;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v11 = a2;
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 40);
  if ((v3 & 2) != 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) collectionName];
    [v11 setTitle:v4];

    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 40);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 32) + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v5 = [*(id *)(a1 + 40) releaseDate];
  if (v5)
  {
    v6 = +[MPStoreItemMetadata storeServerCalendar];
    id v7 = [v6 components:1048604 fromDate:v5];
    [v11 setReleaseDateComponents:v7];
  }
  else
  {
    [v11 setReleaseDateComponents:0];
  }

  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 40);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  id v8 = [*(id *)(a1 + 40) releaseDate];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4FB8748] storeServerCalendar];
    uint64_t v10 = [v9 component:4 fromDate:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v11 setYear:v10];

  if ((*(unsigned char *)(*(void *)(a1 + 32) + 40) & 0x10) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  [v11 setArtist:0];
LABEL_6:
}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_10;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_11(uint64_t a1, void *a2)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 44) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    id v3 = a2;
    id v4 = [v2 artistName];
    [v3 setName:v4];
  }
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_12(uint64_t a1, void *a2)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    id v3 = a2;
    id v4 = [v2 composerName];
    [v3 setName:v4];
  }
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 52) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    id v3 = a2;
    id v4 = [v2 genreNames];
    uint64_t v5 = [v4 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    [v3 setName:v6];
  }
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 60);
  if ((v3 & 2) != 0)
  {
    [v4 setText:0];
    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 60);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 32) + 60) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "setHasStoreLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasLyrics"));
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 60) & 8) != 0) {
LABEL_4:
  }
    objc_msgSend(v4, "setHasTimeSyncedLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasTimeSyncedLyrics"));
LABEL_5:
}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 setAdamID:*(void *)(a1 + 32)];
}

uint64_t __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setAdamID:*(void *)(a1 + 32)];
}

void __129__MPModelStorePlatformMetadataGenericObjectBuilder_genericObjectForStorePlatformMetadata_radioStationContainsVideo_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setAdamID:*(void *)(a1 + 56)];
  char v3 = [*(id *)(a1 + 32) formerStoreAdamIDs];
  [v4 setFormerAdamIDs:v3];

  if (*(void *)(a1 + 40)) {
    [v4 setSubscriptionAdamID:*(void *)(a1 + 56)];
  }
  if ([*(id *)(a1 + 48) length]) {
    [v4 setUniversalCloudLibraryID:*(void *)(a1 + 48)];
  }
}

- (MPModelStorePlatformMetadataGenericObjectBuilder)initWithRequestedProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStorePlatformMetadataGenericObjectBuilder;
  uint64_t v5 = [(MPModelStorePlatformMetadataGenericObjectBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestedProperties = v5->_requestedProperties;
    v5->_requestedProperties = (MPPropertySet *)v6;
  }
  return v5;
}

@end