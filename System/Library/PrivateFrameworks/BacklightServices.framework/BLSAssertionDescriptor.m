@interface BLSAssertionDescriptor
+ (BOOL)supportsSecureCoding;
- (BLSAssertionDescriptor)initWithCoder:(id)a3;
- (BLSAssertionDescriptor)initWithExplanation:(id)a3 attributes:(id)a4;
- (BLSAssertionDescriptor)initWithXPCDictionary:(id)a3;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributes;
- (NSString)description;
- (NSString)explanation;
- (id)attributeOfClass:(Class)a3;
- (id)attributesOfClasses:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSAssertionDescriptor

- (BLSAssertionDescriptor)initWithExplanation:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v72.receiver = self;
  v72.super_class = (Class)BLSAssertionDescriptor;
  v8 = [(BLSAssertionDescriptor *)&v72 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    explanation = v8->_explanation;
    v8->_explanation = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    attributes = v8->_attributes;
    v8->_attributes = (NSArray *)v11;

    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2020000000;
    char v71 = 0;
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    char v67 = 0;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 0;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    char v55 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    char v51 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    v13 = [MEMORY[0x1E4F1CA80] set];
    v14 = v8->_attributes;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke;
    v35[3] = &unk_1E6107AC8;
    v37 = &v64;
    v38 = &v60;
    id v15 = v13;
    id v36 = v15;
    v39 = &v56;
    v40 = &v52;
    v41 = &v48;
    v42 = &v68;
    v43 = &v44;
    [(NSArray *)v14 enumerateObjectsUsingBlock:v35];
    v16 = v8->_attributes;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke_2;
    v33[3] = &unk_1E6107AF0;
    id v17 = v15;
    id v34 = v17;
    uint64_t v18 = [(NSArray *)v16 bs_filter:v33];
    v19 = v8->_attributes;
    v8->_attributes = (NSArray *)v18;

    if (*((unsigned char *)v69 + 24) && !*((unsigned char *)v65 + 24))
    {
      v20 = v8->_attributes;
      v21 = +[BLSValidWhenBacklightInactiveAttribute cancelWhenBacklightInactivates];
      uint64_t v22 = [(NSArray *)v20 arrayByAddingObject:v21];
      v23 = v8->_attributes;
      v8->_attributes = (NSArray *)v22;
    }
    if (*((unsigned char *)v45 + 24) && !*((unsigned char *)v53 + 24))
    {
      v24 = v8->_attributes;
      v25 = +[BLSDisableFlipbookAttribute disableFlipbook];
      uint64_t v26 = [(NSArray *)v24 arrayByAddingObject:v25];
      v27 = v8->_attributes;
      v8->_attributes = (NSArray *)v26;

      *((unsigned char *)v53 + 24) = 1;
    }
    if ((*((unsigned char *)v61 + 24) || *((unsigned char *)v57 + 24) || *((unsigned char *)v53 + 24)) && !*((unsigned char *)v49 + 24))
    {
      v28 = v8->_attributes;
      v29 = +[BLSInvalidOnSystemSleepAttribute invalidateOnSystemSleep];
      uint64_t v30 = [(NSArray *)v28 arrayByAddingObject:v29];
      v31 = v8->_attributes;
      v8->_attributes = (NSArray *)v30;
    }
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(&v68, 8);
  }

  return v8;
}

void __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = a1[5];
LABEL_18:
    *(unsigned char *)(*(void *)(v3 + 8) + 24) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    v4 = (void *)a1[4];
    v5 = [v6 sceneIdentityToken];
    [v4 addObject:v5];

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = a1[6];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = a1[7];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = a1[8];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v3 = a1[9];
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = a1[10];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v3 = a1[11];
    goto LABEL_18;
  }
LABEL_19:
}

BOOL __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  BOOL v6 = 1;
  if (objc_opt_isKindOfClass())
  {
    v4 = *(void **)(a1 + 32);
    v5 = [v3 sceneIdentityToken];
    LOBYTE(v4) = [v4 containsObject:v5];

    if (v4) {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)attributeOfClass:(Class)a3
{
  attributes = self->_attributes;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__BLSAssertionDescriptor_attributeOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e29_B32__0__BLSAttribute_8Q16_B24lu32l8;
  v8[4] = a3;
  uint64_t v5 = [(NSArray *)attributes indexOfObjectPassingTest:v8];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(NSArray *)self->_attributes objectAtIndex:v5];
  }

  return v6;
}

BOOL __43__BLSAssertionDescriptor_attributeOfClass___block_invoke(uint64_t a1)
{
  return objc_opt_class() == *(void *)(a1 + 32);
}

- (id)attributesOfClasses:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__BLSAssertionDescriptor_attributesOfClasses___block_invoke;
  v10[3] = &unk_1E6107B38;
  id v11 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)attributes indexesOfObjectsPassingTest:v10];
  v8 = [(NSArray *)attributes objectsAtIndexes:v7];

  return v8;
}

uint64_t __46__BLSAssertionDescriptor_attributesOfClasses___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_opt_class();

  return [v1 containsObject:v2];
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = [(BLSAssertionDescriptor *)self attributes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  BOOL v10 = v9 == 0;
  if (!v9)
  {
    v12 = 0;
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v11 = v9;
  v27 = a2;
  v28 = self;
  uint64_t v30 = a4;
  BOOL v29 = v9 == 0;
  v12 = 0;
  uint64_t v13 = *(void *)v33;
  BOOL v10 = 1;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v8);
      }
      id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v31 = 0;
      char v16 = [v15 checkEntitlementSourceForRequiredEntitlements:v7 error:&v31];
      id v17 = v31;
      uint64_t v18 = v17;
      if ((v16 & 1) == 0)
      {
        if (!v17)
        {
          v25 = [NSString stringWithFormat:@"checkEntitlementSourceForRequiredEntitlements returned NO but did not return an error for attribute:%@", v15];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[BLSAssertionDescriptor checkEntitlementSourceForRequiredEntitlements:error:](v27, (uint64_t)v28, (uint64_t)v25);
          }
          [v25 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1B5602408);
        }
        if (v12)
        {
          [v12 addObject:v17];
        }
        else
        {
          v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v17];
        }
        BOOL v10 = 0;
      }
    }
    uint64_t v11 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  }
  while (v11);

  if (v30 != 0 && !v10)
  {
    id v8 = [v12 firstObject];
    if ((unint64_t)[v12 count] < 2)
    {
      id v8 = v8;
      *uint64_t v30 = v8;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      v36[0] = *MEMORY[0x1E4F28568];
      v20 = NSString;
      v21 = [v7 description];
      uint64_t v22 = [v8 localizedDescription];
      v23 = [v20 stringWithFormat:@"%@ missing multiple entitlements including '%@'", v21, v22];
      v36[1] = *MEMORY[0x1E4F28750];
      v37[0] = v23;
      v37[1] = v12;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
      *uint64_t v30 = [v19 errorWithDomain:@"com.apple.BacklightServices" code:21 userInfo:v24];
    }
    BOOL v10 = v29;
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_explanation withName:@"explanation"];
  [v3 appendArraySection:self->_attributes withName:@"attributes" skipIfEmpty:0];
  id v4 = [v3 build];

  return (NSString *)v4;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_explanation];
  id v5 = (id)[v3 appendObject:self->_attributes];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSAssertionDescriptor *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      explanation = self->_explanation;
      id v7 = [(BLSAssertionDescriptor *)v5 explanation];
      if ([(NSString *)explanation isEqual:v7])
      {
        attributes = self->_attributes;
        uint64_t v9 = [(BLSAssertionDescriptor *)v5 attributes];
        char v10 = [(NSArray *)attributes isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BLSAssertionDescriptor)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"explanation" UTF8String];
  unint64_t v6 = (const char *)[@"attributes" UTF8String];
  string = xpc_dictionary_get_string(v4, v5);
  if (string)
  {
    id v8 = [NSString stringWithUTF8String:string];
  }
  else
  {
    uint64_t v9 = bls_assertions_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BLSBacklightChangeRequest initWithXPCDictionary:]((uint64_t)v4, v9);
    }

    id v8 = @"<NULL>";
  }
  char v10 = xpc_dictionary_get_array(v4, v6);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke;
  applier[3] = &unk_1E61079B0;
  id v16 = v11;
  id v12 = v11;
  xpc_array_apply(v10, applier);
  uint64_t v13 = [(BLSAssertionDescriptor *)self initWithExplanation:v8 attributes:v12];

  return v13;
}

uint64_t __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  if (!v5)
  {
    unint64_t v6 = bls_assertions_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_1((uint64_t)v4, v6);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v6 = bls_assertions_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_2((uint64_t)v5, (uint64_t)v4, v6);
    }
LABEL_8:

    goto LABEL_9;
  }
  [*(id *)(a1 + 32) addObject:v5];
LABEL_9:

  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = (const char *)[@"explanation" UTF8String];
  [@"attributes" UTF8String];
  xpc_dictionary_set_string(xdict, v4, [(NSString *)self->_explanation UTF8String]);
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAssertionDescriptor)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"explanation"];
  unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"attributes"];

  char v10 = [(BLSAssertionDescriptor *)self initWithExplanation:v5 attributes:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  explanation = self->_explanation;
  id v5 = a3;
  [v5 encodeObject:explanation forKey:@"explanation"];
  [v5 encodeObject:self->_attributes forKey:@"attributes"];
}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)checkEntitlementSourceForRequiredEntitlements:(uint64_t)a3 error:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  unint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"BLSAssertionDescriptor.m";
  __int16 v16 = 1024;
  int v17 = 125;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1B55DE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_FAULT, "unable to decode attribute for %{public}@", (uint8_t *)&v2, 0xCu);
}

void __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B55DE000, log, OS_LOG_TYPE_FAULT, "decoded object:%{public}@ for %{public}@ is not a BLSAttribute class", (uint8_t *)&v3, 0x16u);
}

@end