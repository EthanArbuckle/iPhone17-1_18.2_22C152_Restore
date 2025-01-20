@interface DSFileOperationID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DSFileOperationID)init;
- (DSFileOperationID)initWithCoder:(id)a3;
- (DSFileOperationID)initWithUUID:(id)a3;
- (NSUUID)uuid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DSFileOperationID

- (DSFileOperationID)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [(DSFileOperationID *)self initWithUUID:v3];

  return v4;
}

- (DSFileOperationID)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSFileOperationID;
  v6 = [(DSFileOperationID *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uuid = self->_uuid;
  id v5 = NSStringFromSelector(sel_uuid);
  [v6 encodeObject:uuid forKey:v5];
}

- (DSFileOperationID)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DSFileOperationID;
  id v5 = [(DSFileOperationID *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_uuid);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = [v4[1] isEqual:self->_uuid];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end