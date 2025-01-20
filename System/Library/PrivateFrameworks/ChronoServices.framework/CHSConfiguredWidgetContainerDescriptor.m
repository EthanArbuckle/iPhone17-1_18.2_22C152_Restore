@interface CHSConfiguredWidgetContainerDescriptor
+ (BOOL)supportsSecureCoding;
+ (CHSConfiguredWidgetContainerDescriptor)new;
- (BOOL)canAppearInSecureEnvironment;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStack;
- (BOOL)isSystemConfigured;
- (CHSConfiguredWidgetContainerDescriptor)init;
- (CHSConfiguredWidgetContainerDescriptor)initWithCoder:(id)a3;
- (CHSConfiguredWidgetContainerDescriptor)initWithUniqueIdentifier:(id)a3 location:(int64_t)a4 canAppearInSecureEnvironment:(BOOL)a5 page:(unint64_t)a6 family:(int64_t)a7 widgets:(id)a8 activeWidget:(id)a9;
- (CHSConfiguredWidgetContainerDescriptor)initWithUniqueIdentifier:(id)a3 location:(int64_t)a4 page:(unint64_t)a5 family:(int64_t)a6 widgets:(id)a7 activeWidget:(id)a8;
- (CHSConfiguredWidgetDescriptor)activeWidget;
- (NSArray)widgets;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)family;
- (int64_t)location;
- (unint64_t)hash;
- (unint64_t)page;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSConfiguredWidgetContainerDescriptor

+ (CHSConfiguredWidgetContainerDescriptor)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSConfiguredWidgetContainerDescriptor.m" lineNumber:29 description:@"use the designated initializer"];

  return 0;
}

- (CHSConfiguredWidgetContainerDescriptor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSConfiguredWidgetContainerDescriptor.m" lineNumber:34 description:@"use the designated initializer"];

  return 0;
}

- (CHSConfiguredWidgetContainerDescriptor)initWithUniqueIdentifier:(id)a3 location:(int64_t)a4 page:(unint64_t)a5 family:(int64_t)a6 widgets:(id)a7 activeWidget:(id)a8
{
  return [(CHSConfiguredWidgetContainerDescriptor *)self initWithUniqueIdentifier:a3 location:a4 canAppearInSecureEnvironment:0 page:a5 family:a6 widgets:a7 activeWidget:a8];
}

- (CHSConfiguredWidgetContainerDescriptor)initWithUniqueIdentifier:(id)a3 location:(int64_t)a4 canAppearInSecureEnvironment:(BOOL)a5 page:(unint64_t)a6 family:(int64_t)a7 widgets:(id)a8 activeWidget:(id)a9
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v12 = a8;
  id v13 = a9;
  if ([v12 count])
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_13:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"CHSConfiguredWidgetContainerDescriptor.m", 56, @"Invalid parameter not satisfying: %@", @"widgets" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
LABEL_14:
    unint64_t v15 = -1;
    goto LABEL_15;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2 object:self file:@"CHSConfiguredWidgetContainerDescriptor.m" lineNumber:55 description:@"Widget count must be > 0."];

  if (!v12) {
    goto LABEL_13;
  }
LABEL_3:
  if (!v13) {
    goto LABEL_14;
  }
LABEL_4:
  unint64_t v14 = 0;
  unint64_t v15 = -1;
  while (v14 < [v12 count])
  {
    v16 = [v12 objectAtIndexedSubscript:v14];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v17 isEqualToString:v13];

    if (v18) {
      unint64_t v15 = v14;
    }
    ++v14;
  }
  if ((v15 & 0x8000000000000000) != 0 || v15 >= [v12 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"CHSConfiguredWidgetContainerDescriptor.m" lineNumber:64 description:@"Active widget provided is invalid or not found in the widget list."];
  }
LABEL_15:
  v41.receiver = self;
  v41.super_class = (Class)CHSConfiguredWidgetContainerDescriptor;
  v22 = [(CHSConfiguredWidgetContainerDescriptor *)&v41 init];
  if (v22)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v23 = v12;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * i) _setContainer:v22];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v24);
    }

    v22->_activeWidgetIndex = v15;
    objc_storeStrong((id *)&v22->_activeWidgetUniqueIdentifier, a9);
    uint64_t v27 = [v36 copy];
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v27;

    v22->_canAppearInSecureEnvironment = a5;
    v22->_location = a4;
    v22->_page = a6;
    v22->_family = a7;
    uint64_t v29 = [v23 copy];
    widgets = v22->_widgets;
    v22->_widgets = (NSArray *)v29;

    v22->_stack = (unint64_t)[v23 count] > 1;
  }

  return v22;
}

- (BOOL)isSystemConfigured
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_widgets;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isSystemConfigured", (void)v8) & 1) == 0)
        {
          BOOL v6 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (CHSConfiguredWidgetDescriptor)activeWidget
{
  unint64_t activeWidgetIndex = self->_activeWidgetIndex;
  if ((activeWidgetIndex & 0x8000000000000000) != 0 || activeWidgetIndex >= [(NSArray *)self->_widgets count])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(NSArray *)self->_widgets objectAtIndexedSubscript:self->_activeWidgetIndex];
  }
  return (CHSConfiguredWidgetDescriptor *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      long long v8 = v7;
    }
    else {
      long long v8 = 0;
    }
  }
  else
  {
    long long v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke;
    v47[3] = &unk_1E56C8508;
    id v11 = v9;
    id v48 = v11;
    id v12 = (id)[v5 appendString:uniqueIdentifier counterpart:v47];
    int64_t location = self->_location;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_2;
    v45[3] = &unk_1E56C8530;
    id v14 = v11;
    id v46 = v14;
    id v15 = (id)[v5 appendInteger:location counterpart:v45];
    BOOL canAppearInSecureEnvironment = self->_canAppearInSecureEnvironment;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_3;
    v43[3] = &unk_1E56C8468;
    id v17 = v14;
    id v44 = v17;
    id v18 = (id)[v5 appendBool:canAppearInSecureEnvironment counterpart:v43];
    unint64_t page = self->_page;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_4;
    v41[3] = &unk_1E56C84B8;
    id v20 = v17;
    id v42 = v20;
    id v21 = (id)[v5 appendUnsignedInteger:page counterpart:v41];
    int64_t family = self->_family;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_5;
    v39[3] = &unk_1E56C8530;
    id v23 = v20;
    id v40 = v23;
    id v24 = (id)[v5 appendInteger:family counterpart:v39];
    widgets = self->_widgets;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_6;
    v37[3] = &unk_1E56C8178;
    id v26 = v23;
    id v38 = v26;
    id v27 = (id)[v5 appendObject:widgets counterpart:v37];
    activeWidgetUniqueIdentifier = self->_activeWidgetUniqueIdentifier;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_7;
    v35 = &unk_1E56C8508;
    id v36 = v26;
    id v29 = (id)[v5 appendString:activeWidgetUniqueIdentifier counterpart:&v32];
    char v30 = objc_msgSend(v5, "isEqual", v32, v33, v34, v35);
  }
  else
  {
    char v30 = 0;
  }

  return v30;
}

id __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 56);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 64);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48);
}

id __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

id __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_uniqueIdentifier];
  id v5 = (id)[v3 appendInteger:self->_location];
  id v6 = (id)[v3 appendBool:self->_canAppearInSecureEnvironment];
  id v7 = (id)[v3 appendUnsignedInteger:self->_page];
  id v8 = (id)[v3 appendInteger:self->_family];
  id v9 = (id)[v3 appendObject:self->_widgets];
  id v10 = (id)[v3 appendString:self->_activeWidgetUniqueIdentifier];
  unint64_t v11 = [v3 hash];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(CHSConfiguredWidgetContainerDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSConfiguredWidgetContainerDescriptor *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(CHSConfiguredWidgetContainerDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSConfiguredWidgetContainerDescriptor *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__CHSConfiguredWidgetContainerDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  unint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

uint64_t __80__CHSConfiguredWidgetContainerDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 32) withName:@"uniqueIdentifier"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = CHSWidgetLocationDescription(*(void *)(*(void *)(a1 + 40) + 56));
  [v2 appendString:v3 withName:@"location"];

  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) withName:@"canAppearInSecureEnvironment"];
  id v5 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 64) withName:@"page"];
  id v6 = *(void **)(a1 + 32);
  id v7 = CHSWidgetFamilyDescription(*(void *)(*(void *)(a1 + 40) + 48));
  [v6 appendString:v7 withName:@"widgetFamily"];

  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 40) withName:@"widgets" skipIfEmpty:0];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  return [v8 appendString:v9 withName:@"activeWidget"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"uid"];
  [v5 encodeInteger:self->_location forKey:@"location"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_page];
  [v5 encodeObject:v4 forKey:@"page"];

  [v5 encodeInteger:self->_family forKey:@"family"];
  [v5 encodeObject:self->_widgets forKey:@"widgets"];
  [v5 encodeObject:self->_activeWidgetUniqueIdentifier forKey:@"activeWidget"];
  [v5 encodeBool:self->_canAppearInSecureEnvironment forKey:@"canAppearInSE"];
}

- (CHSConfiguredWidgetContainerDescriptor)initWithCoder:(id)a3
{
  id v3 = a3;
  id v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"uid"];
  uint64_t v4 = [v3 decodeIntegerForKey:@"location"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"page"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  unint64_t v7 = [v3 decodeIntegerForKey:@"family"];
  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"activeWidget"];
  uint64_t v21 = v6;
  uint64_t v9 = [v3 decodeBoolForKey:@"canAppearInSE"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke;
  aBlock[3] = &unk_1E56C9318;
  id v10 = v8;
  id v24 = v10;
  id v11 = v20;
  id v25 = v11;
  id v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v3 decodeObjectOfClasses:v15 forKey:@"widgets"];

  id v17 = v12[2](v12, v16);

  if (v17 && CHSWidgetFamilyIsValid(v7))
  {
    id v18 = [(CHSConfiguredWidgetContainerDescriptor *)self initWithUniqueIdentifier:v11 location:v4 canAppearInSecureEnvironment:v9 page:v21 family:v7 widgets:v17 activeWidget:v10];
    self = v18;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

id __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = CHSLogChronoServices();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v17 = (objc_class *)objc_opt_class();
              id v18 = NSStringFromClass(v17);
              __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_2(v18, buf, v16);
            }

            goto LABEL_24;
          }
          if (*(void *)(a1 + 32))
          {
            id v10 = objc_msgSend(v9, "uniqueIdentifier", (void)v21);
            char v11 = [v10 isEqualToString:*(void *)(a1 + 32)];
          }
          else
          {
            char v11 = 0;
          }
          v5 |= v11;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    if ((*(void *)(a1 + 32) == 0) | v5 & 1)
    {
      id v12 = v4;
      goto LABEL_25;
    }
    v19 = CHSLogChronoServices();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_1((uint64_t *)(a1 + 32), a1, v19);
    }
  }
  else
  {
    uint64_t v13 = CHSLogChronoServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_3(v15, buf, v13);
    }
  }
LABEL_24:
  id v12 = 0;
LABEL_25:

  return v12;
}

- (BOOL)canAppearInSecureEnvironment
{
  return self->_canAppearInSecureEnvironment;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (int64_t)family
{
  return self->_family;
}

- (int64_t)location
{
  return self->_location;
}

- (unint64_t)page
{
  return self->_page;
}

- (BOOL)isStack
{
  return self->_stack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgets, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_activeWidgetUniqueIdentifier, 0);
}

void __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "Unable to find active widget (%{public}@) matching in widget container %{public}@", (uint8_t *)&v5, 0x16u);
}

void __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "Unexpected type (%{public}@) deserializing widgets.", buf, 0xCu);
}

void __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "Unexpected collection type (%{public}@) deserializing widgets.", buf, 0xCu);
}

@end