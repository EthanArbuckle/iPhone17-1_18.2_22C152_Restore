@interface IDSAuthenticationCertificateSignature
- (IDSAuthenticationCertificate)authenticationCertificate;
- (IDSAuthenticationCertificateSignature)initWithSubscriptionIdentifier:(id)a3 authenticationCertificate:(id)a4 signature:(id)a5 nonce:(id)a6;
- (IDSAuthenticationCertificateSignature)initWithSubscriptionIdentifier:(id)a3 authenticationCertificate:(id)a4 signature:(id)a5 serverVerifiableEncoding:(id)a6;
- (NSData)signature;
- (NSString)serverVerifiableEncoding;
- (NSString)subscriptionIdentifier;
- (id)description;
@end

@implementation IDSAuthenticationCertificateSignature

- (IDSAuthenticationCertificateSignature)initWithSubscriptionIdentifier:(id)a3 authenticationCertificate:(id)a4 signature:(id)a5 nonce:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v15 = objc_msgSend_base64EncodedStringWithOptions_(a6, v13, 0, v14);
  v18 = objc_msgSend_base64EncodedStringWithOptions_(v10, v16, 0, v17);
  v22 = objc_msgSend_dataRepresentation(v11, v19, v20, v21);
  v25 = objc_msgSend_base64EncodedStringWithOptions_(v22, v23, 0, v24);

  v28 = objc_msgSend_stringWithFormat_(NSString, v26, @"%ld:%@:%@:%@", v27, 0, v25, v15, v18);
  v31 = (IDSAuthenticationCertificateSignature *)objc_msgSend_initWithSubscriptionIdentifier_authenticationCertificate_signature_serverVerifiableEncoding_(self, v29, (uint64_t)v12, v30, v11, v10, v28);

  return v31;
}

- (IDSAuthenticationCertificateSignature)initWithSubscriptionIdentifier:(id)a3 authenticationCertificate:(id)a4 signature:(id)a5 serverVerifiableEncoding:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSAuthenticationCertificateSignature;
  v15 = [(IDSAuthenticationCertificateSignature *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_subscriptionIdentifier, a3);
    objc_storeStrong((id *)&v16->_authenticationCertificate, a4);
    objc_storeStrong((id *)&v16->_signature, a5);
    objc_storeStrong((id *)&v16->_serverVerifiableEncoding, a6);
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_subscriptionIdentifier(self, v5, v6, v7);
  v9 = NSNumber;
  id v13 = objc_msgSend_serverVerifiableEncoding(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(v9, v18, v17, v19);
  v23 = objc_msgSend_stringWithFormat_(v3, v21, @"<%@: %p subscriptionIdentifier: %@, serverVerifiableEncodingHash: %@>", v22, v4, self, v8, v20);

  return v23;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (IDSAuthenticationCertificate)authenticationCertificate
{
  return self->_authenticationCertificate;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)serverVerifiableEncoding
{
  return self->_serverVerifiableEncoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverVerifiableEncoding, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticationCertificate, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end