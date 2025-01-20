@interface HUQuickControlGroupContext
- (HUQuickControlContext)primaryQuickControlContext;
- (HUQuickControlGroupContext)initWithPrimaryQuickControlContext:(id)a3 alternateQuickControlContexts:(id)a4;
- (NSSet)alternateQuickControlContexts;
- (id)allControlItems;
- (void)setAlternateQuickControlContexts:(id)a3;
- (void)setPrimaryQuickControlContext:(id)a3;
@end

@implementation HUQuickControlGroupContext

- (HUQuickControlGroupContext)initWithPrimaryQuickControlContext:(id)a3 alternateQuickControlContexts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlGroupContext;
  v9 = [(HUQuickControlGroupContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primaryQuickControlContext, a3);
    objc_storeStrong((id *)&v10->_alternateQuickControlContexts, a4);
  }

  return v10;
}

- (id)allControlItems
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = [(HUQuickControlGroupContext *)self primaryQuickControlContext];
  v5 = [v4 controlItems];
  v6 = (void *)[v3 initWithSet:v5];

  id v7 = [(HUQuickControlGroupContext *)self alternateQuickControlContexts];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__HUQuickControlGroupContext_allControlItems__block_invoke;
  v10[3] = &unk_1E63919F0;
  id v8 = v6;
  id v11 = v8;
  objc_msgSend(v7, "na_each:", v10);

  return v8;
}

void __45__HUQuickControlGroupContext_allControlItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 controlItems];
  id v3 = [v4 allObjects];
  [v2 addObjectsFromArray:v3];
}

- (HUQuickControlContext)primaryQuickControlContext
{
  return self->_primaryQuickControlContext;
}

- (void)setPrimaryQuickControlContext:(id)a3
{
}

- (NSSet)alternateQuickControlContexts
{
  return self->_alternateQuickControlContexts;
}

- (void)setAlternateQuickControlContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateQuickControlContexts, 0);

  objc_storeStrong((id *)&self->_primaryQuickControlContext, 0);
}

@end