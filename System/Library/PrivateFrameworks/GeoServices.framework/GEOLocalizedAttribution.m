@interface GEOLocalizedAttribution
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedAttribution)init;
- (GEOLocalizedAttribution)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bestURLForLogos:(id)a3 scale:(double)a4;
- (id)captionDisplayString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)language;
- (id)logoURLs;
- (id)logoURLsAtIndex:(id *)a1;
- (id)snippetLogoURLs;
- (id)snippetLogoURLsAtIndex:(id *)a1;
- (unint64_t)hash;
- (void)_addNoFlagsLogoURLs:(uint64_t)a1;
- (void)_addNoFlagsSnippetLogoURLs:(uint64_t)a1;
- (void)_readCaptionDisplayString;
- (void)_readDisplayName;
- (void)_readLanguage;
- (void)_readLogoURLs;
- (void)_readSnippetLogoURLs;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocalizedAttribution

- (id)bestURLForLogos:(id)a3 scale:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = a3;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v21)
  {
    unint64_t v6 = vcvtpd_u64_f64(a4);
    uint64_t v7 = *(void *)v23;
    uint64_t v20 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        if (a4 <= 1.0)
        {
          unint64_t v12 = v6;
          char v13 = 0;
          uint64_t v14 = 2;
          while (1)
          {
            char v15 = v13;
            v16 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v14);
            uint64_t v17 = [v9 rangeOfString:v16];

            if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            char v13 = 1;
            uint64_t v14 = 3;
            if (v15)
            {

              goto LABEL_17;
            }
          }

          unint64_t v6 = v12;
          uint64_t v7 = v20;
        }
        else
        {
          v10 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v6);
          uint64_t v11 = [v9 rangeOfString:v10];

          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_17:
            id v18 = v9;
            goto LABEL_19;
          }
        }
      }
      id v18 = 0;
      uint64_t v21 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)snippetLogoURLs
{
  if (a1)
  {
    v2 = a1;
    -[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)logoURLs
{
  if (a1)
  {
    v2 = a1;
    -[GEOLocalizedAttribution _readLogoURLs]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLogoURLs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogoURLs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readSnippetLogoURLs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSnippetLogoURLs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)snippetLogoURLsAtIndex:(id *)a1
{
  if (a1)
  {
    v4 = a1;
    -[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)a1);
    a1 = [v4[7] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_addNoFlagsSnippetLogoURLs:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)logoURLsAtIndex:(id *)a1
{
  if (a1)
  {
    v4 = a1;
    -[GEOLocalizedAttribution _readLogoURLs]((uint64_t)a1);
    a1 = [v4[6] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_addNoFlagsLogoURLs:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)language
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOLocalizedAttribution _readLanguage]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguage_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOLocalizedAttribution)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizedAttribution;
  uint64_t v2 = [(GEOLocalizedAttribution *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)displayName
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOLocalizedAttribution _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)captionDisplayString
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOLocalizedAttribution _readCaptionDisplayString]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readCaptionDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCaptionDisplayString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOLocalizedAttribution)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLocalizedAttribution;
  id v3 = [(GEOLocalizedAttribution *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocalizedAttribution;
  v4 = [(GEOLocalizedAttribution *)&v8 description];
  id v5 = [(GEOLocalizedAttribution *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizedAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOLocalizedAttribution readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOLocalizedAttribution language]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"language"];
    }

    objc_super v6 = -[GEOLocalizedAttribution displayName]((id *)a1);
    if (v6) {
      [v4 setObject:v6 forKey:@"displayName"];
    }

    if (*(void *)(a1 + 48))
    {
      objc_super v7 = -[GEOLocalizedAttribution logoURLs]((id *)a1);
      [v4 setObject:v7 forKey:@"logoURLs"];
    }
    if (*(void *)(a1 + 56))
    {
      objc_super v8 = -[GEOLocalizedAttribution snippetLogoURLs]((id *)a1);
      [v4 setObject:v8 forKey:@"snippetLogoURLs"];
    }
    id v9 = -[GEOLocalizedAttribution captionDisplayString]((id *)a1);
    if (v9) {
      [v4 setObject:v9 forKey:@"captionDisplayString"];
    }

    v10 = *(void **)(a1 + 16);
    if (v10)
    {
      uint64_t v11 = [v10 dictionaryRepresentation];
      unint64_t v12 = v11;
      if (a2)
      {
        char v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __53__GEOLocalizedAttribution__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        unint64_t v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOLocalizedAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_177;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_178;
      }
      GEOLocalizedAttributionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __53__GEOLocalizedAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOLocalizedAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
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
    -[GEOLocalizedAttribution readAll:]((uint64_t)self, 0);
    if (self->_language) {
      PBDataWriterWriteStringField();
    }
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_logoURLs;
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
    id v10 = self->_snippetLogoURLs;
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

    if (self->_captionDisplayString) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
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
      GEOLocalizedAttributionReadAllFrom(v5, v8->_reader, 0);
      os_unfair_lock_unlock(p_readerLock);
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOLocalizedAttribution readAll:]((uint64_t)self, 0);
  uint64_t v10 = [(NSString *)self->_language copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_displayName copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v29 = self;
  id v14 = self->_logoURLs;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = (id)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        -[GEOLocalizedAttribution _readLogoURLs](v5);
        -[GEOLocalizedAttribution _addNoFlagsLogoURLs:](v5, v18);

        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v5 + 76) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
        *(unsigned char *)(v5 + 76) |= 0x40u;
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v15);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v19 = v29->_snippetLogoURLs;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        long long v24 = v23;
        if (v5)
        {
          id v25 = v23;
          -[GEOLocalizedAttribution _readSnippetLogoURLs](v5);
          -[GEOLocalizedAttribution _addNoFlagsSnippetLogoURLs:](v5, v25);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 76) |= 0x20u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
          *(unsigned char *)(v5 + 76) |= 0x40u;
        }
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v20);
  }

  uint64_t v26 = [(NSString *)v29->_captionDisplayString copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v26;

  objc_storeStrong((id *)(v5 + 16), v29->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOLocalizedAttribution readAll:]((uint64_t)self, 1),
         -[GEOLocalizedAttribution readAll:]((uint64_t)v4, 1),
         language = self->_language,
         !((unint64_t)language | v4[5]))
     || -[NSString isEqual:](language, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[4]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((logoURLs = self->_logoURLs, !((unint64_t)logoURLs | v4[6]))
     || -[NSMutableArray isEqual:](logoURLs, "isEqual:"))
    && ((snippetLogoURLs = self->_snippetLogoURLs, !((unint64_t)snippetLogoURLs | v4[7]))
     || -[NSMutableArray isEqual:](snippetLogoURLs, "isEqual:")))
  {
    captionDisplayString = self->_captionDisplayString;
    if ((unint64_t)captionDisplayString | v4[3]) {
      char v10 = -[NSString isEqual:](captionDisplayString, "isEqual:");
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
  -[GEOLocalizedAttribution readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_language hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_logoURLs hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_snippetLogoURLs hash];
  return v6 ^ [(NSString *)self->_captionDisplayString hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetLogoURLs, 0);
  objc_storeStrong((id *)&self->_logoURLs, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_captionDisplayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end