@interface AWAttentionAwarenessConfiguration
+ (AWNotification_s)notifySupportedEventsChangedWithQueue:(id)a3 block:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)supportedEventsString;
+ (unint64_t)supportedEvents;
+ (void)cancelNotification:(AWNotification_s *)a3;
+ (void)initialize;
- (AWAttentionAwarenessConfiguration)init;
- (AWAttentionAwarenessConfiguration)initWithCoder:(id)a3;
- (BOOL)activateAttentionDetection;
- (BOOL)activateEyeRelief;
- (BOOL)activateMotionDetect;
- (BOOL)continuousFaceDetectMode;
- (BOOL)nonSampledAttentionLostTimeoutEnable;
- (BOOL)pollingFilter;
- (BOOL)retroactiveTimeoutMode;
- (BOOL)sampleWhileAbsent;
- (BOOL)unityStream;
- (BOOL)validateWithError:(id *)a3;
- (NSCopying)tag;
- (NSDictionary)attentionLostTimeoutDictionary;
- (NSSet)attentionLostTimeouts;
- (NSSet)buttonDisplayUUIDs;
- (NSSet)digitizerDisplayUUIDs;
- (NSSet)keyboardDisplayUUIDs;
- (NSString)identifier;
- (double)nonSampledAttentionLostTimeout;
- (double)samplingDelay;
- (double)samplingInterval;
- (id)allowedHIDEventsForRemoteEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)attentionLostEventMask;
- (unint64_t)eventMask;
- (unint64_t)notificationMask;
- (unint64_t)tagIndex;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActivateAttentionDetection:(BOOL)a3;
- (void)setActivateEyeRelief:(BOOL)a3;
- (void)setActivateMotionDetect:(BOOL)a3;
- (void)setAllowedHIDEventsForRemoteEvent:(id)a3;
- (void)setAttentionLostEventMask:(unint64_t)a3;
- (void)setAttentionLostTimeout:(double)a3;
- (void)setAttentionLostTimeoutDictionary:(id)a3;
- (void)setAttentionLostTimeouts:(id)a3;
- (void)setButtonDisplayUUIDs:(id)a3;
- (void)setContinuousFaceDetectMode:(BOOL)a3;
- (void)setDigitizerDisplayUUIDs:(id)a3;
- (void)setEventMask:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyboardDisplayUUIDs:(id)a3;
- (void)setNonSampledAttentionLostTimeout:(double)a3;
- (void)setNonSampledAttentionLostTimeoutEnable:(BOOL)a3;
- (void)setNotificationMask:(unint64_t)a3;
- (void)setPollingFilter:(BOOL)a3;
- (void)setRetroactiveTimeoutMode:(BOOL)a3;
- (void)setSampleWhileAbsent:(BOOL)a3;
- (void)setSamplingDelay:(double)a3;
- (void)setSamplingInterval:(double)a3;
- (void)setTag:(id)a3;
- (void)setUnityStream:(BOOL)a3;
@end

@implementation AWAttentionAwarenessConfiguration

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setAttentionLostTimeout:(double)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [NSNumber numberWithDouble:a3];
  v5 = [v4 setWithObject:v6];
  [(AWAttentionAwarenessConfiguration *)self setAttentionLostTimeouts:v5];
}

- (void)setAttentionLostTimeouts:(id)a3
{
  v4 = (NSSet *)[a3 copy];
  attentionLostTimeouts = self->_attentionLostTimeouts;
  self->_attentionLostTimeouts = v4;

  attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
  self->_attentionLostTimeoutDictionary = 0;
}

- (void)dealloc
{
  if (self->_tag)
  {
    v3 = +[AWAttentionAwarenessClientConfig sharedClientConfig];
    [v3 decrementTagIndexRefCount:self->_tagIndex];
  }
  v4.receiver = self;
  v4.super_class = (Class)AWAttentionAwarenessConfiguration;
  [(AWAttentionAwarenessConfiguration *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[AWAttentionAwarenessConfiguration allocWithZone:](AWAttentionAwarenessConfiguration, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSCopying *)self->_tag copyWithZone:a3];
  tag = v5->_tag;
  v5->_tag = (NSCopying *)v8;

  v5->_notificationMask = self->_notificationMask;
  v5->_eventMask = self->_eventMask;
  v5->_attentionLostEventMask = self->_attentionLostEventMask;
  v5->_samplingInterval = self->_samplingInterval;
  v5->_samplingDelay = self->_samplingDelay;
  v5->_sampleWhileAbsent = self->_sampleWhileAbsent;
  v5->_retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
  v5->_pollingFilter = self->_pollingFilter;
  v5->_continuousFaceDetectMode = self->_continuousFaceDetectMode;
  v5->_activateEyeRelief = self->_activateEyeRelief;
  v5->_activateAttentionDetection = self->_activateAttentionDetection;
  v5->_activateMotionDetect = self->_activateMotionDetect;
  v5->_unityStream = self->_unityStream;
  uint64_t v10 = [(NSSet *)self->_attentionLostTimeouts copyWithZone:a3];
  attentionLostTimeouts = v5->_attentionLostTimeouts;
  v5->_attentionLostTimeouts = (NSSet *)v10;

  uint64_t v12 = [(NSDictionary *)self->_attentionLostTimeoutDictionary copyWithZone:a3];
  attentionLostTimeoutDictionary = v5->_attentionLostTimeoutDictionary;
  v5->_attentionLostTimeoutDictionary = (NSDictionary *)v12;

  v5->_tagIndex = self->_tagIndex;
  uint64_t v14 = [(NSSet *)self->_allowedHIDEventsForRemoteEvent copyWithZone:a3];
  allowedHIDEventsForRemoteEvent = v5->_allowedHIDEventsForRemoteEvent;
  v5->_allowedHIDEventsForRemoteEvent = (NSSet *)v14;

  uint64_t v16 = [(NSSet *)self->_digitizerDisplayUUIDs copyWithZone:a3];
  digitizerDisplayUUIDs = v5->_digitizerDisplayUUIDs;
  v5->_digitizerDisplayUUIDs = (NSSet *)v16;

  uint64_t v18 = [(NSSet *)self->_keyboardDisplayUUIDs copyWithZone:a3];
  keyboardDisplayUUIDs = v5->_keyboardDisplayUUIDs;
  v5->_keyboardDisplayUUIDs = (NSSet *)v18;

  uint64_t v20 = [(NSSet *)self->_buttonDisplayUUIDs copyWithZone:a3];
  buttonDisplayUUIDs = v5->_buttonDisplayUUIDs;
  v5->_buttonDisplayUUIDs = (NSSet *)v20;

  v5->_nonSampledAttentionLostTimeout = self->_nonSampledAttentionLostTimeout;
  v5->_nonSampledAttentionLostTimeoutEnable = self->_nonSampledAttentionLostTimeoutEnable;
  v22 = +[AWAttentionAwarenessClientConfig sharedClientConfig];
  [v22 incrementTagIndexRefCount:self->_tagIndex];

  return v5;
}

- (NSDictionary)attentionLostTimeoutDictionary
{
  v2 = (void *)[(NSDictionary *)self->_attentionLostTimeoutDictionary copy];

  return (NSDictionary *)v2;
}

- (AWAttentionAwarenessConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)AWAttentionAwarenessConfiguration;
  v2 = [(AWAttentionAwarenessConfiguration *)&v9 init];
  if (v2)
  {
    v3 = NSString;
    objc_super v4 = [MEMORY[0x1E4F28F80] processInfo];
    v5 = [v4 processName];
    uint64_t v6 = [v3 stringWithFormat:@"%@-%d", v5, atomic_fetch_add(init_configCount, 1u)];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v6;

    v2->_activateAttentionDetection = 1;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_keyboardDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_digitizerDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allowedHIDEventsForRemoteEvent, 0);
  objc_storeStrong((id *)&self->_attentionLostTimeoutDictionary, 0);

  objc_storeStrong((id *)&self->_attentionLostTimeouts, 0);
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
  if (!self->_attentionLostEventMaskExplicitlySet) {
    self->_attentionLostEventMask = a3;
  }
}

- (void)setIdentifier:(id)a3
{
  objc_super v4 = (NSString *)a3;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"attempt to set null identifier on %@", v8 format];
  }
  identifier = self->_identifier;
  self->_identifier = v4;
}

- (BOOL)validateWithError:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (self->_identifier && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      {
        unint64_t v30 = absTimeNS();
        if (v30 == -1) {
          double v31 = INFINITY;
        }
        else {
          double v31 = (double)v30 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v43 = v31;
        v32 = "%13.5f: Invalid Config: identifier must be a valid string";
        goto LABEL_68;
      }
LABEL_11:
    }
  }
  else if (self->_samplingInterval >= 0.0 && self->_samplingDelay >= 0.0)
  {
    if (self->_attentionLostTimeouts)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (currentLogLevel < 3) {
          goto LABEL_12;
        }
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        unint64_t v14 = absTimeNS();
        if (v14 == -1) {
          double v15 = INFINITY;
        }
        else {
          double v15 = (double)v14 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v43 = v15;
        v32 = "%13.5f: Invalid Config: attention lost timeouts must be a set of non-negative values";
        goto LABEL_68;
      }
    }
    if (self->_unityStream && !self->_continuousFaceDetectMode)
    {
      if (currentLogLevel < 3) {
        goto LABEL_12;
      }
      _AALog();
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      unint64_t v18 = absTimeNS();
      if (v18 == -1) {
        double v19 = INFINITY;
      }
      else {
        double v19 = (double)v18 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v43 = v19;
      v32 = "%13.5f: Invalid Config: Unity stream clients must set the continuousFaceDetectMode flag";
      goto LABEL_68;
    }
    if (self->_activateEyeRelief)
    {
      if (self->_activateMotionDetect)
      {
        if (currentLogLevel < 3) {
          goto LABEL_12;
        }
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        unint64_t v12 = absTimeNS();
        if (v12 == -1) {
          double v13 = INFINITY;
        }
        else {
          double v13 = (double)v12 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v43 = v13;
        v32 = "%13.5f: Invalid Config: EyeRelief and motion detection cannot be started at the same time";
        goto LABEL_68;
      }
      if (!self->_continuousFaceDetectMode)
      {
        if (currentLogLevel < 3) {
          goto LABEL_12;
        }
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        unint64_t v20 = absTimeNS();
        if (v20 == -1) {
          double v21 = INFINITY;
        }
        else {
          double v21 = (double)v20 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v43 = v21;
        v32 = "%13.5f: Invalid Config: EyeRelief can only be run in streaming mode";
        goto LABEL_68;
      }
    }
    else if (self->_continuousFaceDetectMode)
    {
      if (self->_activateMotionDetect)
      {
        if (currentLogLevel < 3) {
          goto LABEL_12;
        }
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        unint64_t v16 = absTimeNS();
        if (v16 == -1) {
          double v17 = INFINITY;
        }
        else {
          double v17 = (double)v16 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v43 = v17;
        v32 = "%13.5f: Invalid Config: Motion detection cannot be started in streaming mode";
        goto LABEL_68;
      }
    }
    else if (self->_activateMotionDetect)
    {
      self->_activateAttentionDetection = 0;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v5 = self->_attentionLostTimeouts;
    uint64_t v22 = [(NSSet *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      double v25 = 0.0;
LABEL_48:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v5);
        }
        v27 = *(void **)(*((void *)&v35 + 1) + 8 * v26);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_11;
        }
        objc_msgSend(v27, "doubleValue", (void)v35);
        if (v28 < 0.0) {
          goto LABEL_11;
        }
        [v27 doubleValue];
        if (v25 < v29) {
          double v25 = v29;
        }
        if (v23 == ++v26)
        {
          uint64_t v23 = [(NSSet *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
          if (v23) {
            goto LABEL_48;
          }
          goto LABEL_59;
        }
      }
    }
    double v25 = 0.0;
LABEL_59:

    if (!self->_nonSampledAttentionLostTimeoutEnable || self->_nonSampledAttentionLostTimeout > v25) {
      return 1;
    }
    if (currentLogLevel >= 3)
    {
      _AALog();
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      unint64_t v33 = absTimeNS();
      if (v33 == -1) {
        double v34 = INFINITY;
      }
      else {
        double v34 = (double)v33 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v43 = v34;
      v32 = "%13.5f: Invalid Config: nonSampledTimeout lower than attentionLostTimeouts";
      goto LABEL_68;
    }
  }
  else if (currentLogLevel >= 3)
  {
    _AALog();
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v43 = v7;
      v32 = "%13.5f: Invalid Config: sampling interval and sampling delay must be non-negative";
LABEL_68:
      _os_log_error_impl(&dword_1B3B4B000, &v5->super, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28798];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40 = @" Invalid config";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    *a3 = [v8 errorWithDomain:v9 code:22 userInfo:v10];
  }
  return 0;
}

- (void)setNonSampledAttentionLostTimeout:(double)a3
{
  self->_nonSampledAttentionLostTimeout = a3;
}

- (double)nonSampledAttentionLostTimeout
{
  return self->_nonSampledAttentionLostTimeout;
}

- (void)setNonSampledAttentionLostTimeoutEnable:(BOOL)a3
{
  self->_nonSampledAttentionLostTimeoutEnable = a3;
}

- (BOOL)nonSampledAttentionLostTimeoutEnable
{
  return self->_nonSampledAttentionLostTimeoutEnable;
}

- (void)setPollingFilter:(BOOL)a3
{
  self->_pollingFilter = a3;
}

- (BOOL)pollingFilter
{
  return self->_pollingFilter;
}

- (void)setUnityStream:(BOOL)a3
{
  self->_unityStream = a3;
}

- (BOOL)unityStream
{
  return self->_unityStream;
}

- (void)setActivateMotionDetect:(BOOL)a3
{
  self->_activateMotionDetect = a3;
}

- (BOOL)activateMotionDetect
{
  return self->_activateMotionDetect;
}

- (void)setActivateAttentionDetection:(BOOL)a3
{
  self->_activateAttentionDetection = a3;
}

- (BOOL)activateAttentionDetection
{
  return self->_activateAttentionDetection;
}

- (void)setActivateEyeRelief:(BOOL)a3
{
  self->_activateEyeRelief = a3;
}

- (BOOL)activateEyeRelief
{
  return self->_activateEyeRelief;
}

- (void)setButtonDisplayUUIDs:(id)a3
{
}

- (NSSet)buttonDisplayUUIDs
{
  return self->_buttonDisplayUUIDs;
}

- (void)setKeyboardDisplayUUIDs:(id)a3
{
}

- (NSSet)keyboardDisplayUUIDs
{
  return self->_keyboardDisplayUUIDs;
}

- (void)setDigitizerDisplayUUIDs:(id)a3
{
}

- (NSSet)digitizerDisplayUUIDs
{
  return self->_digitizerDisplayUUIDs;
}

- (void)setContinuousFaceDetectMode:(BOOL)a3
{
  self->_continuousFaceDetectMode = a3;
}

- (BOOL)continuousFaceDetectMode
{
  return self->_continuousFaceDetectMode;
}

- (void)setRetroactiveTimeoutMode:(BOOL)a3
{
  self->_retroactiveTimeoutMode = a3;
}

- (BOOL)retroactiveTimeoutMode
{
  return self->_retroactiveTimeoutMode;
}

- (void)setSampleWhileAbsent:(BOOL)a3
{
  self->_sampleWhileAbsent = a3;
}

- (BOOL)sampleWhileAbsent
{
  return self->_sampleWhileAbsent;
}

- (double)samplingDelay
{
  return self->_samplingDelay;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (unint64_t)attentionLostEventMask
{
  return self->_attentionLostEventMask;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (void)setNotificationMask:(unint64_t)a3
{
  self->_notificationMask = a3;
}

- (unint64_t)notificationMask
{
  return self->_notificationMask;
}

- (NSCopying)tag
{
  return self->_tag;
}

- (void)setAllowedHIDEventsForRemoteEvent:(id)a3
{
  objc_super v4 = (NSSet *)[a3 copy];
  allowedHIDEventsForRemoteEvent = self->_allowedHIDEventsForRemoteEvent;
  self->_allowedHIDEventsForRemoteEvent = v4;

  MEMORY[0x1F41817F8](v4, allowedHIDEventsForRemoteEvent);
}

- (id)allowedHIDEventsForRemoteEvent
{
  v2 = (void *)[(NSSet *)self->_allowedHIDEventsForRemoteEvent copy];

  return v2;
}

- (void)setAttentionLostTimeoutDictionary:(id)a3
{
  id v4 = a3;
  v5 = (NSDictionary *)[v4 copy];
  attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
  self->_attentionLostTimeoutDictionary = v5;

  double v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [v4 allKeys];

  uint64_t v8 = [v7 setWithArray:v10];
  attentionLostTimeouts = self->_attentionLostTimeouts;
  self->_attentionLostTimeouts = v8;
}

- (NSSet)attentionLostTimeouts
{
  v2 = (void *)[(NSSet *)self->_attentionLostTimeouts copy];

  return (NSSet *)v2;
}

- (void)setSamplingDelay:(double)a3
{
  self->_samplingDelay = a3;
  self->_samplingDelayExplicitlySet = 1;
}

- (void)setSamplingInterval:(double)a3
{
  self->_samplingInterval = a3;
  if (!self->_samplingDelayExplicitlySet) {
    self->_samplingDelay = a3;
  }
}

- (void)setAttentionLostEventMask:(unint64_t)a3
{
  self->_attentionLostEventMask = a3;
  self->_attentionLostEventMaskExplicitlySet = 1;
}

- (void)setTag:(id)a3
{
  unint64_t v10 = (unint64_t)a3;
  id v4 = (void *)(v10 | (unint64_t)self->_tag);
  if (v4)
  {
    v5 = +[AWAttentionAwarenessClientConfig sharedClientConfig];
    unint64_t v6 = v5;
    if (self->_tag) {
      [v5 decrementTagIndexRefCount:self->_tagIndex];
    }
    if (v10)
    {
      double v7 = (NSCopying *)[(id)v10 copyWithZone:MEMORY[0x1B3EC1350]()];
      tag = self->_tag;
      self->_tag = v7;

      unint64_t v9 = [v6 addTag:self->_tag];
      goto LABEL_9;
    }
    id v4 = self->_tag;
  }
  else
  {
    unint64_t v6 = 0;
  }
  self->_tag = 0;

  unint64_t v9 = 0;
LABEL_9:
  self->_tagIndex = v9;
}

- (unint64_t)tagIndex
{
  return self->_tagIndex;
}

- (id)description
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v3 = self->_attentionLostTimeouts;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v50;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (v8)
        {
          v11 = (void *)MEMORY[0x1E4F28E78];
          [v10 doubleValue];
          uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", @"%13.5f", v12);

          unint64_t v6 = (void *)v13;
        }
        else
        {
          [v10 doubleValue];
          [v6 appendFormat:@", %13.5f", v14];
        }
        char v8 = 0;
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v49 objects:v53 count:16];
      char v8 = 0;
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  v48 = NSString;
  double v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  identifier = self->_identifier;
  v47 = (void *)v16;
  double samplingInterval = self->_samplingInterval;
  double samplingDelay = self->_samplingDelay;
  if (self->_sampleWhileAbsent) {
    double v19 = "true";
  }
  else {
    double v19 = "false";
  }
  if (self->_retroactiveTimeoutMode) {
    unint64_t v20 = "true";
  }
  else {
    unint64_t v20 = "false";
  }
  uint64_t v44 = v20;
  v45 = v19;
  if (self->_pollingFilter) {
    double v21 = "true";
  }
  else {
    double v21 = "false";
  }
  if (self->_continuousFaceDetectMode) {
    uint64_t v22 = "true";
  }
  else {
    uint64_t v22 = "false";
  }
  v42 = v22;
  double v43 = v21;
  if (self->_activateAttentionDetection) {
    uint64_t v23 = "true";
  }
  else {
    uint64_t v23 = "false";
  }
  if (self->_activateEyeRelief) {
    uint64_t v24 = "true";
  }
  else {
    uint64_t v24 = "false";
  }
  v40 = v24;
  v41 = v23;
  if (self->_activateMotionDetect) {
    double v25 = "true";
  }
  else {
    double v25 = "false";
  }
  if (self->_unityStream) {
    uint64_t v26 = "true";
  }
  else {
    uint64_t v26 = "false";
  }
  long long v38 = v26;
  uint64_t v39 = v25;
  if (self->_nonSampledAttentionLostTimeoutEnable) {
    v27 = "true";
  }
  else {
    v27 = "false";
  }
  double nonSampledAttentionLostTimeout = self->_nonSampledAttentionLostTimeout;
  double v29 = getNotificationMaskDescription(self->_notificationMask);
  unint64_t v30 = getEventMaskDescription(self->_eventMask);
  double v31 = getEventMaskDescription(self->_attentionLostEventMask);
  keyboardDisplayUUIDs = self->_keyboardDisplayUUIDs;
  buttonDisplayUUIDs = self->_buttonDisplayUUIDs;
  digitizerDisplayUUIDs = self->_digitizerDisplayUUIDs;
  long long v35 = tagDescription(self->_tagIndex, self->_tag);
  objc_msgSend(v48, "stringWithFormat:", @"<%@: %p> (identifier: %@ samplingInterval: %13.5f, samplingDelay: %13.5f, sampleWhileAbsent: %s, retroactiveTimeoutMode: %s, pollingFilter: %s, continuousFaceDetectMode: %s, activateAttentionDetection: %s, activateEyeRelief: %s, activateMotionDetection: %s, unityStream: %s, attentionLostTimeouts: %@ nonSampledAttentionLostTimeoutEnable: %s nonSampledAttentionLostTimeout: %13.5f notificationMask %@ mask %@ attentionLostEventMask %@ digitizerDisplayUUIDs %@ buttonDisplayUUIDs %@ keyboardDisplayUUIDs %@ %@)", v47, self, identifier, *(void *)&samplingInterval, *(void *)&samplingDelay, v45, v44, v43, v42, v41, v40, v39, v38, v6, v27, *(void *)&nonSampledAttentionLostTimeout,
    v29,
    v30,
    v31,
    digitizerDisplayUUIDs,
    buttonDisplayUUIDs,
    keyboardDisplayUUIDs,
  long long v36 = v35);

  return v36;
}

- (AWAttentionAwarenessConfiguration)initWithCoder:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v75 = 0;
  v74.receiver = self;
  v74.super_class = (Class)AWAttentionAwarenessConfiguration;
  uint64_t v5 = [(AWAttentionAwarenessConfiguration *)&v74 init];
  if (!v5) {
    goto LABEL_53;
  }
  uint64_t v6 = decodeString(v4, &v75, @"identifier");
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_tagIndex = decodeUInt64(v4, &v75, @"tagIndex");
  v5->_notificationMask = decodeUInt64(v4, &v75, @"notificationMask");
  v5->_eventMask = decodeUInt64(v4, &v75, @"eventMask");
  v5->_attentionLostEventMask = decodeUInt64(v4, &v75, @"attentionLostEventMask");
  v5->_double samplingInterval = decodeDouble(v4, &v75, @"samplingInterval");
  v5->_double samplingDelay = decodeDouble(v4, &v75, @"samplingDelay");
  v5->_sampleWhileAbsent = decodeUInt64(v4, &v75, @"sampleWhileAbsent") != 0;
  v5->_retroactiveTimeoutMode = decodeUInt64(v4, &v75, @"retroactiveTimeoutMode") != 0;
  v5->_pollingFilter = decodeUInt64(v4, &v75, @"pollingFilter") != 0;
  v5->_continuousFaceDetectMode = decodeUInt64(v4, &v75, @"continuousFaceDetectMode") != 0;
  v5->_activateEyeRelief = decodeUInt64(v4, &v75, @"activateEyeRelief") != 0;
  v5->_activateAttentionDetection = decodeUInt64(v4, &v75, @"activateAttentionDetection") != 0;
  v5->_activateMotionDetect = decodeUInt64(v4, &v75, @"activateMotionDetect") != 0;
  v5->_unityStream = decodeUInt64(v4, &v75, @"unityStream") != 0;
  id v8 = v4;
  unint64_t v9 = @"attentionLostTimeouts";
  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v8 decodeObjectOfClasses:v12 forKey:@"attentionLostTimeouts"];
  unint64_t v14 = 0x1EB801000;
  if (!v13)
  {
    if ([v8 containsValueForKey:@"attentionLostTimeouts"])
    {
      unint64_t v20 = 0;
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    if (*(int *)(v14 + 2856) >= 3)
    {
      unint64_t v21 = v14;
      uint64_t v22 = _AALog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unint64_t v61 = absTimeNS();
        if (v61 == -1) {
          double v62 = INFINITY;
        }
        else {
          double v62 = (double)v61 / 1000000000.0;
        }
        *(_DWORD *)v92 = 134218242;
        *(double *)&v92[4] = v62;
        *(_WORD *)&v92[12] = 2112;
        *(void *)&v92[14] = @"attentionLostTimeouts";
        _os_log_error_impl(&dword_1B3B4B000, v22, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", v92, 0x16u);
      }

      unint64_t v14 = v21;
    }
    unint64_t v20 = 0;
    char v75 = 1;
    goto LABEL_20;
  }
  v73 = v12;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v85 = 0u;
  long long v84 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v84 objects:v88 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v85;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v85 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          unint64_t v14 = 0x1EB801000uLL;
          uint64_t v12 = v73;
          goto LABEL_16;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v84 objects:v88 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  unint64_t v20 = (NSSet *)v15;
  unint64_t v14 = 0x1EB801000;
  uint64_t v12 = v73;
LABEL_20:

  attentionLostTimeouts = v5->_attentionLostTimeouts;
  v5->_attentionLostTimeouts = v20;

  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  id v26 = v8;
  v27 = @"allowedHIDEventsForRemoteEvent";
  double v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  unint64_t v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), v24, v25, 0);
  double v31 = [v26 decodeObjectOfClasses:v30 forKey:@"allowedHIDEventsForRemoteEvent"];
  if (!v31)
  {
    if ([v26 containsValueForKey:@"allowedHIDEventsForRemoteEvent"])
    {
      v47 = 0;
      goto LABEL_48;
    }
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_44:
    if (*(int *)(v14 + 2856) >= 3)
    {
      v48 = _AALog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        unint64_t v59 = absTimeNS();
        if (v59 == -1) {
          double v60 = INFINITY;
        }
        else {
          double v60 = (double)v59 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218242;
        double v81 = v60;
        __int16 v82 = 2112;
        v83 = @"allowedHIDEventsForRemoteEvent";
        _os_log_error_impl(&dword_1B3B4B000, v48, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);
      }
    }
    v47 = 0;
    char v75 = 1;
    goto LABEL_48;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  memset(v92, 0, sizeof(v92));
  id v32 = v31;
  uint64_t v33 = [v32 countByEnumeratingWithState:v92 objects:v88 count:16];
  if (v33)
  {
    uint64_t v34 = **(void **)&v92[16];
    v72 = v32;
    uint64_t v67 = **(void **)&v92[16];
    while (2)
    {
      uint64_t v35 = 0;
      uint64_t v68 = v33;
      do
      {
        if (**(void **)&v92[16] != v34)
        {
          uint64_t v36 = v35;
          objc_enumerationMutation(v32);
          uint64_t v35 = v36;
        }
        uint64_t v69 = v35;
        long long v37 = *(void **)(*(void *)&v92[8] + 8 * v35);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_43:

          goto LABEL_44;
        }
        id v38 = v37;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v76 objects:&v84 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v77;
          v70 = v31;
          v71 = v30;
          while (2)
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v77 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v76 + 1) + 8 * j);
              if (objc_opt_isKindOfClass())
              {
                v45 = [v39 objectForKeyedSubscript:v44];
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass) {
                  continue;
                }
              }

              unint64_t v14 = 0x1EB801000uLL;
              double v31 = v70;
              unint64_t v30 = v71;
              id v32 = v72;
              goto LABEL_43;
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v76 objects:&v84 count:16];
            unint64_t v14 = 0x1EB801000;
            double v31 = v70;
            unint64_t v30 = v71;
            if (v41) {
              continue;
            }
            break;
          }
        }

        uint64_t v35 = v69 + 1;
        id v32 = v72;
        uint64_t v34 = v67;
      }
      while (v69 + 1 != v68);
      uint64_t v33 = [v72 countByEnumeratingWithState:v92 objects:v88 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  v47 = (NSSet *)v32;
LABEL_48:

  allowedHIDEventsForRemoteEvent = v5->_allowedHIDEventsForRemoteEvent;
  v5->_allowedHIDEventsForRemoteEvent = v47;

  uint64_t v50 = decodeStringSet(v26, &v75, @"digitizerDisplayUUIDs");
  digitizerDisplayUUIDs = v5->_digitizerDisplayUUIDs;
  v5->_digitizerDisplayUUIDs = (NSSet *)v50;

  uint64_t v52 = decodeStringSet(v26, &v75, @"keyboardDisplayUUIDs");
  keyboardDisplayUUIDs = v5->_keyboardDisplayUUIDs;
  v5->_keyboardDisplayUUIDs = (NSSet *)v52;

  uint64_t v54 = decodeStringSet(v26, &v75, @"buttonDisplayUUIDs");
  buttonDisplayUUIDs = v5->_buttonDisplayUUIDs;
  v5->_buttonDisplayUUIDs = (NSSet *)v54;

  v5->_nonSampledAttentionLostTimeoutEnable = decodeUInt64(v26, &v75, @"nonSampledAttentionLostTimeoutEnable") != 0;
  v5->_double nonSampledAttentionLostTimeout = decodeDouble(v26, &v75, @"nonSampledAttentionLostTimeout");
  if (!v75)
  {
LABEL_53:
    v57 = v5;
    goto LABEL_54;
  }
  if (*(int *)(v14 + 2856) >= 3)
  {
    v56 = _AALog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      unint64_t v63 = absTimeNS();
      if (v63 == -1) {
        double v64 = INFINITY;
      }
      else {
        double v64 = (double)v63 / 1000000000.0;
      }
      v65 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v65);
      *(_DWORD *)v88 = 134218242;
      double v89 = v64;
      __int16 v90 = 2112;
      v91 = v66;
      _os_log_error_impl(&dword_1B3B4B000, v56, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", v88, 0x16u);
    }
  }
  v57 = 0;
LABEL_54:

  return v57;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v10 = a3;
  [v10 encodeObject:identifier forKey:@"identifier"];
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_tagIndex];
  [v10 encodeObject:v5 forKey:@"tagIndex"];

  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_notificationMask];
  [v10 encodeObject:v6 forKey:@"notificationMask"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:self->_eventMask];
  [v10 encodeObject:v7 forKey:@"eventMask"];

  id v8 = [NSNumber numberWithUnsignedLongLong:self->_attentionLostEventMask];
  [v10 encodeObject:v8 forKey:@"attentionLostEventMask"];

  [v10 encodeDouble:@"samplingInterval" forKey:self->_samplingInterval];
  [v10 encodeDouble:@"samplingDelay" forKey:self->_samplingDelay];
  [v10 encodeBool:self->_sampleWhileAbsent forKey:@"sampleWhileAbsent"];
  [v10 encodeBool:self->_retroactiveTimeoutMode forKey:@"retroactiveTimeoutMode"];
  [v10 encodeBool:self->_pollingFilter forKey:@"pollingFilter"];
  [v10 encodeBool:self->_continuousFaceDetectMode forKey:@"continuousFaceDetectMode"];
  [v10 encodeBool:self->_activateEyeRelief forKey:@"activateEyeRelief"];
  [v10 encodeBool:self->_activateAttentionDetection forKey:@"activateAttentionDetection"];
  [v10 encodeBool:self->_activateMotionDetect forKey:@"activateMotionDetect"];
  [v10 encodeBool:self->_unityStream forKey:@"unityStream"];
  [v10 encodeObject:self->_attentionLostTimeouts forKey:@"attentionLostTimeouts"];
  [v10 encodeObject:self->_allowedHIDEventsForRemoteEvent forKey:@"allowedHIDEventsForRemoteEvent"];
  [v10 encodeObject:self->_digitizerDisplayUUIDs forKey:@"digitizerDisplayUUIDs"];
  [v10 encodeObject:self->_keyboardDisplayUUIDs forKey:@"keyboardDisplayUUIDs"];
  [v10 encodeObject:self->_buttonDisplayUUIDs forKey:@"buttonDisplayUUIDs"];
  [v10 encodeDouble:@"nonSampledAttentionLostTimeout" forKey:self->_nonSampledAttentionLostTimeout];
  double v9 = 0.0;
  if (self->_nonSampledAttentionLostTimeoutEnable) {
    double v9 = 1.0;
  }
  [v10 encodeDouble:@"nonSampledAttentionLostTimeoutEnable" forKey:v9];
}

+ (void)cancelNotification:(AWNotification_s *)a3
{
  id v4 = +[AWAttentionAwarenessClientConfig sharedClientConfig];
  [v4 cancelNotification:a3];
}

+ (AWNotification_s)notifySupportedEventsChangedWithQueue:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[AWAttentionAwarenessClientConfig sharedClientConfig];
  id v8 = (AWNotification_s *)[v7 notifySupportedEventsChangedWithQueue:v6 block:v5];

  return v8;
}

+ (id)supportedEventsString
{
  uint64_t v2 = [a1 supportedEvents];

  return getEventMaskDescription(v2);
}

+ (unint64_t)supportedEvents
{
  uint64_t v2 = +[AWAttentionAwarenessClientConfig sharedClientConfig];
  unint64_t v3 = [v2 supportedEvents];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
}

@end