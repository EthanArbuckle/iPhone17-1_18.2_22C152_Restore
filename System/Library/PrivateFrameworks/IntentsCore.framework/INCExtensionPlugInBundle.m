@interface INCExtensionPlugInBundle
- (Class)principalClass;
- (INCExtensionPlugInBundle)initWithPrincipalClass:(Class)a3 intentsSupported:(id)a4 intentsRestrictedWhileLocked:(id)a5;
- (NSSet)intentsRestrictedWhileLocked;
- (NSSet)intentsSupported;
@end

@implementation INCExtensionPlugInBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentsRestrictedWhileLocked, 0);
  objc_storeStrong((id *)&self->_intentsSupported, 0);
  objc_storeStrong((id *)&self->_principalClass, 0);
}

- (NSSet)intentsRestrictedWhileLocked
{
  return self->_intentsRestrictedWhileLocked;
}

- (NSSet)intentsSupported
{
  return self->_intentsSupported;
}

- (Class)principalClass
{
  return self->_principalClass;
}

- (INCExtensionPlugInBundle)initWithPrincipalClass:(Class)a3 intentsSupported:(id)a4 intentsRestrictedWhileLocked:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INCExtensionPlugInBundle;
  v10 = [(INCExtensionPlugInBundle *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_principalClass, a3);
    uint64_t v12 = [v8 copy];
    intentsSupported = v11->_intentsSupported;
    v11->_intentsSupported = (NSSet *)v12;

    uint64_t v14 = [v9 copy];
    intentsRestrictedWhileLocked = v11->_intentsRestrictedWhileLocked;
    v11->_intentsRestrictedWhileLocked = (NSSet *)v14;
  }
  return v11;
}

@end