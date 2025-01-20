@interface AMSDLeaveMultiUserHomeTask
- (AMSDLeaveMultiUserHomeTask)initWithHomeIdentifier:(id)a3;
- (NSUUID)homeIdentifier;
- (id)_generateAppProvidedData;
- (id)performTask;
@end

@implementation AMSDLeaveMultiUserHomeTask

- (AMSDLeaveMultiUserHomeTask)initWithHomeIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDLeaveMultiUserHomeTask;
  v6 = [(AMSDLeaveMultiUserHomeTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_homeIdentifier, a3);
  }

  return v7;
}

- (id)performTask
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A254;
  v5[3] = &unk_1001130A8;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSDLeaveMultiUserHomeTask *)self performBinaryTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_generateAppProvidedData
{
  v2 = [(AMSDLeaveMultiUserHomeTask *)self homeIdentifier];
  v3 = +[AMSAuthenticateOptions amsd_createAppProvidedDataWithMultiUserAction:@"leave" homeIdentifier:v2];

  return v3;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void).cxx_destruct
{
}

@end