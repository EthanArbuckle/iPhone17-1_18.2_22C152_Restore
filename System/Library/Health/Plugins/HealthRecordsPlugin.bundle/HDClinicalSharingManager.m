@interface HDClinicalSharingManager
- (HDClinicalSharingManager)initWithProfileExtension:(id)a3;
- (id)_observedDataTypes;
- (void)_registerDataObservation;
- (void)_unregisterDataObservation;
- (void)dealloc;
- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)scheduleSharing;
@end

@implementation HDClinicalSharingManager

- (HDClinicalSharingManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDClinicalSharingManager;
  v5 = [(HDClinicalSharingManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    [v7 registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)dealloc
{
  [(HDClinicalSharingManager *)self _unregisterDataObservation];
  v3.receiver = self;
  v3.super_class = (Class)HDClinicalSharingManager;
  [(HDClinicalSharingManager *)&v3 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
}

- (void)scheduleSharing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v4 = [WeakRetained createClinicalSharingClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5A3DC;
  v5[3] = &unk_1139C8;
  v5[4] = self;
  [v4 scheduleSharingHealthDataWithReason:2 completion:v5];
}

- (id)_observedDataTypes
{
  v2 = +[HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierHighHeartRateEvent];
  v12[0] = v2;
  objc_super v3 = +[HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierIrregularHeartRhythmEvent];
  v12[1] = v3;
  id v4 = +[HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierLowHeartRateEvent];
  v12[2] = v4;
  v5 = +[HKObjectType electrocardiogramType];
  v12[3] = v5;
  v6 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];
  v12[4] = v6;
  v7 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];
  v12[5] = v7;
  v8 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
  v12[6] = v8;
  objc_super v9 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierNumberOfTimesFallen];
  v12[7] = v9;
  v10 = +[NSArray arrayWithObjects:v12 count:8];

  return v10;
}

- (void)_registerDataObservation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v4 = [WeakRetained profile];
  v5 = [v4 dataManager];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(HDClinicalSharingManager *)self _observedDataTypes];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObserver:self forDataType:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_unregisterDataObservation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v4 = [WeakRetained profile];
  v5 = [v4 dataManager];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(HDClinicalSharingManager *)self _observedDataTypes];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 removeObserver:self forDataType:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4
{
  _HKInitializeLogging();
  v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)id v8 = 138543362;
    *(void *)&v8[4] = objc_opt_class();
    id v7 = *(id *)&v8[4];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling clinical sharing for added samples", v8, 0xCu);
  }
  [(HDClinicalSharingManager *)self scheduleSharing];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomain, 0);

  objc_destroyWeak((id *)&self->_profileExtension);
}

@end