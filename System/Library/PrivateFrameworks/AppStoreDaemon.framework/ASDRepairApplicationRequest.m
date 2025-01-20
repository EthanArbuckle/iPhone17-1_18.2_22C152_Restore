@interface ASDRepairApplicationRequest
- (ASDRepairApplicationRequest)initWithOptions:(id)a3;
- (void)sendRequestWithCompletionBlock:(id)a3;
@end

@implementation ASDRepairApplicationRequest

- (ASDRepairApplicationRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDRepairApplicationRequest;
  v5 = [(ASDRepairApplicationRequest *)&v12 init];
  if (v5)
  {
    v6 = [ASDRepairOptions alloc];
    v7 = [v4 bundleID];
    v8 = [v4 accountDSID];
    uint64_t v9 = -[ASDRepairOptions initWithBundleID:accountIdentifier:claimStyle:](v6, "initWithBundleID:accountIdentifier:claimStyle:", v7, v8, [v4 claimStyle]);
    options = v5->_options;
    v5->_options = (ASDRepairOptions *)v9;
  }
  return v5;
}

- (void)sendRequestWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[ASDRepairService defaultService];
  [v5 repairAppWithOptions:self->_options replyHandler:v4];
}

- (void).cxx_destruct
{
}

@end