@interface INRunWorkflowIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (BOOL)_shouldForwardIntentToApp;
- (INArchivedObject)underlyingIntent;
- (INArchivedObject)underlyingIntentResponse;
- (INRunWorkflowIntentResponse)init;
- (INRunWorkflowIntentResponse)initWithBackingStore:(id)a3;
- (INRunWorkflowIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INRunWorkflowIntentResponse)initWithCoder:(id)a3;
- (NSArray)steps;
- (NSNumber)continueRunning;
- (NSNumber)requestsIntentExecution;
- (NSNumber)waitingForResume;
- (NSString)utterance;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
- (void)setContinueRunning:(id)a3;
- (void)setRequestsIntentExecution:(id)a3;
- (void)setSteps:(id)a3;
- (void)setUnderlyingIntent:(id)a3;
- (void)setUnderlyingIntentResponse:(id)a3;
- (void)setUtterance:(id)a3;
- (void)setWaitingForResume:(id)a3;
@end

@implementation INRunWorkflowIntentResponse

- (id)_dictionaryRepresentation
{
  v28[8] = *MEMORY[0x1E4F143B8];
  v27[0] = @"code";
  unint64_t v3 = [(INRunWorkflowIntentResponse *)self code];
  unint64_t v26 = v3;
  if (v3 <= 9)
  {
    v4 = off_1E551EC20[v3];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = v4;
  v28[0] = v4;
  v27[1] = @"underlyingIntent";
  uint64_t v5 = [(INRunWorkflowIntentResponse *)self underlyingIntent];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v5;
  v28[1] = v5;
  v27[2] = @"underlyingIntentResponse";
  uint64_t v7 = [(INRunWorkflowIntentResponse *)self underlyingIntentResponse];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v7;
  v28[2] = v7;
  v27[3] = @"utterance";
  uint64_t v9 = [(INRunWorkflowIntentResponse *)self utterance];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v9;
  v28[3] = v9;
  v27[4] = @"waitingForResume";
  uint64_t v11 = [(INRunWorkflowIntentResponse *)self waitingForResume];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v11;
  v28[4] = v11;
  v27[5] = @"continueRunning";
  v13 = [(INRunWorkflowIntentResponse *)self continueRunning];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v14;
  v27[6] = @"steps";
  v15 = [(INRunWorkflowIntentResponse *)self steps];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v16;
  v27[7] = @"requestsIntentExecution";
  v17 = [(INRunWorkflowIntentResponse *)self requestsIntentExecution];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (!v17) {

  }
  if (!v15) {
  if (!v13)
  }

  if (!v12) {
  if (!v10)
  }

  if (!v8) {
  if (!v6)
  }

  if (v26 >= 0xA) {

  }
  return v25;
}

- (void)setRequestsIntentExecution:(id)a3
{
  id v7 = a3;
  v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setRequestsIntentExecution:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasRequestsIntentExecution:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setSteps:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToVoiceCommandStepInfos(v4);

  [v5 setSteps:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setContinueRunning:(id)a3
{
  id v7 = a3;
  id v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setContinueRunning:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasContinueRunning:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setWaitingForResume:(id)a3
{
  id v7 = a3;
  id v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setWaitingForResume:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasWaitingForResume:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setUtterance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setUtterance:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setUnderlyingIntentResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToArchivedObject(v4);

  [v5 setUnderlyingIntentResponse:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setUnderlyingIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToArchivedObject(v4);

  [v5 setUnderlyingIntent:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSNumber)requestsIntentExecution
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasRequestsIntentExecution])
  {
    id v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "requestsIntentExecution"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSArray)steps
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 steps];
  id v4 = INIntentSlotValueTransformFromVoiceCommandStepInfos(v3);

  return (NSArray *)v4;
}

- (NSNumber)continueRunning
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasContinueRunning])
  {
    id v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "continueRunning"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)waitingForResume
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasWaitingForResume])
  {
    id v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "waitingForResume"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSString)utterance
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 utterance];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INArchivedObject)underlyingIntentResponse
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 underlyingIntentResponse];
  id v4 = INIntentSlotValueTransformFromArchivedObject(v3);

  return (INArchivedObject *)v4;
}

- (INArchivedObject)underlyingIntent
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 underlyingIntent];
  id v4 = INIntentSlotValueTransformFromArchivedObject(v3);

  return (INArchivedObject *)v4;
}

- (BOOL)_shouldForwardIntentToApp
{
  return [(INRunWorkflowIntentResponse *)self code] == 4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INRunWorkflowIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INRunWorkflowIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INRunWorkflowIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INRunWorkflowIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INRunWorkflowIntentResponseCodeHandleInApp"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INRunWorkflowIntentResponseCodeUserConfirmationRequired"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INRunWorkflowIntentResponseCodeFailure"])
  }
    uint64_t v4 = 6;
  if ([v3 isEqualToString:@"INRunWorkflowIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INRunWorkflowIntentResponseCodeFailureNotFound"])
  }
    int64_t v5 = 8;
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INRunWorkflowIntentResponseCodeFailureAnotherWorkflowRunning"];

  if (v6) {
    return 9;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INRunWorkflowIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 8) {
    return 0;
  }
  else {
    return qword_18CFC5058[v2 - 1];
  }
}

- (INRunWorkflowIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INRunWorkflowIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INRunWorkflowIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INRunWorkflowIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INRunWorkflowIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INRunWorkflowIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INRunWorkflowIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INRunWorkflowIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 9) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E551EC20[a3];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INRunWorkflowIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    uint64_t v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INRunWorkflowIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INRunWorkflowIntentResponse)init
{
  return [(INRunWorkflowIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 7;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 9) {
    int v3 = 1;
  }
  else {
    int v3 = 0x7FFFFFFF;
  }
  if (a3 == 8) {
    return 0;
  }
  else {
    return v3;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return 3;
  }
  else {
    return dword_18CFC5030[a3 - 1];
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
      int64_t v6 = 6;
      if (a5) {
        int64_t v6 = 7;
      }
      if (a4 == 1) {
        int64_t v6 = 9;
      }
      if (a4) {
        int64_t result = v6;
      }
      else {
        int64_t result = 8;
      }
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    case 7:
      int64_t result = 5;
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