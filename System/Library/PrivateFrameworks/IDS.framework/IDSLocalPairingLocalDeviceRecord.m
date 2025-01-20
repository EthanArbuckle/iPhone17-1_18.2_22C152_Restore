@interface IDSLocalPairingLocalDeviceRecord
+ (BOOL)supportsSecureCoding;
- (IDSLocalPairingLocalDeviceRecord)initWithWithFullIdentityDataClassA:(id)a3 classC:(id)a4 classD:(id)a5;
- (id)_fullIdenityForDataProtectionClass:(unsigned int)a3 error:(id *)a4;
- (id)description;
- (id)fullIdentityClassA:(id *)a3;
- (id)fullIdentityClassC:(id *)a3;
- (id)fullIdentityClassD:(id *)a3;
@end

@implementation IDSLocalPairingLocalDeviceRecord

- (IDSLocalPairingLocalDeviceRecord)initWithWithFullIdentityDataClassA:(id)a3 classC:(id)a4 classD:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)IDSLocalPairingLocalDeviceRecord;
  return [(IDSLocalPairingRecord *)&v6 initWithIdentityDataClassA:a3 classC:a4 classD:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v16 = 0;
  v3 = [(IDSLocalPairingLocalDeviceRecord *)self fullIdentityClassA:&v16];
  id v4 = v16;
  id v15 = 0;
  v5 = [(IDSLocalPairingLocalDeviceRecord *)self fullIdentityClassC:&v15];
  id v6 = v15;
  id v14 = 0;
  v7 = [(IDSLocalPairingLocalDeviceRecord *)self fullIdentityClassD:&v14];
  id v8 = v14;
  v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v9 stringWithFormat:@"<%@: %p classA: %@, errorClassA: %@, classC: %@, errorClassC: %@, classD: %@, errorClassD: %@>", v11, self, v3, v4, v5, v6, v7, v8];

  return v12;
}

- (id)_fullIdenityForDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  v5 = -[IDSLocalPairingRecord identityDataForDataProtectionClass:error:](self, "identityDataForDataProtectionClass:error:");
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F6B4E0] identityWithData:v5 error:a4];
  }
  else
  {
    v7 = [MEMORY[0x1E4F6C3B8] NRPairing];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A360F4();
    }

    id v6 = 0;
  }

  return v6;
}

- (id)fullIdentityClassA:(id *)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__fullIdenityForDataProtectionClass_error_);
}

- (id)fullIdentityClassC:(id *)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__fullIdenityForDataProtectionClass_error_);
}

- (id)fullIdentityClassD:(id *)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__fullIdenityForDataProtectionClass_error_);
}

@end