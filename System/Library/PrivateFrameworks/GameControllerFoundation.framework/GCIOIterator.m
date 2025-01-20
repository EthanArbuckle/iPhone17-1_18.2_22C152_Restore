@interface GCIOIterator
+ (NSString)className;
- (BOOL)conformsTo:(const char *)a3;
- (BOOL)isEqualTo:(id)a3;
- (GCIOIterator)init;
- (GCIOIterator)initWithPort:(unsigned int)a3 objectClass:(Class)a4 error:(id *)a5;
- (NSString)className;
- (NSString)debugDescription;
- (NSString)description;
- (id)nextObject;
- (id)objectClass;
- (id)redactedDescription;
- (uint64_t)port;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation GCIOIterator

- (GCIOIterator)initWithPort:(unsigned int)a3 objectClass:(Class)a4 error:(id *)a5
{
  kern_return_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  objc_super v15;
  void v16[2];
  void v17[2];

  v15.receiver = self;
  v15.super_class = (Class)GCIOIterator;
  v9 = [(GCIOIterator *)&v15 init];
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v14 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v14 handleFailureInMethod:a2 object:v9 file:@"GCIOIterator.m" lineNumber:17 description:@"Assertion failed: [objectClass isSubclassOfClass:GCIOObject.class]"];

    goto LABEL_5;
  }
  v10 = IOObjectRetain(a3);
  if (!v10)
  {
    v9->_port = a3;
    objc_storeStrong((id *)&v9->_objectClass, a4);
    a5 = v9;
    goto LABEL_7;
  }
  if (a5)
  {
    v11 = v10;
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSLocalizedFailureReasonErrorKey;
    v17[0] = @"Invalid port.";
    v17[1] = @"Error incrementing port retain count.";
    v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    *a5 = +[NSError errorWithDomain:NSMachErrorDomain code:v11 userInfo:v12];

LABEL_5:
    a5 = 0;
  }
LABEL_7:

  return (GCIOIterator *)a5;
}

- (GCIOIterator)init
{
  return 0;
}

- (void)dealloc
{
  io_object_t port = self->_port;
  if (port)
  {
    IOObjectRelease(port);
    self->_io_object_t port = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GCIOIterator;
  [(GCIOIterator *)&v4 dealloc];
}

- (unint64_t)hash
{
  return self->_port;
}

- (NSString)description
{
  if (self)
  {
    CFStringRef v3 = IOObjectCopyClass(self->_port);
    v5 = objc_msgSend(objc_getProperty(self, v4, 16, 1), "className");
    uint64_t port = self->_port;
  }
  else
  {
    CFStringRef v3 = IOObjectCopyClass(0);
    v5 = [0 className];
    uint64_t port = 0;
  }
  v7 = +[NSString stringWithFormat:@"<%@<Kernel/%@> port='%#08x'>", v3, v5, port];

  return (NSString *)v7;
}

- (uint64_t)port
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

- (id)objectClass
{
  if (result) {
    return objc_getProperty(result, a2, 16, 1);
  }
  return result;
}

- (id)redactedDescription
{
  if (self)
  {
    CFStringRef v3 = IOObjectCopyClass(self->_port);
    v5 = objc_msgSend(objc_getProperty(self, v4, 16, 1), "className");
    uint64_t port = self->_port;
  }
  else
  {
    CFStringRef v3 = IOObjectCopyClass(0);
    v5 = [0 className];
    uint64_t port = 0;
  }
  v7 = +[NSString stringWithFormat:@"<%@<Kernel/%@> port='%#08x'>", v3, v5, port];

  return v7;
}

- (NSString)debugDescription
{
  CFStringRef v3 = (objc_class *)objc_opt_class();
  SEL v4 = NSStringFromClass(v3);
  if (self)
  {
    CFStringRef v5 = IOObjectCopyClass(self->_port);
    v7 = objc_msgSend(objc_getProperty(self, v6, 16, 1), "className");
    uint64_t port = self->_port;
  }
  else
  {
    CFStringRef v5 = IOObjectCopyClass(0);
    v7 = [0 className];
    uint64_t port = 0;
  }
  v9 = +[NSString stringWithFormat:@"<%@ %p %@<Kernel/%@> port='%#08x'>", v4, self, v5, v7, port];

  return (NSString *)v9;
}

+ (NSString)className
{
  return (NSString *)@"OSIterator";
}

- (NSString)className
{
  v2 = (__CFString *)IOObjectCopyClass(self->_port);

  return (NSString *)v2;
}

- (BOOL)conformsTo:(const char *)a3
{
  return IOObjectConformsTo(self->_port, a3) != 0;
}

- (BOOL)isEqualTo:(id)a3
{
  SEL v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    io_object_t port = self->_port;
    if (v4) {
      io_object_t v6 = v4[2];
    }
    else {
      io_object_t v6 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v8 = 0;
      goto LABEL_8;
    }
    unsigned int v7 = self->_port;
    io_object_t v6 = -[GCIOObject port]((uint64_t)v4);
    io_object_t port = v7;
  }
  BOOL v8 = IOObjectIsEqualTo(port, v6) != 0;
LABEL_8:

  return v8;
}

- (id)nextObject
{
  while (1)
  {
    while (self)
    {
      uint64_t v3 = IOIteratorNext(self->_port);
      if (v3)
      {
        uint64_t v5 = v3;
        Property = (objc_class *)objc_getProperty(self, v4, 16, 1);
        goto LABEL_4;
      }
      if (IOIteratorIsValid(self->_port)) {
        goto LABEL_14;
      }
      uint64_t port = self->_port;
LABEL_10:
      MEMORY[0x21052C850](port);
    }
    uint64_t v17 = IOIteratorNext(0);
    if (!v17)
    {
      BOOLean_t IsValid = IOIteratorIsValid(0);
      uint64_t port = 0;
      if (IsValid)
      {
LABEL_14:
        BOOL v8 = 0;
        goto LABEL_16;
      }
      goto LABEL_10;
    }
    uint64_t v5 = v17;
    Property = 0;
LABEL_4:
    id v7 = [Property alloc];
    id v20 = 0;
    BOOL v8 = (void *)[v7 initWithPort:v5 error:&v20];
    id v9 = v20;
    v10 = v9;
    if (v8) {
      break;
    }
    v11 = _gc_log_iokit();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = (__CFString *)IOObjectCopyClass(v5);
      v14 = v13;
      int v15 = [v10 code];
      v16 = [v10 localizedFailureReason];

      *(_DWORD *)buf = 138413058;
      v22 = self;
      __int16 v23 = 2114;
      v24 = v13;
      __int16 v25 = 1024;
      int v26 = v15;
      __int16 v27 = 2114;
      v28 = v16;
      _os_log_error_impl(&dword_20AD04000, v11, OS_LOG_TYPE_ERROR, "%@ Error instantiating wrapper for next object '%{public}@': %{mach.errno}d %{public}@", buf, 0x26u);
    }
  }

LABEL_16:

  return v8;
}

- (void).cxx_destruct
{
}

@end