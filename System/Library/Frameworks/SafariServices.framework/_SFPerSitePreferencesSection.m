@interface _SFPerSitePreferencesSection
- (NSArray)preferences;
- (NSString)title;
- (_SFPerSitePreferencesSection)initWithTitle:(id)a3 preferences:(id)a4;
@end

@implementation _SFPerSitePreferencesSection

- (_SFPerSitePreferencesSection)initWithTitle:(id)a3 preferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFPerSitePreferencesSection;
  v8 = [(_SFPerSitePreferencesSection *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    preferences = v8->_preferences;
    v8->_preferences = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end