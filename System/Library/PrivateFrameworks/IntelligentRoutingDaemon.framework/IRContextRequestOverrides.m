@interface IRContextRequestOverrides
- (BOOL)overrideAppInFocusWindow;
- (IRContextRequestOverrides)initWithOverrideAppInFocusWindow:(BOOL)a3 overrideBundleId:(id)a4;
- (NSString)overrideBundleId;
- (void)setOverrideAppInFocusWindow:(BOOL)a3;
- (void)setOverrideBundleId:(id)a3;
@end

@implementation IRContextRequestOverrides

- (IRContextRequestOverrides)initWithOverrideAppInFocusWindow:(BOOL)a3 overrideBundleId:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IRContextRequestOverrides;
  v7 = [(IRContextRequestOverrides *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(IRContextRequestOverrides *)v7 setOverrideBundleId:v6];
    [(IRContextRequestOverrides *)v8 setOverrideAppInFocusWindow:v4];
  }

  return v8;
}

- (BOOL)overrideAppInFocusWindow
{
  return self->_overrideAppInFocusWindow;
}

- (void)setOverrideAppInFocusWindow:(BOOL)a3
{
  self->_overrideAppInFocusWindow = a3;
}

- (NSString)overrideBundleId
{
  return self->_overrideBundleId;
}

- (void)setOverrideBundleId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end