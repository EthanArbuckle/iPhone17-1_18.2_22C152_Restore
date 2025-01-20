@interface MPModelStoreBrowseRequest
+ (BOOL)supportsSecureCoding;
+ (id)allSupportedItemProperties;
+ (id)allSupportedSectionProperties;
- (BOOL)flattenRadioList;
- (MPModelStoreBrowseRequest)init;
- (MPModelStoreBrowseRequest)initWithCoder:(id)a3;
- (MPModelStoreBrowseResponse)previousResponse;
- (MPModelStoreBrowseResponse)previousRetrievedNestedResponse;
- (NSURL)loadAdditionalContentURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (int64_t)additionalContent;
- (int64_t)domain;
- (int64_t)filteringPolicy;
- (int64_t)requestEndpoint;
- (int64_t)subscriptionStatus;
- (unint64_t)options;
- (void)configureWithParentSection:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalContent:(int64_t)a3;
- (void)setDomain:(int64_t)a3;
- (void)setFilteringPolicy:(int64_t)a3;
- (void)setFlattenRadioList:(BOOL)a3;
- (void)setLoadAdditionalContentURL:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPreviousResponse:(id)a3;
- (void)setPreviousRetrievedNestedResponse:(id)a3;
- (void)setRequestEndpoint:(int64_t)a3;
- (void)setSubscriptionStatus:(int64_t)a3;
@end

@implementation MPModelStoreBrowseRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousResponse, 0);
  objc_storeStrong((id *)&self->_previousRetrievedNestedResponse, 0);

  objc_storeStrong((id *)&self->_loadAdditionalContentURL, 0);
}

- (void)setRequestEndpoint:(int64_t)a3
{
  self->_requestEndpoint = a3;
}

- (int64_t)requestEndpoint
{
  return self->_requestEndpoint;
}

- (void)setPreviousResponse:(id)a3
{
}

- (MPModelStoreBrowseResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setSubscriptionStatus:(int64_t)a3
{
  self->_subscriptionStatus = a3;
}

- (int64_t)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setFilteringPolicy:(int64_t)a3
{
  self->_filteringPolicy = a3;
}

- (int64_t)filteringPolicy
{
  return self->_filteringPolicy;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setAdditionalContent:(int64_t)a3
{
  self->_additionalContent = a3;
}

- (int64_t)additionalContent
{
  return self->_additionalContent;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setPreviousRetrievedNestedResponse:(id)a3
{
}

- (MPModelStoreBrowseResponse)previousRetrievedNestedResponse
{
  return self->_previousRetrievedNestedResponse;
}

- (void)setLoadAdditionalContentURL:(id)a3
{
}

- (NSURL)loadAdditionalContentURL
{
  return self->_loadAdditionalContentURL;
}

- (void)setFlattenRadioList:(BOOL)a3
{
  self->_options |= 2uLL;
}

- (BOOL)flattenRadioList
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (void)configureWithParentSection:(id)a3
{
  id v4 = a3;
  v5 = [v4 loadAdditionalContentURL];
  [(MPModelStoreBrowseRequest *)self setLoadAdditionalContentURL:v5];

  id v6 = [v4 previouslyRetrievedNestedResponse];

  [(MPModelStoreBrowseRequest *)self setPreviousRetrievedNestedResponse:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelStoreBrowseRequest;
  id v4 = [(MPStoreModelRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 14, self->_loadAdditionalContentURL);
    v5[16] = self->_domain;
    v5[19] = self->_filteringPolicy;
    v5[22] = self->_requestEndpoint;
    objc_storeStrong(v5 + 15, self->_previousRetrievedNestedResponse);
    objc_storeStrong(v5 + 21, self->_previousResponse);
    v5[20] = self->_subscriptionStatus;
    v5[17] = self->_additionalContent;
    v5[18] = self->_options;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelStoreBrowseRequest;
  id v4 = a3;
  [(MPStoreModelRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_loadAdditionalContentURL, @"MPModelStoreBrowseRequestLoadAdditionalContentURL", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_domain forKey:@"MPModelStoreBrowseRequestDomain"];
  [v4 encodeInteger:self->_filteringPolicy forKey:@"MPModelStoreBrowseRequestFilteringPolicy"];
  [v4 encodeInteger:self->_requestEndpoint forKey:@"MPModelStoreBrowseRequestEndpoint"];
  [v4 encodeInteger:self->_subscriptionStatus forKey:@"MPModelStoreBrowseRequestSubscriptionStatus"];
  [v4 encodeInteger:self->_additionalContent forKey:@"MPModelStoreBrowseRequestAdditionalContent"];
  [v4 encodeInteger:self->_options forKey:@"MPModelStoreBrowseRequestOptions"];
}

- (MPModelStoreBrowseRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStoreBrowseRequest;
  objc_super v5 = [(MPStoreModelRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_domain = [v4 decodeIntegerForKey:@"MPModelStoreBrowseRequestDomain"];
    v5->_filteringPolicy = [v4 decodeIntegerForKey:@"MPModelStoreBrowseRequestFilteringPolicy"];
    v5->_requestEndpoint = [v4 decodeIntegerForKey:@"MPModelStoreBrowseRequestEndpoint"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelStoreBrowseRequestLoadAdditionalContentURL"];
    loadAdditionalContentURL = v5->_loadAdditionalContentURL;
    v5->_loadAdditionalContentURL = (NSURL *)v6;

    v5->_subscriptionStatus = [v4 decodeIntegerForKey:@"MPModelStoreBrowseRequestSubscriptionStatus"];
    v5->_additionalContent = [v4 decodeIntegerForKey:@"MPModelStoreBrowseRequestAdditionalContent"];
    v5->_options = [v4 decodeIntegerForKey:@"MPModelStoreBrowseRequestOptions"];
  }

  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[(MPModelStoreBrowseRequest *)self copy];
  if ([(MPModelStoreBrowseRequest *)self requestEndpoint] == 1)
  {
    int64_t v6 = [(MPModelStoreBrowseRequest *)self domain];
    objc_super v7 = off_1E57EC3C0;
    if (v6 == 1) {
      objc_super v7 = off_1E57EC3F0;
    }
  }
  else
  {
    objc_super v7 = off_1E57EC3D0;
  }
  v8 = (void *)[objc_alloc(*v7) initWithRequest:v5 responseHandler:v4];

  return v8;
}

- (MPModelStoreBrowseRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPModelStoreBrowseRequest;
  result = [(MPStoreModelRequest *)&v3 init];
  if (result)
  {
    result->_domain = 0;
    result->_filteringPolicy = 0;
    result->_requestEndpoint = 0;
    result->_subscriptionStatus = 0;
    result->_additionalContent = 0;
    result->_options = 0;
  }
  return result;
}

+ (id)allSupportedSectionProperties
{
  return +[MPModelStoreBrowseSectionBuilder allSupportedPropertiesIncludingInternalOnlyProperties:0];
}

+ (id)allSupportedItemProperties
{
  return +[MPModelStoreBrowseContentItemBuilder allSupportedProperties];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end