@interface CLPLOGENTRYVISIONLSLHeadingEstimation
+ (Class)headingsType;
- (BOOL)hasStatus;
- (BOOL)hasStatusDEPRECATED;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)headings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)headingsAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (id)statusDEPRECATEDAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsStatusDEPRECATED:(id)a3;
- (int)status;
- (int)statusDEPRECATED;
- (unint64_t)hash;
- (unint64_t)headingsCount;
- (void)addHeadings:(id)a3;
- (void)clearHeadings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasStatusDEPRECATED:(BOOL)a3;
- (void)setHeadings:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStatusDEPRECATED:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONLSLHeadingEstimation

- (int)statusDEPRECATED
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_statusDEPRECATED;
  }
  else {
    return -1;
  }
}

- (void)setStatusDEPRECATED:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_statusDEPRECATED = a3;
}

- (void)setHasStatusDEPRECATED:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatusDEPRECATED
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)statusDEPRECATEDAsString:(int)a3
{
  if ((a3 + 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C35F00[a3 + 1];
  }

  return v3;
}

- (int)StringAsStatusDEPRECATED:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LSLStatusUnknown_DEPRECATED"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"LSLStatusSuccess_DEPRECATED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LSLStatusMapDownloadError_DEPRECATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LSLStatusMapEmpty_DEPRECATED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LSLStatusNotEnoughFeatures_DEPRECATED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LSLStatusMatchFailure_DEPRECATED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)clearHeadings
{
}

- (void)addHeadings:(id)a3
{
  id v4 = a3;
  headings = self->_headings;
  id v8 = v4;
  if (!headings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_headings;
    self->_headings = v6;

    id v4 = v8;
    headings = self->_headings;
  }
  [(NSMutableArray *)headings addObject:v4];
}

- (unint64_t)headingsCount
{
  return [(NSMutableArray *)self->_headings count];
}

- (id)headingsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_headings objectAtIndex:a3];
}

+ (Class)headingsType
{
  return (Class)objc_opt_class();
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 8;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6C35F30[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LSLStatusSuccess"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LSLStatusMapDownloadTimeout"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LSLStatusMapDownloadGeoServicesFail"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LSLStatusMapDownloadUnsupportedPlatform"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LSLStatusMapOfflineUnableToRead"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LSLStatusNoRoadsFound"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LSLStatusNotEnoughFeatures"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LSLStatusMatchFailure"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LSLStatusUnknown"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONLSLHeadingEstimation;
  int v4 = [(CLPLOGENTRYVISIONLSLHeadingEstimation *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONLSLHeadingEstimation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v4 = self->_statusDEPRECATED + 1;
    if (v4 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_statusDEPRECATED);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6C35F00[v4];
    }
    [v3 setObject:v5 forKey:@"status_DEPRECATED"];
  }
  if ([(NSMutableArray *)self->_headings count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_headings, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_headings;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"headings"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E6C35F30[status];
    }
    [v3 setObject:v14 forKey:@"status"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONLSLHeadingEstimationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_headings;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_statusDEPRECATED;
    *((unsigned char *)v4 + 24) |= 2u;
  }
  id v9 = v4;
  if ([(CLPLOGENTRYVISIONLSLHeadingEstimation *)self headingsCount])
  {
    [v9 clearHeadings];
    unint64_t v5 = [(CLPLOGENTRYVISIONLSLHeadingEstimation *)self headingsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(CLPLOGENTRYVISIONLSLHeadingEstimation *)self headingsAtIndex:i];
        [v9 addHeadings:v8];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 4) = self->_status;
    *((unsigned char *)v9 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_statusDEPRECATED;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_headings;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [(id)v6 addHeadings:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_status;
    *(unsigned char *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_statusDEPRECATED != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  headings = self->_headings;
  if ((unint64_t)headings | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](headings, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_status != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_statusDEPRECATED;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_headings hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_status;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_statusDEPRECATED = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CLPLOGENTRYVISIONLSLHeadingEstimation addHeadings:](self, "addHeadings:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[6])
  {
    self->_uint64_t status = v5[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)headings
{
  return self->_headings;
}

- (void)setHeadings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end