@interface MapsSuggestionsRealAppProtectionApp
- (BOOL)isHidden;
- (BOOL)isLocked;
- (id)_initWithBundleID:(id)a3;
@end

@implementation MapsSuggestionsRealAppProtectionApp

- (void).cxx_destruct
{
}

- (BOOL)isLocked
{
  return [(APApplication *)self->_app isLocked];
}

- (BOOL)isHidden
{
  return [(APApplication *)self->_app isHidden];
}

- (id)_initWithBundleID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsRealAppProtectionApp;
  v5 = [(MapsSuggestionsRealAppProtectionApp *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v4];
    app = v5->_app;
    v5->_app = (APApplication *)v6;
  }
  return v5;
}

@end