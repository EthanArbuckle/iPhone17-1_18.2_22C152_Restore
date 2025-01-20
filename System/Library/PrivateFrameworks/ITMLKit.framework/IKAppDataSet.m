@interface IKAppDataSet
- (IKAppDataSet)initWithItems:(id)a3 usedPrototypesByIdentifier:(id)a4 indexTitles:(id)a5;
- (NSArray)itemIDs;
- (NSArray)items;
- (NSDictionary)indexTitles;
- (NSDictionary)usedPrototypesByIdentifier;
@end

@implementation IKAppDataSet

- (IKAppDataSet)initWithItems:(id)a3 usedPrototypesByIdentifier:(id)a4 indexTitles:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IKAppDataSet;
  v11 = [(IKAppDataSet *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    usedPrototypesByIdentifier = v11->_usedPrototypesByIdentifier;
    v11->_usedPrototypesByIdentifier = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    indexTitles = v11->_indexTitles;
    v11->_indexTitles = (NSDictionary *)v16;
  }
  return v11;
}

- (NSArray)itemIDs
{
  itemIDs = self->_itemIDs;
  if (itemIDs)
  {
    v3 = itemIDs;
  }
  else
  {
    v5 = [(IKAppDataSet *)self items];
    v6 = [v5 valueForKey:@"identifier"];
    v7 = self->_itemIDs;
    self->_itemIDs = v6;

    v3 = v6;
  }
  return v3;
}

- (NSArray)items
{
  return self->_items;
}

- (NSDictionary)usedPrototypesByIdentifier
{
  return self->_usedPrototypesByIdentifier;
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexTitles, 0);
  objc_storeStrong((id *)&self->_usedPrototypesByIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

@end