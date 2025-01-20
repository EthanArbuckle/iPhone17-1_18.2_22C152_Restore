@interface JavaLangReflectAccessibleObject
+ (const)__metadata;
+ (void)setAccessibleWithJavaLangReflectAccessibleObjectArray:(id)a3 withBoolean:(BOOL)a4;
- (BOOL)isAccessible;
- (BOOL)isAnnotationPresentWithIOSClass:(id)a3;
- (JavaLangReflectAccessibleObject)init;
- (id)getAnnotationWithIOSClass:(id)a3;
- (id)getAnnotationsFromAccessor:(id)a3;
- (id)getDeclaredAnnotations;
- (id)toGenericString;
- (void)setAccessibleWithBoolean:(BOOL)a3;
@end

@implementation JavaLangReflectAccessibleObject

- (JavaLangReflectAccessibleObject)init
{
  self->accessible_ = 0;
  return self;
}

- (BOOL)isAccessible
{
  return self->accessible_;
}

- (void)setAccessibleWithBoolean:(BOOL)a3
{
  self->accessible_ = a3;
}

+ (void)setAccessibleWithJavaLangReflectAccessibleObjectArray:(id)a3 withBoolean:(BOOL)a4
{
}

- (id)getAnnotationWithIOSClass:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  v4 = [(JavaLangReflectAccessibleObject *)self getAnnotations];
  uint64_t v5 = v4[2];
  if ((int)v5 < 1) {
    return 0;
  }
  for (i = v4; ; i += 2)
  {
    v7 = (void *)*((void *)i + 3);
    if ([a3 isInstance:v7]) {
      break;
    }
    if (!--v5) {
      return 0;
    }
  }
  return v7;
}

- (id)getDeclaredAnnotations
{
  return 0;
}

- (BOOL)isAnnotationPresentWithIOSClass:(id)a3
{
  return [(JavaLangReflectAccessibleObject *)self getAnnotationWithIOSClass:a3] != 0;
}

- (id)getAnnotationsFromAccessor:(id)a3
{
  if (a3)
  {
    v4 = +[IOSObjectArray arrayWithLength:0 type:NSObject_class_()];
    return [a3 invokeWithId:0 withNSObjectArray:v4];
  }
  else
  {
    uint64_t v6 = JavaLangAnnotationAnnotation_class_();
    return +[IOSObjectArray arrayWithLength:0 type:v6];
  }
}

- (id)toGenericString
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100477CD0;
}

@end