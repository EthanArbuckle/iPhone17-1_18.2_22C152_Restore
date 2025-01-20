@interface GCIOObject
+ (NSString)className;
- (BOOL)conformsTo:(const char *)a3;
- (BOOL)isEqualTo:(id)a3;
- (GCIOObject)init;
- (GCIOObject)initWithPort:(unsigned int)a3 error:(id *)a4;
- (NSString)className;
- (NSString)debugDescription;
- (NSString)description;
- (id)redactedDescription;
- (uint64_t)port;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation GCIOObject

- (GCIOObject)initWithPort:(unsigned int)a3 error:(id *)a4
{
  kern_return_t v7;
  uint64_t v9;
  void *v10;
  objc_super v11;
  NSErrorUserInfoKey v12;
  __CFString *v13;

  v11.receiver = self;
  v11.super_class = (Class)GCIOObject;
  v6 = [(GCIOObject *)&v11 init];
  v7 = IOObjectRetain(a3);
  if (v7)
  {
    if (a4)
    {
      v9 = v7;
      v12 = NSLocalizedFailureErrorKey;
      v13 = @"Error incrementing port retain count.";
      v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      *a4 = +[NSError errorWithDomain:NSMachErrorDomain code:v9 userInfo:v10];

      a4 = 0;
    }
  }
  else
  {
    v6->_port = a3;
    a4 = v6;
  }

  return (GCIOObject *)a4;
}

- (GCIOObject)init
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
  v4.super_class = (Class)GCIOObject;
  [(GCIOObject *)&v4 dealloc];
}

- (unint64_t)hash
{
  return self->_port;
}

- (NSString)description
{
  uint64_t v3 = [(GCIOObject *)self className];
  objc_super v4 = (void *)v3;
  if (self) {
    uint64_t port = self->_port;
  }
  else {
    uint64_t port = 0;
  }
  v6 = +[NSString stringWithFormat:@"<Kernel/%@ port='%#08x'>", v3, port];

  return (NSString *)v6;
}

- (uint64_t)port
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

- (id)redactedDescription
{
  uint64_t v3 = [(GCIOObject *)self className];
  objc_super v4 = (void *)v3;
  if (self) {
    uint64_t port = self->_port;
  }
  else {
    uint64_t port = 0;
  }
  v6 = +[NSString stringWithFormat:@"<Kernel/%@ port='%#08x'>", v3, port];

  return v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCIOObject *)self className];
  v6 = (void *)v5;
  if (self) {
    uint64_t port = self->_port;
  }
  else {
    uint64_t port = 0;
  }
  v8 = +[NSString stringWithFormat:@"<%@ %p Kernel/%@ port='%#08x'>", v4, self, v5, port];

  return (NSString *)v8;
}

+ (NSString)className
{
  return (NSString *)@"OSObject";
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
  objc_super v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (v4) {
      io_object_t v5 = v4[2];
    }
    else {
      io_object_t v5 = 0;
    }
    BOOL v6 = IOObjectIsEqualTo(self->_port, v5) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end