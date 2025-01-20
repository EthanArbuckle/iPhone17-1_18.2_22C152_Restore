@interface ARSkeleton
- (ARSkeletonDefinition)definition;
- (BOOL)isJointTracked:(NSInteger)jointIndex;
- (NSUInteger)jointCount;
- (id)initPrivate;
@end

@implementation ARSkeleton

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)ARSkeleton;
  return [(ARSkeleton *)&v3 init];
}

- (BOOL)isJointTracked:(NSInteger)jointIndex
{
  return 0;
}

- (ARSkeletonDefinition)definition
{
  return self->_definition;
}

- (NSUInteger)jointCount
{
  return self->_jointCount;
}

- (void).cxx_destruct
{
}

@end