@interface HMMediaGroupProtoMediaParticipantData
+ (Class)backupGroupsType;
- (BOOL)hasDestination;
- (BOOL)hasDestinationController;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMMediaGroupProtoMediaDestination)destination;
- (HMMediaGroupProtoMediaDestinationControllerData)destinationController;
- (NSMutableArray)backupGroups;
- (id)backupGroupsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)backupGroupsCount;
- (unint64_t)hash;
- (void)addBackupGroups:(id)a3;
- (void)clearBackupGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackupGroups:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationController:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMMediaGroupProtoMediaParticipantData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationController, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_backupGroups, 0);
}

- (void)setBackupGroups:(id)a3
{
}

- (NSMutableArray)backupGroups
{
  return self->_backupGroups;
}

- (void)setDestinationController:(id)a3
{
}

- (HMMediaGroupProtoMediaDestinationControllerData)destinationController
{
  return self->_destinationController;
}

- (void)setDestination:(id)a3
{
}

- (HMMediaGroupProtoMediaDestination)destination
{
  return self->_destination;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  destination = self->_destination;
  uint64_t v6 = *((void *)v4 + 2);
  if (destination)
  {
    if (v6) {
      -[HMMediaGroupProtoMediaDestination mergeFrom:](destination, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HMMediaGroupProtoMediaParticipantData setDestination:](self, "setDestination:");
  }
  destinationController = self->_destinationController;
  uint64_t v8 = *((void *)v4 + 3);
  if (destinationController)
  {
    if (v8) {
      -[HMMediaGroupProtoMediaDestinationControllerData mergeFrom:](destinationController, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HMMediaGroupProtoMediaParticipantData setDestinationController:](self, "setDestinationController:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 1);
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
        -[HMMediaGroupProtoMediaParticipantData addBackupGroups:](self, "addBackupGroups:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMMediaGroupProtoMediaDestination *)self->_destination hash];
  unint64_t v4 = [(HMMediaGroupProtoMediaDestinationControllerData *)self->_destinationController hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_backupGroups hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((destination = self->_destination, !((unint64_t)destination | v4[2]))
     || -[HMMediaGroupProtoMediaDestination isEqual:](destination, "isEqual:"))
    && ((destinationController = self->_destinationController, !((unint64_t)destinationController | v4[3]))
     || -[HMMediaGroupProtoMediaDestinationControllerData isEqual:](destinationController, "isEqual:")))
  {
    backupGroups = self->_backupGroups;
    if ((unint64_t)backupGroups | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](backupGroups, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HMMediaGroupProtoMediaDestination *)self->_destination copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HMMediaGroupProtoMediaDestinationControllerData *)self->_destinationController copyWithZone:a3];
  id v9 = (void *)v5[3];
  v5[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_backupGroups;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addBackupGroups:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_destination) {
    objc_msgSend(v8, "setDestination:");
  }
  if (self->_destinationController) {
    objc_msgSend(v8, "setDestinationController:");
  }
  if ([(HMMediaGroupProtoMediaParticipantData *)self backupGroupsCount])
  {
    [v8 clearBackupGroups];
    unint64_t v4 = [(HMMediaGroupProtoMediaParticipantData *)self backupGroupsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        v7 = [(HMMediaGroupProtoMediaParticipantData *)self backupGroupsAtIndex:i];
        [v8 addBackupGroups:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_destination) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_destinationController) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_backupGroups;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaParticipantDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  destination = self->_destination;
  if (destination)
  {
    unint64_t v5 = [(HMMediaGroupProtoMediaDestination *)destination dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"destination"];
  }
  destinationController = self->_destinationController;
  if (destinationController)
  {
    uint64_t v7 = [(HMMediaGroupProtoMediaDestinationControllerData *)destinationController dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"destinationController"];
  }
  backupGroups = self->_backupGroups;
  if (backupGroups) {
    [v3 setObject:backupGroups forKey:@"backupGroups"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaParticipantData;
  id v4 = [(HMMediaGroupProtoMediaParticipantData *)&v8 description];
  unint64_t v5 = [(HMMediaGroupProtoMediaParticipantData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)backupGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_backupGroups objectAtIndex:a3];
}

- (unint64_t)backupGroupsCount
{
  return [(NSMutableArray *)self->_backupGroups count];
}

- (void)addBackupGroups:(id)a3
{
  id v4 = a3;
  backupGroups = self->_backupGroups;
  id v8 = v4;
  if (!backupGroups)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_backupGroups;
    self->_backupGroups = v6;

    id v4 = v8;
    backupGroups = self->_backupGroups;
  }
  [(NSMutableArray *)backupGroups addObject:v4];
}

- (void)clearBackupGroups
{
}

- (BOOL)hasDestinationController
{
  return self->_destinationController != 0;
}

- (BOOL)hasDestination
{
  return self->_destination != 0;
}

+ (Class)backupGroupsType
{
  return (Class)objc_opt_class();
}

@end