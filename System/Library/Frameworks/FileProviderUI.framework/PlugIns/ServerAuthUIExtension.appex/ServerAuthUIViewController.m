@interface ServerAuthUIViewController
- (FPUIAuthenticationViewController)authenticaionVC;
- (NSDictionary)chosenAuthOptions;
- (ServerAuthUIViewController)init;
- (id)serverAddressPlaceholder;
- (int64_t)chosenAuthType;
- (void)_updateRecentServersListWithServer:(id)a3;
- (void)addSMBServerOrShare:(id)a3 connectionFlowDelegate:(id)a4;
- (void)cancel;
- (void)cancelAuthenticationSession;
- (void)connectToServerAtAddress:(id)a3 connectionFlowDelegate:(id)a4;
- (void)connectionFlowDelegate:(id)a3 didInputCredentials:(id)a4;
- (void)connectionFlowDelegate:(id)a3 didPickVolumeMountIdentifiers:(id)a4;
- (void)didEncounterError:(id)a3 completionHandler:(id)a4;
- (void)mountedVolumeIdentifiersWithCompletionHandler:(id)a3;
- (void)recentServerRepresentationsWithCompletionHandler:(id)a3;
- (void)removeRecentServerWithRepresentation:(id)a3 completion:(id)a4;
- (void)setAuthenticaionVC:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ServerAuthUIViewController

- (ServerAuthUIViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)ServerAuthUIViewController;
  v2 = [(ServerAuthUIViewController *)&v10 init];
  if (v2)
  {
    v3 = (SMBClientManager *)+[SMBClientManager newManager];
    connection = v2->_connection;
    v2->_connection = v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    recentServers = v2->_recentServers;
    v2->_recentServers = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    credentialStore = v2->_credentialStore;
    v2->_credentialStore = (ServerAuthUICredentialStore *)v7;
  }
  return v2;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)ServerAuthUIViewController;
  [(ServerAuthUIViewController *)&v29 viewDidLoad];
  v3 = [(ServerAuthUIViewController *)self extensionContext];
  v28 = [v3 initialURL];

  id v4 = [objc_alloc((Class)FPUIAuthenticationViewController) initWithServerURL:v28];
  [v4 setAuthenticationDelegate:self];
  objc_storeWeak((id *)&self->_authenticaionVC, v4);
  [(ServerAuthUIViewController *)self addChildViewController:v4];
  uint64_t v5 = [(ServerAuthUIViewController *)self view];
  v6 = [v4 view];
  [v5 addSubview:v6];

  v27 = [(ServerAuthUIViewController *)self view];
  v25 = [v27 centerXAnchor];
  v26 = [v4 view];
  v24 = [v26 centerXAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v30[0] = v23;
  v22 = [(ServerAuthUIViewController *)self view];
  v20 = [v22 centerYAnchor];
  v21 = [v4 view];
  v19 = [v21 centerYAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v30[1] = v18;
  v17 = [(ServerAuthUIViewController *)self view];
  v15 = [v17 widthAnchor];
  v16 = [v4 view];
  uint64_t v7 = [v16 widthAnchor];
  v8 = [v15 constraintEqualToAnchor:v7];
  v30[2] = v8;
  v9 = [(ServerAuthUIViewController *)self view];
  objc_super v10 = [v9 heightAnchor];
  v11 = [v4 view];
  v12 = [v11 heightAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v30[3] = v13;
  v14 = +[NSArray arrayWithObjects:v30 count:4];
  +[NSLayoutConstraint activateConstraints:v14];

  [v4 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = [(ServerAuthUIViewController *)self extensionContext];
  id v6 = [v4 initialURL];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticaionVC);
    [WeakRetained setInitialConnectionURL:v6];
  }
}

- (void)cancel
{
  id v3 = [(ServerAuthUIViewController *)self extensionContext];
  v2 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  [v3 cancelRequestWithError:v2];
}

- (void)connectToServerAtAddress:(id)a3 connectionFlowDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSURL _webkit_URLWithUserTypedString:v6];
  uint64_t v9 = [v8 host];
  if (!v9
    || (objc_super v10 = (void *)v9,
        [v8 scheme],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    uint64_t v12 = +[NSString stringWithFormat:@"%@://%@", @"smb", v6];

    uint64_t v13 = +[NSURL _webkit_URLWithUserTypedString:v12];

    v8 = (void *)v13;
    id v6 = (id)v12;
  }
  v14 = +[NSCharacterSet URLHostAllowedCharacterSet];
  v15 = [v14 invertedSet];

  if (v8
    && ([v8 host],
        v16 = objc_claimAutoreleasedReturnValue(),
        id v17 = [v16 rangeOfCharacterFromSet:v15],
        v16,
        v17 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v18 = 0;
  }
  else
  {
    if (v6)
    {
      v35 = NSURLErrorFailingURLStringErrorKey;
      id v36 = v6;
      v19 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    }
    else
    {
      v19 = 0;
    }
    v18 = +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:v19];
  }
  v20 = [v8 scheme];
  if ([v20 compare:@"smb" options:1])
  {

LABEL_14:
    if (v8)
    {
      v33 = NSURLErrorFailingURLErrorKey;
      v34 = v8;
      v22 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    }
    else
    {
      v22 = 0;
    }
    uint64_t v23 = +[NSError errorWithDomain:NSURLErrorDomain code:-1002 userInfo:v22];

    v18 = (void *)v23;
    goto LABEL_18;
  }
  unsigned __int8 v21 = [v8 isFileURL];

  if (v21) {
    goto LABEL_14;
  }
LABEL_18:
  if (v18)
  {
    [v7 authenticationDelegate:self didEncounterError:v18];
  }
  else
  {
    p_serverURL = &self->_serverURL;
    objc_storeStrong((id *)&self->_serverURL, v8);
    uint64_t v25 = [(NSURL *)self->_serverURL user];
    if (v25
      && (v26 = (void *)v25,
          [(NSURL *)*p_serverURL password],
          v27 = objc_claimAutoreleasedReturnValue(),
          v27,
          v26,
          v27))
    {
      [(ServerAuthUIViewController *)self addSMBServerOrShare:*p_serverURL connectionFlowDelegate:v7];
    }
    else
    {
      connection = self->_connection;
      objc_super v29 = [(NSURL *)*p_serverURL host];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000034FC;
      v30[3] = &unk_1000083A0;
      id v31 = v7;
      v32 = self;
      [(SMBClientManager *)connection credentialTypesForServer:v29 completionHandler:v30];
    }
  }
}

- (void)addSMBServerOrShare:(id)a3 connectionFlowDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000039F8;
  v11[3] = &unk_1000083F0;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [(SMBClientManager *)connection addSMBServerOrShare:v10 completionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)connectionFlowDelegate:(id)a3 didInputCredentials:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSURLComponents) initWithURL:self->_serverURL resolvingAgainstBaseURL:0];
  v8 = (char *)[v12 type];
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (!v8)
    {
      [v7 setUser:@"GUEST"];
      [v7 setPassword:0];
    }
  }
  else
  {
    id v9 = [v12 username];
    [v7 setUser:v9];

    id v10 = [v12 password];
    [v7 setPassword:v10];
  }
  v11 = [v7 URL];
  [(ServerAuthUIViewController *)self addSMBServerOrShare:v11 connectionFlowDelegate:v6];
}

- (void)connectionFlowDelegate:(id)a3 didPickVolumeMountIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  id v9 = [(NSURL *)self->_serverURL host];
  int64_t chosenAuthType = self->_chosenAuthType;
  chosenAuthOptions = self->_chosenAuthOptions;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003EC8;
  v13[3] = &unk_100008468;
  id v12 = v6;
  id v14 = v12;
  objc_copyWeak(&v15, &location);
  [(SMBClientManager *)connection addVolumes:v7 atServer:v9 credentialType:chosenAuthType credential:chosenAuthOptions completionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)cancelAuthenticationSession
{
  id v3 = [(ServerAuthUIViewController *)self extensionContext];
  v2 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  [v3 cancelRequestWithError:v2];
}

- (id)serverAddressPlaceholder
{
  return (id)_FPUILoc(@"SERVER_ADDRESS_PLACEHOLDER", a2);
}

- (void)_updateRecentServersListWithServer:(id)a3
{
  objc_msgSend(a3, "serverAuthUI_strippedDownURL");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:@"com.apple.SMBClientProvider.FileProvider.RecentServers"];
  id v6 = [v5 mutableCopy];

  if (!v6)
  {
    id v6 = +[NSMutableArray array];
  }
  id v7 = [v11 absoluteString];
  [v6 removeObject:v7];

  v8 = [v11 absoluteString];
  [v6 insertObject:v8 atIndex:0];

  if ((unint64_t)[v6 count] >= 4)
  {
    do
    {
      id v9 = [v6 lastObject];
      id v10 = [objc_alloc((Class)NSURL) initWithString:v9];
      [(ServerAuthUICredentialStore *)self->_credentialStore dropCredentialsForServerURL:v10];
      [v6 removeLastObject];
    }
    while ((unint64_t)[v6 count] > 3);
  }
  [v4 setObject:v6 forKey:@"com.apple.SMBClientProvider.FileProvider.RecentServers"];
}

- (void)recentServerRepresentationsWithCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v14 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v14 objectForKey:@"com.apple.SMBClientProvider.FileProvider.RecentServers"];
  uint64_t v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
        id v12 = objc_opt_new();
        [v12 setIdentifier:v11];
        [v12 setDisplayName:v11];
        id v13 = [objc_alloc((Class)NSURL) initWithString:v11];
        [v12 setUrl:v13];

        [v5 addObject:v12];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v3[2](v3, v5, 0);
}

- (void)removeRecentServerWithRepresentation:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v13 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v13 objectForKey:@"com.apple.SMBClientProvider.FileProvider.RecentServers"];
  id v9 = [v8 mutableCopy];

  credentialStore = self->_credentialStore;
  uint64_t v11 = [v7 url];
  [(ServerAuthUICredentialStore *)credentialStore dropCredentialsForServerURL:v11];

  id v12 = [v7 identifier];

  [v9 removeObject:v12];
  [v13 setObject:v9 forKey:@"com.apple.SMBClientProvider.FileProvider.RecentServers"];
  v6[2](v6, 0);
}

- (void)mountedVolumeIdentifiersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)didEncounterError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ServerAuthUIViewController *)self extensionContext];
  [v8 didEncounterError:v7 completionHandler:v6];
}

- (int64_t)chosenAuthType
{
  return self->_chosenAuthType;
}

- (NSDictionary)chosenAuthOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (FPUIAuthenticationViewController)authenticaionVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticaionVC);

  return (FPUIAuthenticationViewController *)WeakRetained;
}

- (void)setAuthenticaionVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_authenticaionVC);
  objc_storeStrong((id *)&self->_chosenAuthOptions, 0);
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_recentServers, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end