@interface CAMPortraitAutoSuggestEnabledCommand
- (BOOL)_isEnabled;
- (CAMPortraitAutoSuggestEnabledCommand)initWithPortraitAutoSuggestEnabled:(BOOL)a3;
- (CAMPortraitAutoSuggestEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPortraitAutoSuggestEnabledCommand

- (CAMPortraitAutoSuggestEnabledCommand)initWithPortraitAutoSuggestEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPortraitAutoSuggestEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMPortraitAutoSuggestEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMPortraitAutoSuggestEnabledCommand *)self initWithPortraitAutoSuggestEnabled:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPortraitAutoSuggestEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMPortraitAutoSuggestEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAMPortraitAutoSuggestEnabledCommand *)self _isEnabled];
  id v6 = [v4 currentVideoPreviewLayer];

  if ([v6 isPortraitAutoSuggestSupported]) {
    [v6 setPortraitAutoSuggestEnabled:v5];
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end