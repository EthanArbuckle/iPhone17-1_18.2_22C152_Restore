@interface GEOGenericSubstitutes
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSubstitute;
- (BOOL)hasWaypointCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)substitute;
- (GEOGenericSubstitutes)initWithDictionary:(id)a3;
- (GEOGenericSubstitutes)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)waypointCategoryAsString:(int)a3;
- (int)StringAsWaypointCategory:(id)a3;
- (int)waypointCategory;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasWaypointCategory:(BOOL)a3;
- (void)setSubstitute:(id)a3;
- (void)setWaypointCategory:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOGenericSubstitutes

- (BOOL)hasSubstitute
{
  return self->_substitute != 0;
}

- (GEOFormattedString)substitute
{
  return self->_substitute;
}

- (void)setSubstitute:(id)a3
{
}

- (int)waypointCategory
{
  if (*(unsigned char *)&self->_flags) {
    return self->_waypointCategory;
  }
  else {
    return 0;
  }
}

- (void)setWaypointCategory:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_waypointCategory = a3;
}

- (void)setHasWaypointCategory:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasWaypointCategory
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)waypointCategoryAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E05B0[a3];
  }

  return v3;
}

- (int)StringAsWaypointCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WAYPOINT_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_WORK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_HOME"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_WORK"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_HOME"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_OTHER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_POI"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_ADDRESS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_UNKNOWN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CUSTOM"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_SCHOOL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_SCHOOL"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_PERSON_LOCATION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS"])
  {
    int v4 = 13;
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
  v8.super_class = (Class)GEOGenericSubstitutes;
  int v4 = [(GEOGenericSubstitutes *)&v8 description];
  v5 = [(GEOGenericSubstitutes *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGenericSubstitutes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 substitute];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"substitute"];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v8 = *(int *)(a1 + 24);
      if (v8 >= 0xE)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53E05B0[v8];
      }
      if (a2) {
        v10 = @"waypointCategory";
      }
      else {
        v10 = @"waypoint_category";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __51__GEOGenericSubstitutes__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOGenericSubstitutes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOGenericSubstitutes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOGenericSubstitutes)initWithDictionary:(id)a3
{
  return (GEOGenericSubstitutes *)-[GEOGenericSubstitutes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"substitute"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setSubstitute:v8];
      }
      if (a3) {
        id v10 = @"waypointCategory";
      }
      else {
        id v10 = @"waypoint_category";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"WAYPOINT_UNSPECIFIED"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_WORK"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_HOME"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_CONTACT_WORK"])
        {
          uint64_t v13 = 3;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_CONTACT_HOME"])
        {
          uint64_t v13 = 4;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_CONTACT_OTHER"])
        {
          uint64_t v13 = 5;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_POI"])
        {
          uint64_t v13 = 6;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_ADDRESS"])
        {
          uint64_t v13 = 7;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_UNKNOWN"])
        {
          uint64_t v13 = 8;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_CUSTOM"])
        {
          uint64_t v13 = 9;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_SCHOOL"])
        {
          uint64_t v13 = 10;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_CONTACT_SCHOOL"])
        {
          uint64_t v13 = 11;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_PERSON_LOCATION"])
        {
          uint64_t v13 = 12;
        }
        else if ([v12 isEqualToString:@"WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS"])
        {
          uint64_t v13 = 13;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_45:

          goto LABEL_46;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setWaypointCategory:v13];
      goto LABEL_45;
    }
  }
LABEL_46:

  return a1;
}

- (GEOGenericSubstitutes)initWithJSON:(id)a3
{
  return (GEOGenericSubstitutes *)-[GEOGenericSubstitutes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGenericSubstitutesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGenericSubstitutesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_substitute)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOGenericSubstitutes *)self readAll:0];
  if (self->_substitute) {
    objc_msgSend(v4, "setSubstitute:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 6) = self->_waypointCategory;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOFormattedString *)self->_substitute copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_waypointCategory;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOGenericSubstitutes *)self readAll:1];
  [v4 readAll:1];
  substitute = self->_substitute;
  if ((unint64_t)substitute | *((void *)v4 + 2))
  {
    if (!-[GEOFormattedString isEqual:](substitute, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_waypointCategory == *((_DWORD *)v4 + 6))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOGenericSubstitutes *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_substitute hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_waypointCategory;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (int *)a3;
  [v6 readAll:0];
  substitute = self->_substitute;
  uint64_t v5 = *((void *)v6 + 2);
  if (substitute)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](substitute, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOGenericSubstitutes setSubstitute:](self, "setSubstitute:");
  }
  if (v6[7])
  {
    self->_waypointCategory = v6[6];
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOGenericSubstitutes *)self readAll:0];
    substitute = self->_substitute;
    [(GEOFormattedString *)substitute clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitute, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end