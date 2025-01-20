@interface WFPodcastsAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (unint64_t)status;
@end

@implementation WFPodcastsAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (unint64_t)status
{
  return 4;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.podcasts";
}

@end