@interface DADevice
+ (BOOL)deviceMetadataURLValid:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (void)mergePersistentDictionary:(id)a3 into:(id)a4;
- (BOOL)allowPairing;
- (BOOL)discoveredInExtension;
- (BOOL)pendingRemoval;
- (BOOL)supportsGrouping;
- (DADevice)initWithCoder:(id)a3;
- (DADevice)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4;
- (DADevice)initWithXPCObject:(id)a3 error:(id *)a4;
- (DADiscoveryConfiguration)discoveryConfiguration;
- (NSData)bluetoothClassicAddress;
- (NSData)txtRecordData;
- (NSDictionary)appAccessInfoMap;
- (NSDictionary)endpoints;
- (NSDictionary)persistentDictionaryRepresentation;
- (NSMutableDictionary)appAccessInfoDeviceMap;
- (NSString)SSID;
- (NSString)bluetoothOTAName;
- (NSString)displayImageName;
- (NSString)identifier;
- (NSString)mediaContentArtistName;
- (NSString)mediaContentTitle;
- (NSString)name;
- (NSURL)displayImageFileURL;
- (NSURL)url;
- (NSUUID)bluetoothIdentifier;
- (OS_nw_endpoint)networkEndpoint;
- (UTType)protocolType;
- (double)approveTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)mediaPlaybackState;
- (int64_t)protocol;
- (int64_t)state;
- (int64_t)type;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAllowPairing:(BOOL)a3;
- (void)setAppAccessInfoDeviceMap:(id)a3;
- (void)setApproveTime:(double)a3;
- (void)setBluetoothClassicAddress:(id)a3;
- (void)setBluetoothIdentifier:(id)a3;
- (void)setBluetoothOTAName:(id)a3;
- (void)setDiscoveredInExtension:(BOOL)a3;
- (void)setDiscoveryConfiguration:(id)a3;
- (void)setDisplayImageFileURL:(id)a3;
- (void)setDisplayImageName:(id)a3;
- (void)setEndpoints:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMediaContentArtistName:(id)a3;
- (void)setMediaContentTitle:(id)a3;
- (void)setMediaPlaybackState:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNetworkEndpoint:(id)a3;
- (void)setPendingRemoval:(BOOL)a3;
- (void)setProtocol:(int64_t)a3;
- (void)setProtocolType:(id)a3;
- (void)setSSID:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportsGrouping:(BOOL)a3;
- (void)setTxtRecordData:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation DADevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DADevice)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DADevice;
  v5 = [(DADevice *)&v38 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    if ([v9 containsValueForKey:@"dvFl"]) {
      v5->_flags = [v9 decodeIntegerForKey:@"dvFl"];
    }

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

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
    if ([v15 containsValueForKey:@"dvGr"]) {
      v5->_supportsGrouping = [v15 decodeBoolForKey:@"dvGr"];
    }

    id v16 = v15;
    if ([v16 containsValueForKey:@"dvCa"]) {
      v5->_type = [v16 decodeIntegerForKey:@"dvCa"];
    }

    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v20 = [NSURL URLWithString:0];
    if (v20) {
      objc_storeStrong((id *)&v5->_url, v20);
    }
    id v21 = v19;
    if ([v21 containsValueForKey:@"mpSt"]) {
      v5->_mediaPlaybackState = [v21 decodeIntegerForKey:@"mpSt"];
    }

    id v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v23 = v22;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v24 = v23;
    if ([v24 containsValueForKey:@"dvDe"]) {
      v5->_discoveredInExtension = [v24 decodeBoolForKey:@"dvDe"];
    }

    id v25 = v24;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v26 = v25;
    if ([v26 containsValueForKey:@"btAP"]) {
      v5->_allowPairing = [v26 decodeBoolForKey:@"btAP"];
    }

    id v27 = v26;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v28 = v5;
  }
  else
  {
    uint64_t v30 = objc_opt_class();
    v37 = DAErrorF(350001, (uint64_t)"%@ init failed", v31, v32, v33, v34, v35, v36, v30);
    [v4 failWithError:v37];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  id v4 = self->_appAccessInfoDeviceMap;
  if (v4)
  {
    v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    if (v5) {
      [v25 encodeObject:v5 forKey:@"dAaI"];
    }
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier) {
    [v25 encodeObject:bluetoothIdentifier forKey:@"btID"];
  }
  bluetoothOTAName = self->_bluetoothOTAName;
  if (bluetoothOTAName) {
    [v25 encodeObject:bluetoothOTAName forKey:@"btNm"];
  }
  displayImageFileURL = self->_displayImageFileURL;
  if (displayImageFileURL) {
    [v25 encodeObject:displayImageFileURL forKey:@"dvDIuR"];
  }
  unint64_t flags = self->_flags;
  if (flags) {
    [v25 encodeInteger:flags forKey:@"dvFl"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v25 encodeObject:identifier forKey:@"id"];
  }
  name = self->_name;
  if (name) {
    [v25 encodeObject:name forKey:@"name"];
  }
  uint64_t v12 = self->_networkEndpoint;
  if (v12)
  {
    v13 = [MEMORY[0x263F143F8] endpointWithCEndpoint:v12];
    if (v13) {
      [v25 encodeObject:v13 forKey:@"nwEP"];
    }
  }
  int64_t protocol = self->_protocol;
  if (protocol) {
    [v25 encodeInteger:protocol forKey:@"dvPT"];
  }
  protocolType = self->_protocolType;
  if (protocolType) {
    [v25 encodeObject:protocolType forKey:@"prTy"];
  }
  SSID = self->_SSID;
  if (SSID) {
    [v25 encodeObject:SSID forKey:@"ssID"];
  }
  if (self->_supportsGrouping) {
    [v25 encodeBool:1 forKey:@"dvGr"];
  }
  int64_t type = self->_type;
  if (type) {
    [v25 encodeInteger:type forKey:@"dvCa"];
  }
  txtRecordData = self->_txtRecordData;
  if (txtRecordData) {
    [v25 encodeObject:txtRecordData forKey:@"txRD"];
  }
  id v19 = [(NSURL *)self->_url absoluteString];
  if (v19) {
    [v25 encodeObject:v19 forKey:@"urlS"];
  }
  int64_t mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState) {
    [v25 encodeInteger:mediaPlaybackState forKey:@"mpSt"];
  }
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle) {
    [v25 encodeObject:mediaContentTitle forKey:@"mTi"];
  }
  mediaContentArtistName = self->_mediaContentArtistName;
  if (mediaContentArtistName) {
    [v25 encodeObject:mediaContentArtistName forKey:@"mArt"];
  }
  if (self->_discoveredInExtension) {
    [v25 encodeBool:1 forKey:@"dvDe"];
  }
  displayImageName = self->_displayImageName;
  if (displayImageName) {
    [v25 encodeObject:displayImageName forKey:@"dvDI"];
  }
  if (self->_allowPairing) {
    [v25 encodeBool:1 forKey:@"btAP"];
  }
  bluetoothClassicAddress = self->_bluetoothClassicAddress;
  if (bluetoothClassicAddress) {
    [v25 encodeObject:bluetoothClassicAddress forKey:@"btCa"];
  }
}

- (DADevice)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v55.receiver = self;
  v55.super_class = (Class)DADevice;
  id v7 = [(DADevice *)&v55 init];
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
    CFStringGetTypeID();
    uint64_t v12 = CFDictionaryGetTypedValue();
    bluetoothOTAName = v7->_bluetoothOTAName;
    v7->_bluetoothOTAName = (NSString *)v12;

    CFDataGetTypeID();
    v54 = CFDictionaryGetTypedValue();
    uint64_t v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v54 error:0];
    discoveryConfiguration = v7->_discoveryConfiguration;
    v7->_discoveryConfiguration = (DADiscoveryConfiguration *)v14;

    CFStringGetTypeID();
    uint64_t v16 = CFDictionaryGetTypedValue();
    if (v16)
    {
      uint64_t v17 = [NSURL URLWithString:v16];
      displayImageFileURL = v7->_displayImageFileURL;
      v7->_displayImageFileURL = (NSURL *)v17;
    }
    id v19 = NSDictionaryGetNSNumber();
    v20 = v19;
    if (v19) {
      v7->_unint64_t flags = [v19 unsignedIntValue];
    }
    v52 = v20;
    CFStringGetTypeID();
    id v21 = CFDictionaryGetTypedValue();
    if (v21) {
      objc_storeStrong((id *)&v7->_identifier, v21);
    }
    v53 = (void *)v16;
    CFStringGetTypeID();
    id v22 = CFDictionaryGetTypedValue();
    if (v22) {
      objc_storeStrong((id *)&v7->_name, v22);
    }
    CFDataGetTypeID();
    v51 = CFDictionaryGetTypedValue();
    v50 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v51 error:0];
    uint64_t v23 = [v50 copyCEndpoint];
    networkEndpoint = v7->_networkEndpoint;
    v7->_networkEndpoint = (OS_nw_endpoint *)v23;

    id v25 = NSDictionaryGetNSNumber();
    v7->_int64_t protocol = [v25 integerValue];

    CFStringGetTypeID();
    id v26 = CFDictionaryGetTypedValue();
    if (v26)
    {
      id v27 = [MEMORY[0x263F1D920] typeWithIdentifier:v26];
      if (v27) {
        objc_storeStrong((id *)&v7->_protocolType, v27);
      }
    }
    v28 = NSDictionaryGetNSNumber();
    v7->_state = [v28 integerValue];

    CFStringGetTypeID();
    uint64_t v29 = CFDictionaryGetTypedValue();
    SSID = v7->_SSID;
    v7->_SSID = (NSString *)v29;

    v7->_supportsGrouping = CFDictionaryGetInt64() != 0;
    uint64_t v31 = NSDictionaryGetNSNumber();
    v7->_int64_t type = [v31 integerValue];

    CFDataGetTypeID();
    uint64_t v32 = CFDictionaryGetTypedValue();
    if (v32) {
      objc_storeStrong((id *)&v7->_txtRecordData, v32);
    }
    CFStringGetTypeID();
    uint64_t v33 = CFDictionaryGetTypedValue();
    if (v33)
    {
      uint64_t v34 = [NSURL URLWithString:v33];
      if (v34) {
        objc_storeStrong((id *)&v7->_url, v34);
      }
    }
    v7->_pendingRemoval = CFDictionaryGetInt64() != 0;
    uint64_t v35 = NSDictionaryGetNSNumber();
    v7->_int64_t mediaPlaybackState = [v35 integerValue];

    CFStringGetTypeID();
    uint64_t v36 = CFDictionaryGetTypedValue();
    if (v36) {
      objc_storeStrong((id *)&v7->_mediaContentTitle, v36);
    }
    CFStringGetTypeID();
    v37 = CFDictionaryGetTypedValue();
    if (v37) {
      objc_storeStrong((id *)&v7->_mediaContentArtistName, v37);
    }
    v7->_discoveredInExtension = CFDictionaryGetInt64() != 0;
    CFStringGetTypeID();
    objc_super v38 = CFDictionaryGetTypedValue();
    if (v38) {
      objc_storeStrong((id *)&v7->_displayImageName, v38);
    }
    v7->_allowPairing = CFDictionaryGetInt64() != 0;
    CFDataGetTypeID();
    uint64_t v39 = CFDictionaryGetTypedValue();
    bluetoothClassicAddress = v7->_bluetoothClassicAddress;
    v7->_bluetoothClassicAddress = (NSData *)v39;

    v41 = v7;
  }
  else if (a4)
  {
    uint64_t v43 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v44, v45, v46, v47, v48, v49, v43);
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
  bluetoothOTAName = self->_bluetoothOTAName;
  if (bluetoothOTAName) {
    [v3 setObject:bluetoothOTAName forKeyedSubscript:@"bluetoothOTAName"];
  }
  double v8 = self->_discoveryConfiguration;
  if (v8)
  {
    id v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    if (v9) {
      [v3 setObject:v9 forKeyedSubscript:@"configuration"];
    }
  }
  if (self->_flags)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v10 forKeyedSubscript:@"flags"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKeyedSubscript:@"name"];
  }
  v13 = self->_networkEndpoint;
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263F143F8] endpointWithCEndpoint:v13];
    id v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
    if (v15) {
      [v3 setObject:v15 forKeyedSubscript:@"nwEndpoint"];
    }
  }
  if (self->_protocol)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v16 forKeyedSubscript:@"protocol"];
  }
  protocolType = self->_protocolType;
  if (protocolType)
  {
    id v18 = [(UTType *)protocolType identifier];
    [v3 setObject:v18 forKeyedSubscript:@"protocolType"];
  }
  SSID = self->_SSID;
  if (SSID) {
    [v3 setObject:SSID forKeyedSubscript:@"deviceSSID"];
  }
  displayImageFileURL = self->_displayImageFileURL;
  if (displayImageFileURL)
  {
    id v21 = [(NSURL *)displayImageFileURL absoluteString];
    [v3 setObject:v21 forKeyedSubscript:@"displayImageURL"];
  }
  id v22 = [NSNumber numberWithInteger:self->_state];
  [v3 setObject:v22 forKeyedSubscript:@"deviceState"];

  uint64_t v23 = [NSNumber numberWithBool:self->_supportsGrouping];
  [v3 setObject:v23 forKeyedSubscript:@"deviceSupportsGrouping"];

  if (self->_type)
  {
    id v24 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v24 forKeyedSubscript:@"type"];
  }
  txtRecordData = self->_txtRecordData;
  if (txtRecordData) {
    [v3 setObject:txtRecordData forKeyedSubscript:@"txtRecordData"];
  }
  url = self->_url;
  if (url)
  {
    id v27 = [(NSURL *)url absoluteString];
    [v3 setObject:v27 forKeyedSubscript:@"url"];
  }
  if (self->_mediaPlaybackState)
  {
    v28 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v28 forKeyedSubscript:@"mediaPlaybackState"];
  }
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle) {
    [v3 setObject:mediaContentTitle forKeyedSubscript:@"mediaContentTitle"];
  }
  mediaContentArtistName = self->_mediaContentArtistName;
  if (mediaContentArtistName) {
    [v3 setObject:mediaContentArtistName forKeyedSubscript:@"mediaContentArtist"];
  }
  uint64_t v31 = [NSNumber numberWithBool:self->_discoveredInExtension];
  [v3 setObject:v31 forKeyedSubscript:@"discoveredInExtension"];

  displayImageName = self->_displayImageName;
  if (displayImageName) {
    [v3 setObject:displayImageName forKeyedSubscript:@"displayImageName"];
  }
  uint64_t v33 = [NSNumber numberWithBool:self->_allowPairing];
  [v3 setObject:v33 forKeyedSubscript:@"deviceAllowsPairing"];

  bluetoothClassicAddress = self->_bluetoothClassicAddress;
  if (bluetoothClassicAddress) {
    [v3 setObject:bluetoothClassicAddress forKeyedSubscript:@"deviceBluetoothClassicAddress"];
  }
  uint64_t v35 = [NSNumber numberWithBool:self->_pendingRemoval];
  [v3 setObject:v35 forKeyedSubscript:@"pendingRemoval"];

  uint64_t v36 = (void *)[v3 copy];

  return (NSDictionary *)v36;
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

- (DADevice)initWithXPCObject:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DADevice;
  double v7 = [(DADevice *)&v32 init];
  if (v7)
  {
    CUXPCDecodeNSData();
    if (!CUXPCDecodeNSUUID() || !CUXPCDecodeNSString())
    {
      id v22 = 0;
      goto LABEL_41;
    }
    objc_opt_class();
    CUXPCDecodeObject();
    if (!CUXPCDecodeNSString()) {
      goto LABEL_45;
    }
    unint64_t v33 = 0;
    int v8 = CUXPCDecodeUInt64RangedEx();
    if (v8 == 6)
    {
      v7->_unint64_t flags = v33;
    }
    else if (v8 == 5)
    {
      goto LABEL_45;
    }
    if (CUXPCDecodeNSString() && CUXPCDecodeNSString())
    {
      id v9 = xpc_dictionary_get_dictionary(v6, "nwEP");
      if (v9)
      {
        uint64_t v10 = nw_endpoint_create_from_dictionary();
        if (!v10)
        {
          if (a4)
          {
            DAErrorF(350001, (uint64_t)"XPC->NW failed", v11, v12, v13, v14, v15, v16, v31);
            id v22 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_39;
          }
          goto LABEL_51;
        }
        networkEndpoint = v7->_networkEndpoint;
        v7->_networkEndpoint = (OS_nw_endpoint *)v10;
      }
      unint64_t v33 = 0;
      int v18 = CUXPCDecodeSInt64RangedEx();
      if (v18 == 6)
      {
        v7->_int64_t protocol = v33;
LABEL_16:
        if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString()) {
          goto LABEL_44;
        }
        unint64_t v33 = 0;
        int v19 = CUXPCDecodeSInt64RangedEx();
        if (v19 == 6)
        {
          v7->_state = v33;
        }
        else if (v19 == 5)
        {
          goto LABEL_44;
        }
        if (CUXPCDecodeBool())
        {
          unint64_t v33 = 0;
          int v20 = CUXPCDecodeSInt64RangedEx();
          if (v20 == 6)
          {
            v7->_int64_t type = v33;
          }
          else if (v20 == 5)
          {
            goto LABEL_44;
          }
          if (CUXPCDecodeNSData())
          {
            if (CUXPCDecodeNSString())
            {
              unint64_t v33 = 0;
              int v21 = CUXPCDecodeSInt64RangedEx();
              if (v21 == 6)
              {
                v7->_int64_t mediaPlaybackState = v33;
              }
              else if (v21 == 5)
              {
                goto LABEL_43;
              }
              if (CUXPCDecodeNSString()
                && CUXPCDecodeNSString()
                && CUXPCDecodeBool()
                && CUXPCDecodeNSString()
                && CUXPCDecodeBool()
                && CUXPCDecodeNSData())
              {
                id v22 = v7;
LABEL_37:

LABEL_38:
LABEL_39:

LABEL_40:
LABEL_41:

                goto LABEL_42;
              }
            }
LABEL_43:
            id v22 = 0;
            goto LABEL_37;
          }
        }
LABEL_44:
        id v22 = 0;
        goto LABEL_38;
      }
      if (v18 != 5) {
        goto LABEL_16;
      }
LABEL_51:
      id v22 = 0;
      goto LABEL_39;
    }
LABEL_45:
    id v22 = 0;
    goto LABEL_40;
  }
  if (a4)
  {
    uint64_t v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v25, v26, v27, v28, v29, v30, v24);
    id v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }
LABEL_42:

  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_appAccessInfoDeviceMap;
  if (v5)
  {
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
      id v9 = v4;
      uint64_t v10 = [v8 bytes];
      if (v10) {
        uint64_t v11 = (const char *)v10;
      }
      else {
        uint64_t v11 = "";
      }
      xpc_dictionary_set_data(v9, "dAaI", v11, [v8 length]);
    }
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    id v13 = v4;
    [(NSUUID *)bluetoothIdentifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v13, "btID", uuid);
  }
  bluetoothOTAName = self->_bluetoothOTAName;
  id v15 = v4;
  uint64_t v16 = [(NSString *)bluetoothOTAName UTF8String];
  if (v16) {
    xpc_dictionary_set_string(v15, "btNm", v16);
  }

  CUXPCEncodeObject();
  uint64_t v17 = self->_displayImageFileURL;
  int v18 = v17;
  if (v17)
  {
    int v19 = [(NSURL *)v17 absoluteString];
    id v20 = v15;
    id v21 = v19;
    id v22 = (const char *)[v21 UTF8String];
    if (v22) {
      xpc_dictionary_set_string(v20, "dvDIuR", v22);
    }
  }
  xpc_dictionary_set_uint64(v15, "dvFl", self->_flags);
  identifier = self->_identifier;
  id v24 = v15;
  uint64_t v25 = [(NSString *)identifier UTF8String];
  if (v25) {
    xpc_dictionary_set_string(v24, "id", v25);
  }

  name = self->_name;
  id v27 = v24;
  uint64_t v28 = [(NSString *)name UTF8String];
  if (v28) {
    xpc_dictionary_set_string(v27, "name", v28);
  }

  uint64_t v29 = self->_networkEndpoint;
  uint64_t v30 = v29;
  if (v29)
  {
    uint64_t v31 = (void *)MEMORY[0x223C52280](v29);
    if (v31) {
      xpc_dictionary_set_value(v27, "nwEP", v31);
    }
  }
  xpc_dictionary_set_int64(v27, "dvPT", self->_protocol);
  objc_super v32 = [(UTType *)self->_protocolType identifier];
  id v33 = v27;
  id v34 = v32;
  uint64_t v35 = (const char *)[v34 UTF8String];
  if (v35) {
    xpc_dictionary_set_string(v33, "prTy", v35);
  }

  SSID = self->_SSID;
  id v37 = v33;
  objc_super v38 = [(NSString *)SSID UTF8String];
  if (v38) {
    xpc_dictionary_set_string(v37, "ssID", v38);
  }

  xpc_dictionary_set_int64(v37, "dvSt", self->_state);
  if (self->_supportsGrouping) {
    xpc_dictionary_set_BOOL(v37, "dvGr", 1);
  }
  xpc_dictionary_set_int64(v37, "dvCa", self->_type);
  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
  {
    v40 = txtRecordData;
    id v41 = v37;
    v42 = v40;
    uint64_t v43 = [(NSData *)v42 bytes];
    if (v43) {
      uint64_t v44 = (const char *)v43;
    }
    else {
      uint64_t v44 = "";
    }
    size_t v45 = [(NSData *)v42 length];

    xpc_dictionary_set_data(v41, "txRD", v44, v45);
  }
  uint64_t v46 = self->_url;
  uint64_t v47 = v46;
  if (v46)
  {
    uint64_t v48 = [(NSURL *)v46 absoluteString];
    id v49 = v37;
    id v50 = v48;
    v51 = (const char *)[v50 UTF8String];
    if (v51) {
      xpc_dictionary_set_string(v49, "urlS", v51);
    }
  }
  xpc_dictionary_set_int64(v37, "mpSt", self->_mediaPlaybackState);
  mediaContentTitle = self->_mediaContentTitle;
  id v53 = v37;
  v54 = [(NSString *)mediaContentTitle UTF8String];
  if (v54) {
    xpc_dictionary_set_string(v53, "mTi", v54);
  }

  mediaContentArtistName = self->_mediaContentArtistName;
  id v56 = v53;
  v57 = [(NSString *)mediaContentArtistName UTF8String];
  if (v57) {
    xpc_dictionary_set_string(v56, "mArt", v57);
  }

  if (self->_discoveredInExtension) {
    xpc_dictionary_set_BOOL(v56, "dvDe", 1);
  }
  displayImageName = self->_displayImageName;
  id v59 = v56;
  v60 = [(NSString *)displayImageName UTF8String];
  if (v60) {
    xpc_dictionary_set_string(v59, "dvDI", v60);
  }

  if (self->_allowPairing) {
    xpc_dictionary_set_BOOL(v59, "btAP", 1);
  }
  bluetoothClassicAddress = self->_bluetoothClassicAddress;
  if (bluetoothClassicAddress)
  {
    v62 = bluetoothClassicAddress;
    id v63 = v59;
    v64 = v62;
    uint64_t v65 = [(NSData *)v64 bytes];
    if (v65) {
      v66 = (const char *)v65;
    }
    else {
      v66 = "";
    }
    size_t v67 = [(NSData *)v64 length];

    xpc_dictionary_set_data(v63, "btCa", v66, v67);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 176) = self->_approveTime;
  uint64_t v5 = [(NSMutableDictionary *)self->_appAccessInfoDeviceMap copy];
  id v6 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = v5;

  uint64_t v7 = [(NSData *)self->_bluetoothClassicAddress copy];
  id v8 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v7;

  uint64_t v9 = [(NSUUID *)self->_bluetoothIdentifier copy];
  uint64_t v10 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_bluetoothOTAName copy];
  uint64_t v12 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v11;

  uint64_t v13 = [(DADiscoveryConfiguration *)self->_discoveryConfiguration copy];
  uint64_t v14 = *(void **)(v4 + 184);
  *(void *)(v4 + 184) = v13;

  uint64_t v15 = [(NSURL *)self->_displayImageFileURL copy];
  uint64_t v16 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v15;

  uint64_t v17 = [(NSDictionary *)self->_endpoints copy];
  int v18 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = v17;

  *(void *)(v4 + 56) = self->_flags;
  uint64_t v19 = [(NSString *)self->_identifier copy];
  id v20 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v19;

  uint64_t v21 = [(NSString *)self->_name copy];
  id v22 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v21;

  objc_storeStrong((id *)(v4 + 104), self->_networkEndpoint);
  *(void *)(v4 + 112) = self->_protocol;
  uint64_t v23 = [(UTType *)self->_protocolType copy];
  id v24 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v23;

  uint64_t v25 = [(NSString *)self->_SSID copy];
  uint64_t v26 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v25;

  *(void *)(v4 + 136) = self->_state;
  *(unsigned char *)(v4 + 10) = self->_supportsGrouping;
  *(void *)(v4 + 152) = self->_type;
  uint64_t v27 = [(NSData *)self->_txtRecordData copy];
  uint64_t v28 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v27;

  uint64_t v29 = [(NSURL *)self->_url copy];
  uint64_t v30 = *(void **)(v4 + 160);
  *(void *)(v4 + 160) = v29;

  *(void *)(v4 + 72) = self->_mediaPlaybackState;
  uint64_t v31 = [(NSString *)self->_mediaContentTitle copy];
  objc_super v32 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v31;

  uint64_t v33 = [(NSString *)self->_mediaContentArtistName copy];
  id v34 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v33;

  *(unsigned char *)(v4 + 9) = self->_discoveredInExtension;
  uint64_t v35 = [(NSString *)self->_displayImageName copy];
  uint64_t v36 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v35;

  *(unsigned char *)(v4 + 8) = self->_allowPairing;
  *(unsigned char *)(v4 + 11) = self->_pendingRemoval;
  return (id)v4;
}

- (id)description
{
  return [(DADevice *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v95 = 0;
  v96 = (id *)&v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__0;
  v99 = __Block_byref_object_dispose__0;
  id v100 = 0;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  if ((a3 & 0x8000000) != 0) {
    int v5 = 8;
  }
  else {
    int v5 = 12;
  }
  int v94 = v5;
  if ((a3 & 0x8000000) == 0)
  {
    uint64_t v92 = 0;
    objc_opt_class();
    CUAppendF();
    objc_storeStrong(&v100, 0);
  }
  id v6 = self->_identifier;
  if (v6)
  {
    uint64_t v7 = v96;
    id v91 = v96[5];
    CUAppendF();
    objc_storeStrong(v7 + 5, v91);
  }

  id v8 = self->_name;
  if (v8)
  {
    uint64_t v9 = v96;
    id v90 = v96[5];
    CUAppendF();
    objc_storeStrong(v9 + 5, v90);
  }

  uint64_t v10 = self->_protocolType;
  if (v10)
  {
    uint64_t v11 = v96;
    id v89 = v96[5];
    CUAppendF();
    objc_storeStrong(v11 + 5, v89);
  }

  if ((self->_flags & 8) == 0)
  {
    uint64_t v12 = v96;
    id v88 = v96[5];
    v61 = DADeviceStateToString(self->_state);
    CUAppendF();
    objc_storeStrong(v12 + 5, v88);
  }
  if (self->_supportsGrouping)
  {
    uint64_t v13 = v96;
    id v87 = v96[5];
    CUAppendF();
    objc_storeStrong(v13 + 5, v87);
  }
  uint64_t v14 = self->_bluetoothIdentifier;
  if (v14)
  {
    uint64_t v15 = v96;
    id v86 = v96[5];
    CUAppendF();
    objc_storeStrong(v15 + 5, v86);
  }

  uint64_t v16 = self->_bluetoothClassicAddress;
  if (v16)
  {
    uint64_t v17 = v96;
    id obj = v96[5];
    v62 = CUPrintNSDataAddress();
    CUAppendF();
    objc_storeStrong(v17 + 5, obj);
  }
  int v18 = self->_bluetoothOTAName;
  if (v18)
  {
    uint64_t v19 = v96;
    id v84 = v96[5];
    CUAppendF();
    objc_storeStrong(v19 + 5, v84);
  }

  id v20 = self->_networkEndpoint;
  if (v20)
  {
    uint64_t v21 = v96;
    id v83 = v96[5];
    CUAppendF();
    objc_storeStrong(v21 + 5, v83);
  }

  id v22 = self->_endpoints;
  uint64_t v23 = v22;
  if (v22)
  {
    id v24 = v96;
    id v82 = v96[5];
    [(NSDictionary *)v22 count];
    CUAppendF();
    objc_storeStrong(v24 + 5, v82);
  }

  unint64_t flags = self->_flags;
  if (flags)
  {
    uint64_t v26 = v96;
    id v81 = v96[5];
    id v63 = DADeviceFlagsToString(flags);
    CUAppendF();
    objc_storeStrong(v26 + 5, v81);
  }
  int64_t protocol = self->_protocol;
  if (protocol)
  {
    if (protocol == 1) {
      uint64_t v28 = @"DIAL";
    }
    else {
      uint64_t v28 = @"?";
    }
    uint64_t v29 = v96;
    id v80 = v96[5];
    v64 = v28;
    CUAppendF();
    objc_storeStrong(v29 + 5, v80);
  }
  uint64_t v30 = self->_SSID;
  if (v30)
  {
    uint64_t v31 = v96;
    id v79 = v96[5];
    CUAppendF();
    objc_storeStrong(v31 + 5, v79);
  }

  objc_super v32 = v96 + 5;
  id v78 = v96[5];
  unint64_t type = self->_type;
  id v34 = @"?";
  if (type < 7) {
    id v34 = off_264520388[type];
  }
  uint64_t v65 = (char *)v34;
  CUAppendF();
  objc_storeStrong(v32, v78);
  uint64_t v35 = self->_txtRecordData;
  if (v35)
  {
    uint64_t v36 = v96;
    id v77 = v96[5];
    CUPrintNSObjectOneLine();
    uint64_t v65 = (char *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    objc_storeStrong(v36 + 5, v77);
  }
  id v37 = self->_url;
  objc_super v38 = v37;
  if (v37)
  {
    uint64_t v39 = v96;
    id v76 = v96[5];
    uint64_t v65 = (char *)v37;
    CUAppendF();
    objc_storeStrong(v39 + 5, v76);
  }

  int64_t mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState)
  {
    id v41 = @"Paused";
    if (mediaPlaybackState != 1) {
      id v41 = @"?";
    }
    if (mediaPlaybackState == 2) {
      v42 = @"Playing";
    }
    else {
      v42 = v41;
    }
    uint64_t v43 = v96;
    id v75 = v96[5];
    uint64_t v65 = v42;
    CUAppendF();
    objc_storeStrong(v43 + 5, v75);
  }
  uint64_t v44 = self->_mediaContentTitle;
  size_t v45 = v44;
  if (v44)
  {
    uint64_t v46 = v96;
    id v74 = v96[5];
    uint64_t v65 = (char *)v44;
    CUAppendF();
    objc_storeStrong(v46 + 5, v74);
  }

  uint64_t v47 = self->_mediaContentArtistName;
  uint64_t v48 = v47;
  if (v47)
  {
    id v49 = v96;
    id v73 = v96[5];
    uint64_t v65 = (char *)v47;
    CUAppendF();
    objc_storeStrong(v49 + 5, v73);
  }

  if (self->_discoveredInExtension)
  {
    id v50 = v96;
    id v72 = v96[5];
    uint64_t v65 = "yes";
    CUAppendF();
    objc_storeStrong(v50 + 5, v72);
  }
  v51 = self->_displayImageName;
  v52 = v51;
  if (v51)
  {
    id v53 = v96;
    id v71 = v96[5];
    uint64_t v65 = (char *)v51;
    CUAppendF();
    objc_storeStrong(v53 + 5, v71);
  }

  if (self->_allowPairing)
  {
    v54 = v96;
    id v70 = v96[5];
    uint64_t v65 = "yes";
    CUAppendF();
    objc_storeStrong(v54 + 5, v70);
  }
  if (self->_pendingRemoval)
  {
    objc_super v55 = v96;
    id v69 = v96[5];
    uint64_t v65 = "yes";
    CUAppendF();
    objc_storeStrong(v55 + 5, v69);
  }
  endpoints = self->_endpoints;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __33__DADevice_descriptionWithLevel___block_invoke;
  v68[3] = &unk_264520328;
  v68[4] = &v95;
  v68[5] = v93;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](endpoints, "enumerateKeysAndObjectsUsingBlock:", v68, v65);
  appAccessInfoDeviceMap = self->_appAccessInfoDeviceMap;
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __33__DADevice_descriptionWithLevel___block_invoke_2;
  v66[3] = &unk_264520350;
  v66[4] = &v95;
  v66[5] = v93;
  int v67 = a3;
  [(NSMutableDictionary *)appAccessInfoDeviceMap enumerateKeysAndObjectsUsingBlock:v66];
  v58 = (__CFString *)v96[5];
  if (!v58) {
    v58 = &stru_26D120818;
  }
  id v59 = v58;
  _Block_object_dispose(v93, 8);
  _Block_object_dispose(&v95, 8);

  return v59;
}

void __33__DADevice_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if ([a3 selected])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v6 + 40);
    CUAppendF();
    objc_storeStrong((id *)(v6 + 40), obj);
    *a4 = 1;
  }
}

void __33__DADevice_descriptionWithLevel___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  v2 = CUDescriptionWithLevel();
  CUAppendF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

- (NSDictionary)appAccessInfoMap
{
  v2 = (void *)[(NSMutableDictionary *)self->_appAccessInfoDeviceMap copy];

  return (NSDictionary *)v2;
}

+ (BOOL)deviceMetadataURLValid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 absoluteString];
  unint64_t v5 = [v4 length];

  if (v5 > 0x31)
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v6 = [v3 query];
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
        uint64_t v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^[a-zA-Z0-9.-]+$" options:1 error:0];
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

- (BOOL)allowPairing
{
  return self->_allowPairing;
}

- (void)setAllowPairing:(BOOL)a3
{
  self->_allowPairing = a3;
}

- (NSData)bluetoothClassicAddress
{
  return self->_bluetoothClassicAddress;
}

- (void)setBluetoothClassicAddress:(id)a3
{
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
}

- (NSString)bluetoothOTAName
{
  return self->_bluetoothOTAName;
}

- (void)setBluetoothOTAName:(id)a3
{
}

- (BOOL)discoveredInExtension
{
  return self->_discoveredInExtension;
}

- (void)setDiscoveredInExtension:(BOOL)a3
{
  self->_discoveredInExtension = a3;
}

- (NSURL)displayImageFileURL
{
  return self->_displayImageFileURL;
}

- (void)setDisplayImageFileURL:(id)a3
{
}

- (NSString)displayImageName
{
  return self->_displayImageName;
}

- (void)setDisplayImageName:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_unint64_t flags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)mediaPlaybackState
{
  return self->_mediaPlaybackState;
}

- (void)setMediaPlaybackState:(int64_t)a3
{
  self->_int64_t mediaPlaybackState = a3;
}

- (NSString)mediaContentTitle
{
  return self->_mediaContentTitle;
}

- (void)setMediaContentTitle:(id)a3
{
}

- (NSString)mediaContentArtistName
{
  return self->_mediaContentArtistName;
}

- (void)setMediaContentArtistName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (OS_nw_endpoint)networkEndpoint
{
  return self->_networkEndpoint;
}

- (void)setNetworkEndpoint:(id)a3
{
}

- (int64_t)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(int64_t)a3
{
  self->_int64_t protocol = a3;
}

- (UTType)protocolType
{
  return self->_protocolType;
}

- (void)setProtocolType:(id)a3
{
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  self->_supportsGrouping = a3;
}

- (NSData)txtRecordData
{
  return self->_txtRecordData;
}

- (void)setTxtRecordData:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSMutableDictionary)appAccessInfoDeviceMap
{
  return self->_appAccessInfoDeviceMap;
}

- (void)setAppAccessInfoDeviceMap:(id)a3
{
}

- (double)approveTime
{
  return self->_approveTime;
}

- (void)setApproveTime:(double)a3
{
  self->_approveTime = a3;
}

- (DADiscoveryConfiguration)discoveryConfiguration
{
  return self->_discoveryConfiguration;
}

- (void)setDiscoveryConfiguration:(id)a3
{
}

- (NSDictionary)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (BOOL)pendingRemoval
{
  return self->_pendingRemoval;
}

- (void)setPendingRemoval:(BOOL)a3
{
  self->_pendingRemoval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_discoveryConfiguration, 0);
  objc_storeStrong((id *)&self->_appAccessInfoDeviceMap, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_txtRecordData, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_protocolType, 0);
  objc_storeStrong((id *)&self->_networkEndpoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mediaContentArtistName, 0);
  objc_storeStrong((id *)&self->_mediaContentTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayImageName, 0);
  objc_storeStrong((id *)&self->_displayImageFileURL, 0);
  objc_storeStrong((id *)&self->_bluetoothOTAName, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);

  objc_storeStrong((id *)&self->_bluetoothClassicAddress, 0);
}

@end