@interface DIIOObject
+ (id)copyDiskImagesControllerWithError:(id *)a3;
- (DIIOObject)initWithClassName:(id)a3 error:(id *)a4;
- (DIIOObject)initWithDIIOObject:(id)a3;
- (DIIOObject)initWithIOObject:(unsigned int)a3;
- (DIIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4;
- (DIIOObject)initWithIteratorNext:(id)a3;
- (DIIOObject)initWithRegistryEntryID:(unint64_t)a3 error:(id *)a4;
- (DIIOObject)ioObjectWithClassName:(id)a3 iterateParent:(BOOL)a4 error:(id *)a5;
- (NSString)ioClassName;
- (id)copyParentWithError:(id *)a3;
- (id)copyPropertyWithClass:(Class)a3 key:(id)a4;
- (id)description;
- (id)newIteratorWithOptions:(unsigned int)a3 error:(id *)a4;
- (unint64_t)registryEntryIDWithError:(id *)a3;
- (unsigned)ioObj;
- (void)dealloc;
@end

@implementation DIIOObject

- (DIIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4
{
  if (a3)
  {
    if (a4) {
      IOObjectRetain(a3);
    }
    v10.receiver = self;
    v10.super_class = (Class)DIIOObject;
    v6 = [(DIIOObject *)&v10 init];
    v7 = v6;
    if (v6) {
      v6->_ioObj = a3;
    }
    else {
      IOObjectRelease(a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (DIIOObject)initWithIOObject:(unsigned int)a3
{
  return [(DIIOObject *)self initWithIOObject:*(void *)&a3 retain:0];
}

- (DIIOObject)initWithDIIOObject:(id)a3
{
  id v4 = [a3 ioObj];
  return [(DIIOObject *)self initWithIOObject:v4 retain:1];
}

- (DIIOObject)initWithRegistryEntryID:(unint64_t)a3 error:(id *)a4
{
  CFDictionaryRef v7 = IORegistryEntryIDMatching(a3);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  if (MatchingService)
  {
    self = [(DIIOObject *)self initWithIOObject:MatchingService];
    v9 = self;
  }
  else
  {
    objc_super v10 = +[NSString stringWithFormat:@"Cannot find registry entry ID 0x%llx", a3];
    v9 = +[DIError nilWithEnumValue:153 verboseInfo:v10 error:a4];
  }
  return v9;
}

- (DIIOObject)initWithClassName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = IOServiceMatching((const char *)[v6 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  if (MatchingService)
  {
    self = [(DIIOObject *)self initWithIOObject:MatchingService];
    v9 = self;
  }
  else
  {
    objc_super v10 = +[NSString stringWithFormat:@"Cannot find IO object of class %@", v6];
    v9 = +[DIError nilWithEnumValue:153 verboseInfo:v10 error:a4];
  }
  return v9;
}

- (DIIOObject)initWithIteratorNext:(id)a3
{
  id v4 = [a3 copyNextObject];
  return [(DIIOObject *)self initWithIOObject:v4];
}

- (id)newIteratorWithOptions:(unsigned int)a3 error:(id *)a4
{
  io_iterator_t iterator = 0;
  uint64_t v5 = IORegistryEntryCreateIterator([(DIIOObject *)self ioObj], "IOService", a3, &iterator);
  if (v5)
  {
    id v6 = +[NSString stringWithFormat:@"Failed creating IO iterator, err code %d", v5];
    CFDictionaryRef v7 = +[DIError nilWithEnumValue:153 verboseInfo:v6 error:a4];
  }
  else
  {
    v8 = [DIIOIterator alloc];
    return [(DIIOIterator *)v8 initWithIOIterator:iterator retain:0];
  }
  return v7;
}

- (unint64_t)registryEntryIDWithError:(id *)a3
{
  uint64_t entryID = 0;
  uint64_t RegistryEntryID = IORegistryEntryGetRegistryEntryID([(DIIOObject *)self ioObj], &entryID);
  if (!RegistryEntryID) {
    return entryID;
  }
  uint64_t v5 = +[NSString stringWithFormat:@"Failed to get registry entry ID, ret %d", RegistryEntryID];
  +[DIError failWithEnumValue:153 verboseInfo:v5 error:a3];

  return 0;
}

- (NSString)ioClassName
{
  v2 = (__CFString *)IOObjectCopyClass([(DIIOObject *)self ioObj]);
  return (NSString *)v2;
}

- (id)description
{
  return [(DIIOObject *)self ioClassName];
}

- (void)dealloc
{
  io_object_t ioObj = self->_ioObj;
  if (ioObj)
  {
    IOObjectRelease(ioObj);
    self->_io_object_t ioObj = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DIIOObject;
  [(DIIOObject *)&v4 dealloc];
}

- (DIIOObject)ioObjectWithClassName:(id)a3 iterateParent:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (const char *)[v8 UTF8String];
  if (v6) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 1;
  }
  id v11 = [(DIIOObject *)self newIteratorWithOptions:v10 error:a5];
  if (v11)
  {
    v12 = 0;
    while (1)
    {
      v13 = [[DIIOObject alloc] initWithIteratorNext:v11];

      if (!v13) {
        break;
      }
      v12 = v13;
      if (IOObjectConformsTo([(DIIOObject *)v13 ioObj], v9)) {
        goto LABEL_11;
      }
    }
    v14 = +[NSString stringWithFormat:@"Cannot find %@ entry", v8];
    v13 = +[DIError nilWithEnumValue:153 verboseInfo:v14 error:a5];
  }
  else
  {
    v13 = 0;
  }
LABEL_11:

  return v13;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty([(DIIOObject *)self ioObj], v5, kCFAllocatorDefault, 0);

  if (CFProperty && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = CFProperty;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)copyParentWithError:(id *)a3
{
  io_registry_entry_t parent = 0;
  uint64_t ParentEntry = IORegistryEntryGetParentEntry([(DIIOObject *)self ioObj], "IOService", &parent);
  if (ParentEntry)
  {
    uint64_t v5 = +[NSString stringWithFormat:@"Failed to get parent registry entry, err code %d", ParentEntry];
    BOOL v6 = +[DIError nilWithEnumValue:153 verboseInfo:v5 error:a3];
  }
  else
  {
    id v7 = [DIIOObject alloc];
    return [(DIIOObject *)v7 initWithIOObject:parent];
  }
  return v6;
}

+ (id)copyDiskImagesControllerWithError:(id *)a3
{
  objc_super v4 = [[DIIOObject alloc] initWithClassName:@"AppleDiskImagesController" error:0];
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL v6 = v4;
  }
  else
  {
    BOOL v6 = +[DIError nilWithEnumValue:153 verboseInfo:@"Failed to find DiskImages2 controller, driver might not be installed" error:a3];
  }
  id v7 = v6;

  return v7;
}

- (unsigned)ioObj
{
  return self->_ioObj;
}

@end