@interface StewieIMessageSignInTracker
- (StewieIMessageSignInTracker)initWithSignInChangedCallback:(void *)a3;
- (id).cxx_construct;
- (void)fetchIsIMessageSignedIn;
- (void)initializeService;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
@end

@implementation StewieIMessageSignInTracker

- (StewieIMessageSignInTracker)initWithSignInChangedCallback:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)StewieIMessageSignInTracker;
  v4 = [(StewieIMessageSignInTracker *)&v10 init];
  if (v4)
  {
    if (!*((void *)a3 + 3)) {
      __TUAssertTrigger();
    }
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v6 = dispatch_queue_create("StewieIMessageSignInTracker", v5);
    fQueue = v4->fQueue;
    v4->fQueue = (OS_dispatch_queue *)v6;

    sub_100555EB4(v4->fCallback.__f_.__buf_.__lx, (uint64_t)a3);
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v9, kCtLoggingSystemName, "stw.ids.ctr");
    operator new();
  }

  return 0;
}

- (void)initializeService
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.madrid"];
  fService = self->fService;
  self->fService = v3;

  [(IDSService *)self->fService addDelegate:self queue:self->fQueue];

  [(StewieIMessageSignInTracker *)self fetchIsIMessageSignedIn];
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);

  [(StewieIMessageSignInTracker *)self fetchIsIMessageSignedIn];
}

- (void)fetchIsIMessageSignedIn
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(IDSService *)self->fService accounts];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      dispatch_queue_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v6) canSend])
        {
          int v7 = 0;
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
        dispatch_queue_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int v7 = 1;
LABEL_11:

  if (!self->fIsIMessageSignedIn.__engaged_
    || self->fIsIMessageSignedIn.var0.__null_state_ != v4)
  {
    v8 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      OsLogContext v9 = "Yes";
      if (v7) {
        OsLogContext v9 = "No";
      }
      *(_DWORD *)buf = 136315138;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I Is iMessage signed in: %s", buf, 0xCu);
    }

    self->fIsIMessageSignedIn = (optional<BOOL>)((unsigned __int16)v4 | 0x100);
    sub_1000607A8((uint64_t)&self->fCallback, (char)v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fService, 0);
  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
  sub_100060644(self->fCallback.__f_.__buf_.__lx);

  objc_storeStrong((id *)&self->fQueue, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 32) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end