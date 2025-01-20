@interface SCNPhysicsDragField
- (BOOL)supportsDirection;
- (BOOL)supportsOffset;
- (c3dPhysicsField)_createField;
@end

@implementation SCNPhysicsDragField

- (c3dPhysicsField)_createField
{
}

- (BOOL)supportsDirection
{
  return 0;
}

- (BOOL)supportsOffset
{
  return 0;
}

@end