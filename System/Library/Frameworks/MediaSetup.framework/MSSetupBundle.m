@interface MSSetupBundle
+ (BOOL)supportsSecureCoding;
- (MSSetupBundle)initWithCoder:(id)a3;
- (MSSetupBundle)initWithHomeID:(id)a3 homeUserID:(id)a4;
- (NSUUID)homeID;
- (NSUUID)homeUserID;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeID:(id)a3;
- (void)setHomeUserID:(id)a3;
@end

@implementation MSSetupBundle

- (MSSetupBundle)initWithHomeID:(id)a3 homeUserID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSSetupBundle;
  v9 = [(MSSetupBundle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeID, a3);
    objc_storeStrong((id *)&v10->_homeUserID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSSetupBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!self) {
    goto LABEL_4;
  }
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Home_ID"];
  homeID = self->_homeID;
  self->_homeID = v5;

  if (!self->_homeID) {
    goto LABEL_5;
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Home_User_ID"];
  homeUserID = self->_homeUserID;
  self->_homeUserID = v7;

  if (self->_homeUserID) {
LABEL_4:
  }
    v9 = self;
  else {
LABEL_5:
  }
    v9 = 0;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  homeID = self->_homeID;
  id v5 = a3;
  [v5 encodeObject:homeID forKey:@"Home_ID"];
  [v5 encodeObject:self->_homeUserID forKey:@"Home_User_ID"];
}

- (NSUUID)homeUserID
{
  return self->_homeUserID;
}

- (void)setHomeUserID:(id)a3
{
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeID, 0);

  objc_storeStrong((id *)&self->_homeUserID, 0);
}

@end