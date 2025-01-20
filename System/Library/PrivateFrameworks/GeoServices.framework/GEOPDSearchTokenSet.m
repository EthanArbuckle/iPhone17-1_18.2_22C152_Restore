@interface GEOPDSearchTokenSet
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchTokenSet)init;
- (GEOPDSearchTokenSet)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsToken:(uint64_t)a1;
- (void)_readTokens;
- (void)addToken:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setLanguageCode:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchTokenSet

- (GEOPDSearchTokenSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchTokenSet;
  v2 = [(GEOPDSearchTokenSet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchTokenSet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchTokenSet;
  v3 = [(GEOPDSearchTokenSet *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTokens
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchTokenSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokens_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)addToken:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchTokenSet _readTokens](a1);
    -[GEOPDSearchTokenSet _addNoFlagsToken:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 44) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 44) |= 4u;
  }
}

- (void)_addNoFlagsToken:(uint64_t)a1
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

- (void)setLanguageCode:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 44) |= 1u;
    *(unsigned char *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTokenSet;
  id v4 = [(GEOPDSearchTokenSet *)&v8 description];
  id v5 = [(GEOPDSearchTokenSet *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTokenSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchTokenSet readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v18 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v10 jsonRepresentation];
            }
            else {
            v11 = objc_msgSend(v10, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v5, "addObject:", v11, (void)v17);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v7);
      }

      [v4 setObject:v5 forKey:@"token"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchTokenSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguageCode_tags_2);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v14 = *(id *)(a1 + 16);
    if (v14)
    {
      if (a2) {
        v15 = @"languageCode";
      }
      else {
        v15 = @"language_code";
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15, (void)v17);
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
  return -[GEOPDSearchTokenSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_102_1;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_103_1;
      }
      GEOPDSearchTokenSetReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchTokenSetCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = [a1 init];
    if (v5)
    {
      id v6 = [v4 objectForKeyedSubscript:@"token"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v62 = v4;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v78 objects:v86 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          v10 = @"processed_value";
          uint64_t v11 = *(void *)v79;
          if (a3) {
            v10 = @"processedValue";
          }
          v72 = v10;
          if (a3) {
            v12 = @"rawValue";
          }
          else {
            v12 = @"raw_value";
          }
          id v13 = @"alternate_form";
          if (a3) {
            id v13 = @"alternateForm";
          }
          v70 = v13;
          v71 = v12;
          id v14 = @"token_span";
          if (a3) {
            id v14 = @"tokenSpan";
          }
          uint64_t v68 = v5;
          v69 = v14;
          if (a3) {
            v15 = @"beginIndex";
          }
          else {
            v15 = @"begin_index";
          }
          v16 = @"endIndex";
          if (!a3) {
            v16 = @"end_index";
          }
          v64 = v16;
          v65 = v15;
          uint64_t v73 = *(void *)v79;
          id v66 = v7;
          v67 = v6;
          do
          {
            uint64_t v17 = 0;
            uint64_t v74 = v9;
            do
            {
              if (*(void *)v79 != v11) {
                objc_enumerationMutation(v7);
              }
              long long v18 = *(void **)(*((void *)&v78 + 1) + 8 * v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v75 = v17;
                long long v19 = [GEOPDSearchToken alloc];
                if (v19)
                {
                  long long v20 = v19;
                  id v21 = v18;
                  uint64_t v77 = [(GEOPDSearchToken *)v20 init];
                  if (v77)
                  {
                    v76 = v21;
                    uint64_t v22 = [v21 objectForKeyedSubscript:v72];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v23 = (void *)[v22 copy];
                      id v24 = v23;
                      *(unsigned char *)(v77 + 64) |= 4u;
                      *(unsigned char *)(v77 + 64) |= 0x20u;
                      objc_storeStrong((id *)(v77 + 24), v23);
                    }
                    v25 = [v76 objectForKeyedSubscript:v71];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v26 = (void *)[v25 copy];
                      id v27 = v26;
                      *(unsigned char *)(v77 + 64) |= 8u;
                      *(unsigned char *)(v77 + 64) |= 0x20u;
                      objc_storeStrong((id *)(v77 + 32), v26);
                    }
                    v28 = [v76 objectForKeyedSubscript:@"position"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v29 = [v28 intValue];
                      *(unsigned char *)(v77 + 64) |= 0x20u;
                      *(unsigned char *)(v77 + 64) |= 1u;
                      *(_DWORD *)(v77 + 60) = v29;
                    }

                    id v21 = v76;
                    v30 = [v76 objectForKeyedSubscript:v70];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v84 = 0u;
                      long long v85 = 0u;
                      long long v82 = 0u;
                      long long v83 = 0u;
                      id v31 = v30;
                      uint64_t v32 = [v31 countByEnumeratingWithState:&v82 objects:v87 count:16];
                      if (!v32) {
                        goto LABEL_64;
                      }
                      uint64_t v33 = v32;
                      uint64_t v34 = *(void *)v83;
                      while (1)
                      {
                        uint64_t v35 = 0;
                        do
                        {
                          if (*(void *)v83 != v34) {
                            objc_enumerationMutation(v31);
                          }
                          v36 = *(void **)(*((void *)&v82 + 1) + 8 * v35);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v37 = [GEOPDSearchTokenForm alloc];
                            if (v37)
                            {
                              v38 = v37;
                              id v39 = v36;
                              uint64_t v40 = [(GEOPDSearchTokenForm *)v38 init];
                              if (v40)
                              {
                                v41 = [v39 objectForKeyedSubscript:@"value"];
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  v42 = (void *)[v41 copy];
                                  id v43 = v42;
                                  objc_storeStrong((id *)(v40 + 8), v42);
                                }
                                v44 = [v39 objectForKeyedSubscript:@"type"];
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v45 = v44;
                                  if ([v45 isEqualToString:@"READING"])
                                  {
                                    int v46 = 0;
                                  }
                                  else if ([v45 isEqualToString:@"PRONUNCIATION"])
                                  {
                                    int v46 = 1;
                                  }
                                  else if ([v45 isEqualToString:@"CHAR_TO_NUMERIC"])
                                  {
                                    int v46 = 2;
                                  }
                                  else if ([v45 isEqualToString:@"NUMERIC_TO_CHAR"])
                                  {
                                    int v46 = 3;
                                  }
                                  else
                                  {
                                    int v46 = 0;
                                  }

LABEL_56:
                                  *(_DWORD *)(v40 + 16) = v46;
                                }
                                else
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    int v46 = [v44 intValue];
                                    goto LABEL_56;
                                  }
                                }
                              }
                            }
                            else
                            {
                              uint64_t v40 = 0;
                            }
                            -[GEOPDSearchToken addAlternateForm:](v77, (void *)v40);
                          }
                          ++v35;
                        }
                        while (v33 != v35);
                        uint64_t v47 = [v31 countByEnumeratingWithState:&v82 objects:v87 count:16];
                        uint64_t v33 = v47;
                        if (!v47)
                        {
LABEL_64:

                          id v6 = v67;
                          uint64_t v5 = v68;
                          id v7 = v66;
                          uint64_t v11 = v73;
                          id v21 = v76;
                          break;
                        }
                      }
                    }

                    v48 = [v21 objectForKeyedSubscript:v69];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v49 = [GEOPDSearchTokenSpan alloc];
                      if (v49)
                      {
                        v50 = v49;
                        id v51 = v48;
                        v52 = [(GEOPDSearchTokenSpan *)v50 init];
                        if (v52)
                        {
                          v53 = [v51 objectForKeyedSubscript:v65];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            v52->_beginIndex = [v53 intValue];
                          }

                          v54 = [v51 objectForKeyedSubscript:v64];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            v52->_endIndex = [v54 intValue];
                          }
                        }
                      }
                      else
                      {
                        v52 = 0;
                      }
                      v55 = v52;
                      *(unsigned char *)(v77 + 64) |= 0x10u;
                      *(unsigned char *)(v77 + 64) |= 0x20u;
                      objc_storeStrong((id *)(v77 + 40), v52);

                      uint64_t v11 = v73;
                      id v21 = v76;
                    }
                  }
                }
                else
                {
                  uint64_t v77 = 0;
                }
                -[GEOPDSearchTokenSet addToken:](v5, (void *)v77);

                uint64_t v9 = v74;
                uint64_t v17 = v75;
              }
              ++v17;
            }
            while (v17 != v9);
            uint64_t v56 = [v7 countByEnumeratingWithState:&v78 objects:v86 count:16];
            uint64_t v9 = v56;
          }
          while (v56);
        }

        id v4 = v62;
      }

      if (a3) {
        v57 = @"languageCode";
      }
      else {
        v57 = @"language_code";
      }
      v58 = objc_msgSend(v4, "objectForKeyedSubscript:", v57, v62);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v59 = v4;
        v60 = (void *)[v58 copy];
        -[GEOPDSearchTokenSet setLanguageCode:](v5, v60);

        id v4 = v59;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchTokenSet readAll:]((uint64_t)self, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_tokens;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_languageCode) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchTokenSetReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTokenSet readAll:]((uint64_t)self, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_tokens;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        -[GEOPDSearchTokenSet addToken:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_languageCode copyWithZone:a3];
  long long v14 = (void *)v5[2];
  v5[2] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchTokenSet readAll:]((uint64_t)self, 1),
         -[GEOPDSearchTokenSet readAll:]((uint64_t)v4, 1),
         tokens = self->_tokens,
         !((unint64_t)tokens | v4[3]))
     || -[NSMutableArray isEqual:](tokens, "isEqual:")))
  {
    languageCode = self->_languageCode;
    if ((unint64_t)languageCode | v4[2]) {
      char v7 = -[NSString isEqual:](languageCode, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchTokenSet readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_tokens hash];
  return [(NSString *)self->_languageCode hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end