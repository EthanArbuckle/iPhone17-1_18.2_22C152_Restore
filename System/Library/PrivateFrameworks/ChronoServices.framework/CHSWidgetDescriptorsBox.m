@interface CHSWidgetDescriptorsBox
+ (BOOL)supportsSecureCoding;
- (CHSWidgetDescriptorsBox)initWithCoder:(id)a3;
- (CHSWidgetDescriptorsBox)initWithDescriptors:(id)a3;
- (NSDictionary)descriptorsByExtensionIdentifier;
- (NSSet)descriptors;
- (void)_performValidation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetDescriptorsBox

- (CHSWidgetDescriptorsBox)initWithDescriptors:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetDescriptorsBox;
  v5 = [(CHSWidgetDescriptorsBox *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    descriptorsByExtensionIdentifier = v5->_descriptorsByExtensionIdentifier;
    v5->_descriptorsByExtensionIdentifier = (NSDictionary *)v6;

    [(CHSWidgetDescriptorsBox *)v5 _performValidation];
  }

  return v5;
}

- (NSSet)descriptors
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSDictionary *)self->_descriptorsByExtensionIdentifier allValues];
  id v4 = objc_msgSend(v3, "bs_flatten");
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (void)_performValidation
{
  descriptorsByExtensionIdentifier = self->_descriptorsByExtensionIdentifier;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__CHSWidgetDescriptorsBox__performValidation__block_invoke;
  v3[3] = &unk_1E56C8950;
  v3[4] = self;
  v3[5] = a2;
  [(NSDictionary *)descriptorsByExtensionIdentifier enumerateKeysAndObjectsUsingBlock:v3];
}

void __45__CHSWidgetDescriptorsBox__performValidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = NSString;
    uint64_t v22 = objc_opt_class();
    v23 = [v5 description];
    v24 = [v21 stringWithFormat:@"Key for CHSWidgetDescriptorsBox was of unexpected type: %@, value: %@", v22, v23];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      uint64_t v28 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544642;
      id v45 = v25;
      __int16 v46 = 2114;
      v47 = v27;
      __int16 v48 = 2048;
      uint64_t v49 = v28;
      __int16 v50 = 2114;
      v51 = @"CHSWidgetDescriptorsBox.m";
      __int16 v52 = 1024;
      int v53 = 36;
      __int16 v54 = 2114;
      v55 = v24;
      _os_log_error_impl(&dword_190C6F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v24 UTF8String];
    uint64_t v29 = _bs_set_crash_log_message();
    __45__CHSWidgetDescriptorsBox__performValidation__block_invoke_cold_1(v29);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = NSString;
    uint64_t v31 = objc_opt_class();
    v32 = [v6 description];
    v33 = [v30 stringWithFormat:@"Array type for CHSWidgetDescriptorsBox at key: %@ was of unexpected type: %@, value: %@", v5, v31, v32];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      uint64_t v37 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544642;
      id v45 = v34;
      __int16 v46 = 2114;
      v47 = v36;
      __int16 v48 = 2048;
      uint64_t v49 = v37;
      __int16 v50 = 2114;
      v51 = @"CHSWidgetDescriptorsBox.m";
      __int16 v52 = 1024;
      int v53 = 37;
      __int16 v54 = 2114;
      v55 = v33;
      _os_log_error_impl(&dword_190C6F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v33 UTF8String];
    uint64_t v38 = _bs_set_crash_log_message();
    __45__CHSWidgetDescriptorsBox__performValidation__block_invoke_cold_1(v38);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = NSString;
          uint64_t v13 = objc_opt_class();
          v14 = [v11 description];
          v15 = [v12 stringWithFormat:@"Array value for CHSWidgetDescriptorsBox at key: %@ was of unexpected type: %@, value: %@", v5, v13, v14];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 40));
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_opt_class();
            v18 = NSStringFromClass(v17);
            uint64_t v19 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            id v45 = v16;
            __int16 v46 = 2114;
            v47 = v18;
            __int16 v48 = 2048;
            uint64_t v49 = v19;
            __int16 v50 = 2114;
            v51 = @"CHSWidgetDescriptorsBox.m";
            __int16 v52 = 1024;
            int v53 = 39;
            __int16 v54 = 2114;
            v55 = v15;
            _os_log_error_impl(&dword_190C6F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v15 UTF8String];
          uint64_t v20 = _bs_set_crash_log_message();
          __45__CHSWidgetDescriptorsBox__performValidation__block_invoke_cold_1(v20);
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v8);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(CHSWidgetDescriptorsBox *)self _performValidation];
  [v4 encodeObject:self->_descriptorsByExtensionIdentifier forKey:@"descriptors"];
}

- (CHSWidgetDescriptorsBox)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"descriptors"];

  v12 = __41__CHSWidgetDescriptorsBox_initWithCoder___block_invoke(v11, v10);

  if (v12)
  {
    self = [(CHSWidgetDescriptorsBox *)self initWithDescriptors:v12];
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id __41__CHSWidgetDescriptorsBox_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v21;
      v14 = v3;
      id v15 = v2;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_20:

            goto LABEL_21;
          }
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v8 = [v3 objectForKeyedSubscript:v7];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v17;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v17 != v10) {
                  objc_enumerationMutation(v8);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  id v3 = v14;
                  id v2 = v15;
                  goto LABEL_20;
                }
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }

          id v3 = v14;
          id v2 = v15;
        }
        uint64_t v4 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    id v12 = v3;
  }
  else
  {
LABEL_21:
    id v12 = 0;
  }

  return v12;
}

- (NSDictionary)descriptorsByExtensionIdentifier
{
  return self->_descriptorsByExtensionIdentifier;
}

- (void).cxx_destruct
{
}

@end