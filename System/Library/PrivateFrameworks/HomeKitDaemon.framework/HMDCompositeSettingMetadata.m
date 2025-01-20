@interface HMDCompositeSettingMetadata
- (HMDCompositeSettingConstraint)constraint;
- (HMDCompositeSettingMetadata)initWithKeyPath:(id)a3 constraint:(id)a4 privileges:(id)a5;
- (HMDCompositeSettingPrivileges)privileges;
- (NSString)keyPath;
@end

@implementation HMDCompositeSettingMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_privileges, 0);
  objc_storeStrong((id *)&self->_constraint, 0);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMDCompositeSettingPrivileges)privileges
{
  return (HMDCompositeSettingPrivileges *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCompositeSettingConstraint)constraint
{
  return (HMDCompositeSettingConstraint *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCompositeSettingMetadata)initWithKeyPath:(id)a3 constraint:(id)a4 privileges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_7:
    v16 = (HMDWidgetTimelineRefresherEventsAnalyzer *)_HMFPreconditionFailure();
    [(HMDWidgetTimelineRefresherEventsAnalyzer *)v16 .cxx_destruct];
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDCompositeSettingMetadata;
  v12 = [(HMDCompositeSettingMetadata *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    objc_storeStrong((id *)&v12->_constraint, a4);
    objc_storeStrong((id *)&v12->_privileges, a5);
  }

  return v12;
}

@end