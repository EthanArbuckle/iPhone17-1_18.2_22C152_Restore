@interface INRequestPaymentIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INPaymentRecord)paymentRecord;
- (INRequestPaymentIntentResponse)initWithBackingStore:(id)a3;
- (INRequestPaymentIntentResponse)initWithCode:(INRequestPaymentIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INRequestPaymentIntentResponse)initWithCoder:(id)a3;
- (INRequestPaymentIntentResponseCode)code;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentRecord:(INPaymentRecord *)paymentRecord;
@end

@implementation INRequestPaymentIntentResponse

- (id)_dictionaryRepresentation
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"code";
  INRequestPaymentIntentResponseCode v3 = [(INRequestPaymentIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 < (INRequestPaymentIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired|INRequestPaymentIntentResponseCodeReady))
  {
    v5 = off_1E551BCC8[v3];
    v6 = v5;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    v6 = 0;
  }
  v11[1] = @"paymentRecord";
  v12[0] = v5;
  v7 = [(INRequestPaymentIntentResponse *)self paymentRecord];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (!v7) {

  }
  if (v4 >= 0xD) {

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
  INRequestPaymentIntentResponseCode v3 = [v2 paymentRecord];
  unint64_t v4 = INIntentSlotValueTransformFromPaymentRecord(v3);

  return (INPaymentRecord *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INRequestPaymentIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INRequestPaymentIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailureCredentialsUnverified"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailurePaymentsAmountBelowMinimum"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailurePaymentsAmountAboveMaximum"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailurePaymentsCurrencyUnsupported"])uint64_t v4 = 9; {
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailureNoBankAccount"])uint64_t v4 = 10;
  }
  if ([v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailureNotEligible"]) {
    int64_t v5 = 11;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INRequestPaymentIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired"];

  if (v6) {
    return 12;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INRequestPaymentIntentResponseCode v2 = [(INRequestPaymentIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 0xB) {
    return 0;
  }
  else {
    return qword_18CFC5770[v2 - 1];
  }
}

- (INRequestPaymentIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INRequestPaymentIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INRequestPaymentIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INRequestPaymentIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INRequestPaymentIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INRequestPaymentIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INRequestPaymentIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INRequestPaymentIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INRequestPaymentIntentResponse)initWithCode:(INRequestPaymentIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)code > INRequestPaymentIntentResponseCodeFailureTermsAndConditionsAcceptanceRequired) {
      v9 = 0;
    }
    else {
      v9 = off_1E551BCC8[code];
    }
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INRequestPaymentIntentResponse initWithCode:userActivity:]";
    __int16 v16 = 2048;
    INRequestPaymentIntentResponseCode v17 = code;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)INRequestPaymentIntentResponse;
  v11 = [(INIntentResponse *)&v13 _initWithCode:code userActivity:v6];

  return v11;
}

- (id)init
{
  return [(INRequestPaymentIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) > 6) {
    return 0x7FFFFFFF;
  }
  else {
    return dword_18CFC4C18[a3 - 6];
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB) {
    return 3;
  }
  else {
    return dword_18CFC5740[a3 - 1];
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
      unsigned int v6 = a4 - 1;
      if (a4 - 1) < 8 && ((0xBFu >> v6))
      {
        int64_t result = qword_18CFC4BD8[v6];
      }
      else if (a5)
      {
        int64_t result = 5;
      }
      else
      {
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