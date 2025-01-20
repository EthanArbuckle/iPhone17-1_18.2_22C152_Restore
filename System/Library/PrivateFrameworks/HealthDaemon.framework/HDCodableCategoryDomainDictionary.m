@interface HDCodableCategoryDomainDictionary
+ (Class)keyValuePairsType;
- (BOOL)_validateForInsertionWithError:(id *)a3;
- (BOOL)hasCategory;
- (BOOL)hasDomain;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableCategoryDomainDictionary)initWithCategory:(int64_t)a3 domain:(id)a4;
- (HDCodableSyncIdentity)syncIdentity;
- (NSMutableArray)keyValuePairs;
- (NSString)description;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)keyValuePairsAtIndex:(unint64_t)a3;
- (int64_t)category;
- (int64_t)decodedCategory;
- (unint64_t)hash;
- (unint64_t)keyValuePairsCount;
- (void)addKeyValuePairs:(id)a3;
- (void)clearKeyValuePairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setKeyValuePairs:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableCategoryDomainDictionary

- (HDCodableCategoryDomainDictionary)initWithCategory:(int64_t)a3 domain:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCodableCategoryDomainDictionary;
  v7 = [(HDCodableCategoryDomainDictionary *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(HDCodableCategoryDomainDictionary *)v7 setCategory:a3];
    v9 = (void *)[v6 copy];
    [(HDCodableCategoryDomainDictionary *)v8 setDomain:v9];
  }
  return v8;
}

- (void)setCategory:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_category = a3;
}

- (void)setDomain:(id)a3
{
}

- (void)addKeyValuePairs:(id)a3
{
  id v4 = a3;
  keyValuePairs = self->_keyValuePairs;
  id v8 = v4;
  if (!keyValuePairs)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_keyValuePairs;
    self->_keyValuePairs = v6;

    id v4 = v8;
    keyValuePairs = self->_keyValuePairs;
  }
  [(NSMutableArray *)keyValuePairs addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_keyValuePairs;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_keyValuePairs, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (int64_t)decodedCategory
{
  return self->_category;
}

- (void)setHasCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)clearKeyValuePairs
{
}

- (unint64_t)keyValuePairsCount
{
  return [(NSMutableArray *)self->_keyValuePairs count];
}

- (id)keyValuePairsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyValuePairs objectAtIndex:a3];
}

+ (Class)keyValuePairsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableCategoryDomainDictionary;
  id v4 = [(HDCodableCategoryDomainDictionary *)&v8 description];
  v5 = [(HDCodableCategoryDomainDictionary *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_category];
    [v3 setObject:v4 forKey:@"category"];
  }
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if ([(NSMutableArray *)self->_keyValuePairs count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_keyValuePairs, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_keyValuePairs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"keyValuePairs"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v14 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"syncIdentity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCategoryDomainDictionaryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_category;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v9 = v4;
  if (self->_domain) {
    objc_msgSend(v4, "setDomain:");
  }
  if ([(HDCodableCategoryDomainDictionary *)self keyValuePairsCount])
  {
    [v9 clearKeyValuePairs];
    unint64_t v5 = [(HDCodableCategoryDomainDictionary *)self keyValuePairsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HDCodableCategoryDomainDictionary *)self keyValuePairsAtIndex:i];
        [v9 addKeyValuePairs:v8];
      }
    }
  }
  if (self->_syncIdentity) {
    objc_msgSend(v9, "setSyncIdentity:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_category;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_domain copyWithZone:a3];
  uint64_t v8 = (void *)v6[2];
  v6[2] = v7;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_keyValuePairs;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (void)v18);
        [v6 addKeyValuePairs:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v15 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  long long v16 = (void *)v6[4];
  v6[4] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_category != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2) && !-[NSString isEqual:](domain, "isEqual:")) {
    goto LABEL_13;
  }
  keyValuePairs = self->_keyValuePairs;
  if ((unint64_t)keyValuePairs | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](keyValuePairs, "isEqual:")) {
      goto LABEL_13;
    }
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 4)) {
    char v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_category;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_domain hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_keyValuePairs hash];
  return v4 ^ v5 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  uint64_t v5 = v4;
  if ((_BYTE)v4[5])
  {
    self->_category = (int64_t)v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2]) {
    -[HDCodableCategoryDomainDictionary setDomain:](self, "setDomain:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5[3];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[HDCodableCategoryDomainDictionary addKeyValuePairs:](self, "addKeyValuePairs:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  syncIdentity = self->_syncIdentity;
  id v12 = v5[4];
  if (syncIdentity)
  {
    if (v12) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[HDCodableCategoryDomainDictionary setSyncIdentity:](self, "setSyncIdentity:");
  }
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSMutableArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (BOOL)_validateForInsertionWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(HDCodableCategoryDomainDictionary *)self hasCategory])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Missing category"");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_keyValuePairs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    uint64_t v11 = @"Missing key in pair for %ld (%@)";
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!v13[5]) {
          goto LABEL_15;
        }
        if (![v13 hasTimestamp])
        {
          uint64_t v11 = @"Missing timestamp in pair for %ld (%@)";
LABEL_15:
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", objc_opt_class(), a2, v11, self->_category, self->_domain, (void)v17);

          id v6 = (void *)v14;
          goto LABEL_16;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  id v15 = v6;
  if (v15)
  {
    if (a3) {
      *a3 = v15;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v15 == 0;
}

@end