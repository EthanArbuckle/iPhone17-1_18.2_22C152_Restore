@interface CPLSuggestionRecordList
+ (Class)assetType;
+ (Class)memoryType;
+ (Class)personType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)assets;
- (NSMutableArray)memorys;
- (NSMutableArray)persons;
- (id)assetAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)memoryAtIndex:(unint64_t)a3;
- (id)personAtIndex:(unint64_t)a3;
- (unint64_t)assetsCount;
- (unint64_t)hash;
- (unint64_t)memorysCount;
- (unint64_t)personsCount;
- (unsigned)version;
- (void)addAsset:(id)a3;
- (void)addMemory:(id)a3;
- (void)addPerson:(id)a3;
- (void)clearAssets;
- (void)clearMemorys;
- (void)clearPersons;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssets:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMemorys:(id)a3;
- (void)setPersons:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLSuggestionRecordList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_memorys, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)setMemorys:(id)a3
{
}

- (NSMutableArray)memorys
{
  return self->_memorys;
}

- (void)setPersons:(id)a3
{
}

- (NSMutableArray)persons
{
  return self->_persons;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setAssets:(id)a3
{
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CPLSuggestionRecordList *)self addAsset:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 36))
  {
    self->_version = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(CPLSuggestionRecordList *)self addPerson:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 2);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[CPLSuggestionRecordList addMemory:](self, "addMemory:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_assets hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_version;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSMutableArray *)self->_persons hash];
  return v5 ^ v6 ^ [(NSMutableArray *)self->_memorys hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  assets = self->_assets;
  if ((unint64_t)assets | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](assets, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  persons = self->_persons;
  if ((unint64_t)persons | *((void *)v4 + 3) && !-[NSMutableArray isEqual:](persons, "isEqual:")) {
    goto LABEL_13;
  }
  memorys = self->_memorys;
  if ((unint64_t)memorys | *((void *)v4 + 2)) {
    char v8 = -[NSMutableArray isEqual:](memorys, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_assets;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addAsset:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = self->_persons;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [(id)v5 addPerson:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_memorys;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [(id)v5 addMemory:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if ([(CPLSuggestionRecordList *)self assetsCount])
  {
    [v16 clearAssets];
    unint64_t v4 = [(CPLSuggestionRecordList *)self assetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CPLSuggestionRecordList *)self assetAtIndex:i];
        [v16 addAsset:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v16 + 8) = self->_version;
    *((unsigned char *)v16 + 36) |= 1u;
  }
  if ([(CPLSuggestionRecordList *)self personsCount])
  {
    [v16 clearPersons];
    unint64_t v8 = [(CPLSuggestionRecordList *)self personsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(CPLSuggestionRecordList *)self personAtIndex:j];
        [v16 addPerson:v11];
      }
    }
  }
  if ([(CPLSuggestionRecordList *)self memorysCount])
  {
    [v16 clearMemorys];
    unint64_t v12 = [(CPLSuggestionRecordList *)self memorysCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(CPLSuggestionRecordList *)self memoryAtIndex:k];
        [v16 addMemory:v15];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v5 = self->_assets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_persons;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_memorys;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLSuggestionRecordListReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_assets count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_assets, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unint64_t v5 = self->_assets;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"asset"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v11 forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_persons count])
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_persons, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v13 = self->_persons;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v31 + 1) + 8 * j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"person"];
  }
  if ([(NSMutableArray *)self->_memorys count])
  {
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_memorys, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v20 = self->_memorys;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * k), "dictionaryRepresentation", (void)v27);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"memory"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLSuggestionRecordList;
  id v4 = [(CPLSuggestionRecordList *)&v8 description];
  unint64_t v5 = [(CPLSuggestionRecordList *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)memoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_memorys objectAtIndex:a3];
}

- (unint64_t)memorysCount
{
  return [(NSMutableArray *)self->_memorys count];
}

- (void)addMemory:(id)a3
{
  id v4 = a3;
  memorys = self->_memorys;
  id v8 = v4;
  if (!memorys)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_memorys;
    self->_memorys = v6;

    id v4 = v8;
    memorys = self->_memorys;
  }
  [(NSMutableArray *)memorys addObject:v4];
}

- (void)clearMemorys
{
}

- (id)personAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_persons objectAtIndex:a3];
}

- (unint64_t)personsCount
{
  return [(NSMutableArray *)self->_persons count];
}

- (void)addPerson:(id)a3
{
  id v4 = a3;
  persons = self->_persons;
  id v8 = v4;
  if (!persons)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_persons;
    self->_persons = v6;

    id v4 = v8;
    persons = self->_persons;
  }
  [(NSMutableArray *)persons addObject:v4];
}

- (void)clearPersons
{
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (id)assetAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_assets objectAtIndex:a3];
}

- (unint64_t)assetsCount
{
  return [(NSMutableArray *)self->_assets count];
}

- (void)addAsset:(id)a3
{
  id v4 = a3;
  assets = self->_assets;
  id v8 = v4;
  if (!assets)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_assets;
    self->_assets = v6;

    id v4 = v8;
    assets = self->_assets;
  }
  [(NSMutableArray *)assets addObject:v4];
}

- (void)clearAssets
{
}

+ (Class)memoryType
{
  return (Class)objc_opt_class();
}

+ (Class)personType
{
  return (Class)objc_opt_class();
}

+ (Class)assetType
{
  return (Class)objc_opt_class();
}

@end