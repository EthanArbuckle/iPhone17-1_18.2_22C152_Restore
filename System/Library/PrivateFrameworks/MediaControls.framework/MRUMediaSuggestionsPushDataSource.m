@interface MRUMediaSuggestionsPushDataSource
- (MRMediaSuggestionController)mediaSuggestionsController;
- (MRUMediaSuggestionsDataSourceDelegate)delegate;
- (MRUMediaSuggestionsPushDataSource)init;
- (NSDictionary)mediaSuggestions;
- (void)controller:(id)a3 didFailWithError:(id)a4;
- (void)controller:(id)a3 didUpdateSuggestions:(id)a4;
- (void)refreshMediaSuggestions;
- (void)setDelegate:(id)a3;
- (void)setMediaSuggestionsController:(id)a3;
@end

@implementation MRUMediaSuggestionsPushDataSource

- (MRUMediaSuggestionsPushDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRUMediaSuggestionsPushDataSource;
  v2 = [(MRUMediaSuggestionsPushDataSource *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F77060]);
    v4 = [MEMORY[0x1E4F77070] defaultRequestWithArtwork];
    uint64_t v5 = [v3 initWithRequest:v4];
    mediaSuggestionsController = v2->_mediaSuggestionsController;
    v2->_mediaSuggestionsController = (MRMediaSuggestionController *)v5;

    [(MRMediaSuggestionController *)v2->_mediaSuggestionsController setDelegate:v2];
  }
  return v2;
}

- (void)refreshMediaSuggestions
{
}

- (void)controller:(id)a3 didUpdateSuggestions:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained mediaSuggestionsDataSource:self didChangeMediaSuggestions:v6];
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MCLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    objc_super v8 = [(MRMediaSuggestionController *)self->_mediaSuggestionsController request];
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%@ error retrieving media suggestions: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (NSDictionary)mediaSuggestions
{
  return self->_mediaSuggestions;
}

- (MRUMediaSuggestionsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUMediaSuggestionsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRMediaSuggestionController)mediaSuggestionsController
{
  return self->_mediaSuggestionsController;
}

- (void)setMediaSuggestionsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSuggestionsController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mediaSuggestions, 0);
}

@end