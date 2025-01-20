@interface CRSearchQuery
+ (BOOL)supportsSecureCoding;
+ (id)frecencyComparator;
+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 queryOptions:(unint64_t)a6;
+ (id)rankedFrecencyComparatorWithPreferredSources:(id)a3;
+ (id)searchQueryForSearchTerm:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 recentsDomain:(id)a6;
- (BOOL)isEqual:(id)a3;
- (CRSearchPredicate)searchPredicate;
- (CRSearchQuery)init;
- (CRSearchQuery)initWithCoder:(id)a3;
- (NSArray)domains;
- (NSPredicate)predicate;
- (NSString)uuid;
- (_NSRange)pageRange;
- (id)comparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)weightDecayer;
- (unint64_t)hash;
- (unint64_t)implicitGroupThreshold;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setComparator:(id)a3;
- (void)setDomains:(id)a3;
- (void)setImplicitGroupThreshold:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPageRange:(_NSRange)a3;
- (void)setPredicate:(id)a3;
- (void)setSearchPredicate:(id)a3;
- (void)setWeightDecayer:(id)a3;
@end

@implementation CRSearchQuery

- (_NSRange)pageRange
{
  NSUInteger length = self->_pageRange.length;
  NSUInteger location = self->_pageRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDomains:(id)a3
{
}

- (void)setComparator:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)implicitGroupThreshold
{
  return self->_implicitGroupThreshold;
}

- (NSArray)domains
{
  return self->_domains;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  searchPredicate = self->_searchPredicate;
  id v5 = a3;
  [v5 encodeObject:searchPredicate forKey:@"searchPredicate"];
  [v5 encodeObject:self->_domains forKey:@"domains"];
  [v5 encodeInteger:self->_implicitGroupThreshold forKey:@"implicitGroupThreshold"];
  [v5 encodeInteger:self->_options forKey:@"options"];
  [v5 encodeInt64:self->_pageRange.location forKey:@"page.location"];
  [v5 encodeInt64:self->_pageRange.length forKey:@"page.length"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
}

- (CRSearchQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSearchQuery *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchPredicate"];
    searchPredicate = v5->_searchPredicate;
    v5->_searchPredicate = (CRSearchPredicate *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"domains"];
    domains = v5->_domains;
    v5->_domains = (NSArray *)v11;

    v5->_implicitGroupThreshold = [v4 decodeIntegerForKey:@"implicitGroupThreshold"];
    v5->_options = [v4 decodeIntegerForKey:@"options"];
    uint64_t v13 = [v4 decodeInt64ForKey:@"page.location"];
    uint64_t v14 = [v4 decodeInt64ForKey:@"page.length"];
    v5->_pageRange.NSUInteger location = v13;
    v5->_pageRange.NSUInteger length = v14;
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uint64_t v16 = [v15 copy];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (CRSearchQuery)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRSearchQuery;
  v2 = [(CRSearchQuery *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_pageRange = (_NSRange)xmmword_1A785DF20;
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    uuid = v3->_uuid;
    v3->_uuid = (NSString *)v5;

    v7 = v3;
  }

  return v3;
}

- (void)setSearchPredicate:(id)a3
{
}

+ (id)frecencyComparator
{
  return &__block_literal_global_1;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)weightDecayer
{
  return self->_weightDecayer;
}

- (id)comparator
{
  return self->_comparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_weightDecayer, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (NSPredicate)predicate
{
  v3 = self->_predicate;
  if (!v3)
  {
    if (!self->_searchPredicateExpansionAttempted)
    {
      self->_searchPredicateExpansionAttempted = 1;
      id v4 = [(CRSearchPredicate *)self->_searchPredicate asNSPredicate];
      predicate = self->_predicate;
      self->_predicate = v4;
    }
    v3 = self->_predicate;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRSearchQuery *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  searchPredicate = self->_searchPredicate;
  if ((unint64_t)searchPredicate | (unint64_t)v4->_searchPredicate)
  {
    if (!-[CRSearchPredicate isEqual:](searchPredicate, "isEqual:")) {
      goto LABEL_14;
    }
  }
  predicate = self->_predicate;
  if ((unint64_t)predicate | (unint64_t)v4->_predicate)
  {
    if (!-[NSPredicate isEqual:](predicate, "isEqual:")) {
      goto LABEL_14;
    }
  }
  domains = self->_domains;
  if ((unint64_t)domains | (unint64_t)v4->_domains)
  {
    if (!-[NSArray isEqual:](domains, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (self->_implicitGroupThreshold != v4->_implicitGroupThreshold || self->_options != v4->_options) {
    goto LABEL_14;
  }
  BOOL v8 = 0;
  if (self->_pageRange.location == v4->_pageRange.location && self->_pageRange.length == v4->_pageRange.length)
  {
    if (self->_weightDecayer == v4->_weightDecayer)
    {
      BOOL v8 = self->_comparator == v4->_comparator;
      goto LABEL_16;
    }
LABEL_14:
    BOOL v8 = 0;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_searchPredicate];
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_predicate] - v3 + 32 * v3;
  uint64_t v5 = [MEMORY[0x1E4F5A418] arrayHash:self->_domains];
  unint64_t v6 = self->_implicitGroupThreshold - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  unint64_t v7 = self->_options - v6 + 32 * v6;
  NSUInteger v8 = self->_pageRange.location - v7 + 32 * v7;
  NSUInteger v9 = self->_pageRange.length - v8 + 32 * v8;
  v10 = (char *)self->_weightDecayer + 32 * v9 - v9;
  return (char *)self->_comparator - (char *)v10 + 32 * (void)v10 + 0x198CB38E0830FLL;
}

- (void)setPredicate:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CRSearchQuery);
  uint64_t v5 = v4;
  if (self->_searchPredicate) {
    -[CRSearchQuery setSearchPredicate:](v4, "setSearchPredicate:");
  }
  else {
    [(CRSearchQuery *)v4 setPredicate:self->_predicate];
  }
  unint64_t v6 = (void *)[(NSArray *)self->_domains copy];
  [(CRSearchQuery *)v5 setDomains:v6];

  [(CRSearchQuery *)v5 setImplicitGroupThreshold:self->_implicitGroupThreshold];
  [(CRSearchQuery *)v5 setOptions:self->_options];
  -[CRSearchQuery setPageRange:](v5, "setPageRange:", self->_pageRange.location, self->_pageRange.length);
  [(CRSearchQuery *)v5 setWeightDecayer:self->_weightDecayer];
  [(CRSearchQuery *)v5 setComparator:self->_comparator];
  return v5;
}

+ (id)searchQueryForSearchTerm:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 recentsDomain:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 length] && objc_msgSend(v11, "count"))
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = +[CRSearchPredicate predicateForKey:@"kind" inCollection:v11];
    [v14 addObject:v15];

    uint64_t v16 = objc_msgSend(v10, "_cn_trimmedString");
    v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = +[CRSearchPredicate predicateForKey:@"displayName" matchingText:v16 comparison:1];
    [v17 addObject:v18];

    v19 = +[CRSearchPredicate predicateForKey:@"address" matchingText:v16 comparison:2];
    [v17 addObject:v19];

    if ([v11 containsObject:@"group"])
    {
      v20 = +[CRSearchPredicate predicateForKey:@"groupName" matchingText:v16 comparison:1];
      [v17 addObject:v20];
    }
    v21 = +[CRSearchPredicate predicateSatisfyingAnySubpredicate:v17];
    [v14 addObject:v21];

    v22 = objc_alloc_init(CRSearchQuery);
    v23 = +[CRSearchPredicate predicateSatisfyingAllSubpredicates:v14];
    [(CRSearchQuery *)v22 setSearchPredicate:v23];

    v27[0] = v13;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(CRSearchQuery *)v22 setDomains:v24];

    v25 = [a1 frecencyComparatorForSearch:v16 preferredKinds:v11 sendingAddress:v12 queryOptions:0];
    [(CRSearchQuery *)v22 setComparator:v25];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 queryOptions:(unint64_t)a6
{
  char v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __88__CRSearchQuery_frecencyComparatorForSearch_preferredKinds_sendingAddress_queryOptions___block_invoke;
  v21 = &unk_1E5CFBC50;
  id v22 = v10;
  id v23 = v9;
  id v24 = v11;
  char v25 = v6 & 1;
  id v12 = v11;
  id v13 = v9;
  id v14 = v10;
  v15 = (void *)MEMORY[0x1AD0D14F0](&v18);
  uint64_t v16 = objc_msgSend(v15, "copy", v18, v19, v20, v21);

  return v16;
}

uint64_t __88__CRSearchQuery_frecencyComparatorForSearch_preferredKinds_sendingAddress_queryOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _internalFrecency(a2, a3, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

+ (id)rankedFrecencyComparatorWithPreferredSources:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CRSearchQuery_rankedFrecencyComparatorWithPreferredSources___block_invoke;
  v8[3] = &unk_1E5CFBC78;
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1AD0D14F0](v8);
  char v6 = (void *)[v5 copy];

  return v6;
}

uint64_t __62__CRSearchQuery_rankedFrecencyComparatorWithPreferredSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = *(void **)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 decayedWeight];
  [v11 doubleValue];
  double v13 = v12;

  id v14 = [v9 decayedWeight];
  [v14 doubleValue];
  double v16 = v15;

  if (vabdd_f64(v13, v16) > 0.1)
  {
    if (v13 <= v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = -1;
    }
    goto LABEL_20;
  }
  if (![v10 count]) {
    goto LABEL_14;
  }
  uint64_t v18 = [v8 originalSource];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = @"<null>";
  }
  v21 = v20;

  uint64_t v22 = [v9 originalSource];
  id v23 = (void *)v22;
  if (v22) {
    id v24 = (__CFString *)v22;
  }
  else {
    id v24 = @"<null>";
  }
  char v25 = v24;

  if ([(__CFString *)v21 isEqualToString:v25])
  {

LABEL_14:
    v26 = [v9 mostRecentDate];
    v27 = [v8 mostRecentDate];
    uint64_t v17 = [v26 compare:v27];

    if (!v17) {
      uint64_t v17 = _internalFrecency(v8, v9, 0, 0, 0, 0);
    }
    goto LABEL_20;
  }
  unint64_t v28 = [v10 indexOfObject:v21];
  if (v28 < [v10 indexOfObject:v25]) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 1;
  }

LABEL_20:
  return v17;
}

- (CRSearchPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (void)setImplicitGroupThreshold:(unint64_t)a3
{
  self->_implicitGroupThreshold = a3;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setPageRange:(_NSRange)a3
{
  self->_pageRange = a3;
}

- (void)setWeightDecayer:(id)a3
{
}

@end