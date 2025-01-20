@interface CNSaveResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)didAffectMeCard;
- (CNSaveResponse)init;
- (CNSaveResponse)initWithCoder:(id)a3;
- (void)applySnapshotsToSaveRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNSaveResponse

- (CNSaveResponse)init
{
  v10.receiver = self;
  v10.super_class = (Class)CNSaveResponse;
  v2 = [(CNSaveResponse *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    contactSnapshotsByIndexPath = v2->_contactSnapshotsByIndexPath;
    v2->_contactSnapshotsByIndexPath = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    groupSnapshotsByIndexPath = v2->_groupSnapshotsByIndexPath;
    v2->_groupSnapshotsByIndexPath = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    containerSnapshotsByIndexPath = v2->_containerSnapshotsByIndexPath;
    v2->_containerSnapshotsByIndexPath = (NSMutableDictionary *)v7;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSaveResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNSaveResponse;
  uint64_t v5 = [(CNSaveResponse *)&v29 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    objc_super v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_contactSnapshotsByIndexPath"];
    contactSnapshotsByIndexPath = v5->_contactSnapshotsByIndexPath;
    v5->_contactSnapshotsByIndexPath = (NSMutableDictionary *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_groupSnapshotsByIndexPath"];
    groupSnapshotsByIndexPath = v5->_groupSnapshotsByIndexPath;
    v5->_groupSnapshotsByIndexPath = (NSMutableDictionary *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"_containerSnapshotsByIndexPath"];
    containerSnapshotsByIndexPath = v5->_containerSnapshotsByIndexPath;
    v5->_containerSnapshotsByIndexPath = (NSMutableDictionary *)v25;

    v5->_didAffectMeCard = [v4 decodeBoolForKey:@"_didAffectMeCard"];
    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactSnapshotsByIndexPath = self->_contactSnapshotsByIndexPath;
  id v5 = a3;
  [v5 encodeObject:contactSnapshotsByIndexPath forKey:@"_contactSnapshotsByIndexPath"];
  [v5 encodeObject:self->_groupSnapshotsByIndexPath forKey:@"_groupSnapshotsByIndexPath"];
  [v5 encodeObject:self->_containerSnapshotsByIndexPath forKey:@"_containerSnapshotsByIndexPath"];
  [v5 encodeBool:self->_didAffectMeCard forKey:@"_didAffectMeCard"];
}

- (void)applySnapshotsToSaveRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allContacts];
  contactSnapshotsByIndexPath = self->_contactSnapshotsByIndexPath;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke;
  v18[3] = &unk_1E56B7498;
  id v19 = v5;
  id v7 = v5;
  [(NSMutableDictionary *)contactSnapshotsByIndexPath enumerateKeysAndObjectsUsingBlock:v18];
  uint64_t v8 = [v4 allGroups];
  groupSnapshotsByIndexPath = self->_groupSnapshotsByIndexPath;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_2;
  v16[3] = &unk_1E56B74C0;
  id v17 = v8;
  id v10 = v8;
  [(NSMutableDictionary *)groupSnapshotsByIndexPath enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v11 = [v4 allContainers];

  containerSnapshotsByIndexPath = self->_containerSnapshotsByIndexPath;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_3;
  v14[3] = &unk_1E56B74E8;
  id v15 = v11;
  id v13 = v11;
  [(NSMutableDictionary *)containerSnapshotsByIndexPath enumerateKeysAndObjectsUsingBlock:v14];
}

void __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v11, "indexAtPosition:", 0));
  if ((unint64_t)[v11 length] < 2)
  {
    id v9 = v6;
  }
  else
  {
    uint64_t v7 = [v11 indexAtPosition:1];
    uint64_t v8 = [v6 linkedContacts];
    id v9 = [v8 objectAtIndex:v7];
  }
  id v10 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();
  [v9 updateStateFromContact:v10];
}

void __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(a2, "indexAtPosition:", 0));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();

  [v7 adoptValuesFromAndSetSnapshot:v6];
}

void __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(a2, "indexAtPosition:", 0));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();

  [v7 adoptValuesFromAndSetSnapshot:v6];
}

- (BOOL)didAffectMeCard
{
  return self->_didAffectMeCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerSnapshotsByIndexPath, 0);
  objc_storeStrong((id *)&self->_groupSnapshotsByIndexPath, 0);

  objc_storeStrong((id *)&self->_contactSnapshotsByIndexPath, 0);
}

@end