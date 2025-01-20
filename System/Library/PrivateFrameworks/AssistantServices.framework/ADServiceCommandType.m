@interface ADServiceCommandType
+ (id)_serviceCommandTypeWithDomainName:(id)a3 className:(id)a4;
+ (id)domainObjectCancelTypeForDomainNamed:(id)a3;
+ (id)domainObjectCommitTypeForDomainNamed:(id)a3;
+ (id)domainObjectCreateTypeForDomainNamed:(id)a3;
+ (id)domainObjectDeleteTypeForDomainNamed:(id)a3;
+ (id)domainObjectRetrieveTypeForDomainNamed:(id)a3;
+ (id)domainObjectUpdateTypeForDomainNamed:(id)a3;
- (ADServiceCommandType)initWithDomainName:(id)a3 className:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServiceCommandType:(id)a3;
- (id)className;
- (id)description;
- (id)domainName;
- (id)qualifiedCommandName;
- (unint64_t)hash;
@end

@implementation ADServiceCommandType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domainName hash];
  return [(NSString *)self->_className hash] ^ v3;
}

- (BOOL)isEqualToServiceCommandType:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    domainName = self->_domainName;
    v7 = [v4 domainName];
    if ([(NSString *)domainName isEqualToString:v7])
    {
      className = self->_className;
      v9 = [v5 className];
      unsigned __int8 v10 = [(NSString *)className isEqualToString:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(ADServiceCommandType *)self isEqualToServiceCommandType:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(ADServiceCommandType *)self qualifiedCommandName];
  BOOL v5 = +[NSString stringWithFormat:@"<%@: %p %@>", v3, self, v4];

  return v5;
}

- (id)qualifiedCommandName
{
  uint64_t v3 = [(NSString *)self->_domainName stringByAppendingString:@"#"];
  id v4 = [v3 stringByAppendingString:self->_className];

  return v4;
}

- (id)className
{
  return self->_className;
}

- (id)domainName
{
  return self->_domainName;
}

- (ADServiceCommandType)initWithDomainName:(id)a3 className:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ADServiceCommandType;
  v8 = [(ADServiceCommandType *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    domainName = v8->_domainName;
    v8->_domainName = v9;

    v11 = (NSString *)[v7 copy];
    className = v8->_className;
    v8->_className = v11;
  }
  return v8;
}

+ (id)domainObjectCommitTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectCommitClassIdentifier];
}

+ (id)domainObjectCancelTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectCancelClassIdentifier];
}

+ (id)domainObjectDeleteTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectDeleteClassIdentifier];
}

+ (id)domainObjectUpdateTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectUpdateClassIdentifier];
}

+ (id)domainObjectRetrieveTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectRetrieveClassIdentifier];
}

+ (id)domainObjectCreateTypeForDomainNamed:(id)a3
{
  return _[a1 _serviceCommandTypeWithDomainName:a3 className:SADomainObjectCreateClassIdentifier];
}

+ (id)_serviceCommandTypeWithDomainName:(id)a3 className:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithDomainName:v7 className:v6];

  return v8;
}

@end