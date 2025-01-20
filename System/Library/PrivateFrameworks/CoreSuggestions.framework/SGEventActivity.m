@interface SGEventActivity
+ (id)describeType:(unsigned __int8)a3;
+ (unsigned)typeForString:(id)a3;
- (NSString)teamIdentifier;
- (NSUserActivity)userActivity;
- (SGEventActivity)initWithDictionary:(id)a3;
- (SGEventActivity)initWithTeamIdentifier:(id)a3 type:(unsigned __int8)a4 userActivity:(id)a5 validStartDate:(double)a6 validEndDate:(double)a7;
- (double)validEndDate;
- (double)validStartDate;
- (id)jsonObject;
- (unsigned)type;
@end

@implementation SGEventActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);

  objc_storeStrong((id *)&self->_teamIdentifier, 0);
}

- (double)validEndDate
{
  return self->_validEndDate;
}

- (double)validStartDate
{
  return self->_validStartDate;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (id)jsonObject
{
  v22[5] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  userActivity = self->_userActivity;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__SGEventActivity_jsonObject__block_invoke;
  v12[3] = &unk_1E5B8E108;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  [(NSUserActivity *)userActivity _createUserActivityStringsWithOptions:0 completionHandler:v12];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:1.0] == 1)
  {
    v6 = 0;
  }
  else
  {
    v22[0] = self->_teamIdentifier;
    v21[0] = @"SGEventActivityTeamIdentifierKey";
    v21[1] = @"SGEventActivityTypeKey";
    v7 = [(id)objc_opt_class() describeType:self->_type];
    uint64_t v8 = v16[5];
    v22[1] = v7;
    v22[2] = v8;
    v21[2] = @"SGEventActivityUserActivityStringKey";
    v21[3] = @"SGEventActivityStartDateKey";
    v9 = [NSNumber numberWithDouble:self->_validStartDate];
    v22[3] = v9;
    v21[4] = @"SGEventActivityEndDateKey";
    v10 = [NSNumber numberWithDouble:self->_validEndDate];
    v22[4] = v10;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  }
  _Block_object_dispose(&v15, 8);

  return v6;
}

void __29__SGEventActivity_jsonObject__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (SGEventActivity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGEventActivity;
  v5 = [(SGEventActivity *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"SGEventActivityTeamIdentifierKey"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v6;

    uint64_t v8 = objc_opt_class();
    v9 = [v4 objectForKeyedSubscript:@"SGEventActivityTypeKey"];
    v5->_type = [v8 typeForString:v9];

    id v10 = objc_alloc(MEMORY[0x1E4F22488]);
    v11 = [v4 objectForKeyedSubscript:@"SGEventActivityUserActivityStringKey"];
    uint64_t v12 = [v10 _initWithUserActivityStrings:v11 secondaryString:0 optionalData:0];
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v12;

    v14 = [v4 objectForKeyedSubscript:@"SGEventActivityStartDateKey"];
    [v14 doubleValue];
    v5->_validStartDate = v15;

    v16 = [v4 objectForKeyedSubscript:@"SGEventActivityEndDateKey"];
    [v16 doubleValue];
    v5->_validEndDate = v17;
  }
  return v5;
}

- (SGEventActivity)initWithTeamIdentifier:(id)a3 type:(unsigned __int8)a4 userActivity:(id)a5 validStartDate:(double)a6 validEndDate:(double)a7
{
  id v13 = a3;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SGEventActivity;
  double v15 = [(SGEventActivity *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_teamIdentifier, a3);
    v16->_type = a4;
    objc_storeStrong((id *)&v16->_userActivity, a5);
    v16->_validStartDate = a6;
    v16->_validEndDate = a7;
  }

  return v16;
}

+ (unsigned)typeForString:(id)a3
{
  return [a3 isEqualToString:@"CheckIn"];
}

+ (id)describeType:(unsigned __int8)a3
{
  if (a3 == 1) {
    return @"CheckIn";
  }
  else {
    return @"Unknown";
  }
}

@end