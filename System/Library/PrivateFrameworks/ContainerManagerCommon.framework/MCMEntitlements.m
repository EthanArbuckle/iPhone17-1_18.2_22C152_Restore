@interface MCMEntitlements
+ (id)appGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)copyGroupEntitlementForIdentifier:(id)a3 entitlements:(id)a4 groupKey:(id)a5;
+ (id)noReferenceAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)protectedAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)publicAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)publicEntitlementForGroupContainerClass:(unint64_t)a3;
+ (id)systemGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
- (BOOL)allowed;
- (BOOL)canControlCaches;
- (BOOL)canDelete;
- (BOOL)canDeleteContainerContent;
- (BOOL)canManageUserManagedAssets;
- (BOOL)canPerformDataMigration;
- (BOOL)canReadReferences;
- (BOOL)canReadWriteReferences;
- (BOOL)canRepair;
- (BOOL)canStageSharedContent;
- (BOOL)hasDaemonContainer;
- (BOOL)hasSystemContainer;
- (BOOL)isAllowedToAccessCodesignMapping;
- (BOOL)isAllowedToAccessInfoMetadata;
- (BOOL)isAllowedToAccessUserAssets;
- (BOOL)isAllowedToChangeReferences;
- (BOOL)isAllowedToControlCaches;
- (BOOL)isAllowedToDelete;
- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3;
- (BOOL)isAllowedToLookupContainerIdentity:(id)a3;
- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4;
- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4;
- (BOOL)isAllowedToReadReferences;
- (BOOL)isAllowedToRecreateContainerStructure;
- (BOOL)isAllowedToRegenerateDirectoryUUIDs;
- (BOOL)isAllowedToReplaceContainers;
- (BOOL)isAllowedToRestoreContainer;
- (BOOL)isAllowedToSetDataProtection;
- (BOOL)isAllowedToStageSharedContent;
- (BOOL)isAllowedToStartDataMigration;
- (BOOL)isAllowedToStartUserDataMigration;
- (BOOL)isAllowedToTest;
- (BOOL)isAllowedToWipeAnyDataContainer;
- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3;
- (BOOL)isEntitledForLookupWithClass:(unint64_t)a3 identifier:(id)a4;
- (BOOL)isOwnerOfContainerWithClass:(unint64_t)a3 identifier:(id)a4;
- (BOOL)isOwnerOfProtectedAppGroupContainerWithIdentifier:(id)a3;
- (BOOL)negatesReferenceToAppGroupIdentifier:(id)a3;
- (BOOL)otherIDLookup;
- (BOOL)privileged;
- (BOOL)proxyAllowed;
- (BOOL)requestsNoContainer;
- (BOOL)testabilityAllowed;
- (MCMContainerClassIterator)classIterator;
- (MCMEntitlements)initWithEntitlements:(id)a3 clientIdentifier:(id)a4 classIterator:(id)a5;
- (NSDictionary)lookup;
- (NSDictionary)rawEntitlements;
- (NSString)identifier;
- (id)_arrayOfStringsFromArray:(id)a3;
- (id)_setOfStringsFromArray:(id)a3;
- (id)appGroupIdentifiers;
- (id)containerRequiredIdentifier;
- (id)copyEntitlementsDictionaryByAddingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4;
- (id)copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:(id)a3;
- (id)copyEntitlementsDictionaryByRemovingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4;
- (id)copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:(id)a3;
- (id)initForPrivilegedAnonymous;
- (id)lookupForContainerClass:(unint64_t)a3;
- (id)noReferenceAppGroupIdentifiers;
- (id)protectedAppGroupIdentifiers;
- (id)publicAppGroupIdentifiers;
- (id)systemGroupIdentifiers;
- (int)_dataProtectionClassFromString:(id)a3;
- (int)dataProtectionClassIfAvailable;
- (int)intendedDataProtectionClass;
- (void)prune;
- (void)setRawEntitlements:(id)a3;
@end

@implementation MCMEntitlements

- (void)prune
{
  v3 = [(MCMEntitlements *)self rawEntitlements];
  v4 = [v3 allKeys];
  id v7 = [v4 arrayByExcludingToObjectsInArray:&unk_1F2F12470];

  v5 = [(MCMEntitlements *)self rawEntitlements];
  v6 = [v5 dictionaryWithValuesForKeys:v7];
  [(MCMEntitlements *)self setRawEntitlements:v6];
}

- (void)setRawEntitlements:(id)a3
{
  p_rawEntitlements = &self->_rawEntitlements;

  objc_storeStrong((id *)p_rawEntitlements, a3);
}

- (BOOL)isOwnerOfContainerWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  if (a3 == 13)
  {
    id v7 = [(MCMEntitlements *)self systemGroupIdentifiers];
  }
  else
  {
    if (a3 != 7)
    {
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        if (![(MCMEntitlements *)self hasSystemContainer]) {
          goto LABEL_13;
        }
      }
      else if (a3 == 10 && ![(MCMEntitlements *)self hasDaemonContainer])
      {
        goto LABEL_13;
      }
      v11 = [(MCMEntitlements *)self identifier];
      char v10 = [v6 isEqualToString:v11];

      goto LABEL_14;
    }
    id v7 = [(MCMEntitlements *)self appGroupIdentifiers];
  }
  v8 = v7;
  char v9 = [v7 containsObject:v6];

  if ((v9 & 1) == 0)
  {
LABEL_13:
    char v10 = 0;
    goto LABEL_14;
  }
  char v10 = 1;
LABEL_14:

  return v10;
}

- (id)systemGroupIdentifiers
{
  v3 = objc_opt_class();
  v4 = [(MCMEntitlements *)self identifier];
  v5 = [(MCMEntitlements *)self rawEntitlements];
  id v6 = [v3 systemGroupIdentifiersForIdentifier:v4 entitlements:v5];

  return v6;
}

- (BOOL)hasSystemContainer
{
  v2 = [(MCMEntitlements *)self rawEntitlements];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.security.system-container"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    if ([(MCMEntitlements *)self allowed]
      || [(MCMEntitlements *)self otherIDLookup]
      || [v6 count] == 1
      && ([v6 anyObject],
          char v9 = objc_claimAutoreleasedReturnValue(),
          [(MCMEntitlements *)self identifier],
          char v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v9 isEqualToString:v10],
          v10,
          v9,
          (v11 & 1) != 0))
    {
      BOOL v7 = 1;
    }
    else
    {
      v12 = [(MCMEntitlements *)self lookupForContainerClass:a3];
      v13 = v12;
      BOOL v7 = v12 && ![v12 count];
    }
  }
  else
  {
    v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v15 = 136446466;
      v16 = "-[MCMEntitlements isAllowedToLookupGroupContainersOfClass:ownedByIdentifiers:]";
      __int16 v17 = 1024;
      int v18 = 301;
      _os_log_fault_impl(&dword_1D7739000, v8, OS_LOG_TYPE_FAULT, "Invalid nil parameter passed to %{public}s; %d",
        (uint8_t *)&v15,
        0x12u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEntitledForLookupWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(MCMEntitlements *)self identifier];
  if (a3 == 13)
  {
    char v11 = objc_opt_class();
    char v9 = [(MCMEntitlements *)self rawEntitlements];
    uint64_t v10 = [v11 systemGroupIdentifiersForIdentifier:v7 entitlements:v9];
  }
  else
  {
    if (a3 != 7) {
      goto LABEL_7;
    }
    v8 = objc_opt_class();
    char v9 = [(MCMEntitlements *)self rawEntitlements];
    uint64_t v10 = [v8 appGroupIdentifiersForIdentifier:v7 entitlements:v9];
  }
  v12 = (void *)v10;

  char v13 = [v12 containsObject:v6];
  if (v13)
  {
    v14 = 0;
LABEL_10:
    char v16 = 1;
    goto LABEL_12;
  }
LABEL_7:
  int v15 = [(MCMEntitlements *)self lookupForContainerClass:a3];
  v14 = v15;
  if (!v15)
  {
    char v16 = 0;
    goto LABEL_12;
  }
  if (![v15 count]) {
    goto LABEL_10;
  }
  char v16 = [v14 containsObject:v6];
LABEL_12:

  return v16;
}

- (id)appGroupIdentifiers
{
  v3 = objc_opt_class();
  id v4 = [(MCMEntitlements *)self identifier];
  id v5 = [(MCMEntitlements *)self rawEntitlements];
  id v6 = [v3 appGroupIdentifiersForIdentifier:v4 entitlements:v5];

  return v6;
}

- (BOOL)isAllowedToLookupContainerIdentity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (self->_isSimulatorTestClient
      || [(MCMEntitlements *)self privileged]
      || [(MCMEntitlements *)self allowed])
    {
      char v5 = 1;
      goto LABEL_9;
    }
    v8 = [v4 identifier];
    uint64_t v9 = [v4 containerClass];
    uint64_t v10 = [(MCMEntitlements *)self identifier];
    if ([(MCMEntitlements *)self otherIDLookup]) {
      goto LABEL_11;
    }
    if (v9 == 13)
    {
      v14 = +[MCMEntitlementBypassList sharedBypassList];
      char v15 = [v14 systemGroupContainerIdIsWellknown:v8];

      if ((v15 & 1) == 0 && ([v8 isEqualToString:v10] & 1) == 0) {
        goto LABEL_25;
      }
    }
    else if (v9 == 12)
    {
      char v11 = +[MCMEntitlementBypassList sharedBypassList];
      char v12 = [v11 systemContainerIdIsWellknown:v8];

      if ((v12 & 1) == 0)
      {
        if ([v8 isEqualToString:v10])
        {
          BOOL v13 = [(MCMEntitlements *)self hasSystemContainer];
LABEL_24:
          char v5 = v13;
          goto LABEL_12;
        }
LABEL_25:
        if (![(MCMEntitlements *)self isEntitledForLookupWithClass:v9 identifier:v8])
        {
          char v16 = +[MCMEntitlementBypassList sharedBypassList];
          char v5 = [v16 isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:v10 forContainerClass:v9 containerIdentifier:v8];

          goto LABEL_12;
        }
      }
    }
    else
    {
      if (([v8 isEqualToString:v10] & 1) == 0) {
        goto LABEL_25;
      }
      if (v9 == 10)
      {
        BOOL v13 = [(MCMEntitlements *)self hasDaemonContainer];
        goto LABEL_24;
      }
    }
LABEL_11:
    char v5 = 1;
LABEL_12:

    goto LABEL_9;
  }
  id v6 = container_log_handle_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v17 = 136446466;
    int v18 = "-[MCMEntitlements isAllowedToLookupContainerIdentity:]";
    __int16 v19 = 1024;
    int v20 = 227;
    _os_log_fault_impl(&dword_1D7739000, v6, OS_LOG_TYPE_FAULT, "Invalid nil parameter passed to %{public}s; %d",
      (uint8_t *)&v17,
      0x12u);
  }

  char v5 = 0;
LABEL_9:

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)otherIDLookup
{
  v2 = [(MCMEntitlements *)self rawEntitlements];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.otherIdLookup"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)allowed
{
  v2 = [(MCMEntitlements *)self rawEntitlements];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.allowed"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (NSDictionary)rawEntitlements
{
  return self->_rawEntitlements;
}

- (BOOL)privileged
{
  return self->_privileged;
}

+ (id)systemGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[a1 copyGroupEntitlementForIdentifier:v6 entitlements:v7 groupKey:@"com.apple.security.system-groups"];
  uint64_t v9 = v8;
  if (v8 && [v8 count]
    || (v10 = (void *)[a1 copyGroupEntitlementForIdentifier:v6 entitlements:v7 groupKey:@"com.apple.security.system-group-containers"], v9, (uint64_t v9 = v10) != 0))
  {
    if ([v9 count])
    {
      char v11 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_9881];
      uint64_t v10 = [v9 filteredSetUsingPredicate:v11];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

+ (id)appGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 set];
  uint64_t v10 = [a1 publicAppGroupIdentifiersForIdentifier:v8 entitlements:v7];
  char v11 = [a1 protectedAppGroupIdentifiersForIdentifier:v8 entitlements:v7];

  [v9 unionSet:v10];
  [v9 unionSet:v11];
  if ([v9 count]) {
    char v12 = (void *)[v9 copy];
  }
  else {
    char v12 = 0;
  }

  return v12;
}

+ (id)publicAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v4 = (void *)[a1 copyGroupEntitlementForIdentifier:a3 entitlements:a4 groupKey:@"com.apple.security.application-groups"];

  return v4;
}

+ (id)protectedAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v4 = (void *)[a1 copyGroupEntitlementForIdentifier:a3 entitlements:a4 groupKey:@"com.apple.private.security.restricted-application-groups"];

  return v4;
}

+ (id)copyGroupEntitlementForIdentifier:(id)a3 entitlements:(id)a4 groupKey:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 objectForKeyedSubscript:v8];
  if (!v9) {
    goto LABEL_19;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if (isKindOfClass)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:&v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:&v21 count:16];
          if (v13) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }

      int v18 = container_log_handle_for_category();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v21 = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v19 = "Entitlement %@ for %@ contains non-string values; ignoring.";
      goto LABEL_22;
    }
LABEL_11:

    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v18 = container_log_handle_for_category();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

LABEL_19:
        int v17 = 0;
        goto LABEL_20;
      }
      int v21 = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v19 = "Entitlement %@ for %@ does not contain supported types; ignoring.";
LABEL_22:
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x16u);
      goto LABEL_18;
    }
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  }
  int v17 = (void *)v16;
LABEL_20:

  return v17;
}

uint64_t __68__MCMEntitlements_systemGroupIdentifiersForIdentifier_entitlements___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 hasPrefix:@"systemgroup."];
  if ((v3 & 1) == 0)
  {
    id v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_error_impl(&dword_1D7739000, v4, OS_LOG_TYPE_ERROR, "System group ID %@ does not have proper prefix, ignoring.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (MCMEntitlements)initWithEntitlements:(id)a3 clientIdentifier:(id)a4 classIterator:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MCMEntitlements;
  id v11 = [(MCMEntitlements *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_isSimulatorTestClient = 0;
    if (v8) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v11->_rawEntitlements, v13);
    objc_storeStrong((id *)&v12->_identifier, a4);
    v12->_privileged = 0;
    lookup = v12->_lookup;
    v12->_lookup = 0;

    objc_storeStrong((id *)&v12->_classIterator, a5);
  }

  return v12;
}

- (BOOL)negatesReferenceToAppGroupIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MCMEntitlements *)self noReferenceAppGroupIdentifiers];
  int v6 = v5;
  BOOL v7 = v5 && ([v5 containsObject:v4] & 1) != 0;

  return v7;
}

- (id)noReferenceAppGroupIdentifiers
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MCMEntitlements *)self identifier];
  id v5 = [(MCMEntitlements *)self rawEntitlements];
  int v6 = [v3 noReferenceAppGroupIdentifiersForIdentifier:v4 entitlements:v5];

  return v6;
}

+ (id)noReferenceAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v4 = (void *)[a1 copyGroupEntitlementForIdentifier:a3 entitlements:a4 groupKey:@"com.apple.private.MobileContainerManager.appGroup.noReference"];
  id v5 = v4;
  if (v4 && ![v4 count]) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_rawEntitlements, 0);
  objc_storeStrong((id *)&self->_sanitizedWipe, 0);

  objc_storeStrong((id *)&self->_sanitizedLookup, 0);
}

- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  if ([(MCMEntitlements *)self allowed] || [(MCMEntitlements *)self otherIDLookup])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v10 = [(MCMEntitlements *)self lookupForContainerClass:a3];
    BOOL v7 = v10;
    if (!v10)
    {
      char v8 = 0;
      goto LABEL_5;
    }
    if ([v10 count])
    {
      char v8 = [v7 containsObject:v6];
      goto LABEL_5;
    }
  }
  char v8 = 1;
LABEL_5:

  return v8;
}

- (id)lookupForContainerClass:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (!v3->_sanitizedLookup)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(MCMEntitlements *)v3 lookup];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D9478DF0]();
      BOOL v7 = [(MCMEntitlements *)v3 classIterator];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __43__MCMEntitlements_lookupForContainerClass___block_invoke;
      v14[3] = &unk_1E6A80780;
      v14[4] = v3;
      id v15 = v4;
      [v7 selectWithFlags:393216 iterator:v14];
    }
    uint64_t v8 = [v4 copy];
    sanitizedLookup = v3->_sanitizedLookup;
    v3->_sanitizedLookup = (NSDictionary *)v8;
  }
  objc_sync_exit(v3);

  id v10 = v3->_sanitizedLookup;
  id v11 = [NSNumber numberWithUnsignedLongLong:container_class_normalized()];
  uint64_t v12 = [(NSDictionary *)v10 objectForKeyedSubscript:v11];

  return v12;
}

- (BOOL)isAllowedToAccessUserAssets
{
  if ([(MCMEntitlements *)self allowed]) {
    return 1;
  }

  return [(MCMEntitlements *)self canManageUserManagedAssets];
}

- (BOOL)canManageUserManagedAssets
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.userManagedAssets"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (int)_dataProtectionClassFromString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F28340]])
  {
    int v4 = 1;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F28348]])
  {
LABEL_4:
    int v4 = 2;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F28358]]) {
    goto LABEL_6;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F28378]])
  {
    int v4 = 4;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F28388]]) {
    goto LABEL_4;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F28360]])
  {
LABEL_6:
    int v4 = 3;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F28368]])
  {
    int v4 = 7;
  }
  else
  {
    char v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D7739000, v6, OS_LOG_TYPE_DEFAULT, "Unrecognized value for data protection entitlement: [%@]", (uint8_t *)&v7, 0xCu);
    }

    int v4 = 0;
  }
LABEL_9:

  return v4;
}

- (id)_arrayOfStringsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __44__MCMEntitlements__arrayOfStringsFromArray___block_invoke;
  uint64_t v12 = &unk_1E6A802B8;
  id v13 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:&v9];

  int v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __44__MCMEntitlements__arrayOfStringsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)_setOfStringsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __42__MCMEntitlements__setOfStringsFromArray___block_invoke;
  uint64_t v12 = &unk_1E6A802B8;
  id v13 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:&v9];

  int v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __42__MCMEntitlements__setOfStringsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)copyEntitlementsDictionaryByAddingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4
{
  id v6 = a4;
  int v7 = [(MCMEntitlements *)self rawEntitlements];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(id)objc_opt_class() publicEntitlementForGroupContainerClass:a3];
  if (v9)
  {
    if (a3 == 13)
    {
      id v15 = [(MCMEntitlements *)self systemGroupIdentifiers];
      uint64_t v16 = (void *)[v15 mutableCopy];
      uint64_t v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [MEMORY[0x1E4F1CA80] set];
      }
      __int16 v19 = v18;

      [v8 removeObjectForKey:@"com.apple.security.system-group-containers"];
    }
    else if (a3 == 7)
    {
      uint64_t v10 = [(MCMEntitlements *)self publicAppGroupIdentifiers];
      id v11 = (void *)[v10 mutableCopy];
      uint64_t v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = [MEMORY[0x1E4F1CA80] set];
      }
      __int16 v19 = v13;
    }
    else
    {
      __int16 v19 = 0;
    }
    [v19 addObject:v6];
    int v20 = [v19 allObjects];
    [v8 setObject:v20 forKeyedSubscript:v9];

    uint64_t v14 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MCMEntitlements *)self rawEntitlements];
  id v6 = (void *)[v5 mutableCopy];

  int v7 = [(MCMEntitlements *)self systemGroupIdentifiers];
  id v8 = (void *)[v7 mutableCopy];

  [v6 removeObjectForKey:@"com.apple.security.system-group-containers"];
  if (v8)
  {
    [v8 removeObject:v4];
    uint64_t v9 = [v8 allObjects];
    [v6 setObject:v9 forKeyedSubscript:@"com.apple.security.system-groups"];
  }
  else
  {
    [v6 removeObjectForKey:@"com.apple.security.system-groups"];
  }
  uint64_t v10 = (void *)[v6 copy];

  return v10;
}

- (id)copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MCMEntitlements *)self rawEntitlements];
  id v6 = (void *)[v5 mutableCopy];

  int v7 = [(MCMEntitlements *)self publicAppGroupIdentifiers];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(MCMEntitlements *)self protectedAppGroupIdentifiers];
  uint64_t v10 = (void *)[v9 mutableCopy];

  if (!v8)
  {
    [v6 removeObjectForKey:@"com.apple.security.application-groups"];
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    [v6 removeObjectForKey:@"com.apple.private.security.restricted-application-groups"];
    goto LABEL_6;
  }
  [v8 removeObject:v4];
  id v11 = [v8 allObjects];
  [v6 setObject:v11 forKeyedSubscript:@"com.apple.security.application-groups"];

  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  [v10 removeObject:v4];
  uint64_t v12 = [v10 allObjects];
  [v6 setObject:v12 forKeyedSubscript:@"com.apple.private.security.restricted-application-groups"];

LABEL_6:
  id v13 = (void *)[v6 copy];

  return v13;
}

- (id)copyEntitlementsDictionaryByRemovingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4
{
  id v6 = a4;
  if (a3 == 13)
  {
    id v7 = [(MCMEntitlements *)self copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:v6];
  }
  else
  {
    if (a3 != 7)
    {
      uint64_t v9 = [(MCMEntitlements *)self rawEntitlements];
      id v8 = (void *)[v9 copy];

      goto LABEL_7;
    }
    id v7 = [(MCMEntitlements *)self copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:v6];
  }
  id v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)isAllowedToChangeReferences
{
  return [(MCMEntitlements *)self canReadWriteReferences];
}

- (BOOL)isAllowedToReadReferences
{
  if ([(MCMEntitlements *)self canReadReferences]) {
    return 1;
  }

  return [(MCMEntitlements *)self canReadWriteReferences];
}

- (BOOL)isAllowedToStageSharedContent
{
  if ([(MCMEntitlements *)self allowed]) {
    return 1;
  }

  return [(MCMEntitlements *)self canStageSharedContent];
}

- (BOOL)isAllowedToStartUserDataMigration
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToStartDataMigration
{
  if ([(MCMEntitlements *)self allowed]) {
    return 1;
  }

  return [(MCMEntitlements *)self canPerformDataMigration];
}

- (BOOL)isAllowedToRestoreContainer
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToSetDataProtection
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToAccessCodesignMapping
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToTest
{
  return [(MCMEntitlements *)self testabilityAllowed];
}

- (BOOL)isAllowedToDelete
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToRegenerateDirectoryUUIDs
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToRecreateContainerStructure
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToAccessInfoMetadata
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToReplaceContainers
{
  return [(MCMEntitlements *)self allowed];
}

- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (self->_isSimulatorTestClient
      || [(MCMEntitlements *)self isAllowedToWipeAnyDataContainer])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = self;
      objc_sync_enter(v7);
      if (!v7->_sanitizedWipe)
      {
        id v8 = [(MCMEntitlements *)v7 rawEntitlements];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.wipeContainer"];
        objc_opt_class();
        id v10 = v9;
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }

        if (v11)
        {
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count"));
          for (unint64_t i = 0; i < [v11 count]; ++i)
          {
            uint64_t v14 = [v11 objectAtIndexedSubscript:i];
            objc_opt_class();
            id v15 = v14;
            if (objc_opt_isKindOfClass()) {
              id v16 = v15;
            }
            else {
              id v16 = 0;
            }

            if (v16) {
              [v12 addObject:v16];
            }
          }
          uint64_t v17 = [v12 copy];
          sanitizedWipe = v7->_sanitizedWipe;
          v7->_sanitizedWipe = (NSSet *)v17;
        }
      }
      objc_sync_exit(v7);

      char v5 = [(NSSet *)v7->_sanitizedWipe containsObject:v4];
    }
  }
  else
  {
    id v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136446466;
      int v21 = "-[MCMEntitlements isAllowedToWipePlugInDataContainerWithIdentifier:]";
      __int16 v22 = 1024;
      int v23 = 619;
      _os_log_fault_impl(&dword_1D7739000, v6, OS_LOG_TYPE_FAULT, "Invalid nil parameter passed to %{public}s; %d",
        (uint8_t *)&v20,
        0x12u);
    }

    char v5 = 0;
  }

  return v5;
}

- (BOOL)isAllowedToWipeAnyDataContainer
{
  if ([(MCMEntitlements *)self allowed]) {
    return 1;
  }

  return [(MCMEntitlements *)self canDeleteContainerContent];
}

- (BOOL)isAllowedToControlCaches
{
  if ([(MCMEntitlements *)self allowed]) {
    return 1;
  }

  return [(MCMEntitlements *)self canControlCaches];
}

- (id)containerRequiredIdentifier
{
  id v3 = [(MCMEntitlements *)self rawEntitlements];
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.private.security.container-required"];

  char v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v8 = self;
    char v9 = objc_opt_isKindOfClass();

    if (v9)
    {
      if (![v4 BOOLValue]) {
        goto LABEL_6;
      }
    }
    else if (!v4)
    {
      goto LABEL_6;
    }
    id v7 = [(MCMEntitlements *)self identifier];
    goto LABEL_9;
  }
  if ([v4 isEqual:&stru_1F2EF6598])
  {
LABEL_6:
    id v10 = 0;
    goto LABEL_10;
  }
  id v7 = v4;
LABEL_9:
  id v10 = v7;
LABEL_10:

  return v10;
}

- (id)protectedAppGroupIdentifiers
{
  id v3 = objc_opt_class();
  id v4 = [(MCMEntitlements *)self identifier];
  char v5 = [(MCMEntitlements *)self rawEntitlements];
  id v6 = [v3 protectedAppGroupIdentifiersForIdentifier:v4 entitlements:v5];

  return v6;
}

- (id)publicAppGroupIdentifiers
{
  id v3 = objc_opt_class();
  id v4 = [(MCMEntitlements *)self identifier];
  char v5 = [(MCMEntitlements *)self rawEntitlements];
  id v6 = [v3 publicAppGroupIdentifiersForIdentifier:v4 entitlements:v5];

  return v6;
}

- (int)dataProtectionClassIfAvailable
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(MCMEntitlements *)self rawEntitlements];
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.developer.default-data-protection-if-available"];

  if (v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;

      int v7 = [(MCMEntitlements *)self _dataProtectionClassFromString:v6];
LABEL_18:

      goto LABEL_19;
    }

    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass())
    {
      [(MCMEntitlements *)self _arrayOfStringsFromArray:v6];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            int v13 = [(MCMEntitlements *)self _dataProtectionClassFromString:*(void *)(*((void *)&v16 + 1) + 8 * i)];
            if (v13)
            {
              int v7 = v13;
              goto LABEL_17;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      int v7 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  int v7 = 0;
LABEL_19:

  return v7;
}

- (int)intendedDataProtectionClass
{
  int result = [(MCMEntitlements *)self dataProtectionClassIfAvailable];
  if (!result)
  {
    id v4 = [(MCMEntitlements *)self rawEntitlements];
    id v5 = [v4 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"];
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7) {
      goto LABEL_14;
    }
    id v8 = [(MCMEntitlements *)self rawEntitlements];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"data-protection-class"];
    objc_opt_class();
    id v10 = v9;
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;

    if (v7) {
      goto LABEL_14;
    }
    uint64_t v11 = [(MCMEntitlements *)self rawEntitlements];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"DataProtectionClass"];
    objc_opt_class();
    id v13 = v12;
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;

    if (v7)
    {
LABEL_14:
      int v14 = [(MCMEntitlements *)self _dataProtectionClassFromString:v7];

      return v14;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isOwnerOfProtectedAppGroupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MCMEntitlements *)self protectedAppGroupIdentifiers];
  LOBYTE(self) = [v5 containsObject:v4];

  return (char)self;
}

void __43__MCMEntitlements_lookupForContainerClass___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 name];
  if (v3)
  {
    id v4 = NSNumber;
    [v15 containerClass];
    id v5 = [v4 numberWithUnsignedLongLong:container_class_normalized()];
    id v6 = [*(id *)(a1 + 32) lookup];
    id v7 = [v6 objectForKeyedSubscript:v3];

    id v8 = v7;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [*(id *)(a1 + 32) _setOfStringsFromArray:v8];
        goto LABEL_5;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 BOOLValue])
      {
        uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
LABEL_5:
        id v10 = (void *)v9;
        if (v9)
        {
          uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

          if (v11)
          {
            uint64_t v12 = (void *)[v10 mutableCopy];
            id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
            [v12 unionSet:v13];

            uint64_t v14 = [v12 copy];
            id v10 = (void *)v14;
          }
          [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v5];
        }
      }
    }
  }
}

- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3
{
  if (self->_isSimulatorTestClient
    || [(MCMEntitlements *)self allowed]
    || [(MCMEntitlements *)self otherIDLookup])
  {
    return 1;
  }
  id v7 = [(MCMEntitlements *)self lookupForContainerClass:a3];
  id v8 = v7;
  BOOL v5 = v7 && ![v7 count];

  return v5;
}

- (NSDictionary)lookup
{
  lookup = self->_lookup;
  if (!lookup)
  {
    id v4 = [(MCMEntitlements *)self rawEntitlements];
    BOOL v5 = [v4 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.lookup"];
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = (NSDictionary *)v6;
    }
    else {
      id v7 = 0;
    }

    id v8 = self->_lookup;
    self->_lookup = v7;

    lookup = self->_lookup;
  }

  return lookup;
}

- (BOOL)hasDaemonContainer
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.security.daemon-container"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canReadWriteReferences
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.references.read-write"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canReadReferences
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.references.read-only"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)requestsNoContainer
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.security.no-container"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canDeleteContainerContent
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.deleteContainerContent"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canPerformDataMigration
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.dataMigration"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canStageSharedContent
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.stageSharedContent"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canRepair
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.repair"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canControlCaches
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.cacheControl"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canDelete
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.delete"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)testabilityAllowed
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.testability"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)proxyAllowed
{
  id v2 = [(MCMEntitlements *)self rawEntitlements];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.proxy"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (id)initForPrivilegedAnonymous
{
  id v2 = [(MCMEntitlements *)self initWithEntitlements:0 clientIdentifier:@"com.apple.containermanagerd" classIterator:0];
  id v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isSimulatorTestClient = 256;
    lookup = v2->_lookup;
    v2->_lookup = 0;
  }
  return v3;
}

+ (id)publicEntitlementForGroupContainerClass:(unint64_t)a3
{
  id v3 = @"com.apple.security.system-groups";
  if (a3 != 13) {
    id v3 = 0;
  }
  if (a3 == 7) {
    return @"com.apple.security.application-groups";
  }
  else {
    return v3;
  }
}

@end