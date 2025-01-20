@interface IOKRegistryEntry
+ (id)entryFromPath:(id)a3;
+ (id)registryIteratorForPlane:(id)a3 withOptions:(unsigned int)a4 error:(id *)a5;
+ (id)rootEntry;
- (BOOL)isAttachedToPlane:(id)a3;
- (IOKRegistryEntry)initWithRegistryEntry:(unsigned int)a3;
- (NSDictionary)properties;
- (NSString)name;
- (id)childInPlane:(id)a3 error:(id *)a4;
- (id)childInServicePlaneWithError:(id *)a3;
- (id)childIteratorInPlane:(id)a3 error:(id *)a4;
- (id)childIteratorInPlane:(id)a3 error:(id *)a4 withEnumerationBlock:(id)a5;
- (id)childIteratorInServicePlaneWithError:(id *)a3;
- (id)childIteratorInServicePlaneWithError:(id *)a3 enumerationBlock:(id)a4;
- (id)locationInPlane:(id)a3 error:(id *)a4;
- (id)locationInServicePlaneWithError:(id *)a3;
- (id)nameInPlane:(id)a3 error:(id *)a4;
- (id)nameInServicePlaneWithError:(id *)a3;
- (id)parentEntryInPlane:(id)a3 error:(id *)a4;
- (id)parentEntryInServicePlaneWithError:(id *)a3;
- (id)parentIteratorInPlane:(id)a3 error:(id *)a4;
- (id)parentIteratorInPlane:(id)a3 error:(id *)a4 withEnumerationBlock:(id)a5;
- (id)parentIteratorInServicePlaneWithError:(id *)a3;
- (id)parentIteratorInServicePlaneWithError:(id *)a3 enumerationBlock:(id)a4;
- (id)pathInPlane:(id)a3;
- (id)pathInServicePlane;
- (id)propertyForKey:(id)a3;
- (id)registryIteratorForPlane:(id)a3 withOptions:(unsigned int)a4 error:(id *)a5;
- (id)registryIteratorForServicePlaneWithOptions:(unsigned int)a3 error:(id *)a4;
- (id)searchForPropertyWithKey:(id)a3 inPlane:(id)a4;
- (id)searchForPropertyWithKey:(id)a3 inPlane:(id)a4 withOptions:(int)a5;
- (unint64_t)entryID;
- (void)setProperties:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
@end

@implementation IOKRegistryEntry

- (id)childIteratorInPlane:(id)a3 error:(id *)a4
{
  io_object_t object = 0;
  id v6 = a3;
  uint64_t v7 = [(IOKObject *)self object];
  id v8 = v6;
  uint64_t v9 = [v8 UTF8String];

  int v10 = MEMORY[0x223C6B4E0](v7, v9, &object);
  if (v10)
  {
    int v11 = v10;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v12 = 0;
  }
  else
  {
    v13 = [IOKIterator alloc];
    v12 = [(IOKIterator *)v13 initWithIterator:object];
  }
LABEL_8:
  if (object) {
    IOObjectRelease(object);
  }

  return v12;
}

- (IOKRegistryEntry)initWithRegistryEntry:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOKRegistryEntry;
  return [(IOKObject *)&v4 initWithIOObject:*(void *)&a3];
}

- (id)propertyForKey:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  io_registry_entry_t v5 = [(IOKObject *)self object];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, v4, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);

  return CFProperty;
}

- (id)childIteratorInServicePlaneWithError:(id *)a3
{
  return [(IOKRegistryEntry *)self childIteratorInPlane:@"IOService" error:a3];
}

+ (id)rootEntry
{
  uint64_t RootEntry = IORegistryGetRootEntry(*MEMORY[0x263F0EC90]);
  if (RootEntry)
  {
    io_object_t v4 = RootEntry;
    io_registry_entry_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForRegistryEntry:", RootEntry)), "initWithRegistryEntry:", RootEntry);
    IOObjectRelease(v4);
  }
  else
  {
    io_registry_entry_t v5 = 0;
  }

  return v5;
}

+ (id)entryFromPath:(id)a3
{
  uint64_t v4 = IORegistryEntryCopyFromPath(*MEMORY[0x263F0EC90], (CFStringRef)a3);
  if (v4)
  {
    io_object_t v5 = v4;
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForRegistryEntry:", v4)), "initWithRegistryEntry:", v4);
    IOObjectRelease(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)registryIteratorForPlane:(id)a3 withOptions:(unsigned int)a4 error:(id *)a5
{
  kern_return_t v6;
  kern_return_t v7;
  IORegistryIterator *v8;
  IORegistryIterator *v9;
  io_iterator_t iterator;
  uint64_t vars8;

  iterator = 0;
  id v6 = IORegistryCreateIterator(*MEMORY[0x263F0EC90], (const char *)[a3 UTF8String], a4, &iterator);
  if (v6)
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a5) {
        goto LABEL_4;
      }
    }
    else if (a5)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v7 userInfo:0];
      id v8 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [IORegistryIterator alloc];
    id v8 = [(IOKIterator *)v9 initWithIterator:iterator];
  }
LABEL_8:
  if (iterator) {
    IOObjectRelease(iterator);
  }

  return v8;
}

- (id)registryIteratorForPlane:(id)a3 withOptions:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  io_object_t object = 0;
  id v8 = a3;
  uint64_t v9 = [(IOKObject *)self object];
  id v10 = v8;
  uint64_t v11 = [v10 UTF8String];

  int v12 = MEMORY[0x223C6B4C0](v9, v11, v6, &object);
  if (v12)
  {
    int v13 = v12;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a5) {
        goto LABEL_4;
      }
    }
    else if (a5)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v13 userInfo:0];
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v14 = 0;
  }
  else
  {
    v15 = [IORegistryIterator alloc];
    v14 = [(IOKIterator *)v15 initWithIOObject:object];
  }
LABEL_8:
  if (object) {
    IOObjectRelease(object);
  }

  return v14;
}

- (id)registryIteratorForServicePlaneWithOptions:(unsigned int)a3 error:(id *)a4
{
  return [(IOKRegistryEntry *)self registryIteratorForPlane:@"IOService" withOptions:*(void *)&a3 error:a4];
}

- (NSString)name
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (MEMORY[0x223C6B500]([(IOKObject *)self object],
                       &v4))
    v2 = 0;
  else {
    v2 = (void *)[[NSString alloc] initWithUTF8String:&v4];
  }

  return (NSString *)v2;
}

- (id)nameInPlane:(id)a3 error:(id *)a4
{
  kern_return_t NameInPlane;
  kern_return_t v11;
  id v12;
  void *v13;
  long long v15;
  uint64_t v16;
  uint64_t vars8;

  v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  io_registry_entry_t v7 = [(IOKObject *)self object];
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 UTF8String];

  NameInPlane = IORegistryEntryGetNameInPlane(v7, v9, (char *)&v15);
  if (NameInPlane)
  {
    uint64_t v11 = NameInPlane;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      int v12 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
      int v13 = 0;
      *a4 = v12;
      goto LABEL_8;
    }
    int v13 = 0;
  }
  else
  {
    int v13 = (void *)[[NSString alloc] initWithUTF8String:&v15];
  }
LABEL_8:

  return v13;
}

- (id)nameInServicePlaneWithError:(id *)a3
{
  return [(IOKRegistryEntry *)self nameInPlane:@"IOService" error:a3];
}

- (id)locationInPlane:(id)a3 error:(id *)a4
{
  kern_return_t LocationInPlane;
  kern_return_t v11;
  id v12;
  void *v13;
  long long v15;
  uint64_t v16;
  uint64_t vars8;

  v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  io_registry_entry_t v7 = [(IOKObject *)self object];
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 UTF8String];

  LocationInPlane = IORegistryEntryGetLocationInPlane(v7, v9, (char *)&v15);
  if (LocationInPlane)
  {
    uint64_t v11 = LocationInPlane;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      int v12 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
      int v13 = 0;
      *a4 = v12;
      goto LABEL_8;
    }
    int v13 = 0;
  }
  else
  {
    int v13 = (void *)[[NSString alloc] initWithUTF8String:&v15];
  }
LABEL_8:

  return v13;
}

- (id)locationInServicePlaneWithError:(id *)a3
{
  return [(IOKRegistryEntry *)self locationInPlane:@"IOService" error:a3];
}

- (id)pathInPlane:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(IOKObject *)self object];
  id v5 = v4;
  id v6 = (const char *)[v5 UTF8String];

  io_registry_entry_t v7 = (__CFString *)IORegistryEntryCopyPath((io_registry_entry_t)self, v6);

  return v7;
}

- (id)pathInServicePlane
{
  return [(IOKRegistryEntry *)self pathInPlane:@"IOService"];
}

- (unint64_t)entryID
{
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID([(IOKObject *)self object], &entryID);
  return entryID;
}

- (NSDictionary)properties
{
  CFMutableDictionaryRef properties = 0;
  io_registry_entry_t v2 = [(IOKObject *)self object];
  if (IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
    }
    CFMutableDictionaryRef v3 = 0;
  }
  else
  {
    CFMutableDictionaryRef v3 = properties;
  }

  return (NSDictionary *)v3;
}

- (void)setProperties:(id)a3
{
  id properties = a3;
  IORegistryEntrySetCFProperties([(IOKObject *)self object], properties);
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = (__CFString *)a4;
  id property = a3;
  IORegistryEntrySetCFProperty([(IOKObject *)self object], v6, property);
}

- (id)searchForPropertyWithKey:(id)a3 inPlane:(id)a4
{
  id v6 = a4;
  io_registry_entry_t v7 = (__CFString *)a3;
  LODWORD(self) = [(IOKObject *)self object];
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 UTF8String];

  id v10 = (void *)IORegistryEntrySearchCFProperty((io_registry_entry_t)self, v9, v7, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);

  return v10;
}

- (id)searchForPropertyWithKey:(id)a3 inPlane:(id)a4 withOptions:(int)a5
{
  id v8 = a4;
  uint64_t v9 = (__CFString *)a3;
  LODWORD(self) = [(IOKObject *)self object];
  id v10 = v8;
  uint64_t v11 = (const char *)[v10 UTF8String];

  int v12 = (void *)IORegistryEntrySearchCFProperty((io_registry_entry_t)self, v11, v9, (CFAllocatorRef)*MEMORY[0x263EFFB08], a5);

  return v12;
}

- (id)childIteratorInPlane:(id)a3 error:(id *)a4 withEnumerationBlock:(id)a5
{
  id v8 = a5;
  io_object_t object = 0;
  id v9 = a3;
  uint64_t v10 = [(IOKObject *)self object];
  id v11 = v9;
  uint64_t v12 = [v11 UTF8String];

  int v13 = MEMORY[0x223C6B4E0](v10, v12, &object);
  if (v13)
  {
    int v14 = v13;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v14 userInfo:0];
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v15 = 0;
  }
  else
  {
    v16 = [IOKIterator alloc];
    v15 = [(IOKIterator *)v16 initWithIterator:object enumerationBlock:v8];
  }
LABEL_8:
  if (object) {
    IOObjectRelease(object);
  }

  return v15;
}

- (id)childIteratorInServicePlaneWithError:(id *)a3 enumerationBlock:(id)a4
{
  return [(IOKRegistryEntry *)self childIteratorInPlane:@"IOService" error:a3 withEnumerationBlock:a4];
}

- (id)childInPlane:(id)a3 error:(id *)a4
{
  kern_return_t ChildEntry;
  kern_return_t v11;
  id v12;
  void *v13;
  id v14;
  io_registry_entry_t child;
  uint64_t vars8;

  child = 0;
  id v6 = a3;
  io_registry_entry_t v7 = [(IOKObject *)self object];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  ChildEntry = IORegistryEntryGetChildEntry(v7, v9, &child);
  if (ChildEntry)
  {
    id v11 = ChildEntry;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
      int v13 = 0;
      *a4 = v12;
      goto LABEL_8;
    }
    int v13 = 0;
  }
  else
  {
    int v14 = objc_alloc((Class)[(id)objc_opt_class() classForRegistryEntry:child]);
    int v13 = (void *)[v14 initWithRegistryEntry:child];
  }
LABEL_8:

  return v13;
}

- (id)childInServicePlaneWithError:(id *)a3
{
  return [(IOKRegistryEntry *)self childInPlane:@"IOService" error:a3];
}

- (id)parentIteratorInPlane:(id)a3 error:(id *)a4
{
  io_object_t object = 0;
  id v6 = a3;
  uint64_t v7 = [(IOKObject *)self object];
  id v8 = v6;
  uint64_t v9 = [v8 UTF8String];

  int v10 = MEMORY[0x223C6B530](v7, v9, &object);
  if (v10)
  {
    int v11 = v10;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
      uint64_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    uint64_t v12 = 0;
  }
  else
  {
    int v13 = [IOKIterator alloc];
    uint64_t v12 = [(IOKIterator *)v13 initWithIterator:object];
  }
LABEL_8:
  if (object) {
    IOObjectRelease(object);
  }

  return v12;
}

- (id)parentIteratorInServicePlaneWithError:(id *)a3
{
  return [(IOKRegistryEntry *)self parentIteratorInPlane:@"IOService" error:a3];
}

- (id)parentIteratorInPlane:(id)a3 error:(id *)a4 withEnumerationBlock:(id)a5
{
  id v8 = a5;
  io_object_t object = 0;
  id v9 = a3;
  uint64_t v10 = [(IOKObject *)self object];
  id v11 = v9;
  uint64_t v12 = [v11 UTF8String];

  int v13 = MEMORY[0x223C6B530](v10, v12, &object);
  if (v13)
  {
    int v14 = v13;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v14 userInfo:0];
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v15 = 0;
  }
  else
  {
    v16 = [IOKIterator alloc];
    v15 = [(IOKIterator *)v16 initWithIterator:object enumerationBlock:v8];
  }
LABEL_8:
  if (object) {
    IOObjectRelease(object);
  }

  return v15;
}

- (id)parentIteratorInServicePlaneWithError:(id *)a3 enumerationBlock:(id)a4
{
  return [(IOKRegistryEntry *)self parentIteratorInPlane:@"IOService" error:a3 withEnumerationBlock:a4];
}

- (id)parentEntryInPlane:(id)a3 error:(id *)a4
{
  kern_return_t ParentEntry;
  kern_return_t v11;
  void *v12;
  id v13;
  io_registry_entry_t parent;
  uint64_t vars8;

  parent = 0;
  id v6 = a3;
  io_registry_entry_t v7 = [(IOKObject *)self object];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  ParentEntry = IORegistryEntryGetParentEntry(v7, v9, &parent);
  if (ParentEntry)
  {
    id v11 = ParentEntry;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
      uint64_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    uint64_t v12 = 0;
  }
  else
  {
    int v13 = objc_alloc((Class)[(id)objc_opt_class() classForRegistryEntry:parent]);
    uint64_t v12 = (void *)[v13 initWithRegistryEntry:parent];
  }
LABEL_8:
  if (parent) {
    IOObjectRelease(parent);
  }

  return v12;
}

- (id)parentEntryInServicePlaneWithError:(id *)a3
{
  return [(IOKRegistryEntry *)self parentEntryInPlane:@"IOService" error:a3];
}

- (BOOL)isAttachedToPlane:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(IOKObject *)self object];
  id v5 = v4;
  id v6 = (const char *)[v5 UTF8String];

  return IORegistryEntryInPlane((io_registry_entry_t)self, v6) != 0;
}

@end