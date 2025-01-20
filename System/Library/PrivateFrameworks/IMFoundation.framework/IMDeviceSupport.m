@interface IMDeviceSupport
+ (id)marketingNameForModel:(id)a3;
+ (id)sharedInstance;
- (IMDeviceSupport)init;
- (NSString)deviceInformationString;
- (NSString)model;
- (NSString)productBuildVersion;
- (NSString)productName;
- (NSString)productVersion;
- (NSString)userAgentString;
- (void)_generateProductInformation;
@end

@implementation IMDeviceSupport

+ (id)sharedInstance
{
  if (qword_1EB273CD8 != -1) {
    dispatch_once(&qword_1EB273CD8, &unk_1EE22FAF8);
  }
  v2 = (void *)qword_1EB273C38;
  return v2;
}

- (IMDeviceSupport)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDeviceSupport;
  v2 = [(IMDeviceSupport *)&v6 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (NSString)model
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  model = self->_model;
  if (model)
  {
    v9 = model;
    goto LABEL_18;
  }
  if (qword_1EB2738B8 != -1) {
    dispatch_once(&qword_1EB2738B8, &unk_1EE230918);
  }
  if (qword_1EB2738C8 != -1) {
    dispatch_once(&qword_1EB2738C8, &unk_1EE2311D8);
  }
  if (qword_1EB2738D8 != -1) {
    dispatch_once(&qword_1EB2738D8, &unk_1EE22FEB8);
  }
  if (qword_1EB2738E8 != -1) {
    dispatch_once(&qword_1EB2738E8, &unk_1EE2301D8);
  }
  v10 = (uint64_t (*)(uint64_t, uint64_t))off_1EB2738C0;
  if (qword_1EB2738F0 != -1) {
    dispatch_once(&qword_1EB2738F0, &unk_1EE231438);
  }
  uint64_t v11 = dword_1EB273790;
  uint64_t v12 = off_1EB2738F8("IOPlatformExpertDevice");
  uint64_t v13 = v10(v11, v12);
  if (v13)
  {
    uint64_t v14 = v13;
    CFDataRef v15 = (const __CFData *)off_1EB2738D0(v13, @"model", *MEMORY[0x1E4F1CF80], 0);
    off_1EB2738E0(v14);
    if (v15)
    {
      id v16 = [NSString alloc];
      v17 = NSString;
      BytePtr = CFDataGetBytePtr(v15);
      v20 = objc_msgSend_stringWithCString_encoding_(v17, v19, (uint64_t)BytePtr, 4);
      v9 = (NSString *)objc_msgSend_initWithFormat_(v16, v21, @"%@", v22, v20);

      objc_storeStrong((id *)&self->_model, v9);
      CFRelease(v15);
      goto LABEL_18;
    }
  }
  else
  {
    ((void (*)(void))off_1EB2738E0)();
  }
  v9 = 0;
LABEL_18:
  objc_msgSend_unlock(self->_lock, v6, v7, v8);
  return v9;
}

- (void)_generateProductInformation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918B207C;
  block[3] = &unk_1E5723270;
  block[4] = self;
  if (qword_1EB273950 != -1) {
    dispatch_once(&qword_1EB273950, block);
  }
}

- (NSString)userAgentString
{
  v5 = NSString;
  objc_super v6 = objc_msgSend_productName(self, a2, v2, v3);
  v10 = objc_msgSend_productVersion(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_productBuildVersion(self, v11, v12, v13);
  v18 = objc_msgSend_model(self, v15, v16, v17);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"[%@,%@,%@,%@]", v20, v6, v10, v14, v18);

  return (NSString *)v21;
}

- (NSString)productName
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__generateProductInformation(self, v5, v6, v7);
  uint64_t v8 = self->_productName;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (NSString)productVersion
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__generateProductInformation(self, v5, v6, v7);
  uint64_t v8 = self->_productVersion;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (NSString)productBuildVersion
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__generateProductInformation(self, v5, v6, v7);
  uint64_t v8 = self->_buildVersion;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (NSString)deviceInformationString
{
  v5 = NSString;
  uint64_t v6 = objc_msgSend_productName(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_productVersion(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_productBuildVersion(self, v11, v12, v13);
  v18 = objc_msgSend_model(self, v15, v16, v17);
  uint64_t v22 = IMGetEnvironmentName((uint64_t)v18, v19, v20, v21);
  v25 = objc_msgSend_stringWithFormat_(v5, v23, @"[%@,%@,%@,%@,%@]", v24, v6, v10, v14, v18, v22);

  return (NSString *)v25;
}

+ (id)marketingNameForModel:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_rangeOfString_(v3, v4, @"iPod", v5) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_rangeOfString_(v3, v6, @"iPad", v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend_rangeOfString_(v3, v8, @"iPhone", v9) == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = kIMDeviceTypeNameMac;
        if (objc_msgSend_rangeOfString_(v3, v10, @"Mac", v11) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend_rangeOfString_(v3, v12, @"AppleTV", v13) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend_rangeOfString_(v3, v15, @"Watch", v16) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend_rangeOfString_(v3, v17, @"AudioAccessory", v18) == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (objc_msgSend_rangeOfString_(v3, v19, @"Reality", v20) != 0x7FFFFFFFFFFFFFFFLL) {
                  uint64_t v14 = kIMDeviceTypeNameReality;
                }
              }
              else
              {
                uint64_t v14 = kIMDeviceTypeNameAudioAccessory;
              }
            }
            else
            {
              uint64_t v14 = kIMDeviceTypeNameWatch;
            }
          }
          else
          {
            uint64_t v14 = kIMDeviceTypeNameAppleTV;
          }
        }
      }
      else
      {
        uint64_t v14 = kIMDeviceTypeNameiPhone;
      }
    }
    else
    {
      uint64_t v14 = kIMDeviceTypeNameiPad;
    }
  }
  else
  {
    uint64_t v14 = kIMDeviceTypeNameiPod;
  }
  uint64_t v21 = *v14;

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end