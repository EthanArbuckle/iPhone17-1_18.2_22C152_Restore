@interface CUBluetoothDevice
- ($D91DDCA3822F03E96939068EA8DE741A)address;
- (BOOL)isEqual:(id)a3;
- (BOOL)magicPaired;
- (BOOL)present;
- (BOOL)supportsAACPService;
- (CUBluetoothDevice)init;
- (NSString)addressString;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)name;
- (NSUUID)identifier;
- (id)description;
- (int)colorCode;
- (int)disconnectReason;
- (int)primaryPlacement;
- (int)secondaryPlacement;
- (int)streamState;
- (unint64_t)hash;
- (unsigned)connectedServices;
- (unsigned)deviceFlags;
- (unsigned)deviceType;
- (unsigned)productIdentifier;
- (unsigned)versionID;
- (void)setAddress:(id)a3;
- (void)setAddressString:(id)a3;
- (void)setColorCode:(int)a3;
- (void)setConnectedServices:(unsigned int)a3;
- (void)setDeviceFlags:(unsigned int)a3;
- (void)setDeviceType:(unsigned int)a3;
- (void)setDisconnectReason:(int)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMagicPaired:(BOOL)a3;
- (void)setManufacturer:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setName:(id)a3;
- (void)setPresent:(BOOL)a3;
- (void)setPrimaryPlacement:(int)a3;
- (void)setProductIdentifier:(unsigned int)a3;
- (void)setSecondaryPlacement:(int)a3;
- (void)setStreamState:(int)a3;
- (void)setSupportsAACPService:(BOOL)a3;
- (void)setVersionID:(unsigned int)a3;
@end

@implementation CUBluetoothDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setVersionID:(unsigned int)a3
{
  self->_versionID = a3;
}

- (unsigned)versionID
{
  return self->_versionID;
}

- (void)setSupportsAACPService:(BOOL)a3
{
  self->_supportsAACPService = a3;
}

- (BOOL)supportsAACPService
{
  return self->_supportsAACPService;
}

- (void)setStreamState:(int)a3
{
  self->_streamState = a3;
}

- (int)streamState
{
  return self->_streamState;
}

- (void)setProductIdentifier:(unsigned int)a3
{
  self->_productIdentifier = a3;
}

- (unsigned)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setSecondaryPlacement:(int)a3
{
  self->_secondaryPlacement = a3;
}

- (int)secondaryPlacement
{
  return self->_secondaryPlacement;
}

- (void)setPrimaryPlacement:(int)a3
{
  self->_primaryPlacement = a3;
}

- (int)primaryPlacement
{
  return self->_primaryPlacement;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMagicPaired:(BOOL)a3
{
  self->_magicPaired = a3;
}

- (BOOL)magicPaired
{
  return self->_magicPaired;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisconnectReason:(int)a3
{
  self->_disconnectReason = a3;
}

- (int)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_deviceFlags = a3;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setColorCode:(int)a3
{
  self->_colorCode = a3;
}

- (int)colorCode
{
  return self->_colorCode;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_connectedServices = a3;
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (void)setAddressString:(id)a3
{
}

- (NSString)addressString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAddress:(id)a3
{
  self->_address = ($F37A0EEEFB629DA6F1DB93542131767D)a3;
}

- ($D91DDCA3822F03E96939068EA8DE741A)address
{
  return ($D91DDCA3822F03E96939068EA8DE741A)(*(unsigned int *)self->_address.bytes | ((unint64_t)*(unsigned __int16 *)&self->_address.bytes[4] << 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CUBluetoothDevice *)self addressString];
    v6 = [v4 addressString];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else if ((v7 == 0) == (v8 != 0))
    {
      char v10 = 0;
    }
    else
    {
      char v10 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(CUBluetoothDevice *)self addressString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  CFMutableStringRef v106 = 0;
  unint64_t v3 = [(CUBluetoothDevice *)self addressString];
  NSAppendPrintF(&v106, (uint64_t)"CUBluetoothDevice %@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  char v10 = v106;

  uint64_t v11 = [(CUBluetoothDevice *)self identifier];
  v18 = (void *)v11;
  if (v11)
  {
    CFMutableStringRef v105 = v10;
    NSAppendPrintF(&v105, (uint64_t)", ID '%@'", v12, v13, v14, v15, v16, v17, v11);
    v19 = v105;

    char v10 = v19;
  }

  uint64_t v20 = [(CUBluetoothDevice *)self name];
  v27 = (void *)v20;
  if (v20)
  {
    CFMutableStringRef v104 = v10;
    NSAppendPrintF(&v104, (uint64_t)", '%@'", v21, v22, v23, v24, v25, v26, v20);
    v28 = v104;

    char v10 = v28;
  }

  uint64_t v29 = [(CUBluetoothDevice *)self manufacturer];
  v36 = (void *)v29;
  if (v29)
  {
    CFMutableStringRef v103 = v10;
    NSAppendPrintF(&v103, (uint64_t)", Mfg '%@'", v30, v31, v32, v33, v34, v35, v29);
    v37 = v103;

    char v10 = v37;
  }

  uint64_t v38 = [(CUBluetoothDevice *)self modelNumber];
  v45 = (void *)v38;
  if (v38)
  {
    CFMutableStringRef v102 = v10;
    NSAppendPrintF(&v102, (uint64_t)", Md %@", v39, v40, v41, v42, v43, v44, v38);
    v46 = v102;

    char v10 = v46;
  }

  uint64_t productIdentifier = self->_productIdentifier;
  if (productIdentifier)
  {
    CFMutableStringRef v101 = v10;
    NSAppendPrintF(&v101, (uint64_t)", PID 0x%X", v47, v48, v49, v50, v51, v52, productIdentifier);
    v54 = v101;

    char v10 = v54;
  }
  uint64_t versionID = self->_versionID;
  if (versionID)
  {
    CFMutableStringRef v100 = v10;
    NSAppendPrintF(&v100, (uint64_t)", VrI 0x%X", v47, v48, v49, v50, v51, v52, versionID);
    v56 = v100;

    char v10 = v56;
  }
  uint64_t deviceType = self->_deviceType;
  if (deviceType)
  {
    CFMutableStringRef v99 = v10;
    NSAppendPrintF(&v99, (uint64_t)", DT %d", v47, v48, v49, v50, v51, v52, deviceType);
    v58 = v99;

    char v10 = v58;
  }
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion)
  {
    CFMutableStringRef v98 = v10;
    v60 = firmwareVersion;
    NSAppendPrintF(&v98, (uint64_t)", FV '%@'", v61, v62, v63, v64, v65, v66, (uint64_t)v60);
    v67 = v98;

    char v10 = v67;
  }
  uint64_t connectedServices = self->_connectedServices;
  if (connectedServices)
  {
    CFMutableStringRef v97 = v10;
    NSAppendPrintF(&v97, (uint64_t)", CnS 0x%X", v47, v48, v49, v50, v51, v52, connectedServices);
    v69 = v97;

    char v10 = v69;
  }
  unsigned int primaryPlacement = self->_primaryPlacement;
  if (primaryPlacement)
  {
    CFMutableStringRef v96 = v10;
    if (primaryPlacement > 7) {
      v71 = "?";
    }
    else {
      v71 = off_1E55BDC90[primaryPlacement - 1];
    }
    NSAppendPrintF(&v96, (uint64_t)", PriP %s", v47, v48, v49, v50, v51, v52, (uint64_t)v71);
    v72 = v96;

    char v10 = v72;
  }
  unsigned int secondaryPlacement = self->_secondaryPlacement;
  if (secondaryPlacement)
  {
    CFMutableStringRef v95 = v10;
    if (secondaryPlacement > 7) {
      v74 = "?";
    }
    else {
      v74 = off_1E55BDC90[secondaryPlacement - 1];
    }
    NSAppendPrintF(&v95, (uint64_t)", 2ndP %s", v47, v48, v49, v50, v51, v52, (uint64_t)v74);
    v75 = v95;

    char v10 = v75;
  }
  unsigned int streamState = self->_streamState;
  if (streamState)
  {
    CFMutableStringRef v94 = v10;
    if (streamState > 3) {
      v77 = "?";
    }
    else {
      v77 = off_1E55BDCC8[streamState - 1];
    }
    NSAppendPrintF(&v94, (uint64_t)", Strm %s", v47, v48, v49, v50, v51, v52, (uint64_t)v77);
    v78 = v94;

    char v10 = v78;
  }
  if (self->_magicPaired)
  {
    CFMutableStringRef v93 = v10;
    NSAppendPrintF(&v93, (uint64_t)", MagicPaired", v47, v48, v49, v50, v51, v52, v88);
    v79 = v93;

    char v10 = v79;
  }
  if (self->_supportsAACPService)
  {
    CFMutableStringRef v92 = v10;
    NSAppendPrintF(&v92, (uint64_t)", AACP", v47, v48, v49, v50, v51, v52, v88);
    v80 = v92;

    char v10 = v80;
  }
  uint64_t colorCode = self->_colorCode;
  if (colorCode != -1)
  {
    CFMutableStringRef v91 = v10;
    NSAppendPrintF(&v91, (uint64_t)", Color %d (%s)", v47, v48, v49, v50, v51, v52, colorCode);
    v82 = v91;

    char v10 = v82;
  }
  uint64_t deviceFlags = self->_deviceFlags;
  if (deviceFlags)
  {
    CFMutableStringRef v90 = v10;
    NSAppendPrintF(&v90, (uint64_t)", DF %#{flags}", v47, v48, v49, v50, v51, v52, deviceFlags);
    v84 = v90;

    char v10 = v84;
  }
  uint64_t disconnectReason = self->_disconnectReason;
  if (disconnectReason)
  {
    CFMutableStringRef v89 = v10;
    NSAppendPrintF(&v89, (uint64_t)", DR %#m", v47, v48, v49, v50, v51, v52, disconnectReason);
    v86 = v89;

    char v10 = v86;
  }
  return v10;
}

- (CUBluetoothDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUBluetoothDevice;
  v2 = [(CUBluetoothDevice *)&v6 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_uint64_t colorCode = -1;
    uint64_t v4 = v2;
  }

  return v3;
}

@end