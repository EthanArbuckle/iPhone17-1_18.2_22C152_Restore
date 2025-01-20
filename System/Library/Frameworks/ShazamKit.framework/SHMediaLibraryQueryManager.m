@interface SHMediaLibraryQueryManager
- (SHMediaLibraryClient)client;
- (SHMediaLibraryController)libraryController;
- (SHMediaLibraryQueryManager)initWithClient:(id)a3;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)setLibraryController:(id)a3;
@end

@implementation SHMediaLibraryQueryManager

- (SHMediaLibraryQueryManager)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibraryQueryManager;
  v6 = [(SHMediaLibraryQueryManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  id v5 = [(SHMediaLibraryQueryManager *)self client];
  id v6 = [v5 type];

  if (!v6 || v6 == (id)2)
  {
    NSErrorUserInfoKey v12 = NSDebugDescriptionErrorKey;
    CFStringRef v13 = @"Invalid client Bundle ID or Team ID";
    v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    objc_super v9 = +[SHError errorWithCode:400 underlyingError:0 keyOverrides:v8];
    v4[2](v4, 0, v9);

    goto LABEL_6;
  }
  if (v6 == (id)1)
  {
    v7 = [(SHMediaLibraryQueryManager *)self libraryController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100031614;
    v10[3] = &unk_100075A68;
    v11 = v4;
    [v7 _libraryInfoWithCompletionHandler:v10];

    v8 = v11;
LABEL_6:
  }
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SHMediaLibraryQueryManager *)self client];
  id v9 = [v8 type];

  if (v9)
  {
    if (v9 == (id)2)
    {
      id v21 = objc_alloc((Class)SHMediaLibraryQueryParameters);
      id v10 = [v6 resultsLimit];
      id v11 = [v6 ascending];
      id v12 = [v6 shouldUpdate];
      CFStringRef v13 = [(SHMediaLibraryQueryManager *)self client];
      v14 = [v13 credentials];
      v15 = [v14 attribution];
      v16 = [v15 containingAppBundleIdentifier];
      id v17 = [v21 initWithResultsLimit:v10 filterOptions:1 ascending:v11 shouldUpdate:v12 providerIdentifier:v16];

      id v6 = v17;
    }
    v18 = [(SHMediaLibraryQueryManager *)self libraryController];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000318E8;
    v22[3] = &unk_100075A90;
    id v23 = v7;
    [v18 _queryLibraryWithParameters:v6 completionHandler:v22];

    v19 = v23;
  }
  else
  {
    NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
    CFStringRef v25 = @"Invalid client Bundle ID or Team ID";
    v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v20 = +[SHError errorWithCode:400 underlyingError:0 keyOverrides:v19];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v20);
  }
}

- (SHMediaLibraryController)libraryController
{
  libraryController = self->_libraryController;
  if (!libraryController)
  {
    v4 = [SHMediaLibraryController alloc];
    id v5 = [(SHMediaLibraryQueryManager *)self client];
    id v6 = [v5 credentials];
    id v7 = [v6 attribution];
    v8 = [v7 containingAppBundleIdentifier];
    id v9 = [(SHMediaLibraryQueryManager *)self client];
    id v10 = [v9 credentials];
    id v11 = -[SHMediaLibraryController initWithBundleIdentifier:clientType:](v4, "initWithBundleIdentifier:clientType:", v8, [v10 clientType]);
    id v12 = self->_libraryController;
    self->_libraryController = v11;

    libraryController = self->_libraryController;
  }

  return libraryController;
}

- (void)setLibraryController:(id)a3
{
}

- (SHMediaLibraryClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_libraryController, 0);
}

@end