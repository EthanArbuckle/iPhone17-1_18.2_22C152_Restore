@interface MEMailAppExtensionObserverCriteria
- (BOOL)includeDisabled;
- (MEMailAppExtensionObserverCriteria)initWithCapabilities:(id)a3 includeDisabled:(BOOL)a4;
- (NSArray)capabilities;
@end

@implementation MEMailAppExtensionObserverCriteria

- (MEMailAppExtensionObserverCriteria)initWithCapabilities:(id)a3 includeDisabled:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MEMailAppExtensionObserverCriteria;
  v8 = [(MEMailAppExtensionObserverCriteria *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_capabilities, a3);
    v9->_includeDisabled = a4;
  }

  return v9;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (BOOL)includeDisabled
{
  return self->_includeDisabled;
}

- (void).cxx_destruct
{
}

@end