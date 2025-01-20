@interface CNAutocompleteFetchRequest
+ (BOOL)supportsSecureCoding;
+ (id)makeTriageIdentifier;
+ (id)request;
+ (id)searchablePropertiesForSearchType:(unint64_t)a3;
- (BOOL)includeCalendarServers;
- (BOOL)includeContacts;
- (BOOL)includeDirectoryServers;
- (BOOL)includeLocalExtensions;
- (BOOL)includePredictions;
- (BOOL)includeRecents;
- (BOOL)includeStewie;
- (BOOL)includeSuggestions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid:(id *)a3;
- (BOOL)isZeroKeywordSearch;
- (BOOL)shouldIncludeGroupResults;
- (CNAutocompleteFetchContext)fetchContext;
- (CNAutocompleteFetchRequest)init;
- (CNAutocompleteFetchRequest)initWithCoder:(id)a3;
- (NSArray)searchNames;
- (NSArray)searchableProperties;
- (NSString)priorityDomainForSorting;
- (NSString)searchString;
- (NSString)sendingAddress;
- (NSString)triageIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)executeWithDelegate:(id)a3;
- (id)includeDebugString;
- (id)searchTypeDebugString;
- (id)shouldIncludeGroupResultsDebugString;
- (int64_t)addressableGroupResultStyle;
- (unint64_t)hash;
- (unint64_t)maximumResultsCount;
- (unint64_t)searchType;
- (void)encodeWithCoder:(id)a3;
- (void)setAddressableGroupResultStyle:(int64_t)a3;
- (void)setFetchContext:(id)a3;
- (void)setIncludeCalendarServers:(BOOL)a3;
- (void)setIncludeContacts:(BOOL)a3;
- (void)setIncludeDirectoryServers:(BOOL)a3;
- (void)setIncludeLocalExtensions:(BOOL)a3;
- (void)setIncludePredictions:(BOOL)a3;
- (void)setIncludeRecents:(BOOL)a3;
- (void)setIncludeStewie:(BOOL)a3;
- (void)setIncludeSuggestions:(BOOL)a3;
- (void)setMaximumResultsCount:(unint64_t)a3;
- (void)setPriorityDomainForSorting:(id)a3;
- (void)setSearchNames:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchType:(unint64_t)a3;
- (void)setSendingAddress:(id)a3;
- (void)setShouldIncludeGroupResults:(BOOL)a3;
@end

@implementation CNAutocompleteFetchRequest

+ (id)request
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (CNAutocompleteFetchRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)CNAutocompleteFetchRequest;
  id v2 = [(CNAutocompleteFetchRequest *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CNAutocompleteFetchRequest *)v2 setIncludeContacts:1];
    [(CNAutocompleteFetchRequest *)v3 setIncludeRecents:1];
    [(CNAutocompleteFetchRequest *)v3 setIncludeStewie:0];
    [(CNAutocompleteFetchRequest *)v3 setIncludeSuggestions:1];
    [(CNAutocompleteFetchRequest *)v3 setIncludeLocalExtensions:1];
    [(CNAutocompleteFetchRequest *)v3 setIncludeDirectoryServers:1];
    [(CNAutocompleteFetchRequest *)v3 setIncludeCalendarServers:1];
    [(CNAutocompleteFetchRequest *)v3 setIncludePredictions:1];
    [(CNAutocompleteFetchRequest *)v3 setAddressableGroupResultStyle:0];
    [(CNAutocompleteFetchRequest *)v3 setSearchNames:MEMORY[0x1E4F1CBF0]];
    [(CNAutocompleteFetchRequest *)v3 setMaximumResultsCount:-1];
    uint64_t v4 = [(id)objc_opt_class() makeTriageIdentifier];
    triageIdentifier = v3->_triageIdentifier;
    v3->_triageIdentifier = (NSString *)v4;

    v6 = v3;
  }

  return v3;
}

+ (id)makeTriageIdentifier
{
  if (makeTriageIdentifier_cn_once_token_0 != -1) {
    dispatch_once(&makeTriageIdentifier_cn_once_token_0, &__block_literal_global_5);
  }
  uint64_t v2 = [(id)makeTriageIdentifier_cn_once_object_0 nextUnsignedInteger];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CNA-%04llu", v2);
}

uint64_t __50__CNAutocompleteFetchRequest_makeTriageIdentifier__block_invoke()
{
  makeTriageIdentifier_cn_once_object_0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F5A338]);
  return MEMORY[0x1F41817F8]();
}

- (NSString)searchString
{
  return (NSString *)[(NSArray *)self->_searchNames firstObject];
}

- (void)setSearchString:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (void *)[a3 copy];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(CNAutocompleteFetchRequest *)self setSearchNames:v5];
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [(CNAutocompleteFetchRequest *)self setSearchNames:v6];
  }
}

- (BOOL)isZeroKeywordSearch
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = CNALoggingContextDebug();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(CNAutocompleteFetchRequest *)self searchNames];
    int v8 = 138477827;
    v9 = v4;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "ZKW: %{private}@", (uint8_t *)&v8, 0xCu);
  }
  v5 = [(CNAutocompleteFetchRequest *)self searchNames];
  char v6 = objc_msgSend(v5, "_cn_none:", *MEMORY[0x1E4F5A2A0]);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CNAutocompleteFetchRequest);
  v5 = [(CNAutocompleteFetchRequest *)self searchNames];
  [(CNAutocompleteFetchRequest *)v4 setSearchNames:v5];

  char v6 = [(CNAutocompleteFetchRequest *)self priorityDomainForSorting];
  [(CNAutocompleteFetchRequest *)v4 setPriorityDomainForSorting:v6];

  [(CNAutocompleteFetchRequest *)v4 setSearchType:[(CNAutocompleteFetchRequest *)self searchType]];
  v7 = [(CNAutocompleteFetchRequest *)self fetchContext];
  [(CNAutocompleteFetchRequest *)v4 setFetchContext:v7];

  [(CNAutocompleteFetchRequest *)v4 setIncludeContacts:[(CNAutocompleteFetchRequest *)self includeContacts]];
  [(CNAutocompleteFetchRequest *)v4 setIncludeRecents:[(CNAutocompleteFetchRequest *)self includeRecents]];
  [(CNAutocompleteFetchRequest *)v4 setIncludeStewie:[(CNAutocompleteFetchRequest *)self includeStewie]];
  [(CNAutocompleteFetchRequest *)v4 setIncludeSuggestions:[(CNAutocompleteFetchRequest *)self includeSuggestions]];
  [(CNAutocompleteFetchRequest *)v4 setIncludeLocalExtensions:[(CNAutocompleteFetchRequest *)self includeLocalExtensions]];
  [(CNAutocompleteFetchRequest *)v4 setIncludeDirectoryServers:[(CNAutocompleteFetchRequest *)self includeDirectoryServers]];
  [(CNAutocompleteFetchRequest *)v4 setIncludeCalendarServers:[(CNAutocompleteFetchRequest *)self includeCalendarServers]];
  [(CNAutocompleteFetchRequest *)v4 setIncludePredictions:[(CNAutocompleteFetchRequest *)self includePredictions]];
  [(CNAutocompleteFetchRequest *)v4 setAddressableGroupResultStyle:[(CNAutocompleteFetchRequest *)self addressableGroupResultStyle]];
  objc_storeStrong((id *)&v4->_shouldIncludeGroupResultsImpl, self->_shouldIncludeGroupResultsImpl);
  v4->_maximumResultsCount = self->_maximumResultsCount;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v12) = 1;
    return v12;
  }
  uint64_t v19 = v4;
  uint64_t v20 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !self->_includeContacts == (*((unsigned char *)a3 + 48) != 0)
    || !self->_includeRecents == (*((unsigned char *)a3 + 49) != 0)
    || !self->_includeStewie == (*((unsigned char *)a3 + 50) != 0)
    || !self->_includeLocalExtensions == (*((unsigned char *)a3 + 52) != 0)
    || !self->_includeSuggestions == (*((unsigned char *)a3 + 51) != 0)
    || !self->_includeDirectoryServers == (*((unsigned char *)a3 + 53) != 0)
    || !self->_includeCalendarServers == (*((unsigned char *)a3 + 54) != 0)
    || !self->_includePredictions == (*((unsigned char *)a3 + 55) != 0))
  {
    goto LABEL_21;
  }
  searchNames = self->_searchNames;
  if (!((unint64_t)searchNames | *((void *)a3 + 1))
    || (int v12 = -[NSArray isEqual:](searchNames, "isEqual:")) != 0)
  {
    if (self->_searchType != *((void *)a3 + 3)) {
      goto LABEL_21;
    }
    priorityDomainForSorting = self->_priorityDomainForSorting;
    if (!((unint64_t)priorityDomainForSorting | *((void *)a3 + 2))
      || (int v12 = -[NSString isEqual:](priorityDomainForSorting, "isEqual:")) != 0)
    {
      fetchContext = self->_fetchContext;
      if (!((unint64_t)fetchContext | *((void *)a3 + 4))
        || (int v12 = -[CNAutocompleteFetchContext isEqual:](fetchContext, "isEqual:")) != 0)
      {
        int v15 = [(CNAutocompleteFetchRequest *)self shouldIncludeGroupResults];
        if (v15 == [a3 shouldIncludeGroupResults])
        {
          int64_t v16 = [(CNAutocompleteFetchRequest *)self addressableGroupResultStyle];
          if (v16 == [a3 addressableGroupResultStyle])
          {
            unint64_t v17 = [(CNAutocompleteFetchRequest *)self maximumResultsCount];
            LOBYTE(v12) = v17 == [a3 maximumResultsCount];
            return v12;
          }
        }
LABEL_21:
        LOBYTE(v12) = 0;
      }
    }
  }
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] arrayHash:self->_searchNames];
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_priorityDomainForSorting];
  unint64_t v5 = self->_searchType - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  uint64_t v6 = [MEMORY[0x1E4F5A418] objectHash:self->_fetchContext];
  uint64_t v7 = self->_includeContacts - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  uint64_t v8 = self->_includeRecents - v7 + 32 * v7;
  uint64_t v9 = self->_includeStewie - v8 + 32 * v8;
  uint64_t v10 = self->_includeLocalExtensions - v9 + 32 * v9;
  uint64_t v11 = self->_includeSuggestions - v10 + 32 * v10;
  uint64_t v12 = self->_includeDirectoryServers - v11 + 32 * v11;
  uint64_t v13 = self->_includeCalendarServers - v12 + 32 * v12;
  uint64_t v14 = 31 * (self->_includePredictions - v13 + 32 * v13);
  uint64_t v15 = v14 + [(CNAutocompleteFetchRequest *)self shouldIncludeGroupResults];
  uint64_t v16 = [(CNAutocompleteFetchRequest *)self addressableGroupResultStyle];
  if (v16 >= 0) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = -v16;
  }
  return [(CNAutocompleteFetchRequest *)self maximumResultsCount]
       - (v17
        - v15
        + 32 * v15)
       + 32 * (v17 - v15 + 32 * v15)
       - 0x133EA9F605504431;
}

- (id)executeWithDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = CNALoggingContextDebug();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_1BEF57000, v5, OS_LOG_TYPE_DEFAULT, "Autocompleting “%@”", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v6 = +[CNAutocompleteSearchProviderFactory nonCachingProvider];
  uint64_t v7 = +[CNAutocompleteProbeProviderFactory defaultProbeProvider];
  uint64_t v8 = [CNAutocompleteStore alloc];
  uint64_t v9 = [MEMORY[0x1E4F5A4E8] globalAsyncScheduler];
  uint64_t v10 = [(CNAutocompleteStore *)v8 initWithDelegate:v4 searchProvider:v6 probeProvider:v7 scheduler:v9];

  uint64_t v11 = [(CNAutocompleteStore *)v10 executeFetchRequest:self];

  return v11;
}

- (BOOL)isValid:(id *)a3
{
  unint64_t v5 = [(CNAutocompleteFetchRequest *)self fetchContext];
  if (v5)
  {
    uint64_t v6 = [(CNAutocompleteFetchRequest *)self fetchContext];
    char v7 = [v6 isValid:a3];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

+ (id)searchablePropertiesForSearchType:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3 > 5)
  {
    char v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (((1 << a3) & 0x32) != 0)
    {
      uint64_t v3 = *MEMORY[0x1E4F1AEE0];
      v11[0] = *MEMORY[0x1E4F1ADC8];
      v11[1] = v3;
      v11[2] = *MEMORY[0x1E4F1AE60];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v5 = v11;
      uint64_t v6 = 3;
    }
    else if (((1 << a3) & 9) != 0)
    {
      v12[0] = *MEMORY[0x1E4F1ADC8];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v5 = v12;
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v8 = *MEMORY[0x1E4F1AEE0];
      v10[0] = *MEMORY[0x1E4F1ADC8];
      v10[1] = v8;
      id v4 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v5 = v10;
      uint64_t v6 = 2;
    }
    char v7 = [v4 arrayWithObjects:v5 count:v6];
  }
  return v7;
}

- (NSArray)searchableProperties
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(CNAutocompleteFetchRequest *)self searchType];
  return (NSArray *)[v3 searchablePropertiesForSearchType:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNAutocompleteFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CNAutocompleteFetchRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"searchNames"];
    searchNames = v5->_searchNames;
    v5->_searchNames = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priorityDomainForSorting"];
    priorityDomainForSorting = v5->_priorityDomainForSorting;
    v5->_priorityDomainForSorting = (NSString *)v8;

    v5->_searchType = [v4 decodeIntegerForKey:@"searchType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fetchContext"];
    fetchContext = v5->_fetchContext;
    v5->_fetchContext = (CNAutocompleteFetchContext *)v10;

    v5->_includeContacts = [v4 decodeBoolForKey:@"includeContacts"];
    v5->_includeRecents = [v4 decodeBoolForKey:@"includeRecents"];
    v5->_includeStewie = [v4 decodeBoolForKey:@"includeStewie"];
    v5->_includeSuggestions = [v4 decodeBoolForKey:@"includeSuggestions"];
    v5->_includeLocalExtensions = [v4 decodeBoolForKey:@"includeLocalExtensions"];
    v5->_includeDirectoryServers = [v4 decodeBoolForKey:@"includeDirectoryServers"];
    v5->_includeCalendarServers = [v4 decodeBoolForKey:@"includeCalendarServers"];
    v5->_includePredictions = [v4 decodeBoolForKey:@"includePredictions"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shouldIncludeGroupResultsImpl"];
    shouldIncludeGroupResultsImpl = v5->_shouldIncludeGroupResultsImpl;
    v5->_shouldIncludeGroupResultsImpl = (NSNumber *)v12;

    -[CNAutocompleteFetchRequest setAddressableGroupResultStyle:](v5, "setAddressableGroupResultStyle:", [v4 decodeIntegerForKey:@"addressableGroupResultStyle"]);
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumResultsCount"];
    v5->_maximumResultsCount = [v14 unsignedIntegerValue];

    uint64_t v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  searchNames = self->_searchNames;
  id v5 = a3;
  [v5 encodeObject:searchNames forKey:@"searchNames"];
  [v5 encodeObject:self->_priorityDomainForSorting forKey:@"priorityDomainForSorting"];
  [v5 encodeInteger:self->_searchType forKey:@"searchType"];
  [v5 encodeObject:self->_fetchContext forKey:@"fetchContext"];
  [v5 encodeBool:self->_includeContacts forKey:@"includeContacts"];
  [v5 encodeBool:self->_includeRecents forKey:@"includeRecents"];
  [v5 encodeBool:self->_includeStewie forKey:@"includeStewie"];
  [v5 encodeBool:self->_includeSuggestions forKey:@"includeSuggestions"];
  [v5 encodeBool:self->_includeLocalExtensions forKey:@"includeLocalExtensions"];
  [v5 encodeBool:self->_includeDirectoryServers forKey:@"includeDirectoryServers"];
  [v5 encodeBool:self->_includeCalendarServers forKey:@"includeCalendarServers"];
  [v5 encodeBool:self->_includePredictions forKey:@"includePredictions"];
  [v5 encodeObject:self->_shouldIncludeGroupResultsImpl forKey:@"shouldIncludeGroupResultsImpl"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[CNAutocompleteFetchRequest addressableGroupResultStyle](self, "addressableGroupResultStyle"), @"addressableGroupResultStyle");
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_maximumResultsCount];
  [v5 encodeObject:v6 forKey:@"maximumResultsCount"];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNAutocompleteFetchRequest *)self searchNames];
  id v5 = (id)[v3 appendName:@"search names" object:v4];

  id v6 = [(CNAutocompleteFetchRequest *)self includeDebugString];
  id v7 = (id)[v3 appendName:@"include" object:v6];

  uint64_t v8 = [(CNAutocompleteFetchRequest *)self searchTypeDebugString];
  id v9 = (id)[v3 appendName:@"search type" object:v8];

  uint64_t v10 = [(CNAutocompleteFetchRequest *)self priorityDomainForSorting];
  id v11 = (id)[v3 appendName:@"priority domain" object:v10];

  uint64_t v12 = [(CNAutocompleteFetchRequest *)self fetchContext];
  id v13 = (id)[v3 appendName:@"fetch context" object:v12];

  uint64_t v14 = [(CNAutocompleteFetchRequest *)self shouldIncludeGroupResultsDebugString];
  id v15 = (id)[v3 appendName:@"shouldIncludeGroupResults" object:v14];

  uint64_t v16 = [v3 build];

  return v16;
}

- (id)includeDebugString
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNAutocompleteFetchRequest *)self includeRecents]) {
    [v3 addObject:@"Recents"];
  }
  if ([(CNAutocompleteFetchRequest *)self includeStewie]) {
    [v3 addObject:@"Stewie"];
  }
  if ([(CNAutocompleteFetchRequest *)self includeContacts]) {
    [v3 addObject:@"Contacts"];
  }
  if ([(CNAutocompleteFetchRequest *)self includeSuggestions]) {
    [v3 addObject:@"Suggestions"];
  }
  if ([(CNAutocompleteFetchRequest *)self includeLocalExtensions]) {
    [v3 addObject:@"Local Extensions"];
  }
  if ([(CNAutocompleteFetchRequest *)self includeDirectoryServers]) {
    [v3 addObject:@"Directory Servers"];
  }
  if ([(CNAutocompleteFetchRequest *)self includeCalendarServers]) {
    [v3 addObject:@"Calendar Servers"];
  }
  if ([(CNAutocompleteFetchRequest *)self includePredictions]) {
    [v3 addObject:@"Duet"];
  }
  if ([v3 count])
  {
    id v4 = [v3 componentsJoinedByString:@"+"];
  }
  else
  {
    id v4 = @"none";
  }

  return v4;
}

- (id)searchTypeDebugString
{
  unint64_t v2 = [(CNAutocompleteFetchRequest *)self searchType];
  if (v2 > 5) {
    return @"unknown";
  }
  else {
    return off_1E63DDB00[v2];
  }
}

- (id)shouldIncludeGroupResultsDebugString
{
  BOOL v3 = [(CNAutocompleteFetchRequest *)self shouldIncludeGroupResults];
  id v4 = @"NO";
  if (v3) {
    id v4 = @"YES";
  }
  if (self->_shouldIncludeGroupResultsImpl) {
    id v5 = @"explicit";
  }
  else {
    id v5 = @"implicit";
  }
  return (id)[NSString stringWithFormat:@"%@ (%@)", v4, v5];
}

- (BOOL)shouldIncludeGroupResults
{
  shouldIncludeGroupResultsImpl = self->_shouldIncludeGroupResultsImpl;
  return !shouldIncludeGroupResultsImpl || [(NSNumber *)shouldIncludeGroupResultsImpl BOOLValue];
}

- (void)setShouldIncludeGroupResults:(BOOL)a3
{
  self->_shouldIncludeGroupResultsImpl = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (void)setSendingAddress:(id)a3
{
  id v5 = a3;
  id v4 = [(CNAutocompleteFetchRequest *)self fetchContext];
  if (!v4)
  {
    id v4 = objc_alloc_init(CNAutocompleteFetchContext);
    [(CNAutocompleteFetchRequest *)self setFetchContext:v4];
  }
  [(CNAutocompleteFetchContext *)v4 setSendingAddress:v5];
}

- (NSString)sendingAddress
{
  unint64_t v2 = [(CNAutocompleteFetchRequest *)self fetchContext];
  BOOL v3 = [v2 sendingAddress];

  return (NSString *)v3;
}

- (NSArray)searchNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSearchNames:(id)a3
{
}

- (NSString)priorityDomainForSorting
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPriorityDomainForSorting:(id)a3
{
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(unint64_t)a3
{
  self->_searchType = a3;
}

- (CNAutocompleteFetchContext)fetchContext
{
  return (CNAutocompleteFetchContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFetchContext:(id)a3
{
}

- (unint64_t)maximumResultsCount
{
  return self->_maximumResultsCount;
}

- (void)setMaximumResultsCount:(unint64_t)a3
{
  self->_maximumResultsCount = a3;
}

- (BOOL)includeContacts
{
  return self->_includeContacts;
}

- (void)setIncludeContacts:(BOOL)a3
{
  self->_includeContacts = a3;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (void)setIncludeRecents:(BOOL)a3
{
  self->_includeRecents = a3;
}

- (BOOL)includeStewie
{
  return self->_includeStewie;
}

- (void)setIncludeStewie:(BOOL)a3
{
  self->_includeStewie = a3;
}

- (BOOL)includeSuggestions
{
  return self->_includeSuggestions;
}

- (void)setIncludeSuggestions:(BOOL)a3
{
  self->_includeSuggestions = a3;
}

- (BOOL)includeLocalExtensions
{
  return self->_includeLocalExtensions;
}

- (void)setIncludeLocalExtensions:(BOOL)a3
{
  self->_includeLocalExtensions = a3;
}

- (BOOL)includeDirectoryServers
{
  return self->_includeDirectoryServers;
}

- (void)setIncludeDirectoryServers:(BOOL)a3
{
  self->_includeDirectoryServers = a3;
}

- (BOOL)includeCalendarServers
{
  return self->_includeCalendarServers;
}

- (void)setIncludeCalendarServers:(BOOL)a3
{
  self->_includeCalendarServers = a3;
}

- (BOOL)includePredictions
{
  return self->_includePredictions;
}

- (void)setIncludePredictions:(BOOL)a3
{
  self->_includePredictions = a3;
}

- (int64_t)addressableGroupResultStyle
{
  return self->_addressableGroupResultStyle;
}

- (void)setAddressableGroupResultStyle:(int64_t)a3
{
  self->_addressableGroupResultStyle = a3;
}

- (NSString)triageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triageIdentifier, 0);
  objc_storeStrong((id *)&self->_shouldIncludeGroupResultsImpl, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_priorityDomainForSorting, 0);
  objc_storeStrong((id *)&self->_searchNames, 0);
}

@end