@interface ATXAnchor
+ (BOOL)isActive;
+ (BOOL)shouldPredicateOnStartDate;
+ (BOOL)shouldProcessContextStoreNotification;
+ (BOOL)shouldProcessContextStoreNotificationForDict;
+ (BOOL)shouldProcessContextStoreNotificationForNumber;
+ (BOOL)supportsSecureCoding;
+ (BOOL)usesContextStoreForRealTimeNotifications;
+ (Class)anchorClassFromAnchorTypeString:(id)a3;
+ (Class)supportedDuetDataProviderClass;
+ (NSArray)duetEventsPredicates;
+ (NSString)longDescription;
+ (double)durationOfAnchorEvent:(id)a3;
+ (double)secondsOfInfluence;
+ (id)allAnchorClasses;
+ (id)anchorOccurenceDateFromDuetEvent:(id)a3;
+ (id)anchorTypeStringToClassName:(id)a3;
+ (id)anchorTypeToAnchorClassName:(int64_t)a3;
+ (id)anchorTypeToString:(int64_t)a3;
+ (id)candidateQueryStartDateFromDuetEvent:(id)a3;
+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4;
+ (id)invalidationPredicateForContextStoreRegistration;
+ (id)keyPathForContextStore;
+ (id)predicateForContextStoreRegistration;
+ (id)sampleEvent;
+ (int)pbAnchorEventTypeFromDuetEvent:(id)a3;
+ (int64_t)anchorType;
+ (int64_t)stringToAnchorType:(id)a3;
+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5;
+ (void)registerWithContextStoreForAnchorEntranceWithCallback:(id)a3 notificationId:(id)a4 registrationPersistenceContext:(id)a5;
+ (void)registerWithContextStoreForAnchorExitWithCallback:(id)a3 notificationId:(id)a4 registrationPersistenceContext:(id)a5;
+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3;
- (ATXAnchor)initWithCoder:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)anchorEventIdentifier;
- (id)anchorTypeString;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorEventIdentifier:(id)a3;
@end

@implementation ATXAnchor

+ (Class)supportedDuetDataProviderClass
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:29 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (NSArray)duetEventsPredicates
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:35 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (int64_t)anchorType
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:41 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (NSString)longDescription
{
  return (NSString *)@"No description available.";
}

+ (double)secondsOfInfluence
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:52 description:@"Should be implemented by subclasses"];

  return 0.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:58 description:@"Should be implemented by subclasses"];

  return 1;
}

- (id)anchorTypeString
{
  v2 = objc_opt_class();
  uint64_t v3 = [(id)objc_opt_class() anchorType];
  return (id)[v2 anchorTypeToString:v3];
}

+ (id)anchorOccurenceDateFromDuetEvent:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() shouldPredicateOnStartDate]) {
    [v3 startDate];
  }
  else {
  v4 = [v3 endDate];
  }

  return v4;
}

+ (id)candidateQueryStartDateFromDuetEvent:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:v3];

  return v4;
}

+ (double)durationOfAnchorEvent:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() shouldPredicateOnStartDate])
  {
    v5 = [v4 endDate];
    v6 = [v4 startDate];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    [a1 secondsOfInfluence];
    double v10 = v9;
    if (v8 >= 1.0 && v8 < v9) {
      double v10 = v8;
    }
  }
  else
  {
    [a1 secondsOfInfluence];
    double v10 = v11;
  }

  return v10;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:101 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (void)registerWithContextStoreForAnchorEntranceWithCallback:(id)a3 notificationId:(id)a4 registrationPersistenceContext:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (([(id)objc_opt_class() usesContextStoreForRealTimeNotifications] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, a1, @"ATXAnchor.m", 110, @"Anchor %@ doesn't use ContextStore but received request to register with context store.", v14 object file lineNumber description];
  }
  v15 = (void *)MEMORY[0x1E4F5B6C8];
  v16 = [(id)objc_opt_class() predicateForContextStoreRegistration];
  id v17 = [v15 localWakingRegistrationWithIdentifier:v10 contextualPredicate:v16 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v11];

  [v9 registerCallback:v17];
}

+ (void)registerWithContextStoreForAnchorExitWithCallback:(id)a3 notificationId:(id)a4 registrationPersistenceContext:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (([(id)objc_opt_class() usesContextStoreForRealTimeNotifications] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, a1, @"ATXAnchor.m", 125, @"Anchor %@ doesn't use ContextStore but received request to register with context store.", v14 object file lineNumber description];
  }
  v15 = (void *)MEMORY[0x1E4F5B6C8];
  v16 = [(id)objc_opt_class() invalidationPredicateForContextStoreRegistration];
  id v17 = [v15 localWakingRegistrationWithIdentifier:v10 contextualPredicate:v16 clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v11];

  [v9 registerCallback:v17];
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:139 description:@"Should be implemented by subclasses"];
}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:145 description:@"Should be implemented by subclasses"];
}

+ (id)keyPathForContextStore
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:151 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (id)predicateForContextStoreRegistration
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:157 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:163 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:169 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (BOOL)isActive
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:175 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (id)sampleEvent
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXAnchor.m" lineNumber:181 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (BOOL)shouldProcessContextStoreNotificationForDict
{
  v2 = [MEMORY[0x1E4F5B6A8] userContext];
  id v3 = [(id)objc_opt_class() keyPathForContextStore];
  id v4 = [v2 objectForKeyedSubscript:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)shouldProcessContextStoreNotificationForNumber
{
  v2 = [MEMORY[0x1E4F5B6A8] userContext];
  id v3 = [(id)objc_opt_class() keyPathForContextStore];
  id v4 = [v2 objectForKeyedSubscript:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  id v9 = [v7 alloc];
  id v10 = [(id)objc_opt_class() duetEventsPredicates];
  id v11 = (void *)[v9 initWithArray:v10];

  [(id)objc_opt_class() supportedDuetDataProviderClass];
  v12 = objc_opt_new();
  v13 = (void *)[v11 copy];
  v14 = [v12 fetchEventsBetweenStartDate:v6 andEndDate:v8 withPredicates:v13];

  if ([a1 shouldPredicateOnStartDate])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__ATXAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke;
    v17[3] = &unk_1E68B54C8;
    id v18 = v6;
    objc_msgSend(v14, "_pas_filteredArrayWithTest:", v17);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v14;
  }

  return v15;
}

BOOL __60__ATXAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 startDate];
  id v5 = [v2 earlierDate:v4];
  id v6 = [v3 startDate];

  return v5 != v6;
}

+ (int)pbAnchorEventTypeFromDuetEvent:(id)a3
{
  id v3 = a3;
  if ((unint64_t)([(id)objc_opt_class() anchorType] - 1) > 1
    || (unint64_t v4 = [v3 deviceType], v4 > 4))
  {
    int v5 = 0;
  }
  else
  {
    int v5 = dword_1D142BE68[v4];
  }

  return v5;
}

+ (id)anchorTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x15) {
    return @"UnknownAnchor";
  }
  else {
    return off_1E68B54E8[a3 - 1];
  }
}

+ (int64_t)stringToAnchorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BluetoothConnectedAnchor"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"BluetoothDisconnectedAnchor"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"IdleTimeBeginAnchor"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"IdleTimeEndAnchor"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"CarPlayConnectedAnchor"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"CarPlayDisconnectedAnchor"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOIEntranceAnchor"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"LOIExitAnchor"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"WorkoutStartAnchor"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"WorkoutEndAnchor"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"HeadingHomeAnchor"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"HeadingToWorkAnchor"])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"FirstCalendarEventOfDayAnchor"])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"LastCalendarEventOfDayAnchor"])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isEqualToString:@"UpcomingSemanticEventAnchor"])
  {
    int64_t v4 = 15;
  }
  else if ([v3 isEqualToString:@"WiredAudioDeviceConnectedAnchor"])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"WiredAudioDeviceDisconnectedAnchor"])
  {
    int64_t v4 = 17;
  }
  else if ([v3 isEqualToString:@"ChargerConnectedAnchor"])
  {
    int64_t v4 = 18;
  }
  else if ([v3 isEqualToString:@"MicrolocationVisitAnchor"])
  {
    int64_t v4 = 19;
  }
  else if ([v3 isEqualToString:@"UpcomingCommuteToWorkAnchor"])
  {
    int64_t v4 = 20;
  }
  else if ([v3 isEqualToString:@"UpcomingCommuteFromWorkAnchor"])
  {
    int64_t v4 = 21;
  }
  else if ([v3 isEqualToString:@"GymArrivalAnchor"])
  {
    int64_t v4 = 22;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)anchorTypeStringToClassName:(id)a3
{
  id v3 = a3;
  int64_t v4 = objc_opt_class();
  uint64_t v5 = [(id)objc_opt_class() stringToAnchorType:v3];

  return (id)[v4 anchorTypeToAnchorClassName:v5];
}

+ (Class)anchorClassFromAnchorTypeString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 anchorTypeToString:1];
  char v6 = [v4 isEqualToString:v5];

  if (v6) {
    goto LABEL_16;
  }
  id v7 = [a1 anchorTypeToString:2];
  char v8 = [v4 isEqualToString:v7];

  if (v8) {
    goto LABEL_16;
  }
  id v9 = [a1 anchorTypeToString:4];
  char v10 = [v4 isEqualToString:v9];

  if (v10) {
    goto LABEL_16;
  }
  id v11 = [a1 anchorTypeToString:5];
  char v12 = [v4 isEqualToString:v11];

  if (v12) {
    goto LABEL_16;
  }
  v13 = [a1 anchorTypeToString:6];
  char v14 = [v4 isEqualToString:v13];

  if (v14) {
    goto LABEL_16;
  }
  id v15 = [a1 anchorTypeToString:16];
  char v16 = [v4 isEqualToString:v15];

  if (v16) {
    goto LABEL_16;
  }
  id v17 = [a1 anchorTypeToString:17];
  char v18 = [v4 isEqualToString:v17];

  if (v18) {
    goto LABEL_16;
  }
  v19 = [a1 anchorTypeToString:19];
  char v20 = [v4 isEqualToString:v19];

  if (v20) {
    goto LABEL_16;
  }
  v21 = [a1 anchorTypeToString:18];
  char v22 = [v4 isEqualToString:v21];

  if (v22) {
    goto LABEL_16;
  }
  v23 = [a1 anchorTypeToString:7];
  char v24 = [v4 isEqualToString:v23];

  if (v24) {
    goto LABEL_16;
  }
  v25 = [a1 anchorTypeToString:8];
  char v26 = [v4 isEqualToString:v25];

  if (v26) {
    goto LABEL_16;
  }
  v27 = [a1 anchorTypeToString:3];
  char v28 = [v4 isEqualToString:v27];

  if (v28) {
    goto LABEL_16;
  }
  v29 = [a1 anchorTypeToString:20];
  char v30 = [v4 isEqualToString:v29];

  if (v30) {
    goto LABEL_16;
  }
  v31 = [a1 anchorTypeToString:21];
  char v32 = [v4 isEqualToString:v31];

  if ((v32 & 1) != 0
    || ([a1 anchorTypeToString:22],
        v33 = objc_claimAutoreleasedReturnValue(),
        int v34 = [v4 isEqualToString:v33],
        v33,
        v34))
  {
LABEL_16:
    v35 = objc_opt_class();
  }
  else
  {
    v35 = 0;
  }

  return (Class)v35;
}

+ (id)anchorTypeToAnchorClassName:(int64_t)a3
{
  if (unint64_t)(a3 - 1) <= 0x15 && ((0x3F80FFu >> (a3 - 1)))
  {
    char v6 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v6);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)allAnchorClasses
{
  char v20 = (void *)MEMORY[0x1D25F6CC0](a1, a2);
  id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  char v12 = objc_msgSend(v19, "initWithObjects:", v18, v17, v16, v15, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXAnchor *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(id)objc_opt_class() anchorType];
      uint64_t v7 = objc_opt_class();

      BOOL v8 = v6 == [v7 anchorType];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(ATXAnchor *)self anchorEventIdentifier];
  [v4 setAnchorEventIdentifier:v5];

  return v4;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    uint64_t v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXAnchor *)self anchorEventIdentifier];
  [v4 encodeObject:v5 forKey:@"codingKeyForAnchorEventId"];
}

- (ATXAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForAnchorEventId"];
  BOOL v6 = [(ATXAnchor *)self checkAndReportDecodingFailureIfNeededForid:v5 key:@"codingKeyForAnchorEventId" coder:v4 errorDomain:@"com.apple.proactive.ATXAnchor" errorCode:-1];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ATXAnchor;
    BOOL v8 = [(ATXAnchor *)&v11 init];
    uint64_t v9 = v8;
    if (v8) {
      [(ATXAnchor *)v8 setAnchorEventIdentifier:v5];
    }
    self = v9;
    uint64_t v7 = self;
  }

  return v7;
}

- (NSString)anchorEventIdentifier
{
  return self->_anchorEventIdentifier;
}

- (void)setAnchorEventIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end