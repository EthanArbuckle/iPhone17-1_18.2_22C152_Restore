@interface ATXEngagementRecordEntry
+ (BOOL)supportsSecureCoding;
- (ATXEngagementRecordEntry)initWithCoder:(id)a3;
- (ATXEngagementRecordEntry)initWithExecutable:(id)a3 dateEngaged:(id)a4 engagementRecordType:(unint64_t)a5;
- (ATXExecutableIdentifier)executable;
- (BOOL)isEqual:(id)a3;
- (NSDate)dateEngaged;
- (id)description;
- (id)jsonDict;
- (unint64_t)engagementRecordType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXEngagementRecordEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXEngagementRecordEntry)initWithExecutable:(id)a3 dateEngaged:(id)a4 engagementRecordType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXEngagementRecordEntry;
  v11 = [(ATXEngagementRecordEntry *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_executable, a3);
    objc_storeStrong((id *)&v12->_dateEngaged, a4);
    v12->_engagementRecordType = a5;
    v13 = v12;
  }

  return v12;
}

- (ATXEngagementRecordEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_default();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"executable" withCoder:v4 expectNonNull:1 errorDomain:@"kATXEngagementRecord" errorCode:1 logHandle:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    v11 = __atxlog_handle_home_screen();
    v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"dateEngaged" withCoder:v4 expectNonNull:1 errorDomain:@"kATXEngagementRecord" errorCode:2 logHandle:v11];

    if (v12)
    {
      self = -[ATXEngagementRecordEntry initWithExecutable:dateEngaged:engagementRecordType:](self, "initWithExecutable:dateEngaged:engagementRecordType:", v8, v12, [v4 decodeIntegerForKey:@"engagementRecordType"]);
      v13 = self;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  executable = self->_executable;
  id v5 = a3;
  [v5 encodeObject:executable forKey:@"executable"];
  [v5 encodeObject:self->_dateEngaged forKey:@"dateEngaged"];
  [v5 encodeInteger:self->_engagementRecordType forKey:@"engagementRecordType"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Executable: %@ Date Engaged: %@ Type: %ld", self->_executable, self->_dateEngaged, self->_engagementRecordType];
}

- (id)jsonDict
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"executable";
  v3 = [(ATXExecutableIdentifier *)self->_executable debugTitle];
  v9[0] = v3;
  v8[1] = @"dateEngaged";
  id v4 = [(NSDate *)self->_dateEngaged description];
  v9[1] = v4;
  v8[2] = @"engagementRecordType";
  id v5 = [NSNumber numberWithUnsignedInteger:self->_engagementRecordType];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (unint64_t)hash
{
  return [(ATXExecutableIdentifier *)self->_executable hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXEngagementRecordEntry *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      executable = self->_executable;
      v7 = (ATXExecutableIdentifier *)v5[1];
      if (executable == v7)
      {
      }
      else
      {
        v8 = v7;
        id v9 = executable;
        BOOL v10 = [(ATXExecutableIdentifier *)v9 isEqual:v8];

        if (!v10)
        {
          BOOL v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      unint64_t engagementRecordType = self->_engagementRecordType;
      BOOL v11 = engagementRecordType == [v5 engagementRecordType];
      goto LABEL_10;
    }
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (ATXExecutableIdentifier)executable
{
  return self->_executable;
}

- (NSDate)dateEngaged
{
  return self->_dateEngaged;
}

- (unint64_t)engagementRecordType
{
  return self->_engagementRecordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateEngaged, 0);

  objc_storeStrong((id *)&self->_executable, 0);
}

@end