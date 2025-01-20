@interface FLItemStoreDecorator
- (FLItemStoreDecorator)initWithClientIdentifier:(id)a3;
- (id)_itemsMatchingPredicate:(id)a3 identifiers:(id)a4;
- (id)followUpItems;
- (id)itemsMatchingIdentifier:(id)a3;
- (id)itemsMatchingIdentifiers:(id)a3;
- (id)itemsMatchingPredicate:(id)a3;
@end

@implementation FLItemStoreDecorator

- (id)itemsMatchingPredicate:(id)a3
{
  return [(FLItemStoreDecorator *)self _itemsMatchingPredicate:a3 identifiers:0];
}

- (id)itemsMatchingIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[NSPredicate predicateWithValue:1];
  v6 = [(FLItemStoreDecorator *)self _itemsMatchingPredicate:v5 identifiers:v4];

  return v6;
}

- (FLItemStoreDecorator)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLItemStoreDecorator;
  v5 = [(FLItemStoreDecorator *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = v6;
  }
  return v5;
}

- (id)_itemsMatchingPredicate:(id)a3 identifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[ItemStore sharedInstance];
  objc_super v9 = [v8 safeSelectFollowUpItemsWithUniqueIdentifiers:v6];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004A6C;
  v13[3] = &unk_10001C7C8;
  v13[4] = self;
  v10 = objc_msgSend(v9, "fl_map:", v13);

  v11 = [v10 filteredArrayUsingPredicate:v7];

  return v11;
}

- (void).cxx_destruct
{
}

- (id)followUpItems
{
  v3 = +[NSPredicate predicateWithValue:1];
  id v4 = [(FLItemStoreDecorator *)self itemsMatchingPredicate:v3];

  return v4;
}

- (id)itemsMatchingIdentifier:(id)a3
{
  if (a3)
  {
    id v8 = a3;
    id v4 = a3;
    v5 = +[NSArray arrayWithObjects:&v8 count:1];

    id v6 = -[FLItemStoreDecorator itemsMatchingIdentifiers:](self, "itemsMatchingIdentifiers:", v5, v8);
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

@end