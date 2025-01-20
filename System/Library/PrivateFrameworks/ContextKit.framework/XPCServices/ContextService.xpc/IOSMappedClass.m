@interface IOSMappedClass
- (BOOL)isAnonymousClass;
- (BOOL)isEnum;
- (IOSMappedClass)initWithClass:(Class)a3 package:(id)a4 name:(id)a5;
- (id)getConstructors;
- (id)getDeclaredConstructors;
- (id)getName;
- (id)getPackage;
- (id)getSimpleName;
- (id)objcName;
- (void)collectMethods:(id)a3 publicOnly:(BOOL)a4;
@end

@implementation IOSMappedClass

- (IOSMappedClass)initWithClass:(Class)a3 package:(id)a4 name:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IOSMappedClass;
  v7 = [(IOSConcreteClass *)&v9 initWithClass:a3];
  if (v7)
  {
    v7->package_ = (NSString *)a4;
    v7->name_ = (NSString *)a5;
  }
  return v7;
}

- (id)getName
{
  return +[NSString stringWithFormat:@"%@.%@", self->package_, self->name_];
}

- (id)getSimpleName
{
  return self->name_;
}

- (id)objcName
{
  return NSStringFromClass(self->super.class_);
}

- (id)getPackage
{
  v2 = [[JavaLangPackage alloc] initWithNSString:self->package_ withNSString:0 withNSString:0 withNSString:0 withNSString:0 withNSString:0 withNSString:0 withJavaNetURL:0];
  return v2;
}

- (void)collectMethods:(id)a3 publicOnly:(BOOL)a4
{
}

- (id)getDeclaredConstructors
{
  id v3 = +[NSMutableDictionary dictionary];
  sub_10028DD60(self, v3, 0, 1);
  id v4 = [v3 allValues];
  uint64_t v5 = JavaLangReflectMethod_class_();
  return +[IOSObjectArray arrayWithNSArray:v4 type:v5];
}

- (id)getConstructors
{
  id v3 = +[NSMutableDictionary dictionary];
  sub_10028DD60(self, v3, 1, 1);
  id v4 = [v3 allValues];
  uint64_t v5 = JavaLangReflectMethod_class_();
  return +[IOSObjectArray arrayWithNSArray:v4 type:v5];
}

- (BOOL)isEnum
{
  return 0;
}

- (BOOL)isAnonymousClass
{
  return 0;
}

@end