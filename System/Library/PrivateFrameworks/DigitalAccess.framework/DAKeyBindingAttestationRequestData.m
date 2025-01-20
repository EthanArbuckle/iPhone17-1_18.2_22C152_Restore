@interface DAKeyBindingAttestationRequestData
+ (BOOL)supportsSecureCoding;
- (DAKeyBindingAttestationRequestData)initWithCoder:(id)a3;
- (DAKeyBindingAttestationRequestData)initWithSharingSessionIdentifier:(id)a3 subCaAttestation:(id)a4 casd:(id)a5 rsaCertData:(id)a6;
- (NSData)casd;
- (NSData)rsaCertData;
- (NSData)subCaAttestation;
- (NSUUID)sharingSessionIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAKeyBindingAttestationRequestData

- (DAKeyBindingAttestationRequestData)initWithSharingSessionIdentifier:(id)a3 subCaAttestation:(id)a4 casd:(id)a5 rsaCertData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DAKeyBindingAttestationRequestData;
  v15 = [(DAKeyBindingAttestationRequestData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sharingSessionIdentifier, a3);
    objc_storeStrong((id *)&v16->_subCaAttestation, a4);
    objc_storeStrong((id *)&v16->_casd, a5);
    objc_storeStrong((id *)&v16->_rsaCertData, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAKeyBindingAttestationRequestData *)self sharingSessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sharingSessionIdentifier"];

  v6 = [(DAKeyBindingAttestationRequestData *)self subCaAttestation];
  [v4 encodeObject:v6 forKey:@"subCaAttestation"];

  v7 = [(DAKeyBindingAttestationRequestData *)self casd];
  [v4 encodeObject:v7 forKey:@"casd"];

  id v8 = [(DAKeyBindingAttestationRequestData *)self rsaCertData];
  [v4 encodeObject:v8 forKey:@"rsaCertData"];
}

- (DAKeyBindingAttestationRequestData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeyBindingAttestationRequestData;
  v5 = [(DAKeyBindingAttestationRequestData *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionIdentifier"];
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subCaAttestation"];
    subCaAttestation = v5->_subCaAttestation;
    v5->_subCaAttestation = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"casd"];
    casd = v5->_casd;
    v5->_casd = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rsaCertData"];
    rsaCertData = v5->_rsaCertData;
    v5->_rsaCertData = (NSData *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [NSString stringWithFormat:@"Sharing Session ID    : %@\n", self->_sharingSessionIdentifier];
  [v3 appendString:v4];

  v5 = [NSString stringWithFormat:@"SubCA attestation     : %@\n", self->_subCaAttestation];
  [v3 appendString:v5];

  uint64_t v6 = [NSString stringWithFormat:@"CASD                  : %@\n", self->_casd];
  [v3 appendString:v6];

  v7 = [NSString stringWithFormat:@"RSA cert data         : %@\n", self->_rsaCertData];
  [v3 appendString:v7];

  return v3;
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (NSData)subCaAttestation
{
  return self->_subCaAttestation;
}

- (NSData)casd
{
  return self->_casd;
}

- (NSData)rsaCertData
{
  return self->_rsaCertData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rsaCertData, 0);
  objc_storeStrong((id *)&self->_casd, 0);
  objc_storeStrong((id *)&self->_subCaAttestation, 0);

  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
}

@end