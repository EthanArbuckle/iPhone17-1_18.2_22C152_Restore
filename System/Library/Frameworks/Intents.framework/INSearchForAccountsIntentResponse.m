@interface INSearchForAccountsIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSearchForAccountsIntentResponse)initWithBackingStore:(id)a3;
- (INSearchForAccountsIntentResponse)initWithCode:(INSearchForAccountsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSearchForAccountsIntentResponse)initWithCoder:(id)a3;
- (INSearchForAccountsIntentResponseCode)code;
- (NSArray)accounts;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setAccounts:(NSArray *)accounts;
@end

@implementation INSearchForAccountsIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INSearchForAccountsIntentResponseCode v3 = [(INSearchForAccountsIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INSearchForAccountsIntentResponseCodeFailureNotEligible)
  {
    v5 = off_1E551D8A0[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"accounts";
  v11[0] = v5;
  v6 = [(INSearchForAccountsIntentResponse *)self accounts];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 0xA) {

  }
  return v8;
}

- (void)setAccounts:(NSArray *)accounts
{
  unint64_t v4 = accounts;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToFinancialAccountValues(v4);

  [v5 setAccounts:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSArray)accounts
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INSearchForAccountsIntentResponseCode v3 = [v2 accounts];
  unint64_t v4 = INIntentSlotValueTransformFromFinancialAccountValues(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeFailureCredentialsUnverified"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeFailureAccountNotFound"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired"])int64_t v5 = 8;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSearchForAccountsIntentResponseCodeFailureNotEligible"];

  if (v6) {
    return 9;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSearchForAccountsIntentResponseCode v2 = [(INSearchForAccountsIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 8) {
    return 0;
  }
  else {
    return qword_18CFC5578[v2 - 1];
  }
}

- (INSearchForAccountsIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForAccountsIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForAccountsIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSearchForAccountsIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForAccountsIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSearchForAccountsIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForAccountsIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSearchForAccountsIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSearchForAccountsIntentResponse)initWithCode:(INSearchForAccountsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INSearchForAccountsIntentResponseCodeFailureNotEligible) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E551D8A0[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchForAccountsIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSearchForAccountsIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSearchForAccountsIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSearchForAccountsIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) < 4) {
    return a3 - 5;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return 3;
  }
  else {
    return dword_18CFC5550[a3 - 1];
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
      uint64_t v6 = (a4 - 1);
      int64_t v7 = 4;
      if (a5) {
        int64_t v7 = 5;
      }
      if (v6 >= 4) {
        int64_t result = v7;
      }
      else {
        int64_t result = v6 + 6;
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