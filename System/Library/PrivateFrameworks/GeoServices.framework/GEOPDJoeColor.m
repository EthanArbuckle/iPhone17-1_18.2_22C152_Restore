@interface GEOPDJoeColor
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDJoeColor)init;
- (GEOPDJoeColor)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)backgroundColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readBackgroundColor;
- (void)readAll:(uint64_t)a1;
- (void)setBackgroundColor:(uint64_t)a1;
- (void)setPrimaryTextColor:(uint64_t)a1;
- (void)setQuaternaryTextColor:(uint64_t)a1;
- (void)setSecondaryTextColor:(uint64_t)a1;
- (void)setTertiaryTextColor:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDJoeColor

- (GEOPDJoeColor)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDJoeColor;
  v2 = [(GEOPDJoeColor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_5991;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_5992;
      }
      GEOPDJoeColorReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)backgroundColor
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDJoeColor _readBackgroundColor]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readBackgroundColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDJoeColorReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBackgroundColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOPDJoeColor)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDJoeColor;
  id v3 = [(GEOPDJoeColor *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setBackgroundColor:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 80) |= 4u;
  *(unsigned char *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setPrimaryTextColor:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 80) |= 8u;
  *(unsigned char *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setSecondaryTextColor:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 80) |= 0x20u;
  *(unsigned char *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setTertiaryTextColor:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 80) |= 0x40u;
  *(unsigned char *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setQuaternaryTextColor:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 80) |= 0x10u;
  *(unsigned char *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDJoeColor;
  id v4 = [(GEOPDJoeColor *)&v8 description];
  id v5 = [(GEOPDJoeColor *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDJoeColor _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDJoeColor readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDJoeColor backgroundColor]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"backgroundColor";
      }
      else {
        objc_super v6 = @"background_color";
      }
      [v4 setObject:v5 forKey:v6];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      objc_super v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEOPDJoeColorReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrimaryTextColor_tags);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v9 = *(id *)(a1 + 32);
    if (v9)
    {
      if (a2) {
        v10 = @"primaryTextColor";
      }
      else {
        v10 = @"primary_text_color";
      }
      [v4 setObject:v9 forKey:v10];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDJoeColorReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryTextColor_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v13 = *(id *)(a1 + 48);
    if (v13)
    {
      if (a2) {
        v14 = @"secondaryTextColor";
      }
      else {
        v14 = @"secondary_text_color";
      }
      [v4 setObject:v13 forKey:v14];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDJoeColorReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTertiaryTextColor_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v17 = *(id *)(a1 + 56);
    if (v17)
    {
      if (a2) {
        v18 = @"tertiaryTextColor";
      }
      else {
        v18 = @"tertiary_text_color";
      }
      [v4 setObject:v17 forKey:v18];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDJoeColorReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuaternaryTextColor_tags);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v21 = *(id *)(a1 + 40);
    if (v21)
    {
      if (a2) {
        v22 = @"quaternaryTextColor";
      }
      else {
        v22 = @"quaternary_text_color";
      }
      [v4 setObject:v21 forKey:v22];
    }

    if (*(unsigned char *)(a1 + 80))
    {
      v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
      [v4 setObject:v23 forKey:@"curated"];
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __43__GEOPDJoeColor__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
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
  return -[GEOPDJoeColor _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOPDJoeColor__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDJoeColorReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 3u))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDJoeColor readAll:]((uint64_t)self, 0);
    if (self->_backgroundColor) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_primaryTextColor)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_secondaryTextColor)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_tertiaryTextColor)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_quaternaryTextColor)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
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
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDJoeColorReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDJoeColor readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_backgroundColor copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_primaryTextColor copyWithZone:a3];
  id v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_secondaryTextColor copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_tertiaryTextColor copyWithZone:a3];
  id v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  uint64_t v17 = [(NSString *)self->_quaternaryTextColor copyWithZone:a3];
  v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 76) = self->_curated;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  -[GEOPDJoeColor readAll:]((uint64_t)self, 1);
  -[GEOPDJoeColor readAll:]((uint64_t)v4, 1);
  backgroundColor = self->_backgroundColor;
  if ((unint64_t)backgroundColor | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](backgroundColor, "isEqual:")) {
      goto LABEL_14;
    }
  }
  primaryTextColor = self->_primaryTextColor;
  if ((unint64_t)primaryTextColor | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](primaryTextColor, "isEqual:")) {
      goto LABEL_14;
    }
  }
  secondaryTextColor = self->_secondaryTextColor;
  if ((unint64_t)secondaryTextColor | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](secondaryTextColor, "isEqual:")) {
      goto LABEL_14;
    }
  }
  tertiaryTextColor = self->_tertiaryTextColor;
  if ((unint64_t)tertiaryTextColor | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](tertiaryTextColor, "isEqual:")) {
      goto LABEL_14;
    }
  }
  quaternaryTextColor = self->_quaternaryTextColor;
  if ((unint64_t)quaternaryTextColor | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](quaternaryTextColor, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 80) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0)
    {
LABEL_14:
      BOOL v10 = 0;
      goto LABEL_15;
    }
    if (self->_curated)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_14;
    }
    BOOL v10 = 1;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDJoeColor readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_backgroundColor hash];
  NSUInteger v4 = [(NSString *)self->_primaryTextColor hash];
  NSUInteger v5 = [(NSString *)self->_secondaryTextColor hash];
  NSUInteger v6 = [(NSString *)self->_tertiaryTextColor hash];
  NSUInteger v7 = [(NSString *)self->_quaternaryTextColor hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_curated;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_quaternaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end