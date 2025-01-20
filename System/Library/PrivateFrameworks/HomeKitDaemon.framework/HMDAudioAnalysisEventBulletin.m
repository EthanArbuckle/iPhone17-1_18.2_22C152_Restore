@interface HMDAudioAnalysisEventBulletin
+ (BOOL)supportsSecureCoding;
- (HMDAccessoryNameComposer)accessoryNameComposer;
- (HMDAudioAnalysisEventBulletin)initWithCoder:(id)a3;
- (HMDAudioAnalysisEventBulletin)initWithDictionary:(id)a3;
- (HMDAudioAnalysisEventBulletin)initWithReason:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 notificationUUID:(id)a6 state:(unint64_t)a7 soundIdentifier:(id)a8 name:(id)a9 threadIdentifier:(id)a10 accessoryUUID:(id)a11 title:(id)a12;
- (HMDAudioAnalysisEventSubscriberContext)context;
- (NSDate)dateOfOccurrence;
- (NSDate)startDate;
- (NSString)name;
- (NSString)soundIdentifier;
- (NSString)threadIdentifier;
- (NSString)title;
- (NSUUID)accessoryUUID;
- (NSUUID)notificationUUID;
- (id)localizedKeyForBody;
- (id)localizedKeyForEventEndWithDropIn:(BOOL)a3 homeName:(id)a4;
- (id)localizedKeyForEventStartWithDropIn:(BOOL)a3 homeName:(id)a4;
- (id)localizedKeyForTitle;
- (id)serialize;
- (id)stringForAudioAnalysisReasonWithHomeName:(id)a3;
- (unint64_t)reason;
- (unint64_t)state;
- (void)configureAccessoryNameComposer;
- (void)configureWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryNameComposer:(id)a3;
- (void)setNotificationUUID:(id)a3;
@end

@implementation HMDAudioAnalysisEventBulletin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryNameComposer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_soundIdentifier, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
}

- (void)setAccessoryNameComposer:(id)a3
{
}

- (HMDAccessoryNameComposer)accessoryNameComposer
{
  return self->_accessoryNameComposer;
}

- (HMDAudioAnalysisEventSubscriberContext)context
{
  return (HMDAudioAnalysisEventSubscriberContext *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)soundIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)notificationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAudioAnalysisEventBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0BA90]];
  uint64_t v17 = [v18 unsignedIntegerValue];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinDateKey"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinNotificationUUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinState"];
  uint64_t v15 = [v6 unsignedIntValue];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinSoundIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinTitleKey"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinAccessoryUUIDKey"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinNameKey"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinThreadIdentifierKey"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAudioAnalysisEventBulletinStartDateKey"];

  v13 = [(HMDAudioAnalysisEventBulletin *)self initWithReason:v17 startDate:v12 endDate:v16 notificationUUID:v5 state:v15 soundIdentifier:v7 name:v10 threadIdentifier:v11 accessoryUUID:v9 title:v8];
  return v13;
}

- (HMDAudioAnalysisEventBulletin)initWithDictionary:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F0BA90];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  unsigned int v34 = [v7 unsignedIntValue];
  v8 = [v4 objectForKeyedSubscript:@"HMDAudioAnalysisEventBulletinState"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  unsigned int v33 = [v10 unsignedIntValue];
  v11 = objc_msgSend(v4, "hmf_UUIDForKey:", @"HMDAudioAnalysisEventBulletinAccessoryUUIDKey");
  v12 = (void *)MEMORY[0x263EFF910];
  v13 = [v4 objectForKeyedSubscript:@"HMDAudioAnalysisEventBulletinDateKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  [v15 doubleValue];
  double v17 = v16;

  v18 = [v12 dateWithTimeIntervalSince1970:v17];
  v19 = [v4 objectForKeyedSubscript:@"HMDAudioAnalysisEventBulletinNameKey"];
  v20 = objc_msgSend(v4, "hmf_UUIDForKey:", @"HMDAudioAnalysisEventBulletinNotificationUUID");
  v21 = [v4 objectForKeyedSubscript:@"HMDAudioAnalysisEventBulletinSoundIdentifier"];
  v22 = [v4 objectForKeyedSubscript:@"HMDAudioAnalysisEventBulletinTitleKey"];
  v23 = [v4 objectForKeyedSubscript:@"HMDAudioAnalysisEventBulletinThreadIdentifierKey"];
  v24 = (void *)MEMORY[0x263EFF910];
  v25 = [v4 objectForKeyedSubscript:@"HMDAudioAnalysisEventBulletinStartDateKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v26 = v25;
  }
  else {
    v26 = 0;
  }
  id v27 = v26;

  [v27 doubleValue];
  double v29 = v28;

  v30 = [v24 dateWithTimeIntervalSince1970:v29];
  if (!v30)
  {
    v30 = [MEMORY[0x263EFF910] now];
  }
  v31 = [(HMDAudioAnalysisEventBulletin *)self initWithReason:v34 startDate:v30 endDate:v18 notificationUUID:v20 state:v33 soundIdentifier:v21 name:v19 threadIdentifier:v23 accessoryUUID:v11 title:v22];

  return v31;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin reason](self, "reason"));
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F0BA90]];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin state](self, "state"));
  [v3 setObject:v5 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinState"];

  v6 = [(HMDAudioAnalysisEventBulletin *)self accessoryUUID];
  id v7 = [v6 UUIDString];
  [v3 setObject:v7 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinAccessoryUUIDKey"];

  v8 = NSNumber;
  v9 = [(HMDAudioAnalysisEventBulletin *)self startDate];
  [v9 timeIntervalSince1970];
  id v10 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinStartDateKey"];

  v11 = NSNumber;
  v12 = [(HMDAudioAnalysisEventBulletin *)self dateOfOccurrence];
  [v12 timeIntervalSince1970];
  v13 = objc_msgSend(v11, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinDateKey"];

  v14 = [(HMDAudioAnalysisEventBulletin *)self name];
  [v3 setObject:v14 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinNameKey"];

  id v15 = [(HMDAudioAnalysisEventBulletin *)self notificationUUID];
  double v16 = [v15 UUIDString];
  [v3 setObject:v16 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinNotificationUUID"];

  double v17 = [(HMDAudioAnalysisEventBulletin *)self soundIdentifier];
  [v3 setObject:v17 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinSoundIdentifier"];

  v18 = [(HMDAudioAnalysisEventBulletin *)self title];
  [v3 setObject:v18 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinTitleKey"];

  v19 = [(HMDAudioAnalysisEventBulletin *)self threadIdentifier];
  [v3 setObject:v19 forKeyedSubscript:@"HMDAudioAnalysisEventBulletinThreadIdentifierKey"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin reason](self, "reason"));
  [v5 encodeObject:v6 forKey:*MEMORY[0x263F0BA90]];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletin state](self, "state"));
  [v5 encodeObject:v7 forKey:@"HMDAudioAnalysisEventBulletinState"];

  v8 = [(HMDAudioAnalysisEventBulletin *)self accessoryUUID];
  [v5 encodeObject:v8 forKey:@"HMDAudioAnalysisEventBulletinAccessoryUUIDKey"];

  v9 = [(HMDAudioAnalysisEventBulletin *)self dateOfOccurrence];
  [v5 encodeObject:v9 forKey:@"HMDAudioAnalysisEventBulletinDateKey"];

  id v10 = [(HMDAudioAnalysisEventBulletin *)self startDate];
  [v5 encodeObject:v10 forKey:@"HMDAudioAnalysisEventBulletinStartDateKey"];

  v11 = [(HMDAudioAnalysisEventBulletin *)self name];
  [v5 encodeObject:v11 forKey:@"HMDAudioAnalysisEventBulletinNameKey"];

  v12 = [(HMDAudioAnalysisEventBulletin *)self notificationUUID];
  [v5 encodeObject:v12 forKey:@"HMDAudioAnalysisEventBulletinNotificationUUID"];

  v13 = [(HMDAudioAnalysisEventBulletin *)self soundIdentifier];
  [v5 encodeObject:v13 forKey:@"HMDAudioAnalysisEventBulletinSoundIdentifier"];

  v14 = [(HMDAudioAnalysisEventBulletin *)self title];
  [v5 encodeObject:v14 forKey:@"HMDAudioAnalysisEventBulletinTitleKey"];

  id v15 = [(HMDAudioAnalysisEventBulletin *)self threadIdentifier];
  [v5 encodeObject:v15 forKey:@"HMDAudioAnalysisEventBulletinThreadIdentifierKey"];
}

- (id)localizedKeyForBody
{
  uint64_t v3 = [(HMDAudioAnalysisEventBulletin *)self title];
  id v4 = [(HMDAudioAnalysisEventBulletin *)self stringForAudioAnalysisReasonWithHomeName:v3];

  return v4;
}

- (void)configureAccessoryNameComposer
{
  uint64_t v3 = [(HMDAudioAnalysisEventBulletin *)self context];
  id v14 = [v3 accessory];

  id v4 = [v14 room];
  id v5 = [v4 name];

  v6 = [v14 category];
  id v7 = [v6 name];

  uint64_t v8 = [v14 configuredName];
  v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v7;
  }
  id v11 = v10;

  v12 = [[HMDAccessoryNameComposer alloc] initWithRawAccessoryName:v11 rawRoomName:v5];
  accessoryNameComposer = self->_accessoryNameComposer;
  self->_accessoryNameComposer = v12;
}

- (void)configureWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  [(HMDAudioAnalysisEventBulletin *)self configureAccessoryNameComposer];
}

- (HMDAudioAnalysisEventBulletin)initWithReason:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 notificationUUID:(id)a6 state:(unint64_t)a7 soundIdentifier:(id)a8 name:(id)a9 threadIdentifier:(id)a10 accessoryUUID:(id)a11 title:(id)a12
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v45.receiver = self;
  v45.super_class = (Class)HMDAudioAnalysisEventBulletin;
  v25 = [(HMDAudioAnalysisEventBulletin *)&v45 init];
  v26 = v25;
  if (v25)
  {
    v25->_reason = a3;
    uint64_t v27 = [v18 copy];
    dateOfOccurrence = v26->_dateOfOccurrence;
    v26->_dateOfOccurrence = (NSDate *)v27;

    uint64_t v29 = [v17 copy];
    startDate = v26->_startDate;
    v26->_startDate = (NSDate *)v29;

    uint64_t v31 = [v19 copy];
    notificationUUID = v26->_notificationUUID;
    v26->_notificationUUID = (NSUUID *)v31;

    v26->_state = a7;
    uint64_t v33 = [v20 copy];
    soundIdentifier = v26->_soundIdentifier;
    v26->_soundIdentifier = (NSString *)v33;

    uint64_t v35 = [v23 copy];
    accessoryUUID = v26->_accessoryUUID;
    v26->_accessoryUUID = (NSUUID *)v35;

    uint64_t v37 = [v24 copy];
    title = v26->_title;
    v26->_title = (NSString *)v37;

    uint64_t v39 = [v21 copy];
    name = v26->_name;
    v26->_name = (NSString *)v39;

    uint64_t v41 = [v22 copy];
    threadIdentifier = v26->_threadIdentifier;
    v26->_threadIdentifier = (NSString *)v41;
  }
  return v26;
}

- (id)stringForAudioAnalysisReasonWithHomeName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDAudioAnalysisEventBulletin *)self state];
  if (v5 != 1)
  {
    if (v5) {
      goto LABEL_9;
    }
    unint64_t v6 = [(HMDAudioAnalysisEventBulletin *)self reason];
    if (v6 == 4) {
      goto LABEL_9;
    }
    if (v6 == 1)
    {
      id v7 = [(HMDAudioAnalysisEventBulletin *)self context];
      uint64_t v8 = -[HMDAudioAnalysisEventBulletin localizedKeyForEventStartWithDropIn:homeName:](self, "localizedKeyForEventStartWithDropIn:homeName:", [v7 dropInEnabled], v4);
LABEL_8:
      v9 = (__CFString *)v8;

      goto LABEL_10;
    }
  }
  if ([(HMDAudioAnalysisEventBulletin *)self reason] == 1)
  {
    id v7 = [(HMDAudioAnalysisEventBulletin *)self context];
    uint64_t v8 = -[HMDAudioAnalysisEventBulletin localizedKeyForEventEndWithDropIn:homeName:](self, "localizedKeyForEventEndWithDropIn:homeName:", [v7 dropInEnabled], v4);
    goto LABEL_8;
  }
LABEL_9:
  v9 = &stru_26E2EB898;
LABEL_10:

  return v9;
}

- (id)localizedKeyForTitle
{
  uint64_t v3 = [(HMDAudioAnalysisEventBulletin *)self context];
  if (v3
    && (id v4 = (void *)v3,
        [(HMDAudioAnalysisEventBulletin *)self context],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 dropInEnabled],
        v5,
        v4,
        v6))
  {
    id v7 = HMDLocalizedStringForKey(@"AUDIOANALYSIS_ALARM_NOTIFICATION_TITLE");
  }
  else
  {
    id v7 = [(HMDAudioAnalysisEventBulletin *)self title];
  }
  return v7;
}

- (id)localizedKeyForEventEndWithDropIn:(BOOL)a3 homeName:(id)a4
{
  BOOL v4 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setUnitsStyle:3];
  [v7 setAllowedUnits:64];
  [v7 setFormattingContext:2];
  [v7 setMaximumUnitCount:2];
  uint64_t v8 = [(HMDAudioAnalysisEventBulletin *)self dateOfOccurrence];
  v9 = [(HMDAudioAnalysisEventBulletin *)self startDate];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  if (v11 >= 60.0 && v11 < 120.0)
  {
    v12 = @"AUDIOANALYSIS_ALARM_MORE_THAN_ONE_MINUTE_LESS_THAN_TWO_MINUTE";
LABEL_6:
    uint64_t v13 = HMDLocalizedStringForKey(v12);
    goto LABEL_8;
  }
  if (v11 < 60.0)
  {
    v12 = @"AUDIOANALYSIS_ALARM_LESS_THAN_ONE_MINUTE";
    goto LABEL_6;
  }
  uint64_t v13 = [v7 stringFromTimeInterval:v11];
LABEL_8:
  id v14 = (void *)v13;
  id v15 = [(HMDAudioAnalysisEventBulletin *)self accessoryNameComposer];
  double v16 = [v15 composedString];

  id v17 = NSString;
  if (v4)
  {
    id v18 = HMDLocalizedStringForKey(@"AUDIOANALYSIS_ALARM_END_CHECK_IN");
    id v29 = 0;
    id v19 = [v17 localizedStringWithValidatedFormat:v18, @"%@ %@ %@", &v29, v6, v14, v16 validFormatSpecifiers error];
    id v20 = v29;

    if (!v19)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = HMFGetOSLogHandle();
      id v19 = @"AUDIOANALYSIS_ALARM_END_CHECK_IN";
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v31 = v23;
        __int16 v32 = 2112;
        uint64_t v33 = @"AUDIOANALYSIS_ALARM_END_CHECK_IN";
        __int16 v34 = 2112;
        uint64_t v35 = @"%@ %@ %@";
        __int16 v36 = 2112;
        id v37 = v20;
LABEL_16:
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    id v24 = HMDLocalizedStringForKey(@"AUDIOANALYSIS_ALARM_END_NO_CHECK_IN");
    id v28 = 0;
    id v19 = [v17 localizedStringWithValidatedFormat:v24, @"%@ %@", &v28, v16, v14 validFormatSpecifiers error];
    id v20 = v28;

    if (!v19)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = HMFGetOSLogHandle();
      id v19 = @"AUDIOANALYSIS_ALARM_END_NO_CHECK_IN";
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v31 = v23;
        __int16 v32 = 2112;
        uint64_t v33 = @"AUDIOANALYSIS_ALARM_END_NO_CHECK_IN";
        __int16 v34 = 2112;
        uint64_t v35 = @"%@ %@";
        __int16 v36 = 2112;
        id v37 = v20;
        goto LABEL_16;
      }
LABEL_17:

      v25 = 0;
      goto LABEL_18;
    }
  }
  v25 = v19;
LABEL_18:
  v26 = v19;

  return v26;
}

- (id)localizedKeyForEventStartWithDropIn:(BOOL)a3 homeName:(id)a4
{
  BOOL v4 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HMDAudioAnalysisEventBulletin *)self accessoryNameComposer];
  uint64_t v8 = [v7 composedString];

  v9 = NSString;
  if (v4)
  {
    double v10 = HMDLocalizedStringForKey(@"AUDIOANALYSIS_ALARM_START_CHECK_IN");
    id v21 = 0;
    double v11 = [v9 localizedStringWithValidatedFormat:v10, @"%@ %@", &v21, v6, v8 validFormatSpecifiers error];
    id v12 = v21;

    if (!v11)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = HMFGetOSLogHandle();
      double v11 = @"AUDIOANALYSIS_ALARM_START_CHECK_IN";
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v23 = v15;
        __int16 v24 = 2112;
        v25 = @"AUDIOANALYSIS_ALARM_START_CHECK_IN";
        __int16 v26 = 2112;
        uint64_t v27 = @"%@ %@";
        __int16 v28 = 2112;
        id v29 = v12;
LABEL_9:
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    double v16 = HMDLocalizedStringForKey(@"AUDIOANALYSIS_ALARM_START_NO_CHECK_IN");
    id v20 = 0;
    double v11 = [v9 localizedStringWithValidatedFormat:v16, @"%@", &v20, v8 validFormatSpecifiers error];
    id v12 = v20;

    if (!v11)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = HMFGetOSLogHandle();
      double v11 = @"AUDIOANALYSIS_ALARM_START_NO_CHECK_IN";
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v23 = v15;
        __int16 v24 = 2112;
        v25 = @"AUDIOANALYSIS_ALARM_START_NO_CHECK_IN";
        __int16 v26 = 2112;
        uint64_t v27 = @"%@";
        __int16 v28 = 2112;
        id v29 = v12;
        goto LABEL_9;
      }
LABEL_10:

      id v17 = 0;
      goto LABEL_11;
    }
  }
  id v17 = v11;
LABEL_11:
  id v18 = v11;

  return v18;
}

- (void)setNotificationUUID:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end