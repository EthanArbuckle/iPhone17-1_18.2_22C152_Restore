@interface CNUIGroupEditingContext
- (BOOL)group:(id)a3 isInGroupArray:(id)a4;
- (CNUIGroupEditingContext)init;
- (CNUIGroupEditingContext)initWithOriginalGroups:(id)a3;
- (NSArray)addedGroups;
- (NSArray)groupsToDisplayForEditing;
- (NSArray)originalGroups;
- (NSArray)removedGroups;
- (void)addGroup:(id)a3;
- (void)removeGroup:(id)a3;
- (void)setAddedGroups:(id)a3;
- (void)setRemovedGroups:(id)a3;
@end

@implementation CNUIGroupEditingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedGroups, 0);
  objc_storeStrong((id *)&self->_addedGroups, 0);

  objc_storeStrong((id *)&self->_originalGroups, 0);
}

- (void)setRemovedGroups:(id)a3
{
}

- (NSArray)removedGroups
{
  return self->_removedGroups;
}

- (void)setAddedGroups:(id)a3
{
}

- (NSArray)addedGroups
{
  return self->_addedGroups;
}

- (NSArray)originalGroups
{
  return self->_originalGroups;
}

- (NSArray)groupsToDisplayForEditing
{
  v3 = [(CNUIGroupEditingContext *)self originalGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CNUIGroupEditingContext_groupsToDisplayForEditing__block_invoke;
  v8[3] = &unk_1E54996E8;
  v8[4] = self;
  v4 = objc_msgSend(v3, "_cn_filter:", v8);

  v5 = [(CNUIGroupEditingContext *)self addedGroups];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return (NSArray *)v6;
}

uint64_t __52__CNUIGroupEditingContext_groupsToDisplayForEditing__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 removedGroups];
  LODWORD(v2) = [v2 group:v3 isInGroupArray:v4];

  return v2 ^ 1;
}

- (BOOL)group:(id)a3 isInGroupArray:(id)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CNUIGroupEditingContext_group_isInGroupArray___block_invoke;
  v8[3] = &unk_1E54996E8;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "_cn_any:", v8);

  return (char)a4;
}

uint64_t __48__CNUIGroupEditingContext_group_isInGroupArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)removeGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNUIGroupEditingContext *)self originalGroups];
  if (![(CNUIGroupEditingContext *)self group:v4 isInGroupArray:v5]) {
    goto LABEL_4;
  }
  id v6 = [(CNUIGroupEditingContext *)self removedGroups];
  BOOL v7 = [(CNUIGroupEditingContext *)self group:v4 isInGroupArray:v6];

  if (!v7)
  {
    uint64_t v5 = [(CNUIGroupEditingContext *)self removedGroups];
    v8 = [v5 arrayByAddingObject:v4];
    [(CNUIGroupEditingContext *)self setRemovedGroups:v8];

LABEL_4:
  }
  id v9 = [(CNUIGroupEditingContext *)self addedGroups];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__CNUIGroupEditingContext_removeGroup___block_invoke;
  v12[3] = &unk_1E54996E8;
  id v13 = v4;
  id v10 = v4;
  v11 = objc_msgSend(v9, "_cn_filter:", v12);
  [(CNUIGroupEditingContext *)self setAddedGroups:v11];
}

uint64_t __39__CNUIGroupEditingContext_removeGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNUIGroupEditingContext *)self originalGroups];
  if ([(CNUIGroupEditingContext *)self group:v4 isInGroupArray:v5]) {
    goto LABEL_4;
  }
  id v6 = [(CNUIGroupEditingContext *)self addedGroups];
  BOOL v7 = [(CNUIGroupEditingContext *)self group:v4 isInGroupArray:v6];

  if (!v7)
  {
    uint64_t v5 = [(CNUIGroupEditingContext *)self addedGroups];
    v8 = [v5 arrayByAddingObject:v4];
    [(CNUIGroupEditingContext *)self setAddedGroups:v8];

LABEL_4:
  }
  id v9 = [(CNUIGroupEditingContext *)self removedGroups];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__CNUIGroupEditingContext_addGroup___block_invoke;
  v12[3] = &unk_1E54996E8;
  id v13 = v4;
  id v10 = v4;
  v11 = objc_msgSend(v9, "_cn_filter:", v12);
  [(CNUIGroupEditingContext *)self setRemovedGroups:v11];
}

uint64_t __36__CNUIGroupEditingContext_addGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

- (CNUIGroupEditingContext)initWithOriginalGroups:(id)a3
{
  id v5 = a3;
  id v6 = [(CNUIGroupEditingContext *)self init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalGroups, a3);
    v8 = v7;
  }

  return v7;
}

- (CNUIGroupEditingContext)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNUIGroupEditingContext;
  v2 = [(CNUIGroupEditingContext *)&v11 init];
  if (v2)
  {
    id v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    originalGroups = v2->_originalGroups;
    v2->_originalGroups = v3;

    id v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    addedGroups = v2->_addedGroups;
    v2->_addedGroups = v5;

    BOOL v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    removedGroups = v2->_removedGroups;
    v2->_removedGroups = v7;

    id v9 = v2;
  }

  return v2;
}

@end