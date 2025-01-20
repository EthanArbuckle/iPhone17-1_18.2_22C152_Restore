@interface IDSSKStatusClient
- (BOOL)_shouldRetryForError:(id)a3;
- (IDSBlockRetryHandler)provisionRetryHandler;
- (IDSBlockRetryHandler)publishRetryHandler;
- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 queue:(id)a4;
- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 statusPublishingService:(id)a4 queue:(id)a5;
- (IDSSKStatusClientDelegate)delegate;
- (NSString)description;
- (NSString)statusTypeIdentifier;
- (OS_dispatch_queue)queue;
- (SKStatusPublishingService)publishingService;
- (double)_retryMaximumTime;
- (double)_retryMinimumTime;
- (double)_retryTimeForAttempt:(int64_t)a3;
- (id)_publishRequestForStatusPayload:(id)a3;
- (id)_skHandlesForURIs:(id)a3;
- (id)_skInvitationPayloadForDictionary:(id)a3;
- (id)invitedHandles;
- (unint64_t)_retryMaximumAttempts;
- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6;
- (void)invitedHandlesChanged;
- (void)provisionStatusPayload:(id)a3 completion:(id)a4;
- (void)publishStatus:(id)a3 completion:(id)a4;
- (void)publishingServiceDaemonDisconnected:(id)a3;
- (void)removeAllInvitedHandlesWithCompletion:(id)a3;
- (void)removeInvitedHandles:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setProvisionRetryHandler:(id)a3;
- (void)setPublishRetryHandler:(id)a3;
- (void)setPublishingService:(id)a3;
- (void)setStatusTypeIdentifier:(id)a3;
- (void)statusPublishRequestCompleted:(id)a3 successfully:(BOOL)a4 error:(id)a5;
@end

@implementation IDSSKStatusClient

- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (objc_class *)IMWeakLinkClass();
  v9 = +[IDSFoundationLog IDSSKStatusClient];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v10) {
      sub_100717508(v9);
    }

    v9 = [[v8 alloc] initWithStatusTypeIdentifier:v6];
    self = [(IDSSKStatusClient *)self initWithStatusTypeIdentifier:v6 statusPublishingService:v9 queue:v7];
    v11 = self;
  }
  else
  {
    if (v10) {
      sub_1007174C4(v9);
    }
    v11 = 0;
  }

  return v11;
}

- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 statusPublishingService:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSSKStatusClient;
  v12 = [(IDSSKStatusClient *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_statusTypeIdentifier, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeStrong((id *)&v13->_publishingService, a4);
    [(SKStatusPublishingService *)v13->_publishingService addDelegate:v13 queue:v13->_queue];
    publishRetryHandler = v13->_publishRetryHandler;
    v13->_publishRetryHandler = 0;

    provisionRetryHandler = v13->_provisionRetryHandler;
    v13->_provisionRetryHandler = 0;
  }
  return v13;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)description
{
  v3 = [(IDSSKStatusClient *)self statusTypeIdentifier];
  v4 = [(IDSSKStatusClient *)self delegate];
  CFStringRef v5 = @"YES";
  if (!v4) {
    CFStringRef v5 = @"NO";
  }
  id v6 = +[NSString stringWithFormat:@"<IDSSKStatusClient %p>: statusTypeIdentifier %@ delegate %@", self, v3, v5];

  return (NSString *)v6;
}

- (double)_retryTimeForAttempt:(int64_t)a3
{
  [(IDSSKStatusClient *)self _retryMinimumTime];
  double v6 = v5 * (double)a3;
  [(IDSSKStatusClient *)self _retryMaximumTime];
  if (v6 < result) {
    return v6;
  }
  return result;
}

- (void)publishStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSFoundationLog IDSSKStatusClient];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting publish for status payload: %@", buf, 0xCu);
  }

  if (v6)
  {
    publishRetryHandler = self->_publishRetryHandler;
    if (publishRetryHandler)
    {
      [(IDSBlockRetryHandler *)publishRetryHandler stop];
      id v10 = self->_publishRetryHandler;
      self->_publishRetryHandler = 0;
    }
    id v11 = [IDSBlockRetryHandler alloc];
    queue = self->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001FD460;
    v25[3] = &unk_1009820F0;
    v25[4] = self;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_1001FD46C;
    v21 = &unk_1009861D8;
    v22 = self;
    id v23 = v6;
    id v24 = v7;
    v13 = [(IDSBlockRetryHandler *)v11 initWithQueue:queue backoffProvider:v25 block:&v18];
    v14 = self->_publishRetryHandler;
    self->_publishRetryHandler = v13;

    [(IDSBlockRetryHandler *)self->_publishRetryHandler start];
  }
  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Status payload is nil";
    v15 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v16 = +[NSError errorWithDomain:IDSOffGridStatusErrorDomain code:2 userInfo:v15];
    objc_super v17 = +[IDSFoundationLog IDSSKStatusClient];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10071754C((uint64_t)v16, v17);
    }

    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v16);
    }
  }
}

- (void)provisionStatusPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    v8 = +[IDSFoundationLog IDSSKStatusClient];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting provisioning for payloads: %@", buf, 0xCu);
    }

    provisionRetryHandler = self->_provisionRetryHandler;
    if (provisionRetryHandler)
    {
      [(IDSBlockRetryHandler *)provisionRetryHandler stop];
      id v10 = self->_provisionRetryHandler;
      self->_provisionRetryHandler = 0;
    }
    id v11 = [IDSBlockRetryHandler alloc];
    queue = self->_queue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001FD908;
    v24[3] = &unk_1009820F0;
    v24[4] = self;
    objc_super v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    uint64_t v19 = sub_1001FD914;
    v20 = &unk_1009861D8;
    v21 = self;
    id v22 = v6;
    id v23 = v7;
    v13 = [(IDSBlockRetryHandler *)v11 initWithQueue:queue backoffProvider:v24 block:&v17];
    v14 = self->_provisionRetryHandler;
    self->_provisionRetryHandler = v13;

    [(IDSBlockRetryHandler *)self->_provisionRetryHandler start];
  }
  else
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"No payloads specified";
    v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v16 = +[NSError errorWithDomain:IDSOffGridStatusErrorDomain code:2 userInfo:v15];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
}

- (id)invitedHandles
{
  v2 = [(SKStatusPublishingService *)self->_publishingService invitedHandles];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001FDBE8;
  v5[3] = &unk_10097FE80;
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v6 = v3;
  [v2 enumerateObjectsUsingBlock:v5];

  return v3;
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 || ![v10 count])
  {
    v14 = +[IDSFoundationLog IDSSKStatusClient];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No handles specified to invite", buf, 2u);
    }
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FDDEC;
  block[3] = &unk_100981B00;
  id v21 = v11;
  id v22 = self;
  id v23 = v10;
  id v24 = v12;
  id v25 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  dispatch_async(queue, block);
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || ![v6 count])
  {
    v8 = +[IDSFoundationLog IDSSKStatusClient];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No handles specified to remove invites", buf, 2u);
    }
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FE338;
  block[3] = &unk_1009800E8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FE594;
  v7[3] = &unk_1009814F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_skHandlesForURIs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = IMWeakLinkClass();
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1001FE7D8;
  id v11 = &unk_100986228;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v13 = v4;
  id v5 = v12;
  [v3 enumerateObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

- (id)_skInvitationPayloadForDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)IMWeakLinkClass());
    id v5 = +[NSDate now];
    id v6 = [v4 initWithDictionary:v3 dateCreated:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_publishRequestForStatusPayload:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)IMWeakLinkClass()) initWithStatusPayload:v3];

  id v5 = +[IDSFoundationLog IDSSKStatusClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created publish request: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)statusPublishRequestCompleted:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = +[IDSFoundationLog IDSSKStatusClient];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    int v12 = 138413058;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    id v15 = v8;
    __int16 v16 = 2112;
    CFStringRef v17 = v11;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "statusPublishRequestCompleted %@: %@, successfully: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)invitedHandlesChanged
{
  id v3 = +[IDSFoundationLog IDSSKStatusClient];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invitedHandlesChanged %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)publishingServiceDaemonDisconnected:(id)a3
{
  id v3 = a3;
  int v4 = +[IDSFoundationLog IDSSKStatusClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "publishingServiceDaemonDisconnected %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)_shouldRetryForError:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  int v5 = [v3 domain];
  if (![v5 isEqualToString:APSErrorDomain])
  {

    goto LABEL_8;
  }
  if ([v4 code] != (id)4)
  {
    id v6 = [v4 code];

    if (v6 == (id)5) {
      goto LABEL_7;
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }

LABEL_7:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (unint64_t)_retryMaximumAttempts
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"status-retry-max-attempts"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (double)_retryMinimumTime
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"status-retry-min-time-sec"];

  objc_opt_class();
  double v4 = 30.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (double)_retryMaximumTime
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"status-retry-max-time-sec"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 300.0;
  }

  return v5;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (void)setStatusTypeIdentifier:(id)a3
{
}

- (SKStatusPublishingService)publishingService
{
  return self->_publishingService;
}

- (void)setPublishingService:(id)a3
{
}

- (IDSBlockRetryHandler)publishRetryHandler
{
  return self->_publishRetryHandler;
}

- (void)setPublishRetryHandler:(id)a3
{
}

- (IDSBlockRetryHandler)provisionRetryHandler
{
  return self->_provisionRetryHandler;
}

- (void)setProvisionRetryHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSSKStatusClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSSKStatusClientDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_provisionRetryHandler, 0);
  objc_storeStrong((id *)&self->_publishRetryHandler, 0);
  objc_storeStrong((id *)&self->_publishingService, 0);

  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
}

@end