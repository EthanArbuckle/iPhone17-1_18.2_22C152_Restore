@interface FBSShutdownOptions
- (BOOL)isReboot;
- (BOOL)isShutdown;
- (BOOL)isUserInitiated;
- (FBSShutdownOptions)init;
- (FBSShutdownOptions)initWithReason:(id)a3;
- (FBSShutdownOptions)initWithXPCDictionary:(id)a3;
- (NSCopying)localContext;
- (NSString)description;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)LPEMOption;
- (int64_t)rebootType;
- (int64_t)source;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setLPEMOption:(int64_t)a3;
- (void)setLocalContext:(id)a3;
- (void)setRebootType:(int64_t)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation FBSShutdownOptions

- (FBSShutdownOptions)init
{
  v4 = [NSString stringWithFormat:@"Please use \"-[FBSShutdownOptions initWithReason:] instead."];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSShutdownOptions.m";
    __int16 v16 = 1024;
    int v17 = 17;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSShutdownOptions)initWithReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"FBSShutdownOptions.m", 22, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)FBSShutdownOptions;
  v6 = [(FBSShutdownOptions *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    reason = v6->_reason;
    v6->_reason = (NSString *)v7;
  }
  return v6;
}

- (BOOL)isShutdown
{
  return self->_rebootType == 0;
}

- (BOOL)isReboot
{
  return (unint64_t)(self->_rebootType - 1) < 2;
}

- (BOOL)isUserInitiated
{
  return self->_source == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [FBSShutdownOptions alloc];
  v6 = (void *)[(NSString *)self->_reason copyWithZone:a3];
  uint64_t v7 = [(FBSShutdownOptions *)v5 initWithReason:v6];

  [(FBSShutdownOptions *)v7 setRebootType:self->_rebootType];
  [(FBSShutdownOptions *)v7 setSource:self->_source];
  [(FBSShutdownOptions *)v7 setLPEMOption:self->_LPEMOption];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localContext);
  v9 = (void *)[WeakRetained copyWithZone:a3];
  [(FBSShutdownOptions *)v7 setLocalContext:v9];

  return v7;
}

- (NSString)description
{
  return (NSString *)[(FBSShutdownOptions *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSShutdownOptions *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSShutdownOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(FBSShutdownOptions *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FBSShutdownOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v5 = v4;
  id v10 = v5;
  objc_super v11 = self;
  id v6 = (id)[v5 modifyProem:v9];
  id v7 = v5;

  return v7;
}

void __60__FBSShutdownOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"reason"];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 16);
  if (v2 == 2)
  {
    v3 = @"RebootDark";
  }
  else
  {
    if (v2 != 1) {
      goto LABEL_6;
    }
    v3 = @"Reboot";
  }
  id v4 = (id)[*(id *)(a1 + 32) appendBool:1 withName:v3];
LABEL_6:
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 24);
  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_11;
    }
    id v6 = @"UserInitiated";
  }
  else
  {
    id v6 = @"UnknownSource";
  }
  id v7 = (id)[*(id *)(a1 + 32) appendBool:1 withName:v6];
LABEL_11:
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 32);
  if (v8 == 1)
  {
    v9 = @"disableLPEM";
  }
  else
  {
    if (v8 != 2) {
      goto LABEL_16;
    }
    v9 = @"enableLPEM";
  }
  id v10 = (id)[*(id *)(a1 + 32) appendBool:1 withName:v9];
LABEL_16:
  objc_super v11 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  id v12 = (id)[v11 appendObject:WeakRetained withName:@"localContext" skipIfNil:1];
}

- (FBSShutdownOptions)initWithXPCDictionary:(id)a3
{
  id v3 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)rebootType
{
  return self->_rebootType;
}

- (void)setRebootType:(int64_t)a3
{
  self->_rebootType = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)LPEMOption
{
  return self->_LPEMOption;
}

- (void)setLPEMOption:(int64_t)a3
{
  self->_LPEMOption = a3;
}

- (NSCopying)localContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localContext);

  return (NSCopying *)WeakRetained;
}

- (void)setLocalContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localContext);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end