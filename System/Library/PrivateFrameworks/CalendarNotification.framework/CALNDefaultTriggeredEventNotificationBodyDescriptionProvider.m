@interface CALNDefaultTriggeredEventNotificationBodyDescriptionProvider
- (CALNDefaultTriggeredEventNotificationBodyDescriptionProvider)initWithTravelAdvisoryDescriptionGenerator:(id)a3 dateProvider:(id)a4;
- (CALNTravelAdvisoryDescriptionGenerator)travelAdvisoryDescriptionGenerator;
- (CalDateProvider)dateProvider;
- (id)_bodyWithTravelAdvisoryForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4;
- (id)_bodyWithoutTravelAdvisoryForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4;
- (id)_ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:(unint64_t)a3;
- (id)bodyForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 bodyContainsTravelAdvice:(BOOL *)a5;
@end

@implementation CALNDefaultTriggeredEventNotificationBodyDescriptionProvider

- (CALNDefaultTriggeredEventNotificationBodyDescriptionProvider)initWithTravelAdvisoryDescriptionGenerator:(id)a3 dateProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNDefaultTriggeredEventNotificationBodyDescriptionProvider;
  v9 = [(CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_travelAdvisoryDescriptionGenerator, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
  }

  return v10;
}

- (id)bodyForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 bodyContainsTravelAdvice:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 hypothesis];

  if (v10
    && ([(CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *)self _bodyWithTravelAdvisoryForSourceClientIdentifier:v8 sourceNotificationInfo:v9], (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v12 = v11;
    if (a5) {
      *a5 = 1;
    }
    v13 = v12;
  }
  else
  {
    v13 = [(CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *)self _bodyWithoutTravelAdvisoryForSourceClientIdentifier:v8 sourceNotificationInfo:v9];
    id v12 = 0;
  }

  return v13;
}

- (id)_bodyWithTravelAdvisoryForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 hypothesis];
  uint64_t v9 = [v7 travelAdvisoryTimelinessPeriod];
  if (!v8)
  {
    v17 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _bodyWithTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:]((uint64_t)v6, v17);
    }
    goto LABEL_12;
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    v17 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _bodyWithTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:]((uint64_t)v6, v17);
    }
    goto LABEL_12;
  }
  if (([MEMORY[0x263F30530] shouldIncludeTravelAdvisoryDescription:v8] & 1) == 0)
  {
    v17 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, "Cannot create route hypothesis body for notification because it was determined that it should not be included. source client identifier = %{public}@, Notification info: %@.", buf, 0x16u);
    }
LABEL_12:

    v16 = 0;
    goto LABEL_13;
  }
  v11 = [v7 location];
  id v12 = [(CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *)self _ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:v10];
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 unsignedIntegerValue];
    v15 = [(CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *)self travelAdvisoryDescriptionGenerator];
    v16 = [v15 travelAdvisoryDescriptionOfType:v14 hypothesis:v8 location:v11];
  }
  else
  {
    v16 = 0;
  }
  if ([v7 hasSuggestedLocation] && objc_msgSend(v16, "length"))
  {
    v19 = +[CALNBundle bundle];
    v20 = [v19 localizedStringForKey:@"Suggested Location: %@" value:&stru_26D3B3198 table:0];
    uint64_t v21 = objc_msgSend(NSString, "localizedStringWithFormat:", v20, v16);

    v16 = (void *)v21;
  }

LABEL_13:
  return v16;
}

- (id)_bodyWithoutTravelAdvisoryForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4
{
  id v5 = a4;
  id v6 = [v5 startDate];
  uint64_t v7 = [v5 isAllDay];
  id v8 = [(CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *)self dateProvider];
  uint64_t v9 = +[CALNDateStringUtils dateTimeStringForEventDate:v6 alwaysIncludeDate:1 allDayEvent:v7 dateProvider:v8];

  uint64_t v10 = (void *)MEMORY[0x263F304E8];
  v11 = [v5 location];
  id v12 = [v5 locationWithoutPrediction];
  v13 = [v5 preferredLocation];
  uint64_t v14 = [v5 conferenceURL];
  uint64_t v15 = [v5 conferenceURLIsBroadcast];

  v16 = [v10 locationStringForLocation:v11 locationWithoutPrediction:v12 preferredLocation:v13 conferenceURL:v14 conferenceURLIsBroadcast:v15 options:32];
  v17 = [v16 string];

  id v18 = v9;
  v19 = v18;
  if ([v17 length])
  {
    v19 = [NSString stringWithFormat:@"%@\n%@", v18, v17];
  }
  return v19;
}

- (id)_ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v3 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:](v3);
      }

      id result = 0;
      break;
    case 1uLL:
      id result = &unk_26D3C5EF8;
      break;
    case 2uLL:
      id result = &unk_26D3C5F10;
      break;
    case 3uLL:
      id result = &unk_26D3C5F28;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (CALNTravelAdvisoryDescriptionGenerator)travelAdvisoryDescriptionGenerator
{
  return self->_travelAdvisoryDescriptionGenerator;
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_travelAdvisoryDescriptionGenerator, 0);
}

- (void)_bodyWithTravelAdvisoryForSourceClientIdentifier:(uint64_t)a1 sourceNotificationInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Cannot create route hypothesis body for notification without a hypothesis. source client identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_bodyWithTravelAdvisoryForSourceClientIdentifier:(uint64_t)a1 sourceNotificationInfo:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Cannot create body with travel advisory for notification without travel advisory timeliness status. source client identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Could not convert travel advisory timeliness period none to a ttl description type number", v1, 2u);
}

@end