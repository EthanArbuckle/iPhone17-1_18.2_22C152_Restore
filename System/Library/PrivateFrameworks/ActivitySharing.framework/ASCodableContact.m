@interface ASCodableContact
+ (Class)destinationsType;
- (ASCodableRelationshipContainer)relationshipContainer;
- (ASCodableRelationshipContainer)remoteRelationshipContainer;
- (ASCodableRelationshipStorage)relationshipStorage;
- (BOOL)hasFullName;
- (BOOL)hasLinkedContactStoreIdentifier;
- (BOOL)hasPendingLegacyShareLocations;
- (BOOL)hasPendingRelationshipShareItem;
- (BOOL)hasRelationshipContainer;
- (BOOL)hasRelationshipStorage;
- (BOOL)hasRemoteRelationshipContainer;
- (BOOL)hasShortName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)pendingLegacyShareLocations;
- (NSData)pendingRelationshipShareItem;
- (NSMutableArray)destinations;
- (NSString)fullName;
- (NSString)linkedContactStoreIdentifier;
- (NSString)shortName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)destinationsCount;
- (unint64_t)hash;
- (void)addDestinations:(id)a3;
- (void)clearDestinations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setFullName:(id)a3;
- (void)setLinkedContactStoreIdentifier:(id)a3;
- (void)setPendingLegacyShareLocations:(id)a3;
- (void)setPendingRelationshipShareItem:(id)a3;
- (void)setRelationshipContainer:(id)a3;
- (void)setRelationshipStorage:(id)a3;
- (void)setRemoteRelationshipContainer:(id)a3;
- (void)setShortName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableContact

- (BOOL)hasLinkedContactStoreIdentifier
{
  return self->_linkedContactStoreIdentifier != 0;
}

- (BOOL)hasFullName
{
  return self->_fullName != 0;
}

- (BOOL)hasShortName
{
  return self->_shortName != 0;
}

- (void)clearDestinations
{
}

- (void)addDestinations:(id)a3
{
  id v4 = a3;
  destinations = self->_destinations;
  id v8 = v4;
  if (!destinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_destinations;
    self->_destinations = v6;

    id v4 = v8;
    destinations = self->_destinations;
  }
  [(NSMutableArray *)destinations addObject:v4];
}

- (unint64_t)destinationsCount
{
  return [(NSMutableArray *)self->_destinations count];
}

- (id)destinationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_destinations objectAtIndex:a3];
}

+ (Class)destinationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRelationshipContainer
{
  return self->_relationshipContainer != 0;
}

- (BOOL)hasRemoteRelationshipContainer
{
  return self->_remoteRelationshipContainer != 0;
}

- (BOOL)hasPendingRelationshipShareItem
{
  return self->_pendingRelationshipShareItem != 0;
}

- (BOOL)hasPendingLegacyShareLocations
{
  return self->_pendingLegacyShareLocations != 0;
}

- (BOOL)hasRelationshipStorage
{
  return self->_relationshipStorage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableContact;
  id v4 = [(ASCodableContact *)&v8 description];
  v5 = [(ASCodableContact *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  linkedContactStoreIdentifier = self->_linkedContactStoreIdentifier;
  if (linkedContactStoreIdentifier) {
    [v3 setObject:linkedContactStoreIdentifier forKey:@"linkedContactStoreIdentifier"];
  }
  fullName = self->_fullName;
  if (fullName) {
    [v4 setObject:fullName forKey:@"fullName"];
  }
  shortName = self->_shortName;
  if (shortName) {
    [v4 setObject:shortName forKey:@"shortName"];
  }
  destinations = self->_destinations;
  if (destinations) {
    [v4 setObject:destinations forKey:@"destinations"];
  }
  relationshipContainer = self->_relationshipContainer;
  if (relationshipContainer)
  {
    v10 = [(ASCodableRelationshipContainer *)relationshipContainer dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"relationshipContainer"];
  }
  remoteRelationshipContainer = self->_remoteRelationshipContainer;
  if (remoteRelationshipContainer)
  {
    v12 = [(ASCodableRelationshipContainer *)remoteRelationshipContainer dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"remoteRelationshipContainer"];
  }
  pendingRelationshipShareItem = self->_pendingRelationshipShareItem;
  if (pendingRelationshipShareItem) {
    [v4 setObject:pendingRelationshipShareItem forKey:@"pendingRelationshipShareItem"];
  }
  pendingLegacyShareLocations = self->_pendingLegacyShareLocations;
  if (pendingLegacyShareLocations) {
    [v4 setObject:pendingLegacyShareLocations forKey:@"pendingLegacyShareLocations"];
  }
  relationshipStorage = self->_relationshipStorage;
  if (relationshipStorage)
  {
    v16 = [(ASCodableRelationshipStorage *)relationshipStorage dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"relationshipStorage"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableContactReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_linkedContactStoreIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_fullName) {
    PBDataWriterWriteStringField();
  }
  if (self->_shortName) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_destinations;
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

  if (self->_relationshipContainer) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_remoteRelationshipContainer) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_pendingRelationshipShareItem) {
    PBDataWriterWriteDataField();
  }
  if (self->_pendingLegacyShareLocations) {
    PBDataWriterWriteDataField();
  }
  if (self->_relationshipStorage) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_linkedContactStoreIdentifier) {
    objc_msgSend(v9, "setLinkedContactStoreIdentifier:");
  }
  if (self->_fullName) {
    objc_msgSend(v9, "setFullName:");
  }
  if (self->_shortName) {
    objc_msgSend(v9, "setShortName:");
  }
  if ([(ASCodableContact *)self destinationsCount])
  {
    [v9 clearDestinations];
    unint64_t v4 = [(ASCodableContact *)self destinationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ASCodableContact *)self destinationsAtIndex:i];
        [v9 addDestinations:v7];
      }
    }
  }
  if (self->_relationshipContainer) {
    objc_msgSend(v9, "setRelationshipContainer:");
  }
  uint64_t v8 = v9;
  if (self->_remoteRelationshipContainer)
  {
    objc_msgSend(v9, "setRemoteRelationshipContainer:");
    uint64_t v8 = v9;
  }
  if (self->_pendingRelationshipShareItem)
  {
    objc_msgSend(v9, "setPendingRelationshipShareItem:");
    uint64_t v8 = v9;
  }
  if (self->_pendingLegacyShareLocations)
  {
    objc_msgSend(v9, "setPendingLegacyShareLocations:");
    uint64_t v8 = v9;
  }
  if (self->_relationshipStorage)
  {
    objc_msgSend(v9, "setRelationshipStorage:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_linkedContactStoreIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_fullName copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_shortName copyWithZone:a3];
  long long v11 = (void *)v5[9];
  v5[9] = v10;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v12 = self->_destinations;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
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
        v17 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v16), "copyWithZone:", a3, (void)v29);
        [v5 addDestinations:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  id v18 = [(ASCodableRelationshipContainer *)self->_relationshipContainer copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  id v20 = [(ASCodableRelationshipContainer *)self->_remoteRelationshipContainer copyWithZone:a3];
  v21 = (void *)v5[8];
  v5[8] = v20;

  uint64_t v22 = [(NSData *)self->_pendingRelationshipShareItem copyWithZone:a3];
  v23 = (void *)v5[5];
  v5[5] = v22;

  uint64_t v24 = [(NSData *)self->_pendingLegacyShareLocations copyWithZone:a3];
  v25 = (void *)v5[4];
  v5[4] = v24;

  id v26 = [(ASCodableRelationshipStorage *)self->_relationshipStorage copyWithZone:a3];
  v27 = (void *)v5[7];
  v5[7] = v26;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  linkedContactStoreIdentifier = self->_linkedContactStoreIdentifier;
  if ((unint64_t)linkedContactStoreIdentifier | v4[3])
  {
    if (!-[NSString isEqual:](linkedContactStoreIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (((fullName = self->_fullName, !((unint64_t)fullName | v4[2]))
     || -[NSString isEqual:](fullName, "isEqual:"))
    && ((shortName = self->_shortName, !((unint64_t)shortName | v4[9]))
     || -[NSString isEqual:](shortName, "isEqual:"))
    && ((destinations = self->_destinations, !((unint64_t)destinations | v4[1]))
     || -[NSMutableArray isEqual:](destinations, "isEqual:"))
    && ((relationshipContainer = self->_relationshipContainer, !((unint64_t)relationshipContainer | v4[6]))
     || -[ASCodableRelationshipContainer isEqual:](relationshipContainer, "isEqual:"))
    && ((remoteRelationshipContainer = self->_remoteRelationshipContainer,
         !((unint64_t)remoteRelationshipContainer | v4[8]))
     || -[ASCodableRelationshipContainer isEqual:](remoteRelationshipContainer, "isEqual:"))
    && ((pendingRelationshipShareItem = self->_pendingRelationshipShareItem,
         !((unint64_t)pendingRelationshipShareItem | v4[5]))
     || -[NSData isEqual:](pendingRelationshipShareItem, "isEqual:"))
    && ((pendingLegacyShareLocations = self->_pendingLegacyShareLocations,
         !((unint64_t)pendingLegacyShareLocations | v4[4]))
     || -[NSData isEqual:](pendingLegacyShareLocations, "isEqual:")))
  {
    relationshipStorage = self->_relationshipStorage;
    if ((unint64_t)relationshipStorage | v4[7]) {
      char v14 = -[ASCodableRelationshipStorage isEqual:](relationshipStorage, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
LABEL_20:
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_linkedContactStoreIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_fullName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_shortName hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_destinations hash];
  unint64_t v7 = [(ASCodableRelationshipContainer *)self->_relationshipContainer hash];
  unint64_t v8 = v7 ^ [(ASCodableRelationshipContainer *)self->_remoteRelationshipContainer hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSData *)self->_pendingRelationshipShareItem hash];
  uint64_t v10 = [(NSData *)self->_pendingLegacyShareLocations hash];
  return v9 ^ v10 ^ [(ASCodableRelationshipStorage *)self->_relationshipStorage hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[ASCodableContact setLinkedContactStoreIdentifier:](self, "setLinkedContactStoreIdentifier:");
  }
  if (*((void *)v4 + 2)) {
    -[ASCodableContact setFullName:](self, "setFullName:");
  }
  if (*((void *)v4 + 9)) {
    -[ASCodableContact setShortName:](self, "setShortName:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ASCodableContact addDestinations:](self, "addDestinations:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  relationshipContainer = self->_relationshipContainer;
  uint64_t v11 = *((void *)v4 + 6);
  if (relationshipContainer)
  {
    if (v11) {
      -[ASCodableRelationshipContainer mergeFrom:](relationshipContainer, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[ASCodableContact setRelationshipContainer:](self, "setRelationshipContainer:");
  }
  remoteRelationshipContainer = self->_remoteRelationshipContainer;
  uint64_t v13 = *((void *)v4 + 8);
  if (remoteRelationshipContainer)
  {
    if (v13) {
      -[ASCodableRelationshipContainer mergeFrom:](remoteRelationshipContainer, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[ASCodableContact setRemoteRelationshipContainer:](self, "setRemoteRelationshipContainer:");
  }
  if (*((void *)v4 + 5)) {
    -[ASCodableContact setPendingRelationshipShareItem:](self, "setPendingRelationshipShareItem:");
  }
  if (*((void *)v4 + 4)) {
    -[ASCodableContact setPendingLegacyShareLocations:](self, "setPendingLegacyShareLocations:");
  }
  relationshipStorage = self->_relationshipStorage;
  uint64_t v15 = *((void *)v4 + 7);
  if (relationshipStorage)
  {
    if (v15) {
      -[ASCodableRelationshipStorage mergeFrom:](relationshipStorage, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[ASCodableContact setRelationshipStorage:](self, "setRelationshipStorage:");
  }
}

- (NSString)linkedContactStoreIdentifier
{
  return self->_linkedContactStoreIdentifier;
}

- (void)setLinkedContactStoreIdentifier:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void)setShortName:(id)a3
{
}

- (NSMutableArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (ASCodableRelationshipContainer)relationshipContainer
{
  return self->_relationshipContainer;
}

- (void)setRelationshipContainer:(id)a3
{
}

- (ASCodableRelationshipContainer)remoteRelationshipContainer
{
  return self->_remoteRelationshipContainer;
}

- (void)setRemoteRelationshipContainer:(id)a3
{
}

- (NSData)pendingRelationshipShareItem
{
  return self->_pendingRelationshipShareItem;
}

- (void)setPendingRelationshipShareItem:(id)a3
{
}

- (NSData)pendingLegacyShareLocations
{
  return self->_pendingLegacyShareLocations;
}

- (void)setPendingLegacyShareLocations:(id)a3
{
}

- (ASCodableRelationshipStorage)relationshipStorage
{
  return self->_relationshipStorage;
}

- (void)setRelationshipStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipContainer, 0);
  objc_storeStrong((id *)&self->_relationshipStorage, 0);
  objc_storeStrong((id *)&self->_relationshipContainer, 0);
  objc_storeStrong((id *)&self->_pendingRelationshipShareItem, 0);
  objc_storeStrong((id *)&self->_pendingLegacyShareLocations, 0);
  objc_storeStrong((id *)&self->_linkedContactStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_fullName, 0);

  objc_storeStrong((id *)&self->_destinations, 0);
}

@end