@interface INSearchForMediaIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSearchForMediaIntentResponse)initWithBackingStore:(id)a3;
- (INSearchForMediaIntentResponse)initWithCode:(INSearchForMediaIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSearchForMediaIntentResponse)initWithCoder:(id)a3;
- (INSearchForMediaIntentResponseCode)code;
- (NSArray)mediaItems;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaItems:(NSArray *)mediaItems;
@end

@implementation INSearchForMediaIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INSearchForMediaIntentResponseCode v3 = [(INSearchForMediaIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INSearchForMediaIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E551EE00[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"mediaItems";
  v11[0] = v5;
  v6 = [(INSearchForMediaIntentResponse *)self mediaItems];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 7) {

  }
  return v8;
}

- (void)setMediaItems:(NSArray *)mediaItems
{
  unint64_t v4 = mediaItems;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToMediaItemValues(v4);

  [v5 setMediaItems:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSArray)mediaItems
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INSearchForMediaIntentResponseCode v3 = [v2 mediaItems];
  unint64_t v4 = INIntentSlotValueTransformFromMediaItemValues(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSearchForMediaIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSearchForMediaIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSearchForMediaIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSearchForMediaIntentResponseCodeInProgress"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSearchForMediaIntentResponseCodeSuccess"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSearchForMediaIntentResponseCodeFailure"]) {
    int64_t v5 = 5;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSearchForMediaIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 6;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t result = [(INSearchForMediaIntentResponse *)self code];
  if ((unint64_t)(result - 1) >= 6) {
    return 0;
  }
  return result;
}

- (INSearchForMediaIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForMediaIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForMediaIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSearchForMediaIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForMediaIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSearchForMediaIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForMediaIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSearchForMediaIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSearchForMediaIntentResponse)initWithCode:(INSearchForMediaIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INSearchForMediaIntentResponseCodeFailureRequiringAppLaunch) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E551EE00[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchForMediaIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSearchForMediaIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSearchForMediaIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSearchForMediaIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 6;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 3;
  }
  else {
    return dword_18CFC59E4[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 4;
      break;
    case 1:
      if (a5) {
        int64_t result = 6;
      }
      else {
        int64_t result = 5;
      }
      break;
    case 2:
      int64_t result = 3;
      break;
    case 4:
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