@interface HDCPSUpdateGatewaysOperation
- (HDCPSUpdateGatewaysOperation)initWithManager:(id)a3 profile:(id)a4;
- (HDCPSUpdateGatewaysOperation)initWithManager:(id)a3 profile:(id)a4 batchID:(id)a5 externalIDs:(id)a6;
- (NSArray)externalIDs;
- (NSArray)gateways;
- (NSError)error;
- (NSString)batchID;
- (id)debugDescription;
- (void)_failWithError:(id)a3 step:(id)a4;
- (void)main;
@end

@implementation HDCPSUpdateGatewaysOperation

- (HDCPSUpdateGatewaysOperation)initWithManager:(id)a3 profile:(id)a4 batchID:(id)a5 externalIDs:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDCPSUpdateGatewaysOperation;
  v12 = [(HDCPSOperation *)&v18 initWithManager:a3 profile:a4];
  if (v12)
  {
    v13 = (NSString *)[v10 copy];
    batchID = v12->_batchID;
    v12->_batchID = v13;

    v15 = (NSArray *)[v11 copy];
    externalIDs = v12->_externalIDs;
    v12->_externalIDs = v15;
  }
  return v12;
}

- (HDCPSUpdateGatewaysOperation)initWithManager:(id)a3 profile:(id)a4
{
  v5 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)main
{
  v3 = [(HDCPSOperation *)self providerServiceManager];
  if (v3)
  {
    v4 = [(HDCPSUpdateGatewaysOperation *)self batchID];
    v5 = [(HDCPSUpdateGatewaysOperation *)self externalIDs];
    id v15 = 0;
    v6 = [v3 remoteGatewaysWithBatchID:v4 externalIDs:v5 error:&v15];
    id v7 = v15;

    if (v6)
    {
      v8 = [(HDCPSOperation *)self profile];
      if (v8)
      {

        id v14 = 0;
        unsigned __int8 v9 = +[HDClinicalGatewayEntity updateGateways:v6 profile:v8 error:&v14];
        id v7 = v14;
        if (v9)
        {
          id v10 = (NSArray *)[v6 copy];
          gateways = self->_gateways;
          self->_gateways = v10;
        }
        else
        {
          [(HDCPSUpdateGatewaysOperation *)self _failWithError:v7 step:@"persist gateways"];
        }
      }
      else
      {
        v13 = +[NSError hk_error:100 description:@"No profile."];
        [(HDCPSUpdateGatewaysOperation *)self _failWithError:v13 step:@"fetch profile"];
      }
    }
    else
    {
      [(HDCPSUpdateGatewaysOperation *)self _failWithError:v7 step:@"fetch gateways"];
    }
  }
  else
  {
    v12 = +[NSError hk_error:100 description:@"No provider service manager."];
    [(HDCPSUpdateGatewaysOperation *)self _failWithError:v12 step:@"fetch manager"];
  }
}

- (void)_failWithError:(id)a3 step:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    id v11 = v8;
    uint64_t v12 = objc_opt_class();
    v13 = [(HDCPSUpdateGatewaysOperation *)self batchID];
    id v14 = [(HDCPSUpdateGatewaysOperation *)self externalIDs];
    int v15 = 138544642;
    uint64_t v16 = v12;
    __int16 v17 = 2050;
    objc_super v18 = self;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    v22 = v14;
    __int16 v23 = 2114;
    id v24 = v7;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "<%{public}@: %{public}p; batchID: %@; externalIDs: %@;> failure during \"%{public}@\": %{public}@",
      (uint8_t *)&v15,
      0x3Eu);
  }
  unsigned __int8 v9 = (NSError *)[v6 copy];
  error = self->_error;
  self->_error = v9;
}

- (id)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(HDCPSUpdateGatewaysOperation *)self batchID];
  id v6 = HKSensitiveLogItem();
  id v7 = [(HDCPSUpdateGatewaysOperation *)self externalIDs];
  v8 = HKSensitiveLogItem();
  id v9 = [v3 initWithFormat:@"<%@: %p; batchID: %@; externalIDs: %@;>", v4, self, v6, v8, 0];

  return v9;
}

- (NSArray)gateways
{
  return self->_gateways;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)batchID
{
  return self->_batchID;
}

- (NSArray)externalIDs
{
  return self->_externalIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIDs, 0);
  objc_storeStrong((id *)&self->_batchID, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_gateways, 0);
}

@end