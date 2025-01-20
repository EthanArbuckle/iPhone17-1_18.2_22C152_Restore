@interface AABeneficiaryClaimUIRequest
- (AABeneficiaryClaimUIRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4 claimCode:(id)a5;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AABeneficiaryClaimUIRequest

- (AABeneficiaryClaimUIRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4 claimCode:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AABeneficiaryClaimUIRequest;
  v10 = [(AAAppleIDSettingsRequest *)&v13 initWithGrandSlamAccount:a3 accountStore:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_claimCode, a5);
  }

  return v11;
}

- (id)urlString
{
  v2 = (void *)MEMORY[0x1E4F4F0C8];
  v3 = [(AAAppleIDSettingsRequest *)self grandSlamAccount];
  v4 = objc_msgSend(v3, "aida_alternateDSID");
  v5 = [v2 bagForAltDSID:v4];
  v6 = [v5 urlAtKey:@"startBeneficiaryClaim"];
  v7 = [v6 absoluteString];

  return v7;
}

- (id)urlRequest
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)AABeneficiaryClaimUIRequest;
  v3 = [(AAAppleIDSettingsRequest *)&v8 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  claimCode = self->_claimCode;
  if (claimCode)
  {
    id v9 = @"claimCode";
    v10[0] = claimCode;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    objc_msgSend(v4, "aa_setBodyWithParameters:", v6);
  }
  [v4 setHTTPMethod:@"POST"];
  [v4 addValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];

  return v4;
}

- (void).cxx_destruct
{
}

@end