@interface JavaBeansPropertyChangeEvent
+ (const)__metadata;
- (JavaBeansPropertyChangeEvent)initWithId:(id)a3 withNSString:(id)a4 withId:(id)a5 withId:(id)a6;
- (id)getNewValue;
- (id)getOldValue;
- (id)getPropagationId;
- (id)getPropertyName;
- (void)dealloc;
- (void)setPropagationIdWithId:(id)a3;
@end

@implementation JavaBeansPropertyChangeEvent

- (JavaBeansPropertyChangeEvent)initWithId:(id)a3 withNSString:(id)a4 withId:(id)a5 withId:(id)a6
{
  return self;
}

- (id)getPropertyName
{
  return self->propertyName_;
}

- (void)setPropagationIdWithId:(id)a3
{
}

- (id)getPropagationId
{
  return self->propagationId_;
}

- (id)getOldValue
{
  return self->oldValue_;
}

- (id)getNewValue
{
  return self->newValue_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaBeansPropertyChangeEvent;
  [(JavaUtilEventObject *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045DC08;
}

@end