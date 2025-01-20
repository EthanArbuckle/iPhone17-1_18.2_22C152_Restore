@interface HKClinicalProviderSearchResultsPage
+ (BOOL)supportsSecureCoding;
- (HKClinicalProviderSearchResultsPage)initWithCoder:(id)a3;
- (HKClinicalProviderSearchResultsPage)initWithSearchResults:(id)a3 from:(int64_t)a4 nextFrom:(int64_t)a5 size:(int64_t)a6;
- (NSArray)searchResults;
- (id)copyWithSearchResults:(id)a3;
- (int64_t)from;
- (int64_t)nextFrom;
- (int64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalProviderSearchResultsPage

- (HKClinicalProviderSearchResultsPage)initWithSearchResults:(id)a3 from:(int64_t)a4 nextFrom:(int64_t)a5 size:(int64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKClinicalProviderSearchResultsPage;
  v11 = [(HKClinicalProviderSearchResultsPage *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    searchResults = v11->_searchResults;
    v11->_searchResults = (NSArray *)v12;

    v11->_from = a4;
    v11->_nextFrom = a5;
    v11->_size = a6;
  }

  return v11;
}

- (id)copyWithSearchResults:(id)a3
{
  id v4 = a3;
  v5 = [[HKClinicalProviderSearchResultsPage alloc] initWithSearchResults:v4 from:self->_from nextFrom:self->_nextFrom size:self->_size];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(HKClinicalProviderSearchResultsPage *)self searchResults];
  [v5 encodeObject:v4 forKey:@"SearchResultsKey"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[HKClinicalProviderSearchResultsPage from](self, "from"), @"FromKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[HKClinicalProviderSearchResultsPage nextFrom](self, "nextFrom"), @"NextFromKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[HKClinicalProviderSearchResultsPage size](self, "size"), @"SizeKey");
}

- (HKClinicalProviderSearchResultsPage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"SearchResultsKey"];
  if (v6
    && [v4 containsValueForKey:@"FromKey"]
    && [v4 containsValueForKey:@"NextFromKey"]
    && ([v4 containsValueForKey:@"SizeKey"] & 1) != 0)
  {
    self = -[HKClinicalProviderSearchResultsPage initWithSearchResults:from:nextFrom:size:](self, "initWithSearchResults:from:nextFrom:size:", v6, [v4 decodeIntegerForKey:@"FromKey"], objc_msgSend(v4, "decodeIntegerForKey:", @"NextFromKey"), objc_msgSend(v4, "decodeIntegerForKey:", @"SizeKey"));
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (int64_t)from
{
  return self->_from;
}

- (int64_t)nextFrom
{
  return self->_nextFrom;
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
}

@end