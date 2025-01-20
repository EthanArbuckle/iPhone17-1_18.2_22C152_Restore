@interface INTransferMoneyIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INCurrencyAmount)transferFee;
- (INDateComponentsRange)transactionScheduledDate;
- (INPaymentAccount)fromAccount;
- (INPaymentAccount)toAccount;
- (INPaymentAmount)transactionAmount;
- (INTransferMoneyIntentResponse)initWithBackingStore:(id)a3;
- (INTransferMoneyIntentResponse)initWithCode:(INTransferMoneyIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INTransferMoneyIntentResponse)initWithCoder:(id)a3;
- (INTransferMoneyIntentResponseCode)code;
- (NSString)transactionNote;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setFromAccount:(INPaymentAccount *)fromAccount;
- (void)setToAccount:(INPaymentAccount *)toAccount;
- (void)setTransactionAmount:(INPaymentAmount *)transactionAmount;
- (void)setTransactionNote:(NSString *)transactionNote;
- (void)setTransactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate;
- (void)setTransferFee:(INCurrencyAmount *)transferFee;
@end

@implementation INTransferMoneyIntentResponse

- (id)_dictionaryRepresentation
{
  v25[7] = *MEMORY[0x1E4F143B8];
  v24[0] = @"code";
  INTransferMoneyIntentResponseCode v3 = [(INTransferMoneyIntentResponse *)self code];
  unint64_t v23 = v3;
  if ((unint64_t)v3 <= INTransferMoneyIntentResponseCodeFailureInsufficientFunds)
  {
    v4 = off_1E55170B0[v3];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = v4;
  v25[0] = v4;
  v24[1] = @"fromAccount";
  uint64_t v5 = [(INTransferMoneyIntentResponse *)self fromAccount];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v5;
  v25[1] = v5;
  v24[2] = @"toAccount";
  uint64_t v7 = [(INTransferMoneyIntentResponse *)self toAccount];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"transactionAmount";
  uint64_t v9 = [(INTransferMoneyIntentResponse *)self transactionAmount];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v25[3] = v9;
  v24[4] = @"transactionScheduledDate";
  v11 = [(INTransferMoneyIntentResponse *)self transactionScheduledDate];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v12;
  v24[5] = @"transactionNote";
  v13 = [(INTransferMoneyIntentResponse *)self transactionNote];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v14;
  v24[6] = @"transferFee";
  v15 = [(INTransferMoneyIntentResponse *)self transferFee];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (!v15) {

  }
  if (!v13) {
  if (!v11)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v6) {
  if (v23 >= 8)
  }

  return v17;
}

- (void)setTransferFee:(INCurrencyAmount *)transferFee
{
  v4 = transferFee;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToCurrencyAmountValue(v4);

  [v5 setTransferFee:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setTransactionNote:(NSString *)transactionNote
{
  v4 = transactionNote;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setTransactionNote:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setTransactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate
{
  v4 = transactionScheduledDate;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v5 setTransactionScheduledDate:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setTransactionAmount:(INPaymentAmount *)transactionAmount
{
  v4 = transactionAmount;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToPaymentAmountValue(v4);

  [v5 setTransactionAmount:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setToAccount:(INPaymentAccount *)toAccount
{
  v4 = toAccount;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToFinancialAccountValue(v4);

  [v5 setToAccount:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setFromAccount:(INPaymentAccount *)fromAccount
{
  v4 = fromAccount;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToFinancialAccountValue(v4);

  [v5 setFromAccount:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (INCurrencyAmount)transferFee
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INTransferMoneyIntentResponseCode v3 = [v2 transferFee];
  v4 = INIntentSlotValueTransformFromCurrencyAmountValue(v3);

  return (INCurrencyAmount *)v4;
}

- (NSString)transactionNote
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INTransferMoneyIntentResponseCode v3 = [v2 transactionNote];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INDateComponentsRange)transactionScheduledDate
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INTransferMoneyIntentResponseCode v3 = [v2 transactionScheduledDate];
  v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (INPaymentAmount)transactionAmount
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INTransferMoneyIntentResponseCode v3 = [v2 transactionAmount];
  v4 = INIntentSlotValueTransformFromPaymentAmountValue(v3);

  return (INPaymentAmount *)v4;
}

- (INPaymentAccount)toAccount
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INTransferMoneyIntentResponseCode v3 = [v2 toAccount];
  v4 = INIntentSlotValueTransformFromFinancialAccountValue(v3);

  return (INPaymentAccount *)v4;
}

- (INPaymentAccount)fromAccount
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INTransferMoneyIntentResponseCode v3 = [v2 fromAccount];
  v4 = INIntentSlotValueTransformFromFinancialAccountValue(v3);

  return (INPaymentAccount *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INTransferMoneyIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INTransferMoneyIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INTransferMoneyIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INTransferMoneyIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INTransferMoneyIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INTransferMoneyIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INTransferMoneyIntentResponseCodeFailureCredentialsUnverified"])int64_t v5 = 6;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INTransferMoneyIntentResponseCodeFailureInsufficientFunds"];

  if (v6) {
    return 7;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INTransferMoneyIntentResponseCode v2 = [(INTransferMoneyIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return qword_18CFC55E0[v2 - 1];
  }
}

- (INTransferMoneyIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INTransferMoneyIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INTransferMoneyIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INTransferMoneyIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INTransferMoneyIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INTransferMoneyIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INTransferMoneyIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INTransferMoneyIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INTransferMoneyIntentResponse)initWithCode:(INTransferMoneyIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  id v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INTransferMoneyIntentResponseCodeFailureInsufficientFunds) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E55170B0[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INTransferMoneyIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INTransferMoneyIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    uint64_t v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INTransferMoneyIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INTransferMoneyIntentResponse *)self initWithCode:0 userActivity:0];
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