@interface _HKBridgeSetupConfiguration
- (FAFamilyMember)familyMember;
- (HKHealthStore)healthStore;
- (HKMedicalIDStore)medicalIDStore;
- (NRDevice)device;
- (_HKBridgeSetupConfiguration)init;
- (_HKBridgeSetupConfiguration)initWithFamilyMember:(id)a3 device:(id)a4 healthStore:(id)a5;
@end

@implementation _HKBridgeSetupConfiguration

- (_HKBridgeSetupConfiguration)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (_HKBridgeSetupConfiguration)initWithFamilyMember:(id)a3 device:(id)a4 healthStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKBridgeSetupConfiguration;
  v12 = [(_HKBridgeSetupConfiguration *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_familyMember, a3);
    objc_storeStrong((id *)&v13->_device, a4);
    objc_storeStrong((id *)&v13->_healthStore, a5);
    v14 = (HKMedicalIDStore *)[objc_alloc((Class)HKMedicalIDStore) initWithHealthStore:v13->_healthStore];
    medicalIDStore = v13->_medicalIDStore;
    v13->_medicalIDStore = v14;
  }
  return v13;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (NRDevice)device
{
  return self->_device;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end