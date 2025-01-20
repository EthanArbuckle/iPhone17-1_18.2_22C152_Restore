@interface WFCoercionOptions
+ (id)new;
+ (id)optionsWithDictionary:(id)a3;
+ (void)registerDefaultDisallowedCoercionPath:(id)a3;
- (BOOL)coercionPathIsDisallowed:(id)a3;
- (BOOL)shouldContinueLoadingWebContentIfExternalResourcesAreDenied;
- (NSDictionary)dictionary;
- (WFCoercionOptions)init;
- (WFCoercionOptions)initWithDictionary:(id)a3;
- (WFContentPermissionRequestor)permissionRequestor;
- (id)itemClassPrioritizationType;
- (id)optionsByAddingContentsOfOptions:(id)a3;
- (id)preferredTypes;
@end

@implementation WFCoercionOptions

- (void).cxx_destruct
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (id)optionsByAddingContentsOfOptions:(id)a3
{
  id v4 = a3;
  v5 = [(WFCoercionOptions *)self dictionary];
  v6 = (void *)[v5 mutableCopy];

  v7 = [v4 dictionary];

  [v6 addEntriesFromDictionary:v7];
  v8 = +[WFCoercionOptions optionsWithDictionary:v6];

  return v8;
}

- (WFCoercionOptions)init
{
  return [(WFCoercionOptions *)self initWithDictionary:MEMORY[0x263EFFA78]];
}

- (WFCoercionOptions)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFCoercionOptions.m", 30, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFCoercionOptions;
  v6 = [(WFCoercionOptions *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

+ (id)optionsWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[WFCoercionOptions alloc] initWithDictionary:v3];

  return v4;
}

+ (id)new
{
  if (new_onceToken != -1) {
    dispatch_once(&new_onceToken, &__block_literal_global_1348);
  }
  v2 = (void *)new_options;
  return v2;
}

uint64_t __24__WFCoercionOptions_new__block_invoke()
{
  new_options = objc_alloc_init(WFCoercionOptions);
  return MEMORY[0x270F9A758]();
}

- (BOOL)coercionPathIsDisallowed:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFCoercionOptions *)self dictionary];
  v6 = [v5 objectForKey:@"WFCoercionOptionIgnoreDefaultDisallowedCoercionPaths"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = (id)_defaultDisallowedCoercionPaths;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        if (WFCoercionPathContainsPath(v4, *(void **)(*((void *)&v21 + 1) + 8 * v12))) {
          goto LABEL_20;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_msgSend(v5, "objectForKey:", @"WFCoercionOptionDisallowedCoercionPaths", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
LABEL_13:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v18 != v14) {
        objc_enumerationMutation(v8);
      }
      if (WFCoercionPathContainsPath(v4, *(void **)(*((void *)&v17 + 1) + 8 * v15))) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v13) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
    }
LABEL_20:
    LOBYTE(v13) = 1;
  }
LABEL_21:

  return v13;
}

+ (void)registerDefaultDisallowedCoercionPath:(id)a3
{
  uint64_t v3 = registerDefaultDisallowedCoercionPath__onceToken;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&registerDefaultDisallowedCoercionPath__onceToken, &__block_literal_global_4453);
    id v5 = v6;
  }
  [(id)_defaultDisallowedCoercionPaths addObject:v5];
}

uint64_t __84__WFCoercionOptions_DisallowedCoercionPaths__registerDefaultDisallowedCoercionPath___block_invoke()
{
  _defaultDisallowedCoercionPaths = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)preferredTypes
{
  v2 = [(WFCoercionOptions *)self dictionary];
  uint64_t v3 = [v2 objectForKey:@"WFCoercionOptionPreferredTypes"];

  return v3;
}

- (id)itemClassPrioritizationType
{
  v2 = [(WFCoercionOptions *)self dictionary];
  uint64_t v3 = [v2 objectForKey:@"WFCoercionOptionItemClassPrioritizationType"];

  return v3;
}

- (WFContentPermissionRequestor)permissionRequestor
{
  v2 = [(WFCoercionOptions *)self dictionary];
  uint64_t v3 = [v2 objectForKey:@"PermissionRequestor"];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;

  return (WFContentPermissionRequestor *)v6;
}

- (BOOL)shouldContinueLoadingWebContentIfExternalResourcesAreDenied
{
  v2 = [(WFCoercionOptions *)self dictionary];
  uint64_t v3 = [v2 objectForKey:@"ContinueLoadingWebContentIfExternalResourcesAreDenied"];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end