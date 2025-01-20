@interface GEOPDBusinessClaim
+ (BOOL)isValid:(id)a3;
+ (id)businessClaimForPlaceData:(id)a3;
- (BOOL)buttonEnabled;
- (BOOL)hasButtonEnabled;
- (BOOL)hasButtonLabel;
- (BOOL)hasDescriptionText;
- (BOOL)hasTitleText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBusinessClaim)init;
- (GEOPDBusinessClaim)initWithData:(id)a3;
- (GEOPDBusinessClaim)initWithDictionary:(id)a3;
- (GEOPDBusinessClaim)initWithJSON:(id)a3;
- (NSString)buttonLabel;
- (NSString)descriptionText;
- (NSString)titleText;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readButtonLabel;
- (void)_readDescriptionText;
- (void)_readTitleText;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setButtonEnabled:(BOOL)a3;
- (void)setButtonLabel:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setHasButtonEnabled:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBusinessClaim

+ (id)businessClaimForPlaceData:(id)a3
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
  v6[2] = __65__GEOPDBusinessClaim_PlaceDataExtras__businessClaimForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:25 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__GEOPDBusinessClaim_PlaceDataExtras__businessClaimForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue businessClaim](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDBusinessClaim)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBusinessClaim;
  v2 = [(GEOPDBusinessClaim *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDBusinessClaim)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBusinessClaim;
  id v3 = [(GEOPDBusinessClaim *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readButtonLabel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBusinessClaimReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonLabel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasButtonLabel
{
  return self->_buttonLabel != 0;
}

- (NSString)buttonLabel
{
  -[GEOPDBusinessClaim _readButtonLabel]((uint64_t)self);
  buttonLabel = self->_buttonLabel;

  return buttonLabel;
}

- (void)setButtonLabel:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_buttonLabel, a3);
}

- (BOOL)buttonEnabled
{
  return self->_buttonEnabled;
}

- (void)setButtonEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_buttonEnabled = a3;
}

- (void)setHasButtonEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasButtonEnabled
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readTitleText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBusinessClaimReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitleText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTitleText
{
  return self->_titleText != 0;
}

- (NSString)titleText
{
  -[GEOPDBusinessClaim _readTitleText]((uint64_t)self);
  titleText = self->_titleText;

  return titleText;
}

- (void)setTitleText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (void)_readDescriptionText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBusinessClaimReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDescriptionText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDescriptionText
{
  return self->_descriptionText != 0;
}

- (NSString)descriptionText
{
  -[GEOPDBusinessClaim _readDescriptionText]((uint64_t)self);
  descriptionText = self->_descriptionText;

  return descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBusinessClaim;
  id v4 = [(GEOPDBusinessClaim *)&v8 description];
  uint64_t v5 = [(GEOPDBusinessClaim *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBusinessClaim _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [(id)a1 buttonLabel];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"buttonLabel";
      }
      else {
        objc_super v6 = @"button_label";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 64))
    {
      objc_super v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
      if (a2) {
        objc_super v8 = @"buttonEnabled";
      }
      else {
        objc_super v8 = @"button_enabled";
      }
      [v4 setObject:v7 forKey:v8];
    }
    uint64_t v9 = [(id)a1 titleText];
    if (v9)
    {
      if (a2) {
        v10 = @"titleText";
      }
      else {
        v10 = @"title_text";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [(id)a1 descriptionText];
    if (v11)
    {
      if (a2) {
        id v12 = @"descriptionText";
      }
      else {
        id v12 = @"description_text";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = *(void **)(a1 + 16);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __48__GEOPDBusinessClaim__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOPDBusinessClaim _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDBusinessClaim__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOPDBusinessClaim)initWithDictionary:(id)a3
{
  return (GEOPDBusinessClaim *)-[GEOPDBusinessClaim _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"buttonLabel";
      }
      else {
        objc_super v6 = @"button_label";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setButtonLabel:v8];
      }
      if (a3) {
        uint64_t v9 = @"buttonEnabled";
      }
      else {
        uint64_t v9 = @"button_enabled";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setButtonEnabled:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        v11 = @"titleText";
      }
      else {
        v11 = @"title_text";
      }
      id v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setTitleText:v13];
      }
      if (a3) {
        v14 = @"descriptionText";
      }
      else {
        v14 = @"description_text";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setDescriptionText:v16];
      }
    }
  }

  return a1;
}

- (GEOPDBusinessClaim)initWithJSON:(id)a3
{
  return (GEOPDBusinessClaim *)-[GEOPDBusinessClaim _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_970_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_971_0;
    }
    GEOPDBusinessClaimReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDBusinessClaimIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBusinessClaimReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
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
    [(GEOPDBusinessClaim *)self readAll:0];
    if (self->_buttonLabel) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    if (self->_titleText)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_descriptionText)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDBusinessClaim *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_buttonLabel) {
    objc_msgSend(v5, "setButtonLabel:");
  }
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v5 + 60) = self->_buttonEnabled;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  if (self->_titleText)
  {
    objc_msgSend(v5, "setTitleText:");
    id v4 = v5;
  }
  if (self->_descriptionText)
  {
    objc_msgSend(v5, "setDescriptionText:");
    id v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDBusinessClaimReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDBusinessClaim *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_buttonLabel copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 60) = self->_buttonEnabled;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_titleText copyWithZone:a3];
  id v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  uint64_t v13 = [(NSString *)self->_descriptionText copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOPDBusinessClaim *)self readAll:1];
  [v4 readAll:1];
  buttonLabel = self->_buttonLabel;
  if ((unint64_t)buttonLabel | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](buttonLabel, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 64))
    {
      if (self->_buttonEnabled)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    char v8 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 64)) {
    goto LABEL_16;
  }
LABEL_12:
  titleText = self->_titleText;
  if ((unint64_t)titleText | *((void *)v4 + 5) && !-[NSString isEqual:](titleText, "isEqual:")) {
    goto LABEL_16;
  }
  descriptionText = self->_descriptionText;
  if ((unint64_t)descriptionText | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](descriptionText, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDBusinessClaim *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_buttonLabel hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_buttonEnabled;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_titleText hash];
  return v5 ^ v6 ^ [(NSString *)self->_descriptionText hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = a3;
  [v5 readAll:0];
  uint64_t v4 = v5;
  if (v5[3])
  {
    -[GEOPDBusinessClaim setButtonLabel:](self, "setButtonLabel:");
    uint64_t v4 = v5;
  }
  if (v4[8])
  {
    self->_buttonEnabled = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v4[5])
  {
    -[GEOPDBusinessClaim setTitleText:](self, "setTitleText:");
    uint64_t v4 = v5;
  }
  if (v4[4])
  {
    -[GEOPDBusinessClaim setDescriptionText:](self, "setDescriptionText:");
    uint64_t v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOPDBusinessClaimReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_975);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDBusinessClaim *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end