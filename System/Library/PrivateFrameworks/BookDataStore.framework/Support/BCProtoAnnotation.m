@interface BCProtoAnnotation
- (BCAnnotationRange)selectedTextRange;
- (BOOL)deleted;
- (BOOL)hasAnnotationVersion;
- (BOOL)hasAssetVersion;
- (BOOL)hasAttachments;
- (BOOL)hasChapterTitle;
- (BOOL)hasDeleted;
- (BOOL)hasFutureProofing11;
- (BOOL)hasFutureProofing12;
- (BOOL)hasIsUnderline;
- (BOOL)hasLocationCFIString;
- (BOOL)hasLocationModificationDate;
- (BOOL)hasNote;
- (BOOL)hasPhysicalPageNumber;
- (BOOL)hasPlAbsolutePhysicalLocation;
- (BOOL)hasPlLocationRangeEnd;
- (BOOL)hasPlLocationRangeStart;
- (BOOL)hasPlLocationStorageUUID;
- (BOOL)hasPlUserData;
- (BOOL)hasReadingProgress;
- (BOOL)hasReadingProgressHighWaterMark;
- (BOOL)hasRepresentativeText;
- (BOOL)hasSelectedText;
- (BOOL)hasSelectedTextRange;
- (BOOL)hasSpineIndexUpdated;
- (BOOL)hasStyle;
- (BOOL)hasType;
- (BOOL)hasUserModificationDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnderline;
- (BOOL)readFrom:(id)a3;
- (BOOL)spineIndexUpdated;
- (NSData)plUserData;
- (NSString)annotationVersion;
- (NSString)assetVersion;
- (NSString)attachments;
- (NSString)chapterTitle;
- (NSString)creatorIdentifier;
- (NSString)futureProofing11;
- (NSString)futureProofing12;
- (NSString)locationCFIString;
- (NSString)note;
- (NSString)physicalPageNumber;
- (NSString)plLocationStorageUUID;
- (NSString)representativeText;
- (NSString)selectedText;
- (NSString)uuid;
- (double)creationDate;
- (double)locationModificationDate;
- (double)modificationDate;
- (double)userModificationDate;
- (float)readingProgress;
- (float)readingProgressHighWaterMark;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)plAbsolutePhysicalLocation;
- (int)plLocationRangeEnd;
- (int)plLocationRangeStart;
- (unint64_t)hash;
- (unsigned)style;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnnotationVersion:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setChapterTitle:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setCreatorIdentifier:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setFutureProofing11:(id)a3;
- (void)setFutureProofing12:(id)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasIsUnderline:(BOOL)a3;
- (void)setHasLocationModificationDate:(BOOL)a3;
- (void)setHasPlAbsolutePhysicalLocation:(BOOL)a3;
- (void)setHasPlLocationRangeEnd:(BOOL)a3;
- (void)setHasPlLocationRangeStart:(BOOL)a3;
- (void)setHasReadingProgress:(BOOL)a3;
- (void)setHasReadingProgressHighWaterMark:(BOOL)a3;
- (void)setHasSpineIndexUpdated:(BOOL)a3;
- (void)setHasStyle:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUserModificationDate:(BOOL)a3;
- (void)setIsUnderline:(BOOL)a3;
- (void)setLocationCFIString:(id)a3;
- (void)setLocationModificationDate:(double)a3;
- (void)setModificationDate:(double)a3;
- (void)setNote:(id)a3;
- (void)setPhysicalPageNumber:(id)a3;
- (void)setPlAbsolutePhysicalLocation:(int)a3;
- (void)setPlLocationRangeEnd:(int)a3;
- (void)setPlLocationRangeStart:(int)a3;
- (void)setPlLocationStorageUUID:(id)a3;
- (void)setPlUserData:(id)a3;
- (void)setReadingProgress:(float)a3;
- (void)setReadingProgressHighWaterMark:(float)a3;
- (void)setRepresentativeText:(id)a3;
- (void)setSelectedText:(id)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSpineIndexUpdated:(BOOL)a3;
- (void)setStyle:(unsigned int)a3;
- (void)setType:(unsigned int)a3;
- (void)setUserModificationDate:(double)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCProtoAnnotation

- (void)setDeleted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasDeleted
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsUnderline:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isUnderline = a3;
}

- (void)setHasIsUnderline:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsUnderline
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasLocationCFIString
{
  return self->_locationCFIString != 0;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (BOOL)hasRepresentativeText
{
  return self->_representativeText != 0;
}

- (BOOL)hasSelectedText
{
  return self->_selectedText != 0;
}

- (void)setStyle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStyle
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasPhysicalPageNumber
{
  return self->_physicalPageNumber != 0;
}

- (BOOL)hasAnnotationVersion
{
  return self->_annotationVersion != 0;
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (BOOL)hasAttachments
{
  return self->_attachments != 0;
}

- (BOOL)hasChapterTitle
{
  return self->_chapterTitle != 0;
}

- (void)setUserModificationDate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_userModificationDate = a3;
}

- (void)setHasUserModificationDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasUserModificationDate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasSelectedTextRange
{
  return self->_selectedTextRange != 0;
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_readingProgressHighWaterMark = a3;
}

- (void)setHasReadingProgressHighWaterMark:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasReadingProgressHighWaterMark
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSpineIndexUpdated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_spineIndexUpdated = a3;
}

- (void)setHasSpineIndexUpdated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSpineIndexUpdated
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setReadingProgress:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_readingProgress = a3;
}

- (void)setHasReadingProgress:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasReadingProgress
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasFutureProofing11
{
  return self->_futureProofing11 != 0;
}

- (BOOL)hasFutureProofing12
{
  return self->_futureProofing12 != 0;
}

- (void)setPlAbsolutePhysicalLocation:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_plAbsolutePhysicalLocation = a3;
}

- (void)setHasPlAbsolutePhysicalLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPlAbsolutePhysicalLocation
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPlLocationRangeEnd:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_plLocationRangeEnd = a3;
}

- (void)setHasPlLocationRangeEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPlLocationRangeEnd
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPlLocationRangeStart:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_plLocationRangeStart = a3;
}

- (void)setHasPlLocationRangeStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPlLocationRangeStart
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlLocationStorageUUID
{
  return self->_plLocationStorageUUID != 0;
}

- (BOOL)hasPlUserData
{
  return self->_plUserData != 0;
}

- (void)setLocationModificationDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_locationModificationDate = a3;
}

- (void)setHasLocationModificationDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLocationModificationDate
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BCProtoAnnotation;
  __int16 v3 = [(BCProtoAnnotation *)&v7 description];
  v4 = [(BCProtoAnnotation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithDouble:self->_creationDate];
  [v3 setObject:v4 forKey:@"creationDate"];

  creatorIdentifier = self->_creatorIdentifier;
  if (creatorIdentifier) {
    [v3 setObject:creatorIdentifier forKey:@"creatorIdentifier"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_deleted];
    [v3 setObject:v7 forKey:@"deleted"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_isUnderline];
    [v3 setObject:v8 forKey:@"isUnderline"];
  }
  locationCFIString = self->_locationCFIString;
  if (locationCFIString) {
    [v3 setObject:locationCFIString forKey:@"locationCFIString"];
  }
  v10 = +[NSNumber numberWithDouble:self->_modificationDate];
  [v3 setObject:v10 forKey:@"modificationDate"];

  note = self->_note;
  if (note) {
    [v3 setObject:note forKey:@"note"];
  }
  representativeText = self->_representativeText;
  if (representativeText) {
    [v3 setObject:representativeText forKey:@"representativeText"];
  }
  selectedText = self->_selectedText;
  if (selectedText) {
    [v3 setObject:selectedText forKey:@"selectedText"];
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x80) != 0)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_style];
    [v3 setObject:v16 forKey:@"style"];

    __int16 v15 = (__int16)self->_has;
  }
  if ((v15 & 0x100) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_type];
    [v3 setObject:v17 forKey:@"type"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  physicalPageNumber = self->_physicalPageNumber;
  if (physicalPageNumber) {
    [v3 setObject:physicalPageNumber forKey:@"physicalPageNumber"];
  }
  annotationVersion = self->_annotationVersion;
  if (annotationVersion) {
    [v3 setObject:annotationVersion forKey:@"annotationVersion"];
  }
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    [v3 setObject:assetVersion forKey:@"assetVersion"];
  }
  attachments = self->_attachments;
  if (attachments) {
    [v3 setObject:attachments forKey:@"attachments"];
  }
  chapterTitle = self->_chapterTitle;
  if (chapterTitle) {
    [v3 setObject:chapterTitle forKey:@"chapterTitle"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v24 = +[NSNumber numberWithDouble:self->_userModificationDate];
    [v3 setObject:v24 forKey:@"userModificationDate"];
  }
  selectedTextRange = self->_selectedTextRange;
  if (selectedTextRange)
  {
    v26 = [(BCAnnotationRange *)selectedTextRange dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"selectedTextRange"];
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x40) != 0)
  {
    *(float *)&double v11 = self->_readingProgressHighWaterMark;
    v37 = +[NSNumber numberWithFloat:v11];
    [v3 setObject:v37 forKey:@"readingProgressHighWaterMark"];

    __int16 v27 = (__int16)self->_has;
    if ((v27 & 0x800) == 0)
    {
LABEL_37:
      if ((v27 & 0x20) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_37;
  }
  v38 = +[NSNumber numberWithBool:self->_spineIndexUpdated];
  [v3 setObject:v38 forKey:@"spineIndexUpdated"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_38:
    *(float *)&double v11 = self->_readingProgress;
    v28 = +[NSNumber numberWithFloat:v11];
    [v3 setObject:v28 forKey:@"readingProgress"];
  }
LABEL_39:
  futureProofing11 = self->_futureProofing11;
  if (futureProofing11) {
    [v3 setObject:futureProofing11 forKey:@"futureProofing11"];
  }
  futureProofing12 = self->_futureProofing12;
  if (futureProofing12) {
    [v3 setObject:futureProofing12 forKey:@"futureProofing12"];
  }
  __int16 v31 = (__int16)self->_has;
  if ((v31 & 4) != 0)
  {
    v39 = +[NSNumber numberWithInt:self->_plAbsolutePhysicalLocation];
    [v3 setObject:v39 forKey:@"plAbsolutePhysicalLocation"];

    __int16 v31 = (__int16)self->_has;
    if ((v31 & 8) == 0)
    {
LABEL_45:
      if ((v31 & 0x10) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((v31 & 8) == 0)
  {
    goto LABEL_45;
  }
  v40 = +[NSNumber numberWithInt:self->_plLocationRangeEnd];
  [v3 setObject:v40 forKey:@"plLocationRangeEnd"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_46:
    v32 = +[NSNumber numberWithInt:self->_plLocationRangeStart];
    [v3 setObject:v32 forKey:@"plLocationRangeStart"];
  }
LABEL_47:
  plLocationStorageUUID = self->_plLocationStorageUUID;
  if (plLocationStorageUUID) {
    [v3 setObject:plLocationStorageUUID forKey:@"plLocationStorageUUID"];
  }
  plUserData = self->_plUserData;
  if (plUserData) {
    [v3 setObject:plUserData forKey:@"plUserData"];
  }
  if (*(_WORD *)&self->_has)
  {
    v35 = +[NSNumber numberWithDouble:self->_locationModificationDate];
    [v3 setObject:v35 forKey:@"locationModificationDate"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006D7AC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_creatorIdentifier) {
    sub_1001E9B78();
  }
  PBDataWriterWriteStringField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_locationCFIString) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteDoubleField();
  if (self->_note) {
    PBDataWriterWriteStringField();
  }
  if (self->_representativeText) {
    PBDataWriterWriteStringField();
  }
  if (self->_selectedText) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x100) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (!self->_uuid) {
    sub_1001E9BA4();
  }
  PBDataWriterWriteStringField();
  if (self->_physicalPageNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_annotationVersion) {
    PBDataWriterWriteStringField();
  }
  v6 = v9;
  if (self->_assetVersion)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_attachments)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_chapterTitle)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v9;
  }
  if (self->_selectedTextRange)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteFloatField();
    v6 = v9;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_35:
      if ((v7 & 0x20) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteBOOLField();
  v6 = v9;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_36:
    PBDataWriterWriteFloatField();
    v6 = v9;
  }
LABEL_37:
  if (self->_futureProofing11)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_futureProofing12)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v9;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_43:
      if ((v8 & 0x10) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteInt32Field();
  v6 = v9;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_44:
    PBDataWriterWriteInt32Field();
    v6 = v9;
  }
LABEL_45:
  if (self->_plLocationStorageUUID)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_plUserData)
  {
    PBDataWriterWriteDataField();
    v6 = v9;
  }
  if (*(_WORD *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    v6 = v9;
  }
}

- (void)copyTo:(id)a3
{
  v10 = a3;
  v10[1] = *(void *)&self->_creationDate;
  [v10 setCreatorIdentifier:self->_creatorIdentifier];
  v4 = v10;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((unsigned char *)v10 + 200) = self->_deleted;
    *((_WORD *)v10 + 102) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((unsigned char *)v10 + 201) = self->_isUnderline;
    *((_WORD *)v10 + 102) |= 0x400u;
  }
  if (self->_locationCFIString)
  {
    objc_msgSend(v10, "setLocationCFIString:");
    v4 = v10;
  }
  v4[3] = *(void *)&self->_modificationDate;
  if (self->_note)
  {
    objc_msgSend(v10, "setNote:");
    v4 = v10;
  }
  if (self->_representativeText)
  {
    objc_msgSend(v10, "setRepresentativeText:");
    v4 = v10;
  }
  if (self->_selectedText)
  {
    objc_msgSend(v10, "setSelectedText:");
    v4 = v10;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 46) = self->_style;
    *((_WORD *)v4 + 102) |= 0x80u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 47) = self->_type;
    *((_WORD *)v4 + 102) |= 0x100u;
  }
  [v4 setUuid:self->_uuid];
  if (self->_physicalPageNumber) {
    objc_msgSend(v10, "setPhysicalPageNumber:");
  }
  if (self->_annotationVersion) {
    objc_msgSend(v10, "setAnnotationVersion:");
  }
  __int16 v7 = v10;
  if (self->_assetVersion)
  {
    objc_msgSend(v10, "setAssetVersion:");
    __int16 v7 = v10;
  }
  if (self->_attachments)
  {
    objc_msgSend(v10, "setAttachments:");
    __int16 v7 = v10;
  }
  if (self->_chapterTitle)
  {
    objc_msgSend(v10, "setChapterTitle:");
    __int16 v7 = v10;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v7[4] = *(void *)&self->_userModificationDate;
    *((_WORD *)v7 + 102) |= 2u;
  }
  if (self->_selectedTextRange)
  {
    objc_msgSend(v10, "setSelectedTextRange:");
    __int16 v7 = v10;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    *((_DWORD *)v7 + 39) = LODWORD(self->_readingProgressHighWaterMark);
    *((_WORD *)v7 + 102) |= 0x40u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x800) == 0)
    {
LABEL_33:
      if ((v8 & 0x20) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_33;
  }
  *((unsigned char *)v7 + 202) = self->_spineIndexUpdated;
  *((_WORD *)v7 + 102) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_34:
    *((_DWORD *)v7 + 38) = LODWORD(self->_readingProgress);
    *((_WORD *)v7 + 102) |= 0x20u;
  }
LABEL_35:
  if (self->_futureProofing11)
  {
    objc_msgSend(v10, "setFutureProofing11:");
    __int16 v7 = v10;
  }
  if (self->_futureProofing12)
  {
    objc_msgSend(v10, "setFutureProofing12:");
    __int16 v7 = v10;
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 4) != 0)
  {
    *((_DWORD *)v7 + 30) = self->_plAbsolutePhysicalLocation;
    *((_WORD *)v7 + 102) |= 4u;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 8) == 0)
    {
LABEL_41:
      if ((v9 & 0x10) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((v9 & 8) == 0)
  {
    goto LABEL_41;
  }
  *((_DWORD *)v7 + 31) = self->_plLocationRangeEnd;
  *((_WORD *)v7 + 102) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_42:
    *((_DWORD *)v7 + 32) = self->_plLocationRangeStart;
    *((_WORD *)v7 + 102) |= 0x10u;
  }
LABEL_43:
  if (self->_plLocationStorageUUID)
  {
    objc_msgSend(v10, "setPlLocationStorageUUID:");
    __int16 v7 = v10;
  }
  if (self->_plUserData)
  {
    objc_msgSend(v10, "setPlUserData:");
    __int16 v7 = v10;
  }
  if (*(_WORD *)&self->_has)
  {
    v7[2] = *(void *)&self->_locationModificationDate;
    *((_WORD *)v7 + 102) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = *(void *)&self->_creationDate;
  id v6 = [(NSString *)self->_creatorIdentifier copyWithZone:a3];
  __int16 v7 = (void *)v5[9];
  v5[9] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((unsigned char *)v5 + 200) = self->_deleted;
    *((_WORD *)v5 + 102) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((unsigned char *)v5 + 201) = self->_isUnderline;
    *((_WORD *)v5 + 102) |= 0x400u;
  }
  id v9 = [(NSString *)self->_locationCFIString copyWithZone:a3];
  v10 = (void *)v5[12];
  v5[12] = v9;

  v5[3] = *(void *)&self->_modificationDate;
  id v11 = [(NSString *)self->_note copyWithZone:a3];
  v12 = (void *)v5[13];
  v5[13] = v11;

  id v13 = [(NSString *)self->_representativeText copyWithZone:a3];
  v14 = (void *)v5[20];
  v5[20] = v13;

  id v15 = [(NSString *)self->_selectedText copyWithZone:a3];
  v16 = (void *)v5[21];
  v5[21] = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x80) != 0)
  {
    *((_DWORD *)v5 + 46) = self->_style;
    *((_WORD *)v5 + 102) |= 0x80u;
    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 0x100) != 0)
  {
    *((_DWORD *)v5 + 47) = self->_type;
    *((_WORD *)v5 + 102) |= 0x100u;
  }
  id v18 = [(NSString *)self->_uuid copyWithZone:a3];
  v19 = (void *)v5[24];
  v5[24] = v18;

  id v20 = [(NSString *)self->_physicalPageNumber copyWithZone:a3];
  v21 = (void *)v5[14];
  v5[14] = v20;

  id v22 = [(NSString *)self->_annotationVersion copyWithZone:a3];
  v23 = (void *)v5[5];
  v5[5] = v22;

  id v24 = [(NSString *)self->_assetVersion copyWithZone:a3];
  v25 = (void *)v5[6];
  v5[6] = v24;

  id v26 = [(NSString *)self->_attachments copyWithZone:a3];
  __int16 v27 = (void *)v5[7];
  v5[7] = v26;

  id v28 = [(NSString *)self->_chapterTitle copyWithZone:a3];
  v29 = (void *)v5[8];
  v5[8] = v28;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v5[4] = *(void *)&self->_userModificationDate;
    *((_WORD *)v5 + 102) |= 2u;
  }
  id v30 = [(BCAnnotationRange *)self->_selectedTextRange copyWithZone:a3];
  __int16 v31 = (void *)v5[22];
  v5[22] = v30;

  __int16 v32 = (__int16)self->_has;
  if ((v32 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 39) = LODWORD(self->_readingProgressHighWaterMark);
    *((_WORD *)v5 + 102) |= 0x40u;
    __int16 v32 = (__int16)self->_has;
    if ((v32 & 0x800) == 0)
    {
LABEL_13:
      if ((v32 & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v5 + 202) = self->_spineIndexUpdated;
  *((_WORD *)v5 + 102) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    *((_DWORD *)v5 + 38) = LODWORD(self->_readingProgress);
    *((_WORD *)v5 + 102) |= 0x20u;
  }
LABEL_15:
  id v33 = [(NSString *)self->_futureProofing11 copyWithZone:a3];
  v34 = (void *)v5[10];
  v5[10] = v33;

  id v35 = [(NSString *)self->_futureProofing12 copyWithZone:a3];
  v36 = (void *)v5[11];
  v5[11] = v35;

  __int16 v37 = (__int16)self->_has;
  if ((v37 & 4) != 0)
  {
    *((_DWORD *)v5 + 30) = self->_plAbsolutePhysicalLocation;
    *((_WORD *)v5 + 102) |= 4u;
    __int16 v37 = (__int16)self->_has;
    if ((v37 & 8) == 0)
    {
LABEL_17:
      if ((v37 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v37 & 8) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v5 + 31) = self->_plLocationRangeEnd;
  *((_WORD *)v5 + 102) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    *((_DWORD *)v5 + 32) = self->_plLocationRangeStart;
    *((_WORD *)v5 + 102) |= 0x10u;
  }
LABEL_19:
  id v38 = [(NSString *)self->_plLocationStorageUUID copyWithZone:a3];
  v39 = (void *)v5[17];
  v5[17] = v38;

  id v40 = [(NSData *)self->_plUserData copyWithZone:a3];
  v41 = (void *)v5[18];
  v5[18] = v40;

  if (*(_WORD *)&self->_has)
  {
    v5[2] = *(void *)&self->_locationModificationDate;
    *((_WORD *)v5 + 102) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_106;
  }
  if (self->_creationDate != *((double *)v4 + 1)) {
    goto LABEL_106;
  }
  creatorIdentifier = self->_creatorIdentifier;
  if ((unint64_t)creatorIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](creatorIdentifier, "isEqual:")) {
      goto LABEL_106;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0) {
      goto LABEL_106;
    }
    if (self->_deleted)
    {
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 200))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x400) == 0) {
      goto LABEL_106;
    }
    if (self->_isUnderline)
    {
      if (!*((unsigned char *)v4 + 201)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 201))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  locationCFIString = self->_locationCFIString;
  if ((unint64_t)locationCFIString | *((void *)v4 + 12)
    && !-[NSString isEqual:](locationCFIString, "isEqual:"))
  {
    goto LABEL_106;
  }
  if (self->_modificationDate != *((double *)v4 + 3)) {
    goto LABEL_106;
  }
  note = self->_note;
  if ((unint64_t)note | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](note, "isEqual:")) {
      goto LABEL_106;
    }
  }
  representativeText = self->_representativeText;
  if ((unint64_t)representativeText | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](representativeText, "isEqual:")) {
      goto LABEL_106;
    }
  }
  selectedText = self->_selectedText;
  if ((unint64_t)selectedText | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](selectedText, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_style != *((_DWORD *)v4 + 46)) {
      goto LABEL_106;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0 || self->_type != *((_DWORD *)v4 + 47)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 24) && !-[NSString isEqual:](uuid, "isEqual:")) {
    goto LABEL_106;
  }
  physicalPageNumber = self->_physicalPageNumber;
  if ((unint64_t)physicalPageNumber | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](physicalPageNumber, "isEqual:")) {
      goto LABEL_106;
    }
  }
  annotationVersion = self->_annotationVersion;
  if ((unint64_t)annotationVersion | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](annotationVersion, "isEqual:")) {
      goto LABEL_106;
    }
  }
  assetVersion = self->_assetVersion;
  if ((unint64_t)assetVersion | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](assetVersion, "isEqual:")) {
      goto LABEL_106;
    }
  }
  attachments = self->_attachments;
  if ((unint64_t)attachments | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](attachments, "isEqual:")) {
      goto LABEL_106;
    }
  }
  chapterTitle = self->_chapterTitle;
  if ((unint64_t)chapterTitle | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](chapterTitle, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v18 = *((_WORD *)v4 + 102);
  if ((has & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_userModificationDate != *((double *)v4 + 4)) {
      goto LABEL_106;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_106;
  }
  selectedTextRange = self->_selectedTextRange;
  if ((unint64_t)selectedTextRange | *((void *)v4 + 22))
  {
    if (!-[BCAnnotationRange isEqual:](selectedTextRange, "isEqual:")) {
      goto LABEL_106;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v20 = *((_WORD *)v4 + 102);
  if ((has & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_readingProgressHighWaterMark != *((float *)v4 + 39)) {
      goto LABEL_106;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x800) != 0)
    {
      if (self->_spineIndexUpdated)
      {
        if (!*((unsigned char *)v4 + 202)) {
          goto LABEL_106;
        }
        goto LABEL_73;
      }
      if (!*((unsigned char *)v4 + 202)) {
        goto LABEL_73;
      }
    }
LABEL_106:
    BOOL v28 = 0;
    goto LABEL_107;
  }
  if ((*((_WORD *)v4 + 102) & 0x800) != 0) {
    goto LABEL_106;
  }
LABEL_73:
  if ((has & 0x20) != 0)
  {
    if ((v20 & 0x20) == 0 || self->_readingProgress != *((float *)v4 + 38)) {
      goto LABEL_106;
    }
  }
  else if ((v20 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  futureProofing11 = self->_futureProofing11;
  if ((unint64_t)futureProofing11 | *((void *)v4 + 10)
    && !-[NSString isEqual:](futureProofing11, "isEqual:"))
  {
    goto LABEL_106;
  }
  futureProofing12 = self->_futureProofing12;
  if ((unint64_t)futureProofing12 | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](futureProofing12, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 v23 = (__int16)self->_has;
  __int16 v24 = *((_WORD *)v4 + 102);
  if ((v23 & 4) != 0)
  {
    if ((v24 & 4) == 0 || self->_plAbsolutePhysicalLocation != *((_DWORD *)v4 + 30)) {
      goto LABEL_106;
    }
  }
  else if ((v24 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((v23 & 8) != 0)
  {
    if ((v24 & 8) == 0 || self->_plLocationRangeEnd != *((_DWORD *)v4 + 31)) {
      goto LABEL_106;
    }
  }
  else if ((v24 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((v23 & 0x10) != 0)
  {
    if ((v24 & 0x10) == 0 || self->_plLocationRangeStart != *((_DWORD *)v4 + 32)) {
      goto LABEL_106;
    }
  }
  else if ((v24 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  plLocationStorageUUID = self->_plLocationStorageUUID;
  if ((unint64_t)plLocationStorageUUID | *((void *)v4 + 17)
    && !-[NSString isEqual:](plLocationStorageUUID, "isEqual:"))
  {
    goto LABEL_106;
  }
  plUserData = self->_plUserData;
  if ((unint64_t)plUserData | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](plUserData, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 v27 = *((_WORD *)v4 + 102);
  if (*(_WORD *)&self->_has)
  {
    if ((v27 & 1) == 0 || self->_locationModificationDate != *((double *)v4 + 2)) {
      goto LABEL_106;
    }
    BOOL v28 = 1;
  }
  else
  {
    BOOL v28 = (v27 & 1) == 0;
  }
LABEL_107:

  return v28;
}

- (unint64_t)hash
{
  double creationDate = self->_creationDate;
  double v4 = -creationDate;
  if (creationDate >= 0.0) {
    double v4 = self->_creationDate;
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
  unint64_t v72 = v10;
  NSUInteger v71 = [(NSString *)self->_creatorIdentifier hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v70 = 2654435761 * self->_deleted;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v70 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_9:
      uint64_t v69 = 2654435761 * self->_isUnderline;
      goto LABEL_12;
    }
  }
  uint64_t v69 = 0;
LABEL_12:
  NSUInteger v68 = [(NSString *)self->_locationCFIString hash];
  double modificationDate = self->_modificationDate;
  double v12 = -modificationDate;
  if (modificationDate >= 0.0) {
    double v12 = self->_modificationDate;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  double v15 = fmod(v13, 1.84467441e19);
  unint64_t v16 = 2654435761u * (unint64_t)v15;
  unint64_t v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0) {
    unint64_t v17 = 2654435761u * (unint64_t)v15;
  }
  unint64_t v18 = v16 - (unint64_t)fabs(v14);
  if (v14 >= 0.0) {
    unint64_t v18 = v17;
  }
  unint64_t v67 = v18;
  NSUInteger v66 = [(NSString *)self->_note hash];
  NSUInteger v65 = [(NSString *)self->_representativeText hash];
  NSUInteger v64 = [(NSString *)self->_selectedText hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t v63 = 2654435761 * self->_style;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v63 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_20:
      uint64_t v62 = 2654435761 * self->_type;
      goto LABEL_23;
    }
  }
  uint64_t v62 = 0;
LABEL_23:
  NSUInteger v61 = [(NSString *)self->_uuid hash];
  NSUInteger v60 = [(NSString *)self->_physicalPageNumber hash];
  NSUInteger v59 = [(NSString *)self->_annotationVersion hash];
  NSUInteger v58 = [(NSString *)self->_assetVersion hash];
  NSUInteger v57 = [(NSString *)self->_attachments hash];
  NSUInteger v56 = [(NSString *)self->_chapterTitle hash];
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    double userModificationDate = self->_userModificationDate;
    double v21 = -userModificationDate;
    if (userModificationDate >= 0.0) {
      double v21 = self->_userModificationDate;
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
  unint64_t v55 = v19;
  unint64_t v54 = [(BCAnnotationRange *)self->_selectedTextRange hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    float readingProgressHighWaterMark = self->_readingProgressHighWaterMark;
    double v27 = readingProgressHighWaterMark;
    if (readingProgressHighWaterMark < 0.0) {
      double v27 = -readingProgressHighWaterMark;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((has & 0x800) != 0) {
    uint64_t v52 = 2654435761 * self->_spineIndexUpdated;
  }
  else {
    uint64_t v52 = 0;
  }
  unint64_t v53 = v25;
  if ((has & 0x20) != 0)
  {
    float readingProgress = self->_readingProgress;
    double v32 = readingProgress;
    if (readingProgress < 0.0) {
      double v32 = -readingProgress;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_futureProofing11 hash];
  NSUInteger v35 = [(NSString *)self->_futureProofing12 hash];
  __int16 v36 = (__int16)self->_has;
  if ((v36 & 4) == 0)
  {
    uint64_t v37 = 0;
    if ((v36 & 8) != 0) {
      goto LABEL_52;
    }
LABEL_55:
    uint64_t v38 = 0;
    if ((v36 & 0x10) != 0) {
      goto LABEL_53;
    }
    goto LABEL_56;
  }
  uint64_t v37 = 2654435761 * self->_plAbsolutePhysicalLocation;
  if ((v36 & 8) == 0) {
    goto LABEL_55;
  }
LABEL_52:
  uint64_t v38 = 2654435761 * self->_plLocationRangeEnd;
  if ((v36 & 0x10) != 0)
  {
LABEL_53:
    uint64_t v39 = 2654435761 * self->_plLocationRangeStart;
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v39 = 0;
LABEL_57:
  NSUInteger v40 = [(NSString *)self->_plLocationStorageUUID hash];
  unint64_t v41 = (unint64_t)[(NSData *)self->_plUserData hash];
  if (*(_WORD *)&self->_has)
  {
    double locationModificationDate = self->_locationModificationDate;
    double v44 = -locationModificationDate;
    if (locationModificationDate >= 0.0) {
      double v44 = self->_locationModificationDate;
    }
    long double v45 = floor(v44 + 0.5);
    double v46 = (v44 - v45) * 1.84467441e19;
    double v47 = fmod(v45, 1.84467441e19);
    unint64_t v48 = 2654435761u * (unint64_t)v47;
    unint64_t v49 = v48 + (unint64_t)v46;
    if (v46 <= 0.0) {
      unint64_t v49 = 2654435761u * (unint64_t)v47;
    }
    unint64_t v42 = v48 - (unint64_t)fabs(v46);
    if (v46 >= 0.0) {
      unint64_t v42 = v49;
    }
  }
  else
  {
    unint64_t v42 = 0;
  }
  return v71 ^ v72 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v30 ^ v51 ^ v35 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_double creationDate = *((double *)v4 + 1);
  id v11 = v4;
  if (*((void *)v4 + 9))
  {
    -[BCProtoAnnotation setCreatorIdentifier:](self, "setCreatorIdentifier:");
    id v4 = v11;
  }
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x200) != 0)
  {
    self->_deleted = *((unsigned char *)v4 + 200);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 102);
  }
  if ((v5 & 0x400) != 0)
  {
    self->_isUnderline = *((unsigned char *)v4 + 201);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v4 + 12))
  {
    -[BCProtoAnnotation setLocationCFIString:](self, "setLocationCFIString:");
    id v4 = v11;
  }
  self->_double modificationDate = *((double *)v4 + 3);
  if (*((void *)v4 + 13))
  {
    -[BCProtoAnnotation setNote:](self, "setNote:");
    id v4 = v11;
  }
  if (*((void *)v4 + 20))
  {
    -[BCProtoAnnotation setRepresentativeText:](self, "setRepresentativeText:");
    id v4 = v11;
  }
  if (*((void *)v4 + 21))
  {
    -[BCProtoAnnotation setSelectedText:](self, "setSelectedText:");
    id v4 = v11;
  }
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((v6 & 0x80) != 0)
  {
    self->_style = *((_DWORD *)v4 + 46);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v6 = *((_WORD *)v4 + 102);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_type = *((_DWORD *)v4 + 47);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 24))
  {
    -[BCProtoAnnotation setUuid:](self, "setUuid:");
    id v4 = v11;
  }
  if (*((void *)v4 + 14))
  {
    -[BCProtoAnnotation setPhysicalPageNumber:](self, "setPhysicalPageNumber:");
    id v4 = v11;
  }
  if (*((void *)v4 + 5))
  {
    -[BCProtoAnnotation setAnnotationVersion:](self, "setAnnotationVersion:");
    id v4 = v11;
  }
  if (*((void *)v4 + 6))
  {
    -[BCProtoAnnotation setAssetVersion:](self, "setAssetVersion:");
    id v4 = v11;
  }
  if (*((void *)v4 + 7))
  {
    -[BCProtoAnnotation setAttachments:](self, "setAttachments:");
    id v4 = v11;
  }
  if (*((void *)v4 + 8))
  {
    -[BCProtoAnnotation setChapterTitle:](self, "setChapterTitle:");
    id v4 = v11;
  }
  if ((*((_WORD *)v4 + 102) & 2) != 0)
  {
    self->_double userModificationDate = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
  selectedTextRange = self->_selectedTextRange;
  uint64_t v8 = *((void *)v4 + 22);
  if (selectedTextRange)
  {
    if (!v8) {
      goto LABEL_39;
    }
    -[BCAnnotationRange mergeFrom:](selectedTextRange, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_39;
    }
    -[BCProtoAnnotation setSelectedTextRange:](self, "setSelectedTextRange:");
  }
  id v4 = v11;
LABEL_39:
  __int16 v9 = *((_WORD *)v4 + 102);
  if ((v9 & 0x40) != 0)
  {
    self->_float readingProgressHighWaterMark = *((float *)v4 + 39);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v9 = *((_WORD *)v4 + 102);
    if ((v9 & 0x800) == 0)
    {
LABEL_41:
      if ((v9 & 0x20) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) == 0)
  {
    goto LABEL_41;
  }
  self->_spineIndexUpdated = *((unsigned char *)v4 + 202);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_42:
    self->_float readingProgress = *((float *)v4 + 38);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_43:
  if (*((void *)v4 + 10))
  {
    -[BCProtoAnnotation setFutureProofing11:](self, "setFutureProofing11:");
    id v4 = v11;
  }
  if (*((void *)v4 + 11))
  {
    -[BCProtoAnnotation setFutureProofing12:](self, "setFutureProofing12:");
    id v4 = v11;
  }
  __int16 v10 = *((_WORD *)v4 + 102);
  if ((v10 & 4) != 0)
  {
    self->_plAbsolutePhysicalLocation = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 4u;
    __int16 v10 = *((_WORD *)v4 + 102);
    if ((v10 & 8) == 0)
    {
LABEL_49:
      if ((v10 & 0x10) == 0) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_49;
  }
  self->_plLocationRangeEnd = *((_DWORD *)v4 + 31);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 102) & 0x10) != 0)
  {
LABEL_50:
    self->_plLocationRangeStart = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_51:
  if (*((void *)v4 + 17))
  {
    -[BCProtoAnnotation setPlLocationStorageUUID:](self, "setPlLocationStorageUUID:");
    id v4 = v11;
  }
  if (*((void *)v4 + 18))
  {
    -[BCProtoAnnotation setPlUserData:](self, "setPlUserData:");
    id v4 = v11;
  }
  if (*((_WORD *)v4 + 102))
  {
    self->_double locationModificationDate = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  _objc_release_x1();
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_double creationDate = a3;
}

- (NSString)creatorIdentifier
{
  return self->_creatorIdentifier;
}

- (void)setCreatorIdentifier:(id)a3
{
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (BOOL)isUnderline
{
  return self->_isUnderline;
}

- (NSString)locationCFIString
{
  return self->_locationCFIString;
}

- (void)setLocationCFIString:(id)a3
{
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(double)a3
{
  self->_double modificationDate = a3;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (NSString)representativeText
{
  return self->_representativeText;
}

- (void)setRepresentativeText:(id)a3
{
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
}

- (unsigned)style
{
  return self->_style;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)physicalPageNumber
{
  return self->_physicalPageNumber;
}

- (void)setPhysicalPageNumber:(id)a3
{
}

- (NSString)annotationVersion
{
  return self->_annotationVersion;
}

- (void)setAnnotationVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSString)chapterTitle
{
  return self->_chapterTitle;
}

- (void)setChapterTitle:(id)a3
{
}

- (double)userModificationDate
{
  return self->_userModificationDate;
}

- (BCAnnotationRange)selectedTextRange
{
  return self->_selectedTextRange;
}

- (void)setSelectedTextRange:(id)a3
{
}

- (float)readingProgressHighWaterMark
{
  return self->_readingProgressHighWaterMark;
}

- (BOOL)spineIndexUpdated
{
  return self->_spineIndexUpdated;
}

- (float)readingProgress
{
  return self->_readingProgress;
}

- (NSString)futureProofing11
{
  return self->_futureProofing11;
}

- (void)setFutureProofing11:(id)a3
{
}

- (NSString)futureProofing12
{
  return self->_futureProofing12;
}

- (void)setFutureProofing12:(id)a3
{
}

- (int)plAbsolutePhysicalLocation
{
  return self->_plAbsolutePhysicalLocation;
}

- (int)plLocationRangeEnd
{
  return self->_plLocationRangeEnd;
}

- (int)plLocationRangeStart
{
  return self->_plLocationRangeStart;
}

- (NSString)plLocationStorageUUID
{
  return self->_plLocationStorageUUID;
}

- (void)setPlLocationStorageUUID:(id)a3
{
}

- (NSData)plUserData
{
  return self->_plUserData;
}

- (void)setPlUserData:(id)a3
{
}

- (double)locationModificationDate
{
  return self->_locationModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_selectedTextRange, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_representativeText, 0);
  objc_storeStrong((id *)&self->_plUserData, 0);
  objc_storeStrong((id *)&self->_plLocationStorageUUID, 0);
  objc_storeStrong((id *)&self->_physicalPageNumber, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_locationCFIString, 0);
  objc_storeStrong((id *)&self->_futureProofing12, 0);
  objc_storeStrong((id *)&self->_futureProofing11, 0);
  objc_storeStrong((id *)&self->_creatorIdentifier, 0);
  objc_storeStrong((id *)&self->_chapterTitle, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_annotationVersion, 0);
}

@end