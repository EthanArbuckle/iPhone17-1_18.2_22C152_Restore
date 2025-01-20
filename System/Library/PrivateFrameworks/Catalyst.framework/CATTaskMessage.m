@interface CATTaskMessage
+ (BOOL)supportsSecureCoding;
- (CATTaskMessage)initWithCoder:(id)a3;
- (CATTaskMessage)initWithTaskUUID:(id)a3;
- (NSUUID)taskUUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTaskUUID:(id)a3;
@end

@implementation CATTaskMessage

- (CATTaskMessage)initWithTaskUUID:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CATTaskMessage.m", 25, @"Invalid parameter not satisfying: %@", @"taskUUID" object file lineNumber description];
  }
  v7 = [(CATMessage *)self init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_taskUUID, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessage;
  v5 = [(CATMessage *)&v10 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"taskUUID"];
    taskUUID = v5->_taskUUID;
    v5->_taskUUID = (NSUUID *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessage;
  id v4 = a3;
  [(CATMessage *)&v6 encodeWithCoder:v4];
  v5 = [(CATTaskMessage *)self taskUUID];
  [v4 encodeObject:v5 forKey:@"taskUUID"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CATMessage *)self messageUUID];
  objc_super v6 = [v5 UUIDString];
  uint64_t v7 = [(CATTaskMessage *)self taskUUID];
  v8 = [v7 UUIDString];
  v9 = [v3 stringWithFormat:@"<%@: %p { messageUUID = '%@', taskUUID = '%@' }>", v4, self, v6, v8];

  return v9;
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (void)setTaskUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end