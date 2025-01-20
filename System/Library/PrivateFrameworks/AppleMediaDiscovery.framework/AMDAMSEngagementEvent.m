@interface AMDAMSEngagementEvent
- (NSDictionary)engagementData;
- (void)setEngagementData:(id)a3;
@end

@implementation AMDAMSEngagementEvent

- (NSDictionary)engagementData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEngagementData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end