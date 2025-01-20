@interface _GCFLocalizedString
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (_GCFLocalizedString)initWithCoder:(id)a3;
- (_GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4 table:(id)a5 locale:(id)a6;
- (id)_realizedString;
- (id)bundle;
- (id)key;
- (id)table;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCFLocalizedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4 table:(id)a5 locale:(id)a6
{
  if (!a3) {
    return 0;
  }
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v9 key];
    id v9 = v11;
    if (a4)
    {
      if (a5) {
        goto LABEL_5;
      }
LABEL_14:
      a5 = (id)[v9 table];
      if (!a4) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
    a4 = (id)[v11 bundle];
    if (!a5) {
      goto LABEL_14;
    }
  }
LABEL_5:
  if (!a4)
  {
LABEL_6:
    uint64_t v12 = [v9 UTF8String];
    uint64_t v13 = dyld_image_path_containing_address();
    if (!v13
      || (a4 = +[NSBundle gc_bundleForExecutableAtPath:](NSBundle_0, "gc_bundleForExecutableAtPath:", +[NSString stringWithCString:v13 encoding:4])) == 0)
    {
      if (_gc_log_localizedstring_onceToken != -1) {
        dispatch_once(&_gc_log_localizedstring_onceToken, &__block_literal_global_3);
      }
      v14 = _gc_log_localizedstring_Log;
      if (os_log_type_enabled((os_log_t)_gc_log_localizedstring_Log, OS_LOG_TYPE_DEBUG)) {
        -[_GCFLocalizedString initWithKey:sourceBundle:table:locale:]((uint64_t)v9, v12, v14);
      }
      a4 = 0;
    }
  }
LABEL_15:
  self->_key = (NSString *)[v9 copy];
  self->_sourceBundle = (NSBundle *)a4;
  self->_localizationTable = (NSString *)[a5 copy];
  self->_localeOverride = (NSLocale *)[a6 copy];
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_GCFLocalizedString;
  [(_GCFLocalizedString *)&v3 dealloc];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_GCFLocalizedString)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bundle"];
    v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"table"];
    uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
  }
  else
  {
    v5 = (void *)[a3 decodeObject];
    v6 = (void *)[a3 decodeObject];
    v7 = (void *)[a3 decodeObject];
    uint64_t v8 = [a3 decodeObject];
  }
  id v9 = (void *)v8;
  v10 = +[NSBundle bundleWithURL:v6];
  v11 = v10;
  if (v6 && !v10)
  {
    if (_gc_log_localizedstring_onceToken != -1) {
      dispatch_once(&_gc_log_localizedstring_onceToken, &__block_literal_global_3);
    }
    uint64_t v13 = _gc_log_localizedstring_Log;
    if (os_log_type_enabled((os_log_t)_gc_log_localizedstring_Log, OS_LOG_TYPE_FAULT)) {
      [(_GCFLocalizedString *)(uint64_t)v5 initWithCoder:v13];
    }
  }
  self->_key = (NSString *)[v5 copy];
  self->_sourceBundle = v11;
  self->_localizationTable = (NSString *)[v7 copy];
  self->_localeOverride = (NSLocale *)[v9 copy];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int v5 = [a3 allowsKeyedCoding];
  key = self->_key;
  if (v5)
  {
    [a3 encodeObject:key forKey:@"key"];
    objc_msgSend(a3, "encodeObject:forKey:", -[NSBundle bundleURL](self->_sourceBundle, "bundleURL"), @"bundle");
    [a3 encodeObject:self->_localizationTable forKey:@"table"];
    localeOverride = self->_localeOverride;
    [a3 encodeObject:localeOverride forKey:@"locale"];
  }
  else
  {
    [a3 encodeObject:key];
    objc_msgSend(a3, "encodeObject:", -[NSBundle bundleURL](self->_sourceBundle, "bundleURL"));
    [a3 encodeObject:self->_localizationTable];
    uint64_t v8 = self->_localeOverride;
    [a3 encodeObject:v8];
  }
}

- (id)key
{
  return self->_key;
}

- (id)bundle
{
  return self->_sourceBundle;
}

- (id)table
{
  return self->_localizationTable;
}

- (id)_realizedString
{
  realizedString = self->__realizedString;
  if (!realizedString)
  {
    objc_sync_enter(self);
    realizedString = self->__realizedString;
    if (!realizedString)
    {
      if (self->_sourceBundle && [(NSString *)self->_key length]) {
        realizedString = (NSString *)[(NSBundle *)self->_sourceBundle localizedStringForKey:self->_key value:&stru_26BED82A0 table:self->_localizationTable localization:[(NSLocale *)self->_localeOverride languageCode]];
      }
      else {
        realizedString = self->_key;
      }
      self->__realizedString = (NSString *)[(NSString *)realizedString copy];
    }
    objc_sync_exit(self);
  }
  return realizedString;
}

- (void)initWithKey:(os_log_t)log sourceBundle:table:locale:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_20AD04000, log, OS_LOG_TYPE_DEBUG, "#WARNING Could not determine source bundle of string '%@' %p %p.", (uint8_t *)&v3, 0x20u);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = [a2 path];
  _os_log_fault_impl(&dword_20AD04000, a3, OS_LOG_TYPE_FAULT, "Failed to load source bundle for key '%@' at %{public}@.", (uint8_t *)&v4, 0x16u);
}

@end