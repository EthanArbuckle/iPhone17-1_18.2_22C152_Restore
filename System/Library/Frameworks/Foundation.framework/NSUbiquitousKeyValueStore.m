@interface NSUbiquitousKeyValueStore
+ (NSUbiquitousKeyValueStore)defaultStore;
+ (id)additionalStoreWithIdentifier:(id)a3;
- (BOOL)BOOLForKey:(NSString *)aKey;
- (BOOL)synchronize;
- (NSArray)arrayForKey:(NSString *)aKey;
- (NSData)dataForKey:(NSString *)aKey;
- (NSDictionary)dictionaryForKey:(NSString *)aKey;
- (NSDictionary)dictionaryRepresentation;
- (NSString)stringForKey:(NSString *)aKey;
- (NSUbiquitousKeyValueStore)init;
- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3;
- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4;
- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4 additionalStore:(BOOL)a5;
- (NSUbiquitousKeyValueStore)initWithStoreIdentifier:(id)a3 type:(int64_t)a4;
- (double)doubleForKey:(NSString *)aKey;
- (id)_initWithStoreIdentifier:(id)a3 usingEndToEndEncryption:(BOOL)a4;
- (id)_remotePreferencesSource;
- (id)objectForKey:(NSString *)aKey;
- (uint64_t)longLongForKey:(NSString *)aKey;
- (unint64_t)maximumDataLengthPerKey;
- (unint64_t)maximumKeyCount;
- (unint64_t)maximumKeyLength;
- (unint64_t)maximumTotalDataLength;
- (void)_sourceDidChangePassthroughNotification:(id)a3;
- (void)dealloc;
- (void)removeObjectForKey:(NSString *)aKey;
- (void)setArray:(NSArray *)anArray forKey:(NSString *)aKey;
- (void)setBool:(BOOL)value forKey:(NSString *)aKey;
- (void)setData:(NSData *)aData forKey:(NSString *)aKey;
- (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey;
- (void)setDouble:(double)value forKey:(NSString *)aKey;
- (void)setLongLong:(uint64_t)value forKey:(NSString *)aKey;
- (void)setObject:(id)anObject forKey:(NSString *)aKey;
- (void)setString:(NSString *)aString forKey:(NSString *)aKey;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation NSUbiquitousKeyValueStore

void __58__NSUbiquitousKeyValueStore_initWithStoreIdentifier_type___block_invoke()
{
  if (dlopen((const char *)[@"/System/Library/PrivateFrameworks/SyncedDefaults.framework/SyncedDefaults" fileSystemRepresentation], 256))
  {
    qword_1EB1EDE70 = (uint64_t)objc_lookUpClass("SYDClientToDaemonConnection");
  }
  else
  {
    v0 = dlerror();
    NSLog((NSString *)@"NSUbiquitousKeyValueStore is unavailable: %s.", v0);
  }
}

- (BOOL)BOOLForKey:(NSString *)aKey
{
  id v3 = [(NSUbiquitousKeyValueStore *)self objectForKey:aKey];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  if (_NSIsNSString())
  {
    if ([v4 isEqual:@"YES"]) {
      return 1;
    }
    uint64_t v7 = [v4 length];
    BOOL v5 = 1;
    if (objc_msgSend(v4, "compare:options:range:", @"YES", 1, 0, v7))
    {
      BOOL v5 = 1;
      if (objc_msgSend(v4, "compare:options:range:", @"Y", 1, 0, v7)) {
        return [v4 integerValue] != 0;
      }
    }
    return v5;
  }
  if (!_NSIsNSNumber()) {
    return 0;
  }

  return [v4 BOOLValue];
}

- (id)objectForKey:(NSString *)aKey
{
  return (id)[(SYDClientToDaemonConnection *)self->_source objectForKey:aKey];
}

+ (id)additionalStoreWithIdentifier:(id)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:0 storeIdentifier:a3 additionalStore:1];

  return v3;
}

NSUbiquitousKeyValueStore *__41__NSUbiquitousKeyValueStore_defaultStore__block_invoke()
{
  result = objc_alloc_init(NSUbiquitousKeyValueStore);
  qword_1EB1EDE68 = (uint64_t)result;
  return result;
}

- (NSUbiquitousKeyValueStore)initWithStoreIdentifier:(id)a3 type:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSUbiquitousKeyValueStore;
  v6 = [(NSUbiquitousKeyValueStore *)&v10 init];
  if (!v6) {
    return v6;
  }
  if (qword_1EB1EDE78 != -1) {
    dispatch_once(&qword_1EB1EDE78, &__block_literal_global_9_0);
  }
  if (!qword_1EB1EDE70)
  {

    return 0;
  }
  if (![(id)qword_1EB1EDE70 instancesRespondToSelector:sel_initWithStoreIdentifier_type_])
  {
    NSLog((NSString *)@"Unable to find initializer for SYDClientToDaemonConnection");
    if (!v6->_source) {
      return v6;
    }
LABEL_12:
    v8 = +[NSNotificationCenter defaultCenter];
    -[NSNotificationCenter addObserver:selector:name:object:](v8, "addObserver:selector:name:object:", v6, sel__sourceDidChangePassthroughNotification_, [(id)qword_1EB1EDE70 SYDUbiquitousKeyValueStoreDidChangeExternallyNotification], v6->_source);
    return v6;
  }
  if ((unint64_t)(a4 - 1) >= 3) {
    a4 = 0;
  }
  uint64_t v7 = [objc_alloc((Class)qword_1EB1EDE70) initWithStoreIdentifier:a3 type:a4];
  v6->_source = (SYDClientToDaemonConnection *)v7;
  if (v7) {
    goto LABEL_12;
  }
  return v6;
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4 additionalStore:(BOOL)a5
{
  return -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:](self, "initWithStoreIdentifier:type:", a4, 0, a5);
}

- (NSUbiquitousKeyValueStore)init
{
  return [(NSUbiquitousKeyValueStore *)self initWithBundleIdentifier:0];
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4
{
  return [(NSUbiquitousKeyValueStore *)self initWithBundleIdentifier:a3 storeIdentifier:a4 additionalStore:0];
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3
{
  return [(NSUbiquitousKeyValueStore *)self initWithBundleIdentifier:a3 storeIdentifier:0];
}

- (BOOL)synchronize
{
  return [(SYDClientToDaemonConnection *)self->_source synchronize] != 0;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)[(SYDClientToDaemonConnection *)self->_source dictionaryRepresentation];
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
}

+ (NSUbiquitousKeyValueStore)defaultStore
{
  if (_MergedGlobals_151 != -1) {
    dispatch_once(&_MergedGlobals_151, &__block_literal_global_82);
  }
  return (NSUbiquitousKeyValueStore *)qword_1EB1EDE68;
}

- (NSArray)arrayForKey:(NSString *)aKey
{
  result = [(NSUbiquitousKeyValueStore *)self objectForKey:aKey];
  if (result)
  {
    v4 = result;
    if (_NSIsNSArray()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)_initWithStoreIdentifier:(id)a3 usingEndToEndEncryption:(BOOL)a4
{
  return [(NSUbiquitousKeyValueStore *)self initWithStoreIdentifier:a3 type:a4];
}

- (NSDictionary)dictionaryForKey:(NSString *)aKey
{
  result = [(NSUbiquitousKeyValueStore *)self objectForKey:aKey];
  if (result)
  {
    v4 = result;
    if (_NSIsNSDictionary()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSUbiquitousKeyValueStore;
  [(NSUbiquitousKeyValueStore *)&v3 dealloc];
}

- (void)setObject:(id)anObject forKey:(NSString *)aKey
{
}

- (void)removeObjectForKey:(NSString *)aKey
{
}

- (void)_sourceDidChangePassthroughNotification:(id)a3
{
  BOOL v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = [a3 userInfo];

  [(NSNotificationCenter *)v5 postNotificationName:@"NSUbiquitousKeyValueStoreDidChangeExternallyNotification" object:self userInfo:v6];
}

- (unint64_t)maximumKeyCount
{
  return [(SYDClientToDaemonConnection *)self->_source maximumKeyCount];
}

- (unint64_t)maximumKeyLength
{
  return [(SYDClientToDaemonConnection *)self->_source maximumKeyLength];
}

- (unint64_t)maximumDataLengthPerKey
{
  return [(SYDClientToDaemonConnection *)self->_source maximumDataLengthPerKey];
}

- (unint64_t)maximumTotalDataLength
{
  return [(SYDClientToDaemonConnection *)self->_source maximumTotalDataLength];
}

- (id)_remotePreferencesSource
{
  return self->_source;
}

- (NSString)stringForKey:(NSString *)aKey
{
  objc_super v3 = [(NSUbiquitousKeyValueStore *)self objectForKey:aKey];
  if (!v3 || (_NSIsNSString() & 1) != 0) {
    return v3;
  }
  if (!_NSIsNSNumber()) {
    return 0;
  }

  return (NSString *)[(NSString *)v3 stringValue];
}

- (void)setString:(NSString *)aString forKey:(NSString *)aKey
{
  if (aString && ([(NSString *)aString isNSString] & 1) == 0)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSString"), 0 reason userInfo];
    objc_exception_throw(v8);
  }

  [(NSUbiquitousKeyValueStore *)self setObject:aString forKey:aKey];
}

- (void)setArray:(NSArray *)anArray forKey:(NSString *)aKey
{
  if (anArray && ([(NSArray *)anArray isNSArray] & 1) == 0)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSArray"), 0 reason userInfo];
    objc_exception_throw(v8);
  }

  [(NSUbiquitousKeyValueStore *)self setObject:anArray forKey:aKey];
}

- (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey
{
  if (aDictionary && ([(NSDictionary *)aDictionary isNSDictionary] & 1) == 0)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSDictionary"), 0 reason userInfo];
    objc_exception_throw(v8);
  }

  [(NSUbiquitousKeyValueStore *)self setObject:aDictionary forKey:aKey];
}

- (NSData)dataForKey:(NSString *)aKey
{
  result = [(NSUbiquitousKeyValueStore *)self objectForKey:aKey];
  if (result)
  {
    uint64_t v4 = result;
    if (_NSIsNSData()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setData:(NSData *)aData forKey:(NSString *)aKey
{
  if (aData && ([(NSData *)aData isNSData] & 1) == 0)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSData"), 0 reason userInfo];
    objc_exception_throw(v8);
  }

  [(NSUbiquitousKeyValueStore *)self setObject:aData forKey:aKey];
}

- (uint64_t)longLongForKey:(NSString *)aKey
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = [(NSUbiquitousKeyValueStore *)self objectForKey:aKey];
  v6[0] = 0;
  if (result)
  {
    uint64_t v4 = (void *)result;
    if (_NSIsNSString())
    {
      unint64_t v5 = 0;
      if (_NSScanLongLongFromString(v4, +[NSCharacterSet whitespaceAndNewlineCharacterSet], v6, &v5))return v6[0]; {
      else
      }
        return 0;
    }
    else if (_NSIsNSNumber())
    {
      return [v4 longLongValue];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setLongLong:(uint64_t)value forKey:(NSString *)aKey
{
  uint64_t v6 = +[NSNumber numberWithLongLong:value];

  [(NSUbiquitousKeyValueStore *)self setObject:v6 forKey:aKey];
}

- (double)doubleForKey:(NSString *)aKey
{
  id v3 = [(NSUbiquitousKeyValueStore *)self objectForKey:aKey];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  if ((_NSIsNSString() & 1) == 0 && !_NSIsNSNumber()) {
    return 0.0;
  }

  [v4 doubleValue];
  return result;
}

- (void)setDouble:(double)value forKey:(NSString *)aKey
{
  uint64_t v6 = +[NSNumber numberWithDouble:value];

  [(NSUbiquitousKeyValueStore *)self setObject:v6 forKey:aKey];
}

- (void)setBool:(BOOL)value forKey:(NSString *)aKey
{
  uint64_t v6 = +[NSNumber numberWithBool:value];

  [(NSUbiquitousKeyValueStore *)self setObject:v6 forKey:aKey];
}

@end