@interface ATXSportsResponseTeam
+ (BOOL)supportsSecureCoding;
- (ATXSportsResponseTeam)initWithCoder:(id)a3;
- (ATXSportsResponseTeam)initWithName:(id)a3 umcid:(id)a4;
- (ATXSportsResponseTeam)initWithName:(id)a3 umcid:(id)a4 qid:(id)a5;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSString)name;
- (NSString)qid;
- (NSString)umcid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSportsResponseTeam

- (ATXSportsResponseTeam)initWithName:(id)a3 umcid:(id)a4 qid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXSportsResponseTeam;
  v11 = [(ATXSportsResponseTeam *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    umcid = v11->_umcid;
    v11->_umcid = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    qid = v11->_qid;
    v11->_qid = (NSString *)v16;
  }
  return v11;
}

- (ATXSportsResponseTeam)initWithName:(id)a3 umcid:(id)a4
{
  return [(ATXSportsResponseTeam *)self initWithName:a3 umcid:a4 qid:0];
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
      objc_super v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"KEY_NAME"];
  [v5 encodeObject:self->_umcid forKey:@"KEY_UMCID"];
  [v5 encodeObject:self->_qid forKey:@"KEY_QID"];
}

- (ATXSportsResponseTeam)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_default();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"KEY_NAME" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXSportsResponseTeam" errorCode:-1 logHandle:v7];

  id v9 = [v4 error];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_default();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"KEY_UMCID" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXSportsResponseTeam" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    if (v15)
    {
      id v10 = 0;
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      v18 = __atxlog_handle_default();
      objc_super v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"KEY_QID" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXSportsResponseTeam" errorCode:-1 logHandle:v18];

      v20 = [v4 error];

      if (v20)
      {
        id v10 = 0;
      }
      else
      {
        self = [(ATXSportsResponseTeam *)self initWithName:v8 umcid:v14 qid:v19];
        id v10 = self;
      }
    }
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)umcid
{
  return self->_umcid;
}

- (NSString)qid
{
  return self->_qid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qid, 0);
  objc_storeStrong((id *)&self->_umcid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end