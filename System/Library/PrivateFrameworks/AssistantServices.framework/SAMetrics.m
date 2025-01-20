@interface SAMetrics
+ (BOOL)ad_shouldClassLogToMetrics;
- (NSString)offlineIdentifier;
- (void)setOfflineIdentifier:(id)a3;
@end

@implementation SAMetrics

- (void)setOfflineIdentifier:(id)a3
{
}

- (NSString)offlineIdentifier
{
  return (NSString *)objc_getAssociatedObject(self, off_100581CE0);
}

+ (BOOL)ad_shouldClassLogToMetrics
{
  return 0;
}

@end