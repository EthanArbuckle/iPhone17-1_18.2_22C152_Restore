@interface AXSSSystemLocale
- (AXSSSystemLocale)init;
- (AXSSSystemLocale)initWithPreferredLanguages:(id)a3;
- (NSArray)preferredLanguages;
- (void)setPreferredLanguages:(id)a3;
@end

@implementation AXSSSystemLocale

- (AXSSSystemLocale)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXSSSystemLocale;
  return [(AXSSSystemLocale *)&v3 init];
}

- (AXSSSystemLocale)initWithPreferredLanguages:(id)a3
{
  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)AXSSSystemLocale;
  v5 = [(AXSSSystemLocale *)&v8 init];
  preferredLanguages = v5->_preferredLanguages;
  v5->_preferredLanguages = v4;

  return v5;
}

- (NSArray)preferredLanguages
{
  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages)
  {
    objc_super v3 = preferredLanguages;
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  }

  return v3;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end