@interface SHLCloudEncryptionPrecondition
- (SHLCloudBackedContainer)cloudContainer;
- (SHLCloudEncryptionPrecondition)initWithContainer:(id)a3;
- (void)evaluatePreconditionWithCompletion:(id)a3;
- (void)setCloudContainer:(id)a3;
@end

@implementation SHLCloudEncryptionPrecondition

- (SHLCloudEncryptionPrecondition)initWithContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudEncryptionPrecondition;
  v6 = [(SHLCloudEncryptionPrecondition *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudContainer, a3);
  }

  return v7;
}

- (void)evaluatePreconditionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SHLCloudEncryptionPrecondition *)self cloudContainer];
  v6 = [v5 container];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000245D4;
  v8[3] = &unk_1000756F8;
  id v9 = v4;
  id v7 = v4;
  [v6 accountInfoWithCompletionHandler:v8];
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