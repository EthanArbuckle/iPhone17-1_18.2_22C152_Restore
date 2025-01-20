@interface SRSpeechMetrics
+ (BOOL)supportsSecureCoding;
+ (SRSpeechMetrics)new;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)sessionIdentifier;
- (SFSpeechRecognitionResult)speechRecognition;
- (SNClassificationResult)soundClassification;
- (SRAudioLevel)audioLevel;
- (SRSpeechExpression)speechExpression;
- (SRSpeechMetrics)init;
- (SRSpeechMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRSpeechMetrics)initWithCoder:(id)a3;
- (SRSpeechMetrics)initWithSessionIdentifier:(id)a3 sessionFlags:(unint64_t)a4 timestamp:(double)a5 audioLevel:(id)a6 speechRecognition:(id)a7 soundClassification:(id)a8 speechExpression:(id)a9;
- (SRSpeechMetrics)initWithSessionIdentifier:(id)a3 sessionFlags:(unint64_t)a4 timestamp:(double)a5 timeSinceAudioStart:(double)a6 audioLevel:(id)a7 speechRecognition:(id)a8 soundClassification:(id)a9 speechExpression:(id)a10;
- (SRSpeechMetricsSessionFlags)sessionFlags;
- (double)timeSinceAudioStart;
- (id)binarySampleRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRSpeechMetrics

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_26AB1A120 = (uint64_t)os_log_create("com.apple.SensorKit", "SRSpeechMetrics");
  }
}

- (SRSpeechMetrics)init
{
  return 0;
}

+ (SRSpeechMetrics)new
{
  return 0;
}

- (SRSpeechMetrics)initWithSessionIdentifier:(id)a3 sessionFlags:(unint64_t)a4 timestamp:(double)a5 audioLevel:(id)a6 speechRecognition:(id)a7 soundClassification:(id)a8 speechExpression:(id)a9
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (qword_26AB1A128 != -1) {
    dispatch_once(&qword_26AB1A128, &__block_literal_global_10);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_8);
  id v42 = a3;
  uint64_t v16 = [(id)qword_26AB1A138 objectForKeyedSubscript:a3];
  if (!v16)
  {
    uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    [(id)qword_26AB1A138 setObject:v16 forKeyedSubscript:a3];
    uint64_t v17 = [NSNumber numberWithDouble:a5];
    [(id)qword_26AB1A130 setObject:v17 forKeyedSubscript:v16];
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_MergedGlobals_8);
    unint64_t v36 = a4;
    id v37 = a6;
    id v38 = a7;
    id v39 = a8;
    id v40 = a9;
    if ((unint64_t)[(id)qword_26AB1A130 count] >= 0x10)
    {
      v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend((id)qword_26AB1A130, "allKeys"));
      [v18 sortUsingComparator:&__block_literal_global_251];
      if ((unint64_t)[v18 count] >= 0xF)
      {
        unint64_t v19 = 14;
        v43 = v18;
        do
        {
          uint64_t v20 = [v18 objectAtIndexedSubscript:v19];
          [(id)qword_26AB1A130 setObject:0 forKeyedSubscript:v20];
          v21 = (void *)[MEMORY[0x263EFF980] array];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v22 = (void *)qword_26AB1A138;
          uint64_t v23 = [(id)qword_26AB1A138 countByEnumeratingWithState:&v44 objects:v50 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend((id)qword_26AB1A138, "objectForKeyedSubscript:", v26), "isEqual:", v20))objc_msgSend(v21, "addObject:", v26); {
              }
                }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v50 count:16];
            }
            while (v23);
          }
          [(id)qword_26AB1A138 removeObjectsForKeys:v21];
          v18 = v43;
          v27 = qword_26AB1A120;
          if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v49 = v20;
            _os_log_impl(&dword_21FCA3000, v27, OS_LOG_TYPE_INFO, "Removing session UUID %{public}@ from tracking", buf, 0xCu);
          }
          ++v19;
        }
        while (v19 < [v43 count]);
      }
    }
    v28 = qword_26AB1A120;
    if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v50 = 138412546;
      uint64_t v51 = qword_26AB1A138;
      __int16 v52 = 2112;
      uint64_t v53 = qword_26AB1A130;
      _os_log_impl(&dword_21FCA3000, v28, OS_LOG_TYPE_INFO, "Detected a new audio session. Sessions in flight: %@, session times: %@", v50, 0x16u);
    }
    a8 = v39;
    a9 = v40;
    a6 = v37;
    a7 = v38;
    a4 = v36;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_8);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_8);
  objc_msgSend((id)objc_msgSend((id)qword_26AB1A130, "objectForKeyedSubscript:", v16), "doubleValue");
  double v30 = v29;
  objc_msgSend((id)objc_msgSend(a7, "speechRecognitionMetadata"), "speechStartTimestamp");
  double v32 = a5 - v30 + v31;
  v33 = qword_26AB1A120;
  if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_msgSend(a7, "speechRecognitionMetadata"), "speechStartTimestamp");
    *(_DWORD *)v50 = 138413314;
    uint64_t v51 = v16;
    __int16 v52 = 2048;
    uint64_t v53 = *(void *)&v30;
    __int16 v54 = 2048;
    double v55 = a5;
    __int16 v56 = 2048;
    uint64_t v57 = v35;
    __int16 v58 = 2048;
    double v59 = v32;
    _os_log_debug_impl(&dword_21FCA3000, v33, OS_LOG_TYPE_DEBUG, "session UUID: %@, sessionStartTime: %.09f, timestamp: %.09f, speechstart: %.09f, computed; %.09f",
      v50,
      0x34u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_8);
  return -[SRSpeechMetrics initWithSessionIdentifier:sessionFlags:timestamp:timeSinceAudioStart:audioLevel:speechRecognition:soundClassification:speechExpression:](self, "initWithSessionIdentifier:sessionFlags:timestamp:timeSinceAudioStart:audioLevel:speechRecognition:soundClassification:speechExpression:", [NSString stringWithFormat:@"%@;%@", v16, v42],
           a4,
           a6,
           a7,
           a8,
           a9,
           a5,
           v32);
}

- (SRSpeechMetrics)initWithSessionIdentifier:(id)a3 sessionFlags:(unint64_t)a4 timestamp:(double)a5 timeSinceAudioStart:(double)a6 audioLevel:(id)a7 speechRecognition:(id)a8 soundClassification:(id)a9 speechExpression:(id)a10
{
  v22.receiver = self;
  v22.super_class = (Class)SRSpeechMetrics;
  v18 = [(SRSpeechMetrics *)&v22 init];
  if (v18)
  {
    v18->_sessionIdentifier = (NSString *)[a3 copy];
    v18->_sessionFlags = a4;
    objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", @"com.apple.SensorKit.speechMetrics.telephony"), "roundingInterval");
    if (v19 == 0.0) {
      uint64_t v20 = (void *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:a5];
    }
    else {
      uint64_t v20 = objc_msgSend(MEMORY[0x263EFF910], "sr_dateWithTimeIntervalSinceReferenceDate:roundedDownToNearest:", a5, v19);
    }
    v18->_timestamp = (NSDate *)v20;
    v18->_timeSinceAudioStart = a6;
    v18->_audioLevel = (SRAudioLevel *)a7;
    v18->_speechRecognition = (SFSpeechRecognitionResult *)a8;
    v18->_soundClassification = (SNClassificationResult *)a9;
    v18->_speechExpression = (SRSpeechExpression *)a10;
  }
  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRSpeechMetrics;
  [(SRSpeechMetrics *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v14) = 1;
    return v14;
  }
  uint64_t v23 = v10;
  uint64_t v24 = v9;
  uint64_t v25 = v6;
  uint64_t v26 = v5;
  uint64_t v27 = v4;
  uint64_t v28 = v3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  LOBYTE(v14) = 0;
  if (!self || (isKindOfClass & 1) == 0) {
    return v14;
  }
  if (-[SRSpeechMetrics sessionIdentifier](self, "sessionIdentifier") || [a3 sessionIdentifier])
  {
    int v14 = -[NSString isEqual:](-[SRSpeechMetrics sessionIdentifier](self, "sessionIdentifier", v10, v9, v6, v5, v27, v28, v7, v8), "isEqual:", [a3 sessionIdentifier]);
    if (!v14) {
      return v14;
    }
  }
  if (-[SRSpeechMetrics timestamp](self, "timestamp", v23, v24, v25, v26, v27, v28) || [a3 timestamp])
  {
    int v14 = -[NSDate isEqual:](-[SRSpeechMetrics timestamp](self, "timestamp"), "isEqual:", [a3 timestamp]);
    if (!v14) {
      return v14;
    }
  }
  unint64_t sessionFlags = self->_sessionFlags;
  if (sessionFlags != [a3 sessionFlags])
  {
    LOBYTE(v14) = 0;
    return v14;
  }
  speechRecognition = self->_speechRecognition;
  if (!speechRecognition)
  {
    if (![a3 speechRecognition]) {
      goto LABEL_15;
    }
    speechRecognition = self->_speechRecognition;
  }
  int v14 = -[SFSpeechRecognitionResult isEqual:](speechRecognition, "isEqual:", [a3 speechRecognition]);
  if (!v14) {
    return v14;
  }
LABEL_15:
  soundClassification = self->_soundClassification;
  if (!soundClassification)
  {
    if (![a3 soundClassification]) {
      goto LABEL_19;
    }
    soundClassification = self->_soundClassification;
  }
  int v14 = -[SNClassificationResult isEqual:](soundClassification, "isEqual:", [a3 soundClassification]);
  if (!v14) {
    return v14;
  }
LABEL_19:
  speechExpression = self->_speechExpression;
  if (speechExpression) {
    goto LABEL_22;
  }
  if ([a3 speechExpression])
  {
    speechExpression = self->_speechExpression;
LABEL_22:
    int v14 = -[SRSpeechExpression isEqual:](speechExpression, "isEqual:", [a3 speechExpression]);
    if (!v14) {
      return v14;
    }
  }
  audioLevel = self->_audioLevel;
  if (!audioLevel)
  {
    if (![a3 audioLevel])
    {
LABEL_27:
      double timeSinceAudioStart = self->_timeSinceAudioStart;
      [a3 timeSinceAudioStart];
      LOBYTE(v14) = timeSinceAudioStart == v21;
      return v14;
    }
    audioLevel = self->_audioLevel;
  }
  int v14 = -[SRAudioLevel isEqual:](audioLevel, "isEqual:", [a3 audioLevel]);
  if (v14) {
    goto LABEL_27;
  }
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionIdentifier hash];
  uint64_t v4 = [(NSDate *)self->_timestamp hash] ^ v3;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_sessionFlags), "hash");
  unint64_t v6 = v4 ^ [(SFSpeechRecognitionResult *)self->_speechRecognition hash] ^ v5;
  uint64_t v7 = [(SNClassificationResult *)self->_soundClassification hash];
  unint64_t v8 = v7 ^ [(SRSpeechExpression *)self->_speechExpression hash];
  unint64_t v9 = v8 ^ [(SRAudioLevel *)self->_audioLevel hash];
  return v6 ^ v9 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_timeSinceAudioStart), "hash");
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ (%p): sessionIdentifier: %@, sessionFlags: %lu, timestamp: %@, timeSinceAudioStart: %f, audioLevel: %@, speechRecognition: %@, soundClassification: %@, speechExpression: %@", NSStringFromClass(v4), self, self->_sessionIdentifier, self->_sessionFlags, self->_timestamp, *(void *)&self->_timeSinceAudioStart, self->_audioLevel, self->_speechRecognition, self->_soundClassification, self->_speechExpression];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSpeechMetrics.m", 484, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_sessionFlags), @"sessionFlags");
  [(NSDate *)self->_timestamp timeIntervalSinceReferenceDate];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timestamp");
  [a3 encodeDouble:@"timeSinceAudioStart" forKey:self->_timeSinceAudioStart];
  audioLevel = self->_audioLevel;
  if (audioLevel) {
    [a3 encodeObject:audioLevel forKey:@"audioLevel"];
  }
  speechRecognition = self->_speechRecognition;
  if (speechRecognition) {
    [a3 encodeObject:speechRecognition forKey:@"speechRecogition"];
  }
  soundClassification = self->_soundClassification;
  if (soundClassification) {
    [a3 encodeObject:soundClassification forKey:@"soundClassification"];
  }
  if (self->_speechExpression)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (SRSpeechMetrics)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSpeechMetrics.m", 505, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
  uint64_t v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sessionFlags"];
  [a3 decodeDoubleForKey:@"timestamp"];
  double v9 = v8;
  [a3 decodeDoubleForKey:@"timeSinceAudioStart"];
  double v11 = v10;
  uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"speechRecogition"];
  uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"soundClassification"];
  uint64_t v14 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"speechExpression"];
  uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"audioLevel"];
  uint64_t v16 = [v7 unsignedIntegerValue];

  return [(SRSpeechMetrics *)self initWithSessionIdentifier:v6 sessionFlags:v16 timestamp:v15 timeSinceAudioStart:v12 audioLevel:v13 speechRecognition:v14 soundClassification:v9 speechExpression:v11];
}

- (SRSpeechMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (![a3 length])
  {

    double v21 = qword_26AB1A120;
    if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21FCA3000, v21, OS_LOG_TYPE_ERROR, "Failed to unarchive data because binary data length is zero", buf, 2u);
    }
    return 0;
  }
  v24.receiver = self;
  v24.super_class = (Class)SRSpeechMetrics;
  result = [(SRSpeechMetrics *)&v24 init];
  if (!result) {
    return result;
  }
  double v9 = result;
  uint64_t v23 = 0;
  double v10 = (void *)MEMORY[0x263F08928];
  double v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), a3, &v23);
  if (!v13)
  {
    objc_super v22 = qword_26AB1A120;
    if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v23;
      _os_log_error_impl(&dword_21FCA3000, v22, OS_LOG_TYPE_ERROR, "Failed to unarchive legacy data because %{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = objc_opt_class();
  if (v15 == objc_opt_class())
  {

    return (SRSpeechMetrics *)v14;
  }
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = qword_26AB1A120;
  if (v16 != v17)
  {
    if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_FAULT))
    {
      double v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v20;
      _os_log_fault_impl(&dword_21FCA3000, v18, OS_LOG_TYPE_FAULT, "Marshalled an object of an unexpected class %{public}@", buf, 0xCu);
    }
LABEL_12:

    return 0;
  }
  if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v26 = (NSString *)v14;
    _os_log_impl(&dword_21FCA3000, v18, OS_LOG_TYPE_INFO, "Found legacy data %{private}@", buf, 0xCu);
  }
  return [(SRSpeechMetrics *)v9 initWithSessionIdentifier:&stru_26D165EC8 sessionFlags:0 timestamp:0 audioLevel:v14 speechRecognition:0 soundClassification:0 speechExpression:SRAbsoluteTimeToCFAbsoluteTime(a5)];
}

- (id)binarySampleRepresentation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  v2 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  uint64_t v3 = v6;
  if (v6)
  {
    uint64_t v4 = qword_26AB1A120;
    if (os_log_type_enabled((os_log_t)qword_26AB1A120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v3;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Failed to archive data because %{public}@", buf, 0xCu);
    }
  }
  return v2;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (SRSpeechMetricsSessionFlags)sessionFlags
{
  return self->_sessionFlags;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)timeSinceAudioStart
{
  return self->_timeSinceAudioStart;
}

- (SRAudioLevel)audioLevel
{
  return self->_audioLevel;
}

- (SFSpeechRecognitionResult)speechRecognition
{
  return self->_speechRecognition;
}

- (SNClassificationResult)soundClassification
{
  return self->_soundClassification;
}

- (SRSpeechExpression)speechExpression
{
  return self->_speechExpression;
}

@end