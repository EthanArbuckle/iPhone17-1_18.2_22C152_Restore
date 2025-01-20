@interface MPModelLibraryPlaylistEditChangeRequest
+ (id)requiredPlaylistEntryProperties;
- (BOOL)didSetPlaylistUserImage;
- (BOOL)shouldCreatePlaylist;
- (MPChangeDetails)trackListChanges;
- (MPMediaLibrary)mediaLibrary;
- (MPModelLibraryPlaylistEditChangeRequest)init;
- (MPModelPlaylist)parentPlaylist;
- (MPModelPlaylist)playlist;
- (MPSectionedCollection)musicKitPlaylistEntries;
- (MPSectionedCollection)playlistEntries;
- (NSDictionary)deletedEntryUUIDs;
- (NSNumber)isCuratorPlaylist;
- (NSNumber)isOwner;
- (NSNumber)isPublicPlaylist;
- (NSNumber)isVisiblePlaylist;
- (NSString)authorDisplayName;
- (NSString)authorStoreIdentifier;
- (NSString)coverArtworkRecipe;
- (NSString)playlistDescription;
- (NSString)playlistName;
- (UIImage)playlistUserImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithLocalPersistenceResponseHandler:(id)a3 completeResponseHandler:(id)a4;
- (id)newSDKOperationWithLocalPersistenceResponseHandler:(id)a3 completeResponseHandler:(id)a4;
- (void)setAuthorDisplayName:(id)a3;
- (void)setAuthorStoreIdentifier:(id)a3;
- (void)setCoverArtworkRecipe:(id)a3;
- (void)setCuratorPlaylist:(id)a3;
- (void)setDeletedEntryUUIDs:(id)a3;
- (void)setIsOwner:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setMusicKitPlaylistEntries:(id)a3;
- (void)setParentPlaylist:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPlaylistDescription:(id)a3;
- (void)setPlaylistEntries:(id)a3;
- (void)setPlaylistName:(id)a3;
- (void)setPlaylistUserImage:(id)a3;
- (void)setPublicPlaylist:(id)a3;
- (void)setShouldCreatePlaylist:(BOOL)a3;
- (void)setTrackListChanges:(id)a3;
- (void)setVisiblePlaylist:(id)a3;
@end

@implementation MPModelLibraryPlaylistEditChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicKitPlaylistEntries, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_parentPlaylist, 0);
  objc_storeStrong((id *)&self->_deletedEntryUUIDs, 0);
  objc_storeStrong((id *)&self->_trackListChanges, 0);
  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
  objc_storeStrong((id *)&self->_authorDisplayName, 0);
  objc_storeStrong((id *)&self->_authorStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_curatorPlaylist, 0);
  objc_storeStrong((id *)&self->_visiblePlaylist, 0);
  objc_storeStrong((id *)&self->_publicPlaylist, 0);
  objc_storeStrong((id *)&self->_playlistUserImage, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
  objc_storeStrong((id *)&self->_playlistDescription, 0);
  objc_storeStrong((id *)&self->_playlistEntries, 0);

  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (BOOL)didSetPlaylistUserImage
{
  return self->_didSetPlaylistUserImage;
}

- (void)setMusicKitPlaylistEntries:(id)a3
{
}

- (MPSectionedCollection)musicKitPlaylistEntries
{
  return self->_musicKitPlaylistEntries;
}

- (void)setPlaylist:(id)a3
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setShouldCreatePlaylist:(BOOL)a3
{
  self->_shouldCreatePlaylist = a3;
}

- (BOOL)shouldCreatePlaylist
{
  return self->_shouldCreatePlaylist;
}

- (void)setParentPlaylist:(id)a3
{
}

- (MPModelPlaylist)parentPlaylist
{
  return self->_parentPlaylist;
}

- (void)setDeletedEntryUUIDs:(id)a3
{
}

- (NSDictionary)deletedEntryUUIDs
{
  return self->_deletedEntryUUIDs;
}

- (void)setTrackListChanges:(id)a3
{
}

- (MPChangeDetails)trackListChanges
{
  return self->_trackListChanges;
}

- (void)setCoverArtworkRecipe:(id)a3
{
}

- (NSString)coverArtworkRecipe
{
  return self->_coverArtworkRecipe;
}

- (void)setAuthorDisplayName:(id)a3
{
}

- (NSString)authorDisplayName
{
  return self->_authorDisplayName;
}

- (void)setAuthorStoreIdentifier:(id)a3
{
}

- (NSString)authorStoreIdentifier
{
  return self->_authorStoreIdentifier;
}

- (void)setIsOwner:(id)a3
{
}

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setCuratorPlaylist:(id)a3
{
}

- (NSNumber)isCuratorPlaylist
{
  return self->_curatorPlaylist;
}

- (void)setVisiblePlaylist:(id)a3
{
}

- (NSNumber)isVisiblePlaylist
{
  return self->_visiblePlaylist;
}

- (void)setPublicPlaylist:(id)a3
{
}

- (NSNumber)isPublicPlaylist
{
  return self->_publicPlaylist;
}

- (UIImage)playlistUserImage
{
  return self->_playlistUserImage;
}

- (void)setPlaylistName:(id)a3
{
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void)setPlaylistDescription:(id)a3
{
}

- (NSString)playlistDescription
{
  return self->_playlistDescription;
}

- (void)setPlaylistEntries:(id)a3
{
}

- (MPSectionedCollection)playlistEntries
{
  return self->_playlistEntries;
}

- (void)setMediaLibrary:(id)a3
{
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (id)newSDKOperationWithLocalPersistenceResponseHandler:(id)a3 completeResponseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(MPModelLibrarySDKPlaylistEditChangeRequestOperation);
  [(MPModelLibraryPlaylistEditChangeRequestOperation *)v8 setRequest:self];
  [(MPModelLibraryPlaylistEditChangeRequestOperation *)v8 setCompleteResponseHandler:v6];

  [(MPModelLibraryPlaylistEditChangeRequestOperation *)v8 setLocalPersistenceResponseHandler:v7];
  return v8;
}

- (id)newOperationWithLocalPersistenceResponseHandler:(id)a3 completeResponseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(MPModelLibraryPlaylistEditChangeRequestOperation);
  [(MPModelLibraryPlaylistEditChangeRequestOperation *)v8 setRequest:self];
  [(MPModelLibraryPlaylistEditChangeRequestOperation *)v8 setCompleteResponseHandler:v6];

  [(MPModelLibraryPlaylistEditChangeRequestOperation *)v8 setLocalPersistenceResponseHandler:v7];
  return v8;
}

- (void)setPlaylistUserImage:(id)a3
{
  self->_didSetPlaylistUserImage = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_mediaLibrary);
    uint64_t v6 = [(MPSectionedCollection *)self->_musicKitPlaylistEntries copy];
    id v7 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v6;

    *(unsigned char *)(v5 + 9) = self->_didSetPlaylistUserImage;
    objc_storeStrong((id *)(v5 + 136), self->_playlist);
    uint64_t v8 = [(MPSectionedCollection *)self->_playlistEntries copy];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    objc_storeStrong((id *)(v5 + 32), self->_playlistDescription);
    objc_storeStrong((id *)(v5 + 40), self->_playlistName);
    objc_storeStrong((id *)(v5 + 48), self->_playlistUserImage);
    *(unsigned char *)(v5 + 8) = self->_shouldCreatePlaylist;
    objc_storeStrong((id *)(v5 + 128), self->_parentPlaylist);
    objc_storeStrong((id *)(v5 + 56), self->_publicPlaylist);
    objc_storeStrong((id *)(v5 + 64), self->_visiblePlaylist);
    objc_storeStrong((id *)(v5 + 72), self->_curatorPlaylist);
    objc_storeStrong((id *)(v5 + 80), self->_isOwner);
    objc_storeStrong((id *)(v5 + 88), self->_authorStoreIdentifier);
    objc_storeStrong((id *)(v5 + 96), self->_authorDisplayName);
    objc_storeStrong((id *)(v5 + 104), self->_coverArtworkRecipe);
    objc_storeStrong((id *)(v5 + 112), self->_trackListChanges);
    objc_storeStrong((id *)(v5 + 120), self->_deletedEntryUUIDs);
  }
  return (id)v5;
}

- (MPModelLibraryPlaylistEditChangeRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPModelLibraryPlaylistEditChangeRequest;
  v2 = [(MPModelLibraryPlaylistEditChangeRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MPMediaLibrary deviceMediaLibrary];
    mediaLibrary = v2->_mediaLibrary;
    v2->_mediaLibrary = (MPMediaLibrary *)v3;
  }
  return v2;
}

+ (id)requiredPlaylistEntryProperties
{
  return +[MPModelLibraryPlaylistEditChangeRequestOperation requiredPlaylistEntryProperties];
}

@end