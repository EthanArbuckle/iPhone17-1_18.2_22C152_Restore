@interface _DPBAASignature
+ (id)signatureWithDeviceSignature:(id)a3 leafCertificate:(id)a4 intermediateCertificate:(id)a5;
- (NSData)intermediateCertificate;
- (NSData)leafCertificate;
- (NSData)signature;
- (_DPBAASignature)initWithDeviceSignature:(id)a3 leafCertificate:(id)a4 intermediateCertificate:(id)a5;
@end

@implementation _DPBAASignature

- (_DPBAASignature)initWithDeviceSignature:(id)a3 leafCertificate:(id)a4 intermediateCertificate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_DPBAASignature;
  v11 = [(_DPBAASignature *)&v20 init];
  if (!v11) {
    goto LABEL_5;
  }
  v12 = (NSData *)[v8 copy];
  signature = v11->_signature;
  v11->_signature = v12;

  v14 = (NSData *)[v9 copy];
  leafCertificate = v11->_leafCertificate;
  v11->_leafCertificate = v14;

  v16 = (NSData *)[v10 copy];
  intermediateCertificate = v11->_intermediateCertificate;
  v11->_intermediateCertificate = v16;

  if (!v11->_signature) {
    goto LABEL_6;
  }
  if (v11->_leafCertificate && v11->_intermediateCertificate) {
LABEL_5:
  }
    v18 = v11;
  else {
LABEL_6:
  }
    v18 = 0;

  return v18;
}

+ (id)signatureWithDeviceSignature:(id)a3 leafCertificate:(id)a4 intermediateCertificate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithDeviceSignature:v9 leafCertificate:v8 intermediateCertificate:v7];

  return v10;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)leafCertificate
{
  return self->_leafCertificate;
}

- (NSData)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_leafCertificate, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end