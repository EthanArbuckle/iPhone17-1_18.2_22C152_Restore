@interface CNTCCAppAuthorizationRecord
+ (int64_t)authorizationStatusFromAuthorizationRight:(unint64_t)a3;
+ (unint64_t)authorizationRightFromAuthorizationStatus:(int64_t)a3;
- (CNTCCAppAuthorizationRecord)initWithBundleIdentifier:(id)a3 localizedName:(id)a4 recordType:(int64_t)a5 authorizationStatus:(int64_t)a6;
- (CNTCCAppAuthorizationRecord)initWithTCCAuthorizationRecord:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)localizedName;
- (int64_t)authorizationStatus;
- (int64_t)recordType;
- (void)setAuthorizationStatus:(int64_t)a3;
@end

@implementation CNTCCAppAuthorizationRecord

+ (int64_t)authorizationStatusFromAuthorizationRight:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 1;
  }
  else {
    return qword_1909B61A8[a3 - 1];
  }
}

+ (unint64_t)authorizationRightFromAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return qword_1909B61D8[a3];
  }
}

- (CNTCCAppAuthorizationRecord)initWithTCCAuthorizationRecord:(id)a3
{
  id v4 = a3;
  v5 = tcc_authorization_record_get_subject_identity();
  if (tcc_identity_get_type())
  {
    v6 = &stru_1EE0267A8;
  }
  else
  {
    v6 = [NSString stringWithCString:tcc_identity_get_identifier() encoding:4];
  }
  v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6];
  v8 = [v7 localizedName];

  v9 = tcc_authorization_record_get_subject_attributed_entity();
  BOOL v10 = v9 == 0;

  v11 = objc_opt_class();
  uint64_t authorization_right = tcc_authorization_record_get_authorization_right();

  v13 = -[CNTCCAppAuthorizationRecord initWithBundleIdentifier:localizedName:recordType:authorizationStatus:](self, "initWithBundleIdentifier:localizedName:recordType:authorizationStatus:", v6, v8, v10, [v11 authorizationStatusFromAuthorizationRight:authorization_right]);
  return v13;
}

- (CNTCCAppAuthorizationRecord)initWithBundleIdentifier:(id)a3 localizedName:(id)a4 recordType:(int64_t)a5 authorizationStatus:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNTCCAppAuthorizationRecord;
  v13 = [(CNTCCAppAuthorizationRecord *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v14->_localizedName, a4);
    v14->_recordType = a5;
    v14->_authorizationStatus = a6;
    v15 = v14;
  }

  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end