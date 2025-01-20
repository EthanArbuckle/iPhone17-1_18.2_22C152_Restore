@interface SCNPhysicsRadialGravityField
- (BOOL)supportsDirection;
- (c3dPhysicsField)_createField;
@end

@implementation SCNPhysicsRadialGravityField

- (c3dPhysicsField)_createField
{
}

- (BOOL)supportsDirection
{
  return 0;
}

@end