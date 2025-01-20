@interface _UIKeyboardSceneSpecification
- (BOOL)isInternal;
- (id)uiSceneSessionRole;
@end

@implementation _UIKeyboardSceneSpecification

- (id)uiSceneSessionRole
{
  return (id)*MEMORY[0x263F83E40];
}

- (BOOL)isInternal
{
  return 1;
}

@end