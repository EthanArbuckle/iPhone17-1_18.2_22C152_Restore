@interface ASDTIOA2LegacyControl
+ (id)controlWithDictionary:(id)a3 owningDevice:(id)a4;
@end

@implementation ASDTIOA2LegacyControl

+ (id)controlWithDictionary:(id)a3 owningDevice:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"control ID"];
  uint64_t v8 = [v7 unsignedIntValue];

  uint64_t ControlInfo_Class = ASDT::IOA2UCDevice::GetControlInfo_Class((ASDT::IOA2UCDevice *)v5, v9);
  unsigned int ControlInfo_BaseClass = ASDT::IOA2UCDevice::GetControlInfo_BaseClass((ASDT::IOA2UCDevice *)v5, v11);
  uint64_t ControlInfo_Scope = ASDT::IOA2UCDevice::GetControlInfo_Scope((ASDT::IOA2UCDevice *)v5, v13);
  uint64_t ControlInfo_Element = ASDT::IOA2UCDevice::GetControlInfo_Element((ASDT::IOA2UCDevice *)v5, v15);
  BOOL Only = ASDT::IOA2UCDevice::GetControlInfo_IsReadOnly((ASDT::IOA2UCDevice *)v5, v17);
  switch(ControlInfo_BaseClass)
  {
    case 0x6C65766Cu:
      v20 = off_265246038;
LABEL_9:
      v21 = (ASDTIOA2LegacyBooleanControl *)[objc_alloc(*v20) initWithIOA2Device:v6 userClientID:v8 isSettable:!Only forElement:ControlInfo_Element inScope:ControlInfo_Scope objectClassID:ControlInfo_Class dictionary:v5];
      goto LABEL_25;
    case 0x736C6374u:
      v20 = off_265246048;
      goto LABEL_9;
    case 0x746F676Cu:
      if (ControlInfo_Class == 1836414053)
      {
        v19 = off_265246040;
      }
      else
      {
        if (ControlInfo_Class != 1784767339)
        {
          v21 = [[ASDTIOA2LegacyBooleanControl alloc] initWithIOA2Device:v6 userClientID:v8 isSettable:!Only element:ControlInfo_Element scope:ControlInfo_Scope objectClassID:ControlInfo_Class dictionary:v5];
          goto LABEL_25;
        }
        v19 = off_265246030;
      }
      v21 = (ASDTIOA2LegacyBooleanControl *)[objc_alloc(*v19) initWithIOA2Device:v6 userClientID:v8 isSettable:!Only element:ControlInfo_Element scope:ControlInfo_Scope dictionary:v5];
LABEL_25:
      v27 = v21;
      goto LABEL_26;
  }
  v22 = ASDTIOA2LogType();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = HIBYTE(ControlInfo_BaseClass);
    if ((ControlInfo_BaseClass - 0x20000000) >> 24 >= 0x5F) {
      int v23 = 32;
    }
    int v24 = BYTE2(ControlInfo_BaseClass);
    if (BYTE2(ControlInfo_BaseClass) - 32 >= 0x5F) {
      int v24 = 32;
    }
    int v25 = BYTE1(ControlInfo_BaseClass);
    if (BYTE1(ControlInfo_BaseClass) - 32 >= 0x5F) {
      int v25 = 32;
    }
    *(_DWORD *)buf = 67110144;
    unsigned int v30 = ControlInfo_BaseClass;
    __int16 v31 = 1024;
    int v32 = v23;
    __int16 v33 = 1024;
    int v34 = v24;
    __int16 v35 = 1024;
    int v36 = v25;
    if (ControlInfo_BaseClass - 32 >= 0x5F) {
      int v26 = 32;
    }
    else {
      int v26 = ControlInfo_BaseClass;
    }
    __int16 v37 = 1024;
    int v38 = v26;
    _os_log_impl(&dword_248A1B000, v22, OS_LOG_TYPE_DEFAULT, "Warning: Control base class %x ('%c%c%c%c') not supported", buf, 0x20u);
  }

  v27 = 0;
LABEL_26:

  return v27;
}

@end