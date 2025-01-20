@interface AACustodianshipInfo
+ (BOOL)supportsSecureCoding;
- (AACustodianshipInfo)initWithCoder:(id)a3;
- (AACustodianshipInfo)initWithID:(id)a3 status:(int64_t)a4 ownerHandle:(id)a5;
- (NSString)ownerHandle;
- (NSUUID)custodianID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)statusDescription;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AACustodianshipInfo

- (AACustodianshipInfo)initWithID:(id)a3 status:(int64_t)a4 ownerHandle:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AACustodianshipInfo;
  v11 = [(AACustodianshipInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_custodianID, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_ownerHandle, a5);
  }

  return v12;
}

- (AACustodianshipInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AACustodianshipInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianID"];
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v6;

    v5->_status = [v4 decodeIntegerForKey:@"_status"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerHandle"];
    ownerHandle = v5->_ownerHandle;
    v5->_ownerHandle = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  custodianID = self->_custodianID;
  id v5 = a3;
  [v5 encodeObject:custodianID forKey:@"_custodianID"];
  [v5 encodeInteger:self->_status forKey:@"_status"];
  [v5 encodeObject:self->_ownerHandle forKey:@"_ownerHandle"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = [(NSUUID *)self->_custodianID copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = self->_status;
  uint64_t v7 = [(NSString *)self->_ownerHandle copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (id)statusDescription
{
  int64_t v2 = [(AACustodianshipInfo *)self status];
  if ((unint64_t)(v2 + 1) > 5) {
    return 0;
  }
  else {
    return *(&off_1E5A485D8 + v2 + 1);
  }
}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)ownerHandle
{
  return self->_ownerHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerHandle, 0);

  objc_storeStrong((id *)&self->_custodianID, 0);
}

@end