@interface HDHealthRecordsAccountInfoServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_determineMedicalRecordsAccountInfoStatusWithCompletion:(id)a3;
@end

@implementation HDHealthRecordsAccountInfoServer

- (void)remote_determineMedicalRecordsAccountInfoStatusWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(HDHealthRecordsAccountInfoServer *)self profile];
  v6 = [v5 healthRecordsExtension];
  v7 = [v6 accountManager];

  if (v7)
  {
    id v13 = 0;
    v8 = (char *)[v7 highPriorityTransactionHasGatewayBackedAccountsWithError:&v13];
    id v9 = v13;
    if (v8)
    {
      if (v8 == (unsigned char *)&dword_0 + 1) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_B2A94();
      }
      v4[2](v4, v10, 0);
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B2A1C();
      }
      v12 = +[NSError hk_error:100 description:@"Unable to determine account info status" underlyingError:v9];
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v12);
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B292C(self, v11);
    }
    id v9 = +[NSError hk_error:100 format:@"Unable to determine account info status"];
    ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v9);
  }
}

- (id)exportedInterface
{
  return (id)_HKHealthRecordsAccountInfoStoreServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKHealthRecordsAccountInfoStoreClientInterface(self, a2);
}

+ (id)taskIdentifier
{
  return +[HKHealthRecordsAccountInfoStore taskIdentifier];
}

+ (id)requiredEntitlements
{
  uint64_t v4 = HKHealthRecordsAccountInfoEntitlement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

@end