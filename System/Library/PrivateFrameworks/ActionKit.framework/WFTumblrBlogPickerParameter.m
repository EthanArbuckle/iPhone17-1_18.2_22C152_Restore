@interface WFTumblrBlogPickerParameter
+ (id)referencedActionResourceClasses;
+ (void)initialize;
- (BOOL)isHidden;
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (WFTumblrAccessResource)tumblrAccessResource;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)possibleStatesDidChange;
- (void)setActionResources:(id)a3;
- (void)setTumblrAccessResource:(id)a3;
- (void)updateBlogs;
- (void)wasAddedToWorkflow;
@end

@implementation WFTumblrBlogPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tumblrAccessResource, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (WFTumblrAccessResource)tumblrAccessResource
{
  return self->_tumblrAccessResource;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)[a3 value];
}

- (NSArray)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = +[WFDiskCache workflowCache];
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v4 objectOfClasses:v7 forKey:v9];

    v11 = [v10 allKeys];
    v12 = [v11 sortedArrayUsingSelector:sel_compare_];
    objc_msgSend(v12, "if_compactMap:", &__block_literal_global_201);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_possibleStates;
    self->_possibleStates = v13;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

WFTumblrBlogSubstitutableState *__45__WFTumblrBlogPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(WFVariableSubstitutableParameterState *)[WFTumblrBlogSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)defaultSerializedRepresentation
{
  id v2 = [(WFTumblrBlogPickerParameter *)self possibleStates];
  v3 = [v2 firstObject];
  v4 = [v3 serializedRepresentation];

  return v4;
}

- (BOOL)isHidden
{
  id v2 = [(WFTumblrBlogPickerParameter *)self possibleStates];
  BOOL v3 = (unint64_t)[v2 count] < 2;

  return v3;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTumblrBlogPickerParameter;
  [(WFTumblrBlogPickerParameter *)&v4 possibleStatesDidChange];
  [(WFTumblrBlogPickerParameter *)self defaultSerializedRepresentationDidChange];
}

- (void)updateBlogs
{
  BOOL v3 = objc_alloc_init(TMAPIClient);
  objc_super v4 = +[WFTumblrAccessResource tumblrOAuthToken];
  [(TMAPIClient *)v3 setOAuthToken:v4];

  v5 = +[WFTumblrAccessResource tumblrOAuthTokenSecret];
  [(TMAPIClient *)v3 setOAuthTokenSecret:v5];

  [(TMAPIClient *)v3 setOAuthConsumerKey:@"cwKKz80VhsmeSt3n8ORZFqZSqYejgTm7DKGRxM5ecescOhZjRw"];
  [(TMAPIClient *)v3 setOAuthConsumerSecret:@"TvXKq6PUXP2GldJBTKM99C4ly30vrKerTF3Cr5LNqy3J3gZBPf"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke;
  v6[3] = &unk_264E5B2D8;
  v6[4] = self;
  [(TMAPIClient *)v3 userInfo:v6];
}

void __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 objectForKey:@"user"];
  }
  else
  {
    v7 = 0;
  }
  if ([v6 code] == 401)
  {
    +[WFTumblrAccessResource setTumblrOAuthTokenSecret:0];
    +[WFTumblrAccessResource setTumblrOAuthToken:0];
  }
  v8 = [v7 objectForKeyedSubscript:@"blogs"];

  if (v8)
  {
    uint64_t v21 = a1;
    id v22 = v6;
    id v23 = v5;
    v9 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v10 = [v7 objectForKeyedSubscript:@"blogs"];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "objectForKey:", @"url", v21);
          v17 = [v15 objectForKey:@"title"];
          [v9 setValue:v16 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    v18 = +[WFDiskCache workflowCache];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_2;
    v24[3] = &unk_264E5EE70;
    v24[4] = *(void *)(v21 + 32);
    [v18 setObject:v9 forKey:v20 completion:v24];

    id v6 = v22;
    id v5 = v23;
  }
}

void __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_3;
  block[3] = &unk_264E5EE70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) possibleStatesDidChange];
}

- (void)wasAddedToWorkflow
{
  v3.receiver = self;
  v3.super_class = (Class)WFTumblrBlogPickerParameter;
  [(WFTumblrBlogPickerParameter *)&v3 wasAddedToWorkflow];
  [(WFTumblrBlogPickerParameter *)self updateBlogs];
}

- (void)setTumblrAccessResource:(id)a3
{
  id v9 = a3;
  p_tumblrAccessResource = &self->_tumblrAccessResource;
  id v6 = (void *)MEMORY[0x263F873F0];
  if (self->_tumblrAccessResource)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*v6 object:*p_tumblrAccessResource];
  }
  objc_storeStrong((id *)&self->_tumblrAccessResource, a3);
  if (*p_tumblrAccessResource)
  {
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_possibleStatesDidChange name:*v6 object:*p_tumblrAccessResource];
  }
}

- (void)setActionResources:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v4 = [a3 anyObject];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = "WFEnforceClass";
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

  [(WFTumblrBlogPickerParameter *)self setTumblrAccessResource:v7];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

+ (id)referencedActionResourceClasses
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

+ (void)initialize
{
  if (initialize_onceToken_40016 != -1) {
    dispatch_once(&initialize_onceToken_40016, &__block_literal_global_40017);
  }
}

void __41__WFTumblrBlogPickerParameter_initialize__block_invoke()
{
}

void __41__WFTumblrBlogPickerParameter_initialize__block_invoke_2()
{
  id v0 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  [v0 removeObjectForKey:@"WFTumblrBlogs"];
}

@end