@interface CCDatabaseExecutionResult
- (CCDatabaseCommand)command;
- (CCDatabaseExecutionResult)init;
- (CCDatabaseExecutionResult)initWithCommand:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 rowValueTuples:(id)a6 error:(id)a7;
- (NSArray)rowValueTuples;
- (NSError)error;
- (id)description;
- (unint64_t)beginMachTime;
- (unint64_t)endMachTime;
@end

@implementation CCDatabaseExecutionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rowValueTuples, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

- (CCDatabaseExecutionResult)initWithCommand:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 rowValueTuples:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CCDatabaseExecutionResult;
  v15 = [(CCDatabaseExecutionResult *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    command = v15->_command;
    v15->_command = (CCDatabaseCommand *)v16;

    v15->_beginMachTime = a4;
    v15->_endMachTime = a5;
    uint64_t v18 = [v13 copy];
    rowValueTuples = v15->_rowValueTuples;
    v15->_rowValueTuples = (NSArray *)v18;

    uint64_t v20 = [v14 copy];
    error = v15->_error;
    v15->_error = (NSError *)v20;
  }
  return v15;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)rowValueTuples
{
  return self->_rowValueTuples;
}

- (CCDatabaseExecutionResult)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CCDatabaseExecutionResult;
  v4 = [(CCDatabaseExecutionResult *)&v10 description];
  command = self->_command;
  v6 = [NSNumber numberWithUnsignedLongLong:self->_beginMachTime];
  v7 = [NSNumber numberWithUnsignedLongLong:self->_endMachTime];
  v8 = [v3 stringWithFormat:@"%@ {command: %@, beginMachTime: %@, endMachTime: %@, rowValueTuples: %@, error: %@}", v4, command, v6, v7, self->_rowValueTuples, self->_error];

  return v8;
}

- (CCDatabaseCommand)command
{
  return self->_command;
}

- (unint64_t)beginMachTime
{
  return self->_beginMachTime;
}

- (unint64_t)endMachTime
{
  return self->_endMachTime;
}

@end