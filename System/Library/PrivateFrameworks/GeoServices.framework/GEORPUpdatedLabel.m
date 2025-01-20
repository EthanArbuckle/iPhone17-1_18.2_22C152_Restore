@interface GEORPUpdatedLabel
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCenter;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocalizedText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)center;
- (GEORPUpdatedLabel)init;
- (GEORPUpdatedLabel)initWithData:(id)a3;
- (GEORPUpdatedLabel)initWithDictionary:(id)a3;
- (GEORPUpdatedLabel)initWithJSON:(id)a3;
- (NSString)localizedText;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCenter;
- (void)_readLocalizedText;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCenter:(id)a3;
- (void)setLocalizedText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPUpdatedLabel

- (GEORPUpdatedLabel)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPUpdatedLabel;
  v2 = [(GEORPUpdatedLabel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPUpdatedLabel)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPUpdatedLabel;
  v3 = [(GEORPUpdatedLabel *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocalizedText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUpdatedLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedText_tags_3349);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasLocalizedText
{
  return self->_localizedText != 0;
}

- (NSString)localizedText
{
  -[GEORPUpdatedLabel _readLocalizedText]((uint64_t)self);
  localizedText = self->_localizedText;

  return localizedText;
}

- (void)setLocalizedText:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_localizedText, a3);
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUpdatedLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEORPUpdatedLabel _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)setCenter:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPUpdatedLabel;
  v4 = [(GEORPUpdatedLabel *)&v8 description];
  v5 = [(GEORPUpdatedLabel *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPUpdatedLabel _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 localizedText];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"localizedText";
      }
      else {
        objc_super v6 = @"localized_text";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 center];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"center"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPUpdatedLabel _dictionaryRepresentation:](self, 1);
}

- (GEORPUpdatedLabel)initWithDictionary:(id)a3
{
  return (GEORPUpdatedLabel *)-[GEORPUpdatedLabel _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"localizedText";
      }
      else {
        objc_super v6 = @"localized_text";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setLocalizedText:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setCenter:v11];
      }
    }
  }

  return a1;
}

- (GEORPUpdatedLabel)initWithJSON:(id)a3
{
  return (GEORPUpdatedLabel *)-[GEORPUpdatedLabel _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_3353;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3354;
    }
    GEORPUpdatedLabelReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_center readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPUpdatedLabelIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPUpdatedLabelReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPUpdatedLabel *)self readAll:0];
    if (self->_localizedText) {
      PBDataWriterWriteStringField();
    }
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPUpdatedLabel _readCenter]((uint64_t)self);
  center = self->_center;

  return [(GEOLatLng *)center hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPUpdatedLabel *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_localizedText) {
    objc_msgSend(v4, "setLocalizedText:");
  }
  if (self->_center) {
    objc_msgSend(v4, "setCenter:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPUpdatedLabel *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_localizedText copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEOLatLng *)self->_center copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPUpdatedLabelReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPUpdatedLabel *)self readAll:1],
         [v4 readAll:1],
         localizedText = self->_localizedText,
         !((unint64_t)localizedText | v4[3]))
     || -[NSString isEqual:](localizedText, "isEqual:")))
  {
    center = self->_center;
    if ((unint64_t)center | v4[2]) {
      char v7 = -[GEOLatLng isEqual:](center, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEORPUpdatedLabel *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_localizedText hash];
  return [(GEOLatLng *)self->_center hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  if (v6[3]) {
    -[GEORPUpdatedLabel setLocalizedText:](self, "setLocalizedText:");
  }
  center = self->_center;
  uint64_t v5 = v6[2];
  if (center)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPUpdatedLabel setCenter:](self, "setCenter:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedText, 0);
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end