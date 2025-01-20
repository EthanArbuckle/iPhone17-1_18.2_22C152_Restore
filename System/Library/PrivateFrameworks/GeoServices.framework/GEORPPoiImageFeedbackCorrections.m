@interface GEORPPoiImageFeedbackCorrections
+ (BOOL)isValid:(id)a3;
- (BOOL)hasComments;
- (BOOL)hasCorrectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPPoiImageFeedbackCorrections)initWithDictionary:(id)a3;
- (GEORPPoiImageFeedbackCorrections)initWithJSON:(id)a3;
- (NSString)comments;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCorrectionType:(id)a3;
- (int)correctionType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setComments:(id)a3;
- (void)setCorrectionType:(int)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiImageFeedbackCorrections

- (int)correctionType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_correctionType;
  }
  else {
    return 0;
  }
}

- (void)setCorrectionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCorrectionType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DBD30[a3];
  }

  return v3;
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_OTHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_IRRELEVANT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_OFFENSIVE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_POOR_QUALITY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_PRIVACY_ISSUE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_LEGAL_ISSUE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_COPYRIGHT_VIOLATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_INAPPROPRIATE_ATTRIBUTION"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasComments
{
  return self->_comments != 0;
}

- (NSString)comments
{
  return self->_comments;
}

- (void)setComments:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiImageFeedbackCorrections;
  int v4 = [(GEORPPoiImageFeedbackCorrections *)&v8 description];
  v5 = [(GEORPPoiImageFeedbackCorrections *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiImageFeedbackCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DBD30[v5];
      }
      if (a2) {
        v7 = @"correctionType";
      }
      else {
        v7 = @"correction_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 comments];
    if (v8) {
      [v4 setObject:v8 forKey:@"comments"];
    }

    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62__GEORPPoiImageFeedbackCorrections__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiImageFeedbackCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEORPPoiImageFeedbackCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPPoiImageFeedbackCorrections)initWithDictionary:(id)a3
{
  return (GEORPPoiImageFeedbackCorrections *)-[GEORPPoiImageFeedbackCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_33;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_33;
  }
  if (a3) {
    v6 = @"correctionType";
  }
  else {
    v6 = @"correction_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_OTHER"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_IRRELEVANT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_OFFENSIVE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_POOR_QUALITY"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_PRIVACY_ISSUE"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_LEGAL_ISSUE"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_COPYRIGHT_VIOLATION"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"POI_IMAGE_CORRECTION_INAPPROPRIATE_ATTRIBUTION"])
    {
      uint64_t v9 = 8;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_29:
    [a1 setCorrectionType:v9];
  }

  id v10 = [v5 objectForKeyedSubscript:@"comments"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setComments:v11];
  }
LABEL_33:

  return a1;
}

- (GEORPPoiImageFeedbackCorrections)initWithJSON:(id)a3
{
  return (GEORPPoiImageFeedbackCorrections *)-[GEORPPoiImageFeedbackCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiImageFeedbackCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiImageFeedbackCorrectionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_comments)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPPoiImageFeedbackCorrections *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 6) = self->_correctionType;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  if (self->_comments)
  {
    objc_msgSend(v5, "setComments:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_correctionType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_comments copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEORPPoiImageFeedbackCorrections *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_correctionType != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  comments = self->_comments;
  if ((unint64_t)comments | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](comments, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPPoiImageFeedbackCorrections *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_correctionType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_comments hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[7])
  {
    self->_correctionType = v5[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 2))
  {
    -[GEORPPoiImageFeedbackCorrections setComments:](self, "setComments:");
    id v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPoiImageFeedbackCorrections *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comments, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end