@interface GEOWaypointInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArInfo;
- (BOOL)hasArtwork;
- (BOOL)hasEvChargingInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocalizedAddress;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)hasPosition;
- (BOOL)hasSource;
- (BOOL)hasStyleAttributes;
- (BOOL)hasUniqueWaypointId;
- (BOOL)hasWaypointCaption;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOARInfo)arInfo;
- (GEOAddress)localizedAddress;
- (GEOEVChargingInfo)evChargingInfo;
- (GEOFormattedString)waypointCaption;
- (GEOLatLng)position;
- (GEOPBTransitArtwork)artwork;
- (GEOStyleAttributes)styleAttributes;
- (GEOWaypointInfo)init;
- (GEOWaypointInfo)initWithData:(id)a3;
- (GEOWaypointInfo)initWithDictionary:(id)a3;
- (GEOWaypointInfo)initWithJSON:(id)a3;
- (GEOWaypointInfo)initWithSource:(int)a3;
- (GEOWaypointUUID)uniqueWaypointId;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sourceAsString:(int)a3;
- (int)StringAsSource:(id)a3;
- (int)source;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArInfo;
- (void)_readArtwork;
- (void)_readEvChargingInfo;
- (void)_readLocalizedAddress;
- (void)_readName;
- (void)_readPosition;
- (void)_readStyleAttributes;
- (void)_readUniqueWaypointId;
- (void)_readWaypointCaption;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArInfo:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setEvChargingInfo:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setLocalizedAddress:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPosition:(id)a3;
- (void)setSource:(int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setUniqueWaypointId:(id)a3;
- (void)setWaypointCaption:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointInfo

- (GEOWaypointInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointInfo;
  v2 = [(GEOWaypointInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypointInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointInfo;
  v3 = [(GEOWaypointInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_8951);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOWaypointInfo _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags_8952);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOWaypointInfo _readPosition]((uint64_t)self);
  position = self->_position;

  return position;
}

- (void)setPosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (int)source
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSource
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E0850[a3];
  }

  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SERVICE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_8953);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOWaypointInfo _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_8954);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOWaypointInfo _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readEvChargingInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasEvChargingInfo
{
  return self->_evChargingInfo != 0;
}

- (GEOEVChargingInfo)evChargingInfo
{
  -[GEOWaypointInfo _readEvChargingInfo]((uint64_t)self);
  evChargingInfo = self->_evChargingInfo;

  return evChargingInfo;
}

- (void)setEvChargingInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_evChargingInfo, a3);
}

- (void)_readArInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasArInfo
{
  return self->_arInfo != 0;
}

- (GEOARInfo)arInfo
{
  -[GEOWaypointInfo _readArInfo]((uint64_t)self);
  arInfo = self->_arInfo;

  return arInfo;
}

- (void)setArInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  objc_storeStrong((id *)&self->_arInfo, a3);
}

- (void)_readLocalizedAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedAddress_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasLocalizedAddress
{
  return self->_localizedAddress != 0;
}

- (GEOAddress)localizedAddress
{
  -[GEOWaypointInfo _readLocalizedAddress]((uint64_t)self);
  localizedAddress = self->_localizedAddress;

  return localizedAddress;
}

- (void)setLocalizedAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_localizedAddress, a3);
}

- (void)_readUniqueWaypointId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUniqueWaypointId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasUniqueWaypointId
{
  return self->_uniqueWaypointId != 0;
}

- (GEOWaypointUUID)uniqueWaypointId
{
  -[GEOWaypointInfo _readUniqueWaypointId]((uint64_t)self);
  uniqueWaypointId = self->_uniqueWaypointId;

  return uniqueWaypointId;
}

- (void)setUniqueWaypointId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_uniqueWaypointId, a3);
}

- (void)_readWaypointCaption
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointCaption_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasWaypointCaption
{
  return self->_waypointCaption != 0;
}

- (GEOFormattedString)waypointCaption
{
  -[GEOWaypointInfo _readWaypointCaption]((uint64_t)self);
  waypointCaption = self->_waypointCaption;

  return waypointCaption;
}

- (void)setWaypointCaption:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_waypointCaption, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointInfo;
  int v4 = [(GEOWaypointInfo *)&v8 description];
  v5 = [(GEOWaypointInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 120))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    objc_super v6 = [(id)a1 name];
    if (v6) {
      [v4 setObject:v6 forKey:@"name"];
    }

    objc_super v7 = [(id)a1 position];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"position"];
    }
    if ((*(_WORD *)(a1 + 120) & 2) != 0)
    {
      uint64_t v10 = *(int *)(a1 + 116);
      if (v10 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 116));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53E0850[v10];
      }
      [v4 setObject:v11 forKey:@"source"];
    }
    v12 = [(id)a1 styleAttributes];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"styleAttributes";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"style_attributes";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 artwork];
    v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      v18 = [v16 dictionaryRepresentation];
      }
      [v4 setObject:v18 forKey:@"artwork"];
    }
    v19 = [(id)a1 evChargingInfo];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"evChargingInfo";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"ev_charging_info";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = [(id)a1 arInfo];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"arInfo";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"ar_info";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = [(id)a1 localizedAddress];
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"localizedAddress";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"localized_address";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = [(id)a1 uniqueWaypointId];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"uniqueWaypointId";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"unique_waypoint_id";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = [(id)a1 waypointCaption];
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"waypointCaption";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"waypoint_caption";
      }
      [v4 setObject:v37 forKey:v38];
    }
    v39 = *(void **)(a1 + 16);
    if (v39)
    {
      v40 = [v39 dictionaryRepresentation];
      v41 = v40;
      if (a2)
      {
        v42 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __45__GEOWaypointInfo__dictionaryRepresentation___block_invoke;
        v46[3] = &unk_1E53D8860;
        id v43 = v42;
        id v47 = v43;
        [v41 enumerateKeysAndObjectsUsingBlock:v46];
        id v44 = v43;

        v41 = v44;
      }
      [v4 setObject:v41 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOWaypointInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointInfo)initWithDictionary:(id)a3
{
  return (GEOWaypointInfo *)-[GEOWaypointInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_77;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_77;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"muid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
  }

  objc_super v7 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setName:v8];
  }
  v9 = [v5 objectForKeyedSubscript:@"position"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setPosition:v11];
  }
  v13 = [v5 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    if ([v14 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v15 = 0;
    }
    else if ([v14 isEqualToString:@"USER"])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 isEqualToString:@"SERVICE"])
    {
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = 0;
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [v13 intValue];
LABEL_23:
    [a1 setSource:v15];
  }

  if (a3) {
    v16 = @"styleAttributes";
  }
  else {
    v16 = @"style_attributes";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEOStyleAttributes alloc];
    if (a3) {
      uint64_t v19 = [(GEOStyleAttributes *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOStyleAttributes *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setStyleAttributes:v19];
  }
  v21 = [v5 objectForKeyedSubscript:@"artwork"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v23 = [(GEOPBTransitArtwork *)v22 initWithJSON:v21];
    }
    else {
      uint64_t v23 = [(GEOPBTransitArtwork *)v22 initWithDictionary:v21];
    }
    v24 = (void *)v23;
    [a1 setArtwork:v23];
  }
  if (a3) {
    v25 = @"evChargingInfo";
  }
  else {
    v25 = @"ev_charging_info";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEOEVChargingInfo alloc];
    if (a3) {
      uint64_t v28 = [(GEOEVChargingInfo *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEOEVChargingInfo *)v27 initWithDictionary:v26];
    }
    v29 = (void *)v28;
    [a1 setEvChargingInfo:v28];
  }
  if (a3) {
    v30 = @"arInfo";
  }
  else {
    v30 = @"ar_info";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEOARInfo alloc];
    if (a3) {
      uint64_t v33 = [(GEOARInfo *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEOARInfo *)v32 initWithDictionary:v31];
    }
    v34 = (void *)v33;
    [a1 setArInfo:v33];
  }
  if (a3) {
    v35 = @"localizedAddress";
  }
  else {
    v35 = @"localized_address";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = [GEOAddress alloc];
    if (a3) {
      uint64_t v38 = [(GEOAddress *)v37 initWithJSON:v36];
    }
    else {
      uint64_t v38 = [(GEOAddress *)v37 initWithDictionary:v36];
    }
    v39 = (void *)v38;
    [a1 setLocalizedAddress:v38];
  }
  if (a3) {
    v40 = @"uniqueWaypointId";
  }
  else {
    v40 = @"unique_waypoint_id";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = [GEOWaypointUUID alloc];
    if (v42) {
      id v43 = (void *)-[GEOWaypointUUID _initWithDictionary:isJSON:]((uint64_t)v42, v41);
    }
    else {
      id v43 = 0;
    }
    [a1 setUniqueWaypointId:v43];
  }
  if (a3) {
    id v44 = @"waypointCaption";
  }
  else {
    id v44 = @"waypoint_caption";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v47 = [(GEOFormattedString *)v46 initWithJSON:v45];
    }
    else {
      uint64_t v47 = [(GEOFormattedString *)v46 initWithDictionary:v45];
    }
    v48 = (void *)v47;
    [a1 setWaypointCaption:v47];
  }
LABEL_77:

  return a1;
}

- (GEOWaypointInfo)initWithJSON:(id)a3
{
  return (GEOWaypointInfo *)-[GEOWaypointInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8989;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8990;
    }
    GEOWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWaypointInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWaypointInfoIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOWaypointInfo *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    id v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_artwork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_evChargingInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_arInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_localizedAddress)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_uniqueWaypointId)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_waypointCaption)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOWaypointInfo _readPosition]((uint64_t)self);
  position = self->_position;

  return [(GEOLatLng *)position hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOWaypointInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 26) = self->_readerMarkPos;
  *((_DWORD *)v5 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(_WORD *)&self->_flags)
  {
    v5[7] = self->_muid;
    *((_WORD *)v5 + 60) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    int v4 = v5;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    int v4 = v5;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_source;
    *((_WORD *)v4 + 60) |= 2u;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v5, "setStyleAttributes:");
    int v4 = v5;
  }
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
    int v4 = v5;
  }
  if (self->_evChargingInfo)
  {
    objc_msgSend(v5, "setEvChargingInfo:");
    int v4 = v5;
  }
  if (self->_arInfo)
  {
    objc_msgSend(v5, "setArInfo:");
    int v4 = v5;
  }
  if (self->_localizedAddress)
  {
    objc_msgSend(v5, "setLocalizedAddress:");
    int v4 = v5;
  }
  if (self->_uniqueWaypointId)
  {
    objc_msgSend(v5, "setUniqueWaypointId:");
    int v4 = v5;
  }
  if (self->_waypointCaption)
  {
    objc_msgSend(v5, "setWaypointCaption:");
    int v4 = v5;
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
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWaypointInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWaypointInfo *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 56) = self->_muid;
    *(_WORD *)(v5 + 120) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  id v11 = [(GEOLatLng *)self->_position copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_source;
    *(_WORD *)(v5 + 120) |= 2u;
  }
  id v13 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  id v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  id v15 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  id v17 = [(GEOEVChargingInfo *)self->_evChargingInfo copyWithZone:a3];
  v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  id v19 = [(GEOARInfo *)self->_arInfo copyWithZone:a3];
  v20 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v19;

  id v21 = [(GEOAddress *)self->_localizedAddress copyWithZone:a3];
  v22 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v21;

  id v23 = [(GEOWaypointUUID *)self->_uniqueWaypointId copyWithZone:a3];
  v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  id v25 = [(GEOFormattedString *)self->_waypointCaption copyWithZone:a3];
  v26 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v25;

  v27 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v27;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  [(GEOWaypointInfo *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 60);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_muid != *((void *)v4 + 7)) {
      goto LABEL_30;
    }
  }
  else if (v5)
  {
LABEL_30:
    char v16 = 0;
    goto LABEL_31;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 8) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_30;
  }
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 9))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:")) {
      goto LABEL_30;
    }
  }
  __int16 v8 = *((_WORD *)v4 + 60);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_source != *((_DWORD *)v4 + 29)) {
      goto LABEL_30;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_30;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 10)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_30;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 4))
  {
    if (!-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")) {
      goto LABEL_30;
    }
  }
  evChargingInfo = self->_evChargingInfo;
  if ((unint64_t)evChargingInfo | *((void *)v4 + 5))
  {
    if (!-[GEOEVChargingInfo isEqual:](evChargingInfo, "isEqual:")) {
      goto LABEL_30;
    }
  }
  arInfo = self->_arInfo;
  if ((unint64_t)arInfo | *((void *)v4 + 3))
  {
    if (!-[GEOARInfo isEqual:](arInfo, "isEqual:")) {
      goto LABEL_30;
    }
  }
  localizedAddress = self->_localizedAddress;
  if ((unint64_t)localizedAddress | *((void *)v4 + 6))
  {
    if (!-[GEOAddress isEqual:](localizedAddress, "isEqual:")) {
      goto LABEL_30;
    }
  }
  uniqueWaypointId = self->_uniqueWaypointId;
  if ((unint64_t)uniqueWaypointId | *((void *)v4 + 11))
  {
    if (!-[GEOWaypointUUID isEqual:](uniqueWaypointId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  waypointCaption = self->_waypointCaption;
  if ((unint64_t)waypointCaption | *((void *)v4 + 12)) {
    char v16 = -[GEOFormattedString isEqual:](waypointCaption, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_31:

  return v16;
}

- (unint64_t)hash
{
  [(GEOWaypointInfo *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  unint64_t v5 = [(GEOLatLng *)self->_position hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_source;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  unint64_t v9 = v8 ^ [(GEOPBTransitArtwork *)self->_artwork hash];
  unint64_t v10 = v7 ^ v9 ^ [(GEOEVChargingInfo *)self->_evChargingInfo hash];
  unint64_t v11 = [(GEOARInfo *)self->_arInfo hash];
  unint64_t v12 = v11 ^ [(GEOAddress *)self->_localizedAddress hash];
  unint64_t v13 = v12 ^ [(GEOWaypointUUID *)self->_uniqueWaypointId hash];
  return v10 ^ v13 ^ [(GEOFormattedString *)self->_waypointCaption hash];
}

- (void)mergeFrom:(id)a3
{
  id v21 = (unint64_t *)a3;
  [v21 readAll:0];
  NSUInteger v4 = v21;
  if (v21[15])
  {
    self->_muid = v21[7];
    *(_WORD *)&self->_flags |= 1u;
  }
  if (v21[8])
  {
    -[GEOWaypointInfo setName:](self, "setName:");
    NSUInteger v4 = v21;
  }
  position = self->_position;
  unint64_t v6 = v4[9];
  if (position)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOWaypointInfo setPosition:](self, "setPosition:");
  }
  NSUInteger v4 = v21;
LABEL_11:
  if ((v4[15] & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 29);
    *(_WORD *)&self->_flags |= 2u;
  }
  styleAttributes = self->_styleAttributes;
  unint64_t v8 = v4[10];
  if (styleAttributes)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[GEOWaypointInfo setStyleAttributes:](self, "setStyleAttributes:");
  }
  NSUInteger v4 = v21;
LABEL_19:
  artwork = self->_artwork;
  unint64_t v10 = v4[4];
  if (artwork)
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[GEOWaypointInfo setArtwork:](self, "setArtwork:");
  }
  NSUInteger v4 = v21;
LABEL_25:
  evChargingInfo = self->_evChargingInfo;
  unint64_t v12 = v4[5];
  if (evChargingInfo)
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[GEOEVChargingInfo mergeFrom:](evChargingInfo, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[GEOWaypointInfo setEvChargingInfo:](self, "setEvChargingInfo:");
  }
  NSUInteger v4 = v21;
LABEL_31:
  arInfo = self->_arInfo;
  unint64_t v14 = v4[3];
  if (arInfo)
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[GEOARInfo mergeFrom:](arInfo, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[GEOWaypointInfo setArInfo:](self, "setArInfo:");
  }
  NSUInteger v4 = v21;
LABEL_37:
  localizedAddress = self->_localizedAddress;
  unint64_t v16 = v4[6];
  if (localizedAddress)
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[GEOAddress mergeFrom:](localizedAddress, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[GEOWaypointInfo setLocalizedAddress:](self, "setLocalizedAddress:");
  }
  NSUInteger v4 = v21;
LABEL_43:
  uniqueWaypointId = self->_uniqueWaypointId;
  v18 = (void *)v4[11];
  if (uniqueWaypointId)
  {
    if (!v18) {
      goto LABEL_49;
    }
    -[GEOWaypointUUID mergeFrom:]((uint64_t)uniqueWaypointId, v18);
  }
  else
  {
    if (!v18) {
      goto LABEL_49;
    }
    [(GEOWaypointInfo *)self setUniqueWaypointId:v4[11]];
  }
  NSUInteger v4 = v21;
LABEL_49:
  waypointCaption = self->_waypointCaption;
  unint64_t v20 = v4[12];
  if (waypointCaption)
  {
    if (v20) {
      -[GEOFormattedString mergeFrom:](waypointCaption, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEOWaypointInfo setWaypointCaption:](self, "setWaypointCaption:");
  }

  MEMORY[0x1F4181870]();
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8994);
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
  *(_WORD *)&self->_flags |= 0x1004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWaypointInfo *)self readAll:0];
    [(GEOLatLng *)self->_position clearUnknownFields:1];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_artwork clearUnknownFields:1];
    [(GEOEVChargingInfo *)self->_evChargingInfo clearUnknownFields:1];
    [(GEOARInfo *)self->_arInfo clearUnknownFields:1];
    [(GEOAddress *)self->_localizedAddress clearUnknownFields:1];
    uniqueWaypointId = self->_uniqueWaypointId;
    if (uniqueWaypointId)
    {
      unint64_t v8 = uniqueWaypointId->_unknownFields;
      uniqueWaypointId->_unknownFields = 0;
    }
    waypointCaption = self->_waypointCaption;
    [(GEOFormattedString *)waypointCaption clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointCaption, 0);
  objc_storeStrong((id *)&self->_uniqueWaypointId, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localizedAddress, 0);
  objc_storeStrong((id *)&self->_evChargingInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_arInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOWaypointInfo)initWithSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  NSUInteger v4 = [(GEOWaypointInfo *)self init];
  unint64_t v5 = v4;
  if (v4)
  {
    [(GEOWaypointInfo *)v4 setSource:v3];
    unint64_t v6 = v5;
  }

  return v5;
}

@end