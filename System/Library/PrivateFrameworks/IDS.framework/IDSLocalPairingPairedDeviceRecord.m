@interface IDSLocalPairingPairedDeviceRecord
+ (BOOL)supportsSecureCoding;
- (IDSLocalPairingPairedDeviceRecord)initWithCBUUID:(id)a3 publicIdentityDataClassA:(id)a4 classC:(id)a5 classD:(id)a6;
- (IDSLocalPairingPairedDeviceRecord)initWithCoder:(id)a3;
- (NSUUID)cbuuid;
- (id)_publicIdenityForDataProtectionClass:(unsigned int)a3 error:(id *)a4;
- (id)description;
- (id)publicIdentityClassA:(id *)a3;
- (id)publicIdentityClassC:(id *)a3;
- (id)publicIdentityClassD:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSLocalPairingPairedDeviceRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSLocalPairingPairedDeviceRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCBUUID"];
  cbuuid = self->_cbuuid;
  self->_cbuuid = v5;

  v9.receiver = self;
  v9.super_class = (Class)IDSLocalPairingPairedDeviceRecord;
  v7 = [(IDSLocalPairingRecord *)&v9 initWithCoder:v4];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IDSLocalPairingPairedDeviceRecord *)self cbuuid];
  [v4 encodeObject:v5 forKey:@"kCBUUID"];

  v6.receiver = self;
  v6.super_class = (Class)IDSLocalPairingPairedDeviceRecord;
  [(IDSLocalPairingRecord *)&v6 encodeWithCoder:v4];
}

- (IDSLocalPairingPairedDeviceRecord)initWithCBUUID:(id)a3 publicIdentityDataClassA:(id)a4 classC:(id)a5 classD:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSLocalPairingPairedDeviceRecord;
  v12 = [(IDSLocalPairingRecord *)&v15 initWithIdentityDataClassA:a4 classC:a5 classD:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_cbuuid, a3);
  }

  return v13;
}

- (id)description
{
  id v17 = 0;
  v3 = [(IDSLocalPairingPairedDeviceRecord *)self publicIdentityClassA:&v17];
  id v4 = v17;
  id v16 = 0;
  v5 = [(IDSLocalPairingPairedDeviceRecord *)self publicIdentityClassC:&v16];
  id v6 = v16;
  id v15 = 0;
  v7 = [(IDSLocalPairingPairedDeviceRecord *)self publicIdentityClassD:&v15];
  id v8 = v15;
  objc_super v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  v12 = [(IDSLocalPairingPairedDeviceRecord *)self cbuuid];
  v13 = [v9 stringWithFormat:@"<%@: %p cbuuid: %@ classA: %@, errorClassA: %@, classC: %@, errorClassC: %@, classD: %@, errorClassD: %@>", v11, self, v12, v3, v4, v5, v6, v7, v8];

  return v13;
}

- (id)_publicIdenityForDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  v5 = -[IDSLocalPairingRecord identityDataForDataProtectionClass:error:](self, "identityDataForDataProtectionClass:error:");
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F6B4E8] identityWithData:v5 error:a4];
  }
  else
  {
    v7 = [MEMORY[0x1E4F6C3B8] NRPairing];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A36054();
    }

    id v6 = 0;
  }

  return v6;
}

- (id)publicIdentityClassA:(id *)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__publicIdenityForDataProtectionClass_error_);
}

- (id)publicIdentityClassC:(id *)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__publicIdenityForDataProtectionClass_error_);
}

- (id)publicIdentityClassD:(id *)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__publicIdenityForDataProtectionClass_error_);
}

- (NSUUID)cbuuid
{
  return self->_cbuuid;
}

- (void).cxx_destruct
{
}

@end