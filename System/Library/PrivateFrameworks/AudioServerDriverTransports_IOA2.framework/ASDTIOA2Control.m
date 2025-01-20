@interface ASDTIOA2Control
+ (id)controlWithDictionary:(id)a3 owningDevice:(id)a4;
@end

@implementation ASDTIOA2Control

+ (id)controlWithDictionary:(id)a3 owningDevice:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = v7;
  if (v7) {
    CFRetain(v7);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v8);

  v9 = [v8 objectForKeyedSubscript:@"control ID"];
  uint64_t v10 = [v9 unsignedIntValue];

  CFDictionaryRef ControlInfo_Class = ASDT::IOA2UserClient::GetControlInfo_Class((const __CFDictionary **)&cf, v11);
  int ControlInfo_BaseClass = ASDT::IOA2UserClient::GetControlInfo_BaseClass((const __CFDictionary **)&cf, v13);
  uint64_t ControlInfo_Scope = ASDT::IOA2UserClient::GetControlInfo_Scope((const __CFDictionary **)&cf, v15);
  uint64_t ControlInfo_Element = ASDT::IOA2UserClient::GetControlInfo_Element((const __CFDictionary **)&cf, v17);
  BOOL Only = ASDT::IOA2UserClient::GetControlInfo_IsReadOnly((ASDT::IOA2UserClient *)&cf, v19);
  if (ControlInfo_BaseClass <= 1936483187)
  {
    if (ControlInfo_BaseClass == 1651273579)
    {
      v23 = [[ASDTIOA2BlockControl alloc] initWithIOA2Device:v6 userClientID:v10 isSettable:!Only forElement:ControlInfo_Element inScope:ControlInfo_Scope objectClassID:ControlInfo_Class];
      goto LABEL_37;
    }
    if (ControlInfo_BaseClass != 1818588780) {
      goto LABEL_18;
    }
    v22 = off_265246058;
LABEL_16:
    v23 = (ASDTIOA2BlockControl *)[objc_alloc(*v22) initWithIOA2Device:v6 userClientID:v10 isSettable:!Only forElement:ControlInfo_Element inScope:ControlInfo_Scope objectClassID:ControlInfo_Class dictionary:v8];
LABEL_37:
    v29 = v23;
    goto LABEL_38;
  }
  switch(ControlInfo_BaseClass)
  {
    case 1936483188:
      v22 = off_265246078;
      goto LABEL_16;
    case 1936483442:
      v22 = off_265246088;
      goto LABEL_16;
    case 1953458028:
      if ((int)ControlInfo_Class > 1885888877)
      {
        if (ControlInfo_Class == 1885888878)
        {
          v21 = off_265246068;
          goto LABEL_35;
        }
        if (ControlInfo_Class == 1885893481)
        {
          v21 = off_265246070;
          goto LABEL_35;
        }
      }
      else
      {
        if (ControlInfo_Class == 1784767339)
        {
          v21 = off_265246018;
          goto LABEL_35;
        }
        if (ControlInfo_Class == 1836414053)
        {
          v21 = off_265246060;
LABEL_35:
          v23 = (ASDTIOA2BlockControl *)[objc_alloc(*v21) initWithIOA2Device:v6 userClientID:v10 isSettable:!Only element:ControlInfo_Element scope:ControlInfo_Scope dictionary:v8];
          goto LABEL_37;
        }
      }
      v23 = [[ASDTIOA2BooleanControl alloc] initWithIOA2Device:v6 userClientID:v10 isSettable:!Only element:ControlInfo_Element scope:ControlInfo_Scope objectClassID:ControlInfo_Class dictionary:v8];
      goto LABEL_37;
  }
LABEL_18:
  v24 = ASDTIOA2LogType();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = HIBYTE(ControlInfo_BaseClass);
    if ((ControlInfo_BaseClass - 0x20000000) >> 24 >= 0x5F) {
      int v25 = 32;
    }
    int v26 = BYTE2(ControlInfo_BaseClass);
    if (BYTE2(ControlInfo_BaseClass) - 32 >= 0x5F) {
      int v26 = 32;
    }
    int v27 = BYTE1(ControlInfo_BaseClass);
    if (BYTE1(ControlInfo_BaseClass) - 32 >= 0x5F) {
      int v27 = 32;
    }
    *(_DWORD *)buf = 67110144;
    int v33 = ControlInfo_BaseClass;
    __int16 v34 = 1024;
    int v35 = v25;
    __int16 v36 = 1024;
    int v37 = v26;
    __int16 v38 = 1024;
    int v39 = v27;
    if (ControlInfo_BaseClass - 32 >= 0x5F) {
      int v28 = 32;
    }
    else {
      int v28 = ControlInfo_BaseClass;
    }
    __int16 v40 = 1024;
    int v41 = v28;
    _os_log_impl(&dword_248A1B000, v24, OS_LOG_TYPE_DEFAULT, "Warning: Control base class %x ('%c%c%c%c') not supported", buf, 0x20u);
  }

  v29 = 0;
LABEL_38:
  if (cf) {
    CFRelease(cf);
  }

  return v29;
}

@end