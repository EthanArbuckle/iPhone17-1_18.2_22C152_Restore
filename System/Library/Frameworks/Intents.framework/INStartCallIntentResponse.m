@interface INStartCallIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INConnectedCall)startedCall;
- (INStartCallIntentResponse)initWithBackingStore:(id)a3;
- (INStartCallIntentResponse)initWithCode:(INStartCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INStartCallIntentResponse)initWithCoder:(id)a3;
- (INStartCallIntentResponseCode)code;
- (NSArray)restrictedContacts;
- (NSNumber)shouldDoEmergencyCountdown;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)confirmationReason;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmationReason:(int64_t)a3;
- (void)setRestrictedContacts:(id)a3;
- (void)setShouldDoEmergencyCountdown:(id)a3;
- (void)setStartedCall:(id)a3;
@end

@implementation INStartCallIntentResponse

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"code";
  v2 = INStartCallIntentResponseCodeGetName([(INStartCallIntentResponse *)self code]);
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (void)setRestrictedContacts:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToContactValues(v4);

  [v5 setRestrictedContacts:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setStartedCall:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToConnectedCall(v4);

  [v5 setStartedCall:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setConfirmationReason:(int64_t)a3
{
  if (a3 > 2)
  {
    if (a3 == 3)
    {
      uint64_t v4 = 3;
      goto LABEL_11;
    }
    if (a3 == 1000)
    {
      uint64_t v4 = 4;
      goto LABEL_11;
    }
LABEL_8:
    v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    [v5 setHasConfirmationReason:0];
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 1;
    goto LABEL_11;
  }
  if (a3 != 2) {
    goto LABEL_8;
  }
  uint64_t v4 = 2;
LABEL_11:
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setConfirmationReason:v4];
LABEL_12:

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setShouldDoEmergencyCountdown:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setShouldDoEmergencyCountdown:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasShouldDoEmergencyCountdown:0];
  }

  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (NSArray)restrictedContacts
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v3 = [v2 restrictedContacts];
  uint64_t v4 = INIntentSlotValueTransformFromContactValues(v3);

  return (NSArray *)v4;
}

- (INConnectedCall)startedCall
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v3 = [v2 startedCall];
  uint64_t v4 = INIntentSlotValueTransformFromConnectedCall(v3);

  return (INConnectedCall *)v4;
}

- (int64_t)confirmationReason
{
  v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasConfirmationReason];
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 confirmationReason];
  if (v4 && (v6 - 1) <= 3) {
    int64_t v7 = qword_18CFC5298[v6 - 1];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSNumber)shouldDoEmergencyCountdown
{
  v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasShouldDoEmergencyCountdown])
  {
    int v4 = NSNumber;
    v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "shouldDoEmergencyCountdown"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INStartCallIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INStartCallIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeUserConfirmationRequired"])uint64_t v4 = 3; {
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailure"])
  }
    uint64_t v4 = 4;
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureCallingServiceNotAvailable"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureContactNotSupportedByApp"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureAirplaneModeEnabled"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureUnableToHandOff"]) {
    uint64_t v4 = 9;
  }
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureAppConfigurationRequired"])uint64_t v4 = 10; {
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureCallInProgress"])
  }
    uint64_t v4 = 11;
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureCallRinging"]) {
    uint64_t v4 = 12;
  }
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureScreenTimeRestrictionEnabled"])uint64_t v4 = 1000; {
  if ([v3 isEqualToString:@"INStartCallIntentResponseCodeFailureDownTimeRestrictionEnabled"])int64_t v5 = 1001;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INStartCallIntentResponseCodeFailureRequiringInAppAuthentication"];

  if (v6) {
    return 13;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t result = [(INStartCallIntentResponse *)self code];
  switch(result)
  {
    case 1:
    case 2:
      return result;
    case 3:
      int64_t result = 8;
      break;
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      int64_t result = 5;
      break;
    case 5:
      int64_t result = 6;
      break;
    default:
      int64_t v3 = 5;
      if (result != 1001) {
        int64_t v3 = 0;
      }
      if (result == 1000) {
        int64_t result = 5;
      }
      else {
        int64_t result = v3;
      }
      break;
  }
  return result;
}

- (INStartCallIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INStartCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INStartCallIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INStartCallIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INStartCallIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INStartCallIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INStartCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INStartCallIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INStartCallIntentResponse)initWithCode:(INStartCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  int64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    v9 = INStartCallIntentResponseCodeGetName(code);
    *(_DWORD *)buf = 136315906;
    v14 = "-[INStartCallIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INStartCallIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INStartCallIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INStartCallIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  switch(a3)
  {
    case 6:
      int result = 1;
      break;
    case 7:
      int result = 2;
      break;
    case 8:
      int result = 3;
      break;
    case 9:
      int result = 4;
      break;
    case 10:
      int result = 5;
      break;
    case 11:
      int result = 6;
      break;
    case 12:
      int result = 7;
      break;
    case 13:
      int result = 10;
      break;
    default:
      if (a3 == 1001) {
        int v4 = 9;
      }
      else {
        int v4 = 0x7FFFFFFF;
      }
      if (a3 == 1000) {
        int result = 8;
      }
      else {
        int result = v4;
      }
      break;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int result = 5;
      break;
    case 2:
      int result = 4;
      break;
    case 3:
      int result = 7;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      goto LABEL_2;
    default:
      if ((unint64_t)(a3 - 1000) < 2) {
LABEL_2:
      }
        int result = 1;
      else {
        int result = 3;
      }
      break;
  }
  return result;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 1:
      if ((a4 - 1) >= 0xA)
      {
        if (a5) {
          int64_t result = 5;
        }
        else {
          int64_t result = 4;
        }
      }
      else
      {
        int64_t result = qword_18CFC5158[a4 - 1];
      }
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    case 7:
      int64_t result = 3;
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