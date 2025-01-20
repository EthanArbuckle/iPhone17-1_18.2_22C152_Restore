@interface MTSDeviceCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSDeviceCredential)initWithCertificationDeclaration:(id)a3 deviceAttestationCertificate:(id)a4 productAttestationIntermediateCertificate:(id)a5;
- (MTSDeviceCredential)initWithCoder:(id)a3;
- (NSData)certificationDeclaration;
- (NSData)deviceAttestationCertificate;
- (NSData)productAttestationIntermediateCertificate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSDeviceCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productAttestationIntermediateCertificate, 0);
  objc_storeStrong((id *)&self->_deviceAttestationCertificate, 0);

  objc_storeStrong((id *)&self->_certificationDeclaration, 0);
}

- (NSData)productAttestationIntermediateCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)deviceAttestationCertificate
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)certificationDeclaration
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSDeviceCredential *)self certificationDeclaration];
  [v4 encodeObject:v5 forKey:@"MTSDC.ck.certificationDeclaration"];

  v6 = [(MTSDeviceCredential *)self deviceAttestationCertificate];
  [v4 encodeObject:v6 forKey:@"MTSDC.ck.deviceAttestationCertificate"];

  id v7 = [(MTSDeviceCredential *)self productAttestationIntermediateCertificate];
  [v4 encodeObject:v7 forKey:@"MTSDC.ck.productAttestationIntermediateCertificate"];
}

- (MTSDeviceCredential)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDC.ck.certificationDeclaration"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDC.ck.deviceAttestationCertificate"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDC.ck.productAttestationIntermediateCertificate"];
  v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    v11 = (void *)MEMORY[0x245697870]();
    v14 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v17 = 138544130;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded certificationDeclaration: %@, deviceAttestationCertificate: %@, productAttestationIntermediateCertificate: %@", (uint8_t *)&v17, 0x2Au);
    }
    v15 = 0;
  }
  else
  {
    v14 = [(MTSDeviceCredential *)self initWithCertificationDeclaration:v5 deviceAttestationCertificate:v6 productAttestationIntermediateCertificate:v7];
    v15 = v14;
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [(MTSDeviceCredential *)self certificationDeclaration];
  uint64_t v4 = [v3 hash];
  v5 = [(MTSDeviceCredential *)self deviceAttestationCertificate];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(MTSDeviceCredential *)self productAttestationIntermediateCertificate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(MTSDeviceCredential *)self certificationDeclaration];
    unint64_t v8 = [v6 certificationDeclaration];
    if ([v7 isEqual:v8])
    {
      BOOL v9 = [(MTSDeviceCredential *)self deviceAttestationCertificate];
      v10 = [v6 deviceAttestationCertificate];
      if ([v9 isEqual:v10])
      {
        v11 = [(MTSDeviceCredential *)self productAttestationIntermediateCertificate];
        v12 = [v6 productAttestationIntermediateCertificate];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (MTSDeviceCredential)initWithCertificationDeclaration:(id)a3 deviceAttestationCertificate:(id)a4 productAttestationIntermediateCertificate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v20 = (void *)_HMFPreconditionFailure();
    return (MTSDeviceCredential *)+[MTSDeviceCredential supportsSecureCoding];
  }
  v22.receiver = self;
  v22.super_class = (Class)MTSDeviceCredential;
  v12 = [(MTSDeviceCredential *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    certificationDeclaration = v12->_certificationDeclaration;
    v12->_certificationDeclaration = (NSData *)v13;

    uint64_t v15 = [v9 copy];
    deviceAttestationCertificate = v12->_deviceAttestationCertificate;
    v12->_deviceAttestationCertificate = (NSData *)v15;

    uint64_t v17 = [v11 copy];
    productAttestationIntermediateCertificate = v12->_productAttestationIntermediateCertificate;
    v12->_productAttestationIntermediateCertificate = (NSData *)v17;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end