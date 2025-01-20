@interface WFEvernoteTagsTagFieldParameter
+ (id)referencedActionResourceClasses;
- (WFEvernoteAccessResource)evernoteAccessResource;
- (id)suggestedTagsForTagField:(id)a3;
- (void)setActionResources:(id)a3;
- (void)setEvernoteAccessResource:(id)a3;
- (void)updateTags;
- (void)wasAddedToWorkflow;
@end

@implementation WFEvernoteTagsTagFieldParameter

- (void).cxx_destruct
{
}

- (WFEvernoteAccessResource)evernoteAccessResource
{
  return self->_evernoteAccessResource;
}

- (id)suggestedTagsForTagField:(id)a3
{
  v3 = +[WFDiskCache workflowCache];
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v3 objectOfClasses:v6 forKey:@"WFEvernoteTags"];

  v8 = objc_msgSend(v7, "if_map:", &__block_literal_global_241);

  return v8;
}

uint64_t __60__WFEvernoteTagsTagFieldParameter_suggestedTagsForTagField___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (void)updateTags
{
  v2 = +[WFEvernoteAccessResource evernoteSession];
  int v3 = [v2 isAuthenticated];

  if (v3)
  {
    id v5 = +[WFEvernoteAccessResource evernoteSession];
    v4 = [v5 primaryNoteStore];
    [v4 listTagsWithCompletion:&__block_literal_global_5328];
  }
}

void __45__WFEvernoteTagsTagFieldParameter_updateTags__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v8 = v4;
  if (!a2 || v4)
  {
    id v5 = [v4 domain];
    if ([v5 isEqualToString:@"ENErrorDomain"])
    {
      uint64_t v7 = [v8 code];

      if (v7 != 2) {
        goto LABEL_8;
      }
      id v5 = +[WFDiskCache workflowCache];
      [v5 removeObjectForKey:@"WFEvernoteTags"];
    }
  }
  else
  {
    id v5 = objc_msgSend(a2, "if_map:", &__block_literal_global_237_5331);
    v6 = +[WFDiskCache workflowCache];
    [v6 setObject:v5 forKey:@"WFEvernoteTags"];
  }
LABEL_8:
}

WFEvernoteTag *__45__WFEvernoteTagsTagFieldParameter_updateTags__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [[WFEvernoteTag alloc] initWithTag:v2];

  return v3;
}

- (void)wasAddedToWorkflow
{
  v3.receiver = self;
  v3.super_class = (Class)WFEvernoteTagsTagFieldParameter;
  [(WFEvernoteTagsTagFieldParameter *)&v3 wasAddedToWorkflow];
  [(WFEvernoteTagsTagFieldParameter *)self updateTags];
  [(WFDynamicTagFieldParameter *)self setDataSource:self];
}

- (void)setEvernoteAccessResource:(id)a3
{
  id v9 = a3;
  p_evernoteAccessResource = &self->_evernoteAccessResource;
  v6 = (void *)MEMORY[0x263F873F0];
  if (self->_evernoteAccessResource)
  {
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*v6 object:*p_evernoteAccessResource];
  }
  objc_storeStrong((id *)&self->_evernoteAccessResource, a3);
  if (*p_evernoteAccessResource)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_updateTags name:*v6 object:*p_evernoteAccessResource];
  }
}

- (void)setActionResources:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [a3 anyObject];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315906;
      v11 = "WFEnforceClass";
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2114;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      id v9 = v15;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  [(WFEvernoteTagsTagFieldParameter *)self setEvernoteAccessResource:v7];
}

+ (id)referencedActionResourceClasses
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

@end