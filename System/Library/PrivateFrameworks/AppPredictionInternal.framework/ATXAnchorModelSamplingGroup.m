@interface ATXAnchorModelSamplingGroup
+ (id)getSamplingGroupForDataCollection;
+ (id)samplingGroupFromSamplingGroupId:(int64_t)a3;
+ (int64_t)assignSamplingGroupToUserAndPersistToDefaults:(id)a3;
+ (int64_t)selectSamplingGroupForUser;
+ (unint64_t)numSamplingGroups;
+ (void)resetSamplingGroupAssignmentForUser;
- (ATXAnchorModelSamplingGroup)initWithAnchorWhitelist:(id)a3 samplingGroupId:(int64_t)a4;
- (NSArray)anchorWhitelist;
- (id)description;
- (int64_t)samplingGroupId;
@end

@implementation ATXAnchorModelSamplingGroup

- (ATXAnchorModelSamplingGroup)initWithAnchorWhitelist:(id)a3 samplingGroupId:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAnchorModelSamplingGroup;
  v7 = [(ATXAnchorModelSamplingGroup *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    anchorWhitelist = v7->_anchorWhitelist;
    v7->_anchorWhitelist = (NSArray *)v8;

    v7->_samplingGroupId = a4;
  }

  return v7;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"Sampling Group ID: %li. Anchors: ", self->_samplingGroupId);
  [v3 appendString:v4];

  if ([(NSArray *)self->_anchorWhitelist count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NSArray *)self->_anchorWhitelist objectAtIndexedSubscript:v5];
      NSUInteger v7 = [(NSArray *)self->_anchorWhitelist count] - 1;
      id v8 = [NSString alloc];
      uint64_t v9 = [v6 description];
      v10 = (void *)v9;
      if (v5 == v7) {
        objc_super v11 = @"%@";
      }
      else {
        objc_super v11 = @"%@, ";
      }
      v12 = objc_msgSend(v8, "initWithFormat:", v11, v9);
      [v3 appendString:v12];

      ++v5;
    }
    while ([(NSArray *)self->_anchorWhitelist count] > v5);
  }
  v13 = (void *)[v3 copy];

  return v13;
}

+ (id)getSamplingGroupForDataCollection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v5 = [v4 integerForKey:@"com.apple.duetexpertd.anchormodel.dataharvester.samplinggroup.samplinggroupid"];
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "AnchorModel: Retrieving the user's assigned sampling group for Anchor Model Data Collection.", (uint8_t *)&v11, 2u);
  }

  if (!v5)
  {
    NSUInteger v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "AnchorModel: User was not assigned to a sampling group. Selecting a sampling group for the user...", (uint8_t *)&v11, 2u);
    }

    uint64_t v5 = [a1 assignSamplingGroupToUserAndPersistToDefaults:v4];
  }
  id v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "AnchorModel: Sampling group retrieved for user: %li", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = +[ATXAnchorModelSamplingGroup samplingGroupFromSamplingGroupId:v5];

  return v9;
}

+ (int64_t)assignSamplingGroupToUserAndPersistToDefaults:(id)a3
{
  id v4 = a3;
  int64_t v5 = [a1 selectSamplingGroupForUser];
  [v4 setInteger:v5 forKey:@"com.apple.duetexpertd.anchormodel.dataharvester.samplinggroup.samplinggroupid"];

  return v5;
}

+ (int64_t)selectSamplingGroupForUser
{
  return arc4random_uniform(+[ATXAnchorModelSamplingGroup numSamplingGroups])+ 1;
}

+ (void)resetSamplingGroupAssignmentForUser
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v3 setInteger:0 forKey:@"com.apple.duetexpertd.anchormodel.dataharvester.samplinggroup.samplinggroupid"];
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "AnchorModel: User's assigned sampling group for Anchor Model Data Collection has been reset.", v5, 2u);
  }
}

+ (unint64_t)numSamplingGroups
{
  return 6;
}

+ (id)samplingGroupFromSamplingGroupId:(int64_t)a3
{
  v29[5] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      id v4 = __atxlog_handle_default();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[ATXAnchorModelSamplingGroup samplingGroupFromSamplingGroupId:](v4);
      }

      int64_t v5 = [ATXAnchorModelSamplingGroup alloc];
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
      int64_t v7 = 0;
      goto LABEL_15;
    case 1:
      v20 = [ATXAnchorModelSamplingGroup alloc];
      v10 = objc_opt_new();
      v29[0] = v10;
      int v11 = objc_opt_new();
      v29[1] = v11;
      uint64_t v12 = objc_opt_new();
      v29[2] = v12;
      uint64_t v13 = objc_opt_new();
      v29[3] = v13;
      v14 = objc_opt_new();
      v29[4] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:5];
      v16 = v20;
      v17 = v15;
      uint64_t v18 = 1;
      goto LABEL_12;
    case 2:
      uint64_t v9 = [ATXAnchorModelSamplingGroup alloc];
      v10 = objc_opt_new();
      v28[0] = v10;
      int v11 = objc_opt_new();
      v28[1] = v11;
      uint64_t v12 = objc_opt_new();
      v28[2] = v12;
      uint64_t v13 = objc_opt_new();
      v28[3] = v13;
      v14 = objc_opt_new();
      v28[4] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:5];
      v16 = v9;
      v17 = v15;
      uint64_t v18 = 2;
      goto LABEL_12;
    case 3:
      v19 = [ATXAnchorModelSamplingGroup alloc];
      v10 = objc_opt_new();
      v23 = v10;
      int v11 = objc_opt_new();
      v24 = v11;
      uint64_t v12 = objc_opt_new();
      v25 = v12;
      uint64_t v13 = objc_opt_new();
      v26 = v13;
      v14 = objc_opt_new();
      v27 = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:5];
      v16 = v19;
      v17 = v15;
      uint64_t v18 = 3;
LABEL_12:
      v21 = -[ATXAnchorModelSamplingGroup initWithAnchorWhitelist:samplingGroupId:](v16, "initWithAnchorWhitelist:samplingGroupId:", v17, v18, v23, v24, v25, v26);

      goto LABEL_16;
    case 4:
      int64_t v5 = [ATXAnchorModelSamplingGroup alloc];
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
      int64_t v7 = 4;
      goto LABEL_15;
    case 5:
      int64_t v5 = [ATXAnchorModelSamplingGroup alloc];
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
      int64_t v7 = 5;
      goto LABEL_15;
    case 6:
      int64_t v5 = [ATXAnchorModelSamplingGroup alloc];
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
      int64_t v7 = 6;
      goto LABEL_15;
    default:
      id v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[ATXAnchorModelSamplingGroup samplingGroupFromSamplingGroupId:](a3, v8);
      }

      int64_t v5 = [ATXAnchorModelSamplingGroup alloc];
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
      int64_t v7 = a3;
LABEL_15:
      v21 = [(ATXAnchorModelSamplingGroup *)v5 initWithAnchorWhitelist:v6 samplingGroupId:v7];
LABEL_16:
      return v21;
  }
}

- (NSArray)anchorWhitelist
{
  return self->_anchorWhitelist;
}

- (int64_t)samplingGroupId
{
  return self->_samplingGroupId;
}

- (void).cxx_destruct
{
}

+ (void)samplingGroupFromSamplingGroupId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "AnchorModel: Tried to initialize a sampling group with an unknown sampling group id. Passed-in id: %li", (uint8_t *)&v2, 0xCu);
}

+ (void)samplingGroupFromSamplingGroupId:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "AnchorModel: Tried to initialize a sampling group with sampling group id ATXAnchorModelDCSamplingGroupIdUnknown. This should never happen.", v1, 2u);
}

@end