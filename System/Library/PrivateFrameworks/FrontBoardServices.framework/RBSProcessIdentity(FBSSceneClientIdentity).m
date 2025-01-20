@interface RBSProcessIdentity(FBSSceneClientIdentity)
- (id)fbs_sceneClientIdentity;
@end

@implementation RBSProcessIdentity(FBSSceneClientIdentity)

- (id)fbs_sceneClientIdentity
{
  return +[FBSSceneClientIdentity identityForProcessIdentity:a1];
}

@end