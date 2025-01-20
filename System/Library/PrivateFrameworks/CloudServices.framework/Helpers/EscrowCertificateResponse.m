@interface EscrowCertificateResponse
- (NSData)cert;
- (NSString)dsid;
- (id)description;
- (int64_t)clubID;
@end

@implementation EscrowCertificateResponse

- (NSData)cert
{
  v2 = [(LakituResponse *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"clubCert"];

  if (v3) {
    id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];
  }
  else {
    id v4 = 0;
  }

  return (NSData *)v4;
}

- (NSString)dsid
{
  v2 = [(LakituResponse *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"dsid"];

  return (NSString *)v3;
}

- (id)description
{
  CFDataRef v3 = [(EscrowCertificateResponse *)self cert];
  if (v3 && (id v4 = SecCertificateCreateWithData(0, v3)) != 0)
  {
    v5 = v4;
    CFDataRef v6 = SecCertificateCopySerialNumberData(v4, 0);
    v7 = (void *)SecCertificateCopySHA256Digest();
    CFRelease(v5);
  }
  else
  {
    CFDataRef v6 = 0;
    v7 = 0;
  }
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [(__CFData *)v6 debugDescription];
  v11 = [v7 debugDescription];
  v12 = [(EscrowCertificateResponse *)self dsid];
  v13 = +[NSString stringWithFormat:@"<%@: %p>{serial = %@, digest = %@, dsid = %@}", v9, self, v10, v11, v12];

  return v13;
}

- (int64_t)clubID
{
  return self->_clubID;
}

@end