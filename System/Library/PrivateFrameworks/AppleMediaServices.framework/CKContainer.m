@interface CKContainer
- (AMSDCloudDataDatabase)privateDatabase;
- (AMSDCloudDataDatabase)publicDatabase;
- (AMSDCloudDataDatabase)sharedDatabase;
- (id)_acceptShareWithShareMetadata:(id)a3;
- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4;
- (id)acceptShareURL:(id)a3 withToken:(id)a4;
- (id)status;
@end

@implementation CKContainer

- (AMSDCloudDataDatabase)privateDatabase
{
  return (AMSDCloudDataDatabase *)[(CKContainer *)self privateCloudDatabase];
}

- (AMSDCloudDataDatabase)publicDatabase
{
  return (AMSDCloudDataDatabase *)[(CKContainer *)self publicCloudDatabase];
}

- (AMSDCloudDataDatabase)sharedDatabase
{
  return (AMSDCloudDataDatabase *)[(CKContainer *)self sharedCloudDatabase];
}

- (id)acceptShareURL:(id)a3 withToken:(id)a4
{
  v5 = [(CKContainer *)self _fetchShareMetadataForURL:a3 withToken:a4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000639A4;
  v9[3] = &unk_100114810;
  v9[4] = self;
  v6 = [v5 thenWithBlock:v9];
  v7 = [v6 binaryPromiseAdapter];

  return v7;
}

- (id)status
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100063A5C;
  v5[3] = &unk_100114838;
  id v3 = objc_alloc_init((Class)AMSMutablePromise);
  id v6 = v3;
  [(CKContainer *)self accountStatusWithCompletionHandler:v5];

  return v3;
}

- (id)_acceptShareWithShareMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AMSMutablePromise);
  id v6 = objc_alloc((Class)CKAcceptSharesOperation);
  id v13 = v4;
  v7 = +[NSArray arrayWithObjects:&v13 count:1];
  id v8 = [v6 initWithShareMetadatas:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100063C50;
  v11[3] = &unk_100114860;
  id v9 = v5;
  id v12 = v9;
  [v8 setPerShareCompletionBlock:v11];
  [(CKContainer *)self addOperation:v8];

  return v9;
}

- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = objc_alloc_init((Class)AMSMutablePromise);
  id v10 = objc_alloc((Class)CKFetchShareMetadataOperation);
  if (v8)
  {
    id v24 = v6;
    v11 = +[NSArray arrayWithObjects:&v24 count:1];
    id v22 = v6;
    id v23 = v8;
    id v12 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v13 = [v10 initWithShareURLs:v11 invitationTokensByShareURL:v12];
  }
  else
  {
    id v21 = v6;
    v11 = +[NSArray arrayWithObjects:&v21 count:1];
    id v13 = [v10 initWithShareURLs:v11];
  }

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100063E64;
  v19 = &unk_100114888;
  id v14 = v9;
  id v20 = v14;
  [v13 setPerShareMetadataBlock:&v16];
  -[CKContainer addOperation:](self, "addOperation:", v13, v16, v17, v18, v19);

  return v14;
}

@end