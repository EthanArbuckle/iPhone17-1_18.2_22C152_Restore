@interface UARPAccessoryHardwareUSBPD
- (BOOL)isEqual:(id)a3;
- (BOOL)isMagSafeCable;
- (BOOL)isPowerAdapter;
- (BOOL)isUSBCLightning;
- (BOOL)supportsAccMode7;
- (UARPAccessoryHardwareUSBPD)init;
- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4;
- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 usbpdClass:(int64_t)a5 locationType:(int64_t)a6;
- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 usbpdClass:(int64_t)a5 locationType:(int64_t)a6 supportsAccMode7:(BOOL)a7;
- (id)description;
- (int64_t)location;
- (unsigned)productID;
- (unsigned)vendorID;
@end

@implementation UARPAccessoryHardwareUSBPD

- (UARPAccessoryHardwareUSBPD)init
{
  return 0;
}

- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UARPAccessoryHardwareUSBPD;
  result = [(UARPAccessoryHardwareID *)&v7 initWithTransport:8];
  if (result)
  {
    result->_vendorID = a3;
    result->_productID = a4;
  }
  return result;
}

- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 usbpdClass:(int64_t)a5 locationType:(int64_t)a6
{
  v8 = [(UARPAccessoryHardwareUSBPD *)self initWithVendorID:a3 productID:a4];
  v9 = v8;
  if (v8)
  {
    v8->_location = a6;
    if (a6 > 2 || (v8->_usbpdClass = a5, (unint64_t)a5 > 2))
    {
      v10 = 0;
      goto LABEL_7;
    }
    *((unsigned char *)&v8->super.super.isa + *off_264492F38[a5]) = 1;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 usbpdClass:(int64_t)a5 locationType:(int64_t)a6 supportsAccMode7:(BOOL)a7
{
  result = [(UARPAccessoryHardwareUSBPD *)self initWithVendorID:a3 productID:a4 usbpdClass:a5 locationType:a6];
  if (result) {
    result->_supportsAccMode7 = a7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAccessoryHardwareUSBPD *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      BOOL v9 = 1;
    }
    else
    {
      v5 = v4;
      int64_t v6 = [(UARPAccessoryHardwareID *)self transport];
      if (v6 == [(UARPAccessoryHardwareID *)v5 transport]
        && (int vendorID = self->_vendorID, vendorID == [(UARPAccessoryHardwareUSBPD *)v5 vendorID]))
      {
        int productID = self->_productID;
        BOOL v9 = productID == [(UARPAccessoryHardwareUSBPD *)v5 productID];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t vendorID = self->_vendorID;
  uint64_t productID = self->_productID;
  int64_t v6 = UARPUSBPDDeviceClassToString(self->_usbpdClass);
  objc_super v7 = UARPAccessoryUSBPDLocationTypeToString(self->_location);
  if (self->_supportsAccMode7) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  return (id)[v3 stringWithFormat:@"USB-PD, VID/PID = 0x%04x/0x%04x, Class = %s, Location = %s, Supports AccMode7 = %s", vendorID, productID, v6, v7, v8];
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (int64_t)location
{
  return self->_location;
}

- (BOOL)isMagSafeCable
{
  return self->_isMagSafeCable;
}

- (BOOL)isPowerAdapter
{
  return self->_isPowerAdapter;
}

- (BOOL)isUSBCLightning
{
  return self->_isUSBCLightning;
}

- (BOOL)supportsAccMode7
{
  return self->_supportsAccMode7;
}

@end