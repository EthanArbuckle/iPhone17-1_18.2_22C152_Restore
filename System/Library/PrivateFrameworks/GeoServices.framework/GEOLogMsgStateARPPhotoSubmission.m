@interface GEOLogMsgStateARPPhotoSubmission
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsFromMapsSuggesions;
- (BOOL)hasIsFromRecommendationCard;
- (BOOL)hasIsPlacecardInlineSubmission;
- (BOOL)hasNumberOfAprSuggestedPhotos;
- (BOOL)hasNumberOfPhotos;
- (BOOL)hasOriginTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMapsSuggesions;
- (BOOL)isFromRecommendationCard;
- (BOOL)isPlacecardInlineSubmission;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateARPPhotoSubmission)initWithDictionary:(id)a3;
- (GEOLogMsgStateARPPhotoSubmission)initWithJSON:(id)a3;
- (NSString)originTarget;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)numberOfAprSuggestedPhotos;
- (unsigned)numberOfPhotos;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsFromMapsSuggesions:(BOOL)a3;
- (void)setHasIsFromRecommendationCard:(BOOL)a3;
- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3;
- (void)setHasNumberOfAprSuggestedPhotos:(BOOL)a3;
- (void)setHasNumberOfPhotos:(BOOL)a3;
- (void)setIsFromMapsSuggesions:(BOOL)a3;
- (void)setIsFromRecommendationCard:(BOOL)a3;
- (void)setIsPlacecardInlineSubmission:(BOOL)a3;
- (void)setNumberOfAprSuggestedPhotos:(unsigned int)a3;
- (void)setNumberOfPhotos:(unsigned int)a3;
- (void)setOriginTarget:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateARPPhotoSubmission

- (BOOL)hasOriginTarget
{
  return self->_originTarget != 0;
}

- (NSString)originTarget
{
  return self->_originTarget;
}

- (void)setOriginTarget:(id)a3
{
}

- (BOOL)isFromRecommendationCard
{
  return self->_isFromRecommendationCard;
}

- (void)setIsFromRecommendationCard:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isFromRecommendationCard = a3;
}

- (void)setHasIsFromRecommendationCard:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsFromRecommendationCard
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)isFromMapsSuggesions
{
  return self->_isFromMapsSuggesions;
}

- (void)setIsFromMapsSuggesions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_isFromMapsSuggesions = a3;
}

- (void)setHasIsFromMapsSuggesions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsFromMapsSuggesions
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isPlacecardInlineSubmission
{
  return self->_isPlacecardInlineSubmission;
}

- (void)setIsPlacecardInlineSubmission:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isPlacecardInlineSubmission = a3;
}

- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsPlacecardInlineSubmission
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (void)setNumberOfPhotos:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_numberOfPhotos = a3;
}

- (void)setHasNumberOfPhotos:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNumberOfPhotos
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)numberOfAprSuggestedPhotos
{
  return self->_numberOfAprSuggestedPhotos;
}

- (void)setNumberOfAprSuggestedPhotos:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_numberOfAprSuggestedPhotos = a3;
}

- (void)setHasNumberOfAprSuggestedPhotos:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNumberOfAprSuggestedPhotos
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateARPPhotoSubmission;
  v4 = [(GEOLogMsgStateARPPhotoSubmission *)&v8 description];
  v5 = [(GEOLogMsgStateARPPhotoSubmission *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateARPPhotoSubmission _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_33;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 originTarget];
  if (v5)
  {
    if (a2) {
      v6 = @"originTarget";
    }
    else {
      v6 = @"origin_target";
    }
    [v4 setObject:v5 forKey:v6];
  }

  char v7 = *(unsigned char *)(a1 + 28);
  if ((v7 & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
    if (a2) {
      v9 = @"isFromRecommendationCard";
    }
    else {
      v9 = @"is_from_recommendation_card";
    }
    [v4 setObject:v8 forKey:v9];

    char v7 = *(unsigned char *)(a1 + 28);
  }
  if ((v7 & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
    if (a2) {
      v11 = @"isFromMapsSuggesions";
    }
    else {
      v11 = @"is_from_maps_suggesions";
    }
    [v4 setObject:v10 forKey:v11];

    char v7 = *(unsigned char *)(a1 + 28);
    if ((v7 & 0x10) == 0)
    {
LABEL_14:
      if ((v7 & 2) == 0) {
        goto LABEL_15;
      }
LABEL_25:
      v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v15 = @"numberOfPhotos";
      }
      else {
        v15 = @"number_of_photos";
      }
      [v4 setObject:v14 forKey:v15];

      if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_29;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 26)];
  if (a2) {
    v13 = @"isPlacecardInlineSubmission";
  }
  else {
    v13 = @"is_placecard_inline_submission";
  }
  [v4 setObject:v12 forKey:v13];

  char v7 = *(unsigned char *)(a1 + 28);
  if ((v7 & 2) != 0) {
    goto LABEL_25;
  }
LABEL_15:
  if (v7)
  {
LABEL_29:
    v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v17 = @"numberOfAprSuggestedPhotos";
    }
    else {
      v17 = @"number_of_apr_suggested_photos";
    }
    [v4 setObject:v16 forKey:v17];
  }
LABEL_33:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateARPPhotoSubmission _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateARPPhotoSubmission)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateARPPhotoSubmission *)-[GEOLogMsgStateARPPhotoSubmission _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"originTarget";
      }
      else {
        v6 = @"origin_target";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setOriginTarget:v8];
      }
      if (a3) {
        v9 = @"isFromRecommendationCard";
      }
      else {
        v9 = @"is_from_recommendation_card";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsFromRecommendationCard:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        v11 = @"isFromMapsSuggesions";
      }
      else {
        v11 = @"is_from_maps_suggesions";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsFromMapsSuggesions:", objc_msgSend(v12, "BOOLValue"));
      }

      if (a3) {
        v13 = @"isPlacecardInlineSubmission";
      }
      else {
        v13 = @"is_placecard_inline_submission";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsPlacecardInlineSubmission:", objc_msgSend(v14, "BOOLValue"));
      }

      if (a3) {
        v15 = @"numberOfPhotos";
      }
      else {
        v15 = @"number_of_photos";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfPhotos:", objc_msgSend(v16, "unsignedIntValue"));
      }

      if (a3) {
        v17 = @"numberOfAprSuggestedPhotos";
      }
      else {
        v17 = @"number_of_apr_suggested_photos";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfAprSuggestedPhotos:", objc_msgSend(v18, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateARPPhotoSubmission)initWithJSON:(id)a3
{
  return (GEOLogMsgStateARPPhotoSubmission *)-[GEOLogMsgStateARPPhotoSubmission _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateARPPhotoSubmissionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateARPPhotoSubmissionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_originTarget)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_9:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateARPPhotoSubmission *)self readAll:0];
  if (self->_originTarget) {
    objc_msgSend(v5, "setOriginTarget:");
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((unsigned char *)v5 + 25) = self->_isFromRecommendationCard;
    *((unsigned char *)v5 + 28) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v5 + 24) = self->_isFromMapsSuggesions;
  *((unsigned char *)v5 + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v5 + 26) = self->_isPlacecardInlineSubmission;
  *((unsigned char *)v5 + 28) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)v5 + 5) = self->_numberOfPhotos;
  *((unsigned char *)v5 + 28) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_8:
    *((_DWORD *)v5 + 4) = self->_numberOfAprSuggestedPhotos;
    *((unsigned char *)v5 + 28) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_originTarget copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 25) = self->_isFromRecommendationCard;
    *(unsigned char *)(v5 + 28) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 24) = self->_isFromMapsSuggesions;
  *(unsigned char *)(v5 + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v5 + 20) = self->_numberOfPhotos;
    *(unsigned char *)(v5 + 28) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(unsigned char *)(v5 + 26) = self->_isPlacecardInlineSubmission;
  *(unsigned char *)(v5 + 28) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if (flags)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_numberOfAprSuggestedPhotos;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  [(GEOLogMsgStateARPPhotoSubmission *)self readAll:1];
  [v4 readAll:1];
  originTarget = self->_originTarget;
  if ((unint64_t)originTarget | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](originTarget, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0) {
      goto LABEL_37;
    }
    if (self->_isFromRecommendationCard)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_37;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_37;
    }
    if (self->_isFromMapsSuggesions)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_37;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
    {
      if (self->_isPlacecardInlineSubmission)
      {
        if (!*((unsigned char *)v4 + 26)) {
          goto LABEL_37;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_28;
      }
    }
LABEL_37:
    BOOL v6 = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 28) & 0x10) != 0) {
    goto LABEL_37;
  }
LABEL_28:
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_numberOfPhotos != *((_DWORD *)v4 + 5)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_37;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_numberOfAprSuggestedPhotos != *((_DWORD *)v4 + 4)) {
      goto LABEL_37;
    }
    BOOL v6 = 1;
  }
LABEL_38:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateARPPhotoSubmission *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_originTarget hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isFromRecommendationCard;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isFromMapsSuggesions;
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_isPlacecardInlineSubmission;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_numberOfPhotos;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_numberOfAprSuggestedPhotos;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 1)) {
    -[GEOLogMsgStateARPPhotoSubmission setOriginTarget:](self, "setOriginTarget:");
  }
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 8) != 0)
  {
    self->_isFromRecommendationCard = *((unsigned char *)v5 + 25);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_isFromMapsSuggesions = *((unsigned char *)v5 + 24);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_isPlacecardInlineSubmission = *((unsigned char *)v5 + 26);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  self->_numberOfPhotos = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 28))
  {
LABEL_8:
    self->_numberOfAprSuggestedPhotos = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_9:
}

- (void).cxx_destruct
{
}

@end