@interface ASDRepairApplicationRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDRepairApplicationRequestOptions)initWithBundleID:(id)a3;
- (ASDRepairApplicationRequestOptions)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5;
- (ASDRepairApplicationRequestOptions)initWithCoder:(id)a3;
- (NSNumber)accountDSID;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)claimStyle;
- (unint64_t)exitReason;
- (void)encodeWithCoder:(id)a3;
- (void)setExitReason:(unint64_t)a3;
@end

@implementation ASDRepairApplicationRequestOptions

- (ASDRepairApplicationRequestOptions)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRepairApplicationRequestOptions;
  v6 = [(ASDRepairApplicationRequestOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

- (ASDRepairApplicationRequestOptions)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDRepairApplicationRequestOptions;
  v11 = [(ASDRepairApplicationRequestOptions *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountDSID, a4);
    objc_storeStrong((id *)&v12->_bundleID, a3);
    v12->_claimStyle = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDRepairApplicationRequestOptions allocWithZone:](ASDRepairApplicationRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_accountDSID copyWithZone:a3];
  accountDSID = v5->_accountDSID;
  v5->_accountDSID = (NSNumber *)v6;

  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v8;

  v5->_claimStyle = self->_claimStyle;
  v5->_exitReason = self->_exitReason;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRepairApplicationRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDRepairApplicationRequestOptions;
  id v5 = [(ASDRepairApplicationRequestOptions *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountDSIDKey"];
    accountDSID = v5->_accountDSID;
    v5->_accountDSID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIDKey"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimStyleKey"];
    v5->_claimStyle = [v10 integerValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exitReasonKey"];
    v5->_exitReason = [v11 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDRepairApplicationRequestOptions *)self accountDSID];
  [v4 encodeObject:v5 forKey:@"accountDSIDKey"];

  uint64_t v6 = [(ASDRepairApplicationRequestOptions *)self bundleID];
  [v4 encodeObject:v6 forKey:@"bundleIDKey"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[ASDRepairApplicationRequestOptions claimStyle](self, "claimStyle"));
  [v4 encodeObject:v7 forKey:@"claimStyleKey"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ASDRepairApplicationRequestOptions exitReason](self, "exitReason"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"exitReasonKey"];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unint64_t)a3
{
  self->_exitReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end