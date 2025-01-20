@interface MPStoreModelPlaylistBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelPlaylistBuilder

+ (id)allSupportedProperties
{
  v12[41] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v12[0] = @"MPModelPropertyPlaylistName";
  v12[1] = @"MPModelPropertyPlaylistTrackCount";
  v12[2] = @"MPModelPropertyPlaylistEditorNotes";
  v12[3] = @"MPModelPropertyPlaylistShortEditorNotes";
  v12[4] = @"MPModelPropertyPlaylistReleaseDateComponents";
  v12[5] = @"MPModelPropertyPlaylistLastModifiedDateComponents";
  v12[6] = @"MPModelPropertyPlaylistArtwork";
  v12[7] = @"MPModelPropertyPlaylistEditorialArtwork";
  v12[8] = @"MPModelPropertyPlaylistTracksTiledArtwork";
  v12[9] = @"MPModelPropertyPlaylistHasCleanContent";
  v12[10] = @"MPModelPropertyPlaylistHasExplicitContent";
  v12[11] = @"MPModelPropertyPlaylistType";
  v12[12] = @"MPModelPropertyPlaylistLibraryAdded";
  v12[13] = @"MPModelPropertyPlaylistKeepLocalEnableState";
  v12[14] = @"MPModelPropertyPlaylistKeepLocalManagedStatusReason";
  v12[15] = @"MPModelPropertyPlaylistKeepLocalConstraints";
  v12[16] = @"MPModelPropertyPlaylistIsOwner";
  v12[17] = @"MPModelPropertyPlaylistCuratorPlaylist";
  v12[18] = @"MPModelPropertyPlaylistPublicPlaylist";
  v12[19] = @"MPModelPropertyPlaylistVisiblePlaylist";
  v12[20] = @"MPModelPropertyPlaylistSubscribed";
  v12[21] = @"MPModelPropertyPlaylistUserEditableComponents";
  v12[22] = @"MPModelPropertyPlaylistShareURL";
  v12[23] = @"MPModelPropertyPlaylistShareShortURL";
  v12[24] = @"MPModelPropertyPlaylistDescriptionText";
  v12[25] = @"MPModelPropertyPlaylistCloudVersionHash";
  v12[26] = @"MPModelPropertyPlaylistVersionHash";
  v12[27] = @"MPModelPropertyPlaylistTraits";
  v12[28] = @"MPModelPropertyPlaylistIsFavorite";
  v12[29] = @"MPModelPropertyPlaylistIsDisliked";
  v12[30] = @"MPModelPropertyPlaylistDateFavorited";
  v12[31] = @"MPModelPropertyPlaylistIsFavoriteSongsPlaylist";
  v12[32] = @"MPModelPropertyPlaylistCoverArtworkRecipe";
  v12[33] = @"MPModelPropertyPlaylistIsCollaborative";
  v12[34] = @"MPModelPropertyPlaylistCollaborationSharingMode";
  v12[35] = @"MPModelPropertyPlaylistCollaborationMode";
  v12[36] = @"MPModelPropertyPlaylistCollaboratorPermissions";
  v12[37] = @"MPModelPropertyPlaylistCollaborationInvitationURL";
  v12[38] = @"MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate";
  v12[39] = @"MPModelPropertyPlaylistCollaborationJoinRequestIsPending";
  v12[40] = @"MPModelPropertyPlaylistCollaboratorStatus";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:41];
  v9[0] = @"MPModelPropertyPersonName";
  v9[1] = @"MPModelPropertyCuratorHandle";
  v10 = @"MPModelRelationshipPlaylistCurator";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v5 = +[MPPropertySet propertySetWithProperties:v4];
  v11 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v6];

  return v7;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_requestedPlaylistProperties = &self->_requestedPlaylistProperties;
  id v125 = v8;
  if ((*(unsigned char *)&self->_requestedPlaylistProperties & 1) == 0)
  {
    v12 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v13 = [v12 properties];
    int v14 = [v13 containsObject:@"MPModelPropertyPlaylistName"];
    uint64_t v15 = 2;
    if (!v14) {
      uint64_t v15 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFFDLL | v15;
    int v16 = [v13 containsObject:@"MPModelPropertyPlaylistTrackCount"];
    uint64_t v17 = 4;
    if (!v16) {
      uint64_t v17 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFFBLL | v17;
    int v18 = [v13 containsObject:@"MPModelPropertyPlaylistEditorNotes"];
    uint64_t v19 = 8;
    if (!v18) {
      uint64_t v19 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFF7 | v19;
    int v20 = [v13 containsObject:@"MPModelPropertyPlaylistShortEditorNotes"];
    uint64_t v21 = 16;
    if (!v20) {
      uint64_t v21 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFEFLL | v21;
    int v22 = [v13 containsObject:@"MPModelPropertyPlaylistReleaseDateComponents"];
    uint64_t v23 = 32;
    if (!v22) {
      uint64_t v23 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFDFLL | v23;
    int v24 = [v13 containsObject:@"MPModelPropertyPlaylistLastModifiedDateComponents"];
    uint64_t v25 = 64;
    if (!v24) {
      uint64_t v25 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFBFLL | v25;
    int v26 = [v13 containsObject:@"MPModelPropertyPlaylistArtwork"];
    uint64_t v27 = 128;
    if (!v26) {
      uint64_t v27 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFF7FLL | v27;
    int v28 = [v13 containsObject:@"MPModelPropertyPlaylistEditorialArtwork"];
    uint64_t v29 = 256;
    if (!v28) {
      uint64_t v29 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFEFFLL | v29;
    int v30 = [v13 containsObject:@"MPModelPropertyPlaylistTracksTiledArtwork"];
    uint64_t v31 = 512;
    if (!v30) {
      uint64_t v31 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFDFFLL | v31;
    int v32 = [v13 containsObject:@"MPModelPropertyPlaylistLibraryAdded"];
    uint64_t v33 = 0x2000;
    if (!v32) {
      uint64_t v33 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFDFFFLL | v33;
    int v34 = [v13 containsObject:@"MPModelPropertyPlaylistKeepLocalEnableState"];
    uint64_t v35 = 0x4000;
    if (!v34) {
      uint64_t v35 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFBFFFLL | v35;
    int v36 = [v13 containsObject:@"MPModelPropertyPlaylistKeepLocalManagedStatus"];
    uint64_t v37 = 0x8000;
    if (!v36) {
      uint64_t v37 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFF7FFFLL | v37;
    int v38 = [v13 containsObject:@"MPModelPropertyPlaylistKeepLocalManagedStatusReason"];
    uint64_t v39 = 0x10000;
    if (!v38) {
      uint64_t v39 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFEFFFFLL | v39;
    int v40 = [v13 containsObject:@"MPModelPropertyPlaylistKeepLocalConstraints"];
    uint64_t v41 = 0x20000;
    if (!v40) {
      uint64_t v41 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFDFFFFLL | v41;
    int v42 = [v13 containsObject:@"MPModelPropertyPlaylistHasCleanContent"];
    uint64_t v43 = 1024;
    if (!v42) {
      uint64_t v43 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFBFFLL | v43;
    int v44 = [v13 containsObject:@"MPModelPropertyPlaylistHasExplicitContent"];
    uint64_t v45 = 2048;
    if (!v44) {
      uint64_t v45 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFF7FFLL | v45;
    int v46 = [v13 containsObject:@"MPModelPropertyPlaylistType"];
    uint64_t v47 = 4096;
    if (!v46) {
      uint64_t v47 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFEFFFLL | v47;
    int v48 = [v13 containsObject:@"MPModelPropertyPlaylistIsOwner"];
    uint64_t v49 = 0x80000;
    if (!v48) {
      uint64_t v49 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFF7FFFFLL | v49;
    int v50 = [v13 containsObject:@"MPModelPropertyPlaylistCuratorPlaylist"];
    uint64_t v51 = 0x40000;
    if (!v50) {
      uint64_t v51 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFBFFFFLL | v51;
    int v52 = [v13 containsObject:@"MPModelPropertyPlaylistPublicPlaylist"];
    uint64_t v53 = 0x100000;
    if (!v52) {
      uint64_t v53 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFEFFFFFLL | v53;
    int v54 = [v13 containsObject:@"MPModelPropertyPlaylistVisiblePlaylist"];
    uint64_t v55 = 0x200000;
    if (!v54) {
      uint64_t v55 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFDFFFFFLL | v55;
    int v56 = [v13 containsObject:@"MPModelPropertyPlaylistSubscribed"];
    uint64_t v57 = 0x400000;
    if (!v56) {
      uint64_t v57 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFFBFFFFFLL | v57;
    int v58 = [v13 containsObject:@"MPModelPropertyPlaylistUserEditableComponents"];
    uint64_t v59 = 0x800000;
    if (!v58) {
      uint64_t v59 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFF7FFFFFLL | v59;
    int v60 = [v13 containsObject:@"MPModelPropertyPlaylistShareURL"];
    uint64_t v61 = 0x1000000;
    if (!v60) {
      uint64_t v61 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFEFFFFFFLL | v61;
    int v62 = [v13 containsObject:@"MPModelPropertyPlaylistShareShortURL"];
    uint64_t v63 = 0x2000000;
    if (!v62) {
      uint64_t v63 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFDFFFFFFLL | v63;
    int v64 = [v13 containsObject:@"MPModelPropertyPlaylistDescriptionText"];
    uint64_t v65 = 0x4000000;
    if (!v64) {
      uint64_t v65 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFFBFFFFFFLL | v65;
    int v66 = [v13 containsObject:@"MPModelPropertyPlaylistCloudVersionHash"];
    uint64_t v67 = 0x8000000;
    if (!v66) {
      uint64_t v67 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFF7FFFFFFLL | v67;
    int v68 = [v13 containsObject:@"MPModelPropertyPlaylistTraits"];
    uint64_t v69 = 0x10000000;
    if (!v68) {
      uint64_t v69 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFEFFFFFFFLL | v69;
    int v70 = [v13 containsObject:@"MPModelPropertyPlaylistVersionHash"];
    uint64_t v71 = 0x20000000;
    if (!v70) {
      uint64_t v71 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFDFFFFFFFLL | v71;
    int v72 = [v13 containsObject:@"MPModelPropertyPlaylistIsFavorite"];
    uint64_t v73 = 0x40000000;
    if (!v72) {
      uint64_t v73 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFFBFFFFFFFLL | v73;
    int v74 = [v13 containsObject:@"MPModelPropertyPlaylistIsDisliked"];
    uint64_t v75 = 0x80000000;
    if (!v74) {
      uint64_t v75 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFF7FFFFFFFLL | v75;
    int v76 = [v13 containsObject:@"MPModelPropertyPlaylistDateFavorited"];
    uint64_t v77 = 0x100000000;
    if (!v76) {
      uint64_t v77 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFEFFFFFFFFLL | v77;
    int v78 = [v13 containsObject:@"MPModelPropertyPlaylistIsFavoriteSongsPlaylist"];
    uint64_t v79 = 0x200000000;
    if (!v78) {
      uint64_t v79 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFDFFFFFFFFLL | v79;
    int v80 = [v13 containsObject:@"MPModelPropertyPlaylistCoverArtworkRecipe"];
    uint64_t v81 = 0x400000000;
    if (!v80) {
      uint64_t v81 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFFBFFFFFFFFLL | v81;
    int v82 = [v13 containsObject:@"MPModelPropertyPlaylistIsCollaborative"];
    uint64_t v83 = 0x800000000;
    if (!v82) {
      uint64_t v83 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFF7FFFFFFFFLL | v83;
    int v84 = [v13 containsObject:@"MPModelPropertyPlaylistCollaborationSharingMode"];
    uint64_t v85 = 0x1000000000;
    if (!v84) {
      uint64_t v85 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFEFFFFFFFFFLL | v85;
    int v86 = [v13 containsObject:@"MPModelPropertyPlaylistCollaborationMode"];
    uint64_t v87 = 0x2000000000;
    if (!v86) {
      uint64_t v87 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFDFFFFFFFFFLL | v87;
    int v88 = [v13 containsObject:@"MPModelPropertyPlaylistCollaboratorPermissions"];
    uint64_t v89 = 0x4000000000;
    if (!v88) {
      uint64_t v89 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFFBFFFFFFFFFLL | v89;
    int v90 = [v13 containsObject:@"MPModelPropertyPlaylistCollaborationInvitationURL"];
    uint64_t v91 = 0x8000000000;
    if (!v90) {
      uint64_t v91 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFF7FFFFFFFFFLL | v91;
    int v92 = [v13 containsObject:@"MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"];
    uint64_t v93 = 0x10000000000;
    if (!v92) {
      uint64_t v93 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFEFFFFFFFFFFLL | v93;
    int v94 = [v13 containsObject:@"MPModelPropertyPlaylistCollaborationJoinRequestIsPending"];
    uint64_t v95 = 0x20000000000;
    if (!v94) {
      uint64_t v95 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFDFFFFFFFFFFLL | v95;
    int v96 = [v13 containsObject:@"MPModelPropertyPlaylistCollaboratorStatus"];
    uint64_t v97 = 0x40000000000;
    if (!v96) {
      uint64_t v97 = 0;
    }
    *(void *)p_requestedPlaylistProperties = *(void *)p_requestedPlaylistProperties & 0xFFFFFBFFFFFFFFFFLL | v97;
    v98 = [v12 relationships];
    v99 = [v98 objectForKey:@"MPModelRelationshipPlaylistCurator"];
    v100 = v99;
    if (v99)
    {
      [v99 properties];
      id v101 = v10;
      v103 = id v102 = v9;
      *(unsigned char *)&self->_requestedPlaylistProperties.curator |= 1u;
      if ([v103 containsObject:@"MPModelPropertyPersonName"]) {
        char v104 = 2;
      }
      else {
        char v104 = 0;
      }
      *(unsigned char *)&self->_requestedPlaylistProperties.curator = *(unsigned char *)&self->_requestedPlaylistProperties.curator & 0xFD | v104;
      if ([v103 containsObject:@"MPModelPropertyCuratorHandle"]) {
        char v105 = 4;
      }
      else {
        char v105 = 0;
      }
      *(unsigned char *)&self->_requestedPlaylistProperties.curator = *(unsigned char *)&self->_requestedPlaylistProperties.curator & 0xFB | v105;

      id v9 = v102;
      id v10 = v101;
    }
    *(void *)p_requestedPlaylistProperties |= 1uLL;

    id v8 = v125;
  }
  v106 = [v8 cloudUniversalLibraryID];
  v107 = [v8 storeID];
  v108 = MPStoreItemMetadataStringNormalizeStoreIDValue(v107);

  if ([v108 length] || objc_msgSend(v106, "length"))
  {
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
    v129[3] = &unk_1E57EFAA0;
    id v130 = v108;
    id v131 = v106;
    id v124 = v10;
    id v132 = v10;
    id v109 = v8;
    id v133 = v109;
    v110 = (void *)MEMORY[0x19971E0F0](v129);
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v126[3] = &unk_1E57EFAF0;
    v111 = self;
    v126[4] = self;
    id v112 = v109;
    id v127 = v112;
    id v113 = v9;
    id v114 = v9;
    id v128 = v114;
    v115 = (void *)MEMORY[0x19971E0F0](v126);
    if (v114)
    {
      v116 = [v114 identifiers];
      v117 = (MPIdentifierSet *)[v116 copyWithSource:@"StorePlatform" block:v110];
      uint64_t v118 = [v114 copyWithIdentifiers:v117 block:v115];
    }
    else
    {
      v119 = [MPModelPlaylist alloc];
      v120 = [MPIdentifierSet alloc];
      v116 = +[MPModelPlaylistKind identityKind];
      v117 = [(MPIdentifierSet *)v120 initWithSource:@"StorePlatform" modelKind:v116 block:v110];
      uint64_t v118 = [(MPModelObject *)v119 initWithIdentifiers:v117 block:v115];
    }
    v121 = (void *)v118;

    if (![(MPStoreModelObjectBuilder *)v111 preventStoreItemMetadataCaching])
    {
      v122 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
      [v122 addStoreItemMetadata:v112];
    }
    id v9 = v113;
    id v10 = v124;
    id v8 = v125;
  }
  else
  {
    v121 = 0;
  }

  return v121;
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v12[3] = &unk_1E57F1298;
  id v4 = v3;
  id v13 = v4;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  [v4 setUniversalStoreIdentifiersWithBlock:v12];
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
    id v10 = [v9 DSIDForUserIdentity:*(void *)(a1 + 48) outError:0];
    id v8 = [v10 stringValue];
  }
  if ([v8 length]) {
    [v4 setPersonalStoreIdentifiersWithPersonID:v8 block:&__block_literal_global_12877];
  }
  v11 = [*(id *)(a1 + 56) versionHash];
  [v4 setVersionHash:v11];
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 2) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyPlaylistName"] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 40) name];
    [v4 setName:v5];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistTrackCount"] & 1) == 0)
  {
    objc_msgSend(v4, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistEditorNotes"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 40) editorNotes];
    [v4 setEditorNotes:v6];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistShortEditorNotes"] & 1) == 0)
  {
    v7 = [*(id *)(a1 + 40) shortEditorNotes];
    [v4 setShortEditorNotes:v7];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistDescriptionText"] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) editorNotes];
    if ([v8 length])
    {
      [v4 setDescriptionText:v8];
    }
    else
    {
      id v9 = [*(id *)(a1 + 40) descriptionText];
      [v4 setDescriptionText:v9];
    }
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCloudVersionHash"] & 1) == 0)
  {
    id v10 = [*(id *)(a1 + 40) versionHash];
    [v4 setCloudVersionHash:v10];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistVersionHash"] & 1) == 0)
  {
    v11 = [*(id *)(a1 + 40) versionHash];
    [v4 setVersionHash:v11];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistReleaseDateComponents"] & 1) == 0)
  {
    v12 = [*(id *)(a1 + 40) releaseDate];
    if (v12)
    {
      id v13 = +[MPStoreItemMetadata storeServerCalendar];
      id v14 = [v13 components:28 fromDate:v12];
      [v4 setReleaseDateComponents:v14];
    }
    else
    {
      [v4 setReleaseDateComponents:0];
    }
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistLastModifiedDateComponents"] & 1) == 0)
  {
    id v15 = [*(id *)(a1 + 40) lastModifiedDate];
    if (v15)
    {
      int v16 = +[MPStoreItemMetadata storeServerCalendar];
      id v17 = [v16 components:3145980 fromDate:v15];
    }
    else
    {
      id v17 = 0;
    }
    [v4 setLastModifiedDateComponents:v17];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistTraits"] & 1) == 0)
  {
    if ([*(id *)(a1 + 40) supportsSing]) {
      uint64_t v18 = 256;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = [*(id *)(a1 + 40) audioTraits];
    if ([v19 containsObject:@"spatial"]) {
      v18 |= 8uLL;
    }
    if ([v19 containsObject:@"atmos"]) {
      v18 |= 0x10uLL;
    }
    if ([v19 containsObject:@"surround"]) {
      uint64_t v20 = v18 | 0x20;
    }
    else {
      uint64_t v20 = v18;
    }
    [v4 setTraits:v20];
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 24);
  if ((v21 & 0xC00) != 0)
  {
    int v22 = [*(id *)(a1 + 40) childStoreItemMetadatas];
    if ([v22 count])
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        char v26 = 0;
        int v27 = 0;
        uint64_t v28 = *(void *)v61;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v61 != v28) {
              objc_enumerationMutation(v23);
            }
            if ([*(id *)(*((void *)&v60 + 1) + 8 * i) isExplicitContent]) {
              char v26 = 1;
            }
            else {
              int v27 = 1;
            }
            if ((v26 & 1) != 0 || (*(unsigned char *)(*(void *)(a1 + 32) + 25) & 8) == 0)
            {
              if (v27) {
                goto LABEL_72;
              }
              if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 4) == 0)
              {
                int v27 = 0;
LABEL_72:

                uint64_t v30 = v26 & 1;
                uint64_t v31 = v27 != 0;
                goto LABEL_73;
              }
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v64 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
      else
      {
        char v26 = 0;
        LOBYTE(v27) = 0;
      }

      uint64_t v30 = v26 & 1;
      uint64_t v31 = v27 & 1;
    }
    else
    {
      uint64_t v30 = [*(id *)(a1 + 40) isExplicitContent];
      uint64_t v31 = v30 ^ 1;
    }
LABEL_73:
    if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 8) != 0
      && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistHasExplicitContent"] & 1) == 0)
    {
      [v4 setHasExplicitContent:v30];
    }
    if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 4) != 0
      && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistHasCleanContent"] & 1) == 0)
    {
      [v4 setHasCleanContent:v31];
    }

    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 24);
  }
  if ((v21 & 0x1000) != 0 && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistType"] & 1) == 0)
  {
    int v32 = [*(id *)(a1 + 40) playlistType];
    if ([v32 isEqualToString:@"editorial"])
    {
      if ([*(id *)(a1 + 40) isChart]) {
        uint64_t v33 = 8;
      }
      else {
        uint64_t v33 = 4;
      }
    }
    else if ([v32 isEqualToString:@"external"])
    {
      uint64_t v33 = 5;
    }
    else if ([v32 isEqualToString:@"user-shared"])
    {
      uint64_t v33 = 6;
    }
    else if ([v32 isEqualToString:@"personal-mix"])
    {
      uint64_t v33 = 7;
    }
    else
    {
      uint64_t v33 = 0;
    }
    [v4 setType:v33];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistLibraryAdded"] & 1) == 0)
  {
    [v4 setLibraryAdded:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistKeepLocalEnableState"] & 1) == 0)
  {
    [v4 setKeepLocalEnableState:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistKeepLocalManagedStatus"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatus:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistKeepLocalManagedStatusReason"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatusReason:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistKeepLocalConstraints"] & 1) == 0)
  {
    [v4 setKeepLocalConstraints:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsOwner"] & 1) == 0)
  {
    [v4 setOwner:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCuratorPlaylist"] & 1) == 0)
  {
    [v4 setCuratorPlaylist:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistPublicPlaylist"] & 1) == 0)
  {
    [v4 setPublicPlaylist:1];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistVisiblePlaylist"] & 1) == 0)
  {
    [v4 setVisiblePlaylist:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistSubscribed"] & 1) == 0)
  {
    [v4 setSubscribed:1];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistUserEditableComponents"] & 1) == 0)
  {
    [v4 setUserEditableComponents:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistShareURL"] & 1) == 0)
  {
    int v34 = [*(id *)(a1 + 40) URL];
    [v4 setShareURL:v34];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistShareShortURL"] & 1) == 0)
  {
    uint64_t v35 = [*(id *)(a1 + 40) shortURL];
    [v4 setShareShortURL:v35];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsFavorite"] & 1) == 0)
  {
    [v4 setIsFavorite:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsFavoriteSongsPlaylist"] & 1) == 0)
  {
    [v4 setIsFavoriteSongsPlaylist:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 27) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsDisliked"] & 1) == 0)
  {
    [v4 setIsDisliked:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistDateFavorited"] & 1) == 0)
  {
    [v4 setDateFavorited:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistArtwork"] & 1) == 0)
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v58[3] = &unk_1E57EFAC8;
    id v59 = *(id *)(a1 + 40);
    [v4 setArtworkCatalogBlock:v58];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistEditorialArtwork"] & 1) == 0)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v56[3] = &unk_1E57EFAC8;
    id v57 = *(id *)(a1 + 40);
    [v4 setEditorialArtworkCatalogBlock:v56];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 25) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistTracksTiledArtwork"] & 1) == 0)
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
    v54[3] = &unk_1E57F7CE8;
    id v55 = *(id *)(a1 + 40);
    [v4 setTiledArtworkCatalogBlock:v54];
  }
  uint64_t v36 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v36 + 32))
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v52[3] = &unk_1E57FA3B8;
    id v53 = *(id *)(a1 + 40);
    uint64_t v37 = (void *)MEMORY[0x19971E0F0](v52);
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    int v48 = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11;
    uint64_t v49 = &unk_1E57F50B8;
    int v38 = *(void **)(a1 + 40);
    uint64_t v50 = *(void *)(a1 + 32);
    id v51 = v38;
    uint64_t v39 = (void *)MEMORY[0x19971E0F0](&v46);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", @"MPModelRelationshipPlaylistCurator", v46, v47, v48, v49, v50))
    {
      int v40 = [*(id *)(a1 + 48) curator];
      uint64_t v41 = [v40 identifiers];
      id v42 = [(MPIdentifierSet *)v41 copyWithSource:@"StorePlatform" block:v37];
      uint64_t v43 = (MPModelCurator *)[v40 copyWithIdentifiers:v42 block:v39];
    }
    else
    {
      int v44 = [MPModelCurator alloc];
      uint64_t v45 = [MPIdentifierSet alloc];
      int v40 = +[MPModelCuratorActualKind identityKind];
      uint64_t v41 = [(MPIdentifierSet *)v45 initWithSource:@"StorePlatform" modelKind:v40 block:v37];
      uint64_t v43 = [(MPModelObject *)v44 initWithIdentifiers:v41 block:v39];
    }

    [v4 setCurator:v43];
    uint64_t v36 = *(void *)(a1 + 32);
  }
  if ((*(unsigned char *)(v36 + 28) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCoverArtworkRecipe"] & 1) == 0)
  {
    [v4 setCoverArtworkRecipe:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsCollaborative"] & 1) == 0)
  {
    objc_msgSend(v4, "setCollaborative:", objc_msgSend(*(id *)(a1 + 40), "isCollaborative"));
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCollaborationSharingMode"] & 1) == 0)
  {
    [v4 setCollaborationSharingMode:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCollaborationMode"] & 1) == 0)
  {
    [v4 setCollaborationMode:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCollaboratorPermissions"] & 1) == 0)
  {
    [v4 setCollaboratorPermissions:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCollaborationInvitationURL"] & 1) == 0)
  {
    [v4 setCollaborationInvitationURL:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 29) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"] & 1) == 0)
  {
    [v4 setCollaborationInvitationURLExpirationDate:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 29) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCollaborationJoinRequestIsPending"] & 1) == 0)
  {
    [v4 setCollaborationJoinRequestIsPending:0];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 29) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistCollaboratorStatus"] & 1) == 0)
  {
    [v4 setCollaboratorStatus:0];
  }
}

MPArtworkCatalog *__95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestToken];
  v2 = v1;
  if (v1)
  {
    [v1 setCropStyle:*MEMORY[0x1E4FB8480]];
    id v3 = [MPArtworkCatalog alloc];
    id v4 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    v5 = [(MPArtworkCatalog *)v3 initWithToken:v2 dataSource:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

MPArtworkCatalog *__95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestTokenForEditorialArtworkKind:@"subscriptionCover"];
  v2 = v1;
  if (v1)
  {
    [v1 setCropStyle:@"fc"];
    id v3 = [MPArtworkCatalog alloc];
    id v4 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    v5 = [(MPArtworkCatalog *)v3 initWithToken:v2 dataSource:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

MPArtworkCatalog *__95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7 = objc_alloc_init(MPTiledArtworkRequest);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
  v12[3] = &unk_1E57F6428;
  id v13 = *(id *)(a1 + 32);
  [(MPTiledArtworkRequest *)v7 setArtworkCatalogsBlock:v12];
  [(MPTiledArtworkRequest *)v7 setAllowsSynchronousArtworkCatalogsBlockExecution:1];
  [(MPTiledArtworkRequest *)v7 setNumberOfRows:a3];
  [(MPTiledArtworkRequest *)v7 setNumberOfColumns:a4];
  id v8 = [MPArtworkCatalog alloc];
  id v9 = +[MPTiledArtworkDataSource sharedDataSource];
  id v10 = [(MPArtworkCatalog *)v8 initWithToken:v7 dataSource:v9];

  return v10;
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 universalStore];
  uint64_t v5 = [v4 adamID];

  if (!v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
    v6[3] = &unk_1E57FA390;
    id v7 = *(id *)(a1 + 32);
    [v3 setUniversalStoreIdentifiersWithBlock:v6];
  }
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 32);
  if ((v3 & 2) != 0)
  {
    id v4 = [*(id *)(a1 + 40) curatorName];
    [v6 setName:v4];

    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 32);
  }
  if ((v3 & 4) != 0)
  {
    uint64_t v5 = [*(id *)(a1 + 40) curatorHandle];
    [v6 setHandle:v5];
  }
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 curatorID];
  [v3 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v4)];
}

id __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, unint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [*(id *)(a1 + 32) artworkTrackIDs];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v18;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(a1 + 32) childStorePlatformDictionaryForArtworkTrackID:*(void *)(*((void *)&v17 + 1) + 8 * v8)];
        id v10 = [*(id *)(a1 + 32) artworkRequestTokenForStorePlatformDictionary:v9];
        if (v10)
        {
          v11 = [MPArtworkCatalog alloc];
          v12 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
          id v13 = [(MPArtworkCatalog *)v11 initWithToken:v10 dataSource:v12];

          if (v13)
          {
            if (!v6) {
              id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v6 addObject:v13];
          }
        }
        unint64_t v14 = [v6 count];

        if (v14 >= a2) {
          break;
        }
        if (v5 == ++v8)
        {
          uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(id *a1, void *a2)
{
  id v9 = a2;
  id v3 = [a1[4] universalStore];
  uint64_t v4 = [v3 globalPlaylistID];
  if (v4)
  {
  }
  else
  {
    uint64_t v5 = [a1[5] length];

    if (v5) {
      [v9 setGlobalPlaylistID:a1[5]];
    }
  }
  id v6 = [a1[4] universalStore];
  uint64_t v7 = [v6 universalCloudLibraryID];
  if (v7)
  {
  }
  else
  {
    uint64_t v8 = [a1[6] length];

    if (v8) {
      [v9 setUniversalCloudLibraryID:a1[6]];
    }
  }
}

@end