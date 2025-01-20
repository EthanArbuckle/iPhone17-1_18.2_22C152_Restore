@interface BSPluginSpecification
+ (id)specificationsFromHostBundle:(uint64_t)a1;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)matchesPluginBundle:(uint64_t)a1;
@end

@implementation BSPluginSpecification

+ (id)specificationsFromHostBundle:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  v2 = (objc_class *)self;
  id v28 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [v27 URLForResource:@"PluginSpecification" withExtension:@"plist"];
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithContentsOfURL:", v3, v3);
  }
  else
  {
    v5 = objc_msgSend(v27, "infoDictionary", 0);
    v4 = objc_msgSend(v5, "bs_safeArrayForKey:", @"BSPluginSpecification");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v2 alloc];
          id v11 = v9;
          if (v10
            && (v34.receiver = v10,
                v34.super_class = (Class)BSPluginSpecification,
                (v12 = objc_msgSendSuper2(&v34, sel_init)) != 0))
          {
            v13 = objc_msgSend(v11, "bs_safeObjectForKey:ofType:", @"BSPluginType", objc_opt_class());
            uint64_t v14 = [v13 copy];
            v15 = (void *)v12[2];
            v12[2] = v14;

            v16 = objc_msgSend(v11, "bs_safeObjectForKey:ofType:", @"BSPluginBundleController", objc_opt_class());
            uint64_t v17 = [v16 copy];
            v18 = (void *)v12[3];
            v12[3] = v17;

            v19 = objc_msgSend(v11, "bs_safeObjectForKey:ofType:", @"BSPluginAllowList", objc_opt_class());
            uint64_t v20 = [v19 copy];
            v21 = (void *)v12[1];
            v12[1] = v20;

            if (!v12[1])
            {
              v22 = objc_msgSend(v11, "bs_safeObjectForKey:ofType:", @"BSPluginWhitelist", objc_opt_class());
              uint64_t v23 = [v22 copy];
              v24 = (void *)v12[1];
              v12[1] = v23;
            }
            if (v12[2] && v12[3]) {
              [v28 addObject:v12];
            }
          }
          else
          {

            v12 = 0;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  return v28;
}

- (uint64_t)matchesPluginBundle:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    uint64_t v6 = [v3 type];
    LODWORD(v5) = [v5 isEqualToString:v6];

    a1 = v5
      && ((uint64_t v7 = *(void **)(a1 + 8)) == 0
       || ([v4 name],
           v8 = objc_claimAutoreleasedReturnValue(),
           char v9 = [v7 containsObject:v8],
           v8,
           (v9 & 1) != 0));
  }

  return a1;
}

- (NSString)description
{
  return (NSString *)[(BSPluginSpecification *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSPluginSpecification *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_type withName:@"type"];
  id v5 = (id)[v3 appendObject:self->_classOrProtocolName withName:@"classOrProtocol"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BSPluginSpecification *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v3 = [(BSPluginSpecification *)self succinctDescriptionBuilder];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classOrProtocolName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_allowListedNames, 0);
}

@end