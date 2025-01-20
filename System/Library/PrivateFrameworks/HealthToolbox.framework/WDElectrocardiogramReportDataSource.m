@interface WDElectrocardiogramReportDataSource
- (HKElectrocardiogram)sample;
- (HKHealthStore)healthStore;
- (NSDateComponents)dateOfBirthComponents;
- (NSString)firstName;
- (NSString)lastName;
- (UIColor)tintColor;
- (WDElectrocardiogramReportDataSource)initWithSample:(id)a3 healthStore:(id)a4 activeAlgorithmVersion:(int64_t)a5;
- (int64_t)activeAlgorithmVersion;
- (void)_fetchDemographicInformation;
- (void)setDateOfBirthComponents:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
@end

@implementation WDElectrocardiogramReportDataSource

- (WDElectrocardiogramReportDataSource)initWithSample:(id)a3 healthStore:(id)a4 activeAlgorithmVersion:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WDElectrocardiogramReportDataSource;
  v11 = [(WDElectrocardiogramReportDataSource *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sample, a3);
    objc_storeStrong((id *)&v12->_healthStore, a4);
    uint64_t v13 = HKHealthTintColor();
    tintColor = v12->_tintColor;
    v12->_tintColor = (UIColor *)v13;

    v12->_activeAlgorithmVersion = a5;
    [(WDElectrocardiogramReportDataSource *)v12 _fetchDemographicInformation];
  }

  return v12;
}

- (void)_fetchDemographicInformation
{
  objc_initWeak(&location, self);
  v3 = [(WDElectrocardiogramReportDataSource *)self healthStore];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__WDElectrocardiogramReportDataSource__fetchDemographicInformation__block_invoke;
  v4[3] = &unk_26458DE70;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "hk_fetchExistingDemographicInformationWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__WDElectrocardiogramReportDataSource__fetchDemographicInformation__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 firstName];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setFirstName:v4];

  v6 = [v3 lastName];
  id v7 = objc_loadWeakRetained(a1);
  [v7 setLastName:v6];

  id v9 = [v3 dateOfBirthComponents];

  id v8 = objc_loadWeakRetained(a1);
  [v8 setDateOfBirthComponents:v9];
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_sample, 0);
}

@end