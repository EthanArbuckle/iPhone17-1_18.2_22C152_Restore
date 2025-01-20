@interface LACDTOSensorTrustVerifyService
- (BOOL)shouldVerifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4;
- (id)verifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4 repairState:(id)a5;
@end

@implementation LACDTOSensorTrustVerifyService

- (BOOL)shouldVerifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEnabled])
  {
    if ([v6 isDisapproved])
    {
      v7 = LACLogDTOSensor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        v18 = &unk_270432028;
LABEL_7:
        _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Sensor trust verification finished with code: %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v10 = [v6 installedSensorID];
      uint64_t v11 = [v10 length];

      if (!v11)
      {
        v7 = LACLogDTOSensor();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        int v17 = 138543362;
        v18 = &unk_270432040;
        goto LABEL_7;
      }
      v12 = [v6 installedSensorID];
      v13 = [v6 trustedSensorID];
      int v14 = [v12 isEqual:v13];

      if (v14)
      {
        v7 = LACLogDTOSensor();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        int v17 = 138543362;
        v18 = &unk_270432058;
        goto LABEL_7;
      }
      v15 = [v5 requirements];
      int v16 = [v15 hasBiometricEnrollments];

      if (!v16)
      {
        BOOL v8 = 1;
        goto LABEL_9;
      }
      v7 = LACLogDTOSensor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        v18 = &unk_270432070;
        goto LABEL_7;
      }
    }
  }
  else
  {
    v7 = LACLogDTOSensor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = &unk_270432010;
      goto LABEL_7;
    }
  }
LABEL_8:

  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (id)verifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4 repairState:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v8 = (LACDTOMutableSensorTrustState *)a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [[LACDTOMutableSensorTrustState alloc] initWithTrustState:v8];
  LODWORD(self) = [(LACDTOSensorTrustVerifyService *)self shouldVerifySensorTrustWithFeatureState:v10 trustState:v8];

  v12 = v8;
  if (self)
  {
    uint64_t v13 = [v9 repairFlag];
    int v14 = LACLogDTOSensor();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13 == 3)
    {
      if (v15)
      {
        int v18 = 138543362;
        uint64_t v19 = &unk_270432088;
        _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "Sensor trust verification finished with code: %{public}@", (uint8_t *)&v18, 0xCu);
      }

      [(LACDTOMutableSensorTrustState *)v11 disapprove];
    }
    else
    {
      if (v15)
      {
        int v18 = 138543362;
        uint64_t v19 = &unk_2704320A0;
        _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "Sensor trust verification finished with code: %{public}@", (uint8_t *)&v18, 0xCu);
      }
    }
    v12 = v11;
  }
  int v16 = v12;

  return v16;
}

@end