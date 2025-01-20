@interface ASAccessory
+ (BOOL)supportsSecureCoding;
- (ASAccessory)initWithCoder:(id)a3;
- (ASAccessory)initWithDADevice:(id)a3 bundleID:(id)a4;
- (ASAccessory)initWithXPCObject:(id)a3 error:(id *)a4;
- (ASDiscoveryDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (NSData)bluetoothTransportBridgingIdentifier;
- (NSString)SSID;
- (NSString)displayName;
- (NSString)identifier;
- (NSUUID)bluetoothIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBluetoothIdentifier:(id)a3;
- (void)setBluetoothTransportBridgingIdentifier:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSSID:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation ASAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  id v12 = v4;
  if (bluetoothTransportBridgingIdentifier)
  {
    [v4 encodeObject:bluetoothTransportBridgingIdentifier forKey:@"btBdgId"];
    id v4 = v12;
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    [v12 encodeObject:bluetoothIdentifier forKey:@"bId"];
    id v4 = v12;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v12 encodeObject:identifier forKey:@"aSi"];
    id v4 = v12;
  }
  descriptor = self->_descriptor;
  if (descriptor)
  {
    [v12 encodeObject:descriptor forKey:@"aDr"];
    id v4 = v12;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    [v12 encodeObject:displayName forKey:@"dNm"];
    id v4 = v12;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    [v12 encodeObject:SSID forKey:@"wsd"];
    id v4 = v12;
  }
  int64_t state = self->_state;
  if (state)
  {
    [v12 encodeInteger:state forKey:@"aSt"];
    id v4 = v12;
  }
}

- (ASAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASAccessory *)self init];
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

    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    if ([v11 containsValueForKey:@"aSt"]) {
      v5->_int64_t state = [v11 decodeIntegerForKey:@"aSt"];
    }

    id v12 = v5;
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    v21 = ASErrorF(1, (uint64_t)"%@ init failed", v15, v16, v17, v18, v19, v20, v14);
    [v4 failWithError:v21];
  }
  return v5;
}

- (ASAccessory)initWithDADevice:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 flags] & 8) != 0
    && (self = [(ASAccessory *)self init]) != 0
    && ([v6 flags] & 8) != 0)
  {
    id v8 = [v6 appAccessInfoMap];
    id v9 = [v8 objectForKeyedSubscript:v7];

    if (v9)
    {
      id v10 = [v6 identifier];
      id v11 = v10;
      if (v10)
      {
        id v12 = v10;
        identifier = self->_identifier;
        self->_identifier = v12;
      }
      else
      {
        identifier = [MEMORY[0x263F08C38] UUID];
        uint64_t v14 = [identifier UUIDString];
        uint64_t v15 = self->_identifier;
        self->_identifier = v14;
      }
      if ([v9 accessoryOptions])
      {
        uint64_t v18 = [v6 bluetoothIdentifier];
        p_bluetoothIdentifier = &self->_bluetoothIdentifier;
        bluetoothIdentifier = self->_bluetoothIdentifier;
        self->_bluetoothIdentifier = v18;
      }
      else
      {
        p_bluetoothIdentifier = &self->_bluetoothIdentifier;
        bluetoothIdentifier = self->_bluetoothIdentifier;
        self->_bluetoothIdentifier = 0;
      }

      if (([v6 flags] & 0x200) != 0)
      {
        uint64_t v20 = [v6 bluetoothClassicAddress];
        bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
        self->_bluetoothTransportBridgingIdentifier = v20;
      }
      else
      {
        bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
        self->_bluetoothTransportBridgingIdentifier = 0;
      }

      v21 = [v6 appAccessInfoMap];
      v22 = [v21 objectForKeyedSubscript:v7];
      v23 = [v22 appDiscoveryConfiguration];

      if (v23) {
        v24 = [[ASDiscoveryDescriptor alloc] initWithDiscoveryConfiguration:v23];
      }
      else {
        v24 = 0;
      }
      objc_storeStrong((id *)&self->_descriptor, v24);
      v25 = [v6 name];
      v26 = v25;
      if (v25)
      {
        v27 = v25;
      }
      else
      {
        v27 = [v23 displayName];
      }
      displayName = self->_displayName;
      self->_displayName = v27;

      v29 = [v6 appAccessInfoMap];
      v30 = [v29 objectForKeyedSubscript:v7];
      uint64_t v31 = [v30 state];

      BOOL v32 = v31 == 20 || v31 == 10;
      int64_t v33 = 10;
      if (!v32) {
        int64_t v33 = 0;
      }
      if (v31 == 25) {
        int64_t v33 = 20;
      }
      self->_int64_t state = v33;
      if (([v9 accessoryOptions] & 2) != 0)
      {
        v36 = [v6 SSID];
        p_SSID = &self->_SSID;
        SSID = self->_SSID;
        self->_SSID = v36;
      }
      else
      {
        p_SSID = &self->_SSID;
        SSID = self->_SSID;
        self->_SSID = 0;
      }

      if (*p_bluetoothIdentifier || *p_SSID) {
        v37 = self;
      }
      else {
        v37 = 0;
      }
    }
    else
    {
      v37 = 0;
    }
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    id v6 = bluetoothTransportBridgingIdentifier;
    uint64_t v7 = [(NSData *)v6 bytes];
    if (v7) {
      id v8 = (const char *)v7;
    }
    else {
      id v8 = "";
    }
    size_t v9 = [(NSData *)v6 length];

    xpc_dictionary_set_data(v4, "btBdgId", v8, v9);
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    id v11 = v4;
    [(NSUUID *)bluetoothIdentifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v11, "bId", uuid);
  }
  identifier = self->_identifier;
  id v13 = v4;
  uint64_t v14 = [(NSString *)identifier UTF8String];
  if (v14) {
    xpc_dictionary_set_string(v13, "aSi", v14);
  }

  CUXPCEncodeObject();
  displayName = self->_displayName;
  id v16 = v13;
  uint64_t v17 = [(NSString *)displayName UTF8String];
  if (v17) {
    xpc_dictionary_set_string(v16, "dNm", v17);
  }

  SSID = self->_SSID;
  id v19 = v16;
  uint64_t v20 = [(NSString *)SSID UTF8String];
  if (v20) {
    xpc_dictionary_set_string(v19, "wsd", v20);
  }

  int64_t state = self->_state;
  if (state) {
    xpc_dictionary_set_int64(v19, "aSt", state);
  }
}

- (ASAccessory)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ASAccessory *)self init];
  if (!v7)
  {
    if (a4)
    {
      id v16 = [(id)objc_opt_class() description];
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  if (MEMORY[0x245670630](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      uint64_t v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  CUXPCDecodeNSData();
  CUXPCDecodeNSUUID();
  CUXPCDecodeNSString();
  objc_opt_class();
  CUXPCDecodeObject();
  CUXPCDecodeNSString();
  CUXPCDecodeNSString();
  if (CUXPCDecodeSInt64RangedEx() == 6) {
    v7->_int64_t state = 0;
  }
  uint64_t v14 = v7;
LABEL_6:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_bluetoothIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSData *)self->_bluetoothTransportBridgingIdentifier copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_identifier copy];
  uint64_t v10 = (void *)v4[7];
  v4[7] = v9;

  uint64_t v11 = [(ASDiscoveryDescriptor *)self->_descriptor copy];
  uint64_t v12 = (void *)v4[6];
  v4[6] = v11;

  uint64_t v13 = [(NSString *)self->_displayName copy];
  uint64_t v14 = (void *)v4[4];
  v4[4] = v13;

  uint64_t v15 = [(NSString *)self->_SSID copy];
  id v16 = (void *)v4[5];
  v4[5] = v15;

  v4[1] = self->_state;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASAccessory *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (![(ASAccessory *)v6 isMemberOfClass:objc_opt_class()])
    {
      BOOL v13 = 0;
LABEL_49:

      goto LABEL_50;
    }
    bluetoothIdentifier = self->_bluetoothIdentifier;
    uint64_t v8 = [(ASAccessory *)v6 bluetoothIdentifier];
    uint64_t v9 = bluetoothIdentifier;
    uint64_t v10 = v8;
    uint64_t v11 = v10;
    if (v9 == (NSUUID *)v10)
    {
    }
    else
    {
      if ((v9 == 0) == (v10 != 0))
      {
        BOOL v13 = 0;
        id v16 = v10;
LABEL_46:

        goto LABEL_47;
      }
      int v12 = [(NSUUID *)v9 isEqual:v10];

      if (!v12)
      {
        BOOL v13 = 0;
LABEL_48:

        goto LABEL_49;
      }
    }
    bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
    uint64_t v15 = [(ASAccessory *)v6 bluetoothTransportBridgingIdentifier];
    id v16 = bluetoothTransportBridgingIdentifier;
    uint64_t v17 = v15;
    uint64_t v9 = (NSUUID *)v17;
    if (v16 == v17)
    {
    }
    else
    {
      if ((v16 == 0) == (v17 != 0))
      {
        BOOL v13 = 0;
        p_isa = (NSString *)&v17->super.isa;
LABEL_45:

        goto LABEL_46;
      }
      int v18 = [(NSData *)v16 isEqual:v17];

      if (!v18)
      {
        BOOL v13 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    identifier = self->_identifier;
    uint64_t v20 = [(ASAccessory *)v6 identifier];
    p_isa = identifier;
    uint64_t v22 = v20;
    id v16 = v22;
    if (p_isa == (NSString *)v22)
    {
    }
    else
    {
      if ((p_isa == 0) == (v22 != 0))
      {
        BOOL v13 = 0;
        v26 = (ASDiscoveryDescriptor *)v22;
LABEL_44:

        goto LABEL_45;
      }
      int v23 = [(NSString *)p_isa isEqual:v22];

      if (!v23)
      {
        BOOL v13 = 0;
        goto LABEL_46;
      }
    }
    descriptor = self->_descriptor;
    v25 = [(ASAccessory *)v6 descriptor];
    v26 = descriptor;
    v27 = v25;
    p_isa = (NSString *)&v27->super.isa;
    if (v26 == v27)
    {
    }
    else
    {
      if ((v26 == 0) == (v27 != 0))
      {
        BOOL v13 = 0;
        uint64_t v31 = (NSString *)&v27->super.isa;
LABEL_43:

        goto LABEL_44;
      }
      BOOL v28 = [(ASDiscoveryDescriptor *)v26 isEqual:v27];

      if (!v28)
      {
        BOOL v13 = 0;
        goto LABEL_45;
      }
    }
    displayName = self->_displayName;
    v30 = [(ASAccessory *)v6 displayName];
    uint64_t v31 = displayName;
    BOOL v32 = v30;
    v26 = v32;
    if (v31 == (NSString *)v32)
    {
    }
    else
    {
      if ((v31 == 0) == (v32 != 0))
      {

        goto LABEL_42;
      }
      int v33 = [(NSString *)v31 isEqual:v32];

      if (!v33)
      {
        BOOL v13 = 0;
        goto LABEL_44;
      }
    }
    SSID = self->_SSID;
    v35 = [(ASAccessory *)v6 SSID];
    v36 = SSID;
    v37 = v35;
    uint64_t v31 = v37;
    if (v36 == v37)
    {

LABEL_40:
      int64_t state = self->_state;
      BOOL v13 = state == [(ASAccessory *)v6 state];
      goto LABEL_43;
    }
    if ((v36 == 0) != (v37 != 0))
    {
      int v40 = [(NSString *)v36 isEqual:v37];

      if (!v40) {
        goto LABEL_42;
      }
      goto LABEL_40;
    }

LABEL_42:
    BOOL v13 = 0;
    goto LABEL_43;
  }
  BOOL v13 = 1;
LABEL_50:

  return v13;
}

- (id)description
{
  return [(ASAccessory *)self descriptionWithLevel:50];
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
    uint64_t v21 = identifier;
    CUAppendF();
    id v6 = v4;

    id v4 = v6;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    uint64_t v22 = displayName;
    CUAppendF();
    id v8 = v4;

    id v4 = v8;
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    int v23 = bluetoothIdentifier;
    CUAppendF();
    id v10 = v4;

    id v4 = v10;
  }
  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    v24 = bluetoothTransportBridgingIdentifier;
    CUAppendF();
    id v12 = v4;

    id v4 = v12;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v25 = SSID;
    CUAppendF();
    id v14 = v4;

    id v4 = v14;
  }
  CUAppendF();
  uint64_t v15 = (__CFString *)v4;

  descriptor = self->_descriptor;
  if (descriptor)
  {
    v26 = descriptor;
    CUAppendF();
    uint64_t v17 = v15;

    uint64_t v15 = v17;
  }
  int v18 = &stru_26F86DD88;
  if (v15) {
    int v18 = v15;
  }
  uint64_t v19 = v18;

  return v19;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
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

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (ASDiscoveryDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bluetoothTransportBridgingIdentifier, 0);

  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

@end