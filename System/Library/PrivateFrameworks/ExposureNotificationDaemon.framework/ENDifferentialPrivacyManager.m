@interface ENDifferentialPrivacyManager
+ (id)hashForServerExposureConfiguration:(id)a3;
+ (unsigned)userRiskScoreForExposureDetectionSummary:(id)a3;
- (BOOL)_submitVectorValue:(id)a3 toRecorder:(id)a4 description:(const char *)a5;
- (ENDifferentialPrivacyManager)initWithServerConfiguration:(id)a3 serverExposureConfiguration:(id)a4;
- (NSDictionary)metadata;
- (void)_submitValue:(id)a3 toRecorder:(id)a4 description:(const char *)a5;
- (void)reportUserBeaconCount:(id)a3;
- (void)reportUserCodeVerified:(unsigned __int8)a3 reportType:(unsigned int)a4;
- (void)reportUserDiagnosedVaccineStatus:(id)a3;
- (void)reportUserExposureNotificationTapped:(BOOL)a3 classificationIndex:(unsigned __int8)a4;
- (void)reportUserExposureNotificationWithClassificationIndex:(unsigned __int8)a3 daysDelay:(unsigned __int8)a4;
- (void)reportUserKeysUploaded:(unsigned __int8)a3 reportType:(unsigned int)a4;
- (void)reportUserRiskParameters:(id)a3;
- (void)reportUserRiskScoreWithSummary:(id)a3;
- (void)updatedServerConfiguration:(id)a3 serverExposureConfiguration:(id)a4;
@end

@implementation ENDifferentialPrivacyManager

- (ENDifferentialPrivacyManager)initWithServerConfiguration:(id)a3 serverExposureConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)ENDifferentialPrivacyManager;
  v8 = [(ENDifferentialPrivacyManager *)&v40 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.UserRisk"];
    userRiskRecorder = v8->_userRiskRecorder;
    v8->_userRiskRecorder = (_DPBitValueRecorder *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.UserRiskParameters"];
    userRiskParametersRecorder = v8->_userRiskParametersRecorder;
    v8->_userRiskParametersRecorder = (_DPBitValueRecorder *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.BeaconCount"];
    userBeaconCountRecorder = v8->_userBeaconCountRecorder;
    v8->_userBeaconCountRecorder = (_DPBitValueRecorder *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.UserNotification"];
    userNotificationRecorder = v8->_userNotificationRecorder;
    v8->_userNotificationRecorder = (_DPBitValueRecorder *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.UserNotificationInteraction"];
    userNotificationInteractionRecorder = v8->_userNotificationInteractionRecorder;
    v8->_userNotificationInteractionRecorder = (_DPBitValueRecorder *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.CodeVerified"];
    userCodeVerifiedRecorder = v8->_userCodeVerifiedRecorder;
    v8->_userCodeVerifiedRecorder = (_DPBitValueRecorder *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.DiagnosedVaccineStatus"];
    userDiagnosedVaccineStatusRecorder = v8->_userDiagnosedVaccineStatusRecorder;
    v8->_userDiagnosedVaccineStatusRecorder = (_DPBitValueRecorder *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.KeysUploaded"];
    userKeysUploadedRecorder = v8->_userKeysUploadedRecorder;
    v8->_userKeysUploadedRecorder = (_DPBitValueRecorder *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.DateExposure"];
    userDateExposureRecorder = v8->_userDateExposureRecorder;
    v8->_userDateExposureRecorder = (_DPBitValueRecorder *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.CodeVerifiedWithReportTypeV2D14"];
    userCodeVerifiedV2Recorder = v8->_userCodeVerifiedV2Recorder;
    v8->_userCodeVerifiedV2Recorder = (_DPBitValueRecorder *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.KeysUploadedWithReportTypeV2D14"];
    userKeysUploadedV2Recorder = v8->_userKeysUploadedV2Recorder;
    v8->_userKeysUploadedV2Recorder = (_DPBitValueRecorder *)v29;

    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.SecondaryAttackV2D14"];
    userSecondaryAttackV2Recorder = v8->_userSecondaryAttackV2Recorder;
    v8->_userSecondaryAttackV2Recorder = (_DPBitValueRecorder *)v31;

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.PeriodicExposureNotificationV2D14"];
    userNotificationV2Recorder = v8->_userNotificationV2Recorder;
    v8->_userNotificationV2Recorder = (_DPBitValueRecorder *)v33;

    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.DiagnosedVaccineStatusV2D14"];
    userDiagnosedVaccineStatusV2Recorder = v8->_userDiagnosedVaccineStatusV2Recorder;
    v8->_userDiagnosedVaccineStatusV2Recorder = (_DPBitValueRecorder *)v35;

    uint64_t v37 = [objc_alloc(MEMORY[0x1E4F5F460]) initWithKey:@"com.apple.EN.DateExposureV2D14"];
    userDateExposureV2Recorder = v8->_userDateExposureV2Recorder;
    v8->_userDateExposureV2Recorder = (_DPBitValueRecorder *)v37;

    [(ENDifferentialPrivacyManager *)v8 updatedServerConfiguration:v6 serverExposureConfiguration:v7];
  }

  return v8;
}

- (void)updatedServerConfiguration:(id)a3 serverExposureConfiguration:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (gLogCategory_ENDifferentialPrivacyManager <= 30
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v7 = [v15 region];
  v8 = [v7 countryCode];

  uint64_t v9 = [v15 region];
  v10 = [v9 subdivisionCode];

  uint64_t v11 = +[ENDifferentialPrivacyManager hashForServerExposureConfiguration:v6];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F5F4A0]];
  [v12 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F5F4A8]];
  [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F5F4B0]];
  uint64_t v13 = (NSDictionary *)[v12 copy];
  metadata = self->_metadata;
  self->_metadata = v13;

  if (gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)reportUserRiskScoreWithSummary:(id)a3
{
  uint64_t v4 = +[ENDifferentialPrivacyManager userRiskScoreForExposureDetectionSummary:a3];
  id v5 = [MEMORY[0x1E4F28EC8] numberWithUnsignedShort:v4];
  [(ENDifferentialPrivacyManager *)self _submitValue:v5 toRecorder:self->_userRiskRecorder description:"user risk score"];
}

- (void)reportUserRiskParameters:(id)a3
{
}

- (void)reportUserBeaconCount:(id)a3
{
}

- (void)reportUserExposureNotificationWithClassificationIndex:(unsigned __int8)a3 daysDelay:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v5 = a3;
  id v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v8 = [v7 isSensitiveLoggingAllowed];

  if (v8
    && gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    uint64_t v30 = v5;
    uint64_t v32 = v4;
    LogPrintF_safe();
  }
  if ((v5 - 1) >= 4u)
  {
    uint64_t v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v18 = [v17 isSensitiveLoggingAllowed];

    if (v18
      && gLogCategory_ENDifferentialPrivacyManager <= 90
      && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28EC8] numberWithUnsignedChar:v5];
    [(ENDifferentialPrivacyManager *)self _submitValue:v9 toRecorder:self->_userNotificationRecorder description:"user exposure notification"];

    v10 = [MEMORY[0x1E4F28EC8] numberWithUnsignedChar:v5];
    [(ENDifferentialPrivacyManager *)self _submitValue:v10 toRecorder:self->_userNotificationV2Recorder description:"user exposure notification v2"];

    if (v4 < 0xB) {
      int v11 = 2;
    }
    else {
      int v11 = 3;
    }
    if (v4 >= 7) {
      int v12 = v11;
    }
    else {
      int v12 = 1;
    }
    if (v4 < 4) {
      int v12 = 0;
    }
    uint64_t v13 = v12 | (4 * v5 - 4);
    v14 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithInt:", v13, v30, v32);
    uint64_t v33 = self;
    [(ENDifferentialPrivacyManager *)self _submitValue:v14 toRecorder:self->_userDateExposureRecorder description:"delay between exposure and notification"];

    id v15 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v16 = [v15 isSensitiveLoggingAllowed];

    if (v16
      && gLogCategory_ENDifferentialPrivacyManager <= 50
      && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v31 = v13;
      LogPrintF_safe();
    }
    uint64_t v19 = (char *)malloc_type_calloc(0x30uLL, 1uLL, 0x100004077774924uLL);
    if (v19)
    {
      v20 = v19;
      if (v4 >= 0xB) {
        uint64_t v21 = 11;
      }
      else {
        uint64_t v21 = v4;
      }
      uint64_t v22 = 12 * v5;
      uint64_t v23 = &v19[v22];
      do
      {
        v23[v21 - 12] = 1;
        v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v25 = [v24 isSensitiveLoggingAllowed];

        if (v25
          && gLogCategory_ENDifferentialPrivacyManager <= 50
          && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
        {
          uint64_t v31 = v22 + v21 - 12;
          LogPrintF_safe();
        }
        ++v21;
      }
      while (v21 != 12);
      uint64_t v26 = [MEMORY[0x1E4F1C9B0] dataWithBytesNoCopy:v20 length:48];
      uint64_t v27 = v33;
      id v34 = (id)v26;
      -[ENDifferentialPrivacyManager _submitVectorValue:toRecorder:description:](v27, "_submitVectorValue:toRecorder:description:");
      v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
      char v29 = [v28 isSensitiveLoggingAllowed];

      if ((v29 & 1) != 0
        && gLogCategory_ENDifferentialPrivacyManager <= 50
        && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (void)reportUserExposureNotificationTapped:(BOOL)a3 classificationIndex:(unsigned __int8)a4
{
  if ((a4 - 1) >= 4)
  {
    id v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v7 = [v6 isSensitiveLoggingAllowed];

    if (v7
      && gLogCategory_ENDifferentialPrivacyManager <= 90
      && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    if (a3) {
      uint64_t v5 = a4;
    }
    else {
      uint64_t v5 = (a4 + 4);
    }
    id v8 = [MEMORY[0x1E4F28EC8] numberWithInt:v5];
    [(ENDifferentialPrivacyManager *)self _submitValue:v8 toRecorder:self->_userNotificationInteractionRecorder description:"user exposure notification interaction"];
  }
}

- (void)reportUserCodeVerified:(unsigned __int8)a3 reportType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v5 = a3;
  int v7 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedChar:");
  [(ENDifferentialPrivacyManager *)self _submitValue:v7 toRecorder:self->_userCodeVerifiedRecorder description:"code verified"];

  id v8 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInt:v4];
  [(ENDifferentialPrivacyManager *)self _submitValue:v8 toRecorder:self->_userCodeVerifiedV2Recorder description:"code verified v2"];

  uint64_t v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v10 = [v9 isSensitiveLoggingAllowed];

  if (v10
    && gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v5 >= 2)
  {
    if (v4)
    {
      int v11 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInt:v5 + 4 * v4 - 6];
      [(ENDifferentialPrivacyManager *)self _submitValue:v11 toRecorder:self->_userSecondaryAttackV2Recorder description:"secondary attack"];

      int v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
      LODWORD(v11) = [v12 isSensitiveLoggingAllowed];

      if (v11)
      {
        if (gLogCategory_ENDifferentialPrivacyManager <= 50
          && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
  }
}

- (void)reportUserKeysUploaded:(unsigned __int8)a3 reportType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedChar:");
  [(ENDifferentialPrivacyManager *)self _submitValue:v6 toRecorder:self->_userKeysUploadedRecorder description:"keys uploaded"];

  int v7 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInt:v4];
  [(ENDifferentialPrivacyManager *)self _submitValue:v7 toRecorder:self->_userKeysUploadedV2Recorder description:"keys uploaded v2"];

  id v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
  LODWORD(v7) = [v8 isSensitiveLoggingAllowed];

  if (v7
    && gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)reportUserDiagnosedVaccineStatus:(id)a3
{
  id v10 = a3;
  if (-[ENDifferentialPrivacyManager _submitVectorValue:toRecorder:description:](self, "_submitVectorValue:toRecorder:description:"))
  {
    if ([(ENDifferentialPrivacyManager *)self _submitVectorValue:v10 toRecorder:self->_userDiagnosedVaccineStatusV2Recorder description:"user diagnosed vaccine status v2"])
    {
      id v4 = v10;
      uint64_t v5 = [v4 bytes];
      if ([v4 length])
      {
        unint64_t v6 = 0;
        do
        {
          if (*(unsigned char *)(v5 + v6))
          {
            int v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v8 = [v7 isSensitiveLoggingAllowed];

            if (v8)
            {
              if (gLogCategory_ENDifferentialPrivacyManager <= 50
                && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
              {
                unint64_t v9 = v6;
                LogPrintF_safe();
              }
            }
          }
          ++v6;
        }
        while (v6 < objc_msgSend(v4, "length", v9));
      }
    }
  }
}

- (BOOL)_submitVectorValue:(id)a3 toRecorder:(id)a4 description:(const char *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v13[0] = a3;
  int v7 = (void *)MEMORY[0x1E4F1C970];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 arrayWithObjects:v13 count:1];
  char v11 = [v8 recordBitVectors:v10 metadata:self->_metadata];

  if (v11)
  {
    if (gLogCategory_ENDifferentialPrivacyManager > 50
      || gLogCategory_ENDifferentialPrivacyManager == -1 && !_LogCategory_Initialize())
    {
      return v11;
    }
LABEL_4:
    LogPrintF_safe();
    return v11;
  }
  if (gLogCategory__ENDifferentialPrivacyManager <= 90
    && (gLogCategory__ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_4;
  }
  return v11;
}

- (void)_submitValue:(id)a3 toRecorder:(id)a4 description:(const char *)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  int v7 = (void *)MEMORY[0x1E4F1C970];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 arrayWithObjects:v11 count:1];
  LOBYTE(self) = [v8 record:v10 metadata:self->_metadata];

  if (self)
  {
    if (gLogCategory_ENDifferentialPrivacyManager > 50
      || gLogCategory_ENDifferentialPrivacyManager == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_4:
    LogPrintF_safe();
    return;
  }
  if (gLogCategory__ENDifferentialPrivacyManager <= 90
    && (gLogCategory__ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_4;
  }
}

+ (unsigned)userRiskScoreForExposureDetectionSummary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v3 = [a3 daySummaries];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        char v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v12 = [v11 daySummary];
        [v12 maximumScore];
        double v14 = v13;

        id v15 = [v11 daySummary];
        [v15 scoreSum];
        double v17 = v16;

        int v18 = [v11 daySummary];
        [v18 weightedDurationSum];
        double v20 = v19;

        if (v14 > v9) {
          double v9 = v14;
        }
        if (v17 > v7) {
          double v7 = v17;
        }
        if (v20 > v8) {
          double v8 = v20;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }

  for (uint64_t j = 0; j != 7; ++j)
  {
    if (v9 <= dbl_1D3A7B228[j]) {
      break;
    }
  }
  for (uint64_t k = 0; k != 7; ++k)
  {
    if (v7 <= dbl_1D3A7B260[k]) {
      break;
    }
  }
  for (uint64_t m = 0; m != 7; ++m)
  {
    if (v8 <= dbl_1D3A7B298[m]) {
      break;
    }
  }
  if (gLogCategory_ENDifferentialPrivacyManager <= 30
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  return k + 8 * j + ((_WORD)m << 6);
}

+ (id)hashForServerExposureConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  memset(&v31[4], 0, 135);
  if (v3)
  {
    uint64_t v5 = [v3 exposureConfigurationValues];
    v31[0] = CFDictionaryGetInt64Ranged();
    v31[1] = CFDictionaryGetInt64Ranged();
    v31[2] = CFDictionaryGetInt64Ranged();
    v31[3] = CFDictionaryGetInt64Ranged();
    CFArrayGetTypeID();
    uint64_t v6 = CFDictionaryGetTypedValue();
    if (v6)
    {
      double v7 = NSArrayGetNSNumberAtIndex();
      double v8 = NSArrayGetNSNumberAtIndex();
      double v9 = NSArrayGetNSNumberAtIndex();
      LOBYTE(v31[4]) = [v7 unsignedCharValue];
      HIBYTE(v31[4]) = [v8 unsignedCharValue];
      LOBYTE(v31[5]) = [v9 unsignedCharValue];
    }
    long long v28 = (void *)v6;
    CFDictionaryGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      for (uint64_t i = -14; i != 15; ++i)
      {
        [MEMORY[0x1E4F28EC8] numberWithInteger:i];
        v12 |= (CFDictionaryGetInt64Ranged() & 3) << v11;
        v11 += 2;
      }
      *(void *)((char *)&v31[5] + 1) = v12;
    }
    *(_WORD *)((char *)&v31[9] + 1) = CFDictionaryGetInt64Ranged();
    *(_WORD *)((char *)&v31[10] + 1) = CFDictionaryGetInt64Ranged();
    *(_WORD *)((char *)&v31[11] + 1) = CFDictionaryGetInt64Ranged();
    *(_WORD *)((char *)&v31[12] + 1) = CFDictionaryGetInt64Ranged();
    *(_WORD *)((char *)&v31[13] + 1) = CFDictionaryGetInt64Ranged();
    HIBYTE(v31[14]) = CFDictionaryGetInt64Ranged();
    char v29 = (void *)v5;
    LOBYTE(v31[15]) = CFDictionaryGetInt64Ranged();
    uint64_t v30 = v4;
    double v14 = [v4 classificationCriteria];
    long long v27 = (void *)v10;
    if ((unint64_t)[v14 count] > 3)
    {
      uint64_t v15 = 4;
    }
    else
    {
      uint64_t v15 = [v14 count];
      if (!v15)
      {
LABEL_14:
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B0]) initWithBytes:v31 length:143];
        id v24 = [v23 sha256];
        [v24 bytes];
        [v24 length];
        [v24 length];
        long long v25 = NSPrintF();

        uint64_t v4 = v30;
        goto LABEL_15;
      }
    }
    uint64_t v16 = 0;
    double v17 = (_DWORD *)((char *)&v31[27] + 1);
    do
    {
      int v18 = [v14 objectAtIndexedSubscript:v16];
      double v19 = [v18 perDaySumERVThresholdsByDiagnosisReportType];

      *(v17 - 6) = CFDictionaryGetInt64Ranged();
      *(v17 - 5) = CFDictionaryGetInt64Ranged();
      *(v17 - 4) = CFDictionaryGetInt64Ranged();
      *(v17 - 3) = CFDictionaryGetInt64Ranged();
      double v20 = [v14 objectAtIndexedSubscript:v16];
      *(v17 - 2) = [v20 perDaySumERVThreshold];

      uint64_t v21 = [v14 objectAtIndexedSubscript:v16];
      *(v17 - 1) = [v21 perDayMaxERVThreshold];

      uint64_t v22 = [v14 objectAtIndexedSubscript:v16];
      *double v17 = [v22 weightedDurationAtAttenuationThreshold];
      v17 += 7;

      ++v16;
    }
    while (v15 != v16);
    goto LABEL_14;
  }
  long long v25 = 0;
LABEL_15:

  return v25;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_userDateExposureV2Recorder, 0);
  objc_storeStrong((id *)&self->_userDiagnosedVaccineStatusV2Recorder, 0);
  objc_storeStrong((id *)&self->_userNotificationV2Recorder, 0);
  objc_storeStrong((id *)&self->_userSecondaryAttackV2Recorder, 0);
  objc_storeStrong((id *)&self->_userKeysUploadedV2Recorder, 0);
  objc_storeStrong((id *)&self->_userCodeVerifiedV2Recorder, 0);
  objc_storeStrong((id *)&self->_userDateExposureRecorder, 0);
  objc_storeStrong((id *)&self->_userKeysUploadedRecorder, 0);
  objc_storeStrong((id *)&self->_userDiagnosedVaccineStatusRecorder, 0);
  objc_storeStrong((id *)&self->_userCodeVerifiedRecorder, 0);
  objc_storeStrong((id *)&self->_userNotificationInteractionRecorder, 0);
  objc_storeStrong((id *)&self->_userNotificationRecorder, 0);
  objc_storeStrong((id *)&self->_userBeaconCountRecorder, 0);
  objc_storeStrong((id *)&self->_userRiskParametersRecorder, 0);

  objc_storeStrong((id *)&self->_userRiskRecorder, 0);
}

@end