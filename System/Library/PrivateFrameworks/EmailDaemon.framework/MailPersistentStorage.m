@interface MailPersistentStorage
+ (id)defaultFilePath;
+ (id)sharedStorage;
+ (void)wipePersistentStorage;
- (MailPersistentStorage)init;
- (MailPersistentStorage)initWithFilePath:(id)a3;
- (NSOperationQueue)saveOperationQueue;
- (id)_objectForKey:(id)a3 inGroup:(id)a4;
- (id)bodyBackfillDateForSource:(id)a3;
- (id)fetchDateForSource:(id)a3;
- (id)lastAdditionalMailboxesFetchDate;
- (id)lastLoadOlder;
- (id)sceneRestorationDictionary;
- (id)searchedServerDate;
- (void)_setObject:(id)a3 forKey:(id)a4 inGroup:(id)a5;
- (void)clearLastLoadOlder;
- (void)clearSearchedServer;
- (void)removeAllDataBelongingToAccount:(id)a3;
- (void)save;
- (void)searchedServer;
- (void)setBodyBackfillDate:(id)a3 forSource:(id)a4;
- (void)setFetchDate:(id)a3 forSource:(id)a4;
- (void)setLastAdditionalMailboxesFetchDate:(id)a3;
- (void)setSaveOperationQueue:(id)a3;
- (void)setSceneRestorationDictionary:(id)a3;
- (void)touchLastLoadOlder;
@end

@implementation MailPersistentStorage

+ (id)defaultFilePath
{
  v2 = MFMailDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"metadata.plist"];

  return v3;
}

+ (id)sharedStorage
{
  pthread_once(&stru_100169BD8, sub_100038018);
  v2 = (void *)qword_10016B888;

  return v2;
}

+ (void)wipePersistentStorage
{
  v2 = (void *)qword_10016B888;
  qword_10016B888 = 0;

  sub_100038018();
}

- (MailPersistentStorage)initWithFilePath:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MailPersistentStorage;
  v5 = [(MailPersistentStorage *)&v15 init];
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    saveOperationQueue = v5->_saveOperationQueue;
    v5->_saveOperationQueue = v6;

    [(NSOperationQueue *)v5->_saveOperationQueue setQualityOfService:17];
    [(NSOperationQueue *)v5->_saveOperationQueue setMaxConcurrentOperationCount:1];
    v8 = (NSString *)[v4 copy];
    filePath = v5->_filePath;
    v5->_filePath = v8;

    v10 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v4];
    groups = v5->_groups;
    v5->_groups = v10;

    if (!v5->_groups)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v13 = v5->_groups;
      v5->_groups = v12;
    }
  }

  return v5;
}

- (MailPersistentStorage)init
{
  v3 = [(id)objc_opt_class() defaultFilePath];
  id v4 = [(MailPersistentStorage *)self initWithFilePath:v3];

  return v4;
}

- (void)save
{
  [(MailPersistentStorage *)self mf_lock];
  id v4 = [[MailPersistentStorageSaveOperation alloc] initWithDestinationPath:self->_filePath groupDictionary:self->_groups];
  [(MailPersistentStorage *)self mf_unlock];
  v3 = [(MailPersistentStorage *)self saveOperationQueue];
  [v3 addOperation:v4];
}

- (void)_setObject:(id)a3 forKey:(id)a4 inGroup:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (__CFString *)a5;
  if (!v8) {
    __assert_rtn("-[MailPersistentStorage _setObject:forKey:inGroup:]", "MailPersistentStorage.m", 165, "key");
  }
  [(MailPersistentStorage *)self mf_lock];
  if (!v9) {
    v9 = @"GenericData";
  }
  v10 = [(NSMutableDictionary *)self->_groups objectForKey:v9];
  if (!v10)
  {
    v10 = +[NSMutableDictionary dictionary];
  }
  if (v11) {
    [v10 setObject:v11 forKey:v8];
  }
  else {
    [v10 removeObjectForKey:v8];
  }
  [(NSMutableDictionary *)self->_groups setObject:v10 forKey:v9];
  [(MailPersistentStorage *)self mf_unlock];
}

- (id)_objectForKey:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v11 = "group";
    int v12 = 185;
    goto LABEL_8;
  }
  if (!v6)
  {
    id v11 = "key";
    int v12 = 186;
LABEL_8:
    __assert_rtn("-[MailPersistentStorage _objectForKey:inGroup:]", "MailPersistentStorage.m", v12, v11);
  }
  [(MailPersistentStorage *)self mf_lock];
  id v8 = [(NSMutableDictionary *)self->_groups objectForKeyedSubscript:v7];
  v9 = [v8 objectForKeyedSubscript:v6];
  [(MailPersistentStorage *)self mf_unlock];

  return v9;
}

- (void)setFetchDate:(id)a3 forSource:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6) {
    [(MailPersistentStorage *)self _setObject:v7 forKey:v6 inGroup:@"FetchingData"];
  }
}

- (id)fetchDateForSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MailPersistentStorage *)self _objectForKey:v4 inGroup:@"FetchingData"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setLastAdditionalMailboxesFetchDate:(id)a3
{
}

- (id)lastAdditionalMailboxesFetchDate
{
  return [(MailPersistentStorage *)self _objectForKey:@"LastAdditionalMailboxesFetch" inGroup:@"FetchingData"];
}

- (void)setBodyBackfillDate:(id)a3 forSource:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6) {
    [(MailPersistentStorage *)self _setObject:v7 forKey:v6 inGroup:@"BodyBackfillData"];
  }
}

- (id)bodyBackfillDateForSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MailPersistentStorage *)self _objectForKey:v4 inGroup:@"BodyBackfillData"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)touchLastLoadOlder
{
  id v3 = +[NSDate date];
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:");
}

- (void)clearLastLoadOlder
{
}

- (id)lastLoadOlder
{
  return [(MailPersistentStorage *)self _objectForKey:@"LastLoadOlder" inGroup:@"OverflowData"];
}

- (void)searchedServer
{
  id v3 = +[NSDate date];
  -[MailPersistentStorage _setObject:forKey:inGroup:](self, "_setObject:forKey:inGroup:");
}

- (void)clearSearchedServer
{
}

- (id)searchedServerDate
{
  return [(MailPersistentStorage *)self _objectForKey:@"AllSearch" inGroup:@"SearchData"];
}

- (void)setSceneRestorationDictionary:(id)a3
{
}

- (id)sceneRestorationDictionary
{
  return [(MailPersistentStorage *)self _objectForKey:@"SceneRestorationDict" inGroup:@"SceneData"];
}

- (void)removeAllDataBelongingToAccount:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [&off_100146538 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v18 = *(void *)v30;
    do
    {
      id v19 = v5;
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(&off_100146538);
        }
        uint64_t v7 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v20 = [(NSMutableDictionary *)self->_groups objectForKey:v7];
        id v8 = objc_alloc_init((Class)NSMutableArray);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v9 = [v20 allKeys];
          id v10 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v26;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v26 != v11) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
                if ([v4 ownsMailboxUidWithURL:v13]) {
                  [v8 addObject:v13];
                }
              }
              id v10 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
            }
            while (v10);
          }
        }
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v14 = v8;
        id v15 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v22;
          do
          {
            for (k = 0; k != v15; k = (char *)k + 1)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v14);
              }
              [(MailPersistentStorage *)self _setObject:0 forKey:*(void *)(*((void *)&v21 + 1) + 8 * (void)k) inGroup:v7];
            }
            id v15 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
          }
          while (v15);
        }
      }
      id v5 = [&off_100146538 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }
  [(MailPersistentStorage *)self save];
}

- (NSOperationQueue)saveOperationQueue
{
  return self->_saveOperationQueue;
}

- (void)setSaveOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveOperationQueue, 0);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_filePath, 0);
}

@end