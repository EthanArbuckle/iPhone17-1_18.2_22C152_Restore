@interface CUBLEDevice
- ($7EB1B296D1955B59A85A052388D5D5F9)proximityPairingLastConnectedHost;
- (NSData)addressData;
- (NSData)appleManufacturerData;
- (NSData)lgBTAddress;
- (NSData)lgDeviceID;
- (NSData)manufacturerData;
- (NSData)nearbyAuthTag;
- (NSData)objectDiscoveryNearOwnerID;
- (NSData)objectDiscoveryPublicKeyData;
- (NSString)identifier;
- (NSString)objectSetupFontCode;
- (NSString)objectSetupMessage;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)nearbyActionType;
- (int)objectDiscoveryMode;
- (int)objectSetupBatteryPerformance;
- (int)proximityPairingSubType;
- (int)rawRSSI;
- (unsigned)changeFlags;
- (unsigned)deviceFlags;
- (unsigned)lgFlags;
- (unsigned)nearbyActivityLevel;
- (unsigned)nearbyFlags;
- (unsigned)objectDiscoveryBatteryState;
- (unsigned)objectDiscoveryProductID;
- (unsigned)objectSetupBatteryState;
- (unsigned)objectSetupColorCode;
- (unsigned)objectSetupFlags;
- (unsigned)proximityPairingAudioSourceCount;
- (unsigned)proximityPairingProductID;
- (unsigned)scanFlags;
- (unsigned)updateWithAdvertisementData:(id)a3 rssi:(int)a4 oldDevice:(id)a5;
- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4 data:(id)a5;
- (void)_parseAppleNearbyActionPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleNearbyInfoPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleProximityPairingPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleProximityPairingStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseLGManufacturerPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5;
- (void)_parseManufacturerData:(id)a3 advertisementFields:(id)a4;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceFlags:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CUBLEDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectSetupMessage, 0);
  objc_storeStrong((id *)&self->_objectSetupFontCode, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryPublicKeyData, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryNearOwnerID, 0);
  objc_storeStrong((id *)&self->_nearbyAuthTag, 0);
  objc_storeStrong((id *)&self->_manufacturerData, 0);
  objc_storeStrong((id *)&self->_lgDeviceID, 0);
  objc_storeStrong((id *)&self->_lgBTAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appleManufacturerData, 0);
  objc_storeStrong((id *)&self->_addressData, 0);
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (unsigned)proximityPairingAudioSourceCount
{
  return self->_proximityPairingAudioSourceCount;
}

- (int)proximityPairingSubType
{
  return self->_proximityPairingSubType;
}

- (unsigned)proximityPairingProductID
{
  return self->_proximityPairingProductID;
}

- ($7EB1B296D1955B59A85A052388D5D5F9)proximityPairingLastConnectedHost
{
  return ($7EB1B296D1955B59A85A052388D5D5F9)(*(unsigned __int16 *)self->_proximityPairingLastConnectedHost.bytes | (self->_proximityPairingLastConnectedHost.bytes[2] << 16));
}

- (NSString)objectSetupMessage
{
  return self->_objectSetupMessage;
}

- (NSString)objectSetupFontCode
{
  return self->_objectSetupFontCode;
}

- (unsigned)objectSetupFlags
{
  return self->_objectSetupFlags;
}

- (unsigned)objectSetupColorCode
{
  return self->_objectSetupColorCode;
}

- (unsigned)objectSetupBatteryState
{
  return self->_objectSetupBatteryState;
}

- (int)objectSetupBatteryPerformance
{
  return self->_objectSetupBatteryPerformance;
}

- (NSData)objectDiscoveryPublicKeyData
{
  return self->_objectDiscoveryPublicKeyData;
}

- (unsigned)objectDiscoveryProductID
{
  return self->_objectDiscoveryProductID;
}

- (NSData)objectDiscoveryNearOwnerID
{
  return self->_objectDiscoveryNearOwnerID;
}

- (int)objectDiscoveryMode
{
  return self->_objectDiscoveryMode;
}

- (unsigned)objectDiscoveryBatteryState
{
  return self->_objectDiscoveryBatteryState;
}

- (unsigned)nearbyFlags
{
  return self->_nearbyFlags;
}

- (NSData)nearbyAuthTag
{
  return self->_nearbyAuthTag;
}

- (int)nearbyActionType
{
  return self->_nearbyActionType;
}

- (unsigned)nearbyActivityLevel
{
  return self->_nearbyActivityLevel;
}

- (NSData)manufacturerData
{
  return self->_manufacturerData;
}

- (unsigned)lgFlags
{
  return self->_lgFlags;
}

- (NSData)lgDeviceID
{
  return self->_lgDeviceID;
}

- (NSData)lgBTAddress
{
  return self->_lgBTAddress;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_deviceFlags = a3;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (NSData)appleManufacturerData
{
  return self->_appleManufacturerData;
}

- (NSData)addressData
{
  return self->_addressData;
}

- (void)_parseLGManufacturerPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  self->_scanFlags |= 0x40u;
  self->_lgFlags = 0;
  if (a4 - a3 >= 4 && (a3[3] & 1) != 0) {
    self->_lgFlags = 3;
  }
  CFDictionaryRef v6 = (const __CFDictionary *)a5;
  CFTypeID TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v6, @"kCBAdvDataLeBluetoothDeviceAddress", TypeID, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v11 length] >= 7)
  {
    uint64_t v8 = [v11 bytes];
    v9 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 + 1 length:6];
    lgBTAddress = self->_lgBTAddress;
    self->_lgBTAddress = v9;
  }
}

- (void)_parseAppleProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4
{
  self->_scanFlags |= 0x80u;
  if (a4 - a3 <= 0)
  {
    self->_objectSetupFlags = 0;
LABEL_8:
    objectSetupFontCode = self->_objectSetupFontCode;
    self->_objectSetupFontCode = 0;

    id v11 = 0;
    v13 = 0;
    goto LABEL_9;
  }
  unsigned int v7 = *(unsigned __int8 *)a3;
  self->_objectSetupFlags = v7;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1) {
    goto LABEL_8;
  }
  unsigned int v8 = *((unsigned __int8 *)a3 + 1);
  self->_objectSetupBatteryState = v8 & 7;
  self->_objectSetupBatteryPerformance = (v8 >> 3) & 3;
  if (a4 - a3 - 2 <= 0) {
    goto LABEL_8;
  }
  v9 = a3 + 3;
  self->_objectSetupColorCode = a3[2];
  int64_t v10 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v10 >= 7)
  {
    id v18 = (id)[[NSString alloc] initWithBytes:a3 + 3 length:7 encoding:4];
    v9 = a3 + 10;
    objc_storeStrong((id *)&self->_objectSetupFontCode, v18);
    id v11 = v18;
    int64_t v10 = a4 - (a3 + 10);
  }
  else
  {
    v15 = self->_objectSetupFontCode;
    self->_objectSetupFontCode = 0;

    id v11 = 0;
    v13 = 0;
    if ((v7 & 0x10) == 0) {
      goto LABEL_9;
    }
  }
  id v20 = v11;
  if (v10 < 1)
  {
    v13 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 12;
    if ((unint64_t)v10 < 0xC) {
      uint64_t v17 = v10;
    }
    while (v9[v16])
    {
      if (v17 == ++v16)
      {
        uint64_t v16 = v17;
        break;
      }
    }
    v13 = (NSString *)[[NSString alloc] initWithBytes:v9 length:v16 encoding:4];
  }
  id v11 = v20;
LABEL_9:
  id v19 = v11;
  objectSetupMessage = self->_objectSetupMessage;
  self->_objectSetupMessage = v13;
}

- (void)_parseAppleProximityPairingStatusPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 6)
  {
    self->_proximityPairingAudioSourceCount = 0;
  }
  else
  {
    self->_proximityPairingAudioSourceCount = (a3[6] >> 2) & 3;
    if ((unint64_t)(a4 - a3) >= 0xD)
    {
      __int16 v4 = *((_WORD *)a3 + 5);
      self->_proximityPairingLastConnectedHost.bytes[2] = a3[12];
      *(_WORD *)self->_proximityPairingLastConnectedHost.bytes = v4;
      return;
    }
  }
  self->_proximityPairingLastConnectedHost.bytes[2] = 0;
  *(_WORD *)self->_proximityPairingLastConnectedHost.bytes = 0;
}

- (void)_parseAppleProximityPairingPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    self->_proximityPairingProductID = 0;
    self->_proximityPairingSubType = 255;
    self->_scanFlags |= 0x10u;
  }
  else
  {
    int v7 = *(unsigned __int8 *)a3;
    v5 = a3 + 1;
    int v6 = v7;
    if (a4 - v5 <= 1)
    {
      unsigned __int16 v8 = 0;
    }
    else
    {
      unsigned __int16 v8 = *(_WORD *)(a3 + 1);
      v5 = a3 + 3;
    }
    self->_proximityPairingProductID = v8;
    self->_proximityPairingSubType = v6;
    self->_scanFlags |= 0x10u;
    if (v6 == 5)
    {
      -[CUBLEDevice _parseAppleProximityPairingObjectSetupPtr:end:](self, "_parseAppleProximityPairingObjectSetupPtr:end:", v5);
    }
    else if (v6 == 1)
    {
      -[CUBLEDevice _parseAppleProximityPairingStatusPtr:end:](self, "_parseAppleProximityPairingStatusPtr:end:", v5);
    }
  }
}

- (void)_parseAppleObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a4 - a3 >= 1)
  {
    unsigned __int16 v8 = a3 + 1;
    unsigned int v7 = *(unsigned __int8 *)a3;
    if ((v7 & 0x10) != 0) {
      unsigned __int16 v9 = 21760;
    }
    else {
      unsigned __int16 v9 = -26215;
    }
    int64_t v10 = self->_addressData;
    if ([(NSData *)v10 length] != 6) {
      goto LABEL_17;
    }
    if (a4 - v8 < 22)
    {
      uint64_t v15 = [(NSData *)v10 bytes];
      __int16 v16 = *(_WORD *)(v15 + 4);
      int v18 = *(_DWORD *)v15;
      __int16 v19 = v16;
      if (a4 - v8 >= 1) {
        LOBYTE(v18) = v18 & 0x3F | (*v8 << 6);
      }
      v13 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v18 length:6];
      self->_objectDiscoveryBatteryState = v7 >> 5;
      self->_objectDiscoveryMode = 1;
      self->_objectDiscoveryProductID = v9;
      if (!v13) {
        goto LABEL_16;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
      self->_objectDiscoveryNearOwnerID = v13;
    }
    else
    {
      uint64_t v11 = [(NSData *)v10 bytes];
      __int16 v12 = *(_WORD *)(v11 + 4);
      int v18 = *(_DWORD *)v11;
      __int16 v19 = v12;
      *(_OWORD *)id v20 = *(_OWORD *)v8;
      *(void *)&v20[14] = *(void *)(v8 + 14);
      if (a4 - (a3 + 23) >= 1) {
        LOBYTE(v18) = v18 & 0x3F | (a3[23] << 6);
      }
      v13 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v18 length:28];
      self->_objectDiscoveryBatteryState = v7 >> 5;
      self->_objectDiscoveryMode = 2;
      self->_objectDiscoveryProductID = v9;
      if (!v13) {
        goto LABEL_16;
      }
      objectDiscoveryNearOwnerID = self->_objectDiscoveryPublicKeyData;
      self->_objectDiscoveryPublicKeyData = v13;
    }
    uint64_t v17 = v13;

LABEL_16:
    self->_scanFlags |= 0x20u;
LABEL_17:
  }
}

- (void)_parseAppleNearbyInfoPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v6 = 0;
  }
  else
  {
    int v5 = *(unsigned __int8 *)a3;
    self->_nearbyActivityLevel = v5 & 0xF;
    int v6 = (4 * v5) & 0xC0;
    if ((uint64_t)&a4[~(unint64_t)a3] >= 1)
    {
      unsigned int v7 = *((unsigned __int8 *)a3 + 1);
      v6 |= (8 * v7) & 0x20 | (16 * ((v7 >> 3) & 1)) | (v7 >> 3) & 4 | (v7 >> 1) & 8 | (v7 >> 5) & 2 | (v7 >> 7);
      if (((v7 >> 1) & 8) != 0 && a4 - (a3 + 2) >= 3)
      {
        unsigned __int16 v8 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 2 length:3];
        nearbyAuthTag = self->_nearbyAuthTag;
        self->_nearbyAuthTag = v8;
      }
    }
  }
  self->_nearbyFlags |= v6;
  self->_scanFlags |= 4u;
}

- (void)_parseAppleNearbyActionPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1)
  {
    unsigned int v5 = *(unsigned __int8 *)a3;
    int v6 = (v5 >> 4) & 8;
    self->_nearbyFlags |= (4 * v5) & 0x100 | (16 * v5) & 0x200 | v6;
    if ((uint64_t)&a4[~(unint64_t)a3] >= 1)
    {
      self->_nearbyActionType = *((unsigned __int8 *)a3 + 1);
      if (v6)
      {
        if (a4 - (a3 + 2) >= 3)
        {
          unsigned int v7 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 + 2 length:3];
          nearbyAuthTag = self->_nearbyAuthTag;
          self->_nearbyAuthTag = v7;
        }
      }
    }
  }
  self->_scanFlags |= 2u;
}

- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4 data:(id)a5
{
  id v11 = a5;
  if (a4 - a3 < 2)
  {
LABEL_13:
    objc_storeStrong((id *)&self->_appleManufacturerData, a5);
  }
  else
  {
    while (1)
    {
      int64_t v9 = a3[1] & 0x1F;
      if (a4 - (a3 + 2) < v9) {
        break;
      }
      int v10 = *(unsigned __int8 *)a3;
      a3 += v9 + 2;
      if (v10 > 15)
      {
        if (v10 == 16)
        {
          -[CUBLEDevice _parseAppleNearbyInfoPtr:end:](self, "_parseAppleNearbyInfoPtr:end:");
        }
        else if (v10 == 18)
        {
          -[CUBLEDevice _parseAppleObjectDiscoveryPtr:end:](self, "_parseAppleObjectDiscoveryPtr:end:");
        }
      }
      else if (v10 == 7)
      {
        -[CUBLEDevice _parseAppleProximityPairingPtr:end:](self, "_parseAppleProximityPairingPtr:end:");
      }
      else if (v10 == 15)
      {
        -[CUBLEDevice _parseAppleNearbyActionPtr:end:](self, "_parseAppleNearbyActionPtr:end:");
      }
      if (a4 - a3 <= 1) {
        goto LABEL_13;
      }
    }
  }
}

- (void)_parseManufacturerData:(id)a3 advertisementFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = v6;
  unsigned __int16 v8 = (unsigned __int16 *)[v14 bytes];
  uint64_t v9 = [v14 length];
  if (v9 >= 2)
  {
    int v10 = (char *)v8 + v9;
    int v13 = *v8;
    __int16 v12 = v8 + 1;
    int v11 = v13;
    if (v13 == 196)
    {
      [(CUBLEDevice *)self _parseLGManufacturerPtr:v12 end:v10 fields:v7];
    }
    else if (v11 == 76)
    {
      [(CUBLEDevice *)self _parseAppleManufacturerPtr:v12 end:v10 data:v14];
    }
  }
}

- (unsigned)updateWithAdvertisementData:(id)a3 rssi:(int)a4 oldDevice:(id)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a3;
  id v9 = a5;
  id v10 = (id)getCBAdvertisementDataDeviceAddress[0]();
  int v11 = CFDictionaryGetCFDataOfLength(v8, v10, 6, 0);
  if (v11)
  {
    __int16 v12 = [v9 addressData];
    id v13 = v11;
    id v14 = v12;
    uint64_t v15 = v14;
    if (v13 == v14)
    {
      unsigned int v16 = 0;
    }
    else
    {
      unsigned int v16 = 2;
      if (v14)
      {
        if ([v13 isEqual:v14]) {
          unsigned int v16 = 0;
        }
        else {
          unsigned int v16 = 2;
        }
      }
    }

    objc_storeStrong((id *)&self->_addressData, v11);
  }
  else
  {
    unsigned int v16 = 0;
  }

  id v17 = (id)getCBAdvertisementDataManufacturerDataKey[0]();
  CFTypeID TypeID = CFDataGetTypeID();
  __int16 v19 = CFDictionaryGetTypedValue(v8, v17, TypeID, 0);
  if (v19)
  {
    id v20 = [v9 manufacturerData];
    id v21 = v19;
    id v22 = v20;
    v23 = v22;
    if (v21 == v22)
    {
      int v24 = 0;
    }
    else if (v22)
    {
      int v24 = [v21 isEqual:v22] ^ 1;
    }
    else
    {
      int v24 = 1;
    }

    v16 |= v24;
    objc_storeStrong((id *)&self->_manufacturerData, v19);
    [(CUBLEDevice *)self _parseManufacturerData:v21 advertisementFields:v8];
  }

  if ((a4 - 20) >= 0x6B) {
    int v25 = a4;
  }
  else {
    int v25 = a4 - 126;
  }
  if ((v25 - 1) < 0xFFFFFFA5) {
    int v25 = 0;
  }
  if (v25 != self->_rawRSSI)
  {
    v16 |= 8u;
    self->_rawRSSI = v25;
  }

  return v16;
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v143 = 0;
  NSAppendPrintF(&v143, (uint64_t)"CUBLEDevice %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  id v10 = v143;
  int v11 = self->_addressData;
  __int16 v12 = v11;
  if (v11)
  {
    CFMutableStringRef v142 = v10;
    if ([(NSData *)v11 length] == 6) {
      uint64_t v19 = [(NSData *)v12 bytes];
    }
    else {
      uint64_t v19 = 0;
    }
    NSAppendPrintF(&v142, (uint64_t)", Addr %.6a", v13, v14, v15, v16, v17, v18, v19);
    id v20 = v142;

    id v10 = v20;
  }

  CFMutableStringRef v141 = v10;
  NSAppendPrintF(&v141, (uint64_t)", RSSI %3d", v21, v22, v23, v24, v25, v26, self->_rawRSSI);
  v27 = v141;

  if (a3 < 50)
  {
    v34 = self->_appleManufacturerData;
    v35 = v34;
    if (v34)
    {
      CFMutableStringRef v140 = v27;
      v36 = v34;
      uint64_t v37 = [(NSData *)v36 bytes];
      [(NSData *)v36 length];
      NSAppendPrintF(&v140, (uint64_t)", AMD <%H>", v38, v39, v40, v41, v42, v43, v37);
      v44 = v140;
    }
    else
    {
      manufacturerData = self->_manufacturerData;
      if (!manufacturerData)
      {
LABEL_12:

        goto LABEL_13;
      }
      CFMutableStringRef v139 = v27;
      v46 = manufacturerData;
      uint64_t v47 = [(NSData *)v46 bytes];
      [(NSData *)v46 length];
      NSAppendPrintF(&v139, (uint64_t)", MfD <%H>", v48, v49, v50, v51, v52, v53, v47);
      v44 = v139;

      v27 = (__CFString *)v46;
    }

    v27 = v44;
    goto LABEL_12;
  }
LABEL_13:
  uint64_t deviceFlags = self->_deviceFlags;
  if (deviceFlags)
  {
    CFMutableStringRef v138 = v27;
    NSAppendPrintF(&v138, (uint64_t)", DF %#{flags}", v28, v29, v30, v31, v32, v33, deviceFlags);
    v55 = v138;

    v27 = v55;
  }
  lgDeviceID = self->_lgDeviceID;
  if (lgDeviceID)
  {
    CFMutableStringRef v137 = v27;
    v57 = lgDeviceID;
    uint64_t v58 = [(NSData *)v57 bytes];
    [(NSData *)v57 length];
    NSAppendPrintF(&v137, (uint64_t)", LGID <%H>", v59, v60, v61, v62, v63, v64, v58);
    v65 = v137;

    v27 = v65;
  }
  uint64_t lgFlags = self->_lgFlags;
  if (lgFlags)
  {
    CFMutableStringRef v136 = v27;
    NSAppendPrintF(&v136, (uint64_t)", LGF %#{flags}", v28, v29, v30, v31, v32, v33, lgFlags);
    v67 = v136;

    v27 = v67;
  }
  unsigned int nearbyActivityLevel = self->_nearbyActivityLevel;
  if (self->_nearbyActivityLevel)
  {
    CFMutableStringRef v135 = v27;
    if (nearbyActivityLevel > 0xE) {
      v69 = "?";
    }
    else {
      v69 = off_1E55BDA28[(nearbyActivityLevel - 1)];
    }
    NSAppendPrintF(&v135, (uint64_t)", AL %s", v28, v29, v30, v31, v32, v33, (uint64_t)v69);
    v70 = v135;

    v27 = v70;
  }
  uint64_t nearbyFlags = self->_nearbyFlags;
  if (nearbyFlags)
  {
    CFMutableStringRef v134 = v27;
    NSAppendPrintF(&v134, (uint64_t)", Fl %#{flags}", v28, v29, v30, v31, v32, v33, nearbyFlags);
    v72 = v134;

    v27 = v72;
  }
  nearbyAuthTag = self->_nearbyAuthTag;
  if (nearbyAuthTag)
  {
    CFMutableStringRef v133 = v27;
    v74 = nearbyAuthTag;
    NSAppendPrintF(&v133, (uint64_t)", AT <%@>", v75, v76, v77, v78, v79, v80, (uint64_t)v74);
    v81 = v133;

    v27 = v81;
  }
  int objectDiscoveryMode = self->_objectDiscoveryMode;
  if (objectDiscoveryMode)
  {
    v83 = "?";
    v84 = "NearOwner";
    if (objectDiscoveryMode != 1) {
      v84 = "?";
    }
    if (objectDiscoveryMode == 2) {
      v85 = "Wild";
    }
    else {
      v85 = v84;
    }
    CFMutableStringRef v132 = v27;
    NSAppendPrintF(&v132, (uint64_t)", ObjDisc %s", v28, v29, v30, v31, v32, v33, (uint64_t)v85);
    v86 = v132;

    CFMutableStringRef v131 = v86;
    NSAppendPrintF(&v131, (uint64_t)", PID %d", v87, v88, v89, v90, v91, v92, self->_objectDiscoveryProductID);
    v93 = v131;

    CFMutableStringRef v130 = v93;
    unint64_t objectDiscoveryBatteryState = self->_objectDiscoveryBatteryState;
    if (objectDiscoveryBatteryState <= 5) {
      v83 = off_1E55BDA98[objectDiscoveryBatteryState];
    }
    NSAppendPrintF(&v130, (uint64_t)", Battery %s", v94, v95, v96, v97, v98, v99, (uint64_t)v83);
    v27 = v130;

    objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
    if (objectDiscoveryPublicKeyData)
    {
      CFMutableStringRef v129 = v27;
      v102 = objectDiscoveryPublicKeyData;
      NSAppendPrintF(&v129, (uint64_t)", PK <%@>", v103, v104, v105, v106, v107, v108, (uint64_t)v102);
      v109 = v129;

      v27 = v109;
    }
  }
  uint64_t proximityPairingProductID = self->_proximityPairingProductID;
  if (self->_proximityPairingProductID)
  {
    CFMutableStringRef v128 = v27;
    NSAppendPrintF(&v128, (uint64_t)", PP PID 0x%04x, ST %d (%s)", v28, v29, v30, v31, v32, v33, proximityPairingProductID);
    v111 = v128;

    v27 = v111;
  }
  if (self->_proximityPairingSubType == 1)
  {
    CFMutableStringRef v127 = v27;
    NSAppendPrintF(&v127, (uint64_t)", ASC %d", v28, v29, v30, v31, v32, v33, self->_proximityPairingAudioSourceCount);
    v112 = v127;

    CFMutableStringRef v126 = v112;
    NSAppendPrintF(&v126, (uint64_t)", LCH %02X:%02X:%02X", v113, v114, v115, v116, v117, v118, self->_proximityPairingLastConnectedHost.bytes[0]);
    v27 = v126;
  }
  uint64_t changeFlags = self->_changeFlags;
  if (changeFlags)
  {
    CFMutableStringRef v125 = v27;
    NSAppendPrintF(&v125, (uint64_t)", %#{flags}", v28, v29, v30, v31, v32, v33, changeFlags);
    v120 = v125;

    v27 = v120;
  }
  if (a3 < 21)
  {
    CFMutableStringRef v124 = v27;
    NSAppendPrintF(&v124, (uint64_t)"\n", v28, v29, v30, v31, v32, v33, v123);
    v121 = v124;

    v27 = v121;
  }
  return v27;
}

- (id)description
{
  return [(CUBLEDevice *)self descriptionWithLevel:50];
}

@end