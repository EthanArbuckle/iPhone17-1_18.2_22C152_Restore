@interface CKSyncEngineSendChangesOptions
+ (id)defaultOperationGroup;
- (BOOL)CKDescriptionShouldPrintPointer;
- (CKOperationGroup)operationGroup;
- (CKSyncEngineSendChangesOptions)init;
- (CKSyncEngineSendChangesOptions)initWithScope:(CKSyncEngineSendChangesScope *)scope;
- (CKSyncEngineSendChangesOptions)initWithZoneIDs:(id)a3;
- (CKSyncEngineSendChangesScope)scope;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (id)zoneIDs;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setOperationGroup:(CKOperationGroup *)operationGroup;
- (void)setOperationGroup:(id)a3 updateName:(BOOL)a4;
- (void)setScope:(CKSyncEngineSendChangesScope *)scope;
- (void)updateOperationGroupName;
@end

@implementation CKSyncEngineSendChangesOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroup, 0);

  objc_storeStrong((id *)&self->_scope, 0);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"SendChangesOptions";
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

- (CKSyncEngineSendChangesOptions)initWithScope:(CKSyncEngineSendChangesScope *)scope
{
  BOOL v4 = scope;
  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineSendChangesOptions;
  v8 = [(CKSyncEngineSendChangesOptions *)&v23 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    uint64_t v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (CKSyncEngineSendChangesScope *)objc_opt_new();
    }
    v12 = v8->_scope;
    v8->_scope = v11;

    v13 = objc_opt_class();
    uint64_t v17 = objc_msgSend_defaultOperationGroup(v13, v14, v15, v16);
    operationGroup = v8->_operationGroup;
    v8->_operationGroup = (CKOperationGroup *)v17;

    objc_msgSend_updateOperationGroupName(v8, v19, v20, v21);
  }

  return v8;
}

+ (id)defaultOperationGroup
{
  id v2 = static CKSyncEngineSendChangesOptions.defaultOperationGroup()();

  return v2;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_scope(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"scope", (uint64_t)v8, 0);

  objc_msgSend_operationGroup(self, v10, v11, v12);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_name(v18, v13, v14, v15);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v17, @"group", (uint64_t)v16, 0);
}

- (void)updateOperationGroupName
{
  id v2 = self;
  CKSyncEngineSendChangesOptions.updateOperationGroupName()();
}

- (CKOperationGroup)operationGroup
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_operationGroup;
  objc_sync_exit(v2);

  return v3;
}

- (CKSyncEngineSendChangesScope)scope
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_scope;
  objc_sync_exit(v2);

  return v3;
}

- (CKSyncEngineSendChangesOptions)init
{
  v3 = objc_opt_new();
  uint64_t v6 = (CKSyncEngineSendChangesOptions *)objc_msgSend_initWithScope_(self, v4, (uint64_t)v3, v5);

  return v6;
}

- (CKSyncEngineSendChangesOptions)initWithZoneIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [CKSyncEngineSendChangesScope alloc];
    v8 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v6, (uint64_t)v4, v7);
    uint64_t v11 = objc_msgSend_initWithZoneIDs_(v5, v9, (uint64_t)v8, v10);
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  uint64_t v14 = (CKSyncEngineSendChangesOptions *)objc_msgSend_initWithScope_(self, v12, (uint64_t)v11, v13);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKSyncEngineSendChangesOptions alloc];
  v8 = objc_msgSend_scope(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_initWithScope_(v4, v13, (uint64_t)v12, v14);

  v19 = objc_msgSend_operationGroup(v15, v16, v17, v18);
  objc_msgSend_setOperationGroup_updateName_(v15, v20, (uint64_t)v19, 0);

  return v15;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineSendChangesOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineSendChangesOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)setScope:(CKSyncEngineSendChangesScope *)scope
{
  uint64_t v13 = scope;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v13, v5, v6, v7);
  uint64_t v9 = v4->_scope;
  v4->_scope = (CKSyncEngineSendChangesScope *)v8;

  objc_msgSend_updateOperationGroupName(v4, v10, v11, v12);
  objc_sync_exit(v4);
}

- (id)zoneIDs
{
  id v4 = objc_msgSend_scope(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_zoneIDs(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_allObjects(v8, v9, v10, v11);

  return v12;
}

@end