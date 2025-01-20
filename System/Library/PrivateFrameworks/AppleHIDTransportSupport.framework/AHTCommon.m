@interface AHTCommon
- (AHTCommon)initWithService:(unsigned int)a3;
- (BOOL)getPower:(int64_t *)a3;
- (BOOL)open;
- (BOOL)reset;
- (BOOL)setPower:(int64_t)a3;
- (NSString)name;
- (id)getBootLoader;
- (unint64_t)registryID;
- (unsigned)connect;
- (unsigned)service;
- (void)close;
- (void)dealloc;
- (void)setName:(id)a3;
@end

@implementation AHTCommon

- (AHTCommon)initWithService:(unsigned int)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)AHTCommon;
    v4 = [(AHTCommon *)&v7 init];
    v4->_service = a3;
    IOObjectRetain(a3);
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  [(AHTCommon *)self close];
  IOObjectRelease(self->_service);
  v3.receiver = self;
  v3.super_class = (Class)AHTCommon;
  [(AHTCommon *)&v3 dealloc];
}

- (BOOL)open
{
  return IOServiceOpen(self->_service, *MEMORY[0x263EF8960], 0, &self->_connect) == 0;
}

- (void)close
{
  io_connect_t connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_io_connect_t connect = 0;
  }
}

- (BOOL)setPower:(int64_t)a3
{
  return 0;
}

- (BOOL)getPower:(int64_t *)a3
{
  return 0;
}

- (BOOL)reset
{
  return 0;
}

- (id)getBootLoader
{
  io_iterator_t iterator = 0;
  if (MEMORY[0x223CA2FE0](self->_service, "IOService", 1, &iterator))
  {
    objc_super v3 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v4 = IOIteratorNext(iterator);
      if (!v4) {
        break;
      }
      uint64_t v5 = v4;
      if (IOObjectConformsTo(v4, "AppleHIDTransportBootloader"))
      {
        objc_super v3 = +[AHTBootLoader withParent:self service:v5];
        goto LABEL_7;
      }
    }
    objc_super v3 = 0;
LABEL_7:
    IOObjectRelease(iterator);
  }

  return v3;
}

- (unint64_t)registryID
{
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(self->_service, &entryID)) {
    return 0;
  }
  else {
    return entryID;
  }
}

- (unsigned)service
{
  return self->_service;
}

- (unsigned)connect
{
  return self->_connect;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end