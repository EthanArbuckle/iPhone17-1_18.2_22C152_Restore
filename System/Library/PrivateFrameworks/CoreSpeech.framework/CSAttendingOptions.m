@interface CSAttendingOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionForFlexibleFollowupWithAudioRecordType:(int64_t)a3 deviceId:(id)a4;
+ (id)optionForJarvisAnnounceMessageWithDeviceId:(id)a3;
- (BOOL)useBoron;
- (BOOL)useOwnVoiceVAD;
- (BOOL)useVAD;
- (CSAttendingOptions)initWithAttendingType:(int64_t)a3;
- (CSAttendingOptions)initWithAttendingType:(int64_t)a3 startAttendingHostTime:(unint64_t)a4 useVAD:(BOOL)a5 useOwnVoiceVAD:(BOOL)a6 useBoron:(BOOL)a7 startOfSpeechThresholdInMs:(double)a8 prependAudioDuration:(double)a9 timeoutThresholdInSec:(double)a10 triggerType:(int64_t)a11 audioStreamHoldingDurationInSec:(double)a12 audioRecordType:(int64_t)a13 deviceId:(id)a14 attendingListeningType:(unint64_t)a15 pauseDurationThreshold:(double)a16 maxPauseDelay:(double)a17;
- (CSAttendingOptions)initWithCoder:(id)a3;
- (NSString)deviceId;
- (double)audioStreamHoldingDurationInSec;
- (double)maxPauseDelay;
- (double)pauseDurationThreshold;
- (double)prependAudioDuration;
- (double)startOfSpeechNearMissThresholdInMs;
- (double)startOfSpeechThresholdInMs;
- (double)timeoutThresholdInSec;
- (id)copyWithRecordType:(int64_t)a3;
- (id)description;
- (int64_t)attendingType;
- (int64_t)recordType;
- (int64_t)triggerType;
- (unint64_t)attendingListeningType;
- (unint64_t)startAttendingHostTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSAttendingOptions

- (void).cxx_destruct
{
}

- (double)maxPauseDelay
{
  return self->_maxPauseDelay;
}

- (double)pauseDurationThreshold
{
  return self->_pauseDurationThreshold;
}

- (unint64_t)attendingListeningType
{
  return self->_attendingListeningType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (double)audioStreamHoldingDurationInSec
{
  return self->_audioStreamHoldingDurationInSec;
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (double)timeoutThresholdInSec
{
  return self->_timeoutThresholdInSec;
}

- (double)prependAudioDuration
{
  return self->_prependAudioDuration;
}

- (double)startOfSpeechNearMissThresholdInMs
{
  return self->_startOfSpeechNearMissThresholdInMs;
}

- (double)startOfSpeechThresholdInMs
{
  return self->_startOfSpeechThresholdInMs;
}

- (BOOL)useBoron
{
  return self->_useBoron;
}

- (BOOL)useOwnVoiceVAD
{
  return self->_useOwnVoiceVAD;
}

- (BOOL)useVAD
{
  return self->_useVAD;
}

- (unint64_t)startAttendingHostTime
{
  return self->_startAttendingHostTime;
}

- (int64_t)attendingType
{
  return self->_attendingType;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t attendingType = self->_attendingType;
  id v5 = a3;
  v6 = +[NSNumber numberWithInteger:attendingType];
  [v5 encodeObject:v6 forKey:@"CSAttendingOptions:::attendingType"];

  v7 = +[NSNumber numberWithUnsignedLongLong:self->_startAttendingHostTime];
  [v5 encodeObject:v7 forKey:@"CSAttendingOptions:::startAttendingHostTime"];

  v8 = +[NSNumber numberWithBool:self->_useVAD];
  [v5 encodeObject:v8 forKey:@"CSAttendingOptions:::useVAD"];

  v9 = +[NSNumber numberWithBool:self->_useOwnVoiceVAD];
  [v5 encodeObject:v9 forKey:@"CSAttendingOptions:::useOwnVoiceVAD"];

  v10 = +[NSNumber numberWithBool:self->_useBoron];
  [v5 encodeObject:v10 forKey:@"CSAttendingOptions:::useBoron"];

  v11 = +[NSNumber numberWithDouble:self->_startOfSpeechThresholdInMs];
  [v5 encodeObject:v11 forKey:@"CSAttendingOptions:::startOfSpeechThresholdInMs"];

  v12 = +[NSNumber numberWithDouble:self->_startOfSpeechNearMissThresholdInMs];
  [v5 encodeObject:v12 forKey:@"CSAttendingOptions:::startOfSpeechNearMissThresholdInMs"];

  v13 = +[NSNumber numberWithDouble:self->_prependAudioDuration];
  [v5 encodeObject:v13 forKey:@"CSAttendingOptions:::prependAudioDuration"];

  v14 = +[NSNumber numberWithDouble:self->_timeoutThresholdInSec];
  [v5 encodeObject:v14 forKey:@"CSAttendingOptions:::timeoutThresholdInSec"];

  v15 = +[NSNumber numberWithInteger:self->_triggerType];
  [v5 encodeObject:v15 forKey:@"CSAttendingOptions:::triggerType"];

  v16 = +[NSNumber numberWithDouble:self->_audioStreamHoldingDurationInSec];
  [v5 encodeObject:v16 forKey:@"CSAttendingOptions:::audioStreamHoldingDurationInSec"];

  v17 = +[NSNumber numberWithLongLong:self->_recordType];
  [v5 encodeObject:v17 forKey:@"CSAttendingOptions:::audioRecordType"];

  [v5 encodeObject:self->_deviceId forKey:@"CSAttendingOptions:::deviceId"];
  v18 = +[NSNumber numberWithUnsignedInteger:self->_attendingListeningType];
  [v5 encodeObject:v18 forKey:@"CSAttendingOptions:::attendingListeningType"];

  v19 = +[NSNumber numberWithDouble:self->_pauseDurationThreshold];
  [v5 encodeObject:v19 forKey:@"CSAttendingOptions:::pauseDurationThreshold"];

  id v20 = +[NSNumber numberWithDouble:self->_maxPauseDelay];
  [v5 encodeObject:v20 forKey:@"CSAttendingOptions:::maxPauseDelay"];
}

- (CSAttendingOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::attendingType"];
  id v40 = [v4 unsignedIntegerValue];

  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::startAttendingHostTime"];
  id v39 = [v5 unsignedLongLongValue];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::useVAD"];
  id v7 = [v6 BOOLValue];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::useOwnVoiceVAD"];
  id v9 = [v8 BOOLValue];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::useBoron"];
  id v11 = [v10 BOOLValue];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::startOfSpeechThresholdInMs"];
  [v12 doubleValue];
  double v14 = v13;

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::prependAudioDuration"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::timeoutThresholdInSec"];
  [v18 doubleValue];
  double v20 = v19;

  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::triggerType"];
  id v22 = [v21 unsignedIntegerValue];

  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::audioStreamHoldingDurationInSec"];
  [v23 doubleValue];
  double v25 = v24;

  v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::audioRecordType"];
  id v27 = [v26 longLongValue];

  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::deviceId"];
  v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::attendingListeningType"];
  id v30 = [v29 unsignedIntegerValue];

  v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::pauseDurationThreshold"];
  [v31 doubleValue];
  double v33 = v32;

  v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingOptions:::maxPauseDelay"];

  [v34 doubleValue];
  double v36 = v35;

  v37 = [(CSAttendingOptions *)self initWithAttendingType:v40 startAttendingHostTime:v39 useVAD:v7 useOwnVoiceVAD:v9 useBoron:v11 startOfSpeechThresholdInMs:v22 prependAudioDuration:v14 timeoutThresholdInSec:v17 triggerType:v20 audioStreamHoldingDurationInSec:v25 audioRecordType:v33 deviceId:v36 attendingListeningType:v27 pauseDurationThreshold:v28 maxPauseDelay:v30];
  return v37;
}

- (id)description
{
  id v3 = +[NSMutableString string];
  unint64_t v4 = self->_attendingType - 1;
  if (v4 > 6) {
    id v5 = @"Default";
  }
  else {
    id v5 = *(&off_1002509A8 + v4);
  }
  v6 = v5;
  [v3 appendFormat:@"[type = %@]", v6];

  objc_msgSend(v3, "appendFormat:", @"[startAttendingHostTime = %llu]", self->_startAttendingHostTime);
  if (self->_useVAD) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@"[useVAD = %@]", v7];
  if (self->_useOwnVoiceVAD) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v3 appendFormat:@"[useOwnVoiceVAD = %@]", v8];
  if (self->_useBoron) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v3 appendFormat:@"[useBoron = %@]", v9];
  [v3 appendFormat:@"[startOfSpeechThresholdInMs = %.2f]", *(void *)&self->_startOfSpeechThresholdInMs];
  [v3 appendFormat:@"[startOfSpeechNearMissThresholdInMs = %.2f]", *(void *)&self->_startOfSpeechNearMissThresholdInMs];
  [v3 appendFormat:@"[prependAudioDuration = %.2f]", *(void *)&self->_prependAudioDuration];
  [v3 appendFormat:@"[timeoutThresholdInSec = %.2f]", *(void *)&self->_timeoutThresholdInSec];
  objc_msgSend(v3, "appendFormat:", @"[triggerType = %lu]", self->_triggerType);
  [v3 appendFormat:@"[audioStreamHoldingDurationInSec = %.2f]", *(void *)&self->_audioStreamHoldingDurationInSec];
  objc_msgSend(v3, "appendFormat:", @"[audioRecordType = %lld]", self->_recordType);
  [v3 appendFormat:@"[deviceId = %@]", self->_deviceId];
  objc_msgSend(v3, "appendFormat:", @"[attendingListeningType = %lu]", self->_attendingListeningType);
  [v3 appendFormat:@"[pauseDurationThreshold = %.2f]", *(void *)&self->_pauseDurationThreshold];
  [v3 appendFormat:@"[maxPauseDelay = %.2f]", *(void *)&self->_maxPauseDelay];
  return v3;
}

- (id)copyWithRecordType:(int64_t)a3
{
  v26 = [CSAttendingOptions alloc];
  int64_t v5 = [(CSAttendingOptions *)self attendingType];
  unint64_t v6 = [(CSAttendingOptions *)self startAttendingHostTime];
  BOOL v7 = [(CSAttendingOptions *)self useVAD];
  BOOL v8 = [(CSAttendingOptions *)self useOwnVoiceVAD];
  BOOL v9 = [(CSAttendingOptions *)self useBoron];
  [(CSAttendingOptions *)self startOfSpeechThresholdInMs];
  double v11 = v10;
  [(CSAttendingOptions *)self prependAudioDuration];
  double v13 = v12;
  [(CSAttendingOptions *)self timeoutThresholdInSec];
  double v15 = v14;
  int64_t v16 = [(CSAttendingOptions *)self triggerType];
  [(CSAttendingOptions *)self audioStreamHoldingDurationInSec];
  double v18 = v17;
  double v19 = [(CSAttendingOptions *)self deviceId];
  unint64_t v20 = [(CSAttendingOptions *)self attendingListeningType];
  [(CSAttendingOptions *)self pauseDurationThreshold];
  double v22 = v21;
  [(CSAttendingOptions *)self maxPauseDelay];
  double v24 = [(CSAttendingOptions *)v26 initWithAttendingType:v5 startAttendingHostTime:v6 useVAD:v7 useOwnVoiceVAD:v8 useBoron:v9 startOfSpeechThresholdInMs:v16 prependAudioDuration:v11 timeoutThresholdInSec:v13 triggerType:v15 audioStreamHoldingDurationInSec:v18 audioRecordType:v22 deviceId:v23 attendingListeningType:a3 pauseDurationThreshold:v19 maxPauseDelay:v20];

  return v24;
}

- (CSAttendingOptions)initWithAttendingType:(int64_t)a3 startAttendingHostTime:(unint64_t)a4 useVAD:(BOOL)a5 useOwnVoiceVAD:(BOOL)a6 useBoron:(BOOL)a7 startOfSpeechThresholdInMs:(double)a8 prependAudioDuration:(double)a9 timeoutThresholdInSec:(double)a10 triggerType:(int64_t)a11 audioStreamHoldingDurationInSec:(double)a12 audioRecordType:(int64_t)a13 deviceId:(id)a14 attendingListeningType:(unint64_t)a15 pauseDurationThreshold:(double)a16 maxPauseDelay:(double)a17
{
  id v29 = a14;
  v39.receiver = self;
  v39.super_class = (Class)CSAttendingOptions;
  id v30 = [(CSAttendingOptions *)&v39 init];
  v31 = v30;
  if (v30)
  {
    v30->_int64_t attendingType = a3;
    v30->_startAttendingHostTime = a4;
    v30->_useVAD = a5;
    v30->_useOwnVoiceVAD = 0;
    v30->_useBoron = a7;
    double v32 = 300.0;
    if (a8 < 0.0) {
      double v33 = 300.0;
    }
    else {
      double v33 = a8;
    }
    v30->_startOfSpeechThresholdInMs = v33;
    v30->_startOfSpeechNearMissThresholdInMs = 120.0;
    if (a9 >= 0.0) {
      double v32 = a9;
    }
    double v34 = 10.0;
    if (a10 >= 0.0) {
      double v34 = a10;
    }
    v30->_prependAudioDuration = v32;
    v30->_timeoutThresholdInSec = v34;
    v30->_triggerType = a11;
    double v35 = 5.0;
    if (a12 >= 0.0) {
      double v35 = a12;
    }
    v30->_audioStreamHoldingDurationInSec = v35;
    v30->_recordType = a13;
    objc_storeStrong((id *)&v30->_deviceId, a14);
    v31->_attendingListeningType = a15;
    double v36 = 3000.0;
    if (a16 > 0.0) {
      double v36 = a16;
    }
    double v37 = 7000.0;
    if (a17 > 0.0) {
      double v37 = a17;
    }
    v31->_pauseDurationThreshold = v36;
    v31->_maxPauseDelay = v37;
  }

  return v31;
}

- (CSAttendingOptions)initWithAttendingType:(int64_t)a3
{
  return [(CSAttendingOptions *)self initWithAttendingType:a3 startAttendingHostTime:0 useVAD:1 useOwnVoiceVAD:0 useBoron:0 startOfSpeechThresholdInMs:1 prependAudioDuration:300.0 timeoutThresholdInSec:700.0 triggerType:10.0 audioStreamHoldingDurationInSec:5.0 audioRecordType:3000.0 deviceId:7000.0 attendingListeningType:1 pauseDurationThreshold:0 maxPauseDelay:2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)optionForJarvisAnnounceMessageWithDeviceId:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[CSAttendingOptions alloc] initWithAttendingType:1 startAttendingHostTime:0 useVAD:1 useOwnVoiceVAD:0 useBoron:0 startOfSpeechThresholdInMs:1 prependAudioDuration:300.0 timeoutThresholdInSec:500.0 triggerType:0.0 audioStreamHoldingDurationInSec:5.0 audioRecordType:3000.0 deviceId:7000.0 attendingListeningType:23 pauseDurationThreshold:v3 maxPauseDelay:2];

  return v4;
}

+ (id)optionForFlexibleFollowupWithAudioRecordType:(int64_t)a3 deviceId:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [[CSAttendingOptions alloc] initWithAttendingType:1 startAttendingHostTime:0 useVAD:1 useOwnVoiceVAD:0 useBoron:1 startOfSpeechThresholdInMs:1 prependAudioDuration:300.0 timeoutThresholdInSec:500.0 triggerType:0.0 audioStreamHoldingDurationInSec:5.0 audioRecordType:3000.0 deviceId:7000.0 attendingListeningType:a3 pauseDurationThreshold:v5 maxPauseDelay:2];

  return v6;
}

@end