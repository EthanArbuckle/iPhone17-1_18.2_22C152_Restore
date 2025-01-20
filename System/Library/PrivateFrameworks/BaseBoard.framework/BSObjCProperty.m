@interface BSObjCProperty
+ (id)propertyWithBuilder:(id)a3;
+ (id)propertyWithBuilder:(id)a3 error:(id *)a4;
+ (id)propertyWithName:(id)a3 attributes:(id)a4 error:(id *)a5;
+ (id)propertyWithName:(void *)a3 value:(void *)a4 attributes:;
+ (id)propertyWithProperty:(objc_property *)a3 error:(id *)a4;
- (BOOL)isAssign;
- (BOOL)isAtomic;
- (BOOL)isCopy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNonAtomic;
- (BOOL)isReadOnly;
- (BOOL)isReadWrite;
- (BOOL)isRequired;
- (BOOL)isStrong;
- (BOOL)isWeak;
- (BSObjCMethod)getter;
- (BSObjCMethod)setter;
- (BSObjCValue)value;
- (NSString)description;
- (NSString)name;
- (SEL)_getSelector;
- (SEL)_setSelector;
- (id)copyAddingCustomAttributes:(id)a3;
- (id)copyAsReadWrite;
- (id)customAttributeForKey:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_reifySelectors;
@end

@implementation BSObjCProperty

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BSObjCValue)value
{
  return self->_value;
}

- (BSObjCMethod)setter
{
  return self->_setter;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isWeak
{
  return self->_weak;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (BOOL)isCopy
{
  return self->_copy;
}

- (BSObjCMethod)getter
{
  return self->_getter;
}

- (SEL)_getSelector
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = *(void **)(a1 + 40);
  if (!v1) {
    v1 = *(void **)(a1 + 72);
  }
  v2 = v1;
  SEL v3 = NSSelectorFromString(v2);
  if (!v3)
  {
    v4 = v2;
    SEL v3 = sel_registerName([(NSString *)v4 UTF8String]);
    v5 = BSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_debug_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_DEBUG, "BSObjCProperty registering selector \"%@\"", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3;
}

+ (id)propertyWithName:(void *)a3 value:(void *)a4 attributes:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (objc_class *)self;
  if (!v7)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"name"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_propertyWithName_value_attributes_);
      v29 = (id *)(id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138544642;
      v42 = v29;
      __int16 v43 = 2114;
      v44 = v31;
      __int16 v45 = 2048;
      v46 = v10;
      __int16 v47 = 2114;
      v48 = @"BSObjCRuntime.m";
      __int16 v49 = 1024;
      int v50 = 603;
      __int16 v51 = 2114;
      v52 = v28;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v28 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC0578);
  }
  if (!v8)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"value"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_propertyWithName_value_attributes_);
      v33 = (id *)(id)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138544642;
      v42 = v33;
      __int16 v43 = 2114;
      v44 = v35;
      __int16 v45 = 2048;
      v46 = v10;
      __int16 v47 = 2114;
      v48 = @"BSObjCRuntime.m";
      __int16 v49 = 1024;
      int v50 = 604;
      __int16 v51 = 2114;
      v52 = v32;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v32 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC067CLL);
  }
  if (![v9 count])
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[attributes count]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_propertyWithName_value_attributes_);
      v37 = (id *)(id)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138544642;
      v42 = v37;
      __int16 v43 = 2114;
      v44 = v39;
      __int16 v45 = 2048;
      v46 = v10;
      __int16 v47 = 2114;
      v48 = @"BSObjCRuntime.m";
      __int16 v49 = 1024;
      int v50 = 605;
      __int16 v51 = 2114;
      v52 = v36;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v36 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC0780);
  }
  v11 = (id *)objc_alloc_init(v10);
  objc_storeStrong(v11 + 1, a3);
  objc_storeStrong(v11 + 9, a2);
  v12 = [v9 objectForKey:@"?"];
  *((unsigned char *)v11 + 32) = v12 == 0;

  v13 = [v9 objectForKey:@"N"];
  *((unsigned char *)v11 + 64) = v13 != 0;

  v14 = [v9 objectForKey:@"R"];
  *((unsigned char *)v11 + 65) = v14 != 0;

  v15 = [v9 objectForKey:@"C"];
  *((unsigned char *)v11 + 66) = v15 != 0;

  v16 = [v9 objectForKey:@"&"];
  *((unsigned char *)v11 + 67) = v16 != 0;

  v17 = [v9 objectForKey:@"W"];
  *((unsigned char *)v11 + 68) = v17 != 0;

  uint64_t v18 = [v9 objectForKey:@"G"];
  id v19 = v11[5];
  v11[5] = (id)v18;

  uint64_t v20 = [v9 objectForKey:@"S"];
  id v21 = v11[6];
  v11[6] = (id)v20;

  v22 = (void *)[v9 mutableCopy];
  v40[0] = @"T";
  v40[1] = @"N";
  v40[2] = @"R";
  v40[3] = @"C";
  v40[4] = @"&";
  v40[5] = @"W";
  v40[6] = @"G";
  v40[7] = @"S";
  v40[8] = @"?";
  v40[9] = @"V";
  v40[10] = @"D";
  v40[11] = @"P";
  v40[12] = @"t";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:13];
  [v22 removeObjectsForKeys:v23];

  if ([v22 count])
  {
    uint64_t v24 = [v22 copy];
    id v25 = v11[7];
    v11[7] = (id)v24;
  }
  if ([v11[1] isObject]
    && [v11 isReadOnly]
    && [v11 isAssign])
  {
    *((unsigned char *)v11 + 67) = 1;
    v26 = BSLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v11;
      _os_log_debug_impl(&dword_18AAA8000, v26, OS_LOG_TYPE_DEBUG, "[rdar://101271642] Making probably-incorrect object property 'strong' instead of 'assign': %@", buf, 0xCu);
    }
  }
  return v11;
}

- (BOOL)isReadWrite
{
  return ![(BSObjCProperty *)self isReadOnly];
}

- (SEL)_setSelector
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1 || ([a1 isReadOnly] & 1) != 0) {
    return 0;
  }
  SEL v3 = (NSString *)a1[6];
  if (!v3)
  {
    v4 = [a1[9] substringToIndex:1];
    v5 = [v4 capitalizedString];

    v6 = [a1[9] substringFromIndex:1];
    SEL v3 = [NSString stringWithFormat:@"set%@%@:", v5, v6];
  }
  SEL v2 = NSSelectorFromString(v3);
  if (!v2)
  {
    id v7 = v3;
    SEL v2 = sel_registerName([(NSString *)v7 UTF8String]);
    id v8 = BSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_debug_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_DEBUG, "BSObjCProperty registering selector \"%@\"", buf, 0xCu);
    }
  }
  return v2;
}

- (BOOL)isReadOnly
{
  return self->_readonly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_customSetter, 0);
  objc_storeStrong((id *)&self->_customGetter, 0);
  objc_storeStrong((id *)&self->_setter, 0);
  objc_storeStrong((id *)&self->_getter, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSObjCProperty *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_5;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  name = self->_name;
  id v9 = v4->_name;
  if (name != v9)
  {
    BOOL v6 = 0;
    if (!name || !v9) {
      goto LABEL_5;
    }
    if (!-[NSString isEqualToString:](name, "isEqualToString:")) {
      goto LABEL_3;
    }
  }
  value = self->_value;
  v11 = v4->_value;
  if (value != v11)
  {
    BOOL v6 = 0;
    if (!value || !v11) {
      goto LABEL_5;
    }
    if (!-[BSObjCValue isEqual:](value, "isEqual:")) {
      goto LABEL_3;
    }
  }
  customGetter = self->_customGetter;
  v13 = v4->_customGetter;
  if (customGetter != v13)
  {
    BOOL v6 = 0;
    if (!customGetter || !v13) {
      goto LABEL_5;
    }
    if (!-[NSString isEqual:](customGetter, "isEqual:")) {
      goto LABEL_3;
    }
  }
  customSetter = self->_customSetter;
  v15 = v4->_customSetter;
  if (customSetter == v15)
  {
LABEL_22:
    if (!self->_nonatomic != v4->_nonatomic && !self->_weak != v4->_weak && !self->_strong != v4->_strong)
    {
      BOOL v6 = !self->_copy ^ v4->_copy;
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  BOOL v6 = 0;
  if (customSetter && v15)
  {
    if (-[NSString isEqual:](customSetter, "isEqual:")) {
      goto LABEL_22;
    }
LABEL_3:
    BOOL v6 = 0;
  }
LABEL_5:

  return v6;
}

- (BOOL)isAtomic
{
  return ![(BSObjCProperty *)self isNonAtomic];
}

- (BOOL)isNonAtomic
{
  return self->_nonatomic;
}

- (BOOL)isAssign
{
  if ([(BSObjCProperty *)self isCopy] || [(BSObjCProperty *)self isStrong]) {
    return 0;
  }
  else {
    return ![(BSObjCProperty *)self isWeak];
  }
}

- (BOOL)isStrong
{
  return self->_strong;
}

- (id)customAttributeForKey:(id)a3
{
  SEL v3 = [(NSDictionary *)self->_customAttributes objectForKey:a3];
  return v3;
}

- (void)_reifySelectors
{
  if (a1)
  {
    if (!*(void *)(a1 + 16))
    {
      SEL v2 = *(void **)(a1 + 8);
      SEL v3 = -[BSObjCProperty _getSelector](a1);
      uint64_t v4 = +[BSObjCMethod _propertyGetterForValue:withSelector:]((uint64_t)BSObjCMethod, v2, v3);
      uint64_t v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v4;
    }
    if (!*(void *)(a1 + 24) && !*(unsigned char *)(a1 + 65))
    {
      BOOL v6 = *(void **)(a1 + 8);
      id v7 = -[BSObjCProperty _setSelector]((id *)a1);
      uint64_t v8 = +[BSObjCMethod _propertySetterForValue:withSelector:]((uint64_t)BSObjCMethod, v6, v7);
      id v9 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v8;
    }
  }
}

- (id)copyAsReadWrite
{
  if ([(BSObjCProperty *)self isReadWrite])
  {
    return self;
  }
  else
  {
    SEL v3 = objc_alloc_init(BSObjCProperty);
    objc_storeStrong((id *)&v3->_value, self->_value);
    objc_storeStrong((id *)&v3->_name, self->_name);
    v3->_required = self->_required;
    v3->_nonatomic = self->_nonatomic;
    v3->_readonly = 0;
    v3->_copy = self->_copy;
    v3->_strong = self->_strong;
    v3->_weak = self->_weak;
    objc_storeStrong((id *)&v3->_customGetter, self->_customGetter);
    objc_storeStrong((id *)&v3->_getter, self->_getter);
    value = self->_value;
    uint64_t v5 = -[BSObjCProperty _setSelector]((id *)&v3->super.isa);
    uint64_t v6 = +[BSObjCMethod _propertySetterForValue:withSelector:]((uint64_t)BSObjCMethod, value, v5);
    setter = v3->_setter;
    v3->_setter = (BSObjCMethod *)v6;

    objc_storeStrong((id *)&v3->_customAttributes, self->_customAttributes);
    return v3;
  }
}

- (id)copyAddingCustomAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(BSObjCProperty);
  objc_storeStrong((id *)&v5->_value, self->_value);
  objc_storeStrong((id *)&v5->_name, self->_name);
  v5->_required = self->_required;
  v5->_nonatomic = self->_nonatomic;
  v5->_readonly = self->_readonly;
  v5->_copy = self->_copy;
  v5->_strong = self->_strong;
  v5->_weak = self->_weak;
  objc_storeStrong((id *)&v5->_customGetter, self->_customGetter);
  objc_storeStrong((id *)&v5->_customSetter, self->_customSetter);
  objc_storeStrong((id *)&v5->_getter, self->_getter);
  objc_storeStrong((id *)&v5->_setter, self->_setter);
  customAttributes = self->_customAttributes;
  if (customAttributes)
  {
    uint64_t v7 = [(NSDictionary *)customAttributes bs_dictionaryByAddingEntriesFromDictionary:v4];
  }
  else
  {
    uint64_t v7 = [v4 copy];
  }
  uint64_t v8 = v5->_customAttributes;
  v5->_customAttributes = (NSDictionary *)v7;

  return v5;
}

- (NSString)description
{
  return (NSString *)[(BSObjCProperty *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  SEL v2 = [(BSObjCProperty *)self succinctDescriptionBuilder];
  SEL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  SEL v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  if ([(BSObjCProperty *)self isNonAtomic]) {
    uint64_t v5 = @"nonatomic";
  }
  else {
    uint64_t v5 = @"atomic";
  }
  [v4 appendString:v5];
  if ([(BSObjCProperty *)self isReadWrite]) {
    uint64_t v6 = @", readwrite";
  }
  else {
    uint64_t v6 = @", readonly";
  }
  [v4 appendString:v6];
  if ([(BSObjCProperty *)self isCopy])
  {
    uint64_t v7 = @", copy";
  }
  else if ([(BSObjCProperty *)self isStrong])
  {
    uint64_t v7 = @", strong";
  }
  else if ([(BSObjCProperty *)self isWeak])
  {
    uint64_t v7 = @", weak";
  }
  else
  {
    uint64_t v7 = @", assign";
  }
  [v4 appendString:v7];
  if (self->_customGetter) {
    [v4 appendFormat:@", getter=%@", self->_customGetter];
  }
  if (self->_customSetter) {
    [v4 appendFormat:@", setter=%@", self->_customSetter];
  }
  [v4 appendString:@" "]);
  uint64_t v8 = -[BSObjCValue _prettyTypeString](self->_value);
  if ([v8 hasSuffix:@"*"]) {
    id v9 = @"%@%@";
  }
  else {
    id v9 = @"%@ %@";
  }
  objc_msgSend(v4, "appendFormat:", v9, v8, self->_name);
  if (!self->_required) {
    id v10 = (id)[v3 appendObject:@"optional" withName:0];
  }
  id v11 = (id)[v3 appendObject:v4 withName:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  SEL v3 = [(BSObjCProperty *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  SEL v3 = [(BSObjCProperty *)self succinctDescriptionBuilder];
  return v3;
}

+ (id)propertyWithProperty:(objc_property *)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", a4, @"property"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = v15;
      __int16 v20 = 2048;
      id v21 = a1;
      __int16 v22 = 2114;
      v23 = @"BSObjCRuntime.m";
      __int16 v24 = 1024;
      int v25 = 1826;
      __int16 v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v12 UTF8String];
    __break(0);
    JUMPOUT(0x18AB114A8);
  }
  uint64_t v7 = objc_msgSend(NSString, "bs_stringWithUTF8String:", property_getName(a3));
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "bsobjc_attributesForProperty:", a3);
  id v9 = [a1 propertyWithName:v7 attributes:v8 error:a4];

  return v9;
}

+ (id)propertyWithBuilder:(id)a3
{
  SEL v3 = [a1 propertyWithBuilder:a3 error:0];
  return v3;
}

+ (id)propertyWithBuilder:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void (**)(id, void *))a3;
  uint64_t v6 = objc_opt_new();
  v5[2](v5, v6);
  uint64_t v7 = [v6 value];
  if (v7)
  {
    uint64_t v8 = [v6 name];
    if (v8)
    {
      uint64_t v9 = [v6 associationPolicy];
      if (!v9) {
        uint64_t v9 = [v7 isObject];
      }
      id v10 = objc_opt_new();
      [v10 setObject:&stru_1ED76E928 forKey:@"N"];
      if ([v6 optional]) {
        [v10 setObject:&stru_1ED76E928 forKey:@"?"];
      }
      if ((unint64_t)(v9 - 1) <= 2) {
        [v10 setObject:&stru_1ED76E928 forKey:off_1E5445E30[v9 - 1]];
      }
      id v11 = [v6 getterName];

      if (v11)
      {
        uint64_t v12 = [v6 getterName];
        [v10 setObject:v12 forKey:@"G"];
      }
      id v13 = [v6 setterName];

      if (v13)
      {
        v14 = [v6 setterName];
        [v10 setObject:v14 forKey:@"S"];
      }
      v15 = +[BSObjCProperty propertyWithName:value:attributes:]((uint64_t)BSObjCProperty, v8, v7, v10);
      -[BSObjCProperty _reifySelectors]((uint64_t)v15);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "bs_errorWithDomain:code:configuration:", @"BSObjCRuntime", 1, &__block_literal_global_798);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "bs_errorWithDomain:code:configuration:", @"BSObjCRuntime", 1, &__block_literal_global_793);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __62__BSObjCProperty_ExternalCreation__propertyWithBuilder_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFailureDescription:@"Property builder contains no value"];
}

uint64_t __62__BSObjCProperty_ExternalCreation__propertyWithBuilder_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFailureDescription:@"Property builder contains no name"];
}

+ (id)propertyWithName:(id)a3 attributes:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"name"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      id v25 = v17;
      __int16 v26 = 2114;
      v27 = v19;
      __int16 v28 = 2048;
      id v29 = a1;
      __int16 v30 = 2114;
      v31 = @"BSObjCRuntime.m";
      __int16 v32 = 1024;
      int v33 = 1895;
      __int16 v34 = 2114;
      v35 = v16;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v16 UTF8String];
    __break(0);
    JUMPOUT(0x18AB11A18);
  }
  if (!v10)
  {
    __int16 v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attributes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      id v25 = v21;
      __int16 v26 = 2114;
      v27 = v23;
      __int16 v28 = 2048;
      id v29 = a1;
      __int16 v30 = 2114;
      v31 = @"BSObjCRuntime.m";
      __int16 v32 = 1024;
      int v33 = 1896;
      __int16 v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v20 UTF8String];
    __break(0);
    JUMPOUT(0x18AB11B1CLL);
  }
  uint64_t v12 = [v10 objectForKey:@"T"];
  id v13 = +[BSObjCValue valueWithEncoding:v12 error:a5];
  if (v13)
  {
    v14 = +[BSObjCProperty propertyWithName:value:attributes:]((uint64_t)BSObjCProperty, v9, v13, v11);
    -[BSObjCProperty _reifySelectors]((uint64_t)v14);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end