@interface ACProtobufCredentialItem
+ (Class)dirtyPropertiesType;
- (ACProtobufDate)expirationDate;
- (ACProtobufURL)objectID;
- (BOOL)hasExpirationDate;
- (BOOL)hasIsPersistent;
- (BOOL)hasObjectID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersistent;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)dirtyProperties;
- (NSString)accountIdentifier;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dirtyPropertiesAtIndex:(unint64_t)a3;
- (unint64_t)dirtyPropertiesCount;
- (unint64_t)hash;
- (void)addDirtyProperties:(id)a3;
- (void)clearDirtyProperties;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setDirtyProperties:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHasIsPersistent:(BOOL)a3;
- (void)setIsPersistent:(BOOL)a3;
- (void)setObjectID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufCredentialItem

- (BOOL)hasExpirationDate
{
  return self->_expirationDate != 0;
}

- (void)setIsPersistent:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isPersistent = a3;
}

- (void)setHasIsPersistent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPersistent
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasObjectID
{
  return self->_objectID != 0;
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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dirtyProperties;
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
  v8.super_class = (Class)ACProtobufCredentialItem;
  id v4 = [(ACProtobufCredentialItem *)&v8 description];
  v5 = [(ACProtobufCredentialItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v3 setObject:accountIdentifier forKey:@"accountIdentifier"];
  }
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    v7 = [(ACProtobufDate *)expirationDate dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"expirationDate"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v4 setObject:serviceName forKey:@"serviceName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_isPersistent];
    [v4 setObject:v9 forKey:@"isPersistent"];
  }
  objectID = self->_objectID;
  if (objectID)
  {
    v11 = [(ACProtobufURL *)objectID dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"objectID"];
  }
  dirtyProperties = self->_dirtyProperties;
  if (dirtyProperties) {
    [v4 setObject:dirtyProperties forKey:@"dirtyProperties"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufCredentialItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteStringField();
  if (self->_expirationDate) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_objectID) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_dirtyProperties;
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
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  [v8 setAccountIdentifier:self->_accountIdentifier];
  if (self->_expirationDate) {
    objc_msgSend(v8, "setExpirationDate:");
  }
  [v8 setServiceName:self->_serviceName];
  if (*(unsigned char *)&self->_has)
  {
    v8[48] = self->_isPersistent;
    v8[52] |= 1u;
  }
  if (self->_objectID) {
    objc_msgSend(v8, "setObjectID:");
  }
  if ([(ACProtobufCredentialItem *)self dirtyPropertiesCount])
  {
    [v8 clearDirtyProperties];
    unint64_t v4 = [(ACProtobufCredentialItem *)self dirtyPropertiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ACProtobufCredentialItem *)self dirtyPropertiesAtIndex:i];
        [v8 addDirtyProperties:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(ACProtobufDate *)self->_expirationDate copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_serviceName copyWithZone:a3];
  long long v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 48) = self->_isPersistent;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v12 = [(ACProtobufURL *)self->_objectID copyWithZone:a3];
  long long v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_dirtyProperties;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
        v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addDirtyProperties:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  expirationDate = self->_expirationDate;
  if ((unint64_t)expirationDate | *((void *)v4 + 3))
  {
    if (!-[ACProtobufDate isEqual:](expirationDate, "isEqual:")) {
      goto LABEL_20;
    }
  }
  serviceName = self->_serviceName;
  if ((unint64_t)serviceName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](serviceName, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_isPersistent)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_16;
      }
    }
LABEL_20:
    char v10 = 0;
    goto LABEL_21;
  }
  if (*((unsigned char *)v4 + 52)) {
    goto LABEL_20;
  }
LABEL_16:
  objectID = self->_objectID;
  if ((unint64_t)objectID | *((void *)v4 + 4) && !-[ACProtobufURL isEqual:](objectID, "isEqual:")) {
    goto LABEL_20;
  }
  dirtyProperties = self->_dirtyProperties;
  if ((unint64_t)dirtyProperties | *((void *)v4 + 2)) {
    char v10 = -[NSMutableArray isEqual:](dirtyProperties, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accountIdentifier hash];
  unint64_t v4 = [(ACProtobufDate *)self->_expirationDate hash];
  NSUInteger v5 = [(NSString *)self->_serviceName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_isPersistent;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(ACProtobufURL *)self->_objectID hash];
  return v7 ^ v8 ^ [(NSMutableArray *)self->_dirtyProperties hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[ACProtobufCredentialItem setAccountIdentifier:](self, "setAccountIdentifier:");
  }
  expirationDate = self->_expirationDate;
  uint64_t v6 = *((void *)v4 + 3);
  if (expirationDate)
  {
    if (v6) {
      -[ACProtobufDate mergeFrom:](expirationDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ACProtobufCredentialItem setExpirationDate:](self, "setExpirationDate:");
  }
  if (*((void *)v4 + 5)) {
    -[ACProtobufCredentialItem setServiceName:](self, "setServiceName:");
  }
  if (*((unsigned char *)v4 + 52))
  {
    self->_isPersistent = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 1u;
  }
  objectID = self->_objectID;
  uint64_t v8 = *((void *)v4 + 4);
  if (objectID)
  {
    if (v8) {
      -[ACProtobufURL mergeFrom:](objectID, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ACProtobufCredentialItem setObjectID:](self, "setObjectID:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 2);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[ACProtobufCredentialItem addDirtyProperties:](self, "addDirtyProperties:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (ACProtobufDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (ACProtobufURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (NSMutableArray)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end