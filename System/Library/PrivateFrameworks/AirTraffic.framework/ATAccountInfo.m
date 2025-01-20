@interface ATAccountInfo
- (NSNumber)DSID;
- (NSString)altDSID;
- (NSString)appleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation ATAccountInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v5 = objc_opt_class();
  }
  __Copy(self, (uint64_t)a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = objc_opt_class();
  }
  __Copy(self, (uint64_t)a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ATAccountInfo;
  v4 = [(ATAccountInfo *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ [%@, %@, %@]", v4, self->_appleID, self->_altDSID, self->_DSID];

  return v5;
}

@end