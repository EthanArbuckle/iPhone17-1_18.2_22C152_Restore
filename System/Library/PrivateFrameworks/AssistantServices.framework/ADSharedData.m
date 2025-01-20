@interface ADSharedData
- (AFVoiceInfo)outputVoice;
- (AFVoiceInfo)previousOutputVoice;
- (BOOL)cloudSyncEnabled;
- (BOOL)dictationEnabled;
- (BOOL)isLocationSharingDevice;
- (BOOL)isRemotePlaybackDevice;
- (BOOL)shouldCensorSpeech;
- (BOOL)siriEnabled;
- (NSArray)notificationPreviewRestrictedApps;
- (NSDictionary)utsRequiredRequestKeyValuePairs;
- (NSString)airplayRouteId;
- (NSString)assistantId;
- (NSString)dataSharingOptInStatus;
- (NSString)ekToken;
- (NSString)hostname;
- (NSString)languageCode;
- (NSString)loggingAssistantId;
- (NSString)loggingSharedUserId;
- (NSString)previousLanguageCode;
- (NSString)sharedUserId;
- (NSString)speechId;
- (NSString)storeFrontId;
- (NSString)temperatureUnit;
- (NSString)userAgent;
- (NSString)userAssignedName;
- (NSString)userToken;
- (id)description;
- (void)setAirplayRouteId:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setDataSharingOptInStatus:(id)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setEkToken:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIsLocationSharingDevice:(BOOL)a3;
- (void)setIsRemotePlaybackDevice:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLoggingAssistantId:(id)a3;
- (void)setLoggingSharedUserId:(id)a3;
- (void)setNotificationPreviewRestrictedApps:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setPreviousLanguageCode:(id)a3;
- (void)setPreviousOutputVoice:(id)a3;
- (void)setSharedUserId:(id)a3;
- (void)setShouldCensorSpeech:(BOOL)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setSpeechId:(id)a3;
- (void)setStoreFrontId:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setUserAssignedName:(id)a3;
- (void)setUserToken:(id)a3;
- (void)setUtsRequiredRequestKeyValuePairs:(id)a3;
@end

@implementation ADSharedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSharingOptInStatus, 0);
  objc_storeStrong((id *)&self->_utsRequiredRequestKeyValuePairs, 0);
  objc_storeStrong((id *)&self->_userAssignedName, 0);
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_ekToken, 0);
  objc_storeStrong((id *)&self->_storeFrontId, 0);
  objc_storeStrong((id *)&self->_airplayRouteId, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
  objc_storeStrong((id *)&self->_notificationPreviewRestrictedApps, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);
  objc_storeStrong((id *)&self->_previousOutputVoice, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_previousLanguageCode, 0);
  objc_storeStrong((id *)&self->_loggingSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_loggingAssistantId, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
}

- (void)setDataSharingOptInStatus:(id)a3
{
}

- (NSString)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (void)setUtsRequiredRequestKeyValuePairs:(id)a3
{
}

- (NSDictionary)utsRequiredRequestKeyValuePairs
{
  return self->_utsRequiredRequestKeyValuePairs;
}

- (void)setUserAssignedName:(id)a3
{
}

- (NSString)userAssignedName
{
  return self->_userAssignedName;
}

- (void)setIsRemotePlaybackDevice:(BOOL)a3
{
  self->_isRemotePlaybackDevice = a3;
}

- (BOOL)isRemotePlaybackDevice
{
  return self->_isRemotePlaybackDevice;
}

- (void)setUserToken:(id)a3
{
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setEkToken:(id)a3
{
}

- (NSString)ekToken
{
  return self->_ekToken;
}

- (void)setStoreFrontId:(id)a3
{
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setAirplayRouteId:(id)a3
{
}

- (NSString)airplayRouteId
{
  return self->_airplayRouteId;
}

- (void)setTemperatureUnit:(id)a3
{
}

- (NSString)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setNotificationPreviewRestrictedApps:(id)a3
{
}

- (NSArray)notificationPreviewRestrictedApps
{
  return self->_notificationPreviewRestrictedApps;
}

- (void)setIsLocationSharingDevice:(BOOL)a3
{
  self->_isLocationSharingDevice = a3;
}

- (BOOL)isLocationSharingDevice
{
  return self->_isLocationSharingDevice;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setShouldCensorSpeech:(BOOL)a3
{
  self->_shouldCensorSpeech = a3;
}

- (BOOL)shouldCensorSpeech
{
  return self->_shouldCensorSpeech;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->_cloudSyncEnabled = a3;
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setHostname:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setOutputVoice:(id)a3
{
}

- (AFVoiceInfo)outputVoice
{
  return self->_outputVoice;
}

- (void)setPreviousOutputVoice:(id)a3
{
}

- (AFVoiceInfo)previousOutputVoice
{
  return self->_previousOutputVoice;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setPreviousLanguageCode:(id)a3
{
}

- (NSString)previousLanguageCode
{
  return self->_previousLanguageCode;
}

- (void)setLoggingSharedUserId:(id)a3
{
}

- (NSString)loggingSharedUserId
{
  return self->_loggingSharedUserId;
}

- (void)setSharedUserId:(id)a3
{
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setLoggingAssistantId:(id)a3
{
}

- (NSString)loggingAssistantId
{
  return self->_loggingAssistantId;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setDictationEnabled:(BOOL)a3
{
  self->_dictationEnabled = a3;
}

- (BOOL)dictationEnabled
{
  return self->_dictationEnabled;
}

- (void)setSiriEnabled:(BOOL)a3
{
  self->_siriEnabled = a3;
}

- (BOOL)siriEnabled
{
  return self->_siriEnabled;
}

- (id)description
{
  id v27 = objc_alloc((Class)NSString);
  v35.receiver = self;
  v35.super_class = (Class)ADSharedData;
  uint64_t v3 = [(ADSharedData *)&v35 description];
  userAssignedName = self->_userAssignedName;
  uint64_t v4 = +[NSNumber numberWithBool:self->_siriEnabled];
  uint64_t v5 = +[NSNumber numberWithBool:self->_dictationEnabled];
  loggingAssistantId = self->_loggingAssistantId;
  assistantId = self->_assistantId;
  speechId = self->_speechId;
  loggingSharedUserId = self->_loggingSharedUserId;
  sharedUserId = self->_sharedUserId;
  previousLanguageCode = self->_previousLanguageCode;
  languageCode = self->_languageCode;
  uint64_t v6 = [(AFVoiceInfo *)self->_outputVoice languageCode];
  v33 = [(AFVoiceInfo *)self->_outputVoice name];
  v26 = v33;
  if (!v33)
  {
    v33 = [(AFVoiceInfo *)self->_outputVoice genderString];
  }
  v28 = (void *)v6;
  v29 = (void *)v5;
  v30 = (void *)v4;
  v31 = (void *)v3;
  v34 = [(AFVoiceInfo *)self->_previousOutputVoice languageCode];
  v7 = [(AFVoiceInfo *)self->_previousOutputVoice name];
  v32 = v7;
  if (!v7)
  {
    v32 = [(AFVoiceInfo *)self->_previousOutputVoice genderString];
  }
  hostname = self->_hostname;
  v9 = +[NSNumber numberWithBool:self->_cloudSyncEnabled];
  v10 = +[NSNumber numberWithBool:self->_shouldCensorSpeech];
  userAgent = self->_userAgent;
  v12 = +[NSNumber numberWithBool:self->_isLocationSharingDevice];
  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  temperatureUnit = self->_temperatureUnit;
  v15 = +[NSNumber numberWithBool:self->_isRemotePlaybackDevice];
  id v16 = objc_msgSend(v27, "initWithFormat:", @"%@ name: %@ enabled: %@ dictation: %@ assistant id: %@ logging assistant id: %@ speech id: %@ sharedUserId: %@ logging sharedUserId: %@ language: %@ prev language: %@ outputVoice: %@ %@ prev: outputVoice: %@ %@ hostname: %@ cloud sync enabled: %@ should censor speech: %@ user agent: %@ is location sharing device: %@ notification restricted apps: %@ temperature unit: %@ remote playback device: %@", v31, userAssignedName, v30, v29, assistantId, loggingAssistantId, speechId, sharedUserId, loggingSharedUserId, languageCode, previousLanguageCode, v28, v33, v34, v32, hostname,
          v9,
          v10,
          userAgent,
          v12,
          notificationPreviewRestrictedApps,
          temperatureUnit,
          v15);

  if (!v7) {
  if (!v26)
  }

  return v16;
}

@end