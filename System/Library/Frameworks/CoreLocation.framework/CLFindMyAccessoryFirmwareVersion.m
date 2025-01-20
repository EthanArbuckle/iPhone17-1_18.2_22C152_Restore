@interface CLFindMyAccessoryFirmwareVersion
- (CLFindMyAccessoryFirmwareVersion)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (CLFindMyAccessoryFirmwareVersion)initWithData:(id)a3;
- (NSString)rtKitVersion;
- (NSString)specificationVersion;
- (NSString)vanBurenVersion;
- (id)description;
- (unint64_t)calibrationDataVersion;
- (unint64_t)hardwareVersion;
- (unint64_t)roseAPVersion;
- (unint64_t)roseDSPVersion;
- (void)dealloc;
@end

@implementation CLFindMyAccessoryFirmwareVersion

- (CLFindMyAccessoryFirmwareVersion)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CLFindMyAccessoryFirmwareVersion;
  v6 = [(CLFindMyAccessoryFirmwareVersion *)&v11 init];
  v7 = v6;
  if (a4 >= 0x12 && v6)
  {
    v8 = ($383407B5A962737AD9715A0074609918 *)malloc_type_malloc(0x12uLL, 0x1000040B88D2812uLL);
    v7->_version = v8;
    __int16 v9 = *((_WORD *)a3 + 8);
    *(_OWORD *)&v8->var0 = *(_OWORD *)a3;
    *(_WORD *)&v8->var7 = v9;
  }
  return v7;
}

- (CLFindMyAccessoryFirmwareVersion)initWithData:(id)a3
{
  uint64_t v5 = [a3 bytes];
  uint64_t v6 = [a3 length];

  return [(CLFindMyAccessoryFirmwareVersion *)self initWithBytes:v5 length:v6];
}

- (void)dealloc
{
  free(self->_version);
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryFirmwareVersion;
  [(CLFindMyAccessoryFirmwareVersion *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CLFindMyAccessoryFirmwareVersion <%p> VanBurenVersion: %@, RTKitVersion: %@, RoseAPVersion: %lu, RoseDSPVersion: %lu, CalibrationDataVersion: %lu", self, -[CLFindMyAccessoryFirmwareVersion vanBurenVersion](self, "vanBurenVersion"), -[CLFindMyAccessoryFirmwareVersion rtKitVersion](self, "rtKitVersion"), -[CLFindMyAccessoryFirmwareVersion roseAPVersion](self, "roseAPVersion"), -[CLFindMyAccessoryFirmwareVersion roseDSPVersion](self, "roseDSPVersion"), -[CLFindMyAccessoryFirmwareVersion calibrationDataVersion](self, "calibrationDataVersion")];
}

- (NSString)vanBurenVersion
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%u%c%u", (self->_version->var0 >> 20) & 0xF, (HIWORD(self->_version->var0) & 0xF) + 65, (unsigned __int16)self->_version->var0 >> 4);
}

- (NSString)rtKitVersion
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%u.%u", self->_version->var1, self->_version->var2);
}

- (NSString)specificationVersion
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%u.%u", self->_version->var7, self->_version->var8);
}

- (unint64_t)roseAPVersion
{
  return self->_version->var3;
}

- (unint64_t)roseDSPVersion
{
  return self->_version->var4;
}

- (unint64_t)hardwareVersion
{
  return self->_version->var5;
}

- (unint64_t)calibrationDataVersion
{
  return self->_version->var6;
}

@end