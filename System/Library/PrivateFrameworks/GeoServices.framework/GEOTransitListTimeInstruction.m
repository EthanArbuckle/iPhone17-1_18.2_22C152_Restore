@interface GEOTransitListTimeInstruction
+ (BOOL)isValid:(id)a3;
- (BOOL)_transit_hasAnyFieldSet;
- (BOOL)hasHideWhenListCollapsed;
- (BOOL)hasPrimaryText;
- (BOOL)hasSecondaryText;
- (BOOL)hideWhenListCollapsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)primaryText;
- (GEOFormattedString)secondaryText;
- (GEOTransitListTimeInstruction)init;
- (GEOTransitListTimeInstruction)initWithData:(id)a3;
- (GEOTransitListTimeInstruction)initWithDictionary:(id)a3;
- (GEOTransitListTimeInstruction)initWithJSON:(id)a3;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPrimaryText;
- (void)_readSecondaryText;
- (void)_transit_mergeFrom:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasHideWhenListCollapsed:(BOOL)a3;
- (void)setHideWhenListCollapsed:(BOOL)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitListTimeInstruction

- (GEOTransitListTimeInstruction)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitListTimeInstruction;
  v2 = [(GEOTransitListTimeInstruction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitListTimeInstruction)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitListTimeInstruction;
  v3 = [(GEOTransitListTimeInstruction *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPrimaryText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListTimeInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrimaryText_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPrimaryText
{
  return self->_primaryText != 0;
}

- (GEOFormattedString)primaryText
{
  -[GEOTransitListTimeInstruction _readPrimaryText]((uint64_t)self);
  primaryText = self->_primaryText;

  return primaryText;
}

- (void)setPrimaryText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_primaryText, a3);
}

- (void)_readSecondaryText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListTimeInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryText_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSecondaryText
{
  return self->_secondaryText != 0;
}

- (GEOFormattedString)secondaryText
{
  -[GEOTransitListTimeInstruction _readSecondaryText]((uint64_t)self);
  secondaryText = self->_secondaryText;

  return secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_secondaryText, a3);
}

- (BOOL)hideWhenListCollapsed
{
  return self->_hideWhenListCollapsed;
}

- (void)setHideWhenListCollapsed:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_hideWhenListCollapsed = a3;
}

- (void)setHasHideWhenListCollapsed:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasHideWhenListCollapsed
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitListTimeInstruction;
  v4 = [(GEOTransitListTimeInstruction *)&v8 description];
  v5 = [(GEOTransitListTimeInstruction *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitListTimeInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 primaryText];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"primaryText";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"primary_text";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 secondaryText];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"secondaryText";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"secondary_text";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
      if (a2) {
        v14 = @"hideWhenListCollapsed";
      }
      else {
        v14 = @"hide_when_list_collapsed";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __59__GEOTransitListTimeInstruction__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOTransitListTimeInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOTransitListTimeInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitListTimeInstruction)initWithDictionary:(id)a3
{
  return (GEOTransitListTimeInstruction *)-[GEOTransitListTimeInstruction _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"primaryText";
      }
      else {
        objc_super v6 = @"primary_text";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
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
        [a1 setPrimaryText:v9];
      }
      if (a3) {
        v11 = @"secondaryText";
      }
      else {
        v11 = @"secondary_text";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setSecondaryText:v14];
      }
      if (a3) {
        v16 = @"hideWhenListCollapsed";
      }
      else {
        v16 = @"hide_when_list_collapsed";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHideWhenListCollapsed:", objc_msgSend(v17, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOTransitListTimeInstruction)initWithJSON:(id)a3
{
  return (GEOTransitListTimeInstruction *)-[GEOTransitListTimeInstruction _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8309;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8310;
    }
    GEOTransitListTimeInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOFormattedString *)self->_primaryText readAll:1];
    [(GEOFormattedString *)self->_secondaryText readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitListTimeInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitListTimeInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitListTimeInstructionIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOTransitListTimeInstruction *)self readAll:0];
    if (self->_primaryText) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_secondaryText)
    {
      PBDataWriterWriteSubmessage();
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

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOTransitListTimeInstruction *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_primaryText) {
    objc_msgSend(v4, "setPrimaryText:");
  }
  if (self->_secondaryText) {
    objc_msgSend(v4, "setSecondaryText:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v4 + 52) = self->_hideWhenListCollapsed;
    *((unsigned char *)v4 + 56) |= 1u;
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitListTimeInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitListTimeInstruction *)self readAll:0];
  id v9 = [(GEOFormattedString *)self->_primaryText copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOFormattedString *)self->_secondaryText copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 52) = self->_hideWhenListCollapsed;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOTransitListTimeInstruction *)self readAll:1];
  [v4 readAll:1];
  primaryText = self->_primaryText;
  if ((unint64_t)primaryText | *((void *)v4 + 3))
  {
    if (!-[GEOFormattedString isEqual:](primaryText, "isEqual:")) {
      goto LABEL_8;
    }
  }
  secondaryText = self->_secondaryText;
  if ((unint64_t)secondaryText | *((void *)v4 + 4))
  {
    if (!-[GEOFormattedString isEqual:](secondaryText, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_hideWhenListCollapsed)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  [(GEOTransitListTimeInstruction *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_primaryText hash];
  unint64_t v4 = [(GEOFormattedString *)self->_secondaryText hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_hideWhenListCollapsed;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  primaryText = self->_primaryText;
  uint64_t v6 = v9[3];
  if (primaryText)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOFormattedString mergeFrom:](primaryText, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOTransitListTimeInstruction setPrimaryText:](self, "setPrimaryText:");
  }
  unint64_t v4 = v9;
LABEL_7:
  secondaryText = self->_secondaryText;
  uint64_t v8 = v4[4];
  if (secondaryText)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOFormattedString mergeFrom:](secondaryText, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOTransitListTimeInstruction setSecondaryText:](self, "setSecondaryText:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[7])
  {
    self->_hideWhenListCollapsed = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_flags |= 1u;
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitListTimeInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8314);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitListTimeInstruction *)self readAll:0];
    [(GEOFormattedString *)self->_primaryText clearUnknownFields:1];
    secondaryText = self->_secondaryText;
    [(GEOFormattedString *)secondaryText clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  if ([(GEOTransitListTimeInstruction *)self hasPrimaryText]) {
    return 1;
  }

  return [(GEOTransitListTimeInstruction *)self hasSecondaryText];
}

- (void)_transit_mergeFrom:(id)a3
{
  id v24 = a3;
  unint64_t v4 = [(GEOTransitListTimeInstruction *)self primaryText];
  uint64_t v5 = [v24 primaryText];
  id v6 = v4;
  id v7 = v5;
  if (!v7)
  {
    id v11 = v6;
    goto LABEL_19;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v8 = (id)_MergedGlobals_223;
  id v9 = v7;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v9 conformsToProtocol:_MergedGlobals_223])
  {
    char v10 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if (v10)
    {
LABEL_14:
      if ([v9 conformsToProtocol:v8]
        && [v6 conformsToProtocol:v8])
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        id v9 = v6;
      }
      id v11 = v9;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_14;
    }
    v12 = [v9 dictionaryRepresentation];
    uint64_t v13 = [v12 count];

    if (v13) {
      goto LABEL_14;
    }
  }
  id v11 = 0;
LABEL_18:

LABEL_19:
  [(GEOTransitListTimeInstruction *)self setPrimaryText:v11];

  uint64_t v14 = [(GEOTransitListTimeInstruction *)self secondaryText];
  v15 = [v24 secondaryText];
  id v16 = v14;
  id v17 = v15;
  if (!v17)
  {
    id v21 = v16;
    goto LABEL_37;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v18 = (id)_MergedGlobals_223;
  id v19 = v17;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v19 conformsToProtocol:_MergedGlobals_223])
  {
    char v20 = objc_msgSend(v19, "_transit_hasAnyFieldSet");

    if (v20)
    {
LABEL_32:
      if ([v19 conformsToProtocol:v18]
        && [v16 conformsToProtocol:v18])
      {
        objc_msgSend(v16, "_transit_mergeFrom:", v19);
        id v19 = v16;
      }
      id v21 = v19;
      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_32;
    }
    v22 = [v19 dictionaryRepresentation];
    uint64_t v23 = [v22 count];

    if (v23) {
      goto LABEL_32;
    }
  }
  id v21 = 0;
LABEL_36:

LABEL_37:
  [(GEOTransitListTimeInstruction *)self setSecondaryText:v21];
}

@end