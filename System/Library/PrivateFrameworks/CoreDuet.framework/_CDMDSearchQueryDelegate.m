@interface _CDMDSearchQueryDelegate
- (_CDMDSearchQueryDelegate)init;
- (void)searchQuery:(id)a3 didFailWithError:(id)a4;
- (void)searchQuery:(id)a3 didReturnItems:(id)a4;
- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4;
@end

@implementation _CDMDSearchQueryDelegate

- (_CDMDSearchQueryDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CDMDSearchQueryDelegate;
  v2 = [(_CDMDSearchQueryDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recentMDSearchQueryResults = v2->_recentMDSearchQueryResults;
    v2->_recentMDSearchQueryResults = v3;
  }
  return v2;
}

- (void)searchQuery:(id)a3 didReturnItems:(id)a4
{
  if (a4)
  {
    if (self) {
      self = (_CDMDSearchQueryDelegate *)self->_recentMDSearchQueryResults;
    }
    [(_CDMDSearchQueryDelegate *)self addObjectsFromArray:a4];
  }
}

- (void)searchQuery:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  objc_super v6 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[_CDMDSearchQueryDelegate searchQuery:didFailWithError:]((uint64_t)v5, v6);
  }

  if (v5)
  {
    if (self) {
      mdQuerySem = self->_mdQuerySem;
    }
    else {
      mdQuerySem = 0;
    }
    dispatch_semaphore_signal(mdQuerySem);
  }
}

- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4
{
  if (a4 == 3)
  {
    if (self) {
      self = (_CDMDSearchQueryDelegate *)self->_mdQuerySem;
    }
    dispatch_semaphore_signal(&self->super);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentMDSearchQueryResults, 0);
  objc_storeStrong((id *)&self->_mdQuerySem, 0);
}

- (void)searchQuery:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Search query failed: %@", (uint8_t *)&v2, 0xCu);
}

@end