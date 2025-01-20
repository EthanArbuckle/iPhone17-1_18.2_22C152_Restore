@interface FPItemManager
- (void)_doc_fetchFolderNamed:(id)a3 inDomain:(id)a4 completionHandler:(id)a5;
- (void)_doc_folderNamed:(id)a3 existsInDomain:(id)a4 completionHandler:(id)a5;
- (void)_doc_providerForDomainIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation FPItemManager

- (void)_doc_providerForDomainIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004740;
  v10[3] = &unk_1000084A0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 fetchProvidersSuitableForDownloads:v10];
}

- (void)_doc_fetchFolderNamed:(id)a3 inDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[FPItemManager defaultManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004AEC;
  v15[3] = &unk_100008540;
  id v16 = v9;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v8;
  id v19 = v10;
  id v11 = v8;
  id v12 = v17;
  id v13 = v10;
  id v14 = v9;
  [(FPItemManager *)self _doc_providerForDomainIdentifier:v14 completionHandler:v15];
}

- (void)_doc_folderNamed:(id)a3 existsInDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[FPItemManager defaultManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005054;
  v15[3] = &unk_100008540;
  id v16 = v9;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v8;
  id v19 = v10;
  id v11 = v8;
  id v12 = v17;
  id v13 = v10;
  id v14 = v9;
  [(FPItemManager *)self _doc_providerForDomainIdentifier:v14 completionHandler:v15];
}

@end