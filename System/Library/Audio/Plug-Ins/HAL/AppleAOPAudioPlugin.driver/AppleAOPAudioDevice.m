@interface AppleAOPAudioDevice
+ (__CFString)getDeviceUIDFromIOObject:(unsigned int)a3;
- (AppleAOPAudioDevice)initWithDeviceUID:(id)a3 withDeviceName:(id)a4 withModelName:(id)a5 withPlugin:(id)a6 withIOObject:(unsigned int)a7;
- (BOOL)clockIsStable;
- (BOOL)getCustomPropertyInfoByIndex:(unsigned int)a3 forCustPropInfo:(AudioServerPlugInCustomPropertyInfo *)a4;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)tryGetProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)tryHasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)trySetProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (__CFDictionary)voiceTriggerGetConfigureDataId;
- (__CFDictionary)voiceTriggerGetData;
- (basic_string<char,)getDiagonsticData;
- (id).cxx_construct;
- (int)performStartIO;
- (int)performStopIO;
- (int)tryPerformStartIO;
- (int)tryPerformStopIO;
- (unsigned)clockDomain;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)getIOKitObject;
- (unsigned)getNumCustomProperties;
- (unsigned)getStartCount;
- (unsigned)inputLatency;
- (unsigned)inputSafetyOffset;
- (unsigned)ouptputSafetyOffset;
- (unsigned)outputLatency;
- (unsigned)readAvailablePastData;
- (unsigned)timestampPeriod;
- (unsigned)tryDataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (void)addVoiceTriggerService:(BorealisOwl_IOKitObject *)a3;
- (void)enableListening:(BOOL)a3;
- (void)notifyDevicePropertiesChanged;
- (void)setLastVoiceTrigEventTime:(int64_t)a3;
- (void)startInput:(BOOL)a3;
- (void)updateStreamDescription;
@end

@implementation AppleAOPAudioDevice

- (BOOL)clockIsStable
{
  return 0;
}

- (unsigned)timestampPeriod
{
  return *((_DWORD *)self->mAOPAudioHWManagerPtr.__ptr_ + 18);
}

- (unsigned)inputLatency
{
  return AOPAudioDeviceHWManager::HW_GetDeviceInputLatencyFrames(self->mAOPAudioHWManagerPtr.__ptr_);
}

- (unsigned)outputLatency
{
  return AOPAudioDeviceHWManager::HW_GetDeviceInputLatencyFrames(self->mAOPAudioHWManagerPtr.__ptr_);
}

- (unsigned)inputSafetyOffset
{
  return *((_DWORD *)self->mAOPAudioHWManagerPtr.__ptr_ + 17);
}

- (unsigned)ouptputSafetyOffset
{
  return *((_DWORD *)self->mAOPAudioHWManagerPtr.__ptr_ + 17);
}

- (unsigned)clockDomain
{
  return AOPAudioDeviceHWManager::HW_GetClockDomain(self->mAOPAudioHWManagerPtr.__ptr_);
}

- (AppleAOPAudioDevice)initWithDeviceUID:(id)a3 withDeviceName:(id)a4 withModelName:(id)a5 withPlugin:(id)a6 withIOObject:(unsigned int)a7
{
  id v12 = a3;
  id v35 = a4;
  id v13 = a5;
  id v14 = a6;
  unsigned int v44 = a7;
  v43.receiver = self;
  v43.super_class = (Class)AppleAOPAudioDevice;
  v15 = [(AppleAOPAudioDevice *)&v43 initWithDeviceUID:v12 withPlugin:v14];
  v16 = v15;
  if (v15)
  {
    [(AppleAOPAudioDevice *)v15 setDeviceName:v35];
    [(AppleAOPAudioDevice *)v16 setModelUID:v13];
    [(AppleAOPAudioDevice *)v16 setManufacturerName:@"Apple Inc."];
    [(AppleAOPAudioDevice *)v16 setModelName:v13];
    [(AppleAOPAudioDevice *)v16 setCanBeDefaultDevice:1];
    [(AppleAOPAudioDevice *)v16 setCanBeDefaultSystemDevice:1];
    [(AppleAOPAudioDevice *)v16 setCanChangeDeviceName:0];
    [(AppleAOPAudioDevice *)v16 setSamplingRates:&off_25220];
    [(AppleAOPAudioDevice *)v16 setSamplingRate:16000.0];
    [(AppleAOPAudioDevice *)v16 setTransportType:1986622068];
    id v17 = objc_alloc((Class)ASDStreamFormat);
    [(AppleAOPAudioDevice *)v16 samplingRate];
    id v18 = objc_msgSend(v17, "initWithSampleRate:numChannels:commonPCMFormat:isInterleaved:", 1, 3, 1);
    objc_msgSend(v18, "setBytesPerFrame:", (objc_msgSend(v18, "bitsPerChannel") >> 3) * objc_msgSend(v18, "channelsPerFrame"));
    objc_msgSend(v18, "setBytesPerPacket:", objc_msgSend(v18, "framesPerPacket") * objc_msgSend(v18, "bytesPerFrame"));
    [(AppleAOPAudioDevice *)v16 samplingRate];
    objc_msgSend(v18, "setSampleRate:");
    [(AppleAOPAudioDevice *)v16 samplingRate];
    objc_msgSend(v18, "setMinimumSampleRate:");
    [(AppleAOPAudioDevice *)v16 samplingRate];
    objc_msgSend(v18, "setMaximumSampleRate:");
    v19 = +[NSMutableArray array];
    [v19 addObject:v18];
    v20 = [[AppleAOPAudioStream alloc] initWithDirection:1768845428 owningDevice:v16 plugin:v14 formats:v19];
    halInputAudioStream = v16->_halInputAudioStream;
    v16->_halInputAudioStream = v20;

    [(AppleAOPAudioStream *)v16->_halInputAudioStream setStreamName:@"InputStream"];
    v22 = [[AppleAOPAudioStream alloc] initWithDirection:1768845428 owningDevice:v16 plugin:v14 formats:v19];
    driverInputAudioStreamFormat = v16->_driverInputAudioStreamFormat;
    v16->_driverInputAudioStreamFormat = v22;

    [(AppleAOPAudioStream *)v16->_driverInputAudioStreamFormat setStreamName:@"dummy"];
    sub_AFB8(&v44, &v42);
    p_ptr = &v16->mAOPAudioHWManagerPtr.__ptr_;
    shared_ptr<AOPAudioDeviceHWManager> v25 = (shared_ptr<AOPAudioDeviceHWManager>)v42;
    shared_ptr<CADeprecated::CAMutex> v42 = (shared_ptr<CADeprecated::CAMutex>)0;
    cntrl = (std::__shared_weak_count *)v16->mAOPAudioHWManagerPtr.__cntrl_;
    v16->mAOPAudioHWManagerPtr = v25;
    if (cntrl)
    {
      sub_B110(cntrl);
      if (v42.__cntrl_) {
        sub_B110((std::__shared_weak_count *)v42.__cntrl_);
      }
    }
    [(AppleAOPAudioDevice *)v16 setInputSafetyOffset:*((unsigned int *)*p_ptr + 17)];
    sub_B184("Device State", &v42);
    shared_ptr<CADeprecated::CAMutex> v27 = v42;
    shared_ptr<CADeprecated::CAMutex> v42 = (shared_ptr<CADeprecated::CAMutex>)0;
    v28 = (std::__shared_weak_count *)v16->mStateMutexPtr.__cntrl_;
    v16->mStateMutexPtr = v27;
    if (v28)
    {
      sub_B110(v28);
      if (v42.__cntrl_) {
        sub_B110((std::__shared_weak_count *)v42.__cntrl_);
      }
    }
    sub_B2D8("Device IO", &v42);
    shared_ptr<CADeprecated::CAMutex> v29 = v42;
    shared_ptr<CADeprecated::CAMutex> v42 = (shared_ptr<CADeprecated::CAMutex>)0;
    v30 = (std::__shared_weak_count *)v16->mIOMutexPtr.__cntrl_;
    v16->mIOMutexPtr = v29;
    if (v30)
    {
      sub_B110(v30);
      if (v42.__cntrl_) {
        sub_B110((std::__shared_weak_count *)v42.__cntrl_);
      }
    }
    v16->mIOStatus.mRealtimeAvailablePastData = 0;
    v16->mIOStatus.mSizeOfAuxiliaryIOStatus = 0;
    [(AppleAOPAudioDevice *)v16 addInputStream:v16->_halInputAudioStream];
    [(AppleAOPAudioDevice *)v16 updateStreamDescription];
    v16->mStartCount = 0;
    v16->mPastDataListeningEnabled = AOPAudioDeviceHWManager::HW_GetIsIORunning(*p_ptr);
    v16->mLastVoiceTrigEventTime = 0;
    v16->mMeasureTrigToIOStartDelta = 0;
    [(AppleAOPAudioStream *)v16->_halInputAudioStream notifyStreamPropertiesChanged];
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    v39 = sub_7294;
    v40 = &unk_24938;
    v31 = v16;
    v41 = v31;
    CACentralStateDumpRegisterSubsystem();

    int v36 = 0;
    v31->mChannelEnableMaskAvailable = AOPAudioDeviceHWManager::HW_AudioGetControlValue(*p_ptr, 0, &v36);
    unsigned int v32 = [(AppleAOPAudioDevice *)v31 getNumCustomProperties];
    v31->mCustomPropertyInfoListEntries = 0;
    if (v32)
    {
      uint64_t v33 = 0;
      do
      {
        if ([(AppleAOPAudioDevice *)v31 getCustomPropertyInfoByIndex:v33 forCustPropInfo:&v42])
        {
          ++v31->mCustomPropertyInfoListEntries;
        }
        uint64_t v33 = (v33 + 1);
      }
      while (v32 != v33);
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (__CFString)getDeviceUIDFromIOObject:(unsigned int)a3
{
  return (__CFString *)AOPAudioDeviceHWManager::HW_CopyDeviceUID(*(AOPAudioDeviceHWManager **)&a3, a2, *(uint64_t *)&a3, v3);
}

- (unsigned)getNumCustomProperties
{
  return 12;
}

- (BOOL)getCustomPropertyInfoByIndex:(unsigned int)a3 forCustPropInfo:(AudioServerPlugInCustomPropertyInfo *)a4
{
  v5 = &aDpsdtslp[12 * a3];
  if (!*(_DWORD *)v5 && !self->mChannelEnableMaskAvailable) {
    return 0;
  }
  if ([(AppleAOPAudioDevice *)self getNumCustomProperties] > a3)
  {
    *(void *)&a4->mSelector = *(void *)v5;
    a4->mQualifierDataType = *((_DWORD *)v5 + 2);
  }
  return 1;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  return [(AppleAOPAudioDevice *)self tryHasProperty:a3];
}

- (BOOL)tryHasProperty:(const AudioObjectPropertyAddress *)a3
{
  ptr = self->mStateMutexPtr.__ptr_;
  char v21 = (*(uint64_t (**)(CAMutex *, SEL))(*(void *)ptr + 16))(ptr, a2);
  if (!a3)
  {
LABEL_11:
    BOOL HasPropertyEnableListeningOnGesture = 0;
    goto LABEL_35;
  }
  signed int mSelector = a3->mSelector;
  BOOL HasPropertyEnableListeningOnGesture = 1;
  if ((int)a3->mSelector > 1635152996)
  {
    if (mSelector > 1684107363)
    {
      if (mSelector > 1685087595)
      {
        if (mSelector == 1685087596) {
          goto LABEL_35;
        }
        int v8 = 1685287012;
      }
      else
      {
        if (mSelector == 1684107364) {
          goto LABEL_35;
        }
        int v8 = 1684893796;
      }
      goto LABEL_27;
    }
    if (mSelector <= 1668641651)
    {
      if (mSelector == 1635152997)
      {
LABEL_24:
        BOOL IsVoiceTriggerSupported = AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_);
LABEL_29:
        BOOL HasPropertyEnableListeningOnGesture = IsVoiceTriggerSupported;
        goto LABEL_35;
      }
      unsigned __int16 v7 = 29807;
      goto LABEL_23;
    }
    if (mSelector != 1668641652)
    {
      int v8 = 1684105587;
LABEL_27:
      if (mSelector != v8) {
        goto LABEL_28;
      }
      goto LABEL_35;
    }
    BOOL v9 = [(AppleAOPAudioDevice *)self getNumCustomProperties] == 0;
LABEL_32:
    BOOL HasPropertyEnableListeningOnGesture = !v9;
    goto LABEL_35;
  }
  if (mSelector <= 1634692198)
  {
    if (mSelector == 1633903475) {
      goto LABEL_35;
    }
    if (mSelector != 1634689389 && mSelector != 1634690413) {
      goto LABEL_28;
    }
    BOOL v9 = !self->mChannelEnableMaskAvailable;
    goto LABEL_32;
  }
  if (mSelector <= 1635152992)
  {
    if (mSelector == 1634692199)
    {
      BOOL HasPropertyEnableListeningOnGesture = AOPAudioDeviceHWManager::HW_HasPropertyEnableListeningOnGesture(self->mAOPAudioHWManagerPtr.__ptr_);
      sub_7794((BorealisOwlLog *)"Device::hasProperty(kAOPAudioDevicePropertyEnableListeningOnGesture) : %d\n", v11, v12, v13, v14, v15, v16, v17, HasPropertyEnableListeningOnGesture);
      goto LABEL_35;
    }
    if (mSelector != 1634694002) {
      goto LABEL_28;
    }
    goto LABEL_11;
  }
  if (mSelector != 1635152993)
  {
    unsigned __int16 v7 = 29795;
LABEL_23:
    if (mSelector == (v7 | 0x61760000)) {
      goto LABEL_24;
    }
LABEL_28:
    v19.receiver = self;
    v19.super_class = (Class)AppleAOPAudioDevice;
    BOOL IsVoiceTriggerSupported = [(AppleAOPAudioDevice *)&v19 hasProperty:a3];
    goto LABEL_29;
  }
LABEL_35:
  sub_AE2C(&ptr);
  return HasPropertyEnableListeningOnGesture;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  ptr = self->mStateMutexPtr.__ptr_;
  int v30 = 0;
  v28 = ptr;
  char v29 = (*(uint64_t (**)(CAMutex *, SEL))(*(void *)ptr + 16))(ptr, a2);
  BOOL HasPropertyEnableListeningOnGesture = 0;
  if (!a3) {
    goto LABEL_36;
  }
  signed int mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1635153006)
  {
    if (mSelector <= 1684107363)
    {
      if (mSelector != 1635153007 && mSelector != 1668641652 && mSelector != 1684105587) {
        goto LABEL_30;
      }
      goto LABEL_36;
    }
    if (mSelector > 1685087595)
    {
      if (mSelector == 1685087596)
      {
        BOOL HasPropertyEnableListeningOnGesture = 1;
        goto LABEL_36;
      }
      int v15 = 1685287012;
    }
    else
    {
      if (mSelector == 1684107364) {
        goto LABEL_36;
      }
      int v15 = 1684893796;
    }
  }
  else
  {
    if (mSelector <= 1634692198)
    {
      if (mSelector != 1633903475)
      {
        if (mSelector != 1634689389 && mSelector != 1634690413) {
          goto LABEL_30;
        }
        BOOL HasPropertyEnableListeningOnGesture = self->mChannelEnableMaskAvailable
                                           && AOPAudioDeviceHWManager::HW_AudioGetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 0, &v30);
        sub_7794((BorealisOwlLog *)"Device::isPropertySettable(kAOPAudioDriverEnabledChannelMask) --> %d\n", v6, v7, v8, v9, v10, v11, v12, HasPropertyEnableListeningOnGesture);
      }
      goto LABEL_36;
    }
    if (mSelector > 1635152994)
    {
      if (mSelector == 1635152995 || mSelector == 1635152997)
      {
        BOOL IsVoiceTriggerSupported = AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_);
LABEL_31:
        BOOL HasPropertyEnableListeningOnGesture = IsVoiceTriggerSupported;
        goto LABEL_36;
      }
LABEL_30:
      v27.receiver = self;
      v27.super_class = (Class)AppleAOPAudioDevice;
      BOOL IsVoiceTriggerSupported = [(AppleAOPAudioDevice *)&v27 isPropertySettable:a3];
      goto LABEL_31;
    }
    if (mSelector == 1634692199)
    {
      BOOL HasPropertyEnableListeningOnGesture = AOPAudioDeviceHWManager::HW_HasPropertyEnableListeningOnGesture(self->mAOPAudioHWManagerPtr.__ptr_);
      sub_7794((BorealisOwlLog *)"Device::isPropertySettable(kAOPAudioDevicePropertyEnableListeningOnGesture) --> %d\n", v19, v20, v21, v22, v23, v24, v25, HasPropertyEnableListeningOnGesture);
      goto LABEL_36;
    }
    int v15 = 1635152993;
  }
  if (mSelector != v15) {
    goto LABEL_30;
  }
LABEL_36:
  sub_AE2C(&v28);
  return HasPropertyEnableListeningOnGesture;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  return [(AppleAOPAudioDevice *)self tryDataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5];
}

- (unsigned)tryDataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  uint64_t v6 = *(void *)&a4;
  ptr = self->mStateMutexPtr.__ptr_;
  char v23 = (*(uint64_t (**)(CAMutex *, SEL))(*(void *)ptr + 16))(ptr, a2);
  if (!a3)
  {
    unsigned int v17 = 0;
    goto LABEL_26;
  }
  signed int mSelector = a3->mSelector;
  unsigned int v17 = 4;
  if ((int)a3->mSelector <= 1635153006)
  {
    if (mSelector > 1634692198)
    {
      if (mSelector <= 1635152994)
      {
        if (mSelector == 1634692199)
        {
          unsigned int v17 = 4;
          sub_7794((BorealisOwlLog *)"sizeofProperty(kAOPAudioDevicePropertyEnableListeningOnGesture) : %d\n", v9, v10, v11, v12, v13, v14, v15, 4);
          goto LABEL_26;
        }
        unsigned __int16 v18 = 29793;
        goto LABEL_21;
      }
      if (mSelector != 1635152995)
      {
        unsigned __int16 v18 = 29797;
LABEL_21:
        int v19 = v18 | 0x61760000;
        goto LABEL_25;
      }
      goto LABEL_22;
    }
    if (mSelector != 1633903475)
    {
      if (mSelector != 1634689389)
      {
        int v19 = 1634690413;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
LABEL_22:
    unsigned int v17 = 8;
    goto LABEL_26;
  }
  if (mSelector <= 1684107363)
  {
    if (mSelector != 1635153007)
    {
      if (mSelector == 1668641652)
      {
        unsigned int v17 = 12 * self->mCustomPropertyInfoListEntries;
        goto LABEL_26;
      }
      if (mSelector != 1684105587) {
        goto LABEL_29;
      }
    }
    goto LABEL_22;
  }
  if (mSelector > 1685087595)
  {
    if (mSelector != 1685087596)
    {
      int v19 = 1685287012;
LABEL_25:
      if (mSelector == v19) {
        goto LABEL_26;
      }
LABEL_29:
      v21.receiver = self;
      v21.super_class = (Class)AppleAOPAudioDevice;
      unsigned int v17 = [(AppleAOPAudioDevice *)&v21 dataSizeForProperty:a3 withQualifierSize:v6 andQualifierData:a5];
    }
  }
  else if (mSelector != 1684107364)
  {
    int v19 = 1684893796;
    goto LABEL_25;
  }
LABEL_26:
  sub_AE2C(&ptr);
  return v17;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(const void *)a7 forClient:(int)a8
{
  return [(AppleAOPAudioDevice *)self tryGetProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
}

- (BOOL)tryGetProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v12 = *(void *)&a4;
  ptr = self->mStateMutexPtr.__ptr_;
  char v45 = (*(uint64_t (**)(CAMutex *, SEL))(*(void *)ptr + 16))(ptr, a2);
  BOOL v15 = 1;
  if (!a3 || !a6 || !a7) {
    goto LABEL_54;
  }
  int v43 = 0;
  signed int mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1635153006)
  {
    if (mSelector > 1684107363)
    {
      if (mSelector > 1685087595)
      {
        if (mSelector != 1685087596)
        {
          if (mSelector != 1685287012) {
            goto LABEL_53;
          }
          *a6 = 4;
          *(_DWORD *)a7 = 1;
          goto LABEL_54;
        }
        *a6 = 4;
        unsigned int mPastDataListeningEnabled = self->mPastDataListeningEnabled;
      }
      else
      {
        if (mSelector == 1684107364)
        {
          *a6 = 4;
          unsigned int IsVoiceTriggerSupported = [(AppleAOPAudioDevice *)self readAvailablePastData];
          goto LABEL_34;
        }
        if (mSelector != 1684893796) {
          goto LABEL_53;
        }
        *a6 = 4;
        unsigned __int16 v18 = self->mAOPAudioHWManagerPtr.__ptr_;
        unsigned int v19 = *((_DWORD *)v18 + 16);
        unsigned int mPastDataListeningEnabled = v19
                                  / [(AppleAOPAudioStream *)self->_halInputAudioStream getBytesPerPacket]- *((_DWORD *)v18 + 17);
      }
LABEL_47:
      *(_DWORD *)a7 = mPastDataListeningEnabled;
      goto LABEL_54;
    }
    if (mSelector == 1635153007)
    {
      if (!AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_)) {
        goto LABEL_54;
      }
      *a6 = 8;
      v37 = [(AppleAOPAudioDevice *)self voiceTriggerGetData];
      goto LABEL_41;
    }
    if (mSelector == 1668641652)
    {
      unsigned int v38 = [(AppleAOPAudioDevice *)self getNumCustomProperties];
      if (v38)
      {
        uint64_t v39 = 0;
        unsigned int v40 = 0;
        do
        {
          v40 += [(AppleAOPAudioDevice *)self getCustomPropertyInfoByIndex:v39 forCustPropInfo:(char *)a7 + 12 * v40];
          uint64_t v39 = (v39 + 1);
        }
        while (v38 != v39);
      }
      *a6 = 12 * v38;
      BOOL v15 = 1;
      goto LABEL_54;
    }
    if (mSelector != 1684105587) {
      goto LABEL_53;
    }
    *a6 = 8;
    p_mIOStatus = &self->mIOStatus;
    goto LABEL_36;
  }
  if (mSelector <= 1634692198)
  {
    if (mSelector != 1633903475)
    {
      if (mSelector == 1634689389)
      {
        *a6 = 4;
        if (!self->mChannelEnableMaskAvailable) {
          goto LABEL_48;
        }
        BOOL ControlValue = AOPAudioDeviceHWManager::HW_AudioGetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 1, &v43);
      }
      else
      {
        if (mSelector != 1634690413) {
          goto LABEL_53;
        }
        *a6 = 4;
        if (!self->mChannelEnableMaskAvailable) {
          goto LABEL_48;
        }
        BOOL ControlValue = AOPAudioDeviceHWManager::HW_AudioGetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 0, &v43);
      }
      if (ControlValue)
      {
        unsigned int mPastDataListeningEnabled = v43;
        goto LABEL_47;
      }
LABEL_48:
      BOOL v15 = 0;
      goto LABEL_54;
    }
    *a6 = 8;
    p_mIOStatus = (__AuxiliaryIOStatus *)@"com.apple.private.audio.hal.aop-audio.user-access";
LABEL_36:
    *(void *)a7 = p_mIOStatus;
    goto LABEL_54;
  }
  if (mSelector > 1635152994)
  {
    if (mSelector != 1635152995)
    {
      if (mSelector != 1635152997) {
        goto LABEL_53;
      }
      if (AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_))
      {
        unsigned int IsVoiceTriggerSupported = AOPAudioDeviceHWManager::HW_VoiceTriggerGetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 0, v23, v24, v25, v26, v27, v28);
        goto LABEL_28;
      }
      goto LABEL_54;
    }
    if (!AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_)) {
      goto LABEL_54;
    }
    *a6 = 8;
    v37 = [(AppleAOPAudioDevice *)self voiceTriggerGetConfigureDataId];
LABEL_41:
    *(void *)a7 = v37;
    goto LABEL_54;
  }
  if (mSelector != 1634692199)
  {
    if (mSelector == 1635152993)
    {
      unsigned int IsVoiceTriggerSupported = AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_);
LABEL_28:
      *a6 = 4;
LABEL_34:
      *(_DWORD *)a7 = IsVoiceTriggerSupported;
      goto LABEL_54;
    }
LABEL_53:
    v42.receiver = self;
    v42.super_class = (Class)AppleAOPAudioDevice;
    BOOL v15 = [(AppleAOPAudioDevice *)&v42 getProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:a6 andData:a7 forClient:v8];
    goto LABEL_54;
  }
  *a6 = 4;
  BOOL IsListeningOnGestureEnabled = AOPAudioDeviceHWManager::HW_IsListeningOnGestureEnabled(self->mAOPAudioHWManagerPtr.__ptr_);
  *(_DWORD *)a7 = IsListeningOnGestureEnabled;
  sub_7794((BorealisOwlLog *)"getProperty(kAOPAudioDevicePropertyEnableListeningOnGesture) is %d\n", v30, v31, v32, v33, v34, v35, v36, IsListeningOnGestureEnabled);
LABEL_54:
  sub_AE2C(&ptr);
  return v15;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  return [(AppleAOPAudioDevice *)self trySetProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:*(void *)&a6 andData:a7 forClient:*(void *)&a8];
}

- (BOOL)trySetProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  ptr = self->mStateMutexPtr.__ptr_;
  char v99 = (*(uint64_t (**)(CAMutex *, SEL))(*(void *)ptr + 16))(ptr, a2);
  if (!a3
    || ![(AppleAOPAudioDevice *)self hasProperty:a3]
    || ![(AppleAOPAudioDevice *)self isPropertySettable:a3])
  {
    goto LABEL_40;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1635152994)
  {
    switch(mSelector)
    {
      case 0x61767463u:
        BOOL v43 = !AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_);
        if (v10 != 8) {
          LOBYTE(v43) = 1;
        }
        if (!v43)
        {
          unsigned int v44 = *(const void **)a7;
          if (!v44)
          {
            BOOL v67 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v67) {
              sub_18F40(v67, v68, v69, v70, v71, v72, v73, v74);
            }
            exception = __cxa_allocate_exception(0x10uLL);
            *(void *)exception = off_24B68;
            exception[2] = 560947818;
          }
          CFRetain(v44);
          v97[0] = _NSConcreteStackBlock;
          v97[1] = 3221225472;
          v97[2] = sub_8A70;
          v97[3] = &unk_24960;
          v97[4] = self;
          v97[5] = v44;
          [(AppleAOPAudioDevice *)self requestConfigurationChange:v97];
        }
        goto LABEL_40;
      case 0x61767465u:
        BOOL v56 = !AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(self->mAOPAudioHWManagerPtr.__ptr_);
        if (v10 != 4) {
          LOBYTE(v56) = 1;
        }
        if (!v56)
        {
          unsigned int v57 = *(_DWORD *)a7;
          AOPAudioDeviceHWManager::HW_VoiceTriggerSetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 0, v57);
          sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverVoiceTriggerEnable) new value: %d\n", v58, v59, v60, v61, v62, v63, v64, v57);
          int v101 = 0;
          *(void *)v100 = *(void *)"etvabolg";
          v65 = [(AppleAOPAudioDevice *)self plugin];
          [v65 changedProperty:v100 forObject:self];
        }
        goto LABEL_40;
      case 0x6470656Cu:
        if (v10 == 4)
        {
          unsigned int v25 = *(_DWORD *)a7;
          [(AppleAOPAudioDevice *)self enableListening:0];
          if (v25) {
            [(AppleAOPAudioDevice *)self enableListening:1];
          }
          sub_7794((BorealisOwlLog *)"Device::setProperty(kAudioDevicePropertyEnableListening) new value: %d\n", v26, v27, v28, v29, v30, v31, v32, v25 != 0);
          int v101 = 0;
          *(void *)v100 = *(void *)"lepdbolg";
          uint64_t v33 = [(AppleAOPAudioDevice *)self plugin];
          [v33 changedProperty:v100 forObject:self];
        }
        goto LABEL_40;
    }
LABEL_26:
    v94.receiver = self;
    v94.super_class = (Class)AppleAOPAudioDevice;
    unsigned __int8 v45 = [(AppleAOPAudioDevice *)&v94 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
    goto LABEL_41;
  }
  if (mSelector == 1634689389)
  {
    if (self->mChannelEnableMaskAvailable)
    {
      if (v10 == 4)
      {
        unsigned int v34 = *(_DWORD *)a7;
        if (!v34)
        {
          BOOL v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v76) {
            sub_18FB8(v76, v77, v78, v79, v80, v81, v82, v83);
          }
          v84 = __cxa_allocate_exception(0x10uLL);
          *(void *)v84 = off_24B68;
          v84[2] = 1852797029;
        }
        AOPAudioDeviceHWManager::HW_AudioSetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 1u, v34);
        sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverActiveChannelMask) new value: %d\n", v35, v36, v37, v38, v39, v40, v41, v34);
        int v101 = 0;
        *(void *)v100 = *(void *)"maoabolg";
        objc_super v42 = [(AppleAOPAudioDevice *)self plugin];
        [v42 changedProperty:v100 forObject:self];
      }
      goto LABEL_40;
    }
LABEL_42:
    unsigned __int8 v45 = 0;
    goto LABEL_41;
  }
  if (mSelector != 1634690413)
  {
    if (mSelector == 1634692199)
    {
      if (v10 == 4)
      {
        BOOL v16 = *(_DWORD *)a7 != 0;
        AOPAudioDeviceHWManager::HW_AudioSetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 3u, v16);
        sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDevicePropertyEnableListeningOnGesture) new value: %d\n", v17, v18, v19, v20, v21, v22, v23, v16);
        int v101 = 0;
        *(void *)v100 = *(void *)"gloabolg";
        uint64_t v24 = [(AppleAOPAudioDevice *)self plugin];
        [v24 changedProperty:v100 forObject:self];
      }
      goto LABEL_40;
    }
    goto LABEL_26;
  }
  if (v10 != 4)
  {
LABEL_40:
    unsigned __int8 v45 = 1;
    goto LABEL_41;
  }
  unsigned int v46 = *(_DWORD *)a7;
  v100[0] = 0;
  if (!self->mChannelEnableMaskAvailable) {
    goto LABEL_42;
  }
  BOOL ControlValue = AOPAudioDeviceHWManager::HW_AudioGetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 0, v100);
  if (!v46)
  {
    BOOL v85 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v85) {
      sub_18F7C(v85, v86, v87, v88, v89, v90, v91, v92);
    }
    v93 = __cxa_allocate_exception(0x10uLL);
    *(void *)v93 = off_24B68;
    v93[2] = 1852797029;
  }
  if (v100[0] == v46 || !ControlValue) {
    goto LABEL_40;
  }
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_8D78;
  v95[3] = &unk_24988;
  v95[4] = self;
  unsigned int v96 = v46;
  [(AppleAOPAudioDevice *)self requestConfigurationChange:v95];
  AOPAudioDeviceHWManager::HW_AudioGetControlValue(self->mAOPAudioHWManagerPtr.__ptr_, 0, v100);
  unsigned __int8 v45 = v100[0] == v46;
  if (v100[0] != v46) {
    sub_7364((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverEnabledChannelMask) failed to set mask to 0x%x, read back 0x%x\n", v49, v50, v51, v52, v53, v54, v55, v46);
  }
LABEL_41:
  sub_AE2C(&ptr);
  return v45;
}

- (unsigned)getIOKitObject
{
  return BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)self->mAOPAudioHWManagerPtr.__ptr_ + 8));
}

- (void)notifyDevicePropertiesChanged
{
  LODWORD(v5) = 0;
  v3 = [(AppleAOPAudioDevice *)self plugin];
  [v3 changedProperty:&v4 forObject:self];
}

- (void)addVoiceTriggerService:(BorealisOwl_IOKitObject *)a3
{
  AOPAudioDeviceHWManager::HW_AddVoiceTriggerSupport(self->mAOPAudioHWManagerPtr.__ptr_, a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (int)performStartIO
{
  return [(AppleAOPAudioDevice *)self tryPerformStartIO];
}

- (int)tryPerformStartIO
{
  kdebug_trace();
  ptr = self->mStateMutexPtr.__ptr_;
  char v24 = (*(uint64_t (**)(CAMutex *))(*(void *)ptr + 16))(ptr);
  if (!self->mStartCount)
  {
    AOPAudioDeviceHWManager::HW_StatusReset(self->mAOPAudioHWManagerPtr.__ptr_);
    uint64_t v3 = self->mAOPAudioHWManagerPtr.__ptr_;
    long long v21 = *(_OWORD *)((char *)v3 + 56);
    uint64_t v22 = *((void *)v3 + 9);
    unsigned int v4 = [(AppleAOPAudioStream *)self->_halInputAudioStream getBytesPerPacket];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_94F0;
    v16[3] = &unk_249A8;
    v16[4] = &self->mIOMutexPtr;
    v16[5] = &self->mAOPAudioHWManagerPtr;
    long long v17 = v21;
    unsigned int v20 = v4;
    uint64_t v18 = v22;
    p_mIOStatus = &self->mIOStatus;
    [(AppleAOPAudioDevice *)self setGetZeroTimestampBlock:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_95F0;
    v14[3] = &unk_249C8;
    unsigned __int8 v15 = [(AppleAOPAudioDevice *)self hasInput];
    [(AppleAOPAudioDevice *)self setWillDoReadInputBlock:v14];
    unsigned int v5 = [(AppleAOPAudioStream *)self->_halInputAudioStream getBytesPerPacket];
    unsigned int v6 = [(AppleAOPAudioStream *)self->_halInputAudioStream getBytesPerSample];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_960C;
    v10[3] = &unk_249E8;
    unsigned int v11 = v5;
    unsigned int v12 = v6;
    v10[4] = self;
    v10[5] = &self->mAOPAudioHWManagerPtr;
    v10[6] = &self->mIOMutexPtr;
    BOOL InputDataBufferNull = ForceReadInputDataBufferNull();
    [(AppleAOPAudioStream *)self->_halInputAudioStream setReadInputBlock:v10];
  }
  [(AppleAOPAudioDevice *)self startInput:1];
  v9.receiver = self;
  v9.super_class = (Class)AppleAOPAudioDevice;
  int v7 = [(AppleAOPAudioDevice *)&v9 performStartIO];
  kdebug_trace();
  sub_AE2C(&ptr);
  return v7;
}

- (int)performStopIO
{
  return [(AppleAOPAudioDevice *)self tryPerformStopIO];
}

- (int)tryPerformStopIO
{
  kdebug_trace();
  ptr = self->mStateMutexPtr.__ptr_;
  char v18 = (*(uint64_t (**)(CAMutex *))(*(void *)ptr + 16))(ptr);
  v16.receiver = self;
  v16.super_class = (Class)AppleAOPAudioDevice;
  int v3 = [(AppleAOPAudioDevice *)&v16 performStopIO];
  [(AppleAOPAudioDevice *)self startInput:0];
  if (!self->mStartCount)
  {
    [(AppleAOPAudioDevice *)self setGetZeroTimestampBlock:0];
    [(AppleAOPAudioDevice *)self setWillDoReadInputBlock:0];
    [(AppleAOPAudioStream *)self->_halInputAudioStream setReadInputBlock:0];
    unsigned int v11 = self->mAOPAudioHWManagerPtr.__ptr_;
    unint64_t v12 = *((void *)v11 + 31);
    if (v12 && v12 <= 100 * (v12 - *((void *)v11 + 32)))
    {
      sub_9CC4((BorealisOwlLog *)"Detected %lld/%lld zero checksums during I/O session\n", v4, v5, v6, v7, v8, v9, v10, v12 - *((unsigned char *)v11 + 256));
      unsigned int v11 = self->mAOPAudioHWManagerPtr.__ptr_;
    }
    uint64_t v13 = *((void *)v11 + 37) - *((void *)v11 + 38);
    if (v13)
    {
      sub_7364((BorealisOwlLog *)"Detected %lld/%lld read attempts > ring buffer end bounds during I/O session\n", v4, v5, v6, v7, v8, v9, v10, v13);
      unsigned int v11 = self->mAOPAudioHWManagerPtr.__ptr_;
    }
    uint64_t v14 = *((void *)v11 + 43) - *((void *)v11 + 44);
    if (v14) {
      sub_7364((BorealisOwlLog *)"Detected %lld/%lld read attempts < ring buffer start bounds during I/O session\n", v4, v5, v6, v7, v8, v9, v10, v14);
    }
  }
  kdebug_trace();
  sub_AE2C(&ptr);
  return v3;
}

- (void)startInput:(BOOL)a3
{
  unsigned int mStartCount = self->mStartCount;
  if (a3)
  {
    if (!mStartCount)
    {
      if (self->mMeasureTrigToIOStartDelta)
      {
        self->mMeasureTrigToIOStartDelta = 0;
        double v10 = (double)(clock() - self->mLastVoiceTrigEventTime) * 0.00100000005;
        double v40 = v10;
        sub_7794((BorealisOwlLog *)"Audio Plugin: Voice Trigger to IO start = %lf ms", v11, v12, v13, v14, v15, v16, v17, SLOBYTE(v40));
        if (v10 > 200.0) {
          sub_9CC4((BorealisOwlLog *)"Audio Plugin: Voice Trigger to IO start = %lf ms exceeds theshold of %d ms", v18, v19, v20, v21, v22, v23, v24, SLOBYTE(v10));
        }
      }
      AOPAudioDeviceHWManager::HW_StartIO(self->mAOPAudioHWManagerPtr.__ptr_);
      sub_7794((BorealisOwlLog *)"Device::startInput ,HW_StartIO(), inStart=%d, mStartCount=%d ", v25, v26, v27, v28, v29, v30, v31, 1);
      unsigned int mStartCount = self->mStartCount;
    }
    self->unsigned int mStartCount = mStartCount + 1;
  }
  else if (mStartCount)
  {
    unsigned int v32 = mStartCount - 1;
    self->unsigned int mStartCount = v32;
    if (!v32)
    {
      AOPAudioDeviceHWManager::HW_StopIO(self->mAOPAudioHWManagerPtr.__ptr_);
      sub_7794((BorealisOwlLog *)"Device::startInput ,HW_StopIO(), inStart=%d, mStartCount=%d ", v33, v34, v35, v36, v37, v38, v39, 0);
    }
  }
  else
  {
    sub_7364((BorealisOwlLog *)"Device::startInput , Unmatched call to stop input, inStart=%d, mStartCount=%d ", (uint64_t)a2, a3, v3, v4, v5, v6, v7, 0);
  }
}

- (void)enableListening:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  if (self->mPastDataListeningEnabled || !v3)
  {
    if (self->mPastDataListeningEnabled && !v3)
    {
      AOPAudioDeviceHWManager::HW_DisableListening(self->mAOPAudioHWManagerPtr.__ptr_);
      sub_7794((BorealisOwlLog *)"Device::enableListening, inEanble=%d, HW_DisableListening()", v6, v7, v8, v9, v10, v11, v12, 0);
    }
  }
  else
  {
    AOPAudioDeviceHWManager::HW_EnableListening(self->mAOPAudioHWManagerPtr.__ptr_);
    sub_7794((BorealisOwlLog *)"Device::enableListening, inEanble=%d, HW_EnableListening()", v13, v14, v15, v16, v17, v18, v19, 1);
  }
  self->unsigned int mPastDataListeningEnabled = v3;

  kdebug_trace();
}

- (__CFDictionary)voiceTriggerGetData
{
  unint64_t v24 = 0;
  p_mAOPAudioHWManagerPtr = &self->mAOPAudioHWManagerPtr;
  AOPAudioDeviceHWManager::HW_GetVoiceTriggerData((uint64_t)self->mAOPAudioHWManagerPtr.__ptr_, &outputStruct);
  unint64_t v22 = 0;
  v23.var0 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  *(_WORD *)&v23.var1 = 256;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  AOPAudioDeviceHWManager::HW_ReadIOTimeStampStatusBuffer(p_mAOPAudioHWManagerPtr->__ptr_, &v22, &v24, &v21, &v20);
  v26 -= v24;
  CACFDictionary::AddUInt64(&v23, @"trigger-time", outputStruct);
  CACFDictionary::AddUInt64(&v23, @"trigger-sample-frame-time", v26);
  CACFDictionary::AddUInt32(&v23, @"trigger-length", v27);
  CACFDictionary::AddUInt32(&v23, @"trigger-type", 0);
  CACFDictionary::AddUInt32(&v23, @"trigger-woke-ap", v28 == 1651470949);
  sub_7794((BorealisOwlLog *)"AudioDevice::voiceTriggerGetData() data: {ts %lld, st %llu, cnt %u, woke %d}, st delta %lld\n", v3, v4, v5, v6, v7, v8, v9, outputStruct);
  CFDataRef v17 = CFDataCreate(kCFAllocatorDefault, length_4, length);
  if (v17)
  {
    CACFDictionary::AddData(&v23, @"trigger-config-blob", v17);
    CFRelease(v17);
  }
  else
  {
    sub_7364((BorealisOwlLog *)"Device::voiceTriggerGetData failed to allocate CFDataRef for the VT config blob {%p, %u bytes}\n", v10, v11, v12, v13, v14, v15, v16, (char)length_4);
  }
  var0 = v23.var0;
  sub_4A8C((uint64_t)&v23);
  return var0;
}

- (__CFDictionary)voiceTriggerGetConfigureDataId
{
  CFStringRef VoiceTriggerConfiguration = (const __CFString *)AOPAudioDeviceHWManager::HW_GetVoiceTriggerConfiguration(self->mAOPAudioHWManagerPtr.__ptr_);
  v5.var0 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  *(_WORD *)&v5.var1 = 256;
  CACFDictionary::AddString(&v5, @"CorealisRTModelVersion", VoiceTriggerConfiguration);
  CFRelease(VoiceTriggerConfiguration);
  var0 = v5.var0;
  sub_4A8C((uint64_t)&v5);
  return var0;
}

- (unsigned)readAvailablePastData
{
  ptr = self->mIOMutexPtr.__ptr_;
  char v14 = (*(uint64_t (**)(CAMutex *, SEL))(*(void *)ptr + 16))(ptr, a2);
  if (self->mStartCount || self->mPastDataListeningEnabled)
  {
    uint64_t v3 = self->mAOPAudioHWManagerPtr.__ptr_;
    unsigned int v4 = *((_DWORD *)v3 + 16);
    unsigned int v5 = [(AppleAOPAudioStream *)self->_halInputAudioStream getBytesPerPacket];
    int v6 = *((_DWORD *)v3 + 17);
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    AOPAudioDeviceHWManager::HW_ReadIOTimeStampStatusBuffer(self->mAOPAudioHWManagerPtr.__ptr_, &v12, &v11, &v10, &v9);
    if (v10 - v12 >= v4 / v5 - v6) {
      unsigned int v7 = v4 / v5 - v6;
    }
    else {
      unsigned int v7 = v10 - v12;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  sub_AE2C(&ptr);
  return v7;
}

- (void)updateStreamDescription
{
  uint64_t BytesPerSample = AOPAudioDeviceHWManager::HW_GetBytesPerSample(self->mAOPAudioHWManagerPtr.__ptr_);
  [(AppleAOPAudioStream *)self->_halInputAudioStream setBytesPerSample:BytesPerSample];
  [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat setBytesPerSample:BytesPerSample];
  uint64_t ChannelsPerFrame = AOPAudioDeviceHWManager::HW_GetChannelsPerFrame(self->mAOPAudioHWManagerPtr.__ptr_);
  [(AppleAOPAudioStream *)self->_halInputAudioStream setChannelsPerFrame:ChannelsPerFrame];
  [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat setChannelsPerFrame:ChannelsPerFrame];
  uint64_t FramesPerPacket = AOPAudioDeviceHWManager::HW_GetFramesPerPacket(self->mAOPAudioHWManagerPtr.__ptr_);
  [(AppleAOPAudioStream *)self->_halInputAudioStream setFramesPerPacket:FramesPerPacket];
  [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat setFramesPerPacket:FramesPerPacket];
  [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat setSampleRateHz:(double)AOPAudioDeviceHWManager::HW_GetInputSamplesPerSec(self->mAOPAudioHWManagerPtr.__ptr_)];
  LOBYTE(FramesPerPacket) = [(AppleAOPAudioStream *)self->_halInputAudioStream getBytesPerSample];
  [(AppleAOPAudioStream *)self->_halInputAudioStream getChannelsPerFrame];
  [(AppleAOPAudioStream *)self->_halInputAudioStream getFramesPerPacket];
  [(AppleAOPAudioStream *)self->_halInputAudioStream getSampleRateHz];
  sub_7794((BorealisOwlLog *)"Device::updateStreamDescription() stream desc: { %d bytes/sample, %d channels/frame, %d frames/packet, %f samples/sec }\n", v6, v7, v8, v9, v10, v11, v12, FramesPerPacket);
  LOBYTE(FramesPerPacket) = [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat getBytesPerSample];
  [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat getChannelsPerFrame];
  [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat getFramesPerPacket];
  [(AppleAOPAudioStream *)self->_driverInputAudioStreamFormat getSampleRateHz];
  sub_7794((BorealisOwlLog *)"Device::updateStreamDescription() input stream desc: { %d bytes/sample, %d channels/frame, %d frames/packet, %f samples/sec }\n", v13, v14, v15, v16, v17, v18, v19, FramesPerPacket);
}

- (basic_string<char,)getDiagonsticData
{
  uint64_t v2 = v1;
  sub_AA0C((uint64_t)v56);
  sub_B390(v56, (uint64_t)"AppleAOPAudioDevice[", 20);
  uint64_t v3 = (void *)std::ostream::operator<<();
  sub_B390(v3, (uint64_t)"] = \n", 5);
  unsigned int v4 = sub_B390(v56, (uint64_t)"DeviceName:                             ", 40);
  id v5 = [(id)v2 deviceName];
  uint64_t v6 = (const char *)[v5 UTF8String];
  size_t v7 = strlen(v6);
  uint64_t v8 = sub_B390(v4, (uint64_t)v6, v7);
  sub_B390(v8, (uint64_t)"\n", 1);

  uint64_t v9 = sub_B390(v56, (uint64_t)"DeviceUID:                              ", 40);
  id v10 = [(id)v2 deviceUID];
  uint64_t v11 = (const char *)[v10 UTF8String];
  size_t v12 = strlen(v11);
  uint64_t v13 = sub_B390(v9, (uint64_t)v11, v12);
  sub_B390(v13, (uint64_t)"\n", 1);

  uint64_t v14 = sub_B390(v56, (uint64_t)"ModelUID:                               ", 40);
  id v15 = [(id)v2 modelUID];
  uint64_t v16 = (const char *)[v15 UTF8String];
  size_t v17 = strlen(v16);
  uint64_t v18 = sub_B390(v14, (uint64_t)v16, v17);
  sub_B390(v18, (uint64_t)"\n", 1);

  uint64_t v19 = sub_B390(v56, (uint64_t)"ManufacturerName:                       ", 40);
  id v20 = [(id)v2 manufacturerName];
  unint64_t v21 = (const char *)[v20 UTF8String];
  size_t v22 = strlen(v21);
  CACFDictionary v23 = sub_B390(v19, (uint64_t)v21, v22);
  sub_B390(v23, (uint64_t)"\n", 1);

  unint64_t v24 = sub_B390(v56, (uint64_t)"ModelName:                              ", 40);
  id v25 = [(id)v2 modelName];
  unint64_t v26 = (const char *)[v25 UTF8String];
  size_t v27 = strlen(v26);
  int v28 = sub_B390(v24, (uint64_t)v26, v27);
  sub_B390(v28, (uint64_t)"\n", 1);

  sub_B390(v56, (uint64_t)"StartCount:                             ", 40);
  [(id)v2 getStartCount];
  uint64_t v29 = (void *)std::ostream::operator<<();
  sub_B390(v29, (uint64_t)"\n", 1);
  uint64_t v30 = sub_B390(v56, (uint64_t)"HALsAudioStreamDescription:           \n", 39);
  uint64_t v31 = *(void **)(v2 + 8);
  if (v31)
  {
    [v31 dumpToString];
    unsigned int v32 = HIBYTE(v55);
    uint64_t v33 = (void **)__p;
    uint64_t v34 = v54;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v33 = 0;
    unsigned int v32 = 0;
    __p = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
  }
  if ((v32 & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = v33;
  }
  if ((v32 & 0x80u) == 0) {
    uint64_t v36 = v32;
  }
  else {
    uint64_t v36 = v34;
  }
  uint64_t v37 = sub_B390(v30, (uint64_t)p_p, v36);
  sub_B390(v37, (uint64_t)"\n", 1);
  if (SHIBYTE(v55) < 0) {
    operator delete(__p);
  }
  uint64_t v38 = sub_B390(v56, (uint64_t)"AOPInputAudioStreamDescription:       \n", 39);
  uint64_t v39 = *(void **)(v2 + 16);
  if (v39)
  {
    [v39 dumpToString];
    unsigned int v40 = HIBYTE(v55);
    uint64_t v41 = (void **)__p;
    uint64_t v42 = v54;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v41 = 0;
    unsigned int v40 = 0;
    __p = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
  }
  if ((v40 & 0x80u) == 0) {
    BOOL v43 = &__p;
  }
  else {
    BOOL v43 = v41;
  }
  if ((v40 & 0x80u) == 0) {
    uint64_t v44 = v40;
  }
  else {
    uint64_t v44 = v42;
  }
  unsigned __int8 v45 = sub_B390(v38, (uint64_t)v43, v44);
  sub_B390(v45, (uint64_t)"\n", 1);
  if (SHIBYTE(v55) < 0) {
    operator delete(__p);
  }
  sub_B390(v56, (uint64_t)"HALsAudioStreamIsActive:                ", 40);
  [*(id *)(v2 + 8) isActive];
  unsigned int v46 = (void *)std::ostream::operator<<();
  sub_B390(v46, (uint64_t)"\n", 1);
  sub_B390(v56, (uint64_t)"PastDataListeningEnabled:               ", 40);
  v47 = (void *)std::ostream::operator<<();
  sub_B390(v47, (uint64_t)"\n", 1);
  v48 = sub_B390(v56, (uint64_t)"AuxIOStatus:                          \n", 39);
  uint64_t v49 = operator<<(v48);
  sub_B390(v49, (uint64_t)"\n", 1);
  AOPAudioDeviceHWManager::HW_DumpDriverState((uint64_t *)&__p, *(AOPAudioDeviceHWManager **)(v2 + 24));
  if (v55 >= 0) {
    uint64_t v50 = &__p;
  }
  else {
    uint64_t v50 = __p;
  }
  if (v55 >= 0) {
    uint64_t v51 = HIBYTE(v55);
  }
  else {
    uint64_t v51 = v54;
  }
  sub_B390(v56, (uint64_t)v50, v51);
  if (SHIBYTE(v55) < 0) {
    operator delete(__p);
  }
  std::stringbuf::str();
  if (v57 < 0) {
    operator delete((void *)v56[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::ios::~ios();
}

- (unsigned)getStartCount
{
  return self->mStartCount;
}

- (void)setLastVoiceTrigEventTime:(int64_t)a3
{
  self->mLastVoiceTrigEventTime = a3;
  self->mMeasureTrigToIOStartDelta = 1;
}

- (void).cxx_destruct
{
  cntrl = self->mIOMutexPtr.__cntrl_;
  if (cntrl) {
    sub_B110((std::__shared_weak_count *)cntrl);
  }
  unsigned int v4 = self->mStateMutexPtr.__cntrl_;
  if (v4) {
    sub_B110((std::__shared_weak_count *)v4);
  }
  id v5 = self->mAOPAudioHWManagerPtr.__cntrl_;
  if (v5) {
    sub_B110((std::__shared_weak_count *)v5);
  }
  objc_storeStrong((id *)&self->_driverInputAudioStreamFormat, 0);

  objc_storeStrong((id *)&self->_halInputAudioStream, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end