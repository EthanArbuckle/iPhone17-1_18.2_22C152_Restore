@interface CPLScopedIdentifier
+ (BOOL)supportsSecureCoding;
+ (CPLScopedIdentifier)scopedIdentifierWithString:(id)a3 includeScopeIndex:(BOOL)a4;
+ (CPLScopedIdentifier)scopedIdentifierWithString:(id)a3 includeScopeIndex:(BOOL)a4 defaultScopeIdentifier:(id)a5;
+ (id)descriptionWithScopeIdentifier:(id)a3 identifier:(id)a4;
+ (id)scopedIdentifiersFromArrayOfUnknownIdentifiers:(id)a3;
+ (id)scopedIdentifiersFromDictionaryOfUnknownIdentifiers:(id)a3;
+ (id)scopedIdentifiersFromSetOfUnknownIdentifiers:(id)a3;
+ (id)unscopedIdentifiersFromArrayOfScopedIdentifiers:(id)a3;
+ (id)unscopedIdentifiersFromDictionaryOfScopedIdentifiers:(id)a3;
+ (id)unscopedIdentifiersFromSetOfScopedIdentifiers:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInAMomentShare;
- (CPLScopedIdentifier)initWithCPLArchiver:(id)a3;
- (CPLScopedIdentifier)initWithCoder:(id)a3;
- (CPLScopedIdentifier)initWithScopeIdentifier:(id)a3 identifier:(id)a4;
- (CPLScopedIdentifier)initWithScopeIdentifier:(id)a3 identifier:(id)a4 scopeIndex:(int64_t)a5;
- (NSString)identifier;
- (NSString)scopeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithNoScopeIndex;
- (id)initInMainScopeWithIdentifier:(id)a3;
- (id)initRelativeToScopedIdentifier:(id)a3 identifier:(id)a4;
- (id)plistArchiveWithCPLArchiver:(id)a3;
- (id)safeFilename;
- (int64_t)scopeIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setScopeIndex:(int64_t)a3;
@end

@implementation CPLScopedIdentifier

- (CPLScopedIdentifier)initWithCPLArchiver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_opt_class();
        uint64_t v10 = v5[2];
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        id v11 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Incorrect class for CPLScopedIdentifier. Found %@: '%@'", buf, 0x16u);
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    [v12 handleFailureInMethod:a2, self, v13, 1167, @"Incorrect class for CPLScopedIdentifier. Found %@: '%@'", objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  v6 = [(CPLScopedIdentifier *)self initWithCoder:v5];

  return v6;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v5 archiveCursor];
  [v5 setArchiveCursor:v6];
  [(CPLScopedIdentifier *)self encodeWithCoder:v5];
  [v5 setArchiveCursor:v7];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)scopeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isInAMomentShare
{
  return [(NSString *)self->_scopeIdentifier hasPrefix:@"CMM-"];
}

- (id)safeFilename
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@#%@", self->_scopeIdentifier, self->_identifier];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"/", @":", 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CPLScopedIdentifier alloc];
  scopeIdentifier = self->_scopeIdentifier;
  identifier = self->_identifier;
  return [(CPLScopedIdentifier *)v4 initWithScopeIdentifier:scopeIdentifier identifier:identifier];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLScopedIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = self->_scopeIdentifier;
    id v6 = (void *)v5;
    scopeIdentifier = v4->_scopeIdentifier;
    if (v5 && scopeIdentifier)
    {
      char v8 = objc_msgSend((id)v5, "isEqual:");

      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
    else
    {
      unint64_t v10 = v5 | (unint64_t)scopeIdentifier;

      if (v10) {
        goto LABEL_6;
      }
    }
    BOOL v9 = [(NSString *)self->_identifier isEqualToString:v4->_identifier];
    goto LABEL_10;
  }
LABEL_6:
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  scopeIdentifier = self->_scopeIdentifier;
  unint64_t v4 = [(NSString *)self->_identifier hash];
  if (scopeIdentifier) {
    v4 ^= [(NSString *)self->_scopeIdentifier hash];
  }
  return v4;
}

- (id)description
{
  if (self->_scopeIndex <= 0)
  {
    unint64_t v5 = [(CPLScopedIdentifier *)self descriptionWithNoScopeIndex];
  }
  else
  {
    id v3 = [NSString alloc];
    unint64_t v4 = [(CPLScopedIdentifier *)self descriptionWithNoScopeIndex];
    unint64_t v5 = (void *)[v3 initWithFormat:@"%@(%ld)", v4, self->_scopeIndex];
  }
  return v5;
}

- (id)descriptionWithNoScopeIndex
{
  return +[CPLScopedIdentifier descriptionWithScopeIdentifier:self->_scopeIdentifier identifier:self->_identifier];
}

- (CPLScopedIdentifier)initWithScopeIdentifier:(id)a3 identifier:(id)a4 scopeIndex:(int64_t)a5
{
  result = [(CPLScopedIdentifier *)self initWithScopeIdentifier:a3 identifier:a4];
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (result) {
      result->_scopeIndex = a5;
    }
  }
  return result;
}

- (id)initInMainScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = CPLPrimaryScopeIdentifierForCurrentUniverse();
  id v6 = [(CPLScopedIdentifier *)self initWithScopeIdentifier:v5 identifier:v4];

  return v6;
}

- (id)initRelativeToScopedIdentifier:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 scopeIdentifier];
  BOOL v9 = [(CPLScopedIdentifier *)self initWithScopeIdentifier:v8 identifier:v7];

  if (v9) {
    v9->_scopeIndex = v6[1];
  }

  return v9;
}

- (CPLScopedIdentifier)initWithScopeIdentifier:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      __int16 v16 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "nil identifier", buf, 2u);
      }
    }
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopedIdentifier.m"];
    [v17 handleFailureInMethod:a2 object:self file:v18 lineNumber:221 description:@"nil identifier"];

    abort();
  }
  BOOL v9 = v8;
  v19.receiver = self;
  v19.super_class = (Class)CPLScopedIdentifier;
  unint64_t v10 = [(CPLScopedIdentifier *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    scopeIdentifier = v10->_scopeIdentifier;
    v10->_scopeIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v13;
  }
  return v10;
}

- (void)setScopeIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v5 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "invalid scope index", v8, 2u);
      }
    }
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopedIdentifier.m"];
    [v6 handleFailureInMethod:a2 object:self file:v7 lineNumber:130 description:@"invalid scope index"];

    abort();
  }
  self->_scopeIndex = a3;
}

- (int64_t)scopeIndex
{
  if (self->_scopeIndex <= 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return self->_scopeIndex;
  }
}

- (CPLScopedIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLScopedIdentifier;
  unint64_t v5 = [(CPLScopedIdentifier *)&v11 init];
  if (v5)
  {
    if (initWithCoder__onceToken_10113 != -1) {
      dispatch_once(&initWithCoder__onceToken_10113, &__block_literal_global_48);
    }
    uint64_t v6 = [v4 decodeObjectOfClass:initWithCoder__stringClass_10114 forKey:@"i"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:initWithCoder__stringClass_10114 forKey:@"s"];
    scopeIdentifier = v5->_scopeIdentifier;
    v5->_scopeIdentifier = (NSString *)v8;

    v5->_scopeIndex = [v4 decodeIntegerForKey:@"#"];
  }

  return v5;
}

uint64_t __37__CPLScopedIdentifier_initWithCoder___block_invoke()
{
  uint64_t result = objc_opt_class();
  initWithCoder__stringClass_10114 = result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_identifier forKey:@"i"];
  [v4 encodeObject:self->_scopeIdentifier forKey:@"s"];
  if (self->_scopeIndex >= 1) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
}

+ (CPLScopedIdentifier)scopedIdentifierWithString:(id)a3 includeScopeIndex:(BOOL)a4 defaultScopeIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v10 rangeOfString:@"#"];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:v9 identifier:v10];
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v13 = [v10 substringToIndex:v11];
    v15 = [v10 substringFromIndex:v14 + 1];

    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __91__CPLScopedIdentifier_scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier___block_invoke;
    v30 = &__block_descriptor_48_e5_v8__0l;
    SEL v31 = a2;
    id v32 = a1;
    if (scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__onceToken != -1) {
      dispatch_once(&scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__onceToken, &v27);
    }
    __int16 v16 = objc_msgSend((id)scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp, "firstMatchInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length", v27, v28, v29, v30, v31, v32));
    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = [v16 rangeAtIndex:2];
      v20 = objc_msgSend(v15, "substringWithRange:", v18, v19);
      uint64_t v21 = [v20 integerValue];

      uint64_t v22 = [v17 rangeAtIndex:1];
      uint64_t v24 = objc_msgSend(v15, "substringWithRange:", v22, v23);

      v15 = (void *)v24;
    }
    else
    {
      uint64_t v21 = 0;
    }
    v25 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:v15 identifier:v13];
    v12 = v25;
    if (v5 && v21 >= 1) {
      [(CPLScopedIdentifier *)v25 setScopeIndex:v21];
    }
  }
  return v12;
}

void __91__CPLScopedIdentifier_scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^(.*)\\(([0-9]+)\\)$" options:0 error:0];
  id v3 = (void *)scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp;
  scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp = v2;

  if (!scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Impossible to create regular expression for scopes", v9, 2u);
      }
    }
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopedIdentifier.m"];
    [v5 handleFailureInMethod:v7 object:v6 file:v8 lineNumber:306 description:@"Impossible to create regular expression for scopes"];

    abort();
  }
}

+ (CPLScopedIdentifier)scopedIdentifierWithString:(id)a3 includeScopeIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = CPLPrimaryScopeIdentifierForCurrentUniverse();
  uint64_t v8 = [a1 scopedIdentifierWithString:v6 includeScopeIndex:v4 defaultScopeIdentifier:v7];

  return (CPLScopedIdentifier *)v8;
}

+ (id)descriptionWithScopeIdentifier:(id)a3 identifier:(id)a4
{
  BOOL v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithFormat:@"%@#%@", v6, v7];

  return v8;
}

+ (id)unscopedIdentifiersFromDictionaryOfScopedIdentifiers:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__CPLScopedIdentifier_unscopedIdentifiersFromDictionaryOfScopedIdentifiers___block_invoke;
    v8[3] = &unk_1E60A8330;
    id v5 = v4;
    id v9 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
    if (!v3) {
      id v6 = 0;
    }
    id v5 = v6;
  }

  return v5;
}

void __76__CPLScopedIdentifier_unscopedIdentifiersFromDictionaryOfScopedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 identifier];
  [v4 setObject:v5 forKeyedSubscript:v6];
}

+ (id)unscopedIdentifiersFromSetOfScopedIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifier", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)unscopedIdentifiersFromArrayOfScopedIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (!v3) {
      uint64_t v11 = 0;
    }
    id v4 = v11;
  }

  return v4;
}

+ (id)scopedIdentifiersFromDictionaryOfUnknownIdentifiers:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    memset(v10, 0, sizeof(v10));
    if ([v3 countByEnumeratingWithState:v10 objects:v11 count:16]) {
      id v4 = **((id **)&v10[0] + 1);
    }
    else {
      id v4 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __75__CPLScopedIdentifier_scopedIdentifiersFromDictionaryOfUnknownIdentifiers___block_invoke;
      v8[3] = &unk_1E60A8308;
      id v5 = v6;
      id v9 = v5;
      [v3 enumerateKeysAndObjectsUsingBlock:v8];
    }
    else
    {
      id v5 = v3;
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

void __75__CPLScopedIdentifier_scopedIdentifiersFromDictionaryOfUnknownIdentifiers___block_invoke(uint64_t a1, CPLScopedIdentifier *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = a2;
    a2 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:@"PrimarySync" identifier:v5];
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:a2];
}

+ (id)scopedIdentifiersFromSetOfUnknownIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count]
    && ([v3 anyObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v12)
          {
            id v13 = v12;
            long long v14 = [CPLScopedIdentifier alloc];
            long long v15 = [(CPLScopedIdentifier *)v14 initWithScopeIdentifier:@"PrimarySync", v13, (void)v17 identifier];
          }
          else
          {
            long long v15 = 0;
          }
          objc_msgSend(v6, "addObject:", v15, (void)v17);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

+ (id)scopedIdentifiersFromArrayOfUnknownIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count]
    && ([v3 firstObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v12)
          {
            id v13 = v12;
            long long v14 = [CPLScopedIdentifier alloc];
            long long v15 = [(CPLScopedIdentifier *)v14 initWithScopeIdentifier:@"PrimarySync", v13, (void)v17 identifier];
          }
          else
          {
            long long v15 = 0;
          }
          objc_msgSend(v6, "addObject:", v15, (void)v17);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end