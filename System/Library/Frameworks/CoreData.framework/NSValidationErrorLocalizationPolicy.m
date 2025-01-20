@interface NSValidationErrorLocalizationPolicy
- (NSValidationErrorLocalizationPolicy)initWithURL:(id)a3;
- (id)_cachedObjectForKey:(id)a3 value:(void *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizationDictionary;
- (id)localizedEntityNameForEntity:(id)a3;
- (id)localizedModelStringForKey:(id)a3;
- (id)localizedPropertyNameForProperty:(id)a3;
- (uint64_t)_localizedPropertyNameForProperty:(void *)a3 entity:;
- (void)_ensureFullLocalizationDictionaryIsLoaded;
- (void)dealloc;
- (void)setLocalizationDictionary:(id)a3;
@end

@implementation NSValidationErrorLocalizationPolicy

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = [(NSURL *)self->_url copy];
    v4[2] = self->_localizationBundle;
    v4[3] = [(NSString *)self->_modelStringsFileName copy];
    v4[4] = 0;
  }
  return v4;
}

- (NSValidationErrorLocalizationPolicy)initWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSValidationErrorLocalizationPolicy;
  v4 = [(NSValidationErrorLocalizationPolicy *)&v6 init];
  if (v4)
  {
    v4->_url = (NSURL *)a3;
    v4->_localizationBundle = 0;
    v4->_modelStringsFileName = 0;
    v4->_localizationDictionary = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSValidationErrorLocalizationPolicy;
  [(NSValidationErrorLocalizationPolicy *)&v3 dealloc];
}

- (void)_ensureFullLocalizationDictionaryIsLoaded
{
  if (!self->_hasSetLocalizationDictionary)
  {
    if (!self->_localizationDictionary) {
      self->_localizationDictionary = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
    }
    localizationBundle = self->_localizationBundle;
    if (localizationBundle) {
      goto LABEL_5;
    }
    url = self->_url;
    if (url)
    {
      v7 = [(NSString *)[(NSURL *)url path] stringByDeletingLastPathComponent];
      if ([[(NSString *)v7 lastPathComponent] isEqualToString:@"Contents"])
      {
        v7 = [(NSString *)v7 stringByDeletingLastPathComponent];
      }
      self->_localizationBundle = (NSBundle *)(id)[MEMORY[0x1E4F28B50] bundleWithPath:v7];
      v8 = [(NSString *)[(NSURL *)self->_url path] lastPathComponent];
      self->_modelStringsFileName = v8;
      v9 = [(NSString *)v8 stringByDeletingPathExtension];
      self->_modelStringsFileName = v9;
      v10 = [(NSString *)v9 stringByAppendingString:@"Model"];
      self->_modelStringsFileName = v10;
      v11 = v10;
      localizationBundle = self->_localizationBundle;
      if (localizationBundle)
      {
LABEL_5:
        uint64_t v4 = [(NSBundle *)localizationBundle pathForResource:self->_modelStringsFileName ofType:@"strings"];
        if (v4)
        {
          uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
          if (v5) {
            [(NSDictionary *)self->_localizationDictionary addEntriesFromDictionary:v5];
          }
        }
      }
    }
    self->_hasSetLocalizationDictionary = 1;
  }
}

- (id)_cachedObjectForKey:(id)a3 value:(void *)a4
{
  [(NSValidationErrorLocalizationPolicy *)self _ensureFullLocalizationDictionaryIsLoaded];
  id result = [(NSDictionary *)self->_localizationDictionary objectForKey:a3];
  if (!result)
  {
    if (self->_modelStringsFileName) {
      v8 = -[NSBundle localizedStringForKey:value:table:](self->_localizationBundle, "localizedStringForKey:value:table:", a3, a4);
    }
    else {
      v8 = 0;
    }
    id result = 0;
    if (v8) {
      a4 = v8;
    }
    if (a4)
    {
      if (a4 != a3)
      {
        [(NSDictionary *)self->_localizationDictionary setObject:a4 forKey:a3];
        return a4;
      }
    }
  }
  return result;
}

- (id)localizationDictionary
{
  v2 = (void *)[(NSDictionary *)self->_localizationDictionary copy];

  return v2;
}

- (void)setLocalizationDictionary:(id)a3
{
  localizationDictionary = self->_localizationDictionary;
  if (localizationDictionary != a3)
  {
    if (localizationDictionary) {
      -[NSDictionary addEntriesFromDictionary:](localizationDictionary, "addEntriesFromDictionary:");
    }
    else {
      self->_localizationDictionary = (NSDictionary *)[a3 mutableCopy];
    }
  }
  self->_hasSetLocalizationDictionary = 1;
}

- (id)localizedEntityNameForEntity:(id)a3
{
  uint64_t v4 = [a3 name];
  uint64_t v5 = [@"Entity/" stringByAppendingString:v4];

  return [(NSValidationErrorLocalizationPolicy *)self _cachedObjectForKey:v5 value:v4];
}

- (uint64_t)_localizedPropertyNameForProperty:(void *)a3 entity:
{
  uint64_t v3 = 0;
  if (a1 && a3)
  {
    uint64_t v7 = [a2 name];
    v8 = (void *)[@"Property/" mutableCopy];
    [v8 appendString:v7];
    [v8 appendString:@"/Entity/"];
    objc_msgSend(v8, "appendString:", objc_msgSend(a3, "name"));
    uint64_t v3 = [a1 _cachedObjectForKey:v8 value:0];
    if (!v3) {
      uint64_t v3 = -[NSValidationErrorLocalizationPolicy _localizedPropertyNameForProperty:entity:](a1, a2, [a3 superentity]);
    }
  }
  return v3;
}

- (id)localizedPropertyNameForProperty:(id)a3
{
  id result = (id)-[NSValidationErrorLocalizationPolicy _localizedPropertyNameForProperty:entity:](self, a3, (void *)[a3 entity]);
  if (!result)
  {
    uint64_t v6 = [a3 name];
    uint64_t v7 = [@"Property/" stringByAppendingString:v6];
    return [(NSValidationErrorLocalizationPolicy *)self _cachedObjectForKey:v7 value:v6];
  }
  return result;
}

- (id)localizedModelStringForKey:(id)a3
{
  uint64_t v5 = objc_msgSend(@"ErrorString/", "stringByAppendingString:");

  return [(NSValidationErrorLocalizationPolicy *)self _cachedObjectForKey:v5 value:a3];
}

@end