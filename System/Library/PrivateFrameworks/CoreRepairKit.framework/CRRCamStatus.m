@interface CRRCamStatus
- (BOOL)isComponentFailed;
- (CRRCamStatus)init;
- (int64_t)getIORegComponentStatus;
@end

@implementation CRRCamStatus

- (CRRCamStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRRCamStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"RCameraFailed", v4);
  }
  return v5;
}

- (int64_t)getIORegComponentStatus
{
  io_registry_entry_t v2 = sub_1D966D260((uint64_t)self, a2);
  if (v2)
  {
    io_registry_entry_t v3 = v2;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, @"BackTeleCameraExpected", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    v6 = (void *)IORegistryEntryCreateCFProperty(v3, @"BackSuperWideCameraExpected", v4, 0);
    objc_super v7 = (void *)IORegistryEntryCreateCFProperty(v3, @"BackCameraExpected", v4, 0);
    v8 = (void *)IORegistryEntryCreateCFProperty(v3, @"BackDepthCameraExpected", v4, 0);
    v9 = (void *)IORegistryEntryCreateCFProperty(v3, @"BackTeleCameraModuleSerialNumString", v4, 0);
    v10 = (void *)IORegistryEntryCreateCFProperty(v3, @"BackSuperWideCameraModuleSerialNumString", v4, 0);
    v11 = (void *)IORegistryEntryCreateCFProperty(v3, @"BackCameraModuleSerialNumString", v4, 0);
    v12 = (void *)IORegistryEntryCreateCFProperty(v3, @"JasperSNUM", v4, 0);
    IOObjectRelease(v3);
    if (objc_msgSend_intValue(CFProperty, v13, v14, v15) == 1 && v9 == 0)
    {
      v9 = 0;
    }
    else
    {
      if (objc_msgSend_intValue(v6, v16, v17, v18) != 1 || v10 != 0)
      {
        int64_t v27 = -1;
        if (objc_msgSend_intValue(v7, v20, v21, v22) == 1 && v11 == 0)
        {
          v11 = 0;
        }
        else
        {
          int v29 = objc_msgSend_intValue(v8, v24, v25, v26);
          if (v12) {
            BOOL v30 = 0;
          }
          else {
            BOOL v30 = v29 == 1;
          }
          if (!v30) {
            int64_t v27 = 1;
          }
        }
        goto LABEL_26;
      }
      v10 = 0;
    }
    int64_t v27 = -1;
    goto LABEL_26;
  }
  v31 = handleForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_1D96746FC();
  }

  CFProperty = 0;
  v6 = 0;
  objc_super v7 = 0;
  v8 = 0;
  v11 = 0;
  v10 = 0;
  v9 = 0;
  v12 = 0;
  int64_t v27 = 0;
LABEL_26:

  return v27;
}

- (BOOL)isComponentFailed
{
  return objc_msgSend_getIORegComponentStatus(self, a2, v2, v3) == -1;
}

@end