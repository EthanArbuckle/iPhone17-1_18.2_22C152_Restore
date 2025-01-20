@interface CNUIContainerContext
- (CNUIContainerContext)initWithContainers:(id)a3;
- (NSArray)addedContainers;
- (NSArray)selectedContainers;
- (NSDictionary)originalContainers;
- (NSDictionary)removedContainers;
- (void)addContainer:(id)a3;
- (void)removeContainer:(id)a3;
- (void)resetToInitialState;
- (void)setOriginalContainers:(id)a3;
- (void)setSelectedContainers:(id)a3;
@end

@implementation CNUIContainerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedContainers, 0);

  objc_storeStrong((id *)&self->_originalContainers, 0);
}

- (void)setSelectedContainers:(id)a3
{
}

- (NSArray)selectedContainers
{
  return self->_selectedContainers;
}

- (void)setOriginalContainers:(id)a3
{
}

- (NSDictionary)originalContainers
{
  return self->_originalContainers;
}

- (void)resetToInitialState
{
  id v5 = [(CNUIContainerContext *)self originalContainers];
  v3 = [v5 allValues];
  v4 = (void *)[v3 copy];
  [(CNUIContainerContext *)self setSelectedContainers:v4];
}

- (NSDictionary)removedContainers
{
  v3 = [(CNUIContainerContext *)self originalContainers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CNUIContainerContext_removedContainers__block_invoke;
  v6[3] = &unk_1E5499040;
  v6[4] = self;
  v4 = objc_msgSend(v3, "_cn_filter:", v6);

  return (NSDictionary *)v4;
}

uint64_t __41__CNUIContainerContext_removedContainers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 selectedContainers];
  int v6 = [v5 containsObject:v4];

  return v6 ^ 1u;
}

- (NSArray)addedContainers
{
  v3 = [(CNUIContainerContext *)self selectedContainers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CNUIContainerContext_addedContainers__block_invoke;
  v6[3] = &unk_1E549BDA0;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "_cn_filter:", v6);

  return (NSArray *)v4;
}

uint64_t __39__CNUIContainerContext_addedContainers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 originalContainers];
  id v5 = [v4 allValues];
  int v6 = [v5 containsObject:v3];

  return v6 ^ 1u;
}

- (void)removeContainer:(id)a3
{
  id v9 = a3;
  id v4 = [(CNUIContainerContext *)self selectedContainers];
  int v5 = [v4 containsObject:v9];

  if (v5)
  {
    int v6 = [(CNUIContainerContext *)self selectedContainers];
    v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:v9];
    v8 = (void *)[v7 copy];
    [(CNUIContainerContext *)self setSelectedContainers:v8];
  }
}

- (void)addContainer:(id)a3
{
  id v4 = a3;
  int v5 = [(CNUIContainerContext *)self selectedContainers];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v7 = [(CNUIContainerContext *)self selectedContainers];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__CNUIContainerContext_addContainer___block_invoke;
    v12[3] = &unk_1E549BDA0;
    id v8 = v4;
    id v13 = v8;
    char v9 = objc_msgSend(v7, "_cn_any:", v12);

    if ((v9 & 1) == 0)
    {
      v10 = [(CNUIContainerContext *)self selectedContainers];
      v11 = [v10 arrayByAddingObject:v8];
      [(CNUIContainerContext *)self setSelectedContainers:v11];
    }
  }
}

uint64_t __37__CNUIContainerContext_addContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (CNUIContainerContext)initWithContainers:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNUIContainerContext;
  char v6 = [(CNUIContainerContext *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 allValues];
    selectedContainers = v6->_selectedContainers;
    v6->_selectedContainers = (NSArray *)v7;

    objc_storeStrong((id *)&v6->_originalContainers, a3);
    char v9 = v6;
  }

  return v6;
}

@end