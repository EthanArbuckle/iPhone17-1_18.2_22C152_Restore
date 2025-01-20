@interface INAddTasksIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INAddTasksIntentResponse)initWithBackingStore:(id)a3;
- (INAddTasksIntentResponse)initWithCode:(INAddTasksIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INAddTasksIntentResponse)initWithCoder:(id)a3;
- (INAddTasksIntentResponseCode)code;
- (INTaskList)modifiedTaskList;
- (NSArray)addedTasks;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (unint64_t)warnings;
- (void)encodeWithCoder:(id)a3;
- (void)setAddedTasks:(NSArray *)addedTasks;
- (void)setModifiedTaskList:(INTaskList *)modifiedTaskList;
- (void)setWarnings:(unint64_t)a3;
@end

@implementation INAddTasksIntentResponse

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"code";
  INAddTasksIntentResponseCode v3 = [(INAddTasksIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INAddTasksIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E5516790[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v5;
  v12[1] = @"modifiedTaskList";
  v6 = [(INAddTasksIntentResponse *)self modifiedTaskList];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v7;
  v12[2] = @"addedTasks";
  v8 = [(INAddTasksIntentResponse *)self addedTasks];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (!v8) {

  }
  if (!v6) {
  if (v4 >= 6)
  }

  return v10;
}

- (void)setWarnings:(unint64_t)a3
{
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 clearWarnings];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__INAddTasksIntentResponse_setWarnings___block_invoke;
  v8[3] = &unk_1E5520C28;
  v8[4] = self;
  INTaskWarningCodeOptionsEnumerateBackingTypes(a3, v8);
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v6 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

void __40__INAddTasksIntentResponse_setWarnings___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _responseMessagePBRepresentation];
  [v3 addWarnings:a2];
}

- (void)setAddedTasks:(NSArray *)addedTasks
{
  unint64_t v4 = addedTasks;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToTasks(v4);

  [v5 setAddedTasks:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setModifiedTaskList:(INTaskList *)modifiedTaskList
{
  unint64_t v4 = modifiedTaskList;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToTaskList(v4);

  [v5 setModifiedTaskList:v6];
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

- (NSArray)addedTasks
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v3 = [v2 addedTasks];
  uint64_t v4 = INIntentSlotValueTransformFromTasks(v3);

  return (NSArray *)v4;
}

- (INTaskList)modifiedTaskList
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v3 = [v2 modifiedTaskList];
  uint64_t v4 = INIntentSlotValueTransformFromTaskList(v3);

  return (INTaskList *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INAddTasksIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INAddTasksIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INAddTasksIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INAddTasksIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INAddTasksIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INAddTasksIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INAddTasksIntentResponseCode v2 = [(INAddTasksIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INAddTasksIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INAddTasksIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INAddTasksIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INAddTasksIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INAddTasksIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INAddTasksIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INAddTasksIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INAddTasksIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INAddTasksIntentResponse)initWithCode:(INAddTasksIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INAddTasksIntentResponseCodeFailureRequiringAppLaunch) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E5516790[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INAddTasksIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INAddTasksIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INAddTasksIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INAddTasksIntentResponse *)self initWithCode:0 userActivity:0];
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