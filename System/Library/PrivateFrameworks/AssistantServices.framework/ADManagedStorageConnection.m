@interface ADManagedStorageConnection
- (id)_defaultStoreSpecificKeyForName:(id)a3 key:(id)a4;
- (id)_defaultStoreSpecificKeyPrefixForName:(id)a3;
- (id)_storeWithName:(id)a3;
- (void)fetchManagedStoreObjectForKey:(id)a3 reply:(id)a4;
- (void)getKnowledgeStoreDataForKey:(id)a3 inStoreWithName:(id)a4 completion:(id)a5;
- (void)resetKnowledgeStoreWithName:(id)a3 completion:(id)a4;
- (void)setKnowledgeStoreData:(id)a3 forKey:(id)a4 inStoreWithName:(id)a5 completion:(id)a6;
- (void)setManagedStoreObject:(id)a3 forKey:(id)a4;
@end

@implementation ADManagedStorageConnection

- (void).cxx_destruct
{
}

- (void)resetKnowledgeStoreWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10023E550();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023E5A4;
  block[3] = &unk_10050E1D8;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)getKnowledgeStoreDataForKey:(id)a3 inStoreWithName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_10023E550();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10023E908;
  v15[3] = &unk_10050E228;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)setKnowledgeStoreData:(id)a3 forKey:(id)a4 inStoreWithName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10023E550();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023EB54;
  block[3] = &unk_10050D3F0;
  id v23 = v10;
  id v24 = v13;
  id v20 = v12;
  id v21 = v11;
  v22 = self;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(v14, block);
}

- (id)_defaultStoreSpecificKeyForName:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = [(ADManagedStorageConnection *)self _defaultStoreSpecificKeyPrefixForName:a3];
  id v8 = [v7 stringByAppendingString:v6];

  return v8;
}

- (id)_defaultStoreSpecificKeyPrefixForName:(id)a3
{
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"_NULL_STORE";
  }
  return [(__CFString *)v3 stringByAppendingString:@" - "];
}

- (id)_storeWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_storeMap objectForKey:v4];
    if (!v5)
    {
      v5 = +[CKKnowledgeStore defaultSynchedKnowledgeStore];
      if (v5)
      {
        storeMap = self->_storeMap;
        if (!storeMap)
        {
          id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v8 = self->_storeMap;
          self->_storeMap = v7;

          storeMap = self->_storeMap;
        }
        [(NSMutableDictionary *)storeMap setObject:v5 forKey:v4];
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)fetchManagedStoreObjectForKey:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 fetchManagedStoreObjectForKey:v6 completion:v5];
}

- (void)setManagedStoreObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 setManagedStoreObject:v6 forKey:v5];
}

@end