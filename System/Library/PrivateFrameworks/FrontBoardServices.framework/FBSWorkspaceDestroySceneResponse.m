@interface FBSWorkspaceDestroySceneResponse
- (FBSWorkspaceDestroySceneResponse)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation FBSWorkspaceDestroySceneResponse

- (FBSWorkspaceDestroySceneResponse)initWithXPCDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBSWorkspaceDestroySceneResponse;
  return [(FBSWorkspaceResponse *)&v4 initWithXPCDictionary:a3];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBSWorkspaceDestroySceneResponse;
  [(FBSWorkspaceResponse *)&v3 encodeWithXPCDictionary:a3];
}

@end