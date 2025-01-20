@interface HKCodableSummaryData
- (BOOL)hasAudienceRawValue;
- (BOOL)hasContentData;
- (BOOL)hasDatabaseChangesQueryAnchor;
- (BOOL)hasKindRawValue;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQueryAnchor)databaseChangesQueryAnchor;
- (NSData)contentData;
- (NSString)audienceRawValue;
- (NSString)kindRawValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudienceRawValue:(id)a3;
- (void)setContentData:(id)a3;
- (void)setDatabaseChangesQueryAnchor:(id)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setKindRawValue:(id)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryData

- (BOOL)hasContentData
{
  return self->_contentData != 0;
}

- (BOOL)hasKindRawValue
{
  return self->_kindRawValue != 0;
}

- (BOOL)hasDatabaseChangesQueryAnchor
{
  return self->_databaseChangesQueryAnchor != 0;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAudienceRawValue
{
  return self->_audienceRawValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryData;
  v4 = [(HKCodableSummaryData *)&v8 description];
  v5 = [(HKCodableSummaryData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  contentData = self->_contentData;
  if (contentData) {
    [v3 setObject:contentData forKey:@"contentData"];
  }
  kindRawValue = self->_kindRawValue;
  if (kindRawValue) {
    [v4 setObject:kindRawValue forKey:@"kindRawValue"];
  }
  databaseChangesQueryAnchor = self->_databaseChangesQueryAnchor;
  if (databaseChangesQueryAnchor)
  {
    objc_super v8 = [(HKCodableQueryAnchor *)databaseChangesQueryAnchor dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"databaseChangesQueryAnchor"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
    [v4 setObject:v10 forKey:@"latestSupportedVersion"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v4 setObject:v11 forKey:@"minimumSupportedVersion"];
  }
  audienceRawValue = self->_audienceRawValue;
  if (audienceRawValue) {
    [v4 setObject:audienceRawValue forKey:@"audienceRawValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contentData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_kindRawValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_databaseChangesQueryAnchor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_audienceRawValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contentData)
  {
    objc_msgSend(v4, "setContentData:");
    id v4 = v6;
  }
  if (self->_kindRawValue)
  {
    objc_msgSend(v6, "setKindRawValue:");
    id v4 = v6;
  }
  if (self->_databaseChangesQueryAnchor)
  {
    objc_msgSend(v6, "setDatabaseChangesQueryAnchor:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_latestSupportedVersion;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_minimumSupportedVersion;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_audienceRawValue)
  {
    objc_msgSend(v6, "setAudienceRawValue:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_contentData copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_kindRawValue copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(HKCodableQueryAnchor *)self->_databaseChangesQueryAnchor copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_latestSupportedVersion;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_minimumSupportedVersion;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v13 = [(NSString *)self->_audienceRawValue copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  contentData = self->_contentData;
  if ((unint64_t)contentData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](contentData, "isEqual:")) {
      goto LABEL_20;
    }
  }
  kindRawValue = self->_kindRawValue;
  if ((unint64_t)kindRawValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](kindRawValue, "isEqual:")) {
      goto LABEL_20;
    }
  }
  databaseChangesQueryAnchor = self->_databaseChangesQueryAnchor;
  if ((unint64_t)databaseChangesQueryAnchor | *((void *)v4 + 5))
  {
    if (!-[HKCodableQueryAnchor isEqual:](databaseChangesQueryAnchor, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_latestSupportedVersion != *((void *)v4 + 1)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  audienceRawValue = self->_audienceRawValue;
  if ((unint64_t)audienceRawValue | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](audienceRawValue, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_contentData hash];
  NSUInteger v4 = [(NSString *)self->_kindRawValue hash];
  unint64_t v5 = [(HKCodableQueryAnchor *)self->_databaseChangesQueryAnchor hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_latestSupportedVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_audienceRawValue hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_audienceRawValue hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v8 = v4;
  if (v4[4])
  {
    -[HKCodableSummaryData setContentData:](self, "setContentData:");
    NSUInteger v4 = v8;
  }
  if (v4[6])
  {
    -[HKCodableSummaryData setKindRawValue:](self, "setKindRawValue:");
    NSUInteger v4 = v8;
  }
  databaseChangesQueryAnchor = self->_databaseChangesQueryAnchor;
  uint64_t v6 = v4[5];
  if (databaseChangesQueryAnchor)
  {
    if (!v6) {
      goto LABEL_11;
    }
    databaseChangesQueryAnchor = (HKCodableQueryAnchor *)-[HKCodableQueryAnchor mergeFrom:](databaseChangesQueryAnchor, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    databaseChangesQueryAnchor = (HKCodableQueryAnchor *)-[HKCodableSummaryData setDatabaseChangesQueryAnchor:](self, "setDatabaseChangesQueryAnchor:");
  }
  NSUInteger v4 = v8;
LABEL_11:
  char v7 = *((unsigned char *)v4 + 56);
  if (v7)
  {
    self->_latestSupportedVersion = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 56);
  }
  if ((v7 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (v4[3])
  {
    databaseChangesQueryAnchor = (HKCodableQueryAnchor *)-[HKCodableSummaryData setAudienceRawValue:](self, "setAudienceRawValue:");
    NSUInteger v4 = v8;
  }
  MEMORY[0x1F41817F8](databaseChangesQueryAnchor, v4);
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
}

- (NSString)kindRawValue
{
  return self->_kindRawValue;
}

- (void)setKindRawValue:(id)a3
{
}

- (HKCodableQueryAnchor)databaseChangesQueryAnchor
{
  return self->_databaseChangesQueryAnchor;
}

- (void)setDatabaseChangesQueryAnchor:(id)a3
{
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (NSString)audienceRawValue
{
  return self->_audienceRawValue;
}

- (void)setAudienceRawValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kindRawValue, 0);
  objc_storeStrong((id *)&self->_databaseChangesQueryAnchor, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->_audienceRawValue, 0);
}

@end