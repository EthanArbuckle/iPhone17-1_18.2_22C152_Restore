@interface CBControllerInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fastLEConnectionAllowed;
- (BOOL)isEqual:(id)a3;
- (CBControllerInfo)initWithCoder:(id)a3;
- (CBControllerInfo)initWithDictionary:(id)a3 error:(id *)a4;
- (CBControllerInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)audioLinkQualityArray;
- (NSData)fastLEConnectionInfoData;
- (NSData)hardwareAddressData;
- (NSError)lastChipsetInitError;
- (NSString)chipsetID;
- (NSString)firmwareName;
- (NSString)firmwareVersion;
- (char)hciTransportType;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
- (int)discoverableState;
- (int)inquiryState;
- (int64_t)bluetoothState;
- (unsigned)cloudSyncStatus;
- (unsigned)fastLEConnectionInfoVersion;
- (unsigned)leaVersion;
- (unsigned)lmpVersion;
- (unsigned)productID;
- (unsigned)supportedServices;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAudioLinkQualityArray:(id)a3;
- (void)setBluetoothState:(int64_t)a3;
- (void)setChipsetID:(id)a3;
- (void)setCloudSyncStatus:(unsigned __int8)a3;
- (void)setDiscoverableState:(int)a3;
- (void)setFastLEConnectionAllowed:(BOOL)a3;
- (void)setFastLEConnectionInfoData:(id)a3;
- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3;
- (void)setFirmwareName:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHardwareAddressData:(id)a3;
- (void)setHciTransportType:(char)a3;
- (void)setInquiryState:(int)a3;
- (void)setLastChipsetInitError:(id)a3;
- (void)setLeaVersion:(unsigned __int8)a3;
- (void)setLmpVersion:(unsigned __int8)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setSupportedServices:(unsigned int)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setVendorIDSource:(unsigned __int8)a3;
@end

@implementation CBControllerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBControllerInfo)initWithCoder:(id)a3
{
  v11[8] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:8];
  v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ctrI"];

  v9 = [(CBControllerInfo *)self initWithDictionary:v8 error:0];
  return v9;
}

- (CBControllerInfo)initWithDictionary:(id)a3 error:(id *)a4
{
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = [(CBControllerInfo *)self initWithXPCObject:v12 error:a4];
    v13 = self;
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBControllerInfo convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [(CBControllerInfo *)self encodeWithXPCObject:v3];
  v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  id v5 = v4;
  if (!v4) {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v6 = v4;

  return v6;
}

- (CBControllerInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = [(CBControllerInfo *)self init];
  if (!v13)
  {
    if (!a4) {
      goto LABEL_53;
    }
    v28 = "CBControllerInfo init failed";
LABEL_52:
    CBErrorF(-6756, (uint64_t)v28, v7, v8, v9, v10, v11, v12, v29);
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (!a4) {
      goto LABEL_53;
    }
    v28 = "XPC non-dict";
    goto LABEL_52;
  }
  objc_opt_class();
  if (!CUXPCDecodeNSArrayOfClass()) {
    goto LABEL_53;
  }
  int v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v13->_bluetoothState = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_53;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_53;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_cloudSyncStatus = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_53;
  }
  int v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v13->_discoverableState = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_53;
  }
  if (!CUXPCDecodeBool()) {
    goto LABEL_53;
  }
  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v13->_fastLEConnectionInfoVersion = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_53;
  }
  if (!CUXPCDecodeNSData()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSDataOfLength())
  {
    goto LABEL_53;
  }
  int v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v13->_hciTransportType = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_53;
  }
  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_inquiryState = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_53;
  }
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_leaVersion = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_53;
  }
  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v13->_lmpVersion = 0;
  }
  else if (v21 == 5)
  {
    goto LABEL_53;
  }
  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v13->_productID = 0;
  }
  else if (v22 == 5)
  {
    goto LABEL_53;
  }
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v13->_supportedServices = 0;
  }
  else if (v23 == 5)
  {
    goto LABEL_53;
  }
  int v24 = CUXPCDecodeUInt64RangedEx();
  if (v24 == 6)
  {
    v13->_vendorID = 0;
  }
  else if (v24 == 5)
  {
    goto LABEL_53;
  }
  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 != 6)
  {
    if (v25 != 5) {
      goto LABEL_46;
    }
LABEL_53:
    v26 = 0;
    goto LABEL_47;
  }
  v13->_vendorIDSource = 0;
LABEL_46:
  v26 = v13;
LABEL_47:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CBControllerInfo *)self dictionaryRepresentation];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"ctrI"];
  }
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  CUXPCEncodeNSArrayOfObjects();
  int64_t bluetoothState = self->_bluetoothState;
  if (bluetoothState) {
    xpc_dictionary_set_int64(v4, "pwrS", bluetoothState);
  }
  chipsetID = self->_chipsetID;
  id v7 = v4;
  uint64_t v8 = [(NSString *)chipsetID UTF8String];
  if (v8) {
    xpc_dictionary_set_string(v7, "chip", v8);
  }

  if (self->_cloudSyncStatus) {
    xpc_dictionary_set_uint64(v7, "clSy", self->_cloudSyncStatus);
  }
  int64_t discoverableState = self->_discoverableState;
  if (discoverableState) {
    xpc_dictionary_set_int64(v7, "dsSt", discoverableState);
  }
  if (self->_fastLEConnectionAllowed) {
    xpc_dictionary_set_BOOL(v7, "fLEal", 1);
  }
  if (self->_fastLEConnectionInfoVersion) {
    xpc_dictionary_set_uint64(v7, "fLEVe", self->_fastLEConnectionInfoVersion);
  }
  fastLEConnectionInfoData = self->_fastLEConnectionInfoData;
  if (fastLEConnectionInfoData)
  {
    uint64_t v11 = fastLEConnectionInfoData;
    id v12 = v7;
    v13 = v11;
    uint64_t v14 = [(NSData *)v13 bytes];
    if (v14) {
      int v15 = (const char *)v14;
    }
    else {
      int v15 = "";
    }
    size_t v16 = [(NSData *)v13 length];

    xpc_dictionary_set_data(v12, "fLEDt", v15, v16);
  }
  firmwareName = self->_firmwareName;
  id v18 = v7;
  int v19 = [(NSString *)firmwareName UTF8String];
  if (v19) {
    xpc_dictionary_set_string(v18, "frmN", v19);
  }

  firmwareVersion = self->_firmwareVersion;
  xpc_object_t xdict = v18;
  int v21 = [(NSString *)firmwareVersion UTF8String];
  if (v21) {
    xpc_dictionary_set_string(xdict, "frmV", v21);
  }

  hardwareAddressData = self->_hardwareAddressData;
  if (hardwareAddressData)
  {
    int v23 = hardwareAddressData;
    id v24 = xdict;
    int v25 = v23;
    uint64_t v26 = [(NSData *)v25 bytes];
    if (v26) {
      v27 = (const char *)v26;
    }
    else {
      v27 = "";
    }
    size_t v28 = [(NSData *)v25 length];

    xpc_dictionary_set_data(v24, "btAd", v27, v28);
  }
  if (self->_hciTransportType) {
    xpc_dictionary_set_int64(xdict, "hciT", self->_hciTransportType);
  }
  int64_t inquiryState = self->_inquiryState;
  v30 = xdict;
  if (inquiryState)
  {
    xpc_dictionary_set_int64(xdict, "inqS", inquiryState);
    v30 = xdict;
  }
  if (self->_leaVersion)
  {
    xpc_dictionary_set_uint64(xdict, "fLEAVe", self->_leaVersion);
    v30 = xdict;
  }
  if (self->_lmpVersion)
  {
    xpc_dictionary_set_uint64(xdict, "lmpV", self->_lmpVersion);
    v30 = xdict;
  }
  uint64_t productID = self->_productID;
  if (productID)
  {
    xpc_dictionary_set_uint64(xdict, "pid", productID);
    v30 = xdict;
  }
  uint64_t supportedServices = self->_supportedServices;
  if (supportedServices)
  {
    xpc_dictionary_set_uint64(xdict, "supS", supportedServices);
    v30 = xdict;
  }
  if (self->_vendorID)
  {
    xpc_dictionary_set_uint64(xdict, "vid", self->_vendorID);
    v30 = xdict;
  }
  if (self->_vendorIDSource)
  {
    xpc_dictionary_set_uint64(xdict, "vidS", self->_vendorIDSource);
    v30 = xdict;
  }
}

- (id)description
{
  return [(CBControllerInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  xpc_object_t v3 = self;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0x14u)
  {
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v4 = self->_audioLinkQualityArray;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v116 objects:v121 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v117;
      do
      {
        uint64_t v9 = 0;
        uint64_t v10 = v7;
        do
        {
          if (*(void *)v117 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void **)(*((void *)&v116 + 1) + 8 * v9);
          id v12 = CUDescriptionWithLevel();
          v115 = v10;
          v13 = [v11 deviceName];
          id v14 = v12;
          [v14 UTF8String];
          v87 = CUPrintText();
          NSAppendPrintF();
          id v7 = v10;

          ++v9;
          uint64_t v10 = v7;
        }
        while (v6 != v9);
        uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v116, v121, 16, v13, v87);
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    id v114 = v7;
    NSAppendPrintF_safe();
    id v36 = v7;

    chipsetID = self->_chipsetID;
    if (chipsetID)
    {
      id v113 = v36;
      v83 = chipsetID;
      NSAppendPrintF_safe();
      id v38 = v36;

      id v36 = v38;
    }
    id v112 = v36;
    uint64_t discoverableState = self->_discoverableState;
    if (discoverableState >= 3) {
      v40 = "?";
    }
    else {
      v40 = off_1E5E324A8[discoverableState];
    }
    v84 = v40;
    NSAppendPrintF_safe();
    id v41 = v112;

    v42 = self->_firmwareName;
    v43 = self->_firmwareVersion;
    size_t v16 = v42;
    v44 = v43;
    v45 = v44;
    if (v16 == v44)
    {
    }
    else
    {
      if ((v16 == 0) == (v44 != 0))
      {

        if (!v16) {
          goto LABEL_43;
        }
        goto LABEL_42;
      }
      char v46 = -[NSArray isEqual:](v16, "isEqual:", v44, v84);

      if ((v46 & 1) == 0)
      {
        if (!v16)
        {
LABEL_43:
          if (!v45)
          {
LABEL_48:
            hardwareAddressData = self->_hardwareAddressData;
            if (hardwareAddressData)
            {
              id v109 = v41;
              v51 = hardwareAddressData;
              v85 = CUPrintNSDataAddress();
              NSAppendPrintF_safe();
              id v52 = v41;

              id v41 = v52;
            }
            id v108 = v41;
            NSAppendPrintF_safe();
            id v53 = v41;

            if (self->_hciTransportType)
            {
              id v107 = v53;
              NSAppendPrintF_safe();
              id v63 = v53;

              id v53 = v63;
            }
            id v106 = v53;
            NSAppendPrintF_safe();
            id v64 = v53;

            id v105 = v64;
            NSAppendPrintF_safe();
            id v65 = v64;

            id v104 = v65;
            v60 = CUPrintFlags32();
            NSAppendPrintF_safe();
            v66 = (__CFString *)v65;
            goto LABEL_83;
          }
          v110[0] = v41;
          v48 = (id *)v110;
LABEL_47:
          NSAppendPrintF_safe();
          id v49 = *v48;

          id v41 = v49;
          goto LABEL_48;
        }
LABEL_42:
        v110[1] = v41;
        NSAppendPrintF_safe();
        id v47 = v41;

        id v41 = v47;
        goto LABEL_43;
      }
    }
    id v111 = v41;
    v48 = &v111;
    goto LABEL_47;
  }
  if ((a3 & 0x8000000) != 0)
  {
    id v15 = 0;
    size_t v16 = self->_audioLinkQualityArray;
    if (![(NSArray *)v16 count]) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v103 = 0;
    NSAppendPrintF_safe();
    id v15 = 0;
    size_t v16 = v3->_audioLinkQualityArray;
    if (![(NSArray *)v16 count])
    {
LABEL_11:
      id v95 = v15;
      goto LABEL_25;
    }
  }
  int v17 = v3;
  id v102 = v15;
  NSAppendPrintF_safe();
  id v18 = v15;

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  int v19 = v16;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v98 objects:v120 count:16];
  if (v20)
  {
    unint64_t v21 = v20;
    uint64_t v22 = *(void *)v99;
    int v23 = "";
    do
    {
      if (*(void *)v99 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = **((void **)&v98 + 1);
      id v97 = v18;
      v81 = v23;
      uint64_t v88 = v24;
      NSAppendPrintF_safe();
      id v25 = v18;

      if (v21 < 2)
      {
        id v18 = v25;
      }
      else
      {
        for (uint64_t i = 1; i != v21; ++i)
        {
          if (*(void *)v99 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v27 = *(void *)(*((void *)&v98 + 1) + 8 * i);
          id v97 = v25;
          v81 = ", ";
          uint64_t v88 = v27;
          NSAppendPrintF_safe();
          id v18 = v25;

          id v25 = v18;
        }
      }
      unint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v98, v120, 16, v81, v88);
      int v23 = ", ";
    }
    while (v21);
  }

  id v96 = v18;
  NSAppendPrintF_safe();
  id v15 = v18;

  xpc_object_t v3 = v17;
  id v95 = v15;
LABEL_25:
  NSAppendPrintF_safe();
  id v28 = v95;

  id v94 = v28;
  uint64_t v29 = v3->_discoverableState;
  v30 = "?";
  if (v29 <= 2) {
    v30 = off_1E5E324A8[v29];
  }
  v82 = (char *)v30;
  NSAppendPrintF_safe();
  id v31 = v94;

  v32 = v3->_chipsetID;
  if (v32)
  {
    id v93 = v31;
    v82 = v32;
    NSAppendPrintF_safe();
    id v33 = v31;

    id v31 = v33;
  }
  unsigned int cloudSyncStatus = v3->_cloudSyncStatus;
  if (v3->_cloudSyncStatus)
  {
    id v92 = v31;
    if (cloudSyncStatus > 3) {
      v35 = "?";
    }
    else {
      v35 = off_1E5E323F8[(char)(cloudSyncStatus - 1)];
    }
    v82 = (char *)v35;
    NSAppendPrintF_safe();
    id v54 = v92;

    id v31 = v54;
  }
  fastLEConnectionInfoVersion = (char *)v3->_fastLEConnectionInfoVersion;
  if (v3->_fastLEConnectionInfoVersion)
  {
    v91[1] = v31;
    v82 = fastLEConnectionInfoVersion;
    NSAppendPrintF_safe();
    id v56 = v31;

    id v31 = v56;
  }
  v57 = v3->_firmwareName;
  v58 = v3->_firmwareVersion;
  v45 = v57;
  v59 = v58;
  v60 = v59;
  if (v45 != v59)
  {
    if ((v45 == 0) != (v59 != 0))
    {
      char v61 = -[NSArray isEqual:](v45, "isEqual:", v59, v82);

      if (v61)
      {
        if (!v60) {
          goto LABEL_72;
        }
        goto LABEL_62;
      }
    }
    else
    {
    }
    if (v45)
    {
      v90[1] = v31;
      NSAppendPrintF_safe();
      id v67 = v31;

      id v31 = v67;
    }
    if (!v60) {
      goto LABEL_72;
    }
    v90[0] = v31;
    v62 = (id *)v90;
    goto LABEL_71;
  }

  if (v60)
  {
LABEL_62:
    v91[0] = v31;
    v62 = (id *)v91;
LABEL_71:
    NSAppendPrintF_safe();
    id v68 = *v62;

    id v31 = v68;
  }
LABEL_72:
  v69 = v3->_hardwareAddressData;
  if (v69)
  {
    v70 = v69;
    v86 = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v71 = v31;

    id v31 = v71;
  }
  if (v3->_productID)
  {
    NSAppendPrintF_safe();
    id v72 = v31;

    id v31 = v72;
  }
  if (v3->_vendorID)
  {
    NSAppendPrintF_safe();
    id v73 = v31;

    id v31 = v73;
  }
  if (v3->_vendorIDSource)
  {
    NSAppendPrintF_safe();
    id v74 = v31;

    id v31 = v74;
  }
  if (v3->_hciTransportType)
  {
    NSAppendPrintF_safe();
    id v75 = v31;

    id v31 = v75;
  }
  NSAppendPrintF_safe();
  id v76 = v31;

  NSAppendPrintF_safe();
  id v77 = v76;

  CUPrintFlags32();
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v66 = (__CFString *)v77;

LABEL_83:
  if (v66) {
    v78 = v66;
  }
  else {
    v78 = &stru_1F02E5F20;
  }
  v79 = v78;

  return v79;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    audioLinkQualityArray = self->_audioLinkQualityArray;
    id v7 = [v5 audioLinkQualityArray];
    uint64_t v8 = audioLinkQualityArray;
    uint64_t v9 = v7;
    if (v8 == v9)
    {

      int64_t bluetoothState = self->_bluetoothState;
      if (bluetoothState != [v5 bluetoothState]) {
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v10 = v9;
      if ((v8 == 0) == (v9 != 0)) {
        goto LABEL_50;
      }
      int v11 = [(NSArray *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_49;
      }
      int64_t v12 = self->_bluetoothState;
      if (v12 != [v5 bluetoothState]) {
        goto LABEL_49;
      }
    }
    chipsetID = self->_chipsetID;
    id v15 = [v5 chipsetID];
    uint64_t v8 = chipsetID;
    size_t v16 = v15;
    if (v8 == v16)
    {

      int cloudSyncStatus = self->_cloudSyncStatus;
      if (cloudSyncStatus != [v5 cloudSyncStatus]) {
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v10 = v16;
      if ((v8 == 0) == (v16 != 0)) {
        goto LABEL_50;
      }
      int v17 = [(NSArray *)v8 isEqual:v16];

      if (!v17) {
        goto LABEL_49;
      }
      int v18 = self->_cloudSyncStatus;
      if (v18 != [v5 cloudSyncStatus]) {
        goto LABEL_49;
      }
    }
    int discoverableState = self->_discoverableState;
    if (discoverableState != [v5 discoverableState]) {
      goto LABEL_49;
    }
    int fastLEConnectionAllowed = self->_fastLEConnectionAllowed;
    if (fastLEConnectionAllowed != [v5 fastLEConnectionAllowed]) {
      goto LABEL_49;
    }
    int fastLEConnectionInfoVersion = self->_fastLEConnectionInfoVersion;
    if (fastLEConnectionInfoVersion != [v5 fastLEConnectionInfoVersion]) {
      goto LABEL_49;
    }
    fastLEConnectionInfoData = self->_fastLEConnectionInfoData;
    uint64_t v24 = [v5 fastLEConnectionInfoData];
    uint64_t v8 = fastLEConnectionInfoData;
    id v25 = v24;
    if (v8 == v25)
    {
    }
    else
    {
      uint64_t v10 = v25;
      if ((v8 == 0) == (v25 != 0)) {
        goto LABEL_50;
      }
      int v26 = [(NSArray *)v8 isEqual:v25];

      if (!v26) {
        goto LABEL_49;
      }
    }
    firmwareName = self->_firmwareName;
    id v28 = [v5 firmwareName];
    uint64_t v8 = firmwareName;
    uint64_t v29 = v28;
    if (v8 == v29)
    {
    }
    else
    {
      uint64_t v10 = v29;
      if ((v8 == 0) == (v29 != 0)) {
        goto LABEL_50;
      }
      int v30 = [(NSArray *)v8 isEqual:v29];

      if (!v30) {
        goto LABEL_49;
      }
    }
    firmwareVersion = self->_firmwareVersion;
    v32 = [v5 firmwareVersion];
    uint64_t v8 = firmwareVersion;
    id v33 = v32;
    if (v8 == v33)
    {
    }
    else
    {
      uint64_t v10 = v33;
      if ((v8 == 0) == (v33 != 0)) {
        goto LABEL_50;
      }
      int v34 = [(NSArray *)v8 isEqual:v33];

      if (!v34) {
        goto LABEL_49;
      }
    }
    hardwareAddressData = self->_hardwareAddressData;
    id v36 = [v5 hardwareAddressData];
    uint64_t v8 = hardwareAddressData;
    v37 = v36;
    if (v8 == v37)
    {
    }
    else
    {
      uint64_t v10 = v37;
      if ((v8 == 0) == (v37 != 0)) {
        goto LABEL_50;
      }
      int v38 = [(NSArray *)v8 isEqual:v37];

      if (!v38) {
        goto LABEL_49;
      }
    }
    int hciTransportType = self->_hciTransportType;
    if (hciTransportType == [v5 hciTransportType])
    {
      int inquiryState = self->_inquiryState;
      if (inquiryState == [v5 inquiryState])
      {
        int leaVersion = self->_leaVersion;
        if (leaVersion == [v5 leaVersion])
        {
          int lmpVersion = self->_lmpVersion;
          if (lmpVersion == [v5 lmpVersion])
          {
            unsigned int productID = self->_productID;
            if (productID == [v5 productID])
            {
              unsigned int supportedServices = self->_supportedServices;
              if (supportedServices == [v5 supportedServices])
              {
                int vendorID = self->_vendorID;
                if (vendorID == [v5 vendorID])
                {
                  int vendorIDSource = self->_vendorIDSource;
                  if (vendorIDSource == [v5 vendorIDSource])
                  {
                    lastChipsetInitError = self->_lastChipsetInitError;
                    id v49 = [v5 lastChipsetInitError];
                    uint64_t v8 = lastChipsetInitError;
                    v50 = v49;
                    uint64_t v10 = v50;
                    if (v8 == v50)
                    {
                      char v39 = 1;
                      goto LABEL_51;
                    }
                    if ((v8 == 0) != (v50 != 0))
                    {
                      char v39 = [(NSArray *)v8 isEqual:v50];
LABEL_51:

                      goto LABEL_52;
                    }
LABEL_50:
                    char v39 = 0;
                    goto LABEL_51;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_49:
    char v39 = 0;
LABEL_52:

    goto LABEL_53;
  }
  char v39 = 0;
LABEL_53:

  return v39;
}

- (NSArray)audioLinkQualityArray
{
  return self->_audioLinkQualityArray;
}

- (void)setAudioLinkQualityArray:(id)a3
{
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_int64_t bluetoothState = a3;
}

- (NSString)chipsetID
{
  return self->_chipsetID;
}

- (void)setChipsetID:(id)a3
{
}

- (unsigned)cloudSyncStatus
{
  return self->_cloudSyncStatus;
}

- (void)setCloudSyncStatus:(unsigned __int8)a3
{
  self->_int cloudSyncStatus = a3;
}

- (int)discoverableState
{
  return self->_discoverableState;
}

- (void)setDiscoverableState:(int)a3
{
  self->_int discoverableState = a3;
}

- (unsigned)fastLEConnectionInfoVersion
{
  return self->_fastLEConnectionInfoVersion;
}

- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3
{
  self->_int fastLEConnectionInfoVersion = a3;
}

- (NSData)fastLEConnectionInfoData
{
  return self->_fastLEConnectionInfoData;
}

- (void)setFastLEConnectionInfoData:(id)a3
{
}

- (NSString)firmwareName
{
  return self->_firmwareName;
}

- (void)setFirmwareName:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSData)hardwareAddressData
{
  return self->_hardwareAddressData;
}

- (void)setHardwareAddressData:(id)a3
{
}

- (char)hciTransportType
{
  return self->_hciTransportType;
}

- (void)setHciTransportType:(char)a3
{
  self->_int hciTransportType = a3;
}

- (int)inquiryState
{
  return self->_inquiryState;
}

- (void)setInquiryState:(int)a3
{
  self->_int inquiryState = a3;
}

- (unsigned)leaVersion
{
  return self->_leaVersion;
}

- (void)setLeaVersion:(unsigned __int8)a3
{
  self->_int leaVersion = a3;
}

- (unsigned)lmpVersion
{
  return self->_lmpVersion;
}

- (void)setLmpVersion:(unsigned __int8)a3
{
  self->_int lmpVersion = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_unsigned int productID = a3;
}

- (unsigned)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(unsigned int)a3
{
  self->_unsigned int supportedServices = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_int vendorID = a3;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (void)setVendorIDSource:(unsigned __int8)a3
{
  self->_int vendorIDSource = a3;
}

- (NSError)lastChipsetInitError
{
  return self->_lastChipsetInitError;
}

- (void)setLastChipsetInitError:(id)a3
{
}

- (BOOL)fastLEConnectionAllowed
{
  return self->_fastLEConnectionAllowed;
}

- (void)setFastLEConnectionAllowed:(BOOL)a3
{
  self->_int fastLEConnectionAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChipsetInitError, 0);
  objc_storeStrong((id *)&self->_hardwareAddressData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareName, 0);
  objc_storeStrong((id *)&self->_fastLEConnectionInfoData, 0);
  objc_storeStrong((id *)&self->_chipsetID, 0);

  objc_storeStrong((id *)&self->_audioLinkQualityArray, 0);
}

@end