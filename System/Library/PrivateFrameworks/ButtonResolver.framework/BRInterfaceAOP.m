@interface BRInterfaceAOP
+ (id)interface;
+ (int)_convertClickState:(unint64_t)a3;
+ (int)_convertForceFeel:(unint64_t)a3;
- (BOOL)_serviceSetProperty:(void *)a3 forKey:(__CFString *)a4;
- (BOOL)_setDefaultAOPConfigs;
- (BOOL)_setGlobalAOPConfigsFromBRFConfigs:(id)a3;
- (BOOL)_setStateAOPConfigsFromStateData:(id)a3 andSlotData:(id)a4;
- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5;
- (BOOL)enableStates:(id)a3 error:(id *)a4;
- (BOOL)fastHaptics;
- (BOOL)isReady;
- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5;
- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6;
- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4;
- (BOOL)updateReadyState;
- (BRInterfaceAOP)init;
- (BRInterfaceAOP)initWithFastHaptics:(BOOL)a3;
- (id)dataForSlot:(id)a3 fromArray:(id)a4;
- (id)description;
- (id)propertyList;
- (unint64_t)maxAssetSlots;
- (unint64_t)unusedAssetSlots;
- (unsigned)connect;
- (unsigned)service;
- (void)_findService;
- (void)_receiveLoaderAvailableNotification:(id)a3;
- (void)dealloc;
- (void)mergeStateChanges:(id)a3 into:(id)a4;
- (void)propertyList;
- (void)scheduleReadyNotificationWithBlock:(id)a3;
- (void)setConnect:(unsigned int)a3;
- (void)setService:(unsigned int)a3;
- (void)updateReadyState;
@end

@implementation BRInterfaceAOP

- (BRInterfaceAOP)init
{
  return [(BRInterfaceAOP *)self initWithFastHaptics:0];
}

- (BRInterfaceAOP)initWithFastHaptics:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BRInterfaceAOP;
  v4 = [(BRInterface *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_fastHaptics = a3;
    v4->_service = 0;
    v4->_connect = 0;
    v4->_notificationPort = 0;
    v4->_arrivalNotification = 0;
    v4->_isReady = 0;
    v4->_maxAssetSlots = 0;
    v4->_notificationBlock = 0;
    v6 = dlopen("/System/Library/PrivateFrameworks/Haptics.framework/Haptics", 1);
    if (!v6) {
      goto LABEL_8;
    }
    v7 = (NSString **)dlsym(v6, "HAButtonHapticsLoaderServiceIsAvailableNotification");
    v8 = *v7;
    v5->_notificationName = *v7;
    if (!v8) {
      goto LABEL_8;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v5, sel__receiveLoaderAvailableNotification_, v5->_notificationName, 0);
    v9 = [NSClassFromString(&cfstr_Habuttonhaptic_0.isa) sharedInstance];
    v5->_loader = v9;
    if (!v9
      || (v5->_freeSlots = 0,
          v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]),
          (v5->_slotArray = v10) == 0)
      || (v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]), (v5->_stateDict = v11) == 0))
    {
LABEL_8:
      v13 = _BRLog_log_0;
      if (!_BRLog_log_0)
      {
        v13 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_0 = (uint64_t)v13;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[BRInterfaceAOP initWithFastHaptics:](v13);
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  io_connect_t connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    IOObjectRelease(self->_connect);
  }
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  io_object_t arrivalNotification = self->_arrivalNotification;
  if (arrivalNotification) {
    IOObjectRelease(arrivalNotification);
  }
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }

  v7.receiver = self;
  v7.super_class = (Class)BRInterfaceAOP;
  [(BRInterface *)&v7 dealloc];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)BRInterfaceAOP;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRInterface description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", @"Service: %u;\n", self->_service);
  objc_msgSend(v3, "appendFormat:", @"Connection: %u;\n", self->_connect);
  [v3 appendFormat:@"Loader: %@;\n", self->_loader];
  [v3 appendFormat:@"FreeSlots: %@;\n", self->_freeSlots];
  [v3 appendFormat:@"SlotData: %@;\n", self->_slotArray];
  [v3 appendFormat:@"StateData: %@;\n", self->_stateDict];
  return v3;
}

- (id)propertyList
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)BRInterfaceAOP;
  v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", -[BRInterface propertyList](&v32, sel_propertyList));
  v4 = (void *)[MEMORY[0x263EFF980] array];
  objc_super v5 = (void *)[MEMORY[0x263EFF980] array];
  v6 = (void *)[MEMORY[0x263EFF980] array];
  freeSlots = self->_freeSlots;
  if (freeSlots)
  {
    uint64_t v8 = [(NSMutableIndexSet *)freeSlots firstIndex];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v8;
            i != 0x7FFFFFFFFFFFFFFFLL;
            uint64_t i = [(NSMutableIndexSet *)self->_freeSlots indexGreaterThanIndex:i])
      {
        objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", i));
      }
    }
  }
  [v3 setObject:v4 forKey:@"FreeSlots"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  slotArray = self->_slotArray;
  uint64_t v11 = [(NSMutableArray *)slotArray countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(slotArray);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        if ([v15 propertyList]) {
          objc_msgSend(v5, "addObject:", objc_msgSend(v15, "propertyList"));
        }
      }
      uint64_t v12 = [(NSMutableArray *)slotArray countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v12);
  }
  [v3 setObject:v5 forKey:@"SlotData"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  stateDict = self->_stateDict;
  uint64_t v17 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(stateDict);
        }
        v21 = (void *)[(NSMutableDictionary *)self->_stateDict objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * k)];
        if ([v21 propertyList]) {
          objc_msgSend(v6, "addObject:", objc_msgSend(v21, "propertyList"));
        }
      }
      uint64_t v18 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v18);
  }
  [v3 setObject:v6 forKey:@"StateData"];
  v22 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v22 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v22;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[BRInterfaceAOP propertyList]();
  }
  return v3;
}

+ (id)interface
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (MGGetSInt32Answer() == 1)
  {
    v2 = [[BRInterfaceAOP alloc] initWithFastHaptics:0];
    return v2;
  }
  else
  {
    int v8 = -337121064;
    long long v7 = xmmword_22178EAE0;
    int v6 = 450980336;
    long long v5 = xmmword_22178EAF4;
    int v4 = MGIsDeviceOneOfType();
    id result = 0;
    if (v4) {
      return -[BRInterfaceAOP initWithFastHaptics:]([BRInterfaceAOP alloc], "initWithFastHaptics:", 1, &v5, 0);
    }
  }
  return result;
}

- (unint64_t)unusedAssetSlots
{
  unint64_t result = (unint64_t)self->_freeSlots;
  if (result) {
    return [(id)result count];
  }
  return result;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  if ([(BRInterfaceAOP *)self _setGlobalAOPConfigsFromBRFConfigs:a3])
  {
    BOOL v8 = 0;
  }
  else
  {
    v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870167 userInfo:0];
    BOOL v8 = v10 != 0;
    if (a4 && v10)
    {
      *a4 = v10;
      BOOL v8 = 1;
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return !v8;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  v10 = self;
  uint64_t v154 = *MEMORY[0x263EF8340];
  uint64_t v135 = 0;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  id v97 = a3;
  v94 = a6;
  if (!a3 || !a4)
  {
LABEL_133:
    v90 = (void *)MEMORY[0x263F087E8];
    uint64_t v91 = *MEMORY[0x263F08410];
    uint64_t v92 = -536870206;
    goto LABEL_134;
  }
  id v96 = (id)[(NSMutableIndexSet *)v10->_freeSlots mutableCopy];
  obuint64_t j = (id)[MEMORY[0x263EFF9A0] dictionary];
  id v11 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v10->_slotArray copyItems:1];
  v93 = (void *)[MEMORY[0x263EFF980] array];
  p_isa = (id *)&v10->super.super.isa;
  id v98 = a5;
  id v99 = a4;
  if ([a5 count])
  {
    unint64_t v12 = 0;
    do
    {
      unint64_t v13 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v12), "unsignedIntegerValue");
      objc_super v14 = (void *)[v97 objectAtIndexedSubscript:v12];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"Speed"]
          ? objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"Speed"), "unsignedIntegerValue")
          : 3;
      if (v13 > 0x10) {
        goto LABEL_133;
      }
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      stateDict = v10->_stateDict;
      uint64_t v17 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v131 objects:v153 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v132;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v132 != v19) {
              objc_enumerationMutation(stateDict);
            }
            v21 = (void *)[p_isa[13] objectForKeyedSubscript:*(void *)(*((void *)&v131 + 1) + 8 * i)];
            if ([v21 state] == v13)
            {
              long long v129 = 0u;
              long long v130 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              v22 = (void *)[v21 speedSlots];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v127 objects:v152 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v128;
                while (2)
                {
                  for (uint64_t j = 0; j != v24; ++j)
                  {
                    if (*(void *)v128 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    long long v27 = *(void **)(*((void *)&v127 + 1) + 8 * j);
                    if ([v27 unsignedIntegerValue] == v15)
                    {
                      long long v28 = objc_msgSend(p_isa, "dataForSlot:fromArray:", objc_msgSend((id)objc_msgSend(v21, "speedSlots"), "objectForKeyedSubscript:", v27), v11);
                      if (v28) {
                        objc_msgSend(v28, "setRefCount:", objc_msgSend(v28, "refCount") - 1);
                      }
                      goto LABEL_29;
                    }
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v127 objects:v152 count:16];
                  if (v24) {
                    continue;
                  }
                  break;
                }
              }
              goto LABEL_29;
            }
          }
          uint64_t v18 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v131 objects:v153 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_29:
      ++v12;
      a5 = v98;
      v10 = (BRInterfaceAOP *)p_isa;
      a4 = v99;
    }
    while (v12 < [v98 count]);
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v29 = [a4 countByEnumeratingWithState:&v123 objects:v151 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v124;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v124 != v31) {
          objc_enumerationMutation(a4);
        }
        v33 = *(void **)(*((void *)&v123 + 1) + 8 * v32);
        if (([v33 isNull] & 1) == 0)
        {
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          uint64_t v34 = [v11 countByEnumeratingWithState:&v119 objects:v150 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v120;
            while (2)
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v120 != v36) {
                  objc_enumerationMutation(v11);
                }
                v38 = *(void **)(*((void *)&v119 + 1) + 8 * k);
                if (objc_msgSend((id)objc_msgSend(v38, "asset"), "isEqual:", v33))
                {
                  objc_msgSend(v38, "setRefCount:", objc_msgSend(v38, "refCount") + 1);
                  goto LABEL_52;
                }
              }
              uint64_t v35 = [v11 countByEnumeratingWithState:&v119 objects:v150 count:16];
              if (v35) {
                continue;
              }
              break;
            }
          }
          v39 = objc_alloc_init(BRSlotData);
          if (([v33 isNull] & 1) == 0)
          {
            __int16 v118 = 0;
            int v40 = objc_msgSend(p_isa[10], "hapticAssetType:hasAudio:hasHaptic:error:", objc_msgSend(v33, "type"), (char *)&v118 + 1, &v118, &v135);
            v41 = _BRLog_log_0;
            if (!_BRLog_log_0)
            {
              v41 = os_log_create("com.apple.ButtonResolver", "default");
              _BRLog_log_0 = (uint64_t)v41;
            }
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v42 = "NO";
              if (HIBYTE(v118)) {
                v43 = "YES";
              }
              else {
                v43 = "NO";
              }
              if ((_BYTE)v118) {
                v44 = "YES";
              }
              else {
                v44 = "NO";
              }
              *(_DWORD *)buf = 136316162;
              if (v40) {
                v42 = "YES";
              }
              v141 = "-[BRInterfaceAOP setConfigs:withAssets:forStates:error:]";
              __int16 v142 = 2112;
              v143 = v33;
              __int16 v144 = 2080;
              uint64_t v145 = (uint64_t)v43;
              __int16 v146 = 2080;
              v147 = v44;
              __int16 v148 = 2080;
              v149 = v42;
              _os_log_debug_impl(&dword_221782000, v41, OS_LOG_TYPE_DEBUG, "%s get asset components: %@ audio: %s haptic: %s success: %s", buf, 0x34u);
              if (!v40) {
                goto LABEL_136;
              }
            }
            else if (!v40)
            {
              goto LABEL_136;
            }
            [v33 setHasAudio:HIBYTE(v118)];
            [v33 setHasHaptic:v118];
            a4 = v99;
          }
          [(BRSlotData *)v39 setAsset:v33];
          [(BRSlotData *)v39 setRefCount:1];
          [v11 addObject:v39];
        }
LABEL_52:
        ++v32;
      }
      while (v32 != v30);
      uint64_t v45 = [a4 countByEnumeratingWithState:&v123 objects:v151 count:16];
      uint64_t v30 = v45;
    }
    while (v45);
  }
  [p_isa timestampWithLabel:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", NSStringFromSelector(a2), @"hapticComponents"];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v46 = [v11 countByEnumeratingWithState:&v114 objects:v139 count:16];
  v47 = v98;
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = *(void *)v115;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v115 != v49) {
          objc_enumerationMutation(v11);
        }
        v51 = *(void **)(*((void *)&v114 + 1) + 8 * m);
        if (![v51 refCount])
        {
          objc_msgSend(v96, "addIndex:", objc_msgSend((id)objc_msgSend(v51, "slot"), "unsignedIntegerValue"));
          [v93 addObject:v51];
        }
      }
      uint64_t v48 = [v11 countByEnumeratingWithState:&v114 objects:v139 count:16];
    }
    while (v48);
  }
  [v11 removeObjectsInArray:v93];
  if (![v98 count])
  {
LABEL_108:
    v10 = (BRInterfaceAOP *)p_isa;
    if (![p_isa disableStates:v47 clearAsset:0 error:&v135]) {
      goto LABEL_129;
    }
    [p_isa timestampWithLabel:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", NSStringFromSelector(a2), @"disabledStates"];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    uint64_t v78 = [v11 countByEnumeratingWithState:&v102 objects:v136 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v103;
      do
      {
        uint64_t v81 = 0;
        do
        {
          if (*(void *)v103 != v80) {
            objc_enumerationMutation(v11);
          }
          v82 = *(void **)(*((void *)&v102 + 1) + 8 * v81);
          if (([v82 isProgrammed] & 1) == 0)
          {
            v83 = (void *)[v82 asset];
            if (([v83 isNull] & 1) == 0)
            {
              int v84 = -[HAButtonHapticsLoader loadButtonHapticOfType:withParameters:atSlot:error:](v10->_loader, "loadButtonHapticOfType:withParameters:atSlot:error:", [v83 type], objc_msgSend(v83, "parameters"), objc_msgSend((id)objc_msgSend(v82, "slot"), "integerValue"), &v135);
              v85 = _BRLog_log_0;
              if (!_BRLog_log_0)
              {
                v85 = os_log_create("com.apple.ButtonResolver", "default");
                _BRLog_log_0 = (uint64_t)v85;
              }
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v86 = [v82 slot];
                *(_DWORD *)buf = 136315906;
                v87 = "NO";
                if (v84) {
                  v87 = "YES";
                }
                v141 = "-[BRInterfaceAOP setConfigs:withAssets:forStates:error:]";
                __int16 v142 = 2112;
                v143 = v83;
                __int16 v144 = 2112;
                uint64_t v145 = v86;
                __int16 v146 = 2080;
                v147 = v87;
                _os_log_debug_impl(&dword_221782000, v85, OS_LOG_TYPE_DEBUG, "%s loaded asset: %@ at slot: %@ success: %s", buf, 0x2Au);
              }
              v10 = (BRInterfaceAOP *)p_isa;
              if (!v84) {
                goto LABEL_129;
              }
            }
            [v82 setIsProgrammed:1];
          }
          ++v81;
        }
        while (v79 != v81);
        uint64_t v88 = [v11 countByEnumeratingWithState:&v102 objects:v136 count:16];
        uint64_t v79 = v88;
      }
      while (v88);
    }
    -[BRInterface timestampWithLabel:](v10, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"loadedHaptics"]);
    if ([(BRInterfaceAOP *)v10 _setStateAOPConfigsFromStateData:obj andSlotData:v11])
    {

      v10->_freeSlots = (NSMutableIndexSet *)v96;
      v10->_slotArray = (NSMutableArray *)v11;
      [(BRInterfaceAOP *)v10 mergeStateChanges:obj into:v10->_stateDict];
      goto LABEL_129;
    }
    v90 = (void *)MEMORY[0x263F087E8];
    uint64_t v91 = *MEMORY[0x263F08410];
    uint64_t v92 = -536870167;
LABEL_134:
    uint64_t v135 = [v90 errorWithDomain:v91 code:v92 userInfo:0];
    goto LABEL_129;
  }
  unint64_t v52 = 0;
  while (1)
  {
    uint64_t v53 = objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", v52), "unsignedIntegerValue");
    v54 = (void *)[a4 objectAtIndexedSubscript:v52];
    v55 = (void *)[v97 objectAtIndexedSubscript:v52];
    if ([v55 objectForKeyedSubscript:@"Speed"]) {
      uint64_t v56 = objc_msgSend((id)objc_msgSend(v55, "objectForKeyedSubscript:", @"Speed"), "unsignedIntegerValue");
    }
    else {
      uint64_t v56 = 3;
    }
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    uint64_t v57 = [obj countByEnumeratingWithState:&v110 objects:v138 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v111;
LABEL_81:
      uint64_t v60 = 0;
      while (1)
      {
        if (*(void *)v111 != v59) {
          objc_enumerationMutation(obj);
        }
        v61 = (BRStateData *)[obj objectForKey:*(void *)(*((void *)&v110 + 1) + 8 * v60)];
        if ([(BRStateData *)v61 state] == v53) {
          break;
        }
        if (v58 == ++v60)
        {
          uint64_t v58 = [obj countByEnumeratingWithState:&v110 objects:v138 count:16];
          if (v58) {
            goto LABEL_81;
          }
          goto LABEL_89;
        }
      }
      if (v61) {
        goto LABEL_90;
      }
    }
LABEL_89:
    v61 = [[BRStateData alloc] initWithState:v53 enabled:1];
LABEL_90:
    v62 = [(BRStateData *)v61 speedConfigs];
    unint64_t v63 = 0x263F08000uLL;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v55, [NSNumber numberWithUnsignedInteger:v56]);
    if ([v54 isNull])
    {
      uint64_t v64 = [(BRStateData *)v61 speedSlots];
      uint64_t v65 = [NSNumber numberWithUnsignedInteger:v56];
      v66 = (void *)v64;
      v67 = &unk_26D3CD198;
LABEL_103:
      [v66 setObject:v67 forKeyedSubscript:v65];
      goto LABEL_104;
    }
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    uint64_t v68 = [v11 countByEnumeratingWithState:&v106 objects:v137 count:16];
    if (v68) {
      break;
    }
LABEL_104:
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v61, objc_msgSend(*(id *)(v63 + 2584), "numberWithUnsignedInteger:", v53));
    ++v52;
    v47 = v98;
    a4 = v99;
    if (v52 >= [v98 count]) {
      goto LABEL_108;
    }
  }
  uint64_t v69 = v68;
  uint64_t v70 = *(void *)v107;
LABEL_94:
  uint64_t v71 = 0;
  while (1)
  {
    if (*(void *)v107 != v70) {
      objc_enumerationMutation(v11);
    }
    v72 = *(void **)(*((void *)&v106 + 1) + 8 * v71);
    if (objc_msgSend(v54, "isEqual:", objc_msgSend(v72, "asset"))) {
      break;
    }
    if (v69 == ++v71)
    {
      uint64_t v69 = [v11 countByEnumeratingWithState:&v106 objects:v137 count:16];
      unint64_t v63 = 0x263F08000;
      if (v69) {
        goto LABEL_94;
      }
      goto LABEL_104;
    }
  }
  if ([v72 slot])
  {
    uint64_t v73 = [v72 slot];
    uint64_t v74 = [(BRStateData *)v61 speedSlots];
    unint64_t v63 = 0x263F08000uLL;
    uint64_t v65 = [NSNumber numberWithUnsignedInteger:v56];
    v66 = (void *)v74;
    v67 = (void *)v73;
    goto LABEL_103;
  }
  unint64_t v63 = 0x263F08000uLL;
  if ([v96 count])
  {
    uint64_t v75 = [v96 firstIndex];
    [v96 removeIndex:v75];
    objc_msgSend(v72, "setSlot:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v75));
    uint64_t v76 = [NSNumber numberWithUnsignedInteger:v75];
    v77 = [(BRStateData *)v61 speedSlots];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v77, "setObject:forKeyedSubscript:", v76, [NSNumber numberWithUnsignedInteger:v56]);
    [v72 setIsProgrammed:0];
    goto LABEL_104;
  }
  uint64_t v135 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870210 userInfo:0];
LABEL_136:
  v10 = (BRInterfaceAOP *)p_isa;
LABEL_129:
  if (v94 && v135) {
    id *v94 = (id)v135;
  }
  -[BRInterface timestampWithLabel:](v10, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return v135 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  long long v5 = a2;
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v7 = 0x263F08000uLL;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  BOOL v8 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = a3;
  uint64_t v28 = [a3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v34;
    uint64_t v24 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = [*(id *)(*((void *)&v33 + 1) + 8 * i) unsignedIntegerValue];
        if (v10 > 0x10
          || (unint64_t v11 = v10,
              long long v31 = 0u,
              long long v32 = 0u,
              long long v29 = 0u,
              long long v30 = 0u,
              stateDict = self->_stateDict,
              (uint64_t v13 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v29 objects:v37 count:16]) == 0))
        {
LABEL_21:
          uint64_t v21 = -536870206;
          long long v5 = v24;
          unint64_t v7 = 0x263F08000uLL;
          goto LABEL_22;
        }
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
LABEL_9:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(stateDict);
          }
          uint64_t v17 = (void *)[(NSMutableDictionary *)self->_stateDict objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * v16)];
          if ([v17 state] == v11) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v14) {
              goto LABEL_9;
            }
            goto LABEL_21;
          }
        }
        id v18 = (id)[v17 copy];
        if (!v18) {
          goto LABEL_21;
        }
        id v19 = v18;
        [v18 setEnabled:1];
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11));
      }
      long long v5 = v24;
      unint64_t v7 = 0x263F08000;
      uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }
  if ([(BRInterfaceAOP *)self _setStateAOPConfigsFromStateData:v8 andSlotData:self->_slotArray])
  {
    [(BRInterfaceAOP *)self mergeStateChanges:v8 into:self->_stateDict];
    BOOL v20 = 0;
  }
  else
  {
    uint64_t v21 = -536870167;
LABEL_22:
    v22 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v21 userInfo:0];
    BOOL v20 = v22 != 0;
    if (a4 && v22)
    {
      *a4 = v22;
      BOOL v20 = 1;
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [*(id *)(v7 + 2880) stringWithFormat:@"%@ %@", NSStringFromSelector(v5), @"end"]);
  return !v20;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  BOOL v39 = a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  id v43 = (id)[MEMORY[0x263EFF9A0] dictionary];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = a3;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v41 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v57 != v41) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = [*(id *)(*((void *)&v56 + 1) + 8 * i) unsignedIntegerValue];
        if (v10 > 0x10)
        {
          uint64_t v33 = -536870206;
          goto LABEL_45;
        }
        unint64_t v11 = v10;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        stateDict = self->_stateDict;
        uint64_t v13 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v53;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v53 != v15) {
                objc_enumerationMutation(stateDict);
              }
              uint64_t v17 = (void *)[(NSMutableDictionary *)self->_stateDict objectForKeyedSubscript:*(void *)(*((void *)&v52 + 1) + 8 * j)];
              if ([v17 state] == v11)
              {
                id v18 = (id)[v17 copy];
                if (v18)
                {
                  id v19 = v18;
                  [v18 setEnabled:0];
                  objc_msgSend(v43, "setObject:forKeyedSubscript:", v19, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11));
                }
                goto LABEL_18;
              }
            }
            uint64_t v14 = [(NSMutableDictionary *)stateDict countByEnumeratingWithState:&v52 objects:v62 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_18:
        ;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  if ([(BRInterfaceAOP *)self _setStateAOPConfigsFromStateData:v43 andSlotData:self->_slotArray])
  {
    if (v39)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v40 = [v43 countByEnumeratingWithState:&v48 objects:v61 count:16];
      if (v40)
      {
        uint64_t v38 = *(void *)v49;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v49 != v38) {
              objc_enumerationMutation(v43);
            }
            uint64_t v42 = v20;
            uint64_t v21 = (void *)[v43 objectForKeyedSubscript:*(void *)(*((void *)&v48 + 1) + 8 * v20)];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            v22 = (void *)[v21 speedSlots];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v60 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v45;
              do
              {
                for (uint64_t k = 0; k != v24; ++k)
                {
                  if (*(void *)v45 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  id v27 = -[BRInterfaceAOP dataForSlot:fromArray:](self, "dataForSlot:fromArray:", objc_msgSend((id)objc_msgSend(v21, "speedSlots"), "objectForKeyedSubscript:", *(void *)(*((void *)&v44 + 1) + 8 * k)), self->_slotArray);
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    objc_msgSend(v27, "setRefCount:", objc_msgSend(v27, "refCount") - 1);
                    if (![v28 refCount])
                    {
                      -[NSMutableIndexSet addIndex:](self->_freeSlots, "addIndex:", objc_msgSend((id)objc_msgSend(v28, "slot"), "unsignedIntegerValue"));
                      [(NSMutableArray *)self->_slotArray removeObject:v28];
                    }
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v60 count:16];
              }
              while (v24);
            }
            uint64_t v20 = v42 + 1;
          }
          while (v42 + 1 != v40);
          uint64_t v40 = [v43 countByEnumeratingWithState:&v48 objects:v61 count:16];
        }
        while (v40);
      }
      [(NSMutableDictionary *)self->_stateDict removeObjectsForKeys:obj];
    }
    else
    {
      [(BRInterfaceAOP *)self mergeStateChanges:v43 into:self->_stateDict];
    }
    BOOL v29 = 0;
LABEL_42:
    long long v30 = a2;
    unint64_t v31 = 0x263F08000uLL;
    goto LABEL_43;
  }
  uint64_t v33 = -536870167;
LABEL_45:
  long long v34 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v33 userInfo:0];
  BOOL v29 = v34 != 0;
  if (!a5) {
    goto LABEL_42;
  }
  long long v30 = a2;
  unint64_t v31 = 0x263F08000;
  if (v34)
  {
    *a5 = v34;
    BOOL v29 = 1;
  }
LABEL_43:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [*(id *)(v31 + 2880) stringWithFormat:@"%@ %@", NSStringFromSelector(v30), @"end"]);
  return !v29;
}

- (id)dataForSlot:(id)a3 fromArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  if ([a3 integerValue] == -1) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_5:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    unint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(a3, "isEqualToNumber:", objc_msgSend(v10, "slot"))) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v10 = 0;
      if (v7) {
        goto LABEL_5;
      }
      return v10;
    }
  }
}

- (void)mergeStateChanges:(id)a3 into:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v9)), *(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5
{
  kern_return_t v8;
  void *v10;
  uint64_t input;
  uint64_t v12;

  long long v12 = *MEMORY[0x263EF8340];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start", a4, a3, 0, v12]);
  uint64_t v8 = IOConnectCallScalarMethod(self->_connect, 2u, &input, 3u, 0, 0);
  if (v8)
  {
    long long v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870167 userInfo:0];
    if (a5)
    {
      if (v10) {
        *a5 = v10;
      }
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return v8 == 0;
}

- (void)scheduleReadyNotificationWithBlock:(id)a3
{
  long long v5 = [(BRInterface *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__BRInterfaceAOP_scheduleReadyNotificationWithBlock___block_invoke;
  v6[3] = &unk_2645C7EE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync((dispatch_queue_t)v5, v6);
  [(BRInterfaceAOP *)self _findService];
}

uint64_t __53__BRInterfaceAOP_scheduleReadyNotificationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(a1 + 32) + 64) = result;
  return result;
}

- (BOOL)updateReadyState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v3 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    if (self->_isReady) {
      uint64_t v7 = "YES";
    }
    else {
      uint64_t v7 = "NO";
    }
    int v8 = [(HAButtonHapticsLoader *)self->_loader serviceAvailable];
    *(_DWORD *)long long v11 = 136315650;
    *(void *)&v11[4] = "-[BRInterfaceAOP updateReadyState]";
    if (v8) {
      uint64_t v9 = "YES";
    }
    else {
      uint64_t v9 = "NO";
    }
    *(_WORD *)&v11[12] = 2080;
    *(void *)&v11[14] = v7;
    __int16 v12 = 2080;
    long long v13 = v9;
    _os_log_debug_impl(&dword_221782000, v3, OS_LOG_TYPE_DEBUG, "%s isReady: %s loaderReady: %s", v11, 0x20u);
  }
  if (!self->_isReady
    && self->_service
    && [(HAButtonHapticsLoader *)self->_loader serviceAvailable])
  {
    long long v5 = _BRLog_log_0;
    if (!_BRLog_log_0)
    {
      long long v5 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_0 = (uint64_t)v5;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BRInterfaceAOP updateReadyState](v5);
    }
    if ([(HAButtonHapticsLoader *)self->_loader maxNumberOfSlots] < 1) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = [(HAButtonHapticsLoader *)self->_loader maxNumberOfSlots];
    }
    self->_maxAssetSlots = v6;
    self->_freeSlots = (NSMutableIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", 0, self->_maxAssetSlots);
    [(BRInterfaceAOP *)self _setDefaultAOPConfigs];
    self->_isReady = 1;
    if (self->_notificationBlock)
    {
      dispatch_async((dispatch_queue_t)[(BRInterface *)self queue], self->_notificationBlock);

      self->_notificationBlocuint64_t k = 0;
    }
    else
    {
      long long v10 = _BRLog_log_0;
      if (!_BRLog_log_0)
      {
        long long v10 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_0 = (uint64_t)v10;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BRInterfaceAOP updateReadyState](v10);
      }
    }
  }
  return self->_isReady;
}

- (void)_findService
{
  v3 = [(BRInterface *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__BRInterfaceAOP__findService__block_invoke;
  block[3] = &unk_2645C7E98;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

void __30__BRInterfaceAOP__findService__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
  v2 = *(void **)(a1 + 32);
  v3 = (IONotificationPort *)v2[6];
  if (v3)
  {
    IONotificationPortSetDispatchQueue(v3, (dispatch_queue_t)[v2 queue]);
    uint64_t v4 = *(void *)(a1 + 32);
    long long v5 = *(IONotificationPort **)(v4 + 48);
    unint64_t v6 = *(unsigned char *)(v4 + 113) ? "AppleSPUHapticsAudioDriver" : "AppleSPUButtonDriver";
    CFDictionaryRef v7 = IOServiceNameMatching(v6);
    if (!IOServiceAddMatchingNotification(v5, "IOServiceMatched", v7, (IOServiceMatchingCallback)AOPMatchedCallback, *(void **)(a1 + 32), (io_iterator_t *)(*(void *)(a1 + 32) + 56)))
    {
      int v8 = *(_DWORD **)(a1 + 32);
      io_iterator_t v9 = v8[14];
      AOPMatchedCallback(v8, v9);
    }
  }
}

- (void)_receiveLoaderAvailableNotification:(id)a3
{
  long long v5 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    long long v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRInterfaceAOP _receiveLoaderAvailableNotification:]();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqual:", self->_notificationName))
  {
    unint64_t v6 = [(BRInterface *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__BRInterfaceAOP__receiveLoaderAvailableNotification___block_invoke;
    block[3] = &unk_2645C7E98;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v6, block);
  }
}

uint64_t __54__BRInterfaceAOP__receiveLoaderAvailableNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateReadyState];
}

- (BOOL)_serviceSetProperty:(void *)a3 forKey:(__CFString *)a4
{
  CFDictionaryRef v7 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    CFDictionaryRef v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRInterfaceAOP _serviceSetProperty:forKey:]();
  }
  p_io_object_t service = &self->_service;
  uint64_t v9 = IORegistryEntrySetCFProperty(*p_service, a4, a3);
  if (v9)
  {
    long long v11 = _BRLog_log_0;
    if (!_BRLog_log_0)
    {
      long long v11 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_0 = (uint64_t)v11;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BRInterfaceAOP _serviceSetProperty:forKey:](p_service, v9, v11);
    }
  }
  return v9 == 0;
}

- (BOOL)_setDefaultAOPConfigs
{
  BOOL v3 = [(BRInterfaceAOP *)self _serviceSetProperty:&unk_26D3CD438 forKey:@"GlobalConfig"];
  if (v3)
  {
    LOBYTE(v3) = [(BRInterfaceAOP *)self _serviceSetProperty:&unk_26D3CD820 forKey:@"StateConfig"];
  }
  return v3;
}

- (BOOL)_setGlobalAOPConfigsFromBRFConfigs:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = +[BRInterfaceAOP _convertForceFeel:](BRInterfaceAOP, "_convertForceFeel:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ForceFeel"), "unsignedIntegerValue"));
    if (v6 == 3)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      int v8 = @"GlobalForceFeel";
      v9[0] = [NSNumber numberWithUnsignedInt:v6];
      LOBYTE(v5) = -[BRInterfaceAOP _serviceSetProperty:forKey:](self, "_serviceSetProperty:forKey:", [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1], @"GlobalConfig");
    }
  }
  return v5;
}

- (BOOL)_setStateAOPConfigsFromStateData:(id)a3 andSlotData:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v28 = (void *)[MEMORY[0x263EFF980] array];
  if (![a3 count]) {
    return 1;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v22 = [a3 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v34;
    id v21 = a3;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(a3);
        }
        uint64_t v23 = v5;
        uint64_t v6 = (void *)[a3 objectForKey:*(void *)(*((void *)&v33 + 1) + 8 * v5)];
        unsigned int v7 = +[BRInterfaceAOP _convertClickState:](BRInterfaceAOP, "_convertClickState:", [v6 state]);
        v38[0] = @"StateButtonState";
        uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
        v38[1] = @"StateEnable";
        v39[0] = v8;
        v39[1] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "enabled"));
        id v9 = (id)objc_msgSend((id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2), "mutableCopy");
        if ([v6 enabled])
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          obuint64_t j = (id)[v6 speedConfigs];
          uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v27 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v30 != v27) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                [v9 setObject:v13 forKey:@"StateSpeed"];
                objc_msgSend(v9, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v6, "speedSlots"), "objectForKeyedSubscript:", v13), @"StateSlot");
                uint64_t v14 = objc_msgSend(-[BRInterfaceAOP dataForSlot:fromArray:](self, "dataForSlot:fromArray:", objc_msgSend((id)objc_msgSend(v6, "speedSlots"), "objectForKeyedSubscript:", v13), a4), "asset");
                unsigned int v15 = [v14 hasAudio];
                if ([v14 hasHaptic]) {
                  int v16 = 2;
                }
                else {
                  int v16 = 0;
                }
                objc_msgSend(v9, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v16 | v15), @"StateHapticType");
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", @"MinTime"))
                {
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", @"MinTime"), @"StateMinTime");
                }
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", @"MaxTime"))
                {
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", @"MaxTime"), @"StateMaxTime");
                }
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", @"Gain"))
                {
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", @"Gain"), "doubleValue");
                  LODWORD(v18) = vcvtd_n_s64_f64(v17, 0x10uLL);
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v18), @"StateGain");
                }
                objc_msgSend(v28, "addObject:", (id)objc_msgSend(v9, "copy"));
              }
              uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v11);
          }
        }
        else
        {
          [v28 addObject:v9];
        }
        uint64_t v5 = v23 + 1;
        a3 = v21;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v22);
  }
  return [(BRInterfaceAOP *)self _serviceSetProperty:v28 forKey:@"StateConfig"];
}

+ (int)_convertForceFeel:(unint64_t)a3
{
  if (a3 >= 3) {
    return 3;
  }
  else {
    return a3;
  }
}

+ (int)_convertClickState:(unint64_t)a3
{
  if (a3 >= 0x11) {
    return 17;
  }
  else {
    return a3;
  }
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (unint64_t)maxAssetSlots
{
  return self->_maxAssetSlots;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_io_connect_t connect = a3;
}

- (BOOL)fastHaptics
{
  return self->_fastHaptics;
}

- (void)initWithFastHaptics:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[BRInterfaceAOP initWithFastHaptics:]";
  _os_log_error_impl(&dword_221782000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
}

- (void)propertyList
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_221782000, v0, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)v1, 0x16u);
}

- (void)updateReadyState
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_221782000, log, OS_LOG_TYPE_DEBUG, "BRInterfaceAOP is ready!", v1, 2u);
}

- (void)_receiveLoaderAvailableNotification:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_221782000, v0, OS_LOG_TYPE_DEBUG, "%s notification: %@", (uint8_t *)v1, 0x16u);
}

- (void)_serviceSetProperty:(NSObject *)a3 forKey:.cold.1(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[BRInterfaceAOP _serviceSetProperty:forKey:]";
  *(_DWORD *)&v3[14] = *a1;
  *(_WORD *)&v3[18] = 1024;
  OUTLINED_FUNCTION_1(&dword_221782000, a2, a3, "%s error setting property on service %u, code: %d", *(const char **)v3, (unint64_t)"-[BRInterfaceAOP _serviceSetProperty:forKey:]" >> 32, *(_DWORD *)&v3[16]);
}

- (void)_serviceSetProperty:forKey:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_221782000, v2, OS_LOG_TYPE_DEBUG, "%s property: %@ key: %@", (uint8_t *)v3, 0x20u);
}

@end