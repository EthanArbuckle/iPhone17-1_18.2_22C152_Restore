@interface CRVehicleSettingManager
- (BOOL)_disablesCarPlayFeatures:(unint64_t)a3;
- (BOOL)_setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4;
- (BOOL)isFerriteEnabled;
- (BOOL)setFerriteEnabled:(BOOL)a3;
- (CRFeatureAvailability)featureAvailability;
- (CRPairedVehicleManager)vehicleManager;
- (CRVehicle)vehicle;
- (CRVehicleSettingManager)initWithPairedVehicleManager:(id)a3 featureAvailability:(id)a4 vehicle:(id)a5;
- (void)reloadVehicle;
- (void)removeVehicleWithCompletion:(id)a3;
- (void)saveVehicleWithCompletion:(id)a3;
- (void)setVehicle:(id)a3;
@end

@implementation CRVehicleSettingManager

- (CRVehicleSettingManager)initWithPairedVehicleManager:(id)a3 featureAvailability:(id)a4 vehicle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRVehicleSettingManager;
  v12 = [(CRVehicleSettingManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_vehicleManager, a3);
    objc_storeStrong((id *)&v13->_featureAvailability, a4);
    objc_storeStrong((id *)&v13->_vehicle, a5);
  }

  return v13;
}

- (void)saveVehicleWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(CRVehicleSettingManager *)self vehicleManager];
  v6 = [(CRVehicleSettingManager *)self vehicle];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C2BC;
  v8[3] = &unk_24AA8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 saveVehicle:v6 completion:v8];
}

- (void)removeVehicleWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(CRVehicleSettingManager *)self vehicleManager];
  v6 = [(CRVehicleSettingManager *)self vehicle];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C4AC;
  v8[3] = &unk_24AF8;
  id v9 = v4;
  id v7 = v4;
  [v5 removeVehicle:v6 completion:v8];
}

- (BOOL)_disablesCarPlayFeatures:(unint64_t)a3
{
  v5 = [(CRVehicleSettingManager *)self vehicle];
  v6 = [v5 identifier];

  id v7 = [(CRVehicleSettingManager *)self featureAvailability];
  LOBYTE(a3) = [v7 disablesCarPlayFeatures:a3 forVehicleIdentifier:v6];

  return a3;
}

- (BOOL)_setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4
{
  uint64_t v4 = a4;
  id v7 = [(CRVehicleSettingManager *)self vehicle];
  v8 = [v7 identifier];

  id v9 = [(CRVehicleSettingManager *)self featureAvailability];
  LOBYTE(v4) = [v9 setCarPlayFeatures:a3 disabled:v4 forVehicleIdentifier:v8];

  return v4;
}

- (BOOL)isFerriteEnabled
{
  return ![(CRVehicleSettingManager *)self _disablesCarPlayFeatures:CRCarPlayFeaturesAllFerriteFeatures()];
}

- (BOOL)setFerriteEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = CRCarPlayFeaturesAllFerriteFeatures();

  return [(CRVehicleSettingManager *)self _setCarPlayFeatures:v5 disabled:!v3];
}

- (void)reloadVehicle
{
  BOOL v3 = [(CRVehicleSettingManager *)self vehicleManager];
  uint64_t v4 = [(CRVehicleSettingManager *)self vehicle];
  uint64_t v5 = [v4 certificateSerialNumber];
  id v6 = [v3 vehicleForCertificateSerial:v5];

  [(CRVehicleSettingManager *)self setVehicle:v6];
}

- (CRFeatureAvailability)featureAvailability
{
  return self->_featureAvailability;
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
}

- (CRPairedVehicleManager)vehicleManager
{
  return self->_vehicleManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleManager, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);

  objc_storeStrong((id *)&self->_featureAvailability, 0);
}

@end