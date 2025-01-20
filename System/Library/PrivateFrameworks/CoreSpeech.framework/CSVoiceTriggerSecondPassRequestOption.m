@interface CSVoiceTriggerSecondPassRequestOption
- (BOOL)isSecondChanceRun;
- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics;
- (CSVoiceTriggerRTModelRequestOptions)rtModelRequestOptions;
- (CSVoiceTriggerSecondPassRequestOption)initWithFirstPassSource:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rejectionMHUUID:(id)a7 isSecondChanceRun:(BOOL)a8 firstpassMetrics:(id)a9 rtModelRequestOptions:(id)a10;
- (NSDictionary)firstPassTriggerInfo;
- (NSString)audioProviderUUID;
- (NSString)deviceId;
- (NSUUID)rejectionMHUUID;
- (unint64_t)firstPassSource;
@end

@implementation CSVoiceTriggerSecondPassRequestOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtModelRequestOptions, 0);
  objc_storeStrong((id *)&self->_firstpassMetrics, 0);
  objc_storeStrong((id *)&self->_rejectionMHUUID, 0);
  objc_storeStrong((id *)&self->_firstPassTriggerInfo, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

- (CSVoiceTriggerRTModelRequestOptions)rtModelRequestOptions
{
  return self->_rtModelRequestOptions;
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (BOOL)isSecondChanceRun
{
  return self->_isSecondChanceRun;
}

- (NSUUID)rejectionMHUUID
{
  return self->_rejectionMHUUID;
}

- (NSDictionary)firstPassTriggerInfo
{
  return self->_firstPassTriggerInfo;
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unint64_t)firstPassSource
{
  return self->_firstPassSource;
}

- (CSVoiceTriggerSecondPassRequestOption)initWithFirstPassSource:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rejectionMHUUID:(id)a7 isSecondChanceRun:(BOOL)a8 firstpassMetrics:(id)a9 rtModelRequestOptions:(id)a10
{
  id v29 = a4;
  id v28 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CSVoiceTriggerSecondPassRequestOption;
  v20 = [(CSVoiceTriggerSecondPassRequestOption *)&v30 init];
  v21 = v20;
  if (v20)
  {
    v20->_firstPassSource = a3;
    objc_storeStrong((id *)&v20->_deviceId, a4);
    objc_storeStrong((id *)&v21->_audioProviderUUID, a5);
    v22 = (NSDictionary *)[v16 copy];
    firstPassTriggerInfo = v21->_firstPassTriggerInfo;
    v21->_firstPassTriggerInfo = v22;

    v24 = (NSUUID *)[v17 copy];
    rejectionMHUUID = v21->_rejectionMHUUID;
    v21->_rejectionMHUUID = v24;

    v21->_isSecondChanceRun = a8;
    objc_storeStrong((id *)&v21->_firstpassMetrics, a9);
    objc_storeStrong((id *)&v21->_rtModelRequestOptions, a10);
  }

  return v21;
}

@end