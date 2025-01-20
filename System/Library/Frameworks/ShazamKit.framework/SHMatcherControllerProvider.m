@interface SHMatcherControllerProvider
- (SHAttribution)attribution;
- (SHAudioTapProvider)audioTapProvider;
- (SHMatcherControllerProvider)initWithAudioTapProvider:(id)a3 attribution:(id)a4 clientType:(int64_t)a5;
- (SHMatcherFactory)matcherFactory;
- (SHServiceDelegate)delegate;
- (id)associatedMatcherControllerForRequest:(id)a3;
- (id)catalogForRequest:(id)a3;
- (id)matcherControllerForRequest:(id)a3;
- (int64_t)clientType;
- (void)setDelegate:(id)a3;
@end

@implementation SHMatcherControllerProvider

- (SHMatcherControllerProvider)initWithAudioTapProvider:(id)a3 attribution:(id)a4 clientType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHMatcherControllerProvider;
  v11 = [(SHMatcherControllerProvider *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_audioTapProvider, a3);
    objc_storeStrong((id *)&v12->_attribution, a4);
    v12->_clientType = a5;
    v13 = [[SHMatcherFactory alloc] initWithAudioTapProvider:v12->_audioTapProvider];
    matcherFactory = v12->_matcherFactory;
    v12->_matcherFactory = v13;
  }
  return v12;
}

- (id)matcherControllerForRequest:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 type] - 1;
  v6 = [(SHMatcherControllerProvider *)self delegate];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"9846B3A1-6769-4363-8AA2-214973BD05A0"];
  v8 = [v6 registeredWorkerForWorkerID:v7];

  if ((unint64_t)v5 <= 2 && v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v35 = 138412290;
      id v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to create matcher for request %@, there is already a recording matcher with an associate matcher controller running", (uint8_t *)&v35, 0xCu);
    }
    v33 = 0;
  }
  else
  {
    id v9 = [(SHMatcherControllerProvider *)self associatedMatcherControllerForRequest:v4];
    if ([v4 type] == (id)2
      && ([v9 matcher],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 conformsToProtocol:&OBJC_PROTOCOL___SHParentMatcher],
          v10,
          v11))
    {
      v12 = [v9 matcher];
      v13 = [v12 childMatcher];
    }
    else
    {
      v13 = 0;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v15 = [v8 taskID];
    objc_super v16 = [v4 requestID];
    unsigned int v17 = [v15 isEqual:v16];

    v18 = [(SHMatcherControllerProvider *)self catalogForRequest:v4];
    if ((isKindOfClass & 1) != 0 && v17)
    {
      v19 = sh_log_object();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v35) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Starting recording with buffer from pre recording", (uint8_t *)&v35, 2u);
      }

      v20 = [(SHMatcherControllerProvider *)self matcherFactory];
      v21 = [v8 buffers];
      uint64_t v22 = [v20 matcherForRequest:v4 catalog:v18 initialBuffers:v21];

      [v8 stopAfterTransferingBuffers];
      v13 = v22;
    }
    if (v13
      || ([(SHMatcherControllerProvider *)self matcherFactory],
          v23 = objc_claimAutoreleasedReturnValue(),
          [v23 matcherForRequest:v4 catalog:v18],
          v13 = objc_claimAutoreleasedReturnValue(),
          v23,
          v13))
    {
      if ([v4 type] == (id)3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = v13;
          v25 = +[SHMatcherRequest requestOnceWithNotifications:](SHMatcherRequest, "requestOnceWithNotifications:", [v4 sendNotifications]);
          v26 = [(SHMatcherControllerProvider *)self matcherFactory];
          v27 = [v26 matcherForRequest:v25 catalog:v18];
          [v24 setChildMatcher:v27];

          v28 = sh_log_object();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v29 = [v24 childMatcher];
            int v35 = 138412546;
            id v36 = v29;
            __int16 v37 = 2112;
            v38 = v24;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Associating child matcher %@ with parent matcher %@", (uint8_t *)&v35, 0x16u);
          }
        }
      }
      v30 = [SHMatchResultNotificationScheduler alloc];
      v31 = [(SHMatcherControllerProvider *)self attribution];
      v32 = [(SHMatchResultNotificationScheduler *)v30 initWithAttribution:v31];

      v33 = [[SHMatcherController alloc] initWithMatcher:v13 notificationScheduler:v32];
      if ([v4 type] == (id)2 && v9)
      {
        [v9 setAssociatedMatcherController:v33];
        [(SHMatcherController *)v33 setAssociatedMatcherController:v9];
      }
    }
    else
    {
      v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v35 = 138412290;
        id v36 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to create matcher for request %@", (uint8_t *)&v35, 0xCu);
      }
      v33 = 0;
    }
  }

  return v33;
}

- (id)catalogForRequest:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 type];
  if ((unint64_t)(v5 - 2) < 2 || v5 == 0)
  {
    id v7 = [SHShazamKitServerCatalog alloc];
    v8 = [(SHMatcherControllerProvider *)self attribution];
    id v9 = [v8 containingAppBundleIdentifier];
    int64_t v10 = [(SHMatcherControllerProvider *)self clientType];
    unsigned int v11 = [v4 installationID];
    self = [(SHShazamKitServerCatalog *)v7 initWithClientIdentifier:v9 clientType:v10 installationID:v11];
  }
  else if (v5 == (char *)1)
  {
    self = (SHMatcherControllerProvider *)objc_alloc_init((Class)SHCustomCatalog);
  }

  return self;
}

- (id)associatedMatcherControllerForRequest:(id)a3
{
  v3 = [(SHMatcherControllerProvider *)self delegate];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"89EAC1CA-426C-48AA-97CE-386AEDDCCC4C"];
  v5 = [v3 registeredWorkerForWorkerID:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (SHServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHMatcherFactory)matcherFactory
{
  return self->_matcherFactory;
}

- (SHAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_audioTapProvider, 0);
  objc_storeStrong((id *)&self->_matcherFactory, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end