@interface GEOPDResultRefinementMultiSelectElement
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementMultiSelectElement)init;
- (GEOPDResultRefinementMultiSelectElement)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)metadata;
- (uint64_t)elementType;
- (uint64_t)evChargingConnectorType;
- (unint64_t)hash;
- (void)_readDisplayName;
- (void)_readMetadata;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayName:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementMultiSelectElement

- (unint64_t)hash
{
  -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_isSelected;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  unint64_t v6 = [(GEOPDResultRefinementMetadata *)self->_metadata hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    uint64_t v8 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v9 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v8 = 2654435761 * self->_elementType;
  if ((flags & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_evChargingConnectorType;
  if ((flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_selectionSequenceNumber;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 0);
    uint64_t v9 = [(NSString *)self->_displayName copyWithZone:a3];
    uint64_t v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(unsigned char *)(v5 + 72) = self->_isSelected;
      *(_WORD *)(v5 + 76) |= 8u;
    }
    id v11 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
    v12 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v11;

    id v13 = [(GEOPDResultRefinementMetadata *)self->_metadata copyWithZone:a3];
    v14 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v13;

    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      *(_DWORD *)(v5 + 60) = self->_elementType;
      *(_WORD *)(v5 + 76) |= 1u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_9:
        if ((flags & 4) == 0)
        {
LABEL_11:
          v16 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v16;
          goto LABEL_12;
        }
LABEL_10:
        *(_DWORD *)(v5 + 68) = self->_selectionSequenceNumber;
        *(_WORD *)(v5 + 76) |= 4u;
        goto LABEL_11;
      }
    }
    else if ((flags & 2) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 64) = self->_evChargingConnectorType;
    *(_WORD *)(v5 + 76) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDResultRefinementMultiSelectElementReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_12:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_isSelected)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_30;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_12;
      }
    }
LABEL_30:
    BOOL v11 = 0;
    goto LABEL_31;
  }
  if ((v6 & 8) != 0) {
    goto LABEL_30;
  }
LABEL_12:
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 5)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_30;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:")) {
      goto LABEL_30;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 38);
  if (flags)
  {
    if ((v10 & 1) == 0 || self->_elementType != *((_DWORD *)v4 + 15)) {
      goto LABEL_30;
    }
  }
  else if (v10)
  {
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_evChargingConnectorType != *((_DWORD *)v4 + 16)) {
      goto LABEL_30;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_30;
  }
  BOOL v11 = (v10 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_selectionSequenceNumber != *((_DWORD *)v4 + 17)) {
      goto LABEL_30;
    }
    BOOL v11 = 1;
  }
LABEL_31:

  return v11;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x10u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementMultiSelectElement readAll:](a1, 0);
      [*(id *)(a1 + 40) clearUnknownFields:1];
      uint64_t v5 = *(void **)(a1 + 32);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDResultRefinementMultiSelectElement)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementMultiSelectElement;
  v2 = [(GEOPDResultRefinementMultiSelectElement *)&v6 init];
  NSUInteger v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementMultiSelectElement)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementMultiSelectElement;
  NSUInteger v3 = [(GEOPDResultRefinementMultiSelectElement *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_852);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementMultiSelectElement _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 76) |= 0x20u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_854);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)metadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementMultiSelectElement _readMetadata]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 76) |= 0x40u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)elementType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if (v2) {
      return *(unsigned int *)(v1 + 60);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)evChargingConnectorType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 64);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementMultiSelectElement;
  id v4 = [(GEOPDResultRefinementMultiSelectElement *)&v8 description];
  uint64_t v5 = [(GEOPDResultRefinementMultiSelectElement *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMultiSelectElement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_36;
  }
  -[GEOPDResultRefinementMultiSelectElement readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = -[GEOPDResultRefinementMultiSelectElement displayName]((id *)a1);
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"displayName";
    }
    else {
      objc_super v6 = @"display_name";
    }
    [v4 setObject:v5 forKey:v6];
  }

  if ((*(_WORD *)(a1 + 76) & 8) != 0)
  {
    objc_super v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
    if (a2) {
      objc_super v8 = @"isSelected";
    }
    else {
      objc_super v8 = @"is_selected";
    }
    [v4 setObject:v7 forKey:v8];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
  {
    uint64_t v9 = *(void **)(a1 + 8);
    if (v9)
    {
      id v10 = v9;
      objc_sync_enter(v10);
      GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_853);
      objc_sync_exit(v10);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (v11)
  {
    if (a2)
    {
      id v13 = [v11 jsonRepresentation];
      v14 = @"styleAttributes";
    }
    else
    {
      id v13 = [v11 dictionaryRepresentation];
      v14 = @"style_attributes";
    }
    [v4 setObject:v13 forKey:v14];
  }
  v15 = -[GEOPDResultRefinementMultiSelectElement metadata]((id *)a1);
  v16 = v15;
  if (v15)
  {
    if (a2) {
      [v15 jsonRepresentation];
    }
    else {
    v17 = [v15 dictionaryRepresentation];
    }
    [v4 setObject:v17 forKey:@"metadata"];
  }
  __int16 v18 = *(_WORD *)(a1 + 76);
  if (v18)
  {
    int v28 = *(_DWORD *)(a1 + 60);
    if (v28)
    {
      if (v28 == 1)
      {
        v29 = @"RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_EV_CHARGING";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v29 = @"RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_DEFAULT";
    }
    if (a2) {
      v30 = @"elementType";
    }
    else {
      v30 = @"element_type";
    }
    [v4 setObject:v29 forKey:v30];

    __int16 v18 = *(_WORD *)(a1 + 76);
    if ((v18 & 2) == 0)
    {
LABEL_27:
      if ((v18 & 4) == 0) {
        goto LABEL_32;
      }
      goto LABEL_28;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_27;
  }
  uint64_t v31 = *(int *)(a1 + 64);
  if (v31 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = off_1E53E5D28[v31];
  }
  if (a2) {
    v33 = @"evChargingConnectorType";
  }
  else {
    v33 = @"ev_charging_connector_type";
  }
  [v4 setObject:v32 forKey:v33];

  if ((*(_WORD *)(a1 + 76) & 4) != 0)
  {
LABEL_28:
    v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    if (a2) {
      v20 = @"selectionSequenceNumber";
    }
    else {
      v20 = @"selection_sequence_number";
    }
    [v4 setObject:v19 forKey:v20];
  }
LABEL_32:
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    v22 = [v21 dictionaryRepresentation];
    v23 = v22;
    if (a2)
    {
      v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __69__GEOPDResultRefinementMultiSelectElement__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E53D8860;
      id v25 = v24;
      id v35 = v25;
      [v23 enumerateKeysAndObjectsUsingBlock:v34];
      id v26 = v25;

      v23 = v26;
    }
    [v4 setObject:v23 forKey:@"Unknown Fields"];
  }
LABEL_36:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementMultiSelectElement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_879;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_880;
      }
      GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 40) readAll:1];
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __69__GEOPDResultRefinementMultiSelectElement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementMultiSelectElementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), __int16 v5 = (__int16)self->_flags, (v5 & 0x1A0) != 0)
    || (v5 & 0x40) != 0
    && (GEOPDResultRefinementMetadataIsDirty((os_unfair_lock_s *)self->_metadata) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    id v6 = v10;
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v6 = v10;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v10;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v10;
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v10;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_13:
        if ((flags & 4) == 0)
        {
LABEL_15:
          [(PBUnknownFields *)self->_unknownFields writeTo:v6];
          goto LABEL_16;
        }
LABEL_14:
        PBDataWriterWriteUint32Field();
        id v6 = v10;
        goto LABEL_15;
      }
    }
    else if ((flags & 2) == 0)
    {
      goto LABEL_13;
    }
    PBDataWriterWriteInt32Field();
    id v6 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_super v8 = self->_reader;
  objc_sync_enter(v8);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v10 writeData:v9];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v8);
LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end