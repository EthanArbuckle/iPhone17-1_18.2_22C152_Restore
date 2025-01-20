@interface HDMedicalIDSetupStatusTaskServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_medicalIDSetUpStatusWithCompletion:(id)a3;
@end

@implementation HDMedicalIDSetupStatusTaskServer

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
  char v9 = [v5 hasRequiredArrayEntitlement:v6 containing:*MEMORY[0x1E4F29B08] error:a4] | v8;

  return v9 & 1;
}

- (void)remote_medicalIDSetUpStatusWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if (self)
  {
    id v5 = [(HDStandardTaskServer *)self profile];
    uint64_t v6 = [v5 medicalIDDataManager];

    if (v6)
    {
      v7 = [(HDStandardTaskServer *)self profile];
      self = [v7 medicalIDDataManager];
      int v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      int v8 = v9;
      if (v9) {
        id v10 = v9;
      }

      self = 0;
      v7 = v8;
    }
  }
  else
  {
    int v8 = 0;
  }
  id v11 = v8;
  v12 = v11;
  if (self)
  {
    id v15 = v11;
    uint64_t v13 = [(HDMedicalIDSetupStatusTaskServer *)self medicalIDSetupStatusWithError:&v15];
    id v14 = v15;

    v12 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v4[2](v4, v13);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B190] setupStatusTaskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B190] setupStatusServerInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B190] setupStatusClientInterface];
}

@end