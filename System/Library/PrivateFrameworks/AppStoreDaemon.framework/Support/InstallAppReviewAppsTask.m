@interface InstallAppReviewAppsTask
- (void)main;
@end

@implementation InstallAppReviewAppsTask

- (void)main
{
  v22 = sub_1003923F8(self->_installs, &stru_10052A1E8);
  v3 = sub_1003E0BA4();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100379058;
  v27[3] = &unk_1005236D0;
  v27[4] = self;
  [v3 modifyUsingTransaction:v27];

  v4 = sub_1002ED270();
  sub_1002EDDA0((uint64_t)v4, 64);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_installs;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(id **)(*((void *)&v23 + 1) + 8 * (void)v9);
        if (v10)
        {
          id v11 = v10[6];
          if (v11)
          {
            v12 = v11;
            v13 = sub_100424D84(v10);

            if (v13)
            {
              v14 = [_TtC9appstored24BackgroundAssetRelayTask alloc];
              id v15 = v10[6];
              v16 = [(BackgroundAssetRelayTask *)v14 initWithAppInstall:v10 metadata:v15 requestToken:0];

              uint64_t v17 = +[BackgroundAssetRelayTask taskQueue];
              v18 = (void *)v17;
              if (v17) {
                [*(id *)(v17 + 8) addOperation:v16];
              }
            }
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v19 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v7 = v19;
    }
    while (v19);
  }

  [(Task *)self lock];
  v20 = (NSArray *)[v22 copy];
  processedExternalIDs = self->_processedExternalIDs;
  self->_processedExternalIDs = v20;

  [(Task *)self unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedExternalIDs, 0);
  objc_storeStrong((id *)&self->_installs, 0);
}

@end