@interface HDFHIRAuthResponse
- (id)createCredentialWithIdentifier:(id)a3 requestedScope:(id)a4 error:(id *)a5;
@end

@implementation HDFHIRAuthResponse

- (id)createCredentialWithIdentifier:(id)a3 requestedScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v8 = +[NSUUID UUID];
  }
  v10 = [HDFHIRCredential alloc];
  v11 = [(HDFHIRAuthResponse *)self expiration];
  v12 = [(HDFHIRAuthResponse *)self scope];
  v13 = [(HDFHIRAuthResponse *)self patientID];
  v14 = [(HDFHIRCredential *)v10 initWithIdentifier:v8 requestedScopeString:v9 expiration:v11 scopeString:v12 patientID:v13];

  v15 = [(HDFHIRAuthResponse *)self accessToken];
  LODWORD(v12) = [(HDFHIRCredential *)v14 storeAccessToken:v15 error:a5];

  if (v12)
  {
    v16 = [(HDFHIRAuthResponse *)self refreshToken];
    unsigned __int8 v17 = [(HDFHIRCredential *)v14 storeRefreshToken:v16 error:a5];

    if (v17)
    {
      v18 = v14;
      goto LABEL_11;
    }
    id v23 = 0;
    unsigned __int8 v19 = [(HDFHIRCredential *)v14 storeAccessToken:0 error:&v23];
    id v20 = v23;
    if ((v19 & 1) == 0)
    {
      _HKInitializeLogging();
      v21 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AAD30((uint64_t)v20, v21);
      }
    }
  }
  v18 = 0;
LABEL_11:

  return v18;
}

@end