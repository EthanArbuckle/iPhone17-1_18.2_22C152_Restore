@interface IDSProtoKeyTransparencyTrustedServiceSignature
- (BOOL)hasServiceIdentifier;
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyTrustedServiceSignature

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IDSProtoKeyTransparencyTrustedServiceSignature;
  v3 = [(IDSProtoKeyTransparencyTrustedServiceSignature *)&v7 description];
  v4 = [(IDSProtoKeyTransparencyTrustedServiceSignature *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"service_identifier"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyTrustedServiceSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceIdentifier)
  {
    objc_msgSend(v4, "setServiceIdentifier:");
    id v4 = v5;
  }
  if (self->_signature)
  {
    objc_msgSend(v5, "setSignature:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSData *)self->_signature copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((serviceIdentifier = self->_serviceIdentifier, !((unint64_t)serviceIdentifier | v4[1]))
     || -[NSString isEqual:](serviceIdentifier, "isEqual:")))
  {
    signature = self->_signature;
    if ((unint64_t)signature | v4[2]) {
      unsigned __int8 v7 = -[NSData isEqual:](signature, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceIdentifier hash];
  return (unint64_t)[(NSData *)self->_signature hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[IDSProtoKeyTransparencyTrustedServiceSignature setServiceIdentifier:](self, "setServiceIdentifier:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[IDSProtoKeyTransparencyTrustedServiceSignature setSignature:](self, "setSignature:");
    id v4 = v5;
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
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

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end