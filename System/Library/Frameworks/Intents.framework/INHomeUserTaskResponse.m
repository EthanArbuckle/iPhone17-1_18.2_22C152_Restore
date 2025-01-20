@interface INHomeUserTaskResponse
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INHomeUserTask)userTask;
- (INHomeUserTaskResponse)initWithCoder:(id)a3;
- (INHomeUserTaskResponse)initWithUserTask:(id)a3 taskOutcome:(int64_t)a4;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)taskOutcome;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeUserTaskResponse

- (void).cxx_destruct
{
}

- (int64_t)taskOutcome
{
  return self->_taskOutcome;
}

- (INHomeUserTask)userTask
{
  return self->_userTask;
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"userTask";
  userTask = self->_userTask;
  v4 = userTask;
  if (!userTask)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[1] = @"taskOutcome";
  v9[0] = v4;
  v5 = [NSNumber numberWithInteger:self->_taskOutcome];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  if (!userTask) {

  }
  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INHomeUserTaskResponse;
  v6 = [(INHomeUserTaskResponse *)&v11 description];
  v7 = [(INHomeUserTaskResponse *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INHomeUserTaskResponse *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_userTask];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"userTask");
  unint64_t v9 = self->_taskOutcome - 1;
  if (v9 > 0x16) {
    v10 = @"unknown";
  }
  else {
    v10 = off_1E551F2E8[v9];
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"taskOutcome");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  userTask = self->_userTask;
  id v5 = a3;
  [v5 encodeObject:userTask forKey:@"userTask"];
  [v5 encodeInteger:self->_taskOutcome forKey:@"taskOutcome"];
}

- (INHomeUserTaskResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userTask"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"taskOutcome"];

  v7 = [(INHomeUserTaskResponse *)self initWithUserTask:v5 taskOutcome:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INHomeUserTaskResponse *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      userTask = self->_userTask;
      BOOL v7 = (userTask == v5->_userTask || -[INHomeUserTask isEqual:](userTask, "isEqual:"))
        && self->_taskOutcome == v5->_taskOutcome;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INHomeUserTask *)self->_userTask hash];
  id v4 = [NSNumber numberWithInteger:self->_taskOutcome];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (INHomeUserTaskResponse)initWithUserTask:(id)a3 taskOutcome:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INHomeUserTaskResponse;
  BOOL v7 = [(INHomeUserTaskResponse *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    userTask = v7->_userTask;
    v7->_userTask = (INHomeUserTask *)v8;

    v7->_taskOutcome = a4;
  }

  return v7;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"userTask"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"taskOutcome"];
    uint64_t v13 = INHomeTaskOutcomeWithString(v12);

    v14 = (void *)[objc_alloc((Class)a1) initWithUserTask:v11 taskOutcome:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end