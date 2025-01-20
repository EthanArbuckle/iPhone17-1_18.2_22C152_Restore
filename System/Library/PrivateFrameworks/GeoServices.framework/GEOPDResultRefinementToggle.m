@interface GEOPDResultRefinementToggle
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementToggle)init;
- (GEOPDResultRefinementToggle)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)metadata;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)evChargingConnectorType;
- (uint64_t)toggleType;
- (unint64_t)hash;
- (void)_readDisplayName;
- (void)_readMetadata;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayName:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementToggle

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 68) |= 0x40u;
    *(_WORD *)(a1 + 68) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementToggle readAll:](a1, 0);
      v5 = *(void **)(a1 + 32);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDResultRefinementToggle)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementToggle;
  v2 = [(GEOPDResultRefinementToggle *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementToggle)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementToggle;
  v3 = [(GEOPDResultRefinementToggle *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 68) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementToggleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_1247);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementToggle _readDisplayName]((uint64_t)a1);
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
    *(_WORD *)(a1 + 68) |= 0x80u;
    *(_WORD *)(a1 + 68) |= 0x200u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 68) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementToggleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_1248);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)metadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementToggle _readMetadata]((uint64_t)a1);
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
    *(_WORD *)(a1 + 68) |= 0x100u;
    *(_WORD *)(a1 + 68) |= 0x200u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)toggleType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 68);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 4) != 0) {
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
    __int16 v2 = *(_WORD *)(v1 + 68);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
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
  v8.super_class = (Class)GEOPDResultRefinementToggle;
  id v4 = [(GEOPDResultRefinementToggle *)&v8 description];
  v5 = [(GEOPDResultRefinementToggle *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementToggle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_30;
  }
  -[GEOPDResultRefinementToggle readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = -[GEOPDResultRefinementToggle displayName]((id *)a1);
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

  if ((*(_WORD *)(a1 + 68) & 8) != 0)
  {
    objc_super v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
    if (a2) {
      objc_super v8 = @"isSelected";
    }
    else {
      objc_super v8 = @"is_selected";
    }
    [v4 setObject:v7 forKey:v8];
  }
  v9 = -[GEOPDResultRefinementToggle metadata]((id *)a1);
  v10 = v9;
  if (v9)
  {
    if (a2) {
      [v9 jsonRepresentation];
    }
    else {
    v11 = [v9 dictionaryRepresentation];
    }
    [v4 setObject:v11 forKey:@"metadata"];
  }
  __int16 v12 = *(_WORD *)(a1 + 68);
  if ((v12 & 4) != 0)
  {
    uint64_t v22 = *(int *)(a1 + 60);
    if (v22 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E53E5D10[v22];
    }
    if (a2) {
      v24 = @"toggleType";
    }
    else {
      v24 = @"toggle_type";
    }
    [v4 setObject:v23 forKey:v24];

    __int16 v12 = *(_WORD *)(a1 + 68);
    if ((v12 & 1) == 0)
    {
LABEL_19:
      if ((v12 & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_47;
    }
  }
  else if ((v12 & 1) == 0)
  {
    goto LABEL_19;
  }
  uint64_t v25 = *(int *)(a1 + 52);
  if (v25 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = off_1E53E5D28[v25];
  }
  if (a2) {
    v27 = @"evChargingConnectorType";
  }
  else {
    v27 = @"ev_charging_connector_type";
  }
  [v4 setObject:v26 forKey:v27];

  __int16 v12 = *(_WORD *)(a1 + 68);
  if ((v12 & 2) == 0)
  {
LABEL_20:
    if ((v12 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_47:
  v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  if (a2) {
    v29 = @"selectionSequenceNumber";
  }
  else {
    v29 = @"selection_sequence_number";
  }
  [v4 setObject:v28 forKey:v29];

  __int16 v12 = *(_WORD *)(a1 + 68);
  if ((v12 & 0x10) == 0)
  {
LABEL_21:
    if ((v12 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_51:
  v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  if (a2) {
    v31 = @"selectionFromView";
  }
  else {
    v31 = @"selection_from_view";
  }
  [v4 setObject:v30 forKey:v31];

  if ((*(_WORD *)(a1 + 68) & 0x20) != 0)
  {
LABEL_22:
    v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 66)];
    if (a2) {
      v14 = @"showAsSelected";
    }
    else {
      v14 = @"show_as_selected";
    }
    [v4 setObject:v13 forKey:v14];
  }
LABEL_26:
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    v16 = [v15 dictionaryRepresentation];
    v17 = v16;
    if (a2)
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __57__GEOPDResultRefinementToggle__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E53D8860;
      id v19 = v18;
      id v33 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v32];
      id v20 = v19;

      v17 = v20;
    }
    [v4 setObject:v17 forKey:@"Unknown Fields"];
  }
LABEL_30:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementToggle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1267;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1268;
      }
      GEOPDResultRefinementToggleReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __57__GEOPDResultRefinementToggle__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_79;
  }
  if (a3) {
    objc_super v7 = @"displayName";
  }
  else {
    objc_super v7 = @"display_name";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)[v8 copy];
    -[GEOPDResultRefinementToggle setDisplayName:](v6, v9);
  }
  if (a3) {
    id v10 = @"isSelected";
  }
  else {
    id v10 = @"is_selected";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v12 = [v11 BOOLValue];
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 8u;
    *(unsigned char *)(v6 + 64) = v12;
  }

  v13 = [v5 objectForKeyedSubscript:@"metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOPDResultRefinementMetadata alloc];
    if (a3) {
      v15 = [(GEOPDResultRefinementMetadata *)v14 initWithJSON:v13];
    }
    else {
      v15 = [(GEOPDResultRefinementMetadata *)v14 initWithDictionary:v13];
    }
    v16 = v15;
    -[GEOPDResultRefinementToggle setMetadata:](v6, v15);
  }
  if (a3) {
    v17 = @"toggleType";
  }
  else {
    v17 = @"toggle_type";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"RESULT_REFINEMENT_TOGGLE_TYPE_DEFAULT"])
    {
      int v20 = 0;
    }
    else if ([v19 isEqualToString:@"RESULT_REFINEMENT_TOGGLE_TYPE_EV_CHARGING"])
    {
      int v20 = 1;
    }
    else if ([v19 isEqualToString:@"RESULT_REFINEMENT_TOGGLE_TYPE_OPEN_NOW"])
    {
      int v20 = 2;
    }
    else
    {
      int v20 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_32;
    }
    int v20 = [v18 intValue];
  }
  *(_WORD *)(v6 + 68) |= 0x200u;
  *(_WORD *)(v6 + 68) |= 4u;
  *(_DWORD *)(v6 + 60) = v20;
LABEL_32:

  if (a3) {
    v21 = @"evChargingConnectorType";
  }
  else {
    v21 = @"ev_charging_connector_type";
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"CONNECTOR_TYPE_UNKNOWN"])
    {
      int v24 = 0;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_CHADEMO"])
    {
      int v24 = 1;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_J1772"])
    {
      int v24 = 2;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_TESLA"])
    {
      int v24 = 3;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_CCS1"])
    {
      int v24 = 4;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_CCS2"])
    {
      int v24 = 5;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_GBT1"])
    {
      int v24 = 6;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_GBT2"])
    {
      int v24 = 7;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_MENNEKES"])
    {
      int v24 = 8;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_NACS_AC"])
    {
      int v24 = 9;
    }
    else if ([v23 isEqualToString:@"CONNECTOR_TYPE_NACS_DC"])
    {
      int v24 = 10;
    }
    else
    {
      int v24 = 0;
    }

    goto LABEL_62;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v24 = [v22 intValue];
LABEL_62:
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 1u;
    *(_DWORD *)(v6 + 52) = v24;
  }

  if (a3) {
    uint64_t v25 = @"selectionSequenceNumber";
  }
  else {
    uint64_t v25 = @"selection_sequence_number";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v27 = [v26 unsignedIntValue];
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 2u;
    *(_DWORD *)(v6 + 56) = v27;
  }

  if (a3) {
    v28 = @"selectionFromView";
  }
  else {
    v28 = @"selection_from_view";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v30 = [v29 BOOLValue];
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 0x10u;
    *(unsigned char *)(v6 + 65) = v30;
  }

  if (a3) {
    v31 = @"showAsSelected";
  }
  else {
    v31 = @"show_as_selected";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v33 = [v32 BOOLValue];
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 0x20u;
    *(unsigned char *)(v6 + 66) = v33;
  }

LABEL_79:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementToggleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader || (_GEOPDResultRefinementToggleIsDirty((uint64_t)self) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_11:
        if ((flags & 2) == 0) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_11;
    }
    PBDataWriterWriteInt32Field();
    id v5 = v9;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_12:
      if ((flags & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
LABEL_18:
    PBDataWriterWriteUint32Field();
    id v5 = v9;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_13:
      if ((flags & 0x20) == 0)
      {
LABEL_15:
        [(PBUnknownFields *)self->_unknownFields writeTo:v5];
        goto LABEL_22;
      }
LABEL_14:
      PBDataWriterWriteBOOLField();
      id v5 = v9;
      goto LABEL_15;
    }
LABEL_19:
    PBDataWriterWriteBOOLField();
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_super v7 = self->_reader;
  objc_sync_enter(v7);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v9 writeData:v8];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v7);
LABEL_22:
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
    -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 0);
    uint64_t v9 = [(NSString *)self->_displayName copyWithZone:a3];
    id v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(unsigned char *)(v5 + 64) = self->_isSelected;
      *(_WORD *)(v5 + 68) |= 8u;
    }
    id v11 = [(GEOPDResultRefinementMetadata *)self->_metadata copyWithZone:a3];
    char v12 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v11;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_toggleType;
      *(_WORD *)(v5 + 68) |= 4u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_9:
        if ((flags & 2) == 0) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 52) = self->_evChargingConnectorType;
    *(_WORD *)(v5 + 68) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_10:
      if ((flags & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
LABEL_17:
    *(_DWORD *)(v5 + 56) = self->_selectionSequenceNumber;
    *(_WORD *)(v5 + 68) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_11:
      if ((flags & 0x20) == 0)
      {
LABEL_13:
        v14 = self->_unknownFields;
        id v8 = *(id *)(v5 + 16);
        *(void *)(v5 + 16) = v14;
        goto LABEL_14;
      }
LABEL_12:
      *(unsigned char *)(v5 + 66) = self->_showAsSelected;
      *(_WORD *)(v5 + 68) |= 0x20u;
      goto LABEL_13;
    }
LABEL_18:
    *(unsigned char *)(v5 + 65) = self->_selectionFromView;
    *(_WORD *)(v5 + 68) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDResultRefinementToggleReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_14:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementToggle readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_40;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 34);
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0) {
      goto LABEL_40;
    }
    if (self->_isSelected)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_40;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_40;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:")) {
      goto LABEL_40;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 34);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_toggleType != *((_DWORD *)v4 + 15)) {
      goto LABEL_40;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_40;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_evChargingConnectorType != *((_DWORD *)v4 + 13)) {
      goto LABEL_40;
    }
  }
  else if (v7)
  {
    goto LABEL_40;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_selectionSequenceNumber != *((_DWORD *)v4 + 14)) {
      goto LABEL_40;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_40;
    }
    if (self->_selectionFromView)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_40;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_40;
  }
  BOOL v9 = (v7 & 0x20) == 0;
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) != 0)
    {
      if (self->_showAsSelected)
      {
        if (!*((unsigned char *)v4 + 66)) {
          goto LABEL_40;
        }
      }
      else if (*((unsigned char *)v4 + 66))
      {
        goto LABEL_40;
      }
      BOOL v9 = 1;
      goto LABEL_41;
    }
LABEL_40:
    BOOL v9 = 0;
  }
LABEL_41:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_isSelected;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOPDResultRefinementMetadata *)self->_metadata hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_toggleType;
    if (flags)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_evChargingConnectorType;
      if ((flags & 2) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (flags) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
  if ((flags & 2) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_selectionSequenceNumber;
    if ((flags & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v10 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_12:
  uint64_t v9 = 0;
  if ((flags & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_selectionFromView;
  if ((flags & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_showAsSelected;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end