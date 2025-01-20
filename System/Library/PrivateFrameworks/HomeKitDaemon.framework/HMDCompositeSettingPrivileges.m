@interface HMDCompositeSettingPrivileges
- (HMDCompositeSettingPrivileges)initWithMinReadUserPrivilege:(unint64_t)a3;
- (unint64_t)minReadUserPrivilege;
@end

@implementation HMDCompositeSettingPrivileges

- (unint64_t)minReadUserPrivilege
{
  return self->_minReadUserPrivilege;
}

- (HMDCompositeSettingPrivileges)initWithMinReadUserPrivilege:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDCompositeSettingPrivileges;
  result = [(HMDCompositeSettingPrivileges *)&v5 init];
  if (result) {
    result->_minReadUserPrivilege = a3;
  }
  return result;
}

@end