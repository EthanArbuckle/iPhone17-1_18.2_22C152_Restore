@interface GEOPBTransitRoutingIncidentMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitRoutingIncidentMessage)init;
- (GEOPBTransitRoutingIncidentMessage)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)routingMessage;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)transitIncidentIndexAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readRoutingMessage;
- (void)_readTransitIncidentIndexs;
- (void)addTransitIncidentIndex:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setRoutingMessage:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitRoutingIncidentMessage

- (GEOPBTransitRoutingIncidentMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  v2 = [(GEOPBTransitRoutingIncidentMessage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitRoutingIncidentMessage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  v3 = [(GEOPBTransitRoutingIncidentMessage *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  [(GEOPBTransitRoutingIncidentMessage *)&v3 dealloc];
}

- (void)_readRoutingMessage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitRoutingIncidentMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutingMessage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)routingMessage
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitRoutingIncidentMessage _readRoutingMessage]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRoutingMessage:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 72) |= 8u;
    *(unsigned char *)(a1 + 72) |= 0x10u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readTransitIncidentIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitRoutingIncidentMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitIncidentIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addTransitIncidentIndex:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs](a1);
    PBRepeatedUInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 72) |= 0x10u;
  }
}

- (uint64_t)transitIncidentIndexAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  unint64_t v4 = [(GEOPBTransitRoutingIncidentMessage *)&v8 description];
  v5 = [(GEOPBTransitRoutingIncidentMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitRoutingIncidentMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBTransitRoutingIncidentMessage readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        uint64_t v6 = @"routingIncidentMessageIndex";
      }
      else {
        uint64_t v6 = @"routing_incident_message_index";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = -[GEOPBTransitRoutingIncidentMessage routingMessage]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"routingMessage";
      }
      else {
        objc_super v8 = @"routing_message";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(void *)(a1 + 32))
    {
      v9 = PBRepeatedUInt32NSArray();
      if (a2) {
        v10 = @"transitIncidentIndex";
      }
      else {
        v10 = @"transit_incident_index";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 16);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __64__GEOPBTransitRoutingIncidentMessage__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitRoutingIncidentMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_902;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_903;
      }
      GEOPBTransitRoutingIncidentMessageReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __64__GEOPBTransitRoutingIncidentMessage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        uint64_t v6 = @"routingIncidentMessageIndex";
      }
      else {
        uint64_t v6 = @"routing_incident_message_index";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = [v7 unsignedIntValue];
        *(unsigned char *)(a1 + 72) |= 0x10u;
        *(unsigned char *)(a1 + 72) |= 1u;
        *(_DWORD *)(a1 + 68) = v8;
      }

      if (a3) {
        v9 = @"routingMessage";
      }
      else {
        v9 = @"routing_message";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        -[GEOPBTransitRoutingIncidentMessage setRoutingMessage:](a1, v11);
      }
      if (a3) {
        v12 = @"transitIncidentIndex";
      }
      else {
        v12 = @"transit_incident_index";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v21 + 1) + 8 * v18);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend(v19, "unsignedIntValue", (void)v21);
                -[GEOPBTransitRoutingIncidentMessage addTransitIncidentIndex:](a1);
              }
              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v16);
        }
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitRoutingIncidentMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    int v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v9;
    if (self->_routingMessage)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_transitIncidentIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_transitIncidentIndexs.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitRoutingIncidentMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_routingIncidentMessageIndex;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_routingMessage copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  PBRepeatedUInt32Copy();
  v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 1);
  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_routingIncidentMessageIndex != *((_DWORD *)v4 + 17)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_10:
    char IsEqual = 0;
    goto LABEL_11;
  }
  routingMessage = self->_routingMessage;
  if ((unint64_t)routingMessage | *((void *)v4 + 6)
    && !-[NSString isEqual:](routingMessage, "isEqual:"))
  {
    goto LABEL_10;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_routingIncidentMessageIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_routingMessage hash];
  return v4 ^ v3 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    objc_super v7 = v3;
    -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)v3, 0);
    if (v7[18])
    {
      *(_DWORD *)(a1 + 68) = v7[17];
      *(unsigned char *)(a1 + 72) |= 1u;
    }
    NSUInteger v4 = (void *)*((void *)v7 + 6);
    if (v4) {
      -[GEOPBTransitRoutingIncidentMessage setRoutingMessage:](a1, v4);
    }
    -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs]((uint64_t)v7);
    uint64_t v3 = v7;
    uint64_t v5 = *((void *)v7 + 4);
    if (v5)
    {
      for (unint64_t i = 0; i != v5; ++i)
      {
        -[GEOPBTransitRoutingIncidentMessage transitIncidentIndexAtIndex:]((uint64_t)v7, i);
        -[GEOPBTransitRoutingIncidentMessage addTransitIncidentIndex:](a1);
        uint64_t v3 = v7;
      }
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 2u;
    *(unsigned char *)(a1 + 72) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    NSUInteger v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPBTransitRoutingIncidentMessage readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingMessage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end