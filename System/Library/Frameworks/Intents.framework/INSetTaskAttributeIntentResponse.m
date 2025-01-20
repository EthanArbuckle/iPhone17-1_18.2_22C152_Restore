@interface INSetTaskAttributeIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSetTaskAttributeIntentResponse)initWithBackingStore:(id)a3;
- (INSetTaskAttributeIntentResponse)initWithCode:(INSetTaskAttributeIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSetTaskAttributeIntentResponse)initWithCoder:(id)a3;
- (INSetTaskAttributeIntentResponseCode)code;
- (INTask)modifiedTask;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (unint64_t)warnings;
- (void)encodeWithCoder:(id)a3;
- (void)setModifiedTask:(INTask *)modifiedTask;
- (void)setWarnings:(unint64_t)a3;
@end

@implementation INSetTaskAttributeIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INSetTaskAttributeIntentResponseCode v3 = [(INSetTaskAttributeIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INSetTaskAttributeIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E55195E0[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"modifiedTask";
  v11[0] = v5;
  v6 = [(INSetTaskAttributeIntentResponse *)self modifiedTask];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 6) {

  }
  return v8;
}

- (void)setWarnings:(unint64_t)a3
{
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 clearWarnings];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__INSetTaskAttributeIntentResponse_setWarnings___block_invoke;
  v8[3] = &unk_1E5520C28;
  v8[4] = self;
  INTaskWarningCodeOptionsEnumerateBackingTypes(a3, v8);
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v6 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

void __48__INSetTaskAttributeIntentResponse_setWarnings___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _responseMessagePBRepresentation];
  [v3 addWarnings:a2];
}

- (void)setModifiedTask:(INTask *)modifiedTask
{
  unint64_t v4 = modifiedTask;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToTask(v4);

  [v5 setModifiedTask:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (unint64_t)warnings
{
  id v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v4 = [v3 warningsCount];

  unint64_t v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
      switch([v7 warningsAtIndex:i])
      {
        case 1u:
          v5 |= 1uLL;
          break;
        case 2u:
          v5 |= 2uLL;
          break;
        case 3u:
          v5 |= 4uLL;
          break;
        case 4u:
          v5 |= 8uLL;
          break;
        default:
          break;
      }
    }
  }
  return v5;
}

- (INTask)modifiedTask
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v3 = [v2 modifiedTask];
  uint64_t v4 = INIntentSlotValueTransformFromTask(v3);

  return (INTask *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSetTaskAttributeIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSetTaskAttributeIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSetTaskAttributeIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSetTaskAttributeIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSetTaskAttributeIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSetTaskAttributeIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSetTaskAttributeIntentResponseCode v2 = [(INSetTaskAttributeIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INSetTaskAttributeIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetTaskAttributeIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSetTaskAttributeIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSetTaskAttributeIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSetTaskAttributeIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSetTaskAttributeIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetTaskAttributeIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSetTaskAttributeIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSetTaskAttributeIntentResponse)initWithCode:(INSetTaskAttributeIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INSetTaskAttributeIntentResponseCodeFailureRequiringAppLaunch) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E55195E0[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSetTaskAttributeIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSetTaskAttributeIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSetTaskAttributeIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSetTaskAttributeIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 3;
  }
  else {
    return dword_18CFC59FC[a3 - 1];
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
      if (a5) {
        int64_t result = 5;
      }
      else {
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