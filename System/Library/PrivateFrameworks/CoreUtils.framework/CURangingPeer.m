@interface CURangingPeer
- (BOOL)isEqual:(id)a3;
- (NSData)deviceAddress;
- (NSData)deviceIRK;
- (NSString)deviceModel;
- (id)description;
- (unint64_t)hash;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceIRK:(id)a3;
- (void)setDeviceModel:(id)a3;
@end

@implementation CURangingPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceIRK, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceIRK:(id)a3
{
}

- (NSData)deviceIRK
{
  return self->_deviceIRK;
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSData)deviceAddress
{
  return self->_deviceAddress;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_deviceAddress hash];
  uint64_t v4 = [(NSData *)self->_deviceIRK hash] ^ v3;
  return v4 ^ [(NSString *)self->_deviceModel hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CURangingPeer *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      deviceAddress = self->_deviceAddress;
      v7 = [(CURangingPeer *)v5 deviceAddress];
      v8 = deviceAddress;
      v9 = v7;
      if (v8 == v9)
      {
      }
      else
      {
        v10 = v9;
        if ((v8 == 0) == (v9 != 0)) {
          goto LABEL_18;
        }
        int v11 = [(NSData *)v8 isEqual:v9];

        if (!v11) {
          goto LABEL_13;
        }
      }
      deviceIRK = self->_deviceIRK;
      v14 = [(CURangingPeer *)v5 deviceIRK];
      v8 = deviceIRK;
      v15 = v14;
      if (v8 == v15)
      {
      }
      else
      {
        v10 = v15;
        if ((v8 == 0) == (v15 != 0)) {
          goto LABEL_18;
        }
        int v16 = [(NSData *)v8 isEqual:v15];

        if (!v16)
        {
LABEL_13:
          char v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      deviceModel = self->_deviceModel;
      v18 = [(CURangingPeer *)v5 deviceModel];
      v8 = deviceModel;
      v19 = v18;
      if (v8 == v19)
      {
        char v12 = 1;
        v10 = v8;
        goto LABEL_19;
      }
      v10 = v19;
      if ((v8 == 0) != (v19 != 0))
      {
        char v12 = [(NSData *)v8 isEqual:v19];
LABEL_19:

        goto LABEL_20;
      }
LABEL_18:
      char v12 = 0;
      goto LABEL_19;
    }
    char v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)description
{
  return NSPrintF((uint64_t)"DA %@, Md %@, IRK %{mask}", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_deviceAddress);
}

@end