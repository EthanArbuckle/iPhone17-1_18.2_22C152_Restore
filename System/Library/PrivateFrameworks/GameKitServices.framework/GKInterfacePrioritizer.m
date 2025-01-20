@interface GKInterfacePrioritizer
+ (id)bsdNameToInterfaceTypeMap;
+ (id)prioritizeLocalInterfaces:(id)a3;
+ (void)initialize;
@end

@implementation GKInterfacePrioritizer

+ (void)initialize
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF9A0]);
  gkInterfacePrioritizerTypeToPriorityMap = [v2 initWithCapacity:gkInterfaceTypesCount];
  [(id)gkInterfacePrioritizerTypeToPriorityMap setObject:&unk_26D3A4100 forKeyedSubscript:*MEMORY[0x263F1BCA0]];
  [(id)gkInterfacePrioritizerTypeToPriorityMap setObject:&unk_26D3A4118 forKeyedSubscript:*MEMORY[0x263F1BCA8]];
  [(id)gkInterfacePrioritizerTypeToPriorityMap setObject:&unk_26D3A4130 forKeyedSubscript:*MEMORY[0x263F1BC98]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (gkInterfacePrioritizerTypeToPriorityMap) {
        v5 = (const char *)objc_msgSend((id)objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "description"), "UTF8String");
      }
      else {
        v5 = "<nil>";
      }
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "+[GKInterfacePrioritizer initialize]";
      __int16 v10 = 1024;
      int v11 = 91;
      __int16 v12 = 2080;
      v13 = v5;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d interfaceType2PriorityMap: %s", (uint8_t *)&v6, 0x26u);
    }
  }
  gkInterfaceTypesCount = [(id)gkInterfacePrioritizerTypeToPriorityMap count];
}

+ (id)bsdNameToInterfaceTypeMap
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = SCNetworkInterfaceCopyAll();
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[__CFArray count](v2, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [(__CFArray *)v2 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v27;
    uint64_t v8 = *MEMORY[0x263F1BCA0];
    v25 = (__CFString *)*MEMORY[0x263F1BC98];
    *(void *)&long long v5 = 136316162;
    long long v24 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v2);
        }
        __int16 v10 = *(const __SCNetworkInterface **)(*((void *)&v26 + 1) + 8 * v9);
        InterfaceType = (__CFString *)SCNetworkInterfaceGetInterfaceType(v10);
        CFStringRef BSDName = SCNetworkInterfaceGetBSDName(v10);
        v13 = (__CFString *)BSDName;
        if (InterfaceType) {
          BOOL v14 = BSDName == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if (InterfaceType)
              {
                v17 = (const char *)objc_msgSend((id)-[__CFString description](InterfaceType, "description"), "UTF8String");
                if (v13) {
                  goto LABEL_15;
                }
LABEL_25:
                v18 = "<nil>";
              }
              else
              {
                v17 = "<nil>";
                if (!v13) {
                  goto LABEL_25;
                }
LABEL_15:
                v18 = (const char *)objc_msgSend((id)-[__CFString description](v13, "description", v24), "UTF8String");
              }
              *(_DWORD *)buf = v24;
              uint64_t v31 = v15;
              __int16 v32 = 2080;
              v33 = "+[GKInterfacePrioritizer bsdNameToInterfaceTypeMap]";
              __int16 v34 = 1024;
              int v35 = 107;
              __int16 v36 = 2080;
              v37 = v17;
              __int16 v38 = 2080;
              v39 = v18;
              _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d invalid type [%s] or bsd name [%s]", buf, 0x30u);
            }
          }
        }
        else
        {
          if ([(__CFString *)InterfaceType isEqualToString:v8]
            && (_SCNetworkInterfaceIsBluetoothPAN()
             || _SCNetworkInterfaceIsBluetoothPAN_NAP()
             || _SCNetworkInterfaceIsBluetoothP2P()))
          {
            InterfaceType = v25;
          }
          objc_msgSend(v3, "setObject:forKeyedSubscript:", InterfaceType, v13, v24);
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v19 = [(__CFArray *)v2 countByEnumeratingWithState:&v26 objects:v40 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        v22 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      }
      else {
        v22 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v20;
      __int16 v32 = 2080;
      v33 = "+[GKInterfacePrioritizer bsdNameToInterfaceTypeMap]";
      __int16 v34 = 1024;
      int v35 = 123;
      __int16 v36 = 2080;
      v37 = v22;
      _os_log_impl(&dword_221563000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bsdName2interfaceTypeMap: %s", buf, 0x26u);
    }
  }

  return v3;
}

+ (id)prioritizeLocalInterfaces:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if ([a3 count])
  {
    id v4 = +[GKInterfacePrioritizer bsdNameToInterfaceTypeMap];
    long long v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(a3);
          }
          __int16 v10 = +[GKInterface interfaceWithInterfaceIndex:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          uint64_t v11 = objc_msgSend(v4, "objectForKeyedSubscript:", -[GKInterface bsdName](v10, "bsdName"));
          if (v11) {
            __int16 v12 = (__CFString *)v11;
          }
          else {
            __int16 v12 = @"GKInterfaceTypeUnknown";
          }
          [(GKInterface *)v10 setType:v12];
          v13 = objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "objectForKeyedSubscript:", -[GKInterface type](v10, "type"));
          if (v13) {
            uint64_t v14 = [v13 unsignedIntValue];
          }
          else {
            uint64_t v14 = gkInterfaceTypesCount;
          }
          [(GKInterface *)v10 setPriority:v14];
          [v5 addObject:v10];
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v7);
    }
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v16 = (os_log_t *)MEMORY[0x263F21098];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v19 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          uint64_t v19 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = v17;
        __int16 v36 = 2080;
        v37 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
        __int16 v38 = 1024;
        int v39 = 150;
        __int16 v40 = 2080;
        uint64_t v41 = v19;
        _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before sorting %s", buf, 0x26u);
      }
    }
    [v5 sortUsingComparator:&__block_literal_global_2];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      long long v24 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          v25 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          v25 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = v23;
        __int16 v36 = 2080;
        v37 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
        __int16 v38 = 1024;
        int v39 = 163;
        __int16 v40 = 2080;
        uint64_t v41 = v25;
        _os_log_impl(&dword_221563000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d after sorting %s", buf, 0x26u);
      }
    }
    if ([v5 count])
    {
      unint64_t v26 = 0;
      do
      {
        objc_msgSend(v5, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", v26), "index"), v26);
        ++v26;
      }
      while (v26 < [v5 count]);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      long long v28 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          long long v29 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        }
        else {
          long long v29 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = v27;
        __int16 v36 = 2080;
        v37 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
        __int16 v38 = 1024;
        int v39 = 170;
        __int16 v40 = 2080;
        uint64_t v41 = v29;
        _os_log_impl(&dword_221563000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ordered interface indices %s", buf, 0x26u);
      }
    }
    return v5;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        +[GKInterfacePrioritizer prioritizeLocalInterfaces:](v20, v21);
      }
    }
    return 0;
  }
}

uint64_t __52__GKInterfacePrioritizer_prioritizeLocalInterfaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = [a2 priority];
  if (v5 < [a3 priority]) {
    return -1;
  }
  unsigned int v7 = [a2 priority];
  return v7 > [a3 priority];
}

+ (void)prioritizeLocalInterfaces:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  unsigned int v5 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
  __int16 v6 = 1024;
  int v7 = 131;
  _os_log_error_impl(&dword_221563000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d no interfaces at input", (uint8_t *)&v2, 0x1Cu);
}

@end