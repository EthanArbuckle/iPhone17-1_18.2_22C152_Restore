@interface MPModelPlaylist
+ (BOOL)supportsKeepLocalStatusObservation;
+ (BOOL)supportsLibraryAddStatusObservation;
+ (BOOL)supportsLibraryRemoval;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__cloudVersionHash_KEY;
+ (id)__collaborationInvitationURLExpirationDate_KEY;
+ (id)__collaborationInvitationURL_KEY;
+ (id)__collaborationJoinRequestIsPending_KEY;
+ (id)__collaborationMode_KEY;
+ (id)__collaborationSharingMode_KEY;
+ (id)__collaborative_KEY;
+ (id)__collaboratorPermissions_KEY;
+ (id)__collaboratorStatus_KEY;
+ (id)__coverArtworkRecipe_KEY;
+ (id)__curatorPlaylist_KEY;
+ (id)__curator_KEY;
+ (id)__dateFavorited_KEY;
+ (id)__descriptionText_KEY;
+ (id)__downloadedDate_KEY;
+ (id)__editorNotes_KEY;
+ (id)__editorialArtworkCatalogBlock_KEY;
+ (id)__favoriteSongsPlaylist_KEY;
+ (id)__hasCleanContent_KEY;
+ (id)__hasExplicitContent_KEY;
+ (id)__isDisliked_KEY;
+ (id)__isFavorite_KEY;
+ (id)__keepLocalConstraints_KEY;
+ (id)__keepLocalEnableState_KEY;
+ (id)__keepLocalManagedStatusReason_KEY;
+ (id)__keepLocalManagedStatus_KEY;
+ (id)__lastDevicePlaybackDate_KEY;
+ (id)__lastModifiedDateComponents_KEY;
+ (id)__libraryAddedDate_KEY;
+ (id)__libraryAdded_KEY;
+ (id)__name_KEY;
+ (id)__owner_KEY;
+ (id)__parentPersistentID_KEY;
+ (id)__publicPlaylist_KEY;
+ (id)__releaseDateComponents_KEY;
+ (id)__shareShortURL_KEY;
+ (id)__shareURL_KEY;
+ (id)__shortEditorNotes_KEY;
+ (id)__subscribed_KEY;
+ (id)__tiledArtworkCatalogBlock_KEY;
+ (id)__trackCount_KEY;
+ (id)__traits_KEY;
+ (id)__type_KEY;
+ (id)__userEditableComponents_KEY;
+ (id)__versionHash_KEY;
+ (id)__visiblePlaylist_KEY;
+ (id)kindWithPlaylistEntryKind:(id)a3 options:(unint64_t)a4;
+ (id)kindWithVariants:(unint64_t)a3 playlistEntryKind:(id)a4 options:(unint64_t)a5;
+ (id)requiredKeepLocalStatusObservationProperties;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredLibraryRemovalProperties;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyPlaylistArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCloudVersionHash__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCollaborationInvitationURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCollaborationJoinRequestIsPending__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCollaborationMode__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCollaborationSharingMode__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCollaboratorPermissions__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCollaboratorStatus__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCoverArtworkRecipe__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistCuratorPlaylist__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistDateFavorited__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistDescriptionText__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistDownloadedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistEditorialArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistHasCleanContent__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistHasExplicitContent__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistIsCollaborative__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistIsDisliked__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistIsFavoriteSongsPlaylist__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistIsFavorite__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistIsOwner__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistKeepLocalConstraints__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistKeepLocalEnableState__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistKeepLocalManagedStatusReason__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistKeepLocalManagedStatus__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistLastDevicePlaybackDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistLastModifiedDateComponents__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistLibraryAdded__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistName__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistParentPersistentID__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistPublicPlaylist__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistReleaseDateComponents__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistShareShortURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistShareURL__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistShortEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistSubscribed__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistTrackCount__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistTracksTiledArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistTraits__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistType__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistUserEditableComponents__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistVersionHash__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistVisiblePlaylist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistCurator__MAPPING_MISSING__;
- (BOOL)isFavoriteSongsPlaylist;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (id)artworkCatalog;
- (id)contentItemCollectionInfo;
- (id)editorialArtworkCatalog;
- (id)humanDescription;
- (id)newKeepLocalStatusObserverConfiguration;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)tracksTiledArtworkCatalogWithRows:(unint64_t)a3 columns:(unint64_t)a4;
- (int64_t)libraryRemovalSupportedOptions;
- (void)setIsFavoriteSongsPlaylist:(BOOL)a3;
@end

@implementation MPModelPlaylist

+ (id)__visiblePlaylist_KEY
{
  return @"MPModelPropertyPlaylistVisiblePlaylist";
}

+ (id)__versionHash_KEY
{
  return @"MPModelPropertyPlaylistVersionHash";
}

+ (id)__userEditableComponents_KEY
{
  return @"MPModelPropertyPlaylistUserEditableComponents";
}

+ (id)__type_KEY
{
  return @"MPModelPropertyPlaylistType";
}

+ (id)__traits_KEY
{
  return @"MPModelPropertyPlaylistTraits";
}

+ (id)__trackCount_KEY
{
  return @"MPModelPropertyPlaylistTrackCount";
}

+ (id)__tiledArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyPlaylistTracksTiledArtwork";
}

+ (id)__subscribed_KEY
{
  return @"MPModelPropertyPlaylistSubscribed";
}

+ (id)__shortEditorNotes_KEY
{
  return @"MPModelPropertyPlaylistShortEditorNotes";
}

+ (id)__shareURL_KEY
{
  return @"MPModelPropertyPlaylistShareURL";
}

+ (id)__shareShortURL_KEY
{
  return @"MPModelPropertyPlaylistShareShortURL";
}

+ (id)__releaseDateComponents_KEY
{
  return @"MPModelPropertyPlaylistReleaseDateComponents";
}

+ (id)__publicPlaylist_KEY
{
  return @"MPModelPropertyPlaylistPublicPlaylist";
}

+ (id)__parentPersistentID_KEY
{
  return @"MPModelPropertyPlaylistParentPersistentID";
}

+ (id)__owner_KEY
{
  return @"MPModelPropertyPlaylistIsOwner";
}

+ (id)__name_KEY
{
  return @"MPModelPropertyPlaylistName";
}

+ (id)__libraryAdded_KEY
{
  return @"MPModelPropertyPlaylistLibraryAdded";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyPlaylistLibraryAddedDate";
}

+ (id)__lastModifiedDateComponents_KEY
{
  return @"MPModelPropertyPlaylistLastModifiedDateComponents";
}

+ (id)__lastDevicePlaybackDate_KEY
{
  return @"MPModelPropertyPlaylistLastDevicePlaybackDate";
}

+ (id)__keepLocalManagedStatus_KEY
{
  return @"MPModelPropertyPlaylistKeepLocalManagedStatus";
}

+ (id)__keepLocalManagedStatusReason_KEY
{
  return @"MPModelPropertyPlaylistKeepLocalManagedStatusReason";
}

+ (id)__keepLocalEnableState_KEY
{
  return @"MPModelPropertyPlaylistKeepLocalEnableState";
}

+ (id)__keepLocalConstraints_KEY
{
  return @"MPModelPropertyPlaylistKeepLocalConstraints";
}

+ (id)__isFavorite_KEY
{
  return @"MPModelPropertyPlaylistIsFavorite";
}

+ (id)__isDisliked_KEY
{
  return @"MPModelPropertyPlaylistIsDisliked";
}

+ (id)__hasExplicitContent_KEY
{
  return @"MPModelPropertyPlaylistHasExplicitContent";
}

+ (id)__hasCleanContent_KEY
{
  return @"MPModelPropertyPlaylistHasCleanContent";
}

+ (id)__favoriteSongsPlaylist_KEY
{
  return @"MPModelPropertyPlaylistIsFavoriteSongsPlaylist";
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyPlaylistEditorialArtwork";
}

+ (id)__editorNotes_KEY
{
  return @"MPModelPropertyPlaylistEditorNotes";
}

+ (id)__downloadedDate_KEY
{
  return @"MPModelPropertyPlaylistDownloadedDate";
}

+ (id)__descriptionText_KEY
{
  return @"MPModelPropertyPlaylistDescriptionText";
}

+ (id)__dateFavorited_KEY
{
  return @"MPModelPropertyPlaylistDateFavorited";
}

+ (id)__curator_KEY
{
  return @"MPModelRelationshipPlaylistCurator";
}

+ (id)__curatorPlaylist_KEY
{
  return @"MPModelPropertyPlaylistCuratorPlaylist";
}

+ (id)__coverArtworkRecipe_KEY
{
  return @"MPModelPropertyPlaylistCoverArtworkRecipe";
}

+ (id)__collaboratorStatus_KEY
{
  return @"MPModelPropertyPlaylistCollaboratorStatus";
}

+ (id)__collaboratorPermissions_KEY
{
  return @"MPModelPropertyPlaylistCollaboratorPermissions";
}

+ (id)__collaborative_KEY
{
  return @"MPModelPropertyPlaylistIsCollaborative";
}

+ (id)__collaborationSharingMode_KEY
{
  return @"MPModelPropertyPlaylistCollaborationSharingMode";
}

+ (id)__collaborationMode_KEY
{
  return @"MPModelPropertyPlaylistCollaborationMode";
}

+ (id)__collaborationJoinRequestIsPending_KEY
{
  return @"MPModelPropertyPlaylistCollaborationJoinRequestIsPending";
}

+ (id)__collaborationInvitationURL_KEY
{
  return @"MPModelPropertyPlaylistCollaborationInvitationURL";
}

+ (id)__collaborationInvitationURLExpirationDate_KEY
{
  return @"MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate";
}

+ (id)__cloudVersionHash_KEY
{
  return @"MPModelPropertyPlaylistCloudVersionHash";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyPlaylistArtwork";
}

+ (id)kindWithVariants:(unint64_t)a3 playlistEntryKind:(id)a4 options:(unint64_t)a5
{
  return +[MPModelPlaylistKind kindWithVariants:a3 playlistEntryKind:a4 options:a5];
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelPlaylist *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelPlaylist *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyPlaylistLibraryAdded";
  v5[1] = @"MPModelPropertyPlaylistHasCleanContent";
  v5[2] = @"MPModelPropertyPlaylistHasExplicitContent";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  uint64_t v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (id)requiredLibraryRemovalProperties
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyPlaylistLibraryAdded";
  v5[1] = @"MPModelPropertyPlaylistKeepLocalManagedStatus";
  v5[2] = @"MPModelPropertyPlaylistKeepLocalManagedStatusReason";
  v5[3] = @"MPModelPropertyPlaylistKeepLocalConstraints";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  uint64_t v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyPlaylistKeepLocalManagedStatus";
  v5[1] = @"MPModelPropertyPlaylistKeepLocalManagedStatusReason";
  v5[2] = @"MPModelPropertyPlaylistKeepLocalEnableState";
  v5[3] = @"MPModelPropertyPlaylistKeepLocalConstraints";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  uint64_t v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)contentItemCollectionInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"_MPNowPlayingCollectionInfoCollectionTypePlaylist" forKey:@"_MPNowPlayingCollectionInfoKeyCollectionType"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MPModelPlaylist_MPContentItemAdditions__contentItemCollectionInfo__block_invoke;
  v8[3] = &unk_1E57F9F98;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  +[MPModelObject performWithoutEnforcement:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __68__MPModelPlaylist_MPContentItemAdditions__contentItemCollectionInfo__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) name];
  if ([v6 length]) {
    [*(id *)(a1 + 40) setObject:v6 forKey:@"_MPNowPlayingCollectionInfoKeyTitle"];
  }
  v2 = [*(id *)(a1 + 32) identifiers];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v2 universalStore];
  v5 = [v4 globalPlaylistID];

  if ([v5 length]) {
    [v3 setObject:v5 forKey:@"_MPNowPlayingInfoPropertyPlaylistGlobalIdentifier"];
  }
  if ([v3 count]) {
    [*(id *)(a1 + 40) setObject:v3 forKey:@"_MPNowPlayingCollectionInfoKeyIdentifiers"];
  }
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  int v3 = [(MPModelPlaylist *)self isLibraryAdded];
  int v4 = [(MPModelPlaylist *)self hasCleanContent];
  int v5 = [(MPModelPlaylist *)self hasExplicitContent];
  uint64_t v6 = 0x100000000;
  if (v5) {
    uint64_t v6 = 0x101000000;
  }
  uint64_t v7 = 0x10000;
  if (!v4) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 257;
  if (!v3) {
    uint64_t v8 = 1;
  }
  return (MPLibraryAddStatusObserverConfiguration)(v8 | v7 | v6);
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 1;
}

- (int64_t)libraryRemovalSupportedOptions
{
  if ([(MPModelPlaylist *)self isLibraryAdded]) {
    uint64_t v3 = 2 * ([(MPModelPlaylist *)self type] != 9);
  }
  else {
    uint64_t v3 = 0;
  }
  return v3 | ([(MPModelPlaylist *)self keepLocalManagedStatus] == 2);
}

+ (BOOL)supportsLibraryRemoval
{
  return 1;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  uint64_t v3 = objc_alloc_init(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration);
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setIdentifyingModelObject:self];
  [(MPLibraryKeepLocalStatusObserverConfiguration *)v3 setEnableState:[(MPModelPlaylist *)self keepLocalEnableState]];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setManagedStatus:[(MPModelPlaylist *)self keepLocalManagedStatus]];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setStoreRedownloadable:1];
  [(MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)v3 setCollectionType:1];
  return v3;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 1;
}

+ (int64_t)genericObjectType
{
  return 4;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyPlaylistIsFavorite";
  v5[1] = @"MPModelPropertyPlaylistIsDisliked";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  uint64_t v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (void)setIsFavoriteSongsPlaylist:(BOOL)a3
{
  self->_isFavoriteSongsPlaylist = a3;
}

- (BOOL)isFavoriteSongsPlaylist
{
  return self->_isFavoriteSongsPlaylist;
}

- (id)tracksTiledArtworkCatalogWithRows:(unint64_t)a3 columns:(unint64_t)a4
{
  uint64_t v7 = [(MPModelPlaylist *)self tiledArtworkCatalogBlock];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    id v9 = (*(void (**)(uint64_t, MPModelPlaylist *, unint64_t, unint64_t))(v7 + 16))(v7, self, a3, a4);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3 = [(MPModelPlaylist *)self editorialArtworkCatalogBlock];
  int v4 = (void *)v3;
  if (v3)
  {
    int v5 = (*(void (**)(uint64_t, MPModelPlaylist *))(v3 + 16))(v3, self);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)humanDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  int v4 = [(MPModelObject *)self identifiers];
  int v5 = [v4 humanDescription];
  uint64_t v6 = [v3 stringWithFormat:@"playlist %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyPlaylistName"])
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [(MPModelPlaylist *)self name];
    id v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyPlaylistCollaboratorStatus__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:182 description:@"Translator was missing mapping for MPModelPropertyPlaylistCollaboratorStatus"];
}

+ (void)__MPModelPropertyPlaylistCollaborationJoinRequestIsPending__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:181 description:@"Translator was missing mapping for MPModelPropertyPlaylistCollaborationJoinRequestIsPending"];
}

+ (void)__MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:180 description:@"Translator was missing mapping for MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"];
}

+ (void)__MPModelPropertyPlaylistCollaborationInvitationURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:179 description:@"Translator was missing mapping for MPModelPropertyPlaylistCollaborationInvitationURL"];
}

+ (void)__MPModelPropertyPlaylistCollaboratorPermissions__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:178 description:@"Translator was missing mapping for MPModelPropertyPlaylistCollaboratorPermissions"];
}

+ (void)__MPModelPropertyPlaylistCollaborationMode__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:177 description:@"Translator was missing mapping for MPModelPropertyPlaylistCollaborationMode"];
}

+ (void)__MPModelPropertyPlaylistCollaborationSharingMode__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:176 description:@"Translator was missing mapping for MPModelPropertyPlaylistCollaborationSharingMode"];
}

+ (void)__MPModelPropertyPlaylistIsCollaborative__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:175 description:@"Translator was missing mapping for MPModelPropertyPlaylistIsCollaborative"];
}

+ (void)__MPModelPropertyPlaylistCoverArtworkRecipe__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:174 description:@"Translator was missing mapping for MPModelPropertyPlaylistCoverArtworkRecipe"];
}

+ (void)__MPModelPropertyPlaylistIsFavoriteSongsPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:173 description:@"Translator was missing mapping for MPModelPropertyPlaylistIsFavoriteSongsPlaylist"];
}

+ (void)__MPModelPropertyPlaylistDateFavorited__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:172 description:@"Translator was missing mapping for MPModelPropertyPlaylistDateFavorited"];
}

+ (void)__MPModelPropertyPlaylistIsDisliked__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:171 description:@"Translator was missing mapping for MPModelPropertyPlaylistIsDisliked"];
}

+ (void)__MPModelPropertyPlaylistIsFavorite__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:170 description:@"Translator was missing mapping for MPModelPropertyPlaylistIsFavorite"];
}

+ (void)__MPModelPropertyPlaylistTraits__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:169 description:@"Translator was missing mapping for MPModelPropertyPlaylistTraits"];
}

+ (void)__MPModelPropertyPlaylistDownloadedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:168 description:@"Translator was missing mapping for MPModelPropertyPlaylistDownloadedDate"];
}

+ (void)__MPModelPropertyPlaylistVersionHash__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:167 description:@"Translator was missing mapping for MPModelPropertyPlaylistVersionHash"];
}

+ (void)__MPModelPropertyPlaylistCloudVersionHash__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:166 description:@"Translator was missing mapping for MPModelPropertyPlaylistCloudVersionHash"];
}

+ (void)__MPModelPropertyPlaylistLastDevicePlaybackDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:165 description:@"Translator was missing mapping for MPModelPropertyPlaylistLastDevicePlaybackDate"];
}

+ (void)__MPModelPropertyPlaylistKeepLocalConstraints__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:164 description:@"Translator was missing mapping for MPModelPropertyPlaylistKeepLocalConstraints"];
}

+ (void)__MPModelPropertyPlaylistKeepLocalManagedStatusReason__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:163 description:@"Translator was missing mapping for MPModelPropertyPlaylistKeepLocalManagedStatusReason"];
}

+ (void)__MPModelPropertyPlaylistKeepLocalManagedStatus__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:162 description:@"Translator was missing mapping for MPModelPropertyPlaylistKeepLocalManagedStatus"];
}

+ (void)__MPModelPropertyPlaylistKeepLocalEnableState__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:161 description:@"Translator was missing mapping for MPModelPropertyPlaylistKeepLocalEnableState"];
}

+ (void)__MPModelPropertyPlaylistTracksTiledArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:160 description:@"Translator was missing mapping for MPModelPropertyPlaylistTracksTiledArtwork"];
}

+ (void)__MPModelPropertyPlaylistLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:159 description:@"Translator was missing mapping for MPModelPropertyPlaylistLibraryAddedDate"];
}

+ (void)__MPModelPropertyPlaylistLibraryAdded__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:158 description:@"Translator was missing mapping for MPModelPropertyPlaylistLibraryAdded"];
}

+ (void)__MPModelPropertyPlaylistEditorialArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:157 description:@"Translator was missing mapping for MPModelPropertyPlaylistEditorialArtwork"];
}

+ (void)__MPModelPropertyPlaylistArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:156 description:@"Translator was missing mapping for MPModelPropertyPlaylistArtwork"];
}

+ (void)__MPModelPropertyPlaylistLastModifiedDateComponents__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:155 description:@"Translator was missing mapping for MPModelPropertyPlaylistLastModifiedDateComponents"];
}

+ (void)__MPModelPropertyPlaylistReleaseDateComponents__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:154 description:@"Translator was missing mapping for MPModelPropertyPlaylistReleaseDateComponents"];
}

+ (void)__MPModelPropertyPlaylistShareShortURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:153 description:@"Translator was missing mapping for MPModelPropertyPlaylistShareShortURL"];
}

+ (void)__MPModelPropertyPlaylistShareURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:152 description:@"Translator was missing mapping for MPModelPropertyPlaylistShareURL"];
}

+ (void)__MPModelPropertyPlaylistShortEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:151 description:@"Translator was missing mapping for MPModelPropertyPlaylistShortEditorNotes"];
}

+ (void)__MPModelPropertyPlaylistEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:150 description:@"Translator was missing mapping for MPModelPropertyPlaylistEditorNotes"];
}

+ (void)__MPModelPropertyPlaylistTrackCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:149 description:@"Translator was missing mapping for MPModelPropertyPlaylistTrackCount"];
}

+ (void)__MPModelPropertyPlaylistType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:148 description:@"Translator was missing mapping for MPModelPropertyPlaylistType"];
}

+ (void)__MPModelPropertyPlaylistUserEditableComponents__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:147 description:@"Translator was missing mapping for MPModelPropertyPlaylistUserEditableComponents"];
}

+ (void)__MPModelPropertyPlaylistSubscribed__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:146 description:@"Translator was missing mapping for MPModelPropertyPlaylistSubscribed"];
}

+ (void)__MPModelPropertyPlaylistVisiblePlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:145 description:@"Translator was missing mapping for MPModelPropertyPlaylistVisiblePlaylist"];
}

+ (void)__MPModelPropertyPlaylistPublicPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:144 description:@"Translator was missing mapping for MPModelPropertyPlaylistPublicPlaylist"];
}

+ (void)__MPModelPropertyPlaylistIsOwner__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:143 description:@"Translator was missing mapping for MPModelPropertyPlaylistIsOwner"];
}

+ (void)__MPModelPropertyPlaylistCuratorPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:142 description:@"Translator was missing mapping for MPModelPropertyPlaylistCuratorPlaylist"];
}

+ (void)__MPModelPropertyPlaylistHasExplicitContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:141 description:@"Translator was missing mapping for MPModelPropertyPlaylistHasExplicitContent"];
}

+ (void)__MPModelPropertyPlaylistHasCleanContent__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:140 description:@"Translator was missing mapping for MPModelPropertyPlaylistHasCleanContent"];
}

+ (void)__MPModelPropertyPlaylistParentPersistentID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:139 description:@"Translator was missing mapping for MPModelPropertyPlaylistParentPersistentID"];
}

+ (void)__MPModelRelationshipPlaylistCurator__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:138 description:@"Translator was missing mapping for MPModelRelationshipPlaylistCurator"];
}

+ (void)__MPModelPropertyPlaylistDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:137 description:@"Translator was missing mapping for MPModelPropertyPlaylistDescriptionText"];
}

+ (void)__MPModelPropertyPlaylistName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylist.m" lineNumber:136 description:@"Translator was missing mapping for MPModelPropertyPlaylistName"];
}

+ (id)kindWithPlaylistEntryKind:(id)a3 options:(unint64_t)a4
{
  return (id)[a1 kindWithVariants:223 playlistEntryKind:a3 options:a4];
}

@end