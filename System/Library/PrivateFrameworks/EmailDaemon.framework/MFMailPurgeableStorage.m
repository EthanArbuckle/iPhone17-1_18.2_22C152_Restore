@interface MFMailPurgeableStorage
- (MFAccountsProvider)accountsProvider;
- (MFMailPurgeableStorage)initWithAccountsProvider:(id)a3;
- (double)previousPurgeTime;
- (id)library;
- (int)previousUrgency;
- (int64_t)nonPurgeableSpace;
- (void)setAccountsProvider:(id)a3;
- (void)setPreviousPurgeTime:(double)a3;
- (void)setPreviousUrgency:(int)a3;
@end

@implementation MFMailPurgeableStorage

- (MFMailPurgeableStorage)initWithAccountsProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailPurgeableStorage;
  v6 = [(MFMailPurgeableStorage *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountsProvider, a3);
    v7->_previousUrgency = -1;
  }

  return v7;
}

- (id)library
{
  return +[MFMailMessageLibrary defaultInstance];
}

- (int64_t)nonPurgeableSpace
{
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100075558;
  v44[3] = &unk_10013C6C8;
  v44[4] = &v45;
  v31 = objc_retainBlock(v44);
  v3 = [(MFMailPurgeableStorage *)self library];
  v4 = [v3 messageBasePathForAccount:0];

  id v5 = +[EDMessageDataLayoutManager rootMessageDataDirectoryForBasePath:v4 purgeable:0];
  ((void (*)(void *, void *))v31[2])(v31, v5);

  +[MailAccount mailAccounts];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v41;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v10 = [v9 personaIdentifier];
        if (v10)
        {
          unsigned __int8 v11 = [v9 supportsPurge];

          if ((v11 & 1) == 0)
          {
            v12 = [(MFMailPurgeableStorage *)self library];
            uint64_t v13 = [v12 messageBasePathForAccount:v9];

            v14 = +[EDMessageDataLayoutManager rootMessageDataDirectoryForBasePath:v13 purgeable:0];
            ((void (*)(void *, void *))v31[2])(v31, v14);

            v4 = (void *)v13;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v6);
  }

  v30 = +[EMPersistenceLayoutManager baseMailDirectory];
  v15 = +[NSFileManager defaultManager];
  id v39 = 0;
  v16 = [v15 contentsOfDirectoryAtURL:v30 includingPropertiesForKeys:0 options:0 error:&v39];
  id v17 = v39;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v32 = v16;
  id v18 = [v32 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v36;
    do
    {
      v20 = 0;
      v21 = v17;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v32);
        }
        v22 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v20);
        uint64_t v23 = +[NSFileManager defaultManager];
        v24 = [v22 path];
        id v34 = v21;
        v25 = [(id)v23 attributesOfItemAtPath:v24 error:&v34];
        id v17 = v34;

        v26 = [v25 objectForKeyedSubscript:NSFileTypeDirectory];
        LOBYTE(v23) = [v26 BOOLValue];

        if ((v23 & 1) == 0)
        {
          unint64_t v27 = (unint64_t)[v25 fileSize];
          if ((v27 & 0x8000000000000000) == 0) {
            v46[3] += v27;
          }
        }

        v20 = (char *)v20 + 1;
        v21 = v17;
      }
      while (v18 != v20);
      id v18 = [v32 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v18);
  }

  int64_t v28 = v46[3];
  _Block_object_dispose(&v45, 8);
  return v28;
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (double)previousPurgeTime
{
  return self->_previousPurgeTime;
}

- (void)setPreviousPurgeTime:(double)a3
{
  self->_previousPurgeTime = a3;
}

- (int)previousUrgency
{
  return self->_previousUrgency;
}

- (void)setPreviousUrgency:(int)a3
{
  self->_previousUrgency = a3;
}

- (void).cxx_destruct
{
}

@end