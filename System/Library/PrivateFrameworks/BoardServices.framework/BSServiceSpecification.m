@interface BSServiceSpecification
- (BOOL)isDerived;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHiddenAtLaunch;
- (BSServiceSpecification)init;
- (NSString)description;
- (NSString)identifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)optionForKey:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_appendBodySectionIfNecessaryToBuilder:(void *)a3 withName:(void *)a4 multilinePrefix:(int)a5 includeDerived:;
- (void)_appendManagerDumpBodyToBuilder:(void *)a3 withMultilinePrefix:;
- (void)_initWithIdentifier:(char)a3 hiddenAtLaunch:(char)a4 derived:(void *)a5 options:;
@end

@implementation BSServiceSpecification

- (BSServiceSpecification)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"init is not allowed on BSServiceSpecification"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSServiceSpecification.m";
    __int16 v17 = 1024;
    int v18 = 22;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)optionForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_options objectForKey:a3];

  return v3;
}

- (void)_initWithIdentifier:(char)a3 hiddenAtLaunch:(char)a4 derived:(void *)a5 options:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  if (a1)
  {
    if (!v9)
    {
      __int16 v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_hiddenAtLaunch_derived_options_);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138544642;
        id v23 = v18;
        __int16 v24 = 2114;
        v25 = v20;
        __int16 v26 = 2048;
        v27 = a1;
        __int16 v28 = 2114;
        v29 = @"BSServiceSpecification.m";
        __int16 v30 = 1024;
        int v31 = 39;
        __int16 v32 = 2114;
        v33 = v17;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C799FE4);
    }
    v21.receiver = a1;
    v21.super_class = (Class)BSServiceSpecification;
    __int16 v11 = objc_msgSendSuper2(&v21, sel_init);
    if (v11)
    {
      uint64_t v12 = [v9 copy];
      __int16 v13 = (void *)v11[3];
      v11[3] = v12;

      *((unsigned char *)v11 + 17) = a3;
      *((unsigned char *)v11 + 16) = a4;
      uint64_t v14 = [v10 copy];
      __int16 v15 = (void *)v11[1];
      v11[1] = v14;
    }
  }
  else
  {
    __int16 v11 = 0;
  }

  return v11;
}

- (void)_appendManagerDumpBodyToBuilder:(void *)a3 withMultilinePrefix:
{
  id v6 = a2;
  id v5 = a3;
  if (a1) {
    -[BSServiceSpecification _appendBodySectionIfNecessaryToBuilder:withName:multilinePrefix:includeDerived:](a1, v6, @"specification", v5, 1);
  }
}

- (void)_appendBodySectionIfNecessaryToBuilder:(void *)a3 withName:(void *)a4 multilinePrefix:(int)a5 includeDerived:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1
    && (a5 && *(unsigned char *)(a1 + 16)
     || ([(id)a1 isHiddenAtLaunch] & 1) != 0
     || [*(id *)(a1 + 8) count]))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __105__BSServiceSpecification__appendBodySectionIfNecessaryToBuilder_withName_multilinePrefix_includeDerived___block_invoke;
    v12[3] = &unk_1E58FC428;
    char v15 = a5;
    id v13 = v9;
    uint64_t v14 = a1;
    [v13 appendBodySectionWithName:v10 multilinePrefix:v11 block:v12];
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSServiceSpecification *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && BSEqualStrings()
      && self->_hiddenAtLaunch == v4->_hiddenAtLaunch
      && self->_derived == v4->_derived)
    {
      char v6 = BSEqualObjects();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(BSServiceSpecification *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSServiceSpecification *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  BOOL derived = self->_derived;
  if (self->_derived)
  {
    identifier = [NSString stringWithFormat:@"(%@)", self->_identifier];
  }
  else
  {
    identifier = self->_identifier;
  }
  [v3 appendString:identifier withName:0];
  if (derived) {

  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSServiceSpecification *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSServiceSpecification *)self succinctDescriptionBuilder];
  -[BSServiceSpecification _appendBodySectionIfNecessaryToBuilder:withName:multilinePrefix:includeDerived:]((uint64_t)self, v5, 0, v4, 0);

  return v5;
}

uint64_t __105__BSServiceSpecification__appendBodySectionIfNecessaryToBuilder_withName_multilinePrefix_includeDerived___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"Derived" ifEqualTo:1];
  }
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHiddenAtLaunch"), @"HiddenAtLaunch", 1);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);

  return [v4 appendDictionarySection:v5 withName:@"Options" skipIfEmpty:1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isDerived
{
  return self->_derived;
}

- (BOOL)isHiddenAtLaunch
{
  return self->_hiddenAtLaunch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end