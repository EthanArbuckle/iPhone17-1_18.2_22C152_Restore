@interface CSAction
+ (id)actionWithContext:(id)a3;
+ (id)actionWithType:(int64_t)a3;
+ (id)actionWithType:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)animated;
- (SBFLockScreenActionContext)context;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)setAnimated:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CSAction

+ (id)actionWithType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setType:a3];

  return v4;
}

+ (id)actionWithType:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a1 actionWithType:a3];
  [v5 setAnimated:v4];

  return v5;
}

+ (id)actionWithContext:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Sbflockscreena.isa);
  if (!v5)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[CSAction actionWithContext:](a2);
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D84DBCC4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:SBFLockScreenActionContextClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[CSAction actionWithContext:](a2);
    }
    goto LABEL_11;
  }

  id v6 = objc_alloc_init((Class)a1);
  [v6 setContext:v5];

  return v6;
}

- (id)description
{
  return [(CSAction *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CSAction *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  BOOL v4 = NSStringFromCoverSheetActionType(self->_type);
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  id v6 = (id)[v3 appendBool:self->_animated withName:@"animated" ifEqualTo:1];
  id v7 = (id)[v3 appendObject:self->_context withName:@"context" skipIfNil:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSAction *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (SBFLockScreenActionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)actionWithContext:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_1D839D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end