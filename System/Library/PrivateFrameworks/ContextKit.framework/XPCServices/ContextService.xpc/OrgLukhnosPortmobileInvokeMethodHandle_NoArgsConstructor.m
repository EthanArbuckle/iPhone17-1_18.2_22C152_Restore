@interface OrgLukhnosPortmobileInvokeMethodHandle_NoArgsConstructor
- (OrgLukhnosPortmobileInvokeMethodHandle_NoArgsConstructor)initWithIOSClass:(id)a3;
- (id)invokeExact;
- (void)dealloc;
@end

@implementation OrgLukhnosPortmobileInvokeMethodHandle_NoArgsConstructor

- (OrgLukhnosPortmobileInvokeMethodHandle_NoArgsConstructor)initWithIOSClass:(id)a3
{
  return self;
}

- (id)invokeExact
{
  clazz = self->clazz_;
  if (!clazz) {
    JreThrowNullPointerException();
  }
  return [(IOSClass *)clazz newInstance];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgLukhnosPortmobileInvokeMethodHandle_NoArgsConstructor;
  [(OrgLukhnosPortmobileInvokeMethodHandle_NoArgsConstructor *)&v3 dealloc];
}

@end