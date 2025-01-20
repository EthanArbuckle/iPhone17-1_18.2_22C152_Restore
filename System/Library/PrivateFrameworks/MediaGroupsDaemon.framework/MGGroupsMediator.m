@interface MGGroupsMediator
- (BOOL)allowsClientEdits;
- (BOOL)hasPendingChanges;
- (MGGroupsMediator)initWithGroupsQueryAgent:(id)a3;
- (MGGroupsQueryAgent)queryAgent;
- (NSArray)activities;
- (NSUUID)identifier;
- (id)currentGroups;
- (id)description;
- (id)group:(id)a3 addMember:(id)a4;
- (id)group:(id)a3 removeMember:(id)a4;
- (id)group:(id)a3 renameTo:(id)a4;
- (id)groupsForUpdate_unsafe;
- (id)groups_unsafe;
- (id)startActivityWithName:(id)a3;
- (void)_withLock:(id)a3;
- (void)addGroup:(id)a3;
- (void)dealloc;
- (void)endActivity:(id)a3;
- (void)removeGroup:(id)a3;
- (void)removeGroup:(id)a3 ifExists_unsafe:(BOOL *)a4;
- (void)removeGroupWithIdentifier:(id)a3;
- (void)setActivities:(id)a3;
- (void)setAllowsClientEdits:(BOOL)a3;
- (void)setPendingChanges:(BOOL)a3;
- (void)upsertGroup_unsafe:(id)a3;
@end

@implementation MGGroupsMediator

- (MGGroupsMediator)initWithGroupsQueryAgent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MGGroupsMediator;
  v5 = [(MGGroupsMediator *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    identifier = v6->_identifier;
    v6->_identifier = v7;

    objc_storeWeak((id *)&v6->_queryAgent, v4);
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    activities = v6->_activities;
    v6->_activities = v9;

    v11 = (NSDictionary *)objc_alloc_init(NSDictionary);
    groups = v6->_groups;
    v6->_groups = v11;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(MGGroupsMediator *)self queryAgent];
  [v3 groupsMediatorRemoved:self];

  v4.receiver = self;
  v4.super_class = (Class)MGGroupsMediator;
  [(MGGroupsMediator *)&v4 dealloc];
}

- (id)groups_unsafe
{
  os_unfair_lock_assert_owner(&self->_lock);
  groups = self->_groups;
  return groups;
}

- (void)upsertGroup_unsafe:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6 = [(MGGroupsMediator *)self groups_unsafe];
  v7 = (NSDictionary *)[v6 mutableCopy];

  v8 = [v5 identifier];
  [(NSDictionary *)v7 setObject:v5 forKey:v8];

  groups = self->_groups;
  self->_groups = v7;

  [(MGGroupsMediator *)self setPendingChanges:1];
}

- (void)removeGroup:(id)a3 ifExists_unsafe:(BOOL *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v12 = [(MGGroupsMediator *)self groups_unsafe];
  v8 = [v7 identifier];

  v9 = [v12 objectForKey:v8];
  *a4 = v9 != 0;

  if (v9)
  {
    v10 = (NSDictionary *)[v12 mutableCopy];
    [(NSDictionary *)v10 removeObjectForKey:v8];
    groups = self->_groups;
    self->_groups = v10;

    [(MGGroupsMediator *)self setPendingChanges:1];
  }
}

- (id)groupsForUpdate_unsafe
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(MGGroupsMediator *)self activities];
  if ([v3 count])
  {
  }
  else
  {
    BOOL v4 = [(MGGroupsMediator *)self hasPendingChanges];

    if (v4)
    {
      id v5 = [(MGGroupsMediator *)self groups_unsafe];
      goto LABEL_6;
    }
  }
  id v5 = 0;
LABEL_6:
  return v5;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  BOOL v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __31__MGGroupsMediator_description__block_invoke;
  v12[3] = &unk_26485E418;
  v12[4] = self;
  v12[5] = &v21;
  v12[6] = &v17;
  v12[7] = &v13;
  [(MGGroupsMediator *)self _withLock:v12];
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MGGroupsMediator *)self identifier];
  uint64_t v7 = v14[3];
  if (*((unsigned char *)v18 + 24)) {
    v8 = @"pending";
  }
  else {
    v8 = @"no";
  }
  if ([(id)v22[5] count]) {
    v9 = (__CFString *)v22[5];
  }
  else {
    v9 = @"no activities";
  }
  v10 = [v3 stringWithFormat:@"<%@: %p, id=%@, groups=%p, %@ changes, %@>", v5, self, v6, v7, v8, v9];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

uint64_t __31__MGGroupsMediator_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activities];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) hasPendingChanges];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)currentGroups
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__MGGroupsMediator_currentGroups__block_invoke;
  v4[3] = &unk_26485E440;
  v4[4] = self;
  v4[5] = &v5;
  [(MGGroupsMediator *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __33__MGGroupsMediator_currentGroups__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activities];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v7 copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)startActivityWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MGGroupsActivity alloc] initWithName:v4];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__MGGroupsMediator_startActivityWithName___block_invoke;
  v10[3] = &unk_26485E468;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  [(MGGroupsMediator *)self _withLock:v10];
  id v7 = v11;
  v8 = v6;

  return v8;
}

void __42__MGGroupsMediator_startActivityWithName___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [v2 activities];
  uint64_t v3 = [v4 arrayByAddingObject:*(void *)(a1 + 40)];
  [v2 setActivities:v3];
}

- (void)endActivity:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  objc_super v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__MGGroupsMediator_endActivity___block_invoke;
  v7[3] = &unk_26485E490;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(MGGroupsMediator *)self _withLock:v7];
  if (v11[5])
  {
    v6 = [(MGGroupsMediator *)self queryAgent];
    [v6 groupsMediator:self didUpdateGroups:v11[5]];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __32__MGGroupsMediator_endActivity___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) activities];
  if ([v7 containsObject:*(void *)(a1 + 40)])
  {
    id v2 = (void *)[v7 mutableCopy];
    [v2 removeObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setActivities:v2];
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      [*(id *)(a1 + 32) setPendingChanges:0];
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  objc_super v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__MGGroupsMediator_addGroup___block_invoke;
  v7[3] = &unk_26485E490;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(MGGroupsMediator *)self _withLock:v7];
  if (v11[5])
  {
    v6 = [(MGGroupsMediator *)self queryAgent];
    [v6 groupsMediator:self didUpdateGroups:v11[5]];
  }
  _Block_object_dispose(&v10, 8);
}

void __29__MGGroupsMediator_addGroup___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(void *)(a1 + 40));
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v5 = *(void **)(a1 + 32);
    [v5 setPendingChanges:0];
  }
}

- (void)removeGroup:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  objc_super v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__MGGroupsMediator_removeGroup___block_invoke;
  v7[3] = &unk_26485E490;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(MGGroupsMediator *)self _withLock:v7];
  if (v11[5])
  {
    v6 = [(MGGroupsMediator *)self queryAgent];
    [v6 groupsMediator:self didUpdateGroups:v11[5]];
  }
  _Block_object_dispose(&v10, 8);
}

void __32__MGGroupsMediator_removeGroup___block_invoke(uint64_t a1)
{
  char v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "removeGroup:ifExists_unsafe:", *(void *)(a1 + 40), &v5);
  if (v5)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      [*(id *)(a1 + 32) setPendingChanges:0];
    }
  }
}

- (id)group:(id)a3 renameTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = v6;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__MGGroupsMediator_group_renameTo___block_invoke;
  v13[3] = &unk_26485E4B8;
  v13[4] = self;
  id v8 = v29;
  id v14 = v8;
  uint64_t v16 = &v24;
  id v9 = v7;
  id v15 = v9;
  uint64_t v17 = &v18;
  [(MGGroupsMediator *)self _withLock:v13];
  if (v19[5])
  {
    uint64_t v10 = [(MGGroupsMediator *)self queryAgent];
    [v10 groupsMediator:self didUpdateGroups:v19[5]];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __35__MGGroupsMediator_group_renameTo___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v18 = [v2 objectForKey:v3];

  id v4 = v18;
  if (v18)
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    id v6 = [v18 service];
    id v7 = [v18 type];
    id v8 = [v18 identifier];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [v18 properties];
    id v11 = [v18 memberIdentifiers];
    uint64_t v12 = [v5 initWithClientService:v6 type:v7 identifier:v8 name:v9 properties:v10 memberIdentifiers:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    id v4 = v18;
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      [*(id *)(a1 + 32) setPendingChanges:0];
      id v4 = v18;
    }
  }
}

- (id)group:(id)a3 addMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = v6;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__MGGroupsMediator_group_addMember___block_invoke;
  v13[3] = &unk_26485E4B8;
  v13[4] = self;
  id v8 = v29;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  [(MGGroupsMediator *)self _withLock:v13];
  if (v19[5])
  {
    uint64_t v10 = [(MGGroupsMediator *)self queryAgent];
    [v10 groupsMediator:self didUpdateGroups:v19[5]];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __36__MGGroupsMediator_group_addMember___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v20 = [v2 objectForKey:v3];

  id v4 = v20;
  if (v20)
  {
    id v5 = [*(id *)(a1 + 48) identifier];
    id v6 = [v20 memberIdentifiers];
    if (([v6 containsObject:v5] & 1) == 0)
    {
      id v7 = objc_alloc((Class)objc_opt_class());
      id v8 = [v20 service];
      id v9 = [v20 type];
      uint64_t v10 = [v20 identifier];
      id v11 = [v20 name];
      uint64_t v12 = [v20 properties];
      uint64_t v13 = [v6 arrayByAddingObject:v5];
      uint64_t v14 = [v7 initWithClientService:v8 type:v9 identifier:v10 name:v11 properties:v12 memberIdentifiers:v13];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        [*(id *)(a1 + 32) setPendingChanges:0];
      }
    }

    id v4 = v20;
  }
}

- (id)group:(id)a3 removeMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = v6;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__MGGroupsMediator_group_removeMember___block_invoke;
  v13[3] = &unk_26485E4B8;
  v13[4] = self;
  id v8 = v29;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  [(MGGroupsMediator *)self _withLock:v13];
  if (v19[5])
  {
    uint64_t v10 = [(MGGroupsMediator *)self queryAgent];
    [v10 groupsMediator:self didUpdateGroups:v19[5]];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __39__MGGroupsMediator_group_removeMember___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v20 = [v2 objectForKey:v3];

  id v4 = v20;
  if (v20)
  {
    id v5 = [*(id *)(a1 + 48) identifier];
    id v6 = [v20 memberIdentifiers];
    if ([v6 containsObject:v5])
    {
      id v7 = (void *)[v6 mutableCopy];
      [v7 removeObject:v5];
      id v8 = objc_alloc((Class)objc_opt_class());
      id v9 = [v20 service];
      uint64_t v10 = [v20 type];
      id v11 = [v20 identifier];
      uint64_t v12 = [v20 name];
      uint64_t v13 = [v20 properties];
      uint64_t v14 = [v8 initWithClientService:v9 type:v10 identifier:v11 name:v12 properties:v13 memberIdentifiers:v7];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        [*(id *)(a1 + 32) setPendingChanges:0];
      }
    }
    id v4 = v20;
  }
}

- (void)removeGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__MGGroupsMediator_removeGroupWithIdentifier___block_invoke;
  v6[3] = &unk_26485E4E0;
  id v8 = &v9;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(MGGroupsMediator *)self _withLock:v6];
  [(MGGroupsMediator *)self removeGroup:v10[5]];

  _Block_object_dispose(&v9, 8);
}

void __46__MGGroupsMediator_removeGroupWithIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (MGGroupsQueryAgent)queryAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queryAgent);
  return (MGGroupsQueryAgent *)WeakRetained;
}

- (BOOL)allowsClientEdits
{
  return self->_allowsClientEdits;
}

- (void)setAllowsClientEdits:(BOOL)a3
{
  self->_allowsClientEdits = a3;
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (BOOL)hasPendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(BOOL)a3
{
  self->_pendingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_destroyWeak((id *)&self->_queryAgent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end