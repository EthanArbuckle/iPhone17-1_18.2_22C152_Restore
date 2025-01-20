@interface JavaUtilConcurrentConcurrentHashMap_Segment
+ (const)__metadata;
- (JavaUtilConcurrentConcurrentHashMap_Segment)initWithFloat:(float)a3;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_Segment

- (JavaUtilConcurrentConcurrentHashMap_Segment)initWithFloat:(float)a3
{
  self->loadFactor_ = a3;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041ECB8;
}

@end