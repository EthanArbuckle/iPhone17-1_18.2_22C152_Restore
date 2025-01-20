@interface CUMobileDevice
- (BOOL)connected;
- (BOOL)paired;
- (BOOL)placeholder;
- (NSString)internalModel;
- (NSString)name;
- (NSString)udid;
- (NSString)wifiAddress;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)setConnected:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setUdid:(id)a3;
- (void)setWifiAddress:(id)a3;
@end

@implementation CUMobileDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAddress, 0);
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_internalModel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setWifiAddress:(id)a3
{
}

- (NSString)wifiAddress
{
  return self->_wifiAddress;
}

- (void)setUdid:(id)a3
{
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setInternalModel:(id)a3
{
}

- (NSString)internalModel
{
  return self->_internalModel;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (id)description
{
  CFMutableStringRef v41 = 0;
  NSAppendPrintF(&v41, (uint64_t)"CUMobileDevice ID %@", v2, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  v9 = v41;
  v16 = v9;
  udid = self->_udid;
  if (udid)
  {
    CFMutableStringRef v40 = v9;
    NSAppendPrintF(&v40, (uint64_t)", UDID '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)udid);
    v18 = v40;

    v16 = v18;
  }
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v39 = v16;
    NSAppendPrintF(&v39, (uint64_t)", Name '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)name);
    v20 = v39;

    v16 = v20;
  }
  internalModel = self->_internalModel;
  if (internalModel)
  {
    CFMutableStringRef v38 = v16;
    NSAppendPrintF(&v38, (uint64_t)", Model '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)internalModel);
    v22 = v38;

    v16 = v22;
  }
  wifiAddress = self->_wifiAddress;
  if (wifiAddress)
  {
    CFMutableStringRef v37 = v16;
    NSAppendPrintF(&v37, (uint64_t)", WiFi '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)wifiAddress);
    v24 = v37;

    v16 = v24;
  }
  CFMutableStringRef v36 = v16;
  if (self->_paired) {
    v25 = "yes";
  }
  else {
    v25 = "no";
  }
  NSAppendPrintF(&v36, (uint64_t)", Paired %s", v10, v11, v12, v13, v14, v15, (uint64_t)v25);
  v26 = v36;

  if (self->_placeholder)
  {
    CFMutableStringRef v35 = v26;
    NSAppendPrintF(&v35, (uint64_t)", Placeholder %s", v27, v28, v29, v30, v31, v32, (uint64_t)"yes");
    v33 = v35;

    v26 = v33;
  }
  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    if (self->_connected) {
      *(unsigned char *)(v4 + 8) = 1;
    }
    identifier = self->_identifier;
    if (identifier) {
      objc_storeStrong((id *)(v4 + 16), identifier);
    }
    internalModel = self->_internalModel;
    if (internalModel) {
      objc_storeStrong((id *)(v5 + 24), internalModel);
    }
    name = self->_name;
    if (name) {
      objc_storeStrong((id *)(v5 + 32), name);
    }
    if (self->_paired) {
      *(unsigned char *)(v5 + 9) = 1;
    }
    if (self->_placeholder) {
      *(unsigned char *)(v5 + 10) = 1;
    }
    udid = self->_udid;
    if (udid) {
      objc_storeStrong((id *)(v5 + 40), udid);
    }
    wifiAddress = self->_wifiAddress;
    if (wifiAddress) {
      objc_storeStrong((id *)(v5 + 48), wifiAddress);
    }
  }
  return (id)v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CUMobileDevice;
  [(CUMobileDevice *)&v2 dealloc];
}

@end