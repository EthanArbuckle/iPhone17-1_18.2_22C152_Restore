@interface GCIORegistryEntry
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (GCIORegistryEntry)initWithPort:(unsigned int)a3 error:(id *)a4;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (id)propertyForKey:(id)a3;
- (id)propertyForKey:(id)a3 inPlane:(const char *)a4 options:(unsigned int)a5;
- (id)redactedDescription;
- (unint64_t)registryEntryID;
@end

@implementation GCIORegistryEntry

- (GCIORegistryEntry)initWithPort:(unsigned int)a3 error:(id *)a4
{
  kern_return_t RegistryEntryID;
  uint64_t v9;
  void *v10;
  objc_super v11;
  NSErrorUserInfoKey v12;
  __CFString *v13;

  v11.receiver = self;
  v11.super_class = (Class)GCIORegistryEntry;
  v5 = -[GCIOObject initWithPort:error:](&v11, sel_initWithPort_error_, *(void *)&a3);
  io_registry_entry_t v6 = -[GCIOObject port]((uint64_t)v5);
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(v6, &v5->_registryEntryID);
  if (RegistryEntryID || !v5->_registryEntryID)
  {
    if (a4)
    {
      v9 = RegistryEntryID;
      v12 = NSLocalizedFailureErrorKey;
      v13 = @"Did not return a valid registry entry ID.";
      v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      *a4 = +[NSError errorWithDomain:NSMachErrorDomain code:v9 userInfo:v10];

      a4 = 0;
    }
  }
  else
  {
    a4 = v5;
  }

  return (GCIORegistryEntry *)a4;
}

- (NSString)description
{
  v3 = [(GCIOObject *)self className];
  v4 = +[NSString stringWithFormat:@"<Kernel/%@ registryEntryID='%#010llx'>", v3, [(GCIORegistryEntry *)self registryEntryID]];

  return (NSString *)v4;
}

- (id)redactedDescription
{
  v3 = [(GCIOObject *)self className];
  v4 = +[NSString stringWithFormat:@"<Kernel/%@ registryEntryID='%#010llx'>", v3, [(GCIORegistryEntry *)self registryEntryID]];

  return v4;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(GCIOObject *)self className];
  io_registry_entry_t v6 = +[NSString stringWithFormat:@"<%@ %p Kernel/%@ registryEntryID='%#010llx'>", v4, self, v5, [(GCIORegistryEntry *)self registryEntryID]];

  return (NSString *)v6;
}

- (NSString)name
{
  memset(v5, 0, sizeof(v5));
  uint64_t v2 = -[GCIOObject port]((uint64_t)self);
  if (MEMORY[0x21052C920](v2, v5))
  {
    v3 = 0;
  }
  else
  {
    v3 = +[NSString stringWithCString:v5 encoding:4];
  }

  return (NSString *)v3;
}

- (id)propertyForKey:(id)a3 inPlane:(const char *)a4 options:(unsigned int)a5
{
  v8 = (__CFString *)a3;
  io_registry_entry_t v9 = -[GCIOObject port]((uint64_t)self);
  v10 = (void *)IORegistryEntrySearchCFProperty(v9, a4, v8, kCFAllocatorDefault, a5);

  return v10;
}

- (id)propertyForKey:(id)a3
{
  v4 = (__CFString *)a3;
  io_registry_entry_t v5 = -[GCIOObject port]((uint64_t)self);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, v4, kCFAllocatorDefault, 0);

  return CFProperty;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  kern_return_t v9;
  NSObject *v11;
  int v12;
  GCIORegistryEntry *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  kern_return_t v17;

  io_registry_entry_t v6 = (__CFString *)a4;
  id v7 = a3;
  io_registry_entry_t v8 = -[GCIOObject port]((uint64_t)self);
  io_registry_entry_t v9 = IORegistryEntrySetCFProperty(v8, v6, v7);

  if (v9)
  {
    v11 = _gc_log_iokit();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = self;
      v14 = 2114;
      v15 = v6;
      v16 = 1024;
      v17 = v9;
      _os_log_error_impl(&dword_20AD04000, v11, OS_LOG_TYPE_ERROR, "%@ Error setting property '%{public}@': %{mach.errno}d", (uint8_t *)&v12, 0x1Cu);
    }
  }
  return v9 == 0;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

@end