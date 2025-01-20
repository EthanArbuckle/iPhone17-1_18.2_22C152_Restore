@interface SGSGtoCNContactsCacheUpdateAdapter
- (SGSGtoCNContactsCacheUpdateAdapter)initWithSGSqlEntityStore:(id)a3;
- (SGSqlEntityStore)store;
- (void)addContact:(id)a3;
- (void)confirmContact:(id)a3;
- (void)rejectContact:(id)a3;
- (void)removeAllStoredPseudoContacts;
- (void)setStore:(id)a3;
@end

@implementation SGSGtoCNContactsCacheUpdateAdapter

- (void).cxx_destruct
{
}

- (void)setStore:(id)a3
{
}

- (SGSqlEntityStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (SGSqlEntityStore *)WeakRetained;
}

- (void)removeAllStoredPseudoContacts
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  [WeakRetained deleteAllCNContactMatches];
}

- (void)rejectContact:(id)a3
{
  p_store = &self->_store;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_store);
  uint64_t v5 = [v4 masterEntityId];

  [WeakRetained deleteAllCNContactMatchesForEntityID:v5];
}

- (void)confirmContact:(id)a3
{
  p_store = &self->_store;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_store);
  [WeakRetained refreshSuggestionsContact:v4];
}

- (void)addContact:(id)a3
{
  p_store = &self->_store;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_store);
  [WeakRetained refreshSuggestionsContact:v4];
}

- (SGSGtoCNContactsCacheUpdateAdapter)initWithSGSqlEntityStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGSGtoCNContactsCacheUpdateAdapter;
  uint64_t v5 = [(SGSGtoCNContactsCacheUpdateAdapter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_store, v4);
  }

  return v6;
}

@end