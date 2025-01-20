@interface MSPGroupSessionStorage
+ (Class)liveStrategyIdentifierType;
+ (Class)messageStrategyIdentifierType;
+ (Class)minimalStrategyIdentifierType;
+ (Class)smsStrategyIdentifierType;
+ (id)groupStorageWithIdentifier:(id)a3 originator:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6;
- (BOOL)hasFromID;
- (BOOL)hasGroupIdentifier;
- (BOOL)hasLastUpdateTimestamp;
- (BOOL)hasOriginatorIdentifier;
- (BOOL)hasReceivingAccountIdentifier;
- (BOOL)hasReceivingHandle;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSharedNavState)state;
- (NSMutableArray)liveStrategyIdentifiers;
- (NSMutableArray)messageStrategyIdentifiers;
- (NSMutableArray)minimalStrategyIdentifiers;
- (NSMutableArray)smsStrategyIdentifiers;
- (NSString)fromID;
- (NSString)groupIdentifier;
- (NSString)originatorIdentifier;
- (NSString)receivingAccountIdentifier;
- (NSString)receivingHandle;
- (PBUnknownFields)unknownFields;
- (double)lastUpdateTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)liveStrategyIdentifierAtIndex:(unint64_t)a3;
- (id)messageStrategyIdentifierAtIndex:(unint64_t)a3;
- (id)minimalStrategyIdentifierAtIndex:(unint64_t)a3;
- (id)smsStrategyIdentifierAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)liveStrategyIdentifiersCount;
- (unint64_t)messageStrategyIdentifiersCount;
- (unint64_t)minimalStrategyIdentifiersCount;
- (unint64_t)smsStrategyIdentifiersCount;
- (void)addLiveStrategyIdentifier:(id)a3;
- (void)addMessageStrategyIdentifier:(id)a3;
- (void)addMinimalStrategyIdentifier:(id)a3;
- (void)addSmsStrategyIdentifier:(id)a3;
- (void)clearLiveStrategyIdentifiers;
- (void)clearMessageStrategyIdentifiers;
- (void)clearMinimalStrategyIdentifiers;
- (void)clearSmsStrategyIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFromID:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHasLastUpdateTimestamp:(BOOL)a3;
- (void)setLastUpdateTimestamp:(double)a3;
- (void)setLiveStrategyIdentifiers:(id)a3;
- (void)setMessageStrategyIdentifiers:(id)a3;
- (void)setMinimalStrategyIdentifiers:(id)a3;
- (void)setOriginatorIdentifier:(id)a3;
- (void)setReceivingAccountIdentifier:(id)a3;
- (void)setReceivingHandle:(id)a3;
- (void)setSmsStrategyIdentifiers:(id)a3;
- (void)setState:(id)a3;
- (void)updateWithState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPGroupSessionStorage

+ (id)groupStorageWithIdentifier:(id)a3 originator:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6
{
  v6 = 0;
  if (a3 && a4)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    v14 = [v12 componentsSeparatedByString:@":"];
    v15 = [v14 lastObject];
    v6 = objc_alloc_init(MSPGroupSessionStorage);
    [(MSPGroupSessionStorage *)v6 setOriginatorIdentifier:v15];
    [(MSPGroupSessionStorage *)v6 setFromID:v12];

    [(MSPGroupSessionStorage *)v6 setReceivingHandle:v11];
    [(MSPGroupSessionStorage *)v6 setReceivingAccountIdentifier:v10];

    [(MSPGroupSessionStorage *)v6 setGroupIdentifier:v13];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[MSPGroupSessionStorage setLastUpdateTimestamp:](v6, "setLastUpdateTimestamp:");
    id v16 = objc_alloc_init(MEMORY[0x1E4F64A38]);
    [(MSPGroupSessionStorage *)v6 setState:v16];
  }

  return v6;
}

- (void)updateWithState:(id)a3
{
  id v5 = a3;
  if ([(MSPGroupSessionStorage *)self hasState])
  {
    v4 = [(MSPGroupSessionStorage *)self state];
    [v4 merge:v5];
  }
  else
  {
    [(MSPGroupSessionStorage *)self setState:v5];
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[MSPGroupSessionStorage setLastUpdateTimestamp:](self, "setLastUpdateTimestamp:");
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (BOOL)hasOriginatorIdentifier
{
  return self->_originatorIdentifier != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (void)setLastUpdateTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastUpdateTimestamp = a3;
}

- (void)setHasLastUpdateTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastUpdateTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFromID
{
  return self->_fromID != 0;
}

- (void)clearMinimalStrategyIdentifiers
{
}

- (void)addMinimalStrategyIdentifier:(id)a3
{
  id v4 = a3;
  minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  id v8 = v4;
  if (!minimalStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_minimalStrategyIdentifiers;
    self->_minimalStrategyIdentifiers = v6;

    id v4 = v8;
    minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  }
  [(NSMutableArray *)minimalStrategyIdentifiers addObject:v4];
}

- (unint64_t)minimalStrategyIdentifiersCount
{
  return [(NSMutableArray *)self->_minimalStrategyIdentifiers count];
}

- (id)minimalStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_minimalStrategyIdentifiers objectAtIndex:a3];
}

+ (Class)minimalStrategyIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)clearLiveStrategyIdentifiers
{
}

- (void)addLiveStrategyIdentifier:(id)a3
{
  id v4 = a3;
  liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  id v8 = v4;
  if (!liveStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_liveStrategyIdentifiers;
    self->_liveStrategyIdentifiers = v6;

    id v4 = v8;
    liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  }
  [(NSMutableArray *)liveStrategyIdentifiers addObject:v4];
}

- (unint64_t)liveStrategyIdentifiersCount
{
  return [(NSMutableArray *)self->_liveStrategyIdentifiers count];
}

- (id)liveStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_liveStrategyIdentifiers objectAtIndex:a3];
}

+ (Class)liveStrategyIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)clearMessageStrategyIdentifiers
{
}

- (void)addMessageStrategyIdentifier:(id)a3
{
  id v4 = a3;
  messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  id v8 = v4;
  if (!messageStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_messageStrategyIdentifiers;
    self->_messageStrategyIdentifiers = v6;

    id v4 = v8;
    messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  }
  [(NSMutableArray *)messageStrategyIdentifiers addObject:v4];
}

- (unint64_t)messageStrategyIdentifiersCount
{
  return [(NSMutableArray *)self->_messageStrategyIdentifiers count];
}

- (id)messageStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messageStrategyIdentifiers objectAtIndex:a3];
}

+ (Class)messageStrategyIdentifierType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReceivingHandle
{
  return self->_receivingHandle != 0;
}

- (BOOL)hasReceivingAccountIdentifier
{
  return self->_receivingAccountIdentifier != 0;
}

- (void)clearSmsStrategyIdentifiers
{
}

- (void)addSmsStrategyIdentifier:(id)a3
{
  id v4 = a3;
  smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  id v8 = v4;
  if (!smsStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_smsStrategyIdentifiers;
    self->_smsStrategyIdentifiers = v6;

    id v4 = v8;
    smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  }
  [(NSMutableArray *)smsStrategyIdentifiers addObject:v4];
}

- (unint64_t)smsStrategyIdentifiersCount
{
  return [(NSMutableArray *)self->_smsStrategyIdentifiers count];
}

- (id)smsStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_smsStrategyIdentifiers objectAtIndex:a3];
}

+ (Class)smsStrategyIdentifierType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPGroupSessionStorage;
  id v4 = [(MSPGroupSessionStorage *)&v8 description];
  id v5 = [(MSPGroupSessionStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier) {
    [v3 setObject:groupIdentifier forKey:@"groupIdentifier"];
  }
  originatorIdentifier = self->_originatorIdentifier;
  if (originatorIdentifier) {
    [v4 setObject:originatorIdentifier forKey:@"originatorIdentifier"];
  }
  state = self->_state;
  if (state)
  {
    objc_super v8 = [(GEOSharedNavState *)state dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"state"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithDouble:self->_lastUpdateTimestamp];
    [v4 setObject:v9 forKey:@"last_update_timestamp"];
  }
  fromID = self->_fromID;
  if (fromID) {
    [v4 setObject:fromID forKey:@"fromID"];
  }
  minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  if (minimalStrategyIdentifiers) {
    [v4 setObject:minimalStrategyIdentifiers forKey:@"minimalStrategyIdentifier"];
  }
  liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  if (liveStrategyIdentifiers) {
    [v4 setObject:liveStrategyIdentifiers forKey:@"liveStrategyIdentifier"];
  }
  messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  if (messageStrategyIdentifiers) {
    [v4 setObject:messageStrategyIdentifiers forKey:@"messageStrategyIdentifier"];
  }
  receivingHandle = self->_receivingHandle;
  if (receivingHandle) {
    [v4 setObject:receivingHandle forKey:@"receivingHandle"];
  }
  receivingAccountIdentifier = self->_receivingAccountIdentifier;
  if (receivingAccountIdentifier) {
    [v4 setObject:receivingAccountIdentifier forKey:@"receivingAccountIdentifier"];
  }
  smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  if (smsStrategyIdentifiers) {
    [v4 setObject:smsStrategyIdentifiers forKey:@"smsStrategyIdentifier"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v18 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPGroupSessionStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_groupIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_originatorIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_state) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_fromID) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = self->_minimalStrategyIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = self->_liveStrategyIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_messageStrategyIdentifiers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  if (self->_receivingHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_receivingAccountIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_smsStrategyIdentifiers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v25);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v21 = v4;
  if (self->_groupIdentifier)
  {
    objc_msgSend(v4, "setGroupIdentifier:");
    id v4 = v21;
  }
  if (self->_originatorIdentifier)
  {
    objc_msgSend(v21, "setOriginatorIdentifier:");
    id v4 = v21;
  }
  if (self->_state)
  {
    objc_msgSend(v21, "setState:");
    id v4 = v21;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 2) = *(void *)&self->_lastUpdateTimestamp;
    *((unsigned char *)v4 + 104) |= 1u;
  }
  if (self->_fromID) {
    objc_msgSend(v21, "setFromID:");
  }
  if ([(MSPGroupSessionStorage *)self minimalStrategyIdentifiersCount])
  {
    [v21 clearMinimalStrategyIdentifiers];
    unint64_t v5 = [(MSPGroupSessionStorage *)self minimalStrategyIdentifiersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(MSPGroupSessionStorage *)self minimalStrategyIdentifierAtIndex:i];
        [v21 addMinimalStrategyIdentifier:v8];
      }
    }
  }
  if ([(MSPGroupSessionStorage *)self liveStrategyIdentifiersCount])
  {
    [v21 clearLiveStrategyIdentifiers];
    unint64_t v9 = [(MSPGroupSessionStorage *)self liveStrategyIdentifiersCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(MSPGroupSessionStorage *)self liveStrategyIdentifierAtIndex:j];
        [v21 addLiveStrategyIdentifier:v12];
      }
    }
  }
  if ([(MSPGroupSessionStorage *)self messageStrategyIdentifiersCount])
  {
    [v21 clearMessageStrategyIdentifiers];
    unint64_t v13 = [(MSPGroupSessionStorage *)self messageStrategyIdentifiersCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(MSPGroupSessionStorage *)self messageStrategyIdentifierAtIndex:k];
        [v21 addMessageStrategyIdentifier:v16];
      }
    }
  }
  if (self->_receivingHandle) {
    objc_msgSend(v21, "setReceivingHandle:");
  }
  if (self->_receivingAccountIdentifier) {
    objc_msgSend(v21, "setReceivingAccountIdentifier:");
  }
  if ([(MSPGroupSessionStorage *)self smsStrategyIdentifiersCount])
  {
    [v21 clearSmsStrategyIdentifiers];
    unint64_t v17 = [(MSPGroupSessionStorage *)self smsStrategyIdentifiersCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(MSPGroupSessionStorage *)self smsStrategyIdentifierAtIndex:m];
        [v21 addSmsStrategyIdentifier:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_groupIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_originatorIdentifier copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(GEOSharedNavState *)self->_state copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 16) = self->_lastUpdateTimestamp;
    *(unsigned char *)(v5 + 104) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_fromID copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  unint64_t v14 = self->_minimalStrategyIdentifiers;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v56 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addMinimalStrategyIdentifier:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v16);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v20 = self->_liveStrategyIdentifiers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addLiveStrategyIdentifier:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v22);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v26 = self->_messageStrategyIdentifiers;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v48 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addMessageStrategyIdentifier:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v28);
  }

  uint64_t v32 = [(NSString *)self->_receivingHandle copyWithZone:a3];
  long long v33 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v32;

  uint64_t v34 = [(NSString *)self->_receivingAccountIdentifier copyWithZone:a3];
  long long v35 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v34;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v36 = self->_smsStrategyIdentifiers;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * m), "copyWithZone:", a3, (void)v43);
        [(id)v5 addSmsStrategyIdentifier:v41];
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v38);
  }

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:")) {
      goto LABEL_27;
    }
  }
  originatorIdentifier = self->_originatorIdentifier;
  if ((unint64_t)originatorIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](originatorIdentifier, "isEqual:")) {
      goto LABEL_27;
    }
  }
  state = self->_state;
  if ((unint64_t)state | *((void *)v4 + 12))
  {
    if (!-[GEOSharedNavState isEqual:](state, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_lastUpdateTimestamp != *((double *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
LABEL_27:
    char v15 = 0;
    goto LABEL_28;
  }
  fromID = self->_fromID;
  if ((unint64_t)fromID | *((void *)v4 + 3) && !-[NSString isEqual:](fromID, "isEqual:")) {
    goto LABEL_27;
  }
  minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  if ((unint64_t)minimalStrategyIdentifiers | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](minimalStrategyIdentifiers, "isEqual:")) {
      goto LABEL_27;
    }
  }
  liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  if ((unint64_t)liveStrategyIdentifiers | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](liveStrategyIdentifiers, "isEqual:")) {
      goto LABEL_27;
    }
  }
  messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  if ((unint64_t)messageStrategyIdentifiers | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](messageStrategyIdentifiers, "isEqual:")) {
      goto LABEL_27;
    }
  }
  receivingHandle = self->_receivingHandle;
  if ((unint64_t)receivingHandle | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](receivingHandle, "isEqual:")) {
      goto LABEL_27;
    }
  }
  receivingAccountIdentifier = self->_receivingAccountIdentifier;
  if ((unint64_t)receivingAccountIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](receivingAccountIdentifier, "isEqual:")) {
      goto LABEL_27;
    }
  }
  smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  if ((unint64_t)smsStrategyIdentifiers | *((void *)v4 + 11)) {
    char v15 = -[NSMutableArray isEqual:](smsStrategyIdentifiers, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_originatorIdentifier hash];
  uint64_t v5 = [(GEOSharedNavState *)self->_state hash];
  if (*(unsigned char *)&self->_has)
  {
    double lastUpdateTimestamp = self->_lastUpdateTimestamp;
    double v8 = -lastUpdateTimestamp;
    if (lastUpdateTimestamp >= 0.0) {
      double v8 = self->_lastUpdateTimestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v12 = [(NSString *)self->_fromID hash];
  uint64_t v13 = v12 ^ [(NSMutableArray *)self->_minimalStrategyIdentifiers hash];
  uint64_t v14 = v11 ^ v13 ^ [(NSMutableArray *)self->_liveStrategyIdentifiers hash];
  uint64_t v15 = [(NSMutableArray *)self->_messageStrategyIdentifiers hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_receivingHandle hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_receivingAccountIdentifier hash];
  return v14 ^ v17 ^ [(NSMutableArray *)self->_smsStrategyIdentifiers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[MSPGroupSessionStorage setGroupIdentifier:](self, "setGroupIdentifier:");
  }
  if (*((void *)v4 + 8)) {
    -[MSPGroupSessionStorage setOriginatorIdentifier:](self, "setOriginatorIdentifier:");
  }
  state = self->_state;
  uint64_t v6 = *((void *)v4 + 12);
  if (state)
  {
    if (v6) {
      -[GEOSharedNavState mergeFrom:](state, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MSPGroupSessionStorage setState:](self, "setState:");
  }
  if (*((unsigned char *)v4 + 104))
  {
    self->_double lastUpdateTimestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[MSPGroupSessionStorage setFromID:](self, "setFromID:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = *((id *)v4 + 7);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        [(MSPGroupSessionStorage *)self addMinimalStrategyIdentifier:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        [(MSPGroupSessionStorage *)self addLiveStrategyIdentifier:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v4 + 6);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(MSPGroupSessionStorage *)self addMessageStrategyIdentifier:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  if (*((void *)v4 + 10)) {
    -[MSPGroupSessionStorage setReceivingHandle:](self, "setReceivingHandle:");
  }
  if (*((void *)v4 + 9)) {
    -[MSPGroupSessionStorage setReceivingAccountIdentifier:](self, "setReceivingAccountIdentifier:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 11);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[MSPGroupSessionStorage addSmsStrategyIdentifier:](self, "addSmsStrategyIdentifier:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)originatorIdentifier
{
  return self->_originatorIdentifier;
}

- (void)setOriginatorIdentifier:(id)a3
{
}

- (GEOSharedNavState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
}

- (NSMutableArray)minimalStrategyIdentifiers
{
  return self->_minimalStrategyIdentifiers;
}

- (void)setMinimalStrategyIdentifiers:(id)a3
{
}

- (NSMutableArray)liveStrategyIdentifiers
{
  return self->_liveStrategyIdentifiers;
}

- (void)setLiveStrategyIdentifiers:(id)a3
{
}

- (NSMutableArray)messageStrategyIdentifiers
{
  return self->_messageStrategyIdentifiers;
}

- (void)setMessageStrategyIdentifiers:(id)a3
{
}

- (NSString)receivingHandle
{
  return self->_receivingHandle;
}

- (void)setReceivingHandle:(id)a3
{
}

- (NSString)receivingAccountIdentifier
{
  return self->_receivingAccountIdentifier;
}

- (void)setReceivingAccountIdentifier:(id)a3
{
}

- (NSMutableArray)smsStrategyIdentifiers
{
  return self->_smsStrategyIdentifiers;
}

- (void)setSmsStrategyIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_smsStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_receivingHandle, 0);
  objc_storeStrong((id *)&self->_receivingAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_originatorIdentifier, 0);
  objc_storeStrong((id *)&self->_minimalStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_messageStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_liveStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_fromID, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end