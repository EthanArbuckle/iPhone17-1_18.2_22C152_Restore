@interface INListShortcutsIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INListShortcutsIntentResponse)init;
- (INListShortcutsIntentResponse)initWithBackingStore:(id)a3;
- (INListShortcutsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INListShortcutsIntentResponse)initWithCoder:(id)a3;
- (NSArray)shortcuts;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
- (void)setShortcuts:(id)a3;
@end

@implementation INListShortcutsIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  unint64_t v3 = [(INListShortcutsIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 5)
  {
    v5 = *(&off_1E551FB78 + v3);
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"shortcuts";
  v11[0] = v5;
  v6 = [(INListShortcutsIntentResponse *)self shortcuts];
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

- (void)setShortcuts:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToShortcutOverviews(v4);

  [v5 setShortcuts:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSArray)shortcuts
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 shortcuts];
  id v4 = INIntentSlotValueTransformFromShortcutOverviews(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INListShortcutsIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INListShortcutsIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INListShortcutsIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INListShortcutsIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INListShortcutsIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INListShortcutsIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INListShortcutsIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INListShortcutsIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INListShortcutsIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INListShortcutsIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INListShortcutsIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INListShortcutsIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INListShortcutsIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INListShortcutsIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INListShortcutsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 5) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1E551FB78 + a3);
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INListShortcutsIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INListShortcutsIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INListShortcutsIntentResponse)init
{
  return [(INListShortcutsIntentResponse *)self initWithCode:0 userActivity:0];
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