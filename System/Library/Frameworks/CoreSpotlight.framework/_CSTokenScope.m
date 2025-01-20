@interface _CSTokenScope
+ (BOOL)supportsSecureCoding;
+ (id)scopesFromCSTokenScopes:(id)a3 displayString:(id)a4 handles:(id)a5;
+ (id)tokenScopesForAllTokens;
+ (id)tokenScopesForAttachmentNameContains;
+ (id)tokenScopesForAttachmentType;
+ (id)tokenScopesForMessageWithAttachments;
+ (id)tokenScopesForPerson;
+ (id)tokenScopesForSenderContains;
+ (id)tokenScopesForSubjectContains;
+ (id)tokenScopesWithTitles:(id)a3 tokenTitles:(id)a4 scopeTypes:(id)a5 queryAttributesList:(id)a6;
+ (id)tokenScopesWithTitles:(id)a3 tokenTitles:(id)a4 scopeTypes:(id)a5 queryAttributesList:(id)a6 modifiers:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenScope:(id)a3;
- (NSMutableSet)queryTemplates;
- (NSString)title;
- (NSString)tokenTitle;
- (_CSTokenScope)initWithCoder:(id)a3;
- (_CSTokenScope)initWithTitle:(id)a3 tokenTitle:(id)a4 scopeType:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)queryForHandles:(id)a3;
- (int64_t)scopeType;
- (void)addQueryAttributes:(id)a3;
- (void)addQueryAttributes:(id)a3 modifier:(id)a4;
- (void)addQueryTemplate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setQueryTemplates:(id)a3;
- (void)setScopeType:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTokenTitle:(id)a3;
@end

@implementation _CSTokenScope

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CSTokenScope)initWithTitle:(id)a3 tokenTitle:(id)a4 scopeType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CSTokenScope;
  v10 = [(_CSTokenScope *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(_CSTokenScope *)v10 setTitle:v8];
    [(_CSTokenScope *)v11 setTokenTitle:v9];
    [(_CSTokenScope *)v11 setScopeType:a5];
    v12 = [MEMORY[0x1E4F1CA80] set];
    [(_CSTokenScope *)v11 setQueryTemplates:v12];
  }
  return v11;
}

- (_CSTokenScope)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"title"];
  v6 = [v4 decodeObjectForKey:@"tokenTitle"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"scopeType"];
  id v8 = [v4 decodeObjectForKey:@"queryTemplates"];

  id v9 = [(_CSTokenScope *)self initWithTitle:v5 tokenTitle:v6 scopeType:v7];
  v10 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
  [(_CSTokenScope *)v9 setQueryTemplates:v10];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_CSTokenScope *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(_CSTokenScope *)self tokenTitle];
  [v4 encodeObject:v6 forKey:@"tokenTitle"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_CSTokenScope scopeType](self, "scopeType"), @"scopeType");
  id v8 = [(_CSTokenScope *)self queryTemplates];
  uint64_t v7 = [v8 allObjects];
  [v4 encodeObject:v7 forKey:@"queryTemplates"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_CSTokenScope alloc];
  v5 = [(_CSTokenScope *)self title];
  v6 = [(_CSTokenScope *)self tokenTitle];
  uint64_t v7 = [(_CSTokenScope *)v4 initWithTitle:v5 tokenTitle:v6 scopeType:[(_CSTokenScope *)self scopeType]];

  id v8 = [(_CSTokenScope *)self queryTemplates];
  id v9 = (void *)[v8 mutableCopy];
  [(_CSTokenScope *)v7 setQueryTemplates:v9];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CSTokenScope *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_CSTokenScope *)self isEqualToTokenScope:v4];
  }

  return v5;
}

- (BOOL)isEqualToTokenScope:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CSTokenScope *)self queryTemplates];
  v6 = [v4 queryTemplates];
  int v7 = [v5 isEqualToSet:v6];

  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [(_CSTokenScope *)self title];
  id v9 = [v4 title];
  int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_5;
  }
  v11 = [(_CSTokenScope *)self tokenTitle];
  v12 = [v4 tokenTitle];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    int64_t v14 = [(_CSTokenScope *)self scopeType];
    BOOL v15 = v14 == [v4 scopeType];
  }
  else
  {
LABEL_5:
    BOOL v15 = 0;
  }

  return v15;
}

- (void)addQueryTemplate:(id)a3
{
  id v4 = a3;
  id v5 = [(_CSTokenScope *)self queryTemplates];
  [v5 addObject:v4];
}

- (void)addQueryAttributes:(id)a3
{
}

- (void)addQueryAttributes:(id)a3 modifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (__CFString *)a4;
  uint64_t v8 = [(__CFString *)v7 length];
  id v9 = @"cwdx{modifier}";
  if (v8) {
    id v9 = v7;
  }
  int v10 = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [NSString stringWithFormat:@"%@=\"{handle}*\"%@", *(void *)(*((void *)&v17 + 1) + 8 * v15), v10, (void)v17];
        [(_CSTokenScope *)self addQueryTemplate:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)queryForHandles:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        id v6 = *(void **)(*((void *)&v32 + 1) + 8 * v5);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        int v7 = [(_CSTokenScope *)self queryTemplates];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              uint64_t v14 = [v6 rangeOfCharacterFromSet:v13];

              if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v15 = &stru_1EDBB3A50;
              }
              else {
                uint64_t v15 = @"t";
              }
              v16 = [v12 stringByReplacingOccurrencesOfString:@"{modifier}" withString:v15];
              long long v17 = [v16 stringByReplacingOccurrencesOfString:@"{handle}" withString:v6];
              [v4 addObject:v17];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }

  long long v18 = NSString;
  long long v19 = [v4 allObjects];
  long long v20 = [v19 componentsJoinedByString:@" || "];
  v21 = [v18 stringWithFormat:@"(%@)", v20];

  return v21;
}

+ (id)scopesFromCSTokenScopes:(id)a3 displayString:(id)a4 handles:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v26[0] = @"TOKEN";
        v16 = [v15 tokenTitle];
        v27[0] = v16;
        v27[1] = v8;
        v26[1] = @"TEXT";
        v26[2] = @"QUERY";
        long long v17 = [v15 queryForHandles:v9];
        v27[2] = v17;
        v26[3] = @"TYPE";
        long long v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "scopeType"));
        v27[3] = v18;
        long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
        [v10 addObject:v19];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v12);
  }

  return v10;
}

+ (id)tokenScopesForPerson
{
  return (id)[a1 tokenScopesWithTitles:&unk_1EDBD5C08 tokenTitles:&unk_1EDBD5C20 scopeTypes:&unk_1EDBD5C38 queryAttributesList:&unk_1EDBD5C98 modifiers:&unk_1EDBD5CB0];
}

+ (id)tokenScopesForSenderContains
{
  return (id)[a1 tokenScopesWithTitles:&unk_1EDBD5CC8 tokenTitles:&unk_1EDBD5CE0 scopeTypes:&unk_1EDBD5CF8 queryAttributesList:&unk_1EDBD5D58 modifiers:&unk_1EDBD5D70];
}

+ (id)tokenScopesForSubjectContains
{
  return (id)[a1 tokenScopesWithTitles:&unk_1EDBD5D88 tokenTitles:&unk_1EDBD5DA0 scopeTypes:&unk_1EDBD5DB8 queryAttributesList:&unk_1EDBD5E00];
}

+ (id)tokenScopesForAttachmentNameContains
{
  return (id)[a1 tokenScopesWithTitles:&unk_1EDBD5E18 tokenTitles:&unk_1EDBD5E30 scopeTypes:&unk_1EDBD5E48 queryAttributesList:&unk_1EDBD5E90];
}

+ (id)tokenScopesForAttachmentType
{
  v2 = [a1 tokenScopesWithTitles:&unk_1EDBD5EA8 tokenTitles:&unk_1EDBD5EC0 scopeTypes:&unk_1EDBD5ED8 queryAttributesList:&unk_1EDBD5F20];
  id v3 = (void *)[v2 mutableCopy];

  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [NSString stringWithFormat:@"%@=\"*{handle}\"cwdx{modifier}", @"kMDItemAttachmentTypes"];
  [v4 addObject:v5];

  id v6 = [v3 objectAtIndexedSubscript:0];
  [v6 setQueryTemplates:v4];

  id v7 = (void *)[v3 copy];

  return v7;
}

+ (id)tokenScopesForMessageWithAttachments
{
  return (id)[a1 tokenScopesWithTitles:&unk_1EDBD5F38 tokenTitles:&unk_1EDBD5F50 scopeTypes:&unk_1EDBD5F68 queryAttributesList:&unk_1EDBD5F98];
}

+ (id)tokenScopesForAllTokens
{
  return (id)[a1 tokenScopesWithTitles:&unk_1EDBD5FB0 tokenTitles:&unk_1EDBD5FC8 scopeTypes:&unk_1EDBD5FE0 queryAttributesList:&unk_1EDBD6070];
}

+ (id)tokenScopesWithTitles:(id)a3 tokenTitles:(id)a4 scopeTypes:(id)a5 queryAttributesList:(id)a6
{
  return (id)[a1 tokenScopesWithTitles:a3 tokenTitles:a4 scopeTypes:a5 queryAttributesList:a6 modifiers:0];
}

+ (id)tokenScopesWithTitles:(id)a3 tokenTitles:(id)a4 scopeTypes:(id)a5 queryAttributesList:(id)a6 modifiers:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CA48];
  id v16 = a3;
  long long v17 = [v15 array];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92___CSTokenScope_tokenScopesWithTitles_tokenTitles_scopeTypes_queryAttributesList_modifiers___block_invoke;
  v25[3] = &unk_1E5549410;
  id v26 = v11;
  id v27 = v12;
  id v28 = v14;
  id v29 = v13;
  id v30 = v17;
  id v18 = v17;
  id v19 = v13;
  id v20 = v14;
  id v21 = v12;
  id v22 = v11;
  [v16 enumerateObjectsUsingBlock:v25];

  long long v23 = (void *)[v18 copy];

  return v23;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)tokenTitle
{
  return self->_tokenTitle;
}

- (void)setTokenTitle:(id)a3
{
}

- (int64_t)scopeType
{
  return self->_scopeType;
}

- (void)setScopeType:(int64_t)a3
{
  self->_scopeType = a3;
}

- (NSMutableSet)queryTemplates
{
  return self->_queryTemplates;
}

- (void)setQueryTemplates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryTemplates, 0);
  objc_storeStrong((id *)&self->_tokenTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end