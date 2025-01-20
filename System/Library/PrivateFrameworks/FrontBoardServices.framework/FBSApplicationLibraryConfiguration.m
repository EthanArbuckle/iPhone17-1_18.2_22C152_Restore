@interface FBSApplicationLibraryConfiguration
- (BOOL)allowConcurrentLoading;
- (BOOL)isPersonaAware;
- (Class)applicationInfoClass;
- (Class)applicationPlaceholderClass;
- (FBSApplicationLibraryConfiguration)init;
- (id)applicationIdentityFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)installedApplicationFilter;
- (id)placeholderFilter;
- (id)placeholderIdentityFilter;
- (void)setAllowConcurrentLoading:(BOOL)a3;
- (void)setApplicationIdentityFilter:(id)a3;
- (void)setApplicationInfoClass:(Class)a3;
- (void)setApplicationPlaceholderClass:(Class)a3;
- (void)setInstalledApplicationFilter:(id)a3;
- (void)setPersonaAware:(BOOL)a3;
- (void)setPlaceholderFilter:(id)a3;
- (void)setPlaceholderIdentityFilter:(id)a3;
@end

@implementation FBSApplicationLibraryConfiguration

- (FBSApplicationLibraryConfiguration)init
{
  v10.receiver = self;
  v10.super_class = (Class)FBSApplicationLibraryConfiguration;
  v2 = [(FBSApplicationLibraryConfiguration *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    Class applicationInfoClass = v2->_applicationInfoClass;
    v2->_Class applicationInfoClass = (Class)v3;

    uint64_t v5 = objc_opt_class();
    Class applicationPlaceholderClass = v2->_applicationPlaceholderClass;
    v2->_Class applicationPlaceholderClass = (Class)v5;

    *(_WORD *)&v2->_personaAware = 0;
    id installedApplicationFilter = v2->_installedApplicationFilter;
    v2->_id installedApplicationFilter = 0;

    id placeholderFilter = v2->_placeholderFilter;
    v2->_id placeholderFilter = 0;
  }
  return v2;
}

- (void)setApplicationInfoClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"Must specify a class that subclasses from FBSApplicationInfo : was passed %@", a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSApplicationLibraryConfiguration *)a2 setApplicationInfoClass:(uint64_t)v8];
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  Class applicationInfoClass = self->_applicationInfoClass;
  p_Class applicationInfoClass = &self->_applicationInfoClass;
  if (applicationInfoClass != a3)
  {
    objc_storeStrong((id *)p_applicationInfoClass, a3);
  }
}

- (void)setApplicationPlaceholderClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"Must specify a class that subclasses from FBSApplicationPlaceholder : was passed %@", a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSApplicationLibraryConfiguration *)a2 setApplicationPlaceholderClass:(uint64_t)v8];
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  Class applicationPlaceholderClass = self->_applicationPlaceholderClass;
  p_Class applicationPlaceholderClass = &self->_applicationPlaceholderClass;
  if (applicationPlaceholderClass != a3)
  {
    objc_storeStrong((id *)p_applicationPlaceholderClass, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(FBSApplicationLibraryConfiguration);
  [(FBSApplicationLibraryConfiguration *)v4 setApplicationInfoClass:self->_applicationInfoClass];
  [(FBSApplicationLibraryConfiguration *)v4 setApplicationPlaceholderClass:self->_applicationPlaceholderClass];
  [(FBSApplicationLibraryConfiguration *)v4 setAllowConcurrentLoading:self->_allowConcurrentLoading];
  [(FBSApplicationLibraryConfiguration *)v4 setInstalledApplicationFilter:self->_installedApplicationFilter];
  [(FBSApplicationLibraryConfiguration *)v4 setPlaceholderFilter:self->_placeholderFilter];
  [(FBSApplicationLibraryConfiguration *)v4 setApplicationIdentityFilter:self->_applicationIdentityFilter];
  [(FBSApplicationLibraryConfiguration *)v4 setPlaceholderIdentityFilter:self->_placeholderIdentityFilter];
  [(FBSApplicationLibraryConfiguration *)v4 setPersonaAware:self->_personaAware];
  return v4;
}

- (Class)applicationInfoClass
{
  return self->_applicationInfoClass;
}

- (Class)applicationPlaceholderClass
{
  return self->_applicationPlaceholderClass;
}

- (BOOL)isPersonaAware
{
  return self->_personaAware;
}

- (void)setPersonaAware:(BOOL)a3
{
  self->_personaAware = a3;
}

- (BOOL)allowConcurrentLoading
{
  return self->_allowConcurrentLoading;
}

- (void)setAllowConcurrentLoading:(BOOL)a3
{
  self->_allowConcurrentLoading = a3;
}

- (id)installedApplicationFilter
{
  return self->_installedApplicationFilter;
}

- (void)setInstalledApplicationFilter:(id)a3
{
}

- (id)placeholderFilter
{
  return self->_placeholderFilter;
}

- (void)setPlaceholderFilter:(id)a3
{
}

- (id)applicationIdentityFilter
{
  return self->_applicationIdentityFilter;
}

- (void)setApplicationIdentityFilter:(id)a3
{
}

- (id)placeholderIdentityFilter
{
  return self->_placeholderIdentityFilter;
}

- (void)setPlaceholderIdentityFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_placeholderIdentityFilter, 0);
  objc_storeStrong(&self->_applicationIdentityFilter, 0);
  objc_storeStrong(&self->_placeholderFilter, 0);
  objc_storeStrong(&self->_installedApplicationFilter, 0);
  objc_storeStrong((id *)&self->_applicationPlaceholderClass, 0);

  objc_storeStrong((id *)&self->_applicationInfoClass, 0);
}

- (void)setApplicationInfoClass:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"FBSApplicationLibraryConfiguration.m";
  __int16 v10 = 1024;
  int v11 = 36;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)setApplicationPlaceholderClass:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"FBSApplicationLibraryConfiguration.m";
  __int16 v10 = 1024;
  int v11 = 45;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end