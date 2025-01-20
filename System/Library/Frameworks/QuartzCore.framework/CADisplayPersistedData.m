@interface CADisplayPersistedData
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
+ (id)supportedClasses;
- (CADisplayPersistedData)init;
- (CADisplayPersistedData)initWithCoder:(id)a3;
- (Mode)preferredModeForUUID:(id)a3;
- (NSMutableArray)latencies;
- (NSMutableArray)preferredModes;
- (NSString)version;
- (double)latencyForUUID:(id)a3 andMode:(Mode)a4;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setLatencies:(id)a3;
- (void)setLatency:(double)a3 forUUID:(id)a4 andMode:(Mode)a5;
- (void)setPreferredMode:(Mode)a3 forUUID:(id)a4;
- (void)setPreferredModes:(id)a3;
- (void)setVersion:(id)a3;
- (void)update;
@end

@implementation CADisplayPersistedData

- (void)setPreferredModes:(id)a3
{
}

- (NSMutableArray)preferredModes
{
  return self->_preferredModes;
}

- (void)setLatencies:(id)a3
{
}

- (NSMutableArray)latencies
{
  return self->_latencies;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x185324A30](self, a2);
  if (self->_version)
  {
    [a3 encodeObject:MEMORY[0x1E4F1CC38] forKey:@"hasVersion"];
    [a3 encodeObject:self->_version forKey:@"version"];
  }
  else
  {
    [a3 encodeObject:MEMORY[0x1E4F1CC28] forKey:@"hasVersion"];
  }
  latencies = self->_latencies;
  if (latencies && [(NSMutableArray *)latencies count])
  {
    [a3 encodeObject:MEMORY[0x1E4F1CC38] forKey:@"hasLatencies"];
    objc_msgSend(a3, "encodeObject:forKey:", (id)-[NSMutableArray copy](self->_latencies, "copy"), @"latencies");
  }
  else
  {
    [a3 encodeObject:MEMORY[0x1E4F1CC28] forKey:@"hasLatencies"];
  }
  preferredModes = self->_preferredModes;
  if (preferredModes && [(NSMutableArray *)preferredModes count])
  {
    [a3 encodeObject:MEMORY[0x1E4F1CC38] forKey:@"hasPreferredModes"];
    objc_msgSend(a3, "encodeObject:forKey:", (id)-[NSMutableArray copy](self->_preferredModes, "copy"), @"preferredModes");
  }
  else
  {
    [a3 encodeObject:MEMORY[0x1E4F1CC28] forKey:@"hasPreferredModes"];
  }
}

- (CADisplayPersistedData)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CADisplayPersistedData;
  v4 = [(CADisplayPersistedData *)&v8 init];
  if (v4)
  {
    v4->_version = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    v5 = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[CADisplayPersistedData supportedClasses](CADisplayPersistedData, "supportedClasses"), @"latencies");
    v4->_latencies = v5;
    if (!v5) {
      v4->_latencies = (NSMutableArray *)objc_opt_new();
    }
    v6 = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[CADisplayPersistedData supportedClasses](CADisplayPersistedData, "supportedClasses"), @"preferredModes");
    v4->_preferredModes = v6;
    if (!v6) {
      v4->_preferredModes = (NSMutableArray *)objc_opt_new();
    }
  }
  return v4;
}

- (void)save
{
  v2 = (const void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  if (v2)
  {
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
    CFPreferencesSetAppValue(@"CADisplayPersistence", v2, (CFStringRef)*MEMORY[0x1E4F1D3D8]);
    CFPreferencesAppSynchronize(v3);
  }
}

- (void)update
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CADisplayPersistedData *)self setLatencies:[(NSMutableArray *)self->_latencies mutableCopy]];
  [(CADisplayPersistedData *)self setPreferredModes:[(NSMutableArray *)self->_preferredModes mutableCopy]];
  if (framework_version(void)::once != -1) {
    dispatch_once(&framework_version(void)::once, &__block_literal_global_134_22992);
  }
  uint64_t v3 = framework_version(void)::version;
  if (![(NSString *)self->_version isEqualToString:framework_version(void)::version])
  {
    [(CADisplayPersistedData *)self setVersion:v3];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    latencies = self->_latencies;
    uint64_t v5 = [(NSMutableArray *)latencies countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(latencies);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "setMode:", reload_mode((CFDictionaryRef)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "mode")));
        }
        uint64_t v6 = [(NSMutableArray *)latencies countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v6);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    preferredModes = self->_preferredModes;
    uint64_t v10 = [(NSMutableArray *)preferredModes countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(preferredModes);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * j), "setMode:", reload_mode((CFDictionaryRef)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * j), "mode")));
        }
        uint64_t v11 = [(NSMutableArray *)preferredModes countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v11);
    }
    [(CADisplayPersistedData *)self save];
  }
}

- (Mode)preferredModeForUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  preferredModes = self->_preferredModes;
  unint64_t v5 = [(NSMutableArray *)preferredModes countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(preferredModes);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "uuid")))
        {
          unint64_t v11 = 0;
          CA::WindowServer::Display::Mode::Mode((CA::WindowServer::Display::Mode *)&v11, (CFDictionaryRef)[v10 mode]);
          unint64_t v5 = v11;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      unint64_t v5 = [(NSMutableArray *)preferredModes countByEnumeratingWithState:&v13 objects:v12 count:16];
      unint64_t v7 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  *(&result.var0.var1 + 1) = v6;
  result.var0.var1 = v5;
  return result;
}

- (void)setPreferredMode:(Mode)a3 forUUID:(id)a4
{
  v4 = (void *)*(&a3.var0.var1 + 1);
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = a3.var0.var1;
  unint64_t v6 = objc_alloc_init(CADisplayPersistedPreferredMode);
  -[CADisplayPersistedPreferredMode setUuid:](v6, "setUuid:", v4, v9[0]);
  [(CADisplayPersistedPreferredMode *)v6 setMode:CA::WindowServer::Display::Mode::create_dictionary_representation((CA::WindowServer::Display::Mode *)v9)];
  if (![(NSMutableArray *)self->_preferredModes count]) {
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  while ((objc_msgSend(v4, "isEqualToString:", objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_preferredModes, "objectAtIndexedSubscript:", v7), "uuid")) & 1) == 0)
  {
    uint64_t v7 = ++v8;
    if ([(NSMutableArray *)self->_preferredModes count] <= (unint64_t)v8) {
      goto LABEL_8;
    }
  }
  if ((v8 & 0x80000000) != 0)
  {
LABEL_8:
    if ((unint64_t)[(NSMutableArray *)self->_preferredModes count] >= 0x10) {
      [(NSMutableArray *)self->_preferredModes removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->_preferredModes addObject:v6];
  }
  else
  {
    [(NSMutableArray *)self->_preferredModes replaceObjectAtIndex:v8 withObject:v6];
  }

  [(CADisplayPersistedData *)self save];
}

- (double)latencyForUUID:(id)a3 andMode:(Mode)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t var1 = a4.var0.var1;
  unint64_t v6 = CA::WindowServer::Display::Mode::create_dictionary_representation((CA::WindowServer::Display::Mode *)&var1);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  latencies = self->_latencies;
  uint64_t v8 = [(NSMutableArray *)latencies countByEnumeratingWithState:&v18 objects:v17 count:16];
  double v9 = 0.0;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(latencies);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v13, "uuid"))
          && (-[__CFDictionary isEqual:](v6, "isEqual:", [v13 mode]) & 1) != 0)
        {
          [v13 latency];
          return v14;
        }
      }
      uint64_t v10 = [(NSMutableArray *)latencies countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  return v9;
}

- (void)setLatency:(double)a3 forUUID:(id)a4 andMode:(Mode)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v13[0] = a5.var0.var1;
  uint64_t v8 = CA::WindowServer::Display::Mode::create_dictionary_representation((CA::WindowServer::Display::Mode *)v13);
  double v9 = objc_alloc_init(CADisplayPersistedLatency);
  [(CADisplayPersistedLatency *)v9 setUuid:a4];
  [(CADisplayPersistedLatency *)v9 setMode:v8];
  [(CADisplayPersistedLatency *)v9 setLatency:a3];
  if (![(NSMutableArray *)self->_latencies count]) {
    goto LABEL_6;
  }
  uint64_t v10 = 0;
  unsigned int v11 = 0;
  while (1)
  {
    uint64_t v12 = (void *)[(NSMutableArray *)self->_latencies objectAtIndexedSubscript:v10];
    if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v12, "uuid")))
    {
      if (-[__CFDictionary isEqual:](v8, "isEqual:", [v12 mode])) {
        break;
      }
    }
    uint64_t v10 = ++v11;
    if ([(NSMutableArray *)self->_latencies count] <= (unint64_t)v11) {
      goto LABEL_6;
    }
  }
  if ((v11 & 0x80000000) != 0)
  {
LABEL_6:
    if ((unint64_t)[(NSMutableArray *)self->_latencies count] >= 0x10) {
      [(NSMutableArray *)self->_latencies removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->_latencies addObject:v9];
  }
  else
  {
    [(NSMutableArray *)self->_latencies replaceObjectAtIndex:v11 withObject:v9];
  }

  [(CADisplayPersistedData *)self save];
}

- (id)description
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  [v3 appendFormat:@"<%@:%p; ", NSStringFromClass(v4), self];
  [v3 appendFormat:@"version: %@, latencies: %@, preferredModes:%@", self->_version, self->_latencies, self->_preferredModes];
  [v3 appendString:@">"];
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayPersistedData;
  [(CADisplayPersistedData *)&v3 dealloc];
}

- (CADisplayPersistedData)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)CADisplayPersistedData;
  v2 = [(CADisplayPersistedData *)&v4 init];
  if (v2)
  {
    if (framework_version(void)::once != -1) {
      dispatch_once(&framework_version(void)::once, &__block_literal_global_134_22992);
    }
    v2->_version = (NSString *)[(id)framework_version(void)::version copy];
    v2->_latencies = (NSMutableArray *)objc_opt_new();
    v2->_preferredModes = (NSMutableArray *)objc_opt_new();
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  if (+[CADisplayPersistedData sharedInstance]::once != -1) {
    dispatch_once(&+[CADisplayPersistedData sharedInstance]::once, &__block_literal_global_7);
  }
  return (id)+[CADisplayPersistedData sharedInstance]::data;
}

void __40__CADisplayPersistedData_sharedInstance__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  CFStringRef v0 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"CADisplayPersistence", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
  if (v1)
  {
    v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFDataGetTypeID())
    {
      v5[0] = 0;
      +[CADisplayPersistedData sharedInstance]::data = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:v5];
      id v4 = (id)+[CADisplayPersistedData sharedInstance]::data;
      if (v5[0])
      {
        NSLog(&stru_1ED044980.isa, v5[0]);
        CFPreferencesSetAppValue(@"CADisplayPersistence", 0, v0);
        CFPreferencesAppSynchronize(v0);
      }
      else
      {
        [(id)+[CADisplayPersistedData sharedInstance]::data update];
      }
    }
    CFRelease(v2);
  }
  if (!+[CADisplayPersistedData sharedInstance]::data) {
    +[CADisplayPersistedData sharedInstance]::data = objc_alloc_init(CADisplayPersistedData);
  }
}

+ (id)supportedClasses
{
  if (+[CADisplayPersistedData supportedClasses]::once != -1) {
    dispatch_once(&+[CADisplayPersistedData supportedClasses]::once, &__block_literal_global_23012);
  }
  return (id)+[CADisplayPersistedData supportedClasses]::set;
}

id __42__CADisplayPersistedData_supportedClasses__block_invoke()
{
  CFStringRef v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  +[CADisplayPersistedData supportedClasses]::set = (uint64_t)result;
  return result;
}

@end