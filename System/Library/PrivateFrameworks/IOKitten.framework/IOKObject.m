@interface IOKObject
+ (Class)classForRegistryEntry:(unsigned int)a3;
+ (id)bundleIdentifierForClassName:(id)a3;
+ (id)ioSuperClassNameForClassName:(id)a3;
- (BOOL)conformsToIOClassName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IOKObject)init;
- (IOKObject)initWithIOObject:(unsigned int)a3;
- (NSString)ioClassName;
- (unint64_t)hash;
- (unsigned)object;
- (void)dealloc;
@end

@implementation IOKObject

- (IOKObject)initWithIOObject:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IOKObject;
  v4 = [(IOKObject *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_object = a3;
    IOObjectRetain(a3);
  }
  return v5;
}

+ (Class)classForRegistryEntry:(unsigned int)a3
{
  if (!IOObjectConformsTo(a3, "IOService")) {
    IOObjectConformsTo(a3, "IORegistryEntry");
  }
  v4 = objc_opt_class();

  return (Class)v4;
}

- (void)dealloc
{
  IOObjectRelease(self->_object);
  v3.receiver = self;
  v3.super_class = (Class)IOKObject;
  [(IOKObject *)&v3 dealloc];
}

- (unsigned)object
{
  return self->_object;
}

- (BOOL)conformsToIOClassName:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(IOKObject *)self object];
  id v5 = v4;
  v6 = (const char *)[v5 UTF8String];

  return IOObjectConformsTo((io_object_t)self, v6) != 0;
}

+ (id)ioSuperClassNameForClassName:(id)a3
{
  objc_super v3 = (__CFString *)IOObjectCopySuperclassForClass((CFStringRef)a3);

  return v3;
}

+ (id)bundleIdentifierForClassName:(id)a3
{
  objc_super v3 = (__CFString *)IOObjectCopyBundleIdentifierForClass((CFStringRef)a3);

  return v3;
}

- (IOKObject)init
{
  objc_super v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  id v5 = [NSString stringWithUTF8String:"-[IOKObject init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (NSString)ioClassName
{
  v2 = (__CFString *)IOObjectCopyClass([(IOKObject *)self object]);

  return (NSString *)v2;
}

- (unint64_t)hash
{
  return [(IOKObject *)self object];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (([v4 isMemberOfClass:objc_opt_class()] & 1) != 0
    || [(IOKObject *)self isMemberOfClass:objc_opt_class()])
  {
    unsigned int v5 = [(IOKObject *)self object];
    BOOL v6 = v5 == [v4 object];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end