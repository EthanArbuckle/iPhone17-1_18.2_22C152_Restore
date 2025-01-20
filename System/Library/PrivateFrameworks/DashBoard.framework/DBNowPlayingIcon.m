@interface DBNowPlayingIcon
- (DBNowPlayingIcon)init;
@end

@implementation DBNowPlayingIcon

- (DBNowPlayingIcon)init
{
  uint64_t v2 = *MEMORY[0x263F31298];
  v6.receiver = self;
  v6.super_class = (Class)DBNowPlayingIcon;
  v3 = [(SBLeafIcon *)&v6 initWithLeafIdentifier:v2 applicationBundleID:v2];
  if (v3)
  {
    v4 = +[DBLeafIconDataSource dataSourceForNowPlayingIcon];
    [(SBLeafIcon *)v3 addIconDataSource:v4];
  }
  return v3;
}

@end