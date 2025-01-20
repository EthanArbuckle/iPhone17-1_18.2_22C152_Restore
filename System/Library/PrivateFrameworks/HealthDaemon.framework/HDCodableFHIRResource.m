@interface HDCodableFHIRResource
- (BOOL)hasAccountIdentifier;
- (BOOL)hasExtractionHints;
- (BOOL)hasFhirVersion;
- (BOOL)hasFirstSeenDate;
- (BOOL)hasFirstSeenDateTimeZoneName;
- (BOOL)hasGatewayExternalID;
- (BOOL)hasMessageVersion;
- (BOOL)hasOriginVersionBuild;
- (BOOL)hasOriginVersionMajor;
- (BOOL)hasOriginVersionMinor;
- (BOOL)hasOriginVersionPatch;
- (BOOL)hasRawContent;
- (BOOL)hasReceivedDate;
- (BOOL)hasReceivedDateTimeZoneName;
- (BOOL)hasResourceID;
- (BOOL)hasResourceType;
- (BOOL)hasSourceURL;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUniquenessChecksum;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMessageVersion)messageVersion;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)rawContent;
- (NSData)uniquenessChecksum;
- (NSString)accountIdentifier;
- (NSString)fhirVersion;
- (NSString)firstSeenDateTimeZoneName;
- (NSString)gatewayExternalID;
- (NSString)originVersionBuild;
- (NSString)receivedDateTimeZoneName;
- (NSString)resourceID;
- (NSString)resourceType;
- (NSString)sourceURL;
- (double)firstSeenDate;
- (double)receivedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)extractionHints;
- (int64_t)originVersionMajor;
- (int64_t)originVersionMinor;
- (int64_t)originVersionPatch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setExtractionHints:(int64_t)a3;
- (void)setFhirVersion:(id)a3;
- (void)setFirstSeenDate:(double)a3;
- (void)setFirstSeenDateTimeZoneName:(id)a3;
- (void)setGatewayExternalID:(id)a3;
- (void)setHasExtractionHints:(BOOL)a3;
- (void)setHasFirstSeenDate:(BOOL)a3;
- (void)setHasOriginVersionMajor:(BOOL)a3;
- (void)setHasOriginVersionMinor:(BOOL)a3;
- (void)setHasOriginVersionPatch:(BOOL)a3;
- (void)setHasReceivedDate:(BOOL)a3;
- (void)setMessageVersion:(id)a3;
- (void)setOriginVersionBuild:(id)a3;
- (void)setOriginVersionMajor:(int64_t)a3;
- (void)setOriginVersionMinor:(int64_t)a3;
- (void)setOriginVersionPatch:(int64_t)a3;
- (void)setRawContent:(id)a3;
- (void)setReceivedDate:(double)a3;
- (void)setReceivedDateTimeZoneName:(id)a3;
- (void)setResourceID:(id)a3;
- (void)setResourceType:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUniquenessChecksum:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableFHIRResource

- (BOOL)hasGatewayExternalID
{
  return self->_gatewayExternalID != 0;
}

- (BOOL)hasResourceID
{
  return self->_resourceID != 0;
}

- (BOOL)hasRawContent
{
  return self->_rawContent != 0;
}

- (void)setReceivedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_receivedDate = a3;
}

- (void)setHasReceivedDate:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReceivedDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasResourceType
{
  return self->_resourceType != 0;
}

- (BOOL)hasFhirVersion
{
  return self->_fhirVersion != 0;
}

- (BOOL)hasReceivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName != 0;
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (void)setExtractionHints:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_extractionHints = a3;
}

- (void)setHasExtractionHints:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExtractionHints
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (void)setOriginVersionMajor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_originVersionMajor = a3;
}

- (void)setHasOriginVersionMajor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginVersionMajor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOriginVersionMinor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_originVersionMinor = a3;
}

- (void)setHasOriginVersionMinor:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOriginVersionMinor
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOriginVersionPatch:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_originVersionPatch = a3;
}

- (void)setHasOriginVersionPatch:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOriginVersionPatch
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasOriginVersionBuild
{
  return self->_originVersionBuild != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (void)setFirstSeenDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_firstSeenDate = a3;
}

- (void)setHasFirstSeenDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstSeenDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasFirstSeenDateTimeZoneName
{
  return self->_firstSeenDateTimeZoneName != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasUniquenessChecksum
{
  return self->_uniquenessChecksum != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableFHIRResource;
  v4 = [(HDCodableFHIRResource *)&v8 description];
  v5 = [(HDCodableFHIRResource *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  gatewayExternalID = self->_gatewayExternalID;
  if (gatewayExternalID) {
    [v3 setObject:gatewayExternalID forKey:@"gatewayExternalID"];
  }
  resourceID = self->_resourceID;
  if (resourceID) {
    [v4 setObject:resourceID forKey:@"resourceID"];
  }
  rawContent = self->_rawContent;
  if (rawContent) {
    [v4 setObject:rawContent forKey:@"rawContent"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_receivedDate];
    [v4 setObject:v8 forKey:@"receivedDate"];
  }
  resourceType = self->_resourceType;
  if (resourceType) {
    [v4 setObject:resourceType forKey:@"resourceType"];
  }
  fhirVersion = self->_fhirVersion;
  if (fhirVersion) {
    [v4 setObject:fhirVersion forKey:@"fhirVersion"];
  }
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if (receivedDateTimeZoneName) {
    [v4 setObject:receivedDateTimeZoneName forKey:@"receivedDateTimeZoneName"];
  }
  sourceURL = self->_sourceURL;
  if (sourceURL) {
    [v4 setObject:sourceURL forKey:@"sourceURL"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = [NSNumber numberWithLongLong:self->_extractionHints];
    [v4 setObject:v13 forKey:@"extractionHints"];
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"accountIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v26 = [NSNumber numberWithLongLong:self->_originVersionMajor];
    [v4 setObject:v26 forKey:@"originVersionMajor"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 0x10) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  v27 = [NSNumber numberWithLongLong:self->_originVersionMinor];
  [v4 setObject:v27 forKey:@"originVersionMinor"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_24:
    v16 = [NSNumber numberWithLongLong:self->_originVersionPatch];
    [v4 setObject:v16 forKey:@"originVersionPatch"];
  }
LABEL_25:
  originVersionBuild = self->_originVersionBuild;
  if (originVersionBuild) {
    [v4 setObject:originVersionBuild forKey:@"originVersionBuild"];
  }
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    v19 = [(HDCodableMessageVersion *)messageVersion dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"messageVersion"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v20 = [NSNumber numberWithDouble:self->_firstSeenDate];
    [v4 setObject:v20 forKey:@"firstSeenDate"];
  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if (firstSeenDateTimeZoneName) {
    [v4 setObject:firstSeenDateTimeZoneName forKey:@"firstSeenDateTimeZoneName"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v23 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"syncIdentity"];
  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if (uniquenessChecksum) {
    [v4 setObject:uniquenessChecksum forKey:@"uniquenessChecksum"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFHIRResourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_gatewayExternalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_resourceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_rawContent)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_resourceType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_fhirVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_receivedDateTimeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sourceURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_accountIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 0x10) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_25:
  if (self->_originVersionBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_firstSeenDateTimeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_uniquenessChecksum)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_gatewayExternalID)
  {
    objc_msgSend(v4, "setGatewayExternalID:");
    id v4 = v6;
  }
  if (self->_resourceID)
  {
    objc_msgSend(v6, "setResourceID:");
    id v4 = v6;
  }
  if (self->_rawContent)
  {
    objc_msgSend(v6, "setRawContent:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((void *)v4 + 6) = *(void *)&self->_receivedDate;
    *((unsigned char *)v4 + 160) |= 0x20u;
  }
  if (self->_resourceType)
  {
    objc_msgSend(v6, "setResourceType:");
    id v4 = v6;
  }
  if (self->_fhirVersion)
  {
    objc_msgSend(v6, "setFhirVersion:");
    id v4 = v6;
  }
  if (self->_receivedDateTimeZoneName)
  {
    objc_msgSend(v6, "setReceivedDateTimeZoneName:");
    id v4 = v6;
  }
  if (self->_sourceURL)
  {
    objc_msgSend(v6, "setSourceURL:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_extractionHints;
    *((unsigned char *)v4 + 160) |= 1u;
  }
  if (self->_accountIdentifier)
  {
    objc_msgSend(v6, "setAccountIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_originVersionMajor;
    *((unsigned char *)v4 + 160) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 0x10) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  *((void *)v4 + 4) = self->_originVersionMinor;
  *((unsigned char *)v4 + 160) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_24:
    *((void *)v4 + 5) = self->_originVersionPatch;
    *((unsigned char *)v4 + 160) |= 0x10u;
  }
LABEL_25:
  if (self->_originVersionBuild)
  {
    objc_msgSend(v6, "setOriginVersionBuild:");
    id v4 = v6;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v6, "setMessageVersion:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_firstSeenDate;
    *((unsigned char *)v4 + 160) |= 2u;
  }
  if (self->_firstSeenDateTimeZoneName)
  {
    objc_msgSend(v6, "setFirstSeenDateTimeZoneName:");
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
  if (self->_uniquenessChecksum)
  {
    objc_msgSend(v6, "setUniquenessChecksum:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_gatewayExternalID copyWithZone:a3];
  v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSString *)self->_resourceID copyWithZone:a3];
  v9 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v8;

  uint64_t v10 = [(NSData *)self->_rawContent copyWithZone:a3];
  v11 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v10;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_receivedDate;
    *(unsigned char *)(v5 + 160) |= 0x20u;
  }
  uint64_t v12 = [(NSString *)self->_resourceType copyWithZone:a3];
  v13 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v12;

  uint64_t v14 = [(NSString *)self->_fhirVersion copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_receivedDateTimeZoneName copyWithZone:a3];
  v17 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v16;

  uint64_t v18 = [(NSString *)self->_sourceURL copyWithZone:a3];
  v19 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_extractionHints;
    *(unsigned char *)(v5 + 160) |= 1u;
  }
  uint64_t v20 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_originVersionMajor;
    *(unsigned char *)(v5 + 160) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v5 + 32) = self->_originVersionMinor;
  *(unsigned char *)(v5 + 160) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(void *)(v5 + 40) = self->_originVersionPatch;
    *(unsigned char *)(v5 + 160) |= 0x10u;
  }
LABEL_9:
  uint64_t v23 = [(NSString *)self->_originVersionBuild copyWithZone:a3];
  v24 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v23;

  id v25 = [(HDCodableMessageVersion *)self->_messageVersion copyWithZone:a3];
  v26 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v25;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_firstSeenDate;
    *(unsigned char *)(v5 + 160) |= 2u;
  }
  uint64_t v27 = [(NSString *)self->_firstSeenDateTimeZoneName copyWithZone:a3];
  v28 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v27;

  id v29 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v30 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v29;

  uint64_t v31 = [(NSData *)self->_uniquenessChecksum copyWithZone:a3];
  v32 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v31;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  gatewayExternalID = self->_gatewayExternalID;
  if ((unint64_t)gatewayExternalID | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](gatewayExternalID, "isEqual:")) {
      goto LABEL_59;
    }
  }
  resourceID = self->_resourceID;
  if ((unint64_t)resourceID | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](resourceID, "isEqual:")) {
      goto LABEL_59;
    }
  }
  rawContent = self->_rawContent;
  if ((unint64_t)rawContent | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](rawContent, "isEqual:")) {
      goto LABEL_59;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 0x20) == 0 || self->_receivedDate != *((double *)v4 + 6)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 0x20) != 0)
  {
    goto LABEL_59;
  }
  resourceType = self->_resourceType;
  if ((unint64_t)resourceType | *((void *)v4 + 16)
    && !-[NSString isEqual:](resourceType, "isEqual:"))
  {
    goto LABEL_59;
  }
  fhirVersion = self->_fhirVersion;
  if ((unint64_t)fhirVersion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](fhirVersion, "isEqual:")) {
      goto LABEL_59;
    }
  }
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if ((unint64_t)receivedDateTimeZoneName | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](receivedDateTimeZoneName, "isEqual:")) {
      goto LABEL_59;
    }
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](sourceURL, "isEqual:")) {
      goto LABEL_59;
    }
  }
  char has = (char)self->_has;
  char v13 = *((unsigned char *)v4 + 160);
  if (has)
  {
    if ((*((unsigned char *)v4 + 160) & 1) == 0 || self->_extractionHints != *((void *)v4 + 1)) {
      goto LABEL_59;
    }
  }
  else if (*((unsigned char *)v4 + 160))
  {
    goto LABEL_59;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](accountIdentifier, "isEqual:"))
    {
LABEL_59:
      char v20 = 0;
      goto LABEL_60;
    }
    char has = (char)self->_has;
    char v13 = *((unsigned char *)v4 + 160);
  }
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_originVersionMajor != *((void *)v4 + 3)) {
      goto LABEL_59;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_originVersionMinor != *((void *)v4 + 4)) {
      goto LABEL_59;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_originVersionPatch != *((void *)v4 + 5)) {
      goto LABEL_59;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_59;
  }
  originVersionBuild = self->_originVersionBuild;
  if ((unint64_t)originVersionBuild | *((void *)v4 + 12)
    && !-[NSString isEqual:](originVersionBuild, "isEqual:"))
  {
    goto LABEL_59;
  }
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((void *)v4 + 11))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:")) {
      goto LABEL_59;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 2) == 0 || self->_firstSeenDate != *((double *)v4 + 2)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 2) != 0)
  {
    goto LABEL_59;
  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if ((unint64_t)firstSeenDateTimeZoneName | *((void *)v4 + 9)
    && !-[NSString isEqual:](firstSeenDateTimeZoneName, "isEqual:"))
  {
    goto LABEL_59;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 18))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_59;
    }
  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if ((unint64_t)uniquenessChecksum | *((void *)v4 + 19)) {
    char v20 = -[NSData isEqual:](uniquenessChecksum, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_60:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v34 = [(NSString *)self->_gatewayExternalID hash];
  NSUInteger v33 = [(NSString *)self->_resourceID hash];
  uint64_t v32 = [(NSData *)self->_rawContent hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    double receivedDate = self->_receivedDate;
    double v4 = -receivedDate;
    if (receivedDate >= 0.0) {
      double v4 = self->_receivedDate;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v31 = v10;
  }
  else
  {
    unint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_resourceType hash];
  NSUInteger v29 = [(NSString *)self->_fhirVersion hash];
  NSUInteger v28 = [(NSString *)self->_receivedDateTimeZoneName hash];
  NSUInteger v26 = [(NSString *)self->_sourceURL hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_extractionHints;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_accountIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  uint64_t v13 = 2654435761 * self->_originVersionMajor;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v14 = 2654435761 * self->_originVersionMinor;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    uint64_t v15 = 2654435761 * self->_originVersionPatch;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v15 = 0;
LABEL_20:
  NSUInteger v16 = [(NSString *)self->_originVersionBuild hash];
  unint64_t v17 = [(HDCodableMessageVersion *)self->_messageVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double firstSeenDate = self->_firstSeenDate;
    double v20 = -firstSeenDate;
    if (firstSeenDate >= 0.0) {
      double v20 = self->_firstSeenDate;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  NSUInteger v23 = v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ [(NSString *)self->_firstSeenDateTimeZoneName hash];
  unint64_t v24 = [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  return v23 ^ v24 ^ [(NSData *)self->_uniquenessChecksum hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (*((void *)v4 + 10))
  {
    -[HDCodableFHIRResource setGatewayExternalID:](self, "setGatewayExternalID:");
    id v4 = v10;
  }
  if (*((void *)v4 + 15))
  {
    -[HDCodableFHIRResource setResourceID:](self, "setResourceID:");
    id v4 = v10;
  }
  if (*((void *)v4 + 13))
  {
    -[HDCodableFHIRResource setRawContent:](self, "setRawContent:");
    id v4 = v10;
  }
  if ((*((unsigned char *)v4 + 160) & 0x20) != 0)
  {
    self->_double receivedDate = *((double *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 16))
  {
    -[HDCodableFHIRResource setResourceType:](self, "setResourceType:");
    id v4 = v10;
  }
  if (*((void *)v4 + 8))
  {
    -[HDCodableFHIRResource setFhirVersion:](self, "setFhirVersion:");
    id v4 = v10;
  }
  if (*((void *)v4 + 14))
  {
    -[HDCodableFHIRResource setReceivedDateTimeZoneName:](self, "setReceivedDateTimeZoneName:");
    id v4 = v10;
  }
  if (*((void *)v4 + 17))
  {
    -[HDCodableFHIRResource setSourceURL:](self, "setSourceURL:");
    id v4 = v10;
  }
  if (*((unsigned char *)v4 + 160))
  {
    self->_extractionHints = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 7))
  {
    -[HDCodableFHIRResource setAccountIdentifier:](self, "setAccountIdentifier:");
    id v4 = v10;
  }
  char v5 = *((unsigned char *)v4 + 160);
  if ((v5 & 4) != 0)
  {
    self->_originVersionMajor = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 160);
    if ((v5 & 8) == 0)
    {
LABEL_23:
      if ((v5 & 0x10) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 8) == 0)
  {
    goto LABEL_23;
  }
  self->_originVersionMinor = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 160) & 0x10) != 0)
  {
LABEL_24:
    self->_originVersionPatch = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_25:
  if (*((void *)v4 + 12))
  {
    -[HDCodableFHIRResource setOriginVersionBuild:](self, "setOriginVersionBuild:");
    id v4 = v10;
  }
  messageVersion = self->_messageVersion;
  uint64_t v7 = *((void *)v4 + 11);
  if (messageVersion)
  {
    if (!v7) {
      goto LABEL_36;
    }
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_36;
    }
    -[HDCodableFHIRResource setMessageVersion:](self, "setMessageVersion:");
  }
  id v4 = v10;
LABEL_36:
  if ((*((unsigned char *)v4 + 160) & 2) != 0)
  {
    self->_double firstSeenDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 9))
  {
    -[HDCodableFHIRResource setFirstSeenDateTimeZoneName:](self, "setFirstSeenDateTimeZoneName:");
    id v4 = v10;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v9 = *((void *)v4 + 18);
  if (syncIdentity)
  {
    if (!v9) {
      goto LABEL_46;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_46;
    }
    -[HDCodableFHIRResource setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v10;
LABEL_46:
  if (*((void *)v4 + 19))
  {
    -[HDCodableFHIRResource setUniquenessChecksum:](self, "setUniquenessChecksum:");
    id v4 = v10;
  }
}

- (NSString)gatewayExternalID
{
  return self->_gatewayExternalID;
}

- (void)setGatewayExternalID:(id)a3
{
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (void)setRawContent:(id)a3
{
}

- (double)receivedDate
{
  return self->_receivedDate;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(id)a3
{
}

- (NSString)fhirVersion
{
  return self->_fhirVersion;
}

- (void)setFhirVersion:(id)a3
{
}

- (NSString)receivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName;
}

- (void)setReceivedDateTimeZoneName:(id)a3
{
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (int64_t)extractionHints
{
  return self->_extractionHints;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (int64_t)originVersionMajor
{
  return self->_originVersionMajor;
}

- (int64_t)originVersionMinor
{
  return self->_originVersionMinor;
}

- (int64_t)originVersionPatch
{
  return self->_originVersionPatch;
}

- (NSString)originVersionBuild
{
  return self->_originVersionBuild;
}

- (void)setOriginVersionBuild:(id)a3
{
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
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

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (NSData)uniquenessChecksum
{
  return self->_uniquenessChecksum;
}

- (void)setUniquenessChecksum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniquenessChecksum, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_receivedDateTimeZoneName, 0);
  objc_storeStrong((id *)&self->_rawContent, 0);
  objc_storeStrong((id *)&self->_originVersionBuild, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_gatewayExternalID, 0);
  objc_storeStrong((id *)&self->_firstSeenDateTimeZoneName, 0);
  objc_storeStrong((id *)&self->_fhirVersion, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end