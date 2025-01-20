@interface OrgLukhnosPortmobileInvokeMethodType
+ (id)methodTypeWithIOSClass:(id)a3;
- (OrgLukhnosPortmobileInvokeMethodType)initWithIOSClass:(id)a3;
- (id)getType;
- (void)dealloc;
@end

@implementation OrgLukhnosPortmobileInvokeMethodType

- (OrgLukhnosPortmobileInvokeMethodType)initWithIOSClass:(id)a3
{
  return self;
}

+ (id)methodTypeWithIOSClass:(id)a3
{
  return OrgLukhnosPortmobileInvokeMethodType_methodTypeWithIOSClass_(a3);
}

- (id)getType
{
  return self->clazz_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgLukhnosPortmobileInvokeMethodType;
  [(OrgLukhnosPortmobileInvokeMethodType *)&v3 dealloc];
}

@end