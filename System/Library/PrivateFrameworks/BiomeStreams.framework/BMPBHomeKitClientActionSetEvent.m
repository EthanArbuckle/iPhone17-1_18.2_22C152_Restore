@interface BMPBHomeKitClientActionSetEvent
+ (Class)associatedAccessoryUniqueIdentifiersType;
- (BMPBHomeKitClientBase)base;
- (BOOL)hasActionSetName;
- (BOOL)hasActionSetType;
- (BOOL)hasActionSetUniqueIdentifier;
- (BOOL)hasBase;
- (BOOL)hasHomeName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)associatedAccessoryUniqueIdentifiers;
- (NSString)actionSetName;
- (NSString)actionSetType;
- (NSString)actionSetUniqueIdentifier;
- (NSString)homeName;
- (id)associatedAccessoryUniqueIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)associatedAccessoryUniqueIdentifiersCount;
- (unint64_t)hash;
- (void)addAssociatedAccessoryUniqueIdentifiers:(id)a3;
- (void)clearAssociatedAccessoryUniqueIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionSetName:(id)a3;
- (void)setActionSetType:(id)a3;
- (void)setActionSetUniqueIdentifier:(id)a3;
- (void)setAssociatedAccessoryUniqueIdentifiers:(id)a3;
- (void)setBase:(id)a3;
- (void)setHomeName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBHomeKitClientActionSetEvent

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasActionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier != 0;
}

- (BOOL)hasActionSetType
{
  return self->_actionSetType != 0;
}

- (void)clearAssociatedAccessoryUniqueIdentifiers
{
}

- (void)addAssociatedAccessoryUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers;
  id v8 = v4;
  if (!associatedAccessoryUniqueIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_associatedAccessoryUniqueIdentifiers;
    self->_associatedAccessoryUniqueIdentifiers = v6;

    id v4 = v8;
    associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers;
  }
  [(NSMutableArray *)associatedAccessoryUniqueIdentifiers addObject:v4];
}

- (unint64_t)associatedAccessoryUniqueIdentifiersCount
{
  return [(NSMutableArray *)self->_associatedAccessoryUniqueIdentifiers count];
}

- (id)associatedAccessoryUniqueIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_associatedAccessoryUniqueIdentifiers objectAtIndex:a3];
}

+ (Class)associatedAccessoryUniqueIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasActionSetName
{
  return self->_actionSetName != 0;
}

- (BOOL)hasHomeName
{
  return self->_homeName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBHomeKitClientActionSetEvent;
  id v4 = [(BMPBHomeKitClientActionSetEvent *)&v8 description];
  v5 = [(BMPBHomeKitClientActionSetEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  base = self->_base;
  if (base)
  {
    v5 = [(BMPBHomeKitClientBase *)base dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"base"];
  }
  actionSetUniqueIdentifier = self->_actionSetUniqueIdentifier;
  if (actionSetUniqueIdentifier) {
    [v3 setObject:actionSetUniqueIdentifier forKey:@"actionSetUniqueIdentifier"];
  }
  actionSetType = self->_actionSetType;
  if (actionSetType) {
    [v3 setObject:actionSetType forKey:@"actionSetType"];
  }
  associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers;
  if (associatedAccessoryUniqueIdentifiers) {
    [v3 setObject:associatedAccessoryUniqueIdentifiers forKey:@"associatedAccessoryUniqueIdentifiers"];
  }
  actionSetName = self->_actionSetName;
  if (actionSetName) {
    [v3 setObject:actionSetName forKey:@"actionSetName"];
  }
  homeName = self->_homeName;
  if (homeName) {
    [v3 setObject:homeName forKey:@"homeName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHomeKitClientActionSetEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_actionSetUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionSetType) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_associatedAccessoryUniqueIdentifiers;
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

  if (self->_actionSetName) {
    PBDataWriterWriteStringField();
  }
  if (self->_homeName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_base) {
    objc_msgSend(v9, "setBase:");
  }
  if (self->_actionSetUniqueIdentifier) {
    objc_msgSend(v9, "setActionSetUniqueIdentifier:");
  }
  if (self->_actionSetType) {
    objc_msgSend(v9, "setActionSetType:");
  }
  if ([(BMPBHomeKitClientActionSetEvent *)self associatedAccessoryUniqueIdentifiersCount])
  {
    [v9 clearAssociatedAccessoryUniqueIdentifiers];
    unint64_t v4 = [(BMPBHomeKitClientActionSetEvent *)self associatedAccessoryUniqueIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BMPBHomeKitClientActionSetEvent *)self associatedAccessoryUniqueIdentifiersAtIndex:i];
        [v9 addAssociatedAccessoryUniqueIdentifiers:v7];
      }
    }
  }
  if (self->_actionSetName) {
    objc_msgSend(v9, "setActionSetName:");
  }
  uint64_t v8 = v9;
  if (self->_homeName)
  {
    objc_msgSend(v9, "setHomeName:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BMPBHomeKitClientBase *)self->_base copyWithZone:a3];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_actionSetUniqueIdentifier copyWithZone:a3];
  id v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_actionSetType copyWithZone:a3];
  long long v11 = (void *)v5[2];
  v5[2] = v10;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v12 = self->_associatedAccessoryUniqueIdentifiers;
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
        v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (void)v23);
        [v5 addAssociatedAccessoryUniqueIdentifiers:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_actionSetName copyWithZone:a3];
  v19 = (void *)v5[1];
  v5[1] = v18;

  uint64_t v20 = [(NSString *)self->_homeName copyWithZone:a3];
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((base = self->_base, !((unint64_t)base | v4[5])) || -[BMPBHomeKitClientBase isEqual:](base, "isEqual:"))
    && ((actionSetUniqueIdentifier = self->_actionSetUniqueIdentifier,
         !((unint64_t)actionSetUniqueIdentifier | v4[3]))
     || -[NSString isEqual:](actionSetUniqueIdentifier, "isEqual:"))
    && ((actionSetType = self->_actionSetType, !((unint64_t)actionSetType | v4[2]))
     || -[NSString isEqual:](actionSetType, "isEqual:"))
    && ((associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers,
         !((unint64_t)associatedAccessoryUniqueIdentifiers | v4[4]))
     || -[NSMutableArray isEqual:](associatedAccessoryUniqueIdentifiers, "isEqual:"))
    && ((actionSetName = self->_actionSetName, !((unint64_t)actionSetName | v4[1]))
     || -[NSString isEqual:](actionSetName, "isEqual:")))
  {
    homeName = self->_homeName;
    if ((unint64_t)homeName | v4[6]) {
      char v11 = -[NSString isEqual:](homeName, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BMPBHomeKitClientBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_actionSetUniqueIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_actionSetType hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_associatedAccessoryUniqueIdentifiers hash];
  NSUInteger v7 = [(NSString *)self->_actionSetName hash];
  return v6 ^ v7 ^ [(NSString *)self->_homeName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  base = self->_base;
  uint64_t v6 = *((void *)v4 + 5);
  if (base)
  {
    if (v6) {
      -[BMPBHomeKitClientBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BMPBHomeKitClientActionSetEvent setBase:](self, "setBase:");
  }
  if (*((void *)v4 + 3)) {
    -[BMPBHomeKitClientActionSetEvent setActionSetUniqueIdentifier:](self, "setActionSetUniqueIdentifier:");
  }
  if (*((void *)v4 + 2)) {
    -[BMPBHomeKitClientActionSetEvent setActionSetType:](self, "setActionSetType:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[BMPBHomeKitClientActionSetEvent addAssociatedAccessoryUniqueIdentifiers:](self, "addAssociatedAccessoryUniqueIdentifiers:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 1)) {
    -[BMPBHomeKitClientActionSetEvent setActionSetName:](self, "setActionSetName:");
  }
  if (*((void *)v4 + 6)) {
    -[BMPBHomeKitClientActionSetEvent setHomeName:](self, "setHomeName:");
  }
}

- (BMPBHomeKitClientBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (void)setActionSetUniqueIdentifier:(id)a3
{
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(id)a3
{
}

- (NSMutableArray)associatedAccessoryUniqueIdentifiers
{
  return self->_associatedAccessoryUniqueIdentifiers;
}

- (void)setAssociatedAccessoryUniqueIdentifiers:(id)a3
{
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (void)setActionSetName:(id)a3
{
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_associatedAccessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);

  objc_storeStrong((id *)&self->_actionSetName, 0);
}

@end