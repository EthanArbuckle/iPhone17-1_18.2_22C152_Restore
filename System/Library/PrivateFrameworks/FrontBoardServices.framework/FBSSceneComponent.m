@interface FBSSceneComponent
- (BOOL)isValid;
- (FBSSceneComponent)initWithScene:(id)a3;
- (id)clientScene;
- (id)hostScene;
- (id)scene;
- (void)invalidate;
- (void)setScene:(id)a3;
@end

@implementation FBSSceneComponent

- (id)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  v5 = (FBSComponentScene *)a3;
  if (!v5)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSSceneComponent *)a2 setScene:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  scene = self->_scene;
  self->_scene = v5;

  MEMORY[0x1F41817F8](v5, scene);
}

- (FBSSceneComponent)initWithScene:(id)a3
{
  id v5 = a3;
  v6 = [(FBSSceneComponent *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scene, a3);
  }

  return v7;
}

- (id)clientScene
{
  scene = self->_scene;
  uint64_t v3 = objc_opt_class();
  v4 = scene;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)hostScene
{
  scene = self->_scene;
  Class v3 = NSClassFromString(&cfstr_Fbscene.isa);
  v4 = scene;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
  scene = self->_scene;
  self->_scene = 0;

  self->_invalid = 1;
}

- (BOOL)isValid
{
  return !self->_invalid;
}

- (void)setScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSSceneComponent.m";
  __int16 v16 = 1024;
  int v17 = 33;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end