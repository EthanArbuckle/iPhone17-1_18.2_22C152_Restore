@interface WFTodoistProjectPickerParameter
- (BOOL)hasLoadedProjects;
- (WFAccountAccessResource)accessResource;
- (id)accessoryColorForPossibleState:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (id)projectNamed:(id)a3;
- (id)projects;
- (void)dealloc;
- (void)fetchProjectsIfNeeded;
- (void)loadProjectsFromCache;
- (void)setAccessResource:(id)a3;
- (void)setHasLoadedProjects:(BOOL)a3;
- (void)setProjects:(id)a3;
- (void)wasAddedToWorkflow;
@end

@implementation WFTodoistProjectPickerParameter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessResource);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (void)setHasLoadedProjects:(BOOL)a3
{
  self->_hasLoadedProjects = a3;
}

- (BOOL)hasLoadedProjects
{
  return self->_hasLoadedProjects;
}

- (WFAccountAccessResource)accessResource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessResource);
  return (WFAccountAccessResource *)WeakRetained;
}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F873F0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFTodoistProjectPickerParameter;
  [(WFTodoistProjectPickerParameter *)&v4 dealloc];
}

- (void)setAccessResource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessResource);

  v5 = (uint64_t *)MEMORY[0x263F873F0];
  if (WeakRetained)
  {
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v7 = *v5;
    id v8 = objc_loadWeakRetained((id *)&self->_accessResource);
    [v6 removeObserver:self name:v7 object:v8];
  }
  objc_storeWeak((id *)&self->_accessResource, obj);
  v9 = obj;
  if (obj)
  {
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel_fetchProjectsIfNeeded name:*v5 object:obj];

    v9 = obj;
  }
}

- (id)projectNamed:(id)a3
{
  id v4 = a3;
  v5 = [(WFTodoistProjectPickerParameter *)self projects];
  v6 = [v5 objectMatchingKey:@"name" value:v4];

  return v6;
}

- (void)setProjects:(id)a3
{
  id v7 = a3;
  id v4 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  v5 = v4;
  if (v7)
  {
    v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    [v5 setObject:v6 forKey:@"WFTodoistCachedProjects"];
  }
  else
  {
    [v4 removeObjectForKey:@"WFTodoistCachedProjects"];
  }
  [(WFTodoistProjectPickerParameter *)self loadProjectsFromCache];
}

- (id)projects
{
  v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  v3 = [v2 dataForKey:@"WFTodoistCachedProjects"];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08928];
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    id v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  id v4 = a3;
  v5 = [(WFTodoistProjectPickerParameter *)self projects];
  uint64_t v6 = [v4 value];

  id v7 = objc_msgSend(v5, "if_firstObjectWithValue:forKey:", v6, @"name");
  id v8 = [v7 color];

  return v8;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)[a3 value];
}

- (void)loadProjectsFromCache
{
  v3 = [(WFTodoistProjectPickerParameter *)self projects];
  objc_msgSend(v3, "if_map:", &__block_literal_global_27972);
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  possibleStates = self->_possibleStates;
  self->_possibleStates = v4;

  [(WFTodoistProjectPickerParameter *)self possibleStatesDidChange];
  id v6 = [(WFTodoistProjectPickerParameter *)self possibleStates];
  -[WFTodoistProjectPickerParameter setHidden:](self, "setHidden:", [v6 count] == 0);
}

id __56__WFTodoistProjectPickerParameter_loadProjectsFromCache__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 name];

  id v6 = (void *)[v4 initWithValue:v5];
  return v6;
}

- (void)fetchProjectsIfNeeded
{
  if (![(WFTodoistProjectPickerParameter *)self hasLoadedProjects])
  {
    id v10 = [(WFTodoistProjectPickerParameter *)self accessResource];
    if ([v10 isAvailable])
    {
      int v3 = [(WFTodoistProjectPickerParameter *)self isInsideWorkflow];

      if (v3)
      {
        id v4 = [(WFTodoistProjectPickerParameter *)self accessResource];
        v5 = [v4 accounts];
        id v6 = [v5 firstObject];

        if (v6)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v7 = v6;
          }
          else {
            id v7 = 0;
          }
        }
        else
        {
          id v7 = 0;
        }
        id v8 = v7;

        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke;
        v11[3] = &unk_264E5ED78;
        id v12 = v8;
        v13 = self;
        id v9 = v8;
        [v9 refreshWithCompletionHandler:v11];
      }
    }
    else
    {
    }
  }
}

void __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  int v3 = [*(id *)(a1 + 32) credential];
  [v2 setCredential:v3];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_2;
  v4[3] = &unk_264E5EEE8;
  v4[4] = *(void *)(a1 + 40);
  [v2 getProjectsWithCompletionHandler:v4];
}

void __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_3;
    v5[3] = &unk_264E5DED8;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setProjects:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 setHasLoadedProjects:1];
}

- (void)wasAddedToWorkflow
{
  v3.receiver = self;
  v3.super_class = (Class)WFTodoistProjectPickerParameter;
  [(WFTodoistProjectPickerParameter *)&v3 wasAddedToWorkflow];
  [(WFTodoistProjectPickerParameter *)self loadProjectsFromCache];
  [(WFTodoistProjectPickerParameter *)self fetchProjectsIfNeeded];
}

@end