@interface ASAccessorySettings
+ (ASAccessorySettings)defaultSettings;
+ (BOOL)supportsSecureCoding;
- (ASAccessorySettings)initWithCoder:(id)a3;
- (ASAccessorySettings)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)bluetoothTransportBridgingIdentifier;
- (NSString)SSID;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBluetoothTransportBridgingIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setSSID:(id)a3;
@end

@implementation ASAccessorySettings

+ (ASAccessorySettings)defaultSettings
{
  v2 = objc_alloc_init(ASAccessorySettings);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAccessorySettings)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  NSDecodeObjectIfPresent();
  id v5 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v6 = v5;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  displayName = self->_displayName;
  id v8 = v4;
  if (displayName)
  {
    [v4 encodeObject:displayName forKey:@"dNm"];
    id v4 = v8;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    [v8 encodeObject:SSID forKey:@"wsd"];
    id v4 = v8;
  }
  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    [v8 encodeObject:bluetoothTransportBridgingIdentifier forKey:@"mPid"];
    id v4 = v8;
  }
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self->_displayName UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "dNm", v5);
  }
  SSID = self->_SSID;
  xpc_object_t xdict = v4;
  v7 = [(NSString *)SSID UTF8String];
  if (v7) {
    xpc_dictionary_set_string(xdict, "wsd", v7);
  }

  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    v9 = bluetoothTransportBridgingIdentifier;
    id v10 = xdict;
    uint64_t v11 = [(NSData *)v9 bytes];
    if (v11) {
      v12 = (const char *)v11;
    }
    else {
      v12 = "";
    }
    size_t v13 = [(NSData *)v9 length];

    xpc_dictionary_set_data(v10, "mPid", v12, v13);
  }
}

- (ASAccessorySettings)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ASAccessorySettings *)self init];
  if (!v7)
  {
    if (a4)
    {
      v16 = [(id)objc_opt_class() description];
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (MEMORY[0x245670630](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_7;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSData())
  {
    goto LABEL_12;
  }
  v14 = v7;
LABEL_7:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_displayName copy];
  id v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSString *)self->_SSID copy];
  uint64_t v8 = (void *)v4[1];
  v4[1] = v7;

  uint64_t v9 = [(NSData *)self->_bluetoothTransportBridgingIdentifier copy];
  uint64_t v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (id)description
{
  return [(ASAccessorySettings *)self descriptionWithLevel:50];
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
    id v4 = (__CFString *)0;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    v14 = displayName;
    CUAppendF();
    id v6 = v4;

    id v4 = v6;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v15 = SSID;
    CUAppendF();
    uint64_t v8 = v4;

    id v4 = v8;
  }
  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    v16 = bluetoothTransportBridgingIdentifier;
    CUAppendF();
    uint64_t v10 = v4;

    id v4 = v10;
  }
  uint64_t v11 = &stru_26F86DD88;
  if (v4) {
    uint64_t v11 = v4;
  }
  uint64_t v12 = v11;

  return v12;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (NSData)bluetoothTransportBridgingIdentifier
{
  return self->_bluetoothTransportBridgingIdentifier;
}

- (void)setBluetoothTransportBridgingIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bluetoothTransportBridgingIdentifier, 0);

  objc_storeStrong((id *)&self->_SSID, 0);
}

@end