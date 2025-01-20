@interface HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider
- (HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider)initWithRegionAvailabilityProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4;
- (HDRegionAvailabilityProvidingDelegate)delegate;
- (id)onboardingEligibilityForCountryCode:(id)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4;
- (id)regionAvailability;
- (id)regionAvailabilityForDevice:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4 = a3;
  v5 = [(HDPairedDeviceCapabilityProviding *)self->_capabilityProvider activePairedDevice];
  if (v5)
  {
    v6 = [(HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider *)self onboardingEligibilityForCountryCode:v4 device:v5];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F2B008]);
    v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
    v9 = [v8 currentOSBuild];
    v6 = (void *)[v7 initWithIneligibilityReasons:2 countryAvailabilityVersion:v9];
  }

  return v6;
}

- (HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider)initWithRegionAvailabilityProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider;
  v9 = [(HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingProvider, a3);
    objc_storeStrong((id *)&v10->_capabilityProvider, a4);
  }

  return v10;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HDObservableRegionAvailabilityProviding *)self->_backingProvider regionAvailabilityForDevice:v7];
  v9 = [v8 allowedCountries];
  uint64_t v10 = [v9 remoteState];

  if (v10 != 4)
  {
    v27 = [(HDObservableRegionAvailabilityProviding *)self->_backingProvider onboardingEligibilityForCountryCode:v6 device:v7];
    goto LABEL_22;
  }
  v11 = NSString;
  objc_super v12 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v13 = [v12 currentOSBuild];
  v14 = [v8 version];
  v15 = [v11 stringWithFormat:@"%@.%@", v13, v14];

  if (v6)
  {
    v16 = [v8 allowedCountries];
    v17 = [v16 localCountrySet];
    int v18 = [v17 containsCountryCode:v6];

    if (v18) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 8;
    }
    v20 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v21 = [v20 isAppleWatch];

    id v22 = v6;
    uint64_t v23 = [v7 valueForProperty:*MEMORY[0x1E4F79E60]];
    v24 = (void *)v23;
    if (v21)
    {
      if (v23)
      {
        id v25 = v22;
        NRRawVersionFromString();
        uint64_t v26 = HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion();
        goto LABEL_13;
      }
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
    }
    else
    {
      if (v23)
      {
        id v25 = v22;
        NRRawVersionFromString();
        uint64_t v26 = HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion();
LABEL_13:
        unint64_t v30 = v26;

        if (v30 < 2)
        {

LABEL_20:
          id v28 = objc_alloc(MEMORY[0x1E4F2B008]);
          uint64_t v29 = v19;
          goto LABEL_21;
        }
LABEL_19:

        v19 |= 0x20uLL;
        goto LABEL_20;
      }
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
    }
    -[HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider onboardingEligibilityForCountryCode:device:](v31);
    goto LABEL_19;
  }
  id v28 = objc_alloc(MEMORY[0x1E4F2B008]);
  uint64_t v29 = 1;
LABEL_21:
  v27 = (void *)[v28 initWithIneligibilityReasons:v29 countryAvailabilityVersion:v15];

LABEL_22:

  return v27;
}

- (id)regionAvailability
{
  return (id)[(HDObservableRegionAvailabilityProviding *)self->_backingProvider regionAvailability];
}

- (id)regionAvailabilityForDevice:(id)a3
{
  return (id)[(HDObservableRegionAvailabilityProviding *)self->_backingProvider regionAvailabilityForDevice:a3];
}

- (HDRegionAvailabilityProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HDRegionAvailabilityProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_capabilityProvider, 0);

  objc_storeStrong((id *)&self->_backingProvider, 0);
}

- (void)onboardingEligibilityForCountryCode:(void *)a1 device:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, v3, v4, "[%{public}@] Watch version is nil", v5, v6, v7, v8, 2u);
}

@end