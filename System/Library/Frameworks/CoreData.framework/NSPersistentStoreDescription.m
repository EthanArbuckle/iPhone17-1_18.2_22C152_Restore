@interface NSPersistentStoreDescription
+ (NSPersistentStoreDescription)persistentStoreDescriptionWithURL:(NSURL *)URL;
+ (id)inMemoryPersistentStoreDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)shouldAddStoreAsynchronously;
- (BOOL)shouldInferMappingModelAutomatically;
- (BOOL)shouldInvokeCompletionHandlerConcurrently;
- (BOOL)shouldMigrateStoreAutomatically;
- (BOOL)usesPersistentHistoryTracking;
- (NSDictionary)options;
- (NSDictionary)sqlitePragmas;
- (NSPersistentCloudKitContainerOptions)cloudKitContainerOptions;
- (NSPersistentStoreDescription)init;
- (NSPersistentStoreDescription)initWithURL:(NSURL *)url;
- (NSString)configuration;
- (NSString)type;
- (NSTimeInterval)timeout;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mirroringDelegate;
- (id)mirroringOptions;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCloudKitContainerOptions:(NSPersistentCloudKitContainerOptions *)cloudKitContainerOptions;
- (void)setConfiguration:(NSString *)configuration;
- (void)setMirroringDelegate:(id)a3;
- (void)setOption:(NSObject *)option forKey:(NSString *)key;
- (void)setOption:(id)a3 forMirroringKey:(id)a4;
- (void)setReadOnly:(BOOL)readOnly;
- (void)setShouldAddStoreAsynchronously:(BOOL)shouldAddStoreAsynchronously;
- (void)setShouldInferMappingModelAutomatically:(BOOL)shouldInferMappingModelAutomatically;
- (void)setShouldInvokeCompletionHandlerConcurrently:(BOOL)a3;
- (void)setShouldMigrateStoreAutomatically:(BOOL)shouldMigrateStoreAutomatically;
- (void)setTimeout:(NSTimeInterval)timeout;
- (void)setType:(NSString *)type;
- (void)setURL:(NSURL *)URL;
- (void)setUsesPersistentHistoryTracking:(BOOL)a3;
- (void)setValue:(NSObject *)value forPragmaNamed:(NSString *)name;
@end

@implementation NSPersistentStoreDescription

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStoreDescription;
  return (id)[NSString stringWithFormat:@"%@ (type: %@, url: %@)", -[NSPersistentStoreDescription description](&v3, sel_description), -[NSPersistentStoreDescription type](self, "type"), -[NSPersistentStoreDescription URL](self, "URL")];
}

- (void)setConfiguration:(NSString *)configuration
{
}

- (void)setShouldInferMappingModelAutomatically:(BOOL)shouldInferMappingModelAutomatically
{
  uint64_t v4 = [NSNumber numberWithBool:shouldInferMappingModelAutomatically];

  [(NSPersistentStoreDescription *)self setOption:v4 forKey:@"NSInferMappingModelAutomaticallyOption"];
}

- (void)setShouldAddStoreAsynchronously:(BOOL)shouldAddStoreAsynchronously
{
  uint64_t v4 = [NSNumber numberWithBool:shouldAddStoreAsynchronously];

  [(NSPersistentStoreDescription *)self setOption:v4 forKey:@"NSAddStoreAsynchronouslyOption"];
}

- (void)setType:(NSString *)type
{
}

- (void)setURL:(NSURL *)URL
{
}

- (void)setValue:(NSObject *)value forPragmaNamed:(NSString *)name
{
  id v7 = (id)[(NSDictionary *)[(NSPersistentStoreDescription *)self sqlitePragmas] mutableCopy];
  if (value) {
    [v7 setObject:value forKey:name];
  }
  else {
    [v7 removeObjectForKey:name];
  }
  -[NSPersistentStoreDescription setOption:forKey:](self, "setOption:forKey:", (id)[v7 copy], @"NSSQLitePragmasOption");
}

- (void)setOption:(NSObject *)option forKey:(NSString *)key
{
  options = self->_options;
  if (option) {
    [(NSMutableDictionary *)options setObject:option forKey:key];
  }
  else {
    [(NSMutableDictionary *)options removeObjectForKey:key];
  }
}

- (NSDictionary)sqlitePragmas
{
  result = (NSDictionary *)[(NSMutableDictionary *)self->_options objectForKey:@"NSSQLitePragmasOption"];
  if (!result) {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return result;
}

- (BOOL)shouldAddStoreAsynchronously
{
  v2 = (void *)[(NSMutableDictionary *)self->_options objectForKey:@"NSAddStoreAsynchronouslyOption"];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (void)dealloc
{
  type = self->_type;
  if (type) {

  }
  configuration = self->_configuration;
  if (configuration) {

  }
  url = self->_url;
  if (url) {

  }
  options = self->_options;
  if (options) {

  }
  v7.receiver = self;
  v7.super_class = (Class)NSPersistentStoreDescription;
  [(NSPersistentStoreDescription *)&v7 dealloc];
}

- (NSDictionary)options
{
  v2 = (void *)[(NSMutableDictionary *)self->_options copy];

  return (NSDictionary *)v2;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)shouldInvokeCompletionHandlerConcurrently
{
  v2 = (void *)[(NSMutableDictionary *)self->_options objectForKey:@"NSInvokeCompletionHandlerConcurrently"];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (NSString)configuration
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSPersistentCloudKitContainerOptions)cloudKitContainerOptions
{
  v2 = [(NSPersistentStoreDescription *)self options];

  return (NSPersistentCloudKitContainerOptions *)[(NSDictionary *)v2 objectForKey:@"NSPersistentCloudKitContainerOptionsKey"];
}

- (id)mirroringOptions
{
  id result = (id)[(NSMutableDictionary *)self->_options objectForKey:@"NSPersistentStoreMirroringOptionsKey"];
  if (!result)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F1C9E8];
    return (id)[v3 dictionary];
  }
  return result;
}

+ (NSPersistentStoreDescription)persistentStoreDescriptionWithURL:(NSURL *)URL
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithURL:URL];

  return (NSPersistentStoreDescription *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)[objc_alloc((Class)objc_opt_class()) initWithURL:self->_url];

  v4[3] = (id)[(NSString *)self->_configuration copy];
  v4[2] = (id)[(NSString *)self->_type copy];

  v4[1] = (id)[(NSMutableDictionary *)self->_options mutableCopy];
  return v4;
}

- (NSPersistentStoreDescription)initWithURL:(NSURL *)url
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSPersistentStoreDescription;
  uint64_t v4 = [(NSPersistentStoreDescription *)&v6 init];
  if (v4)
  {
    v4->_url = (NSURL *)[(NSURL *)url copy];
    v4->_type = (NSString *)@"SQLite";
    v7[0] = @"NSInferMappingModelAutomaticallyOption";
    v7[1] = @"NSMigratePersistentStoresAutomaticallyOption";
    v8[0] = MEMORY[0x1E4F1CC38];
    v8[1] = MEMORY[0x1E4F1CC38];
    v4->_options = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, v7, 2), "mutableCopy");
  }
  return v4;
}

- (NSPersistentStoreDescription)init
{
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/dev/null" isDirectory:0];

  return [(NSPersistentStoreDescription *)self initWithURL:v3];
}

- (void)setShouldMigrateStoreAutomatically:(BOOL)shouldMigrateStoreAutomatically
{
  uint64_t v4 = [NSNumber numberWithBool:shouldMigrateStoreAutomatically];

  [(NSPersistentStoreDescription *)self setOption:v4 forKey:@"NSMigratePersistentStoresAutomaticallyOption"];
}

- (void)setReadOnly:(BOOL)readOnly
{
  uint64_t v4 = [NSNumber numberWithBool:readOnly];

  [(NSPersistentStoreDescription *)self setOption:v4 forKey:@"NSReadOnlyPersistentStoreOption"];
}

- (void)setCloudKitContainerOptions:(NSPersistentCloudKitContainerOptions *)cloudKitContainerOptions
{
}

+ (id)inMemoryPersistentStoreDescription
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setType:@"SQLite"];
  objc_msgSend(v2, "setURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", @"/dev/null", 0));

  return v2;
}

- (BOOL)isReadOnly
{
  id v2 = (void *)[(NSMutableDictionary *)self->_options objectForKey:@"NSReadOnlyPersistentStoreOption"];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (NSTimeInterval)timeout
{
  id v2 = (void *)[(NSMutableDictionary *)self->_options objectForKey:@"NSPersistentStoreTimeoutOption"];
  if (!v2) {
    return 240.0;
  }

  [v2 doubleValue];
  return result;
}

- (void)setTimeout:(NSTimeInterval)timeout
{
  uint64_t v4 = [NSNumber numberWithDouble:timeout];

  [(NSPersistentStoreDescription *)self setOption:v4 forKey:@"NSPersistentStoreTimeoutOption"];
}

- (void)setShouldInvokeCompletionHandlerConcurrently:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(NSPersistentStoreDescription *)self setOption:v4 forKey:@"NSInvokeCompletionHandlerConcurrently"];
}

- (BOOL)shouldMigrateStoreAutomatically
{
  id v2 = (void *)[(NSMutableDictionary *)self->_options objectForKey:@"NSMigratePersistentStoresAutomaticallyOption"];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (BOOL)shouldInferMappingModelAutomatically
{
  id v2 = (void *)[(NSMutableDictionary *)self->_options objectForKey:@"NSInferMappingModelAutomaticallyOption"];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (unint64_t)hash
{
  id v2 = standardizedURL([(NSPersistentStoreDescription *)self URL]);

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = standardizedURL([(NSPersistentStoreDescription *)self URL]);
      objc_super v6 = standardizedURL((void *)[a3 URL]);
      if (v5 == v6 || (int v7 = [v5 isEqual:v6]) != 0)
      {
        v8 = [(NSPersistentStoreDescription *)self type];
        if (v8 == (NSString *)[a3 type]
          || (int v7 = -[NSString isEqualToString:](-[NSPersistentStoreDescription type](self, "type"), "isEqualToString:", [a3 type])) != 0)
        {
          v9 = [(NSPersistentStoreDescription *)self configuration];
          if (v9 == (NSString *)[a3 configuration]
            || (int v7 = -[NSString isEqual:](-[NSPersistentStoreDescription configuration](self, "configuration"), "isEqual:", [a3 configuration])) != 0)
          {
            v10 = [(NSPersistentStoreDescription *)self options];
            uint64_t v11 = [a3 options];
            LOBYTE(v7) = [(NSDictionary *)v10 isEqual:v11];
          }
        }
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)setMirroringDelegate:(id)a3
{
}

- (id)mirroringDelegate
{
  id v2 = [(NSPersistentStoreDescription *)self mirroringOptions];

  return (id)[v2 objectForKey:@"NSPersistentStoreMirroringDelegateOptionKey"];
}

- (void)setOption:(id)a3 forMirroringKey:(id)a4
{
  id v7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"NSPersistentStoreMirroringOptionsKey"), "mutableCopy");
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (a3) {
    [v7 setObject:a3 forKey:a4];
  }
  else {
    [v7 removeObjectForKey:a4];
  }
  id v8 = (id)[v7 copy];
  [(NSMutableDictionary *)self->_options setObject:v8 forKey:@"NSPersistentStoreMirroringOptionsKey"];
}

- (BOOL)usesPersistentHistoryTracking
{
  id v2 = (void *)[(NSMutableDictionary *)self->_options objectForKey:@"NSPersistentHistoryTrackingKey"];
  if (v2)
  {
    uint64_t v3 = v2;
    if ([v2 isNSDictionary])
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      LODWORD(v2) = [v3 isNSNumber];
      if (v2)
      {
        LOBYTE(v2) = [v3 BOOLValue];
      }
    }
  }
  return (char)v2;
}

- (void)setUsesPersistentHistoryTracking:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(NSPersistentStoreDescription *)self setOption:v4 forKey:@"NSPersistentHistoryTrackingKey"];
}

@end