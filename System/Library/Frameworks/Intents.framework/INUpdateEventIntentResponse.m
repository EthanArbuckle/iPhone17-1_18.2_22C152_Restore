@interface INUpdateEventIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INCalendarEvent)updatedEvent;
- (INUpdateEventIntentResponse)init;
- (INUpdateEventIntentResponse)initWithBackingStore:(id)a3;
- (INUpdateEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INUpdateEventIntentResponse)initWithCoder:(id)a3;
- (NSArray)conflictingEventIdentifiers;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (int64_t)confirmationReason;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmationReason:(int64_t)a3;
- (void)setConflictingEventIdentifiers:(id)a3;
- (void)setUpdatedEvent:(id)a3;
@end

@implementation INUpdateEventIntentResponse

- (id)_dictionaryRepresentation
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"code";
  unint64_t v3 = [(INUpdateEventIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 7)
  {
    v5 = off_1E551A3E0[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v5;
  v15[1] = @"updatedEvent";
  v6 = [(INUpdateEventIntentResponse *)self updatedEvent];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v7;
  v15[2] = @"conflictingEventIdentifiers";
  v8 = [(INUpdateEventIntentResponse *)self conflictingEventIdentifiers];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v9;
  v15[3] = @"confirmationReason";
  int64_t v10 = [(INUpdateEventIntentResponse *)self confirmationReason];
  v11 = @"unknown";
  if (v10 == 2) {
    v11 = @"updateAllRecurrences";
  }
  if (v10 == 1) {
    v11 = @"scheduleConflict";
  }
  v12 = v11;
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  if (!v8) {
  if (!v6)
  }

  if (v4 >= 8) {

  }
  return v13;
}

- (void)setConfirmationReason:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = v6;
  if (v5 == 0x7FFFFFFF) {
    [v6 setHasConfirmationReason:0];
  }
  else {
    [v6 setConfirmationReason:v5];
  }

  id v9 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v8 = [v9 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v8];
}

- (void)setConflictingEventIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 clearConflictingEventIdentifiers];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        v12 = [(INIntentResponse *)self _responseMessagePBRepresentation];
        [v12 addConflictingEventIdentifiers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v14 = [v13 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v14];
}

- (void)setUpdatedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v6 = INIntentSlotValueTransformToCalendarEvent(v4);

  [v5 setUpdatedEvent:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (int64_t)confirmationReason
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasConfirmationReason];
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 confirmationReason];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (NSArray)conflictingEventIdentifiers
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 conflictingEventIdentifiers];

  if (v3) {
    int v4 = (void *)[v3 copy];
  }
  else {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (INCalendarEvent)updatedEvent
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 updatedEvent];
  int v4 = INIntentSlotValueTransformFromCalendarEvent(v3);

  return (INCalendarEvent *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INUpdateEventIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INUpdateEventIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INUpdateEventIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INUpdateEventIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INUpdateEventIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INUpdateEventIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INUpdateEventIntentResponseCodeFailureParticipantNotRemovable"])int64_t v5 = 6;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INUpdateEventIntentResponseCodeFailureParticipantAlreadyAdded"];

  if (v6) {
    return 7;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INUpdateEventIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return qword_18CFC55E0[v2 - 1];
  }
}

- (INUpdateEventIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INUpdateEventIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INUpdateEventIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INUpdateEventIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INUpdateEventIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INUpdateEventIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INUpdateEventIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INUpdateEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 7) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = off_1E551A3E0[a3];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INUpdateEventIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    long long v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    uint64_t v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INUpdateEventIntentResponse;
  uint64_t v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INUpdateEventIntentResponse)init
{
  return [(INUpdateEventIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 7) {
    int v3 = 2;
  }
  else {
    int v3 = 0x7FFFFFFF;
  }
  if (a3 == 6) {
    return 1;
  }
  else {
    return v3;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 3;
  }
  else {
    return dword_18CFC55C0[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 3;
      break;
    case 1:
      int64_t v6 = 4;
      if (a5) {
        int64_t v6 = 5;
      }
      if (a4 == 2) {
        int64_t v6 = 7;
      }
      if (a4 == 1) {
        int64_t result = 6;
      }
      else {
        int64_t result = v6;
      }
      break;
    case 2:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end