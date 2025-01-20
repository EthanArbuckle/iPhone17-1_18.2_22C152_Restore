@interface CPLTransportScopeMapping
- (BOOL)_addAllTransportScopesForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7;
- (BOOL)_addTransportScopeForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7;
- (BOOL)_checkTransportScopeForScopeIdentifier:(id)a3 hasConcreteScope:(BOOL *)a4 error:(id *)a5;
- (BOOL)addTransportScopeForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7;
- (BOOL)addTransportScopeForScopeIdentifier:(id)a3 scopes:(id)a4 useStagingScopeIfNecessary:(BOOL)a5 error:(id *)a6;
- (BOOL)hasConcreteScopeForScopeWithIdentifier:(id)a3;
- (BOOL)hasStagingScopes;
- (BOOL)shouldSetSharedScopeIdentifierForScopeWithIdentifier:(id)a3;
- (CPLTransportScopeMapping)initWithTranslator:(id)a3;
- (CPLTransportScopeTranslator)translator;
- (id)concreteScopeForScopeWithIdentifier:(id)a3;
- (id)description;
- (id)sharedScopeIdentifierForScopeWithIdentifier:(id)a3;
- (unint64_t)count;
- (void)addConcreteScope:(id)a3 forScopeWithIdentifier:(id)a4;
- (void)addTransportScope:(id)a3 forScopeWithIdentifier:(id)a4;
- (void)enumerateConcreteScopesWithBlock:(id)a3;
- (void)setSharedScopeIdentifier:(id)a3 forScopeWithIdentifier:(id)a4;
- (void)updateWithTransportScopeMapping:(id)a3;
@end

@implementation CPLTransportScopeMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_sharedScopeIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

- (BOOL)hasStagingScopes
{
  return self->_hasStagingScopes;
}

- (CPLTransportScopeTranslator)translator
{
  return self->_translator;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p for %@ (count: %lu)>", objc_opt_class(), self, self->_translator, -[NSMutableDictionary count](self->_mapping, "count")];
  return v2;
}

- (void)updateWithTransportScopeMapping:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (CPLTransportScopeMapping *)a3;
  v6 = v5;
  if (v5 != self)
  {
    v12 = v5;
    if (self->_translator != v5->_translator)
    {
      if (!_CPLSilentLogging)
      {
        v7 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          translator = self->_translator;
          v9 = v12->_translator;
          *(_DWORD *)buf = 138412546;
          v14 = translator;
          __int16 v15 = 2112;
          v16 = v9;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Trying to merge two incompatible mappings (%@ / %@)", buf, 0x16u);
        }
      }
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLTransportScopeMapping.m"];
      [v10 handleFailureInMethod:a2, self, v11, 184, @"Trying to merge two incompatible mappings (%@ / %@)", self->_translator, v12->_translator object file lineNumber description];

      abort();
    }
    [(NSMutableDictionary *)self->_mapping addEntriesFromDictionary:v5->_mapping];
    v5 = (CPLTransportScopeMapping *)[(NSMutableDictionary *)self->_sharedScopeIdentifierMapping addEntriesFromDictionary:v12->_sharedScopeIdentifierMapping];
    v6 = v12;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (BOOL)addTransportScopeForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  char v17 = 0;
  v14 = [v12 scopeIdentifier];
  BOOL v15 = [(CPLTransportScopeMapping *)self _checkTransportScopeForScopeIdentifier:v14 hasConcreteScope:&v17 error:a7];
  if (v15 && !v17) {
    LOBYTE(v15) = [(CPLTransportScopeMapping *)self _addAllTransportScopesForScope:v12 scopes:v13 allowsTentativeTransportScope:v9 useStagingScopeIfNecessary:v8 error:a7];
  }

  return v15;
}

- (BOOL)addTransportScopeForScopeIdentifier:(id)a3 scopes:(id)a4 useStagingScopeIfNecessary:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  char v16 = 0;
  BOOL v12 = [(CPLTransportScopeMapping *)self _checkTransportScopeForScopeIdentifier:v10 hasConcreteScope:&v16 error:a6];
  if (v12 && !v16)
  {
    id v13 = [v11 scopeWithIdentifier:v10];
    if (v13)
    {
      LOBYTE(v12) = [(CPLTransportScopeMapping *)self _addAllTransportScopesForScope:v13 scopes:v11 allowsTentativeTransportScope:0 useStagingScopeIfNecessary:v7 error:a6];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableDictionary *)self->_mapping setObject:v14 forKeyedSubscript:v10];

      if (a6)
      {
        +[CPLErrors cplErrorWithCode:32, @"Unknown scope %@", v10 description];
        LOBYTE(v12) = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
  }
  return v12;
}

- (BOOL)_addAllTransportScopesForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  if ([(CPLTransportScopeMapping *)self _addTransportScopeForScope:v12 scopes:v13 allowsTentativeTransportScope:v9 useStagingScopeIfNecessary:v8 error:a7])
  {
    v14 = [v13 sharingScopeForScope:v12];
    BOOL v15 = [v14 scopeIdentifier];
    char v16 = [v12 scopeIdentifier];
    [(CPLTransportScopeMapping *)self setSharedScopeIdentifier:v15 forScopeWithIdentifier:v16];

    if (v14) {
      BOOL v17 = [(CPLTransportScopeMapping *)self _addTransportScopeForScope:v14 scopes:v13 allowsTentativeTransportScope:v9 useStagingScopeIfNecessary:v8 error:a7];
    }
    else {
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_addTransportScopeForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = [v12 scopeIdentifier];
  if (v8
    && +[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", [v12 scopeType]))
  {
    BOOL v15 = [v13 stagingScopeForScope:v12];
    char v16 = v15;
    BOOL v17 = v15 != 0;
    if (v15)
    {
      id v18 = v15;

      id v12 = v18;
    }
  }
  else
  {
    BOOL v17 = 0;
  }
  v19 = [v13 transportScopeForScope:v12];
  if (!v19)
  {
    if (!v9) {
      goto LABEL_24;
    }
    p_translator = &self->_translator;
LABEL_14:
    v22 = [(CPLTransportScopeTranslator *)*p_translator tentativeConcreteScopeForScope:v12];
    if (!v22) {
      goto LABEL_24;
    }
    goto LABEL_15;
  }
  p_translator = &self->_translator;
  uint64_t v21 = [(CPLTransportScopeTranslator *)self->_translator concreteScopeFromTransportScope:v19];
  v22 = (void *)v21;
  if (!v21 && v9) {
    goto LABEL_14;
  }
  if (!v21)
  {
LABEL_24:
    v26 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)self->_mapping setObject:v26 forKeyedSubscript:v14];

    if (a7)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:v14];
      v22 = 0;
      BOOL v25 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
      BOOL v25 = 0;
    }
    goto LABEL_27;
  }
LABEL_15:
  [(NSMutableDictionary *)self->_mapping setObject:v22 forKeyedSubscript:v14];
  BOOL v23 = self->_hasStagingScopes && v17;
  self->_hasStagingScopes = v23;
  if (!_CPLSilentLogging)
  {
    if (__CPLTransportScopeOSLogDomain_onceToken != -1) {
      dispatch_once(&__CPLTransportScopeOSLogDomain_onceToken, &__block_literal_global_4261);
    }
    v24 = __CPLTransportScopeOSLogDomain_result;
    if (os_log_type_enabled((os_log_t)__CPLTransportScopeOSLogDomain_result, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 138412802;
      v29 = v22;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      v33 = self;
      _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEBUG, "Adding %@ for %@ to %@", (uint8_t *)&v28, 0x20u);
    }
  }
  BOOL v25 = 1;
LABEL_27:

  return v25;
}

- (BOOL)_checkTransportScopeForScopeIdentifier:(id)a3 hasConcreteScope:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [(NSMutableDictionary *)self->_mapping objectForKeyedSubscript:v8];
  id v10 = [MEMORY[0x1E4F1CA98] null];

  if (v9 == v10)
  {
    if (a5)
    {
      *a5 = +[CPLErrors cplErrorWithCode:32, @"Scope %@ has an invalid transport scope", v8 description];
    }
  }
  else
  {
    *a4 = v9 != 0;
  }

  return v9 != v10;
}

- (void)enumerateConcreteScopesWithBlock:(id)a3
{
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_mapping count];
}

- (id)sharedScopeIdentifierForScopeWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sharedScopeIdentifierMapping objectForKeyedSubscript:a3];
  v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

- (BOOL)shouldSetSharedScopeIdentifierForScopeWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sharedScopeIdentifierMapping objectForKeyedSubscript:a3];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)setSharedScopeIdentifier:(id)a3 forScopeWithIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_sharedScopeIdentifierMapping)
  {
    BOOL v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharedScopeIdentifierMapping = self->_sharedScopeIdentifierMapping;
    self->_sharedScopeIdentifierMapping = v7;
  }
  if (v10)
  {
    [(NSMutableDictionary *)self->_sharedScopeIdentifierMapping setObject:v10 forKeyedSubscript:v6];
  }
  else
  {
    BOOL v9 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)self->_sharedScopeIdentifierMapping setObject:v9 forKeyedSubscript:v6];
  }
}

- (BOOL)hasConcreteScopeForScopeWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_mapping objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)concreteScopeForScopeWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_mapping objectForKeyedSubscript:a3];
  BOOL v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

- (void)addConcreteScope:(id)a3 forScopeWithIdentifier:(id)a4
{
}

- (void)addTransportScope:(id)a3 forScopeWithIdentifier:(id)a4
{
  id v7 = a4;
  id v6 = [(CPLTransportScopeTranslator *)self->_translator concreteScopeFromTransportScope:a3];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  [(NSMutableDictionary *)self->_mapping setObject:v6 forKeyedSubscript:v7];
}

- (CPLTransportScopeMapping)initWithTranslator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLTransportScopeMapping;
  id v6 = [(CPLTransportScopeMapping *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_translator, a3);
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapping = v7->_mapping;
    v7->_mapping = v8;
  }
  return v7;
}

@end