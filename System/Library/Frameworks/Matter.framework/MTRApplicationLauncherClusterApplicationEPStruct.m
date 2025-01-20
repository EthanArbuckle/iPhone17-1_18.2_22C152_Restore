@interface MTRApplicationLauncherClusterApplicationEPStruct
- (MTRApplicationLauncherClusterApplicationEPStruct)init;
- (MTRApplicationLauncherClusterApplicationStruct)application;
- (NSNumber)endpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setApplication:(MTRApplicationLauncherClusterApplicationStruct *)application;
- (void)setEndpoint:(NSNumber *)endpoint;
@end

@implementation MTRApplicationLauncherClusterApplicationEPStruct

- (MTRApplicationLauncherClusterApplicationEPStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRApplicationLauncherClusterApplicationEPStruct;
  v2 = [(MTRApplicationLauncherClusterApplicationEPStruct *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    application = v2->_application;
    v2->_application = (MTRApplicationLauncherClusterApplicationStruct *)v3;

    endpoint = v2->_endpoint;
    v2->_endpoint = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRApplicationLauncherClusterApplicationEPStruct);
  objc_super v7 = objc_msgSend_application(self, v5, v6);
  objc_msgSend_setApplication_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_endpoint(self, v9, v10);
  objc_msgSend_setEndpoint_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: application:%@; endpoint:%@; >",
    v5,
    self->_application,
  objc_super v7 = self->_endpoint);

  return v7;
}

- (MTRApplicationLauncherClusterApplicationStruct)application
{
  return self->_application;
}

- (void)setApplication:(MTRApplicationLauncherClusterApplicationStruct *)application
{
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end