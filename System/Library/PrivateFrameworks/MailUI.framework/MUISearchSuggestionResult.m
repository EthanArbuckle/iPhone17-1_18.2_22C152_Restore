@interface MUISearchSuggestionResult
- (CSSearchableItem)searchableItem;
- (EMMessageObjectID)objectID;
- (MUISearchSuggestionResult)initWithSearchableItem:(id)a3 objectID:(id)a4;
- (id)description;
- (void)setObjectID:(id)a3;
- (void)setSearchableItem:(id)a3;
@end

@implementation MUISearchSuggestionResult

- (MUISearchSuggestionResult)initWithSearchableItem:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUISearchSuggestionResult;
  v8 = [(MUISearchSuggestionResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    searchableItem = v8->_searchableItem;
    v8->_searchableItem = (CSSearchableItem *)v9;

    uint64_t v11 = [v7 copy];
    objectID = v8->_objectID;
    v8->_objectID = (EMMessageObjectID *)v11;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> searchableItem=%@ objectID=%@", objc_opt_class(), self, self->_searchableItem, self->_objectID];
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void)setSearchableItem:(id)a3
{
}

- (EMMessageObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end