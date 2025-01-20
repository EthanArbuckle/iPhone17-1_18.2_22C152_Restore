@interface MPStoreModelSongBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelSongBuilder

+ (id)allSupportedProperties
{
  v32[35] = *MEMORY[0x1E4F143B8];
  v22 = [MPPropertySet alloc];
  v32[0] = @"MPModelPropertySongTitle";
  v32[1] = @"MPModelPropertySongDuration";
  v32[2] = @"_MPModelPropertySongTrackCount";
  v32[3] = @"MPModelPropertySongTrackNumber";
  v32[4] = @"MPModelPropertySongDiscNumber";
  v32[5] = @"MPModelPropertySongGrouping";
  v32[6] = @"MPModelPropertySongExplicit";
  v32[7] = @"MPModelPropertySongArtistUploadedContent";
  v32[8] = @"MPModelPropertySongHasVideo";
  v32[9] = @"MPModelPropertySongArtwork";
  v32[10] = @"MPModelPropertySongShouldShowComposer";
  v32[11] = @"MPModelPropertySongCopyrightText";
  v32[12] = @"MPModelPropertySongVolumeNormalization";
  v32[13] = @"MPModelPropertySongLibraryAdded";
  v32[14] = @"MPModelPropertySongKeepLocalEnableState";
  v32[15] = @"MPModelPropertySongKeepLocalManagedStatus";
  v32[16] = @"MPModelPropertySongKeepLocalManagedStatusReason";
  v32[17] = @"MPModelPropertySongKeepLocalConstraints";
  v32[18] = @"MPModelPropertySongLibraryAddEligible";
  v32[19] = @"MPModelPropertySongClassicalWork";
  v32[20] = @"MPModelPropertySongClassicalMovement";
  v32[21] = @"MPModelPropertySongClassicalMovementNumber";
  v32[22] = @"MPModelPropertySongClassicalMovementCount";
  v32[23] = @"MPModelPropertySongHasCloudSyncSource";
  v32[24] = @"MPModelPropertySongYear";
  v32[25] = @"MPModelPropertySongUserRating";
  v32[26] = @"MPModelPropertySongCloudStatus";
  v32[27] = @"MPModelPropertySongGaplessInfo";
  v32[28] = @"MPModelPropertySongVolumeAdjustment";
  v32[29] = @"MPModelPropertySongTraits";
  v32[30] = @"MPModelPropertySongSupportsExtendedLyricsAttribute";
  v32[31] = @"MPModelPropertySongIsFavorite";
  v32[32] = @"MPModelPropertySongIsDisliked";
  v32[33] = @"MPModelPropertySongDateFavorited";
  v32[34] = @"MPModelPropertySongHasCredits";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:35];
  v30[0] = @"MPModelRelationshipSongAlbum";
  v3 = [MPPropertySet alloc];
  v29[0] = @"MPModelPropertyAlbumTitle";
  v29[1] = @"MPModelPropertyAlbumReleaseDateComponents";
  v29[2] = @"MPModelPropertyAlbumYear";
  v29[3] = @"MPModelPropertyAlbumTrackCount";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  v27 = @"MPModelRelationshipAlbumArtist";
  v21 = +[MPPropertySet emptyPropertySet];
  v28 = v21;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v18 = [(MPPropertySet *)v3 initWithProperties:v20 relationships:v19];
  v31[0] = v18;
  v30[1] = @"MPModelRelationshipSongArtist";
  v26 = @"MPModelPropertyPersonName";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v16 = +[MPPropertySet propertySetWithProperties:v17];
  v31[1] = v16;
  v30[2] = @"MPModelRelationshipSongComposer";
  v25 = @"MPModelPropertyPersonName";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v14 = +[MPPropertySet propertySetWithProperties:v15];
  v31[2] = v14;
  v30[3] = @"MPModelRelationshipSongGenre";
  v24 = @"MPModelPropertyGenreName";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v5 = +[MPPropertySet propertySetWithProperties:v4];
  v31[3] = v5;
  v30[4] = @"MPModelRelationshipSongLocalFileAsset";
  v6 = +[MPModelFileAsset allSupportedProperties];
  v31[4] = v6;
  v30[5] = @"MPModelRelationshipSongLyrics";
  v23[0] = @"MPModelPropertyLyricsText";
  v23[1] = @"MPModelPropertyLyricsHasStoreLyrics";
  v23[2] = @"MPModelPropertyLyricsHasTimeSyncedLyrics";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v8 = +[MPPropertySet propertySetWithProperties:v7];
  v31[5] = v8;
  v30[6] = @"MPModelRelationshipSongStoreAsset";
  v9 = +[MPStoreModelStoreAssetBuilder allSupportedProperties];
  v31[6] = v9;
  v30[7] = @"MPModelRelationshipSongPlaybackPosition";
  v10 = +[MPStoreModelPlaybackPositionBuilder allSupportedProperties];
  v31[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:8];
  v12 = [(MPPropertySet *)v22 initWithProperties:v2 relationships:v11];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);

  objc_storeStrong((id *)&self->_playbackPositionBuilder, 0);
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  p_requestedSongProperties = &self->_requestedSongProperties;
  if ((*(unsigned char *)&self->_requestedSongProperties & 1) == 0)
  {
    id v134 = v10;
    id v135 = v8;
    id v136 = v9;
    v13 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v14 = [v13 properties];
    if ([v14 containsObject:@"MPModelPropertySongTitle"]) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFFDLL | v15;
    if ([v14 containsObject:@"MPModelPropertySongDuration"]) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFFBLL | v16;
    if ([v14 containsObject:@"_MPModelPropertySongTrackCount"]) {
      uint64_t v17 = 8;
    }
    else {
      uint64_t v17 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFF7 | v17;
    int v18 = [v14 containsObject:@"MPModelPropertySongTrackNumber"];
    uint64_t v19 = 16;
    if (!v18) {
      uint64_t v19 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFEFLL | v19;
    if ([v14 containsObject:@"MPModelPropertySongDiscNumber"]) {
      uint64_t v20 = 32;
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFDFLL | v20;
    int v21 = [v14 containsObject:@"MPModelPropertySongExplicit"];
    uint64_t v22 = 128;
    if (!v21) {
      uint64_t v22 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFF7FLL | v22;
    int v23 = [v14 containsObject:@"MPModelPropertySongArtistUploadedContent"];
    uint64_t v24 = 256;
    if (!v23) {
      uint64_t v24 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFEFFLL | v24;
    int v25 = [v14 containsObject:@"MPModelPropertySongHasVideo"];
    uint64_t v26 = 512;
    if (!v25) {
      uint64_t v26 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFDFFLL | v26;
    int v27 = [v14 containsObject:@"MPModelPropertySongArtwork"];
    uint64_t v28 = 1024;
    if (!v27) {
      uint64_t v28 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFBFFLL | v28;
    int v29 = [v14 containsObject:@"MPModelPropertySongCopyrightText"];
    uint64_t v30 = 2048;
    if (!v29) {
      uint64_t v30 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFF7FFLL | v30;
    int v31 = [v14 containsObject:@"MPModelPropertySongLibraryAdded"];
    uint64_t v32 = 0x40000;
    if (!v31) {
      uint64_t v32 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFBFFFFLL | v32;
    int v33 = [v14 containsObject:@"MPModelPropertySongShouldShowComposer"];
    uint64_t v34 = 0x100000;
    if (!v33) {
      uint64_t v34 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFEFFFFFLL | v34;
    int v35 = [v14 containsObject:@"MPModelPropertySongVolumeNormalization"];
    uint64_t v36 = 0x200000;
    if (!v35) {
      uint64_t v36 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFDFFFFFLL | v36;
    int v37 = [v14 containsObject:@"MPModelPropertySongKeepLocalEnableState"];
    uint64_t v38 = 4096;
    if (!v37) {
      uint64_t v38 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFEFFFLL | v38;
    int v39 = [v14 containsObject:@"MPModelPropertySongKeepLocalManagedStatus"];
    uint64_t v40 = 0x2000;
    if (!v39) {
      uint64_t v40 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFDFFFLL | v40;
    int v41 = [v14 containsObject:@"MPModelPropertySongKeepLocalManagedStatusReason"];
    uint64_t v42 = 0x4000;
    if (!v41) {
      uint64_t v42 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFBFFFLL | v42;
    int v43 = [v14 containsObject:@"MPModelPropertySongKeepLocalConstraints"];
    uint64_t v44 = 0x8000;
    if (!v43) {
      uint64_t v44 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFF7FFFLL | v44;
    int v45 = [v14 containsObject:@"MPModelPropertySongLibraryAddEligible"];
    uint64_t v46 = 0x80000;
    if (!v45) {
      uint64_t v46 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFF7FFFFLL | v46;
    int v47 = [v14 containsObject:@"MPModelPropertySongGrouping"];
    uint64_t v48 = 64;
    if (!v47) {
      uint64_t v48 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFBFLL | v48;
    int v49 = [v14 containsObject:@"MPModelPropertySongHasCloudSyncSource"];
    uint64_t v50 = 0x10000;
    if (!v49) {
      uint64_t v50 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFFEFFFFLL | v50;
    int v51 = [v14 containsObject:@"MPModelPropertySongYear"];
    uint64_t v52 = 0x400000;
    if (!v51) {
      uint64_t v52 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFFBFFFFFLL | v52;
    int v53 = [v14 containsObject:@"MPModelPropertySongUserRating"];
    uint64_t v54 = 0x800000;
    if (!v53) {
      uint64_t v54 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFF7FFFFFLL | v54;
    int v55 = [v14 containsObject:@"MPModelPropertySongCloudStatus"];
    uint64_t v56 = 0x1000000;
    if (!v55) {
      uint64_t v56 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFEFFFFFFLL | v56;
    int v57 = [v14 containsObject:@"MPModelPropertySongGaplessInfo"];
    uint64_t v58 = 0x2000000;
    if (!v57) {
      uint64_t v58 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFDFFFFFFLL | v58;
    int v59 = [v14 containsObject:@"MPModelPropertySongVolumeAdjustment"];
    uint64_t v60 = 0x4000000;
    if (!v59) {
      uint64_t v60 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFFBFFFFFFLL | v60;
    int v61 = [v14 containsObject:@"MPModelPropertySongTraits"];
    uint64_t v62 = 0x8000000;
    if (!v61) {
      uint64_t v62 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFF7FFFFFFLL | v62;
    int v63 = [v14 containsObject:@"MPModelPropertySongSupportsExtendedLyricsAttribute"];
    uint64_t v64 = 0x10000000;
    if (!v63) {
      uint64_t v64 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFEFFFFFFFLL | v64;
    int v65 = [v14 containsObject:@"MPModelPropertySongIsFavorite"];
    uint64_t v66 = 0x20000000;
    if (!v65) {
      uint64_t v66 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFDFFFFFFFLL | v66;
    int v67 = [v14 containsObject:@"MPModelPropertySongIsDisliked"];
    uint64_t v68 = 0x40000000;
    if (!v67) {
      uint64_t v68 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFFBFFFFFFFLL | v68;
    int v69 = [v14 containsObject:@"MPModelPropertySongDateFavorited"];
    uint64_t v70 = 0x80000000;
    if (!v69) {
      uint64_t v70 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFF7FFFFFFFLL | v70;
    int v71 = [v14 containsObject:@"MPModelPropertySongHasCredits"];
    uint64_t v72 = 0x100000000;
    if (!v71) {
      uint64_t v72 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFEFFFFFFFFLL | v72;
    int v73 = [v14 containsObject:@"MPModelPropertySongClassicalWork"];
    uint64_t v74 = 0x200000000;
    if (!v73) {
      uint64_t v74 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFDFFFFFFFFLL | v74;
    int v75 = [v14 containsObject:@"MPModelPropertySongClassicalMovement"];
    uint64_t v76 = 0x400000000;
    if (!v75) {
      uint64_t v76 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFFBFFFFFFFFLL | v76;
    int v77 = [v14 containsObject:@"MPModelPropertySongClassicalMovementCount"];
    uint64_t v78 = 0x800000000;
    if (!v77) {
      uint64_t v78 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFF7FFFFFFFFLL | v78;
    int v79 = [v14 containsObject:@"MPModelPropertySongClassicalMovementNumber"];
    uint64_t v80 = 0x1000000000;
    if (!v79) {
      uint64_t v80 = 0;
    }
    *(void *)p_requestedSongProperties = *(void *)p_requestedSongProperties & 0xFFFFFFEFFFFFFFFFLL | v80;
    v133 = v13;
    v81 = [v13 relationships];
    v82 = [v81 objectForKey:@"MPModelRelationshipSongAlbum"];
    v83 = v82;
    if (v82)
    {
      v84 = [v82 properties];
      *(unsigned char *)&self->_requestedSongProperties.album |= 1u;
      if ([v84 containsObject:@"MPModelPropertyAlbumTitle"]) {
        char v85 = 2;
      }
      else {
        char v85 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xFD | v85;
      if ([v84 containsObject:@"MPModelPropertyAlbumReleaseDateComponents"]) {
        char v86 = 4;
      }
      else {
        char v86 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xFB | v86;
      if ([v84 containsObject:@"MPModelPropertyAlbumYear"]) {
        char v87 = 8;
      }
      else {
        char v87 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xF7 | v87;
      if ([v84 containsObject:@"MPModelPropertyAlbumTrackCount"]) {
        char v88 = 32;
      }
      else {
        char v88 = 0;
      }
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xDF | v88;
      v89 = [v83 relationships];
      v90 = [v89 objectForKey:@"MPModelRelationshipAlbumArtist"];
      *(unsigned char *)&self->_requestedSongProperties.album = *(unsigned char *)&self->_requestedSongProperties.album & 0xEF | (16 * (v90 != 0));
    }
    v132 = v83;
    v91 = [v81 objectForKey:@"MPModelRelationshipSongArtist"];
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
    v95 = objc_msgSend(v81, "objectForKey:", @"MPModelRelationshipSongComposer", v92);
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
    v99 = [v81 objectForKey:@"MPModelRelationshipSongGenre"];
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
    v103 = [v81 objectForKey:@"MPModelRelationshipSongHomeSharingAsset"];
    if (v103) {
      *(unsigned char *)&self->_requestedSongProperties.homeSharingAsset |= 1u;
    }
    v104 = [v81 objectForKey:@"MPModelRelationshipSongLyrics"];
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
    v110 = [v81 objectForKey:@"MPModelRelationshipSongLocalFileAsset"];
    if (v110) {
      *(void *)p_requestedSongProperties |= 0x20000uLL;
    }
    v111 = [v81 objectForKey:@"MPModelRelationshipSongPlaybackPosition"];
    if (v111)
    {
      v112 = [(MPStoreModelObjectBuilder *)[MPStoreModelPlaybackPositionBuilder alloc] initWithRequestedPropertySet:v111];
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v112;
    }
    v114 = [v81 objectForKey:@"MPModelRelationshipSongStoreAsset"];
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v114;

    *(void *)p_requestedSongProperties |= 1uLL;
    id v8 = v135;
    id v9 = v136;
    v11 = v134;
  }
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v141[3] = &unk_1E57F95D0;
  id v116 = v8;
  id v142 = v116;
  id v117 = v11;
  id v143 = v117;
  v118 = (void *)MEMORY[0x19971E0F0](v141);
  v137[0] = MEMORY[0x1E4F143A8];
  v137[1] = 3221225472;
  v137[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v137[3] = &unk_1E57F1060;
  v137[4] = self;
  id v119 = v116;
  id v138 = v119;
  id v120 = v9;
  id v139 = v120;
  id v121 = v117;
  id v140 = v121;
  v122 = (void *)MEMORY[0x19971E0F0](v137);
  if (v120)
  {
    v123 = [v120 identifiers];
    v124 = (MPIdentifierSet *)[v123 copyWithSource:@"StorePlatform" block:v118];
    uint64_t v125 = [v120 copyWithIdentifiers:v124 block:v122];
  }
  else
  {
    v126 = [MPModelSong alloc];
    v127 = [MPIdentifierSet alloc];
    v123 = +[MPModelSongKind identityKind];
    v124 = [(MPIdentifierSet *)v127 initWithSource:@"StorePlatform" modelKind:v123 block:v118];
    uint64_t v125 = [(MPModelObject *)v126 initWithIdentifiers:v124 block:v122];
  }
  v128 = (void *)v125;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v129 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v129 addStoreItemMetadata:v119];
  }

  return v128;
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v14[3] = &unk_1E57F9580;
  id v4 = v3;
  id v15 = v4;
  id v16 = *(id *)(a1 + 32);
  [v4 setUniversalStoreIdentifiersWithBlock:v14];
  v5 = [v4 personalizedStore];
  v6 = [v5 personID];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    id v10 = [v9 DSIDForUserIdentity:*(void *)(a1 + 40) outError:0];
    id v8 = [v10 stringValue];
  }
  if ([v8 length])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
    v11[3] = &unk_1E57F95A8;
    id v12 = v4;
    id v13 = *(id *)(a1 + 32);
    [v12 setPersonalStoreIdentifiersWithPersonID:v8 block:v11];
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertySongTitle"] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 40) name];
    [v4 setTitle:v5];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongDuration"] & 1) == 0)
  {
    [*(id *)(a1 + 40) duration];
    objc_msgSend(v4, "setDuration:");
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"_MPModelPropertySongTrackCount"] & 1) == 0)
  {
    objc_msgSend(v4, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongTrackNumber"] & 1) == 0)
  {
    objc_msgSend(v4, "setTrackNumber:", objc_msgSend(*(id *)(a1 + 40), "trackNumber"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongDiscNumber"] & 1) == 0)
  {
    objc_msgSend(v4, "setDiscNumber:", objc_msgSend(*(id *)(a1 + 40), "discNumber"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongExplicit"] & 1) == 0)
  {
    objc_msgSend(v4, "setExplicitSong:", objc_msgSend(*(id *)(a1 + 40), "isExplicitContent"));
  }
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  if (!v7 && (*(unsigned char *)(v6 + 50) & 8) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemKind", 0);
    goto LABEL_40;
  }
  id v8 = *(void **)(v6 + 32);
  if (!v8)
  {
    if ((*(unsigned char *)(v6 + 50) & 8) != 0)
    {
      v97[0] = @"MPModelPropertyStoreAssetRedownloadable";
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
      id v10 = +[MPPropertySet propertySetWithProperties:v11];

      id v12 = *(id *)(*(void *)(a1 + 32) + 40);
      if (v12)
      {
        id v13 = v12;
        if (v10)
        {
          uint64_t v14 = [v12 propertySetByCombiningWithPropertySet:v10];

          id v13 = (void *)v14;
        }
        goto LABEL_31;
      }
    }
    else
    {
      id v9 = v7;
      id v10 = 0;
      if (v7)
      {
LABEL_30:
        id v13 = v9;
LABEL_31:
        id v15 = [(MPStoreModelObjectBuilder *)[MPStoreModelStoreAssetBuilder alloc] initWithRequestedPropertySet:v13];
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(void **)(v16 + 32);
        *(void *)(v16 + 32) = v15;

        id v8 = *(void **)(*(void *)(a1 + 32) + 32);
        goto LABEL_32;
      }
    }
    id v9 = v10;
    id v10 = v9;
    goto LABEL_30;
  }
LABEL_32:
  uint64_t v18 = *(void *)(a1 + 40);
  int v19 = [*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipSongStoreAsset"];
  if (v19)
  {
    uint64_t v20 = [*(id *)(a1 + 48) storeAsset];
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v79 = [v8 modelObjectWithStoreItemMetadata:v18 sourceModelObject:v20 userIdentity:*(void *)(a1 + 56)];
  if (v19) {

  }
  if (*(void *)(*(void *)(a1 + 32) + 40)) {
    [v4 setStoreAsset:v79];
  }
  objc_msgSend(*(id *)(a1 + 40), "itemKind", v79);
  uint64_t v80 = LABEL_40:;
  uint64_t IsArtistUploadedContent = MPStoreItemMetadataItemKindIsArtistUploadedContent(v80);
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongArtistUploadedContent"] & 1) == 0)
  {
    [v4 setArtistUploadedContent:IsArtistUploadedContent];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongLibraryAddEligible"] & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAddEligible:", objc_msgSend(v78, "isRedownloadable") & (IsArtistUploadedContent ^ 1));
  }
  if ([v80 isEqualToString:@"musicVideo"]) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = [v80 isEqualToString:@"uploadedVideo"];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongHasVideo"] & 1) == 0)
  {
    [v4 setHasVideo:v22];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongCopyrightText"] & 1) == 0)
  {
    int v23 = [*(id *)(a1 + 40) copyrightText];
    [v4 setCopyrightText:v23];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongLibraryAdded"] & 1) == 0)
  {
    [v4 setLibraryAdded:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongHasCloudSyncSource"] & 1) == 0)
  {
    [v4 setHasCloudSyncSource:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongKeepLocalEnableState"] & 1) == 0)
  {
    [v4 setKeepLocalEnableState:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongKeepLocalManagedStatus"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatus:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongKeepLocalManagedStatusReason"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatusReason:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongKeepLocalConstraints"] & 1) == 0)
  {
    [v4 setKeepLocalConstraints:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongShouldShowComposer"] & 1) == 0)
  {
    objc_msgSend(v4, "setShouldShowComposer:", objc_msgSend(*(id *)(a1 + 40), "showComposer"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 51) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongGaplessInfo"] & 1) == 0)
  {
    [v4 setGaplessInfo:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongVolumeNormalization"] & 1) == 0)
  {
    [v4 setVolumeNormalization:0.0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelRelationshipSongLocalFileAsset"] & 1) == 0)
  {
    [v4 setLocalFileAsset:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 49) & 4) != 0)
  {
    if (![v4 hasLoadedValueForKey:@"MPModelPropertySongArtwork"]
      || ([v4 artworkCatalogBlock],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          !v24))
    {
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
      v95[3] = &unk_1E57F8800;
      id v96 = *(id *)(a1 + 40);
      [v4 setArtworkCatalogBlock:v95];
    }
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongYear"] & 1) == 0)
  {
    int v25 = [*(id *)(a1 + 40) releaseDate];
    if (v25)
    {
      uint64_t v26 = +[MPStoreItemMetadata storeServerCalendar];
      uint64_t v27 = [v26 component:4 fromDate:v25];
    }
    else
    {
      uint64_t v27 = 0;
    }
    [v4 setYear:v27];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongUserRating"] & 1) == 0)
  {
    [v4 setUserRating:0.0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 50) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongCloudStatus"] & 1) == 0)
  {
    [v4 setCloudStatus:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 51) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongVolumeAdjustment"] & 1) == 0)
  {
    LODWORD(v28) = 1.0;
    [v4 setVolumeAdjustment:v28];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 51) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongTraits"] & 1) == 0)
  {
    uint64_t v29 = [*(id *)(a1 + 40) isMasteredForiTunes];
    uint64_t v30 = +[MPCloudController sharedCloudController];
    int v31 = [v30 isEnhancedAudioAvailable];

    if (v31)
    {
      uint64_t v32 = [*(id *)(a1 + 40) audioTraits];
      if ([v32 containsObject:@"spatial"]) {
        uint64_t v33 = v29 | 8;
      }
      else {
        uint64_t v33 = v29;
      }
      if ([v32 containsObject:@"atmos"]) {
        v33 |= 0x10uLL;
      }
      if ([v32 containsObject:@"surround"]) {
        v33 |= 0x20uLL;
      }
      if ([v32 containsObject:@"lossless"]) {
        v33 |= 2uLL;
      }
      if ([v32 containsObject:@"hi-res-lossless"]) {
        uint64_t v29 = v33 | 4;
      }
      else {
        uint64_t v29 = v33;
      }
    }
    [v4 setTraits:v29];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 51) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongSupportsExtendedLyricsAttribute"] & 1) == 0)
  {
    objc_msgSend(v4, "setSupportsExtendedLyricsAttribute:", objc_msgSend(*(id *)(a1 + 40), "supportsVocalAttenuation"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 48) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongGrouping"] & 1) == 0)
  {
    [v4 setGrouping:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 52) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongClassicalWork"] & 1) == 0)
  {
    uint64_t v34 = [*(id *)(a1 + 40) workName];
    [v4 setClassicalWork:v34];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 52) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongClassicalMovement"] & 1) == 0)
  {
    int v35 = [*(id *)(a1 + 40) movementName];
    [v4 setClassicalMovement:v35];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 52) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongClassicalMovementCount"] & 1) == 0)
  {
    objc_msgSend(v4, "setClassicalMovementCount:", objc_msgSend(*(id *)(a1 + 40), "movementCount"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 52) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongClassicalMovementNumber"] & 1) == 0)
  {
    objc_msgSend(v4, "setClassicalMovementNumber:", objc_msgSend(*(id *)(a1 + 40), "movementNumber"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 51) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongIsFavorite"] & 1) == 0)
  {
    [v4 setIsFavorite:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 51) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongIsDisliked"] & 1) == 0)
  {
    [v4 setIsDisliked:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 51) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongDateFavorited"] & 1) == 0)
  {
    [v4 setDateFavorited:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 52) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertySongHasCredits"] & 1) == 0)
  {
    objc_msgSend(v4, "setHasCredits:", objc_msgSend(*(id *)(a1 + 40), "hasCredits"));
  }
  uint64_t v36 = *(unsigned char **)(a1 + 32);
  if (v36[56])
  {
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v93[3] = &unk_1E57FA3B8;
    id v94 = *(id *)(a1 + 40);
    int v37 = (void *)MEMORY[0x19971E0F0](v93);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
    v91[3] = &unk_1E57F8868;
    uint64_t v38 = *(void **)(a1 + 40);
    v91[4] = *(void *)(a1 + 32);
    id v92 = v38;
    int v39 = (void *)MEMORY[0x19971E0F0](v91);
    if ([*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipSongAlbum"])
    {
      uint64_t v40 = [*(id *)(a1 + 48) album];
      int v41 = [v40 identifiers];
      uint64_t v42 = v4;
      id v43 = [(MPIdentifierSet *)v41 copyWithSource:@"StorePlatform" block:v37];
      uint64_t v44 = (MPModelAlbum *)[v40 copyWithIdentifiers:v43 block:v39];

      id v4 = v42;
    }
    else
    {
      int v45 = [MPModelAlbum alloc];
      uint64_t v46 = [MPIdentifierSet alloc];
      uint64_t v40 = +[MPModelAlbumKind identityKind];
      int v41 = [(MPIdentifierSet *)v46 initWithSource:@"StorePlatform" modelKind:v40 block:v37];
      uint64_t v44 = [(MPModelObject *)v45 initWithIdentifiers:v41 block:v39];
    }

    [v4 setAlbum:v44];
    uint64_t v36 = *(unsigned char **)(a1 + 32);
  }
  if (v36[60])
  {
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v89[3] = &unk_1E57FA3B8;
    id v90 = *(id *)(a1 + 40);
    int v47 = (void *)MEMORY[0x19971E0F0](v89);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11;
    v87[3] = &unk_1E57F8890;
    uint64_t v48 = *(void **)(a1 + 40);
    v87[4] = *(void *)(a1 + 32);
    id v88 = v48;
    int v49 = (void *)MEMORY[0x19971E0F0](v87);
    if ([*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipSongArtist"])
    {
      uint64_t v50 = [*(id *)(a1 + 48) artist];
      int v51 = [v50 identifiers];
      uint64_t v52 = v4;
      id v53 = [(MPIdentifierSet *)v51 copyWithSource:@"StorePlatform" block:v47];
      uint64_t v54 = (MPModelArtist *)[v50 copyWithIdentifiers:v53 block:v49];

      id v4 = v52;
    }
    else
    {
      int v55 = [MPModelArtist alloc];
      uint64_t v56 = [MPIdentifierSet alloc];
      uint64_t v50 = +[MPModelArtistKind identityKind];
      int v51 = [(MPIdentifierSet *)v56 initWithSource:@"StorePlatform" modelKind:v50 block:v47];
      uint64_t v54 = [(MPModelObject *)v55 initWithIdentifiers:v51 block:v49];
    }

    [v4 setArtist:v54];
    uint64_t v36 = *(unsigned char **)(a1 + 32);
  }
  if (v36[64])
  {
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12;
    v85[3] = &unk_1E57F88B8;
    v85[4] = v36;
    id v86 = *(id *)(a1 + 40);
    int v57 = (void *)MEMORY[0x19971E0F0](v85);
    if ([*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipSongComposer"])
    {
      uint64_t v58 = [*(id *)(a1 + 48) composer];
      int v59 = [v58 identifiers];
      uint64_t v60 = (MPModelComposer *)[v58 copyWithIdentifiers:v59 block:v57];
    }
    else
    {
      int v61 = [MPModelComposer alloc];
      uint64_t v58 = +[MPIdentifierSet emptyIdentifierSet];
      uint64_t v60 = [(MPModelObject *)v61 initWithIdentifiers:v58 block:v57];
    }

    [v4 setComposer:v60];
    uint64_t v36 = *(unsigned char **)(a1 + 32);
  }
  if (v36[68])
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13;
    v83[3] = &unk_1E57F88E0;
    v83[4] = v36;
    id v84 = *(id *)(a1 + 40);
    uint64_t v62 = (void *)MEMORY[0x19971E0F0](v83);
    if ([*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipSongGenre"])
    {
      int v63 = [*(id *)(a1 + 48) genre];
      uint64_t v64 = [v63 identifiers];
      int v65 = (MPModelGenre *)[v63 copyWithIdentifiers:v64 block:v62];
    }
    else
    {
      uint64_t v66 = [MPModelGenre alloc];
      int v63 = +[MPIdentifierSet emptyIdentifierSet];
      int v65 = [(MPModelObject *)v66 initWithIdentifiers:v63 block:v62];
    }

    [v4 setGenre:v65];
    uint64_t v36 = *(unsigned char **)(a1 + 32);
  }
  if ((v36[72] & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelRelationshipSongHomeSharingAsset"] & 1) == 0)
  {
    [v4 setHomeSharingAsset:0];
  }
  uint64_t v67 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v67 + 76))
  {
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14;
    v81[3] = &unk_1E57F8908;
    v81[4] = v67;
    id v82 = *(id *)(a1 + 40);
    uint64_t v68 = (void *)MEMORY[0x19971E0F0](v81);
    if ([*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipSongLyrics"])
    {
      int v69 = [*(id *)(a1 + 48) lyrics];
      uint64_t v70 = [v69 identifiers];
      int v71 = (MPModelLyrics *)[v69 copyWithIdentifiers:v70 block:v68];
    }
    else
    {
      uint64_t v72 = [MPModelLyrics alloc];
      int v69 = +[MPIdentifierSet emptyIdentifierSet];
      int v71 = [(MPModelObject *)v72 initWithIdentifiers:v69 block:v68];
    }

    [v4 setLyrics:v71];
    uint64_t v67 = *(void *)(a1 + 32);
  }
  int v73 = *(void **)(v67 + 24);
  if (v73)
  {
    uint64_t v74 = *(void *)(a1 + 40);
    int v75 = [*(id *)(a1 + 48) hasLoadedValueForKey:@"MPModelRelationshipSongPlaybackPosition"];
    if (v75)
    {
      uint64_t v76 = [*(id *)(a1 + 48) playbackPosition];
    }
    else
    {
      uint64_t v76 = 0;
    }
    int v77 = [v73 modelObjectWithStoreItemMetadata:v74 sourceModelObject:v76 userIdentity:*(void *)(a1 + 56)];
    [v4 setPlaybackPosition:v77];

    if (v75) {
  }
    }
}

MPArtworkCatalog *__91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestToken];
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    id v3 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    id v4 = [(MPArtworkCatalog *)v2 initWithToken:v1 dataSource:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 universalStore];
  uint64_t v5 = [v4 adamID];

  if (!v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
    v6[3] = &unk_1E57FA390;
    id v7 = *(id *)(a1 + 32);
    [v3 setUniversalStoreIdentifiersWithBlock:v6];
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v17 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 2) != 0)
  {
    char v5 = [v3 hasLoadedValueForKey:@"MPModelPropertyAlbumTitle"];
    id v4 = v17;
    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [*(id *)(a1 + 40) collectionName];
      [v17 setTitle:v6];

      id v4 = v17;
    }
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 4) != 0)
  {
    char v7 = [v4 hasLoadedValueForKey:@"MPModelPropertyAlbumReleaseDateComponents"];
    id v4 = v17;
    if ((v7 & 1) == 0)
    {
      id v8 = [*(id *)(a1 + 40) releaseDate];
      if (v8)
      {
        id v9 = +[MPStoreItemMetadata storeServerCalendar];
        id v10 = [v9 components:1048604 fromDate:v8];
        [v17 setReleaseDateComponents:v10];
      }
      else
      {
        [v17 setReleaseDateComponents:0];
      }

      id v4 = v17;
    }
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 8) != 0)
  {
    char v11 = [v4 hasLoadedValueForKey:@"MPModelPropertyAlbumYear"];
    id v4 = v17;
    if ((v11 & 1) == 0)
    {
      id v12 = [*(id *)(a1 + 40) releaseDate];
      if (v12)
      {
        id v13 = +[MPStoreItemMetadata storeServerCalendar];
        uint64_t v14 = [v13 component:4 fromDate:v12];
      }
      else
      {
        uint64_t v14 = 0;
      }
      [v17 setYear:v14];

      id v4 = v17;
    }
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 0x10) != 0)
  {
    char v15 = [v4 hasLoadedValueForKey:@"MPModelRelationshipAlbumArtist"];
    id v4 = v17;
    if ((v15 & 1) == 0)
    {
      [v17 setArtist:0];
      id v4 = v17;
    }
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 56) & 0x20) != 0)
  {
    char v16 = [v4 hasLoadedValueForKey:@"MPModelPropertyAlbumTrackCount"];
    id v4 = v17;
    if ((v16 & 1) == 0)
    {
      objc_msgSend(v17, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
      id v4 = v17;
    }
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
  v5[3] = &unk_1E57F9580;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  [v4 setUniversalStoreIdentifiersWithBlock:v5];
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 60) & 2) != 0)
  {
    id v7 = v3;
    char v5 = [v3 hasLoadedValueForKey:@"MPModelPropertyPersonName"];
    id v4 = v7;
    if ((v5 & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 40) artistName];
      [v7 setName:v6];

      id v4 = v7;
    }
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 64) & 2) != 0)
  {
    id v7 = v3;
    char v5 = [v3 hasLoadedValueForKey:@"MPModelPropertyPersonName"];
    id v4 = v7;
    if ((v5 & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 40) composerName];
      [v7 setName:v6];

      id v4 = v7;
    }
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 68) & 2) != 0)
  {
    id v9 = v3;
    char v5 = [v3 hasLoadedValueForKey:@"MPModelPropertyGenreName"];
    id v4 = v9;
    if ((v5 & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 40) genreNames];
      id v7 = [v6 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
      [v9 setName:v8];

      id v4 = v9;
    }
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 76) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyLyricsText"] & 1) == 0)
  {
    [v6 setText:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 76) & 4) != 0
    && ([v6 hasLoadedValueForKey:@"MPModelPropertyLyricsHasStoreLyrics"] & 1) == 0)
  {
    objc_msgSend(v6, "setHasStoreLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasLyrics"));
  }
  id v4 = v6;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 76) & 8) != 0)
  {
    char v5 = [v6 hasLoadedValueForKey:@"MPModelPropertyLyricsHasTimeSyncedLyrics"];
    id v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v6, "setHasTimeSyncedLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasTimeSyncedLyrics"));
      id v4 = v6;
    }
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) universalStore];
  uint64_t v4 = [v3 adamID];

  if (!v4)
  {
    char v5 = [*(id *)(a1 + 40) artistStoreID];
    [v6 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v5)];
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 collectionStoreID];
  [v3 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v4)];
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = [*(id *)(a1 + 32) universalStore];
  uint64_t v4 = [v3 adamID];

  if (!v4)
  {
    char v5 = [*(id *)(a1 + 40) storeID];
    [v17 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v5)];
  }
  id v6 = [*(id *)(a1 + 32) universalStore];
  id v7 = [v6 formerAdamIDs];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v9 = [*(id *)(a1 + 40) formerStoreAdamIDs];
    [v17 setFormerAdamIDs:v9];
  }
  id v10 = [*(id *)(a1 + 32) universalStore];
  uint64_t v11 = [v10 subscriptionAdamID];

  if (!v11) {
    objc_msgSend(v17, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 40), "subscriptionAdamID"));
  }
  id v12 = [*(id *)(a1 + 32) universalStore];
  uint64_t v13 = [v12 purchasedAdamID];

  if (!v13) {
    objc_msgSend(v17, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 40), "purchasedAdamID"));
  }
  uint64_t v14 = [*(id *)(a1 + 32) universalStore];
  char v15 = [v14 universalCloudLibraryID];

  if (!v15)
  {
    char v16 = [*(id *)(a1 + 40) cloudUniversalLibraryID];
    [v17 setUniversalCloudLibraryID:v16];
  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) personalizedStore];
  uint64_t v4 = [v3 cloudID];

  if (!v4) {
    objc_msgSend(v8, "setCloudID:", objc_msgSend(*(id *)(a1 + 40), "cloudID"));
  }
  char v5 = [*(id *)(a1 + 32) personalizedStore];
  id v6 = [v5 cloudAlbumID];

  if (!v6)
  {
    id v7 = [*(id *)(a1 + 40) cloudAlbumID];
    [v8 setCloudAlbumID:v7];
  }
}

@end