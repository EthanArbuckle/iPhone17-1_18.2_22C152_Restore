@interface SCNPhysicsElectricField
- (BOOL)supportsDirection;
- (c3dPhysicsField)_createField;
@end

@implementation SCNPhysicsElectricField

- (c3dPhysicsField)_createField
{
}

- (BOOL)supportsDirection
{
  return 0;
}

@end