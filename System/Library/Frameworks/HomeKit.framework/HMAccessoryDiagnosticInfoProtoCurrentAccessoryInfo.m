@interface HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo
- (BOOL)hasPublicPairingIdentity;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMAccessoryInfoProtoPublicPairingIdentity)publicPairingIdentity;
- (NSString)uuidString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPublicPairingIdentity:(id)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);

  objc_storeStrong((id *)&self->_publicPairingIdentity, 0);
}

- (void)setPublicPairingIdentity:(id)a3
{
}

- (HMAccessoryInfoProtoPublicPairingIdentity)publicPairingIdentity
{
  return self->_publicPairingIdentity;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo setUuidString:](self, "setUuidString:");
    v4 = v7;
  }
  publicPairingIdentity = self->_publicPairingIdentity;
  uint64_t v6 = v4[1];
  if (publicPairingIdentity)
  {
    if (!v6) {
      goto LABEL_9;
    }
    publicPairingIdentity = (HMAccessoryInfoProtoPublicPairingIdentity *)-[HMAccessoryInfoProtoPublicPairingIdentity mergeFrom:](publicPairingIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    publicPairingIdentity = (HMAccessoryInfoProtoPublicPairingIdentity *)-[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo setPublicPairingIdentity:](self, "setPublicPairingIdentity:");
  }
  v4 = v7;
LABEL_9:

  MEMORY[0x1F41817F8](publicPairingIdentity, v4);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  return [(HMAccessoryInfoProtoPublicPairingIdentity *)self->_publicPairingIdentity hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuidString = self->_uuidString, !((unint64_t)uuidString | v4[2]))
     || -[NSString isEqual:](uuidString, "isEqual:")))
  {
    publicPairingIdentity = self->_publicPairingIdentity;
    if ((unint64_t)publicPairingIdentity | v4[1]) {
      char v7 = -[HMAccessoryInfoProtoPublicPairingIdentity isEqual:](publicPairingIdentity, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HMAccessoryInfoProtoPublicPairingIdentity *)self->_publicPairingIdentity copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidString)
  {
    objc_msgSend(v4, "setUuidString:");
    id v4 = v5;
  }
  if (self->_publicPairingIdentity)
  {
    objc_msgSend(v5, "setPublicPairingIdentity:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_publicPairingIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  publicPairingIdentity = self->_publicPairingIdentity;
  if (publicPairingIdentity)
  {
    char v7 = [(HMAccessoryInfoProtoPublicPairingIdentity *)publicPairingIdentity dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"publicPairingIdentity"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *)&v8 description];
  id v5 = [(HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPublicPairingIdentity
{
  return self->_publicPairingIdentity != 0;
}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

@end