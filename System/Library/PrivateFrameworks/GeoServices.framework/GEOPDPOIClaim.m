@interface GEOPDPOIClaim
+ (id)poiClaimForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)claimUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPOIClaim

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimUrl, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_claimUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

+ (id)poiClaimForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__GEOPDPOIClaim_PlaceDataExtras__poiClaimForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:96 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__GEOPDPOIClaim_PlaceDataExtras__poiClaimForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue poiClaim](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (id)claimUrl
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPOIClaim;
  id v4 = [(GEOPDPOIClaim *)&v8 description];
  uint64_t v5 = [(GEOPDPOIClaim *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPOIClaim _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
      if (a2) {
        uint64_t v7 = @"isClaimed";
      }
      else {
        uint64_t v7 = @"is_claimed";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        uint64_t v9 = @"isClaimable";
      }
      else {
        uint64_t v9 = @"is_claimable";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      id v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __43__GEOPDPOIClaim__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        id v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPOIClaim _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOPDPOIClaim__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPOIClaimReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[25] = self->_isClaimed;
    v5[28] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[24] = self->_isClaimable;
    v5[28] |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_claimUrl copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v8;

  objc_storeStrong((id *)v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_14;
    }
    if (self->_isClaimed)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_20;
    }
LABEL_14:
    char v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 28) & 1) == 0) {
    goto LABEL_14;
  }
  if (!self->_isClaimable)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (!*((unsigned char *)v4 + 24)) {
    goto LABEL_14;
  }
LABEL_20:
  claimUrl = self->_claimUrl;
  if ((unint64_t)claimUrl | *((void *)v4 + 2)) {
    char v5 = -[NSString isEqual:](claimUrl, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_isClaimed;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_claimUrl hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isClaimable;
  return v3 ^ v2 ^ [(NSString *)self->_claimUrl hash];
}

@end