@interface FFPlistParser
- (id)parseSubscriptionsFromDictionary:(id)a3;
@end

@implementation FFPlistParser

- (id)parseSubscriptionsFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"SubscriptionClass"];
  v5 = [v3 objectForKeyedSubscript:@"SubscriptionContents"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 isEqualToString:@"FFMinimumPhaseInReleaseSubscription"])
  {
    v6 = +[FFMinimumPhaseInReleaseSubscription decodeFromDictionary:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end