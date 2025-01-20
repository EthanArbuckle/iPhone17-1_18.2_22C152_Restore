@interface IDSPairedDevice
+ (id)iCloudIdentitiesFromIdentities:(id)a3;
+ (id)localIdentitiesFromIdentities:(id)a3;
- (BOOL)hasAllPublicKeys;
- (BOOL)isActive;
- (BOOL)isPairing;
- (BOOL)supportIPsec;
- (IDSPairedDevice)initWithCBUUID:(id)a3 pairingType:(int64_t)a4;
- (IDSPairedDevice)initWithPairedDevice:(id)a3 capabilityFlags:(unint64_t)a4;
- (IDSPairedDevice)initWithPairedDevice:(id)a3 deviceInfoPayload:(id)a4;
- (IDSPairedDevice)initWithPairedDevice:(id)a3 deviceUniqueID:(id)a4 pairingProtocolVersion:(unsigned int)a5 minCompatibilityVersion:(unsigned int)a6 maxCompatibilityVersion:(unsigned int)a7 serviceMinCompatibilityVersion:(unsigned __int16)a8 privateData:(id)a9;
- (IDSPairedDevice)initWithPairedDevice:(id)a3 iCloudURIs:(id)a4 pushToken:(id)a5;
- (IDSPairedDevice)initWithPairedDevice:(id)a3 isActive:(BOOL)a4;
- (IDSPairedDevice)initWithPairedDevice:(id)a3 pairingType:(int64_t)a4;
- (IDSPairedDevice)initWithPairedDevice:(id)a3 supportIPsec:(BOOL)a4;
- (IDSPairedDevice)initWithProperties:(id)a3;
- (IDSPairedDevice)initWithProperties:(id)a3 pairingProtocolVersion:(id)a4 minCompatibilityVersion:(id)a5 maxCompatibilityVersion:(id)a6 serviceMinCompatibilityVersion:(id)a7;
- (IDSPairedDevice)pairedDeviceWithoutSecuredEncryptionKeys;
- (NSArray)iCloudIdentities;
- (NSArray)iCloudURIs;
- (NSArray)localIdentities;
- (NSData)publicClassAKey;
- (NSData)publicClassCKey;
- (NSData)publicClassDKey;
- (NSData)pushToken;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)privateData;
- (NSString)buildVersion;
- (NSString)cbuuid;
- (NSString)productName;
- (NSString)productVersion;
- (NSString)uniqueID;
- (NSUUID)cbuuidUUID;
- (id)description;
- (id)identities;
- (id)persistedProperties;
- (int64_t)pairingType;
- (unsigned)maxCompatibilityVersion;
- (unsigned)minCompatibilityVersion;
- (unsigned)pairingProtocolVersion;
- (unsigned)serviceMinCompatibilityVersion;
@end

@implementation IDSPairedDevice

- (IDSPairedDevice)initWithProperties:(id)a3 pairingProtocolVersion:(id)a4 minCompatibilityVersion:(id)a5 maxCompatibilityVersion:(id)a6 serviceMinCompatibilityVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)IDSPairedDevice;
  v17 = [(IDSPairedDevice *)&v31 init];
  if (v17)
  {
    v18 = (NSDictionary *)[v12 copy];
    properties = v17->_properties;
    v17->_properties = v18;

    objc_storeStrong((id *)&v17->_pairingProtocolVersion, a4);
    objc_storeStrong((id *)&v17->_minCompatibilityVersion, a5);
    objc_storeStrong((id *)&v17->_maxCompatibilityVersion, a6);
    v20 = (const void *)IDSDeviceServicePropertyMinCompatibilityVersion;
    v21 = [(NSDictionary *)v17->_properties objectForKeyedSubscript:IDSDeviceServicePropertyMinCompatibilityVersion];

    if (v21)
    {
      v22 = [(NSDictionary *)v17->_properties objectForKeyedSubscript:v20];
    }
    else
    {
      v22 = (NSNumber *)v16;
    }
    serviceMinCompatibilityVersion = v17->_serviceMinCompatibilityVersion;
    v17->_serviceMinCompatibilityVersion = v22;

    unsigned int v24 = [v16 unsignedIntValue];
    if (v24 >= [(NSNumber *)v17->_serviceMinCompatibilityVersion unsignedIntValue])
    {
      id v30 = v14;
      Mutable = (__CFDictionary *)[(NSDictionary *)v17->_properties mutableCopy];
      if (!Mutable) {
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      id v26 = v13;
      if (v16) {
        CFDictionarySetValue(Mutable, v20, v16);
      }
      v27 = v17->_properties;
      v17->_properties = (NSDictionary *)Mutable;
      v28 = Mutable;

      objc_storeStrong((id *)&v17->_serviceMinCompatibilityVersion, a7);
      id v13 = v26;
      id v14 = v30;
    }
  }

  return v17;
}

- (IDSPairedDevice)initWithCBUUID:(id)a3 pairingType:(int64_t)a4
{
  uint64_t v21 = IDSDevicePropertyIdentitiesURI;
  uint64_t v22 = IDSLocalDeviceIdentity;
  id v6 = a3;
  v7 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  uint64_t v19 = IDSPrivateDeviceDataUniqueID;
  uint64_t v20 = IDSDeviceDefaultPairedDeviceUniqueID;
  v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v9 = +[NSMutableData data];
  [v9 setLength:80];
  v17[0] = IDSDevicePropertyNSUUID;
  v17[1] = IDSDevicePropertyDefaultPairedDevice;
  v18[0] = v6;
  v18[1] = &__kCFBooleanTrue;
  v18[2] = &__kCFBooleanTrue;
  v17[2] = IDSDevicePropertyDefaultLocalDevice;
  v17[3] = IDSDevicePropertyIdentities;
  id v16 = v7;
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v18[3] = v10;
  v18[4] = v8;
  v17[4] = IDSDevicePropertyPrivateDeviceData;
  v17[5] = IDSDevicePropertyPushToken;
  v18[5] = v9;
  v17[6] = IDSDevicePropertyPairingType;
  v11 = +[NSNumber numberWithInteger:a4];
  v18[6] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];

  id v13 = [v12 mutableCopy];
  id v14 = [(IDSPairedDevice *)self initWithProperties:v13];

  return v14;
}

- (IDSPairedDevice)initWithPairedDevice:(id)a3 deviceUniqueID:(id)a4 pairingProtocolVersion:(unsigned int)a5 minCompatibilityVersion:(unsigned int)a6 maxCompatibilityVersion:(unsigned int)a7 serviceMinCompatibilityVersion:(unsigned __int16)a8 privateData:(id)a9
{
  uint64_t v9 = a8;
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  id v15 = a4;
  id v16 = a9;
  if (a3)
  {
    id v17 = [*((id *)a3 + 1) mutableCopy];
    [v17 setObject:v16 forKeyedSubscript:IDSDevicePropertyPrivateDeviceData];
    if ([v15 length]) {
      [v17 setObject:v15 forKeyedSubscript:IDSDevicePropertyIdentifier];
    }
    v18 = +[NSNumber numberWithUnsignedInt:v12];
    uint64_t v19 = +[NSNumber numberWithUnsignedInt:v11];
    uint64_t v20 = +[NSNumber numberWithUnsignedInt:v10];
    uint64_t v21 = +[NSNumber numberWithUnsignedShort:v9];
    uint64_t v22 = [(IDSPairedDevice *)self initWithProperties:v17 pairingProtocolVersion:v18 minCompatibilityVersion:v19 maxCompatibilityVersion:v20 serviceMinCompatibilityVersion:v21];

    self = v22;
    v23 = self;
  }
  else
  {
    unsigned int v24 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_10071AB0C(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    v23 = 0;
  }

  return v23;
}

- (IDSPairedDevice)initWithPairedDevice:(id)a3 capabilityFlags:(unint64_t)a4
{
  v4 = self;
  if (a3)
  {
    v4 = [(IDSPairedDevice *)self initWithProperties:*((void *)a3 + 1) pairingProtocolVersion:*((void *)a3 + 2) minCompatibilityVersion:*((void *)a3 + 3) maxCompatibilityVersion:*((void *)a3 + 4) serviceMinCompatibilityVersion:*((void *)a3 + 5)];
    v5 = v4;
  }
  else
  {
    id v6 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10071AB84(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v5 = 0;
  }

  return v5;
}

- (IDSPairedDevice)initWithPairedDevice:(id)a3 deviceInfoPayload:(id)a4
{
  id v6 = (id *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    v44 = self;
    uint64_t v9 = (const void *)IDSDevicePropertyEncryptionClassAKey;
    uint64_t v10 = [v7 objectForKeyedSubscript:IDSDevicePropertyEncryptionClassAKey];
    uint64_t v11 = (const void *)IDSDevicePropertyEncryptionClassCKey;
    uint64_t v12 = [v8 objectForKeyedSubscript:IDSDevicePropertyEncryptionClassCKey];
    key = (void *)IDSDevicePropertyEncryptionKey;
    uint64_t v13 = objc_msgSend(v8, "objectForKeyedSubscript:");
    id v14 = v10;
    v47 = +[NSData dataWithBytes:[v14 bytes] length:[v14 length]];
    id v15 = v12;
    v46 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v15 bytes], objc_msgSend(v15, "length"));
    id v16 = v13;
    v45 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v16 bytes], objc_msgSend(v16, "length"));
    id v17 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v47;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Paired device public key A %@", buf, 0xCu);
    }

    v18 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v46;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Paired device public key C %@", buf, 0xCu);
    }

    uint64_t v19 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v45;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Paired device public key D %@", buf, 0xCu);
    }

    uint64_t v20 = (__CFDictionary *)[v6[1] mutableCopy];
    uint64_t v21 = v20;
    if (v14) {
      CFDictionarySetValue(v20, v9, v14);
    }
    if (v15) {
      CFDictionarySetValue(v21, v11, v15);
    }
    if (v16) {
      CFDictionarySetValue(v21, key, v16);
    }
    uint64_t v22 = (const void *)IDSDevicePropertyIdentifier;
    v23 = [v8 objectForKeyedSubscript:IDSDevicePropertyIdentifier];
    if (v23) {
      CFDictionarySetValue(v21, v22, v23);
    }

    unsigned int v24 = (const void *)IDSDevicePropertyName;
    uint64_t v25 = [v8 objectForKeyedSubscript:IDSDevicePropertyName];
    if (v25) {
      CFDictionarySetValue(v21, v24, v25);
    }

    uint64_t v26 = (const void *)IDSDevicePropertyHardwareVersion;
    uint64_t v27 = [v8 objectForKeyedSubscript:IDSDevicePropertyHardwareVersion];
    if (v27) {
      CFDictionarySetValue(v21, v26, v27);
    }

    uint64_t v28 = (const void *)IDSDevicePropertyPushToken;
    uint64_t v29 = [v8 objectForKeyedSubscript:IDSDevicePropertyPushToken];
    if (v29) {
      CFDictionarySetValue(v21, v28, v29);
    }

    uint64_t v30 = (const void *)IDSDevicePropertyPrivateDeviceData;
    uint64_t v31 = [v8 objectForKeyedSubscript:IDSDevicePropertyPrivateDeviceData];
    if ([v31 count])
    {
      v32 = [v6 privateData];
      id v33 = [v32 mutableCopy];

      if (!v33) {
        id v33 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v31, "count"));
      }
      [v33 addEntriesFromDictionary:v31];
      if (v33) {
        CFDictionarySetValue(v21, v30, v33);
      }
    }
    self = [(IDSPairedDevice *)v44 initWithProperties:v21 pairingProtocolVersion:v6[2] minCompatibilityVersion:v6[3] maxCompatibilityVersion:v6[4] serviceMinCompatibilityVersion:v6[5]];

    v34 = self;
  }
  else
  {
    id v14 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10071ABFC(v14, v35, v36, v37, v38, v39, v40, v41);
    }
    v34 = 0;
  }

  return v34;
}

- (IDSPairedDevice)initWithPairedDevice:(id)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [*((id *)v6 + 1) mutableCopy];
    uint64_t v9 = +[NSNumber numberWithBool:v4];
    [v8 setObject:v9 forKeyedSubscript:IDSDevicePropertyIsActivePairedDevice];

    self = [(IDSPairedDevice *)self initWithProperties:v8 pairingProtocolVersion:v7[2] minCompatibilityVersion:v7[3] maxCompatibilityVersion:v7[4] serviceMinCompatibilityVersion:v7[5]];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v11 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10071AC74(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (IDSPairedDevice)initWithPairedDevice:(id)a3 supportIPsec:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [*((id *)v6 + 1) mutableCopy];
    uint64_t v9 = +[NSNumber numberWithBool:v4];
    [v8 setObject:v9 forKeyedSubscript:IDSDevicePropertySupportIPsec];

    self = [(IDSPairedDevice *)self initWithProperties:v8 pairingProtocolVersion:v7[2] minCompatibilityVersion:v7[3] maxCompatibilityVersion:v7[4] serviceMinCompatibilityVersion:v7[5]];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v11 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10071ACEC(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (IDSPairedDevice)initWithPairedDevice:(id)a3 pairingType:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [*((id *)v6 + 1) mutableCopy];
    uint64_t v9 = +[NSNumber numberWithInteger:a4];
    [v8 setObject:v9 forKeyedSubscript:IDSDevicePropertyPairingType];

    self = [(IDSPairedDevice *)self initWithProperties:v8 pairingProtocolVersion:v7[2] minCompatibilityVersion:v7[3] maxCompatibilityVersion:v7[4] serviceMinCompatibilityVersion:v7[5]];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v11 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10071AD64(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (IDSPairedDevice)initWithPairedDevice:(id)a3 iCloudURIs:(id)a4 pushToken:(id)a5
{
  id v8 = (id *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    id v32 = v10;
    uint64_t v12 = objc_alloc_init((Class)NSMutableArray);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v33 = v9;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
    uint64_t v15 = IDSDevicePropertyIdentitiesURI;
    if (v14)
    {
      id v16 = v14;
      uint64_t v17 = *(void *)v35;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v18);
          uint64_t v40 = v15;
          uint64_t v41 = v19;
          uint64_t v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1, v32);
          [v12 addObject:v20];

          uint64_t v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v16);
    }

    uint64_t v38 = v15;
    uint64_t v39 = IDSLocalDeviceIdentity;
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [v12 addObject:v21];

    id v22 = [v8[1] mutableCopy];
    uint64_t v11 = v32;
    [v22 setObject:v32 forKeyedSubscript:IDSDevicePropertyPushToken];
    [v22 setObject:v12 forKeyedSubscript:IDSDevicePropertyIdentities];
    self = [(IDSPairedDevice *)self initWithProperties:v22 pairingProtocolVersion:v8[2] minCompatibilityVersion:v8[3] maxCompatibilityVersion:v8[4] serviceMinCompatibilityVersion:v8[5]];

    v23 = self;
    id v9 = v33;
  }
  else
  {
    uint64_t v12 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10071ADDC(v12, v24, v25, v26, v27, v28, v29, v30);
    }
    v23 = 0;
  }

  return v23;
}

- (IDSPairedDevice)pairedDeviceWithoutSecuredEncryptionKeys
{
  id v3 = [(NSDictionary *)self->_properties mutableCopy];
  v7[0] = IDSDevicePropertyEncryptionClassAKey;
  v7[1] = IDSDevicePropertyEncryptionClassCKey;
  BOOL v4 = +[NSArray arrayWithObjects:v7 count:2];
  [v3 removeObjectsForKeys:v4];

  id v5 = [objc_alloc((Class)objc_opt_class()) initWithProperties:v3 pairingProtocolVersion:self->_pairingProtocolVersion minCompatibilityVersion:self->_minCompatibilityVersion maxCompatibilityVersion:self->_maxCompatibilityVersion serviceMinCompatibilityVersion:self->_serviceMinCompatibilityVersion];

  return (IDSPairedDevice *)v5;
}

- (IDSPairedDevice)initWithProperties:(id)a3
{
  return [(IDSPairedDevice *)self initWithProperties:a3 pairingProtocolVersion:0 minCompatibilityVersion:0 maxCompatibilityVersion:0 serviceMinCompatibilityVersion:0];
}

- (id)persistedProperties
{
  id v2 = [(NSDictionary *)self->_properties copy];

  return v2;
}

- (NSString)cbuuid
{
  return (NSString *)[(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyNSUUID];
}

- (NSUUID)cbuuidUUID
{
  id v3 = objc_alloc((Class)NSUUID);
  BOOL v4 = [(IDSPairedDevice *)self cbuuid];
  id v5 = [v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (NSString)uniqueID
{
  return (NSString *)[(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyIdentifier];
}

- (BOOL)isActive
{
  id v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyIsActivePairedDevice];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)supportIPsec
{
  id v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertySupportIPsec];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)pairingType
{
  id v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyPairingType];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSData)publicClassAKey
{
  return (NSData *)[(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyEncryptionClassAKey];
}

- (NSData)publicClassCKey
{
  return (NSData *)[(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyEncryptionClassCKey];
}

- (NSData)publicClassDKey
{
  return (NSData *)[(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyEncryptionKey];
}

- (NSData)pushToken
{
  return (NSData *)[(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyPushToken];
}

- (id)identities
{
  return [(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyIdentities];
}

+ (id)iCloudIdentitiesFromIdentities:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = IDSDevicePropertyIdentitiesURI;
    uint64_t v10 = IDSLocalDeviceIdentity;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v9, (void)v16);
        unsigned __int8 v14 = [v13 isEqualToString:v10];

        if ((v14 & 1) == 0) {
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)localIdentitiesFromIdentities:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = IDSDevicePropertyIdentitiesURI;
    uint64_t v10 = IDSLocalDeviceIdentity;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v9, (void)v16);
        unsigned int v14 = [v13 isEqualToString:v10];

        if (v14) {
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)iCloudIdentities
{
  id v2 = [(IDSPairedDevice *)self identities];
  id v3 = +[IDSPairedDevice iCloudIdentitiesFromIdentities:v2];

  return (NSArray *)v3;
}

- (NSArray)localIdentities
{
  id v2 = [(IDSPairedDevice *)self identities];
  id v3 = +[IDSPairedDevice localIdentitiesFromIdentities:v2];

  return (NSArray *)v3;
}

- (NSArray)iCloudURIs
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(IDSPairedDevice *)self iCloudIdentities];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = IDSDevicePropertyIdentitiesURI;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:v8];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSDictionary)privateData
{
  id v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:IDSDevicePropertyPrivateDeviceData];
  id v3 = [v2 copy];

  return (NSDictionary *)v3;
}

- (NSString)buildVersion
{
  id v2 = [(IDSPairedDevice *)self privateData];
  id v3 = [v2 objectForKey:IDSPrivateDeviceDataProductBuildVersion];

  return (NSString *)v3;
}

- (NSString)productVersion
{
  id v2 = [(IDSPairedDevice *)self privateData];
  id v3 = [v2 objectForKey:IDSPrivateDeviceDataProductVersion];

  return (NSString *)v3;
}

- (NSString)productName
{
  id v2 = [(IDSPairedDevice *)self privateData];
  id v3 = [v2 objectForKey:IDSPrivateDeviceDataProductName];

  return (NSString *)v3;
}

- (unsigned)pairingProtocolVersion
{
  pairingProtocolVersion = self->_pairingProtocolVersion;
  if (pairingProtocolVersion) {
    LODWORD(pairingProtocolVersion) = [(NSNumber *)pairingProtocolVersion unsignedIntValue];
  }
  return pairingProtocolVersion;
}

- (unsigned)minCompatibilityVersion
{
  minCompatibilityVersion = self->_minCompatibilityVersion;
  if (minCompatibilityVersion) {
    return [(NSNumber *)minCompatibilityVersion unsignedIntValue];
  }
  else {
    return -1;
  }
}

- (unsigned)maxCompatibilityVersion
{
  maxCompatibilityVersion = self->_maxCompatibilityVersion;
  if (maxCompatibilityVersion) {
    return [(NSNumber *)maxCompatibilityVersion unsignedIntValue];
  }
  else {
    return -1;
  }
}

- (unsigned)serviceMinCompatibilityVersion
{
  serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion;
  if (serviceMinCompatibilityVersion) {
    LODWORD(serviceMinCompatibilityVersion) = [(NSNumber *)serviceMinCompatibilityVersion unsignedIntValue];
  }
  return serviceMinCompatibilityVersion;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = [(NSDictionary *)self->_properties mutableCopy];
  [v3 removeObjectForKey:IDSDevicePropertyEncryptionKey];
  [v3 removeObjectForKey:IDSDevicePropertyEncryptionClassAKey];
  [v3 removeObjectForKey:IDSDevicePropertyEncryptionClassCKey];
  [v3 removeObjectForKey:IDSDevicePropertyIdentifier];
  id v4 = [(IDSPairedDevice *)self uniqueID];
  if (v4) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSDevicePropertyIdentifierOverride, v4);
  }

  pairingProtocolVersion = self->_pairingProtocolVersion;
  if (pairingProtocolVersion) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSDevicePropertyPairingProtocolVersion, pairingProtocolVersion);
  }
  minCompatibilityVersion = self->_minCompatibilityVersion;
  if (minCompatibilityVersion) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSDevicePropertyMinCompatibilityVersion, minCompatibilityVersion);
  }
  maxCompatibilityVersion = self->_maxCompatibilityVersion;
  if (maxCompatibilityVersion) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSDevicePropertyMaxCompatibilityVersion, maxCompatibilityVersion);
  }
  serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion;
  if (serviceMinCompatibilityVersion) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSDeviceServicePropertyMinCompatibilityVersion, serviceMinCompatibilityVersion);
  }

  return (NSDictionary *)v3;
}

- (BOOL)hasAllPublicKeys
{
  id v3 = [(IDSPairedDevice *)self publicClassAKey];
  if (v3)
  {
    id v4 = [(IDSPairedDevice *)self publicClassCKey];
    if (v4)
    {
      id v5 = [(IDSPairedDevice *)self publicClassDKey];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isPairing
{
  return ![(IDSPairedDevice *)self hasAllPublicKeys];
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)IDSPairedDevice;
  id v3 = [(IDSPairedDevice *)&v9 description];
  id v4 = [(IDSPairedDevice *)self uniqueID];
  id v5 = [(IDSPairedDevice *)self cbuuid];
  if ([(IDSPairedDevice *)self isActive]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  uint64_t v7 = +[NSString stringWithFormat:@"%@ uniqueID = %@, cbuuid = %@, isActive = %@, supportsIPSec = %d, pairingType = %ld", v3, v4, v5, v6, [(IDSPairedDevice *)self supportIPsec], [(IDSPairedDevice *)self pairingType]];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceMinCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_maxCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_minCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_pairingProtocolVersion, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end