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
  __int16 v3 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)BCProtoAnnotation;
  v4 = [(BCProtoAnnotation *)&v21 description];
  v12 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8, v9, v10, v11);
  v19 = objc_msgSend_stringWithFormat_(v3, v13, @"%@ %@", v14, v15, v16, v17, v18, v4, v12);

  return v19;
}

- (id)dictionaryRepresentation
{
  uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, v13, v14, v15, v16, self->_creationDate);
  objc_msgSend_setObject_forKey_(v9, v18, (uint64_t)v17, @"creationDate", v19, v20, v21, v22);

  creatorIdentifier = self->_creatorIdentifier;
  if (creatorIdentifier) {
    objc_msgSend_setObject_forKey_(v9, v23, (uint64_t)creatorIdentifier, @"creatorIdentifier", v25, v26, v27, v28);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v31 = objc_msgSend_numberWithBool_(NSNumber, v23, self->_deleted, v24, v25, v26, v27, v28);
    objc_msgSend_setObject_forKey_(v9, v32, (uint64_t)v31, @"deleted", v33, v34, v35, v36);

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    v37 = objc_msgSend_numberWithBool_(NSNumber, v23, self->_isUnderline, v24, v25, v26, v27, v28);
    objc_msgSend_setObject_forKey_(v9, v38, (uint64_t)v37, @"isUnderline", v39, v40, v41, v42);
  }
  locationCFIString = self->_locationCFIString;
  if (locationCFIString) {
    objc_msgSend_setObject_forKey_(v9, v23, (uint64_t)locationCFIString, @"locationCFIString", v25, v26, v27, v28);
  }
  v44 = objc_msgSend_numberWithDouble_(NSNumber, v23, (uint64_t)locationCFIString, v24, v25, v26, v27, v28, self->_modificationDate);
  objc_msgSend_setObject_forKey_(v9, v45, (uint64_t)v44, @"modificationDate", v46, v47, v48, v49);

  note = self->_note;
  if (note) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)note, @"note", v52, v53, v54, v55);
  }
  representativeText = self->_representativeText;
  if (representativeText) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)representativeText, @"representativeText", v52, v53, v54, v55);
  }
  selectedText = self->_selectedText;
  if (selectedText) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)selectedText, @"selectedText", v52, v53, v54, v55);
  }
  __int16 v60 = (__int16)self->_has;
  if ((v60 & 0x80) != 0)
  {
    v61 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v50, self->_style, v51, v52, v53, v54, v55);
    objc_msgSend_setObject_forKey_(v9, v62, (uint64_t)v61, @"style", v63, v64, v65, v66);

    __int16 v60 = (__int16)self->_has;
  }
  if ((v60 & 0x100) != 0)
  {
    v67 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v50, self->_type, v51, v52, v53, v54, v55);
    objc_msgSend_setObject_forKey_(v9, v68, (uint64_t)v67, @"type", v69, v70, v71, v72);
  }
  uuid = self->_uuid;
  if (uuid) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)uuid, @"uuid", v52, v53, v54, v55);
  }
  physicalPageNumber = self->_physicalPageNumber;
  if (physicalPageNumber) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)physicalPageNumber, @"physicalPageNumber", v52, v53, v54, v55);
  }
  annotationVersion = self->_annotationVersion;
  if (annotationVersion) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)annotationVersion, @"annotationVersion", v52, v53, v54, v55);
  }
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)assetVersion, @"assetVersion", v52, v53, v54, v55);
  }
  attachments = self->_attachments;
  if (attachments) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)attachments, @"attachments", v52, v53, v54, v55);
  }
  chapterTitle = self->_chapterTitle;
  if (chapterTitle) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)chapterTitle, @"chapterTitle", v52, v53, v54, v55);
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v79 = objc_msgSend_numberWithDouble_(NSNumber, v50, (uint64_t)chapterTitle, v51, v52, v53, v54, v55, self->_userModificationDate);
    objc_msgSend_setObject_forKey_(v9, v80, (uint64_t)v79, @"userModificationDate", v81, v82, v83, v84);
  }
  selectedTextRange = self->_selectedTextRange;
  if (selectedTextRange)
  {
    v86 = objc_msgSend_dictionaryRepresentation(selectedTextRange, v50, (uint64_t)chapterTitle, v51, v52, v53, v54, v55);
    objc_msgSend_setObject_forKey_(v9, v87, (uint64_t)v86, @"selectedTextRange", v88, v89, v90, v91);
  }
  __int16 v92 = (__int16)self->_has;
  if ((v92 & 0x40) != 0)
  {
    *(float *)&double v56 = self->_readingProgressHighWaterMark;
    v117 = objc_msgSend_numberWithFloat_(NSNumber, v50, (uint64_t)chapterTitle, v51, v52, v53, v54, v55, v56);
    objc_msgSend_setObject_forKey_(v9, v118, (uint64_t)v117, @"readingProgressHighWaterMark", v119, v120, v121, v122);

    __int16 v92 = (__int16)self->_has;
    if ((v92 & 0x800) == 0)
    {
LABEL_37:
      if ((v92 & 0x20) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_37;
  }
  v123 = objc_msgSend_numberWithBool_(NSNumber, v50, self->_spineIndexUpdated, v51, v52, v53, v54, v55);
  objc_msgSend_setObject_forKey_(v9, v124, (uint64_t)v123, @"spineIndexUpdated", v125, v126, v127, v128);

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_38:
    *(float *)&double v56 = self->_readingProgress;
    v93 = objc_msgSend_numberWithFloat_(NSNumber, v50, (uint64_t)chapterTitle, v51, v52, v53, v54, v55, v56);
    objc_msgSend_setObject_forKey_(v9, v94, (uint64_t)v93, @"readingProgress", v95, v96, v97, v98);
  }
LABEL_39:
  futureProofing11 = self->_futureProofing11;
  if (futureProofing11) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)futureProofing11, @"futureProofing11", v52, v53, v54, v55);
  }
  futureProofing12 = self->_futureProofing12;
  if (futureProofing12) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)futureProofing12, @"futureProofing12", v52, v53, v54, v55);
  }
  __int16 v101 = (__int16)self->_has;
  if ((v101 & 4) != 0)
  {
    v129 = objc_msgSend_numberWithInt_(NSNumber, v50, self->_plAbsolutePhysicalLocation, v51, v52, v53, v54, v55);
    objc_msgSend_setObject_forKey_(v9, v130, (uint64_t)v129, @"plAbsolutePhysicalLocation", v131, v132, v133, v134);

    __int16 v101 = (__int16)self->_has;
    if ((v101 & 8) == 0)
    {
LABEL_45:
      if ((v101 & 0x10) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((v101 & 8) == 0)
  {
    goto LABEL_45;
  }
  v135 = objc_msgSend_numberWithInt_(NSNumber, v50, self->_plLocationRangeEnd, v51, v52, v53, v54, v55);
  objc_msgSend_setObject_forKey_(v9, v136, (uint64_t)v135, @"plLocationRangeEnd", v137, v138, v139, v140);

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_46:
    v102 = objc_msgSend_numberWithInt_(NSNumber, v50, self->_plLocationRangeStart, v51, v52, v53, v54, v55);
    objc_msgSend_setObject_forKey_(v9, v103, (uint64_t)v102, @"plLocationRangeStart", v104, v105, v106, v107);
  }
LABEL_47:
  plLocationStorageUUID = self->_plLocationStorageUUID;
  if (plLocationStorageUUID) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)plLocationStorageUUID, @"plLocationStorageUUID", v52, v53, v54, v55);
  }
  plUserData = self->_plUserData;
  if (plUserData) {
    objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)plUserData, @"plUserData", v52, v53, v54, v55);
  }
  if (*(_WORD *)&self->_has)
  {
    v110 = objc_msgSend_numberWithDouble_(NSNumber, v50, (uint64_t)plUserData, v51, v52, v53, v54, v55, self->_locationModificationDate);
    objc_msgSend_setObject_forKey_(v9, v111, (uint64_t)v110, @"locationModificationDate", v112, v113, v114, v115);
  }
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return BCProtoAnnotationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_creatorIdentifier) {
    sub_2361F9608();
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
    sub_2361F9634();
  }
  PBDataWriterWriteStringField();
  if (self->_physicalPageNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_annotationVersion) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = v9;
  if (self->_assetVersion)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v9;
  }
  if (self->_attachments)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v9;
  }
  if (self->_chapterTitle)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v9;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v6 = v9;
  }
  if (self->_selectedTextRange)
  {
    PBDataWriterWriteSubmessage();
    uint64_t v6 = v9;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteFloatField();
    uint64_t v6 = v9;
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
  uint64_t v6 = v9;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_36:
    PBDataWriterWriteFloatField();
    uint64_t v6 = v9;
  }
LABEL_37:
  if (self->_futureProofing11)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v9;
  }
  if (self->_futureProofing12)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v9;
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
  uint64_t v6 = v9;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_44:
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v9;
  }
LABEL_45:
  if (self->_plLocationStorageUUID)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v9;
  }
  if (self->_plUserData)
  {
    PBDataWriterWriteDataField();
    uint64_t v6 = v9;
  }
  if (*(_WORD *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v6 = v9;
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v42 = a3;
  v42[1] = *(void *)&self->_creationDate;
  objc_msgSend_setCreatorIdentifier_(v42, v4, (uint64_t)self->_creatorIdentifier, v5, v6, v7, v8, v9);
  uint64_t v16 = v42;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((unsigned char *)v42 + 200) = self->_deleted;
    *((_WORD *)v42 + 102) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((unsigned char *)v42 + 201) = self->_isUnderline;
    *((_WORD *)v42 + 102) |= 0x400u;
  }
  locationCFIString = self->_locationCFIString;
  if (locationCFIString)
  {
    objc_msgSend_setLocationCFIString_(v42, v10, (uint64_t)locationCFIString, v11, v12, v13, v14, v15);
    uint64_t v16 = v42;
  }
  v16[3] = *(void *)&self->_modificationDate;
  note = self->_note;
  if (note)
  {
    objc_msgSend_setNote_(v42, v10, (uint64_t)note, v11, v12, v13, v14, v15);
    uint64_t v16 = v42;
  }
  representativeText = self->_representativeText;
  if (representativeText)
  {
    objc_msgSend_setRepresentativeText_(v42, v10, (uint64_t)representativeText, v11, v12, v13, v14, v15);
    uint64_t v16 = v42;
  }
  selectedText = self->_selectedText;
  if (selectedText)
  {
    objc_msgSend_setSelectedText_(v42, v10, (uint64_t)selectedText, v11, v12, v13, v14, v15);
    uint64_t v16 = v42;
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x80) != 0)
  {
    *((_DWORD *)v16 + 46) = self->_style;
    *((_WORD *)v16 + 102) |= 0x80u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 0x100) != 0)
  {
    *((_DWORD *)v16 + 47) = self->_type;
    *((_WORD *)v16 + 102) |= 0x100u;
  }
  objc_msgSend_setUuid_(v16, v10, (uint64_t)self->_uuid, v11, v12, v13, v14, v15);
  physicalPageNumber = self->_physicalPageNumber;
  if (physicalPageNumber) {
    objc_msgSend_setPhysicalPageNumber_(v42, v23, (uint64_t)physicalPageNumber, v24, v25, v26, v27, v28);
  }
  annotationVersion = self->_annotationVersion;
  if (annotationVersion) {
    objc_msgSend_setAnnotationVersion_(v42, v23, (uint64_t)annotationVersion, v24, v25, v26, v27, v28);
  }
  assetVersion = self->_assetVersion;
  v32 = v42;
  if (assetVersion)
  {
    objc_msgSend_setAssetVersion_(v42, v23, (uint64_t)assetVersion, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  attachments = self->_attachments;
  if (attachments)
  {
    objc_msgSend_setAttachments_(v42, v23, (uint64_t)attachments, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  chapterTitle = self->_chapterTitle;
  if (chapterTitle)
  {
    objc_msgSend_setChapterTitle_(v42, v23, (uint64_t)chapterTitle, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v32[4] = *(void *)&self->_userModificationDate;
    *((_WORD *)v32 + 102) |= 2u;
  }
  selectedTextRange = self->_selectedTextRange;
  if (selectedTextRange)
  {
    objc_msgSend_setSelectedTextRange_(v42, v23, (uint64_t)selectedTextRange, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  __int16 v36 = (__int16)self->_has;
  if ((v36 & 0x40) != 0)
  {
    *((_DWORD *)v32 + 39) = LODWORD(self->_readingProgressHighWaterMark);
    *((_WORD *)v32 + 102) |= 0x40u;
    __int16 v36 = (__int16)self->_has;
    if ((v36 & 0x800) == 0)
    {
LABEL_33:
      if ((v36 & 0x20) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_33;
  }
  *((unsigned char *)v32 + 202) = self->_spineIndexUpdated;
  *((_WORD *)v32 + 102) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_34:
    *((_DWORD *)v32 + 38) = LODWORD(self->_readingProgress);
    *((_WORD *)v32 + 102) |= 0x20u;
  }
LABEL_35:
  futureProofing11 = self->_futureProofing11;
  if (futureProofing11)
  {
    objc_msgSend_setFutureProofing11_(v42, v23, (uint64_t)futureProofing11, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  futureProofing12 = self->_futureProofing12;
  if (futureProofing12)
  {
    objc_msgSend_setFutureProofing12_(v42, v23, (uint64_t)futureProofing12, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  __int16 v39 = (__int16)self->_has;
  if ((v39 & 4) != 0)
  {
    *((_DWORD *)v32 + 30) = self->_plAbsolutePhysicalLocation;
    *((_WORD *)v32 + 102) |= 4u;
    __int16 v39 = (__int16)self->_has;
    if ((v39 & 8) == 0)
    {
LABEL_41:
      if ((v39 & 0x10) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((v39 & 8) == 0)
  {
    goto LABEL_41;
  }
  *((_DWORD *)v32 + 31) = self->_plLocationRangeEnd;
  *((_WORD *)v32 + 102) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_42:
    *((_DWORD *)v32 + 32) = self->_plLocationRangeStart;
    *((_WORD *)v32 + 102) |= 0x10u;
  }
LABEL_43:
  plLocationStorageUUID = self->_plLocationStorageUUID;
  if (plLocationStorageUUID)
  {
    objc_msgSend_setPlLocationStorageUUID_(v42, v23, (uint64_t)plLocationStorageUUID, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  plUserData = self->_plUserData;
  if (plUserData)
  {
    objc_msgSend_setPlUserData_(v42, v23, (uint64_t)plUserData, v24, v25, v26, v27, v28);
    v32 = v42;
  }
  if (*(_WORD *)&self->_has)
  {
    v32[2] = *(void *)&self->_locationModificationDate;
    *((_WORD *)v32 + 102) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v12 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9, v10, v11);
  uint64_t v20 = objc_msgSend_init(v12, v13, v14, v15, v16, v17, v18, v19);
  *(double *)(v20 + 8) = self->_creationDate;
  uint64_t v27 = objc_msgSend_copyWithZone_(self->_creatorIdentifier, v21, (uint64_t)a3, v22, v23, v24, v25, v26);
  uint64_t v28 = *(void **)(v20 + 72);
  *(void *)(v20 + 72) = v27;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(unsigned char *)(v20 + 200) = self->_deleted;
    *(_WORD *)(v20 + 204) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *(unsigned char *)(v20 + 201) = self->_isUnderline;
    *(_WORD *)(v20 + 204) |= 0x400u;
  }
  uint64_t v36 = objc_msgSend_copyWithZone_(self->_locationCFIString, v29, (uint64_t)a3, v30, v31, v32, v33, v34);
  v37 = *(void **)(v20 + 96);
  *(void *)(v20 + 96) = v36;

  *(double *)(v20 + 24) = self->_modificationDate;
  uint64_t v44 = objc_msgSend_copyWithZone_(self->_note, v38, (uint64_t)a3, v39, v40, v41, v42, v43);
  v45 = *(void **)(v20 + 104);
  *(void *)(v20 + 104) = v44;

  uint64_t v52 = objc_msgSend_copyWithZone_(self->_representativeText, v46, (uint64_t)a3, v47, v48, v49, v50, v51);
  uint64_t v53 = *(void **)(v20 + 160);
  *(void *)(v20 + 160) = v52;

  uint64_t v60 = objc_msgSend_copyWithZone_(self->_selectedText, v54, (uint64_t)a3, v55, v56, v57, v58, v59);
  v61 = *(void **)(v20 + 168);
  *(void *)(v20 + 168) = v60;

  __int16 v68 = (__int16)self->_has;
  if ((v68 & 0x80) != 0)
  {
    *(_DWORD *)(v20 + 184) = self->_style;
    *(_WORD *)(v20 + 204) |= 0x80u;
    __int16 v68 = (__int16)self->_has;
  }
  if ((v68 & 0x100) != 0)
  {
    *(_DWORD *)(v20 + 188) = self->_type;
    *(_WORD *)(v20 + 204) |= 0x100u;
  }
  uint64_t v69 = objc_msgSend_copyWithZone_(self->_uuid, v62, (uint64_t)a3, v63, v64, v65, v66, v67);
  uint64_t v70 = *(void **)(v20 + 192);
  *(void *)(v20 + 192) = v69;

  uint64_t v77 = objc_msgSend_copyWithZone_(self->_physicalPageNumber, v71, (uint64_t)a3, v72, v73, v74, v75, v76);
  v78 = *(void **)(v20 + 112);
  *(void *)(v20 + 112) = v77;

  uint64_t v85 = objc_msgSend_copyWithZone_(self->_annotationVersion, v79, (uint64_t)a3, v80, v81, v82, v83, v84);
  v86 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v85;

  uint64_t v93 = objc_msgSend_copyWithZone_(self->_assetVersion, v87, (uint64_t)a3, v88, v89, v90, v91, v92);
  v94 = *(void **)(v20 + 48);
  *(void *)(v20 + 48) = v93;

  uint64_t v101 = objc_msgSend_copyWithZone_(self->_attachments, v95, (uint64_t)a3, v96, v97, v98, v99, v100);
  v102 = *(void **)(v20 + 56);
  *(void *)(v20 + 56) = v101;

  uint64_t v109 = objc_msgSend_copyWithZone_(self->_chapterTitle, v103, (uint64_t)a3, v104, v105, v106, v107, v108);
  v110 = *(void **)(v20 + 64);
  *(void *)(v20 + 64) = v109;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(double *)(v20 + 32) = self->_userModificationDate;
    *(_WORD *)(v20 + 204) |= 2u;
  }
  uint64_t v117 = objc_msgSend_copyWithZone_(self->_selectedTextRange, v111, (uint64_t)a3, v112, v113, v114, v115, v116);
  v118 = *(void **)(v20 + 176);
  *(void *)(v20 + 176) = v117;

  __int16 v125 = (__int16)self->_has;
  if ((v125 & 0x40) != 0)
  {
    *(float *)(v20 + 156) = self->_readingProgressHighWaterMark;
    *(_WORD *)(v20 + 204) |= 0x40u;
    __int16 v125 = (__int16)self->_has;
    if ((v125 & 0x800) == 0)
    {
LABEL_13:
      if ((v125 & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_13;
  }
  *(unsigned char *)(v20 + 202) = self->_spineIndexUpdated;
  *(_WORD *)(v20 + 204) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    *(float *)(v20 + 152) = self->_readingProgress;
    *(_WORD *)(v20 + 204) |= 0x20u;
  }
LABEL_15:
  uint64_t v126 = objc_msgSend_copyWithZone_(self->_futureProofing11, v119, (uint64_t)a3, v120, v121, v122, v123, v124);
  uint64_t v127 = *(void **)(v20 + 80);
  *(void *)(v20 + 80) = v126;

  uint64_t v134 = objc_msgSend_copyWithZone_(self->_futureProofing12, v128, (uint64_t)a3, v129, v130, v131, v132, v133);
  v135 = *(void **)(v20 + 88);
  *(void *)(v20 + 88) = v134;

  __int16 v142 = (__int16)self->_has;
  if ((v142 & 4) != 0)
  {
    *(_DWORD *)(v20 + 120) = self->_plAbsolutePhysicalLocation;
    *(_WORD *)(v20 + 204) |= 4u;
    __int16 v142 = (__int16)self->_has;
    if ((v142 & 8) == 0)
    {
LABEL_17:
      if ((v142 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v142 & 8) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v20 + 124) = self->_plLocationRangeEnd;
  *(_WORD *)(v20 + 204) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    *(_DWORD *)(v20 + 128) = self->_plLocationRangeStart;
    *(_WORD *)(v20 + 204) |= 0x10u;
  }
LABEL_19:
  uint64_t v143 = objc_msgSend_copyWithZone_(self->_plLocationStorageUUID, v136, (uint64_t)a3, v137, v138, v139, v140, v141);
  v144 = *(void **)(v20 + 136);
  *(void *)(v20 + 136) = v143;

  uint64_t v151 = objc_msgSend_copyWithZone_(self->_plUserData, v145, (uint64_t)a3, v146, v147, v148, v149, v150);
  v152 = *(void **)(v20 + 144);
  *(void *)(v20 + 144) = v151;

  if (*(_WORD *)&self->_has)
  {
    *(double *)(v20 + 16) = self->_locationModificationDate;
    *(_WORD *)(v20 + 204) |= 1u;
  }
  return (id)v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8, v9, v10, v11)) {
    goto LABEL_106;
  }
  if (self->_creationDate != *((double *)v4 + 1)) {
    goto LABEL_106;
  }
  creatorIdentifier = self->_creatorIdentifier;
  uint64_t v19 = v4[9];
  if ((unint64_t)creatorIdentifier | v19)
  {
    if (!objc_msgSend_isEqual_(creatorIdentifier, v12, v19, v13, v14, v15, v16, v17)) {
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
  uint64_t v21 = v4[12];
  if ((unint64_t)locationCFIString | v21
    && !objc_msgSend_isEqual_(locationCFIString, v12, v21, v13, v14, v15, v16, v17))
  {
    goto LABEL_106;
  }
  if (self->_modificationDate != *((double *)v4 + 3)) {
    goto LABEL_106;
  }
  note = self->_note;
  uint64_t v23 = v4[13];
  if ((unint64_t)note | v23)
  {
    if (!objc_msgSend_isEqual_(note, v12, v23, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  representativeText = self->_representativeText;
  uint64_t v25 = v4[20];
  if ((unint64_t)representativeText | v25)
  {
    if (!objc_msgSend_isEqual_(representativeText, v12, v25, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  selectedText = self->_selectedText;
  uint64_t v27 = v4[21];
  if ((unint64_t)selectedText | v27)
  {
    if (!objc_msgSend_isEqual_(selectedText, v12, v27, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  __int16 v28 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v28 & 0x80) == 0 || self->_style != *((_DWORD *)v4 + 46)) {
      goto LABEL_106;
    }
  }
  else if ((v28 & 0x80) != 0)
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
  uint64_t v30 = v4[24];
  if ((unint64_t)uuid | v30 && !objc_msgSend_isEqual_(uuid, v12, v30, v13, v14, v15, v16, v17)) {
    goto LABEL_106;
  }
  physicalPageNumber = self->_physicalPageNumber;
  uint64_t v32 = v4[14];
  if ((unint64_t)physicalPageNumber | v32)
  {
    if (!objc_msgSend_isEqual_(physicalPageNumber, v12, v32, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  annotationVersion = self->_annotationVersion;
  uint64_t v34 = v4[5];
  if ((unint64_t)annotationVersion | v34)
  {
    if (!objc_msgSend_isEqual_(annotationVersion, v12, v34, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  assetVersion = self->_assetVersion;
  uint64_t v36 = v4[6];
  if ((unint64_t)assetVersion | v36)
  {
    if (!objc_msgSend_isEqual_(assetVersion, v12, v36, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  attachments = self->_attachments;
  uint64_t v38 = v4[7];
  if ((unint64_t)attachments | v38)
  {
    if (!objc_msgSend_isEqual_(attachments, v12, v38, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  chapterTitle = self->_chapterTitle;
  uint64_t v40 = v4[8];
  if ((unint64_t)chapterTitle | v40)
  {
    if (!objc_msgSend_isEqual_(chapterTitle, v12, v40, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v42 = *((_WORD *)v4 + 102);
  if ((has & 2) != 0)
  {
    if ((v42 & 2) == 0 || self->_userModificationDate != *((double *)v4 + 4)) {
      goto LABEL_106;
    }
  }
  else if ((v42 & 2) != 0)
  {
    goto LABEL_106;
  }
  selectedTextRange = self->_selectedTextRange;
  uint64_t v44 = v4[22];
  if ((unint64_t)selectedTextRange | v44)
  {
    if (!objc_msgSend_isEqual_(selectedTextRange, v12, v44, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v45 = *((_WORD *)v4 + 102);
  if ((has & 0x40) != 0)
  {
    if ((v45 & 0x40) == 0 || self->_readingProgressHighWaterMark != *((float *)v4 + 39)) {
      goto LABEL_106;
    }
  }
  else if ((v45 & 0x40) != 0)
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
    BOOL v57 = 0;
    goto LABEL_107;
  }
  if ((*((_WORD *)v4 + 102) & 0x800) != 0) {
    goto LABEL_106;
  }
LABEL_73:
  if ((has & 0x20) != 0)
  {
    if ((v45 & 0x20) == 0 || self->_readingProgress != *((float *)v4 + 38)) {
      goto LABEL_106;
    }
  }
  else if ((v45 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  futureProofing11 = self->_futureProofing11;
  uint64_t v47 = v4[10];
  if ((unint64_t)futureProofing11 | v47
    && !objc_msgSend_isEqual_(futureProofing11, v12, v47, v13, v14, v15, v16, v17))
  {
    goto LABEL_106;
  }
  futureProofing12 = self->_futureProofing12;
  uint64_t v49 = v4[11];
  if ((unint64_t)futureProofing12 | v49)
  {
    if (!objc_msgSend_isEqual_(futureProofing12, v12, v49, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  __int16 v50 = (__int16)self->_has;
  __int16 v51 = *((_WORD *)v4 + 102);
  if ((v50 & 4) != 0)
  {
    if ((v51 & 4) == 0 || self->_plAbsolutePhysicalLocation != *((_DWORD *)v4 + 30)) {
      goto LABEL_106;
    }
  }
  else if ((v51 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((v50 & 8) != 0)
  {
    if ((v51 & 8) == 0 || self->_plLocationRangeEnd != *((_DWORD *)v4 + 31)) {
      goto LABEL_106;
    }
  }
  else if ((v51 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((v50 & 0x10) != 0)
  {
    if ((v51 & 0x10) == 0 || self->_plLocationRangeStart != *((_DWORD *)v4 + 32)) {
      goto LABEL_106;
    }
  }
  else if ((v51 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  plLocationStorageUUID = self->_plLocationStorageUUID;
  uint64_t v53 = v4[17];
  if ((unint64_t)plLocationStorageUUID | v53
    && !objc_msgSend_isEqual_(plLocationStorageUUID, v12, v53, v13, v14, v15, v16, v17))
  {
    goto LABEL_106;
  }
  plUserData = self->_plUserData;
  uint64_t v55 = v4[18];
  if ((unint64_t)plUserData | v55)
  {
    if (!objc_msgSend_isEqual_(plUserData, v12, v55, v13, v14, v15, v16, v17)) {
      goto LABEL_106;
    }
  }
  __int16 v56 = *((_WORD *)v4 + 102);
  if (*(_WORD *)&self->_has)
  {
    if ((v56 & 1) == 0 || self->_locationModificationDate != *((double *)v4 + 2)) {
      goto LABEL_106;
    }
    BOOL v57 = 1;
  }
  else
  {
    BOOL v57 = (v56 & 1) == 0;
  }
LABEL_107:

  return v57;
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
  double v14 = fmod(v5, 1.84467441e19);
  unint64_t v15 = 2654435761u * (unint64_t)v14;
  unint64_t v16 = v15 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v16 = 2654435761u * (unint64_t)v14;
  }
  unint64_t v17 = v15 - (unint64_t)fabs(v6);
  if (v6 >= 0.0) {
    unint64_t v17 = v16;
  }
  unint64_t v184 = v17;
  uint64_t v183 = objc_msgSend_hash(self->_creatorIdentifier, v7, v8, v9, v10, v11, v12, v13);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v182 = 2654435761 * self->_deleted;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v182 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_9:
      uint64_t v181 = 2654435761 * self->_isUnderline;
      goto LABEL_12;
    }
  }
  uint64_t v181 = 0;
LABEL_12:
  uint64_t v180 = objc_msgSend_hash(self->_locationCFIString, v18, v19, v20, v21, v22, v23, v24);
  double modificationDate = self->_modificationDate;
  double v26 = -modificationDate;
  if (modificationDate >= 0.0) {
    double v26 = self->_modificationDate;
  }
  long double v27 = floor(v26 + 0.5);
  double v28 = (v26 - v27) * 1.84467441e19;
  double v36 = fmod(v27, 1.84467441e19);
  unint64_t v37 = 2654435761u * (unint64_t)v36;
  unint64_t v38 = v37 + (unint64_t)v28;
  if (v28 <= 0.0) {
    unint64_t v38 = 2654435761u * (unint64_t)v36;
  }
  unint64_t v39 = v37 - (unint64_t)fabs(v28);
  if (v28 >= 0.0) {
    unint64_t v39 = v38;
  }
  unint64_t v179 = v39;
  uint64_t v178 = objc_msgSend_hash(self->_note, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v177 = objc_msgSend_hash(self->_representativeText, v40, v41, v42, v43, v44, v45, v46);
  uint64_t v176 = objc_msgSend_hash(self->_selectedText, v47, v48, v49, v50, v51, v52, v53);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t v175 = 2654435761 * self->_style;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v175 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_20:
      uint64_t v174 = 2654435761 * self->_type;
      goto LABEL_23;
    }
  }
  uint64_t v174 = 0;
LABEL_23:
  uint64_t v173 = objc_msgSend_hash(self->_uuid, v54, v55, v56, v57, v58, v59, v60);
  uint64_t v172 = objc_msgSend_hash(self->_physicalPageNumber, v61, v62, v63, v64, v65, v66, v67);
  uint64_t v171 = objc_msgSend_hash(self->_annotationVersion, v68, v69, v70, v71, v72, v73, v74);
  uint64_t v170 = objc_msgSend_hash(self->_assetVersion, v75, v76, v77, v78, v79, v80, v81);
  uint64_t v169 = objc_msgSend_hash(self->_attachments, v82, v83, v84, v85, v86, v87, v88);
  uint64_t v168 = objc_msgSend_hash(self->_chapterTitle, v89, v90, v91, v92, v93, v94, v95);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    double userModificationDate = self->_userModificationDate;
    double v105 = -userModificationDate;
    if (userModificationDate >= 0.0) {
      double v105 = self->_userModificationDate;
    }
    long double v106 = floor(v105 + 0.5);
    double v107 = (v105 - v106) * 1.84467441e19;
    unint64_t v103 = 2654435761u * (unint64_t)fmod(v106, 1.84467441e19);
    if (v107 >= 0.0)
    {
      if (v107 > 0.0) {
        v103 += (unint64_t)v107;
      }
    }
    else
    {
      v103 -= (unint64_t)fabs(v107);
    }
  }
  else
  {
    unint64_t v103 = 0;
  }
  unint64_t v167 = v103;
  uint64_t v166 = objc_msgSend_hash(self->_selectedTextRange, v96, v97, v98, v99, v100, v101, v102);
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    float readingProgressHighWaterMark = self->_readingProgressHighWaterMark;
    double v118 = readingProgressHighWaterMark;
    if (readingProgressHighWaterMark < 0.0) {
      double v118 = -readingProgressHighWaterMark;
    }
    long double v119 = floor(v118 + 0.5);
    double v120 = (v118 - v119) * 1.84467441e19;
    unint64_t v116 = 2654435761u * (unint64_t)fmod(v119, 1.84467441e19);
    if (v120 >= 0.0)
    {
      if (v120 > 0.0) {
        v116 += (unint64_t)v120;
      }
    }
    else
    {
      v116 -= (unint64_t)fabs(v120);
    }
  }
  else
  {
    unint64_t v116 = 0;
  }
  if ((has & 0x800) != 0) {
    uint64_t v164 = 2654435761 * self->_spineIndexUpdated;
  }
  else {
    uint64_t v164 = 0;
  }
  unint64_t v165 = v116;
  if ((has & 0x20) != 0)
  {
    float readingProgress = self->_readingProgress;
    double v123 = readingProgress;
    if (readingProgress < 0.0) {
      double v123 = -readingProgress;
    }
    long double v124 = floor(v123 + 0.5);
    double v125 = (v123 - v124) * 1.84467441e19;
    unint64_t v121 = 2654435761u * (unint64_t)fmod(v124, 1.84467441e19);
    if (v125 >= 0.0)
    {
      if (v125 > 0.0) {
        v121 += (unint64_t)v125;
      }
    }
    else
    {
      v121 -= (unint64_t)fabs(v125);
    }
  }
  else
  {
    unint64_t v121 = 0;
  }
  uint64_t v163 = objc_msgSend_hash(self->_futureProofing11, v108, v109, v110, v111, v112, v113, v114);
  uint64_t v140 = objc_msgSend_hash(self->_futureProofing12, v126, v127, v128, v129, v130, v131, v132);
  __int16 v141 = (__int16)self->_has;
  if ((v141 & 4) == 0)
  {
    uint64_t v142 = 0;
    if ((v141 & 8) != 0) {
      goto LABEL_52;
    }
LABEL_55:
    uint64_t v143 = 0;
    if ((v141 & 0x10) != 0) {
      goto LABEL_53;
    }
    goto LABEL_56;
  }
  uint64_t v142 = 2654435761 * self->_plAbsolutePhysicalLocation;
  if ((v141 & 8) == 0) {
    goto LABEL_55;
  }
LABEL_52:
  uint64_t v143 = 2654435761 * self->_plLocationRangeEnd;
  if ((v141 & 0x10) != 0)
  {
LABEL_53:
    uint64_t v144 = 2654435761 * self->_plLocationRangeStart;
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v144 = 0;
LABEL_57:
  uint64_t v145 = objc_msgSend_hash(self->_plLocationStorageUUID, v133, v134, v135, v136, v137, v138, v139);
  uint64_t v153 = objc_msgSend_hash(self->_plUserData, v146, v147, v148, v149, v150, v151, v152);
  if (*(_WORD *)&self->_has)
  {
    double locationModificationDate = self->_locationModificationDate;
    double v156 = -locationModificationDate;
    if (locationModificationDate >= 0.0) {
      double v156 = self->_locationModificationDate;
    }
    long double v157 = floor(v156 + 0.5);
    double v158 = (v156 - v157) * 1.84467441e19;
    double v159 = fmod(v157, 1.84467441e19);
    unint64_t v160 = 2654435761u * (unint64_t)v159;
    unint64_t v161 = v160 + (unint64_t)v158;
    if (v158 <= 0.0) {
      unint64_t v161 = 2654435761u * (unint64_t)v159;
    }
    unint64_t v154 = v160 - (unint64_t)fabs(v158);
    if (v158 >= 0.0) {
      unint64_t v154 = v161;
    }
  }
  else
  {
    unint64_t v154 = 0;
  }
  return v183 ^ v184 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v121 ^ v163 ^ v140 ^ v142 ^ v143 ^ v144 ^ v145 ^ v153 ^ v154;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_double creationDate = *((double *)v4 + 1);
  uint64_t v10 = *((void *)v4 + 9);
  id v31 = v4;
  if (v10)
  {
    objc_msgSend_setCreatorIdentifier_(self, (const char *)v4, v10, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  __int16 v11 = *((_WORD *)v4 + 102);
  if ((v11 & 0x200) != 0)
  {
    self->_deleted = *((unsigned char *)v4 + 200);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v11 = *((_WORD *)v4 + 102);
  }
  if ((v11 & 0x400) != 0)
  {
    self->_isUnderline = *((unsigned char *)v4 + 201);
    *(_WORD *)&self->_has |= 0x400u;
  }
  uint64_t v12 = *((void *)v4 + 12);
  if (v12)
  {
    objc_msgSend_setLocationCFIString_(self, (const char *)v4, v12, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  self->_double modificationDate = *((double *)v4 + 3);
  uint64_t v13 = *((void *)v4 + 13);
  if (v13)
  {
    objc_msgSend_setNote_(self, (const char *)v4, v13, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v14 = *((void *)v4 + 20);
  if (v14)
  {
    objc_msgSend_setRepresentativeText_(self, (const char *)v4, v14, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v15 = *((void *)v4 + 21);
  if (v15)
  {
    objc_msgSend_setSelectedText_(self, (const char *)v4, v15, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  __int16 v16 = *((_WORD *)v4 + 102);
  if ((v16 & 0x80) != 0)
  {
    self->_style = *((_DWORD *)v4 + 46);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v16 = *((_WORD *)v4 + 102);
  }
  if ((v16 & 0x100) != 0)
  {
    self->_type = *((_DWORD *)v4 + 47);
    *(_WORD *)&self->_has |= 0x100u;
  }
  uint64_t v17 = *((void *)v4 + 24);
  if (v17)
  {
    objc_msgSend_setUuid_(self, (const char *)v4, v17, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v18 = *((void *)v4 + 14);
  if (v18)
  {
    objc_msgSend_setPhysicalPageNumber_(self, (const char *)v4, v18, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v19 = *((void *)v4 + 5);
  if (v19)
  {
    objc_msgSend_setAnnotationVersion_(self, (const char *)v4, v19, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v20 = *((void *)v4 + 6);
  if (v20)
  {
    objc_msgSend_setAssetVersion_(self, (const char *)v4, v20, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v21 = *((void *)v4 + 7);
  if (v21)
  {
    objc_msgSend_setAttachments_(self, (const char *)v4, v21, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v22 = *((void *)v4 + 8);
  if (v22)
  {
    objc_msgSend_setChapterTitle_(self, (const char *)v4, v22, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  if ((*((_WORD *)v4 + 102) & 2) != 0)
  {
    self->_double userModificationDate = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
  selectedTextRange = self->_selectedTextRange;
  uint64_t v24 = *((void *)v4 + 22);
  if (selectedTextRange)
  {
    if (!v24) {
      goto LABEL_39;
    }
    objc_msgSend_mergeFrom_(selectedTextRange, (const char *)v4, v24, v5, v6, v7, v8, v9);
  }
  else
  {
    if (!v24) {
      goto LABEL_39;
    }
    objc_msgSend_setSelectedTextRange_(self, (const char *)v4, v24, v5, v6, v7, v8, v9);
  }
  id v4 = v31;
LABEL_39:
  __int16 v25 = *((_WORD *)v4 + 102);
  if ((v25 & 0x40) != 0)
  {
    self->_float readingProgressHighWaterMark = *((float *)v4 + 39);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v25 = *((_WORD *)v4 + 102);
    if ((v25 & 0x800) == 0)
    {
LABEL_41:
      if ((v25 & 0x20) == 0) {
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
  uint64_t v26 = *((void *)v4 + 10);
  if (v26)
  {
    objc_msgSend_setFutureProofing11_(self, (const char *)v4, v26, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v27 = *((void *)v4 + 11);
  if (v27)
  {
    objc_msgSend_setFutureProofing12_(self, (const char *)v4, v27, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  __int16 v28 = *((_WORD *)v4 + 102);
  if ((v28 & 4) != 0)
  {
    self->_plAbsolutePhysicalLocation = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 4u;
    __int16 v28 = *((_WORD *)v4 + 102);
    if ((v28 & 8) == 0)
    {
LABEL_49:
      if ((v28 & 0x10) == 0) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else if ((v28 & 8) == 0)
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
  uint64_t v29 = *((void *)v4 + 17);
  if (v29)
  {
    objc_msgSend_setPlLocationStorageUUID_(self, (const char *)v4, v29, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  uint64_t v30 = *((void *)v4 + 18);
  if (v30)
  {
    objc_msgSend_setPlUserData_(self, (const char *)v4, v30, v5, v6, v7, v8, v9);
    id v4 = v31;
  }
  if (*((_WORD *)v4 + 102))
  {
    self->_double locationModificationDate = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
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