@interface MusicKit_SoftLinking_MPModelLibrarySDKAddToPlaylistChangeRequest
+ (void)addProductID:(id)a3 playlist:(id)a4 isCloudID:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation MusicKit_SoftLinking_MPModelLibrarySDKAddToPlaylistChangeRequest

+ (void)addProductID:(id)a3 playlist:(id)a4 isCloudID:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v10 _underlyingModelObject];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v13 = (void *)getMPModelLibrarySDKAddToPlaylistChangeRequestClass_softClass;
  uint64_t v22 = getMPModelLibrarySDKAddToPlaylistChangeRequestClass_softClass;
  if (!getMPModelLibrarySDKAddToPlaylistChangeRequestClass_softClass)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getMPModelLibrarySDKAddToPlaylistChangeRequestClass_block_invoke;
    v18[3] = &unk_26443F950;
    v18[4] = &v19;
    __getMPModelLibrarySDKAddToPlaylistChangeRequestClass_block_invoke((uint64_t)v18);
    v13 = (void *)v20[3];
  }
  v14 = v13;
  _Block_object_dispose(&v19, 8);
  v15 = (void *)[[v14 alloc] initWithProductID:v9 isCloudID:v7 playlist:v12 completionHandler:v11];
  v16 = (void *)[v15 newOperationWithResponseHandler:v11];
  v17 = +[MusicKit_SoftLinking_MPMediaLibrary deviceLibrary];
  [v17 performOperation:v16];
}

@end