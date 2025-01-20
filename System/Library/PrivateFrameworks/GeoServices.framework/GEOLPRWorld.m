@interface GEOLPRWorld
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRWorld)init;
- (GEOLPRWorld)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsPowerTypes:(uint64_t)a1;
- (void)_addNoFlagsRegions:(uint64_t)a1;
- (void)_addNoFlagsVehicleTypes:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRWorld

- (GEOLPRWorld)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRWorld;
  v2 = [(GEOLPRWorld *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRWorld)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRWorld;
  v3 = [(GEOLPRWorld *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsRegions:(uint64_t)a1
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

- (void)_addNoFlagsPowerTypes:(uint64_t)a1
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

- (void)_addNoFlagsVehicleTypes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRWorld;
  v4 = [(GEOLPRWorld *)&v8 description];
  id v5 = [(GEOLPRWorld *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRWorld _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOLPRWorld readAll:]((uint64_t)a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[3] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v6 = a1[3];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v41 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"regions"];
    }
    if ([a1[2] count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v14 = a1[2];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"powerTypes";
      }
      else {
        v21 = @"power_types";
      }
      [v4 setObject:v13 forKey:v21];
    }
    if ([a1[4] count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v23 = a1[4];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v33;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v33 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v32 + 1) + 8 * k);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = objc_msgSend(v28, "dictionaryRepresentation", (void)v32);
            }
            objc_msgSend(v22, "addObject:", v29, (void)v32);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"vehicleTypes";
      }
      else {
        v30 = @"vehicle_types";
      }
      objc_msgSend(v4, "setObject:forKey:", v22, v30, (void)v32);
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
  return -[GEOLPRWorld _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (void)readAll:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_535;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_536;
      }
      GEOLPRWorldReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v7 = *(id *)(a1 + 24);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) readAll:1];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v8);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = *(id *)(a1 + 16);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v11);
            }
            -[GEOLPRPowerTypeMap readAll:](*(void *)(*((void *)&v23 + 1) + 8 * j), 1);
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
        }
        while (v12);
      }

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v20;
        do
        {
          for (uint64_t k = 0; k != v16; ++k)
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v15);
            }
            -[GEOLPRVehicleTypeMap readAll:](*(void *)(*((void *)&v19 + 1) + 8 * k), 1);
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v31 count:16];
        }
        while (v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRWorldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_27;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0xF) != 0) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_flags)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v7 = self->_powerTypes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v49;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(os_unfair_lock_s **)(*((void *)&v48 + 1) + 8 * v10);
        if (v11)
        {
          os_unfair_lock_lock_with_options();
          unsigned __int8 v12 = _GEOLPRPowerTypeMapIsDirty((uint64_t)v11);
          os_unfair_lock_unlock(v11 + 10);
          if (v12) {
            goto LABEL_26;
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    char flags = (char)self->_flags;
  }
  if ((flags & 4) == 0)
  {
LABEL_25:
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
    goto LABEL_49;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = self->_vehicleTypes;
  uint64_t v13 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (!v13)
  {
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v14 = *(void *)v45;
LABEL_17:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v45 != v14) {
      objc_enumerationMutation(v7);
    }
    uint64_t v16 = *(os_unfair_lock_s **)(*((void *)&v44 + 1) + 8 * v15);
    if (v16)
    {
      os_unfair_lock_lock_with_options();
      unsigned __int8 v17 = _GEOLPRVehicleTypeMapIsDirty((uint64_t)v16);
      os_unfair_lock_unlock(v16 + 10);
      if (v17) {
        break;
      }
    }
    if (v13 == ++v15)
    {
      uint64_t v13 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v13) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }
LABEL_26:

LABEL_27:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRWorld readAll:]((uint64_t)self, 0);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v20 = self->_regions;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v21);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v24 = self->_powerTypes;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v25);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v28 = self->_vehicleTypes;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v28);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v29);
  }

LABEL_49:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v8 = self;
    uint64_t v9 = reader;
    objc_sync_enter(v9);
    if ((*(unsigned char *)&v8->_flags & 8) == 0)
    {
      *(void *)((char *)v8->_reader + (int)*MEMORY[0x1E4F940E0]) = v8->_readerMarkLength;
      [(PBDataReader *)v8->_reader seekToOffset:v8->_readerMarkPos];
      GEOLPRWorldReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOLPRWorld readAll:]((uint64_t)self, 0);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v38 = self;
  obuint64_t j = self->_regions;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v51;
    unsigned __int8 v12 = (os_unfair_lock_s *)(v5 + 48);
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "copyWithZone:", a3, v38);
        uint64_t v15 = v14;
        if (v5)
        {
          id v16 = v14;
          os_unfair_lock_lock(v12);
          if ((*(unsigned char *)(v5 + 52) & 2) == 0)
          {
            unsigned __int8 v17 = *(void **)(v5 + 8);
            if (v17)
            {
              id v18 = v17;
              objc_sync_enter(v18);
              GEOLPRWorldReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readRegions_tags_4);
              objc_sync_exit(v18);
            }
          }
          os_unfair_lock_unlock(v12);
          -[GEOLPRWorld _addNoFlagsRegions:](v5, v16);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 52) |= 2u;
          os_unfair_lock_unlock(v12);
          *(unsigned char *)(v5 + 52) |= 8u;
        }
      }
      uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v10);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obja = v38->_powerTypes;
  uint64_t v19 = [(NSMutableArray *)obja countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v47;
    uint64_t v21 = (os_unfair_lock_s *)(v5 + 48);
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(obja);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * j) copyWithZone:a3];
        long long v24 = v23;
        if (v5)
        {
          id v25 = v23;
          os_unfair_lock_lock(v21);
          if ((*(unsigned char *)(v5 + 52) & 1) == 0)
          {
            uint64_t v26 = *(void **)(v5 + 8);
            if (v26)
            {
              id v27 = v26;
              objc_sync_enter(v27);
              GEOLPRWorldReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readPowerTypes_tags_0);
              objc_sync_exit(v27);
            }
          }
          os_unfair_lock_unlock(v21);
          -[GEOLPRWorld _addNoFlagsPowerTypes:](v5, v25);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 52) |= 1u;
          os_unfair_lock_unlock(v21);
          *(unsigned char *)(v5 + 52) |= 8u;
        }
      }
      uint64_t v19 = [(NSMutableArray *)obja countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v19);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  objb = v38->_vehicleTypes;
  uint64_t v28 = [(NSMutableArray *)objb countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v43;
    uint64_t v30 = (os_unfair_lock_s *)(v5 + 48);
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(objb);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * k) copyWithZone:a3];
        long long v33 = v32;
        if (v5)
        {
          id v34 = v32;
          os_unfair_lock_lock(v30);
          if ((*(unsigned char *)(v5 + 52) & 4) == 0)
          {
            long long v35 = *(void **)(v5 + 8);
            if (v35)
            {
              id v36 = v35;
              objc_sync_enter(v36);
              GEOLPRWorldReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readVehicleTypes_tags_0);
              objc_sync_exit(v36);
            }
          }
          os_unfair_lock_unlock(v30);
          -[GEOLPRWorld _addNoFlagsVehicleTypes:](v5, v34);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 52) |= 4u;
          os_unfair_lock_unlock(v30);
          *(unsigned char *)(v5 + 52) |= 8u;
        }
      }
      uint64_t v28 = [(NSMutableArray *)objb countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v28);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOLPRWorld readAll:]((uint64_t)self, 1),
         -[GEOLPRWorld readAll:]((uint64_t)v4, 1),
         regions = self->_regions,
         !((unint64_t)regions | v4[3]))
     || -[NSMutableArray isEqual:](regions, "isEqual:"))
    && ((powerTypes = self->_powerTypes, !((unint64_t)powerTypes | v4[2]))
     || -[NSMutableArray isEqual:](powerTypes, "isEqual:")))
  {
    vehicleTypes = self->_vehicleTypes;
    if ((unint64_t)vehicleTypes | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](vehicleTypes, "isEqual:");
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
  -[GEOLPRWorld readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_regions hash];
  uint64_t v4 = [(NSMutableArray *)self->_powerTypes hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_vehicleTypes hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypes, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end