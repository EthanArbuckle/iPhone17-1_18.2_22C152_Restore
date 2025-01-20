@interface GEOPDSearchLanguageContext
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchLanguageContext)init;
- (GEOPDSearchLanguageContext)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1;
- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayLanguages;
- (void)_readSpokenLanguages;
- (void)addDisplayLanguage:(uint64_t)a1;
- (void)addSpokenLanguage:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDeviceDisplayLanguage:(uint64_t)a1;
- (void)setDeviceKeyboardLanguage:(uint64_t)a1;
- (void)setDeviceSpokenLanguage:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchLanguageContext

- (GEOPDSearchLanguageContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLanguageContext;
  v2 = [(GEOPDSearchLanguageContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLanguageContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLanguageContext;
  v3 = [(GEOPDSearchLanguageContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayLanguages
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 68) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchLanguageContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayLanguages_tags_2);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addDisplayLanguage:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchLanguageContext _readDisplayLanguages](a1);
    -[GEOPDSearchLanguageContext _addNoFlagsDisplayLanguage:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
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

- (void)_readSpokenLanguages
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchLanguageContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenLanguages_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addSpokenLanguage:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchLanguageContext _readSpokenLanguages](a1);
    -[GEOPDSearchLanguageContext _addNoFlagsSpokenLanguage:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1
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

- (void)setDeviceDisplayLanguage:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 1u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setDeviceKeyboardLanguage:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 2u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setDeviceSpokenLanguage:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 4u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchLanguageContext;
  id v4 = [(GEOPDSearchLanguageContext *)&v8 description];
  id v5 = [(GEOPDSearchLanguageContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLanguageContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchLanguageContext readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 40))
    {
      -[GEOPDSearchLanguageContext _readDisplayLanguages](a1);
      id v5 = *(id *)(a1 + 40);
      if (a2) {
        objc_super v6 = @"displayLanguage";
      }
      else {
        objc_super v6 = @"display_language";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 48))
    {
      -[GEOPDSearchLanguageContext _readSpokenLanguages](a1);
      id v7 = *(id *)(a1 + 48);
      if (a2) {
        objc_super v8 = @"spokenLanguage";
      }
      else {
        objc_super v8 = @"spoken_language";
      }
      [v4 setObject:v7 forKey:v8];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchLanguageContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceDisplayLanguage_tags_0);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v11 = *(id *)(a1 + 16);
    if (v11)
    {
      if (a2) {
        v12 = @"deviceDisplayLanguage";
      }
      else {
        v12 = @"device_display_language";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDSearchLanguageContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceKeyboardLanguage_tags_0);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v15 = *(id *)(a1 + 24);
    if (v15)
    {
      if (a2) {
        v16 = @"deviceKeyboardLanguage";
      }
      else {
        v16 = @"device_keyboard_language";
      }
      [v4 setObject:v15 forKey:v16];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDSearchLanguageContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSpokenLanguage_tags_0);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v19 = *(id *)(a1 + 32);
    if (v19)
    {
      if (a2) {
        v20 = @"deviceSpokenLanguage";
      }
      else {
        v20 = @"device_spoken_language";
      }
      [v4 setObject:v19 forKey:v20];
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
  return -[GEOPDSearchLanguageContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_64;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_64;
      }
      GEOPDSearchLanguageContextReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"displayLanguage";
      }
      else {
        objc_super v6 = @"display_language";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v39;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v39 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = (void *)[v13 copy];
                -[GEOPDSearchLanguageContext addDisplayLanguage:]((uint64_t)a1, v14);
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        id v15 = @"spokenLanguage";
      }
      else {
        id v15 = @"spoken_language";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v35;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v34 + 1) + 8 * v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = objc_msgSend(v22, "copy", (void)v34);
                -[GEOPDSearchLanguageContext addSpokenLanguage:]((uint64_t)a1, v23);
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v19);
        }
      }
      if (a3) {
        v24 = @"deviceDisplayLanguage";
      }
      else {
        v24 = @"device_display_language";
      }
      v25 = objc_msgSend(v5, "objectForKeyedSubscript:", v24, (void)v34);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = (void *)[v25 copy];
        -[GEOPDSearchLanguageContext setDeviceDisplayLanguage:]((uint64_t)a1, v26);
      }
      if (a3) {
        v27 = @"deviceKeyboardLanguage";
      }
      else {
        v27 = @"device_keyboard_language";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = (void *)[v28 copy];
        -[GEOPDSearchLanguageContext setDeviceKeyboardLanguage:]((uint64_t)a1, v29);
      }
      if (a3) {
        v30 = @"deviceSpokenLanguage";
      }
      else {
        v30 = @"device_spoken_language";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = (void *)[v31 copy];
        -[GEOPDSearchLanguageContext setDeviceSpokenLanguage:]((uint64_t)a1, v32);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLanguageContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3F) == 0))
  {
    id v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 0);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_displayLanguages;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_spokenLanguages;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_deviceDisplayLanguage) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceKeyboardLanguage) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceSpokenLanguage) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchLanguageContextReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 0);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = self->_displayLanguages;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v11) copyWithZone:a3];
        -[GEOPDSearchLanguageContext addDisplayLanguage:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v13 = self->_spokenLanguages;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v16), "copyWithZone:", a3, (void)v25);
        -[GEOPDSearchLanguageContext addSpokenLanguage:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_deviceDisplayLanguage copyWithZone:a3];
  long long v19 = (void *)v5[2];
  v5[2] = v18;

  uint64_t v20 = [(NSString *)self->_deviceKeyboardLanguage copyWithZone:a3];
  long long v21 = (void *)v5[3];
  v5[3] = v20;

  uint64_t v22 = [(NSString *)self->_deviceSpokenLanguage copyWithZone:a3];
  long long v23 = (void *)v5[4];
  v5[4] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 1),
         -[GEOPDSearchLanguageContext readAll:]((uint64_t)v4, 1),
         displayLanguages = self->_displayLanguages,
         !((unint64_t)displayLanguages | v4[5]))
     || -[NSMutableArray isEqual:](displayLanguages, "isEqual:"))
    && ((spokenLanguages = self->_spokenLanguages, !((unint64_t)spokenLanguages | v4[6]))
     || -[NSMutableArray isEqual:](spokenLanguages, "isEqual:"))
    && ((deviceDisplayLanguage = self->_deviceDisplayLanguage, !((unint64_t)deviceDisplayLanguage | v4[2]))
     || -[NSString isEqual:](deviceDisplayLanguage, "isEqual:"))
    && ((deviceKeyboardLanguage = self->_deviceKeyboardLanguage, !((unint64_t)deviceKeyboardLanguage | v4[3]))
     || -[NSString isEqual:](deviceKeyboardLanguage, "isEqual:")))
  {
    deviceSpokenLanguage = self->_deviceSpokenLanguage;
    if ((unint64_t)deviceSpokenLanguage | v4[4]) {
      char v10 = -[NSString isEqual:](deviceSpokenLanguage, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_displayLanguages hash];
  uint64_t v4 = [(NSMutableArray *)self->_spokenLanguages hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_deviceDisplayLanguage hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_deviceKeyboardLanguage hash];
  return v6 ^ [(NSString *)self->_deviceSpokenLanguage hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    -[GEOPDSearchLanguageContext readAll:]((uint64_t)v3, 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v4[5];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          -[GEOPDSearchLanguageContext addDisplayLanguage:](a1, *(void **)(*((void *)&v22 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v4[6];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          -[GEOPDSearchLanguageContext addSpokenLanguage:](a1, *(void **)(*((void *)&v18 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    id v15 = v4[2];
    if (v15) {
      -[GEOPDSearchLanguageContext setDeviceDisplayLanguage:](a1, v15);
    }
    id v16 = v4[3];
    if (v16) {
      -[GEOPDSearchLanguageContext setDeviceKeyboardLanguage:](a1, v16);
    }
    id v17 = v4[4];
    if (v17) {
      -[GEOPDSearchLanguageContext setDeviceSpokenLanguage:](a1, v17);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenLanguages, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_deviceSpokenLanguage, 0);
  objc_storeStrong((id *)&self->_deviceKeyboardLanguage, 0);
  objc_storeStrong((id *)&self->_deviceDisplayLanguage, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end