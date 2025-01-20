@interface CNLimitedAccessSyncEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (CNLimitedAccessSyncEvent)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)contactID;
- (int64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContactID:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setSequenceNumber:(int64_t)a3;
@end

@implementation CNLimitedAccessSyncEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_contactID forKey:@"_contactID"];
  [v5 encodeInteger:self->_sequenceNumber forKey:@"_sequenceNumber"];
  [v5 encodeBool:self->_isActive forKey:@"_isActive"];
}

- (CNLimitedAccessSyncEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNLimitedAccessSyncEvent;
  id v5 = [(CNLimitedAccessSyncEvent *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    uint64_t v7 = [v6 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactID"];
    uint64_t v10 = [v9 copy];
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;

    v5->_sequenceNumber = [v4 decodeIntegerForKey:@"_sequenceNumber"];
    v5->_isActive = [v4 decodeBoolForKey:@"_isActive"];
    v12 = v5;
  }

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end