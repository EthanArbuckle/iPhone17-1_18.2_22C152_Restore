@interface INListRideOptionsIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INListRideOptionsIntentResponse)initWithBackingStore:(id)a3;
- (INListRideOptionsIntentResponse)initWithCode:(INListRideOptionsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INListRideOptionsIntentResponse)initWithCoder:(id)a3;
- (INListRideOptionsIntentResponseCode)code;
- (NSArray)paymentMethods;
- (NSArray)rideOptions;
- (NSDate)expirationDate;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(NSDate *)expirationDate;
- (void)setPaymentMethods:(NSArray *)paymentMethods;
- (void)setRideOptions:(NSArray *)rideOptions;
@end

@implementation INListRideOptionsIntentResponse

- (id)_dictionaryRepresentation
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"code";
  INListRideOptionsIntentResponseCode v3 = [(INListRideOptionsIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INListRideOptionsIntentResponseCodeFailurePreviousRideNeedsFeedback)
  {
    v5 = off_1E5518808[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v5;
  v14[1] = @"rideOptions";
  v6 = [(INListRideOptionsIntentResponse *)self rideOptions];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v7;
  v14[2] = @"paymentMethods";
  v8 = [(INListRideOptionsIntentResponse *)self paymentMethods];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v9;
  v14[3] = @"expirationDate";
  v10 = [(INListRideOptionsIntentResponse *)self expirationDate];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (!v10) {

  }
  if (!v8) {
  if (!v6)
  }

  if (v4 >= 0xB) {

  }
  return v12;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  unint64_t v4 = expirationDate;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToTimestamp(v4);

  [v5 setExpirationDate:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setPaymentMethods:(NSArray *)paymentMethods
{
  unint64_t v4 = paymentMethods;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToPaymentMethodValues(v4);

  [v5 setPaymentMethods:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setRideOptions:(NSArray *)rideOptions
{
  unint64_t v4 = rideOptions;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToRideOptions(v4);

  [v5 setRideOptions:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSDate)expirationDate
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INListRideOptionsIntentResponseCode v3 = [v2 expirationDate];
  unint64_t v4 = INIntentSlotValueTransformFromTimestamp(v3);

  return (NSDate *)v4;
}

- (NSArray)paymentMethods
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INListRideOptionsIntentResponseCode v3 = [v2 paymentMethods];
  unint64_t v4 = INIntentSlotValueTransformFromPaymentMethodValues(v3);

  return (NSArray *)v4;
}

- (NSArray)rideOptions
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INListRideOptionsIntentResponseCode v3 = [v2 rideOptions];
  unint64_t v4 = INIntentSlotValueTransformFromRideOptions(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INListRideOptionsIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INListRideOptionsIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeFailureRequiringAppLaunchMustVerifyCredentials"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeFailureRequiringAppLaunchNoServiceInArea"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeFailureRequiringAppLaunchServiceTemporarilyUnavailable"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INListRideOptionsIntentResponseCodeFailureRequiringAppLaunchPreviousRideNeedsCompletion"])int64_t v5 = 9; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INListRideOptionsIntentResponseCodeFailurePreviousRideNeedsFeedback"];

  if (v6) {
    return 10;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INListRideOptionsIntentResponseCode v2 = [(INListRideOptionsIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 9) {
    return 0;
  }
  else {
    return qword_18CFC44B0[v2 - 1];
  }
}

- (INListRideOptionsIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INListRideOptionsIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INListRideOptionsIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INListRideOptionsIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INListRideOptionsIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INListRideOptionsIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INListRideOptionsIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INListRideOptionsIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INListRideOptionsIntentResponse)initWithCode:(INListRideOptionsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INListRideOptionsIntentResponseCodeFailurePreviousRideNeedsFeedback) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E5518808[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INListRideOptionsIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INListRideOptionsIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INListRideOptionsIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INListRideOptionsIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) < 5) {
    return a3 - 5;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return 3;
  }
  else {
    return dword_18CFC52B8[a3 - 1];
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
      if (v6 >= 5) {
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