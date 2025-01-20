@interface GEOPairedDeviceSubscriptionStateSynchronizationRequest
+ (BOOL)isValid:(id)a3;
+ (Class)identifiersToObserveType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceSubscriptionStateSynchronizationRequest)initWithDictionary:(id)a3;
- (GEOPairedDeviceSubscriptionStateSynchronizationRequest)initWithJSON:(id)a3;
- (NSMutableArray)identifiersToObserves;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identifiersToObserveAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)identifiersToObservesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addIdentifiersToObserve:(id)a3;
- (void)clearIdentifiersToObserves;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifiersToObserves:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceSubscriptionStateSynchronizationRequest

- (NSMutableArray)identifiersToObserves
{
  return self->_identifiersToObserves;
}

- (void)setIdentifiersToObserves:(id)a3
{
}

- (void)clearIdentifiersToObserves
{
}

- (void)addIdentifiersToObserve:(id)a3
{
  id v4 = a3;
  identifiersToObserves = self->_identifiersToObserves;
  id v8 = v4;
  if (!identifiersToObserves)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_identifiersToObserves;
    self->_identifiersToObserves = v6;

    id v4 = v8;
    identifiersToObserves = self->_identifiersToObserves;
  }
  [(NSMutableArray *)identifiersToObserves addObject:v4];
}

- (unint64_t)identifiersToObservesCount
{
  return [(NSMutableArray *)self->_identifiersToObserves count];
}

- (id)identifiersToObserveAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_identifiersToObserves objectAtIndex:a3];
}

+ (Class)identifiersToObserveType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceSubscriptionStateSynchronizationRequest;
  id v4 = [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)&v8 description];
  v5 = [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceSubscriptionStateSynchronizationRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[2])
    {
      v5 = [a1 identifiersToObserves];
      if (a2) {
        v6 = @"identifiersToObserve";
      }
      else {
        v6 = @"identifiers_to_observe";
      }
      [v4 setObject:v5 forKey:v6];
    }
    v7 = (void *)a1[1];
    if (v7)
    {
      objc_super v8 = [v7 dictionaryRepresentation];
      v9 = v8;
      if (a2)
      {
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __84__GEOPairedDeviceSubscriptionStateSynchronizationRequest__dictionaryRepresentation___block_invoke;
        v14[3] = &unk_1E53D8860;
        id v11 = v10;
        id v15 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v14];
        id v12 = v11;

        v9 = v12;
      }
      [v4 setObject:v9 forKey:@"Unknown Fields"];
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
  return -[GEOPairedDeviceSubscriptionStateSynchronizationRequest _dictionaryRepresentation:](self, 1);
}

void __84__GEOPairedDeviceSubscriptionStateSynchronizationRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceSubscriptionStateSynchronizationRequest)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceSubscriptionStateSynchronizationRequest *)-[GEOPairedDeviceSubscriptionStateSynchronizationRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"identifiersToObserve";
      }
      else {
        v6 = @"identifiers_to_observe";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = objc_msgSend(v13, "copy", (void)v16);
                [a1 addIdentifiersToObserve:v14];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v10);
        }
      }
    }
  }

  return a1;
}

- (GEOPairedDeviceSubscriptionStateSynchronizationRequest)initWithJSON:(id)a3
{
  return (GEOPairedDeviceSubscriptionStateSynchronizationRequest *)-[GEOPairedDeviceSubscriptionStateSynchronizationRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceSubscriptionStateSynchronizationRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceSubscriptionStateSynchronizationRequestReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_identifiersToObserves;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self readAll:0];
  if ([(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self identifiersToObservesCount])
  {
    [v8 clearIdentifiersToObserves];
    unint64_t v4 = [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self identifiersToObservesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self identifiersToObserveAtIndex:i];
        [v8 addIdentifiersToObserve:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_identifiersToObserves;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addIdentifiersToObserve:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self readAll:1];
    [v4 readAll:1];
    identifiersToObserves = self->_identifiersToObserves;
    if ((unint64_t)identifiersToObserves | v4[2]) {
      char v5 = -[NSMutableArray isEqual:](identifiersToObserves, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self readAll:1];
  identifiersToObserves = self->_identifiersToObserves;

  return [(NSMutableArray *)identifiersToObserves hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPairedDeviceSubscriptionStateSynchronizationRequest addIdentifiersToObserve:](self, "addIdentifiersToObserve:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
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
    [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToObserves, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end