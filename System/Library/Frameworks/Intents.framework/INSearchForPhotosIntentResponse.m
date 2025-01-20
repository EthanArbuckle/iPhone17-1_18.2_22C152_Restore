@interface INSearchForPhotosIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSearchForPhotosIntentResponse)initWithBackingStore:(id)a3;
- (INSearchForPhotosIntentResponse)initWithCode:(INSearchForPhotosIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSearchForPhotosIntentResponse)initWithCoder:(id)a3;
- (INSearchForPhotosIntentResponseCode)code;
- (NSNumber)searchResultsCount;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setSearchResultsCount:(NSNumber *)searchResultsCount;
@end

@implementation INSearchForPhotosIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INSearchForPhotosIntentResponseCode v3 = [(INSearchForPhotosIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INSearchForPhotosIntentResponseCodeFailureAppConfigurationRequired)
  {
    v5 = off_1E55187B8[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"searchResultsCount";
  v11[0] = v5;
  v6 = [(INSearchForPhotosIntentResponse *)self searchResultsCount];
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

- (void)setSearchResultsCount:(NSNumber *)searchResultsCount
{
  v7 = searchResultsCount;
  unint64_t v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setSearchResultsCount:", -[NSNumber intValue](v7, "intValue"));
  }
  else {
    [v4 setHasSearchResultsCount:0];
  }

  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (NSNumber)searchResultsCount
{
  INSearchForPhotosIntentResponseCode v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasSearchResultsCount])
  {
    unint64_t v4 = NSNumber;
    v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "searchResultsCount"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSearchForPhotosIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSearchForPhotosIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSearchForPhotosIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSearchForPhotosIntentResponseCodeFailure"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSearchForPhotosIntentResponseCodeFailureRequiringAppLaunch"])int64_t v5 = 4; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INSearchForPhotosIntentResponseCodeFailureAppConfigurationRequired"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSearchForPhotosIntentResponseCode v2 = [(INSearchForPhotosIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC4B98[v2 - 1];
  }
}

- (INSearchForPhotosIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForPhotosIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForPhotosIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSearchForPhotosIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForPhotosIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSearchForPhotosIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForPhotosIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSearchForPhotosIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSearchForPhotosIntentResponse)initWithCode:(INSearchForPhotosIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INSearchForPhotosIntentResponseCodeFailureAppConfigurationRequired) {
      v8 = 0;
    }
    else {
      v8 = off_1E55187B8[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchForPhotosIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSearchForPhotosIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSearchForPhotosIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSearchForPhotosIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 4;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 5) {
    return 1;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 3;
  }
  else {
    return dword_18CFC4B80[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t v5 = 3;
  if (a5) {
    int64_t v5 = 4;
  }
  if (a4 == 1) {
    int64_t v5 = 5;
  }
  int64_t v6 = 2;
  if (a3 != 4) {
    int64_t v6 = a3 == 5;
  }
  if (a3 == 1) {
    return v5;
  }
  else {
    return v6;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end