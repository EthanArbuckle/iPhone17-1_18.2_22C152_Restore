@interface MPStoreModelAlbumBuilder
+ (id)allSupportedProperties;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelAlbumBuilder

+ (id)allSupportedProperties
{
  v15[30] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v15[0] = @"MPModelPropertyAlbumTitle";
  v15[1] = @"MPModelPropertyAlbumTrackCount";
  v15[2] = @"MPModelPropertyAlbumMaximumItemTrackNumber";
  v15[3] = @"MPModelPropertyAlbumDiscCount";
  v15[4] = @"MPModelPropertyAlbumHasCleanContent";
  v15[5] = @"MPModelPropertyAlbumHasExplicitContent";
  v15[6] = @"MPModelPropertyAlbumIsCompilation";
  v15[7] = @"MPModelPropertyAlbumIsClassical";
  v15[8] = @"MPModelPropertyAlbumReleaseDateComponents";
  v15[9] = @"MPModelPropertyAlbumArtwork";
  v15[10] = @"MPModelPropertyAlbumLibraryAddEligible";
  v15[11] = @"MPModelPropertyAlbumYear";
  v15[12] = @"MPModelPropertyAlbumLibraryAdded";
  v15[13] = @"MPModelPropertyAlbumKeepLocalEnableState";
  v15[14] = @"MPModelPropertyAlbumKeepLocalManagedStatus";
  v15[15] = @"MPModelPropertyAlbumKeepLocalManagedStatusReason";
  v15[16] = @"MPModelPropertyAlbumKeepLocalConstraints";
  v15[17] = @"MPModelPropertyAlbumCopyrightText";
  v15[18] = @"MPModelPropertyAlbumPreorder";
  v15[19] = @"MPModelPropertyAlbumEditorNotes";
  v15[20] = @"MPModelPropertyAlbumShortEditorNotes";
  v15[21] = @"MPModelPropertyAlbumVolumeNormalization";
  v15[22] = @"MPModelPropertyAlbumSongPopularity";
  v15[23] = @"MPModelPropertyAlbumTraits";
  v15[24] = @"MPModelPropertyAlbumVersionHash";
  v15[25] = @"MPModelPropertyAlbumClassicalExperienceAvailable";
  v15[26] = @"MPModelPropertyAlbumIsFavorite";
  v15[27] = @"MPModelPropertyAlbumIsDisliked";
  v15[28] = @"MPModelPropertyAlbumDateFavorited";
  v15[29] = @"MPModelPropertyAlbumIsStoreRedownloadable";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:30];
  v12 = @"MPModelPropertyPersonName";
  v13[0] = @"MPModelRelationshipAlbumArtist";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v5 = +[MPPropertySet propertySetWithProperties:v4];
  v13[1] = @"MPModelRelationshipAlbumGenre";
  v14[0] = v5;
  v11 = @"MPModelPropertyGenreName";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v7 = +[MPPropertySet propertySetWithProperties:v6];
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v9 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v8];

  return v9;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_requestedAlbumProperties = &self->_requestedAlbumProperties;
  if ((*(unsigned char *)&self->_requestedAlbumProperties & 1) == 0)
  {
    id v68 = v9;
    v12 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v13 = [v12 properties];
    if ([v13 containsObject:@"MPModelPropertyAlbumTitle"]) {
      int v14 = 4;
    }
    else {
      int v14 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFFB | v14;
    if ([v13 containsObject:@"MPModelPropertyAlbumTrackCount"]) {
      int v15 = 8;
    }
    else {
      int v15 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFF7 | v15;
    if ([v13 containsObject:@"MPModelPropertyAlbumMaximumItemTrackNumber"]) {
      int v16 = 16;
    }
    else {
      int v16 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFEF | v16;
    if ([v13 containsObject:@"MPModelPropertyAlbumDiscCount"]) {
      int v17 = 32;
    }
    else {
      int v17 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFDF | v17;
    if ([v13 containsObject:@"MPModelPropertyAlbumHasCleanContent"]) {
      int v18 = 64;
    }
    else {
      int v18 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFBF | v18;
    if ([v13 containsObject:@"MPModelPropertyAlbumHasExplicitContent"]) {
      int v19 = 128;
    }
    else {
      int v19 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFF7F | v19;
    if ([v13 containsObject:@"MPModelPropertyAlbumLibraryAdded"]) {
      int v20 = 256;
    }
    else {
      int v20 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFEFF | v20;
    if ([v13 containsObject:@"MPModelPropertyAlbumKeepLocalEnableState"]) {
      int v21 = 512;
    }
    else {
      int v21 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFDFF | v21;
    if ([v13 containsObject:@"MPModelPropertyAlbumKeepLocalManagedStatus"]) {
      int v22 = 1024;
    }
    else {
      int v22 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFBFF | v22;
    if ([v13 containsObject:@"MPModelPropertyAlbumKeepLocalManagedStatusReason"]) {
      int v23 = 2048;
    }
    else {
      int v23 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFF7FF | v23;
    if ([v13 containsObject:@"MPModelPropertyAlbumKeepLocalConstraints"]) {
      int v24 = 4096;
    }
    else {
      int v24 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFEFFF | v24;
    if ([v13 containsObject:@"MPModelPropertyAlbumLibraryAddEligible"]) {
      int v25 = 0x2000;
    }
    else {
      int v25 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFDFFF | v25;
    if ([v13 containsObject:@"MPModelPropertyAlbumIsCompilation"]) {
      int v26 = 0x4000;
    }
    else {
      int v26 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFBFFF | v26;
    if ([v13 containsObject:@"MPModelPropertyAlbumIsClassical"]) {
      int v27 = 0x8000;
    }
    else {
      int v27 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFF7FFF | v27;
    if ([v13 containsObject:@"MPModelPropertyAlbumReleaseDateComponents"]) {
      int v28 = 0x10000;
    }
    else {
      int v28 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFEFFFF | v28;
    if ([v13 containsObject:@"MPModelPropertyAlbumArtwork"]) {
      int v29 = 0x20000;
    }
    else {
      int v29 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFDFFFF | v29;
    if ([v13 containsObject:@"MPModelPropertyAlbumYear"]) {
      int v30 = 0x40000;
    }
    else {
      int v30 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFBFFFF | v30;
    if ([v13 containsObject:@"MPModelPropertyAlbumCopyrightText"]) {
      int v31 = 2;
    }
    else {
      int v31 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFFD | v31;
    if ([v13 containsObject:@"MPModelPropertyAlbumPreorder"]) {
      int v32 = 0x80000;
    }
    else {
      int v32 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFF7FFFF | v32;
    if ([v13 containsObject:@"MPModelPropertyAlbumEditorNotes"]) {
      int v33 = 0x100000;
    }
    else {
      int v33 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFEFFFFF | v33;
    if ([v13 containsObject:@"MPModelPropertyAlbumShortEditorNotes"]) {
      int v34 = 0x200000;
    }
    else {
      int v34 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFDFFFFF | v34;
    if ([v13 containsObject:@"MPModelPropertyAlbumVolumeNormalization"]) {
      int v35 = 0x400000;
    }
    else {
      int v35 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFBFFFFF | v35;
    if ([v13 containsObject:@"MPModelPropertyAlbumSongPopularity"]) {
      int v36 = 0x800000;
    }
    else {
      int v36 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFF7FFFFF | v36;
    if ([v13 containsObject:@"MPModelPropertyAlbumTraits"]) {
      int v37 = 0x2000000;
    }
    else {
      int v37 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFDFFFFFF | v37;
    if ([v13 containsObject:@"MPModelPropertyAlbumVersionHash"]) {
      int v38 = 0x4000000;
    }
    else {
      int v38 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFBFFFFFF | v38;
    if ([v13 containsObject:@"MPModelPropertyAlbumClassicalExperienceAvailable"]) {
      int v39 = 0x8000000;
    }
    else {
      int v39 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xF7FFFFFF | v39;
    if ([v13 containsObject:@"MPModelPropertyAlbumIsFavorite"]) {
      int v40 = 0x10000000;
    }
    else {
      int v40 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xEFFFFFFF | v40;
    if ([v13 containsObject:@"MPModelPropertyAlbumIsDisliked"]) {
      int v41 = 0x20000000;
    }
    else {
      int v41 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xDFFFFFFF | v41;
    if ([v13 containsObject:@"MPModelPropertyAlbumDateFavorited"]) {
      int v42 = 0x40000000;
    }
    else {
      int v42 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xBFFFFFFF | v42;
    if ([v13 containsObject:@"MPModelPropertyAlbumIsStoreRedownloadable"]) {
      unsigned int v43 = 0x80000000;
    }
    else {
      unsigned int v43 = 0;
    }
    *(_DWORD *)p_requestedAlbumProperties = v43 & 0x80000000 | *(_DWORD *)p_requestedAlbumProperties & 0x7FFFFFFF;
    v44 = [v12 relationships];
    v45 = [v44 objectForKey:@"MPModelRelationshipAlbumArtist"];
    v46 = v45;
    if (v45)
    {
      v47 = [v45 properties];
      *(unsigned char *)&self->_requestedAlbumProperties.artist |= 1u;
      if ([v47 containsObject:@"MPModelPropertyPersonName"]) {
        char v48 = 2;
      }
      else {
        char v48 = 0;
      }
      *(unsigned char *)&self->_requestedAlbumProperties.artist = *(unsigned char *)&self->_requestedAlbumProperties.artist & 0xFD | v48;
    }
    v49 = [v44 objectForKey:@"MPModelRelationshipAlbumGenre"];
    v50 = v49;
    if (v49)
    {
      v51 = [v49 properties];
      *(unsigned char *)&self->_requestedAlbumProperties.genre |= 1u;
      if ([v51 containsObject:@"MPModelPropertyGenreName"]) {
        char v52 = 2;
      }
      else {
        char v52 = 0;
      }
      *(unsigned char *)&self->_requestedAlbumProperties.genre = *(unsigned char *)&self->_requestedAlbumProperties.genre & 0xFD | v52;
    }
    v53 = [v44 objectForKey:@"MPModelRelationshipAlbumRepresentativeSong"];
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFEFFFFFF | ((v53 != 0) << 24);

    *(_DWORD *)p_requestedAlbumProperties |= 1u;
    id v9 = v68;
  }
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v72[3] = &unk_1E57F95D0;
  id v54 = v8;
  id v73 = v54;
  id v55 = v10;
  id v74 = v55;
  v56 = (void *)MEMORY[0x19971E0F0](v72);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v69[3] = &unk_1E57EE870;
  v69[4] = self;
  id v57 = v54;
  id v70 = v57;
  id v58 = v9;
  id v71 = v58;
  v59 = (void *)MEMORY[0x19971E0F0](v69);
  if (v58)
  {
    v60 = [v58 identifiers];
    v61 = (MPIdentifierSet *)[v60 copyWithSource:@"StorePlatform" block:v56];
    uint64_t v62 = [v58 copyWithIdentifiers:v61 block:v59];
  }
  else
  {
    v63 = [MPModelAlbum alloc];
    v64 = [MPIdentifierSet alloc];
    v60 = +[MPModelAlbumKind identityKind];
    v61 = [(MPIdentifierSet *)v64 initWithSource:@"StorePlatform" modelKind:v60 block:v56];
    uint64_t v62 = [(MPModelObject *)v63 initWithIdentifiers:v61 block:v59];
  }
  v65 = (void *)v62;

  if (![(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching])
  {
    v66 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    [v66 addStoreItemMetadata:v57];
  }

  return v65;
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 universalStore];
  uint64_t v5 = [v4 adamID];

  v6 = [v3 universalStore];
  v7 = [v6 formerAdamIDs];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v16[3] = &unk_1E57EE820;
  uint64_t v19 = v5;
  id v17 = *(id *)(a1 + 32);
  id v8 = v7;
  id v18 = v8;
  [v3 setUniversalStoreIdentifiersWithBlock:v16];
  id v9 = [v3 personalizedStore];
  id v10 = [v9 personID];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    int v14 = [v13 DSIDForUserIdentity:*(void *)(a1 + 40) outError:0];
    id v12 = [v14 stringValue];
  }
  if ([v12 length]) {
    [v3 setPersonalStoreIdentifiersWithPersonID:v12 block:&__block_literal_global_5150];
  }
  int v15 = [*(id *)(a1 + 32) versionHash];
  [v3 setVersionHash:v15];
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(id *a1, void *a2)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if ((*((unsigned char *)a1[4] + 24) & 4) != 0
    && ([v3 hasLoadedValueForKey:@"MPModelPropertyAlbumTitle"] & 1) == 0)
  {
    uint64_t v5 = [a1[5] name];
    [v4 setTitle:v5];
  }
  if ((*((unsigned char *)a1[4] + 24) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumTrackCount"] & 1) == 0)
  {
    objc_msgSend(v4, "setTrackCount:", objc_msgSend(a1[5], "trackCount"));
  }
  if ((*((unsigned char *)a1[4] + 24) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumDiscCount"] & 1) == 0)
  {
    objc_msgSend(v4, "setDiscCount:", objc_msgSend(a1[5], "discCount"));
  }
  int v6 = *((_DWORD *)a1[4] + 6);
  if ((v6 & 0x20D0) != 0)
  {
    v7 = [a1[5] childStoreItemMetadatas];
    v76 = v7;
    if ([v7 count])
    {
      id v8 = a1;
      v75 = v4;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id obj = v7;
      uint64_t v9 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        unint64_t v11 = 0;
        LOBYTE(v12) = 0;
        char v13 = 0;
        char v14 = 0;
        uint64_t v15 = *(void *)v94;
LABEL_14:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v94 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v93 + 1) + 8 * v16);
          if (objc_msgSend(v17, "isExplicitContent", v75)) {
            char v14 = 1;
          }
          else {
            char v13 = 1;
          }
          if (v12) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = [v17 isStoreRedownloadable];
          }
          unint64_t v18 = [v17 trackNumber];
          if (v11 <= v18) {
            unint64_t v11 = v18;
          }
          uint64_t v19 = v8[4];
          if ((v14 & 1) != 0 || (v19[6] & 0x80) == 0)
          {
            int v20 = v19[6];
            if ((v13 & 1) != 0 || (v20 & 0x40) == 0)
            {
              int v21 = (v20 & 0x2000) != 0 ? v12 : 1;
              int v22 = v20 & 0x10;
              if (v21 == 1 && v22 == 0) {
                break;
              }
            }
          }
          if (v10 == ++v16)
          {
            uint64_t v10 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
            if (v10) {
              goto LABEL_14;
            }
            break;
          }
        }
      }
      else
      {
        unint64_t v11 = 0;
        uint64_t v12 = 0;
        char v13 = 0;
        char v14 = 0;
      }

      uint64_t v25 = v13 & 1;
      uint64_t v24 = v14 & 1;
      v4 = v75;
      a1 = v8;
    }
    else
    {
      uint64_t v24 = [a1[5] isExplicitContent];
      uint64_t v25 = v24 ^ 1;
      uint64_t v12 = [a1[5] isStoreRedownloadable];
      unint64_t v11 = 0;
    }
    if ((*((unsigned char *)a1[4] + 24) & 0x80) != 0
      && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumHasExplicitContent"] & 1) == 0)
    {
      [v4 setHasExplicitContent:v24];
    }
    if ((*((unsigned char *)a1[4] + 24) & 0x40) != 0
      && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumHasCleanContent"] & 1) == 0)
    {
      [v4 setHasCleanContent:v25];
    }
    if ((*((unsigned char *)a1[4] + 25) & 0x20) != 0
      && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumLibraryAddEligible"] & 1) == 0)
    {
      [v4 setLibraryAddEligible:v12];
    }
    if ((*((unsigned char *)a1[4] + 24) & 0x10) != 0
      && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumMaximumItemTrackNumber"] & 1) == 0)
    {
      [v4 setMaximumItemTrackNumber:v11];
    }

    int v6 = *((_DWORD *)a1[4] + 6);
  }
  if ((v6 & 0x100000) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumEditorNotes"] & 1) == 0)
  {
    int v26 = [a1[5] editorNotes];
    [v4 setEditorNotes:v26];
  }
  if ((*((unsigned char *)a1[4] + 26) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumShortEditorNotes"] & 1) == 0)
  {
    int v27 = [a1[5] shortEditorNotes];
    [v4 setShortEditorNotes:v27];
  }
  if ((*((unsigned char *)a1[4] + 25) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumLibraryAdded"] & 1) == 0)
  {
    [v4 setLibraryAdded:0];
  }
  if ((*((unsigned char *)a1[4] + 25) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumKeepLocalEnableState"] & 1) == 0)
  {
    [v4 setKeepLocalEnableState:0];
  }
  if ((*((unsigned char *)a1[4] + 25) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumKeepLocalManagedStatus"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatus:0];
  }
  if ((*((unsigned char *)a1[4] + 25) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumKeepLocalManagedStatusReason"] & 1) == 0)
  {
    [v4 setKeepLocalManagedStatusReason:0];
  }
  if ((*((unsigned char *)a1[4] + 25) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumKeepLocalConstraints"] & 1) == 0)
  {
    [v4 setKeepLocalConstraints:0];
  }
  if ((*((unsigned char *)a1[4] + 25) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumIsCompilation"] & 1) == 0)
  {
    objc_msgSend(v4, "setCompilation:", objc_msgSend(a1[5], "isCompilation"));
  }
  if ((*((unsigned char *)a1[4] + 25) & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumIsClassical"] & 1) == 0)
  {
    [v4 setClassical:0];
  }
  if ((*((unsigned char *)a1[4] + 24) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumCopyrightText"] & 1) == 0)
  {
    int v28 = [a1[5] copyrightText];
    [v4 setCopyrightText:v28];
  }
  if ((*((unsigned char *)a1[4] + 26) & 1) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumReleaseDateComponents"] & 1) == 0)
  {
    int v29 = [a1[5] releaseDate];
    if (v29)
    {
      int v30 = +[MPStoreItemMetadata storeServerCalendar];
      int v31 = [v30 components:1048604 fromDate:v29];
      [v4 setReleaseDateComponents:v31];
    }
    else
    {
      [v4 setReleaseDateComponents:0];
    }
  }
  if ((*((unsigned char *)a1[4] + 26) & 4) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumYear"] & 1) == 0)
  {
    int v32 = [a1[5] releaseDate];
    if (v32)
    {
      int v33 = +[MPStoreItemMetadata storeServerCalendar];
      uint64_t v34 = [v33 component:4 fromDate:v32];
    }
    else
    {
      uint64_t v34 = 0;
    }
    objc_msgSend(v4, "setYear:", v34, v75);
  }
  if ((*((unsigned char *)a1[4] + 26) & 8) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumPreorder"] & 1) == 0)
  {
    objc_msgSend(v4, "setPreorder:", objc_msgSend(a1[5], "isPreorder"));
  }
  if ((*((unsigned char *)a1[4] + 27) & 0x10) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumIsFavorite"] & 1) == 0)
  {
    [v4 setIsFavorite:0];
  }
  if ((*((unsigned char *)a1[4] + 27) & 0x20) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumIsDisliked"] & 1) == 0)
  {
    [v4 setIsDisliked:0];
  }
  if ((*((unsigned char *)a1[4] + 27) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumDateFavorited"] & 1) == 0)
  {
    [v4 setDateFavorited:0];
  }
  if ((*((unsigned char *)a1[4] + 26) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumArtwork"] & 1) == 0)
  {
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v91[3] = &unk_1E57EE848;
    id v92 = a1[5];
    [v4 setArtworkCatalogBlock:v91];
  }
  if ((*((unsigned char *)a1[4] + 26) & 0x40) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumVolumeNormalization"] & 1) == 0)
  {
    LODWORD(v35) = 1.0;
    [v4 setVolumeNormalization:v35];
  }
  if ((*((unsigned char *)a1[4] + 27) & 2) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumTraits"] & 1) == 0)
  {
    uint64_t v36 = [a1[5] isMasteredForiTunes];
    int v37 = +[MPCloudController sharedCloudController];
    int v38 = [v37 isEnhancedAudioAvailable];

    if (v38)
    {
      int v39 = [a1[5] audioTraits];
      int v40 = a1;
      if ([v39 containsObject:@"spatial"]) {
        uint64_t v41 = v36 | 8;
      }
      else {
        uint64_t v41 = v36;
      }
      if (objc_msgSend(v39, "containsObject:", @"atmos", v75)) {
        v41 |= 0x10uLL;
      }
      if ([v39 containsObject:@"surround"]) {
        v41 |= 0x20uLL;
      }
      if ([v39 containsObject:@"lossless"]) {
        v41 |= 2uLL;
      }
      if ([v39 containsObject:@"hi-res-lossless"]) {
        uint64_t v36 = v41 | 4;
      }
      else {
        uint64_t v36 = v41;
      }
      a1 = v40;
    }
    objc_msgSend(v4, "setTraits:", v36, v75);
  }
  int v42 = a1[4];
  if (v42[28])
  {
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v89[3] = &unk_1E57FA3B8;
    id v90 = a1[5];
    unsigned int v43 = (void *)MEMORY[0x19971E0F0](v89);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
    v87[3] = &unk_1E57F8890;
    id v44 = a1[5];
    v87[4] = a1[4];
    id v88 = v44;
    v45 = (void *)MEMORY[0x19971E0F0](v87);
    if ([a1[6] hasLoadedValueForKey:@"MPModelRelationshipAlbumArtist"])
    {
      v46 = [a1[6] artist];
      v47 = [v46 identifiers];
      id v48 = [(MPIdentifierSet *)v47 copyWithSource:@"StorePlatform" block:v43];
      v49 = (MPModelArtist *)[v46 copyWithIdentifiers:v48 block:v45];
    }
    else
    {
      v50 = [MPModelArtist alloc];
      v51 = [MPIdentifierSet alloc];
      v46 = +[MPModelArtistKind identityKind];
      v47 = [(MPIdentifierSet *)v51 initWithSource:@"StorePlatform" modelKind:v46 block:v43];
      v49 = [(MPModelObject *)v50 initWithIdentifiers:v47 block:v45];
    }

    [v4 setArtist:v49];
    int v42 = a1[4];
  }
  if (v42[32])
  {
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v85[3] = &unk_1E57F88E0;
    v85[4] = v42;
    id v86 = a1[5];
    char v52 = (void *)MEMORY[0x19971E0F0](v85);
    if ([a1[6] hasLoadedValueForKey:@"MPModelRelationshipAlbumGenre"])
    {
      v53 = [a1[6] genre];
      id v54 = [v53 identifiers];
      id v55 = (MPModelGenre *)[v53 copyWithIdentifiers:v54 block:v52];
    }
    else
    {
      v56 = [MPModelGenre alloc];
      v53 = +[MPIdentifierSet emptyIdentifierSet];
      id v55 = [(MPModelObject *)v56 initWithIdentifiers:v53 block:v52];
    }

    [v4 setGenre:v55];
    int v42 = a1[4];
  }
  if ((v42[26] & 0x80) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumSongPopularity"] & 1) == 0)
  {
    obja = a1;
    id v57 = [a1[5] childStoreItemMetadatas];
    id v58 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v57, "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v59 = v57;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v81 objects:v97 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v82 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          v65 = objc_msgSend(v64, "storeID", v75);
          v66 = MPStoreItemMetadataNumberNormalizeStoreIDValue(v65);

          uint64_t v67 = [v64 popularity];
          id v68 = (void *)v67;
          if (v66) {
            BOOL v69 = v67 == 0;
          }
          else {
            BOOL v69 = 1;
          }
          if (!v69) {
            [v58 setObject:v67 forKey:v66];
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v81 objects:v97 count:16];
      }
      while (v61);
    }

    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
    v79[3] = &unk_1E57F7C68;
    id v70 = v58;
    id v80 = v70;
    [v4 setSongPopularityBlock:v79];

    a1 = obja;
  }
  int v71 = *((_DWORD *)a1[4] + 6);
  if ((v71 & 0x1000000) != 0)
  {
    [v4 setRepresentativeSong:0];
    int v71 = *((_DWORD *)a1[4] + 6);
  }
  if ((v71 & 0x4000000) != 0
    && ([v4 hasLoadedValueForKey:@"MPModelPropertyAlbumVersionHash"] & 1) == 0)
  {
    v72 = [a1[5] versionHash];
    [v4 setVersionHash:v72];
  }
  int v73 = *((_DWORD *)a1[4] + 6);
  if ((v73 & 0x8000000) != 0)
  {
    id v74 = [a1[5] classicalURL];
    [v4 setClassicalExperienceAvailable:v74 != 0];

    int v73 = *((_DWORD *)a1[4] + 6);
  }
  if (v73 < 0) {
    [v4 setStoreRedownloadable:1];
  }
}

MPArtworkCatalog *__92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) artworkRequestToken];
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    id v3 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    v4 = [(MPArtworkCatalog *)v2 initWithToken:v1 dataSource:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 universalStore];
  uint64_t v5 = [v4 adamID];

  if (!v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
    v6[3] = &unk_1E57FA390;
    id v7 = *(id *)(a1 + 32);
    [v3 setUniversalStoreIdentifiersWithBlock:v6];
  }
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 2) != 0)
  {
    id v7 = v3;
    char v5 = [v3 hasLoadedValueForKey:@"MPModelPropertyPersonName"];
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      int v6 = [*(id *)(a1 + 40) artistName];
      [v7 setName:v6];

      v4 = v7;
    }
  }
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 32) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    id v3 = a2;
    id v5 = [v2 genreNames];
    v4 = [v5 firstObject];
    [v3 setName:v4];
  }
}

id __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 universalStore];
  uint64_t v6 = [v5 adamID];

  if (!v6) {
    goto LABEL_13;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = NSNumber;
  uint64_t v9 = [v4 universalStore];
  uint64_t v10 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "adamID"));
  unint64_t v11 = [v7 objectForKey:v10];

  if (!v11)
  {
LABEL_13:
    uint64_t v12 = [v4 universalStore];
    uint64_t v13 = [v12 purchasedAdamID];

    if (!v13) {
      goto LABEL_5;
    }
    char v14 = *(void **)(a1 + 32);
    uint64_t v15 = NSNumber;
    uint64_t v16 = [v4 universalStore];
    id v17 = objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "purchasedAdamID"));
    unint64_t v11 = [v14 objectForKey:v17];

    if (!v11)
    {
LABEL_5:
      unint64_t v18 = [v4 universalStore];
      uint64_t v19 = [v18 subscriptionAdamID];

      if (v19)
      {
        int v20 = *(void **)(a1 + 32);
        int v21 = NSNumber;
        int v22 = [v4 universalStore];
        int v23 = objc_msgSend(v21, "numberWithLongLong:", objc_msgSend(v22, "subscriptionAdamID"));
        unint64_t v11 = [v20 objectForKey:v23];
      }
      else
      {
        unint64_t v11 = 0;
      }
    }
  }

  return v11;
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 artistStoreID];
  [v3 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v4)];
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!*(void *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 32) storeID];
    [v5 setAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v3)];
  }
  if (![*(id *)(a1 + 40) count])
  {
    id v4 = [*(id *)(a1 + 32) formerStoreAdamIDs];
    [v5 setFormerAdamIDs:v4];
  }
}

@end