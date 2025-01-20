@interface AUParameter
+ (BOOL)supportsSecureCoding;
- (AUParameter)initWithCoder:(id)a3;
- (AUParameter)initWithID:(id)a3 name:(id)a4 address:(unint64_t)a5 min:(float)a6 max:(float)a7 unit:(unsigned int)a8 unitName:(id)a9 flags:(unsigned int)a10 valueStrings:(id)a11 dependentParameters:(id)a12;
- (AUParameterAddress)address;
- (AUValue)maxValue;
- (AUValue)minValue;
- (AUValue)value;
- (AUValue)valueFromString:(NSString *)string;
- (AudioUnitParameterOptions)flags;
- (AudioUnitParameterUnit)unit;
- (BOOL)localValueStale;
- (NSArray)dependentParameters;
- (NSArray)valueStrings;
- (NSString)stringFromValue:(const AUValue *)value;
- (NSString)unitName;
- (_AUStaticParameterInfo)info;
- (float)_defaultValue;
- (float)_internalValue;
- (id).cxx_construct;
- (id)copyNodeWithOffset:(unint64_t)a3;
- (id)description;
- (unsigned)_clumpID;
- (unsigned)_originalOrder;
- (void)_observersChanged:(BOOL)a3 deltaCount:(int)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(unint64_t)a3;
- (void)setInfo:(id)a3;
- (void)setLocalValueStale:(BOOL)a3;
- (void)setValue:(AUValue)value;
- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator;
- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator atHostTime:(uint64_t)hostTime;
- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator atHostTime:(uint64_t)hostTime eventType:(AUParameterAutomationEventType)eventType;
- (void)setValue:(float)a3 extOriginator:(AUParameterObserverExtendedToken)a4 atHostTime:(unint64_t)a5 eventType:(unsigned int)a6;
- (void)set_clumpID:(unsigned int)a3;
- (void)set_defaultValue:(float)a3;
- (void)set_originalOrder:(unsigned int)a3;
@end

@implementation AUParameter

- (id).cxx_construct
{
  *((unsigned char *)self + 88) = 0;
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 24) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_dependentParameters, 0);
}

- (void)setInfo:(id)a3
{
}

- (_AUStaticParameterInfo)info
{
  return self->_info;
}

- (NSArray)dependentParameters
{
  return self->_dependentParameters;
}

- (void)setAddress:(unint64_t)a3
{
  self->_address = a3;
}

- (AUParameterAddress)address
{
  return self->_address;
}

- (void)_observersChanged:(BOOL)a3 deltaCount:(int)a4
{
  v4 = &OBJC_IVAR___AUParameter__numUIObservers;
  if (a3) {
    v4 = &OBJC_IVAR___AUParameter__numRecordingObservers;
  }
  atomic_fetch_add((atomic_uint *volatile)((char *)self + *v4), a4);
}

- (AUParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v16 = self;
    v17 = self;
    -[AUParameter initWithCoder:]::depParamClasses = objc_msgSend(v15, "initWithObjects:", v16, v17, 0);
  }
  v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"id"];

  v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"name"];

  v18.receiver = self;
  v18.super_class = (Class)AUParameter;
  v9 = [(AUParameterNode *)&v18 initWithID:v6 name:v8];
  if (v9)
  {
    v10 = self;
    v11 = [v4 decodeObjectOfClass:v10 forKey:@"info"];
    objc_storeStrong((id *)&v9->_info, v11);

    [v4 decodeFloatForKey:@"value"];
    v9->_value = v12;
    v9->_address = [v4 decodeInt64ForKey:@"address"];
    v13 = [v4 decodeObjectOfClasses:-[AUParameter initWithCoder:]::depParamClasses forKey:@"deps"];
    objc_storeStrong((id *)&v9->_dependentParameters, v13);
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(AUParameterNode *)self identifier];
  [v7 encodeObject:v4 forKey:@"id"];

  v5 = [(AUParameterNode *)self displayName];
  [v7 encodeObject:v5 forKey:@"name"];

  v6 = [(AUParameter *)self info];
  [v7 encodeObject:v6 forKey:@"info"];

  [(AUParameter *)self value];
  objc_msgSend(v7, "encodeFloat:forKey:", @"value");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AUParameter address](self, "address"), @"address");
  [v7 encodeObject:self->_dependentParameters forKey:@"deps"];
}

- (void)set_originalOrder:(unsigned int)a3
{
}

- (unsigned)_originalOrder
{
  return [(_AUStaticParameterInfo *)self->_info originalOrder];
}

- (void)set_defaultValue:(float)a3
{
}

- (float)_defaultValue
{
  [(_AUStaticParameterInfo *)self->_info defaultValue];
  return result;
}

- (void)set_clumpID:(unsigned int)a3
{
}

- (unsigned)_clumpID
{
  return [(_AUStaticParameterInfo *)self->_info clumpID];
}

- (NSArray)valueStrings
{
  return [(_AUStaticParameterInfo *)self->_info valueStrings];
}

- (AudioUnitParameterOptions)flags
{
  return [(_AUStaticParameterInfo *)self->_info flags];
}

- (NSString)unitName
{
  v3 = [(_AUStaticParameterInfo *)self->_info unitName];

  info = self->_info;
  if (v3)
  {
    uint64_t v5 = [(_AUStaticParameterInfo *)info unitName];
  }
  else
  {
    unsigned int v6 = [(_AUStaticParameterInfo *)info unit];
    id v7 = &stru_1EDFA53D0;
    switch(v6)
    {
      case 0u:
      case 1u:
      case 7u:
      case 0x10u:
      case 0x11u:
      case 0x19u:
      case 0x1Au:
        goto LABEL_26;
      case 2u:
        id v7 = @"T/F";
        goto LABEL_22;
      case 3u:
        id v7 = @"%";
        goto LABEL_22;
      case 4u:
        id v7 = @"Secs";
        goto LABEL_22;
      case 5u:
        id v7 = @"Samps";
        goto LABEL_22;
      case 6u:
      case 0xFu:
        id v7 = @"Degr.";
        goto LABEL_22;
      case 8u:
        id v7 = @"Hz";
        goto LABEL_22;
      case 9u:
      case 0x14u:
        id v7 = @"Cents";
        goto LABEL_22;
      case 0xAu:
        id v7 = @"S-T";
        goto LABEL_22;
      case 0xBu:
      case 0xCu:
      case 0x1Bu:
        id v7 = @"MIDI";
        goto LABEL_22;
      case 0xDu:
        id v7 = @"dB";
        goto LABEL_22;
      case 0xEu:
        id v7 = @"Gain";
        goto LABEL_22;
      case 0x12u:
        id v7 = @"L/R";
        goto LABEL_22;
      case 0x13u:
        id v7 = @"Mtrs";
        goto LABEL_22;
      case 0x15u:
        id v7 = @"8ve";
        goto LABEL_22;
      case 0x16u:
        id v7 = @"BPM";
        goto LABEL_22;
      case 0x17u:
        id v7 = @"Beats";
        goto LABEL_22;
      case 0x18u:
        id v7 = @"msecs";
        goto LABEL_22;
      default:
        id v7 = 0;
LABEL_22:
        {
          v9 = v7;
          id v7 = v9;
          if (v10)
          {
            -[AUParameter unitName]::coreAudioUIBundle = [objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:@"/System/Library/Frameworks/CoreAudioKit.framework"];
            id v7 = v9;
          }
        }
        if (!-[AUParameter unitName]::coreAudioUIBundle) {
          goto LABEL_26;
        }
        uint64_t v5 = [(id)-[AUParameter unitName]::coreAudioUIBundle localizedStringForKey:v7 value:&stru_1EDFA53D0 table:@"AUParameters"];
        break;
    }
  }
  id v7 = (__CFString *)v5;
LABEL_26:
  return (NSString *)v7;
}

- (AudioUnitParameterUnit)unit
{
  return [(_AUStaticParameterInfo *)self->_info unit];
}

- (AUValue)maxValue
{
  [(_AUStaticParameterInfo *)self->_info maxValue];
  return result;
}

- (AUValue)minValue
{
  [(_AUStaticParameterInfo *)self->_info minValue];
  return result;
}

- (AUValue)valueFromString:(NSString *)string
{
  id v4 = string;
  uint64_t v5 = [(AUParameterNode *)self implementorValueFromStringCallback];

  if (v5)
  {
    unsigned int v6 = [(AUParameterNode *)self implementorValueFromStringCallback];
    float v7 = ((float (**)(void, AUParameter *, NSString *))v6)[2](v6, self, v4);
  }
  else
  {
    v9 = [(AUParameterNode *)self _rootParent];
    unsigned int v6 = v9;
    float v7 = 0.0;
    if (v9)
    {
      int v10 = [v9 implementorValueFromStringCallback];

      if (v10)
      {
        v11 = [v6 implementorValueFromStringCallback];
        float v7 = ((float (**)(void, AUParameter *, NSString *))v11)[2](v11, self, v4);
      }
    }
  }

  return v7;
}

- (NSString)stringFromValue:(const AUValue *)value
{
  uint64_t v5 = [(AUParameterNode *)self implementorStringFromValueCallback];

  if (v5)
  {
    unsigned int v6 = [(AUParameterNode *)self implementorStringFromValueCallback];
    uint64_t v7 = ((void (**)(void, AUParameter *, const AUValue *))v6)[2](v6, self, value);
  }
  else
  {
    v8 = [(AUParameterNode *)self _rootParent];
    unsigned int v6 = v8;
    if (v8)
    {
      v9 = [v8 implementorStringFromValueCallback];

      if (v9)
      {
        int v10 = [v6 implementorStringFromValueCallback];
        v11 = ((void (**)(void, AUParameter *, const AUValue *))v10)[2](v10, self, value);

        goto LABEL_10;
      }
    }
    if (!value) {
      value = &self->_value;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%g", *value);
  }
  v11 = (void *)v7;
LABEL_10:

  return (NSString *)v11;
}

- (void)setValue:(float)a3 extOriginator:(AUParameterObserverExtendedToken)a4 atHostTime:(unint64_t)a5 eventType:(unsigned int)a6
{
  v11 = (void *)MEMORY[0x192FC9400](self, a2);
  float v12 = [(AUParameterNode *)self _rootParent];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = a5;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke;
  v27 = &unk_1E5687BD8;
  float v33 = a3;
  v28 = self;
  unint64_t var0 = a4.var0;
  id v13 = v12;
  unint64_t v32 = a5;
  unsigned int v34 = a6;
  id v29 = v13;
  v30 = v35;
  v14 = (void (**)(void))_Block_copy(&v24);
  v19 = (void *)MEMORY[0x192FC9400](v14, v15, v16, v17, v18);
  if (!v13
    || (objc_msgSend(v13, "valueAccessQueue", v24, v25, v26, v27, v28),
        v20 = objc_claimAutoreleasedReturnValue(),
        specific = dispatch_get_specific(&current_queue_key),
        v20,
        specific == v20))
  {
    v14[2](v14);
  }
  else
  {
    id v22 = v13;

    v23 = [v22 valueAccessQueue];
    dispatch_sync(v23, v14);
  }

  _Block_object_dispose(v35, 8);
}

void __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke(uint64_t a1)
{
  v45[4] = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 100) = *(_DWORD *)(a1 + 72);
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 88));
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = v2 & 0xFFFFFFFE;
  BOOL v4 = (v2 & 0xFFFFFFFE) == 2 || v3 == 4;
  if (!v4 && (v3 != 8 || (v2 & 1) != 0))
  {
    id v5 = *(id *)(a1 + 32);
    if (v5)
    {
      unsigned int v6 = v5;
      while (1)
      {
        uint64_t v7 = [v6 implementorValueObserver];
        v8 = (void *)v7;
        if (v7) {
          break;
        }
        uint64_t v9 = [v6 parentNode];

        unsigned int v6 = (void *)v9;
        if (!v9) {
          goto LABEL_13;
        }
      }
      (*(void (**)(uint64_t, void, float))(v7 + 16))(v7, *(void *)(a1 + 32), *(float *)(a1 + 72));
    }
LABEL_13:
    uint64_t v2 = *(void *)(a1 + 56);
  }
  if ((v2 & 1) == 0)
  {
    int v10 = [*(id *)(a1 + 40) remoteParameterSynchronizerXPCConnection];

    if (v10)
    {
      if (v3 == 4) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = *(void *)(a1 + 56);
      }
      [*(id *)(a1 + 40) remoteParameterSynchronizerXPCConnection];
      v40[0] = &unk_1EDF9E4D0;
      v40[1] = &__block_literal_global_7074;
      v40[3] = v40;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v41 = v12;
      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEEC2B8ne180100ERKS8_((uint64_t)v42, (uint64_t)v40);

      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v40);
      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEEC2B8ne180100ERKS8_((uint64_t)v45, (uint64_t)v42);
      id v13 = v41;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3321888768;
      v43[2] = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33_AURemoteParameterSynchronization11objc_objectJEE11async_proxyEv_block_invoke;
      v43[3] = &__block_descriptor_64_ea8_32c50_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJEEEEEE_e17_v16__0__NSError_8l;
      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEEC2B8ne180100ERKS8_((uint64_t)v44, (uint64_t)v45);
      v14 = [v13 remoteObjectProxyWithErrorHandler:v43];
      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v44);
      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v45);
      uint64_t v15 = [*(id *)(a1 + 32) address];
      LODWORD(v16) = *(_DWORD *)(a1 + 72);
      [v14 syncParameter:v15 value:v11 extOriginator:*(void *)(a1 + 64) hostTime:*(unsigned int *)(a1 + 76) eventType:v16];

      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v42);
    }
  }
  [*(id *)(a1 + 32) _internalValue];
  if (*(void *)(a1 + 40))
  {
    if (v3 != 6 && v3 != 8)
    {
      int v19 = v17;
      unsigned int v20 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 92));
      if (v20 || (unsigned int v21 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 96))) != 0)
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void *)(v22 + 104);
        unsigned int v24 = atomic_load((unsigned int *)(v22 + 92));
        BOOL v25 = v24 != 0;
        LODWORD(v22) = atomic_load((unsigned int *)(v22 + 96));
        if (v22) {
          int v26 = v25 | 2;
        }
        else {
          int v26 = v25;
        }
        unsigned int v27 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 96));
        if (v27 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = mach_absolute_time();
        }
        {
          {
            serialDeferralQueue(void)::gDeferralQueue = (uint64_t)dispatch_queue_create("AUParameterTree.deferralQueue", 0);
          }
        }
        v28 = serialDeferralQueue(void)::gDeferralQueue;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_3;
        v32[3] = &unk_1E5687BB0;
        id v29 = *(id *)(a1 + 40);
        int v37 = v26;
        int v38 = v19;
        uint64_t v31 = *(void *)(a1 + 48);
        uint64_t v30 = *(void *)(a1 + 56);
        uint64_t v35 = v23;
        uint64_t v36 = v30;
        id v33 = v29;
        uint64_t v34 = v31;
        int v39 = *(_DWORD *)(a1 + 76);
        dispatch_async(v28, v32);
      }
    }
  }
}

void __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_4;
  v5[3] = &unk_1E5687BB0;
  id v3 = *(id *)(a1 + 32);
  int v9 = *(_DWORD *)(a1 + 64);
  int v10 = *(_DWORD *)(a1 + 68);
  long long v8 = *(_OWORD *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  int v11 = *(_DWORD *)(a1 + 72);
  dispatch_sync(v2, v5);
}

uint64_t __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_4(uint64_t a1)
{
  v28[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observerController];
  uint64_t v3 = v2;
  int v4 = *(_DWORD *)(a1 + 64);
  int v5 = *(_DWORD *)(a1 + 68);
  unint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  int v8 = *(_DWORD *)(a1 + 72);
  if (*(unsigned char *)(v2 + 48))
  {
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    unint64_t v11 = *(void *)(a1 + 56);
    *(void *)&long long v27 = v6;
    *((void *)&v27 + 1) = v11;
    std::__tree<AUObserverController::AddressOriginator>::__emplace_unique_key_args<AUObserverController::AddressOriginator,AUObserverController::AddressOriginator>((uint64_t *)(v3 + 56), v6, v11, &v27);
    goto LABEL_8;
  }
  *(unsigned char *)(v2 + 48) = 1;
  uint64_t v10 = *(void *)v2;
  uint64_t v9 = *(void *)(v2 + 8);
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 16), 1uLL, memory_order_relaxed);
  }
  v28[0] = &unk_1EDFA0888;
  v28[1] = v10;
  v28[2] = v9;
  v28[3] = v28;
  CAEventReceiver::createTimer(*(void *)(v2 + 32), (uint64_t)v28);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v28);
  if (v4) {
    goto LABEL_7;
  }
LABEL_8:
  if ((v4 & 2) != 0)
  {
    uint64_t v12 = *(void *)(a1 + 56) & 0xFFFFFFFELL;
    BOOL v14 = v12 != 6 && v12 != 10 && v12 != 2;
    double v16 = *(void **)(v3 + 88);
    unint64_t v15 = *(void *)(v3 + 96);
    if ((unint64_t)v16 >= v15)
    {
      uint64_t v18 = *(void **)(v3 + 80);
      unint64_t v19 = 0xCCCCCCCCCCCCCCCDLL * (v16 - v18) + 1;
      if (v19 > 0x666666666666666) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v20 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v15 - (void)v18) >> 3);
      if (2 * v20 > v19) {
        unint64_t v19 = 2 * v20;
      }
      if (v20 >= 0x333333333333333) {
        unint64_t v21 = 0x666666666666666;
      }
      else {
        unint64_t v21 = v19;
      }
      if (v21 > 0x666666666666666) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v22 = (char *)operator new(40 * v21);
      uint64_t v23 = &v22[8 * (v16 - v18)];
      *(void *)uint64_t v23 = v7;
      *((void *)v23 + 1) = v6;
      *((_DWORD *)v23 + 4) = v5;
      *((_DWORD *)v23 + 5) = v8;
      *((void *)v23 + 3) = v14;
      *((void *)v23 + 4) = v12;
      int v17 = v23 + 40;
      if (v16 != v18)
      {
        do
        {
          long long v24 = *(_OWORD *)(v16 - 5);
          long long v25 = *(_OWORD *)(v16 - 3);
          *((void *)v23 - 1) = *(v16 - 1);
          *(_OWORD *)(v23 - 24) = v25;
          *(_OWORD *)(v23 - 40) = v24;
          v23 -= 40;
          v16 -= 5;
        }
        while (v16 != v18);
        double v16 = v18;
      }
      *(void *)(v3 + 80) = v23;
      *(void *)(v3 + 88) = v17;
      *(void *)(v3 + 96) = &v22[40 * v21];
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      void *v16 = v7;
      v16[1] = v6;
      *((_DWORD *)v16 + 4) = v5;
      *((_DWORD *)v16 + 5) = v8;
      int v17 = v16 + 5;
      v16[3] = v14;
      v16[4] = v12;
    }
    *(void *)(v3 + 88) = v17;
  }
  return CAEventReceiver::Impl::timerShouldFireWithin(*(CAEventReceiver::Impl **)(v3 + 32), 0.05);
}

- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator atHostTime:(uint64_t)hostTime eventType:(AUParameterAutomationEventType)eventType
{
}

- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator atHostTime:(uint64_t)hostTime
{
}

- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator
{
}

- (void)setValue:(AUValue)value
{
  int v5 = (void *)MEMORY[0x192FC9400](self, a2);
  *(AUValue *)&double v6 = value;
  [(AUParameter *)self setValue:0 extOriginator:0 atHostTime:0 eventType:v6];
}

- (AUValue)value
{
  uint64_t v3 = [(AUParameterNode *)self _rootParent];
  int v4 = v3;
  uint64_t v12 = 0;
  id v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  float value = self->_value;
  if (!v3
    || ([v3 valueAccessQueue],
        int v5 = objc_claimAutoreleasedReturnValue(),
        specific = dispatch_get_specific(&current_queue_key),
        v5,
        specific == v5))
  {
    [(AUParameter *)self _internalValue];
    float v8 = v9;
    v13[6] = v9;
  }
  else
  {
    uint64_t v7 = [v4 valueAccessQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __20__AUParameter_value__block_invoke;
    v11[3] = &unk_1E5687B68;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    float v8 = v13[6];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __20__AUParameter_value__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _internalValue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (float)_internalValue
{
  int v3 = [(AUParameterNode *)self _rootParent];
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_localValueStale);
  if ((v4 & 1) != 0 || ([(_AUStaticParameterInfo *)self->_info flags] & 0x8000) != 0 && v3)
  {
    int v5 = self;
    double v6 = v5;
    while (1)
    {
      uint64_t v7 = [v6 implementorValueProvider];
      float v8 = (void *)v7;
      if (v7) {
        break;
      }
      uint64_t v9 = [v6 parentNode];

      double v6 = (void *)v9;
      if (!v9) {
        goto LABEL_9;
      }
    }
    v5->_float value = (*(float (**)(uint64_t, AUParameter *))(v7 + 16))(v7, v5);
    atomic_store(0, (unsigned __int8 *)&self->_localValueStale);
  }
LABEL_9:
  float value = self->_value;

  return value;
}

- (void)setLocalValueStale:(BOOL)a3
{
}

- (BOOL)localValueStale
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_localValueStale);
  return v2 & 1;
}

- (id)copyNodeWithOffset:(unint64_t)a3
{
  int v5 = [AUParameter alloc];
  double v6 = [(AUParameterNode *)self identifier];
  uint64_t v7 = [(AUParameterNode *)self displayName];
  float v8 = [(AUParameterNode *)v5 initWithID:v6 name:v7];

  uint64_t v9 = [(AUParameter *)self info];
  [(AUParameter *)v8 setInfo:v9];

  [(AUParameter *)v8 setAddress:[(AUParameter *)self address] + a3];
  return v8;
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(AUParameterNode *)self identifier];
  double v6 = [(AUParameterNode *)self displayName];
  AUParameterAddress v7 = [(AUParameter *)self address];
  [(AUParameter *)self value];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, \"%@\", \"%@\", addr 0x%llx, val %.3f>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUParameter;
  [(AUParameterNode *)&v2 dealloc];
}

- (AUParameter)initWithID:(id)a3 name:(id)a4 address:(unint64_t)a5 min:(float)a6 max:(float)a7 unit:(unsigned int)a8 unitName:(id)a9 flags:(unsigned int)a10 valueStrings:(id)a11 dependentParameters:(id)a12
{
  uint64_t v12 = *(void *)&a10;
  uint64_t v13 = *(void *)&a8;
  id v20 = a9;
  id v21 = a11;
  id v22 = a12;
  v30.receiver = self;
  v30.super_class = (Class)AUParameter;
  uint64_t v23 = [(AUParameterNode *)&v30 initWithID:a3 name:a4];
  if (v23)
  {
    long long v24 = objc_alloc_init(_AUStaticParameterInfo);
    *(float *)&double v25 = a6;
    [(_AUStaticParameterInfo *)v24 setMinValue:v25];
    *(float *)&double v26 = a7;
    [(_AUStaticParameterInfo *)v24 setMaxValue:v26];
    [(_AUStaticParameterInfo *)v24 setFlags:v12];
    [(_AUStaticParameterInfo *)v24 setValueStrings:v21];
    [(_AUStaticParameterInfo *)v24 setUnit:v13];
    [(_AUStaticParameterInfo *)v24 setUnitName:v20];
    [(_AUStaticParameterInfo *)v24 setDefaultValue:0.0];
    [(_AUStaticParameterInfo *)v24 setOriginalOrder:0];
    info = v23->_info;
    v23->_info = v24;
    v28 = v24;

    v23->_address = a5;
    objc_storeStrong((id *)&v23->_dependentParameters, a12);
  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end