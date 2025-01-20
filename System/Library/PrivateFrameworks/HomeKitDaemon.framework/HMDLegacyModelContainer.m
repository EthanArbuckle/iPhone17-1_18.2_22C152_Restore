@interface HMDLegacyModelContainer
- (Class)modelClassForTypeName:(id)a3;
- (HMDLegacyModelContainer)initWithDataVersion:(id)a3 legacyDataVersion:(id)a4 pairingIdentity:(id)a5;
- (HMFPairingIdentity)pairingIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodePropertyValueFromData:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7;
- (id)decryptData:(id)a3 decompress:(BOOL)a4 error:(id *)a5;
- (id)encodePropertyValue:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7;
- (id)encryptData:(id)a3 compress:(BOOL)a4 error:(id *)a5;
- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 type:(id)a6 error:(id *)a7;
@end

@implementation HMDLegacyModelContainer

- (void).cxx_destruct
{
}

- (HMFPairingIdentity)pairingIdentity
{
  return self->_pairingIdentity;
}

- (id)decodePropertyValueFromData:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  v19[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_msgSend((id)objc_msgSend(v12, "classObj"), "conformsToProtocol:", &unk_26E47D148))
  {
    objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(v12, "classObj"), v10, a7);
    a7 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a7)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F41FD8];
    v15 = [NSString stringWithFormat:@"should conform to NSSecureCoding (but storage class for property %@ does not)", v11, @"message"];
    v19[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a7 = [v13 errorWithDomain:v14 code:3 userInfo:v16];

    a7 = 0;
  }

  return a7;
}

- (id)encodePropertyValue:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  v21[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a3;
  if ([(id)objc_opt_class() conformsToProtocol:&unk_26E47D148])
  {
    id v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:a7];
  }
  else
  {
    id v12 = NSString;
    uint64_t v13 = objc_opt_class();

    uint64_t v14 = [v12 stringWithFormat:@"Cannot encode value of type %@ for property '%@' because it does not conform to NSSecureCoding", v13, v9];
    v15 = (void *)v14;
    if (a7)
    {
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F41FD8];
      v20 = @"message";
      v21[0] = v14;
      uint64_t v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a7 = [v16 errorWithDomain:v17 code:3 userInfo:v18];
    }
    id v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDLegacyModelContainer;
  v4 = [(HMBModelContainer *)&v9 copyWithZone:a3];
  if (self)
  {
    uint64_t v5 = [(HMDLegacyModelContainer *)self pairingIdentity];
    v6 = (void *)v4[12];
    v4[12] = v5;
  }
  v7 = self;

  return v7;
}

- (id)encryptData:(id)a3 compress:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 hmbCompress];

    objc_super v9 = (void *)v10;
  }
  id v11 = [(HMDLegacyModelContainer *)self pairingIdentity];
  id v12 = [v11 privateKey];
  uint64_t v13 = [v12 data];
  uint64_t v14 = +[HMDPersistentStore encryptData:v9 withKey:v13 error:a5];

  return v14;
}

- (id)decryptData:(id)a3 decompress:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = [(HMDLegacyModelContainer *)self pairingIdentity];
  uint64_t v10 = [v9 privateKey];
  id v11 = [v10 data];
  id v12 = +[HMDPersistentStore decryptData:v8 withKey:v11 error:a5];

  if (v6)
  {
    id v13 = [v12 hmbUncompress];
  }
  else
  {
    id v13 = v12;
  }
  uint64_t v14 = v13;

  return v14;
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 type:(id)a6 error:(id *)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  if (![v12 length]) {
    goto LABEL_17;
  }
  if (a4 == 2)
  {
    uint64_t v14 = [MEMORY[0x263F492B0] decodeAsOPACK:v12 error:a7];
  }
  else
  {
    if (a4 != 1)
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        int v28 = 138543618;
        v29 = v23;
        __int16 v30 = 2048;
        unint64_t v31 = a4;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot deserialize from unknown encoding: %lu", (uint8_t *)&v28, 0x16u);
      }
      if (a7)
      {
        [MEMORY[0x263F087E8] hmfErrorWithCode:3];
        v24 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      goto LABEL_17;
    }
    uint64_t v14 = [MEMORY[0x263F492B0] decodeAsNSDictionary:v12 error:a7];
  }
  v15 = v14;
  if (!v14)
  {
LABEL_17:
    v24 = 0;
    goto LABEL_24;
  }
  if (!v13)
  {
    id v13 = [v14 objectForKey:@"_t"];
    if (!v13)
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      uint64_t v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v28 = 138543618;
        v29 = v19;
        __int16 v30 = 2112;
        unint64_t v31 = (unint64_t)v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine type for model %@", (uint8_t *)&v28, 0x16u);
      }
      if (a7)
      {
        [MEMORY[0x263F087E8] hmfErrorWithCode:2];
        id v13 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  v25 = [(HMDLegacyModelContainer *)self modelClassForTypeName:v13];
  if ([(objc_class *)v25 isSubclassOfClass:objc_opt_class()])
  {
    v24 = [(HMBModelContainer *)self modelFromDictionary:v15 storageLocation:a5 typeName:v13 error:a7];
  }
  else
  {
    if (([(objc_class *)v25 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
      _HMFPreconditionFailure();
    }
    v26 = NSStringFromClass(+[HMDLegacyV4Model hmbModelClassForHMDModelClass:v25]);
    v24 = [(HMBModelContainer *)self modelFromDictionary:v15 storageLocation:a5 typeName:v26 error:a7];
  }
LABEL_24:

  return v24;
}

- (Class)modelClassForTypeName:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = (NSString *)a3;
  uint64_t v5 = +[HMDBackingStoreSingleton sharedInstance];
  BOOL v6 = [v5 nameToClassTransform];
  Class v7 = (Class)[v6 objectForKey:v4];

  if (!v7)
  {
    id v8 = [(HMBModelContainer *)self nameToClassTransform];
    Class v7 = (Class)[v8 objectForKey:v4];

    if (!v7)
    {
      Class v7 = NSClassFromString(v4);
      if (!v7)
      {
        objc_super v9 = (void *)MEMORY[0x230FBD990]();
        uint64_t v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = HMFGetLogIdentifier();
          int v15 = 138543618;
          v16 = v12;
          __int16 v17 = 2112;
          uint64_t v18 = v4;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to translate type name %@ to class", (uint8_t *)&v15, 0x16u);
        }
      }
    }
  }
  id v13 = v7;

  return v13;
}

- (HMDLegacyModelContainer)initWithDataVersion:(id)a3 legacyDataVersion:(id)a4 pairingIdentity:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDLegacyModelContainer;
  uint64_t v10 = [(HMBModelContainer *)&v13 initWithDataVersion:a3 legacyDataVersion:a4];
  id v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_pairingIdentity, a5);
  }

  return v11;
}

@end