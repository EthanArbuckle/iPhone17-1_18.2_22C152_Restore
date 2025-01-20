@interface HMDResidentLocationProvider
- (CLLocation)location;
- (HMFFuture)locationUpdatedFuture;
- (HMFPromise)residentLocationUpdatedPromise;
- (void)didDetermineLocation:(id)a3;
- (void)requestResidentLocation;
- (void)setLocation:(id)a3;
- (void)setLocationUpdatedFuture:(id)a3;
@end

@implementation HMDResidentLocationProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentLocationUpdatedPromise, 0);
  objc_storeStrong((id *)&self->_locationUpdatedFuture, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (HMFPromise)residentLocationUpdatedPromise
{
  return self->_residentLocationUpdatedPromise;
}

- (void)setLocationUpdatedFuture:(id)a3
{
}

- (HMFFuture)locationUpdatedFuture
{
  return self->_locationUpdatedFuture;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (void)didDetermineLocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@didDetermineLocation: %@", (uint8_t *)&v10, 0x16u);
  }
  [(HMDResidentLocationProvider *)v6 setLocation:v4];
  v9 = [(HMDResidentLocationProvider *)v6 residentLocationUpdatedPromise];
  [v9 fulfillWithNoValue];
}

- (void)requestResidentLocation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)obj = 138543362;
    *(void *)&obj[4] = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting resident location", obj, 0xCu);
  }
  *(void *)obj = 0;
  v7 = [MEMORY[0x263F42538] futureWithPromise:obj];
  uint64_t v8 = [v7 timeout:30.0];
  locationUpdatedFuture = v4->_locationUpdatedFuture;
  v4->_locationUpdatedFuture = (HMFFuture *)v8;

  objc_storeStrong((id *)&v4->_residentLocationUpdatedPromise, *(id *)obj);
  int v10 = +[HMDLocation sharedManager];
  [v10 startExtractingSingleLocationForDelegate:v4];
}

@end