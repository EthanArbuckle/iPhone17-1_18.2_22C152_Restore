@interface CBBLEServiceDataInfo
- (BOOL)connectable;
- (NSData)serviceData;
- (unsigned)serviceUUID16;
- (void)setConnectable:(BOOL)a3;
- (void)setServiceData:(id)a3;
- (void)setServiceUUID16:(unsigned __int16)a3;
@end

@implementation CBBLEServiceDataInfo

- (NSData)serviceData
{
  return self->_serviceData;
}

- (void)setServiceData:(id)a3
{
}

- (unsigned)serviceUUID16
{
  return self->_serviceUUID16;
}

- (void)setServiceUUID16:(unsigned __int16)a3
{
  self->_serviceUUID16 = a3;
}

- (BOOL)connectable
{
  return self->_connectable;
}

- (void)setConnectable:(BOOL)a3
{
  self->_connectable = a3;
}

- (void).cxx_destruct
{
}

@end