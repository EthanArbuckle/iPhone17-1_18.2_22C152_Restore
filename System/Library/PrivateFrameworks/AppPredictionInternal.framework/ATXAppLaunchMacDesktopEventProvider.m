@interface ATXAppLaunchMacDesktopEventProvider
- (BOOL)isEventFromProvider:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)description;
@end

@implementation ATXAppLaunchMacDesktopEventProvider

- (id)biomePublisherWithBookmark:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunchMacDesktopEventProvider;
  v7 = [(ATXAppLaunchMacEventProvider *)&v9 biomePublisherWithBookmark:v5 devicePlatform:3 startTime:v6 + -2419200.0];

  return v7;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ATXAppLaunchMacDesktopEventProvider;
  BOOL v5 = [(ATXAppLaunchMacEventProvider *)&v7 isEventFromProvider:v4]
    && ([v4 isMacDesktop] & 1) != 0;

  return v5;
}

- (id)description
{
  return @"MacDesktopAppLaunches";
}

@end