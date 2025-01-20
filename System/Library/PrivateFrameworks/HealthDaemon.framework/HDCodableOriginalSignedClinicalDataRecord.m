@interface HDCodableOriginalSignedClinicalDataRecord
+ (Class)typeType;
- (BOOL)deleted;
- (BOOL)hasDeleted;
- (BOOL)hasFirstSeenDate;
- (BOOL)hasFirstSeenDateTimeZoneName;
- (BOOL)hasGatewayExternalID;
- (BOOL)hasIssuerIdentifier;
- (BOOL)hasLastModifiedDate;
- (BOOL)hasMessageVersion;
- (BOOL)hasMetadata;
- (BOOL)hasRawContent;
- (BOOL)hasReceivedDate;
- (BOOL)hasReceivedDateTimeZoneName;
- (BOOL)hasSignatureStatus;
- (BOOL)hasSourceType;
- (BOOL)hasSourceURL;
- (BOOL)hasSyncIdentifier;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUniquenessChecksum;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMessageVersion)messageVersion;
- (HDCodableMetadataDictionary)metadata;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)rawContent;
- (NSData)syncIdentifier;
- (NSData)uniquenessChecksum;
- (NSMutableArray)types;
- (NSString)firstSeenDateTimeZoneName;
- (NSString)gatewayExternalID;
- (NSString)issuerIdentifier;
- (NSString)receivedDateTimeZoneName;
- (NSString)sourceURL;
- (double)firstSeenDate;
- (double)lastModifiedDate;
- (double)receivedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAtIndex:(unint64_t)a3;
- (int64_t)signatureStatus;
- (int64_t)sourceType;
- (unint64_t)hash;
- (unint64_t)typesCount;
- (void)addType:(id)a3;
- (void)clearTypes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setFirstSeenDate:(double)a3;
- (void)setFirstSeenDateTimeZoneName:(id)a3;
- (void)setGatewayExternalID:(id)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasFirstSeenDate:(BOOL)a3;
- (void)setHasLastModifiedDate:(BOOL)a3;
- (void)setHasReceivedDate:(BOOL)a3;
- (void)setHasSignatureStatus:(BOOL)a3;
- (void)setHasSourceType:(BOOL)a3;
- (void)setIssuerIdentifier:(id)a3;
- (void)setLastModifiedDate:(double)a3;
- (void)setMessageVersion:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRawContent:(id)a3;
- (void)setReceivedDate:(double)a3;
- (void)setReceivedDateTimeZoneName:(id)a3;
- (void)setSignatureStatus:(int64_t)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setSourceURL:(id)a3;
- (void)setSyncIdentifier:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTypes:(id)a3;
- (void)setUniquenessChecksum:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableOriginalSignedClinicalDataRecord

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (BOOL)hasGatewayExternalID
{
  return self->_gatewayExternalID != 0;
}

- (BOOL)hasIssuerIdentifier
{
  return self->_issuerIdentifier != 0;
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (BOOL)hasRawContent
{
  return self->_rawContent != 0;
}

- (void)clearTypes
{
}

- (void)addType:(id)a3
{
  id v4 = a3;
  types = self->_types;
  id v8 = v4;
  if (!types)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_types;
    self->_types = v6;

    id v4 = v8;
    types = self->_types;
  }
  [(NSMutableArray *)types addObject:v4];
}

- (unint64_t)typesCount
{
  return [(NSMutableArray *)self->_types count];
}

- (id)typeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_types objectAtIndex:a3];
}

+ (Class)typeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)setReceivedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_receivedDate = a3;
}

- (void)setHasReceivedDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReceivedDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasReceivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName != 0;
}

- (void)setFirstSeenDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_firstSeenDate = a3;
}

- (void)setHasFirstSeenDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstSeenDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFirstSeenDateTimeZoneName
{
  return self->_firstSeenDateTimeZoneName != 0;
}

- (void)setSignatureStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_signatureStatus = a3;
}

- (void)setHasSignatureStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSignatureStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasUniquenessChecksum
{
  return self->_uniquenessChecksum != 0;
}

- (void)setLastModifiedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastModifiedDate = a3;
}

- (void)setHasLastModifiedDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastModifiedDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSourceType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sourceType = a3;
}

- (void)setHasSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSourceType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableOriginalSignedClinicalDataRecord;
  id v4 = [(HDCodableOriginalSignedClinicalDataRecord *)&v8 description];
  v5 = [(HDCodableOriginalSignedClinicalDataRecord *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    v5 = [(HDCodableMessageVersion *)messageVersion dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"messageVersion"];
  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier) {
    [v3 setObject:syncIdentifier forKey:@"syncIdentifier"];
  }
  gatewayExternalID = self->_gatewayExternalID;
  if (gatewayExternalID) {
    [v3 setObject:gatewayExternalID forKey:@"gatewayExternalID"];
  }
  issuerIdentifier = self->_issuerIdentifier;
  if (issuerIdentifier) {
    [v3 setObject:issuerIdentifier forKey:@"issuerIdentifier"];
  }
  sourceURL = self->_sourceURL;
  if (sourceURL) {
    [v3 setObject:sourceURL forKey:@"sourceURL"];
  }
  rawContent = self->_rawContent;
  if (rawContent) {
    [v3 setObject:rawContent forKey:@"rawContent"];
  }
  types = self->_types;
  if (types) {
    [v3 setObject:types forKey:@"type"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v13 = [(HDCodableMetadataDictionary *)metadata dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"metadata"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v14 = [NSNumber numberWithDouble:self->_receivedDate];
    [v3 setObject:v14 forKey:@"receivedDate"];
  }
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if (receivedDateTimeZoneName) {
    [v3 setObject:receivedDateTimeZoneName forKey:@"receivedDateTimeZoneName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v16 = [NSNumber numberWithDouble:self->_firstSeenDate];
    [v3 setObject:v16 forKey:@"firstSeenDate"];
  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if (firstSeenDateTimeZoneName) {
    [v3 setObject:firstSeenDateTimeZoneName forKey:@"firstSeenDateTimeZoneName"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v18 = [NSNumber numberWithLongLong:self->_signatureStatus];
    [v3 setObject:v18 forKey:@"signatureStatus"];
  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if (uniquenessChecksum) {
    [v3 setObject:uniquenessChecksum forKey:@"uniquenessChecksum"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v25 = [NSNumber numberWithDouble:self->_lastModifiedDate];
    [v3 setObject:v25 forKey:@"lastModifiedDate"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_31:
      if ((has & 0x10) == 0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_31;
  }
  v26 = [NSNumber numberWithBool:self->_deleted];
  [v3 setObject:v26 forKey:@"deleted"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_32:
    v21 = [NSNumber numberWithLongLong:self->_sourceType];
    [v3 setObject:v21 forKey:@"sourceType"];
  }
LABEL_33:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v23 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"syncIdentity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableOriginalSignedClinicalDataRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_messageVersion) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_syncIdentifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_gatewayExternalID) {
    PBDataWriterWriteStringField();
  }
  if (self->_issuerIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_rawContent) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_types;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_receivedDateTimeZoneName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_firstSeenDateTimeZoneName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_uniquenessChecksum) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_36:
      if ((has & 0x10) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_37:
  }
    PBDataWriterWriteInt64Field();
LABEL_38:
  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if (self->_messageVersion) {
    objc_msgSend(v10, "setMessageVersion:");
  }
  if (self->_syncIdentifier) {
    objc_msgSend(v10, "setSyncIdentifier:");
  }
  if (self->_gatewayExternalID) {
    objc_msgSend(v10, "setGatewayExternalID:");
  }
  if (self->_issuerIdentifier) {
    objc_msgSend(v10, "setIssuerIdentifier:");
  }
  if (self->_sourceURL) {
    objc_msgSend(v10, "setSourceURL:");
  }
  if (self->_rawContent) {
    objc_msgSend(v10, "setRawContent:");
  }
  if ([(HDCodableOriginalSignedClinicalDataRecord *)self typesCount])
  {
    [v10 clearTypes];
    unint64_t v4 = [(HDCodableOriginalSignedClinicalDataRecord *)self typesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableOriginalSignedClinicalDataRecord *)self typeAtIndex:i];
        [v10 addType:v7];
      }
    }
  }
  if (self->_metadata) {
    objc_msgSend(v10, "setMetadata:");
  }
  uint64_t v8 = v10;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v10 + 3) = *(void *)&self->_receivedDate;
    *((unsigned char *)v10 + 148) |= 4u;
  }
  if (self->_receivedDateTimeZoneName)
  {
    objc_msgSend(v10, "setReceivedDateTimeZoneName:");
    uint64_t v8 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[1] = *(void *)&self->_firstSeenDate;
    *((unsigned char *)v8 + 148) |= 1u;
  }
  if (self->_firstSeenDateTimeZoneName)
  {
    objc_msgSend(v10, "setFirstSeenDateTimeZoneName:");
    uint64_t v8 = v10;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v8[4] = self->_signatureStatus;
    *((unsigned char *)v8 + 148) |= 8u;
  }
  if (self->_uniquenessChecksum)
  {
    objc_msgSend(v10, "setUniquenessChecksum:");
    uint64_t v8 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8[2] = *(void *)&self->_lastModifiedDate;
    *((unsigned char *)v8 + 148) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_33:
      if ((has & 0x10) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_33;
  }
  *((unsigned char *)v8 + 144) = self->_deleted;
  *((unsigned char *)v8 + 148) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_34:
    v8[5] = self->_sourceType;
    *((unsigned char *)v8 + 148) |= 0x10u;
  }
LABEL_35:
  if (self->_syncIdentity)
  {
    objc_msgSend(v10, "setSyncIdentity:");
    uint64_t v8 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableMessageVersion *)self->_messageVersion copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  uint64_t v8 = [(NSData *)self->_syncIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v8;

  uint64_t v10 = [(NSString *)self->_gatewayExternalID copyWithZone:a3];
  long long v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_issuerIdentifier copyWithZone:a3];
  long long v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_sourceURL copyWithZone:a3];
  v15 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v14;

  uint64_t v16 = [(NSData *)self->_rawContent copyWithZone:a3];
  v17 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v16;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v18 = self->_types;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (void)v36);
        [(id)v5 addType:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }

  id v24 = [(HDCodableMetadataDictionary *)self->_metadata copyWithZone:a3];
  v25 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v24;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_receivedDate;
    *(unsigned char *)(v5 + 148) |= 4u;
  }
  uint64_t v26 = -[NSString copyWithZone:](self->_receivedDateTimeZoneName, "copyWithZone:", a3, (void)v36);
  v27 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v26;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_firstSeenDate;
    *(unsigned char *)(v5 + 148) |= 1u;
  }
  uint64_t v28 = [(NSString *)self->_firstSeenDateTimeZoneName copyWithZone:a3];
  v29 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v28;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_signatureStatus;
    *(unsigned char *)(v5 + 148) |= 8u;
  }
  uint64_t v30 = [(NSData *)self->_uniquenessChecksum copyWithZone:a3];
  v31 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v30;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_16;
    }
LABEL_20:
    *(unsigned char *)(v5 + 144) = self->_deleted;
    *(unsigned char *)(v5 + 148) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  *(double *)(v5 + 16) = self->_lastModifiedDate;
  *(unsigned char *)(v5 + 148) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  if ((has & 0x10) != 0)
  {
LABEL_17:
    *(void *)(v5 + 40) = self->_sourceType;
    *(unsigned char *)(v5 + 148) |= 0x10u;
  }
LABEL_18:
  id v33 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v34 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v33;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((void *)v4 + 9))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:")) {
      goto LABEL_62;
    }
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](syncIdentifier, "isEqual:")) {
      goto LABEL_62;
    }
  }
  gatewayExternalID = self->_gatewayExternalID;
  if ((unint64_t)gatewayExternalID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](gatewayExternalID, "isEqual:")) {
      goto LABEL_62;
    }
  }
  issuerIdentifier = self->_issuerIdentifier;
  if ((unint64_t)issuerIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](issuerIdentifier, "isEqual:")) {
      goto LABEL_62;
    }
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceURL, "isEqual:")) {
      goto LABEL_62;
    }
  }
  rawContent = self->_rawContent;
  if ((unint64_t)rawContent | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](rawContent, "isEqual:")) {
      goto LABEL_62;
    }
  }
  types = self->_types;
  if ((unint64_t)types | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](types, "isEqual:")) {
      goto LABEL_62;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 10))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadata, "isEqual:")) {
      goto LABEL_62;
    }
  }
  char has = (char)self->_has;
  char v14 = *((unsigned char *)v4 + 148);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 4) == 0 || self->_receivedDate != *((double *)v4 + 3)) {
      goto LABEL_62;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 4) != 0)
  {
    goto LABEL_62;
  }
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if ((unint64_t)receivedDateTimeZoneName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](receivedDateTimeZoneName, "isEqual:")) {
      goto LABEL_62;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 148);
  }
  if (has)
  {
    if ((v14 & 1) == 0 || self->_firstSeenDate != *((double *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v14)
  {
    goto LABEL_62;
  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if ((unint64_t)firstSeenDateTimeZoneName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](firstSeenDateTimeZoneName, "isEqual:")) {
      goto LABEL_62;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 148);
  }
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_signatureStatus != *((void *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_62;
  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if ((unint64_t)uniquenessChecksum | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](uniquenessChecksum, "isEqual:")) {
      goto LABEL_62;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 148);
  }
  if ((has & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_lastModifiedDate != *((double *)v4 + 2)) {
      goto LABEL_62;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v14 & 0x20) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 144)) {
          goto LABEL_62;
        }
        goto LABEL_55;
      }
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_55;
      }
    }
LABEL_62:
    char v19 = 0;
    goto LABEL_63;
  }
  if ((v14 & 0x20) != 0) {
    goto LABEL_62;
  }
LABEL_55:
  if ((has & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_sourceType != *((void *)v4 + 5)) {
      goto LABEL_62;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 15)) {
    char v19 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_63:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v33 = [(HDCodableMessageVersion *)self->_messageVersion hash];
  uint64_t v32 = [(NSData *)self->_syncIdentifier hash];
  NSUInteger v31 = [(NSString *)self->_gatewayExternalID hash];
  NSUInteger v30 = [(NSString *)self->_issuerIdentifier hash];
  NSUInteger v29 = [(NSString *)self->_sourceURL hash];
  uint64_t v28 = [(NSData *)self->_rawContent hash];
  uint64_t v27 = [(NSMutableArray *)self->_types hash];
  unint64_t v3 = [(HDCodableMetadataDictionary *)self->_metadata hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double receivedDate = self->_receivedDate;
    double v6 = -receivedDate;
    if (receivedDate >= 0.0) {
      double v6 = self->_receivedDate;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_receivedDateTimeZoneName hash];
  if (*(unsigned char *)&self->_has)
  {
    double firstSeenDate = self->_firstSeenDate;
    double v12 = -firstSeenDate;
    if (firstSeenDate >= 0.0) {
      double v12 = self->_firstSeenDate;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_firstSeenDateTimeZoneName hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v16 = 2654435761 * self->_signatureStatus;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [(NSData *)self->_uniquenessChecksum hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double lastModifiedDate = self->_lastModifiedDate;
    double v21 = -lastModifiedDate;
    if (lastModifiedDate >= 0.0) {
      double v21 = self->_lastModifiedDate;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t v24 = 2654435761 * self->_deleted;
    if ((has & 0x10) != 0) {
      goto LABEL_30;
    }
LABEL_32:
    uint64_t v25 = 0;
    return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v3 ^ v4 ^ v9 ^ v10 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24 ^ v25 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  }
  uint64_t v24 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_32;
  }
LABEL_30:
  uint64_t v25 = 2654435761 * self->_sourceType;
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v3 ^ v4 ^ v9 ^ v10 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24 ^ v25 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  messageVersion = self->_messageVersion;
  uint64_t v6 = *((void *)v4 + 9);
  if (messageVersion)
  {
    if (v6) {
      -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableOriginalSignedClinicalDataRecord setMessageVersion:](self, "setMessageVersion:");
  }
  if (*((void *)v4 + 14)) {
    -[HDCodableOriginalSignedClinicalDataRecord setSyncIdentifier:](self, "setSyncIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[HDCodableOriginalSignedClinicalDataRecord setGatewayExternalID:](self, "setGatewayExternalID:");
  }
  if (*((void *)v4 + 8)) {
    -[HDCodableOriginalSignedClinicalDataRecord setIssuerIdentifier:](self, "setIssuerIdentifier:");
  }
  if (*((void *)v4 + 13)) {
    -[HDCodableOriginalSignedClinicalDataRecord setSourceURL:](self, "setSourceURL:");
  }
  if (*((void *)v4 + 11)) {
    -[HDCodableOriginalSignedClinicalDataRecord setRawContent:](self, "setRawContent:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *((id *)v4 + 16);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HDCodableOriginalSignedClinicalDataRecord addType:](self, "addType:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  metadata = self->_metadata;
  uint64_t v13 = *((void *)v4 + 10);
  if (metadata)
  {
    if (v13) {
      -[HDCodableMetadataDictionary mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[HDCodableOriginalSignedClinicalDataRecord setMetadata:](self, "setMetadata:");
  }
  if ((*((unsigned char *)v4 + 148) & 4) != 0)
  {
    self->_double receivedDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 12)) {
    -[HDCodableOriginalSignedClinicalDataRecord setReceivedDateTimeZoneName:](self, "setReceivedDateTimeZoneName:");
  }
  if (*((unsigned char *)v4 + 148))
  {
    self->_double firstSeenDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[HDCodableOriginalSignedClinicalDataRecord setFirstSeenDateTimeZoneName:](self, "setFirstSeenDateTimeZoneName:");
  }
  if ((*((unsigned char *)v4 + 148) & 8) != 0)
  {
    self->_signatureStatus = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 17)) {
    -[HDCodableOriginalSignedClinicalDataRecord setUniquenessChecksum:](self, "setUniquenessChecksum:");
  }
  char v14 = *((unsigned char *)v4 + 148);
  if ((v14 & 2) != 0)
  {
    self->_double lastModifiedDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v14 = *((unsigned char *)v4 + 148);
    if ((v14 & 0x20) == 0)
    {
LABEL_42:
      if ((v14 & 0x10) == 0) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 0x20) == 0)
  {
    goto LABEL_42;
  }
  self->_deleted = *((unsigned char *)v4 + 144);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 148) & 0x10) != 0)
  {
LABEL_43:
    self->_sourceType = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_44:
  syncIdentity = self->_syncIdentity;
  uint64_t v16 = *((void *)v4 + 15);
  if (syncIdentity)
  {
    if (v16) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[HDCodableOriginalSignedClinicalDataRecord setSyncIdentity:](self, "setSyncIdentity:");
  }
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (NSData)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
}

- (NSString)gatewayExternalID
{
  return self->_gatewayExternalID;
}

- (void)setGatewayExternalID:(id)a3
{
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (void)setRawContent:(id)a3
{
}

- (NSMutableArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
}

- (HDCodableMetadataDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (double)receivedDate
{
  return self->_receivedDate;
}

- (NSString)receivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName;
}

- (void)setReceivedDateTimeZoneName:(id)a3
{
}

- (double)firstSeenDate
{
  return self->_firstSeenDate;
}

- (NSString)firstSeenDateTimeZoneName
{
  return self->_firstSeenDateTimeZoneName;
}

- (void)setFirstSeenDateTimeZoneName:(id)a3
{
}

- (int64_t)signatureStatus
{
  return self->_signatureStatus;
}

- (NSData)uniquenessChecksum
{
  return self->_uniquenessChecksum;
}

- (void)setUniquenessChecksum:(id)a3
{
}

- (double)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniquenessChecksum, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_receivedDateTimeZoneName, 0);
  objc_storeStrong((id *)&self->_rawContent, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_gatewayExternalID, 0);

  objc_storeStrong((id *)&self->_firstSeenDateTimeZoneName, 0);
}

@end