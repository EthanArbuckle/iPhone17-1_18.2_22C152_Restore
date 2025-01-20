@interface INSendPaymentIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INPaymentRecord)paymentRecord;
- (INSendPaymentIntentResponse)initWithBackingStore:(id)a3;
- (INSendPaymentIntentResponse)initWithCode:(INSendPaymentIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSendPaymentIntentResponse)initWithCoder:(id)a3;
- (INSendPaymentIntentResponseCode)code;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentRecord:(INPaymentRecord *)paymentRecord;
@end

@implementation INSendPaymentIntentResponse

- (id)_dictionaryRepresentation
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"code";
  INSendPaymentIntentResponseCode v3 = [(INSendPaymentIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 < (INSendPaymentIntentResponseCodeFailureNotEligible|INSendPaymentIntentResponseCodeInProgress))
  {
    v5 = off_1E551B9E0[v3];
    v6 = v5;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    v6 = 0;
  }
  v11[1] = @"paymentRecord";
  v12[0] = v5;
  v7 = [(INSendPaymentIntentResponse *)self paymentRecord];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (!v7) {

  }
  if (v4 >= 0xE) {

  }
  return v9;
}

- (void)setPaymentRecord:(INPaymentRecord *)paymentRecord
{
  unint64_t v4 = paymentRecord;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToPaymentRecord(v4);

  [v5 setPaymentRecord:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (INPaymentRecord)paymentRecord
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INSendPaymentIntentResponseCode v3 = [v2 paymentRecord];
  unint64_t v4 = INIntentSlotValueTransformFromPaymentRecord(v3);

  return (INPaymentRecord *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSendPaymentIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSendPaymentIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailureCredentialsUnverified"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailurePaymentsAmountBelowMinimum"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailurePaymentsAmountAboveMaximum"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailurePaymentsCurrencyUnsupported"])uint64_t v4 = 9; {
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailureInsufficientFunds"])uint64_t v4 = 10;
  }
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailureNoBankAccount"]) {
    uint64_t v4 = 11;
  }
  if ([v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailureNotEligible"]) {
    int64_t v5 = 12;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSendPaymentIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired"];

  if (v6) {
    return 13;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSendPaymentIntentResponseCode v2 = [(INSendPaymentIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 0xC) {
    return 0;
  }
  else {
    return qword_18CFC5A70[v2 - 1];
  }
}

- (INSendPaymentIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendPaymentIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSendPaymentIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSendPaymentIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSendPaymentIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSendPaymentIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendPaymentIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSendPaymentIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSendPaymentIntentResponse)initWithCode:(INSendPaymentIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)code > INSendPaymentIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired) {
      v9 = 0;
    }
    else {
      v9 = off_1E551B9E0[code];
    }
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INSendPaymentIntentResponse initWithCode:userActivity:]";
    __int16 v16 = 2048;
    INSendPaymentIntentResponseCode v17 = code;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)INSendPaymentIntentResponse;
  v11 = [(INIntentResponse *)&v13 _initWithCode:code userActivity:v6];

  return v11;
}

- (id)init
{
  return [(INSendPaymentIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) < 8) {
    return a3 - 5;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC) {
    return 3;
  }
  else {
    return dword_18CFC5A38[a3 - 1];
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
      if (v6 >= 8) {
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