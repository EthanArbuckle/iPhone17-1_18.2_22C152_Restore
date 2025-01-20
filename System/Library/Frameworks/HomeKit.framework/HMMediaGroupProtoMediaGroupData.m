@interface HMMediaGroupProtoMediaGroupData
+ (Class)destinationIdentifiersType;
- (BOOL)hasAssociatedGroupIdentifier;
- (BOOL)hasGroupRole;
- (BOOL)hasIdentifier;
- (BOOL)hasIsDefaultName;
- (BOOL)hasName;
- (BOOL)hasParentIdentifier;
- (BOOL)isDefaultName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMMediaGroupProtoMediaGroupRole)groupRole;
- (NSMutableArray)destinationIdentifiers;
- (NSString)associatedGroupIdentifier;
- (NSString)identifier;
- (NSString)name;
- (NSString)parentIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationIdentifiersAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)destinationIdentifiersCount;
- (unint64_t)hash;
- (void)addDestinationIdentifiers:(id)a3;
- (void)clearDestinationIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedGroupIdentifier:(id)a3;
- (void)setDestinationIdentifiers:(id)a3;
- (void)setGroupRole:(id)a3;
- (void)setHasIsDefaultName:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsDefaultName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setParentIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMMediaGroupProtoMediaGroupData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupRole, 0);
  objc_storeStrong((id *)&self->_destinationIdentifiers, 0);

  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
}

- (BOOL)isDefaultName
{
  return self->_isDefaultName;
}

- (void)setGroupRole:(id)a3
{
}

- (HMMediaGroupProtoMediaGroupRole)groupRole
{
  return self->_groupRole;
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
}

- (NSString)associatedGroupIdentifier
{
  return self->_associatedGroupIdentifier;
}

- (void)setDestinationIdentifiers:(id)a3
{
}

- (NSMutableArray)destinationIdentifiers
{
  return self->_destinationIdentifiers;
}

- (void)setParentIdentifier:(id)a3
{
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[HMMediaGroupProtoMediaGroupData setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 5)) {
    -[HMMediaGroupProtoMediaGroupData setName:](self, "setName:");
  }
  if (*((void *)v4 + 6)) {
    -[HMMediaGroupProtoMediaGroupData setParentIdentifier:](self, "setParentIdentifier:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HMMediaGroupProtoMediaGroupData addDestinationIdentifiers:](self, "addDestinationIdentifiers:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 1)) {
    -[HMMediaGroupProtoMediaGroupData setAssociatedGroupIdentifier:](self, "setAssociatedGroupIdentifier:");
  }
  groupRole = self->_groupRole;
  uint64_t v11 = *((void *)v4 + 3);
  if (groupRole)
  {
    if (v11) {
      -[HMMediaGroupProtoMediaGroupRole mergeFrom:](groupRole, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[HMMediaGroupProtoMediaGroupData setGroupRole:](self, "setGroupRole:");
  }
  if (*((unsigned char *)v4 + 60))
  {
    self->_isDefaultName = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_name hash];
  NSUInteger v5 = [(NSString *)self->_parentIdentifier hash];
  uint64_t v6 = [(NSMutableArray *)self->_destinationIdentifiers hash];
  NSUInteger v7 = [(NSString *)self->_associatedGroupIdentifier hash];
  unint64_t v8 = [(HMMediaGroupProtoMediaGroupRole *)self->_groupRole hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_isDefaultName;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_16;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_16;
    }
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:")) {
      goto LABEL_16;
    }
  }
  destinationIdentifiers = self->_destinationIdentifiers;
  if ((unint64_t)destinationIdentifiers | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](destinationIdentifiers, "isEqual:")) {
      goto LABEL_16;
    }
  }
  associatedGroupIdentifier = self->_associatedGroupIdentifier;
  if ((unint64_t)associatedGroupIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](associatedGroupIdentifier, "isEqual:")) {
      goto LABEL_16;
    }
  }
  groupRole = self->_groupRole;
  if ((unint64_t)groupRole | *((void *)v4 + 3))
  {
    if (!-[HMMediaGroupProtoMediaGroupRole isEqual:](groupRole, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0)
    {
LABEL_16:
      BOOL v11 = 0;
      goto LABEL_17;
    }
    if (self->_isDefaultName)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_16;
    }
    BOOL v11 = 1;
  }
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_parentIdentifier copyWithZone:a3];
  BOOL v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v12 = self->_destinationIdentifiers;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (void)v23);
        [(id)v5 addDestinationIdentifiers:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_associatedGroupIdentifier copyWithZone:a3];
  v19 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v18;

  id v20 = [(HMMediaGroupProtoMediaGroupRole *)self->_groupRole copyWithZone:a3];
  v21 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v20;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 56) = self->_isDefaultName;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_identifier) {
    objc_msgSend(v9, "setIdentifier:");
  }
  if (self->_name) {
    objc_msgSend(v9, "setName:");
  }
  if (self->_parentIdentifier) {
    objc_msgSend(v9, "setParentIdentifier:");
  }
  if ([(HMMediaGroupProtoMediaGroupData *)self destinationIdentifiersCount])
  {
    [v9 clearDestinationIdentifiers];
    unint64_t v4 = [(HMMediaGroupProtoMediaGroupData *)self destinationIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        NSUInteger v7 = [(HMMediaGroupProtoMediaGroupData *)self destinationIdentifiersAtIndex:i];
        [v9 addDestinationIdentifiers:v7];
      }
    }
  }
  if (self->_associatedGroupIdentifier) {
    objc_msgSend(v9, "setAssociatedGroupIdentifier:");
  }
  uint64_t v8 = v9;
  if (self->_groupRole)
  {
    objc_msgSend(v9, "setGroupRole:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[56] = self->_isDefaultName;
    v8[60] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_destinationIdentifiers;
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

  if (self->_associatedGroupIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupRole) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaGroupDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier) {
    [v4 setObject:parentIdentifier forKey:@"parentIdentifier"];
  }
  destinationIdentifiers = self->_destinationIdentifiers;
  if (destinationIdentifiers) {
    [v4 setObject:destinationIdentifiers forKey:@"destinationIdentifiers"];
  }
  associatedGroupIdentifier = self->_associatedGroupIdentifier;
  if (associatedGroupIdentifier) {
    [v4 setObject:associatedGroupIdentifier forKey:@"associatedGroupIdentifier"];
  }
  groupRole = self->_groupRole;
  if (groupRole)
  {
    long long v11 = [(HMMediaGroupProtoMediaGroupRole *)groupRole dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"groupRole"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v12 = [NSNumber numberWithBool:self->_isDefaultName];
    [v4 setObject:v12 forKey:@"isDefaultName"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaGroupData;
  id v4 = [(HMMediaGroupProtoMediaGroupData *)&v8 description];
  unint64_t v5 = [(HMMediaGroupProtoMediaGroupData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsDefaultName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsDefaultName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsDefaultName:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isDefaultName = a3;
}

- (BOOL)hasGroupRole
{
  return self->_groupRole != 0;
}

- (BOOL)hasAssociatedGroupIdentifier
{
  return self->_associatedGroupIdentifier != 0;
}

- (id)destinationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_destinationIdentifiers objectAtIndex:a3];
}

- (unint64_t)destinationIdentifiersCount
{
  return [(NSMutableArray *)self->_destinationIdentifiers count];
}

- (void)addDestinationIdentifiers:(id)a3
{
  id v4 = a3;
  destinationIdentifiers = self->_destinationIdentifiers;
  id v8 = v4;
  if (!destinationIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_destinationIdentifiers;
    self->_destinationIdentifiers = v6;

    id v4 = v8;
    destinationIdentifiers = self->_destinationIdentifiers;
  }
  [(NSMutableArray *)destinationIdentifiers addObject:v4];
}

- (void)clearDestinationIdentifiers
{
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

+ (Class)destinationIdentifiersType
{
  return (Class)objc_opt_class();
}

@end