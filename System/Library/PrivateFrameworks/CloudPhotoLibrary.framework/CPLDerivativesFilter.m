@interface CPLDerivativesFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)_isValidDropDerivativeRecipeWithUTI:(id)a3 sourceType:(unint64_t)a4 derivativeTypes:(id)a5 changeType:(unint64_t)a6;
- (BOOL)addServerDropDerivativesRecipe:(id)a3;
- (BOOL)addServerDropDerivativesRecipes:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)mightDropSomeDerivativesForSourceType:(unint64_t)a3 forChangeType:(unint64_t)a4;
- (BOOL)shouldDropDerivativeWithDropDerivativeRecipe:(id)a3;
- (CPLDerivativesFilter)init;
- (CPLDerivativesFilter)initWithCoder:(id)a3;
- (NSArray)plistDescription;
- (id)_descriptionForStoredResponse:(id)a3 recordType:(unint64_t)a4;
- (id)_getTargetDictionaryForChangeType:(unint64_t)a3;
- (id)description;
- (void)_enumerateDropDerivativeRules:(id)a3 ofType:(unint64_t)a4 withBlock:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateDropDerivativeRulesWithBlock:(id)a3;
- (void)reset;
@end

@implementation CPLDerivativesFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipInfoForMasterChange, 0);
  objc_storeStrong((id *)&self->_skipInfoForAssetChange, 0);
}

- (void)enumerateDropDerivativeRulesWithBlock:(id)a3
{
  skipInfoForMasterChange = self->_skipInfoForMasterChange;
  id v5 = a3;
  [(CPLDerivativesFilter *)self _enumerateDropDerivativeRules:skipInfoForMasterChange ofType:1 withBlock:v5];
  [(CPLDerivativesFilter *)self _enumerateDropDerivativeRules:self->_skipInfoForAssetChange ofType:2 withBlock:v5];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:&stru_1F0D5F858];
  if ([(NSMutableDictionary *)self->_skipInfoForAssetChange count])
  {
    v4 = [(CPLDerivativesFilter *)self _descriptionForStoredResponse:self->_skipInfoForAssetChange recordType:2];
    id v5 = [v4 componentsSeparatedByString:@"\n"];
    v6 = [v5 componentsJoinedByString:@"\n\t"];
    [v3 appendFormat:@"\n[DerivativeSkipInfoForAssetChange: \n\t%@]", v6];
  }
  if ([(NSMutableDictionary *)self->_skipInfoForMasterChange count])
  {
    v7 = [(CPLDerivativesFilter *)self _descriptionForStoredResponse:self->_skipInfoForMasterChange recordType:1];
    v8 = [v7 componentsSeparatedByString:@"\n"];
    v9 = [v8 componentsJoinedByString:@"\n\t"];
    [v3 appendFormat:@"\n[DerivativeSkipInfoForMasterChange: \n\t%@]", v9];
  }
  v10 = [NSString stringWithString:v3];

  return v10;
}

- (NSArray)plistDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CPLDerivativesFilter_plistDescription__block_invoke;
  v6[3] = &unk_1E60A81F0;
  id v4 = v3;
  id v7 = v4;
  [(CPLDerivativesFilter *)self enumerateDropDerivativeRulesWithBlock:v6];

  return (NSArray *)v4;
}

void __40__CPLDerivativesFilter_plistDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 plistDescription];
  [v2 addObject:v3];
}

- (id)_descriptionForStoredResponse:(id)a3 recordType:(unint64_t)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CPLDerivativesFilter__descriptionForStoredResponse_recordType___block_invoke;
  v12[3] = &unk_1E60A81F0;
  id v13 = v8;
  id v9 = v8;
  [(CPLDerivativesFilter *)self _enumerateDropDerivativeRules:v7 ofType:a4 withBlock:v12];

  v10 = [v9 componentsJoinedByString:@"\n"];

  return v10;
}

uint64_t __65__CPLDerivativesFilter__descriptionForStoredResponse_recordType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)isEmpty
{
  return ![(NSMutableDictionary *)self->_skipInfoForAssetChange count]
      && [(NSMutableDictionary *)self->_skipInfoForMasterChange count] == 0;
}

- (void)reset
{
  id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  skipInfoForAssetChange = self->_skipInfoForAssetChange;
  self->_skipInfoForAssetChange = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  skipInfoForMasterChange = self->_skipInfoForMasterChange;
  self->_skipInfoForMasterChange = v5;
  MEMORY[0x1F41817F8](v5, skipInfoForMasterChange);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CPLDerivativesFilter *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([(NSMutableDictionary *)self->_skipInfoForAssetChange isEqualToDictionary:v5->_skipInfoForAssetChange])char v6 = [(NSMutableDictionary *)self->_skipInfoForMasterChange isEqualToDictionary:v5->_skipInfoForMasterChange]; {
      else
      }
        char v6 = 0;
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)_enumerateDropDerivativeRules:(id)a3 ofType:(unint64_t)a4 withBlock:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke;
  v9[3] = &unk_1E60A81C8;
  id v10 = v7;
  unint64_t v11 = a4;
  id v8 = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v9];
}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_2;
  v17[3] = &unk_1E60A8178;
  id v18 = v8;
  id v9 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v17];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_4;
  v13[3] = &unk_1E60A81A0;
  unint64_t v11 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v5;
  uint64_t v16 = v10;
  id v15 = v11;
  id v12 = v5;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_3;
  v7[3] = &unk_1E60A8150;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = -[CPLDropDerivativesRecipe initWithSourceResourceType:uti:changeType:droppingDerivativeTypes:]([CPLDropDerivativesRecipe alloc], "initWithSourceResourceType:uti:changeType:droppingDerivativeTypes:", [*(id *)(a1 + 32) unsignedIntegerValue], v6, *(void *)(a1 + 48), v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKey:v4];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v8 = v7;

  [v8 addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v4];
}

- (BOOL)shouldDropDerivativeWithDropDerivativeRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uti];
  uint64_t v6 = [v4 sourceResourceType];
  uint64_t v7 = [v4 changeType];
  id v8 = [v4 derivativeTypes];
  if (-[CPLDerivativesFilter _isValidDropDerivativeRecipeWithUTI:sourceType:derivativeTypes:changeType:](self, "_isValidDropDerivativeRecipeWithUTI:sourceType:derivativeTypes:changeType:", v5, v6, v8, v7)&& [v8 count] == 1)
  {
    id v9 = [(CPLDerivativesFilter *)self _getTargetDictionaryForChangeType:v7];
    uint64_t v10 = [v8 firstObject];
    unint64_t v11 = [NSNumber numberWithUnsignedInteger:v6];
    id v12 = [v9 objectForKey:v11];
    id v13 = [v12 objectForKey:v10];

    id v14 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v5];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__CPLDerivativesFilter_shouldDropDerivativeWithDropDerivativeRecipe___block_invoke;
    v18[3] = &unk_1E60A8128;
    id v15 = v14;
    id v19 = v15;
    v20 = &v21;
    [v13 enumerateObjectsUsingBlock:v18];
    BOOL v16 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __69__CPLDerivativesFilter_shouldDropDerivativeWithDropDerivativeRecipe___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:a2];
  LODWORD(v6) = [v6 conformsToType:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)mightDropSomeDerivativesForSourceType:(unint64_t)a3 forChangeType:(unint64_t)a4
{
  id v5 = [(CPLDerivativesFilter *)self _getTargetDictionaryForChangeType:a4];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [v5 objectForKey:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

- (BOOL)addServerDropDerivativesRecipe:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uti];
  uint64_t v6 = [v4 sourceResourceType];
  uint64_t v7 = [v4 changeType];
  BOOL v8 = [v4 derivativeTypes];
  if ([(CPLDerivativesFilter *)self _isValidDropDerivativeRecipeWithUTI:v5 sourceType:v6 derivativeTypes:v8 changeType:v7])
  {
    id v9 = [(CPLDerivativesFilter *)self _getTargetDictionaryForChangeType:v7];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      uint64_t v24 = [NSNumber numberWithUnsignedInteger:v6];
      unint64_t v11 = -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:");
      id v12 = v11;
      if (v11) {
        id v13 = v11;
      }
      else {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      id v15 = v13;

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke;
      v25[3] = &unk_1E60A8100;
      id v16 = v15;
      id v26 = v16;
      id v17 = v5;
      id v27 = v17;
      uint64_t v29 = v6;
      id v18 = v8;
      id v28 = v18;
      uint64_t v30 = v7;
      [v18 enumerateObjectsUsingBlock:v25];
      [v9 setObject:v16 forKeyedSubscript:v24];
      if (!_CPLSilentLogging)
      {
        id v19 = __CPLDerivativesOSLogDomain();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = +[CPLResource shortDescriptionForResourceType:v6];
          uint64_t v21 = _shortDescriptionForArrayOfCPLResourceTypes(v18);
          v22 = +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:v7];
          *(_DWORD *)buf = 138413058;
          uint64_t v32 = (uint64_t)v20;
          __int16 v33 = 2112;
          id v34 = v17;
          __int16 v35 = 2112;
          v36 = v21;
          __int16 v37 = 2112;
          v38 = v22;
          _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Added server supported derivative upload skip info to derivativesFilter. SourceType: %@, UTI: %@, derivativeTypes: %@, recordChangetype: %@", buf, 0x2Au);
        }
        BOOL v10 = v9 != 0;
      }

      id v14 = v24;
LABEL_18:

      goto LABEL_19;
    }
    if (!_CPLSilentLogging)
    {
      id v14 = __CPLDerivativesOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v32 = v7;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Invalid derivative dropping rule. Record change type not supported: %lu", buf, 0xCu);
      }
      goto LABEL_18;
    }
    id v9 = 0;
  }
  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v10 = 0;
      goto LABEL_20;
    }
    id v9 = __CPLDerivativesOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v4;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid derivative dropping rule: %@", buf, 0xCu);
    }
  }
  BOOL v10 = 0;
LABEL_19:

LABEL_20:
  return v10;
}

void __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v7 = v6;

  BOOL v8 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke_2;
  id v16 = &unk_1E60A80D8;
  id v9 = v8;
  id v17 = v9;
  uint64_t v10 = *(void *)(a1 + 56);
  v20 = &v23;
  uint64_t v21 = v10;
  id v18 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  id v19 = v11;
  uint64_t v22 = v12;
  [v7 enumerateObjectsUsingBlock:&v13];
  if (!*((unsigned char *)v24 + 24))
  {
    objc_msgSend(v7, "addObject:", *(void *)(a1 + 40), v13, v14, v15, v16, v17, v18);
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v3];
  }

  _Block_object_dispose(&v23, 8);
}

void __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:a2];
  LODWORD(v6) = [v6 conformsToType:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
    if (!_CPLSilentLogging)
    {
      BOOL v8 = __CPLDerivativesOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = +[CPLResource shortDescriptionForResourceType:*(void *)(a1 + 64)];
        uint64_t v10 = *(void *)(a1 + 40);
        id v11 = _shortDescriptionForArrayOfCPLResourceTypes(*(void **)(a1 + 48));
        uint64_t v12 = +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:*(void *)(a1 + 72)];
        int v13 = 138413058;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Duplicate server rule found in response, sourceType: %@, UTI: %@, derivativeTypes: %@, recordChangetype: %@", (uint8_t *)&v13, 0x2Au);
      }
    }
  }
}

- (BOOL)addServerDropDerivativesRecipes:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CPLDerivativesFilter_addServerDropDerivativesRecipes___block_invoke;
  v6[3] = &unk_1E60A80B0;
  void v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __56__CPLDerivativesFilter_addServerDropDerivativesRecipes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) addServerDropDerivativesRecipe:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isValidDropDerivativeRecipeWithUTI:(id)a3 sourceType:(unint64_t)a4 derivativeTypes:(id)a5 changeType:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v9];
  uint64_t v12 = (void *)v11;
  if (a4 && v11 && [v10 count])
  {

    if (a6)
    {
      BOOL v13 = 1;
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v14 = __CPLDerivativesOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = +[CPLResource shortDescriptionForResourceType:a4];
      uint64_t v16 = _shortDescriptionForArrayOfCPLResourceTypes(v10);
      __int16 v17 = +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:a6];
      int v19 = 138413058;
      v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      char v26 = v17;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Invalid CPLDropDerivativesRecipe, sourceType: %@, UTI: %@, derivativeTypes: %@, recordChangetype: %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (id)_getTargetDictionaryForChangeType:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    uint64_t v4 = 16;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    uint64_t v4 = 8;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    goto LABEL_11;
  }
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLDerivativesOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:a3];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Unknown upload skip record type: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v5 = 0;
LABEL_11:
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  skipInfoForAssetChange = self->_skipInfoForAssetChange;
  id v5 = a3;
  [v5 encodeObject:skipInfoForAssetChange forKey:@"dropForAssetChange"];
  [v5 encodeObject:self->_skipInfoForMasterChange forKey:@"dropForMasterChange"];
}

- (CPLDerivativesFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPLDerivativesFilter;
  id v5 = [(CPLDerivativesFilter *)&v21 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"dropForAssetChange"];
    skipInfoForAssetChange = v5->_skipInfoForAssetChange;
    v5->_skipInfoForAssetChange = (NSMutableDictionary *)v11;

    BOOL v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    __int16 v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"dropForMasterChange"];
    skipInfoForMasterChange = v5->_skipInfoForMasterChange;
    v5->_skipInfoForMasterChange = (NSMutableDictionary *)v18;
  }
  return v5;
}

- (CPLDerivativesFilter)init
{
  v8.receiver = self;
  v8.super_class = (Class)CPLDerivativesFilter;
  v2 = [(CPLDerivativesFilter *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    skipInfoForAssetChange = v2->_skipInfoForAssetChange;
    v2->_skipInfoForAssetChange = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    skipInfoForMasterChange = v2->_skipInfoForMasterChange;
    v2->_skipInfoForMasterChange = v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end