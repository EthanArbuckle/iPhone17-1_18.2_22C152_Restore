@interface NSDictionary(AppStoreComponents)
- (id)asc_dictionaryByMergingDictionary:()AppStoreComponents uniquingKeysWithBlock:;
@end

@implementation NSDictionary(AppStoreComponents)

- (id)asc_dictionaryByMergingDictionary:()AppStoreComponents uniquingKeysWithBlock:
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[a1 mutableCopy];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __92__NSDictionary_AppStoreComponents__asc_dictionaryByMergingDictionary_uniquingKeysWithBlock___block_invoke;
  v16 = &unk_1E645ECF0;
  id v17 = v8;
  id v18 = v6;
  id v9 = v6;
  id v10 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:&v13];

  v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

@end