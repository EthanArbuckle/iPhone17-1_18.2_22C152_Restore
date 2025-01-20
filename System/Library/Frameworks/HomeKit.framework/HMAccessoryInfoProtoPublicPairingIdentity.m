@interface HMAccessoryInfoProtoPublicPairingIdentity
- (BOOL)hasIdentifier;
- (BOOL)hasPublicPairingKeyData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)publicPairingKeyData;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPublicPairingKeyData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoPublicPairingIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicPairingKeyData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setPublicPairingKeyData:(id)a3
{
}

- (NSData)publicPairingKeyData
{
  return self->_publicPairingKeyData;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[HMAccessoryInfoProtoPublicPairingIdentity setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[HMAccessoryInfoProtoPublicPairingIdentity setPublicPairingKeyData:](self, "setPublicPairingKeyData:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSData *)self->_publicPairingKeyData hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    publicPairingKeyData = self->_publicPairingKeyData;
    if ((unint64_t)publicPairingKeyData | v4[2]) {
      char v7 = -[NSData isEqual:](publicPairingKeyData, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_publicPairingKeyData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_publicPairingKeyData)
  {
    objc_msgSend(v5, "setPublicPairingKeyData:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_publicPairingKeyData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoPublicPairingIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  publicPairingKeyData = self->_publicPairingKeyData;
  if (publicPairingKeyData) {
    [v4 setObject:publicPairingKeyData forKey:@"publicPairingKeyData"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoPublicPairingIdentity;
  id v4 = [(HMAccessoryInfoProtoPublicPairingIdentity *)&v8 description];
  id v5 = [(HMAccessoryInfoProtoPublicPairingIdentity *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPublicPairingKeyData
{
  return self->_publicPairingKeyData != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

@end