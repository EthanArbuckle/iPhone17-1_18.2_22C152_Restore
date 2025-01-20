@interface _ICSearchContext
- (BOOL)isResponseContextDenylisted;
- (BOOL)shouldDisableAutoCaps;
- (NSArray)recipients;
- (NSString)applicationBundleIdentifier;
- (NSString)locale;
- (_ICSearchContext)initWithLocale:(id)a3 recipients:(id)a4 applicationBundleIdentifier:(id)a5 isResponseContextDenylisted:(BOOL)a6 shouldDisableAutoCaps:(BOOL)a7;
@end

@implementation _ICSearchContext

- (_ICSearchContext)initWithLocale:(id)a3 recipients:(id)a4 applicationBundleIdentifier:(id)a5 isResponseContextDenylisted:(BOOL)a6 shouldDisableAutoCaps:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_ICSearchContext;
  v16 = [(_ICSearchContext *)&v23 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_locale, a3);
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v14];
    recipients = v17->_recipients;
    v17->_recipients = (NSArray *)v18;

    uint64_t v20 = [v14 copy];
    v21 = v17->_recipients;
    v17->_recipients = (NSArray *)v20;

    objc_storeStrong((id *)&v17->_applicationBundleIdentifier, a5);
    v17->_isResponseContextDenylisted = a6;
    v17->_shouldDisableAutoCaps = a7;
  }

  return v17;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (BOOL)isResponseContextDenylisted
{
  return self->_isResponseContextDenylisted;
}

- (BOOL)shouldDisableAutoCaps
{
  return self->_shouldDisableAutoCaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end