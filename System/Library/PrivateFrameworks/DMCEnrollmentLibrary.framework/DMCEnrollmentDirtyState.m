@interface DMCEnrollmentDirtyState
- (DMCEnrollmentDirtyState)initWithDictionary:(id)a3;
- (NSArray)dirtyAltDISDs;
- (NSArray)dirtyBundleIDs;
- (NSArray)dirtyPersonaIDs;
- (NSArray)dirtyProfileIdentifiers;
- (NSArray)dirtyRMAccounts;
- (NSMutableDictionary)stateDictionary;
- (id)dictionary;
- (void)_addValue:(id)a3 toArrayForKey:(id)a4;
- (void)_removeValue:(id)a3 fromArrayForKey:(id)a4;
- (void)addDirtyAltDSID:(id)a3;
- (void)addDirtyBundleID:(id)a3;
- (void)addDirtyPersonaID:(id)a3;
- (void)addDirtyProfileIdentifier:(id)a3;
- (void)addDirtyRMAccount:(id)a3;
- (void)removeDirtyAltDSID:(id)a3;
- (void)removeDirtyBundleID:(id)a3;
- (void)removeDirtyPersonaID:(id)a3;
- (void)removeDirtyProfileIdentifier:(id)a3;
- (void)removeDirtyRMAccount:(id)a3;
- (void)setStateDictionary:(id)a3;
@end

@implementation DMCEnrollmentDirtyState

- (DMCEnrollmentDirtyState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCEnrollmentDirtyState;
  v5 = [(DMCEnrollmentDirtyState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    stateDictionary = v5->_stateDictionary;
    v5->_stateDictionary = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (id)dictionary
{
  v3 = (void *)[(NSMutableDictionary *)self->_stateDictionary count];
  if (v3) {
    v3 = (void *)[(NSMutableDictionary *)self->_stateDictionary copy];
  }
  return v3;
}

- (NSArray)dirtyPersonaIDs
{
  v2 = [(DMCEnrollmentDirtyState *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"PersonaID"];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)addDirtyPersonaID:(id)a3
{
}

- (void)removeDirtyPersonaID:(id)a3
{
}

- (NSArray)dirtyRMAccounts
{
  v2 = [(DMCEnrollmentDirtyState *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"RMAccountIdentifier"];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)addDirtyRMAccount:(id)a3
{
}

- (void)removeDirtyRMAccount:(id)a3
{
}

- (NSArray)dirtyAltDISDs
{
  v2 = [(DMCEnrollmentDirtyState *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"AltDSID"];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)addDirtyAltDSID:(id)a3
{
}

- (void)removeDirtyAltDSID:(id)a3
{
}

- (NSArray)dirtyProfileIdentifiers
{
  v2 = [(DMCEnrollmentDirtyState *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"ProfileIdentifier"];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)addDirtyProfileIdentifier:(id)a3
{
}

- (void)removeDirtyProfileIdentifier:(id)a3
{
}

- (NSArray)dirtyBundleIDs
{
  v2 = [(DMCEnrollmentDirtyState *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:@"BundleID"];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)addDirtyBundleID:(id)a3
{
}

- (void)removeDirtyBundleID:(id)a3
{
}

- (void)_addValue:(id)a3 toArrayForKey:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  v7 = [(DMCEnrollmentDirtyState *)self stateDictionary];
  v8 = [v7 objectForKeyedSubscript:v6];
  char v9 = [v8 containsObject:v23];

  if ((v9 & 1) == 0)
  {
    v10 = [(DMCEnrollmentDirtyState *)self stateDictionary];
    v11 = [v10 objectForKeyedSubscript:v6];

    if (!v11)
    {
      v12 = objc_opt_new();
      v13 = [(DMCEnrollmentDirtyState *)self stateDictionary];
      [v13 setObject:v12 forKeyedSubscript:v6];
    }
    v14 = [(DMCEnrollmentDirtyState *)self stateDictionary];
    v15 = [v14 objectForKeyedSubscript:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v17 = [(DMCEnrollmentDirtyState *)self stateDictionary];
      v18 = [v17 objectForKeyedSubscript:v6];
      v19 = (void *)[v18 mutableCopy];
      v20 = [(DMCEnrollmentDirtyState *)self stateDictionary];
      [v20 setObject:v19 forKeyedSubscript:v6];
    }
    v21 = [(DMCEnrollmentDirtyState *)self stateDictionary];
    v22 = [v21 objectForKeyedSubscript:v6];
    [v22 addObject:v23];
  }
}

- (void)_removeValue:(id)a3 fromArrayForKey:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = [(DMCEnrollmentDirtyState *)self stateDictionary];
  v8 = [v7 objectForKeyedSubscript:v6];
  int v9 = [v8 containsObject:v19];

  if (v9)
  {
    v10 = [(DMCEnrollmentDirtyState *)self stateDictionary];
    v11 = [v10 objectForKeyedSubscript:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v13 = [(DMCEnrollmentDirtyState *)self stateDictionary];
      v14 = [v13 objectForKeyedSubscript:v6];
      v15 = (void *)[v14 mutableCopy];
      v16 = [(DMCEnrollmentDirtyState *)self stateDictionary];
      [v16 setObject:v15 forKeyedSubscript:v6];
    }
    v17 = [(DMCEnrollmentDirtyState *)self stateDictionary];
    v18 = [v17 objectForKeyedSubscript:v6];
    [v18 removeObject:v19];
  }
}

- (NSMutableDictionary)stateDictionary
{
  stateDictionary = self->_stateDictionary;
  if (!stateDictionary)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_stateDictionary;
    self->_stateDictionary = v4;

    stateDictionary = self->_stateDictionary;
  }
  return stateDictionary;
}

- (void)setStateDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end