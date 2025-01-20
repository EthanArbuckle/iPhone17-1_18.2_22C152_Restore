@interface _CLFSettingsObserver
- (CLFBaseSettings)settings;
- (SEL)settingsSelector;
- (_CLFSettingsObserver)initWithSettings:(id)a3 settingsSelector:(SEL)a4;
- (void)invalidate;
- (void)setSettings:(id)a3;
- (void)setSettingsSelector:(SEL)a3;
@end

@implementation _CLFSettingsObserver

- (_CLFSettingsObserver)initWithSettings:(id)a3 settingsSelector:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CLFSettingsObserver;
  v7 = [(_CLFSettingsObserver *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_settings, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_settingsSelector = v9;
  }

  return v8;
}

- (void)invalidate
{
  id v5 = [(_CLFSettingsObserver *)self settings];
  v3 = [(_CLFSettingsObserver *)self settingsSelector];
  v4 = [NSNumber numberWithUnsignedLongLong:self];
  [v5 unregisterUpdateBlockForRetrieveSelector:v3 withListenerID:v4];
}

- (CLFBaseSettings)settings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settings);
  return (CLFBaseSettings *)WeakRetained;
}

- (void)setSettings:(id)a3
{
}

- (SEL)settingsSelector
{
  if (self->_settingsSelector) {
    return self->_settingsSelector;
  }
  else {
    return 0;
  }
}

- (void)setSettingsSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_settingsSelector = v3;
}

- (void).cxx_destruct
{
}

@end