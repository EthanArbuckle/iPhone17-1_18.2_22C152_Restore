@interface CECFakeInterfaceListener
- (BOOL)createAudioSystemDevice:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5;
- (BOOL)createDeviceProvider:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5 andLogicalAddress:(unsigned __int8)a6;
- (BOOL)createPlaybackDevice:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5;
- (BOOL)createTVDevice:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5;
- (BOOL)interface:(id)a3 pingTo:(unsigned __int8)a4 acknowledged:(BOOL *)a5 error:(id *)a6;
- (BOOL)interface:(id)a3 sendFrame:(CECFrame *)a4 withRetryCount:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)interface:(id)a3 setAddressMask:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)interface:(id)a3 setSnoopingMode:(BOOL)a4 error:(id *)a5;
- (id)fakeAddInterfaceWithProperties:(id)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation CECFakeInterfaceListener

- (id)fakeAddInterfaceWithProperties:(id)a3
{
  v4 = [[CECFakeInterface alloc] initWithInterfaceListener:self properties:a3];
  if (v4)
  {
    [(CoreRCInterfaceListener *)self addInterface:v4];
  }
  return v4;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)unscheduleFromDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)interface:(id)a3 setAddressMask:(unsigned __int16)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(CoreRCInterfaceListener *)self interfaces];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7) {
    return 1;
  }
  uint64_t v8 = v7;
  int v9 = 0;
  uint64_t v10 = *(void *)v17;
  char v11 = 1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v6);
      }
      int v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) addressMask];
      v11 &= (v9 & v13) == 0;
      v9 |= v13;
    }
    uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);
  if (a5) {
    char v14 = v11;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    char v11 = 0;
    *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.private.CoreCEC.ErrorDomain" code:3 userInfo:0];
  }
  return v11;
}

- (BOOL)interface:(id)a3 setSnoopingMode:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)interface:(id)a3 sendFrame:(CECFrame *)a4 withRetryCount:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = a4->blocks[0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = [(CoreRCInterfaceListener *)self interfaces];
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    int v12 = 1 << (v8 & 0xF);
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        int v16 = [v15 snoopingMode];
        int v17 = [v15 addressMask];
        if (v15 != a3)
        {
          int v18 = v17 & v12;
          if ((v17 & v12) != 0) {
            int v19 = 1;
          }
          else {
            int v19 = v16;
          }
          if (v19 == 1)
          {
            long long v27 = *(_OWORD *)a4->blocks;
            int v28 = *((_DWORD *)a4 + 4);
            [v15 receivedFrame:&v27];
          }
          if (v18) {
            ++v11;
          }
        }
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (a6 && !v11) {
    *a6 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.private.CoreCEC.ErrorDomain" code:2 userInfo:0];
  }
  return v11 != 0;
}

- (BOOL)interface:(id)a3 pingTo:(unsigned __int8)a4 acknowledged:(BOOL *)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(CoreRCInterfaceListener *)self interfaces];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v10)
  {
    char v12 = 0;
    if (!a5) {
      return 1;
    }
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  char v12 = 0;
  int v13 = 1 << a4;
  uint64_t v14 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v9);
      }
      id v16 = *(id *)(*((void *)&v18 + 1) + 8 * i);
      if (v16 != a3) {
        v12 |= (v13 & [v16 addressMask]) != 0;
      }
    }
    uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v11);
  if (a5) {
LABEL_11:
  }
    *a5 = v12 & 1;
  return 1;
}

- (BOOL)createAudioSystemDevice:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5
{
  return [(CECFakeInterfaceListener *)self createDeviceProvider:a3 andFakeInterface:a4 withPhysicalAddress:a5 andLogicalAddress:5];
}

- (BOOL)createPlaybackDevice:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5
{
  return [(CECFakeInterfaceListener *)self createDeviceProvider:a3 andFakeInterface:a4 withPhysicalAddress:a5 andLogicalAddress:4];
}

- (BOOL)createTVDevice:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5
{
  return [(CECFakeInterfaceListener *)self createDeviceProvider:a3 andFakeInterface:a4 withPhysicalAddress:a5 andLogicalAddress:0];
}

- (BOOL)createDeviceProvider:(id *)a3 andFakeInterface:(id *)a4 withPhysicalAddress:(unint64_t)a5 andLogicalAddress:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  switch(a6)
  {
    case 0u:
      long long v22 = xmmword_24C4F7500;
      uint64_t v23 = 45;
      id v11 = +[CECFakeInterface defaultTVProperties];
      LOBYTE(v20) = 0;
      id v13 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:7 otherTypes:0 features:537639 rcProfile:CoreCECDeviceSourceRCProfileWithSupportedMenuCommands((uint64_t *)&v22, 3) vendorID:4346 version:6 active:v20 options:0];
      LOWORD(v14) = -32767;
      goto LABEL_7;
    case 1u:
    case 2u:
    case 9u:
      id v11 = +[CECFakeInterface defaultPropertiesWithPhysicalAddress:a5];
      LOBYTE(v20) = 0;
      id v12 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:4 otherTypes:0 features:537639 rcProfile:0 vendorID:4346 version:6 active:v20 options:0];
      goto LABEL_6;
    case 3u:
    case 6u:
    case 7u:
    case 0xAu:
      id v11 = +[CECFakeInterface defaultPropertiesWithPhysicalAddress:a5];
      LOBYTE(v20) = 0;
      id v12 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:6 otherTypes:0 features:537639 rcProfile:0 vendorID:4346 version:6 active:v20 options:0];
      goto LABEL_6;
    case 4u:
    case 8u:
    case 0xBu:
      long long v22 = xmmword_24C4F74F0;
      id v11 = +[CECFakeInterface defaultPlaybackDeviceProperties];
      LOBYTE(v20) = 0;
      id v13 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:2 otherTypes:0 features:537703 rcProfile:CoreCECDeviceSourceRCProfileWithSupportedMenuCommands((uint64_t *)&v22, 2) vendorID:4346 version:6 active:v20 options:0];
      int v14 = 1 << v6;
      goto LABEL_7;
    case 5u:
      long long v22 = xmmword_24C4F7500;
      uint64_t v23 = 45;
      id v11 = +[CECFakeInterface defaultAudioSystemProperties];
      LOBYTE(v20) = 0;
      id v13 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:1 otherTypes:0 features:1668135 rcProfile:CoreCECDeviceSourceRCProfileWithSupportedMenuCommands((uint64_t *)&v22, 3) vendorID:4346 version:6 active:v20 options:0];
      LOWORD(v14) = 32;
      goto LABEL_7;
    case 0xCu:
    case 0xDu:
    case 0xEu:
      id v11 = +[CECFakeInterface defaultPropertiesWithPhysicalAddress:a5];
      LOBYTE(v20) = 0;
      id v12 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:0 otherTypes:0 features:537639 rcProfile:0 vendorID:4346 version:6 active:v20 options:0];
LABEL_6:
      id v13 = v12;
      LOWORD(v14) = (1 << v6) | 0x8000;
LABEL_7:
      if (v11) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15) {
        goto LABEL_12;
      }
      id v16 = [(CECFakeInterfaceListener *)self fakeAddInterfaceWithProperties:v11];
      char v17 = [v16 setAddressMask:(unsigned __int16)v14 error:&v21];
      if (v17)
      {
        long long v18 = objc_msgSend((id)objc_msgSend(v16, "delegate"), "addDeviceWithLogicalAddress:physicalAddress:attributes:message:reason:", v6, a5, v13, 0, 2);
        if (v16 && v18)
        {
          *a4 = v16;
          *a3 = v18;
          LOBYTE(v18) = 1;
          return (char)v18;
        }
      }
      else
      {
        if (gLogCategory_CoreRCInterface > 40) {
          goto LABEL_27;
        }
        if (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()) {
LABEL_26:
        }
          LogPrintF();
      }
LABEL_12:
      if (gLogCategory_CoreRCInterface > 40) {
        goto LABEL_27;
      }
      if (gLogCategory_CoreRCInterface != -1 || (LODWORD(v18) = _LogCategory_Initialize(), v18))
      {
        LogPrintF();
LABEL_27:
        LOBYTE(v18) = 0;
      }
      return (char)v18;
    default:
      if (gLogCategory_CoreRCInterface > 60) {
        goto LABEL_27;
      }
      if (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()) {
        goto LABEL_26;
      }
      goto LABEL_12;
  }
}

@end