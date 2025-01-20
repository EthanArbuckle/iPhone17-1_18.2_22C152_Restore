@interface GEOLogMsgEventMapsInteraction
+ (BOOL)isValid:(id)a3;
- (BOOL)hasInteractionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventMapsInteraction)initWithDictionary:(id)a3;
- (GEOLogMsgEventMapsInteraction)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interactionTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsInteractionType:(id)a3;
- (int)interactionType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInteractionType:(BOOL)a3;
- (void)setInteractionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventMapsInteraction

- (int)interactionType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_interactionType;
  }
  else {
    return 0;
  }
}

- (void)setInteractionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_interactionType = a3;
}

- (void)setHasInteractionType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasInteractionType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)interactionTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"MAPS_INTERACTION_TYPE_POSITIVE_SEARCH_ENGAGEMENT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"MAPS_INTERACTION_TYPE_UNKNOWN";
  }
  return v4;
}

- (int)StringAsInteractionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAPS_INTERACTION_TYPE_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"MAPS_INTERACTION_TYPE_POSITIVE_SEARCH_ENGAGEMENT"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventMapsInteraction;
  int v4 = [(GEOLogMsgEventMapsInteraction *)&v8 description];
  v5 = [(GEOLogMsgEventMapsInteraction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapsInteraction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      int v5 = *(_DWORD *)(a1 + 8);
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = @"MAPS_INTERACTION_TYPE_POSITIVE_SEARCH_ENGAGEMENT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 8));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v6 = @"MAPS_INTERACTION_TYPE_UNKNOWN";
      }
      if (a2) {
        v7 = @"interactionType";
      }
      else {
        v7 = @"interaction_type";
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
  return -[GEOLogMsgEventMapsInteraction _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventMapsInteraction)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapsInteraction *)-[GEOLogMsgEventMapsInteraction _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"interactionType";
      }
      else {
        v6 = @"interaction_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"MAPS_INTERACTION_TYPE_UNKNOWN"]) {
          uint64_t v9 = 0;
        }
        else {
          uint64_t v9 = [v8 isEqualToString:@"MAPS_INTERACTION_TYPE_POSITIVE_SEARCH_ENGAGEMENT"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_14:

          goto LABEL_15;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setInteractionType:v9];
      goto LABEL_14;
    }
  }
LABEL_15:

  return a1;
}

- (GEOLogMsgEventMapsInteraction)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapsInteraction *)-[GEOLogMsgEventMapsInteraction _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapsInteractionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapsInteractionReadAllFrom((uint64_t)self, a3);
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
  [(GEOLogMsgEventMapsInteraction *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_interactionType;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_interactionType;
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
  [(GEOLogMsgEventMapsInteraction *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_interactionType == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_interactionType;
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
    self->_interactionType = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end