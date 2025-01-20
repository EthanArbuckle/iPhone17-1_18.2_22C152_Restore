@interface JavaBeansPropertyChangeListenerProxy
+ (const)__metadata;
- (JavaBeansPropertyChangeListenerProxy)initWithNSString:(id)a3 withJavaBeansPropertyChangeListener:(id)a4;
- (id)getPropertyName;
- (void)dealloc;
- (void)propertyChangeWithJavaBeansPropertyChangeEvent:(id)a3;
@end

@implementation JavaBeansPropertyChangeListenerProxy

- (JavaBeansPropertyChangeListenerProxy)initWithNSString:(id)a3 withJavaBeansPropertyChangeListener:(id)a4
{
  return self;
}

- (id)getPropertyName
{
  return self->propertyName_;
}

- (void)propertyChangeWithJavaBeansPropertyChangeEvent:(id)a3
{
  id v4 = [(JavaUtilEventListenerProxy *)self getListener];
  v5 = (void *)JavaBeansPropertyChangeListener_class_();
  if (!v4) {
    JreThrowNullPointerException();
  }
  if (([v5 isInstance:v4] & 1) == 0) {
    JreThrowClassCastException();
  }
  [v4 propertyChangeWithJavaBeansPropertyChangeEvent:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaBeansPropertyChangeListenerProxy;
  [(JavaUtilEventListenerProxy *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F9EB0;
}

@end