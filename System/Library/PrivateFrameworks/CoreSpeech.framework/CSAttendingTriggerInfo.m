@interface CSAttendingTriggerInfo
+ (BOOL)supportsSecureCoding;
+ (id)triggerInfoForServerInvoke;
- (CSAttendingTriggerInfo)initWithAttendingType:(int64_t)a3 detectedToken:(id)a4 triggerMachTime:(unint64_t)a5 triggerAbsStartSampleId:(unint64_t)a6 audioRecordType:(int64_t)a7 audioRecordDeviceId:(id)a8 amountOfSpeechDetectedInMs:(float)a9 triggerThresholdInMs:(float)a10;
- (CSAttendingTriggerInfo)initWithCoder:(id)a3;
- (NSString)detectedToken;
- (NSString)deviceId;
- (float)amountOfSpeechDetectedInMs;
- (float)triggerThresholdInMs;
- (id)description;
- (int64_t)attendingType;
- (int64_t)audioRecordType;
- (unint64_t)triggerAbsStartSampleId;
- (unint64_t)triggerMachTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSAttendingTriggerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_detectedToken, 0);
}

- (float)triggerThresholdInMs
{
  return self->_triggerThresholdInMs;
}

- (float)amountOfSpeechDetectedInMs
{
  return self->_amountOfSpeechDetectedInMs;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (int64_t)audioRecordType
{
  return self->_audioRecordType;
}

- (unint64_t)triggerAbsStartSampleId
{
  return self->_triggerAbsStartSampleId;
}

- (unint64_t)triggerMachTime
{
  return self->_triggerMachTime;
}

- (NSString)detectedToken
{
  return self->_detectedToken;
}

- (int64_t)attendingType
{
  return self->_attendingType;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t attendingType = self->_attendingType;
  id v11 = a3;
  v5 = +[NSNumber numberWithInteger:attendingType];
  [v11 encodeObject:v5 forKey:@"CSAttendingTriggerInfo:::attendingType"];

  [v11 encodeObject:self->_detectedToken forKey:@"CSAttendingTriggerInfo:::detectedToken"];
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_triggerMachTime];
  [v11 encodeObject:v6 forKey:@"CSAttendingTriggerInfo:::triggerMachTime"];

  v7 = +[NSNumber numberWithUnsignedLongLong:self->_triggerAbsStartSampleId];
  [v11 encodeObject:v7 forKey:@"CSAttendingTriggerInfo:::triggerAbsStartSampleId"];

  v8 = +[NSNumber numberWithLongLong:self->_audioRecordType];
  [v11 encodeObject:v8 forKey:@"CSAttendingTriggerInfo:::audioRecordType"];

  [v11 encodeObject:self->_deviceId forKey:@"CSAttendingTriggerInfo:::deviceId"];
  *(float *)&double v9 = self->_amountOfSpeechDetectedInMs;
  [v11 encodeFloat:@"CSAttendingTriggerInfo:::amountOfSpeechDetectedInMs" forKey:v9];
  *(float *)&double v10 = self->_triggerThresholdInMs;
  [v11 encodeFloat:@"CSAttendingTriggerInfo:::detectionThresholdInMs" forKey:v10];
}

- (CSAttendingTriggerInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingTriggerInfo:::attendingType"];
  id v6 = [v5 unsignedIntegerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingTriggerInfo:::detectedToken"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingTriggerInfo:::triggerMachTime"];
  id v9 = [v8 unsignedLongLongValue];

  double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingTriggerInfo:::triggerAbsStartSampleId"];
  id v11 = [v10 unsignedLongLongValue];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingTriggerInfo:::audioRecordType"];
  id v13 = [v12 longLongValue];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSAttendingTriggerInfo:::deviceId"];
  [v4 decodeFloatForKey:@"CSAttendingTriggerInfo:::amountOfSpeechDetectedInMs"];
  int v16 = v15;
  [v4 decodeFloatForKey:@"CSAttendingTriggerInfo:::detectionThresholdInMs"];
  int v18 = v17;

  LODWORD(v19) = v16;
  LODWORD(v20) = v18;
  v21 = [(CSAttendingTriggerInfo *)self initWithAttendingType:v6 detectedToken:v7 triggerMachTime:v9 triggerAbsStartSampleId:v11 audioRecordType:v13 audioRecordDeviceId:v14 amountOfSpeechDetectedInMs:v19 triggerThresholdInMs:v20];

  return v21;
}

- (id)description
{
  v3 = +[NSMutableString string];
  unint64_t v4 = self->_attendingType - 1;
  if (v4 > 6) {
    v5 = @"Default";
  }
  else {
    v5 = *(&off_1002509A8 + v4);
  }
  id v6 = v5;
  [v3 appendFormat:@"[type = %@]", v6];

  [v3 appendFormat:@"[detectedToken = %@]", self->_detectedToken];
  objc_msgSend(v3, "appendFormat:", @"[triggerMachTime = %llu]", self->_triggerMachTime);
  objc_msgSend(v3, "appendFormat:", @"[triggerAbsStartSampleId = %llu]", self->_triggerAbsStartSampleId);
  objc_msgSend(v3, "appendFormat:", @"[recordType = %llu]", self->_audioRecordType);
  [v3 appendFormat:@"[deviceId = %@]", self->_deviceId];
  objc_msgSend(v3, "appendFormat:", @"[amountOfSpeechDetectedInMs = %f]", self->_amountOfSpeechDetectedInMs);
  objc_msgSend(v3, "appendFormat:", @"[detectionThresholdInMs = %f]", self->_triggerThresholdInMs);
  return v3;
}

- (CSAttendingTriggerInfo)initWithAttendingType:(int64_t)a3 detectedToken:(id)a4 triggerMachTime:(unint64_t)a5 triggerAbsStartSampleId:(unint64_t)a6 audioRecordType:(int64_t)a7 audioRecordDeviceId:(id)a8 amountOfSpeechDetectedInMs:(float)a9 triggerThresholdInMs:(float)a10
{
  id v19 = a4;
  id v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSAttendingTriggerInfo;
  v21 = [(CSAttendingTriggerInfo *)&v24 init];
  v22 = v21;
  if (v21)
  {
    v21->_int64_t attendingType = a3;
    objc_storeStrong((id *)&v21->_detectedToken, a4);
    v22->_triggerMachTime = a5;
    v22->_triggerAbsStartSampleId = a6;
    v22->_audioRecordType = a7;
    objc_storeStrong((id *)&v22->_deviceId, a8);
    v22->_amountOfSpeechDetectedInMs = a9;
    v22->_triggerThresholdInMs = a10;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)triggerInfoForServerInvoke
{
  v2 = [[CSAttendingTriggerInfo alloc] initWithAttendingType:0 detectedToken:0 triggerMachTime:0 triggerAbsStartSampleId:0 audioRecordType:5 audioRecordDeviceId:0 amountOfSpeechDetectedInMs:0.0 triggerThresholdInMs:0.0];
  return v2;
}

@end