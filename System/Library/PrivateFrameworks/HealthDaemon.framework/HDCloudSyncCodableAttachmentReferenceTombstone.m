@interface HDCloudSyncCodableAttachmentReferenceTombstone
- (BOOL)hasCreationDate;
- (BOOL)hasReferenceIdentifier;
- (BOOL)hasSchemaIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)referenceIdentifier;
- (NSString)schemaIdentifier;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setSchemaIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableAttachmentReferenceTombstone

- (BOOL)hasReferenceIdentifier
{
  return self->_referenceIdentifier != 0;
}

- (BOOL)hasSchemaIdentifier
{
  return self->_schemaIdentifier != 0;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableAttachmentReferenceTombstone;
  v4 = [(HDCloudSyncCodableAttachmentReferenceTombstone *)&v8 description];
  v5 = [(HDCloudSyncCodableAttachmentReferenceTombstone *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  referenceIdentifier = self->_referenceIdentifier;
  if (referenceIdentifier) {
    [v3 setObject:referenceIdentifier forKey:@"referenceIdentifier"];
  }
  schemaIdentifier = self->_schemaIdentifier;
  if (schemaIdentifier) {
    [v4 setObject:schemaIdentifier forKey:@"schemaIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_creationDate];
    [v4 setObject:v7 forKey:@"creationDate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableAttachmentReferenceTombstoneReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_referenceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_schemaIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_referenceIdentifier)
  {
    objc_msgSend(v4, "setReferenceIdentifier:");
    id v4 = v5;
  }
  if (self->_schemaIdentifier)
  {
    objc_msgSend(v5, "setSchemaIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_referenceIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_schemaIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  referenceIdentifier = self->_referenceIdentifier;
  if ((unint64_t)referenceIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](referenceIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  schemaIdentifier = self->_schemaIdentifier;
  if ((unint64_t)schemaIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](schemaIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_creationDate == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_referenceIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_schemaIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    double creationDate = self->_creationDate;
    double v7 = -creationDate;
    if (creationDate >= 0.0) {
      double v7 = self->_creationDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[HDCloudSyncCodableAttachmentReferenceTombstone setReferenceIdentifier:](self, "setReferenceIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCloudSyncCodableAttachmentReferenceTombstone setSchemaIdentifier:](self, "setSchemaIdentifier:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[4])
  {
    self->_double creationDate = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void)setSchemaIdentifier:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);

  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
}

@end