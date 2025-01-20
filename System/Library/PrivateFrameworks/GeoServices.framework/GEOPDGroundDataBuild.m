@interface GEOPDGroundDataBuild
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGroundDataBuild)init;
- (GEOPDGroundDataBuild)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)type;
- (unint64_t)hash;
- (void)_readCapabilitys;
- (void)_readLodWithTextures;
- (void)addCapability:(uint64_t)a1;
- (void)addLodWithTextures:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGroundDataBuild

- (GEOPDGroundDataBuild)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGroundDataBuild;
  v2 = [(GEOPDGroundDataBuild *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGroundDataBuild)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGroundDataBuild;
  v3 = [(GEOPDGroundDataBuild *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDGroundDataBuild;
  [(GEOPDGroundDataBuild *)&v3 dealloc];
}

- (uint64_t)type
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 108);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 0x80) != 0) {
      return *(unsigned int *)(v1 + 104);
    }
    else {
      return 1;
    }
  }
  return result;
}

- (void)_readCapabilitys
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
  {
    __int16 v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGroundDataBuildReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCapabilitys_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addCapability:(uint64_t)a1
{
  *(_WORD *)(a1 + 108) |= 0x100u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  *(_WORD *)(a1 + 108) |= 0x400u;
}

- (void)_readLodWithTextures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundDataBuildReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLodWithTextures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addLodWithTextures:(uint64_t)a1
{
  *(_WORD *)(a1 + 108) |= 0x200u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  *(_WORD *)(a1 + 108) |= 0x400u;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGroundDataBuild;
  v4 = [(GEOPDGroundDataBuild *)&v8 description];
  v5 = [(GEOPDGroundDataBuild *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroundDataBuild _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_37;
  }
  -[GEOPDGroundDataBuild readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 0x20) != 0)
  {
    v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
    [v4 setObject:v21 forKey:@"index"];

    __int16 v6 = *(_WORD *)(a1 + 108);
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_45;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
  if (a2) {
    v23 = @"buildId";
  }
  else {
    v23 = @"build_id";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_45:
  v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
  if (a2) {
    v25 = @"dataFormatVersion";
  }
  else {
    v25 = @"data_format_version";
  }
  [v4 setObject:v24 forKey:v25];

  __int16 v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x80) == 0) {
      goto LABEL_7;
    }
LABEL_53:
    unsigned int v28 = *(_DWORD *)(a1 + 104) - 1;
    if (v28 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 104));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E53E99A8[v28];
    }
    [v4 setObject:v29 forKey:@"type"];

    if ((*(_WORD *)(a1 + 108) & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_49:
  v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
  if (a2) {
    v27 = @"dataOutputVersion";
  }
  else {
    v27 = @"data_output_version";
  }
  [v4 setObject:v26 forKey:v27];

  __int16 v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 0x80) != 0) {
    goto LABEL_53;
  }
LABEL_7:
  if ((v6 & 0x10) != 0)
  {
LABEL_8:
    LODWORD(v5) = *(_DWORD *)(a1 + 92);
    objc_super v7 = [NSNumber numberWithFloat:v5];
    if (a2) {
      objc_super v8 = @"heightAboveGroundM";
    }
    else {
      objc_super v8 = @"height_above_ground_m";
    }
    [v4 setObject:v7 forKey:v8];
  }
LABEL_12:
  if (*(void *)(a1 + 24))
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v10 = (void *)(a1 + 16);
    if (*(void *)(a1 + 24))
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = *(unsigned int *)(*v10 + 4 * v11);
        if (v12 == 1)
        {
          v13 = @"PANORAMIC";
        }
        else if (v12 == 2)
        {
          v13 = @"WOBBLY";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v9 addObject:v13];

        ++v11;
        v10 = (void *)(a1 + 16);
      }
      while (v11 < *(void *)(a1 + 24));
    }
    [v4 setObject:v9 forKey:@"capability"];
  }
  if (*(_WORD *)(a1 + 108))
  {
    v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      v15 = @"bucketId";
    }
    else {
      v15 = @"bucket_id";
    }
    [v4 setObject:v14 forKey:v15];
  }
  if (*(void *)(a1 + 48))
  {
    v16 = PBRepeatedUInt32NSArray();
    if (a2) {
      v17 = @"lodWithTextures";
    }
    else {
      v17 = @"lod_with_textures";
    }
    [v4 setObject:v16 forKey:v17];
  }
  if ((*(_WORD *)(a1 + 108) & 0x40) != 0)
  {
    v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
    if (a2) {
      v19 = @"metricsVersion";
    }
    else {
      v19 = @"metrics_version";
    }
    [v4 setObject:v18 forKey:v19];
  }
LABEL_37:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGroundDataBuild _dictionaryRepresentation:]((uint64_t)self, 1);
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
        __int16 v6 = (int *)&readAll__recursiveTag_225_0;
      }
      else {
        __int16 v6 = (int *)&readAll__nonRecursiveTag_226_0;
      }
      GEOPDGroundDataBuildReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_78;
  }
  objc_super v7 = [v5 objectForKeyedSubscript:@"index"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v7 unsignedIntValue];
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x20u;
    *(_DWORD *)(v6 + 96) = v8;
  }

  if (a3) {
    v9 = @"buildId";
  }
  else {
    v9 = @"build_id";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [v10 unsignedIntValue];
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 2u;
    *(_DWORD *)(v6 + 80) = v11;
  }

  if (a3) {
    uint64_t v12 = @"dataFormatVersion";
  }
  else {
    uint64_t v12 = @"data_format_version";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = [v13 unsignedIntValue];
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 4u;
    *(_DWORD *)(v6 + 84) = v14;
  }

  if (a3) {
    v15 = @"dataOutputVersion";
  }
  else {
    v15 = @"data_output_version";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v17 = [v16 unsignedIntValue];
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 8u;
    *(_DWORD *)(v6 + 88) = v17;
  }

  v18 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"T300"])
    {
      int v20 = 1;
    }
    else if ([v19 isEqualToString:@"T400"])
    {
      int v20 = 2;
    }
    else if ([v19 isEqualToString:@"T392C"])
    {
      int v20 = 3;
    }
    else
    {
      int v20 = 1;
    }

    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v20 = [v18 intValue];
LABEL_30:
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x80u;
    *(_DWORD *)(v6 + 104) = v20;
  }

  if (a3) {
    v21 = @"heightAboveGroundM";
  }
  else {
    v21 = @"height_above_ground_m";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v22 floatValue];
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x10u;
    *(_DWORD *)(v6 + 92) = v23;
  }

  v24 = [v5 objectForKeyedSubscript:@"capability"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v49 = a3;
    id v50 = v5;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v48 = v24;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (!v26) {
      goto LABEL_52;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v56;
    while (1)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = v30;
          if (([v31 isEqualToString:@"PANORAMIC"] & 1) == 0) {
            [v31 isEqualToString:@"WOBBLY"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v30 intValue];
        }
        -[GEOPDGroundDataBuild addCapability:](v6);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (!v27)
      {
LABEL_52:

        id v5 = v50;
        a3 = v49;
        v24 = v48;
        break;
      }
    }
  }

  if (a3) {
    v32 = @"bucketId";
  }
  else {
    v32 = @"bucket_id";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v34 = [v33 unsignedIntValue];
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 1u;
    *(_DWORD *)(v6 + 76) = v34;
  }

  if (a3) {
    v35 = @"lodWithTextures";
  }
  else {
    v35 = @"lod_with_textures";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v37 = a3;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v38 = v36;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v52 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v43 unsignedIntValue];
            -[GEOPDGroundDataBuild addLodWithTextures:](v6);
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v40);
    }

    a3 = v37;
  }

  if (a3) {
    v44 = @"metricsVersion";
  }
  else {
    v44 = @"metrics_version";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v46 = [v45 unsignedIntValue];
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x40u;
    *(_DWORD *)(v6 + 100) = v46;
  }

LABEL_78:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroundDataBuildReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x700) == 0)
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v11 writeData:v10];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_27;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 flags = (__int16)self->_flags;
  }
  uint64_t v6 = v11;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v11;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v11;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v11;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  uint64_t v6 = v11;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteFloatField();
    uint64_t v6 = v11;
  }
LABEL_11:
  if (self->_capabilitys.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      uint64_t v6 = v11;
      ++v7;
    }
    while (v7 < self->_capabilitys.count);
  }
  if (*(_WORD *)&self->_flags)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v11;
  }
  if (self->_lodWithTextures.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      uint64_t v6 = v11;
      ++v8;
    }
    while (v8 < self->_lodWithTextures.count);
  }
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
LABEL_27:
    uint64_t v6 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v6 = reader;
    objc_sync_enter(v6);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDGroundDataBuildReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v7 = (id)v4;
      objc_sync_exit(v6);

      return (id)v4;
    }
    objc_sync_exit(v6);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_DWORD *)(v4 + 96) = self->_index;
    *(_WORD *)(v4 + 108) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v4 + 80) = self->_buildId;
  *(_WORD *)(v4 + 108) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v4 + 84) = self->_dataFormatVersion;
  *(_WORD *)(v4 + 108) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_9:
    if ((flags & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    *(_DWORD *)(v4 + 104) = self->_type;
    *(_WORD *)(v4 + 108) |= 0x80u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  *(_DWORD *)(v4 + 88) = self->_dataOutputVersion;
  *(_WORD *)(v4 + 108) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((flags & 0x10) != 0)
  {
LABEL_11:
    *(float *)(v4 + 92) = self->_heightAboveGroundM;
    *(_WORD *)(v4 + 108) |= 0x10u;
  }
LABEL_12:
  PBRepeatedInt32Copy();
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v4 + 76) = self->_bucketId;
    *(_WORD *)(v4 + 108) |= 1u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v4 + 100) = self->_metricsVersion;
    *(_WORD *)(v4 + 108) |= 0x40u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 1);
  -[GEOPDGroundDataBuild readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_index != *((_DWORD *)v4 + 24)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_buildId != *((_DWORD *)v4 + 20)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dataFormatVersion != *((_DWORD *)v4 + 21)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dataOutputVersion != *((_DWORD *)v4 + 22)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_type != *((_DWORD *)v4 + 26)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_heightAboveGroundM != *((float *)v4 + 23)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_44;
  }
  __int16 v7 = *((_WORD *)v4 + 54);
  if (*(_WORD *)&self->_flags)
  {
    if ((v7 & 1) == 0 || self->_bucketId != *((_DWORD *)v4 + 19)) {
      goto LABEL_44;
    }
  }
  else if (v7)
  {
    goto LABEL_44;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_44:
    BOOL v9 = 0;
    goto LABEL_45;
  }
  __int16 v8 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_metricsVersion != *((_DWORD *)v4 + 25)) {
      goto LABEL_44;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x40) == 0;
  }
LABEL_45:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    uint64_t v18 = 2654435761 * self->_index;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_buildId;
      if ((flags & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((flags & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_dataFormatVersion;
    if ((flags & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((flags & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_dataOutputVersion;
    if ((flags & 0x80) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v7 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v12 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((flags & 0x80) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_type;
  if ((flags & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  float heightAboveGroundM = self->_heightAboveGroundM;
  double v9 = heightAboveGroundM;
  if (heightAboveGroundM < 0.0) {
    double v9 = -heightAboveGroundM;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_19:
  uint64_t v13 = PBRepeatedInt32Hash();
  if (*(_WORD *)&self->_flags) {
    uint64_t v14 = 2654435761 * self->_bucketId;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_flags & 0x40) != 0) {
    uint64_t v16 = 2654435761 * self->_metricsVersion;
  }
  else {
    uint64_t v16 = 0;
  }
  return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v12 ^ v14 ^ v13 ^ v15 ^ v16;
}

- (void).cxx_destruct
{
}

@end