@interface CRAddressHandler
+ (id)addressHandlerWithPrincipalClass:(Class)a3;
- (CRAddressHandler)initWithAddressHandler:(id)a3;
- (CRAddressHandler)initWithPrincipalClass:(Class)a3;
- (CRAddressHandlerIdentity)identity;
- (id)addressFromExternalAddress:(id)a3 kind:(id)a4;
- (id)description;
- (id)externalAddressFromAddress:(id)a3 kind:(id)a4;
- (id)supportedAddressKinds;
- (id)syncKeyForAddress:(id)a3 kind:(id)a4;
- (void)dealloc;
- (void)setIdentity:(id)a3;
@end

@implementation CRAddressHandler

+ (id)addressHandlerWithPrincipalClass:(Class)a3
{
  id v3 = [objc_alloc((Class)a1) initWithPrincipalClass:a3];
  return v3;
}

- (CRAddressHandler)initWithPrincipalClass:(Class)a3
{
  id v3 = a3;
  if (a3)
  {
    if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___CRAddressHandler])
    {
      v5 = (CRAddressHandler *)objc_alloc_init(v3);
      id v3 = [(CRAddressHandler *)self initWithAddressHandler:v5];
      self = v5;
    }
    else
    {
      id v3 = 0;
    }
  }

  return (CRAddressHandler *)v3;
}

- (CRAddressHandler)initWithAddressHandler:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRAddressHandler;
  v4 = [(CRAddressHandler *)&v6 init];
  if (v4)
  {
    v4->_handler = (CRAddressHandler *)a3;
    v4->_identity = (CRAddressHandlerIdentity *)+[CRAddressHandlerIdentity identityForAddressHandler:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRAddressHandler;
  [(CRAddressHandler *)&v3 dealloc];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@:%p; %@ kinds={%@}>",
           v3,
           self,
           objc_opt_class(),
           objc_msgSend(objc_msgSend(-[CRAddressHandler supportedAddressKinds](self, "supportedAddressKinds"), "allObjects"), "componentsJoinedByString:", @","));
}

- (id)supportedAddressKinds
{
  return [(CRAddressHandlerIdentity *)self->_identity supportedAddressKinds];
}

- (id)syncKeyForAddress:(id)a3 kind:(id)a4
{
  return [(CRAddressHandler *)self->_handler syncKeyForAddress:a3 kind:a4];
}

- (id)addressFromExternalAddress:(id)a3 kind:(id)a4
{
  return [(CRAddressHandler *)self->_handler addressFromExternalAddress:a3 kind:a4];
}

- (id)externalAddressFromAddress:(id)a3 kind:(id)a4
{
  return [(CRAddressHandler *)self->_handler externalAddressFromAddress:a3 kind:a4];
}

- (CRAddressHandlerIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

@end