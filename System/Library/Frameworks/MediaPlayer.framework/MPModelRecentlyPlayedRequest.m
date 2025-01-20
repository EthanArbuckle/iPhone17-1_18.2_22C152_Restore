@interface MPModelRecentlyPlayedRequest
+ (BOOL)supportsSecureCoding;
+ (id)allSupportedItemProperties;
+ (id)allSupportedSectionProperties;
- (id)newOperationWithResponseHandler:(id)a3;
@end

@implementation MPModelRecentlyPlayedRequest

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

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [MPModelRecentlyPlayedRequestOperation alloc];
  v6 = (void *)[(MPModelRecentlyPlayedRequest *)self copy];
  v7 = [(MPStoreModelRequestOperation *)v5 initWithRequest:v6 responseHandler:v4];

  return v7;
}

@end