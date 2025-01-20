@interface MXExclaves
+ (id)sensorStatusToString:(unsigned int)a3;
+ (id)sharedInstance;
- (BOOL)shouldSendSensorStatusStatistics:(unsigned int)a3 newStatus:(unsigned int)a4;
- (MXExclaves)init;
- (int)updateSensorStatus:(id)a3 reason:(id)a4;
- (unsigned)getSensorAccessCount;
- (void)dealloc;
- (void)handleSensorStatusChanged;
- (void)logDebugInfo;
- (void)reportExclavesSensorStatusStatistics:(unint64_t)a3 currentStatus:(unsigned int)a4;
- (void)resetClientsStillUsingExclavesSensor;
- (void)updateSessionTimestampFromSensorStart:(unint64_t)a3;
@end

@implementation MXExclaves

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_25);
  }
  return (id)sharedInstance_sSharedInstance_4;
}

MXExclaves *__28__MXExclaves_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXExclaves);
  sharedInstance_sSharedInstance_4 = (uint64_t)result;
  return result;
}

+ (id)sensorStatusToString:(unsigned int)a3
{
  if (a3 - 1 >= 4) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%d)", *(void *)&a3);
  }
  else {
    return off_1E57C97A8[a3 - 1];
  }
}

- (MXExclaves)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MXExclaves;
  v2 = [(MXExclaves *)&v5 init];
  if (v2)
  {
    if (!CMSMDeviceState_DeviceHasExclaveCapability()) {
      goto LABEL_5;
    }
    if (exclaves_sensor_create())
    {
      if (!dword_1E9359ED0)
      {
LABEL_8:

        return 0;
      }
LABEL_5:
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_8;
    }
    v2->mSensorAccessCount = 0;
    v2->mSensorPortLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->mSensorStatus = 2;
    v2->mClientsUsingSensorToRecord = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    vaeAddExclavesStatusChangedNotificationListener();
  }
  return v2;
}

- (void)dealloc
{
  mach_port_deallocate(*MEMORY[0x1E4F14960], self->mSensorPort);

  self->mSensorPortLock = 0;
  self->mClientsUsingSensorToRecord = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXExclaves;
  [(MXExclaves *)&v3 dealloc];
}

- (int)updateSensorStatus:(id)a3 reason:(id)a4
{
  v32[24] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v29 = 0;
    if ([a3 isTheAssistant]
      && [a3 isUsingBuiltInMicForRecording])
    {
      p_mSensorPortLock = &self->mSensorPortLock;
      [(NSLock *)self->mSensorPortLock lock];
      goto LABEL_13;
    }
    if ([a3 isRecording] && !objc_msgSend(a3, "isRecordingMuted"))
    {
      BOOL v9 = [+[MXSessionManager sharedInstance] isSessionUsingBuiltInMic:a3];
      p_mSensorPortLock = &self->mSensorPortLock;
      [(NSLock *)self->mSensorPortLock lock];
      if (v9)
      {
LABEL_13:
        if (([a3 isUsingExclaveSensor] & 1) == 0)
        {
          if (exclaves_sensor_start()) {
            goto LABEL_10;
          }
          ++self->mSensorAccessCount;
          [a3 setIsUsingExclaveSensor:1];
          if (dword_1E9359ED0)
          {
            *(_DWORD *)v28 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          mClientsUsingSensorToRecord = self->mClientsUsingSensorToRecord;
          uint64_t v31 = objc_msgSend(a3, "displayID", v21, v22);
          v32[0] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:mach_absolute_time()];
          -[NSMutableArray addObject:](mClientsUsingSensorToRecord, "addObject:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1]);
        }
        goto LABEL_32;
      }
    }
    else
    {
      p_mSensorPortLock = &self->mSensorPortLock;
      [(NSLock *)self->mSensorPortLock lock];
    }
    if ([a3 isUsingExclaveSensor])
    {
      if (exclaves_sensor_stop())
      {
LABEL_10:
        *(_DWORD *)v28 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v11 = -15685;
LABEL_33:
        [(NSLock *)*p_mSensorPortLock unlock];
        return v11;
      }
      --self->mSensorAccessCount;
      [a3 setIsUsingExclaveSensor:0];
      if (dword_1E9359ED0)
      {
        *(_DWORD *)v28 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v13 = (void *)[(NSMutableArray *)self->mClientsUsingSensorToRecord copy];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v18, "allKeys"), "containsObject:", objc_msgSend(a3, "displayID")))
            {
              [(NSMutableArray *)self->mClientsUsingSensorToRecord removeObject:v18];
              goto LABEL_30;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v30 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_30:
    }
LABEL_32:
    int v11 = 0;
    goto LABEL_33;
  }
  v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return -12981;
}

- (void)logDebugInfo
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->mSensorPortLock lock];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (exclaves_sensor_status() || dword_1E9359ED0)
  {
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359ED0)
    {
      objc_super v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1E9359ED0)
      {
        uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  [(NSLock *)self->mSensorPortLock unlock];
}

- (unsigned)getSensorAccessCount
{
  [(NSLock *)self->mSensorPortLock lock];
  unsigned int mSensorAccessCount = self->mSensorAccessCount;
  [(NSLock *)self->mSensorPortLock unlock];
  return mSensorAccessCount;
}

- (void)handleSensorStatusChanged
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)vaeCopyExclavesSensorStatusInfo();
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateFormat:@"YYYY.MM.dd HH:mm:ss:ms"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v19 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v19)
  {
    uint64_t v5 = *(void *)v21;
    unint64_t v6 = 0x1E4F1C000uLL;
    id v16 = v4;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"machAbsoluteTime"), "unsignedLongLongValue");
        objc_msgSend(v4, "stringFromDate:", objc_msgSend(*(id *)(v6 + 2504), "dateWithTimeIntervalSinceReferenceDate:", (double)v9));
        uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"statusRawValue"), "intValue");
        if (objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"operation"), "unsignedLongLongValue") == 1) {
          [(MXExclaves *)self updateSessionTimestampFromSensorStart:v9];
        }
        uint64_t mSensorStatus = self->mSensorStatus;
        if (mSensorStatus != v10)
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t mSensorStatus = self->mSensorStatus;
            id v4 = v16;
            uint64_t v5 = v17;
            unint64_t v6 = 0x1E4F1C000;
          }
          if (-[MXExclaves shouldSendSensorStatusStatistics:newStatus:](self, "shouldSendSensorStatusStatistics:newStatus:", mSensorStatus, v10, v14, v15))
          {
            [(MXExclaves *)self reportExclavesSensorStatusStatistics:v9 currentStatus:self->mSensorStatus];
          }
          unsigned int v13 = self->mSensorStatus;
          if (v13 == 3 && v10 == 1)
          {
            if ([(MXExclaves *)self getSensorAccessCount]) {
              [+[MXSystemSoundServices sharedInstance] playPrivacyPongSound];
            }
            unsigned int v13 = self->mSensorStatus;
          }
          if (v13 == 1) {
            [(MXExclaves *)self resetClientsStillUsingExclavesSensor];
          }
          self->uint64_t mSensorStatus = v10;
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v19);
  }
}

- (void)reportExclavesSensorStatusStatistics:(unint64_t)a3 currentStatus:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = self->mClientsUsingSensorToRecord;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "allKeys"), "firstObject");
        uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "allValues"), "firstObject"), "longLongValue");
        uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3 - v12];
        id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v15 = kMXAudioStatistics_ExclavesRecordingClientBundleId;
        id v16 = +[MXExclaves sensorStatusToString:v4];
        uint64_t v17 = objc_msgSend(v14, "initWithObjectsAndKeys:", v11, v15, v16, kMXAudioStatistics_ExclavesSensorStatus, v13, kMXAudioStatistics_DurationInNanoSeconds, 0);
        if (dword_1E9359ED0)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        [+[MXAudioStatistics sharedInstance] sendSingleMessageWithDictionary:v17 eventCategory:2 eventType:18];
      }
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)updateSessionTimestampFromSensorStart:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->mClientsUsingSensorToRecord count])
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray firstObject](self->mClientsUsingSensorToRecord, "firstObject"), "allKeys"), "firstObject");
    mClientsUsingSensorToRecord = self->mClientsUsingSensorToRecord;
    uint64_t v8 = v6;
    v9[0] = v5;
    -[NSMutableArray replaceObjectAtIndex:withObject:](mClientsUsingSensorToRecord, "replaceObjectAtIndex:withObject:", 0, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1]);
  }
}

- (BOOL)shouldSendSensorStatusStatistics:(unsigned int)a3 newStatus:(unsigned int)a4
{
  return a3 - 2 < 3 && a4 == 1;
}

- (void)resetClientsStillUsingExclavesSensor
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->mClientsUsingSensorToRecord removeAllObjects];
  id v2 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isUsingExclaveSensor", v8, v9))
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          MXSimulateCrash((uint64_t)"Clients are still using exclaves sensor after switching to a non allowed sensor statu"
                                   "s. Please file a bug to MediaExperience (New Bugs) | All.");
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

@end