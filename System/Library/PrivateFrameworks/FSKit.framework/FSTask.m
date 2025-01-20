@interface FSTask
+ (BOOL)supportsSecureCoding;
- (FSMessageConnection)connection;
- (FSTask)initWithCoder:(id)a3;
- (FSTask)initWithMessageConnection:(id)a3 taskID:(id)a4;
- (NSUUID)taskID;
- (void)completed:(id)a3 replyHandler:(id)a4;
- (void)didCompleteWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logMessage:(id)a3;
- (void)prompt:(id)a3 replyHandler:(id)a4;
- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4;
@end

@implementation FSTask

- (void)logMessage:(id)a3
{
}

- (void)didCompleteWithError:(id)a3
{
}

- (FSMessageConnection)connection
{
  return (FSMessageConnection *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)taskID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v4);
  }
  [v5 encodeObject:self->_connection forKey:@"FSTask.MessageConnection"];
  [v5 encodeObject:self->_taskID forKey:@"FSTask.TaskID"];
}

- (FSTask)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v9);
  }
  if ([v4 containsValueForKey:@"FSTask.MessageConnection"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.MessageConnection"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.TaskID"];
    self = [(FSTask *)self initWithMessageConnection:v5 taskID:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (FSTask)initWithMessageConnection:(id)a3 taskID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FSTask;
  id v9 = [(FSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_taskID, a4);
  }

  return v10;
}

@end