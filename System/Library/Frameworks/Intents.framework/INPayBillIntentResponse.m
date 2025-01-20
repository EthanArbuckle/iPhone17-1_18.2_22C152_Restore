@interface INPayBillIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INBillDetails)billDetails;
- (INDateComponentsRange)transactionScheduledDate;
- (INPayBillIntentResponse)initWithBackingStore:(id)a3;
- (INPayBillIntentResponse)initWithCode:(INPayBillIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INPayBillIntentResponse)initWithCoder:(id)a3;
- (INPayBillIntentResponseCode)code;
- (INPaymentAccount)fromAccount;
- (INPaymentAmount)transactionAmount;
- (NSString)transactionNote;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setBillDetails:(INBillDetails *)billDetails;
- (void)setFromAccount:(INPaymentAccount *)fromAccount;
- (void)setTransactionAmount:(INPaymentAmount *)transactionAmount;
- (void)setTransactionNote:(NSString *)transactionNote;
- (void)setTransactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate;
@end

@implementation INPayBillIntentResponse

- (id)_dictionaryRepresentation
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v20[0] = @"code";
  INPayBillIntentResponseCode v3 = [(INPayBillIntentResponse *)self code];
  unint64_t v19 = v3;
  if ((unint64_t)v3 <= INPayBillIntentResponseCodeFailureInsufficientFunds)
  {
    v4 = off_1E5519628[v3];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = v4;
  v21[0] = v4;
  v20[1] = @"fromAccount";
  uint64_t v5 = [(INPayBillIntentResponse *)self fromAccount];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[1] = v5;
  v20[2] = @"billDetails";
  v7 = [(INPayBillIntentResponse *)self billDetails];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[2] = v8;
  v20[3] = @"transactionAmount";
  v9 = [(INPayBillIntentResponse *)self transactionAmount];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[3] = v10;
  v20[4] = @"transactionScheduledDate";
  v11 = [(INPayBillIntentResponse *)self transactionScheduledDate];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v12;
  v20[5] = @"transactionNote";
  v13 = [(INPayBillIntentResponse *)self transactionNote];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[5] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  if (!v13) {

  }
  if (!v11) {
  if (!v9)
  }

  if (!v7) {
  if (!v6)
  }

  if (v19 >= 8) {

  }
  return v15;
}

- (void)setTransactionNote:(NSString *)transactionNote
{
  v4 = transactionNote;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToString(v4);

  [v5 setTransactionNote:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setTransactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate
{
  v4 = transactionScheduledDate;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v5 setTransactionScheduledDate:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setTransactionAmount:(INPaymentAmount *)transactionAmount
{
  v4 = transactionAmount;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToPaymentAmountValue(v4);

  [v5 setTransactionAmount:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setBillDetails:(INBillDetails *)billDetails
{
  v4 = billDetails;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToBillDetailsValue(v4);

  [v5 setBillDetails:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setFromAccount:(INPaymentAccount *)fromAccount
{
  v4 = fromAccount;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToFinancialAccountValue(v4);

  [v5 setFromAccount:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSString)transactionNote
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INPayBillIntentResponseCode v3 = [v2 transactionNote];
  v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (INDateComponentsRange)transactionScheduledDate
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INPayBillIntentResponseCode v3 = [v2 transactionScheduledDate];
  v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (INPaymentAmount)transactionAmount
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INPayBillIntentResponseCode v3 = [v2 transactionAmount];
  v4 = INIntentSlotValueTransformFromPaymentAmountValue(v3);

  return (INPaymentAmount *)v4;
}

- (INBillDetails)billDetails
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INPayBillIntentResponseCode v3 = [v2 billDetails];
  v4 = INIntentSlotValueTransformFromBillDetailsValue(v3);

  return (INBillDetails *)v4;
}

- (INPaymentAccount)fromAccount
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INPayBillIntentResponseCode v3 = [v2 fromAccount];
  v4 = INIntentSlotValueTransformFromFinancialAccountValue(v3);

  return (INPaymentAccount *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INPayBillIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INPayBillIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INPayBillIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INPayBillIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INPayBillIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INPayBillIntentResponseCodeFailureRequiringAppLaunch"]) {
    uint64_t v4 = 5;
  }
  if ([v3 isEqualToString:@"INPayBillIntentResponseCodeFailureCredentialsUnverified"])int64_t v5 = 6; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INPayBillIntentResponseCodeFailureInsufficientFunds"];

  if (v6) {
    return 7;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INPayBillIntentResponseCode v2 = [(INPayBillIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return qword_18CFC55E0[v2 - 1];
  }
}

- (INPayBillIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INPayBillIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INPayBillIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INPayBillIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INPayBillIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INPayBillIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INPayBillIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INPayBillIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INPayBillIntentResponse)initWithCode:(INPayBillIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INPayBillIntentResponseCodeFailureInsufficientFunds) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E5519628[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INPayBillIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INPayBillIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INPayBillIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INPayBillIntentResponse *)self initWithCode:0 userActivity:0];
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