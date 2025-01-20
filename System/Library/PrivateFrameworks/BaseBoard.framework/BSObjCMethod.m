@interface BSObjCMethod
+ (id)methodWithSelector:(uint64_t)a3 typeEncoding:;
+ (void)_propertyGetterForValue:(const char *)a3 withSelector:;
+ (void)_propertySetterForValue:(const char *)a3 withSelector:;
- (BOOL)isEqual:(id)a3;
- (BSObjCValue)firstArgument;
- (BSObjCValue)lastArgument;
- (BSObjCValue)returnValue;
- (NSArray)arguments;
- (NSString)description;
- (NSString)encoding;
- (NSString)name;
- (SEL)selector;
- (id)copyAsOnewayVoid;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation BSObjCMethod

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (BSObjCValue)returnValue
{
  return self->_returnValue;
}

- (NSString)encoding
{
  return self->_encoding;
}

+ (id)methodWithSelector:(uint64_t)a3 typeEncoding:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v35 = (objc_class *)self;
  if (!a3)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:sel_methodWithSelector_typeEncoding_, v35, @"BSObjCRuntime.m", 869, @"Invalid parameter not satisfying: %@", @"cEncoding != nil" object file lineNumber description];
  }
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v5 copy];

  id obj = (id)v6;
  v7 = objc_msgSend(NSString, "bs_stringWithUTF8String:", a3);
  v8 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:a3];
  if (!v8) {
    goto LABEL_22;
  }
  if (v7 && [v7 rangeOfString:@"("]
  {
    v21 = BSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v39 = v29;
      _os_log_error_impl(&dword_18AAA8000, v21, OS_LOG_TYPE_ERROR, "Ignoring @selector(%{public}@) because it contains a union.", buf, 0xCu);
    }
    goto LABEL_21;
  }
  unint64_t v9 = [v8 numberOfArguments];
  if (v9 < 2
    || (id v10 = v8, *(unsigned char *)[v10 getArgumentTypeAtIndex:0] != 64)
    || (id v11 = v10, *(unsigned char *)[v11 getArgumentTypeAtIndex:1] != 58))
  {
    v21 = BSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_error_impl(&dword_18AAA8000, v21, OS_LOG_TYPE_ERROR, "Ignoring @selector(%{public}@) because the first two arguments are not 'self' and '_cmd'.", buf, 0xCu);
    }
LABEL_21:

LABEL_22:
    id v22 = 0;
    goto LABEL_23;
  }
  v34 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v33 = v9;
  v12 = [MEMORY[0x1E4F28FE8] scannerWithString:v6];
  for (unint64_t i = 2; i < [v11 numberOfArguments]; ++i)
  {
    id v37 = 0;
    int v14 = [v12 scanUpToString:@":" intoString:&v37];
    id v15 = v37;
    if (v14) {
      [v12 scanString:@":" intoString:0];
    }
    uint64_t v16 = +[BSObjCValue valueForArgumentAtIndex:inSignature:]((uint64_t)BSObjCValue, i, v11);
    v17 = (void *)v16;
    if (v16)
    {
      *(void *)(v16 + 48) = i - 2;
      id v18 = v15;
      uint64_t v19 = [v18 copy];
      v20 = (void *)v17[7];
      v17[7] = v19;

      [v34 addObject:v17];
    }
  }
  if (v33 != [v34 count] + 2)
  {
    v28 = BSLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v31 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_error_impl(&dword_18AAA8000, v28, OS_LOG_TYPE_ERROR, "Ignoring @selector(%{public}@) because the argument count does not match the encoding.", buf, 0xCu);
    }
    goto LABEL_22;
  }
  id v22 = objc_alloc_init(v35);
  *((void *)v22 + 4) = a2;
  objc_storeStrong((id *)v22 + 2, obj);
  objc_storeStrong((id *)v22 + 3, v7);
  uint64_t v24 = [v34 copy];
  v25 = (void *)*((void *)v22 + 5);
  *((void *)v22 + 5) = v24;

  uint64_t v26 = +[BSObjCValue valueForArgumentAtIndex:inSignature:]((uint64_t)BSObjCValue, -1, v11);
  v27 = (void *)*((void *)v22 + 6);
  *((void *)v22 + 6) = v26;

LABEL_23:
  return v22;
}

- (NSString)name
{
  return self->_name;
}

- (BSObjCValue)lastArgument
{
  return (BSObjCValue *)[(NSArray *)self->_arguments lastObject];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnValue, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSObjCMethod *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(BSObjCMethod *)self selector];
      BOOL v6 = v5 == [(BSObjCMethod *)v4 selector];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (SEL)selector
{
  return self->_selector;
}

- (id)copyAsOnewayVoid
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(BSObjCValue *)self->_returnValue isVoid])
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_returnValue isVoid]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 2048;
      id v18 = self;
      __int16 v19 = 2114;
      v20 = @"BSObjCRuntime.m";
      __int16 v21 = 1024;
      int v22 = 983;
      __int16 v23 = 2114;
      uint64_t v24 = v8;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v8 UTF8String];
    __break(0);
    JUMPOUT(0x18AACA5B0);
  }
  if ([(BSObjCValue *)self->_returnValue isOneWay])
  {
    return self;
  }
  else
  {
    v4 = [@"V" stringByAppendingString:self->_encoding];
    selector = self->_selector;
    id v6 = v4;
    v7 = +[BSObjCMethod methodWithSelector:typeEncoding:]((uint64_t)BSObjCMethod, selector, [v6 UTF8String]);

    return v7;
  }
}

+ (void)_propertyGetterForValue:(const char *)a3 withSelector:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = (objc_class *)self;
  id v6 = v5;
  if (!v4)
  {
    id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"value"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertyGetterForValue_withSelector_);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v27 = v19;
      __int16 v28 = 2114;
      v29 = v21;
      __int16 v30 = 2048;
      v31 = v6;
      __int16 v32 = 2114;
      unint64_t v33 = @"BSObjCRuntime.m";
      __int16 v34 = 1024;
      int v35 = 935;
      __int16 v36 = 2114;
      id v37 = v18;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v18 UTF8String];
    __break(0);
    JUMPOUT(0x18AB0E824);
  }
  if (!a3)
  {
    int v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"selector"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertyGetterForValue_withSelector_);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      id v27 = v23;
      __int16 v28 = 2114;
      v29 = v25;
      __int16 v30 = 2048;
      v31 = v6;
      __int16 v32 = 2114;
      unint64_t v33 = @"BSObjCRuntime.m";
      __int16 v34 = 1024;
      int v35 = 936;
      __int16 v36 = 2114;
      id v37 = v22;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v22 UTF8String];
    __break(0);
    JUMPOUT(0x18AB0E928);
  }
  v7 = objc_alloc_init(v5);
  v7[4] = a3;
  v8 = NSStringFromSelector(a3);
  uint64_t v9 = [v8 copy];
  id v10 = (void *)v7[2];
  v7[2] = v9;

  id v11 = NSString;
  v12 = [v4 encoding];
  uint64_t v13 = [v11 stringWithFormat:@"%@@:", v12];
  id v14 = (void *)v7[3];
  v7[3] = v13;

  __int16 v15 = (void *)v7[5];
  v7[5] = MEMORY[0x1E4F1CBF0];

  uint64_t v16 = (void *)v7[6];
  v7[6] = v4;

  return v7;
}

+ (void)_propertySetterForValue:(const char *)a3 withSelector:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = (objc_class *)self;
  id v6 = v5;
  if (!v4)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"value"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertySetterForValue_withSelector_);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      int v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      id v30 = v21;
      __int16 v31 = 2114;
      __int16 v32 = v23;
      __int16 v33 = 2048;
      __int16 v34 = v6;
      __int16 v35 = 2114;
      __int16 v36 = @"BSObjCRuntime.m";
      __int16 v37 = 1024;
      int v38 = 948;
      __int16 v39 = 2114;
      uint64_t v40 = v20;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v20 UTF8String];
    __break(0);
    JUMPOUT(0x18AB0EC04);
  }
  if (!a3)
  {
    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"selector"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertySetterForValue_withSelector_);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = (objc_class *)objc_opt_class();
      id v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138544642;
      id v30 = v25;
      __int16 v31 = 2114;
      __int16 v32 = v27;
      __int16 v33 = 2048;
      __int16 v34 = v6;
      __int16 v35 = 2114;
      __int16 v36 = @"BSObjCRuntime.m";
      __int16 v37 = 1024;
      int v38 = 949;
      __int16 v39 = 2114;
      uint64_t v40 = v24;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v24 UTF8String];
    __break(0);
    JUMPOUT(0x18AB0ED08);
  }
  v7 = objc_alloc_init(v5);
  v7[4] = a3;
  v8 = NSStringFromSelector(a3);
  uint64_t v9 = [v8 copy];
  id v10 = (void *)v7[2];
  v7[2] = v9;

  id v11 = NSString;
  v12 = [v4 encoding];
  uint64_t v13 = [v11 stringWithFormat:@"v@:%@", v12];
  id v14 = (void *)v7[3];
  v7[3] = v13;

  id v28 = v4;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  uint64_t v16 = (void *)v7[5];
  v7[5] = v15;

  uint64_t v17 = +[BSObjCValue voidValue];
  id v18 = (void *)v7[6];
  v7[6] = v17;

  return v7;
}

- (BSObjCValue)firstArgument
{
  return (BSObjCValue *)[(NSArray *)self->_arguments firstObject];
}

- (NSString)description
{
  return (NSString *)[(BSObjCMethod *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSObjCMethod *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSObjCMethod *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BSObjCValue *returnValue;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  __CFString *v22;
  uint64_t vars8;

  id v4 = [(BSObjCMethod *)self succinctDescriptionBuilder];
  v5 = v4;
  if (!self->_required) {
    id v6 = (id)[v4 appendObject:@"optional" withName:0];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  id v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  id v21 = __Block_byref_object_dispose__3;
  int v22 = &stru_1ED76E928;
  arguments = self->_arguments;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__BSObjCMethod_descriptionBuilderWithMultilinePrefix___block_invoke;
  v16[3] = &unk_1E5445DA0;
  v16[4] = &v17;
  [(NSArray *)arguments enumerateObjectsUsingBlock:v16];
  uint64_t v8 = [(id)v18[5] length];
  uint64_t v9 = NSString;
  returnValue = self->_returnValue;
  if (v8)
  {
    id v11 = -[BSObjCValue _prettyTypeString](returnValue);
    v12 = [(BSObjCMethod *)self name];
    [v9 stringWithFormat:@"-(%@)%@(%@)", v11, v12, v18[5]];
  }
  else
  {
    id v11 = -[BSObjCValue _prettyTypeString](returnValue);
    v12 = [(BSObjCMethod *)self name];
    [v9 stringWithFormat:@"-(%@)%@", v11, v12];
  uint64_t v13 = };

  id v14 = (id)[v5 appendObject:v13 withName:0];
  _Block_object_dispose(&v17, 8);

  return v5;
}

void __54__BSObjCMethod_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v11 = v5;
  -[BSObjCValue _prettyTypeString](v5);
  if (a3) {
    v7 = {;
  }
    [v6 stringByAppendingFormat:@", %@", v7];
  }
  else {
    v7 = {;
  }
    [v6 stringByAppendingString:v7];
  uint64_t v8 = };
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

@end