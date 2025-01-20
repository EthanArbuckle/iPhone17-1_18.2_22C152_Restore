@interface IPLocaleCoder
+ (id)localePreferenceKeysAndClasses;
+ (id)localeWithPreferences:(id)a3;
- (IPLocaleCoder)initWithDictionary:(id)a3;
- (IPLocaleCoder)initWithLocaleIdentifier:(id)a3;
- (NSMutableDictionary)mutablePreferences;
- (NSString)languageIdentifier;
- (NSString)localeIdentifier;
- (id)locale;
- (id)preferences;
- (void)setLanguageIdentifier:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setMutablePreferences:(id)a3;
@end

@implementation IPLocaleCoder

+ (id)localePreferenceKeysAndClasses
{
  v2 = (void *)qword_100008AB0;
  if (!qword_100008AB0)
  {
    CFStringRef v6 = @"AppleLocale";
    uint64_t v7 = objc_opt_class();
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    v4 = (void *)qword_100008AB0;
    qword_100008AB0 = v3;

    v2 = (void *)qword_100008AB0;
  }

  return v2;
}

+ (id)localeWithPreferences:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"AppleLocale"];
  if (!qword_100008AB8)
  {
    v5 = +[NSMutableDictionary dictionary];
    CFStringRef v6 = [(id)objc_opt_class() localePreferenceKeysAndClasses];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000137C;
    v13[3] = &unk_1000041F8;
    id v14 = v5;
    id v7 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];

    id v8 = [v7 copy];
    v9 = (void *)qword_100008AB8;
    qword_100008AB8 = (uint64_t)v8;
  }
  v10 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  [v10 setValuesForKeysWithDictionary:v3];

  v11 = (void *)_CFLocaleCopyAsIfCurrentWithOverrides();

  return v11;
}

- (IPLocaleCoder)initWithLocaleIdentifier:(id)a3
{
  CFStringRef v8 = @"AppleLocale";
  id v9 = a3;
  id v4 = a3;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  CFStringRef v6 = [(IPLocaleCoder *)self initWithDictionary:v5];
  return v6;
}

- (IPLocaleCoder)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPLocaleCoder;
  v5 = [(IPLocaleCoder *)&v8 init];
  if (v5)
  {
    CFStringRef v6 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    [(IPLocaleCoder *)v5 setMutablePreferences:v6];
  }
  return v5;
}

- (void)setLocaleIdentifier:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"*** setLocaleIdentifier: object cannot be nil" userInfo:0];
    [v4 raise];
  }
  [(IPLocaleCoder *)self willChangeValueForKey:@"localeIdentifier"];
  v5 = [(IPLocaleCoder *)self mutablePreferences];
  CFStringRef v6 = +[NSLocale canonicalLocaleIdentifierFromString:v7];
  [v5 setObject:v6 forKey:@"AppleLocale"];

  [(IPLocaleCoder *)self didChangeValueForKey:@"localeIdentifier"];
}

- (NSString)localeIdentifier
{
  v2 = [(IPLocaleCoder *)self mutablePreferences];
  id v3 = [v2 objectForKey:@"AppleLocale"];
  id v4 = +[NSLocale canonicalLocaleIdentifierFromString:v3];

  return (NSString *)v4;
}

- (void)setLanguageIdentifier:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"*** setLanguageIdentifier: object cannot be nil" userInfo:0];
    [v4 raise];
  }
  [(IPLocaleCoder *)self willChangeValueForKey:@"languageIdentifier"];
  v5 = +[NSLocale componentsFromLocaleIdentifier:v12];
  CFStringRef v6 = [v5 objectForKey:NSLocaleLanguageCode];
  id v7 = [v5 objectForKey:NSLocaleScriptCode];
  objc_super v8 = [(IPLocaleCoder *)self localeIdentifier];
  id v9 = +[NSLocale componentsFromLocaleIdentifier:v8];
  id v10 = [v9 mutableCopy];

  [v10 setObject:v6 forKey:NSLocaleLanguageCode];
  if (v7) {
    [v10 setObject:v7 forKey:NSLocaleScriptCode];
  }
  else {
    [v10 removeObjectForKey:NSLocaleScriptCode];
  }
  v11 = +[NSLocale localeIdentifierFromComponents:v10];
  [(IPLocaleCoder *)self setLocaleIdentifier:v11];

  [(IPLocaleCoder *)self didChangeValueForKey:@"languageIdentifier"];
}

- (id)preferences
{
  v2 = [(IPLocaleCoder *)self mutablePreferences];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (id)locale
{
  id v3 = objc_opt_class();
  id v4 = [(IPLocaleCoder *)self preferences];
  v5 = [v3 localeWithPreferences:v4];

  return v5;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (NSMutableDictionary)mutablePreferences
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMutablePreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePreferences, 0);

  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

@end