@interface BMPBMailContentEventFilteringSubset
- (BOOL)hasDomainId;
- (BOOL)hasPersonaId;
- (BOOL)hasUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)uniqueId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomainId:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBMailContentEventFilteringSubset

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBMailContentEventFilteringSubset;
  v4 = [(BMPBMailContentEventFilteringSubset *)&v8 description];
  v5 = [(BMPBMailContentEventFilteringSubset *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  domainId = self->_domainId;
  if (domainId) {
    [v4 setObject:domainId forKey:@"domainId"];
  }
  personaId = self->_personaId;
  if (personaId) {
    [v4 setObject:personaId forKey:@"personaId"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMailContentEventFilteringSubsetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_domainId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v5;
  }
  if (self->_domainId)
  {
    objc_msgSend(v5, "setDomainId:");
    id v4 = v5;
  }
  if (self->_personaId)
  {
    objc_msgSend(v5, "setPersonaId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_domainId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_personaId copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uniqueId = self->_uniqueId, !((unint64_t)uniqueId | v4[3]))
     || -[NSString isEqual:](uniqueId, "isEqual:"))
    && ((domainId = self->_domainId, !((unint64_t)domainId | v4[1]))
     || -[NSString isEqual:](domainId, "isEqual:")))
  {
    personaId = self->_personaId;
    if ((unint64_t)personaId | v4[2]) {
      char v8 = -[NSString isEqual:](personaId, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  NSUInteger v4 = [(NSString *)self->_domainId hash] ^ v3;
  return v4 ^ [(NSString *)self->_personaId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[BMPBMailContentEventFilteringSubset setUniqueId:](self, "setUniqueId:");
  }
  if (v4[1]) {
    -[BMPBMailContentEventFilteringSubset setDomainId:](self, "setDomainId:");
  }
  if (v4[2]) {
    -[BMPBMailContentEventFilteringSubset setPersonaId:](self, "setPersonaId:");
  }
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);

  objc_storeStrong((id *)&self->_domainId, 0);
}

@end