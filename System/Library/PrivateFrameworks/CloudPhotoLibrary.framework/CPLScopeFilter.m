@interface CPLScopeFilter
- (BOOL)filterOnScopeIdentifier:(id)a3;
- (CPLScopeFilter)initWithExcludedScopeIdentifiers:(id)a3;
- (CPLScopeFilter)initWithIncludedScopeIdentifiers:(id)a3;
- (NSSet)excludedScopeIdentifiers;
- (NSSet)includedScopeIdentifiers;
- (NSString)simpleDescription;
- (id)_setOfScopeIdentifiersFromEnumeration:(id)a3;
- (id)description;
@end

@implementation CPLScopeFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedScopeIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedScopeIdentifiers, 0);
}

- (NSSet)excludedScopeIdentifiers
{
  return self->_excludedScopeIdentifiers;
}

- (NSSet)includedScopeIdentifiers
{
  return self->_includedScopeIdentifiers;
}

- (NSString)simpleDescription
{
  includedScopeIdentifiers = self->_includedScopeIdentifiers;
  if (includedScopeIdentifiers)
  {
    v4 = [(NSSet *)includedScopeIdentifiers allObjects];
    v5 = [v4 componentsJoinedByString:@", "];
LABEL_5:

    goto LABEL_6;
  }
  if (self->_excludedScopeIdentifiers)
  {
    id v6 = [NSString alloc];
    v4 = [(NSSet *)self->_excludedScopeIdentifiers allObjects];
    v7 = [v4 componentsJoinedByString:@", "];
    v5 = (__CFString *)[v6 initWithFormat:@"All Scopes but %@", v7];

    goto LABEL_5;
  }
  v5 = @"All Scopes";
LABEL_6:
  return (NSString *)v5;
}

- (id)description
{
  if (self->_includedScopeIdentifiers)
  {
    id v3 = [NSString alloc];
    v4 = [(NSSet *)self->_includedScopeIdentifiers allObjects];
    v5 = [v4 componentsJoinedByString:@", "];
    uint64_t v6 = [v3 initWithFormat:@"[incl: %@]", v5];
LABEL_5:
    v8 = (__CFString *)v6;

    goto LABEL_6;
  }
  if (self->_excludedScopeIdentifiers)
  {
    id v7 = [NSString alloc];
    v4 = [(NSSet *)self->_excludedScopeIdentifiers allObjects];
    v5 = [v4 componentsJoinedByString:@", "];
    uint64_t v6 = [v7 initWithFormat:@"[excl: %@]", v5];
    goto LABEL_5;
  }
  v8 = @"[none]";
LABEL_6:
  return v8;
}

- (BOOL)filterOnScopeIdentifier:(id)a3
{
  id v4 = a3;
  includedScopeIdentifiers = self->_includedScopeIdentifiers;
  if (includedScopeIdentifiers)
  {
    LOBYTE(v6) = [(NSSet *)includedScopeIdentifiers containsObject:v4];
  }
  else
  {
    excludedScopeIdentifiers = self->_excludedScopeIdentifiers;
    if (excludedScopeIdentifiers) {
      BOOL v6 = ![(NSSet *)excludedScopeIdentifiers containsObject:v4];
    }
    else {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (CPLScopeFilter)initWithExcludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLScopeFilter;
  v5 = [(CPLScopeFilter *)&v10 init];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(CPLScopeFilter *)v5 _setOfScopeIdentifiersFromEnumeration:v4];
    excludedScopeIdentifiers = v6->_excludedScopeIdentifiers;
    v6->_excludedScopeIdentifiers = (NSSet *)v7;
  }
  return v6;
}

- (CPLScopeFilter)initWithIncludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLScopeFilter;
  v5 = [(CPLScopeFilter *)&v10 init];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(CPLScopeFilter *)v5 _setOfScopeIdentifiersFromEnumeration:v4];
    includedScopeIdentifiers = v6->_includedScopeIdentifiers;
    v6->_includedScopeIdentifiers = (NSSet *)v7;
  }
  return v6;
}

- (id)_setOfScopeIdentifiersFromEnumeration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id)[v3 copy];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

@end