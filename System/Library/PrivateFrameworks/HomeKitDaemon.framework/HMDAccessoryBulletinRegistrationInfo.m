@interface HMDAccessoryBulletinRegistrationInfo
- (BOOL)enabled;
- (NSPredicate)predicate;
- (NSUUID)accessoryUUID;
- (id)description;
- (int64_t)serviceInstanceID;
- (void)setAccessoryUUID:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setServiceInstanceID:(int64_t)a3;
@end

@implementation HMDAccessoryBulletinRegistrationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setPredicate:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setServiceInstanceID:(int64_t)a3
{
  self->_serviceInstanceID = a3;
}

- (int64_t)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HMDAccessoryBulletinRegistrationInfo *)self accessoryUUID];
  int64_t v7 = [(HMDAccessoryBulletinRegistrationInfo *)self serviceInstanceID];
  if ([(HMDAccessoryBulletinRegistrationInfo *)self enabled]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = [(HMDAccessoryBulletinRegistrationInfo *)self predicate];
  v10 = [v3 stringWithFormat:@"<%@: accessory=%@, service=%lld, enabled=%@, predicate=%@>", v5, v6, v7, v8, v9];

  return v10;
}

@end