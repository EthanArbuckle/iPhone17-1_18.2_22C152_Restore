@interface INCreateEventIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INCalendarEvent)createdEvent;
- (INCreateEventIntentResponse)init;
- (INCreateEventIntentResponse)initWithBackingStore:(id)a3;
- (INCreateEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INCreateEventIntentResponse)initWithCoder:(id)a3;
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
- (void)setCreatedEvent:(id)a3;
@end

@implementation INCreateEventIntentResponse

- (id)_dictionaryRepresentation
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"code";
  unint64_t v3 = [(INCreateEventIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 5)
  {
    v5 = off_1E5518580[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v5;
  v15[1] = @"createdEvent";
  v6 = [(INCreateEventIntentResponse *)self createdEvent];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v7;
  v15[2] = @"conflictingEventIdentifiers";
  v8 = [(INCreateEventIntentResponse *)self conflictingEventIdentifiers];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v9;
  v15[3] = @"confirmationReason";
  int64_t v10 = [(INCreateEventIntentResponse *)self confirmationReason];
  if ((unint64_t)(v10 - 1) > 2) {
    v11 = @"unknown";
  }
  else {
    v11 = *(&off_1E551B8F8 + v10 - 1);
  }
  v12 = v11;
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  if (!v8) {
  if (!v6)
  }

  if (v4 >= 6) {

  }
  return v13;
}

- (void)setConfirmationReason:(int64_t)a3
{
  unint64_t v4 = a3 - 1;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = v5;
  if (v4 > 2) {
    [v5 setHasConfirmationReason:0];
  }
  else {
    objc_msgSend(v5, "setConfirmationReason:");
  }

  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setConflictingEventIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
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

- (void)setCreatedEvent:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v6 = INIntentSlotValueTransformToCalendarEvent(v4);

  [v5 setCreatedEvent:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (int64_t)confirmationReason
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasConfirmationReason];
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v6 = [v5 confirmationReason] - 1;
  if (v6 <= 2) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
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

- (INCalendarEvent)createdEvent
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 createdEvent];
  int v4 = INIntentSlotValueTransformFromCalendarEvent(v3);

  return (INCalendarEvent *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INCreateEventIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INCreateEventIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INCreateEventIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INCreateEventIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INCreateEventIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INCreateEventIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INCreateEventIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INCreateEventIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INCreateEventIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INCreateEventIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INCreateEventIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INCreateEventIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INCreateEventIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INCreateEventIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INCreateEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 5) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = off_1E5518580[a3];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INCreateEventIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INCreateEventIntentResponse;
  uint64_t v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INCreateEventIntentResponse)init
{
  return [(INCreateEventIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 3;
  }
  else {
    return dword_18CFC59FC[a3 - 1];
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
      if (a5) {
        int64_t result = 5;
      }
      else {
        int64_t result = 4;
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