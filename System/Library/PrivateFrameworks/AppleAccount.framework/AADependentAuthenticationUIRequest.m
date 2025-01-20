@interface AADependentAuthenticationUIRequest
- (AADependentAuthenticationUIRequest)initWithAltDSID:(id)a3;
- (id)urlString;
@end

@implementation AADependentAuthenticationUIRequest

- (id)urlString
{
  v2 = [MEMORY[0x1E4F4F0C8] bagForAltDSID:self->_altDSID];
  v3 = [v2 changePasswordURL];
  v4 = [v3 absoluteString];

  return v4;
}

- (AADependentAuthenticationUIRequest)initWithAltDSID:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"AARequest.m" lineNumber:1073 description:@"No altDSID passed"];
  }
  v11.receiver = self;
  v11.super_class = (Class)AADependentAuthenticationUIRequest;
  v7 = [(AADependentAuthenticationUIRequest *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_altDSID, a3);
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end