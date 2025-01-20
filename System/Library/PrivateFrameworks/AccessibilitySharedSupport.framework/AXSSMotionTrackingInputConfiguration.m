@interface AXSSMotionTrackingInputConfiguration
+ (BOOL)supportsSecureCoding;
- (AXSSMotionTrackingInputConfiguration)init;
- (AXSSMotionTrackingInputConfiguration)initWithCoder:(id)a3;
- (AXSSMotionTrackingInputConfiguration)initWithOrderedInputPreference:(id)a3 allowedTrackingTypes:(id)a4 allowSeparateInputForExpressions:(BOOL)a5;
- (AXSSMotionTrackingInputConfiguration)initWithPlistDictionary:(id)a3;
- (BOOL)allowSeparateInputForExpressions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMotionTrackingInputConfiguration:(id)a3;
- (BOOL)supportsTrackingType:(unint64_t)a3;
- (NSArray)orderedCameraInputPreference;
- (NSArray)orderedInputPreference;
- (NSDictionary)plistDictionary;
- (NSSet)allowedTrackingTypes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)plistDictionary;
- (void)setAllowSeparateInputForExpressions:(BOOL)a3;
- (void)setAllowedTrackingTypes:(id)a3;
- (void)setOrderedInputPreference:(id)a3;
@end

@implementation AXSSMotionTrackingInputConfiguration

- (AXSSMotionTrackingInputConfiguration)initWithOrderedInputPreference:(id)a3 allowedTrackingTypes:(id)a4 allowSeparateInputForExpressions:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  v10 = [(AXSSMotionTrackingInputConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    orderedInputPreference = v10->_orderedInputPreference;
    v10->_orderedInputPreference = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    allowedTrackingTypes = v10->_allowedTrackingTypes;
    v10->_allowedTrackingTypes = (NSSet *)v13;

    v10->_allowSeparateInputForExpressions = a5;
  }

  return v10;
}

- (AXSSMotionTrackingInputConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  return [(AXSSMotionTrackingInputConfiguration *)&v3 init];
}

- (AXSSMotionTrackingInputConfiguration)initWithPlistDictionary:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = NSStringFromSelector(sel_orderedInputPreference);
    v6 = [v4 objectForKeyedSubscript:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke;
      v29[3] = &unk_1E606CDD0;
      v29[4] = &v36;
      [v6 enumerateObjectsUsingBlock:v29];
    }
    v7 = NSStringFromSelector(sel_allowedTrackingTypes);
    id v8 = [v4 objectForKeyedSubscript:v7];

    id v9 = (void *)MEMORY[0x1E4F28DC0];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v12 = [v10 setWithArray:v11];
    id v28 = 0;
    uint64_t v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v8 error:&v28];
    id v14 = v28;

    if (!v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v31[5])
        {
          uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
          objc_super v16 = (void *)v31[5];
          v31[5] = v15;
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke_2;
        v27[3] = &unk_1E606CDF8;
        v27[4] = &v30;
        [v13 enumerateObjectsUsingBlock:v27];
      }
    }
    v17 = NSStringFromSelector(sel_allowSeparateInputForExpressions);
    v18 = [v4 objectForKeyedSubscript:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v19 = [v18 BOOLValue];
    }
    else {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }
  v26.receiver = self;
  v26.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  v20 = [(AXSSMotionTrackingInputConfiguration *)&v26 init];
  if (v20)
  {
    uint64_t v21 = [(id)v37[5] copy];
    orderedInputPreference = v20->_orderedInputPreference;
    v20->_orderedInputPreference = (NSArray *)v21;

    uint64_t v23 = [(id)v31[5] copy];
    allowedTrackingTypes = v20->_allowedTrackingTypes;
    v20->_allowedTrackingTypes = (NSSet *)v23;

    v20->_allowSeparateInputForExpressions = v19;
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v20;
}

void __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v10;
  if (isKindOfClass)
  {
    v5 = +[AXSSMotionTrackingInput motionTrackingInputFromPlistDictionary:v10];
    if (v5)
    {
      v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
        id v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v6 addObject:v5];
    }

    id v4 = v10;
  }
}

void __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v3 unsignedIntegerValue] <= 3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

- (NSDictionary)plistDictionary
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  id v4 = [(AXSSMotionTrackingInputConfiguration *)self orderedInputPreference];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__AXSSMotionTrackingInputConfiguration_plistDictionary__block_invoke;
  v22[3] = &unk_1E606CE20;
  v22[4] = &v23;
  [v4 enumerateObjectsUsingBlock:v22];

  v5 = (void *)v24[5];
  if (v5)
  {
    v6 = (void *)[v5 copy];
    uint64_t v7 = NSStringFromSelector(sel_orderedInputPreference);
    [v3 setObject:v6 forKeyedSubscript:v7];
  }
  uint64_t v8 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    id v10 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v11 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];
    id v21 = 0;
    v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v21];
    id v13 = v21;
    id v14 = NSStringFromSelector(sel_allowedTrackingTypes);
    [v3 setObject:v12 forKeyedSubscript:v14];

    if (v13)
    {
      uint64_t v15 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_super v16 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];
        [(AXSSMotionTrackingInputConfiguration *)v16 plistDictionary];
      }
    }
  }
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSMotionTrackingInputConfiguration allowSeparateInputForExpressions](self, "allowSeparateInputForExpressions"));
  v18 = NSStringFromSelector(sel_allowSeparateInputForExpressions);
  [v3 setObject:v17 forKeyedSubscript:v18];

  char v19 = (void *)[v3 copy];
  _Block_object_dispose(&v23, 8);

  return (NSDictionary *)v19;
}

uint64_t __55__AXSSMotionTrackingInputConfiguration_plistDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 plistDictionary];
  if (v3)
  {
    BOOL v9 = v3;
    if ([v3 count])
    {
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v4)
      {
        uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v7 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v5;

        id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v4 addObject:v9];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (NSArray)orderedCameraInputPreference
{
  id v3 = [(AXSSMotionTrackingInputConfiguration *)self orderedInputPreference];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__0;
    id v13 = __Block_byref_object_dispose__0;
    id v14 = 0;
    uint64_t v5 = [(AXSSMotionTrackingInputConfiguration *)self orderedInputPreference];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__AXSSMotionTrackingInputConfiguration_orderedCameraInputPreference__block_invoke;
    v8[3] = &unk_1E606CE20;
    v8[4] = &v9;
    [v5 enumerateObjectsUsingBlock:v8];

    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }

  return (NSArray *)v6;
}

void __68__AXSSMotionTrackingInputConfiguration_orderedCameraInputPreference__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  uint64_t v4 = [(AXSSMotionTrackingInputConfiguration *)&v9 description];
  uint64_t v5 = [(AXSSMotionTrackingInputConfiguration *)self orderedInputPreference];
  id v6 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];
  uint64_t v7 = [v3 stringWithFormat:@"%@ <orderedInputPreference %@ allowedTrackingTypes %@ allowSeparateInputForExpressions %d>", v4, v5, v6, -[AXSSMotionTrackingInputConfiguration allowSeparateInputForExpressions](self, "allowSeparateInputForExpressions")];

  return v7;
}

- (BOOL)supportsTrackingType:(unint64_t)a3
{
  uint64_t v5 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];

  if (!v5) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  id v6 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = [v6 containsObject:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(AXSSMotionTrackingInputConfiguration *)self orderedInputPreference];

  if (v4)
  {
    uint64_t v5 = [(AXSSMotionTrackingInputConfiguration *)self orderedInputPreference];
    id v6 = NSStringFromSelector(sel_orderedInputPreference);
    [v12 encodeObject:v5 forKey:v6];
  }
  uint64_t v7 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];

  if (v7)
  {
    char v8 = [(AXSSMotionTrackingInputConfiguration *)self allowedTrackingTypes];
    objc_super v9 = NSStringFromSelector(sel_allowedTrackingTypes);
    [v12 encodeObject:v8 forKey:v9];
  }
  BOOL v10 = [(AXSSMotionTrackingInputConfiguration *)self allowSeparateInputForExpressions];
  uint64_t v11 = NSStringFromSelector(sel_allowSeparateInputForExpressions);
  [v12 encodeBool:v10 forKey:v11];
}

- (AXSSMotionTrackingInputConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSSMotionTrackingInputConfiguration *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    BOOL v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = NSStringFromSelector(sel_orderedInputPreference);
    uint64_t v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];
    orderedInputPreference = v5->_orderedInputPreference;
    v5->_orderedInputPreference = (NSArray *)v12;

    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    objc_super v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v17 = NSStringFromSelector(sel_allowedTrackingTypes);
    v18 = [v4 decodeObjectOfClasses:v16 forKey:v17];

    if (v18) {
      id v19 = v18;
    }
    uint64_t v20 = [v18 copy];
    allowedTrackingTypes = v5->_allowedTrackingTypes;
    v5->_allowedTrackingTypes = (NSSet *)v20;

    v22 = NSStringFromSelector(sel_allowSeparateInputForExpressions);
    v5->_allowSeparateInputForExpressions = [v4 decodeBoolForKey:v22];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(AXSSMotionTrackingInputConfiguration *)self plistDictionary];
  id v4 = [[AXSSMotionTrackingInputConfiguration alloc] initWithPlistDictionary:v3];

  return v4;
}

- (BOOL)isEqualToMotionTrackingInputConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSSMotionTrackingInputConfiguration *)self plistDictionary];
  id v6 = [v4 plistDictionary];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(AXSSMotionTrackingInputConfiguration *)self plistDictionary];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AXSSMotionTrackingInputConfiguration *)self isEqualToMotionTrackingInputConfiguration:v4];

  return v5;
}

- (NSArray)orderedInputPreference
{
  return self->_orderedInputPreference;
}

- (void)setOrderedInputPreference:(id)a3
{
}

- (NSSet)allowedTrackingTypes
{
  return self->_allowedTrackingTypes;
}

- (void)setAllowedTrackingTypes:(id)a3
{
}

- (BOOL)allowSeparateInputForExpressions
{
  return self->_allowSeparateInputForExpressions;
}

- (void)setAllowSeparateInputForExpressions:(BOOL)a3
{
  self->_allowSeparateInputForExpressions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTrackingTypes, 0);

  objc_storeStrong((id *)&self->_orderedInputPreference, 0);
}

- (void)plistDictionary
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_ERROR, "ERROR: Couldn't encode object %@, encountered error: %@", buf, 0x16u);
}

@end