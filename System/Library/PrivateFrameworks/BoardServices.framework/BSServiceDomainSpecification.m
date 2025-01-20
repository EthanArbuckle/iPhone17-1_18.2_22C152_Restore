@interface BSServiceDomainSpecification
- (BSServiceDomainSpecification)init;
- (NSSet)services;
- (NSString)description;
- (NSString)identifier;
- (NSString)machName;
- (id)_domainWithAdditionalServices:(id *)a1;
- (id)_initWithIdentifier:(void *)a3 machName:(void *)a4 start:(void *)a5 servicesByIdentifier:(void *)a6 derivedServiceRestrictions:(void *)a7 enableIfFeatureFlags:(void *)a8 disableIfFeatureFlags:;
- (id)_xpcSubserviceName;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)loadRBSLaunchIdentifiers;
- (id)serviceForIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_appendBodySectionToBuilder:(void *)a3 withName:(void *)a4 multilinePrefix:(char)a5 includeServices:;
- (void)_appendManagerDumpBodyToBuilder:(void *)a3 withMultilinePrefix:;
@end

@implementation BSServiceDomainSpecification

- (BSServiceDomainSpecification)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"init is not allowed on BSServiceDomainSpecification"];
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
    v16 = @"BSServiceDomainSpecification.m";
    __int16 v17 = 1024;
    int v18 = 38;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceDomainSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)machName
{
  machName = self->_machName;
  if (self->_start == 3)
  {
    if (machName)
    {
      v4 = NSString;
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [v5 bundleIdentifier];
      v7 = [v4 stringWithFormat:@"%@.%@", v6, self->_machName];
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v7 = [v5 bundleIdentifier];
    }
  }
  else
  {
    v7 = machName;
  }

  return v7;
}

- (id)loadRBSLaunchIdentifiers
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    __int16 v11 = [NSString stringWithFormat:@"cannot query RBSLaunchIdentifiers if BoardServices infrastructure has not initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v18 = v12;
      __int16 v19 = 2114;
      v20 = v14;
      __int16 v21 = 2048;
      v22 = self;
      __int16 v23 = 2114;
      v24 = @"BSServiceDomainSpecification.m";
      __int16 v25 = 1024;
      int v26 = 62;
      __int16 v27 = 2114;
      v28 = v11;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C782D7CLL);
  }
  if (self->_machName)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    v6 = [v4[13] managedEndpointByLaunchIdentifier];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__BSServiceDomainSpecification_loadRBSLaunchIdentifiers__block_invoke;
    v15[3] = &unk_1E58FC3E0;
    v15[4] = self;
    id v7 = v5;
    id v16 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v15];

    v8 = v16;
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v9;
}

void __56__BSServiceDomainSpecification_loadRBSLaunchIdentifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = [v5 name];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 40)];

  if (v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (NSSet)services
{
  return [(NSOrderedSet *)self->_orderedServices set];
}

- (id)serviceForIdentifier:(id)a3
{
  v3 = [(NSDictionary *)self->_servicesByIdentifier objectForKey:a3];

  return v3;
}

- (id)_initWithIdentifier:(void *)a3 machName:(void *)a4 start:(void *)a5 servicesByIdentifier:(void *)a6 derivedServiceRestrictions:(void *)a7 enableIfFeatureFlags:(void *)a8 disableIfFeatureFlags:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (a1)
  {
    v39.receiver = a1;
    v39.super_class = (Class)BSServiceDomainSpecification;
    a1 = (id *)objc_msgSendSuper2(&v39, sel_init);
    if (a1)
    {
      uint64_t v21 = [v15 copy];
      id v22 = a1[4];
      a1[4] = (id)v21;

      uint64_t v23 = [v16 copy];
      id v24 = a1[5];
      a1[5] = (id)v23;

      a1[7] = a4;
      uint64_t v25 = [v17 copy];
      id v26 = a1[1];
      a1[1] = (id)v25;

      uint64_t v27 = [v19 copy];
      id v28 = a1[2];
      a1[2] = (id)v27;

      uint64_t v29 = [v20 copy];
      id v30 = a1[3];
      a1[3] = (id)v29;

      v31 = (void *)MEMORY[0x1E4F1CAA0];
      v32 = [a1[1] allValues];
      v33 = [v32 sortedArrayUsingComparator:&__block_literal_global_0];
      uint64_t v34 = [v31 orderedSetWithArray:v33];
      id v35 = a1[6];
      a1[6] = (id)v34;

      uint64_t v36 = [v18 copy];
      id v37 = a1[8];
      a1[8] = (id)v36;
    }
  }

  return a1;
}

uint64_t __158__BSServiceDomainSpecification__initWithIdentifier_machName_start_servicesByIdentifier_derivedServiceRestrictions_enableIfFeatureFlags_disableIfFeatureFlags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  v6 = [v4 identifier];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

- (id)_domainWithAdditionalServices:(id *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (![v3 count])
    {
LABEL_14:
      a1 = a1;
      goto LABEL_16;
    }
    id v5 = (void *)[a1[1] mutableCopy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          __int16 v11 = objc_msgSend(v10, "identifier", (void)v16);
          id v12 = [v5 objectForKey:v11];
          BOOL v13 = v12 == 0;

          if (v13)
          {
            v14 = [v10 identifier];
            [v5 setObject:v10 forKey:v14];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    if ([a1[1] isEqualToDictionary:v5])
    {

      goto LABEL_14;
    }
    a1 = -[BSServiceDomainSpecification _initWithIdentifier:machName:start:servicesByIdentifier:derivedServiceRestrictions:enableIfFeatureFlags:disableIfFeatureFlags:]((id *)[BSServiceDomainSpecification alloc], a1[4], a1[5], a1[7], v5, a1[8], a1[2], a1[3]);
  }
LABEL_16:

  return a1;
}

- (id)_xpcSubserviceName
{
  if (a1)
  {
    if (a1[7] == (id)3) {
      a1 = (id *)a1[5];
    }
    else {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_appendManagerDumpBodyToBuilder:(void *)a3 withMultilinePrefix:
{
  id v6 = a2;
  id v5 = a3;
  if (a1) {
    -[BSServiceDomainSpecification _appendBodySectionToBuilder:withName:multilinePrefix:includeServices:](a1, v6, @"specification", v5, 0);
  }
}

- (void)_appendBodySectionToBuilder:(void *)a3 withName:(void *)a4 multilinePrefix:(char)a5 includeServices:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __101__BSServiceDomainSpecification__appendBodySectionToBuilder_withName_multilinePrefix_includeServices___block_invoke;
    v12[3] = &unk_1E58FC428;
    id v13 = v9;
    uint64_t v14 = a1;
    char v15 = a5;
    [v13 appendBodySectionWithName:v10 multilinePrefix:v11 block:v12];
  }
}

- (NSString)description
{
  return (NSString *)[(BSServiceDomainSpecification *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSServiceDomainSpecification *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_identifier withName:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BSServiceDomainSpecification *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceDomainSpecification *)self succinctDescriptionBuilder];
  -[BSServiceDomainSpecification _appendBodySectionToBuilder:withName:multilinePrefix:includeServices:]((uint64_t)self, v5, 0, v4, 1);

  return v5;
}

void __101__BSServiceDomainSpecification__appendBodySectionToBuilder_withName_multilinePrefix_includeServices___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 40) withName:@"MachName" skipIfEmpty:1];
  v2 = *(void **)(a1 + 32);
  NSStringFromBSServiceDomainStartType(*(void *)(*(void *)(a1 + 40) + 56));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:");

  id v3 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 64) allObjects];
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:");

  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"EnableIfFeatureFlags" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 24) withName:@"DisableIfFeatureFlags" skipIfEmpty:1];
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = [*(id *)(*(void *)(a1 + 40) + 48) array];
    objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedServiceRestrictions, 0);
  objc_storeStrong((id *)&self->_orderedServices, 0);
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_disableIfFeatureFlags, 0);
  objc_storeStrong((id *)&self->_enableIfFeatureFlags, 0);

  objc_storeStrong((id *)&self->_servicesByIdentifier, 0);
}

@end