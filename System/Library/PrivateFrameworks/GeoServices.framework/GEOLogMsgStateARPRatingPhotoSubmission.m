@interface GEOLogMsgStateARPRatingPhotoSubmission
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsFromMapsSuggesions;
- (BOOL)hasIsFromRecommendationCard;
- (BOOL)hasIsPlacecardInlineSubmission;
- (BOOL)hasOriginTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMapsSuggesions;
- (BOOL)isFromRecommendationCard;
- (BOOL)isPlacecardInlineSubmission;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateARPRatingPhotoSubmission)initWithDictionary:(id)a3;
- (GEOLogMsgStateARPRatingPhotoSubmission)initWithJSON:(id)a3;
- (NSString)originTarget;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsFromMapsSuggesions:(BOOL)a3;
- (void)setHasIsFromRecommendationCard:(BOOL)a3;
- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3;
- (void)setIsFromMapsSuggesions:(BOOL)a3;
- (void)setIsFromRecommendationCard:(BOOL)a3;
- (void)setIsPlacecardInlineSubmission:(BOOL)a3;
- (void)setOriginTarget:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateARPRatingPhotoSubmission

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
  *(unsigned char *)&self->_flags |= 2u;
  self->_isFromRecommendationCard = a3;
}

- (void)setHasIsFromRecommendationCard:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsFromRecommendationCard
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isFromMapsSuggesions
{
  return self->_isFromMapsSuggesions;
}

- (void)setIsFromMapsSuggesions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_isFromMapsSuggesions = a3;
}

- (void)setHasIsFromMapsSuggesions:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsFromMapsSuggesions
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isPlacecardInlineSubmission
{
  return self->_isPlacecardInlineSubmission;
}

- (void)setIsPlacecardInlineSubmission:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_isPlacecardInlineSubmission = a3;
}

- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsPlacecardInlineSubmission
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateARPRatingPhotoSubmission;
  v4 = [(GEOLogMsgStateARPRatingPhotoSubmission *)&v8 description];
  v5 = [(GEOLogMsgStateARPRatingPhotoSubmission *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateARPRatingPhotoSubmission _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_23;
  }
  [a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [a1 originTarget];
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

  unsigned __int8 v7 = a1[20];
  if ((v7 & 2) == 0)
  {
    if ((a1[20] & 1) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    v10 = [NSNumber numberWithBool:a1[16]];
    if (a2) {
      v11 = @"isFromMapsSuggesions";
    }
    else {
      v11 = @"is_from_maps_suggesions";
    }
    [v4 setObject:v10 forKey:v11];

    if ((a1[20] & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  objc_super v8 = [NSNumber numberWithBool:a1[17]];
  if (a2) {
    v9 = @"isFromRecommendationCard";
  }
  else {
    v9 = @"is_from_recommendation_card";
  }
  [v4 setObject:v8 forKey:v9];

  unsigned __int8 v7 = a1[20];
  if (v7) {
    goto LABEL_15;
  }
LABEL_9:
  if ((v7 & 4) != 0)
  {
LABEL_19:
    v12 = [NSNumber numberWithBool:a1[18]];
    if (a2) {
      v13 = @"isPlacecardInlineSubmission";
    }
    else {
      v13 = @"is_placecard_inline_submission";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateARPRatingPhotoSubmission _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateARPRatingPhotoSubmission)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateARPRatingPhotoSubmission *)-[GEOLogMsgStateARPRatingPhotoSubmission _initWithDictionary:isJSON:](self, a3, 0);
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
      unsigned __int8 v7 = [v5 objectForKeyedSubscript:v6];
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
    }
  }

  return a1;
}

- (GEOLogMsgStateARPRatingPhotoSubmission)initWithJSON:(id)a3
{
  return (GEOLogMsgStateARPRatingPhotoSubmission *)-[GEOLogMsgStateARPRatingPhotoSubmission _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateARPRatingPhotoSubmissionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateARPRatingPhotoSubmissionReadAllFrom((uint64_t)self, a3);
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
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateARPRatingPhotoSubmission *)self readAll:0];
  if (self->_originTarget) {
    objc_msgSend(v5, "setOriginTarget:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[17] = self->_isFromRecommendationCard;
    v5[20] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  v5[16] = self->_isFromMapsSuggesions;
  v5[20] |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    v5[18] = self->_isPlacecardInlineSubmission;
    v5[20] |= 4u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_originTarget copyWithZone:a3];
  unsigned __int8 v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 16) = self->_isFromMapsSuggesions;
    *(unsigned char *)(v5 + 20) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 17) = self->_isFromRecommendationCard;
  *(unsigned char *)(v5 + 20) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 18) = self->_isPlacecardInlineSubmission;
    *(unsigned char *)(v5 + 20) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOLogMsgStateARPRatingPhotoSubmission *)self readAll:1];
  [v4 readAll:1];
  originTarget = self->_originTarget;
  if ((unint64_t)originTarget | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](originTarget, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_22;
    }
    if (self->_isFromRecommendationCard)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_22;
    }
    if (self->_isFromMapsSuggesions)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_22;
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) != 0)
    {
      if (self->_isPlacecardInlineSubmission)
      {
        if (!*((unsigned char *)v4 + 18)) {
          goto LABEL_22;
        }
      }
      else if (*((unsigned char *)v4 + 18))
      {
        goto LABEL_22;
      }
      BOOL v6 = 1;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v6 = 0;
  }
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateARPRatingPhotoSubmission *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_originTarget hash];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_isFromRecommendationCard;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isFromMapsSuggesions;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isPlacecardInlineSubmission;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  if (*((void *)v5 + 1)) {
    -[GEOLogMsgStateARPRatingPhotoSubmission setOriginTarget:](self, "setOriginTarget:");
  }
  BOOL v4 = v5[20];
  if ((v4 & 2) != 0)
  {
    self->_isFromRecommendationCard = v5[17];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v4 = v5[20];
    if (!v4)
    {
LABEL_5:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if (!v5[20])
  {
    goto LABEL_5;
  }
  self->_isFromMapsSuggesions = v5[16];
  *(unsigned char *)&self->_flags |= 1u;
  if ((v5[20] & 4) != 0)
  {
LABEL_6:
    self->_isPlacecardInlineSubmission = v5[18];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

@end