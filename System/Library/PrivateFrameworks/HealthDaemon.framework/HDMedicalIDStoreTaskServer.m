@interface HDMedicalIDStoreTaskServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)medicalIDDataManagerWithError:(void *)a1;
- (id)remoteInterface;
- (void)remote_addEmergencyContact:(id)a3 completion:(id)a4;
- (void)remote_deleteMedicalIDDataWithLastFetchedMedicalIDData:(id)a3 completion:(id)a4;
- (void)remote_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:(id)a3;
- (void)remote_fetchMedicalIDWithCompletion:(id)a3;
- (void)remote_medicalIDClinicalContactsWithCompletion:(id)a3;
- (void)remote_medicalIDEmergencyContactsWithCompletion:(id)a3;
- (void)remote_removeEmergencyContact:(id)a3 completion:(id)a4;
- (void)remote_updateMedicalIDData:(id)a3 lastFetchedMedicalIDData:(id)a4 completion:(id)a5;
@end

@implementation HDMedicalIDStoreTaskServer

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F29FD0];
  if ([v5 hasRequiredEntitlement:*MEMORY[0x1E4F29FD0] error:a4])
  {
    v7 = [v5 valueForEntitlement:v6];
    objc_opt_class();
    int v8 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  char v9 = [v5 hasRequiredArrayEntitlement:v6 containing:*MEMORY[0x1E4F29B10] error:a4] | v8;

  return v9 & 1;
}

- (id)medicalIDDataManagerWithError:(void *)a1
{
  if (a1)
  {
    v4 = [a1 profile];
    id v5 = [v4 medicalIDDataManager];

    if (v5)
    {
      id v6 = [a1 profile];
      v7 = [v6 medicalIDDataManager];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (a2) {
          *a2 = v6;
        }
        else {
          _HKLogDroppedError();
        }
      }

      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)remote_fetchMedicalIDWithCompletion:(id)a3
{
  id v10 = 0;
  v4 = (void (**)(id, void *, id))a3;
  id v5 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v10);
  id v6 = v10;
  id v9 = v6;
  v7 = [v5 fetchMedicalIDIfSetUpWithError:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:(id)a3
{
  id v10 = 0;
  v4 = (void (**)(id, void *, id))a3;
  id v5 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v10);
  id v6 = v10;
  id v9 = v6;
  v7 = [v5 fetchMedicalIDDataIfSetUpOrCreateDefaultWithError:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_updateMedicalIDData:(id)a3 lastFetchedMedicalIDData:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, uint64_t, id))a5;
  id v18 = 0;
  id v8 = a3;
  id v9 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v18);
  id v10 = v18;
  id v17 = v10;
  uint64_t v11 = [v9 updateMedicalIDWithLocalData:v8 error:&v17];

  id v12 = v17;
  if (v11)
  {
    v13 = [(HDStandardTaskServer *)self profile];
    v14 = [v13 daemon];
    v15 = [v14 analyticsSubmissionCoordinator];
    v16 = [(HDStandardTaskServer *)self profile];
    objc_msgSend(v15, "medicalID_reportHasBeenSetForProfileType:", objc_msgSend(v16, "profileType"));
  }
  v7[2](v7, v11, v12);
}

- (void)remote_deleteMedicalIDDataWithLastFetchedMedicalIDData:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, uint64_t, id))a4;
  id v15 = 0;
  id v6 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v15);
  id v7 = v15;
  id v14 = v7;
  uint64_t v8 = [v6 deleteMedicalIDDataWithError:&v14];
  id v9 = v14;

  if (v8)
  {
    id v10 = [(HDStandardTaskServer *)self profile];
    uint64_t v11 = [v10 daemon];
    id v12 = [v11 analyticsSubmissionCoordinator];
    v13 = [(HDStandardTaskServer *)self profile];
    objc_msgSend(v12, "medicalID_reportHasBeenDeletedForProfileType:", objc_msgSend(v13, "profileType"));
  }
  v5[2](v5, v8, v9);
}

- (void)remote_medicalIDEmergencyContactsWithCompletion:(id)a3
{
  id v10 = 0;
  v4 = (void (**)(id, void *, id))a3;
  id v5 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v10);
  id v6 = v10;
  id v9 = v6;
  id v7 = [v5 medicalIDEmergencyContactsWithError:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_medicalIDClinicalContactsWithCompletion:(id)a3
{
  id v13 = 0;
  id v4 = a3;
  id v5 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v13);
  id v6 = v13;
  id v12 = v6;
  id v7 = [v5 medicalIDClinicalContactsWithError:&v12];
  id v8 = v12;

  if (v7 || !v8)
  {
    id v9 = v4;
    id v10 = v7;
    id v11 = 0;
  }
  else
  {
    id v9 = v4;
    id v10 = 0;
    id v11 = v8;
  }
  (*((void (**)(id, void *, id))v4 + 2))(v9, v10, v11);
}

- (void)remote_addEmergencyContact:(id)a3 completion:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v29 = 0;
  id v8 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v29);
  id v9 = v29;
  if (v8)
  {
    id v28 = 0;
    id v10 = [v8 fetchMedicalIDIfSetUpWithError:&v28];
    id v11 = v28;
    id v12 = v11;
    if (v10)
    {
      id v13 = [v10 emergencyContacts];
      int v14 = [v13 containsObject:v6];

      if (v14)
      {
        v7[2](v7, 1, 0);
      }
      else
      {
        id v15 = [v10 emergencyContacts];
        unint64_t v16 = [v15 count];
        unint64_t v17 = *MEMORY[0x1E4F2BA48];

        if (v16 >= v17)
        {
          v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 130, @"Medical ID emergency contact limit exceeded. Unable to add additional emergency contacts.");
          ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v21);
        }
        else
        {
          id v18 = [v10 emergencyContacts];
          if (v18)
          {
            v19 = [v10 emergencyContacts];
            v20 = [v19 arrayByAddingObject:v6];
            [v10 setEmergencyContacts:v20];
          }
          else
          {
            v30[0] = v6;
            v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
            [v10 setEmergencyContacts:v19];
          }

          v22 = [MEMORY[0x1E4F1C9C8] date];
          [v10 setEmergencyContactsModifiedDate:v22];

          id v27 = 0;
          uint64_t v23 = [v8 updateMedicalIDWithLocalData:v10 error:&v27];
          id v24 = v27;
          v25 = v24;
          if (v23) {
            id v26 = 0;
          }
          else {
            id v26 = v24;
          }
          ((void (**)(id, uint64_t, id))v7)[2](v7, v23, v26);
        }
      }
    }
    else
    {
      if (!v11)
      {
        id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 111, @"Medical ID has not been configured.");
      }
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v12);
    }
  }
  else
  {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v9);
  }
}

- (void)remote_removeEmergencyContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v23 = 0;
  id v8 = -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v23);
  id v9 = v23;
  if (v8)
  {
    id v22 = 0;
    id v10 = [v8 fetchMedicalIDIfSetUpWithError:&v22];
    id v11 = v22;
    if (v10
      && ([v10 emergencyContacts],
          id v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 containsObject:v6],
          v12,
          (v13 & 1) != 0))
    {
      int v14 = [v10 emergencyContacts];
      id v15 = (void *)[v14 mutableCopy];

      [v15 removeObject:v6];
      [v10 setEmergencyContacts:v15];
      unint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      [v10 setEmergencyContactsModifiedDate:v16];

      id v21 = 0;
      uint64_t v17 = [v8 updateMedicalIDWithLocalData:v10 error:&v21];
      id v18 = v21;
      v19 = v18;
      if (v17) {
        id v20 = 0;
      }
      else {
        id v20 = v18;
      }
      ((void (**)(id, uint64_t, id))v7)[2](v7, v17, v20);
    }
    else
    {
      v7[2](v7, 1, 0);
    }
  }
  else
  {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v9);
  }
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B190] taskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B190] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B190] clientInterface];
}

@end