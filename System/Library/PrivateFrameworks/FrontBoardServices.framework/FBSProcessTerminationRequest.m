@interface FBSProcessTerminationRequest
+ (id)requestForProcess:(id)a3 withLabel:(id)a4;
- (FBSProcess)process;
- (NSString)description;
- (NSString)explanation;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)exceptionCode;
- (int64_t)reportType;
- (unint64_t)options;
- (void)execute;
- (void)setExceptionCode:(int64_t)a3;
- (void)setExplanation:(id)a3;
- (void)setLabel:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setProcess:(id)a3;
- (void)setReportType:(int64_t)a3;
@end

@implementation FBSProcessTerminationRequest

+ (id)requestForProcess:(id)a3 withLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSProcessTerminationRequest requestForProcess:withLabel:](a2);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSProcessTerminationRequest requestForProcess:withLabel:](a2);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }

  id v9 = v7;
  v10 = v9;
  if (v9)
  {
    if (([v9 conformsToProtocol:&unk_1EED4B9A8] & 1) == 0)
    {
      v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(FBSProcess)]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[FBSProcessTerminationRequest requestForProcess:withLabel:](a2);
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
    }

    id v11 = objc_alloc_init((Class)a1);
    [v11 setLabel:v8];
    [v11 setProcess:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)execute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);
  [WeakRetained _terminateWithRequest:self forWatchdog:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[[objc_opt_class() allocWithZone:a3] init] autorelease];
  [v4 setLabel:self->_label];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);
  [v4 setProcess:WeakRetained];

  [v4 setOptions:self->_options];
  [v4 setReportType:self->_reportType];
  [v4 setExceptionCode:self->_exceptionCode];
  [v4 setExplanation:self->_explanation];
  return v4;
}

- (NSString)description
{
  return (NSString *)[(FBSProcessTerminationRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSProcessTerminationRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  [v3 appendString:self->_label withName:@"label"];
  int64_t exceptionCode = self->_exceptionCode;
  if (exceptionCode >= 1)
  {
    v5 = NSString;
    v6 = FBSProcessExceptionCodeDescription(exceptionCode);
    id v7 = [v5 stringWithFormat:@"%@ (0x%08X)", v6, self->_exceptionCode];

    [v3 appendString:v7 withName:@"exceptionCode"];
  }
  id v8 = (id)[v3 appendBool:self->_options & 1 withName:@"performGracefully" ifEqualTo:1];
  unint64_t reportType = self->_reportType;
  if (reportType > 2) {
    v10 = 0;
  }
  else {
    v10 = off_1E58F6FE8[reportType];
  }
  id v11 = (id)[v3 appendObject:v10 withName:@"reportType"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSProcessTerminationRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(FBSProcessTerminationRequest *)self succinctDescriptionBuilder];
  [v4 appendString:self->_explanation withName:@"explanation"];

  return v4;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (int64_t)reportType
{
  return self->_reportType;
}

- (void)setReportType:(int64_t)a3
{
  self->_unint64_t reportType = a3;
}

- (int64_t)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(int64_t)a3
{
  self->_int64_t exceptionCode = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (FBSProcess)process
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);

  return (FBSProcess *)WeakRetained;
}

- (void)setProcess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_destroyWeak((id *)&self->_process);
}

+ (void)requestForProcess:(const char *)a1 withLabel:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)requestForProcess:(const char *)a1 withLabel:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end