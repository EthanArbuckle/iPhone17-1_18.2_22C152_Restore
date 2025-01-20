@interface DADiscoveryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsBluetoothPairing;
- (BOOL)allowsRename;
- (BOOL)presenceOnly;
- (DADiscoveryConfiguration)initWithCoder:(id)a3;
- (DADiscoveryConfiguration)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)bluetoothCompanyIdentifiers;
- (NSArray)bluetoothServices;
- (NSArray)bonjourServiceTypes;
- (NSArray)hotspotSSIDPrefixes;
- (NSArray)hotspotSSIDs;
- (NSData)bluetoothCompanyPayload;
- (NSData)bluetoothCompanyPayloadMask;
- (NSData)bluetoothServicePayload;
- (NSData)bluetoothServicePayloadMask;
- (NSString)associationIdentifier;
- (NSString)bluetoothNameSubstring;
- (NSString)bundleID;
- (NSString)displayName;
- (NSString)networkHotspotSSID;
- (NSUUID)bluetoothIdentifier;
- (UTType)iconType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bluetoothRange;
- (unint64_t)bluetoothNameSubstringCompareOptions;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAllowsBluetoothPairing:(BOOL)a3;
- (void)setAllowsRename:(BOOL)a3;
- (void)setAssociationIdentifier:(id)a3;
- (void)setBluetoothCompanyIdentifiers:(id)a3;
- (void)setBluetoothCompanyPayload:(id)a3;
- (void)setBluetoothCompanyPayloadMask:(id)a3;
- (void)setBluetoothIdentifier:(id)a3;
- (void)setBluetoothNameSubstring:(id)a3;
- (void)setBluetoothNameSubstringCompareOptions:(unint64_t)a3;
- (void)setBluetoothRange:(int64_t)a3;
- (void)setBluetoothServicePayload:(id)a3;
- (void)setBluetoothServicePayloadMask:(id)a3;
- (void)setBluetoothServices:(id)a3;
- (void)setBonjourServiceTypes:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHotspotSSIDPrefixes:(id)a3;
- (void)setHotspotSSIDs:(id)a3;
- (void)setIconType:(id)a3;
- (void)setNetworkHotspotSSID:(id)a3;
- (void)setPresenceOnly:(BOOL)a3;
@end

@implementation DADiscoveryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DADiscoveryConfiguration)initWithCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(DADiscoveryConfiguration *)self init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v32 = 0;
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    if ([v12 containsValueForKey:@"btNC"]) {
      v5->_bluetoothNameSubstringCompareOptions = [v12 decodeIntegerForKey:@"btNC"];
    }

    id v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v14 = v13;
    if ([v14 containsValueForKey:@"btAP"]) {
      v5->_allowsBluetoothPairing = [v14 decodeBoolForKey:@"btAP"];
    }

    id v15 = v14;
    if ([v15 containsValueForKey:@"btRg"]) {
      v5->_bluetoothRange = [v15 decodeIntegerForKey:@"btRg"];
    }

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v18 = v17;
    if ([v18 containsValueForKey:@"alRn"]) {
      v5->_allowsRename = [v18 decodeBoolForKey:@"alRn"];
    }

    id v19 = v18;
    if ([v19 containsValueForKey:@"dsFs"]) {
      v5->_flags = [v19 decodeIntegerForKey:@"dsFs"];
    }

    id v20 = v19;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v21 = v20;
    if ([v21 containsValueForKey:@"prOn"]) {
      v5->_presenceOnly = [v21 decodeBoolForKey:@"prOn"];
    }

    v22 = v5;
  }
  else
  {
    uint64_t v24 = objc_opt_class();
    v31 = DAErrorF(350001, (uint64_t)"%@ init failed", v25, v26, v27, v28, v29, v30, v24);
    [v4 failWithError:v31];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  associationIdentifier = self->_associationIdentifier;
  if (associationIdentifier) {
    [v4 encodeObject:associationIdentifier forKey:@"id"];
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier) {
    [v5 encodeObject:bluetoothIdentifier forKey:@"btID"];
  }
  bluetoothCompanyIdentifiers = self->_bluetoothCompanyIdentifiers;
  if (bluetoothCompanyIdentifiers) {
    [v5 encodeObject:bluetoothCompanyIdentifiers forKey:@"btCI"];
  }
  bluetoothCompanyPayload = self->_bluetoothCompanyPayload;
  if (bluetoothCompanyPayload) {
    [v5 encodeObject:bluetoothCompanyPayload forKey:@"btCP"];
  }
  bluetoothCompanyPayloadMask = self->_bluetoothCompanyPayloadMask;
  if (bluetoothCompanyPayloadMask) {
    [v5 encodeObject:bluetoothCompanyPayloadMask forKey:@"btCM"];
  }
  id v11 = self->_bluetoothServices;
  id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v11, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v11;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "data", (void)v32);
        [v12 addObject:v18];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  if (v12) {
    [v5 encodeObject:v12 forKey:@"btSv"];
  }
  bluetoothServicePayload = self->_bluetoothServicePayload;
  if (bluetoothServicePayload) {
    [v5 encodeObject:bluetoothServicePayload forKey:@"btSP"];
  }
  bluetoothServicePayloadMask = self->_bluetoothServicePayloadMask;
  if (bluetoothServicePayloadMask) {
    [v5 encodeObject:bluetoothServicePayloadMask forKey:@"btSM"];
  }
  unint64_t bluetoothNameSubstringCompareOptions = self->_bluetoothNameSubstringCompareOptions;
  if (bluetoothNameSubstringCompareOptions) {
    [v5 encodeInteger:bluetoothNameSubstringCompareOptions forKey:@"btNC"];
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring) {
    [v5 encodeObject:bluetoothNameSubstring forKey:@"btNS"];
  }
  if (self->_allowsBluetoothPairing) {
    [v5 encodeBool:1 forKey:@"btAP"];
  }
  int64_t bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange) {
    [v5 encodeInteger:bluetoothRange forKey:@"btRg"];
  }
  bonjourServiceTypes = self->_bonjourServiceTypes;
  if (bonjourServiceTypes) {
    [v5 encodeObject:bonjourServiceTypes forKey:@"bjST"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v5 encodeObject:bundleID forKey:@"bndI"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v5 encodeObject:displayName forKey:@"name"];
  }
  if (self->_allowsRename) {
    [v5 encodeBool:1 forKey:@"alRn"];
  }
  unint64_t flags = self->_flags;
  if (flags) {
    [v5 encodeInteger:flags forKey:@"dsFs"];
  }
  networkHotspotSSID = self->_networkHotspotSSID;
  if (networkHotspotSSID) {
    [v5 encodeObject:networkHotspotSSID forKey:@"neHsd"];
  }
  hotspotSSIDs = self->_hotspotSSIDs;
  if (hotspotSSIDs) {
    [v5 encodeObject:hotspotSSIDs forKey:@"hSds"];
  }
  hotspotSSIDPrefixes = self->_hotspotSSIDPrefixes;
  if (hotspotSSIDPrefixes) {
    [v5 encodeObject:hotspotSSIDPrefixes forKey:@"hSPs"];
  }
  iconType = self->_iconType;
  if (iconType) {
    [v5 encodeObject:iconType forKey:@"dvPT"];
  }
  if (self->_presenceOnly) {
    [v5 encodeBool:1 forKey:@"prOn"];
  }
}

- (DADiscoveryConfiguration)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DADiscoveryConfiguration *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_33;
    }
    uint64_t v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, v24);
LABEL_32:
    uint64_t v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (MEMORY[0x223C529E0](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_33;
    }
    DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
    goto LABEL_32;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSUUID()
    || !CUXPCDecodeNSArrayOfInteger()
    || !CUXPCDecodeNSData()
    || !CUXPCDecodeNSData())
  {
    goto LABEL_33;
  }
  int v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v7->_int64_t bluetoothRange = 0;
    goto LABEL_11;
  }
  if (v14 == 5)
  {
LABEL_33:
    uint64_t v15 = 0;
    goto LABEL_27;
  }
LABEL_11:
  if (!DAXPCDecodeNSArrayOfCBUUID(v6, "btSv", (id *)&v7->_bluetoothServices, a4)
    || !CUXPCDecodeNSData()
    || !CUXPCDecodeNSData())
  {
    goto LABEL_33;
  }
  if (CUXPCDecodeUInt64RangedEx() == 6) {
    v7->_unint64_t bluetoothNameSubstringCompareOptions = 0;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeBool()
    || !CUXPCDecodeNSArrayOfNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_33;
  }
  CUXPCDecodeNSString();
  CUXPCDecodeBool();
  if (CUXPCDecodeUInt64RangedEx() == 6) {
    v7->_unint64_t flags = 0;
  }
  CUXPCDecodeNSString();
  if (!CUXPCDecodeNSArrayOfNSString() || !CUXPCDecodeNSArrayOfNSString()) {
    goto LABEL_33;
  }
  CUXPCDecodeNSString();
  if (CUXPCDecodeBool()) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = 0;
  }

LABEL_27:
  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSString *)self->_associationIdentifier UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "id", v5);
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    id v7 = v4;
    [(NSUUID *)bluetoothIdentifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v7, "btID", uuid);
  }
  CUXPCEncodeNSArrayOfNSNumber();
  bluetoothCompanyPayload = self->_bluetoothCompanyPayload;
  if (bluetoothCompanyPayload)
  {
    uint64_t v9 = bluetoothCompanyPayload;
    id v10 = v4;
    uint64_t v11 = v9;
    uint64_t v12 = [(NSData *)v11 bytes];
    if (v12) {
      uint64_t v13 = (const char *)v12;
    }
    else {
      uint64_t v13 = "";
    }
    size_t v14 = [(NSData *)v11 length];

    xpc_dictionary_set_data(v10, "btCP", v13, v14);
  }
  bluetoothCompanyPayloadMask = self->_bluetoothCompanyPayloadMask;
  if (bluetoothCompanyPayloadMask)
  {
    uint64_t v16 = bluetoothCompanyPayloadMask;
    id v17 = v4;
    uint64_t v18 = v16;
    uint64_t v19 = [(NSData *)v18 bytes];
    if (v19) {
      uint64_t v20 = (const char *)v19;
    }
    else {
      uint64_t v20 = "";
    }
    size_t v21 = [(NSData *)v18 length];

    xpc_dictionary_set_data(v17, "btCM", v20, v21);
  }
  int64_t bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange) {
    xpc_dictionary_set_int64(v4, "btRg", bluetoothRange);
  }
  DAXPCEncodeNSArrayOfCBUUID(v4, "btSv", self->_bluetoothServices);
  bluetoothServicePayload = self->_bluetoothServicePayload;
  if (bluetoothServicePayload)
  {
    uint64_t v24 = bluetoothServicePayload;
    id v25 = v4;
    uint64_t v26 = v24;
    uint64_t v27 = [(NSData *)v26 bytes];
    if (v27) {
      uint64_t v28 = (const char *)v27;
    }
    else {
      uint64_t v28 = "";
    }
    size_t v29 = [(NSData *)v26 length];

    xpc_dictionary_set_data(v25, "btSP", v28, v29);
  }
  bluetoothServicePayloadMask = self->_bluetoothServicePayloadMask;
  if (bluetoothServicePayloadMask)
  {
    v31 = bluetoothServicePayloadMask;
    id v32 = v4;
    long long v33 = v31;
    uint64_t v34 = [(NSData *)v33 bytes];
    if (v34) {
      long long v35 = (const char *)v34;
    }
    else {
      long long v35 = "";
    }
    size_t v36 = [(NSData *)v33 length];

    xpc_dictionary_set_data(v32, "btSM", v35, v36);
  }
  uint64_t bluetoothNameSubstringCompareOptions = self->_bluetoothNameSubstringCompareOptions;
  if (bluetoothNameSubstringCompareOptions) {
    xpc_dictionary_set_uint64(v4, "btNC", bluetoothNameSubstringCompareOptions);
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  id v39 = v4;
  v40 = [(NSString *)bluetoothNameSubstring UTF8String];
  if (v40) {
    xpc_dictionary_set_string(v39, "btNS", v40);
  }

  if (self->_allowsBluetoothPairing) {
    xpc_dictionary_set_BOOL(v39, "btAP", 1);
  }
  CUXPCEncodeNSArrayOfNSString();
  bundleID = self->_bundleID;
  id v42 = v39;
  v43 = [(NSString *)bundleID UTF8String];
  if (v43) {
    xpc_dictionary_set_string(v42, "bndI", v43);
  }

  uint64_t flags = self->_flags;
  if (flags) {
    xpc_dictionary_set_uint64(v42, "dsFs", flags);
  }
  networkHotspotSSID = self->_networkHotspotSSID;
  id v46 = v42;
  v47 = [(NSString *)networkHotspotSSID UTF8String];
  if (v47) {
    xpc_dictionary_set_string(v46, "neHsd", v47);
  }

  CUXPCEncodeNSArrayOfNSString();
  CUXPCEncodeNSArrayOfNSString();
  displayName = self->_displayName;
  id v49 = v46;
  v50 = [(NSString *)displayName UTF8String];
  if (v50) {
    xpc_dictionary_set_string(v49, "name", v50);
  }

  if (self->_allowsRename) {
    xpc_dictionary_set_BOOL(v49, "alRn", 1);
  }
  v51 = [(UTType *)self->_iconType identifier];
  id v52 = v49;
  id v53 = v51;
  v54 = (const char *)[v53 UTF8String];
  if (v54) {
    xpc_dictionary_set_string(v52, "dvPT", v54);
  }

  if (self->_presenceOnly) {
    xpc_dictionary_set_BOOL(v52, "prOn", 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_associationIdentifier copy];
  id v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSUUID *)self->_bluetoothIdentifier copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSArray *)self->_bluetoothCompanyIdentifiers copy];
  id v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  objc_storeStrong((id *)(v4 + 40), self->_bluetoothCompanyPayload);
  objc_storeStrong((id *)(v4 + 48), self->_bluetoothCompanyPayloadMask);
  *(void *)(v4 + 120) = self->_bluetoothRange;
  uint64_t v11 = [(NSArray *)self->_bluetoothServices copy];
  uint64_t v12 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v11;

  uint64_t v13 = [(NSData *)self->_bluetoothServicePayload copy];
  size_t v14 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v13;

  uint64_t v15 = [(NSData *)self->_bluetoothServicePayloadMask copy];
  uint64_t v16 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v15;

  *(void *)(v4 + 80) = self->_bluetoothNameSubstringCompareOptions;
  uint64_t v17 = [(NSString *)self->_bluetoothNameSubstring copy];
  uint64_t v18 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v17;

  *(unsigned char *)(v4 + 8) = self->_allowsBluetoothPairing;
  uint64_t v19 = [(NSArray *)self->_bonjourServiceTypes copy];
  uint64_t v20 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v19;

  uint64_t v21 = [(NSString *)self->_bundleID copy];
  uint64_t v22 = *(void **)(v4 + 152);
  *(void *)(v4 + 152) = v21;

  uint64_t v23 = [(NSString *)self->_displayName copy];
  uint64_t v24 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v23;

  *(unsigned char *)(v4 + 9) = self->_allowsRename;
  *(void *)(v4 + 112) = self->_flags;
  uint64_t v25 = [(NSString *)self->_networkHotspotSSID copy];
  uint64_t v26 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v25;

  uint64_t v27 = [(NSArray *)self->_hotspotSSIDs copy];
  uint64_t v28 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = v27;

  uint64_t v29 = [(NSArray *)self->_hotspotSSIDPrefixes copy];
  uint64_t v30 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v29;

  uint64_t v31 = [(UTType *)self->_iconType copy];
  id v32 = *(void **)(v4 + 160);
  *(void *)(v4 + 160) = v31;

  *(unsigned char *)(v4 + 10) = self->_presenceOnly;
  return (id)v4;
}

- (id)description
{
  associationIdentifier = self->_associationIdentifier;
  if (associationIdentifier)
  {
    uint64_t v4 = associationIdentifier;
    v55 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v5 = (__CFString *)0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    uint64_t v7 = bluetoothIdentifier;
    uint64_t v56 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v8 = v5;

    uint64_t v5 = v8;
  }
  bluetoothCompanyIdentifiers = self->_bluetoothCompanyIdentifiers;
  if (bluetoothCompanyIdentifiers)
  {
    id v10 = bluetoothCompanyIdentifiers;
    v57 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v11 = v5;

    uint64_t v5 = v11;
  }
  bluetoothCompanyPayload = self->_bluetoothCompanyPayload;
  if (bluetoothCompanyPayload)
  {
    uint64_t v13 = bluetoothCompanyPayload;
    v58 = CUPrintNSObjectOneLine();
    CUAppendF();
    size_t v14 = v5;

    uint64_t v5 = v14;
  }
  bluetoothCompanyPayloadMask = self->_bluetoothCompanyPayloadMask;
  if (bluetoothCompanyPayloadMask)
  {
    uint64_t v16 = bluetoothCompanyPayloadMask;
    v59 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v17 = v5;

    uint64_t v5 = v17;
  }
  if (self->_bluetoothRange)
  {
    CUAppendF();
    uint64_t v18 = v5;

    uint64_t v5 = v18;
  }
  bluetoothServices = self->_bluetoothServices;
  if (bluetoothServices)
  {
    uint64_t v20 = bluetoothServices;
    v60 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v21 = v5;

    uint64_t v5 = v21;
  }
  bluetoothServicePayload = self->_bluetoothServicePayload;
  if (bluetoothServicePayload)
  {
    uint64_t v23 = bluetoothServicePayload;
    v61 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v24 = v5;

    uint64_t v5 = v24;
  }
  bluetoothServicePayloadMask = self->_bluetoothServicePayloadMask;
  if (bluetoothServicePayloadMask)
  {
    uint64_t v26 = bluetoothServicePayloadMask;
    v62 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v27 = v5;

    uint64_t v5 = v27;
  }
  if (self->_bluetoothNameSubstringCompareOptions)
  {
    CUAppendF();
    uint64_t v28 = v5;

    uint64_t v5 = v28;
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring)
  {
    uint64_t v30 = bluetoothNameSubstring;
    v63 = CUPrintNSObjectOneLine();
    CUAppendF();
    uint64_t v31 = v5;

    uint64_t v5 = v31;
  }
  if (self->_allowsBluetoothPairing)
  {
    CUAppendF();
    id v32 = v5;

    uint64_t v5 = v32;
  }
  bonjourServiceTypes = self->_bonjourServiceTypes;
  if (bonjourServiceTypes)
  {
    uint64_t v34 = bonjourServiceTypes;
    v64 = CUPrintNSObjectOneLine();
    CUAppendF();
    long long v35 = v5;

    uint64_t v5 = v35;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v65 = bundleID;
    CUAppendF();
    uint64_t v37 = v5;

    uint64_t v5 = v37;
  }
  if (self->_flags)
  {
    v66 = CUPrintFlags64();
    CUAppendF();
    v38 = v5;

    uint64_t v5 = v38;
  }
  networkHotspotSSID = self->_networkHotspotSSID;
  if (networkHotspotSSID)
  {
    v40 = networkHotspotSSID;
    v67 = CUPrintNSObjectOneLine();
    CUAppendF();
    v41 = v5;

    uint64_t v5 = v41;
  }
  hotspotSSIDs = self->_hotspotSSIDs;
  if (hotspotSSIDs)
  {
    v43 = hotspotSSIDs;
    v68 = CUPrintNSObjectOneLine();
    CUAppendF();
    v44 = v5;

    uint64_t v5 = v44;
  }
  hotspotSSIDPrefixes = self->_hotspotSSIDPrefixes;
  if (hotspotSSIDPrefixes)
  {
    id v46 = hotspotSSIDPrefixes;
    v69 = CUPrintNSObjectOneLine();
    CUAppendF();
    v47 = v5;

    uint64_t v5 = v47;
  }
  iconType = self->_iconType;
  if (iconType)
  {
    id v49 = iconType;
    v70 = CUPrintNSObjectOneLine();
    CUAppendF();
    v50 = v5;

    uint64_t v5 = v50;
  }
  if (self->_presenceOnly)
  {
    CUAppendF();
    v51 = v5;

    uint64_t v5 = v51;
  }
  id v52 = @"none";
  if (v5) {
    id v52 = v5;
  }
  id v53 = v52;

  return v53;
}

- (BOOL)allowsBluetoothPairing
{
  return self->_allowsBluetoothPairing;
}

- (void)setAllowsBluetoothPairing:(BOOL)a3
{
  self->_allowsBluetoothPairing = a3;
}

- (NSString)associationIdentifier
{
  return self->_associationIdentifier;
}

- (void)setAssociationIdentifier:(id)a3
{
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
}

- (NSArray)bluetoothCompanyIdentifiers
{
  return self->_bluetoothCompanyIdentifiers;
}

- (void)setBluetoothCompanyIdentifiers:(id)a3
{
}

- (NSData)bluetoothCompanyPayload
{
  return self->_bluetoothCompanyPayload;
}

- (void)setBluetoothCompanyPayload:(id)a3
{
}

- (NSData)bluetoothCompanyPayloadMask
{
  return self->_bluetoothCompanyPayloadMask;
}

- (void)setBluetoothCompanyPayloadMask:(id)a3
{
}

- (NSArray)bluetoothServices
{
  return self->_bluetoothServices;
}

- (void)setBluetoothServices:(id)a3
{
}

- (NSData)bluetoothServicePayload
{
  return self->_bluetoothServicePayload;
}

- (void)setBluetoothServicePayload:(id)a3
{
}

- (NSData)bluetoothServicePayloadMask
{
  return self->_bluetoothServicePayloadMask;
}

- (void)setBluetoothServicePayloadMask:(id)a3
{
}

- (unint64_t)bluetoothNameSubstringCompareOptions
{
  return self->_bluetoothNameSubstringCompareOptions;
}

- (void)setBluetoothNameSubstringCompareOptions:(unint64_t)a3
{
  self->_uint64_t bluetoothNameSubstringCompareOptions = a3;
}

- (NSString)bluetoothNameSubstring
{
  return self->_bluetoothNameSubstring;
}

- (void)setBluetoothNameSubstring:(id)a3
{
}

- (NSArray)bonjourServiceTypes
{
  return self->_bonjourServiceTypes;
}

- (void)setBonjourServiceTypes:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)allowsRename
{
  return self->_allowsRename;
}

- (void)setAllowsRename:(BOOL)a3
{
  self->_allowsRename = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_uint64_t flags = a3;
}

- (int64_t)bluetoothRange
{
  return self->_bluetoothRange;
}

- (void)setBluetoothRange:(int64_t)a3
{
  self->_int64_t bluetoothRange = a3;
}

- (NSString)networkHotspotSSID
{
  return self->_networkHotspotSSID;
}

- (void)setNetworkHotspotSSID:(id)a3
{
}

- (NSArray)hotspotSSIDs
{
  return self->_hotspotSSIDs;
}

- (void)setHotspotSSIDs:(id)a3
{
}

- (NSArray)hotspotSSIDPrefixes
{
  return self->_hotspotSSIDPrefixes;
}

- (void)setHotspotSSIDPrefixes:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (UTType)iconType
{
  return self->_iconType;
}

- (void)setIconType:(id)a3
{
}

- (BOOL)presenceOnly
{
  return self->_presenceOnly;
}

- (void)setPresenceOnly:(BOOL)a3
{
  self->_presenceOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconType, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_hotspotSSIDPrefixes, 0);
  objc_storeStrong((id *)&self->_hotspotSSIDs, 0);
  objc_storeStrong((id *)&self->_networkHotspotSSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bonjourServiceTypes, 0);
  objc_storeStrong((id *)&self->_bluetoothNameSubstring, 0);
  objc_storeStrong((id *)&self->_bluetoothServicePayloadMask, 0);
  objc_storeStrong((id *)&self->_bluetoothServicePayload, 0);
  objc_storeStrong((id *)&self->_bluetoothServices, 0);
  objc_storeStrong((id *)&self->_bluetoothCompanyPayloadMask, 0);
  objc_storeStrong((id *)&self->_bluetoothCompanyPayload, 0);
  objc_storeStrong((id *)&self->_bluetoothCompanyIdentifiers, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);

  objc_storeStrong((id *)&self->_associationIdentifier, 0);
}

@end