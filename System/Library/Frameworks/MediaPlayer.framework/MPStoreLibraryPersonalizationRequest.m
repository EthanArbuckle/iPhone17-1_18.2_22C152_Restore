@interface MPStoreLibraryPersonalizationRequest
+ (BOOL)requiresNetwork;
+ (BOOL)supportsSecureCoding;
+ (id)libraryViewAllowingEmptyCollectionsForUserIdentity:(id)a3;
+ (id)libraryViewWithMediaLibraryOverrideForTestingOnly:(id)a3;
+ (id)libraryViewWithUserIdentity:(id)a3;
+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4;
+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4 matchAlbumArtistOnStoreIdAndName:(BOOL)a5;
+ (id)preferredQueue;
- (BOOL)matchAlbumArtistsOnNameAndStoreID;
- (ICUserIdentity)userIdentity;
- (MPMediaLibrary)mediaLibraryOverrideForTestingOnly;
- (MPSectionedCollection)representedObjects;
- (MPSectionedCollection)unpersonalizedContentDescriptors;
- (MPStoreLibraryPersonalizationRequest)init;
- (MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedContentDescriptors:(id)a3;
- (MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedRequest:(id)a3 unpersonalizedContentDescriptors:(id)a4;
- (NSDictionary)itemIndexPathToOverridePropertySet;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (id)propertiesForItemAtIndexPath:(id)a3;
- (void)setMatchAlbumArtistsOnNameAndStoreID:(BOOL)a3;
- (void)setMediaLibraryOverrideForTestingOnly:(id)a3;
- (void)setProperties:(id)a3 forItemAtIndexPath:(id)a4;
- (void)setRepresentedObjects:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MPStoreLibraryPersonalizationRequest

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  return self->_unpersonalizedContentDescriptors;
}

- (MPSectionedCollection)representedObjects
{
  return self->_representedObjects;
}

- (MPMediaLibrary)mediaLibraryOverrideForTestingOnly
{
  return self->_mediaLibraryOverrideForTestingOnly;
}

- (NSDictionary)itemIndexPathToOverridePropertySet
{
  v2 = (void *)[(NSMutableDictionary *)self->_itemIndexPathToOverridePropertySet copy];

  return (NSDictionary *)v2;
}

+ (id)libraryViewWithUserIdentity:(id)a3
{
  id v3 = a3;
  v4 = [MPMediaLibraryView alloc];
  v5 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v3];
  v6 = [(MPMediaLibraryView *)v4 initWithLibrary:v5 filteringOptions:4];

  return v6;
}

- (void)setRepresentedObjects:(id)a3
{
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPStoreLibraryPersonalizationRequestOperation);
  v6 = [(MPStoreLibraryPersonalizationRequest *)self userIdentity];
  [(MPAsyncOperation *)v5 setUserIdentity:v6];

  [(MPStoreLibraryPersonalizationRequestOperation *)v5 setRequest:self];
  [(MPStoreLibraryPersonalizationRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

+ (id)preferredQueue
{
  if (+[MPStoreLibraryPersonalizationRequest preferredQueue]::onceToken != -1) {
    dispatch_once(&+[MPStoreLibraryPersonalizationRequest preferredQueue]::onceToken, &__block_literal_global_39478);
  }
  v2 = (void *)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue;

  return v2;
}

- (MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedRequest:(id)a3 unpersonalizedContentDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MPStoreLibraryPersonalizationRequest *)self initWithUnpersonalizedContentDescriptors:v7];
  if (v8)
  {
    v9 = [v6 itemProperties];
    [(MPModelRequest *)v8 setItemProperties:v9];

    v10 = [v6 sectionProperties];
    [(MPModelRequest *)v8 setSectionProperties:v10];
  }
  return v8;
}

- (MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedContentDescriptors:(id)a3
{
  id v5 = a3;
  id v6 = [(MPStoreLibraryPersonalizationRequest *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unpersonalizedContentDescriptors, a3);
    v7->_matchAlbumArtistsOnNameAndStoreID = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPStoreLibraryPersonalizationRequest;
  id v4 = [(MPModelRequest *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_itemIndexPathToOverridePropertySet mutableCopy];
    id v6 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v5;

    objc_storeStrong((id *)v4 + 11, self->_unpersonalizedContentDescriptors);
    objc_storeStrong((id *)v4 + 12, self->_representedObjects);
    objc_storeStrong((id *)v4 + 13, self->_mediaLibraryOverrideForTestingOnly);
  }
  return v4;
}

- (MPStoreLibraryPersonalizationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPStoreLibraryPersonalizationRequest;
  result = [(MPStoreLibraryPersonalizationRequest *)&v3 init];
  if (result) {
    result->_matchAlbumArtistsOnNameAndStoreID = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryOverrideForTestingOnly, 0);
  objc_storeStrong((id *)&self->_representedObjects, 0);
  objc_storeStrong((id *)&self->_unpersonalizedContentDescriptors, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_itemIndexPathToOverridePropertySet, 0);
}

uint64_t __54__MPStoreLibraryPersonalizationRequest_preferredQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue;
  +[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue = (uint64_t)v0;

  [(id)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue setMaxConcurrentOperationCount:1];
  [(id)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue setName:@"com.apple.MediaPlayer.MPStoreLibraryPersonalizationRequest.sharedQueue"];
  v2 = (void *)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue;

  return [v2 setQualityOfService:25];
}

- (void)setMatchAlbumArtistsOnNameAndStoreID:(BOOL)a3
{
  self->_matchAlbumArtistsOnNameAndStoreID = a3;
}

- (BOOL)matchAlbumArtistsOnNameAndStoreID
{
  return self->_matchAlbumArtistsOnNameAndStoreID;
}

- (void)setMediaLibraryOverrideForTestingOnly:(id)a3
{
}

- (void)setUserIdentity:(id)a3
{
  id v4 = (ICUserIdentity *)a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4FB87B8] activeAccount];
  }
  if (self->_userIdentity != v4)
  {
    uint64_t v5 = v4;
    objc_storeStrong((id *)&self->_userIdentity, v4);
    id v4 = v5;
  }
}

- (void)setProperties:(id)a3 forItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  itemIndexPathToOverridePropertySet = self->_itemIndexPathToOverridePropertySet;
  if (v10)
  {
    if (!itemIndexPathToOverridePropertySet)
    {
      objc_super v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->_itemIndexPathToOverridePropertySet;
      self->_itemIndexPathToOverridePropertySet = v8;

      itemIndexPathToOverridePropertySet = self->_itemIndexPathToOverridePropertySet;
    }
    [(NSMutableDictionary *)itemIndexPathToOverridePropertySet setObject:v10 forKey:v6];
  }
  else
  {
    [(NSMutableDictionary *)itemIndexPathToOverridePropertySet removeObjectForKey:v6];
  }
}

- (id)propertiesForItemAtIndexPath:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_itemIndexPathToOverridePropertySet objectForKey:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(MPModelRequest *)self itemProperties];
  }
  id v7 = v6;

  return v7;
}

+ (id)libraryViewAllowingEmptyCollectionsForUserIdentity:(id)a3
{
  id v3 = a3;
  id v4 = [MPMediaLibraryView alloc];
  uint64_t v5 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v3];
  id v6 = [(MPMediaLibraryView *)v4 initWithLibrary:v5 filteringOptions:0x400000];

  return v6;
}

+ (id)libraryViewWithMediaLibraryOverrideForTestingOnly:(id)a3
{
  id v3 = a3;
  id v4 = [[MPMediaLibraryView alloc] initWithLibrary:v3 filteringOptions:4];

  return v4;
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4 matchAlbumArtistOnStoreIdAndName:(BOOL)a5
{
  uint64_t v5 = +[MPStoreLibraryPersonalizationRequestOperation personalizedResponseForContentDescriptor:a3 requestedProperties:a4 matchAlbumArtistOnStoreIdAndName:a5];

  return v5;
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4
{
  id v4 = +[MPStoreLibraryPersonalizationRequest personalizedResponseForContentDescriptor:a3 requestedProperties:a4 matchAlbumArtistOnStoreIdAndName:1];

  return v4;
}

+ (BOOL)requiresNetwork
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end