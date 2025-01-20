@interface ACProtobufAccountCredential
+ (Class)credentialItemsType;
+ (Class)dirtyPropertiesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresTouchID;
- (NSDictionary)credentialItemsDictionary;
- (NSMutableArray)credentialItems;
- (NSMutableArray)dirtyProperties;
- (NSString)credentialType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialItemsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dirtyPropertiesAtIndex:(unint64_t)a3;
- (unint64_t)credentialItemsCount;
- (unint64_t)dirtyPropertiesCount;
- (unint64_t)hash;
- (void)addCredentialItems:(id)a3;
- (void)addDirtyProperties:(id)a3;
- (void)clearCredentialItems;
- (void)clearDirtyProperties;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialItems:(id)a3;
- (void)setCredentialItemsDictionary:(id)a3;
- (void)setCredentialType:(id)a3;
- (void)setDirtyProperties:(id)a3;
- (void)setRequiresTouchID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufAccountCredential

- (void)setCredentialItemsDictionary:(id)a3
{
  id v4 = a3;
  [(ACProtobufAccountCredential *)self clearCredentialItems];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__ACProtobufAccountCredential_Helpers__setCredentialItemsDictionary___block_invoke;
  v5[3] = &unk_1E5BCE380;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __69__ACProtobufAccountCredential_Helpers__setCredentialItemsDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [[ACProtobufKeyValuePair alloc] initWithValue:v5 forKey:v6];

  [*(id *)(a1 + 32) addCredentialItems:v7];
}

- (NSDictionary)credentialItemsDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[ACProtobufAccountCredential credentialItemsCount](self, "credentialItemsCount"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(ACProtobufAccountCredential *)self credentialItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 value];
        v11 = [v9 key];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (void)clearCredentialItems
{
}

- (void)addCredentialItems:(id)a3
{
  id v4 = a3;
  credentialItems = self->_credentialItems;
  id v8 = v4;
  if (!credentialItems)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_credentialItems;
    self->_credentialItems = v6;

    id v4 = v8;
    credentialItems = self->_credentialItems;
  }
  [(NSMutableArray *)credentialItems addObject:v4];
}

- (unint64_t)credentialItemsCount
{
  return [(NSMutableArray *)self->_credentialItems count];
}

- (id)credentialItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_credentialItems objectAtIndex:a3];
}

+ (Class)credentialItemsType
{
  return (Class)objc_opt_class();
}

- (void)clearDirtyProperties
{
}

- (void)addDirtyProperties:(id)a3
{
  id v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  id v8 = v4;
  if (!dirtyProperties)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    id v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  [(NSMutableArray *)dirtyProperties addObject:v4];
}

- (unint64_t)dirtyPropertiesCount
{
  return [(NSMutableArray *)self->_dirtyProperties count];
}

- (id)dirtyPropertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dirtyProperties objectAtIndex:a3];
}

+ (Class)dirtyPropertiesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufAccountCredential;
  id v4 = [(ACProtobufAccountCredential *)&v8 description];
  uint64_t v5 = [(ACProtobufAccountCredential *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_credentialItems count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_credentialItems, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = self->_credentialItems;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"credentialItems"];
  }
  credentialType = self->_credentialType;
  if (credentialType) {
    [v3 setObject:credentialType forKey:@"credentialType"];
  }
  dirtyProperties = self->_dirtyProperties;
  if (dirtyProperties) {
    [v3 setObject:dirtyProperties forKey:@"dirtyProperties"];
  }
  long long v13 = objc_msgSend(NSNumber, "numberWithBool:", self->_requiresTouchID, (void)v15);
  [v3 setObject:v13 forKey:@"requiresTouchID"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufAccountCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_credentialItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteStringField();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_dirtyProperties;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = a3;
  if ([(ACProtobufAccountCredential *)self credentialItemsCount])
  {
    [v12 clearCredentialItems];
    unint64_t v4 = [(ACProtobufAccountCredential *)self credentialItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ACProtobufAccountCredential *)self credentialItemsAtIndex:i];
        [v12 addCredentialItems:v7];
      }
    }
  }
  [v12 setCredentialType:self->_credentialType];
  if ([(ACProtobufAccountCredential *)self dirtyPropertiesCount])
  {
    [v12 clearDirtyProperties];
    unint64_t v8 = [(ACProtobufAccountCredential *)self dirtyPropertiesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ACProtobufAccountCredential *)self dirtyPropertiesAtIndex:j];
        [v12 addDirtyProperties:v11];
      }
    }
  }
  v12[32] = self->_requiresTouchID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_credentialItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addCredentialItems:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_credentialType copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_dirtyProperties;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
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
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addDirtyProperties:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  *(unsigned char *)(v5 + 32) = self->_requiresTouchID;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((credentialItems = self->_credentialItems, !((unint64_t)credentialItems | *((void *)v4 + 1)))
     || -[NSMutableArray isEqual:](credentialItems, "isEqual:"))
    && ((credentialType = self->_credentialType, !((unint64_t)credentialType | *((void *)v4 + 2)))
     || -[NSString isEqual:](credentialType, "isEqual:"))
    && ((dirtyProperties = self->_dirtyProperties, !((unint64_t)dirtyProperties | *((void *)v4 + 3)))
     || -[NSMutableArray isEqual:](dirtyProperties, "isEqual:")))
  {
    if (self->_requiresTouchID) {
      BOOL v8 = v4[32] != 0;
    }
    else {
      BOOL v8 = v4[32] == 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_credentialItems hash];
  NSUInteger v4 = [(NSString *)self->_credentialType hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_dirtyProperties hash] ^ (2654435761 * self->_requiresTouchID);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ACProtobufAccountCredential *)self addCredentialItems:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[ACProtobufAccountCredential setCredentialType:](self, "setCredentialType:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ACProtobufAccountCredential addDirtyProperties:](self, "addDirtyProperties:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  self->_requiresTouchID = *((unsigned char *)v4 + 32);
}

- (NSMutableArray)credentialItems
{
  return self->_credentialItems;
}

- (void)setCredentialItems:(id)a3
{
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(id)a3
{
}

- (NSMutableArray)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
}

- (BOOL)requiresTouchID
{
  return self->_requiresTouchID;
}

- (void)setRequiresTouchID:(BOOL)a3
{
  self->_requiresTouchID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);

  objc_storeStrong((id *)&self->_credentialItems, 0);
}

@end