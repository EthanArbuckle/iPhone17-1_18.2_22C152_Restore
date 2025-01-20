@interface FTCPPETInteraction
+ (Class)participantsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInbound;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)participants;
- (NSString)duration;
- (NSString)mechanism;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (unint64_t)timestamp;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(id)a3;
- (void)setIsInbound:(BOOL)a3;
- (void)setMechanism:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation FTCPPETInteraction

- (void)clearParticipants
{
}

- (void)addParticipants:(id)a3
{
  id v4 = a3;
  participants = self->_participants;
  id v8 = v4;
  if (!participants)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_participants;
    self->_participants = v6;

    id v4 = v8;
    participants = self->_participants;
  }
  [(NSMutableArray *)participants addObject:v4];
}

- (unint64_t)participantsCount
{
  return [(NSMutableArray *)self->_participants count];
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_participants objectAtIndex:a3];
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FTCPPETInteraction;
  id v4 = [(FTCPPETInteraction *)&v8 description];
  v5 = [(FTCPPETInteraction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_participants count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_participants, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_participants;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"participants"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestamp, (void)v16);
  [v3 setObject:v11 forKey:@"timestamp"];

  mechanism = self->_mechanism;
  if (mechanism) {
    [v3 setObject:mechanism forKey:@"mechanism"];
  }
  v13 = [NSNumber numberWithBool:self->_isInbound];
  [v3 setObject:v13 forKey:@"isInbound"];

  duration = self->_duration;
  if (duration) {
    [v3 setObject:duration forKey:@"duration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FTCPPETInteractionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_participants;
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

  PBDataWriterWriteUint64Field();
  if (!self->_mechanism) {
    -[FTCPPETInteraction writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (!self->_duration) {
    -[FTCPPETInteraction writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(FTCPPETInteraction *)self participantsCount])
  {
    [v8 clearParticipants];
    unint64_t v4 = [(FTCPPETInteraction *)self participantsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(FTCPPETInteraction *)self participantsAtIndex:i];
        [v8 addParticipants:v7];
      }
    }
  }
  *((void *)v8 + 1) = self->_timestamp;
  [v8 setMechanism:self->_mechanism];
  *((unsigned char *)v8 + 40) = self->_isInbound;
  [v8 setDuration:self->_duration];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_participants;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [(id)v5 addParticipants:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 8) = self->_timestamp;
  uint64_t v12 = [(NSString *)self->_mechanism copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  *(unsigned char *)(v5 + 40) = self->_isInbound;
  uint64_t v14 = [(NSString *)self->_duration copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  participants = self->_participants;
  if ((unint64_t)participants | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](participants, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (self->_timestamp != *((void *)v4 + 1)) {
    goto LABEL_12;
  }
  mechanism = self->_mechanism;
  if ((unint64_t)mechanism | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mechanism, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (self->_isInbound)
  {
    if (*((unsigned char *)v4 + 40)) {
      goto LABEL_9;
    }
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  if (*((unsigned char *)v4 + 40)) {
    goto LABEL_12;
  }
LABEL_9:
  duration = self->_duration;
  if ((unint64_t)duration | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](duration, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_participants hash];
  unint64_t v4 = 2654435761u * self->_timestamp;
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_mechanism hash] ^ (2654435761 * self->_isInbound);
  return v5 ^ [(NSString *)self->_duration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[FTCPPETInteraction addParticipants:](self, "addParticipants:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  self->_timestamp = *((void *)v4 + 1);
  if (*((void *)v4 + 3)) {
    -[FTCPPETInteraction setMechanism:](self, "setMechanism:");
  }
  self->_isInbound = *((unsigned char *)v4 + 40);
  if (*((void *)v4 + 2)) {
    -[FTCPPETInteraction setDuration:](self, "setDuration:");
  }
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(id)a3
{
}

- (BOOL)isInbound
{
  return self->_isInbound;
}

- (void)setIsInbound:(BOOL)a3
{
  self->_isInbound = a3;
}

- (NSString)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_mechanism, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[FTCPPETInteraction writeTo:]", "FTCPPETInteraction.m", 162, "nil != self->_mechanism");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[FTCPPETInteraction writeTo:]", "FTCPPETInteraction.m", 171, "nil != self->_duration");
}

@end