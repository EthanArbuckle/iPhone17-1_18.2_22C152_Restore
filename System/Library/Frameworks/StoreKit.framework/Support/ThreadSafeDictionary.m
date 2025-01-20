@interface ThreadSafeDictionary
- (ThreadSafeDictionary)init;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)optionalForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation ThreadSafeDictionary

- (ThreadSafeDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)ThreadSafeDictionary;
  v2 = [(ThreadSafeDictionary *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = objc_alloc_init(UnfairLock);
    lock = v2->_lock;
    v2->_lock = v5;
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100089C40;
  v16 = sub_100089C50;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100089C58;
  v9[3] = &unk_100358080;
  v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_10006B9F0(lock, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100089C40;
  v16 = sub_100089C50;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100089DD4;
  v9[3] = &unk_100358080;
  v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_10006B9F0(lock, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)optionalForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100089C40;
  v16 = sub_100089C50;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100089F54;
  v9[3] = &unk_10035A418;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  sub_10006B9F0(lock, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008A0B0;
  v11[3] = &unk_1003599E0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_10006B9F0(lock, v11);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008A188;
  v11[3] = &unk_1003599E0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_10006B9F0(lock, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end