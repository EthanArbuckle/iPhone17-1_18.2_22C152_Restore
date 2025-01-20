@interface ODRInstallContext
- (ODRInstallContext)init;
@end

@implementation ODRInstallContext

- (ODRInstallContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODRInstallContext;
  v2 = [(ODRInstallContext *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9appstored6LogKey);
    logKey = v2->_logKey;
    v2->_logKey = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_responsibleClientID, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_coordinatorID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end