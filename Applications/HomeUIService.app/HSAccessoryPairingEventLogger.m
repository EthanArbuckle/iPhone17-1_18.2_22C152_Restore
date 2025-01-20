@interface HSAccessoryPairingEventLogger
+ (id)sharedLogger;
- (BOOL)isHUISLaunchedByFirstParty;
- (BOOL)isHUISLaunchedByThirdParty;
- (BOOL)pairingSuccess;
- (HSAccessoryPairingEventLogger)init;
- (NSArray)accessoryPairingEventLoggerTimeHistogramBins;
- (NSDate)currentStepStartTime;
- (NSDate)huisDismissDate;
- (NSDate)huisLaunchDate;
- (NSDate)pairingBeginDate;
- (NSDate)pairingCompleteDate;
- (NSMutableArray)cardTime;
- (NSNumber)codeInputMethod;
- (NSNumber)huisLaunchReason;
- (NSNumber)huisLaunchType;
- (NSNumber)huisUserType;
- (NSNumber)isLaunchedToSetupASpecificAccessory;
- (NSNumber)isUsingCHIPCommunicationProtocol;
- (NSNumber)numPairedAccessories;
- (NSNumber)supportsBTLE;
- (NSNumber)supportsIP;
- (NSNumber)supportsThread;
- (NSNumber)supportsWAC;
- (NSString)accessoryManufacturer;
- (NSString)accessoryName;
- (NSString)exitCardString;
- (id)bucketizeValueIntoHistogramBin:(double)a3;
- (int64_t)currentStep;
- (unint64_t)launchType;
- (unint64_t)numCards;
- (void)_sendEvent;
- (void)logAccessory:(id)a3;
- (void)logCardCount:(unint64_t)a3;
- (void)logCodeInputMethod:(unint64_t)a3;
- (void)logExitStep:(int64_t)a3;
- (void)logHUISDismiss;
- (void)logHUISLaunchWithReason:(int64_t)a3 accessoryDescription:(id)a4;
- (void)logHUISUserType:(unint64_t)a3;
- (void)logIsUsingCHIPCommunicationProtocol:(BOOL)a3;
- (void)logLaunchedToSetupASpecificAccessory:(BOOL)a3;
- (void)logNumberOfPairedAccessories:(unint64_t)a3;
- (void)logPairingBegin;
- (void)logPairingComplete;
- (void)logStepStart:(int64_t)a3;
- (void)logTransportFlagsFromPayload:(id)a3;
- (void)setAccessoryManufacturer:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setCardTime:(id)a3;
- (void)setCodeInputMethod:(id)a3;
- (void)setCurrentStep:(int64_t)a3;
- (void)setCurrentStepStartTime:(id)a3;
- (void)setExitCardString:(id)a3;
- (void)setHuisDismissDate:(id)a3;
- (void)setHuisLaunchDate:(id)a3;
- (void)setHuisLaunchReason:(id)a3;
- (void)setHuisLaunchType:(id)a3;
- (void)setHuisUserType:(id)a3;
- (void)setIsLaunchedToSetupASpecificAccessory:(id)a3;
- (void)setIsUsingCHIPCommunicationProtocol:(id)a3;
- (void)setNumCards:(unint64_t)a3;
- (void)setNumPairedAccessories:(id)a3;
- (void)setPairingBeginDate:(id)a3;
- (void)setPairingCompleteDate:(id)a3;
- (void)setPairingSuccess:(BOOL)a3;
- (void)setSupportsBTLE:(id)a3;
- (void)setSupportsIP:(id)a3;
- (void)setSupportsThread:(id)a3;
- (void)setSupportsWAC:(id)a3;
@end

@implementation HSAccessoryPairingEventLogger

+ (id)sharedLogger
{
  if (qword_1000CB588 != -1) {
    dispatch_once(&qword_1000CB588, &stru_1000AAB78);
  }
  v2 = (void *)qword_1000CB580;

  return v2;
}

- (HSAccessoryPairingEventLogger)init
{
  v10.receiver = self;
  v10.super_class = (Class)HSAccessoryPairingEventLogger;
  v2 = [(HSAccessoryPairingEventLogger *)&v10 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004230C;
    v11[3] = &unk_1000AAC00;
    id v12 = v3;
    id v4 = v3;
    v5 = objc_retainBlock(v11);
    ((void (*)(void *, void, uint64_t, uint64_t))v5[2])(v5, 0, 10, 1);
    ((void (*)(void *, uint64_t, uint64_t, uint64_t))v5[2])(v5, 10, 300, 10);
    v6 = +[NSNumber numberWithUnsignedInteger:300];
    [v4 addObject:v6];

    v7 = (NSArray *)[v4 copy];
    accessoryPairingEventLoggerTimeHistogramBins = v2->_accessoryPairingEventLoggerTimeHistogramBins;
    v2->_accessoryPairingEventLoggerTimeHistogramBins = v7;
  }
  return v2;
}

- (id)bucketizeValueIntoHistogramBin:(double)a3
{
  v5 = [(HSAccessoryPairingEventLogger *)self accessoryPairingEventLoggerTimeHistogramBins];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= 2)
  {
    v8 = [(HSAccessoryPairingEventLogger *)self accessoryPairingEventLoggerTimeHistogramBins];
    if ((unint64_t)[v8 count] < 2)
    {
LABEL_7:
      v15 = [v8 lastObject];
      v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1000 * (void)[v15 unsignedIntegerValue]);
    }
    else
    {
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = v9 + 1;
        v11 = [v8 objectAtIndexedSubscript:v9 + 1];
        double v12 = (double)(unint64_t)[v11 unsignedIntegerValue];

        if (v12 > a3) {
          break;
        }
        id v13 = [v8 count];
        unint64_t v14 = v9 + 2;
        ++v9;
        if (v14 >= (unint64_t)v13) {
          goto LABEL_7;
        }
      }
      v15 = [v8 objectAtIndexedSubscript:v9];
      id v16 = [v15 unsignedIntegerValue];
      v17 = [v8 objectAtIndexedSubscript:v10];
      v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)(1000 * ((uint64_t)v16 + (void)[v17 unsignedIntegerValue])) >> 1);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)logHUISUserType:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(HSAccessoryPairingEventLogger *)self setHuisUserType:v4];
}

- (void)logLaunchedToSetupASpecificAccessory:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(HSAccessoryPairingEventLogger *)self setIsLaunchedToSetupASpecificAccessory:v4];
}

- (void)logIsUsingCHIPCommunicationProtocol:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(HSAccessoryPairingEventLogger *)self setIsUsingCHIPCommunicationProtocol:v4];
}

- (void)logCodeInputMethod:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(HSAccessoryPairingEventLogger *)self setCodeInputMethod:v4];
}

- (void)logHUISLaunchWithReason:(int64_t)a3 accessoryDescription:(id)a4
{
  id v6 = a4;
  id v12 = v6;
  if (a3)
  {
    uint64_t v7 = 2;
  }
  else if (objc_msgSend(v6, "hf_isLaunchedByHomeApp"))
  {
    v8 = [v12 setupAccessoryPayload];

    if (v8) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 2;
    }
  }
  else if (objc_msgSend(v12, "hf_isLaunchedByHomeDaemon"))
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 100;
  }
  uint64_t v9 = +[NSNumber numberWithInteger:a3];
  [(HSAccessoryPairingEventLogger *)self setHuisLaunchReason:v9];

  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:v7];
  [(HSAccessoryPairingEventLogger *)self setHuisLaunchType:v10];

  v11 = +[NSDate date];
  [(HSAccessoryPairingEventLogger *)self setHuisLaunchDate:v11];
}

- (unint64_t)launchType
{
  v2 = [(HSAccessoryPairingEventLogger *)self huisLaunchType];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (BOOL)isHUISLaunchedByFirstParty
{
  return (char *)[(HSAccessoryPairingEventLogger *)self launchType] - 1 < (char *)3;
}

- (BOOL)isHUISLaunchedByThirdParty
{
  return (id)[(HSAccessoryPairingEventLogger *)self launchType] == (id)100;
}

- (void)logHUISDismiss
{
  id v3 = [(HSAccessoryPairingEventLogger *)self huisDismissDate];

  if (!v3)
  {
    id v4 = +[NSDate date];
    [(HSAccessoryPairingEventLogger *)self setHuisDismissDate:v4];

    [(HSAccessoryPairingEventLogger *)self _sendEvent];
  }
}

- (void)logPairingBegin
{
  id v3 = +[NSDate date];
  [(HSAccessoryPairingEventLogger *)self setPairingBeginDate:v3];
}

- (void)logPairingComplete
{
  id v3 = +[NSDate date];
  [(HSAccessoryPairingEventLogger *)self setPairingCompleteDate:v3];
}

- (void)logNumberOfPairedAccessories:(unint64_t)a3
{
  [(HSAccessoryPairingEventLogger *)self setPairingSuccess:a3 != 0];
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  [(HSAccessoryPairingEventLogger *)self setNumPairedAccessories:v5];
}

- (void)logExitStep:(int64_t)a3
{
  [(HSAccessoryPairingEventLogger *)self logStepStart:0];
  id v5 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:a3];
  [(HSAccessoryPairingEventLogger *)self setExitCardString:v5];
}

- (void)logTransportFlagsFromPayload:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 supportsIP]);
    [(HSAccessoryPairingEventLogger *)self setSupportsIP:v5];

    id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 supportsWAC]);
    [(HSAccessoryPairingEventLogger *)self setSupportsWAC:v6];

    uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 supportsBTLE]);
    [(HSAccessoryPairingEventLogger *)self setSupportsBTLE:v7];

    id v9 = [v4 threadIdentifier];

    v8 = +[NSNumber numberWithInt:v9 != 0];
    [(HSAccessoryPairingEventLogger *)self setSupportsThread:v8];
  }
}

- (void)logAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  [(HSAccessoryPairingEventLogger *)self setAccessoryName:v5];

  id v6 = [v4 manufacturer];

  [(HSAccessoryPairingEventLogger *)self setAccessoryManufacturer:v6];
}

- (void)logStepStart:(int64_t)a3
{
  if ([(HSAccessoryPairingEventLogger *)self currentStep] != a3)
  {
    id v5 = +[NSDate date];
    if ([(HSAccessoryPairingEventLogger *)self currentStep])
    {
      id v6 = [(HSAccessoryPairingEventLogger *)self currentStepStartTime];

      if (v6)
      {
        uint64_t v7 = [(HSAccessoryPairingEventLogger *)self cardTime];

        if (!v7)
        {
          v8 = +[NSMutableArray array];
          [(HSAccessoryPairingEventLogger *)self setCardTime:v8];
        }
        id v9 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:[(HSAccessoryPairingEventLogger *)self currentStep]];
        uint64_t v10 = [(HSAccessoryPairingEventLogger *)self currentStepStartTime];
        [v5 timeIntervalSinceDate:v10];
        double v12 = v11;

        id v13 = [(HSAccessoryPairingEventLogger *)self cardTime];
        id v16 = v9;
        unint64_t v14 = [(HSAccessoryPairingEventLogger *)self bucketizeValueIntoHistogramBin:v12];
        v17 = v14;
        v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        [v13 na_safeAddObject:v15];
      }
    }
    [(HSAccessoryPairingEventLogger *)self setCurrentStep:a3];
    [(HSAccessoryPairingEventLogger *)self setCurrentStepStartTime:v5];
  }
}

- (void)logCardCount:(unint64_t)a3
{
}

- (void)_sendEvent
{
  id v3 = [(HSAccessoryPairingEventLogger *)self cardTime];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = +[NSMutableDictionary dictionary];
    id v6 = [(HSAccessoryPairingEventLogger *)self huisDismissDate];
    uint64_t v7 = [(HSAccessoryPairingEventLogger *)self huisLaunchDate];
    [v6 timeIntervalSinceDate:v7];
    v8 = -[HSAccessoryPairingEventLogger bucketizeValueIntoHistogramBin:](self, "bucketizeValueIntoHistogramBin:");
    [v5 setObject:v8 forKeyedSubscript:HFAnalyticsDataHUISSessionTimeKey];

    id v9 = [(HSAccessoryPairingEventLogger *)self huisLaunchReason];
    [v5 setObject:v9 forKeyedSubscript:HFAnalyticsDataHUISLaunchReasonKey];

    uint64_t v10 = [(HSAccessoryPairingEventLogger *)self huisLaunchType];
    [v5 setObject:v10 forKeyedSubscript:HFAnalyticsDataHUISLaunchTypeKey];

    double v11 = [(HSAccessoryPairingEventLogger *)self huisUserType];
    [v5 setObject:v11 forKeyedSubscript:HFAnalyticsDataHUISUserTypeKey];

    double v12 = [(HSAccessoryPairingEventLogger *)self exitCardString];
    [v5 setObject:v12 forKeyedSubscript:HFAnalyticsDataHUISExitCardKey];

    id v13 = [(HSAccessoryPairingEventLogger *)self cardTime];
    unint64_t v14 = [v13 na_flatMap:&stru_1000AABB8];
    [v5 setObject:v14 forKeyedSubscript:HFAnalyticsDataCardNameKey];

    v15 = [(HSAccessoryPairingEventLogger *)self cardTime];
    id v16 = [v15 na_flatMap:&stru_1000AABD8];
    [v5 setObject:v16 forKeyedSubscript:HFAnalyticsDataCardTimeKey];

    v17 = +[NSNumber numberWithUnsignedInteger:[(HSAccessoryPairingEventLogger *)self numCards]];
    [v5 setObject:v17 forKeyedSubscript:HFAnalyticsDataCardCountKey];

    v18 = [(HSAccessoryPairingEventLogger *)self huisLaunchReason];

    if (!v18)
    {
      v20 = [(HSAccessoryPairingEventLogger *)self isLaunchedToSetupASpecificAccessory];
      [v5 setObject:v20 forKeyedSubscript:HFAnalyticsDataHUISIsLaunchedToSetupASpecificAccessory];

      v21 = [(HSAccessoryPairingEventLogger *)self isUsingCHIPCommunicationProtocol];
      [v5 setObject:v21 forKeyedSubscript:HFAnalyticsDataHUISIsUsingCHIPCommunicationProtocol];

      v22 = [(HSAccessoryPairingEventLogger *)self codeInputMethod];
      [v5 setObject:v22 forKeyedSubscript:HFAnalyticsDataHUISCodeInputMethod];

      v23 = [(HSAccessoryPairingEventLogger *)self supportsIP];
      [v5 setObject:v23 forKeyedSubscript:HFAnalyticsDataAccessoryTransportIPKey];

      v24 = [(HSAccessoryPairingEventLogger *)self supportsWAC];
      [v5 setObject:v24 forKeyedSubscript:HFAnalyticsDataAccessoryTransportWACKey];

      v25 = [(HSAccessoryPairingEventLogger *)self supportsBTLE];
      [v5 setObject:v25 forKeyedSubscript:HFAnalyticsDataAccessoryTransportBTLEKey];

      v26 = [(HSAccessoryPairingEventLogger *)self supportsThread];
      [v5 setObject:v26 forKeyedSubscript:HFAnalyticsDataAccessoryTransportThreadKey];

      v27 = [(HSAccessoryPairingEventLogger *)self pairingBeginDate];

      if (v27)
      {
        v28 = +[NSNumber numberWithBool:[(HSAccessoryPairingEventLogger *)self pairingSuccess]];
        [v5 setObject:v28 forKeyedSubscript:HFAnalyticsDataSuccessKey];

        v29 = [(HSAccessoryPairingEventLogger *)self pairingBeginDate];
        v30 = [(HSAccessoryPairingEventLogger *)self huisLaunchDate];
        [v29 timeIntervalSinceDate:v30];
        v31 = -[HSAccessoryPairingEventLogger bucketizeValueIntoHistogramBin:](self, "bucketizeValueIntoHistogramBin:");
        [v5 setObject:v31 forKeyedSubscript:HFAnalyticsDataPrePairingTimeKey];

        v32 = [(HSAccessoryPairingEventLogger *)self numPairedAccessories];
        [v5 setObject:v32 forKeyedSubscript:HFAnalyticsDataNumPairedAccessoriesKey];

        v33 = [(HSAccessoryPairingEventLogger *)self pairingCompleteDate];

        if (v33)
        {
          v34 = [(HSAccessoryPairingEventLogger *)self pairingCompleteDate];
          v35 = [(HSAccessoryPairingEventLogger *)self pairingBeginDate];
          [v34 timeIntervalSinceDate:v35];
          v36 = -[HSAccessoryPairingEventLogger bucketizeValueIntoHistogramBin:](self, "bucketizeValueIntoHistogramBin:");
          [v5 setObject:v36 forKeyedSubscript:HFAnalyticsDataPairingTimeKey];
        }
      }
    }
    AnalyticsSendEvent();
    v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412546;
      CFStringRef v38 = @"com.apple.Home.AccessoryPairing";
      __int16 v39 = 2112;
      v40 = v5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Event:%@ payload:%@", (uint8_t *)&v37, 0x16u);
    }
  }
}

- (NSDate)huisLaunchDate
{
  return self->_huisLaunchDate;
}

- (void)setHuisLaunchDate:(id)a3
{
}

- (NSDate)huisDismissDate
{
  return self->_huisDismissDate;
}

- (void)setHuisDismissDate:(id)a3
{
}

- (NSNumber)isLaunchedToSetupASpecificAccessory
{
  return self->_isLaunchedToSetupASpecificAccessory;
}

- (void)setIsLaunchedToSetupASpecificAccessory:(id)a3
{
}

- (NSNumber)isUsingCHIPCommunicationProtocol
{
  return self->_isUsingCHIPCommunicationProtocol;
}

- (void)setIsUsingCHIPCommunicationProtocol:(id)a3
{
}

- (NSNumber)codeInputMethod
{
  return self->_codeInputMethod;
}

- (void)setCodeInputMethod:(id)a3
{
}

- (NSNumber)huisLaunchReason
{
  return self->_huisLaunchReason;
}

- (void)setHuisLaunchReason:(id)a3
{
}

- (NSNumber)huisLaunchType
{
  return self->_huisLaunchType;
}

- (void)setHuisLaunchType:(id)a3
{
}

- (NSNumber)huisUserType
{
  return self->_huisUserType;
}

- (void)setHuisUserType:(id)a3
{
}

- (NSDate)pairingBeginDate
{
  return self->_pairingBeginDate;
}

- (void)setPairingBeginDate:(id)a3
{
}

- (NSDate)pairingCompleteDate
{
  return self->_pairingCompleteDate;
}

- (void)setPairingCompleteDate:(id)a3
{
}

- (BOOL)pairingSuccess
{
  return self->_pairingSuccess;
}

- (void)setPairingSuccess:(BOOL)a3
{
  self->_pairingSuccess = a3;
}

- (NSNumber)numPairedAccessories
{
  return self->_numPairedAccessories;
}

- (void)setNumPairedAccessories:(id)a3
{
}

- (NSString)exitCardString
{
  return self->_exitCardString;
}

- (void)setExitCardString:(id)a3
{
}

- (NSNumber)supportsIP
{
  return self->_supportsIP;
}

- (void)setSupportsIP:(id)a3
{
}

- (NSNumber)supportsWAC
{
  return self->_supportsWAC;
}

- (void)setSupportsWAC:(id)a3
{
}

- (NSNumber)supportsBTLE
{
  return self->_supportsBTLE;
}

- (void)setSupportsBTLE:(id)a3
{
}

- (NSNumber)supportsThread
{
  return self->_supportsThread;
}

- (void)setSupportsThread:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (void)setAccessoryManufacturer:(id)a3
{
}

- (NSMutableArray)cardTime
{
  return self->_cardTime;
}

- (void)setCardTime:(id)a3
{
}

- (int64_t)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(int64_t)a3
{
  self->_currentStep = a3;
}

- (NSDate)currentStepStartTime
{
  return self->_currentStepStartTime;
}

- (void)setCurrentStepStartTime:(id)a3
{
  self->_currentStepStartTime = (NSDate *)a3;
}

- (unint64_t)numCards
{
  return self->_numCards;
}

- (void)setNumCards:(unint64_t)a3
{
  self->_numCards = a3;
}

- (NSArray)accessoryPairingEventLoggerTimeHistogramBins
{
  return self->_accessoryPairingEventLoggerTimeHistogramBins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryPairingEventLoggerTimeHistogramBins, 0);
  objc_storeStrong((id *)&self->_cardTime, 0);
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_supportsThread, 0);
  objc_storeStrong((id *)&self->_supportsBTLE, 0);
  objc_storeStrong((id *)&self->_supportsWAC, 0);
  objc_storeStrong((id *)&self->_supportsIP, 0);
  objc_storeStrong((id *)&self->_exitCardString, 0);
  objc_storeStrong((id *)&self->_numPairedAccessories, 0);
  objc_storeStrong((id *)&self->_pairingCompleteDate, 0);
  objc_storeStrong((id *)&self->_pairingBeginDate, 0);
  objc_storeStrong((id *)&self->_huisUserType, 0);
  objc_storeStrong((id *)&self->_huisLaunchType, 0);
  objc_storeStrong((id *)&self->_huisLaunchReason, 0);
  objc_storeStrong((id *)&self->_codeInputMethod, 0);
  objc_storeStrong((id *)&self->_isUsingCHIPCommunicationProtocol, 0);
  objc_storeStrong((id *)&self->_isLaunchedToSetupASpecificAccessory, 0);
  objc_storeStrong((id *)&self->_huisDismissDate, 0);

  objc_storeStrong((id *)&self->_huisLaunchDate, 0);
}

@end