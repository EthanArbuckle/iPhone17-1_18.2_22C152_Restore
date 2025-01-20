@interface MPModelLibrarySDKAddToPlaylistChangeRequest
- (BOOL)isCloudID;
- (MPModelLibrarySDKAddToPlaylistChangeRequest)initWithProductID:(id)a3 isCloudID:(BOOL)a4 playlist:(id)a5 completionHandler:(id)a6;
- (MPModelPlaylist)playlist;
- (NSString)productID;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPlaylist:(id)a3;
@end

@implementation MPModelLibrarySDKAddToPlaylistChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_playlist, 0);

  objc_storeStrong((id *)&self->_productID, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setPlaylist:(id)a3
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (BOOL)isCloudID
{
  return self->_isCloudID;
}

- (NSString)productID
{
  return self->_productID;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibrarySDKAddToPlaylistChangeRequestOperation);
  [(MPModelLibrarySDKAddToPlaylistChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibrarySDKAddToPlaylistChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_productID copy];
    v6 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v5;

    *(unsigned char *)(v4 + 8) = self->_isCloudID;
    objc_storeStrong((id *)(v4 + 24), self->_playlist);
    uint64_t v7 = MEMORY[0x19971E0F0](self->_completionHandler);
    v8 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v7;
  }
  return (id)v4;
}

- (MPModelLibrarySDKAddToPlaylistChangeRequest)initWithProductID:(id)a3 isCloudID:(BOOL)a4 playlist:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MPModelLibrarySDKAddToPlaylistChangeRequest;
  v13 = [(MPModelLibrarySDKAddToPlaylistChangeRequest *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    productID = v13->_productID;
    v13->_productID = (NSString *)v14;

    v13->_isCloudID = a4;
    objc_storeStrong((id *)&v13->_playlist, a5);
    uint64_t v16 = MEMORY[0x19971E0F0](v12);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v16;
  }
  return v13;
}

@end