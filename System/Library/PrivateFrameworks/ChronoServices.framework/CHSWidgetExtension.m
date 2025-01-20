@interface CHSWidgetExtension
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLinkedOnOrAfter:(unint64_t)a3;
- (CHSEntitlementCollection)entitlements;
- (CHSExtensionIdentity)identity;
- (CHSWidgetExtension)initWithCoder:(id)a3;
- (NSArray)orderedControlDescriptors;
- (NSArray)orderedWidgetDescriptors;
- (NSString)containerBundleLocalizedDisplayName;
- (NSString)description;
- (NSString)localizedDisplayName;
- (id)_init;
- (id)containerBundleIdentifier;
- (id)controlDescriptorForKind:(id)a3;
- (id)copyFilteredToOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)descriptors;
- (id)extensionBundleIdentifier;
- (id)initFromExtension:(id)a3;
- (id)initFromExtension:(id)a3 includeIntents:(BOOL)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)orderedDescriptors;
- (id)sourceDeviceIdentifier;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:(BOOL)a3;
- (id)succinctDescriptionWithBundleIDWithoutFullIdentity;
- (id)widgetDescriptorForKind:(id)a3;
- (int64_t)dataProtectionLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetExtension

- (CHSExtensionIdentity)identity
{
  return self->_identity;
}

- (id)orderedDescriptors
{
  return self->_orderedWidgetDescriptors;
}

- (NSArray)orderedControlDescriptors
{
  return self->_orderedControlDescriptors;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetExtension;
  return [(CHSWidgetExtension *)&v3 init];
}

- (id)initFromExtension:(id)a3 includeIntents:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CHSWidgetExtension;
  v7 = [(CHSWidgetExtension *)&v46 init];
  if (v7)
  {
    uint64_t v8 = [v6 localizedDisplayName];
    localizedDisplayName = v7->_localizedDisplayName;
    v7->_localizedDisplayName = (NSString *)v8;

    uint64_t v10 = [v6 containerBundleLocalizedDisplayName];
    containerBundleLocalizedDisplayName = v7->_containerBundleLocalizedDisplayName;
    v7->_containerBundleLocalizedDisplayName = (NSString *)v10;

    uint64_t v12 = [v6 identity];
    identity = v7->_identity;
    v7->_identity = (CHSExtensionIdentity *)v12;

    v14 = [v6 entitlements];
    uint64_t v15 = [v14 copy];
    entitlements = v7->_entitlements;
    v7->_entitlements = (CHSEntitlementCollection *)v15;

    v7->_dataProtectionLevel = [v6 dataProtectionLevel];
    v7->_hashValue = 0;
    v7->_hasValidHash = 0;
    if (v4)
    {
      v17 = [v6 orderedWidgetDescriptors];
      uint64_t v18 = [v17 copy];
      orderedWidgetDescriptors = v7->_orderedWidgetDescriptors;
      v7->_orderedWidgetDescriptors = (NSArray *)v18;

      id v20 = [v6 orderedControlDescriptors];
      uint64_t v21 = [v20 copy];
      orderedControlDescriptors = v7->_orderedControlDescriptors;
      v7->_orderedControlDescriptors = (NSArray *)v21;
    }
    else
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v23 = [v6 orderedWidgetDescriptors];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v43;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v23);
            }
            id v27 = [[CHSWidgetDescriptor alloc] initFromDescriptor:*(void *)(*((void *)&v42 + 1) + 8 * v26) includeIntents:0];
            [v20 addObject:v27];

            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v24);
      }

      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithArray:v20];
      v29 = v7->_orderedWidgetDescriptors;
      v7->_orderedWidgetDescriptors = (NSArray *)v28;

      orderedControlDescriptors = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v30 = objc_msgSend(v6, "orderedControlDescriptors", 0);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v39;
        do
        {
          uint64_t v33 = 0;
          do
          {
            if (*(void *)v39 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = [[CHSControlDescriptor alloc] initFromDescriptor:*(void *)(*((void *)&v38 + 1) + 8 * v33) includeIntents:0];
            [(NSArray *)orderedControlDescriptors addObject:v34];

            ++v33;
          }
          while (v31 != v33);
          uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v31);
      }

      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithArray:orderedControlDescriptors];
      v36 = v7->_orderedControlDescriptors;
      v7->_orderedControlDescriptors = (NSArray *)v35;
    }
  }

  return v7;
}

- (id)initFromExtension:(id)a3
{
  return [(CHSWidgetExtension *)self initFromExtension:a3 includeIntents:1];
}

- (id)controlDescriptorForKind:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedControlDescriptors = self->_orderedControlDescriptors;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__CHSWidgetExtension_controlDescriptorForKind___block_invoke;
  v23[3] = &unk_1E56C88E0;
  id v18 = v4;
  id v24 = v18;
  id v6 = [(NSArray *)orderedControlDescriptors bs_firstObjectPassingTest:v23];
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = self->_orderedControlDescriptors;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = NSString;
          v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) kind];
          v14 = [v12 stringWithFormat:@"%@, ", v13];
          [v7 appendString:v14];
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
      }
      while (v9);
    }

    uint64_t v15 = CHSLogChronoServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [(CHSWidgetExtension *)self succinctDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      id v28 = v18;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_error_impl(&dword_190C6F000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find control descriptor of kind: %{public}@.  Available kinds: [%{public}@]", buf, 0x20u);
    }
  }

  return v6;
}

uint64_t __47__CHSWidgetExtension_controlDescriptorForKind___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)widgetDescriptorForKind:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedWidgetDescriptors = self->_orderedWidgetDescriptors;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__CHSWidgetExtension_widgetDescriptorForKind___block_invoke;
  v23[3] = &unk_1E56C8288;
  id v18 = v4;
  id v24 = v18;
  id v6 = [(NSArray *)orderedWidgetDescriptors bs_firstObjectPassingTest:v23];
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = self->_orderedWidgetDescriptors;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = NSString;
          v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) kind];
          v14 = [v12 stringWithFormat:@"%@, ", v13];
          [v7 appendString:v14];
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
      }
      while (v9);
    }

    uint64_t v15 = CHSLogChronoServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [(CHSWidgetExtension *)self succinctDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      id v28 = v18;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_error_impl(&dword_190C6F000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find widget descriptor of kind: %{public}@.  Available kinds: [%{public}@]", buf, 0x20u);
    }
  }

  return v6;
}

uint64_t __46__CHSWidgetExtension_widgetDescriptorForKind___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CHSWidgetExtension *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_dataProtectionLevel == v5->_dataProtectionLevel
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualArrays())
      {
        char v6 = BSEqualArrays();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (self->_hasValidHash) {
    return self->_hashValue;
  }
  uint64_t v4 = [MEMORY[0x1E4F4F758] builder];
  id v5 = (id)[v4 appendObject:self->_identity];
  id v6 = (id)[v4 appendString:self->_containerBundleLocalizedDisplayName];
  id v7 = (id)[v4 appendString:self->_localizedDisplayName];
  id v8 = (id)[v4 appendObject:self->_orderedWidgetDescriptors];
  id v9 = (id)[v4 appendObject:self->_orderedControlDescriptors];
  id v10 = (id)[v4 appendObject:self->_entitlements];
  id v11 = (id)[v4 appendInteger:self->_dataProtectionLevel];
  unint64_t v3 = [v4 hash];
  self->_hashValue = v3;
  self->_hasValidHash = 1;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CHSWidgetExtension alloc];
  return [(CHSWidgetExtension *)v4 initFromExtension:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CHSMutableWidgetExtension alloc];
  return [(CHSWidgetExtension *)v4 initFromExtension:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_identity forKey:@"identity"];
  [v5 encodeObject:self->_localizedDisplayName forKey:@"dn"];
  [v5 encodeObject:self->_containerBundleLocalizedDisplayName forKey:@"cdn"];
  [v5 encodeObject:self->_orderedWidgetDescriptors forKey:@"desc"];
  [v5 encodeObject:self->_orderedControlDescriptors forKey:@"controls"];
  entitlements = self->_entitlements;
  if (entitlements) {
    [v5 encodeObject:entitlements forKey:@"entitlements"];
  }
  [v5 encodeInteger:self->_dataProtectionLevel forKey:@"dataProtectionLevel"];
}

- (CHSWidgetExtension)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CHSWidgetExtension;
  id v5 = [(CHSWidgetExtension *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    identity = v5->_identity;
    v5->_identity = (CHSExtensionIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dn"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cdn"];
    containerBundleLocalizedDisplayName = v5->_containerBundleLocalizedDisplayName;
    v5->_containerBundleLocalizedDisplayName = (NSString *)v10;

    if ([v4 containsValueForKey:@"entitlements"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlements"];
      entitlements = v5->_entitlements;
      v5->_entitlements = (CHSEntitlementCollection *)v12;
    }
    if ([v4 containsValueForKey:@"controls"])
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      v27[0] = objc_opt_class();
      v27[1] = objc_opt_class();
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      v16 = [v14 setWithArray:v15];
      uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"controls"];
      orderedControlDescriptors = v5->_orderedControlDescriptors;
      v5->_orderedControlDescriptors = (NSArray *)v17;
    }
    else
    {
      uint64_t v15 = v5->_orderedControlDescriptors;
      v5->_orderedControlDescriptors = 0;
    }

    long long v19 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    long long v21 = [v19 setWithArray:v20];
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"desc"];
    orderedWidgetDescriptors = v5->_orderedWidgetDescriptors;
    v5->_orderedWidgetDescriptors = (NSArray *)v22;

    v5->_dataProtectionLevel = [v4 decodeIntegerForKey:@"dataProtectionLevel"];
    v5->_hashValue = 0;
    v5->_hasValidHash = 0;
  }

  return v5;
}

- (BOOL)isLinkedOnOrAfter:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_orderedWidgetDescriptors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v18 + 1) + 8 * v8) isLinkedOnOrAfter:a3]) {
        goto LABEL_18;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_orderedControlDescriptors;
  uint64_t v9 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
LABEL_11:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "isLinkedOnOrAfter:", a3, (void)v14)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v12 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (NSString)description
{
  return (NSString *)[(CHSWidgetExtension *)self descriptionWithMultilinePrefix:0];
}

- (id)copyFilteredToOptions:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192FD70A0]();
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = self->_orderedWidgetDescriptors;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v4 matchesWidgetDescriptor:v11])
        {
          if (([v4 includeIntents] & 1) != 0 || !objc_msgSend(v11, "hasIntents"))
          {
            [v6 addObject:v11];
          }
          else
          {
            BOOL v12 = (void *)[v11 copyWithoutIntents];
            [v6 addObject:v12];
          }
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  v13 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v14 = self->_orderedControlDescriptors;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        if (objc_msgSend(v4, "matchesControlDescriptor:", v18, (void)v25))
        {
          if (([v4 includeIntents] & 1) != 0 || !objc_msgSend(v18, "hasIntents"))
          {
            [v13 addObject:v18];
          }
          else
          {
            long long v19 = (void *)[v18 copyWithoutIntents];
            [v13 addObject:v19];
          }
        }
      }
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }

  long long v20 = (void *)[(CHSWidgetExtension *)self mutableCopy];
  long long v21 = (void *)[v6 copy];
  [v20 setOrderedWidgetDescriptors:v21];

  uint64_t v22 = (void *)[v13 copy];
  [v20 setOrderedControlDescriptors:v22];

  v23 = (void *)[v20 copy];

  return v23;
}

- (id)descriptors
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:self->_orderedWidgetDescriptors];
}

- (id)extensionBundleIdentifier
{
  return [(CHSExtensionIdentity *)self->_identity extensionBundleIdentifier];
}

- (id)containerBundleIdentifier
{
  return [(CHSExtensionIdentity *)self->_identity containerBundleIdentifier];
}

- (id)sourceDeviceIdentifier
{
  return [(CHSExtensionIdentity *)self->_identity deviceIdentifier];
}

- (id)succinctDescription
{
  v2 = [(CHSWidgetExtension *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionWithBundleIDWithoutFullIdentity
{
  v2 = [(CHSWidgetExtension *)self succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:1];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return [(CHSWidgetExtension *)self succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:0];
}

- (id)succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__CHSWidgetExtension_succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity___block_invoke;
  v9[3] = &unk_1E56C8908;
  BOOL v12 = a3;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendProem:self block:v9];
  id v7 = v6;

  return v7;
}

id __82__CHSWidgetExtension_succinctDescriptionBuilderWithBundleIDInsteadOfFullIdentity___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    unint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 24) extensionBundleIdentifier];
    id v4 = (id)[v2 appendObject:v3 withName:@"bundleID"];
  }
  else
  {
    id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"identity"];
  }
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "count"), @"widgets");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "count"), @"controls");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(CHSWidgetExtension *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CHSWidgetExtension_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

id __60__CHSWidgetExtension_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"identity"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"localizedDisplayName"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"localizedBundleDisplayName"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"entitlements"];
  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 32) withName:@"widgets" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 40) withName:@"controls" skipIfEmpty:1];
  return (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 56) withName:@"dataProtectionLevel"];
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)containerBundleLocalizedDisplayName
{
  return self->_containerBundleLocalizedDisplayName;
}

- (int64_t)dataProtectionLevel
{
  return self->_dataProtectionLevel;
}

- (NSArray)orderedWidgetDescriptors
{
  return self->_orderedWidgetDescriptors;
}

- (CHSEntitlementCollection)entitlements
{
  return self->_entitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_orderedControlDescriptors, 0);
  objc_storeStrong((id *)&self->_orderedWidgetDescriptors, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_containerBundleLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end