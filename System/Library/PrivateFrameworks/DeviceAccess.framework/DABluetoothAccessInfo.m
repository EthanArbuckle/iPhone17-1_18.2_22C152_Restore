@interface DABluetoothAccessInfo
- (DABluetoothAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)bluetoothDevices;
- (NSArray)bluetoothScanCompanyIdentifiers;
- (NSArray)bluetoothScanServices;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBluetoothDevices:(id)a3;
- (void)setBluetoothScanServices:(id)a3;
@end

@implementation DABluetoothAccessInfo

- (DABluetoothAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DABluetoothAccessInfo;
  v7 = [(DABluetoothAccessInfo *)&v17 init];
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
  objc_opt_class();
  if (!CUXPCDecodeNSArrayOfClass()) {
    goto LABEL_7;
  }
  v8 = v7;
LABEL_4:

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
}

- (id)description
{
  return [(DABluetoothAccessInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  bluetoothDevices = self->_bluetoothDevices;
  if (bluetoothDevices)
  {
    id v6 = bluetoothDevices;
    objc_super v17 = CUPrintNSObjectOneLine();
    CUAppendF();
    v7 = v4;

    v4 = v7;
  }
  bluetoothScanCompanyIdentifiers = self->_bluetoothScanCompanyIdentifiers;
  if (bluetoothScanCompanyIdentifiers)
  {
    v9 = bluetoothScanCompanyIdentifiers;
    v18 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v10 = v4;

    v4 = v10;
  }
  bluetoothScanServices = self->_bluetoothScanServices;
  if (bluetoothScanServices)
  {
    uint64_t v12 = bluetoothScanServices;
    v19 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v13 = v4;

    v4 = v13;
  }
  uint64_t v14 = &stru_26D120818;
  if (v4) {
    uint64_t v14 = v4;
  }
  uint64_t v15 = v14;

  return v15;
}

- (NSArray)bluetoothDevices
{
  return self->_bluetoothDevices;
}

- (void)setBluetoothDevices:(id)a3
{
}

- (NSArray)bluetoothScanCompanyIdentifiers
{
  return self->_bluetoothScanCompanyIdentifiers;
}

- (NSArray)bluetoothScanServices
{
  return self->_bluetoothScanServices;
}

- (void)setBluetoothScanServices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothScanServices, 0);
  objc_storeStrong((id *)&self->_bluetoothScanCompanyIdentifiers, 0);

  objc_storeStrong((id *)&self->_bluetoothDevices, 0);
}

@end