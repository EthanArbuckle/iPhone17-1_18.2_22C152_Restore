@interface MSPTransitStorageAttribution
+ (Class)providerNamesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPTransitStorageAttribution)initWithAttribution:(id)a3;
- (NSArray)_providerNames;
- (NSArray)providerNames;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)providerNamesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)providerNamesCount;
- (void)addProviderNames:(id)a3;
- (void)clearProviderNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProviderNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageAttribution

- (MSPTransitStorageAttribution)initWithAttribution:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSPTransitStorageAttribution;
  v5 = [(MSPTransitStorageAttribution *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(MSPTransitStorageAttribution *)v5 clearProviderNames];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = objc_msgSend(v4, "_providerNames", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [(MSPTransitStorageAttribution *)v6 addProviderNames:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (NSArray)_providerNames
{
  v2 = (void *)[(NSMutableArray *)self->_providerNames copy];

  return (NSArray *)v2;
}

- (void)clearProviderNames
{
}

- (void)addProviderNames:(id)a3
{
  id v4 = a3;
  providerNames = self->_providerNames;
  id v8 = v4;
  if (!providerNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_providerNames;
    self->_providerNames = v6;

    id v4 = v8;
    providerNames = self->_providerNames;
  }
  [(NSMutableArray *)providerNames addObject:v4];
}

- (unint64_t)providerNamesCount
{
  return [(NSMutableArray *)self->_providerNames count];
}

- (id)providerNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_providerNames objectAtIndex:a3];
}

+ (Class)providerNamesType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageAttribution;
  id v4 = [(MSPTransitStorageAttribution *)&v8 description];
  v5 = [(MSPTransitStorageAttribution *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  providerNames = self->_providerNames;
  if (providerNames) {
    [v3 setObject:providerNames forKey:@"provider_names"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v7 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageAttributionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_providerNames;
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
  if ([(MSPTransitStorageAttribution *)self providerNamesCount])
  {
    [v8 clearProviderNames];
    unint64_t v4 = [(MSPTransitStorageAttribution *)self providerNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MSPTransitStorageAttribution *)self providerNamesAtIndex:i];
        [v8 addProviderNames:v7];
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
  uint64_t v6 = self->_providerNames;
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
        [v5 addProviderNames:v11];

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
    providerNames = self->_providerNames;
    if ((unint64_t)providerNames | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](providerNames, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_providerNames hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 2);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[MSPTransitStorageAttribution addProviderNames:](self, "addProviderNames:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSArray)providerNames
{
  return &self->_providerNames->super;
}

- (void)setProviderNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerNames, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end