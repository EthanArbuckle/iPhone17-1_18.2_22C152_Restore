@interface HSTBackboardBridge
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTBackboardBridge)initWithQueue:(id)a3;
- (id).cxx_construct;
- (void)_clear;
- (void)_handleGetPropertyEvent:(id)a3;
- (void)_handleMotionState:(unsigned __int8)a3 confidence:(unsigned __int8)a4;
- (void)_handlePowerSourceState;
- (void)_handleProxClearedAfterOccludedWake;
- (void)_handleScreenOrientation:(unsigned __int8)a3;
- (void)_handleSetPropertyEvent:(id)a3;
- (void)_handleStockholmState:(unsigned __int8)a3;
- (void)_handleStuckTouchDetectorState:(id)a3;
- (void)_handleTouchHand:(unsigned __int8)a3;
- (void)_handleTouchMode:(unsigned __int16)a3;
- (void)_handleWristState:(unsigned __int8)a3;
- (void)dealloc;
- (void)handleConsume:(id)a3;
- (void)sendUSBEvent:(unsigned __int8)a3;
- (void)sendWirelessEvent:(unsigned __int8)a3;
@end

@implementation HSTBackboardBridge

- (void)_handleSetPropertyEvent:(id)a3
{
  v4 = (char *)a3;
  id v5 = *((id *)v4 + 5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = *((id *)v4 + 5);
  objc_opt_class();
  v8 = (uint64_t **)(v4 + 16);
  if (objc_opt_isKindOfClass()) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }

  int v10 = v4[39];
  if (v4[39] < 0)
  {
    if (*((void *)v4 + 3) != 22)
    {
LABEL_19:
      v101.receiver = self;
      v101.super_class = (Class)HSTBackboardBridge;
      [(HSStage *)&v101 handleConsume:v4];
      int v10 = v4[39];
      goto LABEL_20;
    }
    v11 = *v8;
  }
  else
  {
    v11 = (uint64_t *)(v4 + 16);
    if (v10 != 22) {
      goto LABEL_19;
    }
  }
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = *(uint64_t *)((char *)v11 + 14);
  if (v12 != 0x63416E6F69746F4DLL || v13 != 0x6944797469766974 || v14 != 0x6863746170736944) {
    goto LABEL_19;
  }
LABEL_20:
  if ((v10 & 0x80) == 0)
  {
    switch(v10)
    {
      case 18:
        if (*v8 == (uint64_t *)0x7465446863756F54
          && *((void *)v4 + 3) == 0x6F4D6E6F69746365
          && *((_WORD *)v4 + 16) == 25956)
        {
          goto LABEL_75;
        }
        if (*v8 != (uint64_t *)0x7465447475706E49
          || *((void *)v4 + 3) != 0x6F4D6E6F69746365
          || *((_WORD *)v4 + 16) != 25956)
        {
          goto LABEL_103;
        }
        goto LABEL_132;
      case 19:
        goto LABEL_87;
      case 20:
        goto LABEL_121;
      case 21:
        if (*v8 == (uint64_t *)0x7461745374736F48
          && *((void *)v4 + 3) == 0x63696669746F4E65
          && *(void *)(v4 + 29) == 0x6E6F697461636966)
        {
          goto LABEL_111;
        }
        v34 = v4 + 16;
        if (v10 == 9) {
          goto LABEL_104;
        }
        if (v10 != 19) {
          goto LABEL_121;
        }
LABEL_87:
        if (*v8 != (uint64_t *)0x7363696870617247
          || *((void *)v4 + 3) != 0x7461746E6569724FLL
          || *(void *)(v4 + 27) != 0x6E6F697461746E65)
        {
          goto LABEL_121;
        }
        goto LABEL_130;
      case 22:
        if (*v8 == (uint64_t *)0x63416E6F69746F4DLL
          && *((void *)v4 + 3) == 0x6944797469766974
          && *(void *)(v4 + 30) == 0x6863746170736944)
        {
          goto LABEL_136;
        }
        goto LABEL_103;
      default:
LABEL_103:
        v34 = v4 + 16;
        if (v10 == 9) {
          goto LABEL_104;
        }
        goto LABEL_121;
    }
  }
  uint64_t v21 = *((void *)v4 + 3);
  if (v21 == 18)
  {
    v22 = *v8;
    if (**v8 == 0x7465446863756F54 && (*v8)[1] == 0x6F4D6E6F69746365 && *((_WORD *)*v8 + 8) == 25956)
    {
LABEL_75:
      if (!v6)
      {
        memset(__b, 170, sizeof(__b));
        basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[HSTBackboardBridge _handleSetPropertyEvent:]();
        }
        goto LABEL_236;
      }
      unsigned __int8 v35 = [v6 unsignedLongLongValue] + 3;
      if (v35 < 6u)
      {
        v36 = (unsigned __int16 *)&unk_1130DE;
LABEL_135:
        uint64_t v51 = v36[(char)v35];
LABEL_140:
        [(HSTBackboardBridge *)self _handleTouchMode:v51];
        goto LABEL_236;
      }
    }
    else
    {
      uint64_t v25 = *v22;
      uint64_t v26 = v22[1];
      int v27 = *((unsigned __int16 *)v22 + 8);
      if (v25 != 0x7465447475706E49 || v26 != 0x6F4D6E6F69746365 || v27 != 25956)
      {
        uint64_t v21 = *((void *)v4 + 3);
        goto LABEL_54;
      }
LABEL_132:
      if (!v6)
      {
        memset(__b, 170, sizeof(__b));
        basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[HSTBackboardBridge _handleSetPropertyEvent:]();
        }
        goto LABEL_236;
      }
      unsigned __int8 v35 = [v6 unsignedLongLongValue] + 3;
      if (v35 < 0xAu)
      {
        v36 = (unsigned __int16 *)&unk_1130EA;
        goto LABEL_135;
      }
    }
    uint64_t v51 = 1;
    goto LABEL_140;
  }
LABEL_54:
  if (v21 == 21)
  {
    if (**v8 == 0x7461745374736F48
      && (*v8)[1] == 0x63696669746F4E65
      && *(uint64_t *)((char *)*v8 + 13) == 0x6E6F697461636966)
    {
LABEL_111:
      if (v9)
      {
        id v46 = v9;
        id v47 = [v46 objectForKeyedSubscript:@"ScreenOn"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v48 = v47;
        }
        else {
          id v48 = 0;
        }

        unsigned __int16 v100 = (unsigned __int16)[v48 BOOLValue];
        id v54 = [v46 objectForKeyedSubscript:@"PocketTouchesExpected"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v55 = v54;
        }
        else {
          id v55 = 0;
        }

        unsigned int v99 = [v55 BOOLValue];
        id v56 = [v46 objectForKeyedSubscript:@"FaceTouchesExpected"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v57 = v56;
        }
        else {
          id v57 = 0;
        }

        unsigned int v98 = [v57 BOOLValue];
        id v58 = [v46 objectForKeyedSubscript:@"CoverGestureEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v59 = v58;
        }
        else {
          id v59 = 0;
        }

        unsigned int v97 = [v59 BOOLValue];
        id v60 = [v46 objectForKeyedSubscript:@"WakeOnTapEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v61 = v60;
        }
        else {
          id v61 = 0;
        }

        unsigned int v96 = [v61 BOOLValue];
        id v62 = [v46 objectForKeyedSubscript:@"WakeOnSwipeEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v63 = v62;
        }
        else {
          id v63 = 0;
        }

        unsigned int v95 = [v63 BOOLValue];
        id v64 = [v46 objectForKeyedSubscript:@"WakeOnLongPressEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v65 = v64;
        }
        else {
          id v65 = 0;
        }

        unsigned int v94 = [v65 BOOLValue];
        id v66 = [v46 objectForKeyedSubscript:@"WakeOnTwoFingerLongPressEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v67 = v66;
        }
        else {
          id v67 = 0;
        }

        unsigned int v93 = [v67 BOOLValue];
        id v68 = [v46 objectForKeyedSubscript:@"WakeOnTapThroughEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v69 = v68;
        }
        else {
          id v69 = 0;
        }

        unsigned int v92 = [v69 BOOLValue];
        id v70 = [v46 objectForKeyedSubscript:@"WakeOnSwipeThroughEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v71 = v70;
        }
        else {
          id v71 = 0;
        }

        unsigned int v91 = [v71 BOOLValue];
        id v72 = [v46 objectForKeyedSubscript:@"WakeOnLongPressThroughEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v73 = v72;
        }
        else {
          id v73 = 0;
        }

        unsigned int v74 = [v73 BOOLValue];
        id v75 = [v46 objectForKeyedSubscript:@"ChangeSourceKeyboardUsagePair"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v76 = v75;
        }
        else {
          id v76 = 0;
        }

        unsigned int v77 = [v76 unsignedIntValue];
        id v78 = [v46 objectForKeyedSubscript:@"DisplayState"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v79 = v78;
        }
        else {
          id v79 = 0;
        }

        unsigned int v80 = [v79 unsignedIntValue];
        id v81 = [v46 objectForKeyedSubscript:@"DisplayState"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v82 = v81;
        }
        else {
          id v82 = 0;
        }

        unsigned int v83 = [v82 unsignedIntValue];
        __int16 v84 = v80 == 2;
        __int16 v85 = v100 | 2;
        if (!v99) {
          __int16 v85 = v100;
        }
        if (v98) {
          v85 |= 4u;
        }
        if (v97) {
          v85 |= 8u;
        }
        if (v96) {
          v85 |= 0x10u;
        }
        if (v95) {
          v85 |= 0x20u;
        }
        if (v94) {
          v85 |= 0x40u;
        }
        if (v93) {
          v85 |= 0x800u;
        }
        if (v92) {
          v85 |= 0x80u;
        }
        if (v91) {
          v85 |= 0x100u;
        }
        if (v74) {
          v85 |= 0x200u;
        }
        if (v77 == 786480) {
          __int16 v86 = v85 | 0x400;
        }
        else {
          __int16 v86 = v85;
        }
        BOOL v87 = v83 == 3;

        if (v87) {
          unsigned __int16 v88 = v86 | v84 | 0x1000;
        }
        else {
          unsigned __int16 v88 = v86 | v84;
        }

        [(HSTBackboardBridge *)self _handleTouchMode:v88];
        [(HSTBackboardBridge *)self _handleStuckTouchDetectorState:v46];
      }
      else
      {
        memset(__b, 170, sizeof(__b));
        basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[HSTBackboardBridge _handleSetPropertyEvent:]();
        }
      }
      goto LABEL_236;
    }
    uint64_t v21 = *((void *)v4 + 3);
  }
  if (v21 == 19)
  {
    if (**v8 != 0x7363696870617247
      || (*v8)[1] != 0x7461746E6569724FLL
      || *(uint64_t *)((char *)*v8 + 11) != 0x6E6F697461746E65)
    {
LABEL_121:
      if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, "WristState"))
      {
        if (v6)
        {
          -[HSTBackboardBridge _handleWristState:](self, "_handleWristState:", [v6 intValue]);
        }
        else
        {
          memset(__b, 170, sizeof(__b));
          basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[HSTBackboardBridge _handleSetPropertyEvent:].cold.5();
          }
        }
      }
      else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, "ProxClearedAfterOccludedWake"))
      {
        if (v6)
        {
          if ([v6 BOOLValue]) {
            [(HSTBackboardBridge *)self _handleProxClearedAfterOccludedWake];
          }
        }
        else
        {
          memset(__b, 170, sizeof(__b));
          basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[HSTBackboardBridge _handleSetPropertyEvent:].cold.6();
          }
        }
      }
      goto LABEL_236;
    }
LABEL_130:
    if (v6)
    {
      -[HSTBackboardBridge _handleScreenOrientation:](self, "_handleScreenOrientation:", [v6 unsignedCharValue]);
    }
    else
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTBackboardBridge _handleSetPropertyEvent:].cold.7();
      }
    }
  }
  else
  {
    if (v21 == 22)
    {
      if (**v8 == 0x63416E6F69746F4DLL
        && (*v8)[1] == 0x6944797469766974
        && *(uint64_t *)((char *)*v8 + 14) == 0x6863746170736944)
      {
LABEL_136:
        if (v9)
        {
          v52 = (NSDictionary *)v9;
          if (getBool(v52, @"stationary"))
          {
            uint64_t v53 = 1;
          }
          else if (getBool(v52, @"walking"))
          {
            uint64_t v53 = 2;
          }
          else if (getBool(v52, @"running"))
          {
            uint64_t v53 = 3;
          }
          else if (getBool(v52, @"automotive"))
          {
            uint64_t v53 = 4;
          }
          else
          {
            uint64_t v53 = 0;
          }

          id v89 = [(NSDictionary *)v52 objectForKeyedSubscript:@"confidence"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v90 = v89;
          }
          else {
            id v90 = 0;
          }

          if (v90)
          {
            -[HSTBackboardBridge _handleMotionState:confidence:](self, "_handleMotionState:confidence:", v53, [v90 intValue]);
          }
          else
          {
            memset(__b, 170, sizeof(__b));
            basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              -[HSTBackboardBridge _handleSetPropertyEvent:].cold.9();
            }
          }
        }
        else
        {
          memset(__b, 170, sizeof(__b));
          basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[HSTBackboardBridge _handleSetPropertyEvent:].cold.8();
          }
        }
        goto LABEL_236;
      }
      uint64_t v21 = *((void *)v4 + 3);
    }
    if (v21 != 9) {
      goto LABEL_121;
    }
    v34 = (char *)*v8;
LABEL_104:
    uint64_t v43 = *(void *)v34;
    int v44 = v34[8];
    if (v43 != 0x6E61486863756F54 || v44 != 100) {
      goto LABEL_121;
    }
    if (v6)
    {
      -[HSTBackboardBridge _handleTouchHand:](self, "_handleTouchHand:", [v6 intValue]);
    }
    else
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTBackboardBridge _handleSetPropertyEvent:].cold.4();
      }
    }
  }
LABEL_236:
}

void __36__HSTBackboardBridge_initWithQueue___block_invoke_38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleStockholmState:2];
}

void __36__HSTBackboardBridge_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleStockholmState:1];
}

- (void)_handleStockholmState:(unsigned __int8)a3
{
  p_state = &self->_state;
  if (!self->_state.stockholmState.__engaged_ || self->_state.stockholmState.var0.__val_ != a3)
  {
    self->_state.stockholmState = (optional<HSTPipeline::StockholmState>)(a3 | 0x100);
    id v5 = objc_opt_new();
    v5[2] = p_state->stockholmState.var0.__val_;
    v6.receiver = self;
    v6.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v6 handleConsume:v5];
  }
}

- (void)_handlePowerSourceState
{
  io_iterator_t existing = -1431655766;
  CFDictionaryRef v2 = IOServiceMatching("IOPMPowerSource");
  if (!IOServiceGetMatchingServices(0, v2, &existing))
  {
    unsigned __int8 v3 = 0;
    unsigned __int8 v4 = 0;
    while (1)
    {
      io_registry_entry_t v5 = IOIteratorNext(existing);
      io_object_t v6 = v5;
      if (!v5) {
        break;
      }
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, @"AppleRawAdapterDetails", kCFAllocatorDefault, 0);
      IOObjectRelease(v6);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = CFProperty;
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (v3 == 1 && v4 == 1)
            {
              unsigned __int8 v4 = 1;
              unsigned __int8 v3 = 1;
              goto LABEL_27;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v12 = [v11 objectForKeyedSubscript:@"IsWireless"];
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 && ([v12 BOOLValue])
              {
                unsigned __int8 v3 = 1;
              }
              else
              {
                uint64_t v13 = [v11 objectForKeyedSubscript:@"FamilyCode"];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && ([v13 intValue] == -536854518
                   || [v13 intValue] == -536854519
                   || [v13 intValue] == -536854528
                   || [v13 intValue] == -536854525))
                {
                  unsigned __int8 v4 = 1;
                }
              }
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      if (v3)
      {
        if (v4) {
          break;
        }
      }
    }
    IOObjectRelease(existing);
    [(HSTBackboardBridge *)self sendWirelessEvent:v3];
    [(HSTBackboardBridge *)self sendUSBEvent:v4];
  }
}

- (void)sendWirelessEvent:(unsigned __int8)a3
{
  p_state = &self->_state;
  if (!self->_state.wirelessChargingState.__engaged_ || self->_state.wirelessChargingState.var0.__val_ != a3)
  {
    self->_state.wirelessChargingState = (optional<HSTPipeline::WirelessChargingState>)(a3 | 0x100);
    io_registry_entry_t v5 = objc_opt_new();
    v5[2] = p_state->wirelessChargingState.var0.__val_;
    v6.receiver = self;
    v6.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v6 handleConsume:v5];
  }
}

- (void)sendUSBEvent:(unsigned __int8)a3
{
  p_state = &self->_state;
  if (!self->_state.usbChargingState.__engaged_ || self->_state.usbChargingState.var0.__val_ != a3)
  {
    self->_state.usbChargingState = (optional<HSTPipeline::USBChargingState>)(a3 | 0x100);
    io_registry_entry_t v5 = objc_opt_new();
    v5[2] = p_state->usbChargingState.var0.__val_;
    v6.receiver = self;
    v6.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v6 handleConsume:v5];
  }
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(HSTBackboardBridge *)self _handleSetPropertyEvent:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(HSTBackboardBridge *)self _handleGetPropertyEvent:v6];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)HSTBackboardBridge;
      [(HSStage *)&v8 handleConsume:v6];
    }
  }
}

void __36__HSTBackboardBridge_initWithQueue___block_invoke_42(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePowerSourceState];
}

- (HSTBackboardBridge)initWithQueue:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v58 = +[NSAssertionHandler currentHandler];
    [v58 handleFailureInMethod:a2, self, @"HSTBackboardBridge.mm", 39, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v69.receiver = self;
  v69.super_class = (Class)HSTBackboardBridge;
  id v6 = [(HSStage *)&v69 init];
  if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    int out_token = -1;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __36__HSTBackboardBridge_initWithQueue___block_invoke;
    handler[3] = &unk_142D20;
    objc_copyWeak(&v66, &location);
    if (notify_register_dispatch("com.apple.stockholm.field.on", &out_token, v5, handler))
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTBackboardBridge initWithQueue:]();
      }
      id v7 = 0;
    }
    else
    {
      p_begin = (void **)&v6->_notifyTokens.__begin_;
      end = v6->_notifyTokens.__end_;
      value = v6->_notifyTokens.__end_cap_.__value_;
      if (end >= value)
      {
        uint64_t v12 = (int *)*p_begin;
        uint64_t v13 = ((char *)end - (unsigned char *)*p_begin) >> 2;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v15 = (char *)value - (char *)v12;
        if (v15 >> 1 > v14) {
          unint64_t v14 = v15 >> 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          long long v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v6->_notifyTokens.__end_cap_, v16);
          uint64_t v12 = (int *)*p_begin;
          end = v6->_notifyTokens.__end_;
        }
        else
        {
          long long v17 = 0;
        }
        long long v18 = (int *)&v17[4 * v13];
        long long v19 = (int *)&v17[4 * v16];
        *long long v18 = out_token;
        v11 = v18 + 1;
        while (end != v12)
        {
          int v20 = *--end;
          *--long long v18 = v20;
        }
        *p_begin = v18;
        v6->_notifyTokens.__end_ = v11;
        v6->_notifyTokens.__end_cap_.__value_ = v19;
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        int *end = out_token;
        v11 = end + 1;
      }
      v6->_notifyTokens.__end_ = v11;
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = __36__HSTBackboardBridge_initWithQueue___block_invoke_38;
      v63[3] = &unk_142D20;
      objc_copyWeak(&v64, &location);
      notify_register_dispatch("com.apple.stockholm.field.off", &out_token, v5, v63);
      v22 = v6->_notifyTokens.__end_;
      uint64_t v21 = v6->_notifyTokens.__end_cap_.__value_;
      if (v22 >= v21)
      {
        v24 = (int *)*p_begin;
        uint64_t v25 = ((char *)v22 - (unsigned char *)*p_begin) >> 2;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 62) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v27 = (char *)v21 - (char *)v24;
        if (v27 >> 1 > v26) {
          unint64_t v26 = v27 >> 1;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v6->_notifyTokens.__end_cap_, v28);
          v24 = (int *)*p_begin;
          v22 = v6->_notifyTokens.__end_;
        }
        else
        {
          v29 = 0;
        }
        v30 = (int *)&v29[4 * v25];
        v31 = (int *)&v29[4 * v28];
        int *v30 = out_token;
        v23 = v30 + 1;
        while (v22 != v24)
        {
          int v32 = *--v22;
          *--v30 = v32;
        }
        *p_begin = v30;
        v6->_notifyTokens.__end_ = v23;
        v6->_notifyTokens.__end_cap_.__value_ = v31;
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        int *v22 = out_token;
        v23 = v22 + 1;
      }
      v6->_notifyTokens.__end_ = v23;
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = __36__HSTBackboardBridge_initWithQueue___block_invoke_40;
      v61[3] = &unk_142D20;
      objc_copyWeak(&v62, &location);
      notify_register_dispatch("com.apple.stockholm.field.suspended", &out_token, v5, v61);
      v34 = v6->_notifyTokens.__end_;
      v33 = v6->_notifyTokens.__end_cap_.__value_;
      if (v34 >= v33)
      {
        v36 = (int *)*p_begin;
        uint64_t v37 = ((char *)v34 - (unsigned char *)*p_begin) >> 2;
        unint64_t v38 = v37 + 1;
        if ((unint64_t)(v37 + 1) >> 62) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v39 = (char *)v33 - (char *)v36;
        if (v39 >> 1 > v38) {
          unint64_t v38 = v39 >> 1;
        }
        if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v40 = v38;
        }
        if (v40)
        {
          v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v6->_notifyTokens.__end_cap_, v40);
          v36 = (int *)*p_begin;
          v34 = v6->_notifyTokens.__end_;
        }
        else
        {
          v41 = 0;
        }
        v42 = (int *)&v41[4 * v37];
        uint64_t v43 = (int *)&v41[4 * v40];
        int *v42 = out_token;
        unsigned __int8 v35 = v42 + 1;
        while (v34 != v36)
        {
          int v44 = *--v34;
          *--v42 = v44;
        }
        *p_begin = v42;
        v6->_notifyTokens.__end_ = v35;
        v6->_notifyTokens.__end_cap_.__value_ = v43;
        if (v36) {
          operator delete(v36);
        }
      }
      else
      {
        int *v34 = out_token;
        unsigned __int8 v35 = v34 + 1;
      }
      v6->_notifyTokens.__end_ = v35;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = __36__HSTBackboardBridge_initWithQueue___block_invoke_42;
      v59[3] = &unk_142D20;
      objc_copyWeak(&v60, &location);
      notify_register_dispatch("com.apple.system.powersources", &out_token, v5, v59);
      id v46 = v6->_notifyTokens.__end_;
      v45 = v6->_notifyTokens.__end_cap_.__value_;
      if (v46 >= v45)
      {
        id v48 = (int *)*p_begin;
        uint64_t v49 = ((char *)v46 - (unsigned char *)*p_begin) >> 2;
        unint64_t v50 = v49 + 1;
        if ((unint64_t)(v49 + 1) >> 62) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v51 = (char *)v45 - (char *)v48;
        if (v51 >> 1 > v50) {
          unint64_t v50 = v51 >> 1;
        }
        if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v52 = v50;
        }
        if (v52)
        {
          uint64_t v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v6->_notifyTokens.__end_cap_, v52);
          id v48 = (int *)*p_begin;
          id v46 = v6->_notifyTokens.__end_;
        }
        else
        {
          uint64_t v53 = 0;
        }
        id v54 = (int *)&v53[4 * v49];
        id v55 = (int *)&v53[4 * v52];
        *id v54 = out_token;
        id v47 = v54 + 1;
        while (v46 != v48)
        {
          int v56 = *--v46;
          *--id v54 = v56;
        }
        *p_begin = v54;
        v6->_notifyTokens.__end_ = v47;
        v6->_notifyTokens.__end_cap_.__value_ = v55;
        if (v48) {
          operator delete(v48);
        }
      }
      else
      {
        *id v46 = out_token;
        id v47 = v46 + 1;
      }
      v6->_notifyTokens.__end_ = v47;
      objc_destroyWeak(&v60);
      id v7 = v6;
      objc_destroyWeak(&v62);
      objc_destroyWeak(&v64);
    }
    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __36__HSTBackboardBridge_initWithQueue___block_invoke_40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleStockholmState:0];
}

- (void)dealloc
{
  p_notifyTokens = &self->_notifyTokens;
  begin = self->_notifyTokens.__begin_;
  end = self->_notifyTokens.__end_;
  if (begin != end)
  {
    do
      notify_cancel(*begin++);
    while (begin != end);
    begin = p_notifyTokens->__begin_;
  }
  p_notifyTokens->__end_ = begin;
  v6.receiver = self;
  v6.super_class = (Class)HSTBackboardBridge;
  [(HSStage *)&v6 dealloc];
}

- (void)_handleTouchMode:(unsigned __int16)a3
{
  p_state = &self->_state;
  if (self->_state.touchMode.__engaged_)
  {
    int val = p_state->touchMode.var0.__val_;
    if (val == a3) {
      return;
    }
    if (a3 & 5) == 0 && (val)
    {
      char v11 = 0;
      id v7 = [[HSTVendorEvent alloc] initWithType:9 buffer:&v11 length:1];
      v10.receiver = self;
      v10.super_class = (Class)HSTBackboardBridge;
      [(HSStage *)&v10 handleConsume:v7];
    }
  }
  p_state->touchMode.var0.__val_ = a3;
  p_state->touchMode.__engaged_ = 1;
  objc_super v8 = objc_opt_new();
  v8[2] = p_state->touchMode.var0.__val_;
  v9.receiver = self;
  v9.super_class = (Class)HSTBackboardBridge;
  [(HSStage *)&v9 handleConsume:v8];
}

- (void)_handleScreenOrientation:(unsigned __int8)a3
{
  p_state = &self->_state;
  if (!self->_state.screenOrientation.__engaged_ || self->_state.screenOrientation.var0.__val_ != a3)
  {
    self->_state.screenOrientation = (optional<HSTPipeline::ScreenOrientation>)(a3 | 0x100);
    id v5 = objc_opt_new();
    v5[2] = p_state->screenOrientation.var0.__val_;
    v6.receiver = self;
    v6.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v6 handleConsume:v5];
  }
}

- (void)_handleMotionState:(unsigned __int8)a3 confidence:(unsigned __int8)a4
{
  if ((a4 - 3) >= 0xFFFFFFFE)
  {
    p_state = &self->_state;
    if (!self->_state.motionState.__engaged_ || self->_state.motionState.var0.__val_ != a3)
    {
      self->_state.motionState = (optional<HSTPipeline::MotionState>)(a3 | 0x100);
      objc_super v6 = objc_opt_new();
      v6[2] = p_state->motionState.var0.__val_;
      v7.receiver = self;
      v7.super_class = (Class)HSTBackboardBridge;
      [(HSStage *)&v7 handleConsume:v6];
    }
  }
}

- (void)_handleTouchHand:(unsigned __int8)a3
{
  p_state = &self->_state;
  if (!self->_state.touchHand.__engaged_ || self->_state.touchHand.var0.__val_ != a3)
  {
    self->_state.touchHand = (optional<HSTPipeline::TouchHand>)(a3 | 0x100);
    id v5 = objc_opt_new();
    v5[2] = p_state->touchHand.var0.__val_;
    v6.receiver = self;
    v6.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v6 handleConsume:v5];
  }
}

- (void)_handleWristState:(unsigned __int8)a3
{
  p_state = &self->_state;
  if (!self->_state.wristState.__engaged_ || self->_state.wristState.var0.__val_ != a3)
  {
    self->_state.wristState = (optional<HSTPipeline::WristState>)(a3 | 0x100);
    id v5 = objc_opt_new();
    v5[2] = p_state->wristState.var0.__val_;
    v6.receiver = self;
    v6.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v6 handleConsume:v5];
  }
}

- (void)_handleStuckTouchDetectorState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"StuckTouchDetectorDisabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  unsigned int v7 = [v6 BOOLValue];
  if (!self->_state.stuckTouchDetectorState.__engaged_ || self->_state.stuckTouchDetectorState.var0.__val_ != v7)
  {
    self->_state.stuckTouchDetectorState = (optional<HSTPipeline::StuckTouchDetectorState>)(v7 | 0x100);
    objc_super v8 = objc_opt_new();
    v8[2] = v7;
    v9.receiver = self;
    v9.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v9 handleConsume:v8];
  }
}

- (void)_handleProxClearedAfterOccludedWake
{
  unsigned __int8 v3 = objc_opt_new();
  v4.receiver = self;
  v4.super_class = (Class)HSTBackboardBridge;
  [(HSStage *)&v4 handleConsume:v3];
}

- (void)_handleGetPropertyEvent:(id)a3
{
  objc_super v4 = a3;
  id v5 = v4;
  id v6 = (char *)(v4 + 2);
  int v7 = *((char *)v4 + 39);
  if (v7 < 0)
  {
    if (v4[3] != 10) {
      goto LABEL_10;
    }
    id v6 = *(char **)v6;
  }
  else if (v7 != 10)
  {
    goto LABEL_10;
  }
  uint64_t v8 = *(void *)v6;
  int v9 = *((unsigned __int16 *)v6 + 4);
  if (v8 == 0x6174537265746157 && v9 == 25972)
  {
    uint64_t v11 = objc_opt_new();
    v18.receiver = self;
    v18.super_class = (Class)HSTBackboardBridge;
    [(HSStage *)&v18 handleConsume:v11];
    if (*(unsigned char *)(v11 + 16))
    {
      v19[0] = @"water";
      uint64_t v12 = +[NSNumber numberWithBool:*(unsigned __int8 *)(v11 + 17)];
      v19[1] = @"confidence";
      v20[0] = v12;
      LODWORD(v13) = *(_DWORD *)(v11 + 20);
      unint64_t v14 = +[NSNumber numberWithFloat:v13];
      v20[1] = v14;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      unint64_t v16 = (void *)v5[5];
      v5[5] = v15;

      goto LABEL_11;
    }
  }
LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)HSTBackboardBridge;
  [(HSStage *)&v17 handleConsume:v5];
LABEL_11:
}

- (void)_clear
{
  *(void *)&self->_state.touchMode.var0.__null_state_ = 0;
  *(void *)&self->_state.touchHand.var0.__null_state_ = 0;
  *(_DWORD *)&self->_state.usbChargingState.var0.__null_state_ = 0;
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  p_state = &self->_state;
  if (p_state->touchMode.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key, p_state->touchMode.var0.__val_);
  }
  if (p_state->screenOrientation.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110>::Key, p_state->screenOrientation.var0.__val_);
  }
  if (p_state->motionState.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)111,(char)116,(char)105,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->motionState.var0.__val_);
  }
  if (p_state->touchHand.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)72,(char)97,(char)110,(char)100>::Key, p_state->touchHand.var0.__val_);
  }
  if (p_state->wristState.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)114,(char)105,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->wristState.var0.__val_);
  }
  if (p_state->stockholmState.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)111,(char)99,(char)107,(char)104,(char)111,(char)108,(char)109,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->stockholmState.var0.__val_);
  }
  if (p_state->wirelessChargingState.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)105,(char)114,(char)101,(char)108,(char)101,(char)115,(char)115,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->wirelessChargingState.var0.__val_);
  }
  if (p_state->stuckTouchDetectorState.__engaged_) {
    HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)116,(char)117,(char)99,(char)107,(char)84,(char)111,(char)117,(char)99,(char)104,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)111,(char)114,(char)83,(char)116,(char)97,(char)116,(char)101>::Key, p_state->stuckTouchDetectorState.var0.__val_);
  }
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  [(HSTBackboardBridge *)self _clear];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v15 = v5;
  long long v16 = v5;
  long long v13 = v5;
  long long v14 = v5;
  long long v12 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v12);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTBackboardBridge handleHSDecode:]();
    }
  }
  else
  {
    while (1)
    {
      unint64_t v9 = HSUtil::Decoder::decodeKey((HSUtil::Decoder *)&v12);
      if (v12) {
        break;
      }
      if (v9 == HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101>::Key)
      {
        self->_state.touchMode.var0.__val_ = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12);
        self->_state.touchMode.__engaged_ = 1;
      }
      else if (v9 == HSUtil::CoderKey::Literal<(char)115,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110>::Key)
      {
        self->_state.screenOrientation = (optional<HSTPipeline::ScreenOrientation>)(HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12) | 0x100);
      }
      else if (v9 == HSUtil::CoderKey::Literal<(char)109,(char)111,(char)116,(char)105,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101>::Key)
      {
        self->_state.motionState = (optional<HSTPipeline::MotionState>)(HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12) | 0x100);
      }
      else if (v9 == HSUtil::CoderKey::Literal<(char)116,(char)111,(char)117,(char)99,(char)104,(char)72,(char)97,(char)110,(char)100>::Key)
      {
        self->_state.touchHand = (optional<HSTPipeline::TouchHand>)(HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12) | 0x100);
      }
      else
      {
        if (v9 == HSUtil::CoderKey::Literal<(char)119,(char)114,(char)105,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101>::Key)
        {
          __int16 v10 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12) | 0x100;
          uint64_t v11 = (char *)&self->super._state.lock.__m_.__sig + 2;
        }
        else if (v9 == HSUtil::CoderKey::Literal<(char)115,(char)116,(char)111,(char)99,(char)107,(char)104,(char)111,(char)108,(char)109,(char)83,(char)116,(char)97,(char)116,(char)101>::Key)
        {
          __int16 v10 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12) | 0x100;
          uint64_t v11 = (char *)&self->super._state.lock.__m_.__sig + 4;
        }
        else if (v9 == HSUtil::CoderKey::Literal<(char)119,(char)105,(char)114,(char)101,(char)108,(char)101,(char)115,(char)115,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101>::Key)
        {
          __int16 v10 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12) | 0x100;
          uint64_t v11 = (char *)&self->super._state.lock.__m_.__sig + 6;
        }
        else
        {
          if (v9 != HSUtil::CoderKey::Literal<(char)115,(char)116,(char)117,(char)99,(char)107,(char)116,(char)111,(char)117,(char)99,(char)104,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)111,(char)114,(char)83,(char)116,(char)97,(char)116,(char)101>::Key) {
            goto LABEL_4;
          }
          __int16 v10 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v12) | 0x100;
          uint64_t v11 = &self->super._state.lock.__m_.__opaque[2];
        }
        *((_WORD *)v11 + 60) = v10;
      }
      if (v12)
      {
        memset(__b, 170, sizeof(__b));
        basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[HSTBackboardBridge handleHSDecode:]();
        }
        goto LABEL_4;
      }
    }
    if (v12 == 3)
    {
      BOOL v6 = 1;
      goto LABEL_5;
    }
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTBackboardBridge.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTBackboardBridge handleHSDecode:]();
    }
  }
LABEL_4:
  BOOL v6 = 0;
LABEL_5:
  if ((void)v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14);
  }
  int v7 = (void *)v13;
  *(void *)&long long v13 = 0;
  if (v7)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v7);
    operator delete();
  }
  return v6;
}

- (void).cxx_destruct
{
  p_notifyTokens = &self->_notifyTokens;
  begin = self->_notifyTokens.__begin_;
  if (begin)
  {
    p_notifyTokens->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 120) = 0;
  *((unsigned char *)self + 122) = 0;
  *(void *)((char *)self + 132) = 0;
  *(void *)((char *)self + 124) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 18) = 0;
  return self;
}

- (void)initWithQueue:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleSetPropertyEvent:.cold.9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end