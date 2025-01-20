@interface INSearchForNotebookItemsIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSearchForNotebookItemsIntentResponse)initWithBackingStore:(id)a3;
- (INSearchForNotebookItemsIntentResponse)initWithCode:(INSearchForNotebookItemsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSearchForNotebookItemsIntentResponse)initWithCoder:(id)a3;
- (INSearchForNotebookItemsIntentResponseCode)code;
- (INSortType)sortType;
- (NSArray)notes;
- (NSArray)taskLists;
- (NSArray)tasks;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setNotes:(NSArray *)notes;
- (void)setSortType:(INSortType)sortType;
- (void)setTaskLists:(NSArray *)taskLists;
- (void)setTasks:(NSArray *)tasks;
@end

@implementation INSearchForNotebookItemsIntentResponse

- (id)_dictionaryRepresentation
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"code";
  INSearchForNotebookItemsIntentResponseCode v3 = [(INSearchForNotebookItemsIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INSearchForNotebookItemsIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E5518B88[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v5;
  v17[1] = @"notes";
  v6 = [(INSearchForNotebookItemsIntentResponse *)self notes];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v7;
  v17[2] = @"taskLists";
  v8 = [(INSearchForNotebookItemsIntentResponse *)self taskLists];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v9;
  v17[3] = @"tasks";
  v10 = [(INSearchForNotebookItemsIntentResponse *)self tasks];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v11;
  v17[4] = @"sortType";
  INSortType v12 = [(INSearchForNotebookItemsIntentResponse *)self sortType];
  v13 = @"unknown";
  if (v12 == INSortTypeByDate) {
    v13 = @"byDate";
  }
  if (v12 == INSortTypeAsIs) {
    v13 = @"asIs";
  }
  v14 = v13;
  v18[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  if (!v10) {
  if (!v8)
  }

  if (!v6) {
  if (v4 >= 6)
  }

  return v15;
}

- (void)setSortType:(INSortType)sortType
{
  if (sortType == INSortTypeAsIs) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = 0x7FFFFFFF;
  }
  if (sortType == INSortTypeByDate) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = v6;
  if (v5 == 0x7FFFFFFF) {
    [v6 setHasSortType:0];
  }
  else {
    [v6 setSortType:v5];
  }

  id v9 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v8 = [v9 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v8];
}

- (void)setTasks:(NSArray *)tasks
{
  unsigned int v4 = tasks;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToTasks(v4);

  [v5 setTasks:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setTaskLists:(NSArray *)taskLists
{
  unsigned int v4 = taskLists;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToTaskLists(v4);

  [v5 setTaskLists:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setNotes:(NSArray *)notes
{
  unsigned int v4 = notes;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToNotes(v4);

  [v5 setNotes:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (INSortType)sortType
{
  INSearchForNotebookItemsIntentResponseCode v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasSortType];
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 sortType];
  uint64_t v7 = 2 * (v6 == 1);
  if (!v6) {
    uint64_t v7 = 1;
  }
  if (v4) {
    INSortType v8 = v7;
  }
  else {
    INSortType v8 = INSortTypeUnknown;
  }

  return v8;
}

- (NSArray)tasks
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INSearchForNotebookItemsIntentResponseCode v3 = [v2 tasks];
  int v4 = INIntentSlotValueTransformFromTasks(v3);

  return (NSArray *)v4;
}

- (NSArray)taskLists
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INSearchForNotebookItemsIntentResponseCode v3 = [v2 taskLists];
  int v4 = INIntentSlotValueTransformFromTaskLists(v3);

  return (NSArray *)v4;
}

- (NSArray)notes
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INSearchForNotebookItemsIntentResponseCode v3 = [v2 notes];
  int v4 = INIntentSlotValueTransformFromNotes(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSearchForNotebookItemsIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSearchForNotebookItemsIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSearchForNotebookItemsIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSearchForNotebookItemsIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSearchForNotebookItemsIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSearchForNotebookItemsIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSearchForNotebookItemsIntentResponseCode v2 = [(INSearchForNotebookItemsIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INSearchForNotebookItemsIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForNotebookItemsIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForNotebookItemsIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSearchForNotebookItemsIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForNotebookItemsIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSearchForNotebookItemsIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForNotebookItemsIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSearchForNotebookItemsIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSearchForNotebookItemsIntentResponse)initWithCode:(INSearchForNotebookItemsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  uint64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INSearchForNotebookItemsIntentResponseCodeFailureRequiringAppLaunch) {
      INSortType v8 = 0;
    }
    else {
      INSortType v8 = off_1E5518B88[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchForNotebookItemsIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSearchForNotebookItemsIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    id v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSearchForNotebookItemsIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSearchForNotebookItemsIntentResponse *)self initWithCode:0 userActivity:0];
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