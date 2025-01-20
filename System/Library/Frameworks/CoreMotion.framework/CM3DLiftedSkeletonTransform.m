@interface CM3DLiftedSkeletonTransform
- (__n128)position;
- (int)type;
- (void)setPosition:(CM3DLiftedSkeletonTransform *)self;
- (void)setType:(int)a3;
@end

@implementation CM3DLiftedSkeletonTransform

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (__n128)position
{
  return a1[1];
}

- (void)setPosition:(CM3DLiftedSkeletonTransform *)self
{
  *(_OWORD *)&self->_position[4] = v2;
}

@end