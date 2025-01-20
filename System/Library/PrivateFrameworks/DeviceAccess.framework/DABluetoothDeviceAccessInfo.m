@interface DABluetoothDeviceAccessInfo
- (DABluetoothDeviceAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)bluetoothServices;
- (NSUUID)identifier;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBluetoothServices:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation DABluetoothDeviceAccessInfo

- (DABluetoothDeviceAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DABluetoothDeviceAccessInfo;
  v7 = [(DABluetoothDeviceAccessInfo *)&v17 init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v10 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v11, v12, v13, v14, v15, v16, v10);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_4;
  }
  if (!CUXPCDecodeNSUUID()) {
    goto LABEL_7;
  }
  v8 = v7;
LABEL_4:

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  identifier = self->_identifier;
  if (identifier)
  {
    [(NSUUID *)identifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "id", uuid);
  }
}

- (id)description
{
  return [(DABluetoothDeviceAccessInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  CUAppendF();
  id v4 = 0;
  v5 = v4;
  identifier = self->_identifier;
  if (identifier)
  {
    v18 = v4;
    uint64_t v7 = identifier;
    uint64_t v16 = CUPrintNSObjectOneLine();
    CUAppendF();
    id v8 = v18;

    v5 = v8;
  }
  bluetoothServices = self->_bluetoothServices;
  if (bluetoothServices)
  {
    uint64_t v10 = bluetoothServices;
    objc_super v17 = CUPrintNSObjectOneLine();
    CUAppendF();
    id v11 = v5;

    v5 = v11;
  }
  CUAppendF();
  uint64_t v12 = v5;

  uint64_t v13 = &stru_26D120818;
  if (v12) {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v13;

  return v14;
}

- (NSArray)bluetoothServices
{
  return self->_bluetoothServices;
}

- (void)setBluetoothServices:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_bluetoothServices, 0);
}

@end