@interface HKFHIRCredential
- (HKFHIRCredential)credentialWithPopulatedAccessTokenWithError:(id *)a3;
@end

@implementation HKFHIRCredential

- (HKFHIRCredential)credentialWithPopulatedAccessTokenWithError:(id *)a3
{
  v5 = [(HKFHIRCredential *)self accessToken];

  if (v5)
  {
    v6 = [(HKFHIRCredential *)self refreshToken];

    if (!v6)
    {
      _HKInitializeLogging();
      v7 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = [(HKFHIRCredential *)self debugDescription];
        int v12 = 138543362;
        v13 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ no refresh token is present, will not be able to refresh the access token", (uint8_t *)&v12, 0xCu);
      }
    }
    v10 = self;
  }
  else
  {
    +[NSError hk_assignError:a3 code:118 description:@"credential does not have an access token"];
    v10 = 0;
  }

  return v10;
}

@end