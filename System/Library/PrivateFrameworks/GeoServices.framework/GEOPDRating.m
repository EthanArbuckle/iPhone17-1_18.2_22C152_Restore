@interface GEOPDRating
+ (id)ratingForPlaceData:(id)a3 type:(int)a4;
+ (id)ratingListForPlaceData:(id)a3 type:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appleRatingCategorys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayTitle;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)addAppleRatingCategory:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDRating

+ (id)ratingForPlaceData:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = +[GEOPDRating ratingListForPlaceData:v5 type:v4];
  v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = v7;
    goto LABEL_9;
  }
  if (v4 == 3)
  {
    uint64_t v9 = +[GEOPDResultSnippet resultSnippetForPlaceData:v5];
    uint64_t v10 = v9;
    if (v9)
    {
      -[GEOPDResultSnippet _readPriceRange](v9);
      if (*(void *)(v10 + 72))
      {
        -[GEOPDResultSnippet priceRange]((id *)v10);
        id v8 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

+ (id)ratingListForPlaceData:(id)a3 type:(int)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __60__GEOPDRating_PlaceDataExtras__ratingListForPlaceData_type___block_invoke;
  v14 = &unk_1E53E1768;
  int v16 = a4;
  id v15 = v7;
  id v8 = v7;
  [v6 enumerateValidComponentValuesOfType:6 usingBlock:&v11];

  uint64_t v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __60__GEOPDRating_PlaceDataExtras__ratingListForPlaceData_type___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = -[GEOPDComponentValue rating](v8);
  if (v3 && (*(unsigned char *)(v3 + 48) & 8) != 0) {
    int v4 = *(_DWORD *)(v3 + 44);
  }
  else {
    int v4 = 0;
  }
  int v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = -[GEOPDComponentValue rating](v8);
    [v6 addObject:v7];
  }
}

- (id)displayTitle
{
  v2 = -[GEOPDRating appleRatingCategorys]((id *)&self->super.super.isa);
  uint64_t v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a1 + 16);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "clearUnknownFields:", 1, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)appleRatingCategorys
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addAppleRatingCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      uint64_t v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDRating;
  uint64_t v4 = [(GEOPDRating *)&v8 description];
  id v5 = [(GEOPDRating *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRating _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_36;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 8) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 44);
    if (v6 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = off_1E53E3FD8[v6];
    }
    if (a2) {
      objc_super v8 = @"ratingType";
    }
    else {
      objc_super v8 = @"rating_type";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 48);
  }
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_40:
    v28 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v29 = @"maxScore";
    }
    else {
      v29 = @"max_score";
    }
    [v4 setObject:v28 forKey:v29];

    if ((*(unsigned char *)(a1 + 48) & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  v27 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v4 setObject:v27 forKey:@"score"];

  char v5 = *(unsigned char *)(a1 + 48);
  if (v5) {
    goto LABEL_40;
  }
LABEL_12:
  if ((v5 & 4) != 0)
  {
LABEL_13:
    long long v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    if (a2) {
      long long v10 = @"numRatingsUsedForScore";
    }
    else {
      long long v10 = @"num_ratings_used_for_score";
    }
    [v4 setObject:v9 forKey:v10];
  }
LABEL_17:
  if ([*(id *)(a1 + 16) count])
  {
    long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = *(id *)(a1 + 16);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (a2) {
            [v17 jsonRepresentation];
          }
          else {
          v18 = [v17 dictionaryRepresentation];
          }
          [v11 addObject:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    if (a2) {
      v19 = @"appleRatingCategory";
    }
    else {
      v19 = @"apple_rating_category";
    }
    [v4 setObject:v11 forKey:v19];
  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    v21 = [v20 dictionaryRepresentation];
    v22 = v21;
    if (a2)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __41__GEOPDRating__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E53D8860;
      id v24 = v23;
      id v31 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v30];
      id v25 = v24;

      v22 = v25;
    }
    [v4 setObject:v22 forKey:@"Unknown Fields"];
  }
LABEL_36:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRating _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOPDRating__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    long long v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_51;
  }
  if (a3) {
    id v7 = @"ratingType";
  }
  else {
    id v7 = @"rating_type";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"UNKNOWN"])
    {
      int v10 = 0;
    }
    else if ([v9 isEqualToString:@"USER_RATING"])
    {
      int v10 = 1;
    }
    else if ([v9 isEqualToString:@"QUALITY_RATING"])
    {
      int v10 = 2;
    }
    else if ([v9 isEqualToString:@"PRICE_RANGE"])
    {
      int v10 = 3;
    }
    else if ([v9 isEqualToString:@"APPLE_RATING"])
    {
      int v10 = 4;
    }
    else
    {
      int v10 = 0;
    }

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v8 intValue];
LABEL_20:
    *(unsigned char *)(v6 + 48) |= 8u;
    *(_DWORD *)(v6 + 44) = v10;
  }

  long long v11 = [v5 objectForKeyedSubscript:@"score"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    *(unsigned char *)(v6 + 48) |= 2u;
    *(void *)(v6 + 32) = v12;
  }

  if (a3) {
    uint64_t v13 = @"maxScore";
  }
  else {
    uint64_t v13 = @"max_score";
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 doubleValue];
    *(unsigned char *)(v6 + 48) |= 1u;
    *(void *)(v6 + 24) = v15;
  }

  if (a3) {
    int v16 = @"numRatingsUsedForScore";
  }
  else {
    int v16 = @"num_ratings_used_for_score";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v18 = [v17 intValue];
    *(unsigned char *)(v6 + 48) |= 4u;
    *(_DWORD *)(v6 + 40) = v18;
  }

  if (a3) {
    v19 = @"appleRatingCategory";
  }
  else {
    v19 = @"apple_rating_category";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v5;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = [GEOLocalizedString alloc];
            if (a3) {
              v28 = [(GEOLocalizedString *)v27 initWithJSON:v26];
            }
            else {
              v28 = [(GEOLocalizedString *)v27 initWithDictionary:v26];
            }
            v29 = v28;
            -[GEOPDRating addAppleRatingCategory:](v6, v28);
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v23);
    }

    id v5 = v31;
  }

LABEL_51:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRatingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_appleRatingCategorys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (id *)v5;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_ratingType;
    *(unsigned char *)(v5 + 48) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 32) = self->_score;
  *(unsigned char *)(v5 + 48) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  *(double *)(v5 + 24) = self->_maxScore;
  *(unsigned char *)(v5 + 48) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 40) = self->_numRatingsUsedForScore;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_appleRatingCategorys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        -[GEOPDRating addAppleRatingCategory:]((uint64_t)v6, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_ratingType != *((_DWORD *)v4 + 11)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_score != *((double *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_maxScore != *((double *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_numRatingsUsedForScore != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  appleRatingCategorys = self->_appleRatingCategorys;
  if ((unint64_t)appleRatingCategorys | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](appleRatingCategorys, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_ratingType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double score = self->_score;
  double v6 = -score;
  if (score >= 0.0) {
    double v6 = self->_score;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if (flags)
  {
    double maxScore = self->_maxScore;
    double v12 = -maxScore;
    if (maxScore >= 0.0) {
      double v12 = self->_maxScore;
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
  if ((flags & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_numRatingsUsedForScore;
  }
  else {
    uint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v15 ^ [(NSMutableArray *)self->_appleRatingCategorys hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleRatingCategorys, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end