@interface ADClientSettingsResponse
+ (Class)searchAdsSettingsParamsType;
+ (Class)searchLandingAdsSettingsParamsType;
- (BOOL)hasExpirationDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)searchAdsSettingsParams;
- (NSMutableArray)searchLandingAdsSettingsParams;
- (double)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)searchAdsSettingsParamsAtIndex:(unint64_t)a3;
- (id)searchLandingAdsSettingsParamsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)searchAdsSettingsParamsCount;
- (unint64_t)searchLandingAdsSettingsParamsCount;
- (void)addSearchAdsSettingsParams:(id)a3;
- (void)addSearchLandingAdsSettingsParams:(id)a3;
- (void)clearSearchAdsSettingsParams;
- (void)clearSearchLandingAdsSettingsParams;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setSearchAdsSettingsParams:(id)a3;
- (void)setSearchLandingAdsSettingsParams:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADClientSettingsResponse

- (NSMutableArray)searchLandingAdsSettingsParams
{
  return self->_searchLandingAdsSettingsParams;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)readFrom:(id)a3
{
  return ADClientSettingsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)addSearchLandingAdsSettingsParams:(id)a3
{
  id v4 = a3;
  searchLandingAdsSettingsParams = self->_searchLandingAdsSettingsParams;
  id v8 = v4;
  if (!searchLandingAdsSettingsParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_searchLandingAdsSettingsParams;
    self->_searchLandingAdsSettingsParams = v6;

    id v4 = v8;
    searchLandingAdsSettingsParams = self->_searchLandingAdsSettingsParams;
  }
  [(NSMutableArray *)searchLandingAdsSettingsParams addObject:v4];
}

- (void)addSearchAdsSettingsParams:(id)a3
{
  id v4 = a3;
  searchAdsSettingsParams = self->_searchAdsSettingsParams;
  id v8 = v4;
  if (!searchAdsSettingsParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_searchAdsSettingsParams;
    self->_searchAdsSettingsParams = v6;

    id v4 = v8;
    searchAdsSettingsParams = self->_searchAdsSettingsParams;
  }
  [(NSMutableArray *)searchAdsSettingsParams addObject:v4];
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_expirationDate];
    [v3 setObject:v4 forKey:@"expirationDate"];
  }
  if ([(NSMutableArray *)self->_searchAdsSettingsParams count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_searchAdsSettingsParams, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v6 = self->_searchAdsSettingsParams;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"searchAdsSettingsParams"];
  }
  if ([(NSMutableArray *)self->_searchLandingAdsSettingsParams count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_searchLandingAdsSettingsParams, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = self->_searchLandingAdsSettingsParams;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "dictionaryRepresentation", (void)v20);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"searchLandingAdsSettingsParams"];
  }
  return v3;
}

- (NSMutableArray)searchAdsSettingsParams
{
  return self->_searchAdsSettingsParams;
}

- (BOOL)hasExpirationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)clearSearchAdsSettingsParams
{
}

- (unint64_t)searchAdsSettingsParamsCount
{
  return [(NSMutableArray *)self->_searchAdsSettingsParams count];
}

- (id)searchAdsSettingsParamsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_searchAdsSettingsParams objectAtIndex:a3];
}

+ (Class)searchAdsSettingsParamsType
{
  return (Class)objc_opt_class();
}

- (void)clearSearchLandingAdsSettingsParams
{
}

- (unint64_t)searchLandingAdsSettingsParamsCount
{
  return [(NSMutableArray *)self->_searchLandingAdsSettingsParams count];
}

- (id)searchLandingAdsSettingsParamsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_searchLandingAdsSettingsParams objectAtIndex:a3];
}

+ (Class)searchLandingAdsSettingsParamsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADClientSettingsResponse;
  id v4 = [(ADClientSettingsResponse *)&v8 description];
  v5 = [(ADClientSettingsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_searchAdsSettingsParams;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_searchLandingAdsSettingsParams;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_expirationDate;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v13 = v4;
  if ([(ADClientSettingsResponse *)self searchAdsSettingsParamsCount])
  {
    [v13 clearSearchAdsSettingsParams];
    unint64_t v5 = [(ADClientSettingsResponse *)self searchAdsSettingsParamsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ADClientSettingsResponse *)self searchAdsSettingsParamsAtIndex:i];
        [v13 addSearchAdsSettingsParams:v8];
      }
    }
  }
  if ([(ADClientSettingsResponse *)self searchLandingAdsSettingsParamsCount])
  {
    [v13 clearSearchLandingAdsSettingsParams];
    unint64_t v9 = [(ADClientSettingsResponse *)self searchLandingAdsSettingsParamsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(ADClientSettingsResponse *)self searchLandingAdsSettingsParamsAtIndex:j];
        [v13 addSearchLandingAdsSettingsParams:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_expirationDate;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_searchAdsSettingsParams;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addSearchAdsSettingsParams:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = self->_searchLandingAdsSettingsParams;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [v6 addSearchLandingAdsSettingsParams:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  searchAdsSettingsParams = self->_searchAdsSettingsParams;
  if ((unint64_t)searchAdsSettingsParams | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](searchAdsSettingsParams, "isEqual:"))
  {
    goto LABEL_11;
  }
  searchLandingAdsSettingsParams = self->_searchLandingAdsSettingsParams;
  if ((unint64_t)searchLandingAdsSettingsParams | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](searchLandingAdsSettingsParams, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double expirationDate = self->_expirationDate;
    double v5 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v5 = self->_expirationDate;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_searchAdsSettingsParams hash] ^ v3;
  return v8 ^ [(NSMutableArray *)self->_searchLandingAdsSettingsParams hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (id *)v4;
  if (*((unsigned char *)v4 + 32))
  {
    self->_double expirationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(ADClientSettingsResponse *)self addSearchAdsSettingsParams:*(void *)(*((void *)&v20 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5[3];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[ADClientSettingsResponse addSearchLandingAdsSettingsParams:](self, "addSearchLandingAdsSettingsParams:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)setSearchAdsSettingsParams:(id)a3
{
}

- (void)setSearchLandingAdsSettingsParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchLandingAdsSettingsParams, 0);
  objc_storeStrong((id *)&self->_searchAdsSettingsParams, 0);
}

@end