@interface ASDiscoveryDescriptor
+ (BOOL)supportsSecureCoding;
- (ASDiscoveryDescriptor)initWithCoder:(id)a3;
- (ASDiscoveryDescriptor)initWithDiscoveryConfiguration:(id)a3;
- (ASDiscoveryDescriptor)initWithXPCObject:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (CBUUID)bluetoothServiceUUID;
- (NSData)bluetoothManufacturerDataBlob;
- (NSData)bluetoothManufacturerDataMask;
- (NSData)bluetoothServiceDataBlob;
- (NSData)bluetoothServiceDataMask;
- (NSString)SSID;
- (NSString)SSIDPrefix;
- (NSString)bluetoothNameSubstring;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)bluetoothRange;
- (unint64_t)bluetoothNameSubstringCompareOptions;
- (unint64_t)hash;
- (unint64_t)supportedOptions;
- (unsigned)bluetoothCompanyIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBluetoothCompanyIdentifier:(unsigned __int16)a3;
- (void)setBluetoothManufacturerDataBlob:(id)a3;
- (void)setBluetoothManufacturerDataMask:(id)a3;
- (void)setBluetoothNameSubstring:(id)a3;
- (void)setBluetoothNameSubstringCompareOptions:(unint64_t)a3;
- (void)setBluetoothRange:(int64_t)a3;
- (void)setBluetoothServiceDataBlob:(id)a3;
- (void)setBluetoothServiceDataMask:(id)a3;
- (void)setBluetoothServiceUUID:(id)a3;
- (void)setSSID:(id)a3;
- (void)setSSIDPrefix:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
@end

@implementation ASDiscoveryDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDiscoveryDescriptor)initWithDiscoveryConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(ASDiscoveryDescriptor *)self init];
  if (v5)
  {
    v6 = [v4 associationIdentifier];
    uint64_t v7 = [v4 displayName];
    v8 = (void *)v7;
    v9 = 0;
    if (v6 && v7)
    {
      v10 = [v4 bluetoothServices];
      v11 = [v10 firstObject];

      v12 = [v4 bluetoothCompanyIdentifiers];
      v13 = [v12 firstObject];
      unsigned __int16 v14 = [v13 unsignedShortValue];

      if (([v4 flags] & 2) != 0) {
        v5->_supportedOptions |= 2uLL;
      }
      if (([v4 flags] & 4) != 0) {
        v5->_supportedOptions |= 4uLL;
      }
      v5->_bluetoothCompanyIdentifier = v14;
      uint64_t v15 = [v4 bluetoothCompanyPayload];
      bluetoothManufacturerDataBlob = v5->_bluetoothManufacturerDataBlob;
      v5->_bluetoothManufacturerDataBlob = (NSData *)v15;

      uint64_t v17 = [v4 bluetoothCompanyPayloadMask];
      bluetoothManufacturerDataMask = v5->_bluetoothManufacturerDataMask;
      v5->_bluetoothManufacturerDataMask = (NSData *)v17;

      v5->_bluetoothNameSubstringCompareOptions = [v4 bluetoothNameSubstringCompareOptions];
      uint64_t v19 = [v4 bluetoothNameSubstring];
      bluetoothNameSubstring = v5->_bluetoothNameSubstring;
      v5->_bluetoothNameSubstring = (NSString *)v19;

      uint64_t v21 = [v4 bluetoothServicePayload];
      bluetoothServiceDataBlob = v5->_bluetoothServiceDataBlob;
      v5->_bluetoothServiceDataBlob = (NSData *)v21;

      uint64_t v23 = [v4 bluetoothServicePayloadMask];
      bluetoothServiceDataMask = v5->_bluetoothServiceDataMask;
      v5->_bluetoothServiceDataMask = (NSData *)v23;

      bluetoothServiceUUID = v5->_bluetoothServiceUUID;
      v5->_bluetoothServiceUUID = v11;
      v26 = v11;

      v27 = [v4 hotspotSSIDs];
      uint64_t v28 = [v27 firstObject];
      SSID = v5->_SSID;
      v5->_SSID = (NSString *)v28;

      v30 = [v4 hotspotSSIDPrefixes];
      uint64_t v31 = [v30 firstObject];
      SSIDPrefix = v5->_SSIDPrefix;
      v5->_SSIDPrefix = (NSString *)v31;

      v9 = v5;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ASDiscoveryDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDiscoveryDescriptor *)self init];
  if (v5)
  {
    id v6 = v4;
    if ([v6 containsValueForKey:@"fSp"]) {
      v5->_supportedOptions = [v6 decodeIntegerForKey:@"fSp"];
    }

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_bluetoothCompanyIdentifier = 0;
    }
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    if ([v9 containsValueForKey:@"aLC"]) {
      v5->_bluetoothNameSubstringCompareOptions = [v9 decodeIntegerForKey:@"aLC"];
    }

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v14 = v13;
    if ([v14 containsValueForKey:@"bRg"]) {
      v5->_bluetoothRange = [v14 decodeIntegerForKey:@"bRg"];
    }

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v17 = v5;
  }
  else
  {
    uint64_t v19 = objc_opt_class();
    v26 = ASErrorF(1, (uint64_t)"%@ init failed", v20, v21, v22, v23, v24, v25, v19);
    [v4 failWithError:v26];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  unint64_t supportedOptions = self->_supportedOptions;
  if (supportedOptions) {
    [v16 encodeInteger:supportedOptions forKey:@"fSp"];
  }
  if (self->_bluetoothCompanyIdentifier) {
    objc_msgSend(v16, "encodeInteger:forKey:");
  }
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  if (bluetoothManufacturerDataBlob) {
    [v16 encodeObject:bluetoothManufacturerDataBlob forKey:@"mdb"];
  }
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask) {
    [v16 encodeObject:bluetoothManufacturerDataMask forKey:@"mdm"];
  }
  unint64_t bluetoothNameSubstringCompareOptions = self->_bluetoothNameSubstringCompareOptions;
  if (bluetoothNameSubstringCompareOptions) {
    [v16 encodeInteger:bluetoothNameSubstringCompareOptions forKey:@"aLC"];
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring) {
    [v16 encodeObject:bluetoothNameSubstring forKey:@"aLn"];
  }
  int64_t bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange) {
    [v16 encodeInteger:bluetoothRange forKey:@"bRg"];
  }
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob) {
    [v16 encodeObject:bluetoothServiceDataBlob forKey:@"sdb"];
  }
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask) {
    [v16 encodeObject:bluetoothServiceDataMask forKey:@"sdm"];
  }
  id v12 = [(CBUUID *)self->_bluetoothServiceUUID data];
  if (v12) {
    [v16 encodeObject:v12 forKey:@"bSi"];
  }

  SSID = self->_SSID;
  if (SSID) {
    [v16 encodeObject:SSID forKey:@"wsd"];
  }
  SSIDPrefix = self->_SSIDPrefix;
  id v15 = v16;
  if (SSIDPrefix)
  {
    [v16 encodeObject:SSIDPrefix forKey:@"wsP"];
    id v15 = v16;
  }
}

- (ASDiscoveryDescriptor)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ASDiscoveryDescriptor *)self init];
  if (!v7)
  {
    if (a4)
    {
      id v16 = [(id)objc_opt_class() description];
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_17;
  }
  if (MEMORY[0x245670630](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      id v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_17:
    id v14 = 0;
    goto LABEL_12;
  }
  if (CUXPCDecodeUInt64RangedEx() == 6) {
    v7->_unint64_t supportedOptions = 0;
  }
  if (CUXPCDecodeUInt64RangedEx() == 6) {
    v7->_bluetoothCompanyIdentifier = 0;
  }
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  if (CUXPCDecodeUInt64RangedEx() == 6) {
    v7->_unint64_t bluetoothNameSubstringCompareOptions = 0;
  }
  CUXPCDecodeNSString();
  if (CUXPCDecodeSInt64RangedEx() == 6) {
    v7->_int64_t bluetoothRange = 0;
  }
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  CUXPCDecodeNSString();
  CUXPCDecodeNSString();
  id v14 = v7;

LABEL_12:
  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t supportedOptions = self->_supportedOptions;
  if (supportedOptions) {
    xpc_dictionary_set_uint64(v4, "fSp", supportedOptions);
  }
  if (self->_bluetoothCompanyIdentifier) {
    xpc_dictionary_set_uint64(v5, "bcI", self->_bluetoothCompanyIdentifier);
  }
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  if (bluetoothManufacturerDataBlob)
  {
    uint64_t v8 = bluetoothManufacturerDataBlob;
    id v9 = v5;
    uint64_t v10 = v8;
    uint64_t v11 = [(NSData *)v10 bytes];
    if (v11) {
      uint64_t v12 = (const char *)v11;
    }
    else {
      uint64_t v12 = "";
    }
    size_t v13 = [(NSData *)v10 length];

    xpc_dictionary_set_data(v9, "mdb", v12, v13);
  }
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask)
  {
    id v15 = bluetoothManufacturerDataMask;
    id v16 = v5;
    uint64_t v17 = v15;
    uint64_t v18 = [(NSData *)v17 bytes];
    if (v18) {
      uint64_t v19 = (const char *)v18;
    }
    else {
      uint64_t v19 = "";
    }
    size_t v20 = [(NSData *)v17 length];

    xpc_dictionary_set_data(v16, "mdm", v19, v20);
  }
  uint64_t bluetoothNameSubstringCompareOptions = self->_bluetoothNameSubstringCompareOptions;
  if (bluetoothNameSubstringCompareOptions) {
    xpc_dictionary_set_uint64(v5, "aLC", bluetoothNameSubstringCompareOptions);
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  id v23 = v5;
  uint64_t v24 = [(NSString *)bluetoothNameSubstring UTF8String];
  if (v24) {
    xpc_dictionary_set_string(v23, "aLn", v24);
  }

  int64_t bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange) {
    xpc_dictionary_set_int64(v23, "bRg", bluetoothRange);
  }
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob)
  {
    v27 = bluetoothServiceDataBlob;
    id v28 = v23;
    v29 = v27;
    uint64_t v30 = [(NSData *)v29 bytes];
    if (v30) {
      uint64_t v31 = (const char *)v30;
    }
    else {
      uint64_t v31 = "";
    }
    size_t v32 = [(NSData *)v29 length];

    xpc_dictionary_set_data(v28, "sdb", v31, v32);
  }
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask)
  {
    v34 = bluetoothServiceDataMask;
    id v35 = v23;
    v36 = v34;
    uint64_t v37 = [(NSData *)v36 bytes];
    if (v37) {
      v38 = (const char *)v37;
    }
    else {
      v38 = "";
    }
    size_t v39 = [(NSData *)v36 length];

    xpc_dictionary_set_data(v35, "sdm", v38, v39);
  }
  v40 = [(CBUUID *)self->_bluetoothServiceUUID data];
  v41 = v40;
  if (v40)
  {
    id v42 = v40;
    id v43 = v23;
    uint64_t v44 = [v42 bytes];
    if (v44) {
      v45 = (const char *)v44;
    }
    else {
      v45 = "";
    }
    xpc_dictionary_set_data(v43, "bSi", v45, [v42 length]);
  }
  SSID = self->_SSID;
  id v47 = v23;
  v48 = [(NSString *)SSID UTF8String];
  if (v48) {
    xpc_dictionary_set_string(v47, "wsd", v48);
  }

  SSIDPrefix = self->_SSIDPrefix;
  xpc_object_t xdict = v47;
  v50 = [(NSString *)SSIDPrefix UTF8String];
  if (v50) {
    xpc_dictionary_set_string(xdict, "wsP", v50);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 16) = self->_supportedOptions;
  *(_WORD *)(v4 + 8) = self->_bluetoothCompanyIdentifier;
  uint64_t v5 = [(NSData *)self->_bluetoothManufacturerDataBlob copy];
  id v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(NSData *)self->_bluetoothManufacturerDataMask copy];
  uint64_t v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  *(void *)(v4 + 40) = self->_bluetoothNameSubstringCompareOptions;
  uint64_t v9 = [(NSString *)self->_bluetoothNameSubstring copy];
  uint64_t v10 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v9;

  *(void *)(v4 + 56) = self->_bluetoothRange;
  uint64_t v11 = [(NSData *)self->_bluetoothServiceDataBlob copy];
  uint64_t v12 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v11;

  uint64_t v13 = [(NSData *)self->_bluetoothServiceDataMask copy];
  id v14 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v13;

  uint64_t v15 = [(CBUUID *)self->_bluetoothServiceUUID copy];
  id v16 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v15;

  objc_storeStrong((id *)(v4 + 88), self->_SSID);
  objc_storeStrong((id *)(v4 + 96), self->_SSIDPrefix);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ASDiscoveryDescriptor *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v15 = 1;
    goto LABEL_12;
  }
  id v6 = v4;
  if ([(ASDiscoveryDescriptor *)v6 isMemberOfClass:objc_opt_class()])
  {
    unint64_t supportedOptions = self->_supportedOptions;
    if (supportedOptions == [(ASDiscoveryDescriptor *)v6 supportedOptions])
    {
      int bluetoothCompanyIdentifier = self->_bluetoothCompanyIdentifier;
      if (bluetoothCompanyIdentifier == [(ASDiscoveryDescriptor *)v6 bluetoothCompanyIdentifier])
      {
        bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
        uint64_t v10 = [(ASDiscoveryDescriptor *)v6 bluetoothManufacturerDataBlob];
        uint64_t v11 = bluetoothManufacturerDataBlob;
        uint64_t v12 = v10;
        uint64_t v13 = v12;
        if (v11 == v12)
        {
        }
        else
        {
          if ((v11 == 0) == (v12 != 0))
          {
            char v15 = 0;
            uint64_t v19 = v12;
LABEL_69:

            goto LABEL_70;
          }
          int v14 = [(NSData *)v11 isEqual:v12];

          if (!v14)
          {
            char v15 = 0;
LABEL_71:

            goto LABEL_10;
          }
        }
        bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
        uint64_t v18 = [(ASDiscoveryDescriptor *)v6 bluetoothManufacturerDataMask];
        uint64_t v19 = bluetoothManufacturerDataMask;
        size_t v20 = v18;
        uint64_t v11 = v20;
        if (v19 == v20)
        {
        }
        else
        {
          if ((v19 == 0) == (v20 != 0))
          {
            char v15 = 0;
            p_isa = (NSString *)&v20->super.isa;
LABEL_68:

            goto LABEL_69;
          }
          int v21 = [(NSData *)v19 isEqual:v20];

          if (!v21) {
            goto LABEL_25;
          }
        }
        unint64_t bluetoothNameSubstringCompareOptions = self->_bluetoothNameSubstringCompareOptions;
        if (bluetoothNameSubstringCompareOptions != [(ASDiscoveryDescriptor *)v6 bluetoothNameSubstringCompareOptions])
        {
LABEL_25:
          char v15 = 0;
LABEL_70:

          goto LABEL_71;
        }
        bluetoothNameSubstring = self->_bluetoothNameSubstring;
        uint64_t v24 = [(ASDiscoveryDescriptor *)v6 bluetoothNameSubstring];
        p_isa = bluetoothNameSubstring;
        v26 = v24;
        uint64_t v19 = v26;
        if (p_isa == (NSString *)v26)
        {
        }
        else
        {
          if ((p_isa == 0) == (v26 != 0))
          {
            char v15 = 0;
            uint64_t v31 = v26;
LABEL_67:

            goto LABEL_68;
          }
          int v27 = [(NSString *)p_isa isEqual:v26];

          if (!v27) {
            goto LABEL_33;
          }
        }
        int64_t bluetoothRange = self->_bluetoothRange;
        if (bluetoothRange != [(ASDiscoveryDescriptor *)v6 bluetoothRange])
        {
LABEL_33:
          char v15 = 0;
          goto LABEL_69;
        }
        bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
        uint64_t v30 = [(ASDiscoveryDescriptor *)v6 bluetoothServiceDataBlob];
        uint64_t v31 = bluetoothServiceDataBlob;
        size_t v32 = v30;
        p_isa = (NSString *)&v32->super.isa;
        if (v31 == v32)
        {
        }
        else
        {
          if ((v31 == 0) == (v32 != 0))
          {
            char v15 = 0;
            v36 = v32;
LABEL_66:

            goto LABEL_67;
          }
          int v33 = [(NSData *)v31 isEqual:v32];

          if (!v33)
          {
            char v15 = 0;
            goto LABEL_68;
          }
        }
        bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
        id v35 = [(ASDiscoveryDescriptor *)v6 bluetoothServiceDataMask];
        v36 = bluetoothServiceDataMask;
        uint64_t v37 = v35;
        uint64_t v31 = v37;
        if (v36 == v37)
        {
        }
        else
        {
          if ((v36 == 0) == (v37 != 0))
          {
            char v15 = 0;
            id v43 = v37;
LABEL_65:

            goto LABEL_66;
          }
          int v38 = [(NSData *)v36 isEqual:v37];

          if (!v38)
          {
            char v15 = 0;
            goto LABEL_67;
          }
        }
        size_t v39 = [(CBUUID *)self->_bluetoothServiceUUID data];
        v57 = [(ASDiscoveryDescriptor *)v6 bluetoothServiceUUID];
        v40 = [(NSData *)v57 data];
        v36 = v39;
        v41 = v40;
        v56 = v41;
        if (v36 == v41)
        {
        }
        else
        {
          id v42 = (NSString *)&v41->super.isa;
          if ((v36 == 0) == (v41 != 0))
          {
            char v15 = 0;
            v55 = v36;
LABEL_62:

            goto LABEL_63;
          }
          int v53 = [(NSData *)v36 isEqual:v41];

          if (!v53)
          {
            char v15 = 0;
LABEL_64:

            id v43 = v57;
            goto LABEL_65;
          }
        }
        SSID = self->_SSID;
        v54 = [(ASDiscoveryDescriptor *)v6 SSID];
        id v42 = SSID;
        v45 = v54;
        v55 = (NSData *)v45;
        if (v42 == v45)
        {
        }
        else
        {
          v46 = v45;
          if ((v42 == 0) == (v45 != 0))
          {
            char v15 = 0;
LABEL_61:

            goto LABEL_62;
          }
          int v51 = [(NSString *)v42 isEqual:v45];

          if (!v51)
          {
            char v15 = 0;
LABEL_63:

            goto LABEL_64;
          }
        }
        SSIDPrefix = self->_SSIDPrefix;
        v50 = [(ASDiscoveryDescriptor *)v6 SSIDPrefix];
        v48 = SSIDPrefix;
        v49 = v50;
        id v42 = v49;
        v52 = v48;
        if (v48 == v49)
        {
          char v15 = 1;
        }
        else if ((v48 == 0) == (v49 != 0))
        {
          char v15 = 0;
        }
        else
        {
          char v15 = [(NSString *)v48 isEqual:v49];
        }

        v46 = v52;
        goto LABEL_61;
      }
    }
  }
  char v15 = 0;
LABEL_10:

LABEL_12:
  return v15;
}

- (id)description
{
  return [(ASDiscoveryDescriptor *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    uint64_t v4 = (__CFString *)0;
  }
  if (self->_supportedOptions)
  {
    id v28 = CUPrintFlags64();
    CUAppendF();
    uint64_t v5 = v4;

    uint64_t v4 = v5;
  }
  if (self->_bluetoothCompanyIdentifier)
  {
    CUAppendF();
    id v6 = v4;

    uint64_t v4 = v6;
  }
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  if (bluetoothManufacturerDataBlob)
  {
    v29 = bluetoothManufacturerDataBlob;
    CUAppendF();
    uint64_t v8 = v4;

    uint64_t v4 = v8;
  }
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask)
  {
    uint64_t v30 = bluetoothManufacturerDataMask;
    CUAppendF();
    uint64_t v10 = v4;

    uint64_t v4 = v10;
  }
  if (self->_bluetoothNameSubstringCompareOptions)
  {
    CUAppendF();
    uint64_t v11 = v4;

    uint64_t v4 = v11;
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring)
  {
    uint64_t v31 = bluetoothNameSubstring;
    CUAppendF();
    uint64_t v13 = v4;

    uint64_t v4 = v13;
  }
  if (self->_bluetoothRange)
  {
    CUAppendF();
    int v14 = v4;

    uint64_t v4 = v14;
  }
  bluetoothServiceUUID = self->_bluetoothServiceUUID;
  if (bluetoothServiceUUID)
  {
    size_t v32 = bluetoothServiceUUID;
    CUAppendF();
    id v16 = v4;

    uint64_t v4 = v16;
  }
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob)
  {
    int v33 = bluetoothServiceDataBlob;
    CUAppendF();
    uint64_t v18 = v4;

    uint64_t v4 = v18;
  }
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask)
  {
    v34 = bluetoothServiceDataMask;
    CUAppendF();
    size_t v20 = v4;

    uint64_t v4 = v20;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    id v35 = SSID;
    CUAppendF();
    uint64_t v22 = v4;

    uint64_t v4 = v22;
  }
  SSIDPrefix = self->_SSIDPrefix;
  if (SSIDPrefix)
  {
    v36 = SSIDPrefix;
    CUAppendF();
    uint64_t v24 = v4;

    uint64_t v4 = v24;
  }
  uint64_t v25 = &stru_26F86DD88;
  if (v4) {
    uint64_t v25 = v4;
  }
  v26 = v25;

  return v26;
}

- (unint64_t)hash
{
  uint64_t bluetoothCompanyIdentifier = self->_bluetoothCompanyIdentifier;
  unint64_t supportedOptions = self->_supportedOptions;
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  uint64_t v6 = supportedOptions ^ bluetoothCompanyIdentifier ^ 0x13;
  if (bluetoothManufacturerDataBlob) {
    v6 ^= [(NSData *)bluetoothManufacturerDataBlob hash];
  }
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask) {
    v6 ^= [(NSData *)bluetoothManufacturerDataMask hash];
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  unint64_t v9 = self->_bluetoothNameSubstringCompareOptions ^ v6;
  if (bluetoothNameSubstring) {
    v9 ^= [(NSString *)bluetoothNameSubstring hash];
  }
  unint64_t v10 = self->_bluetoothRange ^ v9;
  bluetoothServiceUUID = self->_bluetoothServiceUUID;
  if (bluetoothServiceUUID) {
    v10 ^= [(CBUUID *)bluetoothServiceUUID hash];
  }
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob) {
    v10 ^= [(NSData *)bluetoothServiceDataBlob hash];
  }
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask) {
    v10 ^= [(NSData *)bluetoothServiceDataMask hash];
  }
  SSID = self->_SSID;
  if (SSID) {
    v10 ^= [(NSString *)SSID hash];
  }
  SSIDPrefix = self->_SSIDPrefix;
  if (SSIDPrefix) {
    v10 ^= [(NSString *)SSIDPrefix hash];
  }
  return v10;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_unint64_t supportedOptions = a3;
}

- (unsigned)bluetoothCompanyIdentifier
{
  return self->_bluetoothCompanyIdentifier;
}

- (void)setBluetoothCompanyIdentifier:(unsigned __int16)a3
{
  self->_uint64_t bluetoothCompanyIdentifier = a3;
}

- (NSData)bluetoothManufacturerDataBlob
{
  return self->_bluetoothManufacturerDataBlob;
}

- (void)setBluetoothManufacturerDataBlob:(id)a3
{
}

- (NSData)bluetoothManufacturerDataMask
{
  return self->_bluetoothManufacturerDataMask;
}

- (void)setBluetoothManufacturerDataMask:(id)a3
{
}

- (unint64_t)bluetoothNameSubstringCompareOptions
{
  return self->_bluetoothNameSubstringCompareOptions;
}

- (void)setBluetoothNameSubstringCompareOptions:(unint64_t)a3
{
  self->_unint64_t bluetoothNameSubstringCompareOptions = a3;
}

- (NSString)bluetoothNameSubstring
{
  return self->_bluetoothNameSubstring;
}

- (void)setBluetoothNameSubstring:(id)a3
{
}

- (int64_t)bluetoothRange
{
  return self->_bluetoothRange;
}

- (void)setBluetoothRange:(int64_t)a3
{
  self->_int64_t bluetoothRange = a3;
}

- (NSData)bluetoothServiceDataBlob
{
  return self->_bluetoothServiceDataBlob;
}

- (void)setBluetoothServiceDataBlob:(id)a3
{
}

- (NSData)bluetoothServiceDataMask
{
  return self->_bluetoothServiceDataMask;
}

- (void)setBluetoothServiceDataMask:(id)a3
{
}

- (CBUUID)bluetoothServiceUUID
{
  return self->_bluetoothServiceUUID;
}

- (void)setBluetoothServiceUUID:(id)a3
{
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (NSString)SSIDPrefix
{
  return self->_SSIDPrefix;
}

- (void)setSSIDPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSIDPrefix, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_bluetoothServiceUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothServiceDataMask, 0);
  objc_storeStrong((id *)&self->_bluetoothServiceDataBlob, 0);
  objc_storeStrong((id *)&self->_bluetoothNameSubstring, 0);
  objc_storeStrong((id *)&self->_bluetoothManufacturerDataMask, 0);

  objc_storeStrong((id *)&self->_bluetoothManufacturerDataBlob, 0);
}

@end