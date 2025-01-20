@interface HKCodableHealthRecordsProvider
- (BOOL)hasProviderLogo;
- (BOOL)hasProviderName;
- (BOOL)hasProviderURI;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)providerLogo;
- (NSString)providerName;
- (NSString)providerURI;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProviderLogo:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setProviderURI:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHealthRecordsProvider

- (BOOL)hasProviderName
{
  return self->_providerName != 0;
}

- (BOOL)hasProviderURI
{
  return self->_providerURI != 0;
}

- (BOOL)hasProviderLogo
{
  return self->_providerLogo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableHealthRecordsProvider;
  v4 = [(HKCodableHealthRecordsProvider *)&v8 description];
  v5 = [(HKCodableHealthRecordsProvider *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  providerName = self->_providerName;
  if (providerName) {
    [v3 setObject:providerName forKey:@"providerName"];
  }
  providerURI = self->_providerURI;
  if (providerURI) {
    [v4 setObject:providerURI forKey:@"providerURI"];
  }
  providerLogo = self->_providerLogo;
  if (providerLogo) {
    [v4 setObject:providerLogo forKey:@"providerLogo"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsProviderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_providerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_providerURI)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_providerLogo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_providerName)
  {
    objc_msgSend(v4, "setProviderName:");
    id v4 = v5;
  }
  if (self->_providerURI)
  {
    objc_msgSend(v5, "setProviderURI:");
    id v4 = v5;
  }
  if (self->_providerLogo)
  {
    objc_msgSend(v5, "setProviderLogo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_providerName copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_providerURI copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_providerLogo copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((providerName = self->_providerName, !((unint64_t)providerName | v4[2]))
     || -[NSString isEqual:](providerName, "isEqual:"))
    && ((providerURI = self->_providerURI, !((unint64_t)providerURI | v4[3]))
     || -[NSString isEqual:](providerURI, "isEqual:")))
  {
    providerLogo = self->_providerLogo;
    if ((unint64_t)providerLogo | v4[1]) {
      char v8 = -[NSData isEqual:](providerLogo, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_providerName hash];
  NSUInteger v4 = [(NSString *)self->_providerURI hash] ^ v3;
  return v4 ^ [(NSData *)self->_providerLogo hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[HKCodableHealthRecordsProvider setProviderName:](self, "setProviderName:");
  }
  if (v4[3]) {
    -[HKCodableHealthRecordsProvider setProviderURI:](self, "setProviderURI:");
  }
  if (v4[1]) {
    -[HKCodableHealthRecordsProvider setProviderLogo:](self, "setProviderLogo:");
  }
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSString)providerURI
{
  return self->_providerURI;
}

- (void)setProviderURI:(id)a3
{
}

- (NSData)providerLogo
{
  return self->_providerLogo;
}

- (void)setProviderLogo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerURI, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerLogo, 0);
}

@end