@interface IDSGroupContextControllerContent
- (ENAccountIdentity)accountIdentity;
- (ENGroupContext)groupContext;
- (IDSCloudKitContainer)cloudKitContainer;
- (void)setAccountIdentity:(id)a3;
- (void)setCloudKitContainer:(id)a3;
- (void)setGroupContext:(id)a3;
@end

@implementation IDSGroupContextControllerContent

- (IDSCloudKitContainer)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (void)setCloudKitContainer:(id)a3
{
}

- (ENGroupContext)groupContext
{
  return self->_groupContext;
}

- (void)setGroupContext:(id)a3
{
}

- (ENAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (void)setAccountIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentity, 0);
  objc_storeStrong((id *)&self->_groupContext, 0);

  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
}

@end