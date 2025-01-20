@interface ASCodableRelationshipStorage
- (ASCodableRelationshipContainer)legacyRelationshipContainer;
- (ASCodableRelationshipContainer)legacyRemoteRelationshipContainer;
- (ASCodableRelationshipContainer)secureCloudRelationshipContainer;
- (ASCodableRelationshipContainer)secureCloudRemoteRelationshipContainer;
- (BOOL)hasLegacyRelationshipContainer;
- (BOOL)hasLegacyRemoteRelationshipContainer;
- (BOOL)hasSecureCloudRelationshipContainer;
- (BOOL)hasSecureCloudRemoteRelationshipContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLegacyRelationshipContainer:(id)a3;
- (void)setLegacyRemoteRelationshipContainer:(id)a3;
- (void)setSecureCloudRelationshipContainer:(id)a3;
- (void)setSecureCloudRemoteRelationshipContainer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableRelationshipStorage

- (BOOL)hasLegacyRelationshipContainer
{
  return self->_legacyRelationshipContainer != 0;
}

- (BOOL)hasLegacyRemoteRelationshipContainer
{
  return self->_legacyRemoteRelationshipContainer != 0;
}

- (BOOL)hasSecureCloudRelationshipContainer
{
  return self->_secureCloudRelationshipContainer != 0;
}

- (BOOL)hasSecureCloudRemoteRelationshipContainer
{
  return self->_secureCloudRemoteRelationshipContainer != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableRelationshipStorage;
  v4 = [(ASCodableRelationshipStorage *)&v8 description];
  v5 = [(ASCodableRelationshipStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  legacyRelationshipContainer = self->_legacyRelationshipContainer;
  if (legacyRelationshipContainer)
  {
    v5 = [(ASCodableRelationshipContainer *)legacyRelationshipContainer dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"legacyRelationshipContainer"];
  }
  legacyRemoteRelationshipContainer = self->_legacyRemoteRelationshipContainer;
  if (legacyRemoteRelationshipContainer)
  {
    v7 = [(ASCodableRelationshipContainer *)legacyRemoteRelationshipContainer dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"legacyRemoteRelationshipContainer"];
  }
  secureCloudRelationshipContainer = self->_secureCloudRelationshipContainer;
  if (secureCloudRelationshipContainer)
  {
    v9 = [(ASCodableRelationshipContainer *)secureCloudRelationshipContainer dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"secureCloudRelationshipContainer"];
  }
  secureCloudRemoteRelationshipContainer = self->_secureCloudRemoteRelationshipContainer;
  if (secureCloudRemoteRelationshipContainer)
  {
    v11 = [(ASCodableRelationshipContainer *)secureCloudRemoteRelationshipContainer dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"secureCloudRemoteRelationshipContainer"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableRelationshipStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_legacyRelationshipContainer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_legacyRemoteRelationshipContainer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_secureCloudRelationshipContainer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_secureCloudRemoteRelationshipContainer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_legacyRelationshipContainer)
  {
    objc_msgSend(v4, "setLegacyRelationshipContainer:");
    id v4 = v5;
  }
  if (self->_legacyRemoteRelationshipContainer)
  {
    objc_msgSend(v5, "setLegacyRemoteRelationshipContainer:");
    id v4 = v5;
  }
  if (self->_secureCloudRelationshipContainer)
  {
    objc_msgSend(v5, "setSecureCloudRelationshipContainer:");
    id v4 = v5;
  }
  if (self->_secureCloudRemoteRelationshipContainer)
  {
    objc_msgSend(v5, "setSecureCloudRemoteRelationshipContainer:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ASCodableRelationshipContainer *)self->_legacyRelationshipContainer copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(ASCodableRelationshipContainer *)self->_legacyRemoteRelationshipContainer copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(ASCodableRelationshipContainer *)self->_secureCloudRelationshipContainer copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(ASCodableRelationshipContainer *)self->_secureCloudRemoteRelationshipContainer copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((legacyRelationshipContainer = self->_legacyRelationshipContainer,
         !((unint64_t)legacyRelationshipContainer | v4[1]))
     || -[ASCodableRelationshipContainer isEqual:](legacyRelationshipContainer, "isEqual:"))
    && ((legacyRemoteRelationshipContainer = self->_legacyRemoteRelationshipContainer,
         !((unint64_t)legacyRemoteRelationshipContainer | v4[2]))
     || -[ASCodableRelationshipContainer isEqual:](legacyRemoteRelationshipContainer, "isEqual:"))
    && ((secureCloudRelationshipContainer = self->_secureCloudRelationshipContainer,
         !((unint64_t)secureCloudRelationshipContainer | v4[3]))
     || -[ASCodableRelationshipContainer isEqual:](secureCloudRelationshipContainer, "isEqual:")))
  {
    secureCloudRemoteRelationshipContainer = self->_secureCloudRemoteRelationshipContainer;
    if ((unint64_t)secureCloudRemoteRelationshipContainer | v4[4]) {
      char v9 = -[ASCodableRelationshipContainer isEqual:](secureCloudRemoteRelationshipContainer, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASCodableRelationshipContainer *)self->_legacyRelationshipContainer hash];
  unint64_t v4 = [(ASCodableRelationshipContainer *)self->_legacyRemoteRelationshipContainer hash] ^ v3;
  unint64_t v5 = [(ASCodableRelationshipContainer *)self->_secureCloudRelationshipContainer hash];
  return v4 ^ v5 ^ [(ASCodableRelationshipContainer *)self->_secureCloudRemoteRelationshipContainer hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  legacyRelationshipContainer = self->_legacyRelationshipContainer;
  uint64_t v6 = v4[1];
  v13 = v4;
  if (legacyRelationshipContainer)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableRelationshipContainer mergeFrom:](legacyRelationshipContainer, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableRelationshipStorage setLegacyRelationshipContainer:](self, "setLegacyRelationshipContainer:");
  }
  unint64_t v4 = v13;
LABEL_7:
  legacyRemoteRelationshipContainer = self->_legacyRemoteRelationshipContainer;
  uint64_t v8 = v4[2];
  if (legacyRemoteRelationshipContainer)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ASCodableRelationshipContainer mergeFrom:](legacyRemoteRelationshipContainer, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ASCodableRelationshipStorage setLegacyRemoteRelationshipContainer:](self, "setLegacyRemoteRelationshipContainer:");
  }
  unint64_t v4 = v13;
LABEL_13:
  secureCloudRelationshipContainer = self->_secureCloudRelationshipContainer;
  uint64_t v10 = v4[3];
  if (secureCloudRelationshipContainer)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[ASCodableRelationshipContainer mergeFrom:](secureCloudRelationshipContainer, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[ASCodableRelationshipStorage setSecureCloudRelationshipContainer:](self, "setSecureCloudRelationshipContainer:");
  }
  unint64_t v4 = v13;
LABEL_19:
  secureCloudRemoteRelationshipContainer = self->_secureCloudRemoteRelationshipContainer;
  uint64_t v12 = v4[4];
  if (secureCloudRemoteRelationshipContainer)
  {
    if (v12) {
      -[ASCodableRelationshipContainer mergeFrom:](secureCloudRemoteRelationshipContainer, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ASCodableRelationshipStorage setSecureCloudRemoteRelationshipContainer:](self, "setSecureCloudRemoteRelationshipContainer:");
  }

  MEMORY[0x270F9A758]();
}

- (ASCodableRelationshipContainer)legacyRelationshipContainer
{
  return self->_legacyRelationshipContainer;
}

- (void)setLegacyRelationshipContainer:(id)a3
{
}

- (ASCodableRelationshipContainer)legacyRemoteRelationshipContainer
{
  return self->_legacyRemoteRelationshipContainer;
}

- (void)setLegacyRemoteRelationshipContainer:(id)a3
{
}

- (ASCodableRelationshipContainer)secureCloudRelationshipContainer
{
  return self->_secureCloudRelationshipContainer;
}

- (void)setSecureCloudRelationshipContainer:(id)a3
{
}

- (ASCodableRelationshipContainer)secureCloudRemoteRelationshipContainer
{
  return self->_secureCloudRemoteRelationshipContainer;
}

- (void)setSecureCloudRemoteRelationshipContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureCloudRemoteRelationshipContainer, 0);
  objc_storeStrong((id *)&self->_secureCloudRelationshipContainer, 0);
  objc_storeStrong((id *)&self->_legacyRemoteRelationshipContainer, 0);

  objc_storeStrong((id *)&self->_legacyRelationshipContainer, 0);
}

@end