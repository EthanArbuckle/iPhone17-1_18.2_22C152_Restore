@interface GEOPDPlug
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlug)init;
- (GEOPDPlug)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)availabilityInfo;
- (id)chargerInfo;
- (id)connectorTypeDisplayText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentTypeDisplayText;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)connectorType;
- (unint64_t)hash;
- (void)_readAvailabilityInfo;
- (void)_readChargerInfo;
- (void)_readConnectorTypeDisplayText;
- (void)_readCurrentTypeDisplayText;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlug

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE8) != 0)
    || (*(unsigned char *)&self->_flags & 0x10) != 0
    && (chargerInfo = self->_chargerInfo) != 0
    && (os_unfair_lock_lock_with_options(),
        os_unfair_lock_assert_owner(&chargerInfo->_readerLock),
        int v7 = *(unsigned char *)&chargerInfo->_flags & 0xE,
        os_unfair_lock_unlock(&chargerInfo->_readerLock),
        v7))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlug readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v10;
    if (self->_connectorTypeDisplayText)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if (self->_currentTypeDisplayText)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v10;
    }
    if (self->_availabilityInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_chargerInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
  else
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlug readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v5 = *(int *)(a1 + 68);
      if (v5 >= 0xB)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E3F38[v5];
      }
      if (a2) {
        int v7 = @"connectorType";
      }
      else {
        int v7 = @"connector_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    v8 = -[GEOPDPlug connectorTypeDisplayText]((id *)a1);
    if (v8)
    {
      if (a2) {
        v9 = @"connectorTypeDisplayText";
      }
      else {
        v9 = @"connector_type_display_text";
      }
      [v4 setObject:v8 forKey:v9];
    }

    id v10 = -[GEOPDPlug currentTypeDisplayText]((id *)a1);
    if (v10)
    {
      if (a2) {
        v11 = @"currentTypeDisplayText";
      }
      else {
        v11 = @"current_type_display_text";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        v13 = @"powerWatts";
      }
      else {
        v13 = @"power_watts";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = -[GEOPDPlug availabilityInfo]((id *)a1);
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"availabilityInfo";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"availability_info";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = -[GEOPDPlug chargerInfo]((id *)a1);
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"chargerInfo";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"charger_info";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __39__GEOPDPlug__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  -[GEOPDPlug readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_connectorType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_connectorTypeDisplayText hash];
  NSUInteger v5 = [(NSString *)self->_currentTypeDisplayText hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_powerWatts;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(GEOPDAvailabilityInfo *)self->_availabilityInfo hash];
  return v7 ^ v8 ^ [(GEOPDChargerInfo *)self->_chargerInfo hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    NSUInteger v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlugReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlug readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_connectorType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_connectorTypeDisplayText copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_currentTypeDisplayText copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_powerWatts;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  id v13 = [(GEOPDAvailabilityInfo *)self->_availabilityInfo copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOPDChargerInfo *)self->_chargerInfo copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    NSUInteger v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_7741;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_7742;
      }
      GEOPDPlugReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDChargerInfo readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlug;
  NSUInteger v4 = [(GEOPDPlug *)&v8 description];
  id v5 = [(GEOPDPlug *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

void __39__GEOPDPlug__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  NSUInteger v7 = *(void **)(a1 + 32);
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

- (id)currentTypeDisplayText
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlug _readCurrentTypeDisplayText]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCurrentTypeDisplayText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentTypeDisplayText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTypeDisplayText, 0);
  objc_storeStrong((id *)&self->_connectorTypeDisplayText, 0);
  objc_storeStrong((id *)&self->_chargerInfo, 0);
  objc_storeStrong((id *)&self->_availabilityInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDPlug)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlug;
  v2 = [(GEOPDPlug *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    NSUInteger v4 = v2;
  }

  return v3;
}

- (GEOPDPlug)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlug;
  id v3 = [(GEOPDPlug *)&v7 initWithData:a3];
  NSUInteger v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)connectorType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if (v2) {
      return *(unsigned int *)(v1 + 68);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readConnectorTypeDisplayText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readConnectorTypeDisplayText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)connectorTypeDisplayText
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDPlug _readConnectorTypeDisplayText]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAvailabilityInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAvailabilityInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)availabilityInfo
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDPlug _readAvailabilityInfo]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readChargerInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChargerInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)chargerInfo
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDPlug _readChargerInfo]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlug _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPlug _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlugReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  -[GEOPDPlug readAll:]((uint64_t)self, 1);
  -[GEOPDPlug readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_connectorType != *((_DWORD *)v4 + 17)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  connectorTypeDisplayText = self->_connectorTypeDisplayText;
  if ((unint64_t)connectorTypeDisplayText | *((void *)v4 + 5)
    && !-[NSString isEqual:](connectorTypeDisplayText, "isEqual:"))
  {
    goto LABEL_20;
  }
  currentTypeDisplayText = self->_currentTypeDisplayText;
  if ((unint64_t)currentTypeDisplayText | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](currentTypeDisplayText, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_powerWatts != *((_DWORD *)v4 + 18)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  availabilityInfo = self->_availabilityInfo;
  if ((unint64_t)availabilityInfo | *((void *)v4 + 3)
    && !-[GEOPDAvailabilityInfo isEqual:](availabilityInfo, "isEqual:"))
  {
    goto LABEL_20;
  }
  chargerInfo = self->_chargerInfo;
  if ((unint64_t)chargerInfo | *((void *)v4 + 4)) {
    char v9 = -[GEOPDChargerInfo isEqual:](chargerInfo, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

@end