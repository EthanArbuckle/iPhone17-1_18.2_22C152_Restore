@interface INSetRelationshipIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INContactCard)meCard;
- (INSetRelationshipIntentResponse)init;
- (INSetRelationshipIntentResponse)initWithBackingStore:(id)a3;
- (INSetRelationshipIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INSetRelationshipIntentResponse)initWithCoder:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
- (void)setMeCard:(id)a3;
@end

@implementation INSetRelationshipIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  unint64_t v3 = [(INSetRelationshipIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 0xA)
  {
    v5 = *(&off_1E551FE10 + v3);
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"meCard";
  v11[0] = v5;
  v6 = [(INSetRelationshipIntentResponse *)self meCard];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 0xB) {

  }
  return v8;
}

- (void)setMeCard:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToContactCard(v4);

  [v5 setMeCard:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (INContactCard)meCard
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 meCard];
  id v4 = INIntentSlotValueTransformFromContactCard(v3);

  return (INContactCard *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSetRelationshipIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSetRelationshipIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeFailureAccountConstrained"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeFailureRelationshipAlreadySet"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeFailureContactServiceNotAvailable"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INSetRelationshipIntentResponseCodeFailureUserAuthorizationRequired"])int64_t v5 = 9; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INSetRelationshipIntentResponseCodeFailureMeCardNotSet"];

  if (v6) {
    return 10;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INSetRelationshipIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 9) {
    return 0;
  }
  else {
    return qword_18CFC52E0[v2 - 1];
  }
}

- (INSetRelationshipIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetRelationshipIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSetRelationshipIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSetRelationshipIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSetRelationshipIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetRelationshipIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSetRelationshipIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSetRelationshipIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 0xA) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1E551FE10 + a3);
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSetRelationshipIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSetRelationshipIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INSetRelationshipIntentResponse)init
{
  return [(INSetRelationshipIntentResponse *)self initWithCode:0 userActivity:0];
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