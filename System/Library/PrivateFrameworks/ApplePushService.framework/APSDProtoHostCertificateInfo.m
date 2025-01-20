@interface APSDProtoHostCertificateInfo
+ (Class)certificatesType;
- (BOOL)hasNonce;
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)nonce;
- (NSData)signature;
- (NSMutableArray)certificates;
- (id)certificatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)certificatesCount;
- (unint64_t)hash;
- (void)addCertificates:(id)a3;
- (void)clearCertificates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setNonce:(id)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APSDProtoHostCertificateInfo

- (void)clearCertificates
{
}

- (void)addCertificates:(id)a3
{
  id v4 = a3;
  certificates = self->_certificates;
  id v8 = v4;
  if (!certificates)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_certificates;
    self->_certificates = v6;

    id v4 = v8;
    certificates = self->_certificates;
  }
  [(NSMutableArray *)certificates addObject:v4];
}

- (unint64_t)certificatesCount
{
  return (unint64_t)[(NSMutableArray *)self->_certificates count];
}

- (id)certificatesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_certificates objectAtIndex:a3];
}

+ (Class)certificatesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APSDProtoHostCertificateInfo;
  v3 = [(APSDProtoHostCertificateInfo *)&v7 description];
  id v4 = [(APSDProtoHostCertificateInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  certificates = self->_certificates;
  if (certificates) {
    [v3 setObject:certificates forKey:@"certificates"];
  }
  nonce = self->_nonce;
  if (nonce) {
    [v4 setObject:nonce forKey:@"nonce"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APSDProtoHostCertificateInfoReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_certificates;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_nonce) {
    PBDataWriterWriteDataField();
  }
  if (self->_signature) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(APSDProtoHostCertificateInfo *)self certificatesCount])
  {
    [v9 clearCertificates];
    unint64_t v4 = [(APSDProtoHostCertificateInfo *)self certificatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APSDProtoHostCertificateInfo *)self certificatesAtIndex:i];
        [v9 addCertificates:v7];
      }
    }
  }
  if (self->_nonce) {
    objc_msgSend(v9, "setNonce:");
  }
  uint64_t v8 = v9;
  if (self->_signature)
  {
    objc_msgSend(v9, "setSignature:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_certificates;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v17);
        [v5 addCertificates:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v12 = [(NSData *)self->_nonce copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(NSData *)self->_signature copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((certificates = self->_certificates, !((unint64_t)certificates | v4[1]))
     || -[NSMutableArray isEqual:](certificates, "isEqual:"))
    && ((nonce = self->_nonce, !((unint64_t)nonce | v4[2])) || -[NSData isEqual:](nonce, "isEqual:")))
  {
    signature = self->_signature;
    if ((unint64_t)signature | v4[3]) {
      unsigned __int8 v8 = -[NSData isEqual:](signature, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_certificates hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_nonce hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_signature hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[APSDProtoHostCertificateInfo addCertificates:](self, "addCertificates:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[APSDProtoHostCertificateInfo setNonce:](self, "setNonce:");
  }
  if (v4[3]) {
    -[APSDProtoHostCertificateInfo setSignature:](self, "setSignature:");
  }
}

- (NSMutableArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
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
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end