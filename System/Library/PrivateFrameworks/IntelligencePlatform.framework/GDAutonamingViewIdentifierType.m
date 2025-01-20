@interface GDAutonamingViewIdentifierType
+ (id)phPerson;
- (GDAutonamingViewIdentifierType)initWithInner:(id)a3;
- (id)getInner;
@end

@implementation GDAutonamingViewIdentifierType

- (void).cxx_destruct
{
}

- (id)getInner
{
  return self->_inner;
}

- (GDAutonamingViewIdentifierType)initWithInner:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAutonamingViewIdentifierType;
  v6 = [(GDAutonamingViewIdentifierType *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inner, a3);
  }

  return v7;
}

+ (id)phPerson
{
  v2 = [GDAutonamingViewIdentifierType alloc];
  v7 = objc_msgSend_phPerson(GDAutonamingViewIdentifierTypeInner, v3, v4, v5, v6);
  v11 = objc_msgSend_initWithInner_(v2, v8, (uint64_t)v7, v9, v10);

  return v11;
}

@end