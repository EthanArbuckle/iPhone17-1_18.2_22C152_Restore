@interface CNIndexExtensionRequestHandler
- (CNContactStore)store;
- (CNIndexExtensionRequestHandler)init;
- (CNSpotlightIndexingLogger)logger;
- (id)contactForContactIdentifier:(id)a3 keysToFetch:(id)a4;
- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (id)draggingContactForIdentifier:(id)a3;
- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation CNIndexExtensionRequestHandler

- (CNIndexExtensionRequestHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNIndexExtensionRequestHandler;
  v2 = [(CNIndexExtensionRequestHandler *)&v11 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    store = v2->_store;
    v2->_store = v3;

    v5 = +[CNContactsEnvironment currentEnvironment];
    v6 = [v5 loggerProvider];
    uint64_t v7 = [v6 spotlightIndexingLogger];
    logger = v2->_logger;
    v2->_logger = (CNSpotlightIndexingLogger *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5 = a4;
  v6 = [(CNIndexExtensionRequestHandler *)self logger];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000032A8;
  v8[3] = &unk_100004100;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 reindexingAllSearchableItems:v8];
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CNIndexExtensionRequestHandler *)self logger];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000033D8;
  v12[3] = &unk_100004128;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 reindexingSearchableItemsWithIdentifiers:v12];
}

- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = [(CNIndexExtensionRequestHandler *)self draggingContactForIdentifier:a4];
  id v10 = [v9 dataRepresentationForType:v8];

  return v10;
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7
{
  id v7 = [(CNIndexExtensionRequestHandler *)self draggingContactForIdentifier:a4];
  id v8 = [v7 fileURLRepresentation];

  return v8;
}

- (id)draggingContactForIdentifier:(id)a3
{
  id v11 = CNContactIdentifierKey;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v11 count:1];
  v6 = -[CNIndexExtensionRequestHandler contactForContactIdentifier:keysToFetch:](self, "contactForContactIdentifier:keysToFetch:", v4, v5, v11);

  if (v6)
  {
    id v7 = objc_alloc((Class)CNDraggingContact);
    id v8 = [(CNIndexExtensionRequestHandler *)self store];
    id v9 = [v7 initWithContact:v6 contactStore:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)contactForContactIdentifier:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNIndexExtensionRequestHandler *)self store];
  id v13 = 0;
  id v9 = [v8 unifiedContactWithIdentifier:v6 keysToFetch:v7 error:&v13];

  id v10 = v13;
  if (v10 || !v9)
  {
    id v11 = [(CNIndexExtensionRequestHandler *)self store];
    NSLog(@"Can't fetch contact with identifier %@, in store %@, with error: %@", v6, v11, v10);
  }

  return v9;
}

- (CNContactStore)store
{
  return self->_store;
}

- (CNSpotlightIndexingLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end