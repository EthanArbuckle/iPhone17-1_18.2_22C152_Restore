@interface _ADPBDeviceSetDataRequest
+ (Class)notificationPreviewRestrictedAppsType;
+ (unsigned)_ADPBDeviceRequestType;
- (ADSharedData)_ad_data;
- (BOOL)activityContinuationAllowed;
- (BOOL)cloudSyncEnabled;
- (BOOL)dictationEnabled;
- (BOOL)hasActivityContinuationAllowed;
- (BOOL)hasAirplayRouteId;
- (BOOL)hasAssistantId;
- (BOOL)hasCloudSyncEnabled;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasDictationEnabled;
- (BOOL)hasEkToken;
- (BOOL)hasHostname;
- (BOOL)hasIsLocationSharingDevice;
- (BOOL)hasIsRemotePlaybackDevice;
- (BOOL)hasLanguageCode;
- (BOOL)hasLoggingAssistantId;
- (BOOL)hasLoggingSharedId;
- (BOOL)hasOutputVoice;
- (BOOL)hasPreviousLangaugeCode;
- (BOOL)hasPreviousOutputVoice;
- (BOOL)hasSharedId;
- (BOOL)hasShouldCensorSpeech;
- (BOOL)hasSiriEnabled;
- (BOOL)hasSpeechId;
- (BOOL)hasStoreFrontId;
- (BOOL)hasTemperatureUnit;
- (BOOL)hasUserAgent;
- (BOOL)hasUserAssignedName;
- (BOOL)hasUserToken;
- (BOOL)hasUtsRequiredRequestData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocationSharingDevice;
- (BOOL)isRemotePlaybackDevice;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCensorSpeech;
- (BOOL)siriEnabled;
- (NSMutableArray)notificationPreviewRestrictedApps;
- (NSString)airplayRouteId;
- (NSString)assistantId;
- (NSString)dataSharingOptInStatus;
- (NSString)ekToken;
- (NSString)hostname;
- (NSString)languageCode;
- (NSString)loggingAssistantId;
- (NSString)loggingSharedId;
- (NSString)previousLangaugeCode;
- (NSString)sharedId;
- (NSString)speechId;
- (NSString)storeFrontId;
- (NSString)temperatureUnit;
- (NSString)userAgent;
- (NSString)userAssignedName;
- (NSString)userToken;
- (_ADPBDeviceOutputVoiceInfo)outputVoice;
- (_ADPBDeviceOutputVoiceInfo)previousOutputVoice;
- (_ADPBDeviceStringKeyValueDictionary)utsRequiredRequestData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)notificationPreviewRestrictedAppsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)notificationPreviewRestrictedAppsCount;
- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4;
- (void)_ad_setData:(id)a3;
- (void)addNotificationPreviewRestrictedApps:(id)a3;
- (void)clearNotificationPreviewRestrictedApps;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityContinuationAllowed:(BOOL)a3;
- (void)setAirplayRouteId:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setDataSharingOptInStatus:(id)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setEkToken:(id)a3;
- (void)setHasActivityContinuationAllowed:(BOOL)a3;
- (void)setHasCloudSyncEnabled:(BOOL)a3;
- (void)setHasDictationEnabled:(BOOL)a3;
- (void)setHasIsLocationSharingDevice:(BOOL)a3;
- (void)setHasIsRemotePlaybackDevice:(BOOL)a3;
- (void)setHasShouldCensorSpeech:(BOOL)a3;
- (void)setHasSiriEnabled:(BOOL)a3;
- (void)setHostname:(id)a3;
- (void)setIsLocationSharingDevice:(BOOL)a3;
- (void)setIsRemotePlaybackDevice:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLoggingAssistantId:(id)a3;
- (void)setLoggingSharedId:(id)a3;
- (void)setNotificationPreviewRestrictedApps:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setPreviousLangaugeCode:(id)a3;
- (void)setPreviousOutputVoice:(id)a3;
- (void)setSharedId:(id)a3;
- (void)setShouldCensorSpeech:(BOOL)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setSpeechId:(id)a3;
- (void)setStoreFrontId:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setUserAssignedName:(id)a3;
- (void)setUserToken:(id)a3;
- (void)setUtsRequiredRequestData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceSetDataRequest

+ (unsigned)_ADPBDeviceRequestType
{
  return 2;
}

- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = [(_ADPBDeviceSetDataRequest *)self _ad_data];
  [v6 _dataDidUpdate:v7];

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    v8 = v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utsRequiredRequestData, 0);
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_userAssignedName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
  objc_storeStrong((id *)&self->_storeFrontId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_sharedId, 0);
  objc_storeStrong((id *)&self->_previousOutputVoice, 0);
  objc_storeStrong((id *)&self->_previousLangaugeCode, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);
  objc_storeStrong((id *)&self->_notificationPreviewRestrictedApps, 0);
  objc_storeStrong((id *)&self->_loggingSharedId, 0);
  objc_storeStrong((id *)&self->_loggingAssistantId, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_ekToken, 0);
  objc_storeStrong((id *)&self->_dataSharingOptInStatus, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
  objc_storeStrong((id *)&self->_airplayRouteId, 0);
}

- (void)setDataSharingOptInStatus:(id)a3
{
}

- (NSString)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (void)setUtsRequiredRequestData:(id)a3
{
}

- (_ADPBDeviceStringKeyValueDictionary)utsRequiredRequestData
{
  return self->_utsRequiredRequestData;
}

- (void)setUserAssignedName:(id)a3
{
}

- (NSString)userAssignedName
{
  return self->_userAssignedName;
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

- (void)setAirplayRouteId:(id)a3
{
}

- (NSString)airplayRouteId
{
  return self->_airplayRouteId;
}

- (void)setStoreFrontId:(id)a3
{
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setLoggingSharedId:(id)a3
{
}

- (NSString)loggingSharedId
{
  return self->_loggingSharedId;
}

- (void)setLoggingAssistantId:(id)a3
{
}

- (NSString)loggingAssistantId
{
  return self->_loggingAssistantId;
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

- (NSMutableArray)notificationPreviewRestrictedApps
{
  return self->_notificationPreviewRestrictedApps;
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

- (BOOL)shouldCensorSpeech
{
  return self->_shouldCensorSpeech;
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setOutputVoice:(id)a3
{
}

- (_ADPBDeviceOutputVoiceInfo)outputVoice
{
  return self->_outputVoice;
}

- (void)setPreviousOutputVoice:(id)a3
{
}

- (_ADPBDeviceOutputVoiceInfo)previousOutputVoice
{
  return self->_previousOutputVoice;
}

- (void)setPreviousLangaugeCode:(id)a3
{
}

- (NSString)previousLangaugeCode
{
  return self->_previousLangaugeCode;
}

- (void)setSharedId:(id)a3
{
}

- (NSString)sharedId
{
  return self->_sharedId;
}

- (BOOL)dictationEnabled
{
  return self->_dictationEnabled;
}

- (BOOL)activityContinuationAllowed
{
  return self->_activityContinuationAllowed;
}

- (void)setHostname:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (BOOL)siriEnabled
{
  return self->_siriEnabled;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if ((v4[176] & 0x40) != 0)
  {
    self->_siriEnabled = v4[174];
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 14)) {
    -[_ADPBDeviceSetDataRequest setSpeechId:](self, "setSpeechId:");
  }
  if (*((void *)v5 + 6)) {
    -[_ADPBDeviceSetDataRequest setLanguageCode:](self, "setLanguageCode:");
  }
  if (*((void *)v5 + 2)) {
    -[_ADPBDeviceSetDataRequest setAssistantId:](self, "setAssistantId:");
  }
  if (*((void *)v5 + 5)) {
    -[_ADPBDeviceSetDataRequest setHostname:](self, "setHostname:");
  }
  char v6 = *((unsigned char *)v5 + 176);
  if (v6)
  {
    self->_activityContinuationAllowed = *((unsigned char *)v5 + 168);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v5 + 176);
  }
  if ((v6 & 4) != 0)
  {
    self->_dictationEnabled = *((unsigned char *)v5 + 170);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 13)) {
    -[_ADPBDeviceSetDataRequest setSharedId:](self, "setSharedId:");
  }
  if (*((void *)v5 + 11)) {
    -[_ADPBDeviceSetDataRequest setPreviousLangaugeCode:](self, "setPreviousLangaugeCode:");
  }
  previousOutputVoice = self->_previousOutputVoice;
  uint64_t v8 = *((void *)v5 + 12);
  if (previousOutputVoice)
  {
    if (v8) {
      -[_ADPBDeviceOutputVoiceInfo mergeFrom:](previousOutputVoice, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_ADPBDeviceSetDataRequest setPreviousOutputVoice:](self, "setPreviousOutputVoice:");
  }
  outputVoice = self->_outputVoice;
  uint64_t v10 = *((void *)v5 + 10);
  if (outputVoice)
  {
    if (v10) {
      -[_ADPBDeviceOutputVoiceInfo mergeFrom:](outputVoice, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[_ADPBDeviceSetDataRequest setOutputVoice:](self, "setOutputVoice:");
  }
  char v11 = *((unsigned char *)v5 + 176);
  if ((v11 & 2) != 0)
  {
    self->_cloudSyncEnabled = *((unsigned char *)v5 + 169);
    *(unsigned char *)&self->_has |= 2u;
    char v11 = *((unsigned char *)v5 + 176);
  }
  if ((v11 & 0x20) != 0)
  {
    self->_shouldCensorSpeech = *((unsigned char *)v5 + 173);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v5 + 17)) {
    -[_ADPBDeviceSetDataRequest setUserAgent:](self, "setUserAgent:");
  }
  if ((*((unsigned char *)v5 + 176) & 8) != 0)
  {
    self->_isLocationSharingDevice = *((unsigned char *)v5 + 171);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = *((id *)v5 + 9);
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        -[_ADPBDeviceSetDataRequest addNotificationPreviewRestrictedApps:](self, "addNotificationPreviewRestrictedApps:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if (*((void *)v5 + 16)) {
    -[_ADPBDeviceSetDataRequest setTemperatureUnit:](self, "setTemperatureUnit:");
  }
  if (*((void *)v5 + 7)) {
    -[_ADPBDeviceSetDataRequest setLoggingAssistantId:](self, "setLoggingAssistantId:");
  }
  if (*((void *)v5 + 8)) {
    -[_ADPBDeviceSetDataRequest setLoggingSharedId:](self, "setLoggingSharedId:");
  }
  if (*((void *)v5 + 15)) {
    -[_ADPBDeviceSetDataRequest setStoreFrontId:](self, "setStoreFrontId:");
  }
  if (*((void *)v5 + 1)) {
    [(_ADPBDeviceSetDataRequest *)self setAirplayRouteId:"setAirplayRouteId:"];
  }
  if (*((void *)v5 + 4)) {
    -[_ADPBDeviceSetDataRequest setEkToken:](self, "setEkToken:");
  }
  if (*((void *)v5 + 19)) {
    -[_ADPBDeviceSetDataRequest setUserToken:](self, "setUserToken:");
  }
  if ((*((unsigned char *)v5 + 176) & 0x10) != 0)
  {
    self->_isRemotePlaybackDevice = *((unsigned char *)v5 + 172);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 18)) {
    -[_ADPBDeviceSetDataRequest setUserAssignedName:](self, "setUserAssignedName:");
  }
  utsRequiredRequestData = self->_utsRequiredRequestData;
  uint64_t v18 = *((void *)v5 + 20);
  if (utsRequiredRequestData)
  {
    if (v18) {
      -[_ADPBDeviceStringKeyValueDictionary mergeFrom:](utsRequiredRequestData, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[_ADPBDeviceSetDataRequest setUtsRequiredRequestData:](self, "setUtsRequiredRequestData:");
  }
  if (*((void *)v5 + 3)) {
    -[_ADPBDeviceSetDataRequest setDataSharingOptInStatus:](self, "setDataSharingOptInStatus:");
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v31 = 2654435761 * self->_siriEnabled;
  }
  else {
    uint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_speechId hash];
  NSUInteger v29 = [(NSString *)self->_languageCode hash];
  NSUInteger v28 = [(NSString *)self->_assistantId hash];
  NSUInteger v27 = [(NSString *)self->_hostname hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v26 = 2654435761 * self->_activityContinuationAllowed;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v25 = 2654435761 * self->_dictationEnabled;
      goto LABEL_9;
    }
  }
  uint64_t v25 = 0;
LABEL_9:
  NSUInteger v24 = [(NSString *)self->_sharedId hash];
  NSUInteger v23 = [(NSString *)self->_previousLangaugeCode hash];
  unint64_t v22 = [(_ADPBDeviceOutputVoiceInfo *)self->_previousOutputVoice hash];
  unint64_t v21 = [(_ADPBDeviceOutputVoiceInfo *)self->_outputVoice hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v20 = 2654435761 * self->_cloudSyncEnabled;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_11:
      uint64_t v19 = 2654435761 * self->_shouldCensorSpeech;
      goto LABEL_14;
    }
  }
  uint64_t v19 = 0;
LABEL_14:
  NSUInteger v17 = [(NSString *)self->_userAgent hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_isLocationSharingDevice;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_notificationPreviewRestrictedApps hash];
  NSUInteger v5 = [(NSString *)self->_temperatureUnit hash];
  NSUInteger v6 = [(NSString *)self->_loggingAssistantId hash];
  NSUInteger v7 = [(NSString *)self->_loggingSharedId hash];
  NSUInteger v8 = [(NSString *)self->_storeFrontId hash];
  NSUInteger v9 = [(NSString *)self->_airplayRouteId hash];
  NSUInteger v10 = [(NSString *)self->_ekToken hash];
  NSUInteger v11 = [(NSString *)self->_userToken hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v12 = 2654435761 * self->_isRemotePlaybackDevice;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  unint64_t v14 = v12 ^ [(NSString *)self->_userAssignedName hash];
  unint64_t v15 = v14 ^ [(_ADPBDeviceStringKeyValueDictionary *)self->_utsRequiredRequestData hash];
  return v13 ^ v15 ^ [(NSString *)self->_dataSharingOptInStatus hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 176) & 0x40) == 0) {
      goto LABEL_99;
    }
    if (self->_siriEnabled)
    {
      if (!*((unsigned char *)v4 + 174)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 174))
    {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 176) & 0x40) != 0)
  {
    goto LABEL_99;
  }
  speechId = self->_speechId;
  if ((unint64_t)speechId | *((void *)v4 + 14) && !-[NSString isEqual:](speechId, "isEqual:")) {
    goto LABEL_99;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:")) {
      goto LABEL_99;
    }
  }
  assistantId = self->_assistantId;
  if ((unint64_t)assistantId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](assistantId, "isEqual:")) {
      goto LABEL_99;
    }
  }
  hostname = self->_hostname;
  if ((unint64_t)hostname | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](hostname, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 176) & 1) == 0) {
      goto LABEL_99;
    }
    if (self->_activityContinuationAllowed)
    {
      if (!*((unsigned char *)v4 + 168)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 168))
    {
      goto LABEL_99;
    }
  }
  else if (*((unsigned char *)v4 + 176))
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 176) & 4) == 0) {
      goto LABEL_99;
    }
    if (self->_dictationEnabled)
    {
      if (!*((unsigned char *)v4 + 170)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 170))
    {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 176) & 4) != 0)
  {
    goto LABEL_99;
  }
  sharedId = self->_sharedId;
  if ((unint64_t)sharedId | *((void *)v4 + 13) && !-[NSString isEqual:](sharedId, "isEqual:")) {
    goto LABEL_99;
  }
  previousLangaugeCode = self->_previousLangaugeCode;
  if ((unint64_t)previousLangaugeCode | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](previousLangaugeCode, "isEqual:")) {
      goto LABEL_99;
    }
  }
  previousOutputVoice = self->_previousOutputVoice;
  if ((unint64_t)previousOutputVoice | *((void *)v4 + 12))
  {
    if (!-[_ADPBDeviceOutputVoiceInfo isEqual:](previousOutputVoice, "isEqual:")) {
      goto LABEL_99;
    }
  }
  outputVoice = self->_outputVoice;
  if ((unint64_t)outputVoice | *((void *)v4 + 10))
  {
    if (!-[_ADPBDeviceOutputVoiceInfo isEqual:](outputVoice, "isEqual:")) {
      goto LABEL_99;
    }
  }
  char has = (char)self->_has;
  char v14 = *((unsigned char *)v4 + 176);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 176) & 2) == 0) {
      goto LABEL_99;
    }
    if (self->_cloudSyncEnabled)
    {
      if (!*((unsigned char *)v4 + 169)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 169))
    {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 176) & 2) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 176) & 0x20) == 0) {
      goto LABEL_99;
    }
    if (self->_shouldCensorSpeech)
    {
      if (!*((unsigned char *)v4 + 173)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 173))
    {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 176) & 0x20) != 0)
  {
    goto LABEL_99;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:")) {
      goto LABEL_99;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 176);
  }
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0) {
      goto LABEL_99;
    }
    if (self->_isLocationSharingDevice)
    {
      if (!*((unsigned char *)v4 + 171)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 171))
    {
      goto LABEL_99;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_99;
  }
  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  if ((unint64_t)notificationPreviewRestrictedApps | *((void *)v4 + 9)
    && !-[NSMutableArray isEqual:](notificationPreviewRestrictedApps, "isEqual:"))
  {
    goto LABEL_99;
  }
  temperatureUnit = self->_temperatureUnit;
  if ((unint64_t)temperatureUnit | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](temperatureUnit, "isEqual:")) {
      goto LABEL_99;
    }
  }
  loggingAssistantId = self->_loggingAssistantId;
  if ((unint64_t)loggingAssistantId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](loggingAssistantId, "isEqual:")) {
      goto LABEL_99;
    }
  }
  loggingSharedId = self->_loggingSharedId;
  if ((unint64_t)loggingSharedId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](loggingSharedId, "isEqual:")) {
      goto LABEL_99;
    }
  }
  storeFrontId = self->_storeFrontId;
  if ((unint64_t)storeFrontId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](storeFrontId, "isEqual:")) {
      goto LABEL_99;
    }
  }
  airplayRouteId = self->_airplayRouteId;
  if ((unint64_t)airplayRouteId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](airplayRouteId, "isEqual:")) {
      goto LABEL_99;
    }
  }
  ekToken = self->_ekToken;
  if ((unint64_t)ekToken | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](ekToken, "isEqual:")) {
      goto LABEL_99;
    }
  }
  userToken = self->_userToken;
  if ((unint64_t)userToken | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](userToken, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 176) & 0x10) != 0)
    {
      if (self->_isRemotePlaybackDevice)
      {
        if (!*((unsigned char *)v4 + 172)) {
          goto LABEL_99;
        }
        goto LABEL_93;
      }
      if (!*((unsigned char *)v4 + 172)) {
        goto LABEL_93;
      }
    }
LABEL_99:
    unsigned __int8 v27 = 0;
    goto LABEL_100;
  }
  if ((*((unsigned char *)v4 + 176) & 0x10) != 0) {
    goto LABEL_99;
  }
LABEL_93:
  userAssignedName = self->_userAssignedName;
  if ((unint64_t)userAssignedName | *((void *)v4 + 18)
    && !-[NSString isEqual:](userAssignedName, "isEqual:"))
  {
    goto LABEL_99;
  }
  utsRequiredRequestData = self->_utsRequiredRequestData;
  if ((unint64_t)utsRequiredRequestData | *((void *)v4 + 20))
  {
    if (!-[_ADPBDeviceStringKeyValueDictionary isEqual:](utsRequiredRequestData, "isEqual:")) {
      goto LABEL_99;
    }
  }
  dataSharingOptInStatus = self->_dataSharingOptInStatus;
  if ((unint64_t)dataSharingOptInStatus | *((void *)v4 + 3)) {
    unsigned __int8 v27 = -[NSString isEqual:](dataSharingOptInStatus, "isEqual:");
  }
  else {
    unsigned __int8 v27 = 1;
  }
LABEL_100:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v5[174] = self->_siriEnabled;
    v5[176] |= 0x40u;
  }
  id v7 = [(NSString *)self->_speechId copyWithZone:a3];
  NSUInteger v8 = (void *)v6[14];
  v6[14] = v7;

  id v9 = [(NSString *)self->_languageCode copyWithZone:a3];
  NSUInteger v10 = (void *)v6[6];
  v6[6] = v9;

  id v11 = [(NSString *)self->_assistantId copyWithZone:a3];
  uint64_t v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(NSString *)self->_hostname copyWithZone:a3];
  char v14 = (void *)v6[5];
  v6[5] = v13;

  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)v6 + 168) = self->_activityContinuationAllowed;
    *((unsigned char *)v6 + 176) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v6 + 170) = self->_dictationEnabled;
    *((unsigned char *)v6 + 176) |= 4u;
  }
  id v16 = [(NSString *)self->_sharedId copyWithZone:a3];
  NSUInteger v17 = (void *)v6[13];
  v6[13] = v16;

  id v18 = [(NSString *)self->_previousLangaugeCode copyWithZone:a3];
  uint64_t v19 = (void *)v6[11];
  v6[11] = v18;

  id v20 = [(_ADPBDeviceOutputVoiceInfo *)self->_previousOutputVoice copyWithZone:a3];
  unint64_t v21 = (void *)v6[12];
  v6[12] = v20;

  id v22 = [(_ADPBDeviceOutputVoiceInfo *)self->_outputVoice copyWithZone:a3];
  NSUInteger v23 = (void *)v6[10];
  v6[10] = v22;

  char v24 = (char)self->_has;
  if ((v24 & 2) != 0)
  {
    *((unsigned char *)v6 + 169) = self->_cloudSyncEnabled;
    *((unsigned char *)v6 + 176) |= 2u;
    char v24 = (char)self->_has;
  }
  if ((v24 & 0x20) != 0)
  {
    *((unsigned char *)v6 + 173) = self->_shouldCensorSpeech;
    *((unsigned char *)v6 + 176) |= 0x20u;
  }
  id v25 = [(NSString *)self->_userAgent copyWithZone:a3];
  uint64_t v26 = (void *)v6[17];
  v6[17] = v25;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v6 + 171) = self->_isLocationSharingDevice;
    *((unsigned char *)v6 + 176) |= 8u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  unsigned __int8 v27 = self->_notificationPreviewRestrictedApps;
  id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v55;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v55 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "copyWithZone:", a3, (void)v54);
        [v6 addNotificationPreviewRestrictedApps:v32];
      }
      id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v29);
  }

  id v33 = [(NSString *)self->_temperatureUnit copyWithZone:a3];
  v34 = (void *)v6[16];
  v6[16] = v33;

  id v35 = [(NSString *)self->_loggingAssistantId copyWithZone:a3];
  v36 = (void *)v6[7];
  v6[7] = v35;

  id v37 = [(NSString *)self->_loggingSharedId copyWithZone:a3];
  v38 = (void *)v6[8];
  v6[8] = v37;

  id v39 = [(NSString *)self->_storeFrontId copyWithZone:a3];
  v40 = (void *)v6[15];
  v6[15] = v39;

  id v41 = [(NSString *)self->_airplayRouteId copyWithZone:a3];
  v42 = (void *)v6[1];
  v6[1] = v41;

  id v43 = [(NSString *)self->_ekToken copyWithZone:a3];
  v44 = (void *)v6[4];
  v6[4] = v43;

  id v45 = [(NSString *)self->_userToken copyWithZone:a3];
  v46 = (void *)v6[19];
  v6[19] = v45;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v6 + 172) = self->_isRemotePlaybackDevice;
    *((unsigned char *)v6 + 176) |= 0x10u;
  }
  id v47 = -[NSString copyWithZone:](self->_userAssignedName, "copyWithZone:", a3, (void)v54);
  v48 = (void *)v6[18];
  v6[18] = v47;

  id v49 = [(_ADPBDeviceStringKeyValueDictionary *)self->_utsRequiredRequestData copyWithZone:a3];
  v50 = (void *)v6[20];
  v6[20] = v49;

  id v51 = [(NSString *)self->_dataSharingOptInStatus copyWithZone:a3];
  v52 = (void *)v6[3];
  v6[3] = v51;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v4[174] = self->_siriEnabled;
    v4[176] |= 0x40u;
  }
  uint64_t v12 = v4;
  if (self->_speechId)
  {
    objc_msgSend(v4, "setSpeechId:");
    id v4 = v12;
  }
  if (self->_languageCode)
  {
    objc_msgSend(v12, "setLanguageCode:");
    id v4 = v12;
  }
  if (self->_assistantId)
  {
    objc_msgSend(v12, "setAssistantId:");
    id v4 = v12;
  }
  if (self->_hostname)
  {
    objc_msgSend(v12, "setHostname:");
    id v4 = v12;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[168] = self->_activityContinuationAllowed;
    v4[176] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[170] = self->_dictationEnabled;
    v4[176] |= 4u;
  }
  if (self->_sharedId)
  {
    objc_msgSend(v12, "setSharedId:");
    id v4 = v12;
  }
  if (self->_previousLangaugeCode)
  {
    objc_msgSend(v12, "setPreviousLangaugeCode:");
    id v4 = v12;
  }
  if (self->_previousOutputVoice)
  {
    objc_msgSend(v12, "setPreviousOutputVoice:");
    id v4 = v12;
  }
  if (self->_outputVoice)
  {
    objc_msgSend(v12, "setOutputVoice:");
    id v4 = v12;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v4[169] = self->_cloudSyncEnabled;
    v4[176] |= 2u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    v4[173] = self->_shouldCensorSpeech;
    v4[176] |= 0x20u;
  }
  if (self->_userAgent)
  {
    objc_msgSend(v12, "setUserAgent:");
    id v4 = v12;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[171] = self->_isLocationSharingDevice;
    v4[176] |= 8u;
  }
  if ([(_ADPBDeviceSetDataRequest *)self notificationPreviewRestrictedAppsCount])
  {
    [v12 clearNotificationPreviewRestrictedApps];
    unint64_t v7 = [(_ADPBDeviceSetDataRequest *)self notificationPreviewRestrictedAppsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        NSUInteger v10 = [(_ADPBDeviceSetDataRequest *)self notificationPreviewRestrictedAppsAtIndex:i];
        [v12 addNotificationPreviewRestrictedApps:v10];
      }
    }
  }
  if (self->_temperatureUnit) {
    objc_msgSend(v12, "setTemperatureUnit:");
  }
  id v11 = v12;
  if (self->_loggingAssistantId)
  {
    objc_msgSend(v12, "setLoggingAssistantId:");
    id v11 = v12;
  }
  if (self->_loggingSharedId)
  {
    objc_msgSend(v12, "setLoggingSharedId:");
    id v11 = v12;
  }
  if (self->_storeFrontId)
  {
    objc_msgSend(v12, "setStoreFrontId:");
    id v11 = v12;
  }
  if (self->_airplayRouteId)
  {
    objc_msgSend(v12, "setAirplayRouteId:");
    id v11 = v12;
  }
  if (self->_ekToken)
  {
    objc_msgSend(v12, "setEkToken:");
    id v11 = v12;
  }
  if (self->_userToken)
  {
    objc_msgSend(v12, "setUserToken:");
    id v11 = v12;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v11[172] = self->_isRemotePlaybackDevice;
    v11[176] |= 0x10u;
  }
  if (self->_userAssignedName)
  {
    objc_msgSend(v12, "setUserAssignedName:");
    id v11 = v12;
  }
  if (self->_utsRequiredRequestData)
  {
    objc_msgSend(v12, "setUtsRequiredRequestData:");
    id v11 = v12;
  }
  if (self->_dataSharingOptInStatus)
  {
    objc_msgSend(v12, "setDataSharingOptInStatus:");
    id v11 = v12;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_speechId) {
    PBDataWriterWriteStringField();
  }
  if (self->_languageCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_assistantId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hostname) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_sharedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousLangaugeCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousOutputVoice) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_outputVoice) {
    PBDataWriterWriteSubmessage();
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_userAgent) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v7 = self->_notificationPreviewRestrictedApps;
  unint64_t v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      id v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (self->_temperatureUnit) {
    PBDataWriterWriteStringField();
  }
  if (self->_loggingAssistantId) {
    PBDataWriterWriteStringField();
  }
  if (self->_loggingSharedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_storeFrontId) {
    PBDataWriterWriteStringField();
  }
  if (self->_airplayRouteId) {
    PBDataWriterWriteStringField();
  }
  if (self->_ekToken) {
    PBDataWriterWriteStringField();
  }
  if (self->_userToken) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_userAssignedName) {
    PBDataWriterWriteStringField();
  }
  if (self->_utsRequiredRequestData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dataSharingOptInStatus) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0;
          *(unsigned char *)&self->_has |= 0x40u;
          while (1)
          {
            unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v16 == -1 || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v17 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_98;
            }
            v13 += 7;
            BOOL v10 = v14++ >= 9;
            if (v10)
            {
              uint64_t v15 = 0;
              goto LABEL_100;
            }
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_98:
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v15 = 0;
          }
LABEL_100:
          BOOL v54 = v15 != 0;
          uint64_t v55 = 174;
          goto LABEL_125;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 112;
          goto LABEL_96;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_96;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 16;
          goto LABEL_96;
        case 7u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_96;
        case 8u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v24 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v24 == -1 || v24 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v24);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
              v23 |= (unint64_t)(v25 & 0x7F) << v21;
              if (v25 < 0)
              {
                v21 += 7;
                BOOL v10 = v22++ >= 9;
                if (v10)
                {
                  uint64_t v23 = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v23 = 0;
          }
LABEL_104:
          BOOL v54 = v23 != 0;
          uint64_t v55 = 168;
          goto LABEL_125;
        case 9u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)&self->_has |= 4u;
          while (2)
          {
            unint64_t v29 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v29 == -1 || v29 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v29);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
              v28 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v10 = v27++ >= 9;
                if (v10)
                {
                  uint64_t v28 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v28 = 0;
          }
LABEL_108:
          BOOL v54 = v28 != 0;
          uint64_t v55 = 170;
          goto LABEL_125;
        case 0xAu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 104;
          goto LABEL_96;
        case 0xBu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 88;
          goto LABEL_96;
        case 0xCu:
          uint64_t v31 = objc_alloc_init(_ADPBDeviceOutputVoiceInfo);
          uint64_t v32 = 96;
          goto LABEL_49;
        case 0xDu:
          uint64_t v31 = objc_alloc_init(_ADPBDeviceOutputVoiceInfo);
          uint64_t v32 = 80;
LABEL_49:
          objc_storeStrong((id *)&self->PBRequest_opaque[v32], v31);
          if (!PBReaderPlaceMark() || (sub_100126FD8((uint64_t)v31, (uint64_t)a3) & 1) == 0) {
            goto LABEL_128;
          }
          goto LABEL_93;
        case 0xEu:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            unint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v36 == -1 || v36 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v36 + 1;
              v35 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v10 = v34++ >= 9;
                if (v10)
                {
                  uint64_t v35 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v35 = 0;
          }
LABEL_112:
          BOOL v54 = v35 != 0;
          uint64_t v55 = 169;
          goto LABEL_125;
        case 0xFu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)&self->_has |= 0x20u;
          while (2)
          {
            unint64_t v41 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v41 == -1 || v41 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v41);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v41 + 1;
              v40 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                BOOL v10 = v39++ >= 9;
                if (v10)
                {
                  uint64_t v40 = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v40 = 0;
          }
LABEL_116:
          BOOL v54 = v40 != 0;
          uint64_t v55 = 173;
          goto LABEL_125;
        case 0x10u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 136;
          goto LABEL_96;
        case 0x11u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(unsigned char *)&self->_has |= 8u;
          while (2)
          {
            unint64_t v46 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v46 == -1 || v46 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v46);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v46 + 1;
              v45 |= (unint64_t)(v47 & 0x7F) << v43;
              if (v47 < 0)
              {
                v43 += 7;
                BOOL v10 = v44++ >= 9;
                if (v10)
                {
                  uint64_t v45 = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v45 = 0;
          }
LABEL_120:
          BOOL v54 = v45 != 0;
          uint64_t v55 = 171;
          goto LABEL_125;
        case 0x12u:
          PBReaderReadString();
          uint64_t v31 = (_ADPBDeviceOutputVoiceInfo *)objc_claimAutoreleasedReturnValue();
          if (v31) {
            [(_ADPBDeviceSetDataRequest *)self addNotificationPreviewRestrictedApps:v31];
          }
          goto LABEL_94;
        case 0x13u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 128;
          goto LABEL_96;
        case 0x14u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_96;
        case 0x15u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_96;
        case 0x16u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 120;
          goto LABEL_96;
        case 0x17u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 8;
          goto LABEL_96;
        case 0x18u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_96;
        case 0x19u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 152;
          goto LABEL_96;
        case 0x1Au:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          *(unsigned char *)&self->_has |= 0x10u;
          while (2)
          {
            unint64_t v51 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v51 == -1 || v51 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v51);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v51 + 1;
              v50 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                BOOL v10 = v49++ >= 9;
                if (v10)
                {
                  uint64_t v50 = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v50 = 0;
          }
LABEL_124:
          BOOL v54 = v50 != 0;
          uint64_t v55 = 172;
LABEL_125:
          self->PBRequest_opaque[v55] = v54;
          goto LABEL_126;
        case 0x1Bu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 144;
          goto LABEL_96;
        case 0x1Cu:
          uint64_t v31 = objc_alloc_init(_ADPBDeviceStringKeyValueDictionary);
          objc_storeStrong((id *)&self->_utsRequiredRequestData, v31);
          if (!PBReaderPlaceMark() || (sub_10034E7D4(v31, (uint64_t)a3) & 1) == 0)
          {
LABEL_128:

            LOBYTE(v18) = 0;
            return v18;
          }
LABEL_93:
          PBReaderRecallMark();
LABEL_94:

LABEL_126:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_127;
          break;
        case 0x1Du:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 24;
LABEL_96:
          v53 = *(void **)&self->PBRequest_opaque[v20];
          *(void *)&self->PBRequest_opaque[v20] = v19;

          goto LABEL_126;
        default:
          int v18 = PBReaderSkipValueWithTag();
          if (!v18) {
            return v18;
          }
          goto LABEL_126;
      }
    }
  }
LABEL_127:
  LOBYTE(v18) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    id v4 = +[NSNumber numberWithBool:self->_siriEnabled];
    [v3 setObject:v4 forKey:@"siri_enabled"];
  }
  speechId = self->_speechId;
  if (speechId) {
    [v3 setObject:speechId forKey:@"speech_id"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v3 setObject:languageCode forKey:@"language_code"];
  }
  assistantId = self->_assistantId;
  if (assistantId) {
    [v3 setObject:assistantId forKey:@"assistant_id"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v3 setObject:hostname forKey:@"hostname"];
  }
  char has = (char)self->_has;
  if (has)
  {
    BOOL v10 = +[NSNumber numberWithBool:self->_activityContinuationAllowed];
    [v3 setObject:v10 forKey:@"activity_continuation_allowed"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    int v11 = +[NSNumber numberWithBool:self->_dictationEnabled];
    [v3 setObject:v11 forKey:@"dictation_enabled"];
  }
  sharedId = self->_sharedId;
  if (sharedId) {
    [v3 setObject:sharedId forKey:@"shared_id"];
  }
  previousLangaugeCode = self->_previousLangaugeCode;
  if (previousLangaugeCode) {
    [v3 setObject:previousLangaugeCode forKey:@"previous_langauge_code"];
  }
  previousOutputVoice = self->_previousOutputVoice;
  if (previousOutputVoice)
  {
    uint64_t v15 = [(_ADPBDeviceOutputVoiceInfo *)previousOutputVoice dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"previous_output_voice"];
  }
  outputVoice = self->_outputVoice;
  if (outputVoice)
  {
    char v17 = [(_ADPBDeviceOutputVoiceInfo *)outputVoice dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"output_voice"];
  }
  char v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    uint64_t v19 = +[NSNumber numberWithBool:self->_cloudSyncEnabled];
    [v3 setObject:v19 forKey:@"cloud_sync_enabled"];

    char v18 = (char)self->_has;
  }
  if ((v18 & 0x20) != 0)
  {
    uint64_t v20 = +[NSNumber numberWithBool:self->_shouldCensorSpeech];
    [v3 setObject:v20 forKey:@"should_censor_speech"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v3 setObject:userAgent forKey:@"user_agent"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unsigned int v22 = +[NSNumber numberWithBool:self->_isLocationSharingDevice];
    [v3 setObject:v22 forKey:@"is_location_sharing_device"];
  }
  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  if (notificationPreviewRestrictedApps) {
    [v3 setObject:notificationPreviewRestrictedApps forKey:@"notification_preview_restricted_apps"];
  }
  temperatureUnit = self->_temperatureUnit;
  if (temperatureUnit) {
    [v3 setObject:temperatureUnit forKey:@"temperature_unit"];
  }
  loggingAssistantId = self->_loggingAssistantId;
  if (loggingAssistantId) {
    [v3 setObject:loggingAssistantId forKey:@"logging_assistant_id"];
  }
  loggingSharedId = self->_loggingSharedId;
  if (loggingSharedId) {
    [v3 setObject:loggingSharedId forKey:@"logging_shared_id"];
  }
  storeFrontId = self->_storeFrontId;
  if (storeFrontId) {
    [v3 setObject:storeFrontId forKey:@"store_front_id"];
  }
  airplayRouteId = self->_airplayRouteId;
  if (airplayRouteId) {
    [v3 setObject:airplayRouteId forKey:@"airplay_route_id"];
  }
  ekToken = self->_ekToken;
  if (ekToken) {
    [v3 setObject:ekToken forKey:@"ek_token"];
  }
  userToken = self->_userToken;
  if (userToken) {
    [v3 setObject:userToken forKey:@"user_token"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v31 = +[NSNumber numberWithBool:self->_isRemotePlaybackDevice];
    [v3 setObject:v31 forKey:@"is_remote_playback_device"];
  }
  userAssignedName = self->_userAssignedName;
  if (userAssignedName) {
    [v3 setObject:userAssignedName forKey:@"user_assigned_name"];
  }
  utsRequiredRequestData = self->_utsRequiredRequestData;
  if (utsRequiredRequestData)
  {
    unsigned int v34 = [(_ADPBDeviceStringKeyValueDictionary *)utsRequiredRequestData dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"uts_required_request_data"];
  }
  dataSharingOptInStatus = self->_dataSharingOptInStatus;
  if (dataSharingOptInStatus) {
    [v3 setObject:dataSharingOptInStatus forKey:@"data_sharing_opt_in_status"];
  }
  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBDeviceSetDataRequest;
  uint64_t v3 = [(_ADPBDeviceSetDataRequest *)&v7 description];
  id v4 = [(_ADPBDeviceSetDataRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasDataSharingOptInStatus
{
  return self->_dataSharingOptInStatus != 0;
}

- (BOOL)hasUtsRequiredRequestData
{
  return self->_utsRequiredRequestData != 0;
}

- (BOOL)hasUserAssignedName
{
  return self->_userAssignedName != 0;
}

- (BOOL)hasIsRemotePlaybackDevice
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIsRemotePlaybackDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIsRemotePlaybackDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isRemotePlaybackDevice = a3;
}

- (BOOL)hasUserToken
{
  return self->_userToken != 0;
}

- (BOOL)hasEkToken
{
  return self->_ekToken != 0;
}

- (BOOL)hasAirplayRouteId
{
  return self->_airplayRouteId != 0;
}

- (BOOL)hasStoreFrontId
{
  return self->_storeFrontId != 0;
}

- (BOOL)hasLoggingSharedId
{
  return self->_loggingSharedId != 0;
}

- (BOOL)hasLoggingAssistantId
{
  return self->_loggingAssistantId != 0;
}

- (BOOL)hasTemperatureUnit
{
  return self->_temperatureUnit != 0;
}

- (id)notificationPreviewRestrictedAppsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_notificationPreviewRestrictedApps objectAtIndex:a3];
}

- (unint64_t)notificationPreviewRestrictedAppsCount
{
  return (unint64_t)[(NSMutableArray *)self->_notificationPreviewRestrictedApps count];
}

- (void)addNotificationPreviewRestrictedApps:(id)a3
{
  id v4 = a3;
  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  id v8 = v4;
  if (!notificationPreviewRestrictedApps)
  {
    unsigned int v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_notificationPreviewRestrictedApps;
    self->_notificationPreviewRestrictedApps = v6;

    id v4 = v8;
    notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  }
  [(NSMutableArray *)notificationPreviewRestrictedApps addObject:v4];
}

- (void)clearNotificationPreviewRestrictedApps
{
}

- (BOOL)hasIsLocationSharingDevice
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasIsLocationSharingDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setIsLocationSharingDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isLocationSharingDevice = a3;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (BOOL)hasShouldCensorSpeech
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasShouldCensorSpeech:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setShouldCensorSpeech:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_shouldCensorSpeech = a3;
}

- (BOOL)hasCloudSyncEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCloudSyncEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cloudSyncEnabled = a3;
}

- (BOOL)hasOutputVoice
{
  return self->_outputVoice != 0;
}

- (BOOL)hasPreviousOutputVoice
{
  return self->_previousOutputVoice != 0;
}

- (BOOL)hasPreviousLangaugeCode
{
  return self->_previousLangaugeCode != 0;
}

- (BOOL)hasSharedId
{
  return self->_sharedId != 0;
}

- (BOOL)hasDictationEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDictationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDictationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dictationEnabled = a3;
}

- (BOOL)hasActivityContinuationAllowed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasActivityContinuationAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setActivityContinuationAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activityContinuationAllowed = a3;
}

- (BOOL)hasHostname
{
  return self->_hostname != 0;
}

- (BOOL)hasAssistantId
{
  return self->_assistantId != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (BOOL)hasSiriEnabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasSiriEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setSiriEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_siriEnabled = a3;
}

+ (Class)notificationPreviewRestrictedAppsType
{
  return (Class)objc_opt_class();
}

- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    unsigned int v14 = "-[_ADPBDeviceSetDataRequest(ADPeerCloudService) _ad_performWithCloudService:fromPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }
  long long v12 = [(_ADPBDeviceSetDataRequest *)self _ad_data];
  [v8 _notifyObserversOfSharedData:v12 fromPeer:v9];

  (*((void (**)(id, void, uint64_t, void))v10 + 2))(v10, 0, 0xFFFFLL, 0);
}

- (void)_ad_setData:(id)a3
{
  id v4 = a3;
  -[_ADPBDeviceSetDataRequest setSiriEnabled:](self, "setSiriEnabled:", [v4 siriEnabled]);
  -[_ADPBDeviceSetDataRequest setDictationEnabled:](self, "setDictationEnabled:", [v4 dictationEnabled]);
  char v5 = [v4 assistantId];
  [(_ADPBDeviceSetDataRequest *)self setAssistantId:v5];

  unsigned int v6 = [v4 loggingAssistantId];
  [(_ADPBDeviceSetDataRequest *)self setLoggingAssistantId:v6];

  objc_super v7 = [v4 speechId];
  [(_ADPBDeviceSetDataRequest *)self setSpeechId:v7];

  id v8 = [v4 sharedUserId];
  [(_ADPBDeviceSetDataRequest *)self setSharedId:v8];

  id v9 = [v4 loggingSharedUserId];
  [(_ADPBDeviceSetDataRequest *)self setLoggingSharedId:v9];

  id v10 = [v4 languageCode];
  [(_ADPBDeviceSetDataRequest *)self setLanguageCode:v10];

  int v11 = [v4 previousLanguageCode];
  [(_ADPBDeviceSetDataRequest *)self setPreviousLangaugeCode:v11];

  long long v12 = objc_alloc_init(_ADPBDeviceOutputVoiceInfo);
  int v13 = [v4 outputVoice];
  [(_ADPBDeviceOutputVoiceInfo *)v12 _ad_setVoiceInfo:v13];

  [(_ADPBDeviceSetDataRequest *)self setOutputVoice:v12];
  unsigned int v14 = objc_alloc_init(_ADPBDeviceOutputVoiceInfo);
  uint64_t v15 = [v4 previousOutputVoice];
  [(_ADPBDeviceOutputVoiceInfo *)v14 _ad_setVoiceInfo:v15];

  [(_ADPBDeviceSetDataRequest *)self setPreviousOutputVoice:v14];
  unint64_t v16 = [v4 hostname];
  [(_ADPBDeviceSetDataRequest *)self setHostname:v16];

  -[_ADPBDeviceSetDataRequest setCloudSyncEnabled:](self, "setCloudSyncEnabled:", [v4 cloudSyncEnabled]);
  -[_ADPBDeviceSetDataRequest setShouldCensorSpeech:](self, "setShouldCensorSpeech:", [v4 shouldCensorSpeech]);
  char v17 = [v4 userAgent];
  [(_ADPBDeviceSetDataRequest *)self setUserAgent:v17];

  -[_ADPBDeviceSetDataRequest setIsLocationSharingDevice:](self, "setIsLocationSharingDevice:", [v4 isLocationSharingDevice]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  char v18 = objc_msgSend(v4, "notificationPreviewRestrictedApps", 0);
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      unsigned int v22 = 0;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        [(_ADPBDeviceSetDataRequest *)self addNotificationPreviewRestrictedApps:*(void *)(*((void *)&v32 + 1) + 8 * (void)v22)];
        unsigned int v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [v4 temperatureUnit];
  [(_ADPBDeviceSetDataRequest *)self setTemperatureUnit:v23];

  unint64_t v24 = [v4 airplayRouteId];
  [(_ADPBDeviceSetDataRequest *)self setAirplayRouteId:v24];

  char v25 = [v4 storeFrontId];
  [(_ADPBDeviceSetDataRequest *)self setStoreFrontId:v25];

  char v26 = [v4 ekToken];
  [(_ADPBDeviceSetDataRequest *)self setEkToken:v26];

  unsigned int v27 = [v4 userToken];
  [(_ADPBDeviceSetDataRequest *)self setUserToken:v27];

  -[_ADPBDeviceSetDataRequest setIsRemotePlaybackDevice:](self, "setIsRemotePlaybackDevice:", [v4 isRemotePlaybackDevice]);
  uint64_t v28 = [v4 userAssignedName];
  [(_ADPBDeviceSetDataRequest *)self setUserAssignedName:v28];

  unint64_t v29 = [v4 utsRequiredRequestKeyValuePairs];
  char v30 = +[_ADPBDeviceStringKeyValueDictionary _ad_keyValueDictionaryWithDictionary:v29];
  [(_ADPBDeviceSetDataRequest *)self setUtsRequiredRequestData:v30];

  uint64_t v31 = [v4 dataSharingOptInStatus];
  [(_ADPBDeviceSetDataRequest *)self setDataSharingOptInStatus:v31];
}

- (ADSharedData)_ad_data
{
  char v3 = objc_alloc_init(ADSharedData);
  [(ADSharedData *)v3 setSiriEnabled:[(_ADPBDeviceSetDataRequest *)self siriEnabled]];
  [(ADSharedData *)v3 setDictationEnabled:[(_ADPBDeviceSetDataRequest *)self dictationEnabled]];
  id v4 = [(_ADPBDeviceSetDataRequest *)self assistantId];
  [(ADSharedData *)v3 setAssistantId:v4];

  char v5 = [(_ADPBDeviceSetDataRequest *)self loggingAssistantId];
  [(ADSharedData *)v3 setLoggingAssistantId:v5];

  unsigned int v6 = [(_ADPBDeviceSetDataRequest *)self speechId];
  [(ADSharedData *)v3 setSpeechId:v6];

  objc_super v7 = [(_ADPBDeviceSetDataRequest *)self sharedId];
  [(ADSharedData *)v3 setSharedUserId:v7];

  id v8 = [(_ADPBDeviceSetDataRequest *)self loggingSharedId];
  [(ADSharedData *)v3 setLoggingSharedUserId:v8];

  id v9 = [(_ADPBDeviceSetDataRequest *)self languageCode];
  [(ADSharedData *)v3 setLanguageCode:v9];

  id v10 = [(_ADPBDeviceSetDataRequest *)self previousLangaugeCode];
  [(ADSharedData *)v3 setPreviousLanguageCode:v10];

  int v11 = [(_ADPBDeviceSetDataRequest *)self outputVoice];
  long long v12 = objc_msgSend(v11, "_ad_voiceInfo");
  [(ADSharedData *)v3 setOutputVoice:v12];

  int v13 = [(_ADPBDeviceSetDataRequest *)self previousOutputVoice];
  unsigned int v14 = objc_msgSend(v13, "_ad_voiceInfo");
  [(ADSharedData *)v3 setPreviousOutputVoice:v14];

  uint64_t v15 = [(_ADPBDeviceSetDataRequest *)self hostname];
  [(ADSharedData *)v3 setHostname:v15];

  [(ADSharedData *)v3 setCloudSyncEnabled:[(_ADPBDeviceSetDataRequest *)self cloudSyncEnabled]];
  [(ADSharedData *)v3 setShouldCensorSpeech:[(_ADPBDeviceSetDataRequest *)self shouldCensorSpeech]];
  unint64_t v16 = [(_ADPBDeviceSetDataRequest *)self userAgent];
  [(ADSharedData *)v3 setUserAgent:v16];

  [(ADSharedData *)v3 setIsLocationSharingDevice:[(_ADPBDeviceSetDataRequest *)self isLocationSharingDevice]];
  char v17 = [(_ADPBDeviceSetDataRequest *)self notificationPreviewRestrictedApps];
  [(ADSharedData *)v3 setNotificationPreviewRestrictedApps:v17];

  char v18 = [(_ADPBDeviceSetDataRequest *)self temperatureUnit];
  [(ADSharedData *)v3 setTemperatureUnit:v18];

  id v19 = [(_ADPBDeviceSetDataRequest *)self airplayRouteId];
  [(ADSharedData *)v3 setAirplayRouteId:v19];

  id v20 = [(_ADPBDeviceSetDataRequest *)self storeFrontId];
  [(ADSharedData *)v3 setStoreFrontId:v20];

  uint64_t v21 = [(_ADPBDeviceSetDataRequest *)self ekToken];
  [(ADSharedData *)v3 setEkToken:v21];

  unsigned int v22 = [(_ADPBDeviceSetDataRequest *)self userToken];
  [(ADSharedData *)v3 setUserToken:v22];

  [(ADSharedData *)v3 setIsRemotePlaybackDevice:[(_ADPBDeviceSetDataRequest *)self isRemotePlaybackDevice]];
  uint64_t v23 = [(_ADPBDeviceSetDataRequest *)self userAssignedName];
  [(ADSharedData *)v3 setUserAssignedName:v23];

  unint64_t v24 = [(_ADPBDeviceSetDataRequest *)self utsRequiredRequestData];
  char v25 = objc_msgSend(v24, "_ad_dictionaryRepresentation");
  [(ADSharedData *)v3 setUtsRequiredRequestKeyValuePairs:v25];

  char v26 = [(_ADPBDeviceSetDataRequest *)self dataSharingOptInStatus];
  [(ADSharedData *)v3 setDataSharingOptInStatus:v26];

  return v3;
}

@end