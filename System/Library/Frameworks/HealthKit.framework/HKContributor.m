@interface HKContributor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKContributor)initWithCoder:(id)a3;
- (NSString)appleID;
- (NSString)callerID;
- (NSUUID)UUID;
- (id)_initWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKContributor

- (id)_initWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKContributor;
  v11 = [(HKContributor *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    appleID = v11->_appleID;
    v11->_appleID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    callerID = v11->_callerID;
    v11->_callerID = (NSString *)v16;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  appleID = (__CFString *)self->_appleID;
  if (!appleID) {
    appleID = @"(no appleID)";
  }
  callerID = (__CFString *)self->_callerID;
  if (!callerID) {
    callerID = @"(no callerID)";
  }
  id v9 = [v3 stringWithFormat:@"<%@ %@ %@ %@>", v5, self->_UUID, appleID, callerID];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_UUID hash];
  NSUInteger v4 = [(NSString *)self->_appleID hash] ^ v3;
  return v4 ^ [(NSString *)self->_callerID hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  UUID = self->_UUID;
  v6 = (NSUUID *)v4[1];
  if (UUID != v6 && (!v6 || !-[NSUUID isEqual:](UUID, "isEqual:"))) {
    goto LABEL_11;
  }
  appleID = self->_appleID;
  id v8 = (NSString *)v4[2];
  if (appleID != v8 && (!v8 || !-[NSString isEqual:](appleID, "isEqual:"))) {
    goto LABEL_11;
  }
  callerID = self->_callerID;
  id v10 = (NSString *)v4[3];
  if (callerID == v10)
  {
    char v11 = 1;
    goto LABEL_12;
  }
  if (v10) {
    char v11 = -[NSString isEqual:](callerID, "isEqual:");
  }
  else {
LABEL_11:
  }
    char v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"uuid"];
  [v5 encodeObject:self->_appleID forKey:@"appleID"];
  [v5 encodeObject:self->_callerID forKey:@"callerID"];
}

- (HKContributor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKContributor;
  id v5 = [(HKContributor *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callerID"];
    callerID = v5->_callerID;
    v5->_callerID = (NSString *)v10;
  }
  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)callerID
{
  return self->_callerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end