@interface INEditMessageIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INEditMessageIntentResponse)initWithBackingStore:(id)a3;
- (INEditMessageIntentResponse)initWithCode:(INEditMessageIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INEditMessageIntentResponse)initWithCoder:(id)a3;
- (INEditMessageIntentResponseCode)code;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INEditMessageIntentResponse

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"code";
  v2 = INEditMessageIntentResponseCodeGetName([(INEditMessageIntentResponse *)self code]);
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

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INEditMessageIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INEditMessageIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureMessageNotFound"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailurePastEditTimeLimit"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureMessageTypeUnsupported"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureUnsupportedOnService"])uint64_t v4 = 9; {
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureMessageServiceNotAvailable"])uint64_t v4 = 10;
  }
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureNotAMemberOfConversation"])uint64_t v4 = 1000; {
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureScreenTimeRestrictionEnabled"])uint64_t v4 = 1001;
  }
  if ([v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureDownTimeRestrictionEnabled"])int64_t v5 = 1002; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INEditMessageIntentResponseCodeFailureRequiringInAppAuthentication"];

  if (v6) {
    return 11;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INEditMessageIntentResponseCode v2 = [(INEditMessageIntentResponse *)self code];
  if (v2 > 999)
  {
    int64_t v4 = 5;
    uint64_t v5 = 5;
    if (v2 != 1002) {
      uint64_t v5 = 0;
    }
    if (v2 != 1001) {
      int64_t v4 = v5;
    }
    if (v2 == 1000) {
      return 5;
    }
    else {
      return v4;
    }
  }
  else
  {
    switch(v2)
    {
      case INEditMessageIntentResponseCodeReady:
        int64_t result = 1;
        break;
      case INEditMessageIntentResponseCodeInProgress:
        int64_t result = 3;
        break;
      case INEditMessageIntentResponseCodeSuccess:
        int64_t result = 4;
        break;
      case INEditMessageIntentResponseCodeFailure:
      case INEditMessageIntentResponseCodeFailureMessageNotFound:
      case INEditMessageIntentResponseCodeFailurePastEditTimeLimit:
      case INEditMessageIntentResponseCodeFailureMessageTypeUnsupported:
      case INEditMessageIntentResponseCodeFailureUnsupportedOnService:
      case INEditMessageIntentResponseCodeFailureMessageServiceNotAvailable:
      case INEditMessageIntentResponseCodeFailureRequiringInAppAuthentication:
        int64_t result = 5;
        break;
      case INEditMessageIntentResponseCodeFailureRequiringAppLaunch:
        int64_t result = 6;
        break;
      default:
        int64_t result = 0;
        break;
    }
  }
  return result;
}

- (INEditMessageIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INEditMessageIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INEditMessageIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INEditMessageIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INEditMessageIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INEditMessageIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INEditMessageIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INEditMessageIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INEditMessageIntentResponse)initWithCode:(INEditMessageIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = INEditMessageIntentResponseCodeGetName(code);
    *(_DWORD *)buf = 136315906;
    v14 = "-[INEditMessageIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INEditMessageIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INEditMessageIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INEditMessageIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  int result = 0x7FFFFFFF;
  if (a3 > 999)
  {
    if (a3 == 1002) {
      int v4 = 8;
    }
    else {
      int v4 = 0x7FFFFFFF;
    }
    if (a3 == 1001) {
      int v5 = 7;
    }
    else {
      int v5 = v4;
    }
    if (a3 == 1000) {
      return 6;
    }
    else {
      return v5;
    }
  }
  else
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
        int result = 9;
        break;
      default:
        return result;
    }
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
      int result = 2;
      break;
    case 3:
      int result = 0;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      goto LABEL_4;
    default:
      if ((unint64_t)(a3 - 1000) >= 3) {
        int result = 3;
      }
      else {
LABEL_4:
      }
        int result = 1;
      break;
  }
  return result;
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
      if ((a4 - 1) >= 9)
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
        int64_t result = qword_18CFC5B08[a4 - 1];
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