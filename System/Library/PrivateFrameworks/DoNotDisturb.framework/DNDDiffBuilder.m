@interface DNDDiffBuilder
- (BOOL)hasDifferences;
- (DNDDiffBuilder)init;
- (NSArray)children;
- (NSString)description;
- (id)descriptionWithIndent:(unint64_t)a3;
- (id)object1;
- (id)object2;
- (void)diffObject:(id)a3 againstObject:(id)a4;
- (void)diffObject:(id)a3 againstObject:(id)a4 withDescription:(id)a5;
- (void)log:(id)a3 withPrefix:(id)a4;
@end

@implementation DNDDiffBuilder

- (DNDDiffBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)DNDDiffBuilder;
  return [(DNDDiffBuilder *)&v3 init];
}

- (NSArray)children
{
  v2 = (void *)[(NSMutableArray *)self->_children copy];
  return (NSArray *)v2;
}

- (BOOL)hasDifferences
{
  return self->_object1 || self->_object2 || [(NSMutableArray *)self->_children count] != 0;
}

- (id)descriptionWithIndent:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = [&stru_1EEDCFB98 stringByPaddingToLength:a3 withString:@"\t" startingAtIndex:0];
  if (self->_children)
  {
    v6 = [MEMORY[0x1E4F28E78] string];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = self->_children;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      unint64_t v11 = a3 + 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) descriptionWithIndent:v11];
          [v6 appendFormat:@"\n%@;\n", v13];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    description = self->_description;
    if (description) {
      [NSString stringWithFormat:@"%@%@: {%@%@}", v5, description, v6, v5, (void)v24];
    }
    else {
    v17 = [NSString stringWithFormat:@"%@{%@%@}", v5, v6, v5, v23, (void)v24];
    }
  }
  else
  {
    char v15 = objc_opt_respondsToSelector();
    id object1 = self->_object1;
    if (v15) {
      [object1 diffDescription];
    }
    else {
    v6 = [object1 description];
    }
    char v18 = objc_opt_respondsToSelector();
    id object2 = self->_object2;
    if (v18) {
      [object2 diffDescription];
    }
    else {
    v20 = [object2 description];
    }
    v21 = self->_description;
    if (v21) {
      [NSString stringWithFormat:@"%@%@: object1: %@; object2: %@", v5, v21, v6, v20];
    }
    else {
    v17 = [NSString stringWithFormat:@"%@object1: %@; object2: %@", v5, v6, v20, v23];
    }
  }
  return v17;
}

- (NSString)description
{
  return (NSString *)[(DNDDiffBuilder *)self descriptionWithIndent:0];
}

- (void)diffObject:(id)a3 againstObject:(id)a4
{
}

- (void)diffObject:(id)a3 againstObject:(id)a4 withDescription:(id)a5
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v17 != v9)
  {
    if (!v17
      || !v9
      || ([v17 isEqual:v9] & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unint64_t v11 = objc_alloc_init(DNDDiffBuilder);
      objc_storeStrong(&v11->_object1, a3);
      objc_storeStrong(&v11->_object2, a4);
      uint64_t v12 = [v10 copy];
      description = v11->_description;
      v11->_description = (NSString *)v12;

      children = self->_children;
      if (!children)
      {
        char v15 = [MEMORY[0x1E4F1CA48] array];
        v16 = self->_children;
        self->_children = v15;

        children = self->_children;
      }
      [(NSMutableArray *)children addObject:v11];
      if (objc_opt_respondsToSelector()) {
        [v17 diffAgainstObject:v9 usingDiffBuilder:v11 withDescription:v10];
      }
    }
  }
}

- (void)log:(id)a3 withPrefix:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v7;
    _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin diff", buf, 0xCu);
  }
  uint64_t v8 = [(DNDDiffBuilder *)self description];
  id v9 = [v8 componentsSeparatedByString:@"\n"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          *(_DWORD *)buf = 138543619;
          id v21 = v7;
          __int16 v22 = 2113;
          uint64_t v23 = v15;
          _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{private}@", buf, 0x16u);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v7;
    _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] End diff", buf, 0xCu);
  }
}

- (id)object1
{
  return self->_object1;
}

- (id)object2
{
  return self->_object2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong(&self->_object2, 0);
  objc_storeStrong(&self->_object1, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end