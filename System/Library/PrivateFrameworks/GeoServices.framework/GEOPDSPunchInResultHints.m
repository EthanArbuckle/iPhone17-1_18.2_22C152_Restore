@interface GEOPDSPunchInResultHints
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSPunchInResultHints)init;
- (GEOPDSPunchInResultHints)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (unint64_t)hash;
- (void)_readCenter;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setCenter:(uint64_t)a1;
- (void)setFormattedAddress:(uint64_t)a1;
- (void)setName:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSPunchInResultHints

- (uint64_t)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (!a1) {
    goto LABEL_16;
  }
  v10 = v3;
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)v3, 0);
  v4 = v10;
  if (v10[9])
  {
    *(void *)(a1 + 40) = v10[5];
    *(unsigned char *)(a1 + 72) |= 1u;
  }
  v5 = (void *)v10[6];
  if (v5)
  {
    -[GEOPDSPunchInResultHints setName:](a1, v5);
    v4 = v10;
  }
  v6 = (void *)v4[4];
  if (v6)
  {
    -[GEOPDSPunchInResultHints setFormattedAddress:](a1, v6);
    v4 = v10;
  }
  v7 = *(void **)(a1 + 24);
  uint64_t v8 = v4[3];
  if (v7)
  {
    if (!v8) {
      goto LABEL_14;
    }
    objc_msgSend(v7, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[GEOPDSPunchInResultHints setCenter:](a1, (void *)v4[3]);
  }
  v4 = v10;
LABEL_14:
  if ((v4[9] & 2) != 0)
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v4 + 17);
    *(unsigned char *)(a1 + 72) |= 2u;
  }
LABEL_16:

  return MEMORY[0x1F4181870]();
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 4u;
    *(unsigned char *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSPunchInResultHints readAll:](a1, 0);
      v5 = *(void **)(a1 + 24);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDSPunchInResultHints)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSPunchInResultHints;
  v2 = [(GEOPDSPunchInResultHints *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSPunchInResultHints)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSPunchInResultHints;
  v3 = [(GEOPDSPunchInResultHints *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setName:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 0x20u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setFormattedAddress:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 0x10u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInResultHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 72) |= 8u;
  *(unsigned char *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSPunchInResultHints;
  id v4 = [(GEOPDSPunchInResultHints *)&v8 description];
  v5 = [(GEOPDSPunchInResultHints *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSPunchInResultHints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSPunchInResultHints readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      objc_super v6 = *(void **)(a1 + 8);
      if (v6)
      {
        id v7 = v6;
        objc_sync_enter(v7);
        GEOPDSPunchInResultHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_2);
        objc_sync_exit(v7);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v8 = *(id *)(a1 + 48);
    if (v8) {
      [v4 setObject:v8 forKey:@"name"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDSPunchInResultHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedAddress_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v11 = *(id *)(a1 + 32);
    if (v11)
    {
      if (a2) {
        v12 = @"formattedAddress";
      }
      else {
        v12 = @"formatted_address";
      }
      [v4 setObject:v11 forKey:v12];
    }

    -[GEOPDSPunchInResultHints _readCenter](a1);
    id v13 = *(id *)(a1 + 24);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"center"];
    }
    if ((*(unsigned char *)(a1 + 72) & 2) != 0)
    {
      int v16 = *(_DWORD *)(a1 + 68);
      switch(v16)
      {
        case '#':
          v17 = @"TIME_ZONE";
          break;
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '4':
        case '5':
        case '8':
        case ':':
        case ';':
        case '<':
        case '>':
LABEL_29:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case '+':
          v17 = @"SUB_LOCALITY";
          break;
        case ',':
          v17 = @"OCEAN";
          break;
        case '-':
          v17 = @"AOI";
          break;
        case '.':
          v17 = @"INLAND_WATER";
          break;
        case '/':
          v17 = @"BUSINESS";
          break;
        case '0':
          v17 = @"ISLAND";
          break;
        case '1':
          v17 = @"STREET";
          break;
        case '2':
          v17 = @"ADMIN";
          break;
        case '3':
          v17 = @"POSTAL";
          break;
        case '6':
          v17 = @"INTERSECTION";
          break;
        case '7':
          v17 = @"BUILDING";
          break;
        case '9':
          v17 = @"ADDRESS";
          break;
        case '=':
          v17 = @"CONTINENT";
          break;
        case '?':
          v17 = @"REGION";
          break;
        case '@':
          v17 = @"DIVISION";
          break;
        case 'A':
          v17 = @"PHYSICAL_FEATURE";
          break;
        default:
          v17 = @"UNKNOWN_PLACE_TYPE";
          switch(v16)
          {
            case 0:
              goto LABEL_48;
            case 1:
              v17 = @"COUNTRY";
              break;
            case 2:
              v17 = @"ADMINISTRATIVE_AREA";
              break;
            case 3:
              goto LABEL_29;
            case 4:
              v17 = @"SUB_ADMINISTRATIVE_AREA";
              break;
            default:
              if (v16 != 16) {
                goto LABEL_29;
              }
              v17 = @"LOCALITY";
              break;
          }
          break;
      }
LABEL_48:
      if (a2) {
        v18 = @"placeType";
      }
      else {
        v18 = @"place_type";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__GEOPDSPunchInResultHints__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDSPunchInResultHints _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_400;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_401;
      }
      GEOPDSPunchInResultHintsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 24) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __54__GEOPDSPunchInResultHints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 unsignedLongLongValue];
      *(unsigned char *)(v6 + 72) |= 0x40u;
      *(unsigned char *)(v6 + 72) |= 1u;
      *(void *)(v6 + 40) = v8;
    }

    v9 = [v5 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)[v9 copy];
      -[GEOPDSPunchInResultHints setName:](v6, v10);
    }
    if (a3) {
      id v11 = @"formattedAddress";
    }
    else {
      id v11 = @"formatted_address";
    }
    v12 = [v5 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = (void *)[v12 copy];
      -[GEOPDSPunchInResultHints setFormattedAddress:](v6, v13);
    }
    v14 = [v5 objectForKeyedSubscript:@"center"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [GEOLatLng alloc];
      if (a3) {
        int v16 = [(GEOLatLng *)v15 initWithJSON:v14];
      }
      else {
        int v16 = [(GEOLatLng *)v15 initWithDictionary:v14];
      }
      v17 = v16;
      -[GEOPDSPunchInResultHints setCenter:](v6, v16);
    }
    if (a3) {
      v18 = @"placeType";
    }
    else {
      v18 = @"place_type";
    }
    v19 = [v5 objectForKeyedSubscript:v18];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v19;
      if ([v20 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
      {
        int v21 = 0;
      }
      else if ([v20 isEqualToString:@"COUNTRY"])
      {
        int v21 = 1;
      }
      else if ([v20 isEqualToString:@"ADMINISTRATIVE_AREA"])
      {
        int v21 = 2;
      }
      else if ([v20 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
      {
        int v21 = 4;
      }
      else if ([v20 isEqualToString:@"LOCALITY"])
      {
        int v21 = 16;
      }
      else if ([v20 isEqualToString:@"TIME_ZONE"])
      {
        int v21 = 35;
      }
      else if ([v20 isEqualToString:@"SUB_LOCALITY"])
      {
        int v21 = 43;
      }
      else if ([v20 isEqualToString:@"OCEAN"])
      {
        int v21 = 44;
      }
      else if ([v20 isEqualToString:@"AOI"])
      {
        int v21 = 45;
      }
      else if ([v20 isEqualToString:@"INLAND_WATER"])
      {
        int v21 = 46;
      }
      else if ([v20 isEqualToString:@"BUSINESS"])
      {
        int v21 = 47;
      }
      else if ([v20 isEqualToString:@"ISLAND"])
      {
        int v21 = 48;
      }
      else if ([v20 isEqualToString:@"STREET"])
      {
        int v21 = 49;
      }
      else if ([v20 isEqualToString:@"ADMIN"])
      {
        int v21 = 50;
      }
      else if ([v20 isEqualToString:@"POSTAL"])
      {
        int v21 = 51;
      }
      else if ([v20 isEqualToString:@"INTERSECTION"])
      {
        int v21 = 54;
      }
      else if ([v20 isEqualToString:@"BUILDING"])
      {
        int v21 = 55;
      }
      else if ([v20 isEqualToString:@"ADDRESS"])
      {
        int v21 = 57;
      }
      else if ([v20 isEqualToString:@"CONTINENT"])
      {
        int v21 = 61;
      }
      else if ([v20 isEqualToString:@"REGION"])
      {
        int v21 = 63;
      }
      else if ([v20 isEqualToString:@"DIVISION"])
      {
        int v21 = 64;
      }
      else if ([v20 isEqualToString:@"PHYSICAL_FEATURE"])
      {
        int v21 = 65;
      }
      else
      {
        int v21 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_69:

        goto LABEL_70;
      }
      int v21 = [v19 intValue];
    }
    *(unsigned char *)(v6 + 72) |= 0x40u;
    *(unsigned char *)(v6 + 72) |= 2u;
    *(_DWORD *)(v6 + 68) = v21;
    goto LABEL_69;
  }
LABEL_70:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSPunchInResultHintsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
  {
    uint64_t v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    id v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_formattedAddress)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSPunchInResultHintsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_muid;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_formattedAddress copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_placeType;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 1);
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_muid != *((void *)v4 + 5)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_17;
  }
  formattedAddress = self->_formattedAddress;
  if ((unint64_t)formattedAddress | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](formattedAddress, "isEqual:")) {
      goto LABEL_17;
    }
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 72) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_placeType != *((_DWORD *)v4 + 17)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  NSUInteger v5 = [(NSString *)self->_formattedAddress hash];
  unint64_t v6 = [(GEOLatLng *)self->_center hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_placeType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_formattedAddress, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end