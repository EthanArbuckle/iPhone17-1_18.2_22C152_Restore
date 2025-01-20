@interface HDCodableSyncEntityVersionRange
- (BOOL)hasEntityIdentifier;
- (BOOL)hasVersionRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableEntityIdentifier)entityIdentifier;
- (HDCodableSyncVersionRange)versionRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setVersionRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSyncEntityVersionRange

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (BOOL)hasVersionRange
{
  return self->_versionRange != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncEntityVersionRange;
  v4 = [(HDCodableSyncEntityVersionRange *)&v8 description];
  v5 = [(HDCodableSyncEntityVersionRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
  {
    v5 = [(HDCodableEntityIdentifier *)entityIdentifier dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"entityIdentifier"];
  }
  versionRange = self->_versionRange;
  if (versionRange)
  {
    v7 = [(HDCodableSyncVersionRange *)versionRange dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"versionRange"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncEntityVersionRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_entityIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_versionRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_entityIdentifier)
  {
    objc_msgSend(v4, "setEntityIdentifier:");
    id v4 = v5;
  }
  if (self->_versionRange)
  {
    objc_msgSend(v5, "setVersionRange:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableEntityIdentifier *)self->_entityIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(HDCodableSyncVersionRange *)self->_versionRange copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((entityIdentifier = self->_entityIdentifier, !((unint64_t)entityIdentifier | v4[1]))
     || -[HDCodableEntityIdentifier isEqual:](entityIdentifier, "isEqual:")))
  {
    versionRange = self->_versionRange;
    if ((unint64_t)versionRange | v4[2]) {
      char v7 = -[HDCodableSyncVersionRange isEqual:](versionRange, "isEqual:");
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

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableEntityIdentifier *)self->_entityIdentifier hash];
  return [(HDCodableSyncVersionRange *)self->_versionRange hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  entityIdentifier = self->_entityIdentifier;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (entityIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableEntityIdentifier mergeFrom:](entityIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSyncEntityVersionRange setEntityIdentifier:](self, "setEntityIdentifier:");
  }
  id v4 = v9;
LABEL_7:
  versionRange = self->_versionRange;
  uint64_t v8 = v4[2];
  if (versionRange)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[HDCodableSyncVersionRange mergeFrom:](versionRange, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[HDCodableSyncEntityVersionRange setVersionRange:](self, "setVersionRange:");
  }
  id v4 = v9;
LABEL_13:
}

- (HDCodableEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (HDCodableSyncVersionRange)versionRange
{
  return self->_versionRange;
}

- (void)setVersionRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionRange, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end