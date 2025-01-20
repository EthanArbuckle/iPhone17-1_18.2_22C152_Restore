@interface IDSServerAuthenticatePhoneRequest
- (IDSPhoneUser)user;
- (IDSServerAuthenticatePhoneRequest)initWithUser:(id)a3 phoneSignature:(id)a4 certificateSigningRequest:(id)a5 pushToken:(id)a6;
- (NSData)certificateSigningRequest;
- (NSData)phoneSignature;
- (NSData)pushToken;
@end

@implementation IDSServerAuthenticatePhoneRequest

- (IDSServerAuthenticatePhoneRequest)initWithUser:(id)a3 phoneSignature:(id)a4 certificateSigningRequest:(id)a5 pushToken:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSServerAuthenticatePhoneRequest;
  v15 = [(IDSServerAuthenticatePhoneRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_user, a3);
    objc_storeStrong((id *)&v16->_phoneSignature, a4);
    objc_storeStrong((id *)&v16->_certificateSigningRequest, a5);
    objc_storeStrong((id *)&v16->_pushToken, a6);
  }

  return v16;
}

- (IDSPhoneUser)user
{
  return self->_user;
}

- (NSData)phoneSignature
{
  return self->_phoneSignature;
}

- (NSData)certificateSigningRequest
{
  return self->_certificateSigningRequest;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_certificateSigningRequest, 0);
  objc_storeStrong((id *)&self->_phoneSignature, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end