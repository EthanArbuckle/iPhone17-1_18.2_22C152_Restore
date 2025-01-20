@interface CRAddressHandlerIdentity
+ (id)identityForAddressHandler:(id)a3;
- (NSSet)supportedAddressKinds;
- (id)description;
- (id)initForAddressHandler:(id)a3;
- (void)dealloc;
- (void)setSupportedAddressKinds:(id)a3;
@end

@implementation CRAddressHandlerIdentity

+ (id)identityForAddressHandler:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initForAddressHandler:a3];
  return v3;
}

- (id)initForAddressHandler:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRAddressHandlerIdentity;
  v4 = [(CRAddressHandlerIdentity *)&v7 init];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v4->_className = NSStringFromClass(v5);
    v4->_supportedAddressKinds = (NSSet *)objc_msgSend(objc_msgSend(a3, "supportedAddressKinds"), "copy");
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRAddressHandlerIdentity;
  [(CRAddressHandlerIdentity *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@:%p; %@ kinds={%@}>",
           objc_opt_class(),
           self,
           self->_className,
           [(NSArray *)[(NSSet *)self->_supportedAddressKinds allObjects] componentsJoinedByString:@","]);
}

- (NSSet)supportedAddressKinds
{
  return self->_supportedAddressKinds;
}

- (void)setSupportedAddressKinds:(id)a3
{
}

@end