@interface INSetNumericSettingIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INNumericSettingValue)maxValue;
- (INNumericSettingValue)minValue;
- (INNumericSettingValue)oldValue;
- (INNumericSettingValue)updatedValue;
- (INSetNumericSettingIntentResponse)init;
- (INSetNumericSettingIntentResponse)initWithBackingStore:(id)a3;
- (INSetNumericSettingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INSetNumericSettingIntentResponse)initWithCoder:(id)a3;
- (NSString)errorDetail;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setOldValue:(id)a3;
- (void)setUpdatedValue:(id)a3;
@end

@implementation INSetNumericSettingIntentResponse

- (id)_dictionaryRepresentation
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v20[0] = @"code";
  unint64_t v3 = [(INSetNumericSettingIntentResponse *)self code];
  unint64_t v19 = v3;
  if (v3 <= 9)
  {
    uint64_t v4 = (uint64_t)*(&off_1E5520108 + v3);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v4;
  v21[0] = v4;
  v20[1] = @"oldValue";
  uint64_t v5 = [(INSetNumericSettingIntentResponse *)self oldValue];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[1] = v5;
  v20[2] = @"updatedValue";
  v7 = [(INSetNumericSettingIntentResponse *)self updatedValue];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[2] = v8;
  v20[3] = @"minValue";
  v9 = [(INSetNumericSettingIntentResponse *)self minValue];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[3] = v10;
  v20[4] = @"maxValue";
  v11 = [(INSetNumericSettingIntentResponse *)self maxValue];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v12;
  v20[5] = @"errorDetail";
  v13 = [(INSetNumericSettingIntentResponse *)self errorDetail];
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

  if (v19 >= 0xA) {

  }
  return v15;
}

- (void)setErrorDetail:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setErrorDetail:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setMaxValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToNumericSettingValue(v4);

  [v5 setMaxValue:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setMinValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToNumericSettingValue(v4);

  [v5 setMinValue:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setUpdatedValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToNumericSettingValue(v4);

  [v5 setUpdatedValue:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setOldValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToNumericSettingValue(v4);

  [v5 setOldValue:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSString)errorDetail
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 errorDetail];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INNumericSettingValue)maxValue
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 maxValue];
  id v4 = INIntentSlotValueTransformFromNumericSettingValue(v3);

  return (INNumericSettingValue *)v4;
}

- (INNumericSettingValue)minValue
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 minValue];
  id v4 = INIntentSlotValueTransformFromNumericSettingValue(v3);

  return (INNumericSettingValue *)v4;
}

- (INNumericSettingValue)updatedValue
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 updatedValue];
  id v4 = INIntentSlotValueTransformFromNumericSettingValue(v3);

  return (INNumericSettingValue *)v4;
}

- (INNumericSettingValue)oldValue
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 oldValue];
  id v4 = INIntentSlotValueTransformFromNumericSettingValue(v3);

  return (INNumericSettingValue *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeFailureInvalidValue"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeFailureInvalidTrigger"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeFailureUnsupported"])int64_t v5 = 8;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSetNumericSettingIntentResponseCodeFailureOtherWithReason"];

  if (v6) {
    return 9;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INSetNumericSettingIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 8) {
    return 0;
  }
  else {
    return qword_18CFC5578[v2 - 1];
  }
}

- (INSetNumericSettingIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetNumericSettingIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSetNumericSettingIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSetNumericSettingIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSetNumericSettingIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetNumericSettingIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSetNumericSettingIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSetNumericSettingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 9) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1E5520108 + a3);
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSetNumericSettingIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INSetNumericSettingIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INSetNumericSettingIntentResponse)init
{
  return [(INSetNumericSettingIntentResponse *)self initWithCode:0 userActivity:0];
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