@interface ASDJob
+ (BOOL)supportsSecureCoding;
- (ASDJob)init;
- (ASDJob)initWithCoder:(id)a3;
- (ASDJob)initWithPersistentID:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSError)failureError;
- (NSNumber)externalOrderKey;
- (NSNumber)orderKey;
- (NSString)bundleID;
- (double)percentComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)persistentID;
- (int64_t)phase;
- (int64_t)purchaseID;
- (int64_t)storeItemID;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setExternalOrderKey:(id)a3;
- (void)setFailureError:(id)a3;
- (void)setOrderKey:(id)a3;
- (void)setPercentComplete:(double)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPhase:(int64_t)a3;
- (void)setPurchaseID:(int64_t)a3;
- (void)setStoreItemID:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ASDJob

- (ASDJob)init
{
  return [(ASDJob *)self initWithPersistentID:0x7FFFFFFFFFFFFFFFLL];
}

- (ASDJob)initWithPersistentID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDJob;
  result = [(ASDJob *)&v5 init];
  if (result) {
    result->_persistentID = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ASDJob;
  v4 = [(ASDJob *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@: %lld", v4, self->_persistentID];

  return v5;
}

- (unint64_t)hash
{
  return self->_persistentID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    int64_t v7 = [(ASDJob *)self persistentID];
    BOOL v6 = v7 == [v4 persistentID];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[ASDJob allocWithZone:](ASDJob, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  uint64_t v8 = [(NSNumber *)self->_externalOrderKey copyWithZone:a3];
  externalOrderKey = v5->_externalOrderKey;
  v5->_externalOrderKey = (NSNumber *)v8;

  uint64_t v10 = [(NSError *)self->_failureError copyWithZone:a3];
  failureError = v5->_failureError;
  v5->_failureError = (NSError *)v10;

  uint64_t v12 = [(NSNumber *)self->_orderKey copyWithZone:a3];
  orderKey = v5->_orderKey;
  v5->_orderKey = (NSNumber *)v12;

  v5->_percentComplete = self->_percentComplete;
  v5->_persistentID = self->_persistentID;
  v5->_phase = self->_phase;
  v5->_purchaseID = self->_purchaseID;
  v5->_storeItemID = self->_storeItemID;
  v5->_type = self->_type;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJob)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASDJob *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalOrderKey"];
    externalOrderKey = v5->_externalOrderKey;
    v5->_externalOrderKey = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"failureError"];
    failureError = v5->_failureError;
    v5->_failureError = (NSError *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderKey"];
    orderKey = v5->_orderKey;
    v5->_orderKey = (NSNumber *)v12;

    [v4 decodeDoubleForKey:@"percentComplete"];
    v5->_percentComplete = v14;
    v5->_persistentID = [v4 decodeInt64ForKey:@"persistentID"];
    v5->_phase = [v4 decodeIntegerForKey:@"phase"];
    v5->_purchaseID = [v4 decodeInt64ForKey:@"purchaseID"];
    v5->_storeItemID = [v4 decodeInt64ForKey:@"storeItemID"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v6 encodeObject:self->_externalOrderKey forKey:@"externalOrderKey"];
  failureError = self->_failureError;
  if (failureError)
  {
    uint64_t v5 = ASDErrorWithSafeUserInfo(failureError);
    [v6 encodeObject:v5 forKey:@"failureError"];
  }
  [v6 encodeObject:self->_orderKey forKey:@"orderKey"];
  [v6 encodeDouble:@"percentComplete" forKey:self->_percentComplete];
  [v6 encodeInt64:self->_persistentID forKey:@"persistentID"];
  [v6 encodeInteger:self->_phase forKey:@"phase"];
  [v6 encodeInt64:self->_purchaseID forKey:@"purchaseID"];
  [v6 encodeInt64:self->_storeItemID forKey:@"storeItemID"];
  [v6 encodeInteger:self->_type forKey:@"type"];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)externalOrderKey
{
  return self->_externalOrderKey;
}

- (void)setExternalOrderKey:(id)a3
{
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(id)a3
{
}

- (NSNumber)orderKey
{
  return self->_orderKey;
}

- (void)setOrderKey:(id)a3
{
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (int64_t)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(int64_t)a3
{
  self->_purchaseID = a3;
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderKey, 0);
  objc_storeStrong((id *)&self->_failureError, 0);
  objc_storeStrong((id *)&self->_externalOrderKey, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end