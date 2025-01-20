@interface CSVoiceProfileSELFLogger
+ (NSUUID)voiceProfileiCloudSyncIsolatedStreamID;
+ (id)sharedLogger;
+ (void)initialize;
- (void)logVoiceProfileICloudSyncFinishedForEnrollmentId:(id)a3 isVoiceProfileiCloudSyncSuccess:(BOOL)a4 failureReasonIfAny:(id)a5 forLocale:(id)a6;
@end

@implementation CSVoiceProfileSELFLogger

- (void)logVoiceProfileICloudSyncFinishedForEnrollmentId:(id)a3 isVoiceProfileiCloudSyncSuccess:(BOOL)a4 failureReasonIfAny:(id)a5 forLocale:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = SSRLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SSRLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v13 = @"NO";
    int v21 = 136315906;
    v22 = "-[CSVoiceProfileSELFLogger logVoiceProfileICloudSyncFinishedForEnrollmentId:isVoiceProfileiCloudSyncSuccess:fa"
          "ilureReasonIfAny:forLocale:]";
    if (v8) {
      v13 = @"YES";
    }
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    v26 = v13;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile iCloud Sync SELF Log for enrollment ID %@, isVoiceProfileiCloudSyncSuccess %@, failureReason %@", (uint8_t *)&v21, 0x2Au);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4FA0928]);
  [v14 setEnrollmentId:v9];
  [v14 setIsVoiceProfileSyncSuccess:v8];
  [v14 setVoiceProfileSyncFailureReason:v10];
  id v15 = v11;
  if ([v15 isEqualToString:@"LOCALE_UNKNOWN_LOCALE"])
  {
    uint64_t v16 = 0;
  }
  else if ([v15 isEqualToString:@"LOCALE_AR_AE"])
  {
    uint64_t v16 = 1;
  }
  else if ([v15 isEqualToString:@"LOCALE_AR_SA"])
  {
    uint64_t v16 = 2;
  }
  else if ([v15 isEqualToString:@"LOCALE_CA_ES"])
  {
    uint64_t v16 = 3;
  }
  else if ([v15 isEqualToString:@"LOCALE_CS_CZ"])
  {
    uint64_t v16 = 4;
  }
  else if ([v15 isEqualToString:@"LOCALE_DA_DK"])
  {
    uint64_t v16 = 5;
  }
  else if ([v15 isEqualToString:@"LOCALE_DE_AT"])
  {
    uint64_t v16 = 6;
  }
  else if ([v15 isEqualToString:@"LOCALE_DE_CH"])
  {
    uint64_t v16 = 7;
  }
  else if ([v15 isEqualToString:@"LOCALE_DE_DE"])
  {
    uint64_t v16 = 8;
  }
  else if ([v15 isEqualToString:@"LOCALE_EL_GR"])
  {
    uint64_t v16 = 9;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_AE"])
  {
    uint64_t v16 = 10;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_AU"])
  {
    uint64_t v16 = 11;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_CA"])
  {
    uint64_t v16 = 12;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_GB"])
  {
    uint64_t v16 = 13;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_ID"])
  {
    uint64_t v16 = 14;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_IE"])
  {
    uint64_t v16 = 15;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_IN"])
  {
    uint64_t v16 = 16;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_MY"])
  {
    uint64_t v16 = 17;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_NZ"])
  {
    uint64_t v16 = 18;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_PH"])
  {
    uint64_t v16 = 19;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_SG"])
  {
    uint64_t v16 = 20;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_SA"])
  {
    uint64_t v16 = 21;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_US"])
  {
    uint64_t v16 = 22;
  }
  else if ([v15 isEqualToString:@"LOCALE_EN_ZA"])
  {
    uint64_t v16 = 23;
  }
  else if ([v15 isEqualToString:@"LOCALE_ES_CL"])
  {
    uint64_t v16 = 24;
  }
  else if ([v15 isEqualToString:@"LOCALE_ES_CO"])
  {
    uint64_t v16 = 25;
  }
  else if ([v15 isEqualToString:@"LOCALE_ES_ES"])
  {
    uint64_t v16 = 26;
  }
  else if ([v15 isEqualToString:@"LOCALE_ES_MX"])
  {
    uint64_t v16 = 27;
  }
  else if ([v15 isEqualToString:@"LOCALE_ES_US"])
  {
    uint64_t v16 = 28;
  }
  else if ([v15 isEqualToString:@"LOCALE_FI_FI"])
  {
    uint64_t v16 = 29;
  }
  else if ([v15 isEqualToString:@"LOCALE_FR_BE"])
  {
    uint64_t v16 = 30;
  }
  else if ([v15 isEqualToString:@"LOCALE_FR_CA"])
  {
    uint64_t v16 = 31;
  }
  else if ([v15 isEqualToString:@"LOCALE_FR_CH"])
  {
    uint64_t v16 = 32;
  }
  else if ([v15 isEqualToString:@"LOCALE_FR_FR"])
  {
    uint64_t v16 = 33;
  }
  else if ([v15 isEqualToString:@"LOCALE_HE_IL"])
  {
    uint64_t v16 = 34;
  }
  else if ([v15 isEqualToString:@"LOCALE_HI_IN"])
  {
    uint64_t v16 = 35;
  }
  else if ([v15 isEqualToString:@"LOCALE_HR_HR"])
  {
    uint64_t v16 = 36;
  }
  else if ([v15 isEqualToString:@"LOCALE_HU_HU"])
  {
    uint64_t v16 = 37;
  }
  else if ([v15 isEqualToString:@"LOCALE_ID_ID"])
  {
    uint64_t v16 = 38;
  }
  else if ([v15 isEqualToString:@"LOCALE_IT_CH"])
  {
    uint64_t v16 = 39;
  }
  else if ([v15 isEqualToString:@"LOCALE_IT_IT"])
  {
    uint64_t v16 = 40;
  }
  else if ([v15 isEqualToString:@"LOCALE_JA_JP"])
  {
    uint64_t v16 = 41;
  }
  else if ([v15 isEqualToString:@"LOCALE_KO_KR"])
  {
    uint64_t v16 = 42;
  }
  else if ([v15 isEqualToString:@"LOCALE_MS_MY"])
  {
    uint64_t v16 = 43;
  }
  else if ([v15 isEqualToString:@"LOCALE_NB_NO"])
  {
    uint64_t v16 = 44;
  }
  else if ([v15 isEqualToString:@"LOCALE_NL_BE"])
  {
    uint64_t v16 = 45;
  }
  else if ([v15 isEqualToString:@"LOCALE_NL_NL"])
  {
    uint64_t v16 = 46;
  }
  else if ([v15 isEqualToString:@"LOCALE_PL_PL"])
  {
    uint64_t v16 = 47;
  }
  else if ([v15 isEqualToString:@"LOCALE_PT_BR"])
  {
    uint64_t v16 = 48;
  }
  else if ([v15 isEqualToString:@"LOCALE_PT_PT"])
  {
    uint64_t v16 = 49;
  }
  else if ([v15 isEqualToString:@"LOCALE_RO_RO"])
  {
    uint64_t v16 = 50;
  }
  else if ([v15 isEqualToString:@"LOCALE_RU_RU"])
  {
    uint64_t v16 = 51;
  }
  else if ([v15 isEqualToString:@"LOCALE_SK_SK"])
  {
    uint64_t v16 = 52;
  }
  else if ([v15 isEqualToString:@"LOCALE_SV_SE"])
  {
    uint64_t v16 = 53;
  }
  else if ([v15 isEqualToString:@"LOCALE_TH_TH"])
  {
    uint64_t v16 = 54;
  }
  else if ([v15 isEqualToString:@"LOCALE_TR_TR"])
  {
    uint64_t v16 = 55;
  }
  else if ([v15 isEqualToString:@"LOCALE_UK_UA"])
  {
    uint64_t v16 = 56;
  }
  else if ([v15 isEqualToString:@"LOCALE_VI_VN"])
  {
    uint64_t v16 = 57;
  }
  else if ([v15 isEqualToString:@"LOCALE_WUU_CN"])
  {
    uint64_t v16 = 58;
  }
  else if ([v15 isEqualToString:@"LOCALE_YUE_CN"])
  {
    uint64_t v16 = 59;
  }
  else if ([v15 isEqualToString:@"LOCALE_ZH_CN"])
  {
    uint64_t v16 = 60;
  }
  else if ([v15 isEqualToString:@"LOCALE_ZH_HK"])
  {
    uint64_t v16 = 61;
  }
  else if ([v15 isEqualToString:@"LOCALE_ZH_TW"])
  {
    uint64_t v16 = 62;
  }
  else
  {
    uint64_t v16 = 0;
  }

  [v14 setLocale:v16];
  id v17 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  [v17 setVoiceProfileICloudSyncFinished:v14];
  v18 = [MEMORY[0x1E4F9F9B0] sharedAnalytics];
  v19 = [v18 defaultMessageStream];
  v20 = +[CSVoiceProfileSELFLogger voiceProfileiCloudSyncIsolatedStreamID];
  [v19 emitMessage:v17 isolatedStreamUUID:v20];
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_12031 != -1) {
    dispatch_once(&sharedLogger_onceToken_12031, &__block_literal_global_12032);
  }
  v2 = (void *)sharedLogger_shared_12033;
  return v2;
}

uint64_t __40__CSVoiceProfileSELFLogger_sharedLogger__block_invoke()
{
  sharedLogger_shared_12033 = objc_alloc_init(CSVoiceProfileSELFLogger);
  return MEMORY[0x1F41817F8]();
}

+ (NSUUID)voiceProfileiCloudSyncIsolatedStreamID
{
  return (NSUUID *)(id)_voiceProfileiCloudSyncIsolatedStreamID;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _voiceProfileiCloudSyncIsolatedStreamID = [MEMORY[0x1E4F29128] UUID];
    MEMORY[0x1F41817F8]();
  }
}

@end