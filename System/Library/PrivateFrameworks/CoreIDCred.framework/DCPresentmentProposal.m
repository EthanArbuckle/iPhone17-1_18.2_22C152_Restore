@interface DCPresentmentProposal
+ (BOOL)supportsSecureCoding;
- (DCPresentmentProposal)initWithCoder:(id)a3;
- (DCPresentmentProposal)initWithCredentialIdentifier:(id)a3 presentmentKeyIdentifier:(id)a4 presentmentPublicKey:(id)a5 partition:(id)a6 docType:(id)a7 elements:(id)a8 authACL:(id)a9 readerAuthCertificateData:(id)a10 readerMetadata:(id)a11 readerAnalytics:(id)a12 region:(id)a13 issuingJurisdiction:(id)a14;
- (DCPresentmentProposalReaderAnalytics)readerAnalytics;
- (DCPresentmentProposalReaderMetadata)readerMetadata;
- (NSData)authACL;
- (NSData)presentmentPublicKey;
- (NSData)readerAuthCertificateData;
- (NSDictionary)elements;
- (NSString)credentialIdentifier;
- (NSString)docType;
- (NSString)issuingJurisdiction;
- (NSString)partition;
- (NSString)presentmentKeyIdentifier;
- (NSString)readerIdentifier;
- (NSString)readerOrganization;
- (NSString)readerOrganizationalUnit;
- (NSString)region;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCPresentmentProposal

- (DCPresentmentProposal)initWithCredentialIdentifier:(id)a3 presentmentKeyIdentifier:(id)a4 presentmentPublicKey:(id)a5 partition:(id)a6 docType:(id)a7 elements:(id)a8 authACL:(id)a9 readerAuthCertificateData:(id)a10 readerMetadata:(id)a11 readerAnalytics:(id)a12 region:(id)a13 issuingJurisdiction:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v58 = a6;
  id v57 = a7;
  id v56 = a8;
  v22 = v20;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  v59.receiver = self;
  v59.super_class = (Class)DCPresentmentProposal;
  v29 = [(DCPresentmentProposal *)&v59 init];
  if (v29)
  {
    uint64_t v30 = [v19 copy];
    credentialIdentifier = v29->_credentialIdentifier;
    v29->_credentialIdentifier = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    presentmentKeyIdentifier = v29->_presentmentKeyIdentifier;
    v29->_presentmentKeyIdentifier = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    presentmentPublicKey = v29->_presentmentPublicKey;
    v29->_presentmentPublicKey = (NSData *)v34;

    uint64_t v36 = [v58 copy];
    partition = v29->_partition;
    v29->_partition = (NSString *)v36;

    uint64_t v38 = [v57 copy];
    docType = v29->_docType;
    v29->_docType = (NSString *)v38;

    uint64_t v40 = [v56 copy];
    elements = v29->_elements;
    v29->_elements = (NSDictionary *)v40;

    uint64_t v42 = [v23 copy];
    authACL = v29->_authACL;
    v29->_authACL = (NSData *)v42;

    uint64_t v44 = [v24 copy];
    readerAuthCertificateData = v29->_readerAuthCertificateData;
    v29->_readerAuthCertificateData = (NSData *)v44;

    uint64_t v46 = [v25 copy];
    readerMetadata = v29->_readerMetadata;
    v29->_readerMetadata = (DCPresentmentProposalReaderMetadata *)v46;

    uint64_t v48 = [v26 copy];
    readerAnalytics = v29->_readerAnalytics;
    v29->_readerAnalytics = (DCPresentmentProposalReaderAnalytics *)v48;

    uint64_t v50 = [v27 copy];
    region = v29->_region;
    v29->_region = (NSString *)v50;

    uint64_t v52 = [v28 copy];
    issuingJurisdiction = v29->_issuingJurisdiction;
    v29->_issuingJurisdiction = (NSString *)v52;
  }
  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DCPresentmentProposal *)self credentialIdentifier];
  [v4 encodeObject:v5 forKey:0x26C59B000];

  v6 = [(DCPresentmentProposal *)self presentmentKeyIdentifier];
  [v4 encodeObject:v6 forKey:0x26C59B360];

  v7 = [(DCPresentmentProposal *)self presentmentPublicKey];
  [v4 encodeObject:v7 forKey:0x26C59B380];

  v8 = [(DCPresentmentProposal *)self partition];
  [v4 encodeObject:v8 forKey:0x26C59B020];

  v9 = [(DCPresentmentProposal *)self docType];
  [v4 encodeObject:v9 forKey:0x26C59B100];

  v10 = [(DCPresentmentProposal *)self elements];
  [v4 encodeObject:v10 forKey:0x26C59B7E0];

  v11 = [(DCPresentmentProposal *)self authACL];
  [v4 encodeObject:v11 forKey:0x26C59B760];

  v12 = [(DCPresentmentProposal *)self readerAuthCertificateData];
  [v4 encodeObject:v12 forKey:0x26C59B780];

  v13 = [(DCPresentmentProposal *)self readerMetadata];
  [v4 encodeObject:v13 forKey:0x26C59B7A0];

  v14 = [(DCPresentmentProposal *)self readerAnalytics];
  [v4 encodeObject:v14 forKey:0x26C59B7C0];

  v15 = [(DCPresentmentProposal *)self region];
  [v4 encodeObject:v15 forKey:0x26C59B540];

  id v16 = [(DCPresentmentProposal *)self issuingJurisdiction];
  [v4 encodeObject:v16 forKey:0x26C59B560];
}

- (DCPresentmentProposal)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)DCPresentmentProposal;
  v5 = [(DCPresentmentProposal *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B000];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B360];
    presentmentKeyIdentifier = v5->_presentmentKeyIdentifier;
    v5->_presentmentKeyIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B380];
    presentmentPublicKey = v5->_presentmentPublicKey;
    v5->_presentmentPublicKey = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B020];
    partition = v5->_partition;
    v5->_partition = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B100];
    docType = v5->_docType;
    v5->_docType = (NSString *)v14;

    id v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v20 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:0x26C59B7E0];
    elements = v5->_elements;
    v5->_elements = (NSDictionary *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B780];
    readerAuthCertificateData = v5->_readerAuthCertificateData;
    v5->_readerAuthCertificateData = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B760];
    authACL = v5->_authACL;
    v5->_authACL = (NSData *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B7A0];
    readerMetadata = v5->_readerMetadata;
    v5->_readerMetadata = (DCPresentmentProposalReaderMetadata *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B7C0];
    readerAnalytics = v5->_readerAnalytics;
    v5->_readerAnalytics = (DCPresentmentProposalReaderAnalytics *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B540];
    region = v5->_region;
    v5->_region = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B560];
    issuingJurisdiction = v5->_issuingJurisdiction;
    v5->_issuingJurisdiction = (NSString *)v33;
  }
  return v5;
}

- (id)description
{
  id v16 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v3);
  uint64_t v14 = [(DCPresentmentProposal *)self credentialIdentifier];
  id v4 = [(DCPresentmentProposal *)self presentmentKeyIdentifier];
  v5 = [(DCPresentmentProposal *)self partition];
  uint64_t v6 = [(DCPresentmentProposal *)self docType];
  v7 = [(DCPresentmentProposal *)self elements];
  uint64_t v8 = [(DCPresentmentProposal *)self readerMetadata];
  v9 = [(DCPresentmentProposal *)self readerAnalytics];
  uint64_t v10 = [(DCPresentmentProposal *)self region];
  v11 = [(DCPresentmentProposal *)self issuingJurisdiction];
  objc_msgSend(v16, "stringWithFormat:", @"<%@ %p; credentialIdentifier = %@; presentmentKeyIdentifier = %@; partition = %@; docType = %@; elements = %@; readerMetadata = %@; readerAnalytics = %@; region = %@; issuingJurisdiction = %@>",
    v15,
    self,
    v14,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  uint64_t v12 = v11);

  return v12;
}

- (NSString)readerIdentifier
{
  v2 = [(DCPresentmentProposal *)self readerMetadata];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)readerOrganization
{
  v2 = [(DCPresentmentProposal *)self readerMetadata];
  v3 = [v2 organization];

  return (NSString *)v3;
}

- (NSString)readerOrganizationalUnit
{
  v2 = [(DCPresentmentProposal *)self readerMetadata];
  v3 = [v2 organizationalUnit];

  return (NSString *)v3;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (NSString)presentmentKeyIdentifier
{
  return self->_presentmentKeyIdentifier;
}

- (NSData)presentmentPublicKey
{
  return self->_presentmentPublicKey;
}

- (NSString)partition
{
  return self->_partition;
}

- (NSString)docType
{
  return self->_docType;
}

- (NSDictionary)elements
{
  return self->_elements;
}

- (NSData)authACL
{
  return self->_authACL;
}

- (NSData)readerAuthCertificateData
{
  return self->_readerAuthCertificateData;
}

- (NSString)region
{
  return self->_region;
}

- (NSString)issuingJurisdiction
{
  return self->_issuingJurisdiction;
}

- (DCPresentmentProposalReaderMetadata)readerMetadata
{
  return self->_readerMetadata;
}

- (DCPresentmentProposalReaderAnalytics)readerAnalytics
{
  return self->_readerAnalytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerAnalytics, 0);
  objc_storeStrong((id *)&self->_readerMetadata, 0);
  objc_storeStrong((id *)&self->_issuingJurisdiction, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_readerAuthCertificateData, 0);
  objc_storeStrong((id *)&self->_authACL, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_docType, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_presentmentPublicKey, 0);
  objc_storeStrong((id *)&self->_presentmentKeyIdentifier, 0);

  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end