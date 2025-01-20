@interface _CDEventHandlerForWatchNearby
- (_CDDataCollectionAnonymizer)anonymizer;
- (_CDEventHandlerForWatchNearby)init;
- (_CDFileUtility)utility;
- (void)eventHandler:(id)a3 withFileHandle:(id)a4;
- (void)setAnonymizer:(id)a3;
- (void)setUtility:(id)a3;
@end

@implementation _CDEventHandlerForWatchNearby

- (_CDEventHandlerForWatchNearby)init
{
  v10.receiver = self;
  v10.super_class = (Class)_CDEventHandlerForWatchNearby;
  v2 = [(_CDEventHandlerForWatchNearby *)&v10 init];
  if (v2)
  {
    v3 = +[_CDDataCollectionUtilities randomDataWithLength:32];
    v4 = -[_CDDataCollectionAnonymizer initWithSalt:]((id *)[_CDDataCollectionAnonymizer alloc], v3);
    anonymizer = v2->_anonymizer;
    v2->_anonymizer = (_CDDataCollectionAnonymizer *)v4;
    v6 = v4;

    v7 = objc_alloc_init(_CDFileUtility);
    utility = v2->_utility;
    v2->_utility = v7;
  }
  return v2;
}

- (void)eventHandler:(id)a3 withFileHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 metadata];
  id v14 = (id)[v8 copy];

  v9 = [(_CDEventHandlerForWatchNearby *)self anonymizer];
  objc_super v10 = -[_CDDataCollectionAnonymizer anonymizeDictionary:](v9, v14);

  v11 = [(_CDEventHandlerForWatchNearby *)self utility];
  v12 = -[_CDFileUtility fileHandlerUtiity:withBundleId:withMetaData:]((uint64_t)v11, v7, 0, v10);

  v13 = [(_CDEventHandlerForWatchNearby *)self utility];
  -[_CDFileUtility writeJSON:withFileHandle:]((uint64_t)v13, v12, v6);
}

- (_CDDataCollectionAnonymizer)anonymizer
{
  return self->_anonymizer;
}

- (void)setAnonymizer:(id)a3
{
}

- (_CDFileUtility)utility
{
  return self->_utility;
}

- (void)setUtility:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utility, 0);
  objc_storeStrong((id *)&self->_anonymizer, 0);
}

@end