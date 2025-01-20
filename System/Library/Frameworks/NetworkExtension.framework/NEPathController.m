@interface NEPathController
+ (BOOL)supportsSecureCoding;
+ (id)copyAggregatePathRules;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)hasNonDefaultRules;
- (BOOL)ignoreFallback;
- (BOOL)ignoreRouteRules;
- (BOOL)isEnabled;
- (BOOL)removePathRuleBySigningIdentifier:(id)a3;
- (NEPathController)initWithCoder:(id)a3;
- (NSArray)pathRules;
- (id)copyPathRuleBySigningIdentifier:(id)a3;
- (id)copyPathRuleSigningIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)cellularFallbackFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularFallbackFlags:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIgnoreFallback:(BOOL)a3;
- (void)setIgnoreRouteRules:(BOOL)a3;
- (void)setPathRules:(id)a3;
@end

@implementation NEPathController

- (NEPathController)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NEPathController;
  v5 = [(NEPathController *)&v19 init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    pathRules = v5->_pathRules;
    v5->_pathRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"PayloadAppRules"];
    payloadAppRules = v5->_payloadAppRules;
    v5->_payloadAppRules = (NSArray *)v16;

    v5->_cellularFallbackFlags = [v4 decodeIntegerForKey:@"cellularFallbackFlags"];
    v5->_ignoreRouteRules = [v4 decodeBoolForKey:@"IgnoreRouteRules"];
    v5->_ignoreFallback = [v4 decodeBoolForKey:@"IgnoreFallback"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)copyAggregatePathRules
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&copyAggregatePathRules_lock);
  uint64_t configuration_generation = ne_get_configuration_generation();
  uint64_t v3 = configuration_generation;
  id v4 = (void *)copyAggregatePathRules_cachedRules;
  if (copyAggregatePathRules_cachedRules)
  {
    if (configuration_generation && configuration_generation == copyAggregatePathRules_savedGeneration)
    {
      copyAggregatePathRules_savedGeneration = configuration_generation;
      goto LABEL_19;
    }
    copyAggregatePathRules_cachedRules = 0;

    id v4 = (void *)copyAggregatePathRules_cachedRules;
    copyAggregatePathRules_savedGeneration = v3;
    if (copyAggregatePathRules_cachedRules) {
      goto LABEL_19;
    }
  }
  else
  {
    copyAggregatePathRules_savedGeneration = configuration_generation;
  }
  uint64_t v5 = NEHelperCopyAggregatePathRules();
  v6 = (void *)v5;
  if (v5 && MEMORY[0x19F3B92C0](v5) == MEMORY[0x1E4F14580])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    bytes_ptr = xpc_data_get_bytes_ptr(v6);
    uint64_t v9 = (void *)[v7 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v6) freeWhenDone:0];
    id v22 = 0;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:&v22];
    id v11 = v22;
    if (v11)
    {
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "Failed to create a unarchiver for the aggregate path rules: %@", buf, 0xCu);
      }
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v10 decodeObjectOfClasses:v15 forKey:@"config-aggregate-rules"];
    v17 = (void *)copyAggregatePathRules_cachedRules;
    copyAggregatePathRules_cachedRules = v16;

    if ((isa_nsarray((void *)copyAggregatePathRules_cachedRules) & 1) == 0)
    {
      v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "Failed to de-serialize the aggregate path rules", buf, 2u);
      }

      objc_super v19 = (void *)copyAggregatePathRules_cachedRules;
      copyAggregatePathRules_cachedRules = 0;
    }
  }

  id v4 = (void *)copyAggregatePathRules_cachedRules;
LABEL_19:
  id v20 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&copyAggregatePathRules_lock);
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAppRules, 0);

  objc_storeStrong((id *)&self->_pathRules, 0);
}

- (void)setPathRules:(id)a3
{
}

- (NSArray)pathRules
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCellularFallbackFlags:(int64_t)a3
{
  self->_cellularFallbackFlags = a3;
}

- (int64_t)cellularFallbackFlags
{
  return self->_cellularFallbackFlags;
}

- (void)setIgnoreFallback:(BOOL)a3
{
  self->_ignoreFallback = a3;
}

- (BOOL)ignoreFallback
{
  return self->_ignoreFallback;
}

- (void)setIgnoreRouteRules:(BOOL)a3
{
  self->_ignoreRouteRules = a3;
}

- (BOOL)ignoreRouteRules
{
  return self->_ignoreRouteRules;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)hasNonDefaultRules
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NEPathController *)self pathRules];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 cellularBehavior] != 2
          || [v7 wifiBehavior] != 2 && objc_msgSend(v7, "wifiBehavior")
          || ([v7 denyMulticast] & 1) != 0
          || ([v7 denyAll] & 1) != 0)
        {
          BOOL v8 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_16:

  return v8;
}

- (id)copyPathRuleSigningIdentifiers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(NEPathController *)self pathRules];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(NEPathController *)self pathRules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) matchSigningIdentifier];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)[v5 copy];
  return v12;
}

- (BOOL)removePathRuleBySigningIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = [(NEPathController *)self pathRules];
  uint64_t v7 = (void *)[v5 initWithArray:v6];

  if ([v7 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v7 objectAtIndex:v8];
      uint64_t v10 = [v9 matchSigningIdentifier];
      int v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }

      if (++v8 >= (unint64_t)[v7 count]) {
        goto LABEL_5;
      }
    }
    [v7 removeObjectAtIndex:v8];
    [(NEPathController *)self setPathRules:v7];

    BOOL v12 = 1;
  }
  else
  {
LABEL_5:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)copyPathRuleBySigningIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NEPathController *)self pathRules];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 matchSigningIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathController isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  uint64_t v8 = [(NEPathController *)self pathRules];
  [v7 appendPrettyObject:v8 withName:@"pathRules" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 32, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"payloadAppRules" andIndent:v5 options:a4];
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"), @"cellularFallbackFlags", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"), @"ignoreRouteRules", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathController ignoreFallback](self, "ignoreFallback"), @"ignoreFallback", v5, a4);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEPathController *)self pathRules];

  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(NEPathController *)self pathRules];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (![v12 checkValidityAndCollectErrors:v4]) {
              char v10 = 0;
            }
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid app rule", v4);
            char v10 = 0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      char v10 = 1;
    }

    BOOL v13 = v10 & 1;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEPathController allocWithZone:a3] init];
  [(NEPathController *)v4 setEnabled:[(NEPathController *)self isEnabled]];
  uint64_t v5 = [(NEPathController *)self pathRules];

  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v8 = [(NEPathController *)self pathRules];
    uint64_t v9 = (void *)[v7 initWithArray:v8 copyItems:1];
    [(NEPathController *)v4 setPathRules:v9];
  }
  if (self && objc_getProperty(self, v6, 32, 1))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    BOOL v13 = objc_msgSend(v10, "initWithArray:copyItems:", objc_getProperty(self, v11, 32, 1), 1);
    if (v4) {
      objc_setProperty_atomic_copy(v4, v12, v13, 32);
    }
  }
  [(NEPathController *)v4 setCellularFallbackFlags:[(NEPathController *)self cellularFallbackFlags]];
  [(NEPathController *)v4 setIgnoreRouteRules:[(NEPathController *)self ignoreRouteRules]];
  [(NEPathController *)v4 setIgnoreFallback:[(NEPathController *)self ignoreFallback]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[NEPathController isEnabled](self, "isEnabled"), @"Enabled");
  id v4 = [(NEPathController *)self pathRules];
  [v7 encodeObject:v4 forKey:@"Rules"];

  if (self) {
    id Property = objc_getProperty(self, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  [v7 encodeObject:Property forKey:@"PayloadAppRules"];
  objc_msgSend(v7, "encodeInteger:forKey:", -[NEPathController cellularFallbackFlags](self, "cellularFallbackFlags"), @"cellularFallbackFlags");
  objc_msgSend(v7, "encodeBool:forKey:", -[NEPathController ignoreRouteRules](self, "ignoreRouteRules"), @"IgnoreRouteRules");
  objc_msgSend(v7, "encodeBool:forKey:", -[NEPathController ignoreFallback](self, "ignoreFallback"), @"IgnoreFallback");
}

@end