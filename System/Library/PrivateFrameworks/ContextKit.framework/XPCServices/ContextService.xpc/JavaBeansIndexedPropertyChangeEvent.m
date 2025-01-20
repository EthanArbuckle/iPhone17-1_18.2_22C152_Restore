@interface JavaBeansIndexedPropertyChangeEvent
+ (const)__metadata;
- (JavaBeansIndexedPropertyChangeEvent)initWithId:(id)a3 withNSString:(id)a4 withId:(id)a5 withId:(id)a6 withInt:(int)a7;
- (int)getIndex;
@end

@implementation JavaBeansIndexedPropertyChangeEvent

- (JavaBeansIndexedPropertyChangeEvent)initWithId:(id)a3 withNSString:(id)a4 withId:(id)a5 withId:(id)a6 withInt:(int)a7
{
  self->index_ = a7;
  return self;
}

- (int)getIndex
{
  return self->index_;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040FA60;
}

@end