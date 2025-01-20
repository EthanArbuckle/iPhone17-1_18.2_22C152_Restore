@interface HPSDeviceAnalytics
- (HPSDeviceAnalytics)init;
- (void)resetAnalyticDict;
- (void)resetAnalyticDictFitTest;
- (void)resetAnalyticDictV2;
- (void)sendFeatureInfoEvent;
- (void)submitDeviceAnalytics;
- (void)submitDeviceAnalyticsVer2;
- (void)submitFitTestAnalytics;
- (void)updateEntryPoint:(int)a3;
- (void)updateFeatureChangeCount:(int)a3;
- (void)updateFeatureValue:(int)a3 value:(unsigned int)a4 featureValueString:(id)a5;
- (void)updateFitTestValue:(int)a3 value:(int)a4;
- (void)updateProductID:(unsigned int)a3;
@end

@implementation HPSDeviceAnalytics

- (HPSDeviceAnalytics)init
{
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Headphone Configs: init Analytics", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)HPSDeviceAnalytics;
  v4 = [(HPSDeviceAnalytics *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(HPSDeviceAnalytics *)v4 resetAnalyticDict];
    [(HPSDeviceAnalytics *)v5 resetAnalyticDictV2];
    [(HPSDeviceAnalytics *)v5 resetAnalyticDictFitTest];
  }
  return v5;
}

- (void)updateProductID:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(NSMutableDictionary *)self->_analyticDict setObject:v4 forKeyedSubscript:@"ProductID"];

  v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(NSMutableDictionary *)self->_analyticDict valueForKey:@"ProductID"];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Product ID: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)updateEntryPoint:(int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    v4 = @"iOS_Info_Button";
  }
  else
  {
    v4 = @"iOS_Top_Level";
  }
  [(NSMutableDictionary *)self->_analyticDict setValue:v4 forKey:@"EntryPoint"];
LABEL_6:
  v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(NSMutableDictionary *)self->_analyticDict valueForKey:@"EntryPoint"];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Entry Point: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)updateFeatureChangeCount:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x36) {
    v4 = &stru_1F4097960;
  }
  else {
    v4 = off_1E6EA8A80[a3];
  }
  v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Feature: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = NSNumber;
  int v7 = [(NSMutableDictionary *)self->_analyticDict objectForKeyedSubscript:v4];
  v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
  [(NSMutableDictionary *)self->_analyticDict setObject:v8 forKeyedSubscript:v4];
}

- (void)updateFeatureValue:(int)a3 value:(unsigned int)a4 featureValueString:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = v8;
  v10 = &stru_1F4097960;
  int v11 = a3 - 1;
  v12 = &stru_1F4097960;
  switch(v11)
  {
    case 0:
      v12 = &stru_1F4097960;
      v10 = @"AdaptiveTransparencyValue";
      break;
    case 2:
      if (a4 == 1) {
        v12 = @"On";
      }
      else {
        v12 = @"Off";
      }
      v10 = @"AdaptiveVolumeValue";
      break;
    case 4:
      v12 = &stru_1F4097960;
      v10 = @"CaseSoundValue";
      break;
    case 6:
      v13 = @"BackToFront";
      v14 = @"CrownRotationValue";
      v15 = @"Unknown";
      v16 = @"CrownRotationValue";
      v17 = @"FrontToBack";
      v18 = @"CrownRotationValue";
      goto LABEL_41;
    case 8:
      v12 = &stru_1F4097960;
      v10 = @"CycleBetweenLeftBudValue";
      break;
    case 10:
      v12 = &stru_1F4097960;
      v10 = @"CycleBetweenRightBudValue";
      break;
    case 12:
      v12 = &stru_1F4097960;
      v10 = @"CycleBetweenV2LeftBudValue";
      break;
    case 14:
      v12 = &stru_1F4097960;
      v10 = @"CycleBetweenV2RightBudValue";
      break;
    case 15:
      v12 = &stru_1F4097960;
      v10 = @"CycleBetweenSingleValue";
      break;
    case 19:
      if (a4 >= 5) {
        v12 = @"Unknown";
      }
      else {
        v12 = off_1E6EA8C38[a4];
      }
      v10 = @"DoubleTapLeftValue";
      break;
    case 20:
      if (a4 >= 5) {
        v12 = @"Unknown";
      }
      else {
        v12 = off_1E6EA8C38[a4];
      }
      v10 = @"DoubleTapRightValue";
      break;
    case 23:
      v13 = @"PressOnce";
      v14 = @"EndCallValue";
      v15 = @"Unknown";
      v16 = @"EndCallValue";
      v19 = @"EndCallValue";
      goto LABEL_32;
    case 25:
      v12 = &stru_1F4097960;
      v10 = @"FindMyNetworkValue";
      break;
    case 28:
      v12 = &stru_1F4097960;
      v10 = @"InEarOnHeadDetectionValue";
      break;
    case 30:
      if (a4 - 1 >= 3) {
        v12 = @"Unknown";
      }
      else {
        v12 = off_1E6EA8C60[a4 - 1];
      }
      v10 = @"ListeningModeValue";
      break;
    case 32:
      if (a4 - 1 >= 4) {
        v12 = @"Unknown";
      }
      else {
        v12 = off_1E6EA8C78[a4 - 1];
      }
      v10 = @"ListeningModeV2Value";
      break;
    case 34:
      if (a4 == 1) {
        v12 = @"On";
      }
      else {
        v12 = @"Off";
      }
      v10 = @"MagneticEarbudDetectValue";
      break;
    case 36:
      if (a4 >= 3) {
        v12 = @"Unknown";
      }
      else {
        v12 = off_1E6EA8C98[a4];
      }
      v10 = @"MicrophoneSwitchValue";
      break;
    case 38:
      v13 = @"PressOnce";
      v14 = @"MuteCallValue";
      v15 = @"Unknown";
      v16 = @"MuteCallValue";
      v19 = @"MuteCallValue";
LABEL_32:
      if (a4 == 3)
      {
        v16 = v19;
        v15 = @"PressTwice";
      }
      BOOL v20 = a4 == 2;
      goto LABEL_44;
    case 40:
      v12 = &stru_1F4097960;
      v10 = @"OptimizedBatteryChargingValue";
      break;
    case 42:
      if (a4 - 1 >= 7) {
        v12 = @"Unknown";
      }
      else {
        v12 = off_1E6EA8CB0[a4 - 1];
      }
      v10 = @"PressHoldLeftBudValue";
      break;
    case 43:
      if (a4 - 1 >= 7) {
        v12 = @"Unknown";
      }
      else {
        v12 = off_1E6EA8CB0[a4 - 1];
      }
      v10 = @"PressHoldRightBudValue";
      break;
    case 48:
      v13 = @"Automatic";
      v14 = @"SmartRoutingValue";
      v15 = @"Unknown";
      v16 = @"SmartRoutingValue";
      v17 = @"LastConnect";
      v18 = @"SmartRoutingValue";
LABEL_41:
      if (a4 == 2)
      {
        v16 = v18;
        v15 = v17;
      }
      BOOL v20 = a4 == 1;
LABEL_44:
      if (v20) {
        v10 = v14;
      }
      else {
        v10 = v16;
      }
      if (v20) {
        v12 = v13;
      }
      else {
        v12 = v15;
      }
      break;
    case 52:
      if (a4 == 1) {
        v12 = @"On";
      }
      else {
        v12 = @"Off";
      }
      v10 = @"SpeechDetectionValue";
      break;
    default:
      break;
  }
  if (v8) {
    v12 = (__CFString *)v8;
  }
  v21 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    v23 = v10;
    __int16 v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1E4BFE000, v21, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Feature: %@ Value: %@", (uint8_t *)&v22, 0x16u);
  }

  [(NSMutableDictionary *)self->_analyticDict setObject:v12 forKeyedSubscript:v10];
}

- (void)resetAnalyticDict
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"ProductID", &unk_1F40ABBD8, @"AdaptiveTransparency", &stru_1F4097960, @"AdaptiveTransparencyValue", &unk_1F40ABBD8, @"AdaptiveVolume", &stru_1F4097960, @"AdaptiveVolumeValue", &unk_1F40ABBD8, @"CaseSound", &stru_1F4097960, @"CaseSoundValue", &unk_1F40ABBD8, @"CrownRotation", &stru_1F4097960, @"CrownRotationValue",
    &unk_1F40ABBD8,
    @"CycleBetweenLeftBud",
    &stru_1F4097960,
    @"CycleBetweenLeftBudValue",
    &unk_1F40ABBD8,
    @"CycleBetweenRightBud",
    &stru_1F4097960,
    @"CycleBetweenRightBudValue",
    &unk_1F40ABBD8,
    @"CycleBetweenV2LeftBud",
    &stru_1F4097960,
    @"CycleBetweenV2LeftBudValue",
    &unk_1F40ABBD8,
    @"CycleBetweenV2RightBud",
    &stru_1F4097960,
    @"CycleBetweenV2RightBudValue",
    &stru_1F4097960,
    @"CycleBetweenSingleValue",
    &unk_1F40ABBD8,
    @"DeviceName",
    &unk_1F40ABBD8,
    @"Disconnect",
    &unk_1F40ABBD8,
    @"DoubleTap",
    &stru_1F4097960,
    @"DoubleTapLeftValue",
    &stru_1F4097960,
    @"DoubleTapRightValue",
    @"Unknown",
    @"EntryPoint",
    &unk_1F40ABBD8,
    @"EarTipFitTest",
    &unk_1F40ABBD8,
    @"EndCall",
    &stru_1F4097960,
    @"EndCallValue",
    &unk_1F40ABBD8,
    @"FindMyNetwork",
    &stru_1F4097960,
    @"FindMyNetworkValue",
    &unk_1F40ABBD8,
    @"ForgetDevice",
    &unk_1F40ABBD8,
    @"InEarOnHeadDetection");
  self->_analyticDict = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)resetAnalyticDictFitTest
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"BudMileage", &unk_1F40ABBD8, @"ConfidenceL", &unk_1F40ABBD8, @"ConfidenceR", &unk_1F40ABBD8, @"FirstTimeUse", &unk_1F40ABBD8, @"FitTestType", &unk_1F40ABBD8, @"HeadphonePID", &unk_1F40ABBD8, @"SealMetricL", &unk_1F40ABBD8, @"SealMetricR", &unk_1F40ABBD8, @"SessionTime",
    &unk_1F40ABBD8,
    @"TestResult",
    0);
  self->_analyticDictFitTest = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)resetAnalyticDictV2
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"FeatureChangeCount", &stru_1F4097960, @"FeatureName", &stru_1F4097960, @"FeatureValue", &unk_1F40ABBD8, @"HeadphonePID", 0);
  self->_analyticDictV2 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)updateFitTestValue:(int)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
    case 3:
      return;
    case 1:
      v6 = @"ConfidenceL";
      goto LABEL_11;
    case 2:
      v6 = @"ConfidenceR";
      goto LABEL_11;
    case 4:
      v6 = @"FitTestType";
      goto LABEL_11;
    case 5:
      v6 = @"HeadphonePID";
      goto LABEL_11;
    case 6:
      v6 = @"SealMetricL";
      goto LABEL_11;
    case 7:
      v6 = @"SealMetricR";
      goto LABEL_11;
    case 8:
      v6 = @"SessionTime";
      goto LABEL_11;
    case 9:
      v6 = @"TestResult";
      goto LABEL_11;
    default:
      v6 = &stru_1F4097960;
LABEL_11:
      int v7 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        v10 = v6;
        __int16 v11 = 1024;
        int v12 = v4;
        _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Feature: %@ Value: %d", (uint8_t *)&v9, 0x12u);
      }

      id v8 = [NSNumber numberWithInt:v4];
      [(NSMutableDictionary *)self->_analyticDictFitTest setObject:v8 forKeyedSubscript:v6];

      return;
  }
}

- (void)submitFitTestAnalytics
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = self->_analyticDictFitTest;
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v7 = v2;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Submit Analytics: %@", buf, 0xCu);
  }

  v5 = v2;
  uint64_t v4 = v2;
  AnalyticsSendEventLazy();
}

id __44__HPSDeviceAnalytics_submitFitTestAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitDeviceAnalyticsVer2
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = self->_analyticDictV2;
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v7 = v2;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Submit Analytics: %@", buf, 0xCu);
  }

  v5 = v2;
  uint64_t v4 = v2;
  AnalyticsSendEventLazy();
}

id __47__HPSDeviceAnalytics_submitDeviceAnalyticsVer2__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendFeatureInfoEvent
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AdaptiveVolume", @"CycleBetweenV2LeftBud", @"CycleBetweenV2RightBud", @"EndCall", @"ListeningModeV2", @"MuteCall", @"SpeechDetection", 0);
  uint64_t v4 = self->_analyticDict;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v9];
        [(NSMutableDictionary *)self->_analyticDictV2 setObject:v10 forKeyedSubscript:@"FeatureChangeCount"];

        [(NSMutableDictionary *)self->_analyticDictV2 setObject:v9 forKeyedSubscript:@"FeatureName"];
        __int16 v11 = [v9 stringByAppendingString:@"Value"];
        int v12 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v11];
        [(NSMutableDictionary *)self->_analyticDictV2 setObject:v12 forKeyedSubscript:@"FeatureValue"];

        uint64_t v13 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:@"ProductID"];
        [(NSMutableDictionary *)self->_analyticDictV2 setObject:v13 forKeyedSubscript:@"HeadphonePID"];

        [(HPSDeviceAnalytics *)self submitDeviceAnalyticsVer2];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
  [(NSMutableDictionary *)self->_analyticDictV2 setObject:&unk_1F40ABBD8 forKeyedSubscript:@"FeatureChangeCount"];
  [(NSMutableDictionary *)self->_analyticDictV2 setObject:@"ListeningMode_PersonalizedVolume_ConversationDetect" forKeyedSubscript:@"FeatureName"];
  v14 = NSString;
  v15 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:@"ListeningModeV2Value"];
  v16 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:@"AdaptiveVolumeValue"];
  v17 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:@"SpeechDetectionValue"];
  v18 = [v14 stringWithFormat:@"%@_%@_%@", v15, v16, v17];
  [(NSMutableDictionary *)self->_analyticDictV2 setObject:v18 forKeyedSubscript:@"FeatureValue"];

  v19 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:@"ProductID"];
  [(NSMutableDictionary *)self->_analyticDictV2 setObject:v19 forKeyedSubscript:@"HeadphonePID"];

  [(HPSDeviceAnalytics *)self submitDeviceAnalyticsVer2];
}

- (void)submitDeviceAnalytics
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(HPSDeviceAnalytics *)self sendFeatureInfoEvent];
  v3 = self->_analyticDict;
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Submit Analytics: %@", buf, 0xCu);
  }

  uint64_t v6 = v3;
  uint64_t v5 = v3;
  AnalyticsSendEventLazy();
  [(HPSDeviceAnalytics *)self resetAnalyticDict];
  [(HPSDeviceAnalytics *)self resetAnalyticDictV2];
}

id __43__HPSDeviceAnalytics_submitDeviceAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticDictFitTest, 0);
  objc_storeStrong((id *)&self->_analyticDictV2, 0);
  objc_storeStrong((id *)&self->_analyticDict, 0);

  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end