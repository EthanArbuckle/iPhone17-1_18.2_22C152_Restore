@interface IDSServerAuthenticatePhoneResponse
- (IDSAuthenticationCertificate)authenticationCertificate;
- (IDSPhoneUser)user;
- (IDSServerAuthenticatePhoneResponse)initWithStatus:(int64_t)a3 user:(id)a4 authenticationCertificate:(id)a5;
- (int64_t)status;
@end

@implementation IDSServerAuthenticatePhoneResponse

- (IDSServerAuthenticatePhoneResponse)initWithStatus:(int64_t)a3 user:(id)a4 authenticationCertificate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSServerAuthenticatePhoneResponse;
  v11 = [(IDSServerAuthenticatePhoneResponse *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    objc_storeStrong((id *)&v11->_user, a4);
    objc_storeStrong((id *)&v12->_authenticationCertificate, a5);
  }

  return v12;
}

- (int64_t)status
{
  return self->_status;
}

- (IDSPhoneUser)user
{
  return self->_user;
}

- (IDSAuthenticationCertificate)authenticationCertificate
{
  return self->_authenticationCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationCertificate, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end