@interface HMDAppleMediaAccessorySetupLogEvent
- (BOOL)accessoryInDefaultRoom;
- (BOOL)isRepairSession;
- (BOOL)isUserAtOtherOwnedHome;
- (HMDAppleMediaAccessorySetupLogEvent)initWithRole:(int64_t)a3 setupStartTime:(unint64_t)a4 setupEndTime:(unint64_t)a5 accessoryAddEndTime:(unint64_t)a6 accessoryRemoveTime:(unint64_t)a7 configurationEndTime:(unint64_t)a8 setupSessionError:(id)a9 setupSessionIdentifier:(id)a10 isRepairSession:(BOOL)a11 category:(id)a12 accessorySoftwareVersion:(id)a13 setupClientBundleID:(id)a14 retryCount:(unint64_t)a15 firstSettingTime:(unint64_t)a16 languageSettingTime:(unint64_t)a17 accessoryInDefaultRoom:(BOOL)a18 selectedHomeLocationStatus:(int64_t)a19 isUserAtOtherOwnedHome:(BOOL)a20 lastPrimaryResidentAvailableTime:(unint64_t)a21 numberOfTimesPrimaryResidentChanged:(unsigned int)a22 lastPrimaryClientConnectedTime:(unint64_t)a23 numberOfTimesPrimaryClientConnected:(unsigned int)a24 numberOfTimesPrimaryClientDisconnected:(unsigned int)a25 numberOfTimesPrimaryClientConnectMessageFailed:(unsigned int)a26 addAccessoryMessageReport:(unint64_t)a27 lastPrimaryClientConnectMessageFailError:(id)a28 accessoryDiagnosticInfoFetchError:(id)a29 primaryResidentDiagnosticInfoFetchError:(id)a30 addAccessoryOnPrimaryFailError:(id)a31;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSError)accessoryDiagnosticInfoFetchError;
- (NSError)addAccessoryOnPrimaryFailError;
- (NSError)lastPrimaryClientConnectMessageFailError;
- (NSError)primaryResidentDiagnosticInfoFetchError;
- (NSError)setupSessionError;
- (NSNumber)retryCount;
- (NSNumber)role;
- (NSString)accessorySoftwareVersion;
- (NSString)category;
- (NSString)coreAnalyticsEventName;
- (NSString)setupClientBundleID;
- (NSString)setupSessionIdentifier;
- (int64_t)selectedHomeLocationStatus;
- (unint64_t)accessoryAddEndTime;
- (unint64_t)accessoryRemoveTime;
- (unint64_t)addAccessoryMessageReport;
- (unint64_t)configurationEndTime;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)firstSettingTime;
- (unint64_t)languageSettingTime;
- (unint64_t)lastPrimaryClientConnectedTime;
- (unint64_t)lastPrimaryResidentAvailableTime;
- (unint64_t)setupEndTime;
- (unint64_t)setupStartTime;
- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed;
- (unsigned)numberOfTimesPrimaryClientConnected;
- (unsigned)numberOfTimesPrimaryClientDisconnected;
- (unsigned)numberOfTimesPrimaryResidentChanged;
@end

@implementation HMDAppleMediaAccessorySetupLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAccessoryOnPrimaryFailError, 0);
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_accessoryDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_accessorySoftwareVersion, 0);
  objc_storeStrong((id *)&self->_setupClientBundleID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_setupSessionError, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

- (NSError)addAccessoryOnPrimaryFailError
{
  return (NSError *)objc_getProperty(self, a2, 232, 1);
}

- (NSError)primaryResidentDiagnosticInfoFetchError
{
  return (NSError *)objc_getProperty(self, a2, 224, 1);
}

- (NSError)accessoryDiagnosticInfoFetchError
{
  return (NSError *)objc_getProperty(self, a2, 216, 1);
}

- (NSError)lastPrimaryClientConnectMessageFailError
{
  return (NSError *)objc_getProperty(self, a2, 208, 1);
}

- (unint64_t)addAccessoryMessageReport
{
  return self->_addAccessoryMessageReport;
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailed;
}

- (unsigned)numberOfTimesPrimaryClientDisconnected
{
  return self->_numberOfTimesPrimaryClientDisconnected;
}

- (unsigned)numberOfTimesPrimaryClientConnected
{
  return self->_numberOfTimesPrimaryClientConnected;
}

- (unint64_t)lastPrimaryClientConnectedTime
{
  return self->_lastPrimaryClientConnectedTime;
}

- (unsigned)numberOfTimesPrimaryResidentChanged
{
  return self->_numberOfTimesPrimaryResidentChanged;
}

- (unint64_t)lastPrimaryResidentAvailableTime
{
  return self->_lastPrimaryResidentAvailableTime;
}

- (BOOL)isUserAtOtherOwnedHome
{
  return self->_isUserAtOtherOwnedHome;
}

- (int64_t)selectedHomeLocationStatus
{
  return self->_selectedHomeLocationStatus;
}

- (BOOL)accessoryInDefaultRoom
{
  return self->_accessoryInDefaultRoom;
}

- (unint64_t)languageSettingTime
{
  return self->_languageSettingTime;
}

- (unint64_t)firstSettingTime
{
  return self->_firstSettingTime;
}

- (NSNumber)retryCount
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)accessorySoftwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)setupClientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)setupSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)isRepairSession
{
  return self->_isRepairSession;
}

- (NSError)setupSessionError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (unint64_t)configurationEndTime
{
  return self->_configurationEndTime;
}

- (unint64_t)accessoryRemoveTime
{
  return self->_accessoryRemoveTime;
}

- (unint64_t)accessoryAddEndTime
{
  return self->_accessoryAddEndTime;
}

- (unint64_t)setupEndTime
{
  return self->_setupEndTime;
}

- (unint64_t)setupStartTime
{
  return self->_setupStartTime;
}

- (NSNumber)role
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self configurationEndTime])
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent configurationEndTime](self, "configurationEndTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    [v3 setObject:v4 forKeyedSubscript:@"configurationDuration"];
  }
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self setupEndTime])
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent setupEndTime](self, "setupEndTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    [v3 setObject:v5 forKeyedSubscript:@"setupDuration"];
  }
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self accessoryAddEndTime])
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent accessoryAddEndTime](self, "accessoryAddEndTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    [v3 setObject:v6 forKeyedSubscript:@"hmd_latencyAccessoryAddComplete"];
  }
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self firstSettingTime])
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent firstSettingTime](self, "firstSettingTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    [v3 setObject:v7 forKeyedSubscript:@"hmd_latencyFirstSettingObserved"];
  }
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self languageSettingTime])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent languageSettingTime](self, "languageSettingTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    [v3 setObject:v8 forKeyedSubscript:@"hmd_latencyLanguageSettingObserved"];
  }
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self accessoryRemoveTime])
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent accessoryRemoveTime](self, "accessoryRemoveTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    [v3 setObject:v9 forKeyedSubscript:@"accessoryRemoveTime"];
  }
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self lastPrimaryResidentAvailableTime])
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryResidentAvailableTime](self, "lastPrimaryResidentAvailableTime")- -[HMDAppleMediaAccessorySetupLogEvent accessoryAddEndTime](self, "accessoryAddEndTime"));
    [v3 setObject:v10 forKeyedSubscript:@"hmd_latencyLastPrimaryResidentAvailableTime"];

    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryResidentChanged](self, "numberOfTimesPrimaryResidentChanged"));
    [v3 setObject:v11 forKeyedSubscript:@"hmd_numberOfTimesPrimaryResidentChanged"];
  }
  if ([(HMDAppleMediaAccessorySetupLogEvent *)self lastPrimaryClientConnectedTime])
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryClientConnectedTime](self, "lastPrimaryClientConnectedTime")- -[HMDAppleMediaAccessorySetupLogEvent accessoryAddEndTime](self, "accessoryAddEndTime"));
    [v3 setObject:v12 forKeyedSubscript:@"hmd_latencyLastPrimaryClientConnectedTime"];

    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryClientConnected](self, "numberOfTimesPrimaryClientConnected"));
    [v3 setObject:v13 forKeyedSubscript:@"hmd_numberOfTimesPrimaryClientConnected"];

    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryClientDisconnected](self, "numberOfTimesPrimaryClientDisconnected"));
    [v3 setObject:v14 forKeyedSubscript:@"hmd_numberOfTimesPrimaryClientDisconnected"];
  }
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryClientConnectMessageFailed](self, "numberOfTimesPrimaryClientConnectMessageFailed"));
  [v3 setObject:v15 forKeyedSubscript:@"hmd_numberOfTimesPrimaryClientConnectMessageFailed"];

  v16 = [(HMDAppleMediaAccessorySetupLogEvent *)self lastPrimaryClientConnectMessageFailError];

  if (v16)
  {
    v17 = NSNumber;
    v18 = [(HMDAppleMediaAccessorySetupLogEvent *)self lastPrimaryClientConnectMessageFailError];
    v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "code"));
    [v3 setObject:v19 forKeyedSubscript:@"hmd_primaryClientConnectMessageErrorCode"];

    v20 = [(HMDAppleMediaAccessorySetupLogEvent *)self lastPrimaryClientConnectMessageFailError];
    v21 = [v20 domain];
    [v3 setObject:v21 forKeyedSubscript:@"hmd_primaryClientConnectMessageErrorDomain"];

    v22 = [(HMDAppleMediaAccessorySetupLogEvent *)self lastPrimaryClientConnectMessageFailError];
    v23 = [v22 underlyingErrors];
    v24 = [v23 firstObject];

    if (v24)
    {
      v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "code"));
      [v3 setObject:v25 forKeyedSubscript:@"hmd_primaryClientConnectMessageUnderlyingErrorCode"];

      v26 = [v24 domain];
      [v3 setObject:v26 forKeyedSubscript:@"hmd_primaryClientConnectMessageUnderlyingErrorDomain"];
    }
  }
  v27 = [(HMDAppleMediaAccessorySetupLogEvent *)self accessoryDiagnosticInfoFetchError];

  if (v27)
  {
    v28 = NSNumber;
    v29 = [(HMDAppleMediaAccessorySetupLogEvent *)self accessoryDiagnosticInfoFetchError];
    v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "code"));
    [v3 setObject:v30 forKeyedSubscript:@"hmd_accessoryDiagnosticInfoFetchErrorCode"];

    v31 = [(HMDAppleMediaAccessorySetupLogEvent *)self accessoryDiagnosticInfoFetchError];
    v32 = [v31 domain];
    [v3 setObject:v32 forKeyedSubscript:@"hmd_accessoryDiagnosticInfoFetchErrorDomain"];

    v33 = [(HMDAppleMediaAccessorySetupLogEvent *)self accessoryDiagnosticInfoFetchError];
    v34 = [v33 underlyingErrors];
    v35 = [v34 firstObject];

    if (v35)
    {
      v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v35, "code"));
      [v3 setObject:v36 forKeyedSubscript:@"hmd_accessoryDiagnosticInfoFetchUnderlyingErrorCode"];

      v37 = [v35 domain];
      [v3 setObject:v37 forKeyedSubscript:@"hmd_accessoryDiagnosticInfoFetchUnderlyingErrorDomain"];
    }
  }
  v38 = [(HMDAppleMediaAccessorySetupLogEvent *)self primaryResidentDiagnosticInfoFetchError];

  if (v38)
  {
    v39 = NSNumber;
    v40 = [(HMDAppleMediaAccessorySetupLogEvent *)self primaryResidentDiagnosticInfoFetchError];
    v41 = objc_msgSend(v39, "numberWithInteger:", objc_msgSend(v40, "code"));
    [v3 setObject:v41 forKeyedSubscript:@"hmd_primaryResidentDiagnosticInfoFetchErrorCode"];

    v42 = [(HMDAppleMediaAccessorySetupLogEvent *)self primaryResidentDiagnosticInfoFetchError];
    v43 = [v42 domain];
    [v3 setObject:v43 forKeyedSubscript:@"hmd_primaryResidentDiagnosticInfoFetchErrorDomain"];

    v44 = [(HMDAppleMediaAccessorySetupLogEvent *)self primaryResidentDiagnosticInfoFetchError];
    v45 = [v44 underlyingErrors];
    v46 = [v45 firstObject];

    if (v46)
    {
      v47 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v46, "code"));
      [v3 setObject:v47 forKeyedSubscript:@"hmd_primaryResidentDiagnosticInfoFetchUnderlyingErrorCode"];

      v48 = [v46 domain];
      [v3 setObject:v48 forKeyedSubscript:@"hmd_primaryResidentDiagnosticInfoFetchUnderlyingErrorDomain"];
    }
  }
  v49 = [(HMDAppleMediaAccessorySetupLogEvent *)self addAccessoryOnPrimaryFailError];

  if (v49)
  {
    v50 = NSNumber;
    v51 = [(HMDAppleMediaAccessorySetupLogEvent *)self addAccessoryOnPrimaryFailError];
    v52 = objc_msgSend(v50, "numberWithInteger:", objc_msgSend(v51, "code"));
    [v3 setObject:v52 forKeyedSubscript:@"addAccessoryErrorCode"];

    v53 = [(HMDAppleMediaAccessorySetupLogEvent *)self addAccessoryOnPrimaryFailError];
    v54 = [v53 domain];
    [v3 setObject:v54 forKeyedSubscript:@"addAccessoryErrorDomain"];

    v55 = [(HMDAppleMediaAccessorySetupLogEvent *)self addAccessoryOnPrimaryFailError];
    v56 = [v55 underlyingErrors];
    v57 = [v56 firstObject];

    if (v57)
    {
      v58 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v57, "code"));
      [v3 setObject:v58 forKeyedSubscript:@"addAccessoryUnderlyingErrorCode"];

      v59 = [v57 domain];
      [v3 setObject:v59 forKeyedSubscript:@"addAccessoryUnderlyingErrorDomain"];
    }
  }
  v60 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessorySetupLogEvent addAccessoryMessageReport](self, "addAccessoryMessageReport"));
  [v3 setObject:v60 forKeyedSubscript:@"addAccessoryMessageReport"];

  v61 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessorySetupLogEvent isRepairSession](self, "isRepairSession"));
  [v3 setObject:v61 forKeyedSubscript:@"isRepairSession"];

  v62 = [(HMDAppleMediaAccessorySetupLogEvent *)self setupClientBundleID];
  [v3 setObject:v62 forKeyedSubscript:@"setupClientBundleID"];

  v63 = [(HMDAppleMediaAccessorySetupLogEvent *)self setupSessionIdentifier];
  [v3 setObject:v63 forKeyedSubscript:@"setupSessionIdentifier"];

  v64 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessorySetupLogEvent accessoryInDefaultRoom](self, "accessoryInDefaultRoom"));
  [v3 setObject:v64 forKeyedSubscript:@"accessoryInDefaultRoom"];

  v65 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAppleMediaAccessorySetupLogEvent selectedHomeLocationStatus](self, "selectedHomeLocationStatus"));
  [v3 setObject:v65 forKeyedSubscript:@"selectedHomeLocationStatus"];

  v66 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessorySetupLogEvent isUserAtOtherOwnedHome](self, "isUserAtOtherOwnedHome"));
  [v3 setObject:v66 forKeyedSubscript:@"isUserAtOtherOwnedHome"];

  v67 = [(HMDAppleMediaAccessorySetupLogEvent *)self role];
  [v3 setObject:v67 forKeyedSubscript:@"role"];

  v68 = [(HMDAppleMediaAccessorySetupLogEvent *)self category];
  [v3 setObject:v68 forKeyedSubscript:@"category"];

  v69 = [(HMDAppleMediaAccessorySetupLogEvent *)self accessorySoftwareVersion];
  [v3 setObject:v69 forKeyedSubscript:@"accessorySoftwareVersion"];

  v70 = [(HMDAppleMediaAccessorySetupLogEvent *)self setupSessionError];

  if (v70)
  {
    v71 = NSNumber;
    v72 = [(HMDAppleMediaAccessorySetupLogEvent *)self setupSessionError];
    v73 = objc_msgSend(v71, "numberWithInteger:", objc_msgSend(v72, "code"));
    [v3 setObject:v73 forKeyedSubscript:@"setupSessionErrorCode"];

    v74 = [(HMDAppleMediaAccessorySetupLogEvent *)self setupSessionError];
    v75 = [v74 domain];
    [v3 setObject:v75 forKeyedSubscript:@"setupSessionErrorDomain"];
  }
  v76 = [(HMMLogEvent *)self error];

  if (v76)
  {
    v77 = NSNumber;
    v78 = [(HMMLogEvent *)self error];
    v79 = objc_msgSend(v77, "numberWithInteger:", objc_msgSend(v78, "code"));
    [v3 setObject:v79 forKeyedSubscript:@"configurationErrorCode"];

    v80 = [(HMMLogEvent *)self error];
    v81 = [v80 domain];
    [v3 setObject:v81 forKeyedSubscript:@"configurationErrorDomain"];
  }
  v82 = [(HMDAppleMediaAccessorySetupLogEvent *)self category];
  [v3 setObject:v82 forKeyedSubscript:@"category"];

  v83 = [(HMDAppleMediaAccessorySetupLogEvent *)self retryCount];
  [v3 setObject:v83 forKeyedSubscript:@"retryCount"];

  v84 = (void *)[v3 copy];
  return (NSDictionary *)v84;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.homepod.accessory.setup.metric.event";
}

- (HMDAppleMediaAccessorySetupLogEvent)initWithRole:(int64_t)a3 setupStartTime:(unint64_t)a4 setupEndTime:(unint64_t)a5 accessoryAddEndTime:(unint64_t)a6 accessoryRemoveTime:(unint64_t)a7 configurationEndTime:(unint64_t)a8 setupSessionError:(id)a9 setupSessionIdentifier:(id)a10 isRepairSession:(BOOL)a11 category:(id)a12 accessorySoftwareVersion:(id)a13 setupClientBundleID:(id)a14 retryCount:(unint64_t)a15 firstSettingTime:(unint64_t)a16 languageSettingTime:(unint64_t)a17 accessoryInDefaultRoom:(BOOL)a18 selectedHomeLocationStatus:(int64_t)a19 isUserAtOtherOwnedHome:(BOOL)a20 lastPrimaryResidentAvailableTime:(unint64_t)a21 numberOfTimesPrimaryResidentChanged:(unsigned int)a22 lastPrimaryClientConnectedTime:(unint64_t)a23 numberOfTimesPrimaryClientConnected:(unsigned int)a24 numberOfTimesPrimaryClientDisconnected:(unsigned int)a25 numberOfTimesPrimaryClientConnectMessageFailed:(unsigned int)a26 addAccessoryMessageReport:(unint64_t)a27 lastPrimaryClientConnectMessageFailError:(id)a28 accessoryDiagnosticInfoFetchError:(id)a29 primaryResidentDiagnosticInfoFetchError:(id)a30 addAccessoryOnPrimaryFailError:(id)a31
{
  id v58 = a9;
  id v56 = a10;
  id v33 = a12;
  id v57 = a13;
  id v34 = a14;
  id v55 = a28;
  id v35 = a29;
  id v36 = a30;
  id v37 = a31;
  v59.receiver = self;
  v59.super_class = (Class)HMDAppleMediaAccessorySetupLogEvent;
  v38 = [(HMMLogEvent *)&v59 init];
  if (v38)
  {
    uint64_t v39 = [NSNumber numberWithInteger:a3];
    role = v38->_role;
    v38->_role = (NSNumber *)v39;

    v38->_setupStartTime = a4;
    v38->_setupEndTime = a5;
    v38->_accessoryAddEndTime = a6;
    v38->_accessoryRemoveTime = a7;
    v38->_configurationEndTime = a8;
    uint64_t v41 = [v58 copy];
    setupSessionError = v38->_setupSessionError;
    v38->_setupSessionError = (NSError *)v41;

    v38->_isRepairSession = a11;
    uint64_t v43 = [v33 copy];
    category = v38->_category;
    v38->_category = (NSString *)v43;

    uint64_t v45 = [v57 copy];
    accessorySoftwareVersion = v38->_accessorySoftwareVersion;
    v38->_accessorySoftwareVersion = (NSString *)v45;

    objc_storeStrong((id *)&v38->_setupClientBundleID, a14);
    objc_storeStrong((id *)&v38->_setupSessionIdentifier, a10);
    uint64_t v47 = [NSNumber numberWithUnsignedInteger:a15];
    retryCount = v38->_retryCount;
    v38->_retryCount = (NSNumber *)v47;

    v38->_languageSettingTime = a17;
    v38->_firstSettingTime = a16;
    v38->_accessoryInDefaultRoom = a18;
    v38->_selectedHomeLocationStatus = a19;
    v38->_isUserAtOtherOwnedHome = a20;
    v38->_lastPrimaryResidentAvailableTime = a21;
    v38->_numberOfTimesPrimaryResidentChanged = a22;
    v38->_lastPrimaryClientConnectedTime = a23;
    v38->_numberOfTimesPrimaryClientConnected = a24;
    v38->_numberOfTimesPrimaryClientDisconnected = a25;
    v38->_numberOfTimesPrimaryClientConnectMessageFailed = a26;
    v38->_addAccessoryMessageReport = a27;
    objc_storeStrong((id *)&v38->_lastPrimaryClientConnectMessageFailError, a28);
    objc_storeStrong((id *)&v38->_accessoryDiagnosticInfoFetchError, a29);
    objc_storeStrong((id *)&v38->_primaryResidentDiagnosticInfoFetchError, a30);
    objc_storeStrong((id *)&v38->_addAccessoryOnPrimaryFailError, a31);
  }

  return v38;
}

@end