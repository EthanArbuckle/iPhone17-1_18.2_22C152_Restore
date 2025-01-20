@interface CNAutocompleteResult
+ (BOOL)isSourceTypeConsideredSuggestion:(unint64_t)a3;
+ (CNContactStore)contactStoreForFetchingFullContacts;
+ (NSLocale)localeForHashing;
+ (NSOrderedSet)comparators;
+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5;
+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7;
+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7 userInfo:(id)a8;
+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 identifier:(id)a6;
+ (id)groupResultWithDisplayName:(id)a3 identifier:(id)a4;
+ (id)messagesResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 addressType:(int64_t)a7 identifier:(id)a8 contactProvider:(id)a9 groupMembersProvider:(id)a10 userInfo:(id)a11;
+ (id)messagesResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7 userInfo:(id)a8;
+ (id)resultWithDisplayName:(id)a3;
+ (unint64_t)category;
- (BOOL)hasPreferredDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldUseGroupNamingForResult;
- (BOOL)shouldUseGroupNamingForSource;
- (CNAutocompleteNameComponents)nameComponents;
- (CNAutocompleteResult)init;
- (CNAutocompleteResultValue)value;
- (NSArray)diagnosticLogs;
- (NSArray)userInfos;
- (NSDictionary)userInfo;
- (NSNumber)recentsIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)lastSendingAddress;
- (_PSSuggestion)psSuggestion;
- (id)address;
- (id)contactProvider;
- (id)contactWithKeysToFetch:(id)a3 error:(id *)a4;
- (id)description;
- (id)diagnosticLog;
- (id)expandMembers;
- (id)ignoreResultBlock;
- (id)members:(id *)a3;
- (id)membersProvider;
- (id)resultTypeDescription;
- (id)sourceTypeDescription;
- (id)stringForHashing;
- (int64_t)addressType;
- (int64_t)compare:(id)a3;
- (int64_t)compare:(id)a3 withPriorityComparator:(id)a4;
- (int64_t)resultType;
- (unint64_t)hash;
- (unint64_t)sourceType;
- (void)addDiagnosticLog:(id)a3;
- (void)addDiagnosticLogFuture:(id)a3;
- (void)expandMembers;
- (void)setContactProvider:(id)a3;
- (void)setDiagnosticLogs:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasPreferredDomain:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreResultBlock:(id)a3;
- (void)setLastSendingAddress:(id)a3;
- (void)setMembersProvider:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)setPsSuggestion:(id)a3;
- (void)setRecentsIdentifier:(id)a3;
- (void)setResultType:(int64_t)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setValue:(id)a3;
- (void)updateUsingInformationFromRelatedResult:(id)a3;
@end

@implementation CNAutocompleteResult

- (int64_t)compare:(id)a3 withPriorityComparator:(id)a4
{
  id v6 = a3;
  int64_t v7 = (*((uint64_t (**)(id, CNAutocompleteResult *, id))a4 + 2))(a4, self, v6);
  if (!v7) {
    int64_t v7 = [(CNAutocompleteResult *)self compare:v6];
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [(id)objc_opt_class() comparators];
  v5 = (void *)[v4 mutableCopy];

  id v6 = [(id)objc_opt_class() comparators];
  [v5 intersectOrderedSet:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v11));
        if (v12)
        {
          uint64_t v13 = v12;
          v14 = CNALoggingContextSorting();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            -[CNAutocompleteResult(Sorting) compare:](v13, v14);
          }

          goto LABEL_13;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_13:

  return v13;
}

+ (id)resultWithDisplayName:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = objc_alloc_init((Class)a1);
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &stru_1F1A2F2D8;
  }
  uint64_t v7 = [(__CFString *)v6 copy];

  uint64_t v8 = (void *)v5[1];
  v5[1] = v7;

  return v5;
}

+ (NSLocale)localeForHashing
{
  return (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
}

- (CNAutocompleteResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)CNAutocompleteResult;
  v2 = [(CNAutocompleteResult *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    diagnosticLogs = v2->_diagnosticLogs;
    v2->_diagnosticLogs = (NSArray *)MEMORY[0x1E4F1CBF0];

    displayName = v3->_displayName;
    v3->_displayName = (NSString *)&stru_1F1A2F2D8;

    id v6 = v3;
  }

  return v3;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSString *)v2->_descriptionMemo copy];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v4 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:v2];
    v5 = [(CNAutocompleteResult *)v2 identifier];
    id v6 = (id)[v4 appendName:@"identifier" object:v5];

    uint64_t v7 = [(CNAutocompleteResult *)v2 displayName];
    id v8 = (id)[v4 appendName:@"name" object:v7];

    uint64_t v9 = [(CNAutocompleteResult *)v2 value];
    uint64_t v10 = [v9 address];
    id v11 = (id)[v4 appendName:@"address" object:v10];

    uint64_t v12 = [(CNAutocompleteResult *)v2 resultTypeDescription];
    id v13 = (id)[v4 appendName:@"resultType" object:v12];

    v14 = [(CNAutocompleteResult *)v2 sourceTypeDescription];
    id v15 = (id)[v4 appendName:@"sourceType" object:v14];

    long long v16 = [(CNAutocompleteResult *)v2 lastSendingAddress];
    id v17 = (id)[v4 appendName:@"lastSendingAddress" object:v16];

    long long v18 = [(CNAutocompleteResult *)v2 stringForHashing];
    id v19 = (id)[v4 appendName:@"stringForHashing" object:v18];

    v20 = (void (**)(uint64_t, void *))CNAutocompleteResultUserInfoDescriptionTransform;
    uint64_t v21 = [(CNAutocompleteResult *)v2 userInfo];
    v22 = v20[2]((uint64_t)v20, v21);
    id v23 = (id)[v4 appendName:@"userInfo" object:v22];

    v24 = [(CNAutocompleteResult *)v2 value];
    v25 = [v24 description];
    id v26 = (id)[v4 appendName:@"resultValue" object:v25];

    v27 = [v4 build];

    uint64_t v28 = [v27 copy];
    descriptionMemo = v2->_descriptionMemo;
    v2->_descriptionMemo = (NSString *)v28;

    id v30 = v27;
  }
  else
  {
    id v30 = v3;
  }

  objc_sync_exit(v2);
  return v30;
}

- (id)resultTypeDescription
{
  int64_t v2 = [(CNAutocompleteResult *)self resultType];
  if ((unint64_t)(v2 - 1) > 2) {
    return @"contact";
  }
  else {
    return off_1E63DEB48[v2 - 1];
  }
}

- (id)sourceTypeDescription
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNAutocompleteResult *)self sourceType]) {
    [v3 addObject:@"recent"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 2) != 0) {
    [v3 addObject:@"contact"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 4) != 0) {
    [v3 addObject:@"pseudo"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 0x80) != 0) {
    [v3 addObject:@"maid"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 0x100) != 0) {
    [v3 addObject:@"extension"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 8) != 0) {
    [v3 addObject:@"directory server"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 0x10) != 0) {
    [v3 addObject:@"duet"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 0x20) != 0) {
    [v3 addObject:@"supplemental"];
  }
  if (([(CNAutocompleteResult *)self sourceType] & 0x200) != 0) {
    [v3 addObject:@"stewie"];
  }
  if (![v3 count]) {
    [v3 addObject:@"unknown"];
  }
  v4 = [v3 componentsJoinedByString:@", "];
  v5 = [NSString stringWithFormat:@"0x%x (%@)", -[CNAutocompleteResult sourceType](self, "sourceType"), v4];

  return v5;
}

- (unint64_t)hash
{
  int64_t v2 = [(CNAutocompleteResult *)self stringForHashing];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(CNAutocompleteResult *)self stringForHashing];
    uint64_t v9 = [v7 stringForHashing];
    if ([v8 isEqual:v9])
    {
      uint64_t v10 = [(CNAutocompleteResult *)self userInfo];
      if (v10
        && (id v11 = (void *)v10,
            [v7 userInfo],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v12))
      {
        id v13 = [(CNAutocompleteResult *)self userInfo];
        v14 = [v7 userInfo];
        char v15 = [v13 isEqual:v14];
      }
      else
      {
        char v15 = 1;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)stringForHashing
{
  unint64_t v3 = [(CNAutocompleteResult *)self value];
  id v4 = [v3 stringForHashing];

  uint64_t v5 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v4))
  {

    id v4 = [(CNAutocompleteResult *)self identifier];
    if ((*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v4))
    {

      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
    }
  }
  return v4;
}

+ (unint64_t)category
{
  return 4;
}

+ (NSOrderedSet)comparators
{
  if (comparators_cn_once_token_0 != -1) {
    dispatch_once(&comparators_cn_once_token_0, &__block_literal_global_29);
  }
  int64_t v2 = (void *)comparators_cn_once_object_0;
  return (NSOrderedSet *)v2;
}

void __35__CNAutocompleteResult_comparators__block_invoke()
{
  v8[4] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v1 = _Block_copy(sSortResultsByCategory);
  v8[0] = v1;
  int64_t v2 = _Block_copy(sSortResultsByPreferredDomain);
  v8[1] = v2;
  unint64_t v3 = _Block_copy(sSortResultsByDisplayName);
  v8[2] = v3;
  id v4 = _Block_copy(sSortResultsByAddress);
  v8[3] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v0 initWithArray:v5];
  id v7 = (void *)comparators_cn_once_object_0;
  comparators_cn_once_object_0 = v6;
}

- (void)updateUsingInformationFromRelatedResult:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  -[CNAutocompleteResult setSourceType:](self, "setSourceType:", [v5 sourceType] | -[CNAutocompleteResult sourceType](self, "sourceType"));
  char v6 = [v5 sourceType];
  id v7 = (uint64_t *)MEMORY[0x1E4F5A298];
  if ((v6 & 2) != 0
    && ([(CNAutocompleteResult *)self identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    long long v18 = CNALoggingContextDebug();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v48 = 138412546;
      v49 = self;
      __int16 v50 = 2112;
      id v51 = v5;
      _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_DEFAULT, "Result: %@ is absorbing everything from: %@", (uint8_t *)&v48, 0x16u);
    }

    id v19 = [v5 identifier];
    [(CNAutocompleteResult *)self setIdentifier:v19];

    v20 = [v5 value];
    [(CNAutocompleteResult *)self setValue:v20];

    uint64_t v21 = [v5 displayName];
    [(CNAutocompleteResult *)self setDisplayName:v21];

    v22 = [v5 nameComponents];
    [(CNAutocompleteResult *)self setNameComponents:v22];

    id v23 = [v5 contactProvider];
    [(CNAutocompleteResult *)self setContactProvider:v23];

    v24 = [(CNAutocompleteResult *)self membersProvider];

    if (!v24)
    {
      v25 = [v5 membersProvider];
      [(CNAutocompleteResult *)self setMembersProvider:v25];
LABEL_29:
    }
  }
  else
  {
    uint64_t v9 = [(CNAutocompleteResult *)self contactProvider];
    if (v9)
    {

      goto LABEL_30;
    }
    uint64_t v10 = [v5 contactProvider];
    if (v10)
    {
      id v11 = (void *)v10;
      uint64_t v12 = [(CNAutocompleteResult *)self identifier];
      if (v12)
      {
        id v13 = (void *)v12;
        v14 = [(CNAutocompleteResult *)self identifier];
        if (v14 || ([v5 identifier], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          char v15 = [(CNAutocompleteResult *)self identifier];
          long long v16 = [v5 identifier];
          char v17 = [v15 isEqual:v16];

          if (v14) {
          else
          }

          if ((v17 & 1) == 0) {
            goto LABEL_30;
          }
          goto LABEL_20;
        }
      }
LABEL_20:
      id v26 = CNALoggingContextDebug();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v48 = 138412546;
        v49 = self;
        __int16 v50 = 2112;
        id v51 = v5;
        _os_log_impl(&dword_1BEF57000, v26, OS_LOG_TYPE_DEFAULT, "Result: %@ is absorbing contact provider and identifier from: %@", (uint8_t *)&v48, 0x16u);
      }

      v27 = [v5 contactProvider];
      [(CNAutocompleteResult *)self setContactProvider:v27];

      uint64_t v28 = [v5 identifier];
      [(CNAutocompleteResult *)self setIdentifier:v28];

      uint64_t v29 = *v7;
      v25 = [(CNAutocompleteResult *)self displayName];
      if ((*(uint64_t (**)(uint64_t, void *))(v29 + 16))(v29, v25))
      {
        id v30 = [(CNAutocompleteResult *)self nameComponents];
        if (v30)
        {
        }
        else
        {
          v31 = [v5 displayName];
          char v32 = (*(uint64_t (**)(uint64_t, void *))(v29 + 16))(v29, v31);

          if (v32) {
            goto LABEL_30;
          }
          v33 = CNALoggingContextDebug();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            int v48 = 138412546;
            v49 = self;
            __int16 v50 = 2112;
            id v51 = v5;
            _os_log_impl(&dword_1BEF57000, v33, OS_LOG_TYPE_DEFAULT, "Result: %@ is also taking the display name and name components from: %@", (uint8_t *)&v48, 0x16u);
          }

          v34 = [v5 displayName];
          [(CNAutocompleteResult *)self setDisplayName:v34];

          v25 = [v5 nameComponents];
          [(CNAutocompleteResult *)self setNameComponents:v25];
        }
      }
      goto LABEL_29;
    }
  }
LABEL_30:
  v35 = [v5 userInfo];

  if (v35)
  {
    v36 = [(CNAutocompleteResult *)self userInfo];

    if (v36)
    {
      v37 = CNALoggingContextDebug();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [(CNAutocompleteResult *)self userInfo];
        v39 = [v5 userInfo];
        int v48 = 138412546;
        v49 = v38;
        __int16 v50 = 2112;
        id v51 = v39;
        _os_log_impl(&dword_1BEF57000, v37, OS_LOG_TYPE_DEFAULT, "Serious bug: I don't expect dupes with userInfos, dropping %@, keeping only %@", (uint8_t *)&v48, 0x16u);
      }
    }
    v40 = [v5 userInfo];
    [(CNAutocompleteResult *)self setUserInfo:v40];
  }
  uint64_t v41 = *v7;
  v42 = [v5 lastSendingAddress];
  if ((*(uint64_t (**)(uint64_t, void *))(v41 + 16))(v41, v42)) {
    goto LABEL_39;
  }
  v43 = [(CNAutocompleteResult *)self lastSendingAddress];
  int v44 = (*(uint64_t (**)(uint64_t, void *))(v41 + 16))(v41, v43);

  if (v44)
  {
    v42 = [v5 lastSendingAddress];
    [(CNAutocompleteResult *)self setLastSendingAddress:v42];
LABEL_39:
  }
  if (([v5 sourceType] & 8) != 0)
  {
    uint64_t v45 = *MEMORY[0x1E4F5A2A0];
    v46 = [v5 displayName];
    LODWORD(v45) = (*(uint64_t (**)(uint64_t, void *))(v45 + 16))(v45, v46);

    if (v45)
    {
      v47 = [v5 displayName];
      [(CNAutocompleteResult *)self setDisplayName:v47];
    }
  }
}

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 identifier:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  uint64_t v15 = [v13 copy];

  long long v16 = (void *)v14[1];
  v14[1] = v15;

  char v17 = (void *)v14[6];
  v14[6] = v10;
  id v18 = v10;

  uint64_t v19 = [v12 copy];
  v20 = (void *)v14[4];
  v14[4] = v19;

  uint64_t v21 = [v11 copy];
  v22 = (void *)v14[5];
  v14[5] = v21;

  v14[14] = 0;
  return v14;
}

+ (id)groupResultWithDisplayName:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = [a1 resultWithDisplayName:a3];
  uint64_t v8 = [v6 copy];

  uint64_t v9 = (void *)v7[5];
  v7[5] = v8;

  v7[14] = 1;
  return v7;
}

- (BOOL)shouldUseGroupNamingForSource
{
  unint64_t v3 = [(CNAutocompleteResult *)self sourceType];
  if (v3 != 1) {
    LOBYTE(v3) = [(CNAutocompleteResult *)self sourceType] == 16;
  }
  return v3;
}

- (BOOL)shouldUseGroupNamingForResult
{
  if ([(CNAutocompleteResult *)self resultType] != 1) {
    return 0;
  }
  return [(CNAutocompleteResult *)self shouldUseGroupNamingForSource];
}

- (id)members:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CNAutocompleteResult *)self expandMembers];
  id v5 = [v4 first];

  if (v5)
  {
    id v6 = [v4 first];
  }
  else
  {
    id v7 = [v4 second];

    if (v7)
    {
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      uint64_t v8 = [v4 second];
      v13[0] = v8;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactAutocompleteErrorDomain" code:3 userInfo:v7];
    id v10 = v9;
    if (a3) {
      *a3 = v9;
    }

    id v6 = 0;
  }

  return v6;
}

- (id)expandMembers
{
  unint64_t v3 = [(CNAutocompleteResult *)self membersProvider];

  if (!v3)
  {
    char v17 = [MEMORY[0x1E4F5A490] pairWithFirst:MEMORY[0x1E4F1CBF0] second:0];
    goto LABEL_13;
  }
  id v4 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v4 timestamp];
  double v6 = v5;

  id v7 = [(CNAutocompleteResult *)self membersProvider];
  id v21 = 0;
  uint64_t v8 = ((void (**)(void, id *))v7)[2](v7, &v21);
  unint64_t v9 = (unint64_t)v21;

  id v10 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v10 timestamp];
  double v12 = v11;

  id v13 = CNALoggingContextDebug();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    [(CNAutocompleteResult *)v13 expandMembers];
  }

  if ((v8 != 0) != (v9 != 0)) {
    goto LABEL_5;
  }
  if (!(v8 | v9))
  {
    id v18 = CNALoggingContextTriage();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      [(CNAutocompleteResult *)(uint64_t)self expandMembers];
    }

    v14 = (void *)MEMORY[0x1E4F5A490];
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    goto LABEL_12;
  }
  if (v8 && v9)
  {
    v20 = CNALoggingContextTriage();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      [(CNAutocompleteResult *)(uint64_t)self expandMembers];
    }

    v14 = (void *)MEMORY[0x1E4F5A490];
    uint64_t v15 = 0;
  }
  else
  {
LABEL_5:
    v14 = (void *)MEMORY[0x1E4F5A490];
    uint64_t v15 = v8;
  }
  unint64_t v16 = v9;
LABEL_12:
  char v17 = [v14 pairWithFirst:v15 second:v16];

LABEL_13:
  return v17;
}

+ (CNContactStore)contactStoreForFetchingFullContacts
{
  if (contactStoreForFetchingFullContacts_cn_once_token_8 != -1) {
    dispatch_once(&contactStoreForFetchingFullContacts_cn_once_token_8, &__block_literal_global_89);
  }
  int64_t v2 = (void *)contactStoreForFetchingFullContacts_cn_once_object_8;
  return (CNContactStore *)v2;
}

uint64_t __59__CNAutocompleteResult_contactStoreForFetchingFullContacts__block_invoke()
{
  contactStoreForFetchingFullContacts_cn_once_object_8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1B980]);
  return MEMORY[0x1F41817F8]();
}

- (id)contactWithKeysToFetch:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CNAutocompleteResult *)self contactProvider];

  if (v7)
  {
    uint64_t v8 = CNALoggingContextDebug();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Using contact provider to retrieve the contact", buf, 2u);
    }

    uint64_t v9 = [(CNAutocompleteResult *)self contactProvider];
    id v10 = (*(void (**)(uint64_t, id, id *))(v9 + 16))(v9, v6, a4);
    goto LABEL_9;
  }
  if ([(CNAutocompleteResult *)self resultType]) {
    goto LABEL_6;
  }
  double v12 = [(CNAutocompleteResult *)self value];
  uint64_t v13 = [v12 addressType];

  if (v13 == 2)
  {
    id v21 = (void *)MEMORY[0x1E4F1B8F8];
    v22 = (void *)MEMORY[0x1E4F1BA70];
    id v23 = [(CNAutocompleteResult *)self value];
    v24 = [v23 address];
    v25 = [v22 phoneNumberWithStringValue:v24];
    uint64_t v9 = [v21 predicateForContactsMatchingPhoneNumber:v25];

    char v17 = CNALoggingContextDebug();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v18 = [(CNAutocompleteResult *)self value];
    uint64_t v19 = [v18 address];
    *(_DWORD *)buf = 138412290;
    char v32 = v19;
    v20 = "Let's do a matching based on phone number: %@";
    goto LABEL_18;
  }
  if (v13 != 1)
  {
LABEL_6:
    uint64_t v9 = CNALoggingContextDebug();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v32 = self;
      _os_log_impl(&dword_1BEF57000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "I don't know how to return a contact for %@", buf, 0xCu);
    }
    id v10 = 0;
    goto LABEL_9;
  }
  v14 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v15 = [(CNAutocompleteResult *)self value];
  unint64_t v16 = [v15 address];
  uint64_t v9 = [v14 predicateForContactsMatchingEmailAddress:v16];

  char v17 = CNALoggingContextDebug();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [(CNAutocompleteResult *)self value];
    uint64_t v19 = [v18 address];
    *(_DWORD *)buf = 138412290;
    char v32 = v19;
    v20 = "Let's do a matching based on email address: %@";
LABEL_18:
    _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
  }
LABEL_19:

  if (!v9) {
    goto LABEL_6;
  }
  id v26 = [(id)objc_opt_class() contactStoreForFetchingFullContacts];
  id v30 = 0;
  v27 = [v26 unifiedContactsMatchingPredicate:v9 keysToFetch:v6 error:&v30];
  id v28 = v30;
  uint64_t v29 = CNALoggingContextDebug();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    char v32 = v27;
    __int16 v33 = 2112;
    id v34 = v28;
    _os_log_impl(&dword_1BEF57000, v29, OS_LOG_TYPE_DEFAULT, "We received (and returning the first one): %@, error:%@", buf, 0x16u);
  }

  if (v27)
  {
    id v10 = [(CNAutocompleteResult *)v27 firstObject];
  }
  else
  {
    id v10 = 0;
    if (a4) {
      *a4 = v28;
    }
  }

LABEL_9:
  return v10;
}

- (void)addDiagnosticLog:(id)a3
{
  id v4 = [MEMORY[0x1E4F5A408] lazyFutureWithBlock:a3];
  [(CNAutocompleteResult *)self addDiagnosticLogFuture:v4];
}

- (void)addDiagnosticLogFuture:(id)a3
{
  id v4 = a3;
  id v6 = [(CNAutocompleteResult *)self diagnosticLogs];
  double v5 = [v6 arrayByAddingObject:v4];

  [(CNAutocompleteResult *)self setDiagnosticLogs:v5];
}

- (id)diagnosticLog
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"Result: %@\n", self];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CNAutocompleteResult *)self diagnosticLogs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v14 = 0;
        id v10 = [v9 result:&v14];
        id v11 = v14;
        double v12 = v11;
        if (v10) {
          [v3 appendFormat:@"%@\n", v10];
        }
        else {
          [v3 appendFormat:@"Error expanding log: %@\n", v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)isSourceTypeConsideredSuggestion:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFEFLL) == 4;
}

- (BOOL)hasPreferredDomain
{
  return self->_hasPreferredDomain;
}

- (void)setHasPreferredDomain:(BOOL)a3
{
  self->_hasPreferredDomain = a3;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (CNAutocompleteResultValue)value
{
  return (CNAutocompleteResultValue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setValue:(id)a3
{
}

- (CNAutocompleteNameComponents)nameComponents
{
  return (CNAutocompleteNameComponents *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNameComponents:(id)a3
{
}

- (id)membersProvider
{
  return self->_membersProvider;
}

- (void)setMembersProvider:(id)a3
{
}

- (id)contactProvider
{
  return self->_contactProvider;
}

- (void)setContactProvider:(id)a3
{
}

- (NSArray)diagnosticLogs
{
  return self->_diagnosticLogs;
}

- (void)setDiagnosticLogs:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (id)ignoreResultBlock
{
  return self->_ignoreResultBlock;
}

- (void)setIgnoreResultBlock:(id)a3
{
}

- (NSString)lastSendingAddress
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastSendingAddress:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (_PSSuggestion)psSuggestion
{
  return (_PSSuggestion *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPsSuggestion:(id)a3
{
}

- (NSNumber)recentsIdentifier
{
  return self->_recentsIdentifier;
}

- (void)setRecentsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsIdentifier, 0);
  objc_storeStrong((id *)&self->_psSuggestion, 0);
  objc_storeStrong(&self->_ignoreResultBlock, 0);
  objc_storeStrong((id *)&self->_diagnosticLogs, 0);
  objc_storeStrong(&self->_contactProvider, 0);
  objc_storeStrong(&self->_membersProvider, 0);
  objc_storeStrong((id *)&self->_descriptionMemo, 0);
  objc_storeStrong((id *)&self->_lastSendingAddress, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7 userInfo:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  long long v18 = objc_alloc_init(CNAutocompleteResultValue);
  [(CNAutocompleteResultValue *)v18 setAddress:v17];

  [(CNAutocompleteResultValue *)v18 setAddressType:1];
  uint64_t v19 = +[CNAutocompleteResult resultWithDisplayName:v16];

  [v19 setResultType:a6];
  [v19 setMembersProvider:v14];

  [v19 setValue:v18];
  [v19 setNameComponents:v15];

  [v19 setSourceType:32];
  if (v13) {
    [v19 setUserInfo:v13];
  }

  return v19;
}

+ (id)messagesResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 addressType:(int64_t)a7 identifier:(id)a8 contactProvider:(id)a9 groupMembersProvider:(id)a10 userInfo:(id)a11
{
  id v16 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = objc_alloc_init(CNAutocompleteResultValue);
  [(CNAutocompleteResultValue *)v23 setAddress:v22];

  [(CNAutocompleteResultValue *)v23 setAddressType:a7];
  v24 = objc_alloc_init(CNAutocompleteResult);
  [(CNAutocompleteResult *)v24 setIdentifier:v19];

  [(CNAutocompleteResult *)v24 setContactProvider:v18];
  [(CNAutocompleteResult *)v24 setDisplayName:v21];

  [(CNAutocompleteResult *)v24 setResultType:a6];
  [(CNAutocompleteResult *)v24 setMembersProvider:v17];

  [(CNAutocompleteResult *)v24 setValue:v23];
  [(CNAutocompleteResult *)v24 setNameComponents:v20];

  [(CNAutocompleteResult *)v24 setSourceType:32];
  if (v16) {
    [(CNAutocompleteResult *)v24 setUserInfo:v16];
  }

  return v24;
}

- (id)address
{
  unint64_t v3 = [(CNAutocompleteResult *)self value];
  if ([v3 addressType] == 3)
  {
    id v4 = [(CNAutocompleteResult *)self value];
    uint64_t v5 = [v4 instantMessageAddressService];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1BA18]);
      uint64_t v7 = [(CNAutocompleteResult *)self value];
      uint64_t v8 = [v7 address];
      uint64_t v9 = [(CNAutocompleteResult *)self value];
      id v10 = [v9 instantMessageAddressService];
      id v11 = (void *)[v6 initWithUsername:v8 service:v10];

      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v7 = [(CNAutocompleteResult *)self value];
  id v11 = [v7 address];
LABEL_6:

  return v11;
}

- (int64_t)addressType
{
  int64_t v2 = [(CNAutocompleteResult *)self value];
  int64_t v3 = [v2 addressType];

  return v3;
}

- (NSArray)userInfos
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CNAutocompleteResult *)self userInfo];

  if (v3)
  {
    id v4 = [(CNAutocompleteResult *)self userInfo];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSArray *)v5;
}

+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5
{
  return (id)[a1 calDAVResultWithAddress:a3 displayName:a4 nameComponents:a5 resultType:0 groupMembersProvider:0 userInfo:0];
}

+ (id)calDAVResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7
{
  return (id)[a1 calDAVResultWithAddress:a3 displayName:a4 nameComponents:a5 resultType:a6 groupMembersProvider:a7 userInfo:0];
}

+ (id)messagesResultWithAddress:(id)a3 displayName:(id)a4 nameComponents:(id)a5 resultType:(int64_t)a6 groupMembersProvider:(id)a7 userInfo:(id)a8
{
  return (id)[a1 messagesResultWithAddress:a3 displayName:a4 nameComponents:a5 resultType:a6 addressType:1 identifier:0 contactProvider:0 groupMembersProvider:0 userInfo:a8];
}

- (void)expandMembers
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F5A530] stringForTimeInterval:a2 - a3];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_1BEF57000, a1, OS_LOG_TYPE_DEBUG, "Time to expand members: %@", (uint8_t *)&v5, 0xCu);
}

@end