@interface DADeviceSettings
- (BOOL)userInitiated;
- (DADeviceSettings)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)bridgingIdentifier;
- (NSString)SSID;
- (NSString)displayName;
- (UTType)iconType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBridgingIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIconType:(id)a3;
- (void)setSSID:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation DADeviceSettings

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = [(UTType *)self->_iconType identifier];
  id v6 = v4;
  id v7 = v5;
  v8 = (const char *)[v7 UTF8String];
  if (v8) {
    xpc_dictionary_set_string(v6, "dvPT", v8);
  }

  displayName = self->_displayName;
  id v10 = v6;
  v11 = [(NSString *)displayName UTF8String];
  if (v11) {
    xpc_dictionary_set_string(v10, "name", v11);
  }

  bridgingIdentifier = self->_bridgingIdentifier;
  if (bridgingIdentifier)
  {
    v13 = bridgingIdentifier;
    id v14 = v10;
    v15 = v13;
    uint64_t v16 = [(NSData *)v15 bytes];
    if (v16) {
      v17 = (const char *)v16;
    }
    else {
      v17 = "";
    }
    size_t v18 = [(NSData *)v15 length];

    xpc_dictionary_set_data(v14, "btCa", v17, v18);
  }
  SSID = self->_SSID;
  xpc_object_t xdict = v10;
  v20 = [(NSString *)SSID UTF8String];
  if (v20) {
    xpc_dictionary_set_string(xdict, "ssID", v20);
  }

  if (self->_userInitiated) {
    xpc_dictionary_set_BOOL(xdict, "uItd", 1);
  }
}

- (DADeviceSettings)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DADeviceSettings *)self init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v16 = [(id)objc_opt_class() description];
      DAErrorF(350004, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  if (MEMORY[0x223C529E0](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      id v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_16:
    id v14 = 0;
    goto LABEL_10;
  }
  if (CUXPCDecodeNSString()
    && CUXPCDecodeNSData()
    && CUXPCDecodeNSString()
    && CUXPCDecodeNSString()
    && CUXPCDecodeBool())
  {
    id v14 = v7;
  }
  else
  {
    id v14 = 0;
  }

LABEL_10:
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSData *)self->_bridgingIdentifier copy];
  id v6 = (void *)v4[5];
  v4[5] = v5;

  uint64_t v7 = [(NSString *)self->_displayName copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(UTType *)self->_iconType copy];
  uint64_t v10 = (void *)v4[2];
  v4[2] = v9;

  uint64_t v11 = [(NSString *)self->_SSID copy];
  uint64_t v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (id)description
{
  return [(DADeviceSettings *)self descriptionWithLevel:50];
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
  iconType = self->_iconType;
  if (iconType)
  {
    id v6 = iconType;
    uint64_t v19 = [(UTType *)v6 identifier];
    CUAppendF();
    uint64_t v7 = v4;

    id v4 = v7;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    uint64_t v20 = displayName;
    CUAppendF();
    uint64_t v9 = v4;

    id v4 = v9;
  }
  bridgingIdentifier = self->_bridgingIdentifier;
  if (bridgingIdentifier)
  {
    uint64_t v11 = bridgingIdentifier;
    uint64_t v21 = CUPrintNSDataAddress();
    CUAppendF();
    uint64_t v12 = v4;

    id v4 = v12;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    uint64_t v22 = SSID;
    CUAppendF();
    id v14 = v4;

    id v4 = v14;
  }
  if (self->_userInitiated)
  {
    CUAppendF();
    v15 = v4;

    id v4 = v15;
  }
  uint64_t v16 = &stru_26D120818;
  if (v4) {
    uint64_t v16 = v4;
  }
  uint64_t v17 = v16;

  return v17;
}

- (UTType)iconType
{
  return self->_iconType;
}

- (void)setIconType:(id)a3
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

- (NSData)bridgingIdentifier
{
  return self->_bridgingIdentifier;
}

- (void)setBridgingIdentifier:(id)a3
{
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgingIdentifier, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_iconType, 0);
}

@end