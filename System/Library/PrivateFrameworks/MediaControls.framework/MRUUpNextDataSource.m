@interface MRUUpNextDataSource
- (BOOL)canMoveResponseItemWithIdentifier:(id)a3;
- (MPCPlayerResponse)response;
- (MRUUpNextDataSource)init;
- (MRUUpNextDataSourceDelegate)delegate;
- (NSArray)responseItemIDs;
- (NSDictionary)responseItemsByIdentifier;
- (id)objectForKeyedSubscript:(id)a3;
- (id)responseItemForIdentifier:(id)a3;
- (void)moveReponseItemToNextWithIdentifier:(id)a3 completion:(id)a4;
- (void)moveReponseItemWithIdentifier:(id)a3 afterResponseItemWithIdentifier:(id)a4 completion:(id)a5;
- (void)playItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeResponseItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseItemsByIdentifier:(id)a3;
- (void)updateContentItems;
@end

@implementation MRUUpNextDataSource

- (MRUUpNextDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUUpNextDataSource;
  v2 = [(MRUUpNextDataSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] array];
    responseItemIDs = v2->_responseItemIDs;
    v2->_responseItemIDs = (NSArray *)v3;
  }
  return v2;
}

- (void)setResponse:(id)a3
{
  v5 = (MPCPlayerResponse *)a3;
  if (self->_response != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_response, a3);
    [(MRUUpNextDataSource *)self updateContentItems];
    objc_super v6 = [(MRUUpNextDataSource *)self delegate];
    [v6 upNextDataSource:self didChangeResponseItemIDs:self->_responseItemIDs];

    v5 = v7;
  }
}

- (id)responseItemForIdentifier:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_responseItemsByIdentifier objectForKeyedSubscript:a3];
  v4 = [v3 metadataObject];
  v5 = [v4 flattenedGenericObject];
  objc_super v6 = [v5 anyObject];

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_responseItemsByIdentifier objectForKeyedSubscript:a3];
  v4 = [v3 metadataObject];
  v5 = [v4 flattenedGenericObject];
  objc_super v6 = [v5 anyObject];

  return v6;
}

- (void)playItemWithIdentifier:(id)a3 completion:(id)a4
{
  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  id v7 = a4;
  id v15 = [(NSDictionary *)responseItemsByIdentifier objectForKeyedSubscript:a3];
  v8 = [(MPCPlayerResponse *)self->_response tracklist];
  v9 = [v8 changeItemCommand];
  v10 = [v9 changeToItem:v15];

  v11 = [(MPCPlayerResponse *)self->_response play];
  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v13 = v12;
  if (v10) {
    [v12 addObject:v10];
  }
  if (v11) {
    [v13 addObject:v11];
  }
  v14 = [MEMORY[0x1E4F76E88] requestWithCommandRequests:v13];
  [v14 performWithCompletion:v7];
}

- (void)moveReponseItemToNextWithIdentifier:(id)a3 completion:(id)a4
{
  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  id v7 = a4;
  id v13 = [(NSDictionary *)responseItemsByIdentifier objectForKeyedSubscript:a3];
  v8 = [(MPCPlayerResponse *)self->_response tracklist];
  v9 = [v8 playingItem];

  v10 = [(MPCPlayerResponse *)self->_response tracklist];
  v11 = [v10 reorderCommand];
  v12 = [v11 moveItem:v13 afterItem:v9];

  [MEMORY[0x1E4F76E88] performRequest:v12 completion:v7];
}

- (void)moveReponseItemWithIdentifier:(id)a3 afterResponseItemWithIdentifier:(id)a4 completion:(id)a5
{
  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  id v9 = a5;
  id v10 = a4;
  id v15 = [(NSDictionary *)responseItemsByIdentifier objectForKeyedSubscript:a3];
  v11 = [(NSDictionary *)self->_responseItemsByIdentifier objectForKeyedSubscript:v10];

  v12 = [(MPCPlayerResponse *)self->_response tracklist];
  id v13 = [v12 reorderCommand];
  v14 = [v13 moveItem:v15 afterItem:v11];

  [MEMORY[0x1E4F76E88] performRequest:v14 completion:v9];
}

- (BOOL)canMoveResponseItemWithIdentifier:(id)a3
{
  v4 = [(NSDictionary *)self->_responseItemsByIdentifier objectForKeyedSubscript:a3];
  v5 = [(MPCPlayerResponse *)self->_response tracklist];
  objc_super v6 = [v5 reorderCommand];
  char v7 = [v6 canMoveItem:v4];

  return v7;
}

- (void)removeResponseItemWithIdentifier:(id)a3 completion:(id)a4
{
  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  id v6 = a4;
  id v9 = [(NSDictionary *)responseItemsByIdentifier objectForKeyedSubscript:a3];
  char v7 = (void *)MEMORY[0x1E4F76E88];
  v8 = [v9 remove];
  [v7 performRequest:v8 completion:v6];
}

- (void)updateContentItems
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPCPlayerResponse *)self->_response tracklist];
  v4 = [v3 items];
  v5 = [v4 allItems];

  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  char v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v8 = [(MPCPlayerResponse *)self->_response tracklist];
  id v9 = [v8 playingItem];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
        if (v15 != v9)
        {
          v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v14), "contentItemIdentifier", (void)v22);
          [v6 addObject:v16];

          v17 = [v15 contentItemIdentifier];
          [v7 setObject:v15 forKeyedSubscript:v17];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  v18 = (NSArray *)[v6 copy];
  responseItemIDs = self->_responseItemIDs;
  self->_responseItemIDs = v18;

  v20 = (NSDictionary *)[v7 copy];
  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  self->_responseItemsByIdentifier = v20;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (MRUUpNextDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUUpNextDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)responseItemIDs
{
  return self->_responseItemIDs;
}

- (NSDictionary)responseItemsByIdentifier
{
  return self->_responseItemsByIdentifier;
}

- (void)setResponseItemsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseItemsByIdentifier, 0);
  objc_storeStrong((id *)&self->_responseItemIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_response, 0);
}

@end