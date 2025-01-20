@interface GEOPDGroundMetadataTile
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGroundMetadataTile)init;
- (GEOPDGroundMetadataTile)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)buildTableAtIndex:(id *)a1;
- (id)cameraMetadataTables;
- (id)coord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photoPositions;
- (id)storefronts;
- (unint64_t)hash;
- (void)_addNoFlagsBuildTable:(uint64_t)a1;
- (void)_addNoFlagsCameraMetadataTable:(uint64_t)a1;
- (void)_addNoFlagsPhotoPosition:(uint64_t)a1;
- (void)_addNoFlagsStorefront:(uint64_t)a1;
- (void)_readBuildTables;
- (void)_readCameraMetadataTables;
- (void)_readCoord;
- (void)_readPhotoPositions;
- (void)_readStorefronts;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGroundMetadataTile

- (GEOPDGroundMetadataTile)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGroundMetadataTile;
  v2 = [(GEOPDGroundMetadataTile *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGroundMetadataTile)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGroundMetadataTile;
  v3 = [(GEOPDGroundMetadataTile *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhotoPositions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoPositions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)photoPositions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGroundMetadataTile _readPhotoPositions]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_addNoFlagsPhotoPosition:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readStorefronts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStorefronts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)storefronts
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGroundMetadataTile _readStorefronts]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_addNoFlagsStorefront:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readBuildTables
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBuildTables_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_addNoFlagsBuildTable:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)buildTableAtIndex:(id *)a1
{
  if (a1)
  {
    v4 = a1;
    -[GEOPDGroundMetadataTile _readBuildTables]((uint64_t)a1);
    a1 = [v4[2] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_readCameraMetadataTables
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameraMetadataTables_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)cameraMetadataTables
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDGroundMetadataTile _readCameraMetadataTables]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_addNoFlagsCameraMetadataTable:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readCoord
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoord_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)coord
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDGroundMetadataTile _readCoord]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGroundMetadataTile;
  v4 = [(GEOPDGroundMetadataTile *)&v8 description];
  id v5 = [(GEOPDGroundMetadataTile *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroundMetadataTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDGroundMetadataTile readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v59 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v58 objects:v65 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"photoPosition";
      }
      else {
        v13 = @"photo_position";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v64 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"storefront"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v23 = *(id *)(a1 + 16);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v51 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v50 + 1) + 8 * k);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"buildTable";
      }
      else {
        v30 = @"build_table";
      }
      [v4 setObject:v22 forKey:v30];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v32 = *(id *)(a1 + 24);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v62 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v47;
        do
        {
          for (uint64_t m = 0; m != v34; ++m)
          {
            if (*(void *)v47 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v46 + 1) + 8 * m);
            if (a2) {
              [v37 jsonRepresentation];
            }
            else {
            v38 = objc_msgSend(v37, "dictionaryRepresentation", (void)v46);
            }
            objc_msgSend(v31, "addObject:", v38, (void)v46);
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v62 count:16];
        }
        while (v34);
      }

      if (a2) {
        v39 = @"cameraMetadataTable";
      }
      else {
        v39 = @"camera_metadata_table";
      }
      objc_msgSend(v4, "setObject:forKey:", v31, v39, (void)v46);
    }
    v40 = -[GEOPDGroundMetadataTile coord]((id *)a1);
    v41 = v40;
    if (v40)
    {
      if (a2) {
        [v40 jsonRepresentation];
      }
      else {
      v42 = [v40 dictionaryRepresentation];
      }
      [v4 setObject:v42 forKey:@"coord"];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      v43 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        v44 = @"tileBuildId";
      }
      else {
        v44 = @"tile_build_id";
      }
      [v4 setObject:v43 forKey:v44];
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
  return -[GEOPDGroundMetadataTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_15;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_15;
      }
      GEOPDGroundMetadataTileReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v36 != v9) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * i) readAll:1];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v8);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * j) readAll:1];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
        }
        while (v12);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = *(id *)(a1 + 16);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v28;
        do
        {
          for (uint64_t k = 0; k != v16; ++k)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v15);
            }
            -[GEOPDGroundDataBuild readAll:](*(void *)(*((void *)&v27 + 1) + 8 * k), 1);
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v40 count:16];
        }
        while (v16);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v19 = *(id *)(a1 + 24);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v24;
        do
        {
          for (uint64_t m = 0; m != v20; ++m)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v19);
            }
            -[GEOPDCameraMetadata readAll:](*(void *)(*((void *)&v23 + 1) + 8 * m), 1);
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v39 count:16];
        }
        while (v20);
      }

      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1, (void)v23);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroundMetadataTileReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_35;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x7E) != 0) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v7 = self->_storefronts;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v60;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v60 != v9) {
          objc_enumerationMutation(v7);
        }
        if (GEOPDStorefrontBundleIsDirty(*(os_unfair_lock_s **)(*((void *)&v59 + 1) + 8 * v10))) {
          goto LABEL_34;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v59 objects:v69 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v7 = self->_buildTables;
    uint64_t v11 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v56;
LABEL_16:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v56 != v12) {
          objc_enumerationMutation(v7);
        }
        if (GEOPDGroundDataBuildIsDirty(*(void *)(*((void *)&v55 + 1) + 8 * v13))) {
          goto LABEL_34;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v68 count:16];
          if (v11) {
            goto LABEL_16;
          }
          break;
        }
      }
    }

    char flags = (char)self->_flags;
  }
  if ((flags & 4) == 0)
  {
LABEL_33:
    uint64_t v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_67;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = self->_cameraMetadataTables;
  uint64_t v14 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (!v14)
  {
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v15 = *(void *)v52;
LABEL_26:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v52 != v15) {
      objc_enumerationMutation(v7);
    }
    if (GEOPDCameraMetadataIsDirty(*(void *)(*((void *)&v51 + 1) + 8 * v16))) {
      break;
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v51 objects:v67 count:16];
      if (v14) {
        goto LABEL_26;
      }
      goto LABEL_32;
    }
  }
LABEL_34:

LABEL_35:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 0);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v19 = self->_photoPositions;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v47 objects:v66 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v47 objects:v66 count:16];
    }
    while (v20);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v23 = self->_storefronts;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v43 objects:v65 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v43 objects:v65 count:16];
    }
    while (v24);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v27 = self->_buildTables;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v39 objects:v64 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v39 objects:v64 count:16];
    }
    while (v28);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v31 = self->_cameraMetadataTables;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v35 objects:v63 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v35 objects:v63 count:16];
    }
    while (v32);
  }

  if (self->_coord) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
LABEL_67:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v8 = self;
    uint64_t v9 = reader;
    objc_sync_enter(v9);
    if ((*(unsigned char *)&v8->_flags & 0x40) == 0)
    {
      *(void *)((char *)v8->_reader + (int)*MEMORY[0x1E4F940E0]) = v8->_readerMarkLength;
      [(PBDataReader *)v8->_reader seekToOffset:v8->_readerMarkPos];
      GEOPDGroundMetadataTileReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      id v10 = (id)v5;
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 0);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v42 = self;
  uint64_t v11 = self->_photoPositions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * i) copyWithZone:a3];
        uint64_t v16 = v15;
        if (v5)
        {
          id v17 = v15;
          -[GEOPDGroundMetadataTile _readPhotoPositions](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsPhotoPosition:](v5, v17);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 72) |= 0x10u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(unsigned char *)(v5 + 72) |= 0x40u;
        }
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v12);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v18 = v42->_storefronts;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v52 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * j) copyWithZone:a3];
        long long v23 = v22;
        if (v5)
        {
          id v24 = v22;
          -[GEOPDGroundMetadataTile _readStorefronts](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsStorefront:](v5, v24);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 72) |= 0x20u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(unsigned char *)(v5 + 72) |= 0x40u;
        }
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v19);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v25 = v42->_buildTables;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * k) copyWithZone:a3];
        long long v30 = v29;
        if (v5)
        {
          id v31 = v29;
          -[GEOPDGroundMetadataTile _readBuildTables](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsBuildTable:](v5, v31);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 72) |= 2u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(unsigned char *)(v5 + 72) |= 0x40u;
        }
      }
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v26);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v32 = v42->_cameraMetadataTables;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(v32);
        }
        long long v36 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * m) copyWithZone:a3];
        long long v37 = v36;
        if (v5)
        {
          id v38 = v36;
          -[GEOPDGroundMetadataTile _readCameraMetadataTables](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsCameraMetadataTable:](v5, v38);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 72) |= 4u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(unsigned char *)(v5 + 72) |= 0x40u;
        }
      }
      uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v33);
  }

  uint64_t v39 = [(GEOTileCoordinate *)v42->_coord copyWithZone:a3];
  long long v40 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v39;

  if (*(unsigned char *)&v42->_flags)
  {
    *(_DWORD *)(v5 + 68) = v42->_tileBuildId;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 1);
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)v4, 1);
  photoPositions = self->_photoPositions;
  if ((unint64_t)photoPositions | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](photoPositions, "isEqual:")) {
      goto LABEL_16;
    }
  }
  storefronts = self->_storefronts;
  if ((unint64_t)storefronts | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](storefronts, "isEqual:")) {
      goto LABEL_16;
    }
  }
  buildTables = self->_buildTables;
  if ((unint64_t)buildTables | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](buildTables, "isEqual:")) {
      goto LABEL_16;
    }
  }
  cameraMetadataTables = self->_cameraMetadataTables;
  if ((unint64_t)cameraMetadataTables | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](cameraMetadataTables, "isEqual:")) {
      goto LABEL_16;
    }
  }
  coord = self->_coord;
  if ((unint64_t)coord | *((void *)v4 + 4))
  {
    if (!-[GEOTileCoordinate isEqual:](coord, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 72) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) != 0 && self->_tileBuildId == *((_DWORD *)v4 + 17))
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_photoPositions hash];
  uint64_t v4 = [(NSMutableArray *)self->_storefronts hash];
  uint64_t v5 = [(NSMutableArray *)self->_buildTables hash];
  uint64_t v6 = [(NSMutableArray *)self->_cameraMetadataTables hash];
  unint64_t v7 = [(GEOTileCoordinate *)self->_coord hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_tileBuildId;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefronts, 0);
  objc_storeStrong((id *)&self->_photoPositions, 0);
  objc_storeStrong((id *)&self->_coord, 0);
  objc_storeStrong((id *)&self->_cameraMetadataTables, 0);
  objc_storeStrong((id *)&self->_buildTables, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end