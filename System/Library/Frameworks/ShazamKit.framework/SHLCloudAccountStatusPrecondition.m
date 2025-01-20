@interface SHLCloudAccountStatusPrecondition
- (SHLCloudAccountStatusPrecondition)initWithContainer:(id)a3;
- (SHLCloudBackedContainer)cloudContainer;
- (void)evaluatePreconditionWithCompletion:(id)a3;
- (void)setCloudContainer:(id)a3;
@end

@implementation SHLCloudAccountStatusPrecondition

- (SHLCloudAccountStatusPrecondition)initWithContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudAccountStatusPrecondition;
  v6 = [(SHLCloudAccountStatusPrecondition *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudContainer, a3);
  }

  return v7;
}

- (void)evaluatePreconditionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SHLCloudAccountStatusPrecondition *)self cloudContainer];
  v6 = [v5 container];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100032F3C;
  v8[3] = &unk_100075B58;
  id v9 = v4;
  id v7 = v4;
  [v6 accountStatusWithCompletionHandler:v8];
}

- (SHLCloudBackedContainer)cloudContainer
{
  return self->_cloudContainer;
}

- (void)setCloudContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end