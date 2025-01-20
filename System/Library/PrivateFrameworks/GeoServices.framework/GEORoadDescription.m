@interface GEORoadDescription
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFormattedDescription;
- (BOOL)hasNavigationFriendliness;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)formattedDescription;
- (GEORoadDescription)initWithDictionary:(id)a3;
- (GEORoadDescription)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)navigationFriendlinessAsString:(int)a3;
- (int)StringAsNavigationFriendliness:(id)a3;
- (int)navigationFriendliness;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFormattedDescription:(id)a3;
- (void)setHasNavigationFriendliness:(BOOL)a3;
- (void)setNavigationFriendliness:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoadDescription

- (BOOL)hasFormattedDescription
{
  return self->_formattedDescription != 0;
}

- (GEOFormattedString)formattedDescription
{
  return self->_formattedDescription;
}

- (void)setFormattedDescription:(id)a3
{
}

- (int)navigationFriendliness
{
  if (*(unsigned char *)&self->_flags) {
    return self->_navigationFriendliness;
  }
  else {
    return 0;
  }
}

- (void)setNavigationFriendliness:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_navigationFriendliness = a3;
}

- (void)setHasNavigationFriendliness:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNavigationFriendliness
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)navigationFriendlinessAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E04E8[a3];
  }

  return v3;
}

- (int)StringAsNavigationFriendliness:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MEDIUM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HIGH"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)GEORoadDescription;
  int v4 = [(GEORoadDescription *)&v8 description];
  v5 = [(GEORoadDescription *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoadDescription _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 formattedDescription];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"formattedDescription";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"formatted_description";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v9 = *(int *)(a1 + 24);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E04E8[v9];
      }
      if (a2) {
        v11 = @"navigationFriendliness";
      }
      else {
        v11 = @"navigation_friendliness";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __48__GEORoadDescription__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEORoadDescription _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORoadDescription__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORoadDescription)initWithDictionary:(id)a3
{
  return (GEORoadDescription *)-[GEORoadDescription _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"formattedDescription";
      }
      else {
        v6 = @"formatted_description";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setFormattedDescription:v9];
      }
      if (a3) {
        v11 = @"navigationFriendliness";
      }
      else {
        v11 = @"navigation_friendliness";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        if ([v13 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v14 = 0;
        }
        else if ([v13 isEqualToString:@"LOW"])
        {
          uint64_t v14 = 1;
        }
        else if ([v13 isEqualToString:@"MEDIUM"])
        {
          uint64_t v14 = 2;
        }
        else if ([v13 isEqualToString:@"HIGH"])
        {
          uint64_t v14 = 3;
        }
        else
        {
          uint64_t v14 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v14 = [v12 intValue];
      }
      [a1 setNavigationFriendliness:v14];
      goto LABEL_28;
    }
  }
LABEL_29:

  return a1;
}

- (GEORoadDescription)initWithJSON:(id)a3
{
  return (GEORoadDescription *)-[GEORoadDescription _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoadDescriptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoadDescriptionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_formattedDescription)
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
  [(GEORoadDescription *)self readAll:0];
  if (self->_formattedDescription) {
    objc_msgSend(v4, "setFormattedDescription:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 6) = self->_navigationFriendliness;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOFormattedString *)self->_formattedDescription copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_navigationFriendliness;
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
  [(GEORoadDescription *)self readAll:1];
  [v4 readAll:1];
  formattedDescription = self->_formattedDescription;
  if ((unint64_t)formattedDescription | *((void *)v4 + 2))
  {
    if (!-[GEOFormattedString isEqual:](formattedDescription, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_navigationFriendliness == *((_DWORD *)v4 + 6))
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
  [(GEORoadDescription *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_formattedDescription hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_navigationFriendliness;
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
  formattedDescription = self->_formattedDescription;
  uint64_t v5 = *((void *)v6 + 2);
  if (formattedDescription)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](formattedDescription, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORoadDescription setFormattedDescription:](self, "setFormattedDescription:");
  }
  if (v6[7])
  {
    self->_navigationFriendliness = v6[6];
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
    [(GEORoadDescription *)self readAll:0];
    formattedDescription = self->_formattedDescription;
    [(GEOFormattedString *)formattedDescription clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedDescription, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end