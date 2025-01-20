@interface ANAnalyticsContext
+ (id)contextWithAnnouncer:(id)a3;
+ (id)contextWithEndpointID:(id)a3;
- (BOOL)isEndpoint;
- (NSDictionary)analyticsPayload;
- (void)setIsEndpoint:(BOOL)a3;
@end

@implementation ANAnalyticsContext

- (NSDictionary)analyticsPayload
{
  v3 = objc_opt_new();
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ANAnalyticsContext isEndpoint](self, "isEndpoint"));
  [v3 setObject:v4 forKeyedSubscript:@"endpoint"];

  v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (BOOL)isEndpoint
{
  return self->_isEndpoint;
}

- (void)setIsEndpoint:(BOOL)a3
{
  self->_isEndpoint = a3;
}

+ (id)contextWithAnnouncer:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if (v3) {
    objc_msgSend(v4, "setIsEndpoint:", objc_msgSend(v3, "isEndpoint"));
  }

  return v4;
}

+ (id)contextWithEndpointID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if (v3) {
    objc_msgSend(v4, "setIsEndpoint:", objc_msgSend(v3, "an_isLocalDevice") ^ 1);
  }

  return v4;
}

@end