@interface MusicKit_SoftLinking_MPModelLibrarySearchRequest
- (MusicKit_SoftLinking_MPModelLibrarySearchRequest)initWithSearchTerm:(id)a3 scopes:(id)a4 limit:(int64_t)a5;
- (NSArray)scopes;
- (NSString)searchTerm;
- (int64_t)limit;
- (void)performWithCompletionHandler:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setScopes:(id)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibrarySearchRequest

- (MusicKit_SoftLinking_MPModelLibrarySearchRequest)initWithSearchTerm:(id)a3 scopes:(id)a4 limit:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v11 = (void *)getMPModelLibrarySearchRequestClass_softClass;
  uint64_t v25 = getMPModelLibrarySearchRequestClass_softClass;
  if (!getMPModelLibrarySearchRequestClass_softClass)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __getMPModelLibrarySearchRequestClass_block_invoke;
    v21[3] = &unk_26443F950;
    v21[4] = &v22;
    __getMPModelLibrarySearchRequestClass_block_invoke((uint64_t)v21);
    v11 = (void *)v23[3];
  }
  v12 = v11;
  _Block_object_dispose(&v22, 8);
  id v13 = objc_alloc_init(v12);
  [v13 setSearchString:v9];
  v14 = objc_msgSend(v10, "msv_map:", &__block_literal_global);
  [v13 setScopes:v14];
  [v13 setMaximumResultsPerScope:a5];
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_MPModelLibrarySearchRequest;
  v15 = [(MusicKit_SoftLinking_MPModelRequest *)&v20 _initWithUnderlyingRequest:v13];
  v16 = (MusicKit_SoftLinking_MPModelLibrarySearchRequest *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 2, a3);
    uint64_t v17 = [v10 copy];
    scopes = v16->_scopes;
    v16->_scopes = (NSArray *)v17;

    v16->_limit = a5;
  }

  return v16;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (MRMediaRemoteIsMusicAppInstalled())
  {
    v5 = [(MusicKit_SoftLinking_MPModelRequest *)self _underlyingRequest];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__MusicKit_SoftLinking_MPModelLibrarySearchRequest_performWithCompletionHandler___block_invoke;
    v7[3] = &unk_26443F9F0;
    id v8 = v4;
    [v5 performWithResponseHandler:v7];
  }
  else
  {
    v6 = MusicKit_Logging_Library();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MusicKit_SoftLinking_MPModelLibrarySearchRequest performWithCompletionHandler:](v6);
    }

    v5 = objc_msgSend(MEMORY[0x263F087E8], "musicKit_defaultLibraryError");
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v5);
  }
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopes, 0);

  objc_storeStrong((id *)&self->_searchTerm, 0);
}

- (void)performWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21CC71000, log, OS_LOG_TYPE_ERROR, "Failed to perform MusicKit library search request because the Music application is not installed.", v1, 2u);
}

@end