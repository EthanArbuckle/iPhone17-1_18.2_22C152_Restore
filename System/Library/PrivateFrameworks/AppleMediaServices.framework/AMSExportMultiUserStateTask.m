@interface AMSExportMultiUserStateTask
- (AMSExportMultiUserStateTask)initWithHomeIdentifier:(id)a3 options:(unint64_t)a4;
- (AMSExportMultiUserStateTask)initWithHomeIdentifier:(id)a3 options:(unint64_t)a4 multiUserService:(id)a5;
- (AMSMultiUserServiceProtocol)multiUserService;
- (NSUUID)homeIdentifier;
- (id)performTask;
- (unint64_t)options;
@end

@implementation AMSExportMultiUserStateTask

- (AMSExportMultiUserStateTask)initWithHomeIdentifier:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[AMSMultiUserService proxyObjectAsync];
  v8 = [(AMSExportMultiUserStateTask *)self initWithHomeIdentifier:v6 options:a4 multiUserService:v7];

  return v8;
}

- (AMSExportMultiUserStateTask)initWithHomeIdentifier:(id)a3 options:(unint64_t)a4 multiUserService:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AMSExportMultiUserStateTask;
  v11 = [(AMSTask *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeIdentifier, a3);
    v12->_options = a4;
    objc_storeStrong((id *)&v12->_multiUserService, a5);
  }

  return v12;
}

- (id)performTask
{
  char v3 = [(AMSExportMultiUserStateTask *)self options];
  unint64_t v4 = [(AMSExportMultiUserStateTask *)self options];
  v5 = [(AMSExportMultiUserStateTask *)self multiUserService];
  if (v5)
  {
    uint64_t v6 = v3 & 1;
    v7 = objc_alloc_init(AMSPromise);
    v8 = [(AMSExportMultiUserStateTask *)self homeIdentifier];
    id v9 = [v8 UUIDString];
    id v10 = [(AMSPromise *)v7 completionHandlerAdapter];
    [v5 exportMultiUserTokenForHomeIdentifier:v9 generateIfMissing:v6 generateIfInvalid:(v4 >> 1) & 1 completion:v10];
  }
  else
  {
    v8 = AMSError(0, @"Could not create proxy object", @"We couldn't create the proxy object.", 0);
    v7 = +[AMSPromise promiseWithError:v8];
  }

  return v7;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (unint64_t)options
{
  return self->_options;
}

- (AMSMultiUserServiceProtocol)multiUserService
{
  return self->_multiUserService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserService, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
}

@end