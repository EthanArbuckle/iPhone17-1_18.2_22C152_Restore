@interface InstallSystemAppsTask
- (void)main;
@end

@implementation InstallSystemAppsTask

- (void)main
{
  if (self)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    v4 = sub_1003E0BA4();
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10036F468;
    v45[3] = &unk_100522C00;
    id v5 = v3;
    id v46 = v5;
    [v4 readUsingSession:v45];

    installs = self->_installs;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10036F6C4;
    v42[3] = &unk_100529F88;
    id v43 = v5;
    v44 = self;
    id v7 = v5;
    sub_1003923F8(installs, v42);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([v8 count])
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10036ED34;
    v39[3] = &unk_100529F40;
    id v9 = objc_alloc_init((Class)NSMutableIndexSet);
    v10 = self;
    id v40 = v9;
    v41 = self;
    [v8 enumerateObjectsUsingBlock:v39];
    if ([v9 count])
    {
      id v11 = [v8 mutableCopy];

      [v11 removeObjectsAtIndexes:v9];
      id v31 = [v11 copy];

      v30 = 0;
    }
    else
    {
      v30 = v9;
      id v31 = v8;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v12 = self->_installs;
    id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v18 = sub_10026E95C(v17, @"bundle_id");
          uint64_t v19 = sub_10036F0B4((uint64_t)v10, v18);
          v20 = (void *)v19;
          if (v18) {
            BOOL v21 = v19 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21)
          {
            v22 = [ProgressInfo alloc];
            v23 = sub_100424C14(v17);
            v24 = sub_10041F328((id *)&v22->super.isa, v18, 0, v23);

            if (v24)
            {
              objc_setProperty_atomic(v24, v25, v20, 152);
              v24[18] = (id)896;
            }
            v26 = sub_100388088();
            sub_100388208((uint64_t)v26, v24, @"System");

            v10 = self;
          }
        }
        id v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v47, 16, v30, v31);
      }
      while (v14);
    }

    v27 = sub_1003E0BA4();
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10036F338;
    v33[3] = &unk_1005236D0;
    id v8 = v31;
    id v34 = v8;
    [v27 modifyUsingTransaction:v33];
  }
  else
  {
    v10 = self;
  }
  [(Task *)v10 lock];
  if (![(NSArray *)v10->_processedExternalIDs count])
  {
    uint64_t v28 = sub_1003923F8(v10->_installs, &stru_100529F60);
    processedExternalIDs = v10->_processedExternalIDs;
    v10->_processedExternalIDs = (NSArray *)v28;
  }
  [(Task *)v10 unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedExternalIDs, 0);
  objc_storeStrong((id *)&self->_systemApps, 0);
  objc_storeStrong((id *)&self->_installs, 0);
}

@end