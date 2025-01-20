@interface HDCodableClinicalGateway
- (id)FHIRVersionString;
- (id)FHIRVersionStringWithError:(id *)a3;
- (id)_stringValueForContentKey:(id)a3 error:(id *)a4;
- (id)countryCode;
- (id)countryCodeWithError:(id *)a3;
@end

@implementation HDCodableClinicalGateway

- (id)_stringValueForContentKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (![v7 length])
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDClinicalGatewayEntity+HealthRecordsPlugin.m", 1028, @"Invalid parameter not satisfying: %@", @"keyName.length > 0" object file lineNumber description];
  }
  v8 = [(HDCodableClinicalGateway *)self rawContent];

  if (!v8)
  {
    v14 = 0;
    goto LABEL_14;
  }
  v9 = [(HDCodableClinicalGateway *)self rawContent];
  id v17 = 0;
  v10 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:&v17];
  id v11 = v17;

  if (v10)
  {

    objc_opt_class();
    v12 = HKSafeObject();
    id v11 = 0;
    if (v12)
    {
      v13 = [v12 objectForKeyedSubscript:v7];
      if (v13)
      {
        objc_opt_class();
        v14 = HKSafeObject();
LABEL_12:

        goto LABEL_13;
      }
    }
    else {
      v13 = {;
    }
      +[NSError hk_assignError:a4 code:100 description:v13 underlyingError:v11];
    }
    v14 = 0;
    goto LABEL_12;
  v12 = };
  +[NSError hk_assignError:a4 code:100 description:v12 underlyingError:v11];
  v14 = 0;
LABEL_13:

LABEL_14:

  return v14;
}

- (id)countryCodeWithError:(id *)a3
{
  id v9 = 0;
  v4 = [(HDCodableClinicalGateway *)self _stringValueForContentKey:HDClinicalGatewayContentCountryKey error:&v9];
  id v5 = v9;
  v6 = v5;
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v4;
}

- (id)countryCode
{
  id v13 = 0;
  v3 = [(HDCodableClinicalGateway *)self countryCodeWithError:&v13];
  id v4 = v13;
  id v5 = v3;
  if (!v3)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogHealthRecords;
    if (v4)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B0054(v6, (uint64_t)self, v4);
      }
      BOOL v7 = &HDClinicalGatewayUnknownCountry;
    }
    else
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v6;
        id v9 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        id v10 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ no country information on rawContent, returning default country", buf, 0xCu);
      }
      BOOL v7 = HDClinicalGatewayDefaultCountry;
    }
    id v5 = *v7;
  }
  id v11 = v5;

  return v11;
}

- (id)FHIRVersionStringWithError:(id *)a3
{
  id v9 = 0;
  id v4 = [(HDCodableClinicalGateway *)self _stringValueForContentKey:HDClinicalGatewayContentFHIRVersionKey error:&v9];
  id v5 = v9;
  v6 = v5;
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v4;
}

- (id)FHIRVersionString
{
  id v12 = 0;
  v3 = [(HDCodableClinicalGateway *)self FHIRVersionStringWithError:&v12];
  id v4 = v12;
  id v5 = v3;
  if (!v3)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogHealthRecords;
    if (v4)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B0054(v6, (uint64_t)self, v4);
      }
    }
    else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = v6;
      v8 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      id v9 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ no FHIR version information on rawContent, returning default version", buf, 0xCu);
    }
    id v5 = @"1.0.2";
  }
  id v10 = v5;

  return v10;
}

@end