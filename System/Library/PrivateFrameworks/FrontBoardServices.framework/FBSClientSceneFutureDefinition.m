@interface FBSClientSceneFutureDefinition
- (FBSClientSceneFutureDefinition)initWithWorkspaceID:(id)a3;
- (FBSMutableSceneParameters)parameters;
- (FBSSceneIdentity)identity;
- (FBSSceneSpecification)specification;
- (void)configureParameters:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSpecification:(id)a3;
@end

@implementation FBSClientSceneFutureDefinition

- (FBSClientSceneFutureDefinition)initWithWorkspaceID:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FBSClientSceneFutureDefinition;
  v5 = [(FBSClientSceneFutureDefinition *)&v13 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];
    uint64_t v8 = +[FBSSceneIdentity identityForIdentifier:v7 workspaceIdentifier:v4];
    identity = v5->_identity;
    v5->_identity = (FBSSceneIdentity *)v8;

    uint64_t v10 = +[FBSSceneSpecification specification];
    specification = v5->_specification;
    v5->_specification = (FBSSceneSpecification *)v10;
  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [v4 UUIDString];
  }
  v5 = [(FBSSceneIdentity *)self->_identity workspaceIdentifier];
  v6 = +[FBSSceneIdentity identityForIdentifier:v8 workspaceIdentifier:v5];
  identity = self->_identity;
  self->_identity = v6;
}

- (void)setSpecification:(id)a3
{
  id v4 = a3;
  if (self->_parameters)
  {
    v7 = [NSString stringWithFormat:@"cannot change specification after configuring parameters"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSClientSceneFutureDefinition setSpecification:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  id v8 = v4;
  if (v4)
  {
    v5 = (FBSSceneSpecification *)v4;
  }
  else
  {
    v5 = +[FBSSceneSpecification specification];
  }
  specification = self->_specification;
  self->_specification = v5;
}

- (void)configureParameters:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    v6 = +[FBSSceneParameters parametersForSpecification:self->_specification];
    v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  (*((void (**)(id, FBSMutableSceneParameters *))v4 + 2))(v4, parameters);
}

- (FBSMutableSceneParameters)parameters
{
  parameters = self->_parameters;
  if (!parameters)
  {
    id v4 = +[FBSSceneParameters parametersForSpecification:self->_specification];
    v5 = self->_parameters;
    self->_parameters = v4;

    parameters = self->_parameters;
  }

  return parameters;
}

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)setSpecification:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end