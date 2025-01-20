@interface IRServiceIdentifierMapping
- (IRServiceIdentifierMapping)initWithServicePackage:(int64_t)a3 observerClientIdentifiers:(id)a4;
- (NSArray)observerClientIdentifiers;
- (int64_t)servicePackage;
- (void)setObserverClientIdentifiers:(id)a3;
- (void)setServicePackage:(int64_t)a3;
@end

@implementation IRServiceIdentifierMapping

- (void).cxx_destruct
{
}

- (NSArray)observerClientIdentifiers
{
  return self->_observerClientIdentifiers;
}

- (IRServiceIdentifierMapping)initWithServicePackage:(int64_t)a3 observerClientIdentifiers:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRServiceIdentifierMapping;
  v7 = [(IRServiceIdentifierMapping *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(IRServiceIdentifierMapping *)v7 setServicePackage:a3];
    v9 = (void *)[v6 copy];
    [(IRServiceIdentifierMapping *)v8 setObserverClientIdentifiers:v9];
  }
  return v8;
}

- (void)setServicePackage:(int64_t)a3
{
  self->_servicePackage = a3;
}

- (void)setObserverClientIdentifiers:(id)a3
{
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

@end