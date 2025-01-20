@interface DAEventDeviceBluetoothPairingRequest
- (DABluetoothPairingInfo)pairingInfo;
- (DAEventDeviceBluetoothPairingRequest)initWithEventType:(int64_t)a3 pairingInfo:(id)a4;
- (DAEventDeviceBluetoothPairingRequest)initWithXPCObject:(id)a3 error:(id *)a4;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setPairingInfo:(id)a3;
@end

@implementation DAEventDeviceBluetoothPairingRequest

- (DAEventDeviceBluetoothPairingRequest)initWithEventType:(int64_t)a3 pairingInfo:(id)a4
{
  id v6 = a4;
  v7 = [(DAEvent *)self initWithEventType:55];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pairingInfo, a4);
    v9 = v8;
  }

  return v8;
}

- (DAEventDeviceBluetoothPairingRequest)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAEventDeviceBluetoothPairingRequest;
  v7 = [(DAEvent *)&v10 initWithXPCObject:v6 error:a4];
  if (v7 && (objc_opt_class(), CUXPCDecodeObject())) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAEventDeviceBluetoothPairingRequest;
  id v3 = a3;
  [(DAEvent *)&v4 encodeWithXPCObject:v3];
  CUXPCEncodeObject();
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    id v3 = 0;
  }
  CUAppendF();
  objc_super v4 = (__CFString *)v3;

  v5 = &stru_26D120818;
  if (v4) {
    v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (DABluetoothPairingInfo)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end