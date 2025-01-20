@interface JavaUtilMissingResourceException
+ (const)__metadata;
- (JavaUtilMissingResourceException)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
- (id)getClassName;
- (id)getKey;
- (void)dealloc;
@end

@implementation JavaUtilMissingResourceException

- (JavaUtilMissingResourceException)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  return self;
}

- (id)getClassName
{
  return self->className__;
}

- (id)getKey
{
  return self->key_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilMissingResourceException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F58F8;
}

@end