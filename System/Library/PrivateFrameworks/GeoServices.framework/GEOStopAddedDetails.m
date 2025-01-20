@interface GEOStopAddedDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasStopAddedAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStopAddedDetails)initWithDictionary:(id)a3;
- (GEOStopAddedDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)stopAddedActionAsString:(int)a3;
- (int)StringAsStopAddedAction:(id)a3;
- (int)stopAddedAction;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStopAddedAction:(BOOL)a3;
- (void)setStopAddedAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStopAddedDetails

- (int)stopAddedAction
{
  if (*(unsigned char *)&self->_flags) {
    return self->_stopAddedAction;
  }
  else {
    return 0;
  }
}

- (void)setStopAddedAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_stopAddedAction = a3;
}

- (void)setHasStopAddedAction:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStopAddedAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)stopAddedActionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8BE0[a3];
  }

  return v3;
}

- (int)StringAsStopAddedAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACCEPTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISMISSED"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)GEOStopAddedDetails;
  int v4 = [(GEOStopAddedDetails *)&v8 description];
  v5 = [(GEOStopAddedDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStopAddedDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      uint64_t v5 = *(int *)(a1 + 8);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F8BE0[v5];
      }
      if (a2) {
        v7 = @"stopAddedAction";
      }
      else {
        v7 = @"stop_added_action";
      }
      [v4 setObject:v6 forKey:v7];
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
  return -[GEOStopAddedDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOStopAddedDetails)initWithDictionary:(id)a3
{
  return (GEOStopAddedDetails *)-[GEOStopAddedDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"stopAddedAction";
      }
      else {
        v6 = @"stop_added_action";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"ACCEPTED"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"DISMISSED"])
        {
          uint64_t v9 = 2;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_18:

          goto LABEL_19;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setStopAddedAction:v9];
      goto LABEL_18;
    }
  }
LABEL_19:

  return a1;
}

- (GEOStopAddedDetails)initWithJSON:(id)a3
{
  return (GEOStopAddedDetails *)-[GEOStopAddedDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStopAddedDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStopAddedDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  [(GEOStopAddedDetails *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_stopAddedAction;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_stopAddedAction;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOStopAddedDetails *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_stopAddedAction == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_stopAddedAction;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_stopAddedAction = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end