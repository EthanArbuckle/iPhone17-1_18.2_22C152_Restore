@interface HKCodableSummaryCurrentValue
- (BOOL)hasKindRawValue;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMetadataDictionary;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)hasQueryConfigurationData;
- (BOOL)hasSupplementaryValue;
- (BOOL)hasValueData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableMetadataDictionary)metadataDictionary;
- (HKCodableSummarySupplementaryValue)supplementaryValue;
- (NSData)queryConfigurationData;
- (NSData)valueData;
- (NSString)kindRawValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setKindRawValue:(id)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setQueryConfigurationData:(id)a3;
- (void)setSupplementaryValue:(id)a3;
- (void)setValueData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryCurrentValue

- (BOOL)hasValueData
{
  return self->_valueData != 0;
}

- (BOOL)hasKindRawValue
{
  return self->_kindRawValue != 0;
}

- (BOOL)hasSupplementaryValue
{
  return self->_supplementaryValue != 0;
}

- (BOOL)hasQueryConfigurationData
{
  return self->_queryConfigurationData != 0;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryCurrentValue;
  v4 = [(HKCodableSummaryCurrentValue *)&v8 description];
  v5 = [(HKCodableSummaryCurrentValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  valueData = self->_valueData;
  if (valueData) {
    [v3 setObject:valueData forKey:@"valueData"];
  }
  kindRawValue = self->_kindRawValue;
  if (kindRawValue) {
    [v4 setObject:kindRawValue forKey:@"kindRawValue"];
  }
  supplementaryValue = self->_supplementaryValue;
  if (supplementaryValue)
  {
    objc_super v8 = [(HKCodableSummarySupplementaryValue *)supplementaryValue dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"supplementaryValue"];
  }
  queryConfigurationData = self->_queryConfigurationData;
  if (queryConfigurationData) {
    [v4 setObject:queryConfigurationData forKey:@"queryConfigurationData"];
  }
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    v11 = [(HKCodableMetadataDictionary *)metadataDictionary dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"metadataDictionary"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
    [v4 setObject:v13 forKey:@"latestSupportedVersion"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v4 setObject:v14 forKey:@"minimumSupportedVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryCurrentValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_valueData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_kindRawValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_supplementaryValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_queryConfigurationData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_metadataDictionary)
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_valueData)
  {
    objc_msgSend(v4, "setValueData:");
    id v4 = v6;
  }
  if (self->_kindRawValue)
  {
    objc_msgSend(v6, "setKindRawValue:");
    id v4 = v6;
  }
  if (self->_supplementaryValue)
  {
    objc_msgSend(v6, "setSupplementaryValue:");
    id v4 = v6;
  }
  if (self->_queryConfigurationData)
  {
    objc_msgSend(v6, "setQueryConfigurationData:");
    id v4 = v6;
  }
  if (self->_metadataDictionary)
  {
    objc_msgSend(v6, "setMetadataDictionary:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_latestSupportedVersion;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_minimumSupportedVersion;
    *((unsigned char *)v4 + 64) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_valueData copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_kindRawValue copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(HKCodableSummarySupplementaryValue *)self->_supplementaryValue copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSData *)self->_queryConfigurationData copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(HKCodableMetadataDictionary *)self->_metadataDictionary copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_latestSupportedVersion;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_minimumSupportedVersion;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  valueData = self->_valueData;
  if ((unint64_t)valueData | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](valueData, "isEqual:")) {
      goto LABEL_21;
    }
  }
  kindRawValue = self->_kindRawValue;
  if ((unint64_t)kindRawValue | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](kindRawValue, "isEqual:")) {
      goto LABEL_21;
    }
  }
  supplementaryValue = self->_supplementaryValue;
  if ((unint64_t)supplementaryValue | *((void *)v4 + 6))
  {
    if (!-[HKCodableSummarySupplementaryValue isEqual:](supplementaryValue, "isEqual:")) {
      goto LABEL_21;
    }
  }
  queryConfigurationData = self->_queryConfigurationData;
  if ((unint64_t)queryConfigurationData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](queryConfigurationData, "isEqual:")) {
      goto LABEL_21;
    }
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((void *)v4 + 4))
  {
    if (!-[HKCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_latestSupportedVersion != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_21:
    BOOL v10 = 0;
    goto LABEL_22;
  }
  BOOL v10 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v10 = 1;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_valueData hash];
  NSUInteger v4 = [(NSString *)self->_kindRawValue hash];
  unint64_t v5 = [(HKCodableSummarySupplementaryValue *)self->_supplementaryValue hash];
  uint64_t v6 = [(NSData *)self->_queryConfigurationData hash];
  unint64_t v7 = [(HKCodableMetadataDictionary *)self->_metadataDictionary hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_latestSupportedVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  BOOL v10 = v4;
  if (v4[7])
  {
    -[HKCodableSummaryCurrentValue setValueData:](self, "setValueData:");
    NSUInteger v4 = v10;
  }
  if (v4[3])
  {
    -[HKCodableSummaryCurrentValue setKindRawValue:](self, "setKindRawValue:");
    NSUInteger v4 = v10;
  }
  supplementaryValue = self->_supplementaryValue;
  uint64_t v6 = v4[6];
  if (supplementaryValue)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HKCodableSummarySupplementaryValue mergeFrom:](supplementaryValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HKCodableSummaryCurrentValue setSupplementaryValue:](self, "setSupplementaryValue:");
  }
  NSUInteger v4 = v10;
LABEL_11:
  if (v4[5])
  {
    -[HKCodableSummaryCurrentValue setQueryConfigurationData:](self, "setQueryConfigurationData:");
    NSUInteger v4 = v10;
  }
  metadataDictionary = self->_metadataDictionary;
  uint64_t v8 = v4[4];
  if (metadataDictionary)
  {
    if (!v8) {
      goto LABEL_19;
    }
    metadataDictionary = (HKCodableMetadataDictionary *)-[HKCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    metadataDictionary = (HKCodableMetadataDictionary *)-[HKCodableSummaryCurrentValue setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  NSUInteger v4 = v10;
LABEL_19:
  char v9 = *((unsigned char *)v4 + 64);
  if (v9)
  {
    self->_latestSupportedVersion = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v4 + 64);
  }
  if ((v9 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8](metadataDictionary, v4);
}

- (NSData)valueData
{
  return self->_valueData;
}

- (void)setValueData:(id)a3
{
}

- (NSString)kindRawValue
{
  return self->_kindRawValue;
}

- (void)setKindRawValue:(id)a3
{
}

- (HKCodableSummarySupplementaryValue)supplementaryValue
{
  return self->_supplementaryValue;
}

- (void)setSupplementaryValue:(id)a3
{
}

- (NSData)queryConfigurationData
{
  return self->_queryConfigurationData;
}

- (void)setQueryConfigurationData:(id)a3
{
}

- (HKCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueData, 0);
  objc_storeStrong((id *)&self->_supplementaryValue, 0);
  objc_storeStrong((id *)&self->_queryConfigurationData, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_kindRawValue, 0);
}

@end