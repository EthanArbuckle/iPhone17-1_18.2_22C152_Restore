@interface UARPAccessoryHardwareCHIP
- (UARPAccessoryHardwareCHIP)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 hardwareID:(unsigned __int16)a5 metadata:(id)a6;
- (UARPAccessoryMetadata)metadata;
- (id)description;
- (unsigned)hwID;
- (unsigned)productID;
- (unsigned)vendorID;
@end

@implementation UARPAccessoryHardwareCHIP

- (UARPAccessoryHardwareCHIP)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 hardwareID:(unsigned __int16)a5 metadata:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)UARPAccessoryHardwareCHIP;
  v12 = [(UARPAccessoryHardwareID *)&v15 initWithTransport:6];
  v13 = v12;
  if (v12)
  {
    v12->_vendorID = a3;
    v12->_productID = a4;
    v12->_hwID = a5;
    objc_storeStrong((id *)&v12->_metadata, a6);
  }

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"vendorID=%u, productID=%u, hwID=%u, metadata=%@", self->_vendorID, self->_productID, self->_hwID, self->_metadata];
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)hwID
{
  return self->_hwID;
}

- (UARPAccessoryMetadata)metadata
{
  return (UARPAccessoryMetadata *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end