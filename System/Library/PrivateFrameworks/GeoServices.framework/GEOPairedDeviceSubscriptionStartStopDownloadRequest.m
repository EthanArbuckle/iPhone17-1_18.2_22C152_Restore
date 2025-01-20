@interface GEOPairedDeviceSubscriptionStartStopDownloadRequest
+ (BOOL)isValid:(id)a3;
+ (Class)identifiersType;
- (BOOL)hasMode;
- (BOOL)hasShouldDownload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldDownload;
- (GEOPairedDeviceSubscriptionStartStopDownloadRequest)initWithDictionary:(id)a3;
- (GEOPairedDeviceSubscriptionStartStopDownloadRequest)initWithJSON:(id)a3;
- (NSMutableArray)identifiers;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identifiersAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)identifiersCount;
- (unsigned)mode;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addIdentifiers:(id)a3;
- (void)clearIdentifiers;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasShouldDownload:(BOOL)a3;
- (void)setIdentifiers:(id)a3;
- (void)setMode:(unsigned int)a3;
- (void)setShouldDownload:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceSubscriptionStartStopDownloadRequest

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void)clearIdentifiers
{
}

- (void)addIdentifiers:(id)a3
{
  id v4 = a3;
  identifiers = self->_identifiers;
  id v8 = v4;
  if (!identifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_identifiers;
    self->_identifiers = v6;

    id v4 = v8;
    identifiers = self->_identifiers;
  }
  [(NSMutableArray *)identifiers addObject:v4];
}

- (unint64_t)identifiersCount
{
  return [(NSMutableArray *)self->_identifiers count];
}

- (id)identifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_identifiers objectAtIndex:a3];
}

+ (Class)identifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldDownload
{
  return self->_shouldDownload;
}

- (void)setShouldDownload:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_shouldDownload = a3;
}

- (void)setHasShouldDownload:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasShouldDownload
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceSubscriptionStartStopDownloadRequest;
  id v4 = [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)&v8 description];
  v5 = [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceSubscriptionStartStopDownloadRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 16))
    {
      v5 = [(id)a1 identifiers];
      [v4 setObject:v5 forKey:@"identifiers"];
    }
    char v6 = *(unsigned char *)(a1 + 32);
    if ((v6 & 2) != 0)
    {
      v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
      if (a2) {
        objc_super v8 = @"shouldDownload";
      }
      else {
        objc_super v8 = @"should_download";
      }
      [v4 setObject:v7 forKey:v8];

      char v6 = *(unsigned char *)(a1 + 32);
    }
    if (v6)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      [v4 setObject:v9 forKey:@"mode"];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __81__GEOPairedDeviceSubscriptionStartStopDownloadRequest__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOPairedDeviceSubscriptionStartStopDownloadRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __81__GEOPairedDeviceSubscriptionStartStopDownloadRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOPairedDeviceSubscriptionStartStopDownloadRequest)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceSubscriptionStartStopDownloadRequest *)-[GEOPairedDeviceSubscriptionStartStopDownloadRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      char v6 = [v5 objectForKeyedSubscript:@"identifiers"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = objc_msgSend(v12, "copy", (void)v18);
                [a1 addIdentifiers:v13];
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v9);
        }
      }
      if (a3) {
        id v14 = @"shouldDownload";
      }
      else {
        id v14 = @"should_download";
      }
      id v15 = objc_msgSend(v5, "objectForKeyedSubscript:", v14, (void)v18);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldDownload:", objc_msgSend(v15, "BOOLValue"));
      }

      v16 = [v5 objectForKeyedSubscript:@"mode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMode:", objc_msgSend(v16, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOPairedDeviceSubscriptionStartStopDownloadRequest)initWithJSON:(id)a3
{
  return (GEOPairedDeviceSubscriptionStartStopDownloadRequest *)-[GEOPairedDeviceSubscriptionStartStopDownloadRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceSubscriptionStartStopDownloadRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceSubscriptionStartStopDownloadRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_identifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self readAll:0];
  if ([(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self identifiersCount])
  {
    [v9 clearIdentifiers];
    unint64_t v4 = [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self identifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self identifiersAtIndex:i];
        [v9 addIdentifiers:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v9 + 28) = self->_shouldDownload;
    *((unsigned char *)v9 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v9 + 6) = self->_mode;
    *((unsigned char *)v9 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_identifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addIdentifiers:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_shouldDownload;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_mode;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self readAll:1];
  [v4 readAll:1];
  identifiers = self->_identifiers;
  if ((unint64_t)identifiers | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](identifiers, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) != 0)
    {
      if (self->_shouldDownload)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_mode != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_identifiers hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_shouldDownload;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_mode;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPairedDeviceSubscriptionStartStopDownloadRequest addIdentifiers:](self, "addIdentifiers:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 32);
  if ((v10 & 2) != 0)
  {
    self->_shouldDownload = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_flags |= 2u;
    char v10 = *((unsigned char *)v4 + 32);
  }
  if (v10)
  {
    self->_mode = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end