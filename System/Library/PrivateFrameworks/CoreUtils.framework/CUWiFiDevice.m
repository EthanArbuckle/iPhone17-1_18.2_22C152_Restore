@interface CUWiFiDevice
- (NSData)bssid;
- (NSData)deviceIDOUI;
- (NSData)deviceIDSetupHash;
- (NSData)deviceIEBluetoothMAC;
- (NSData)deviceIEDeviceID;
- (NSData)ieData;
- (NSDictionary)rawScanResult;
- (NSString)deviceIEManufacturer;
- (NSString)deviceIEModel;
- (NSString)deviceIEName;
- (NSString)ssid;
- (NSUUID)identifier;
- (id)description;
- (id)platformObject;
- (int)present;
- (int)rssi;
- (unsigned)_updateWithDeviceIE:(const char *)a3 end:(const char *)a4;
- (unsigned)deviceIECategory;
- (unsigned)deviceIEFlags;
- (void)setBssid:(id)a3;
- (void)setDeviceIDOUI:(id)a3;
- (void)setDeviceIDSetupHash:(id)a3;
- (void)setDeviceIEBluetoothMAC:(id)a3;
- (void)setDeviceIECategory:(unsigned int)a3;
- (void)setDeviceIEDeviceID:(id)a3;
- (void)setDeviceIEFlags:(unsigned int)a3;
- (void)setDeviceIEManufacturer:(id)a3;
- (void)setDeviceIEModel:(id)a3;
- (void)setDeviceIEName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIeData:(id)a3;
- (void)setPlatformObject:(id)a3;
- (void)setPresent:(int)a3;
- (void)setRawScanResult:(id)a3;
- (void)setRssi:(int)a3;
- (void)setSsid:(id)a3;
@end

@implementation CUWiFiDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_rawScanResult, 0);
  objc_storeStrong(&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_ieData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceIDSetupHash, 0);
  objc_storeStrong((id *)&self->_deviceIDOUI, 0);
  objc_storeStrong((id *)&self->_deviceIEName, 0);
  objc_storeStrong((id *)&self->_deviceIEModel, 0);
  objc_storeStrong((id *)&self->_deviceIEManufacturer, 0);
  objc_storeStrong((id *)&self->_deviceIEDeviceID, 0);
  objc_storeStrong((id *)&self->_deviceIEBluetoothMAC, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

- (void)setPresent:(int)a3
{
  self->_present = a3;
}

- (int)present
{
  return self->_present;
}

- (void)setSsid:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRawScanResult:(id)a3
{
}

- (NSDictionary)rawScanResult
{
  return self->_rawScanResult;
}

- (void)setPlatformObject:(id)a3
{
}

- (id)platformObject
{
  return self->_platformObject;
}

- (void)setIeData:(id)a3
{
}

- (NSData)ieData
{
  return self->_ieData;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setDeviceIDSetupHash:(id)a3
{
}

- (NSData)deviceIDSetupHash
{
  return self->_deviceIDSetupHash;
}

- (void)setDeviceIDOUI:(id)a3
{
}

- (NSData)deviceIDOUI
{
  return self->_deviceIDOUI;
}

- (void)setDeviceIEName:(id)a3
{
}

- (NSString)deviceIEName
{
  return self->_deviceIEName;
}

- (void)setDeviceIEModel:(id)a3
{
}

- (NSString)deviceIEModel
{
  return self->_deviceIEModel;
}

- (void)setDeviceIEManufacturer:(id)a3
{
}

- (NSString)deviceIEManufacturer
{
  return self->_deviceIEManufacturer;
}

- (void)setDeviceIEFlags:(unsigned int)a3
{
  self->_deviceIEFlags = a3;
}

- (unsigned)deviceIEFlags
{
  return self->_deviceIEFlags;
}

- (void)setDeviceIEDeviceID:(id)a3
{
}

- (NSData)deviceIEDeviceID
{
  return self->_deviceIEDeviceID;
}

- (void)setDeviceIECategory:(unsigned int)a3
{
  self->_deviceIECategory = a3;
}

- (unsigned)deviceIECategory
{
  return self->_deviceIECategory;
}

- (void)setDeviceIEBluetoothMAC:(id)a3
{
}

- (NSData)deviceIEBluetoothMAC
{
  return self->_deviceIEBluetoothMAC;
}

- (void)setBssid:(id)a3
{
}

- (NSData)bssid
{
  return self->_bssid;
}

- (unsigned)_updateWithDeviceIE:(const char *)a3 end:(const char *)a4
{
  v5 = (unsigned __int8 *)a3;
  v7 = a3;
  while (1)
  {
    unsigned int v8 = 0;
    if (a4 <= v7 || (unint64_t)(a4 - v7) < 2) {
      break;
    }
    uint64_t v9 = *((unsigned __int8 *)v7 + 1);
    if (&v7[v9 + 2] > a4) {
      goto LABEL_11;
    }
    int v10 = *(unsigned __int8 *)v7;
    v7 += v9 + 2;
    if (v10 == 6)
    {
      if (v9 != 6)
      {
LABEL_11:
        unsigned int v8 = 0;
        break;
      }
      v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      deviceIEBluetoothMAC = self->_deviceIEBluetoothMAC;
      v13 = v11;
      v14 = deviceIEBluetoothMAC;
      if (v13 == v14)
      {

        unsigned int v8 = 0;
        v17 = v13;
      }
      else
      {
        v15 = v14;
        if ((v13 == 0) != (v14 != 0))
        {
          char v16 = [(NSData *)v13 isEqual:v14];

          if (v16)
          {
            unsigned int v8 = 0;
LABEL_16:

            break;
          }
        }
        else
        {
        }
        v18 = v13;
        v17 = self->_deviceIEBluetoothMAC;
        self->_deviceIEBluetoothMAC = v18;
        unsigned int v8 = 1;
      }

      goto LABEL_16;
    }
  }
  unsigned int UInt64 = TLV8GetUInt64(v5, (unsigned __int8 *)a4, 8, 0, 0);
  if (self->_deviceIECategory != UInt64)
  {
    self->_deviceIECategory = UInt64;
    unsigned int v8 = 1;
  }
  unint64_t v20 = (unint64_t)v5;
  while ((unint64_t)a4 > v20)
  {
    if ((unint64_t)&a4[-v20] < 2) {
      break;
    }
    uint64_t v21 = *(unsigned __int8 *)(v20 + 1);
    if (v20 + 2 + v21 > (unint64_t)a4) {
      break;
    }
    int v22 = *(unsigned __int8 *)v20;
    v20 += 2 + v21;
    if (v22 == 7)
    {
      if (v21 != 6) {
        break;
      }
      v23 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      deviceIEDeviceID = self->_deviceIEDeviceID;
      v25 = v23;
      v26 = deviceIEDeviceID;
      if (v25 == v26)
      {

        v29 = v25;
      }
      else
      {
        v27 = v26;
        if ((v25 == 0) != (v26 != 0))
        {
          char v28 = [(NSData *)v25 isEqual:v26];

          if (v28) {
            goto LABEL_33;
          }
        }
        else
        {
        }
        v30 = v25;
        v29 = self->_deviceIEDeviceID;
        self->_deviceIEDeviceID = v30;
        unsigned int v8 = 1;
      }

LABEL_33:
      break;
    }
  }
  unint64_t v31 = (unint64_t)v5;
  do
  {
    unsigned int v32 = 0;
    if ((unint64_t)a4 <= v31 || (unint64_t)&a4[-v31] < 2) {
      goto LABEL_59;
    }
    v33 = (char *)(v31 + 2);
    unint64_t v34 = *(unsigned __int8 *)(v31 + 1);
    if (v31 + 2 + v34 > (unint64_t)a4) {
      goto LABEL_53;
    }
    int v35 = *(unsigned __int8 *)v31;
    v31 += 2 + v34;
  }
  while (v35);
  if (v34 <= 1)
  {
    if (v34)
    {
      int v39 = (*v33 < 0) << 31;
      goto LABEL_48;
    }
LABEL_53:
    unsigned int v32 = 0;
  }
  else
  {
    int v36 = v33[1];
    unsigned int v37 = (v36 & 3) << 16;
    if (*v33 < 0) {
      unsigned int v37 = ((v36 & 3) << 16) | 0x80000000;
    }
    int v38 = v37 | 0x800000;
    if (v36 >= 0) {
      int v38 = v37;
    }
    if (v34 == 2)
    {
      int v39 = v38 | ((v36 & 0x60) << 16);
LABEL_48:
      unsigned int v32 = v39 | ((*v33 & 0x60) << 24);
      goto LABEL_59;
    }
    char v40 = v33[2];
    int v41 = ((v36 & 0x20) << 16) | ((((v40 & 0x70) >> 4) & 7) << 12) | v38;
    int v42 = (v36 & 0x40) << 16;
    if (v34 < 4)
    {
      int v43 = v42 | v41;
    }
    else
    {
      int v43 = v42 | v33[3] & 0x40 | v41;
      if (v33[3] < 0) {
        v43 |= 0x80u;
      }
    }
    int v44 = v43 | ((v40 & 1) << 8) | ((*v33 & 0x20) << 24);
    char v45 = v33[2];
    int v46 = v44 | ((v45 & 6) << 8);
    if (v34 != 3) {
      v46 |= v33[3] & 0x20;
    }
    unsigned int v32 = v46 | ((v45 & 8) << 8) | ((*v33 & 0x40) << 24);
    if (v34 >= 4) {
      v32 |= v33[3] & 0x10;
    }
  }
LABEL_59:
  if (v32 != self->_deviceIEFlags)
  {
    self->_deviceIEFlags = v32;
    unsigned int v8 = 1;
  }
  unint64_t v47 = (unint64_t)v5;
  while ((unint64_t)a4 > v47)
  {
    if ((unint64_t)&a4[-v47] < 2) {
      break;
    }
    unint64_t v48 = v47 + 2;
    uint64_t v49 = *(unsigned __int8 *)(v47 + 1);
    if (v47 + 2 + v49 > (unint64_t)a4) {
      break;
    }
    int v50 = *(unsigned __int8 *)v47;
    v47 += 2 + v49;
    if (v50 == 2)
    {
      if (!v49) {
        break;
      }
      v51 = (void *)[[NSString alloc] initWithBytes:v48 length:v49 encoding:4];
      v52 = v51;
      if (!v51) {
        goto LABEL_75;
      }
      deviceIEManufacturer = self->_deviceIEManufacturer;
      v54 = v51;
      v55 = deviceIEManufacturer;
      if (v54 == v55)
      {
      }
      else
      {
        v56 = v55;
        if (v55)
        {
          char v57 = [(NSString *)v54 isEqual:v55];

          if (v57) {
            goto LABEL_75;
          }
        }
        else
        {
        }
        objc_storeStrong((id *)&self->_deviceIEManufacturer, v52);
        unsigned int v8 = 1;
      }
LABEL_75:

      break;
    }
  }
  unint64_t v58 = (unint64_t)v5;
  while ((unint64_t)a4 > v58)
  {
    if ((unint64_t)&a4[-v58] < 2) {
      break;
    }
    unint64_t v59 = v58 + 2;
    uint64_t v60 = *(unsigned __int8 *)(v58 + 1);
    if (v58 + 2 + v60 > (unint64_t)a4) {
      break;
    }
    int v61 = *(unsigned __int8 *)v58;
    v58 += 2 + v60;
    if (v61 == 3)
    {
      if (!v60) {
        break;
      }
      v62 = (void *)[[NSString alloc] initWithBytes:v59 length:v60 encoding:4];
      v63 = v62;
      if (!v62) {
        goto LABEL_90;
      }
      deviceIEModel = self->_deviceIEModel;
      v65 = v62;
      v66 = deviceIEModel;
      if (v65 == v66)
      {
      }
      else
      {
        v67 = v66;
        if (v66)
        {
          char v68 = [(NSString *)v65 isEqual:v66];

          if (v68) {
            goto LABEL_90;
          }
        }
        else
        {
        }
        objc_storeStrong((id *)&self->_deviceIEModel, v63);
        unsigned int v8 = 1;
      }
LABEL_90:

      break;
    }
  }
  unint64_t v69 = (unint64_t)v5;
  while ((unint64_t)a4 > v69)
  {
    if ((unint64_t)&a4[-v69] < 2) {
      break;
    }
    unint64_t v70 = v69 + 2;
    uint64_t v71 = *(unsigned __int8 *)(v69 + 1);
    if (v69 + 2 + v71 > (unint64_t)a4) {
      break;
    }
    int v72 = *(unsigned __int8 *)v69;
    v69 += 2 + v71;
    if (v72 == 1)
    {
      if (!v71) {
        break;
      }
      v73 = (void *)[[NSString alloc] initWithBytes:v70 length:v71 encoding:4];
      v74 = v73;
      if (!v73) {
        goto LABEL_105;
      }
      deviceIEName = self->_deviceIEName;
      v76 = v73;
      v77 = deviceIEName;
      if (v76 == v77)
      {
      }
      else
      {
        v78 = v77;
        if (v77)
        {
          char v79 = [(NSString *)v76 isEqual:v77];

          if (v79) {
            goto LABEL_105;
          }
        }
        else
        {
        }
        objc_storeStrong((id *)&self->_deviceIEName, v74);
        unsigned int v8 = 1;
      }
LABEL_105:

      break;
    }
  }
  unint64_t v80 = (unint64_t)v5;
  while ((unint64_t)a4 > v80)
  {
    if ((unint64_t)&a4[-v80] < 2) {
      break;
    }
    uint64_t v81 = *(unsigned __int8 *)(v80 + 1);
    if (v80 + 2 + v81 > (unint64_t)a4) {
      break;
    }
    int v82 = *(unsigned __int8 *)v80;
    v80 += 2 + v81;
    if (v82 == 4)
    {
      if (v81 != 3) {
        break;
      }
      v83 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      deviceIDOUI = self->_deviceIDOUI;
      v85 = v83;
      v86 = deviceIDOUI;
      if (v85 == v86)
      {

        v89 = v85;
      }
      else
      {
        v87 = v86;
        if ((v85 == 0) != (v86 != 0))
        {
          char v88 = [(NSData *)v85 isEqual:v86];

          if (v88) {
            goto LABEL_120;
          }
        }
        else
        {
        }
        v90 = v85;
        v89 = self->_deviceIDOUI;
        self->_deviceIDOUI = v90;
        unsigned int v8 = 1;
      }

LABEL_120:
      break;
    }
  }
  while (a4 > (const char *)v5)
  {
    if ((unint64_t)(a4 - (const char *)v5) < 2) {
      break;
    }
    uint64_t v91 = v5[1];
    if (&v5[v91 + 2] > (unsigned __int8 *)a4) {
      break;
    }
    int v92 = *v5;
    v5 += v91 + 2;
    if (v92 == 9)
    {
      if (v91 != 4) {
        return v8;
      }
      v93 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      deviceIDSetupHash = self->_deviceIDSetupHash;
      v95 = v93;
      v96 = deviceIDSetupHash;
      if (v95 == v96)
      {

        v99 = v95;
      }
      else
      {
        v97 = v96;
        if ((v95 == 0) != (v96 != 0))
        {
          char v98 = [(NSData *)v95 isEqual:v96];

          if (v98) {
            goto LABEL_134;
          }
        }
        else
        {
        }
        v100 = v95;
        v99 = self->_deviceIDSetupHash;
        self->_deviceIDSetupHash = v100;
        unsigned int v8 = 1;
      }

LABEL_134:
      return v8;
    }
  }
  return v8;
}

- (id)description
{
  CFMutableStringRef v55 = 0;
  NSAppendPrintF(&v55, (uint64_t)"CUWiFiDevice %{ptr}", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  uint64_t v9 = v55;
  if ([(NSData *)self->_bssid length] == 6)
  {
    CFMutableStringRef v54 = v9;
    char v16 = [(NSData *)self->_bssid bytes];
    NSAppendPrintF(&v54, (uint64_t)", BSSID %.6a", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    v23 = v54;

    uint64_t v9 = v23;
  }
  ssid = self->_ssid;
  if (ssid)
  {
    CFMutableStringRef v53 = v9;
    NSAppendPrintF(&v53, (uint64_t)", SSID '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)ssid);
    v25 = v53;

    uint64_t v9 = v25;
  }
  CFMutableStringRef v52 = v9;
  uint64_t v26 = [(NSData *)self->_ieData length];
  NSAppendPrintF(&v52, (uint64_t)", IE %ld bytes", v27, v28, v29, v30, v31, v32, v26);
  v33 = v52;

  CFMutableStringRef v51 = v33;
  NSAppendPrintF(&v51, (uint64_t)", RSSI %d", v34, v35, v36, v37, v38, v39, self->_rssi);
  char v40 = v51;

  uint64_t deviceIEFlags = self->_deviceIEFlags;
  CFMutableStringRef v50 = v40;
  NSAppendPrintF(&v50, (uint64_t)", %#{flags}", v42, v43, v44, v45, v46, v47, deviceIEFlags);
  unint64_t v48 = v50;

  return v48;
}

@end