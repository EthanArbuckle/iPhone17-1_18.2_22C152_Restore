@interface BLSHLocalOnlySimplePlatformProvider
- (BLSHLocalOnlySimplePlatformProvider)initWithConfiguration:(id)a3;
- (BOOL)isShowingBlankingWindow;
- (double)backlightDimmingDuration;
- (double)backlightFadeInDuration;
- (double)backlightFadeOutDuration;
- (float)backlightDimmedFactor;
- (id)createInactiveEnvironmentSession;
@end

@implementation BLSHLocalOnlySimplePlatformProvider

- (BLSHLocalOnlySimplePlatformProvider)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSHLocalOnlySimplePlatformProvider;
  v5 = [(BLSHLocalOnlySimplePlatformProvider *)&v11 init];
  if (v5)
  {
    [v4 fadeInDuration];
    v5->_backlightFadeInDuration = v6;
    [v4 fadeOutDuration];
    v5->_backlightFadeOutDuration = v7;
    [v4 dimmingDuration];
    v5->_backlightDimmingDuration = v8;
    [v4 dimmedFactor];
    v5->_backlightDimmedFactor = v9;
  }

  return v5;
}

- (BOOL)isShowingBlankingWindow
{
  return 0;
}

- (id)createInactiveEnvironmentSession
{
  v2 = [BLSHBacklightEnvironmentPresentation alloc];
  v3 = [(BLSHBacklightEnvironmentPresentation *)v2 initWithPresentationEntries:MEMORY[0x263EFFA68] flipbookContext:0 expirationDate:0];
  id v4 = +[BLSHBacklightInactiveEnvironmentSession sessionWithPresentation:v3];

  return v4;
}

- (double)backlightFadeInDuration
{
  return self->_backlightFadeInDuration;
}

- (double)backlightFadeOutDuration
{
  return self->_backlightFadeOutDuration;
}

- (double)backlightDimmingDuration
{
  return self->_backlightDimmingDuration;
}

- (float)backlightDimmedFactor
{
  return self->_backlightDimmedFactor;
}

@end