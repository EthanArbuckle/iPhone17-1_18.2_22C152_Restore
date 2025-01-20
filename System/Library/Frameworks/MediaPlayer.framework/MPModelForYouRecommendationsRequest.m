@interface MPModelForYouRecommendationsRequest
+ (BOOL)supportsSecureCoding;
+ (id)allSupportedItemProperties;
+ (id)allSupportedSectionProperties;
- (BOOL)refreshRequest;
- (BOOL)withPlainEditorialNotes;
- (BOOL)withRecentlyPlayed;
- (BOOL)withSocial;
- (MPModelForYouRecommendationsRequest)init;
- (MPModelForYouRecommendationsRequest)initWithCoder:(id)a3;
- (NSURL)customForYouURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (int64_t)displayFilterKinds;
- (int64_t)filteringPolicy;
- (int64_t)mode;
- (int64_t)requestEndpoint;
- (int64_t)types;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomForYouURL:(id)a3;
- (void)setDisplayFilterKinds:(int64_t)a3;
- (void)setFilteringPolicy:(int64_t)a3;
- (void)setMode:(int64_t)a3;
- (void)setRefreshRequest:(BOOL)a3;
- (void)setRequestEndpoint:(int64_t)a3;
- (void)setTypes:(int64_t)a3;
- (void)setWithPlainEditorialNotes:(BOOL)a3;
- (void)setWithRecentlyPlayed:(BOOL)a3;
- (void)setWithSocial:(BOOL)a3;
@end

@implementation MPModelForYouRecommendationsRequest

- (void).cxx_destruct
{
}

- (void)setRefreshRequest:(BOOL)a3
{
  self->_refreshRequest = a3;
}

- (BOOL)refreshRequest
{
  return self->_refreshRequest;
}

- (void)setCustomForYouURL:(id)a3
{
}

- (NSURL)customForYouURL
{
  return self->_customForYouURL;
}

- (void)setWithRecentlyPlayed:(BOOL)a3
{
  self->_withRecentlyPlayed = a3;
}

- (BOOL)withRecentlyPlayed
{
  return self->_withRecentlyPlayed;
}

- (void)setDisplayFilterKinds:(int64_t)a3
{
  self->_displayFilterKinds = a3;
}

- (int64_t)displayFilterKinds
{
  return self->_displayFilterKinds;
}

- (void)setWithPlainEditorialNotes:(BOOL)a3
{
  self->_withPlainEditorialNotes = a3;
}

- (BOOL)withPlainEditorialNotes
{
  return self->_withPlainEditorialNotes;
}

- (void)setWithSocial:(BOOL)a3
{
  self->_withSocial = a3;
}

- (BOOL)withSocial
{
  return self->_withSocial;
}

- (void)setTypes:(int64_t)a3
{
  self->_types = a3;
}

- (int64_t)types
{
  return self->_types;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setRequestEndpoint:(int64_t)a3
{
  self->_requestEndpoint = a3;
}

- (int64_t)requestEndpoint
{
  return self->_requestEndpoint;
}

- (void)setFilteringPolicy:(int64_t)a3
{
  self->_filteringPolicy = a3;
}

- (int64_t)filteringPolicy
{
  return self->_filteringPolicy;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelForYouRecommendationsRequest;
  v4 = [(MPStoreModelRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 20, self->_customForYouURL);
    v5[15] = self->_filteringPolicy;
    v5[16] = self->_requestEndpoint;
    v5[17] = self->_mode;
    *((unsigned char *)v5 + 114) = self->_withRecentlyPlayed;
    *((unsigned char *)v5 + 112) = self->_withSocial;
    v5[18] = self->_types;
    *((unsigned char *)v5 + 113) = self->_withPlainEditorialNotes;
    v5[19] = self->_displayFilterKinds;
    *((unsigned char *)v5 + 115) = self->_refreshRequest;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelForYouRecommendationsRequest;
  id v4 = a3;
  [(MPStoreModelRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_customForYouURL, @"customForYouURL", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_filteringPolicy forKey:@"MPModelStoreForYouRequestFilteringPolicy"];
  [v4 encodeInteger:self->_requestEndpoint forKey:@"MPModelStoreForYouRequestEndpoint"];
  [v4 encodeInteger:self->_mode forKey:@"MPModelStoreForYouRequestMode"];
  [v4 encodeBool:self->_withRecentlyPlayed forKey:@"withRecentlyPlayed"];
  [v4 encodeBool:self->_withSocial forKey:@"withSocial"];
  [v4 encodeInteger:self->_types forKey:@"types"];
  [v4 encodeBool:self->_withPlainEditorialNotes forKey:@"withPlainEditorialNotes"];
  [v4 encodeInteger:self->_displayFilterKinds forKey:@"MPModelStoreForYouDisplayFilterKind"];
  [v4 encodeBool:self->_refreshRequest forKey:@"refreshRequest"];
}

- (MPModelForYouRecommendationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelForYouRecommendationsRequest;
  objc_super v5 = [(MPStoreModelRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customForYouURL"];
    customForYouURL = v5->_customForYouURL;
    v5->_customForYouURL = (NSURL *)v6;

    v5->_filteringPolicy = [v4 decodeIntegerForKey:@"MPModelStoreForYouRequestFilteringPolicy"];
    v5->_requestEndpoint = [v4 decodeIntegerForKey:@"MPModelStoreForYouRequestEndpoint"];
    v5->_mode = [v4 decodeIntegerForKey:@"MPModelStoreForYouRequestMode"];
    v5->_withRecentlyPlayed = [v4 decodeBoolForKey:@"withRecentlyPlayed"];
    v5->_withSocial = [v4 decodeBoolForKey:@"withSocial"];
    v5->_types = [v4 decodeIntegerForKey:@"types"];
    v5->_withPlainEditorialNotes = [v4 decodeBoolForKey:@"withPlainEditorialNotes"];
    v5->_displayFilterKinds = [v4 decodeIntegerForKey:@"MPModelStoreForYouDisplayFilterKind"];
    v5->_refreshRequest = [v4 decodeBoolForKey:@"refreshRequest"];
  }

  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  if ([(MPModelForYouRecommendationsRequest *)self requestEndpoint] == 1) {
    objc_super v5 = MPModelForYouRecommendationsMusicKitRequestOperation;
  }
  else {
    objc_super v5 = MPModelForYouRecommendationsRequestOperation;
  }
  id v6 = [v5 alloc];
  objc_super v7 = (void *)[(MPModelForYouRecommendationsRequest *)self copy];
  v8 = (void *)[v6 initWithRequest:v7 responseHandler:v4];

  return v8;
}

- (MPModelForYouRecommendationsRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPModelForYouRecommendationsRequest;
  result = [(MPStoreModelRequest *)&v3 init];
  if (result)
  {
    result->_filteringPolicy = 0;
    result->_requestEndpoint = 0;
    result->_mode = 0;
    result->_withRecentlyPlayed = 1;
    result->_withSocial = 0;
    result->_types = 106622;
    result->_withPlainEditorialNotes = 1;
    result->_displayFilterKinds = 102;
    result->_refreshRequest = 0;
  }
  return result;
}

+ (id)allSupportedSectionProperties
{
  return +[MPModelForYouRecommendationGroupBuilder allSupportedGroupProperties];
}

+ (id)allSupportedItemProperties
{
  return +[MPModelForYouRecommendationGroupBuilder allSupportedItemProperties];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end