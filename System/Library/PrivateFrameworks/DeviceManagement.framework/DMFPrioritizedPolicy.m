@interface DMFPrioritizedPolicy
+ (id)prioritizedPoliciesForAppPolicy:(id)a3 appCategoryPolicy:(id)a4 bundleIdentifiers:(id)a5 categoryPolicy:(id)a6 categoryIdentifiers:(id)a7 webPolicy:(id)a8 webCategoryPolicy:(id)a9 webDomains:(id)a10;
+ (int64_t)arbitratePolicyForPrioritizedPolicies:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPrioritizedPolicy:(id)a3;
- (DMFPrioritizedPolicy)initWithEffectivePolicy:(id)a3 identifier:(id)a4 excludableIdentifiers:(id)a5;
- (int64_t)compare:(id)a3;
- (int64_t)policy;
- (int64_t)priority;
- (unint64_t)hash;
- (void)setPolicy:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation DMFPrioritizedPolicy

- (DMFPrioritizedPolicy)initWithEffectivePolicy:(id)a3 identifier:(id)a4 excludableIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMFPrioritizedPolicy;
  v11 = [(DMFPrioritizedPolicy *)&v16 init];
  if (v11)
  {
    v12 = [v8 type];
    int v13 = [v12 isEqualToString:@"websites"];

    if (v13)
    {
      v11->_policy = [v8 policyForHostName:v9];
      uint64_t v14 = [v8 priorityForHostName:v9];
    }
    else
    {
      v11->_policy = [v8 policyForIdentifier:v9 excludableIdentifiers:v10];
      uint64_t v14 = [v8 priorityForIdentifier:v9];
    }
    v11->_priority = v14;
  }

  return v11;
}

+ (int64_t)arbitratePolicyForPrioritizedPolicies:(id)a3
{
  v3 = [a3 sortedArrayUsingSelector:sel_compare_];
  v4 = [v3 firstObject];
  int64_t v5 = [v4 policy];

  return v5;
}

+ (id)prioritizedPoliciesForAppPolicy:(id)a3 appCategoryPolicy:(id)a4 bundleIdentifiers:(id)a5 categoryPolicy:(id)a6 categoryIdentifiers:(id)a7 webPolicy:(id)a8 webCategoryPolicy:(id)a9 webDomains:(id)a10
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v70 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v73 = a9;
  id v20 = a10;
  id v21 = (id)objc_opt_new();
  id v22 = v15;
  id v23 = v16;
  v24 = v23;
  v77 = v22;
  obuint64_t j = v23;
  if (v22)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v25 = [v23 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v79 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = [[DMFPrioritizedPolicy alloc] initWithEffectivePolicy:v77 identifier:*(void *)(*((void *)&v78 + 1) + 8 * i) excludableIdentifiers:0];
          [v21 addObject:v29];
        }
        v24 = obj;
        uint64_t v26 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v26);
    }
  }

  id v30 = v21;
  id v31 = v17;
  id v32 = v18;
  v33 = v32;
  v76 = v31;
  if (v31)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v34 = [v32 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v79 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [[DMFPrioritizedPolicy alloc] initWithEffectivePolicy:v76 identifier:*(void *)(*((void *)&v78 + 1) + 8 * j) excludableIdentifiers:0];
          [v30 addObject:v38];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v35);
    }
  }

  id v39 = v30;
  id v40 = v19;
  id v41 = v20;
  v42 = v41;
  if (v40)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v43 = [v41 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v79 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [[DMFPrioritizedPolicy alloc] initWithEffectivePolicy:v40 identifier:*(void *)(*((void *)&v78 + 1) + 8 * k) excludableIdentifiers:0];
          [v39 addObject:v47];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v44);
    }
  }

  v74 = v42;
  v72 = v40;
  if (v24)
  {
    v48 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
  }
  else
  {
    v48 = 0;
  }
  id v49 = v39;
  id v50 = v70;
  id v51 = v33;
  id v52 = v48;
  if (v50)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v53 = [v51 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v79;
      do
      {
        for (uint64_t m = 0; m != v54; ++m)
        {
          if (*(void *)v79 != v55) {
            objc_enumerationMutation(v51);
          }
          v57 = [[DMFPrioritizedPolicy alloc] initWithEffectivePolicy:v50 identifier:*(void *)(*((void *)&v78 + 1) + 8 * m) excludableIdentifiers:v52];
          [v49 addObject:v57];
        }
        uint64_t v54 = [v51 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v54);
    }
  }

  v71 = v50;
  if (v74)
  {
    v58 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  }
  else
  {
    v58 = 0;
  }
  id v59 = v49;
  id v60 = v73;
  id v61 = v51;
  id v62 = v58;
  if (v60)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v63 = [v61 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v79;
      do
      {
        for (uint64_t n = 0; n != v64; ++n)
        {
          if (*(void *)v79 != v65) {
            objc_enumerationMutation(v61);
          }
          v67 = [[DMFPrioritizedPolicy alloc] initWithEffectivePolicy:v60 identifier:*(void *)(*((void *)&v78 + 1) + 8 * n) excludableIdentifiers:v62];
          [v59 addObject:v67];
        }
        uint64_t v64 = [v61 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v64);
    }
  }

  v68 = (void *)[v59 copy];
  return v68;
}

- (unint64_t)hash
{
  int64_t v3 = [(DMFPrioritizedPolicy *)self policy];
  return [(DMFPrioritizedPolicy *)self priority] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DMFPrioritizedPolicy *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(DMFPrioritizedPolicy *)self isEqualToPrioritizedPolicy:v4];
  }

  return v5;
}

- (BOOL)isEqualToPrioritizedPolicy:(id)a3
{
  return self == a3 || -[DMFPrioritizedPolicy compare:](self, "compare:", v3, v4) == 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMFPrioritizedPolicy *)self priority];
  if (v5 < [v4 priority])
  {
LABEL_5:
    int64_t v7 = -1;
    goto LABEL_6;
  }
  uint64_t v6 = [(DMFPrioritizedPolicy *)self priority];
  if (v6 <= [v4 priority])
  {
    uint64_t v8 = [(DMFPrioritizedPolicy *)self policy];
    if (v8 <= [v4 policy])
    {
      uint64_t v10 = [(DMFPrioritizedPolicy *)self policy];
      int64_t v7 = v10 < [v4 policy];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v7 = 1;
LABEL_6:

  return v7;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

@end