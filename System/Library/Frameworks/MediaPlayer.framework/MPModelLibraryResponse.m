@interface MPModelLibraryResponse
- (MPMediaLibraryConnectionAssertion)libraryAssertion;
- (MPModelLibraryResponse)initWithRequest:(id)a3;
- (NSArray)sectionKeepLocalStatusConfigurations;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
- (void)clearResults;
- (void)dealloc;
- (void)setLibraryAssertion:(id)a3;
- (void)setSectionKeepLocalStatusConfigurations:(id)a3;
@end

@implementation MPModelLibraryResponse

- (MPModelLibraryResponse)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelLibraryResponse;
  v5 = [(MPModelResponse *)&v9 initWithRequest:v4];
  if (v5)
  {
    v6 = [v4 mediaLibrary];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel__mediaLibraryDidChangeNotification_ name:@"MPMediaLibraryDidChangeNotification" object:v6];
    [v7 addObserver:v5 selector:sel__mediaLibraryDidChangeNotification_ name:@"MPMediaLibraryDisplayValuesDidChangeNotification" object:v6];
    [v7 addObserver:v5 selector:sel__mediaLibraryDidChangeNotification_ name:@"MPMediaLibraryDynamicPropertiesDidChangeNotification" object:v6];
    [v7 addObserver:v5 selector:sel__mediaLibraryDidChangeNotification_ name:@"MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification" object:0];
    [v7 addObserver:v5 selector:sel__mediaLibraryDidChangeNotification_ name:@"MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification" object:0];
    [v6 beginGeneratingLibraryChangeNotifications];
  }
  return v5;
}

- (void)setLibraryAssertion:(id)a3
{
}

- (void)dealloc
{
  v3 = [(MPModelResponse *)self request];
  id v4 = [v3 mediaLibrary];
  [v4 endGeneratingLibraryChangeNotifications];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)MPModelLibraryResponse;
  [(MPModelLibraryResponse *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryAssertion, 0);

  objc_storeStrong((id *)&self->_sectionKeepLocalStatusConfigurations, 0);
}

- (MPMediaLibraryConnectionAssertion)libraryAssertion
{
  return self->_libraryAssertion;
}

- (void)setSectionKeepLocalStatusConfigurations:(id)a3
{
}

- (NSArray)sectionKeepLocalStatusConfigurations
{
  return self->_sectionKeepLocalStatusConfigurations;
}

- (void)clearResults
{
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  id v7 = a4;
  v8 = [(MPModelResponse *)self request];
  objc_super v9 = [v8 sectionKind];

  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"MPModelLibraryRequest.mm" lineNumber:397 description:@"Detailed keep local status only supported when request is sectioned."];
  }
  if (([v8 wantsDetailedKeepLocalRequestableResponse] & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MPModelLibraryRequest.mm" lineNumber:398 description:@"Detailed keep local status only supported when request wantsDetailedKeepLocalRequestableResponse."];
  }
  v10 = [(MPModelResponse *)self results];
  v11 = [v10 sectionAtIndex:a3];

  if (objc_opt_respondsToSelector()) {
    uint64_t v12 = [v11 keepLocalEnableState];
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = objc_alloc_init(MPModelLibraryKeepLocalStatusRequestOperation);
  v14 = [MPMediaLibraryView alloc];
  v15 = [v8 mediaLibrary];
  v16 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v14, "initWithLibrary:filteringOptions:", v15, [v8 filteringOptions]);

  [(MPModelLibraryKeepLocalStatusRequestOperation *)v13 setLibraryView:v16];
  [(MPModelLibraryKeepLocalStatusRequestOperation *)v13 setEnableState:v12];
  [(MPModelLibraryKeepLocalStatusRequestOperation *)v13 setResponseHandler:v7];
  [(MPModelLibraryKeepLocalStatusRequestOperation *)v13 setIdentifyingModelObject:v11];
  v17 = [(MPModelLibraryResponse *)self sectionKeepLocalStatusConfigurations];
  v18 = [v17 objectAtIndexedSubscript:a3];

  if (v18)
  {
    [v18 downloadableItemsQuery];
  }
  else
  {
    uint64_t v23 = 0;
    v24 = 0;
  }
  [(MPModelLibraryKeepLocalStatusRequestOperation *)v13 setDownloadableItemsQuery:&v23];
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  v19 = objc_msgSend(v18, "downloadablePlaylistItemEntityQueryBlock", v23);
  [(MPModelLibraryKeepLocalStatusRequestOperation *)v13 setDownloadablePlaylistItemEntityQueryBlock:v19];

  return v13;
}

@end