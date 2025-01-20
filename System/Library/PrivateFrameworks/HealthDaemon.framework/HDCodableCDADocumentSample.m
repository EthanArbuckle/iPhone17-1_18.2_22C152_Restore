@interface HDCodableCDADocumentSample
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasAuthorName;
- (BOOL)hasCustodianName;
- (BOOL)hasDocumentData;
- (BOOL)hasOmittedContent;
- (BOOL)hasPatientName;
- (BOOL)hasSample;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)documentData;
- (NSString)authorName;
- (NSString)custodianName;
- (NSString)description;
- (NSString)patientName;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)omittedContentAsString:(int)a3;
- (int)StringAsOmittedContent:(id)a3;
- (int)omittedContent;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorName:(id)a3;
- (void)setCustodianName:(id)a3;
- (void)setDocumentData:(id)a3;
- (void)setHasOmittedContent:(BOOL)a3;
- (void)setOmittedContent:(int)a3;
- (void)setPatientName:(id)a3;
- (void)setSample:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableCDADocumentSample

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HDCodableCDADocumentSample *)self sample];
    int v6 = [v5 applyToObject:v4];
    if (v6)
    {
      int v7 = [(HDCodableCDADocumentSample *)self omittedContent];
      v8 = [(HDCodableCDADocumentSample *)self documentData];
      v9 = [(HDCodableCDADocumentSample *)self title];
      v10 = [(HDCodableCDADocumentSample *)self patientName];
      v11 = [(HDCodableCDADocumentSample *)self authorName];
      v12 = [(HDCodableCDADocumentSample *)self custodianName];
      uint64_t v13 = 3;
      if (v7 != 3) {
        uint64_t v13 = 0;
      }
      if (v7 == 2) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = v13;
      }
      [v4 _applyPropertiesWithOmittedFlags:v14 compressedDocumentData:v8 title:v9 patientName:v10 authorName:v11 custodianName:v12];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (int)omittedContent
{
  if (*(unsigned char *)&self->_has) {
    return self->_omittedContent;
  }
  else {
    return 1;
  }
}

- (void)setOmittedContent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_omittedContent = a3;
}

- (void)setHasOmittedContent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOmittedContent
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)omittedContentAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6304DD8[a3 - 1];
  }

  return v3;
}

- (int)StringAsOmittedContent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DocumentData"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Document"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasDocumentData
{
  return self->_documentData != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPatientName
{
  return self->_patientName != 0;
}

- (BOOL)hasAuthorName
{
  return self->_authorName != 0;
}

- (BOOL)hasCustodianName
{
  return self->_custodianName != 0;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableCDADocumentSample;
  int v4 = [(HDCodableCDADocumentSample *)&v8 description];
  v5 = [(HDCodableCDADocumentSample *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = self->_omittedContent - 1;
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_omittedContent);
      int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v7 = off_1E6304DD8[v6];
    }
    [v3 setObject:v7 forKey:@"omittedContent"];
  }
  documentData = self->_documentData;
  if (documentData) {
    [v3 setObject:documentData forKey:@"documentData"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  patientName = self->_patientName;
  if (patientName) {
    [v3 setObject:patientName forKey:@"patientName"];
  }
  authorName = self->_authorName;
  if (authorName) {
    [v3 setObject:authorName forKey:@"authorName"];
  }
  custodianName = self->_custodianName;
  if (custodianName) {
    [v3 setObject:custodianName forKey:@"custodianName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCDADocumentSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_documentData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_patientName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_authorName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_custodianName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_omittedContent;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_documentData)
  {
    objc_msgSend(v5, "setDocumentData:");
    id v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
  if (self->_patientName)
  {
    objc_msgSend(v5, "setPatientName:");
    id v4 = v5;
  }
  if (self->_authorName)
  {
    objc_msgSend(v5, "setAuthorName:");
    id v4 = v5;
  }
  if (self->_custodianName)
  {
    objc_msgSend(v5, "setCustodianName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  int v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_omittedContent;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_documentData copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_title copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_patientName copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_authorName copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  uint64_t v16 = [(NSString *)self->_custodianName copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 6))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_omittedContent != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  documentData = self->_documentData;
  if ((unint64_t)documentData | *((void *)v4 + 3)
    && !-[NSData isEqual:](documentData, "isEqual:"))
  {
    goto LABEL_19;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_19;
    }
  }
  patientName = self->_patientName;
  if ((unint64_t)patientName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](patientName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  authorName = self->_authorName;
  if ((unint64_t)authorName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](authorName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  custodianName = self->_custodianName;
  if ((unint64_t)custodianName | *((void *)v4 + 2)) {
    char v11 = -[NSString isEqual:](custodianName, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_omittedContent;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSData *)self->_documentData hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_title hash];
  NSUInteger v8 = [(NSString *)self->_patientName hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_authorName hash];
  return v7 ^ v9 ^ [(NSString *)self->_custodianName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 6);
  id v7 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableCDADocumentSample setSample:](self, "setSample:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 64))
  {
    self->_omittedContent = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableCDADocumentSample setDocumentData:](self, "setDocumentData:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[HDCodableCDADocumentSample setTitle:](self, "setTitle:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCodableCDADocumentSample setPatientName:](self, "setPatientName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[HDCodableCDADocumentSample setAuthorName:](self, "setAuthorName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[HDCodableCDADocumentSample setCustodianName:](self, "setCustodianName:");
    id v4 = v7;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (NSData)documentData
{
  return self->_documentData;
}

- (void)setDocumentData:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)patientName
{
  return self->_patientName;
}

- (void)setPatientName:(id)a3
{
}

- (NSString)authorName
{
  return self->_authorName;
}

- (void)setAuthorName:(id)a3
{
}

- (NSString)custodianName
{
  return self->_custodianName;
}

- (void)setCustodianName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_patientName, 0);
  objc_storeStrong((id *)&self->_documentData, 0);
  objc_storeStrong((id *)&self->_custodianName, 0);

  objc_storeStrong((id *)&self->_authorName, 0);
}

@end