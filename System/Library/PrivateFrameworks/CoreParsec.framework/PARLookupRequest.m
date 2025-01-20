@interface PARLookupRequest
+ (BOOL)supportsSecureCoding;
- (Class)responseClass;
- (NSString)appBundleId;
- (NSString)domain;
- (NSString)preferredLanguage;
- (NSString)queryContext;
- (NSString)queryString;
- (PARLookupRequest)initWithCoder:(id)a3;
- (int64_t)lookupSelectionType;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setDomain:(id)a3;
- (void)setLookupSelectionType:(int64_t)a3;
- (void)setPreferredLanguage:(id)a3;
- (void)setQueryContext:(id)a3;
- (void)setQueryString:(id)a3;
@end

@implementation PARLookupRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);

  objc_storeStrong((id *)&self->_queryString, 0);
}

- (void)setPreferredLanguage:(id)a3
{
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setLookupSelectionType:(int64_t)a3
{
  self->_lookupSelectionType = a3;
}

- (int64_t)lookupSelectionType
{
  return self->_lookupSelectionType;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setQueryContext:(id)a3
{
}

- (NSString)queryContext
{
  return self->_queryContext;
}

- (void)setQueryString:(id)a3
{
}

- (NSString)queryString
{
  return self->_queryString;
}

- (Class)responseClass
{
  _os_feature_enabled_impl();
  v2 = objc_opt_class();

  return (Class)v2;
}

- (unsigned)nwActivityLabel
{
  return 9;
}

- (PARLookupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PARLookupRequest;
  v5 = [(PARRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryContext"];
    queryContext = v5->_queryContext;
    v5->_queryContext = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lookupDomain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    v5->_lookupSelectionType = [v4 decodeIntegerForKey:@"lookupSelectionType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredLanguage"];
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARLookupRequest;
  id v4 = a3;
  [(PARRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryString, @"query", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_queryContext forKey:@"queryContext"];
  [v4 encodeObject:self->_domain forKey:@"lookupDomain"];
  [v4 encodeInteger:self->_lookupSelectionType forKey:@"lookupSelectionType"];
  [v4 encodeObject:self->_appBundleId forKey:@"appBundleId"];
  [v4 encodeObject:self->_preferredLanguage forKey:@"preferredLanguage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end