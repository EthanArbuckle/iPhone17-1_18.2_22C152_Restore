@interface DDDevice
+ (BOOL)deviceMetadataURLValid:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (void)mergePersistentDictionary:(id)a3 into:(id)a4;
- (BOOL)allowPairing;
- (BOOL)supportsGrouping;
- (DDDevice)init;
- (DDDevice)initWithCoder:(id)a3;
- (DDDevice)initWithDisplayName:(NSString *)displayName category:(DDDeviceCategory)category protocolType:(UTType *)protocolType identifier:(NSString *)identifier;
- (DDDevice)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4;
- (DDDevice)initWithXPCObject:(id)a3 error:(id *)a4;
- (DDDeviceCategory)category;
- (DDDeviceMediaPlaybackState)mediaPlaybackState;
- (DDDeviceProtocol)protocol;
- (DDDeviceState)state;
- (NSData)txtRecordData;
- (NSDictionary)persistentDictionaryRepresentation;
- (NSString)SSID;
- (NSString)displayImageName;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)mediaContentSubtitle;
- (NSString)mediaContentTitle;
- (NSURL)url;
- (NSUUID)bluetoothIdentifier;
- (UTType)protocolType;
- (double)approveTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDADevice;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (nw_endpoint_t)networkEndpoint;
- (unint64_t)deviceSupports;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAllowPairing:(BOOL)a3;
- (void)setApproveTime:(double)a3;
- (void)setBluetoothIdentifier:(NSUUID *)bluetoothIdentifier;
- (void)setCategory:(DDDeviceCategory)category;
- (void)setDeviceSupports:(unint64_t)a3;
- (void)setDisplayImageName:(id)a3;
- (void)setDisplayName:(NSString *)displayName;
- (void)setIdentifier:(NSString *)identifier;
- (void)setMediaContentSubtitle:(NSString *)mediaContentSubtitle;
- (void)setMediaContentTitle:(NSString *)mediaContentTitle;
- (void)setMediaPlaybackState:(DDDeviceMediaPlaybackState)mediaPlaybackState;
- (void)setNetworkEndpoint:(nw_endpoint_t)networkEndpoint;
- (void)setProtocol:(DDDeviceProtocol)protocol;
- (void)setProtocolType:(UTType *)protocolType;
- (void)setSSID:(id)a3;
- (void)setState:(DDDeviceState)state;
- (void)setSupportsGrouping:(BOOL)supportsGrouping;
- (void)setTxtRecordData:(NSData *)txtRecordData;
- (void)setUrl:(NSURL *)url;
@end

@implementation DDDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createDADevice
{
  id v3 = objc_alloc_init(MEMORY[0x263F397C8]);
  v4 = v3;
  if (self->_bluetoothIdentifier) {
    objc_msgSend(v3, "setBluetoothIdentifier:");
  }
  if (self->_category) {
    objc_msgSend(v4, "setType:");
  }
  if (self->_displayName) {
    objc_msgSend(v4, "setName:");
  }
  if (self->_identifier) {
    objc_msgSend(v4, "setIdentifier:");
  }
  if (self->_networkEndpoint) {
    objc_msgSend(v4, "setNetworkEndpoint:");
  }
  if (self->_protocol) {
    objc_msgSend(v4, "setProtocol:");
  }
  if (self->_protocolType) {
    objc_msgSend(v4, "setProtocolType:");
  }
  if (self->_state) {
    objc_msgSend(v4, "setState:");
  }
  if (self->_supportsGrouping) {
    [v4 setSupportsGrouping:1];
  }
  if (self->_txtRecordData) {
    objc_msgSend(v4, "setTxtRecordData:");
  }
  if (self->_url) {
    objc_msgSend(v4, "setUrl:");
  }
  if (self->_mediaPlaybackState) {
    objc_msgSend(v4, "setMediaPlaybackState:");
  }
  if (self->_mediaContentTitle) {
    objc_msgSend(v4, "setMediaContentTitle:");
  }
  if (self->_mediaContentSubtitle) {
    objc_msgSend(v4, "setMediaContentArtistName:");
  }
  if (self->_displayImageName) {
    objc_msgSend(v4, "setDisplayImageName:");
  }
  if (self->_SSID) {
    objc_msgSend(v4, "setSSID:");
  }
  if (self->_allowPairing) {
    [v4 setAllowPairing:1];
  }
  if (([(DDDevice *)self deviceSupports] & 2) != 0) {
    [v4 setAllowPairing:1];
  }
  if (([(DDDevice *)self deviceSupports] & 4) != 0) {
    objc_msgSend(v4, "setFlags:", objc_msgSend(v4, "flags") | 0x10);
  }
  [v4 setPendingRemoval:0];

  return v4;
}

- (DDDevice)init
{
}

- (DDDevice)initWithDisplayName:(NSString *)displayName category:(DDDeviceCategory)category protocolType:(UTType *)protocolType identifier:(NSString *)identifier
{
  v11 = displayName;
  v12 = protocolType;
  v13 = identifier;
  v18.receiver = self;
  v18.super_class = (Class)DDDevice;
  v14 = [(DDDevice *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayName, displayName);
    v15->_category = category;
    objc_storeStrong((id *)&v15->_identifier, identifier);
    objc_storeStrong((id *)&v15->_protocolType, protocolType);
    v15->_supportsGrouping = 0;
    v16 = v15;
  }

  return v15;
}

- (DDDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DDDevice *)self init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    if ([v7 containsValueForKey:@"dvCa"]) {
      v5->_category = [v7 decodeIntegerForKey:@"dvCa"];
    }

    id v8 = v7;
    if ([v8 containsValueForKey:@"dfSp"]) {
      v5->_deviceSupports = [v8 decodeIntegerForKey:@"dfSp"];
    }

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    if ([v11 containsValueForKey:@"dvGr"]) {
      v5->_supportsGrouping = [v11 decodeBoolForKey:@"dvGr"];
    }

    objc_opt_class();
    NSDecodeObjectIfPresent();
    uint64_t v12 = [0 copyCEndpoint];
    networkEndpoint = v5->_networkEndpoint;
    v5->_networkEndpoint = (OS_nw_endpoint *)v12;

    id v14 = v11;
    if ([v14 containsValueForKey:@"dvPT"]) {
      v5->_protocol = [v14 decodeIntegerForKey:@"dvPT"];
    }

    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v17 = [NSURL URLWithString:0];
    if (v17) {
      objc_storeStrong((id *)&v5->_url, v17);
    }
    id v18 = v16;
    if ([v18 containsValueForKey:@"mpSt"]) {
      v5->_mediaPlaybackState = [v18 decodeIntegerForKey:@"mpSt"];
    }

    id v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v20 = v19;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v21 = v20;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v23 = v22;
    if ([v23 containsValueForKey:@"btAP"]) {
      v5->_allowPairing = [v23 decodeBoolForKey:@"btAP"];
    }

    v24 = v5;
  }
  else
  {
    uint64_t v26 = objc_opt_class();
    v33 = DDErrorF(350001, (uint64_t)"%@ init failed", v27, v28, v29, v30, v31, v32, v26);
    [v4 failWithError:v33];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier) {
    [v20 encodeObject:bluetoothIdentifier forKey:@"btID"];
  }
  int64_t category = self->_category;
  if (category) {
    [v20 encodeInteger:category forKey:@"dvCa"];
  }
  unint64_t deviceSupports = self->_deviceSupports;
  if (deviceSupports) {
    [v20 encodeInteger:deviceSupports forKey:@"dfSp"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v20 encodeObject:displayName forKey:@"name"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v20 encodeObject:identifier forKey:@"id"];
  }
  if (self->_supportsGrouping) {
    [v20 encodeBool:1 forKey:@"dvGr"];
  }
  id v9 = self->_networkEndpoint;
  if (v9)
  {
    id v10 = [MEMORY[0x263F143F8] endpointWithCEndpoint:v9];
    if (v10) {
      [v20 encodeObject:v10 forKey:@"nwEP"];
    }
  }
  int64_t protocol = self->_protocol;
  if (protocol) {
    [v20 encodeInteger:protocol forKey:@"dvPT"];
  }
  protocolType = self->_protocolType;
  if (protocolType) {
    [v20 encodeObject:protocolType forKey:@"prTy"];
  }
  txtRecordData = self->_txtRecordData;
  if (txtRecordData) {
    [v20 encodeObject:txtRecordData forKey:@"txRD"];
  }
  id v14 = [(NSURL *)self->_url absoluteString];
  if (v14) {
    [v20 encodeObject:v14 forKey:@"urlS"];
  }
  int64_t mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState) {
    [v20 encodeInteger:mediaPlaybackState forKey:@"mpSt"];
  }
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle) {
    [v20 encodeObject:mediaContentTitle forKey:@"mTi"];
  }
  mediaContentSubtitle = self->_mediaContentSubtitle;
  if (mediaContentSubtitle) {
    [v20 encodeObject:mediaContentSubtitle forKey:@"mArt"];
  }
  displayImageName = self->_displayImageName;
  if (displayImageName) {
    [v20 encodeObject:displayImageName forKey:@"dvDI"];
  }
  SSID = self->_SSID;
  if (SSID) {
    [v20 encodeObject:SSID forKey:@"ssID"];
  }
  if (self->_allowPairing) {
    [v20 encodeBool:1 forKey:@"btAP"];
  }
}

- (DDDevice)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DDDevice *)self init];
  if (v7)
  {
    CFDictionaryGetDouble();
    v7->_approveTime = v8;
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
      bluetoothIdentifier = v7->_bluetoothIdentifier;
      v7->_bluetoothIdentifier = (NSUUID *)v10;
    }
    uint64_t v12 = NSDictionaryGetNSNumber();
    v7->_int64_t category = [v12 integerValue];

    v7->_unint64_t deviceSupports = CFDictionaryGetInt64();
    CFStringGetTypeID();
    v13 = CFDictionaryGetTypedValue();
    if (v13) {
      objc_storeStrong((id *)&v7->_displayName, v13);
    }
    v33 = v13;
    CFStringGetTypeID();
    id v14 = CFDictionaryGetTypedValue();
    if (v14) {
      objc_storeStrong((id *)&v7->_identifier, v14);
    }
    CFDataGetTypeID();
    uint64_t v32 = CFDictionaryGetTypedValue();
    uint64_t v31 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v32 error:0];
    uint64_t v15 = [v31 copyCEndpoint];
    networkEndpoint = v7->_networkEndpoint;
    v7->_networkEndpoint = (OS_nw_endpoint *)v15;

    v17 = NSDictionaryGetNSNumber();
    v7->_int64_t protocol = [v17 integerValue];

    CFStringGetTypeID();
    id v18 = CFDictionaryGetTypedValue();
    if (v18)
    {
      id v19 = [MEMORY[0x263F1D920] typeWithIdentifier:v18];
      if (v19) {
        objc_storeStrong((id *)&v7->_protocolType, v19);
      }
    }
    id v20 = NSDictionaryGetNSNumber();
    v7->_state = [v20 integerValue];

    v7->_supportsGrouping = CFDictionaryGetInt64() != 0;
    CFDataGetTypeID();
    id v21 = CFDictionaryGetTypedValue();
    if (v21) {
      objc_storeStrong((id *)&v7->_txtRecordData, v21);
    }
    CFStringGetTypeID();
    id v22 = CFDictionaryGetTypedValue();
    if (v22)
    {
      id v23 = [NSURL URLWithString:v22];
      if (v23) {
        objc_storeStrong((id *)&v7->_url, v23);
      }
    }
    v24 = NSDictionaryGetNSNumber();
    v7->_int64_t mediaPlaybackState = [v24 integerValue];

    CFStringGetTypeID();
    v25 = CFDictionaryGetTypedValue();
    if (v25) {
      objc_storeStrong((id *)&v7->_mediaContentTitle, v25);
    }
    CFStringGetTypeID();
    uint64_t v26 = CFDictionaryGetTypedValue();
    if (v26) {
      objc_storeStrong((id *)&v7->_mediaContentSubtitle, v26);
    }
    CFStringGetTypeID();
    uint64_t v27 = CFDictionaryGetTypedValue();
    if (v27) {
      objc_storeStrong((id *)&v7->_displayImageName, v27);
    }
    CFStringGetTypeID();
    uint64_t v28 = CFDictionaryGetTypedValue();
    if (v28) {
      objc_storeStrong((id *)&v7->_SSID, v28);
    }
    v7->_allowPairing = CFDictionaryGetInt64() != 0;
    uint64_t v29 = v7;
  }
  else if (a4)
  {
    objc_opt_class();
    DAErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSDictionary)persistentDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [NSNumber numberWithDouble:self->_approveTime];
  [v3 setObject:v4 forKeyedSubscript:@"approveTime"];

  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    id v6 = [(NSUUID *)bluetoothIdentifier UUIDString];
    [v3 setObject:v6 forKeyedSubscript:@"bluetoothIdentifier"];
  }
  if (self->_category)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v7 forKeyedSubscript:@"type"];
  }
  double v8 = [NSNumber numberWithUnsignedInteger:self->_deviceSupports];
  [v3 setObject:v8 forKeyedSubscript:@"deviceFeatureSupport"];

  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKeyedSubscript:@"name"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  id v11 = self->_networkEndpoint;
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F143F8] endpointWithCEndpoint:v11];
    v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    if (v13) {
      [v3 setObject:v13 forKeyedSubscript:@"nwEndpoint"];
    }
  }
  if (self->_protocol)
  {
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v14 forKeyedSubscript:@"protocol"];
  }
  protocolType = self->_protocolType;
  if (protocolType)
  {
    id v16 = [(UTType *)protocolType identifier];
    [v3 setObject:v16 forKeyedSubscript:@"protocolType"];
  }
  v17 = [NSNumber numberWithInteger:self->_state];
  [v3 setObject:v17 forKeyedSubscript:@"deviceState"];

  id v18 = [NSNumber numberWithBool:self->_supportsGrouping];
  [v3 setObject:v18 forKeyedSubscript:@"deviceSupportsGrouping"];

  txtRecordData = self->_txtRecordData;
  if (txtRecordData) {
    [v3 setObject:txtRecordData forKeyedSubscript:@"txtRecordData"];
  }
  url = self->_url;
  if (url)
  {
    id v21 = [(NSURL *)url absoluteString];
    [v3 setObject:v21 forKeyedSubscript:@"url"];
  }
  if (self->_mediaPlaybackState)
  {
    id v22 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v22 forKeyedSubscript:@"mediaPlaybackState"];
  }
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle) {
    [v3 setObject:mediaContentTitle forKeyedSubscript:@"mediaContentTitle"];
  }
  mediaContentSubtitle = self->_mediaContentSubtitle;
  if (mediaContentSubtitle) {
    [v3 setObject:mediaContentSubtitle forKeyedSubscript:@"mediaContentArtist"];
  }
  displayImageName = self->_displayImageName;
  if (displayImageName) {
    [v3 setObject:displayImageName forKeyedSubscript:@"displayImageName"];
  }
  SSID = self->_SSID;
  if (SSID) {
    [v3 setObject:SSID forKeyedSubscript:@"deviceSSID"];
  }
  uint64_t v27 = [NSNumber numberWithBool:self->_allowPairing];
  [v3 setObject:v27 forKeyedSubscript:@"deviceAllowsPairing"];

  uint64_t v28 = (void *)[v3 copy];

  return (NSDictionary *)v28;
}

+ (void)mergePersistentDictionary:(id)a3 into:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  CFDictionaryGetDouble();
  if (v6 == 0.0)
  {
    CFDictionaryGetDouble();
    if (v7 != 0.0)
    {
      double v8 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v5 setObject:v8 forKeyedSubscript:@"approveTime"];
    }
  }
}

- (DDDevice)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(DDDevice *)self init];
  if (!v7)
  {
    if (a4)
    {
      objc_opt_class();
      DAErrorF();
      id v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    goto LABEL_41;
  }
  if (!CUXPCDecodeNSUUID()) {
    goto LABEL_41;
  }
  int v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_int64_t category = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_41;
  }
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 != 6)
  {
    if (v9 != 5) {
      goto LABEL_9;
    }
LABEL_41:
    id v22 = 0;
    goto LABEL_36;
  }
  v7->_unint64_t deviceSupports = 0;
LABEL_9:
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString()) {
    goto LABEL_41;
  }
  uint64_t v10 = xpc_dictionary_get_dictionary(v6, "nwEP");
  if (v10)
  {
    uint64_t v11 = nw_endpoint_create_from_dictionary();
    if (!v11)
    {
      if (a4)
      {
        DDErrorF(350001, (uint64_t)"XPC->NW failed", v12, v13, v14, v15, v16, v17, v24);
        id v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      goto LABEL_44;
    }
    networkEndpoint = v7->_networkEndpoint;
    v7->_networkEndpoint = (OS_nw_endpoint *)v11;
  }
  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v7->_int64_t protocol = 0;
    goto LABEL_17;
  }
  if (v19 == 5)
  {
LABEL_44:
    id v22 = 0;
    goto LABEL_35;
  }
LABEL_17:
  if (!CUXPCDecodeNSString()) {
    goto LABEL_38;
  }
  int v20 = CUXPCDecodeSInt64RangedEx();
  if (v20 != 6)
  {
    if (v20 != 5) {
      goto LABEL_21;
    }
LABEL_38:
    id v22 = 0;
    goto LABEL_34;
  }
  v7->_state = 0;
LABEL_21:
  if (!CUXPCDecodeBool() || !CUXPCDecodeNSData()) {
    goto LABEL_38;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_37;
  }
  int v21 = CUXPCDecodeSInt64RangedEx();
  if (v21 != 6)
  {
    if (v21 != 5) {
      goto LABEL_27;
    }
LABEL_37:
    id v22 = 0;
    goto LABEL_33;
  }
  v7->_int64_t mediaPlaybackState = 0;
LABEL_27:
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeBool())
  {
    goto LABEL_37;
  }
  id v22 = v7;
LABEL_33:

LABEL_34:
LABEL_35:

LABEL_36:
  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    [(NSUUID *)bluetoothIdentifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "btID", uuid);
  }
  xpc_dictionary_set_int64(v4, "dvCa", self->_category);
  uint64_t deviceSupports = self->_deviceSupports;
  if (deviceSupports) {
    xpc_dictionary_set_uint64(v4, "dfSp", deviceSupports);
  }
  displayName = self->_displayName;
  id v8 = v4;
  int v9 = [(NSString *)displayName UTF8String];
  if (v9) {
    xpc_dictionary_set_string(v8, "name", v9);
  }

  identifier = self->_identifier;
  id v11 = v8;
  uint64_t v12 = [(NSString *)identifier UTF8String];
  if (v12) {
    xpc_dictionary_set_string(v11, "id", v12);
  }

  uint64_t v13 = self->_networkEndpoint;
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = (void *)MEMORY[0x237E048C0](v13);
    if (v15) {
      xpc_dictionary_set_value(v11, "nwEP", v15);
    }
  }
  xpc_dictionary_set_int64(v11, "dvPT", self->_protocol);
  uint64_t v16 = [(UTType *)self->_protocolType identifier];
  id v17 = v11;
  id v18 = v16;
  int v19 = (const char *)[v18 UTF8String];
  if (v19) {
    xpc_dictionary_set_string(v17, "prTy", v19);
  }

  xpc_dictionary_set_int64(v17, "dvSt", self->_state);
  if (self->_supportsGrouping) {
    xpc_dictionary_set_BOOL(v17, "dvGr", 1);
  }
  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
  {
    int v21 = txtRecordData;
    id v22 = v17;
    id v23 = v21;
    uint64_t v24 = [(NSData *)v23 bytes];
    if (v24) {
      v25 = (const char *)v24;
    }
    else {
      v25 = "";
    }
    size_t v26 = [(NSData *)v23 length];

    xpc_dictionary_set_data(v22, "txRD", v25, v26);
  }
  uint64_t v27 = self->_url;
  uint64_t v28 = v27;
  if (v27)
  {
    uint64_t v29 = [(NSURL *)v27 absoluteString];
    id v30 = v17;
    id v31 = v29;
    uint64_t v32 = (const char *)[v31 UTF8String];
    if (v32) {
      xpc_dictionary_set_string(v30, "urlS", v32);
    }
  }
  xpc_dictionary_set_int64(v17, "mpSt", self->_mediaPlaybackState);
  mediaContentTitle = self->_mediaContentTitle;
  id v34 = v17;
  v35 = [(NSString *)mediaContentTitle UTF8String];
  if (v35) {
    xpc_dictionary_set_string(v34, "mTi", v35);
  }

  mediaContentSubtitle = self->_mediaContentSubtitle;
  id v37 = v34;
  v38 = [(NSString *)mediaContentSubtitle UTF8String];
  if (v38) {
    xpc_dictionary_set_string(v37, "mArt", v38);
  }

  displayImageName = self->_displayImageName;
  id v40 = v37;
  v41 = [(NSString *)displayImageName UTF8String];
  if (v41) {
    xpc_dictionary_set_string(v40, "dvDI", v41);
  }

  SSID = self->_SSID;
  id v43 = v40;
  v44 = [(NSString *)SSID UTF8String];
  if (v44) {
    xpc_dictionary_set_string(v43, "ssID", v44);
  }

  if (self->_allowPairing) {
    xpc_dictionary_set_BOOL(v43, "btAP", 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 144) = self->_approveTime;
  uint64_t v5 = [(NSUUID *)self->_bluetoothIdentifier copy];
  id v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  *(void *)(v4 + 32) = self->_category;
  *(void *)(v4 + 16) = self->_deviceSupports;
  uint64_t v7 = [(NSString *)self->_displayName copy];
  id v8 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v7;

  uint64_t v9 = [(NSString *)self->_identifier copy];
  uint64_t v10 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v9;

  objc_storeStrong((id *)(v4 + 88), self->_networkEndpoint);
  *(void *)(v4 + 96) = self->_protocol;
  uint64_t v11 = [(UTType *)self->_protocolType copy];
  uint64_t v12 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v11;

  *(void *)(v4 + 112) = self->_state;
  *(unsigned char *)(v4 + 8) = self->_supportsGrouping;
  uint64_t v13 = [(NSData *)self->_txtRecordData copy];
  uint64_t v14 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v13;

  uint64_t v15 = [(NSURL *)self->_url copy];
  uint64_t v16 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = v15;

  *(void *)(v4 + 64) = self->_mediaPlaybackState;
  uint64_t v17 = [(NSString *)self->_mediaContentTitle copy];
  id v18 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v17;

  uint64_t v19 = [(NSString *)self->_mediaContentSubtitle copy];
  int v20 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v19;

  uint64_t v21 = [(NSString *)self->_displayImageName copy];
  id v22 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v21;

  uint64_t v23 = [(NSString *)self->_SSID copy];
  uint64_t v24 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v23;

  *(unsigned char *)(v4 + 9) = self->_allowPairing;
  return (id)v4;
}

- (id)description
{
  return [(DDDevice *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    id v4 = 0;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v38 = identifier;
    CUAppendF();
    id v6 = v4;

    id v4 = v6;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    v39 = displayName;
    CUAppendF();
    id v8 = v4;

    id v4 = v8;
  }
  CUAppendF();
  id v9 = v4;

  protocolType = self->_protocolType;
  if (protocolType)
  {
    id v40 = protocolType;
    CUAppendF();
    id v11 = v9;

    id v9 = v11;
  }
  CUAppendF();
  id v12 = v9;

  CUAppendF();
  id v13 = v12;

  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v41 = bluetoothIdentifier;
    CUAppendF();
    id v15 = v13;

    id v13 = v15;
  }
  networkEndpoint = self->_networkEndpoint;
  if (networkEndpoint)
  {
    v42 = networkEndpoint;
    CUAppendF();
    id v17 = v13;

    id v13 = v17;
  }
  CUAppendF();
  id v18 = v13;

  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
  {
    int v20 = txtRecordData;
    id v43 = CUPrintNSObjectOneLine();
    CUAppendF();
    id v21 = v18;

    id v18 = v21;
  }
  url = self->_url;
  if (url)
  {
    v44 = url;
    CUAppendF();
    id v23 = v18;

    id v18 = v23;
  }
  CUAppendF();
  id v24 = v18;

  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle)
  {
    v45 = mediaContentTitle;
    CUAppendF();
    id v26 = v24;

    id v24 = v26;
  }
  mediaContentSubtitle = self->_mediaContentSubtitle;
  if (mediaContentSubtitle)
  {
    uint64_t v46 = mediaContentSubtitle;
    CUAppendF();
    id v28 = v24;

    id v24 = v28;
  }
  displayImageName = self->_displayImageName;
  if (displayImageName)
  {
    v47 = displayImageName;
    CUAppendF();
    id v30 = v24;

    id v24 = v30;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v48 = SSID;
    CUAppendF();
    id v32 = v24;

    id v24 = v32;
  }
  CUAppendF();
  id v33 = v24;

  v49 = CUPrintFlags64();
  CUAppendF();
  id v34 = (__CFString *)v33;

  v35 = &stru_26E9C3090;
  if (v34) {
    v35 = v34;
  }
  v36 = v35;

  return v36;
}

+ (BOOL)deviceMetadataURLValid:(id)a3
{
  id v3 = a3;
  id v4 = [v3 absoluteString];
  unint64_t v5 = [v4 length];

  if (v5 > 0x31)
  {
    BOOL v10 = 0;
  }
  else
  {
    id v6 = [v3 query];
    if (v6)
    {
      BOOL v10 = 0;
    }
    else
    {
      uint64_t v7 = [v3 host];
      id v8 = v7;
      if (v7 && (unint64_t)[v7 length] <= 0x13)
      {
        id v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^[a-zA-Z0-9.-]+$" options:1 error:0];
        BOOL v10 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) != 0;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
  }

  return v10;
}

- (unint64_t)deviceSupports
{
  return self->_deviceSupports;
}

- (void)setDeviceSupports:(unint64_t)a3
{
  self->_uint64_t deviceSupports = a3;
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(NSUUID *)bluetoothIdentifier
{
}

- (DDDeviceCategory)category
{
  return self->_category;
}

- (void)setCategory:(DDDeviceCategory)category
{
  self->_int64_t category = category;
}

- (NSString)displayImageName
{
  return self->_displayImageName;
}

- (void)setDisplayImageName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(NSString *)displayName
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSString *)identifier
{
}

- (DDDeviceMediaPlaybackState)mediaPlaybackState
{
  return self->_mediaPlaybackState;
}

- (void)setMediaPlaybackState:(DDDeviceMediaPlaybackState)mediaPlaybackState
{
  self->_int64_t mediaPlaybackState = mediaPlaybackState;
}

- (NSString)mediaContentTitle
{
  return self->_mediaContentTitle;
}

- (void)setMediaContentTitle:(NSString *)mediaContentTitle
{
}

- (NSString)mediaContentSubtitle
{
  return self->_mediaContentSubtitle;
}

- (void)setMediaContentSubtitle:(NSString *)mediaContentSubtitle
{
}

- (nw_endpoint_t)networkEndpoint
{
  return (nw_endpoint_t)self->_networkEndpoint;
}

- (void)setNetworkEndpoint:(nw_endpoint_t)networkEndpoint
{
}

- (DDDeviceProtocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(DDDeviceProtocol)protocol
{
  self->_int64_t protocol = protocol;
}

- (UTType)protocolType
{
  return self->_protocolType;
}

- (void)setProtocolType:(UTType *)protocolType
{
}

- (DDDeviceState)state
{
  return self->_state;
}

- (void)setState:(DDDeviceState)state
{
  self->_state = state;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)supportsGrouping
{
  self->_supportsGrouping = supportsGrouping;
}

- (NSData)txtRecordData
{
  return self->_txtRecordData;
}

- (void)setTxtRecordData:(NSData *)txtRecordData
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(NSURL *)url
{
}

- (BOOL)allowPairing
{
  return self->_allowPairing;
}

- (void)setAllowPairing:(BOOL)a3
{
  self->_allowPairing = a3;
}

- (double)approveTime
{
  return self->_approveTime;
}

- (void)setApproveTime:(double)a3
{
  self->_approveTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_txtRecordData, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_protocolType, 0);
  objc_storeStrong((id *)&self->_networkEndpoint, 0);
  objc_storeStrong((id *)&self->_mediaContentSubtitle, 0);
  objc_storeStrong((id *)&self->_mediaContentTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayImageName, 0);

  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

@end