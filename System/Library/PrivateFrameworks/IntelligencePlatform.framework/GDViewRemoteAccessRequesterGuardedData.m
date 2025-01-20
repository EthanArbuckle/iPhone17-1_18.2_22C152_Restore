@interface GDViewRemoteAccessRequesterGuardedData
- (GDViewRemoteAccessRequesterGuardedData)init;
- (NSMapTable)strongWeakCache;
- (NSMapTable)strongWeakInfoCache;
- (NSMutableDictionary)persistentInfo;
- (NSMutableDictionary)persistentTokens;
- (id)accessInfoForKey:(id)a3 useCase:(id)a4;
- (id)keyForViewName:(id)a3 useCase:(id)a4;
- (id)objectForKey:(id)a3 useCase:(id)a4;
- (void)setInfo:(id)a3 forKey:(id)a4 useCase:(id)a5;
- (void)setObject:(id)a3 forKey:(id)a4 useCase:(id)a5;
- (void)setPersistentInfo:(id)a3;
- (void)setPersistentInfo:(id)a3 forKey:(id)a4 useCase:(id)a5;
- (void)setPersistentObject:(id)a3 forKey:(id)a4 useCase:(id)a5;
- (void)setPersistentTokens:(id)a3;
- (void)setStrongWeakCache:(id)a3;
- (void)setStrongWeakInfoCache:(id)a3;
@end

@implementation GDViewRemoteAccessRequesterGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentInfo, 0);
  objc_storeStrong((id *)&self->_strongWeakInfoCache, 0);
  objc_storeStrong((id *)&self->_persistentTokens, 0);

  objc_storeStrong((id *)&self->_strongWeakCache, 0);
}

- (void)setPersistentInfo:(id)a3
{
}

- (NSMutableDictionary)persistentInfo
{
  return self->_persistentInfo;
}

- (void)setStrongWeakInfoCache:(id)a3
{
}

- (NSMapTable)strongWeakInfoCache
{
  return self->_strongWeakInfoCache;
}

- (void)setPersistentTokens:(id)a3
{
}

- (NSMutableDictionary)persistentTokens
{
  return self->_persistentTokens;
}

- (void)setStrongWeakCache:(id)a3
{
}

- (NSMapTable)strongWeakCache
{
  return self->_strongWeakCache;
}

- (void)setPersistentInfo:(id)a3 forKey:(id)a4 useCase:(id)a5
{
  id v8 = a3;
  objc_msgSend_keyForViewName_useCase_(self, v9, (uint64_t)a4, (uint64_t)a5, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self->_persistentInfo, v11, (uint64_t)v8, (uint64_t)v13, v12);
}

- (void)setInfo:(id)a3 forKey:(id)a4 useCase:(id)a5
{
  id v8 = a3;
  objc_msgSend_keyForViewName_useCase_(self, v9, (uint64_t)a4, (uint64_t)a5, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self->_strongWeakInfoCache, v11, (uint64_t)v8, (uint64_t)v13, v12);
}

- (id)accessInfoForKey:(id)a3 useCase:(id)a4
{
  v6 = objc_msgSend_keyForViewName_useCase_(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  uint64_t v10 = objc_msgSend_objectForKey_(self->_strongWeakInfoCache, v7, (uint64_t)v6, v8, v9);
  v14 = v10;
  if (v10)
  {
    id v15 = v10;
  }
  else
  {
    objc_msgSend_objectForKey_(self->_persistentInfo, v11, (uint64_t)v6, v12, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (void)setPersistentObject:(id)a3 forKey:(id)a4 useCase:(id)a5
{
  id v8 = a3;
  objc_msgSend_keyForViewName_useCase_(self, v9, (uint64_t)a4, (uint64_t)a5, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self->_persistentTokens, v11, (uint64_t)v8, (uint64_t)v13, v12);
}

- (void)setObject:(id)a3 forKey:(id)a4 useCase:(id)a5
{
  id v8 = a3;
  objc_msgSend_keyForViewName_useCase_(self, v9, (uint64_t)a4, (uint64_t)a5, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self->_strongWeakCache, v11, (uint64_t)v8, (uint64_t)v13, v12);
}

- (id)objectForKey:(id)a3 useCase:(id)a4
{
  v6 = objc_msgSend_keyForViewName_useCase_(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  uint64_t v10 = objc_msgSend_objectForKey_(self->_strongWeakCache, v7, (uint64_t)v6, v8, v9);
  v14 = v10;
  if (v10)
  {
    id v15 = v10;
  }
  else
  {
    objc_msgSend_objectForKey_(self->_persistentTokens, v11, (uint64_t)v6, v12, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (id)keyForViewName:(id)a3 useCase:(id)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v12 = objc_msgSend_initWithFormat_(v8, v9, @"%@:%@", v10, v11, v7, v6);

  return v12;
}

- (GDViewRemoteAccessRequesterGuardedData)init
{
  v21.receiver = self;
  v21.super_class = (Class)GDViewRemoteAccessRequesterGuardedData;
  v2 = [(GDViewRemoteAccessRequesterGuardedData *)&v21 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1B3EB26F0]();
    uint64_t v8 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E4F28E10], v4, v5, v6, v7);
    strongWeakCache = v2->_strongWeakCache;
    v2->_strongWeakCache = (NSMapTable *)v8;

    uint64_t v10 = objc_opt_new();
    persistentTokens = v2->_persistentTokens;
    v2->_persistentTokens = (NSMutableDictionary *)v10;

    uint64_t v16 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E4F28E10], v12, v13, v14, v15);
    strongWeakInfoCache = v2->_strongWeakInfoCache;
    v2->_strongWeakInfoCache = (NSMapTable *)v16;

    uint64_t v18 = objc_opt_new();
    persistentInfo = v2->_persistentInfo;
    v2->_persistentInfo = (NSMutableDictionary *)v18;
  }
  return v2;
}

@end