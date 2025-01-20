@interface ATXSportsResponse
+ (BOOL)supportsSecureCoding;
- (ATXSportsResponse)init;
- (ATXSportsResponse)initWithCoder:(id)a3;
- (ATXSportsResponse)initWithTeams:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSArray)teams;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSportsResponse

- (ATXSportsResponse)init
{
  return [(ATXSportsResponse *)self initWithTeams:MEMORY[0x1E4F1CBF0]];
}

- (ATXSportsResponse)initWithTeams:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSportsResponse;
  v5 = [(ATXSportsResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    teams = v5->_teams;
    v5->_teams = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXSportsResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  objc_super v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  v10 = __atxlog_handle_default();
  id v11 = [v5 robustDecodeObjectOfClasses:v9 forKey:@"KEY_TEAMS" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSportsResponse" errorCode:-1 logHandle:v10];

  id v12 = [v4 error];

  id v13 = 0;
  if (!v12 && v11)
  {
    self = [(ATXSportsResponse *)self initWithTeams:v11];
    id v13 = self;
  }

  return v13;
}

- (NSArray)teams
{
  return self->_teams;
}

- (void).cxx_destruct
{
}

@end