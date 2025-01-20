@interface CKSyncEngineFetchChangesOptions
- (BOOL)CKDescriptionShouldPrintPointer;
- (BOOL)forceFetchChanges;
- (CKOperationGroup)operationGroup;
- (CKSyncEngineFetchChangesOptions)init;
- (CKSyncEngineFetchChangesOptions)initWithScope:(CKSyncEngineFetchChangesScope *)scope;
- (CKSyncEngineFetchChangesOptions)initWithZoneIDs:(id)a3;
- (CKSyncEngineFetchChangesScope)scope;
- (CKSyncEngineFetchChangesZoneConfiguration)defaultZoneConfiguration;
- (NSArray)prioritizedZoneIDs;
- (NSDictionary)zoneConfigurations;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setDefaultZoneConfiguration:(id)a3;
- (void)setForceFetchChanges:(BOOL)a3;
- (void)setOperationGroup:(CKOperationGroup *)operationGroup;
- (void)setOperationGroup:(id)a3 updateName:(BOOL)a4;
- (void)setPrioritizedZoneIDs:(NSArray *)prioritizedZoneIDs;
- (void)setScope:(CKSyncEngineFetchChangesScope *)scope;
- (void)setZoneConfigurations:(id)a3;
- (void)updateOperationGroupName;
@end

@implementation CKSyncEngineFetchChangesOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultZoneConfiguration, 0);
  objc_storeStrong((id *)&self->_zoneConfigurations, 0);
  objc_storeStrong((id *)&self->_prioritizedZoneIDs, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);

  objc_storeStrong((id *)&self->_scope, 0);
}

- (void)setOperationGroup:(id)a3 updateName:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_operationGroup, a3);
  if (v4) {
    objc_msgSend_updateOperationGroupName(v7, v8, v9, v10);
  }
  objc_sync_exit(v7);
}

- (void)setOperationGroup:(CKOperationGroup *)operationGroup
{
}

- (void)setZoneConfigurations:(id)a3
{
}

- (void)setPrioritizedZoneIDs:(NSArray *)prioritizedZoneIDs
{
}

- (void)setForceFetchChanges:(BOOL)a3
{
  self->_forceFetchChanges = a3;
}

- (void)setDefaultZoneConfiguration:(id)a3
{
}

- (NSArray)prioritizedZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"FetchChangesOptions";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v45 = a3;
  v7 = objc_msgSend_scope(self, v4, v5, v6);
  objc_msgSend_addProperty_value_shouldRedact_(v45, v8, @"scope", (uint64_t)v7, 0);

  v12 = objc_msgSend_operationGroup(self, v9, v10, v11);
  v16 = objc_msgSend_name(v12, v13, v14, v15);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v45, v17, @"group", (uint64_t)v16, 0);

  if (objc_msgSend_forceFetchChanges(self, v18, v19, v20))
  {
    v24 = NSNumber;
    uint64_t Changes = objc_msgSend_forceFetchChanges(self, v21, v22, v23);
    v28 = objc_msgSend_numberWithBool_(v24, v26, Changes, v27);
    objc_msgSend_addProperty_value_shouldRedact_(v45, v29, @"forceFetchChanges", (uint64_t)v28, 0);
  }
  v30 = objc_msgSend_defaultZoneConfiguration(self, v21, v22, v23);
  objc_msgSend_addProperty_value_shouldRedact_(v45, v31, @"defaultZoneConfiguration", (uint64_t)v30, 0);

  v35 = objc_msgSend_zoneConfigurations(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_count(v35, v36, v37, v38);

  if (v39)
  {
    v43 = objc_msgSend_zoneConfigurations(self, v40, v41, v42);
    objc_msgSend_addProperty_value_shouldRedact_(v45, v44, @"zoneConfigurations", (uint64_t)v43, 0);
  }
}

- (NSDictionary)zoneConfigurations
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)forceFetchChanges
{
  return self->_forceFetchChanges;
}

- (CKSyncEngineFetchChangesZoneConfiguration)defaultZoneConfiguration
{
  return (CKSyncEngineFetchChangesZoneConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (CKSyncEngineFetchChangesOptions)initWithScope:(CKSyncEngineFetchChangesScope *)scope
{
  BOOL v4 = scope;
  v27.receiver = self;
  v27.super_class = (Class)CKSyncEngineFetchChangesOptions;
  uint64_t v5 = [(CKSyncEngineFetchChangesOptions *)&v27 init];
  uint64_t v9 = v5;
  if (v5)
  {
    v5->_forceFetchuint64_t Changes = 0;
    uint64_t v10 = objc_msgSend_copy(v4, v6, v7, v8);
    uint64_t v11 = v10;
    if (v10) {
      v12 = v10;
    }
    else {
      v12 = (CKSyncEngineFetchChangesScope *)objc_opt_new();
    }
    v13 = v9->_scope;
    v9->_scope = v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v18 = objc_msgSend_defaultOperationGroup(v14, v15, v16, v17);
    operationGroup = v9->_operationGroup;
    v9->_operationGroup = (CKOperationGroup *)v18;

    zoneConfigurations = v9->_zoneConfigurations;
    v9->_zoneConfigurations = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v21 = objc_alloc_init(CKSyncEngineFetchChangesZoneConfiguration);
    defaultZoneConfiguration = v9->_defaultZoneConfiguration;
    v9->_defaultZoneConfiguration = v21;

    objc_msgSend_updateOperationGroupName(v9, v23, v24, v25);
  }

  return v9;
}

- (void)updateOperationGroupName
{
  v2 = self;
  CKSyncEngineFetchChangesOptions.updateOperationGroupName()();
}

- (CKOperationGroup)operationGroup
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_operationGroup;
  objc_sync_exit(v2);

  return v3;
}

- (CKSyncEngineFetchChangesScope)scope
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_scope;
  objc_sync_exit(v2);

  return v3;
}

- (CKSyncEngineFetchChangesOptions)init
{
  v3 = objc_opt_new();
  uint64_t v6 = (CKSyncEngineFetchChangesOptions *)objc_msgSend_initWithScope_(self, v4, (uint64_t)v3, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [CKSyncEngineFetchChangesOptions alloc];
  uint64_t v9 = objc_msgSend_scope(self, v6, v7, v8);
  v13 = objc_msgSend_copy(v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend_initWithScope_(v5, v14, (uint64_t)v13, v15);

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_prioritizedZoneIDs, v17, (uint64_t)a3, v18);
  objc_msgSend_setPrioritizedZoneIDs_(v16, v20, (uint64_t)v19, v21);

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_zoneConfigurations, v22, (uint64_t)a3, v23);
  objc_msgSend_setZoneConfigurations_(v16, v25, (uint64_t)v24, v26);

  v29 = objc_msgSend_copyWithZone_(self->_defaultZoneConfiguration, v27, (uint64_t)a3, v28);
  objc_msgSend_setDefaultZoneConfiguration_(v16, v30, (uint64_t)v29, v31);

  v35 = objc_msgSend_operationGroup(v16, v32, v33, v34);
  objc_msgSend_setOperationGroup_updateName_(v16, v36, (uint64_t)v35, 0);

  return v16;
}

- (CKSyncEngineFetchChangesOptions)initWithZoneIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [CKSyncEngineFetchChangesScope alloc];
    uint64_t v8 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v6, (uint64_t)v4, v7);
    uint64_t v11 = objc_msgSend_initWithZoneIDs_(v5, v9, (uint64_t)v8, v10);
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  uint64_t v14 = (CKSyncEngineFetchChangesOptions *)objc_msgSend_initWithScope_(self, v12, (uint64_t)v11, v13);

  return v14;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchChangesOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchChangesOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)setScope:(CKSyncEngineFetchChangesScope *)scope
{
  uint64_t v13 = scope;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v13, v5, v6, v7);
  uint64_t v9 = v4->_scope;
  v4->_scope = (CKSyncEngineFetchChangesScope *)v8;

  objc_msgSend_updateOperationGroupName(v4, v10, v11, v12);
  objc_sync_exit(v4);
}

@end