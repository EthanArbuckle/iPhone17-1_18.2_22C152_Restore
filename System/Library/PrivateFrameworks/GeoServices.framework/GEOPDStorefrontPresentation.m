@interface GEOPDStorefrontPresentation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCloseUpView;
- (BOOL)hasOverlayImageUrl;
- (BOOL)hasStandOffView;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDStorefrontPresentation)init;
- (GEOPDStorefrontPresentation)initWithData:(id)a3;
- (GEOPDStorefrontPresentation)initWithDictionary:(id)a3;
- (GEOPDStorefrontPresentation)initWithJSON:(id)a3;
- (GEOPDStorefrontView)closeUpView;
- (GEOPDStorefrontView)standOffView;
- (NSString)overlayImageUrl;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCloseUpView;
- (void)_readOverlayImageUrl;
- (void)_readStandOffView;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCloseUpView:(id)a3;
- (void)setOverlayImageUrl:(id)a3;
- (void)setStandOffView:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDStorefrontPresentation

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDStorefrontPresentation *)self readAll:0];
    id v8 = [(GEOPDStorefrontView *)self->_closeUpView copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEOPDStorefrontView *)self->_standOffView copyWithZone:a3];
    v11 = (void *)v5[4];
    v5[4] = v10;

    uint64_t v12 = [(NSString *)self->_overlayImageUrl copyWithZone:a3];
    v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDStorefrontPresentationReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (GEOPDStorefrontPresentation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDStorefrontPresentation;
  v2 = [(GEOPDStorefrontPresentation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standOffView, 0);
  objc_storeStrong((id *)&self->_overlayImageUrl, 0);
  objc_storeStrong((id *)&self->_closeUpView, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDStorefrontPresentationIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
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
    [(GEOPDStorefrontPresentation *)self readAll:0];
    if (self->_closeUpView) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_standOffView) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_overlayImageUrl) {
      PBDataWriterWriteStringField();
    }
  }
}

- (GEOPDStorefrontPresentation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDStorefrontPresentation;
  v3 = [(GEOPDStorefrontPresentation *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCloseUpView
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontPresentationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCloseUpView_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCloseUpView
{
  return self->_closeUpView != 0;
}

- (GEOPDStorefrontView)closeUpView
{
  -[GEOPDStorefrontPresentation _readCloseUpView]((uint64_t)self);
  closeUpView = self->_closeUpView;

  return closeUpView;
}

- (void)setCloseUpView:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_closeUpView, a3);
}

- (void)_readStandOffView
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontPresentationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStandOffView_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasStandOffView
{
  return self->_standOffView != 0;
}

- (GEOPDStorefrontView)standOffView
{
  -[GEOPDStorefrontPresentation _readStandOffView]((uint64_t)self);
  standOffView = self->_standOffView;

  return standOffView;
}

- (void)setStandOffView:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_standOffView, a3);
}

- (void)_readOverlayImageUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontPresentationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOverlayImageUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOverlayImageUrl
{
  return self->_overlayImageUrl != 0;
}

- (NSString)overlayImageUrl
{
  -[GEOPDStorefrontPresentation _readOverlayImageUrl]((uint64_t)self);
  overlayImageUrl = self->_overlayImageUrl;

  return overlayImageUrl;
}

- (void)setOverlayImageUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_overlayImageUrl, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDStorefrontPresentation;
  v4 = [(GEOPDStorefrontPresentation *)&v8 description];
  v5 = [(GEOPDStorefrontPresentation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontPresentation _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 closeUpView];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"closeUpView";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"close_up_view";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 standOffView];
    id v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        uint64_t v12 = @"standOffView";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        uint64_t v12 = @"stand_off_view";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 overlayImageUrl];
    if (v13)
    {
      if (a2) {
        v14 = @"overlayImageUrl";
      }
      else {
        v14 = @"overlay_image_url";
      }
      [v4 setObject:v13 forKey:v14];
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
  return -[GEOPDStorefrontPresentation _dictionaryRepresentation:](self, 1);
}

- (GEOPDStorefrontPresentation)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontPresentation *)-[GEOPDStorefrontPresentation _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"closeUpView";
      }
      else {
        objc_super v6 = @"close_up_view";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDStorefrontView alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDStorefrontView *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDStorefrontView *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setCloseUpView:v9];
      }
      if (a3) {
        v11 = @"standOffView";
      }
      else {
        v11 = @"stand_off_view";
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOPDStorefrontView alloc];
        if (a3) {
          uint64_t v14 = [(GEOPDStorefrontView *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOPDStorefrontView *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setStandOffView:v14];
      }
      if (a3) {
        v16 = @"overlayImageUrl";
      }
      else {
        v16 = @"overlay_image_url";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setOverlayImageUrl:v18];
      }
    }
  }

  return a1;
}

- (GEOPDStorefrontPresentation)initWithJSON:(id)a3
{
  return (GEOPDStorefrontPresentation *)-[GEOPDStorefrontPresentation _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_232_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_233_0;
    }
    GEOPDStorefrontPresentationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDStorefrontView *)self->_closeUpView readAll:1];
    [(GEOPDStorefrontView *)self->_standOffView readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontPresentationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontPresentationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDStorefrontPresentation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_closeUpView) {
    objc_msgSend(v5, "setCloseUpView:");
  }
  if (self->_standOffView) {
    objc_msgSend(v5, "setStandOffView:");
  }
  v4 = v5;
  if (self->_overlayImageUrl)
  {
    objc_msgSend(v5, "setOverlayImageUrl:");
    v4 = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDStorefrontPresentation *)self readAll:1],
         [v4 readAll:1],
         closeUpView = self->_closeUpView,
         !((unint64_t)closeUpView | v4[2]))
     || -[GEOPDStorefrontView isEqual:](closeUpView, "isEqual:"))
    && ((standOffView = self->_standOffView, !((unint64_t)standOffView | v4[4]))
     || -[GEOPDStorefrontView isEqual:](standOffView, "isEqual:")))
  {
    overlayImageUrl = self->_overlayImageUrl;
    if ((unint64_t)overlayImageUrl | v4[3]) {
      char v8 = -[NSString isEqual:](overlayImageUrl, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDStorefrontPresentation *)self readAll:1];
  unint64_t v3 = [(GEOPDStorefrontView *)self->_closeUpView hash];
  unint64_t v4 = [(GEOPDStorefrontView *)self->_standOffView hash] ^ v3;
  return v4 ^ [(NSString *)self->_overlayImageUrl hash];
}

- (void)mergeFrom:(id)a3
{
  char v8 = a3;
  [v8 readAll:0];
  closeUpView = self->_closeUpView;
  uint64_t v5 = v8[2];
  if (closeUpView)
  {
    if (v5) {
      -[GEOPDStorefrontView mergeFrom:](closeUpView, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDStorefrontPresentation setCloseUpView:](self, "setCloseUpView:");
  }
  standOffView = self->_standOffView;
  uint64_t v7 = v8[4];
  if (standOffView)
  {
    if (v7) {
      -[GEOPDStorefrontView mergeFrom:](standOffView, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPDStorefrontPresentation setStandOffView:](self, "setStandOffView:");
  }
  if (v8[3]) {
    -[GEOPDStorefrontPresentation setOverlayImageUrl:](self, "setOverlayImageUrl:");
  }
}

@end