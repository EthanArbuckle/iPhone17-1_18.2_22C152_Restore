@interface CATTaskMessageError
+ (BOOL)supportsSecureCoding;
- (CATTaskMessageError)initWithCoder:(id)a3;
- (CATTaskMessageError)initWithTaskUUID:(id)a3 taskError:(id)a4;
- (NSError)taskError;
- (void)encodeWithCoder:(id)a3;
- (void)setTaskError:(id)a3;
@end

@implementation CATTaskMessageError

- (CATTaskMessageError)initWithTaskUUID:(id)a3 taskError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATTaskMessageError.m", 23, @"Invalid parameter not satisfying: %@", @"taskError" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CATTaskMessageError;
  v9 = [(CATTaskMessage *)&v13 initWithTaskUUID:v7];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_taskError, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageError)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessageError;
  v5 = [(CATTaskMessage *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"taskError"];
    taskError = v5->_taskError;
    v5->_taskError = (NSError *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessageError;
  id v4 = a3;
  [(CATTaskMessage *)&v6 encodeWithCoder:v4];
  v5 = [(CATTaskMessageError *)self taskError];
  [v4 encodeObject:v5 forKey:@"taskError"];
}

- (NSError)taskError
{
  return self->_taskError;
}

- (void)setTaskError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end