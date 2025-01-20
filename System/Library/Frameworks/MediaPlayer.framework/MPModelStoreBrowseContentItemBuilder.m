@interface MPModelStoreBrowseContentItemBuilder
+ (id)allSupportedProperties;
- (BOOL)allowsRadioStations;
- (BOOL)allowsVideoContent;
- (MPModelStoreBrowseContentItemBuilder)initWithRequestedPropertySet:(id)a3;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
- (int64_t)contentItemTypeForMusicAPIType:(id)a3;
- (int64_t)contentItemTypeForRawResponseKindIdentifierValue:(int64_t)a3;
- (int64_t)contentItemTypeForRawResponseKindIdentifiers:(id)a3;
- (int64_t)contentItemTypeForStoreItemMetadata:(id)a3;
- (void)setAllowsRadioStations:(BOOL)a3;
- (void)setAllowsVideoContent:(BOOL)a3;
- (void)setPreventStoreItemMetadataCaching:(BOOL)a3;
@end

@implementation MPModelStoreBrowseContentItemBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creditsArtistBuilder, 0);
  objc_storeStrong((id *)&self->_recordLabelBuilder, 0);
  objc_storeStrong((id *)&self->_showCreatorBuilder, 0);
  objc_storeStrong((id *)&self->_showBuilder, 0);
  objc_storeStrong((id *)&self->_songBuilder, 0);
  objc_storeStrong((id *)&self->_seasonBuilder, 0);
  objc_storeStrong((id *)&self->_playlistBuilder, 0);
  objc_storeStrong((id *)&self->_socialPersonBuilder, 0);
  objc_storeStrong((id *)&self->_radioStationBuilder, 0);
  objc_storeStrong((id *)&self->_movieBuilder, 0);
  objc_storeStrong((id *)&self->_episodeBuilder, 0);
  objc_storeStrong((id *)&self->_curatorBuilder, 0);
  objc_storeStrong((id *)&self->_artistBuilder, 0);

  objc_storeStrong((id *)&self->_albumBuilder, 0);
}

- (void)setAllowsVideoContent:(BOOL)a3
{
  self->_allowsVideoContent = a3;
}

- (BOOL)allowsVideoContent
{
  return self->_allowsVideoContent;
}

- (void)setAllowsRadioStations:(BOOL)a3
{
  self->_allowsRadioStations = a3;
}

- (BOOL)allowsRadioStations
{
  return self->_allowsRadioStations;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v145 = v8;
  id v146 = a5;
  id v144 = v9;
  if ((*(unsigned char *)&self->_requestedBrowseContentItemProperties & 1) == 0)
  {
    v10 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v11 = [v10 properties];
    if ([v11 containsObject:@"MPModelStoreBrowseContentItemPropertyItemType"]) {
      int v12 = 2;
    }
    else {
      int v12 = 0;
    }
    self->_requestedBrowseContentItemProperties = ($E6E5A8CF372118A12356E3EF60BC7B79)(*(_DWORD *)&self->_requestedBrowseContentItemProperties & 0xFFFFFFFD | v12);
    if ([v11 containsObject:@"MPModelStoreBrowseContentItemPropertyDetailedItemType"])int v13 = 4; {
    else
    }
      int v13 = 0;
    self->_requestedBrowseContentItemProperties = ($E6E5A8CF372118A12356E3EF60BC7B79)(*(_DWORD *)&self->_requestedBrowseContentItemProperties & 0xFFFFFFFB | v13);
    v138 = v11;
    if ([v11 containsObject:@"MPModelStoreBrowseContentItemPropertyArtistUploadedContentType"])int v14 = 0x8000; {
    else
    }
      int v14 = 0;
    self->_requestedBrowseContentItemProperties = ($E6E5A8CF372118A12356E3EF60BC7B79)(*(_DWORD *)&self->_requestedBrowseContentItemProperties & 0xFFFF7FFF | v14);
    v141 = v10;
    v15 = [v10 relationships];
    uint64_t v16 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipAlbum"];
    if (v16) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x10u;
    }
    v135 = (void *)v16;
    v17 = [(MPStoreModelObjectBuilder *)[MPStoreModelAlbumBuilder alloc] initWithRequestedPropertySet:v16];
    albumBuilder = self->_albumBuilder;
    self->_albumBuilder = v17;

    [(MPStoreModelObjectBuilder *)self->_albumBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    uint64_t v19 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipArtist"];
    if (v19) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 8u;
    }
    v133 = (void *)v19;
    v20 = [(MPStoreModelObjectBuilder *)[MPStoreModelArtistBuilder alloc] initWithRequestedPropertySet:v19];
    artistBuilder = self->_artistBuilder;
    self->_artistBuilder = v20;

    [(MPStoreModelObjectBuilder *)self->_artistBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    uint64_t v22 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipCurator"];
    if (v22) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x20u;
    }
    v131 = (void *)v22;
    v23 = [(MPStoreModelObjectBuilder *)[MPStoreModelCuratorBuilder alloc] initWithRequestedPropertySet:v22];
    curatorBuilder = self->_curatorBuilder;
    self->_curatorBuilder = v23;

    [(MPStoreModelObjectBuilder *)self->_curatorBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    uint64_t v25 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipMovie"];
    if (v25) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x80u;
    }
    v129 = (void *)v25;
    v26 = [(MPStoreModelObjectBuilder *)[MPStoreModelMovieBuilder alloc] initWithRequestedPropertySet:v25];
    movieBuilder = self->_movieBuilder;
    self->_movieBuilder = v26;

    [(MPStoreModelObjectBuilder *)self->_movieBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    uint64_t v28 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipPlaylist"];
    if (v28) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x100u;
    }
    v127 = (void *)v28;
    v29 = [(MPStoreModelObjectBuilder *)[MPStoreModelPlaylistBuilder alloc] initWithRequestedPropertySet:v28];
    playlistBuilder = self->_playlistBuilder;
    self->_playlistBuilder = v29;

    [(MPStoreModelObjectBuilder *)self->_playlistBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    uint64_t v31 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipRadioStation"];
    if (v31) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x200u;
    }
    v125 = (void *)v31;
    v32 = [(MPStoreModelObjectBuilder *)[MPStoreModelRadioStationBuilder alloc] initWithRequestedPropertySet:v31];
    radioStationBuilder = self->_radioStationBuilder;
    self->_radioStationBuilder = v32;

    [(MPStoreModelObjectBuilder *)self->_radioStationBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    uint64_t v34 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipSong"];
    if (v34) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x800u;
    }
    v123 = (void *)v34;
    v35 = [(MPStoreModelObjectBuilder *)[MPStoreModelSongBuilder alloc] initWithRequestedPropertySet:v34];
    songBuilder = self->_songBuilder;
    self->_songBuilder = v35;

    [(MPStoreModelObjectBuilder *)self->_songBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    uint64_t v37 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipTVEpisode"];
    if (v37) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x40u;
    }
    v121 = (void *)v37;
    v38 = [(MPStoreModelObjectBuilder *)[MPStoreModelTVEpisodeBuilder alloc] initWithRequestedPropertySet:v37];
    episodeBuilder = self->_episodeBuilder;
    self->_episodeBuilder = v38;

    [(MPStoreModelObjectBuilder *)self->_episodeBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    v40 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipTVSeason"];
    if (v40) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x1000u;
    }
    v41 = [(MPStoreModelObjectBuilder *)[MPStoreModelTVSeasonBuilder alloc] initWithRequestedPropertySet:v40];
    seasonBuilder = self->_seasonBuilder;
    self->_seasonBuilder = v41;

    [(MPStoreModelObjectBuilder *)self->_seasonBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    v43 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipTVShow"];
    if (v43) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x2000u;
    }
    v44 = [(MPStoreModelObjectBuilder *)[MPStoreModelTVShowBuilder alloc] initWithRequestedPropertySet:v43];
    showBuilder = self->_showBuilder;
    self->_showBuilder = v44;

    [(MPStoreModelObjectBuilder *)self->_showBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    v46 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipTVShowCreator"];
    if (v46) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x4000u;
    }
    v47 = [(MPStoreModelObjectBuilder *)[MPStoreModelTVShowCreatorBuilder alloc] initWithRequestedPropertySet:v46];
    showCreatorBuilder = self->_showCreatorBuilder;
    self->_showCreatorBuilder = v47;

    [(MPStoreModelObjectBuilder *)self->_showCreatorBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    v49 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipSocialPerson"];
    if (v49) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x400u;
    }
    v50 = [(MPStoreModelObjectBuilder *)[MPStoreModelSocialPersonBuilder alloc] initWithRequestedPropertySet:v49];
    socialPersonBuilder = self->_socialPersonBuilder;
    self->_socialPersonBuilder = v50;

    [(MPStoreModelObjectBuilder *)self->_socialPersonBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    v52 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipRecordLabel"];
    if (v52) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x10000u;
    }
    v53 = [(MPStoreModelObjectBuilder *)[MPStoreModelRecordLabelBuilder alloc] initWithRequestedPropertySet:v52];
    recordLabelBuilder = self->_recordLabelBuilder;
    self->_recordLabelBuilder = v53;

    [(MPStoreModelObjectBuilder *)self->_recordLabelBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 1u;
    v55 = [v15 objectForKey:@"MPModelStoreBrowseContentItemRelationshipCreditsArtist"];
    if (v55) {
      *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 0x20000u;
    }
    v56 = [(MPStoreModelObjectBuilder *)[MPStoreModelCreditsArtistBuilder alloc] initWithRequestedPropertySet:v55];
    creditsArtistBuilder = self->_creditsArtistBuilder;
    self->_creditsArtistBuilder = v56;

    [(MPStoreModelObjectBuilder *)self->_creditsArtistBuilder setPreventStoreItemMetadataCaching:[(MPStoreModelObjectBuilder *)self preventStoreItemMetadataCaching]];
    *(_DWORD *)&self->_requestedBrowseContentItemProperties |= 1u;

    id v9 = v144;
    id v8 = v145;
  }
  v58 = 0;
  int64_t v142 = [(MPModelStoreBrowseContentItemBuilder *)self contentItemTypeForStoreItemMetadata:v8];
  switch(v142)
  {
    case 0:
      goto LABEL_90;
    case 1:
      v116 = [v8 artistUploadedContentType];
      v78 = self->_albumBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipAlbum"])
      {
        v136 = [v9 album];
        uint64_t v79 = -[MPStoreModelAlbumBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v78, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 1;
        v73 = (void *)v79;
        v61 = (void *)v79;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelAlbumBuilder *)v78 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v139 = 1;
      v61 = v77;
      break;
    case 2:
      v116 = [v8 artistUploadedContentType];
      v80 = self->_artistBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipArtist"])
      {
        v136 = [v9 artist];
        uint64_t v81 = -[MPStoreModelArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v80, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 2;
        v73 = (void *)v81;
        v62 = (void *)v81;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelArtistBuilder *)v80 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v139 = 2;
      v62 = v77;
      break;
    case 3:
    case 4:
    case 5:
      v116 = [v8 artistUploadedContentType];
      v59 = self->_curatorBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipCurator"])
      {
        v136 = [v9 curator];
        uint64_t v60 = -[MPStoreModelCuratorBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v59, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 3;
        v73 = (void *)v60;
        v74 = (void *)v60;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelCuratorBuilder *)v59 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v139 = 3;
      v74 = v77;
      break;
    case 6:
    case 10:
      v116 = [v8 artistUploadedContentType];
      v75 = self->_songBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipSong"])
      {
        v136 = [v9 song];
        uint64_t v76 = -[MPStoreModelSongBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v75, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 7;
        v73 = (void *)v76;
        v67 = (void *)v76;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelSongBuilder *)v75 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v120 = 0;
      v122 = 0;
      v118 = 0;
      v119 = 0;
      v117 = 0;
      v124 = v77;
      v126 = 0;
      uint64_t v108 = 7;
      goto LABEL_85;
    case 7:
      v116 = [v8 artistUploadedContentType];
      v82 = self->_playlistBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipPlaylist"])
      {
        v136 = [v9 playlist];
        uint64_t v83 = -[MPStoreModelPlaylistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v82, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 4;
        v73 = (void *)v83;
        v65 = (void *)v83;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelPlaylistBuilder *)v82 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v139 = 4;
      v65 = v77;
      break;
    case 8:
      v116 = [v8 artistUploadedContentType];
      v84 = self->_radioStationBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipRadioStation"])
      {
        v136 = [v9 radioStation];
        uint64_t v85 = -[MPStoreModelRadioStationBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v84, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 5;
        v73 = (void *)v85;
        v66 = (void *)v85;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelRadioStationBuilder *)v84 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v139 = 5;
      v66 = v77;
      break;
    case 9:
      v116 = [v8 artistUploadedContentType];
      v109 = self->_socialPersonBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipSocialPerson"])
      {
        v136 = [v9 socialPerson];
        uint64_t v110 = -[MPStoreModelSocialPersonBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v109, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 6;
        v73 = (void *)v110;
        v71 = (void *)v110;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelSocialPersonBuilder *)v109 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = v77;
      v126 = 0;
      uint64_t v108 = 6;
      goto LABEL_85;
    case 11:
      v116 = [v8 artistUploadedContentType];
      v86 = self->_episodeBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipTVEpisode"])
      {
        v136 = [v9 episode];
        uint64_t v87 = -[MPStoreModelTVEpisodeBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v86, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 8;
        v73 = (void *)v87;
        v63 = (void *)v87;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelTVEpisodeBuilder *)v86 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v139 = 8;
      v63 = v77;
      break;
    case 12:
      v116 = [v8 artistUploadedContentType];
      v88 = self->_seasonBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipTVSeason"])
      {
        v136 = [v9 season];
        uint64_t v89 = -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v88, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 10;
        v73 = (void *)v89;
        v68 = (void *)v89;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelObjectBuilder *)v88 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v124 = 0;
      v126 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      uint64_t v139 = 10;
      v122 = v77;
      break;
    case 13:
      v116 = [v8 artistUploadedContentType];
      v90 = self->_showBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipTVShow"])
      {
        v136 = [v9 show];
        uint64_t v91 = -[MPStoreModelTVShowBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v90, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 9;
        v73 = (void *)v91;
        v69 = (void *)v91;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelTVShowBuilder *)v90 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v118 = 0;
      v119 = 0;
      v117 = 0;
      v126 = 0;
      uint64_t v139 = 9;
      v120 = v77;
      break;
    case 14:
      v116 = [v8 artistUploadedContentType];
      v92 = self->_showCreatorBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipTVShowCreator"])
      {
        v136 = [v9 showCreator];
        uint64_t v93 = -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v92, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 11;
        v73 = (void *)v93;
        v70 = (void *)v93;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelObjectBuilder *)v92 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = v77;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v108 = 11;
      goto LABEL_85;
    case 15:
      v116 = [v8 artistUploadedContentType];
      v94 = self->_movieBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipMovie"])
      {
        v136 = [v9 movie];
        uint64_t v95 = -[MPStoreModelMovieBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v94, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v126 = 0;
        uint64_t v139 = 12;
        v73 = (void *)v95;
        v64 = (void *)v95;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelMovieBuilder *)v94 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = 0;
      v118 = 0;
      v126 = 0;
      uint64_t v139 = 12;
      v64 = v77;
      break;
    case 17:
      v116 = [v8 artistUploadedContentType];
      v104 = self->_recordLabelBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipRecordLabel"])
      {
        v136 = [v9 recordLabel];
        uint64_t v105 = -[MPStoreModelRecordLabelBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v104, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v126 = 0;
        uint64_t v139 = 14;
        v73 = (void *)v105;
        v72 = (void *)v105;
        goto LABEL_72;
      }
      v77 = [(MPStoreModelRecordLabelBuilder *)v104 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
      v61 = 0;
      v62 = 0;
      v74 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v122 = 0;
      v124 = 0;
      v119 = 0;
      v120 = 0;
      v117 = v77;
      v118 = 0;
      v126 = 0;
      uint64_t v108 = 14;
LABEL_85:
      uint64_t v139 = v108;
      break;
    case 18:
      v116 = [v8 artistUploadedContentType];
      v106 = self->_creditsArtistBuilder;
      if ([v9 hasLoadedValueForKey:@"MPModelStoreBrowseContentItemRelationshipCreditsArtist"])
      {
        v136 = [v9 creditsArtist];
        uint64_t v107 = -[MPStoreModelCreditsArtistBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](v106, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8);
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        uint64_t v139 = 15;
        v73 = (void *)v107;
        v126 = (void *)v107;
LABEL_72:
        v117 = v72;
        v118 = v71;
        v119 = v70;
        v120 = v69;
        v122 = v68;
        v124 = v67;

        v77 = v73;
      }
      else
      {
        v77 = [(MPStoreModelCreditsArtistBuilder *)v106 modelObjectWithStoreItemMetadata:v8 sourceModelObject:0 userIdentity:v146];
        v61 = 0;
        v62 = 0;
        v74 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v122 = 0;
        v124 = 0;
        v119 = 0;
        v120 = 0;
        v117 = 0;
        v118 = 0;
        uint64_t v139 = 15;
        v126 = v77;
      }
      break;
    default:
      id v96 = [v8 artistUploadedContentType];
      id v97 = 0;
      id v98 = 0;
      id v99 = 0;
      id v100 = 0;
      id v101 = 0;
      id v102 = 0;
      id v103 = 0;
      id v130 = 0;
      id v132 = 0;
      id v134 = 0;
      id v137 = 0;
      id v128 = 0;
      id v140 = 0;
      id v143 = 0;
      v58 = 0;
      goto LABEL_89;
  }
  v111 = v61;
  uint64_t v112 = [v77 identifiers];
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [MPModelStoreBrowseContentItem alloc];
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __104__MPModelStoreBrowseContentItemBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
    v147[3] = &unk_1E57ED960;
    v147[4] = self;
    uint64_t v163 = v139;
    int64_t v164 = v142;
    id v143 = v111;
    id v148 = v143;
    id v140 = v62;
    id v149 = v140;
    id v137 = v74;
    id v150 = v137;
    id v134 = v64;
    id v151 = v134;
    id v132 = v65;
    id v152 = v132;
    id v130 = v66;
    id v153 = v130;
    id v103 = v124;
    id v154 = v103;
    id v128 = v63;
    id v155 = v128;
    id v102 = v122;
    id v156 = v102;
    id v101 = v120;
    id v157 = v101;
    id v100 = v119;
    id v158 = v100;
    id v99 = v118;
    id v159 = v99;
    id v96 = v116;
    id v160 = v96;
    id v98 = v117;
    id v161 = v98;
    id v97 = v126;
    id v162 = v97;
    v58 = [(MPModelObject *)v114 initWithIdentifiers:v113 block:v147];

    id v9 = v144;
  }
  else
  {
    v58 = 0;
    id v9 = v144;
    id v140 = v62;
    id v143 = v111;
    id v134 = v64;
    id v137 = v74;
    id v128 = v63;
    id v130 = v66;
    id v132 = v65;
    id v102 = v122;
    id v103 = v124;
    id v100 = v119;
    id v101 = v120;
    id v99 = v118;
    id v96 = v116;
    id v98 = v117;
    id v97 = v126;
  }
LABEL_89:

  id v8 = v145;
LABEL_90:

  return v58;
}

void __104__MPModelStoreBrowseContentItemBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 2) != 0)
  {
    [v4 setItemType:a1[20]];
    int v3 = *(_DWORD *)(a1[4] + 24);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v4 setDetailedItemType:a1[21]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v4 setAlbum:a1[5]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v4 setArtist:a1[6]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v4 setCurator:a1[7]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x80) == 0)
  {
LABEL_7:
    if ((v3 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v4 setMovie:a1[8]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x100) == 0)
  {
LABEL_8:
    if ((v3 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v4 setPlaylist:a1[9]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x200) == 0)
  {
LABEL_9:
    if ((v3 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v4 setRadioStation:a1[10]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x800) == 0)
  {
LABEL_10:
    if ((v3 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v4 setSong:a1[11]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x40) == 0)
  {
LABEL_11:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v4 setEpisode:a1[12]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x1000) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v4 setSeason:a1[13]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x2000) == 0)
  {
LABEL_13:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v4 setShow:a1[14]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x4000) == 0)
  {
LABEL_14:
    if ((v3 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v4 setShowCreator:a1[15]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x400) == 0)
  {
LABEL_15:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v4 setSocialPerson:a1[16]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x8000) == 0)
  {
LABEL_16:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v4 setArtistUploadedContentType:a1[17]];
  int v3 = *(_DWORD *)(a1[4] + 24);
  if ((v3 & 0x10000) == 0)
  {
LABEL_17:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  [v4 setRecordLabel:a1[18]];
  if ((*(_DWORD *)(a1[4] + 24) & 0x20000) != 0) {
LABEL_18:
  }
    [v4 setCreditsArtist:a1[19]];
LABEL_19:
}

- (int64_t)contentItemTypeForMusicAPIType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"albums"])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"artists"])
  {
    uint64_t v5 = 20;
  }
  else if ([v4 isEqualToString:@"playlists"])
  {
    uint64_t v5 = 46;
  }
  else if ([v4 isEqualToString:@"music-videos"])
  {
    uint64_t v5 = 5;
  }
  else if ([v4 isEqualToString:@"songs"])
  {
    uint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"stations"])
  {
    uint64_t v5 = 40;
  }
  else if ([v4 isEqualToString:@"shows"])
  {
    uint64_t v5 = 8;
  }
  else if ([v4 isEqualToString:@"tv-episodes"])
  {
    uint64_t v5 = 6;
  }
  else if ([v4 isEqualToString:@"tv-seasons"])
  {
    uint64_t v5 = 7;
  }
  else if ([v4 isEqualToString:@"record-labels"])
  {
    uint64_t v5 = 52;
  }
  else if ([v4 isEqualToString:@"credits-artist"])
  {
    uint64_t v5 = 53;
  }
  else
  {
    uint64_t v5 = 0;
  }
  int64_t v6 = [(MPModelStoreBrowseContentItemBuilder *)self contentItemTypeForRawResponseKindIdentifierValue:v5];

  return v6;
}

- (int64_t)contentItemTypeForStoreItemMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 itemKind];
  if ([v5 isEqualToString:@"album"])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"artist"])
  {
    uint64_t v6 = 20;
  }
  else if ([v5 isEqualToString:@"creditsArtist"])
  {
    uint64_t v6 = 53;
  }
  else if ([v5 isEqualToString:@"playlist"])
  {
    uint64_t v6 = 46;
  }
  else if ([v5 isEqualToString:@"movie"])
  {
    uint64_t v6 = 10;
  }
  else if ([v5 isEqualToString:@"song"])
  {
    uint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"tvEpisode"])
  {
    uint64_t v6 = 6;
  }
  else if ([v5 isEqualToString:@"tvSeason"])
  {
    uint64_t v6 = 7;
  }
  else if ([v5 isEqualToString:@"uploadedAudio"])
  {
    uint64_t v6 = 50;
  }
  else if ([v5 isEqualToString:@"musicVideo"])
  {
    uint64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"uploadedVideo"])
  {
    uint64_t v6 = 51;
  }
  else if ([v5 isEqualToString:@"radioStation"])
  {
    uint64_t v6 = 40;
  }
  else if ([v5 isEqualToString:@"socialProfile"])
  {
    uint64_t v6 = 27;
  }
  else if ([v5 isEqualToString:@"activity"])
  {
    uint64_t v6 = 47;
  }
  else if ([v5 isEqualToString:@"brand"])
  {
    uint64_t v6 = 48;
  }
  else if (([v5 isEqualToString:@"iTunesBrand"] & 1) != 0 {
         || [v5 isEqualToString:@"showBrand"])
  }
  {
    v7 = [v4 iTunesBrandType];
    id v8 = v7;
    if (v7
      && (([v7 isEqualToString:@"Linear"] & 1) != 0
       || ([v8 isEqualToString:@"Non-Linear"] & 1) != 0
       || ([v8 isEqualToString:@"Standalone"] & 1) != 0))
    {
      uint64_t v9 = 8;
    }
    else
    {
      uint64_t v9 = 49;
    }
    uint64_t v12 = v9;

    uint64_t v6 = v12;
  }
  else if (([v5 isEqualToString:@"recordLabel"] & 1) != 0 {
         || [v5 isEqualToString:@"record-labels"])
  }
  {
    uint64_t v6 = 52;
  }
  else
  {
    uint64_t v6 = 0;
  }
  int64_t v10 = [(MPModelStoreBrowseContentItemBuilder *)self contentItemTypeForRawResponseKindIdentifierValue:v6];

  return v10;
}

- (int64_t)contentItemTypeForRawResponseKindIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1EE715FB8])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector())
          {
            int64_t v11 = -[MPModelStoreBrowseContentItemBuilder contentItemTypeForRawResponseKindIdentifierValue:](self, "contentItemTypeForRawResponseKindIdentifierValue:", objc_msgSend(v10, "integerValue", (void)v14));
            if (v11)
            {
              int64_t v12 = v11;
              goto LABEL_14;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    int64_t v12 = 0;
LABEL_14:
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (int64_t)contentItemTypeForRawResponseKindIdentifierValue:(int64_t)a3
{
  int64_t result = 0;
  if (!(!v4 & v3))
  {
    switch(a3)
    {
      case '(':
        return 8 * self->_allowsRadioStations;
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
        return result;
      case '.':
        return 7;
      case '/':
        return 5;
      case '0':
        return 4;
      case '1':
        return 3;
      case '2':
        return 10;
      case '3':
        goto LABEL_20;
      case '4':
        return 17;
      case '5':
        return 18;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 1:
      return 10;
    case 2:
      return 1;
    case 3:
    case 4:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      return result;
    case 5:
      if (!self->_shouldFakeEpisodes || !self->_allowsVideoContent)
      {
LABEL_20:
        BOOL v7 = !self->_allowsVideoContent;
        int64_t v8 = 10;
        goto LABEL_25;
      }
      return 11;
    case 6:
      BOOL v7 = !self->_allowsVideoContent;
      int64_t v8 = 11;
      goto LABEL_25;
    case 7:
      BOOL v7 = !self->_allowsVideoContent;
      int64_t v8 = 12;
      goto LABEL_25;
    case 8:
      BOOL v7 = !self->_allowsVideoContent;
      int64_t v8 = 13;
      goto LABEL_25;
    case 10:
      BOOL v7 = !self->_allowsVideoContent;
      int64_t v8 = 15;
LABEL_25:
      if (v7) {
        int64_t result = 0;
      }
      else {
        int64_t result = v8;
      }
      break;
    case 20:
      int64_t result = 2;
      break;
    default:
      if (a3 == 27) {
        int64_t result = 9;
      }
      else {
        int64_t result = 0;
      }
      break;
  }
  return result;
}

- (void)setPreventStoreItemMetadataCaching:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPModelStoreBrowseContentItemBuilder;
  -[MPStoreModelObjectBuilder setPreventStoreItemMetadataCaching:](&v5, sel_setPreventStoreItemMetadataCaching_);
  [(MPStoreModelObjectBuilder *)self->_albumBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_artistBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_curatorBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_episodeBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_movieBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_radioStationBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_socialPersonBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_playlistBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_seasonBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_songBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_showBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_showCreatorBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_recordLabelBuilder setPreventStoreItemMetadataCaching:v3];
  [(MPStoreModelObjectBuilder *)self->_creditsArtistBuilder setPreventStoreItemMetadataCaching:v3];
}

- (MPModelStoreBrowseContentItemBuilder)initWithRequestedPropertySet:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelStoreBrowseContentItemBuilder;
  BOOL v3 = [(MPStoreModelObjectBuilder *)&v7 initWithRequestedPropertySet:a3];
  char v4 = v3;
  if (v3)
  {
    v3->_allowsRadioStations = 1;
    v3->_allowsVideoContent = 1;
    objc_super v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v4->_shouldFakeEpisodes = [v5 BOOLForKey:@"MusicShouldFakeTVEpisodes"];
  }
  return v4;
}

+ (id)allSupportedProperties
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v23[0] = @"MPModelStoreBrowseContentItemPropertyItemType";
  v23[1] = @"MPModelStoreBrowseContentItemPropertyDetailedItemType";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v21[0] = @"MPModelStoreBrowseContentItemRelationshipAlbum";
  v20 = +[MPStoreModelAlbumBuilder allSupportedProperties];
  v22[0] = v20;
  v21[1] = @"MPModelStoreBrowseContentItemRelationshipArtist";
  uint64_t v19 = +[MPStoreModelArtistBuilder allSupportedProperties];
  v22[1] = v19;
  v21[2] = @"MPModelStoreBrowseContentItemRelationshipCreditsArtist";
  v18 = +[MPStoreModelCreditsArtistBuilder allSupportedProperties];
  v22[2] = v18;
  v21[3] = @"MPModelStoreBrowseContentItemRelationshipCurator";
  long long v17 = +[MPStoreModelCuratorBuilder allSupportedProperties];
  v22[3] = v17;
  v21[4] = @"MPModelStoreBrowseContentItemRelationshipMovie";
  long long v16 = +[MPStoreModelMovieBuilder allSupportedProperties];
  v22[4] = v16;
  v21[5] = @"MPModelStoreBrowseContentItemRelationshipPlaylist";
  long long v15 = +[MPStoreModelPlaylistBuilder allSupportedProperties];
  v22[5] = v15;
  v21[6] = @"MPModelStoreBrowseContentItemRelationshipRadioStation";
  long long v14 = +[MPStoreModelRadioStationBuilder allSupportedProperties];
  v22[6] = v14;
  v21[7] = @"MPModelStoreBrowseContentItemRelationshipSong";
  char v4 = +[MPStoreModelSongBuilder allSupportedProperties];
  v22[7] = v4;
  v21[8] = @"MPModelStoreBrowseContentItemRelationshipTVEpisode";
  objc_super v5 = +[MPStoreModelTVEpisodeBuilder allSupportedProperties];
  v22[8] = v5;
  v21[9] = @"MPModelStoreBrowseContentItemRelationshipTVSeason";
  uint64_t v6 = +[MPStoreModelObjectBuilder allSupportedProperties];
  v22[9] = v6;
  v21[10] = @"MPModelStoreBrowseContentItemRelationshipTVShow";
  objc_super v7 = +[MPStoreModelTVShowBuilder allSupportedProperties];
  v22[10] = v7;
  v21[11] = @"MPModelStoreBrowseContentItemRelationshipTVShowCreator";
  int64_t v8 = +[MPStoreModelObjectBuilder allSupportedProperties];
  v22[11] = v8;
  v21[12] = @"MPModelStoreBrowseContentItemRelationshipSocialPerson";
  uint64_t v9 = +[MPStoreModelSocialPersonBuilder allSupportedProperties];
  v22[12] = v9;
  v21[13] = @"MPModelStoreBrowseContentItemRelationshipRecordLabel";
  int64_t v10 = +[MPStoreModelRecordLabelBuilder allSupportedProperties];
  v22[13] = v10;
  int64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:14];
  int64_t v12 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v11];

  return v12;
}

@end