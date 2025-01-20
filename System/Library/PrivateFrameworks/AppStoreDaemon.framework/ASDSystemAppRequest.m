@interface ASDSystemAppRequest
+ (BOOL)supportsSecureCoding;
- (ASDSystemAppRequest)initWithBundleID:(id)a3;
- (ASDSystemAppRequest)initWithCoder:(id)a3;
- (BOOL)isUserInitiated;
- (NSNumber)storeItemID;
- (NSString)bundleID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setStoreItemID:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation ASDSystemAppRequest

- (ASDSystemAppRequest)initWithBundleID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSystemAppRequest;
  v5 = [(ASDRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDSystemAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDSystemAppRequest;
  v5 = [(ASDRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeItemID"];
    storeItemID = v5->_storeItemID;
    v5->_storeItemID = (NSNumber *)v8;

    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_storeItemID forKey:@"storeItemID"];
  [v5 encodeBool:self->_userInitiated forKey:@"userInitiated"];
  v6.receiver = self;
  v6.super_class = (Class)ASDSystemAppRequest;
  [(ASDRequest *)&v6 encodeWithCoder:v5];
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)ASDSystemAppRequest;
  id v4 = [(ASDRequest *)&v12 description];
  uint64_t v5 = [(ASDSystemAppRequest *)self bundleID];
  objc_super v6 = (void *)v5;
  if (self->_userInitiated) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  storeItemID = self->_storeItemID;
  if (storeItemID)
  {
    objc_super v9 = [NSString stringWithFormat:@", storeItemID = %@", storeItemID];
    v10 = [v3 stringWithFormat:@"%@ {bundleID = %@, userInitiated = %@%@}", v4, v6, v7, v9];
  }
  else
  {
    v10 = [v3 stringWithFormat:@"%@ {bundleID = %@, userInitiated = %@%@}", v4, v5, v7, &stru_1EEC399F8];
  }

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(id)a3
{
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end