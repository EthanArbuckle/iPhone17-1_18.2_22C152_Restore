@interface ASCOverlaySettings
+ (ASCOverlaySettings)sharedSettings;
- (NSNumber)overlaysLoadTimeout;
- (NSNumber)rateLimitRequestsPerSecond;
- (NSNumber)rateLimitTimeWindow;
- (id)_init;
- (void)setOverlaysLoadTimeout:(id)a3;
- (void)setRateLimitRequestsPerSecond:(id)a3;
- (void)setRateLimitTimeWindow:(id)a3;
@end

@implementation ASCOverlaySettings

+ (ASCOverlaySettings)sharedSettings
{
  if (sharedSettings_onceToken != -1) {
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)sharedSettings_sharedSettings;

  return (ASCOverlaySettings *)v2;
}

uint64_t __36__ASCOverlaySettings_sharedSettings__block_invoke()
{
  sharedSettings_sharedSettings = [[ASCOverlaySettings alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  +[ASCEligibility assertCurrentProcessEligibility]();
  v4.receiver = self;
  v4.super_class = (Class)ASCOverlaySettings;
  return [(ASCOverlaySettings *)&v4 init];
}

- (NSNumber)rateLimitRequestsPerSecond
{
  v2 = +[ASCDefaults daemonDefaults];
  v3 = [v2 overlaysRateLimitRequestsPerSecond];

  return (NSNumber *)v3;
}

- (void)setRateLimitRequestsPerSecond:(id)a3
{
  id v3 = a3;
  id v4 = +[ASCDefaults daemonDefaults];
  [v4 setOverlaysRateLimitRequestsPerSecond:v3];
}

- (NSNumber)rateLimitTimeWindow
{
  v2 = +[ASCDefaults daemonDefaults];
  id v3 = [v2 overlaysRateLimitTimeWindow];

  return (NSNumber *)v3;
}

- (void)setRateLimitTimeWindow:(id)a3
{
  id v3 = a3;
  id v4 = +[ASCDefaults daemonDefaults];
  [v4 setOverlaysRateLimitTimeWindow:v3];
}

- (NSNumber)overlaysLoadTimeout
{
  v2 = +[ASCDefaults daemonDefaults];
  id v3 = [v2 overlaysLoadTimeout];

  return (NSNumber *)v3;
}

- (void)setOverlaysLoadTimeout:(id)a3
{
  id v3 = a3;
  id v4 = +[ASCDefaults daemonDefaults];
  [v4 setOverlaysLoadTimeout:v3];
}

@end