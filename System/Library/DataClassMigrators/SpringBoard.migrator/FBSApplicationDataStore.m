@interface FBSApplicationDataStore
- (id)_cachedSceneDataStores;
- (id)_createSceneStoreWithIdentifier:(id)a3 data:(id)a4;
- (id)_fetchPersistedSceneDataStores;
- (id)sceneStoreForIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4;
- (void)_modifyPersistentSceneData:(unint64_t)a3 identifier:(id)a4 data:(id)a5;
- (void)_removeAllPersistentSceneData;
- (void)_setCachedSceneDataStores:(id)a3;
- (void)enumerateSceneStoresUsingBlock:(id)a3;
- (void)removeAllSceneDataStores;
- (void)removeSceneStoreForIdentifier:(id)a3;
@end

@implementation FBSApplicationDataStore

- (id)sceneStoreForIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BSDispatchQueueAssertMain();
  v7 = [(FBSApplicationDataStore *)self _cachedSceneDataStores];
  v8 = [v7 objectForKey:v6];
  if (!v8)
  {
    v9 = [(FBSApplicationDataStore *)self _fetchPersistedSceneDataStores];
    v10 = [v9 objectForKey:v6];
    if (v10)
    {
      id v11 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v10];
    }
    else
    {
      if (!v4)
      {
        v8 = 0;
LABEL_9:

        goto LABEL_10;
      }
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v12 = v11;
    v8 = [(FBSApplicationDataStore *)self _createSceneStoreWithIdentifier:v6 data:v11];

    if (v8) {
      [v7 setObject:v8 forKey:v6];
    }
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)removeSceneStoreForIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v6 = [(FBSApplicationDataStore *)self _cachedSceneDataStores];
  v5 = [v6 objectForKey:v4];
  [v5 _invalidate];

  [v6 removeObjectForKey:v4];
  [(FBSApplicationDataStore *)self _modifyPersistentSceneData:0 identifier:v4 data:0];
}

- (void)removeAllSceneDataStores
{
  BSDispatchQueueAssertMain();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(FBSApplicationDataStore *)self _cachedSceneDataStores];
  id v4 = [v3 objectEnumerator];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) _invalidate];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(FBSApplicationDataStore *)self _setCachedSceneDataStores:0];
  [(FBSApplicationDataStore *)self _removeAllPersistentSceneData];
}

- (void)enumerateSceneStoresUsingBlock:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  char v27 = 0;
  id v5 = [(FBSApplicationDataStore *)self _cachedSceneDataStores];
  v21 = self;
  id v6 = [(FBSApplicationDataStore *)self _fetchPersistedSceneDataStores];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 allKeys];
  id v22 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v22)
  {
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v7);
      }
      uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
      long long v11 = [v5 objectForKey:v10];
      if (v11) {
        goto LABEL_7;
      }
      uint64_t v12 = [v6 objectForKey:v10];
      if (v12)
      {
        v13 = (void *)v12;
        id v14 = v4;
        uint64_t v15 = v8;
        v16 = v5;
        v17 = v7;
        v18 = v6;
        id v19 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v12];
        long long v11 = [(FBSApplicationDataStore *)v21 _createSceneStoreWithIdentifier:v10 data:v19];

        id v6 = v18;
        uint64_t v7 = v17;
        id v5 = v16;
        uint64_t v8 = v15;
        id v4 = v14;

        if (v11)
        {
LABEL_7:
          (*((void (**)(id, uint64_t, void *, char *))v4 + 2))(v4, v10, v11, &v27);
        }
      }
      if (v27) {
        break;
      }
      if (v22 == (id)++v9)
      {
        id v20 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        id v22 = v20;
        if (v20) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_cachedSceneDataStores
{
  id v4 = objc_getAssociatedObject(self, "__sceneDataStores");
  if (!v4)
  {
    id v4 = +[NSMapTable strongToWeakObjectsMapTable];
    if (!v4)
    {
      id v6 = +[NSAssertionHandler currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"FBSApplicationDataStore+SceneStorage.m" lineNumber:108 description:@"Must have a data stores dictionary to end here."];
    }
    [(FBSApplicationDataStore *)self _setCachedSceneDataStores:v4];
  }

  return v4;
}

- (void)_setCachedSceneDataStores:(id)a3
{
}

- (id)_createSceneStoreWithIdentifier:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"FBSApplicationDataStore+SceneStorage.m", 120, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = +[NSAssertionHandler currentHandler];
  [v15 handleFailureInMethod:a2, self, @"FBSApplicationDataStore+SceneStorage.m", 121, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

LABEL_3:
  objc_initWeak(&location, self);
  uint64_t v10 = [SBSceneDataStore alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_AE6C;
  v16[3] = &unk_196B0;
  objc_copyWeak(v19, &location);
  id v11 = v7;
  v19[1] = (id)a2;
  id v17 = v11;
  v18 = self;
  id v12 = [(SBSceneDataStore *)v10 _initWithIdentifier:v11 data:v9 changeHandler:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return v12;
}

- (id)_fetchPersistedSceneDataStores
{
  uint64_t v3 = objc_opt_class();

  return [(FBSApplicationDataStore *)self safeObjectForKey:@"_SBScenes" ofType:v3];
}

- (void)_modifyPersistentSceneData:(unint64_t)a3 identifier:(id)a4 data:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = objc_alloc((Class)NSMutableDictionary);
  uint64_t v10 = [(FBSApplicationDataStore *)self _fetchPersistedSceneDataStores];
  id v11 = [v9 initWithDictionary:v10];

  if (a3 == 1)
  {
    [v11 setObject:v8 forKey:v12];
  }
  else if (!a3)
  {
    [v11 removeObjectForKey:v12];
  }
  [(FBSApplicationDataStore *)self setObject:v11 forKey:@"_SBScenes"];
}

- (void)_removeAllPersistentSceneData
{
}

@end