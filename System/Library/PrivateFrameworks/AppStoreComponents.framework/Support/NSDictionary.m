@interface NSDictionary
- (id)asc_dictionaryByMergingDictionary:(id)a3 uniquingKeysWithBlock:(id)a4;
@end

@implementation NSDictionary

- (id)asc_dictionaryByMergingDictionary:(id)a3 uniquingKeysWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100029978;
  v15 = &unk_100184528;
  id v16 = [(NSDictionary *)self mutableCopy];
  id v17 = v6;
  id v8 = v6;
  id v9 = v16;
  [v7 enumerateKeysAndObjectsUsingBlock:&v12];

  id v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  return v10;
}

@end