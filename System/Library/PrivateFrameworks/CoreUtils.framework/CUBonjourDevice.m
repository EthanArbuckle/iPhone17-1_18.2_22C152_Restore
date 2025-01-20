@interface CUBonjourDevice
- (NSData)txtData;
- (NSDictionary)deviceInfo;
- (NSDictionary)txtDictionary;
- (NSString)identifierStr;
- (NSString)model;
- (NSString)name;
- (NSString)serviceType;
- (NSUUID)identifier;
- (NSUUID)identifierUUID;
- (id)copyConnectionInfoWithFlags:(unint64_t)a3 interfaceName:(id)a4 error:(id *)a5;
- (id)copyConnectionStringWithFlags:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)shortDescription;
- (unsigned)updateWithBonjourDeviceInfo:(id)a3;
- (void)_updateTXTDictionary:(id)a3;
- (void)reconfirm;
- (void)setDeviceInfo:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierStr:(id)a3;
- (void)setIdentifierUUID:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTxtData:(id)a3;
@end

@implementation CUBonjourDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierUUID, 0);
  objc_storeStrong((id *)&self->_identifierStr, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_txtData, 0);
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIdentifierUUID:(id)a3
{
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (void)setIdentifierStr:(id)a3
{
}

- (NSString)identifierStr
{
  return self->_identifierStr;
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setTxtData:(id)a3
{
}

- (NSData)txtData
{
  return self->_txtData;
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setModel:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unsigned)updateWithBonjourDeviceInfo:(id)a3
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_deviceInfo, a3);
  CFTypeID TypeID = CFStringGetTypeID();
  v7 = CFDictionaryGetTypedValue(v5, @"name", TypeID, 0);
  v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  name = self->_name;
  v10 = v7;
  v11 = name;
  if (v10 == v11)
  {

    goto LABEL_7;
  }
  v12 = v11;
  if (v11)
  {
    char v13 = [(NSString *)v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v14 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_name, v8);
  unsigned int v14 = 2;
LABEL_10:
  CFTypeID v15 = CFDataGetTypeID();
  v16 = CFDictionaryGetTypedValue(v5, @"txt", v15, 0);
  v17 = v16;
  if (v16)
  {
    v18 = self->_name;
    v19 = v16;
    v20 = v18;
    if (v19 == v20)
    {
    }
    else
    {
      v21 = v20;
      if (v20)
      {
        char v22 = [(NSString *)v19 isEqual:v20];

        if (v22) {
          goto LABEL_18;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_txtData, v17);
      [(CUBonjourDevice *)self _updateTXTDictionary:v19];
      v14 |= 1u;
    }
  }
LABEL_18:

  return v14;
}

- (void)_updateTXTDictionary:(id)a3
{
  id v15 = a3;
  v4 = (unsigned __int8 *)[v15 bytes];
  CFDictionaryRef v5 = &v4[[v15 length]];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  while (v5 - v4 >= 1)
  {
    v8 = v4 + 1;
    unint64_t v7 = *v4;
    if (v5 - (v4 + 1) < v7) {
      break;
    }
    v4 += v7 + 1;
    v9 = v8;
    if (v7)
    {
      while (*v9 != 61)
      {
        ++v9;
        if (!--v7)
        {
          v9 = v4;
          break;
        }
      }
    }
    v10 = (void *)[[NSString alloc] initWithBytes:v8 length:v9 - v8 encoding:4];
    if (v10)
    {
      if (v9 >= v4) {
        v11 = v9;
      }
      else {
        v11 = v9 + 1;
      }
      v12 = (void *)[[NSString alloc] initWithBytes:v11 length:v4 - v11 encoding:4];
      if (v12) {
        [v6 setObject:v12 forKeyedSubscript:v10];
      }
    }
  }
  char v13 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v6];
  txtDictionary = self->_txtDictionary;
  self->_txtDictionary = v13;
}

- (void)reconfirm
{
  deviceInfo = self->_deviceInfo;
  if (deviceInfo) {
    BonjourDevice_Reconfirm((const __CFDictionary *)deviceInfo);
  }
}

- (id)copyConnectionStringWithFlags:(unint64_t)a3 error:(id *)a4
{
  deviceInfo = self->_deviceInfo;
  if (!deviceInfo)
  {
    if (a4)
    {
      v16 = "No Bonjour Device Info";
      uint64_t v17 = 4294960551;
LABEL_12:
      NSErrorWithOSStatusF(v17, (uint64_t)v16, a3, (uint64_t)a4, v4, v5, v6, v7, v25);
      unsigned int v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v14;
    }
    return 0;
  }
  unsigned int v26 = 0;
  v10 = (const char *)BonjourDevice_CopyDNSNames((const __CFDictionary *)deviceInfo, a3, (int *)&v26);
  if (!v10)
  {
    if (a4)
    {
      if (v26) {
        uint64_t v17 = v26;
      }
      else {
        uint64_t v17 = 4294960596;
      }
      v16 = "CopyDNSNames failed";
      goto LABEL_12;
    }
    return 0;
  }
  v11 = (char *)v10;
  size_t v12 = strlen(v10);
  char v13 = (void *)[[NSString alloc] initWithBytesNoCopy:v11 length:v12 encoding:4 freeWhenDone:1];
  unsigned int v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    free(v11);
    if (a4)
    {
      NSErrorWithOSStatusF(4294960596, (uint64_t)"String init with UTF-8 failed (%zu bytes)", v18, v19, v20, v21, v22, v23, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v14;
}

- (id)copyConnectionInfoWithFlags:(unint64_t)a3 interfaceName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = self->_deviceInfo;
  v16 = v9;
  if (v9)
  {
    unsigned int v29 = 0;
    uint64_t v17 = BonjourDevice_CopyConnectionInfo((const __CFDictionary *)v9, a3, v8, (int *)&v29);
    v24 = v17;
    if (v17)
    {
      uint64_t v25 = v17;
    }
    else if (a5)
    {
      if (v29) {
        uint64_t v27 = v29;
      }
      else {
        uint64_t v27 = 4294960596;
      }
      NSErrorWithOSStatusF(v27, (uint64_t)"CopyConnectionInfo failed", v18, v19, v20, v21, v22, v23, v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a5)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"No Bonjour Device Info", v10, v11, v12, v13, v14, v15, v28);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v52 = 0;
  NSAppendPrintF(&v52, (uint64_t)"CUBonjourDevice %.6a", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_deviceIDBytes);
  uint64_t v10 = v52;
  uint64_t v17 = v10;
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v51 = v10;
    NSAppendPrintF(&v51, (uint64_t)", %''@", v11, v12, v13, v14, v15, v16, (uint64_t)name);
    uint64_t v19 = v51;

    uint64_t v17 = v19;
  }
  model = self->_model;
  if (model)
  {
    CFMutableStringRef v50 = v17;
    NSAppendPrintF(&v50, (uint64_t)", Model %''@", v11, v12, v13, v14, v15, v16, (uint64_t)model);
    uint64_t v21 = v50;

    uint64_t v17 = v21;
  }
  int64_t Int64Ranged = CFDictionaryGetInt64Ranged((const __CFDictionary *)self->_deviceInfo, @"TrTy", 0, 0xFFFFFFFFLL, 0);
  if (Int64Ranged)
  {
    CFMutableStringRef v49 = v17;
    NSAppendPrintF(&v49, (uint64_t)", TT %#{flags}", v23, v24, v25, v26, v27, v28, Int64Ranged);
    unsigned int v29 = v49;

    uint64_t v17 = v29;
  }
  if (a3 <= 30)
  {
    v30 = self->_txtDictionary;
    if ([(NSDictionary *)v30 count])
    {
      CFMutableStringRef v48 = v17;
      NSAppendPrintF(&v48, (uint64_t)", TXT %##@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
      v37 = v48;

      uint64_t v17 = v37;
    }

    if (a3 <= 20)
    {
      CFMutableStringRef v47 = v17;
      NSAppendPrintF(&v47, (uint64_t)"\n", v38, v39, v40, v41, v42, v43, v46);
      v44 = v47;

      uint64_t v17 = v44;
    }
  }
  return v17;
}

- (id)description
{
  return [(CUBonjourDevice *)self descriptionWithLevel:50];
}

- (id)shortDescription
{
  return NSPrintF((uint64_t)"CUBonjourDevice %.6a, %'@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_deviceIDBytes);
}

@end