@interface FBSWorkspaceSceneRequestOptions
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isClientFuture;
- (BOOL)isKeyboardScene;
- (FBSSceneClientSettings)initialClientSettings;
- (FBSSceneSettings)initialSettings;
- (FBSSceneSpecification)specification;
- (FBSSceneTransitionContext)transitionContext;
- (FBSWorkspaceSceneRequestOptions)initWithBSXPCCoder:(id)a3;
- (NSString)identifier;
- (NSString)workspaceIdentifier;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setClientFuture:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitialClientSettings:(id)a3;
- (void)setInitialSettings:(id)a3;
- (void)setKeyboardScene:(BOOL)a3;
- (void)setSpecification:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setWorkspaceIdentifier:(id)a3;
@end

@implementation FBSWorkspaceSceneRequestOptions

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"id"];
  [v7 encodeObject:self->_workspaceIdentifier forKey:@"workspace"];
  [v7 encodeObject:self->_initialClientSettings forKey:@"client"];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v7 encodeObject:v6 forKey:@"spec"];

  [v7 encodeObject:self->_initialSettings forKey:@"settings"];
  [v7 encodeObject:self->_transitionContext forKey:@"transition"];
  [v7 encodeBool:self->_keyboardScene forKey:@"kb"];
  [v7 encodeBool:self->_clientFuture forKey:@"cf"];
}

- (FBSWorkspaceSceneRequestOptions)initWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FBSWorkspaceSceneRequestOptions;
  v6 = [(FBSWorkspaceSceneRequestOptions *)&v25 init];
  if (v6)
  {
    id v7 = [v5 decodeStringForKey:@"spec"];
    v8 = v7;
    if (v7)
    {
      Class v9 = NSClassFromString(v7);
      if (v9)
      {
        v10 = v9;
        if ([(objc_class *)v9 isSubclassOfClass:objc_opt_class()])
        {
LABEL_8:
          uint64_t v12 = [v5 decodeStringForKey:@"id"];
          identifier = v6->_identifier;
          v6->_identifier = (NSString *)v12;

          uint64_t v14 = [v5 decodeStringForKey:@"workspace"];
          workspaceIdentifier = v6->_workspaceIdentifier;
          v6->_workspaceIdentifier = (NSString *)v14;

          v16 = (FBSSceneSpecification *)objc_alloc_init(v10);
          specification = v6->_specification;
          v6->_specification = v16;

          uint64_t v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"client"];
          initialClientSettings = v6->_initialClientSettings;
          v6->_initialClientSettings = (FBSSceneClientSettings *)v18;

          uint64_t v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"settings"];
          initialSettings = v6->_initialSettings;
          v6->_initialSettings = (FBSSceneSettings *)v20;

          uint64_t v22 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"transition"];
          transitionContext = v6->_transitionContext;
          v6->_transitionContext = (FBSSceneTransitionContext *)v22;

          v6->_keyboardScene = [v5 decodeBoolForKey:@"kb"];
          v6->_clientFuture = [v5 decodeBoolForKey:@"cf"];

          goto LABEL_9;
        }
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, v6, @"FBSWorkspaceSceneRequestOptions.m", 64, @"Decoded specification \"%@\" is not a subclass of FBSSceneSpecification", v8 object file lineNumber description];
      }
      else
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, v6, @"FBSWorkspaceSceneRequestOptions.m", 61, @"Decoded specification class name \"%@\" but could not resolve it via NSClassFromString()", v8 object file lineNumber description];
      }
    }
    v10 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)workspaceIdentifier
{
  return self->_workspaceIdentifier;
}

- (void)setWorkspaceIdentifier:(id)a3
{
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
}

- (FBSSceneClientSettings)initialClientSettings
{
  return self->_initialClientSettings;
}

- (void)setInitialClientSettings:(id)a3
{
}

- (BOOL)isKeyboardScene
{
  return self->_keyboardScene;
}

- (void)setKeyboardScene:(BOOL)a3
{
  self->_keyboardScene = a3;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (FBSSceneSettings)initialSettings
{
  return self->_initialSettings;
}

- (void)setInitialSettings:(id)a3
{
}

- (BOOL)isClientFuture
{
  return self->_clientFuture;
}

- (void)setClientFuture:(BOOL)a3
{
  self->_clientFuture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSettings, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_initialClientSettings, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_workspaceIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end