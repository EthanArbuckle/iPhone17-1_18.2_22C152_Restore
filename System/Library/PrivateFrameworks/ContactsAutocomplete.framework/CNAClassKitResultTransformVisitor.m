@interface CNAClassKitResultTransformVisitor
+ (id)addressForPerson:(id)a3 searchType:(unint64_t)a4;
- (CLSDataStore)dataStore;
- (CNAClassKitResultTransformVisitor)initWithFactory:(id)a3 dataStore:(id)a4 searchType:(unint64_t)a5 addressableGroupResultStyle:(int64_t)a6;
- (CNAutocompleteResultFactory)factory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reduceCollection:(id)a3;
- (int64_t)groupResultStyle;
- (unint64_t)searchType;
- (void)visitAddressableGroup:(id)a3;
- (void)visitClass:(id)a3;
- (void)visitExpandableGroup:(id)a3;
- (void)visitGroup:(id)a3;
- (void)visitPerson:(id)a3;
@end

@implementation CNAClassKitResultTransformVisitor

- (CNAClassKitResultTransformVisitor)initWithFactory:(id)a3 dataStore:(id)a4 searchType:(unint64_t)a5 addressableGroupResultStyle:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CNAClassKitResultTransformVisitor;
  v13 = [(CNAClassKitResultTransformVisitor *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_factory, a3);
    objc_storeStrong((id *)&v14->_dataStore, a4);
    v14->_searchType = a5;
    v14->_groupResultStyle = a6;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v14->_results;
    v14->_results = v15;

    v17 = v14;
  }

  return v14;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F5A3A8]) initWithObject:self];
  id v4 = (id)[v3 appendName:@"factory" object:self->_factory];
  id v5 = (id)[v3 appendName:@"dataStore" object:self->_dataStore];
  v6 = [v3 build];

  return v6;
}

- (id)reduceCollection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) acceptVisitor:self];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  v9 = (void *)[(NSMutableArray *)self->_results copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  factory = self->_factory;
  dataStore = self->_dataStore;
  unint64_t searchType = self->_searchType;
  int64_t groupResultStyle = self->_groupResultStyle;
  return (id)[v4 initWithFactory:factory dataStore:dataStore searchType:searchType addressableGroupResultStyle:groupResultStyle];
}

- (void)visitPerson:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 nameComponents];
  uint64_t v6 = [v5 givenName];
  uint64_t v7 = [v5 familyName];
  v8 = +[CNAutocompleteNameComponents nameComponentsWithFirstName:v6 lastName:v7 nickname:&stru_1F1A2F2D8 nameSuffix:&stru_1F1A2F2D8];

  v9 = [(id)objc_opt_class() addressForPerson:v4 searchType:self->_searchType];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    v10 = +[CNAutocompleteResultValue resultValueWithAddress:v9 addressType:1];
    long long v11 = [v4 appleID];

    if (v11)
    {
      uint64_t v16 = @"ckShareIdentifier";
      long long v12 = [v4 appleID];
      v17[0] = v12;
      long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    factory = self->_factory;
    long long v14 = [v4 displayName];
    v15 = [(CNAutocompleteResultFactory *)factory MAIDResultWithDisplayName:v14 value:v10 nameComponents:v8 userInfo:v11];

    [(NSMutableArray *)self->_results _cn_addNonNilObject:v15];
  }
}

+ (id)addressForPerson:(id)a3 searchType:(unint64_t)a4
{
  if (a4) {
    [a3 appleID];
  }
  else {
  id v4 = [a3 emailAddress];
  }
  return v4;
}

- (void)visitClass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 groupIdentifier];
  uint64_t v6 = (void *)[(CNAClassKitResultTransformVisitor *)self copy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CNAClassKitResultTransformVisitor_visitClass___block_invoke;
  aBlock[3] = &unk_1E63DE0D8;
  aBlock[4] = self;
  id v14 = v5;
  id v15 = v6;
  id v7 = v6;
  id v8 = v5;
  v9 = _Block_copy(aBlock);
  factory = self->_factory;
  long long v11 = [v4 displayName];

  long long v12 = [(CNAutocompleteResultFactory *)factory MAIDGroupResultWithDisplayName:v11 groupIdentifier:v8 membersProvider:v9];

  [(NSMutableArray *)self->_results _cn_addNonNilObject:v12];
}

id __48__CNAClassKitResultTransformVisitor_visitClass___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) dataStore];
  uint64_t v5 = objc_msgSend(v4, "_cna_membersOfGroupWithIdentifier:", *(void *)(a1 + 40));
  if ([v5 isSuccess])
  {
    uint64_t v6 = *(void **)(a1 + 48);
    id v7 = [v5 value];
    id v8 = [v6 reduceCollection:v7];
  }
  else
  {
    v9 = [v5 error];
    id v7 = v9;
    if (a2)
    {
      id v7 = v9;
      id v8 = 0;
      *a2 = v7;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)visitGroup:(id)a3
{
  if (self->_groupResultStyle) {
    [(CNAClassKitResultTransformVisitor *)self visitAddressableGroup:a3];
  }
  else {
    [(CNAClassKitResultTransformVisitor *)self visitExpandableGroup:a3];
  }
}

- (void)visitExpandableGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 groupIdentifier];
  uint64_t v6 = (void *)[(CNAClassKitResultTransformVisitor *)self copy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CNAClassKitResultTransformVisitor_visitExpandableGroup___block_invoke;
  aBlock[3] = &unk_1E63DE0D8;
  aBlock[4] = self;
  id v14 = v5;
  id v15 = v6;
  id v7 = v6;
  id v8 = v5;
  v9 = _Block_copy(aBlock);
  factory = self->_factory;
  long long v11 = [v4 groupName];

  long long v12 = [(CNAutocompleteResultFactory *)factory MAIDGroupResultWithDisplayName:v11 groupIdentifier:v8 membersProvider:v9];

  [(NSMutableArray *)self->_results _cn_addNonNilObject:v12];
}

id __58__CNAClassKitResultTransformVisitor_visitExpandableGroup___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) dataStore];
  uint64_t v5 = objc_msgSend(v4, "_cna_membersOfGroupWithIdentifier:", *(void *)(a1 + 40));
  if ([v5 isSuccess])
  {
    uint64_t v6 = *(void **)(a1 + 48);
    id v7 = [v5 value];
    id v8 = [v6 reduceCollection:v7];
  }
  else
  {
    v9 = [v5 error];
    id v7 = v9;
    if (a2)
    {
      id v7 = v9;
      id v8 = 0;
      *a2 = v7;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)visitAddressableGroup:(id)a3
{
  id v9 = a3;
  id v4 = [v9 emailAddress];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v5 = +[CNAutocompleteResultValue resultValueWithAddress:v4 addressType:1];
    factory = self->_factory;
    id v7 = [v9 groupName];
    id v8 = [(CNAutocompleteResultFactory *)factory MAIDResultWithDisplayName:v7 value:v5 nameComponents:0 userInfo:0];

    [(NSMutableArray *)self->_results _cn_addNonNilObject:v8];
  }
}

- (CNAutocompleteResultFactory)factory
{
  return self->_factory;
}

- (CLSDataStore)dataStore
{
  return self->_dataStore;
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (int64_t)groupResultStyle
{
  return self->_groupResultStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end