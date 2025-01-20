@interface UARPAccessoryHIDPersonality
- (BOOL)isEqual:(id)a3;
- (UARPAccessoryHIDPersonality)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4;
- (id)personalityIdentifier:(id)a3;
- (unint64_t)getHash;
- (unsigned)productID;
- (unsigned)vendorID;
@end

@implementation UARPAccessoryHIDPersonality

- (UARPAccessoryHIDPersonality)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UARPAccessoryHIDPersonality;
  result = [(UARPAccessoryHIDPersonality *)&v7 init];
  if (result)
  {
    result->_vendorID = a3;
    result->_productID = a4;
  }
  return result;
}

- (unint64_t)getHash
{
  return self->_productID | ((unint64_t)self->_vendorID << 16);
}

- (id)personalityIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%04x.%04x", a3, self->_vendorID, self->_productID];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAccessoryHIDPersonality *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      BOOL v8 = 1;
    }
    else
    {
      v5 = v4;
      int v6 = [(UARPAccessoryHIDPersonality *)self vendorID];
      if (v6 == [(UARPAccessoryHIDPersonality *)v5 vendorID])
      {
        int v7 = [(UARPAccessoryHIDPersonality *)self productID];
        BOOL v8 = v7 == [(UARPAccessoryHIDPersonality *)v5 productID];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

@end