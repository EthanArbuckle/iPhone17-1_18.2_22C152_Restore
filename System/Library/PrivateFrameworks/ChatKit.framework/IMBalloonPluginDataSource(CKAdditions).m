@interface IMBalloonPluginDataSource(CKAdditions)
- (uint64_t)wantsInteractiveContentView;
@end

@implementation IMBalloonPluginDataSource(CKAdditions)

- (uint64_t)wantsInteractiveContentView
{
  return 0;
}

@end