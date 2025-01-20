@interface GEORPFeedbackCoordinateField
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEdited;
- (BOOL)hasEditedTile;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOriginal;
- (BOOL)hasOriginalTile;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)edited;
- (GEOLatLng)original;
- (GEORPFeedbackCoordinateField)init;
- (GEORPFeedbackCoordinateField)initWithData:(id)a3;
- (GEORPFeedbackCoordinateField)initWithDictionary:(id)a3;
- (GEORPFeedbackCoordinateField)initWithJSON:(id)a3;
- (GEORPFeedbackTileFeatureInfo)editedTile;
- (GEORPFeedbackTileFeatureInfo)originalTile;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEdited;
- (void)_readEditedTile;
- (void)_readOriginal;
- (void)_readOriginalTile;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEdited:(id)a3;
- (void)setEditedTile:(id)a3;
- (void)setOriginal:(id)a3;
- (void)setOriginalTile:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackCoordinateField

- (GEORPFeedbackCoordinateField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackCoordinateField;
  v2 = [(GEORPFeedbackCoordinateField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackCoordinateField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackCoordinateField;
  v3 = [(GEORPFeedbackCoordinateField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginal
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginal_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOriginal
{
  return self->_original != 0;
}

- (GEOLatLng)original
{
  -[GEORPFeedbackCoordinateField _readOriginal]((uint64_t)self);
  original = self->_original;

  return original;
}

- (void)setOriginal:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_original, a3);
}

- (void)_readEdited
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEdited_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEdited
{
  return self->_edited != 0;
}

- (GEOLatLng)edited
{
  -[GEORPFeedbackCoordinateField _readEdited]((uint64_t)self);
  edited = self->_edited;

  return edited;
}

- (void)setEdited:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_edited, a3);
}

- (void)_readEditedTile
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEditedTile_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEditedTile
{
  return self->_editedTile != 0;
}

- (GEORPFeedbackTileFeatureInfo)editedTile
{
  -[GEORPFeedbackCoordinateField _readEditedTile]((uint64_t)self);
  editedTile = self->_editedTile;

  return editedTile;
}

- (void)setEditedTile:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_editedTile, a3);
}

- (void)_readOriginalTile
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalTile_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOriginalTile
{
  return self->_originalTile != 0;
}

- (GEORPFeedbackTileFeatureInfo)originalTile
{
  -[GEORPFeedbackCoordinateField _readOriginalTile]((uint64_t)self);
  originalTile = self->_originalTile;

  return originalTile;
}

- (void)setOriginalTile:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_originalTile, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackCoordinateField;
  v4 = [(GEORPFeedbackCoordinateField *)&v8 description];
  v5 = [(GEORPFeedbackCoordinateField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackCoordinateField _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 original];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"original"];
    }
    objc_super v8 = [a1 edited];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"edited"];
    }
    v11 = [a1 editedTile];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"editedTile";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"edited_tile";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [a1 originalTile];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"originalTile";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"original_tile";
      }
      [v4 setObject:v17 forKey:v18];
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
  return -[GEORPFeedbackCoordinateField _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackCoordinateField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackCoordinateField *)-[GEORPFeedbackCoordinateField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setOriginal:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"edited"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v12 = [(GEOLatLng *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOLatLng *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setEdited:v12];
      }
      if (a3) {
        v14 = @"editedTile";
      }
      else {
        v14 = @"edited_tile";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEORPFeedbackTileFeatureInfo alloc];
        if (a3) {
          uint64_t v17 = [(GEORPFeedbackTileFeatureInfo *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEORPFeedbackTileFeatureInfo *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setEditedTile:v17];
      }
      if (a3) {
        v19 = @"originalTile";
      }
      else {
        v19 = @"original_tile";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [GEORPFeedbackTileFeatureInfo alloc];
        if (a3) {
          uint64_t v22 = [(GEORPFeedbackTileFeatureInfo *)v21 initWithJSON:v20];
        }
        else {
          uint64_t v22 = [(GEORPFeedbackTileFeatureInfo *)v21 initWithDictionary:v20];
        }
        v23 = (void *)v22;
        [a1 setOriginalTile:v22];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackCoordinateField)initWithJSON:(id)a3
{
  return (GEORPFeedbackCoordinateField *)-[GEORPFeedbackCoordinateField _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_50;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_50;
    }
    GEORPFeedbackCoordinateFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackCoordinateFieldCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackCoordinateFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackCoordinateFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackCoordinateFieldIsDirty((uint64_t)self))
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
    [(GEORPFeedbackCoordinateField *)self readAll:0];
    if (self->_original) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_edited) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_editedTile) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_originalTile) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackCoordinateField _readEdited]((uint64_t)self);
  if ([(GEOLatLng *)self->_edited hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackCoordinateField _readOriginal]((uint64_t)self);
  original = self->_original;

  return [(GEOLatLng *)original hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackCoordinateField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_original) {
    objc_msgSend(v5, "setOriginal:");
  }
  if (self->_edited) {
    objc_msgSend(v5, "setEdited:");
  }
  v4 = v5;
  if (self->_editedTile)
  {
    objc_msgSend(v5, "setEditedTile:");
    v4 = v5;
  }
  if (self->_originalTile)
  {
    objc_msgSend(v5, "setOriginalTile:");
    v4 = v5;
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
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackCoordinateField *)self readAll:0];
    id v8 = [(GEOLatLng *)self->_original copyWithZone:a3];
    v9 = (void *)v5[5];
    v5[5] = v8;

    id v10 = [(GEOLatLng *)self->_edited copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    id v12 = [(GEORPFeedbackTileFeatureInfo *)self->_editedTile copyWithZone:a3];
    v13 = (void *)v5[2];
    v5[2] = v12;

    id v14 = [(GEORPFeedbackTileFeatureInfo *)self->_originalTile copyWithZone:a3];
    id v7 = (PBDataReader *)v5[4];
    v5[4] = v14;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackCoordinateFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackCoordinateField *)self readAll:1],
         [v4 readAll:1],
         original = self->_original,
         !((unint64_t)original | v4[5]))
     || -[GEOLatLng isEqual:](original, "isEqual:"))
    && ((edited = self->_edited, !((unint64_t)edited | v4[3])) || -[GEOLatLng isEqual:](edited, "isEqual:"))
    && ((editedTile = self->_editedTile, !((unint64_t)editedTile | v4[2]))
     || -[GEORPFeedbackTileFeatureInfo isEqual:](editedTile, "isEqual:")))
  {
    originalTile = self->_originalTile;
    if ((unint64_t)originalTile | v4[4]) {
      char v9 = -[GEORPFeedbackTileFeatureInfo isEqual:](originalTile, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEORPFeedbackCoordinateField *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_original hash];
  unint64_t v4 = [(GEOLatLng *)self->_edited hash] ^ v3;
  unint64_t v5 = [(GEORPFeedbackTileFeatureInfo *)self->_editedTile hash];
  return v4 ^ v5 ^ [(GEORPFeedbackTileFeatureInfo *)self->_originalTile hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  original = self->_original;
  uint64_t v5 = v12[5];
  if (original)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](original, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackCoordinateField setOriginal:](self, "setOriginal:");
  }
  edited = self->_edited;
  uint64_t v7 = v12[3];
  if (edited)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](edited, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackCoordinateField setEdited:](self, "setEdited:");
  }
  editedTile = self->_editedTile;
  uint64_t v9 = v12[2];
  if (editedTile)
  {
    if (v9) {
      -[GEORPFeedbackTileFeatureInfo mergeFrom:](editedTile, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPFeedbackCoordinateField setEditedTile:](self, "setEditedTile:");
  }
  originalTile = self->_originalTile;
  uint64_t v11 = v12[4];
  if (originalTile)
  {
    if (v11) {
      -[GEORPFeedbackTileFeatureInfo mergeFrom:](originalTile, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackCoordinateField setOriginalTile:](self, "setOriginalTile:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_originalTile, 0);
  objc_storeStrong((id *)&self->_edited, 0);
  objc_storeStrong((id *)&self->_editedTile, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end