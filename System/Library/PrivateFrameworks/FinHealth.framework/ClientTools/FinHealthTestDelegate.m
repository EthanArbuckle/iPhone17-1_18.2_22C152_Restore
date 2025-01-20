@interface FinHealthTestDelegate
- (FHSearchSuggestionController)searchSuggestionController;
- (FinHealthTestDelegate)init;
- (void)didUpdateFeatures:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5 error:(id)a6;
- (void)setSearchSuggestionController:(id)a3;
@end

@implementation FinHealthTestDelegate

- (FinHealthTestDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)FinHealthTestDelegate;
  v2 = [(FinHealthTestDelegate *)&v6 init];
  if (v2)
  {
    v3 = (FHSearchSuggestionController *)[objc_alloc((Class)FHSearchSuggestionController) initWithDelegate:v2];
    searchSuggestionController = v2->_searchSuggestionController;
    v2->_searchSuggestionController = v3;
  }
  return v2;
}

- (void)didUpdateFeatures:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5 error:(id)a6
{
  v7 = (void (**)(void))a5;
  v8 = (char *)a6;
  v9 = FinHealthLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    v12 = "-[FinHealthTestDelegate didUpdateFeatures:moreComing:readyForNextBatch:error:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v11, 0xCu);
  }

  if (v8)
  {
    v10 = FinHealthLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "didUpdateFeatures error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (FHSearchSuggestionController)searchSuggestionController
{
  return self->_searchSuggestionController;
}

- (void)setSearchSuggestionController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end