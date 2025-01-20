@interface FMDBAAAttestation
+ (BOOL)supportsSecureCoding;
- (FMDBAAAttestation)initWithAttestation:(id)a3 signature:(id)a4;
- (FMDBAAAttestation)initWithCoder:(id)a3;
- (NSData)attestation;
- (NSData)signature;
- (void)encodeWithCoder:(id)a3;
- (void)setAttestation:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation FMDBAAAttestation

- (FMDBAAAttestation)initWithAttestation:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDBAAAttestation;
  v8 = [(FMDBAAAttestation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(FMDBAAAttestation *)v8 setAttestation:v6];
    [(FMDBAAAttestation *)v9 setSignature:v7];
  }

  return v9;
}

- (FMDBAAAttestation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector("attestation");
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector("signature");
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  objc_super v11 = [(FMDBAAAttestation *)self initWithAttestation:v7 signature:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMDBAAAttestation *)self attestation];
  id v6 = NSStringFromSelector("attestation");
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(FMDBAAAttestation *)self signature];
  id v7 = NSStringFromSelector("signature");
  [v4 encodeObject:v8 forKey:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);

  objc_storeStrong((id *)&self->_attestation, 0);
}

@end