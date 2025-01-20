@interface CoreRCDisplayInterfaceProperties
- (BOOL)standbyDisabled;
- (NSDictionary)properties;
- (NSString)role;
- (id)description;
- (unsigned)avService;
- (unsigned)cecService;
- (void)setAvService:(unsigned int)a3;
- (void)setCecService:(unsigned int)a3;
- (void)setProperties:(id)a3;
- (void)setRole:(id)a3;
- (void)setStandbyDisabled:(BOOL)a3;
@end

@implementation CoreRCDisplayInterfaceProperties

- (id)description
{
  uint64_t entryID = 0;
  id v3 = objc_alloc((Class)NSMutableString);
  v8.receiver = self;
  v8.super_class = (Class)CoreRCDisplayInterfaceProperties;
  v4 = [(CoreRCDisplayInterfaceProperties *)&v8 description];
  id v5 = [v3 initWithString:v4];

  v6 = [(CoreRCDisplayInterfaceProperties *)self role];
  [v5 appendFormat:@" role: %@;", v6];

  objc_msgSend(v5, "appendFormat:", @" avService: 0x%x", -[CoreRCDisplayInterfaceProperties avService](self, "avService"));
  if (!IORegistryEntryGetRegistryEntryID([(CoreRCDisplayInterfaceProperties *)self avService], &entryID)) {
    objc_msgSend(v5, "appendFormat:", @"(0x%llx)", entryID);
  }
  objc_msgSend(v5, "appendFormat:", @"; cecService: 0x%x",
    [(CoreRCDisplayInterfaceProperties *)self cecService]);
  if (!IORegistryEntryGetRegistryEntryID([(CoreRCDisplayInterfaceProperties *)self cecService], &entryID)) {
    objc_msgSend(v5, "appendFormat:", @"(0x%llx)", entryID);
  }
  objc_msgSend(v5, "appendFormat:", @"; standbyDisabled: %u;",
    [(CoreRCDisplayInterfaceProperties *)self standbyDisabled]);

  return v5;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (unsigned)avService
{
  return self->_avService;
}

- (void)setAvService:(unsigned int)a3
{
  self->_avService = a3;
}

- (unsigned)cecService
{
  return self->_cecService;
}

- (void)setCecService:(unsigned int)a3
{
  self->_cecService = a3;
}

- (BOOL)standbyDisabled
{
  return self->_standbyDisabled;
}

- (void)setStandbyDisabled:(BOOL)a3
{
  self->_standbyDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_role, 0);
}

@end