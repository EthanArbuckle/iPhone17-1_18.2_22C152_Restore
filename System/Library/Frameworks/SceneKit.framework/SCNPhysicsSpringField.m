@interface SCNPhysicsSpringField
- (BOOL)supportsDirection;
- (c3dPhysicsField)_createField;
@end

@implementation SCNPhysicsSpringField

- (c3dPhysicsField)_createField
{
}

- (BOOL)supportsDirection
{
  return 0;
}

@end