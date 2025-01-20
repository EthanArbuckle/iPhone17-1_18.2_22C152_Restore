@interface HDMedicationExposableDoseEventControlTaskServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_deleteDoseEventWithPersistentUUID:(id)a3 completion:(id)a4;
- (void)remote_doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 completion:(id)a5;
- (void)remote_writeDoseEvents:(id)a3 completion:(id)a4;
@end

@implementation HDMedicationExposableDoseEventControlTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F66BD8];
}

+ (id)requiredEntitlements
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2A038];
  v5[0] = *MEMORY[0x1E4F29E48];
  v5[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F66B00] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F66B00] clientInterface];
}

- (void)remote_doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, id))a5;
  v11 = [(HDStandardTaskServer *)self client];
  v12 = [v11 authorizationOracle];
  char v13 = [v12 clientHasAuthorizationForAllTypes];

  if ((v13 & 1) == 0)
  {
    v15 = [(HDStandardTaskServer *)self client];
    v16 = [v15 authorizationOracle];
    v17 = [MEMORY[0x1E4F2B6A0] userTrackedConceptTypeForIdentifier:*MEMORY[0x1E4F2AAA8]];
    id v32 = 0;
    v18 = [v16 readAuthorizationStatusForType:v17 error:&v32];
    id v14 = v32;

    if (v18)
    {
      if ([v18 authorizationStatus] == 103)
      {

        goto LABEL_6;
      }
      v28 = (void *)MEMORY[0x1E4F28C58];
      v29 = @"Authorization denied.";
      uint64_t v30 = 4;
    }
    else
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
        -[HDMedicationExposableDoseEventControlTaskServer remote_doseEventsForDateInterval:medicationIdentifier:completion:]((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
      }
      v28 = (void *)MEMORY[0x1E4F28C58];
      v29 = @"Unable to determine authorization.";
      uint64_t v30 = 5;
    }
    objc_msgSend(v28, "hk_error:description:", v30, v29);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, v20);
    goto LABEL_12;
  }
  id v14 = 0;
LABEL_6:
  v19 = [(HDStandardTaskServer *)self profile];
  id v31 = v14;
  v18 = +[HDMedicationExposableDoseEventEngine doseEventsForDateInterval:v8 medicationIdentifier:v9 profile:v19 error:&v31];
  id v20 = v31;

  ((void (**)(id, void *, id))v10)[2](v10, v18, v20);
LABEL_12:
}

- (void)remote_writeDoseEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v8 = [(HDStandardTaskServer *)self client];
  id v9 = [v8 authorizationOracle];
  char v10 = [v9 clientHasAuthorizationForAllTypes];

  if ((v10 & 1) == 0)
  {
    v12 = [(HDStandardTaskServer *)self client];
    char v13 = [v12 authorizationOracle];
    id v14 = [MEMORY[0x1E4F2B6A0] userTrackedConceptTypeForIdentifier:*MEMORY[0x1E4F2AAA8]];
    id v30 = 0;
    v15 = [v13 readAuthorizationStatusForType:v14 error:&v30];
    id v11 = v30;

    if (v15)
    {
      if ([v15 authorizationStatus] == 103)
      {

        goto LABEL_6;
      }
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = @"Authorization denied.";
      uint64_t v28 = 4;
    }
    else
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
        -[HDMedicationExposableDoseEventControlTaskServer remote_doseEventsForDateInterval:medicationIdentifier:completion:]((uint64_t)v11, v19, v20, v21, v22, v23, v24, v25);
      }
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = @"Unable to determine authorization.";
      uint64_t v28 = 5;
    }
    objc_msgSend(v26, "hk_error:description:", v28, v27);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v18);
    goto LABEL_12;
  }
  id v11 = 0;
LABEL_6:
  v16 = [(HDStandardTaskServer *)self profile];
  id v29 = v11;
  BOOL v17 = +[HDMedicationExposableDoseEventEngine writeDoseEvents:v6 profile:v16 error:&v29];
  id v18 = v29;

  v7[2](v7, v17, v18);
LABEL_12:
}

- (void)remote_deleteDoseEventWithPersistentUUID:(id)a3 completion:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v8 = [(HDStandardTaskServer *)self client];
  id v9 = [v8 authorizationOracle];
  char v10 = [v9 clientHasAuthorizationForAllTypes];

  if ((v10 & 1) == 0)
  {
    v12 = [(HDStandardTaskServer *)self client];
    char v13 = [v12 authorizationOracle];
    id v14 = [MEMORY[0x1E4F2B6A0] userTrackedConceptTypeForIdentifier:*MEMORY[0x1E4F2AAA8]];
    id v32 = 0;
    id v15 = [v13 readAuthorizationStatusForType:v14 error:&v32];
    id v11 = v32;

    if (v15)
    {
      if ([v15 authorizationStatus] == 103)
      {

        goto LABEL_6;
      }
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      id v29 = @"Authorization denied.";
      uint64_t v30 = 4;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v21 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
        -[HDMedicationExposableDoseEventControlTaskServer remote_doseEventsForDateInterval:medicationIdentifier:completion:]((uint64_t)v11, v21, v22, v23, v24, v25, v26, v27);
      }
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      id v29 = @"Unable to determine authorization.";
      uint64_t v30 = 5;
    }
    objc_msgSend(v28, "hk_error:description:", v30, v29);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v20);
    goto LABEL_12;
  }
  id v11 = 0;
LABEL_6:
  id v15 = objc_alloc_init(MEMORY[0x1E4F65AF0]);
  v16 = [(HDStandardTaskServer *)self profile];
  BOOL v17 = [v16 dataManager];
  v33[0] = v6;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v31 = v11;
  uint64_t v19 = [v17 deleteObjectsWithUUIDCollection:v18 configuration:v15 error:&v31];
  id v20 = v31;

  v7[2](v7, v19, v20);
LABEL_12:
}

- (void)remote_doseEventsForDateInterval:(uint64_t)a3 medicationIdentifier:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end