@interface NSURL(SLTwitterURLAdditions)
+ (id)SLTwitterRetweetURLForTweetID:()SLTwitterURLAdditions;
+ (uint64_t)SLTwitterAccessTokenURL;
+ (uint64_t)SLTwitterAccountGenerateURL;
+ (uint64_t)SLTwitterAccountSettingsURL;
+ (uint64_t)SLTwitterCleanupPushDestinationsURL;
+ (uint64_t)SLTwitterDirectMessageURL;
+ (uint64_t)SLTwitterFriendsURL;
+ (uint64_t)SLTwitterFriendshipsURL;
+ (uint64_t)SLTwitterImageLimitsURL;
+ (uint64_t)SLTwitterNearbyPlacesURL;
+ (uint64_t)SLTwitterRequestTokenURL;
+ (uint64_t)SLTwitterTCoLengthURL;
+ (uint64_t)SLTwitterUpdateMultiPartStatusURL;
+ (uint64_t)SLTwitterUpdateStatusURL;
+ (uint64_t)SLTwitterUserInfoURL;
+ (uint64_t)SLTwitterUsersLookupURL;
+ (uint64_t)SLTwitterVerifyCredentialsURL;
@end

@implementation NSURL(SLTwitterURLAdditions)

+ (uint64_t)SLTwitterUpdateStatusURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/statuses/update.json"];
}

+ (uint64_t)SLTwitterUpdateMultiPartStatusURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/statuses/update_with_media.json"];
}

+ (uint64_t)SLTwitterNearbyPlacesURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/geo/search.json"];
}

+ (uint64_t)SLTwitterFriendshipsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/friendships/show.json"];
}

+ (uint64_t)SLTwitterFriendsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/friends/ids.json"];
}

+ (uint64_t)SLTwitterTCoLengthURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/help/configuration.json"];
}

+ (uint64_t)SLTwitterImageLimitsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/help/configuration.json"];
}

+ (uint64_t)SLTwitterVerifyCredentialsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/account/verify_credentials.json"];
}

+ (uint64_t)SLTwitterCleanupPushDestinationsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/account/push_destinations/cleanup.json"];
}

+ (uint64_t)SLTwitterRequestTokenURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/oauth/request_token"];
}

+ (uint64_t)SLTwitterAccessTokenURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/oauth/access_token"];
}

+ (uint64_t)SLTwitterUserInfoURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/users/show.json"];
}

+ (uint64_t)SLTwitterAccountSettingsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/account/settings.json"];
}

+ (uint64_t)SLTwitterUsersLookupURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/users/lookup.json"];
}

+ (uint64_t)SLTwitterAccountGenerateURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1/account/generate.json"];
}

+ (id)SLTwitterRetweetURLForTweetID:()SLTwitterURLAdditions
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [NSString stringWithFormat:@"https://api.twitter.com/1.1/statuses/retweet/%@.json", a3];
  v5 = [v3 URLWithString:v4];

  return v5;
}

+ (uint64_t)SLTwitterDirectMessageURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://api.twitter.com/1.1/direct_messages/new.json"];
}

@end