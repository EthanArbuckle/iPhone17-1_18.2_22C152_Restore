@interface DCCredentialPayload
+ (BOOL)supportsSecureCoding;
- (DCCredentialPayload)initWithCoder:(id)a3;
- (NSData)payloadData;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSDate)validFrom;
- (NSDate)validUntil;
- (NSDictionary)elementIdentifiersByNamespace;
- (NSString)docType;
- (NSString)issuingJurisdiction;
- (NSString)region;
- (unint64_t)format;
- (unint64_t)protectionType;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDocType:(id)a3;
- (void)setElementIdentifiersByNamespace:(id)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setIssuingJurisdiction:(id)a3;
- (void)setPayloadData:(id)a3;
- (void)setProtectionType:(unint64_t)a3;
- (void)setRegion:(id)a3;
- (void)setUpdatedAt:(id)a3;
- (void)setValidFrom:(id)a3;
- (void)setValidUntil:(id)a3;
@end

@implementation DCCredentialPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DCCredentialPayload *)self payloadData];
  [v4 encodeObject:v5 forKey:0x26C59B0E0];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DCCredentialPayload format](self, "format"), 0x26C59B0C0);
  objc_msgSend(v4, "encodeInteger:forKey:", -[DCCredentialPayload protectionType](self, "protectionType"), 0x26C59B120);
  v6 = [(DCCredentialPayload *)self docType];
  [v4 encodeObject:v6 forKey:0x26C59B100];

  v7 = [(DCCredentialPayload *)self createdAt];
  [v4 encodeObject:v7 forKey:0x26C59B080];

  v8 = [(DCCredentialPayload *)self updatedAt];
  [v4 encodeObject:v8 forKey:0x26C59B0A0];

  v9 = [(DCCredentialPayload *)self validFrom];
  [v4 encodeObject:v9 forKey:0x26C59B3E0];

  v10 = [(DCCredentialPayload *)self validUntil];
  [v4 encodeObject:v10 forKey:0x26C59B400];

  id v11 = [(DCCredentialPayload *)self elementIdentifiersByNamespace];
  [v4 encodeObject:v11 forKey:0x26C59B420];
}

- (DCCredentialPayload)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)DCCredentialPayload;
  id v3 = a3;
  id v4 = [(DCCredentialPayload *)&v17 init];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B0E0];
  [(DCCredentialPayload *)v4 setPayloadData:v5];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B100];
  [(DCCredentialPayload *)v4 setDocType:v6];

  -[DCCredentialPayload setFormat:](v4, "setFormat:", [v3 decodeIntegerForKey:0x26C59B0C0]);
  -[DCCredentialPayload setProtectionType:](v4, "setProtectionType:", [v3 decodeIntegerForKey:0x26C59B120]);
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B080];
  [(DCCredentialPayload *)v4 setCreatedAt:v7];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B0A0];
  [(DCCredentialPayload *)v4 setUpdatedAt:v8];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B3E0];
  [(DCCredentialPayload *)v4 setValidFrom:v9];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B400];
  [(DCCredentialPayload *)v4 setValidUntil:v10];

  id v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:0x26C59B420];

  [(DCCredentialPayload *)v4 setElementIdentifiersByNamespace:v15];
  return v4;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (unint64_t)protectionType
{
  return self->_protectionType;
}

- (void)setProtectionType:(unint64_t)a3
{
  self->_protectionType = a3;
}

- (NSString)docType
{
  return self->_docType;
}

- (void)setDocType:(id)a3
{
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSDate)validFrom
{
  return self->_validFrom;
}

- (void)setValidFrom:(id)a3
{
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
}

- (NSDictionary)elementIdentifiersByNamespace
{
  return self->_elementIdentifiersByNamespace;
}

- (void)setElementIdentifiersByNamespace:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)issuingJurisdiction
{
  return self->_issuingJurisdiction;
}

- (void)setIssuingJurisdiction:(id)a3
{
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_issuingJurisdiction, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_elementIdentifiersByNamespace, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validFrom, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);

  objc_storeStrong((id *)&self->_docType, 0);
}

@end