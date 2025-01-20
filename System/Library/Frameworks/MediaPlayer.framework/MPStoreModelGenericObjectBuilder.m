@interface MPStoreModelGenericObjectBuilder
- (BOOL)shouldUsePlaylistEntry;
- (id)_modelObjectWithUniqueContainerIDForModelObject:(id)a3;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
- (void)setPreventStoreItemMetadataCaching:(BOOL)a3;
- (void)setShouldUsePlaylistEntry:(BOOL)a3;
@end

@implementation MPStoreModelGenericObjectBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStationBuilder, 0);
  objc_storeStrong((id *)&self->_recordLabelBuilder, 0);
  objc_storeStrong((id *)&self->_tvShowBuilder, 0);
  objc_storeStrong((id *)&self->_tvSeasonBuilder, 0);
  objc_storeStrong((id *)&self->_tvEpisodeBuilder, 0);
  objc_storeStrong((id *)&self->_songBuilder, 0);
  objc_storeStrong((id *)&self->_playlistBuilder, 0);
  objc_storeStrong((id *)&self->_movieBuilder, 0);
  objc_storeStrong((id *)&self->_artistBuilder, 0);
  objc_storeStrong((id *)&self->_albumBuilder, 0);

  objc_storeStrong((id *)&self->_baseContentItemIDToOccurrenceCount, 0);
}

- (void)setShouldUsePlaylistEntry:(BOOL)a3
{
  self->_shouldUsePlaylistEntry = a3;
}

- (BOOL)shouldUsePlaylistEntry
{
  return self->_shouldUsePlaylistEntry;
}

- (id)_modelObjectWithUniqueContainerIDForModelObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifiers];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke;
    v23[3] = &unk_1E57F9F20;
    id v24 = v4;
    v25 = v26;
    +[MPModelObject performWithoutEnforcement:v23];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_2;
    v20[3] = &unk_1E57F9F20;
    id v21 = v4;
    v22 = v26;
    +[MPModelObject performWithoutEnforcement:v20];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_3;
    v17[3] = &unk_1E57F9F20;
    id v18 = v4;
    v19 = v26;
    +[MPModelObject performWithoutEnforcement:v17];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_4;
    v14[3] = &unk_1E57F9F20;
    id v15 = v4;
    v16 = v26;
    +[MPModelObject performWithoutEnforcement:v14];
  }
  v6 = MPContainerUniqueIDPrefix(v5);
  [(NSCountedSet *)self->_baseContentItemIDToOccurrenceCount countForObject:v6];
  v7 = ML3ContainerItemOccurrenceID();
  [(NSCountedSet *)self->_baseContentItemIDToOccurrenceCount addObject:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_5;
  v12[3] = &unk_1E57FA3B8;
  id v8 = v7;
  id v13 = v8;
  v9 = (void *)[v5 copyWithSource:@"StorePlatform-ContainerUniqueID" block:v12];
  v10 = (void *)[v4 copyWithIdentifiers:v9 block:&__block_literal_global_71];

  _Block_object_dispose(v26, 8);

  return v10;
}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isLibraryAdded];
}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isLibraryAdded];
}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isLibraryAdded];
}

void __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_4(uint64_t a1)
{
  id v5 = *(id *)(a1 + 32);
  uint64_t v2 = [v5 type];
  switch(v2)
  {
    case 3:
      v3 = [v5 movie];
      break;
    case 2:
      v3 = [v5 tvEpisode];
      break;
    case 1:
      v3 = [v5 song];
      break;
    default:
      goto LABEL_8;
  }
  id v4 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isLibraryAdded];

LABEL_8:
}

uint64_t __84__MPStoreModelGenericObjectBuilder__modelObjectWithUniqueContainerIDForModelObject___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setContainerUniqueID:*(void *)(a1 + 32)];
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 itemKind];
  int v12 = [v11 isEqualToString:@"musicVideo"];
  int v13 = [v11 isEqualToString:@"tvEpisode"];
  v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v15 = [v14 BOOLForKey:@"MusicShouldFakeTVEpisodes"];

  v16 = [v9 identifiers];
  v179 = [v16 modelKind];

  char IsArtistUploadedContent = MPStoreItemMetadataItemKindIsArtistUploadedContent(v11);
  if (([v11 isEqualToString:@"song"] & 1) != 0
    || (int v18 = v15 & v12, (v12 & ~(v15 & v12) & 1) != 0)
    || (IsArtistUploadedContent & 1) != 0
    || [v9 type] == 1
    || [v9 type] == 5
    || (+[MPModelSongKind identityKind],
        v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v179 isEqual:v19],
        v19,
        v20))
  {
    if (self->_songBuilder)
    {
      if (!v9) {
        goto LABEL_20;
      }
    }
    else
    {
      id v21 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v22 = [v21 relationships];
      v23 = [v22 objectForKey:@"MPModelRelationshipGenericSong"];
      id v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = +[MPPropertySet emptyPropertySet];
      }
      v26 = v25;

      char v27 = [(MPStoreModelObjectBuilder *)[MPStoreModelSongBuilder alloc] initWithRequestedPropertySet:v26];
      songBuilder = self->_songBuilder;
      self->_songBuilder = v27;

      [(MPStoreModelObjectBuilder *)self->_songBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
      if (!v9) {
        goto LABEL_20;
      }
    }
    if (objc_msgSend(v9, "type", v179) == 1)
    {
      v29 = [v9 song];
      goto LABEL_31;
    }
    if ([v9 type] == 5)
    {
      v30 = [v9 playlistEntry];
      if (![v30 hasLoadedValueForKey:@"MPModelRelationshipPlaylistEntrySong"])
      {
        v32 = [MPModelSong alloc];
        v33 = [v30 identifiers];
        v29 = [(MPModelObject *)v32 initWithIdentifiers:v33 block:&__block_literal_global_29141];

LABEL_30:
LABEL_31:
        uint64_t v42 = -[MPStoreModelSongBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_songBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
        if (v42)
        {
          v43 = (void *)v42;
          if (self->_shouldUsePlaylistEntry)
          {
            v44 = [(MPStoreModelGenericObjectBuilder *)self _modelObjectWithUniqueContainerIDForModelObject:v42];

            v45 = [MPModelGenericObject alloc];
            v46 = +[MPIdentifierSet emptyIdentifierSet];
            v206[0] = MEMORY[0x1E4F143A8];
            v206[1] = 3221225472;
            v206[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
            v206[3] = &unk_1E57F5898;
            v47 = &v207;
            v207 = v44;
            id v48 = v44;
            v49 = v206;
LABEL_34:
            v50 = v45;
LABEL_37:
            v52 = [(MPModelObject *)v50 initWithIdentifiers:v46 block:v49];

LABEL_38:
LABEL_87:

            goto LABEL_88;
          }
          v51 = [MPModelGenericObject alloc];
          v46 = +[MPIdentifierSet emptyIdentifierSet];
          v204[0] = MEMORY[0x1E4F143A8];
          v204[1] = 3221225472;
          v204[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
          v204[3] = &unk_1E57F5898;
          v47 = &v205;
          v205 = v43;
          id v48 = v43;
          v49 = v204;
          goto LABEL_36;
        }
        goto LABEL_86;
      }
      uint64_t v31 = [v30 song];
    }
    else
    {
      if ([v9 type])
      {
LABEL_20:
        v29 = 0;
        goto LABEL_31;
      }
      v41 = [MPModelSong alloc];
      v30 = [v9 identifiers];
      uint64_t v31 = [(MPModelObject *)v41 initWithIdentifiers:v30 block:&__block_literal_global_7_29142];
    }
    v29 = (MPModelSong *)v31;
    goto LABEL_30;
  }
  if (((v18 | v13) & 1) != 0
    || [v9 type] == 6
    || (+[MPModelTVEpisodeKind identityKind],
        v34 = objc_claimAutoreleasedReturnValue(),
        int v35 = [v179 isEqual:v34],
        v34,
        v35))
  {
    if (!self->_tvEpisodeBuilder)
    {
      v36 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v37 = [v36 relationships];
      v38 = [v37 objectForKey:@"MPModelRelationshipGenericTVEpisode"];
      v39 = v38;
      if (v38)
      {
        id v40 = v38;
      }
      else
      {
        id v40 = +[MPPropertySet emptyPropertySet];
      }
      v60 = v40;

      v61 = [(MPStoreModelObjectBuilder *)[MPStoreModelTVEpisodeBuilder alloc] initWithRequestedPropertySet:v60];
      tvEpisodeBuilder = self->_tvEpisodeBuilder;
      self->_tvEpisodeBuilder = v61;

      [(MPStoreModelObjectBuilder *)self->_tvEpisodeBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (v9)
    {
      if ([v9 type] == 6)
      {
        v29 = [v9 tvEpisode];
        goto LABEL_59;
      }
      if ([v9 type] == 5)
      {
        v63 = [v9 playlistEntry];
        if (![v63 hasLoadedValueForKey:@"MPModelRelationshipPlaylistEntryTVEpisode"])
        {
          v65 = [MPModelTVEpisode alloc];
          v66 = [v63 identifiers];
          v29 = [(MPModelObject *)v65 initWithIdentifiers:v66 block:&__block_literal_global_17];

LABEL_58:
LABEL_59:
          uint64_t v68 = -[MPStoreModelTVEpisodeBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_tvEpisodeBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          if (v68)
          {
            v69 = (void *)v68;
            if (self->_shouldUsePlaylistEntry)
            {
              v70 = [(MPStoreModelGenericObjectBuilder *)self _modelObjectWithUniqueContainerIDForModelObject:v68];

              v45 = [MPModelGenericObject alloc];
              v46 = +[MPIdentifierSet emptyIdentifierSet];
              v202[0] = MEMORY[0x1E4F143A8];
              v202[1] = 3221225472;
              v202[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
              v202[3] = &unk_1E57F5898;
              v47 = &v203;
              v203 = v70;
              id v48 = v70;
              v49 = v202;
              goto LABEL_34;
            }
            v51 = [MPModelGenericObject alloc];
            v46 = +[MPIdentifierSet emptyIdentifierSet];
            v200[0] = MEMORY[0x1E4F143A8];
            v200[1] = 3221225472;
            v200[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
            v200[3] = &unk_1E57F5898;
            v47 = &v201;
            v201 = v69;
            id v48 = v69;
            v49 = v200;
LABEL_36:
            v50 = v51;
            goto LABEL_37;
          }
LABEL_86:
          v52 = 0;
          goto LABEL_87;
        }
        uint64_t v64 = [v63 tvEpisode];
LABEL_57:
        v29 = (MPModelSong *)v64;
        goto LABEL_58;
      }
      if (![v9 type])
      {
        v67 = [MPModelTVEpisode alloc];
        v63 = [v9 identifiers];
        uint64_t v64 = [(MPModelObject *)v67 initWithIdentifiers:v63 block:&__block_literal_global_19];
        goto LABEL_57;
      }
    }
    v29 = 0;
    goto LABEL_59;
  }
  if (([v11 isEqualToString:@"movie"] & 1) != 0
    || [v9 type] == 9
    || (+[MPModelMovieKind identityKind],
        v53 = objc_claimAutoreleasedReturnValue(),
        int v54 = [v179 isEqual:v53],
        v53,
        v54))
  {
    if (!self->_movieBuilder)
    {
      v55 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v56 = [v55 relationships];
      v57 = [v56 objectForKey:@"MPModelRelationshipGenericMovie"];
      v58 = v57;
      if (v57)
      {
        id v59 = v57;
      }
      else
      {
        id v59 = +[MPPropertySet emptyPropertySet];
      }
      v78 = v59;

      v79 = [(MPStoreModelObjectBuilder *)[MPStoreModelMovieBuilder alloc] initWithRequestedPropertySet:v78];
      movieBuilder = self->_movieBuilder;
      self->_movieBuilder = v79;

      [(MPStoreModelObjectBuilder *)self->_movieBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (v9)
    {
      if ([v9 type] == 9)
      {
        v29 = [v9 movie];
        goto LABEL_83;
      }
      if ([v9 type] == 5)
      {
        v81 = [v9 playlistEntry];
        if (![v81 hasLoadedValueForKey:@"MPModelRelationshipPlaylistEntryMovie"])
        {
          v83 = [MPModelMovie alloc];
          v84 = [v81 identifiers];
          v29 = [(MPModelObject *)v83 initWithIdentifiers:v84 block:&__block_literal_global_24];

LABEL_82:
LABEL_83:
          uint64_t v86 = -[MPStoreModelMovieBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_movieBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
          if (v86)
          {
            v87 = (void *)v86;
            if (self->_shouldUsePlaylistEntry)
            {
              v88 = [(MPStoreModelGenericObjectBuilder *)self _modelObjectWithUniqueContainerIDForModelObject:v86];

              v45 = [MPModelGenericObject alloc];
              v46 = +[MPIdentifierSet emptyIdentifierSet];
              v198[0] = MEMORY[0x1E4F143A8];
              v198[1] = 3221225472;
              v198[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13;
              v198[3] = &unk_1E57F5898;
              v47 = &v199;
              v199 = v88;
              id v48 = v88;
              v49 = v198;
              goto LABEL_34;
            }
            v51 = [MPModelGenericObject alloc];
            v46 = +[MPIdentifierSet emptyIdentifierSet];
            v196[0] = MEMORY[0x1E4F143A8];
            v196[1] = 3221225472;
            v196[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15;
            v196[3] = &unk_1E57F5898;
            v47 = &v197;
            v197 = v87;
            id v48 = v87;
            v49 = v196;
            goto LABEL_36;
          }
          goto LABEL_86;
        }
        uint64_t v82 = [v81 movie];
LABEL_81:
        v29 = (MPModelSong *)v82;
        goto LABEL_82;
      }
      if (![v9 type])
      {
        v85 = [MPModelMovie alloc];
        v81 = [v9 identifiers];
        uint64_t v82 = [(MPModelObject *)v85 initWithIdentifiers:v81 block:&__block_literal_global_26_29149];
        goto LABEL_81;
      }
    }
    v29 = 0;
    goto LABEL_83;
  }
  if (([v11 isEqualToString:@"album"] & 1) != 0
    || [v9 type] == 2
    || (+[MPModelAlbumKind identityKind],
        v71 = objc_claimAutoreleasedReturnValue(),
        int v72 = [v179 isEqual:v71],
        v71,
        v72))
  {
    if (!self->_albumBuilder)
    {
      v73 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v74 = [v73 relationships];
      v75 = [v74 objectForKey:@"MPModelRelationshipGenericAlbum"];
      v76 = v75;
      if (v75)
      {
        id v77 = v75;
      }
      else
      {
        id v77 = +[MPPropertySet emptyPropertySet];
      }
      v97 = v77;

      v98 = [(MPStoreModelObjectBuilder *)[MPStoreModelAlbumBuilder alloc] initWithRequestedPropertySet:v97];
      albumBuilder = self->_albumBuilder;
      self->_albumBuilder = v98;

      [(MPStoreModelObjectBuilder *)self->_albumBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v9) {
      goto LABEL_104;
    }
    if ([v9 type] == 2)
    {
      v29 = [v9 album];
      goto LABEL_105;
    }
    if (![v9 type])
    {
      v100 = [MPModelAlbum alloc];
      v101 = [v9 identifiers];
      v29 = [(MPModelObject *)v100 initWithIdentifiers:v101 block:&__block_literal_global_31_29153];
    }
    else
    {
LABEL_104:
      v29 = 0;
    }
LABEL_105:
    -[MPStoreModelAlbumBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_albumBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v194[0] = MEMORY[0x1E4F143A8];
      v194[1] = 3221225472;
      v194[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_17;
      v194[3] = &unk_1E57F5898;
      v47 = &v195;
      id v48 = v48;
      id v195 = v48;
      v49 = v194;
      goto LABEL_36;
    }
LABEL_215:
    v52 = 0;
    goto LABEL_38;
  }
  if (([v11 isEqualToString:@"playlist"] & 1) != 0
    || [v9 type] == 4
    || (+[MPModelPlaylistKind identityKind],
        v90 = objc_claimAutoreleasedReturnValue(),
        int v91 = [v179 isEqual:v90],
        v90,
        v91))
  {
    if (!self->_playlistBuilder)
    {
      v92 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v93 = [v92 relationships];
      v94 = [v93 objectForKey:@"MPModelRelationshipGenericPlaylist"];
      v95 = v94;
      if (v94)
      {
        id v96 = v94;
      }
      else
      {
        id v96 = +[MPPropertySet emptyPropertySet];
      }
      v109 = v96;

      v110 = [(MPStoreModelObjectBuilder *)[MPStoreModelPlaylistBuilder alloc] initWithRequestedPropertySet:v109];
      playlistBuilder = self->_playlistBuilder;
      self->_playlistBuilder = v110;

      [(MPStoreModelObjectBuilder *)self->_playlistBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v9) {
      goto LABEL_120;
    }
    if ([v9 type] == 4)
    {
      v29 = [v9 playlist];
      goto LABEL_121;
    }
    if (![v9 type])
    {
      v112 = [MPModelPlaylist alloc];
      v113 = [v9 identifiers];
      v29 = [(MPModelObject *)v112 initWithIdentifiers:v113 block:&__block_literal_global_36_29157];
    }
    else
    {
LABEL_120:
      v29 = 0;
    }
LABEL_121:
    -[MPStoreModelPlaylistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_playlistBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v192[0] = MEMORY[0x1E4F143A8];
      v192[1] = 3221225472;
      v192[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_19;
      v192[3] = &unk_1E57F5898;
      v47 = &v193;
      id v48 = v48;
      id v193 = v48;
      v49 = v192;
      goto LABEL_36;
    }
    goto LABEL_215;
  }
  if (([v11 isEqualToString:@"artist"] & 1) != 0
    || [v9 type] == 3
    || (+[MPModelArtistKind identityKind],
        v102 = objc_claimAutoreleasedReturnValue(),
        int v103 = [v179 isEqual:v102],
        v102,
        v103))
  {
    if (!self->_artistBuilder)
    {
      v104 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v105 = [v104 relationships];
      v106 = [v105 objectForKey:@"MPModelRelationshipGenericArtist"];
      v107 = v106;
      if (v106)
      {
        id v108 = v106;
      }
      else
      {
        id v108 = +[MPPropertySet emptyPropertySet];
      }
      v121 = v108;

      v122 = [(MPStoreModelObjectBuilder *)[MPStoreModelArtistBuilder alloc] initWithRequestedPropertySet:v121];
      artistBuilder = self->_artistBuilder;
      self->_artistBuilder = v122;

      [(MPStoreModelObjectBuilder *)self->_artistBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v9) {
      goto LABEL_136;
    }
    if ([v9 type] == 3)
    {
      v29 = [v9 artist];
      goto LABEL_137;
    }
    if (![v9 type])
    {
      v124 = [MPModelArtist alloc];
      v125 = [v9 identifiers];
      v29 = [(MPModelObject *)v124 initWithIdentifiers:v125 block:&__block_literal_global_41_29161];
    }
    else
    {
LABEL_136:
      v29 = 0;
    }
LABEL_137:
    -[MPStoreModelArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_artistBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v190[0] = MEMORY[0x1E4F143A8];
      v190[1] = 3221225472;
      v190[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_21;
      v190[3] = &unk_1E57F5898;
      v47 = &v191;
      id v48 = v48;
      id v191 = v48;
      v49 = v190;
      goto LABEL_36;
    }
    goto LABEL_215;
  }
  if (([v11 isEqualToString:@"creditsArtist"] & 1) != 0
    || [v9 type] == 19
    || (+[MPModelRecordLabelKind identityKind],
        v114 = objc_claimAutoreleasedReturnValue(),
        int v115 = [v179 isEqual:v114],
        v114,
        v115))
  {
    if (!self->_recordLabelBuilder)
    {
      v116 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v117 = [v116 relationships];
      v118 = [v117 objectForKey:@"MPModelRelationshipGenericRecordLabel"];
      v119 = v118;
      if (v118)
      {
        id v120 = v118;
      }
      else
      {
        id v120 = +[MPPropertySet emptyPropertySet];
      }
      v133 = v120;

      v134 = [(MPStoreModelObjectBuilder *)[MPStoreModelRecordLabelBuilder alloc] initWithRequestedPropertySet:v133];
      recordLabelBuilder = self->_recordLabelBuilder;
      self->_recordLabelBuilder = v134;

      [(MPStoreModelObjectBuilder *)self->_recordLabelBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v179) {
      goto LABEL_152;
    }
    if ([v9 type] == 19)
    {
      v29 = [v9 recordLabel];
      goto LABEL_153;
    }
    if (![v9 type])
    {
      v136 = [MPModelRecordLabel alloc];
      v137 = [v9 identifiers];
      v29 = [(MPModelObject *)v136 initWithIdentifiers:v137 block:&__block_literal_global_46_29165];
    }
    else
    {
LABEL_152:
      v29 = 0;
    }
LABEL_153:
    -[MPStoreModelRecordLabelBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_recordLabelBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v188[0] = MEMORY[0x1E4F143A8];
      v188[1] = 3221225472;
      v188[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_23;
      v188[3] = &unk_1E57F5898;
      v47 = &v189;
      id v48 = v48;
      id v189 = v48;
      v49 = v188;
      goto LABEL_36;
    }
    goto LABEL_215;
  }
  if (([v11 isEqualToString:@"tvShow"] & 1) != 0
    || [v9 type] == 8
    || (+[MPModelTVShowKind identityKind],
        v126 = objc_claimAutoreleasedReturnValue(),
        int v127 = [v179 isEqual:v126],
        v126,
        v127))
  {
    if (!self->_tvShowBuilder)
    {
      v128 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v129 = [v128 relationships];
      v130 = [v129 objectForKey:@"MPModelRelationshipGenericTVShow"];
      v131 = v130;
      if (v130)
      {
        id v132 = v130;
      }
      else
      {
        id v132 = +[MPPropertySet emptyPropertySet];
      }
      v145 = v132;

      v146 = [(MPStoreModelObjectBuilder *)[MPStoreModelTVShowBuilder alloc] initWithRequestedPropertySet:v145];
      tvShowBuilder = self->_tvShowBuilder;
      self->_tvShowBuilder = v146;

      [(MPStoreModelObjectBuilder *)self->_tvShowBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v9) {
      goto LABEL_168;
    }
    if ([v9 type] == 8)
    {
      v29 = [v9 show];
      goto LABEL_169;
    }
    if (![v9 type])
    {
      v148 = [MPModelTVShow alloc];
      v149 = [v9 identifiers];
      v29 = [(MPModelObject *)v148 initWithIdentifiers:v149 block:&__block_literal_global_51];
    }
    else
    {
LABEL_168:
      v29 = 0;
    }
LABEL_169:
    -[MPStoreModelTVShowBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_tvShowBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v186[0] = MEMORY[0x1E4F143A8];
      v186[1] = 3221225472;
      v186[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_25;
      v186[3] = &unk_1E57F5898;
      v47 = &v187;
      id v48 = v48;
      id v187 = v48;
      v49 = v186;
      goto LABEL_36;
    }
    goto LABEL_215;
  }
  if (([v11 isEqualToString:@"tvSeason"] & 1) != 0
    || [v9 type] == 7
    || (+[MPModelTVSeasonKind identityKind],
        v138 = objc_claimAutoreleasedReturnValue(),
        int v139 = [v179 isEqual:v138],
        v138,
        v139))
  {
    if (!self->_tvSeasonBuilder)
    {
      v140 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v141 = [v140 relationships];
      v142 = [v141 objectForKey:@"MPModelRelationshipGenericTVSeason"];
      v143 = v142;
      if (v142)
      {
        id v144 = v142;
      }
      else
      {
        id v144 = +[MPPropertySet emptyPropertySet];
      }
      v157 = v144;

      v158 = [(MPStoreModelObjectBuilder *)[MPStoreModelTVSeasonBuilder alloc] initWithRequestedPropertySet:v157];
      tvSeasonBuilder = self->_tvSeasonBuilder;
      self->_tvSeasonBuilder = v158;

      [(MPStoreModelObjectBuilder *)self->_tvSeasonBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v9) {
      goto LABEL_185;
    }
    if ([v9 type] == 7)
    {
      v29 = [v9 season];
      goto LABEL_186;
    }
    if (![v9 type])
    {
      v160 = [MPModelTVSeason alloc];
      v161 = [v9 identifiers];
      v29 = [(MPModelObject *)v160 initWithIdentifiers:v161 block:&__block_literal_global_56];
    }
    else
    {
LABEL_185:
      v29 = 0;
    }
LABEL_186:
    -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_tvSeasonBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v184[0] = MEMORY[0x1E4F143A8];
      v184[1] = 3221225472;
      v184[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_27;
      v184[3] = &unk_1E57F5898;
      v47 = &v185;
      id v48 = v48;
      id v185 = v48;
      v49 = v184;
      goto LABEL_36;
    }
    goto LABEL_215;
  }
  if (([v11 isEqualToString:@"recordLabel"] & 1) != 0
    || ([v11 isEqualToString:@"record-labels"] & 1) != 0
    || [v9 type] == 19
    || (+[MPModelRecordLabelKind identityKind],
        v150 = objc_claimAutoreleasedReturnValue(),
        int v151 = [v179 isEqual:v150],
        v150,
        v151))
  {
    if (!self->_recordLabelBuilder)
    {
      v152 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v153 = [v152 relationships];
      v154 = [v153 objectForKey:@"MPModelRelationshipGenericRecordLabel"];
      v155 = v154;
      if (v154)
      {
        id v156 = v154;
      }
      else
      {
        id v156 = +[MPPropertySet emptyPropertySet];
      }
      v162 = v156;

      v163 = [(MPStoreModelObjectBuilder *)[MPStoreModelRecordLabelBuilder alloc] initWithRequestedPropertySet:v162];
      v164 = self->_recordLabelBuilder;
      self->_recordLabelBuilder = v163;

      [(MPStoreModelObjectBuilder *)self->_recordLabelBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v179) {
      goto LABEL_195;
    }
    if ([v9 type] == 19)
    {
      v29 = [v9 recordLabel];
      goto LABEL_196;
    }
    if (![v9 type])
    {
      v165 = [MPModelRecordLabel alloc];
      v166 = [v9 identifiers];
      v29 = [(MPModelObject *)v165 initWithIdentifiers:v166 block:&__block_literal_global_58];
    }
    else
    {
LABEL_195:
      v29 = 0;
    }
LABEL_196:
    -[MPStoreModelRecordLabelBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_recordLabelBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v182[0] = MEMORY[0x1E4F143A8];
      v182[1] = 3221225472;
      v182[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_29;
      v182[3] = &unk_1E57F5898;
      v47 = &v183;
      id v48 = v48;
      id v183 = v48;
      v49 = v182;
      goto LABEL_36;
    }
    goto LABEL_215;
  }
  if (([v11 isEqualToString:@"radioStation"] & 1) != 0
    || [v9 type] == 13
    || (+[MPModelRadioStationKind identityKind],
        v167 = objc_claimAutoreleasedReturnValue(),
        int v168 = [v179 isEqual:v167],
        v167,
        v168))
  {
    if (!self->_radioStationBuilder)
    {
      v169 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
      v170 = [v169 relationships];
      v171 = [v170 objectForKey:@"MPModelRelationshipGenericRadioStation"];
      v172 = v171;
      if (v171)
      {
        id v173 = v171;
      }
      else
      {
        id v173 = +[MPPropertySet emptyPropertySet];
      }
      v174 = v173;

      v175 = [(MPStoreModelObjectBuilder *)[MPStoreModelRadioStationBuilder alloc] initWithRequestedPropertySet:v174];
      radioStationBuilder = self->_radioStationBuilder;
      self->_radioStationBuilder = v175;

      [(MPStoreModelObjectBuilder *)self->_radioStationBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    }
    if (!v179) {
      goto LABEL_212;
    }
    if ([v9 type] == 13)
    {
      v29 = [v9 radioStation];
      goto LABEL_213;
    }
    if (![v9 type])
    {
      v177 = [MPModelRadioStation alloc];
      v178 = [v9 identifiers];
      v29 = [(MPModelObject *)v177 initWithIdentifiers:v178 block:&__block_literal_global_63_29175];
    }
    else
    {
LABEL_212:
      v29 = 0;
    }
LABEL_213:
    -[MPStoreModelRadioStationBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self->_radioStationBuilder, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v29, v10, v179);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v51 = [MPModelGenericObject alloc];
      v46 = +[MPIdentifierSet emptyIdentifierSet];
      v180[0] = MEMORY[0x1E4F143A8];
      v180[1] = 3221225472;
      v180[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_31;
      v180[3] = &unk_1E57F5898;
      v47 = &v181;
      id v48 = v48;
      id v181 = v48;
      v49 = v180;
      goto LABEL_36;
    }
    goto LABEL_215;
  }
  v52 = 0;
LABEL_88:

  return v52;
}

void __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MPModelPlaylistEntry alloc];
  id v5 = [*(id *)(a1 + 32) identifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v7[3] = &unk_1E57F3A90;
  id v8 = *(id *)(a1 + 32);
  v6 = [(MPModelObject *)v4 initWithIdentifiers:v5 block:v7];
  [v3 setPlaylistEntry:v6];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setSong:*(void *)(a1 + 32)];
}

void __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MPModelPlaylistEntry alloc];
  id v5 = [*(id *)(a1 + 32) identifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
  v7[3] = &unk_1E57F3A90;
  id v8 = *(id *)(a1 + 32);
  v6 = [(MPModelObject *)v4 initWithIdentifiers:v5 block:v7];
  [v3 setPlaylistEntry:v6];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 setTvEpisode:*(void *)(a1 + 32)];
}

void __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MPModelPlaylistEntry alloc];
  id v5 = [*(id *)(a1 + 32) identifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14;
  v7[3] = &unk_1E57F3A90;
  id v8 = *(id *)(a1 + 32);
  v6 = [(MPModelObject *)v4 initWithIdentifiers:v5 block:v7];
  [v3 setPlaylistEntry:v6];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 setMovie:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 setAlbum:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_19(uint64_t a1, void *a2)
{
  return [a2 setPlaylist:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 setArtist:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_23(uint64_t a1, void *a2)
{
  return [a2 setRecordLabel:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_25(uint64_t a1, void *a2)
{
  return [a2 setShow:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_27(uint64_t a1, void *a2)
{
  return [a2 setSeason:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_29(uint64_t a1, void *a2)
{
  return [a2 setRecordLabel:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 setRadioStation:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 setMovie:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setTvEpisode:*(void *)(a1 + 32)];
}

uint64_t __100__MPStoreModelGenericObjectBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setSong:*(void *)(a1 + 32)];
}

- (void)setPreventStoreItemMetadataCaching:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPStoreModelGenericObjectBuilder;
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](&v5, sel_setPreventStoreItemMetadataCaching_);
  [(MPStoreModelObjectBuilder *)self->_albumBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_artistBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_movieBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_playlistBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_songBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_tvEpisodeBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_tvSeasonBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_tvShowBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_recordLabelBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_radioStationBuilder setPreventStoreItemMetadataCaching:v3];
}

@end