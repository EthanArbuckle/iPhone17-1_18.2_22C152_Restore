@interface SYVectorClock
+ (Class)clocksType;
+ (void)initialize;
- (BOOL)_setTheory_isEqual:(id)a3;
- (BOOL)hasClockForPeer:(id)a3;
- (BOOL)hasClockForPeerID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)clocks;
- (SYVectorClock)initWithJSONRepresentation:(id)a3;
- (id)clockForPeer:(id)a3;
- (id)clockForPeerID:(id)a3;
- (id)clocksAtIndex:(unint64_t)a3;
- (id)compactDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)clockValueForPeer:(id)a3;
- (unint64_t)clockValueForPeerID:(id)a3;
- (unint64_t)clocksCount;
- (unint64_t)hash;
- (void)addClocks:(id)a3;
- (void)clearClocks;
- (void)copyTo:(id)a3;
- (void)increaseClockForPeer:(id)a3 by:(unint64_t)a4;
- (void)increaseClockForPeerID:(id)a3 by:(unint64_t)a4;
- (void)incrementClockForPeer:(id)a3;
- (void)incrementClockForPeerID:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClockValue:(unint64_t)a3 forPeer:(id)a4;
- (void)setClockValue:(unint64_t)a3 forPeerID:(id)a4;
- (void)setClocks:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYVectorClock

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    InstanceMethod = class_getInstanceMethod((Class)a1, sel_isEqual_);
    v4 = class_getInstanceMethod((Class)a1, sel__setTheory_isEqual_);
    if (InstanceMethod && v4 != 0)
    {
      method_exchangeImplementations(InstanceMethod, v4);
    }
  }
}

- (BOOL)_setTheory_isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    v6 = [(SYVectorClock *)self clocks];
    v7 = [v5 setWithArray:v6];

    v8 = (void *)MEMORY[0x263EFFA08];
    v9 = [v4 clocks];
    v10 = [v8 setWithArray:v9];

    char v11 = [v7 isEqualToSet:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (SYVectorClock)initWithJSONRepresentation:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SYVectorClock;
  v5 = [(SYVectorClock *)&v30 init];
  if (v5)
  {
    if ([v4 length])
    {
      v6 = (void *)MEMORY[0x263F08900];
      v7 = [v4 dataUsingEncoding:4];
      v8 = [v6 JSONObjectWithData:v7 options:4 error:0];

      v9 = [v8 objectForKeyedSubscript:@"clocks"];

      if (v9)
      {
        id v27 = v4;
        v25 = v8;
        v10 = [v8 objectForKeyedSubscript:@"clocks"];
        v26 = v5;
        char v11 = v5;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v32;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v32 != v14) {
                objc_enumerationMutation(v10);
              }
              v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
              v17 = objc_opt_new();
              v18 = [v16 objectForKeyedSubscript:@"version"];
              objc_msgSend(v17, "setVersion:", objc_msgSend(v18, "unsignedLongLongValue"));

              v19 = [SYPeer alloc];
              v20 = [v16 objectForKeyedSubscript:@"peer"];
              v21 = [v20 objectForKeyedSubscript:@"peerID"];
              v22 = [(SYPeer *)v19 initWithPeerID:v21 generation:0];
              [v17 setPeer:v22];

              [(SYVectorClock *)v11 addClocks:v17];
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v13);
        }

        v5 = v26;
        id v4 = v27;
        v8 = v25;
      }
      else
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __55__SYVectorClock_Additions__initWithJSONRepresentation___block_invoke;
        v28[3] = &unk_264423B38;
        v29 = v5;
        [v8 enumerateKeysAndObjectsUsingBlock:v28];
        v10 = v29;
      }
    }
    v23 = v5;
  }

  return v5;
}

void __55__SYVectorClock_Additions__initWithJSONRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v9 = (id)objc_opt_new();
  v7 = [[SYPeer alloc] initWithPeerID:v6 generation:0];

  [v9 setPeer:v7];
  uint64_t v8 = [v5 unsignedLongLongValue];

  [v9 setVersion:v8];
  [*(id *)(a1 + 32) addClocks:v9];
}

- (BOOL)hasClockForPeer:(id)a3
{
  id v4 = [a3 peerID];
  LOBYTE(self) = [(SYVectorClock *)self hasClockForPeerID:v4];

  return (char)self;
}

- (BOOL)hasClockForPeerID:(id)a3
{
  v3 = [(SYVectorClock *)self clockForPeerID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)clockForPeer:(id)a3
{
  if (a3)
  {
    BOOL v4 = [a3 peerID];
    id v5 = [(SYVectorClock *)self clockForPeerID:v4];
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
    id v5 = 0;
  }
  return v5;
}

- (id)clockForPeerID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(SYVectorClock *)self clocks];
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = [v9 peer];
          char v11 = [v10 peerID];
          int v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)clockValueForPeer:(id)a3
{
  if (a3)
  {
    id v4 = [a3 peerID];
    unint64_t v5 = [(SYVectorClock *)self clockValueForPeerID:v4];

    return v5;
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
    return 0;
  }
}

- (void)increaseClockForPeer:(id)a3 by:(unint64_t)a4
{
  if (a3)
  {
    id v7 = [a3 peerID];
    [(SYVectorClock *)self increaseClockForPeerID:v7 by:a4];
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
  }
}

- (void)incrementClockForPeer:(id)a3
{
  if (a3)
  {
    id v5 = [a3 peerID];
    [(SYVectorClock *)self increaseClockForPeerID:v5 by:1];
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
  }
}

- (void)setClockValue:(unint64_t)a3 forPeer:(id)a4
{
  if (a4)
  {
    id v7 = [a4 peerID];
    [(SYVectorClock *)self setClockValue:a3 forPeerID:v7];
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
  }
}

- (unint64_t)clockValueForPeerID:(id)a3
{
  uint64_t v3 = [(SYVectorClock *)self clockForPeerID:a3];
  unint64_t v4 = [v3 version];

  return v4;
}

- (void)increaseClockForPeerID:(id)a3 by:(unint64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  if (v6)
  {
    id v7 = [(SYVectorClock *)self clockForPeerID:v6];
    if (v7)
    {
      uint64_t v8 = v7;
      objc_msgSend(v7, "setVersion:", objc_msgSend(v7, "version") + a4);
    }
    else
    {
      uint64_t v8 = objc_opt_new();
      id v9 = [[SYPeer alloc] initWithPeerID:v10 generation:0];
      [v8 setPeer:v9];

      [v8 setVersion:a4];
      [(SYVectorClock *)self addClocks:v8];
    }
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
  }
}

- (void)incrementClockForPeerID:(id)a3
{
}

- (void)setClockValue:(unint64_t)a3 forPeerID:(id)a4
{
  id v6 = a4;
  id v10 = v6;
  if (v6)
  {
    id v7 = [(SYVectorClock *)self clockForPeerID:v6];
    if (v7)
    {
      uint64_t v8 = v7;
      [v7 setVersion:a3];
    }
    else
    {
      uint64_t v8 = objc_opt_new();
      id v9 = [[SYPeer alloc] initWithPeerID:v10 generation:0];
      [v8 setPeer:v9];

      [v8 setVersion:a3];
      [(SYVectorClock *)self addClocks:v8];
    }
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
  }
}

- (id)compactDictionaryRepresentation
{
  if ([(SYVectorClock *)self clocksCount])
  {
    uint64_t v3 = objc_opt_new();
    unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[SYVectorClock clocksCount](self, "clocksCount"));
    id v5 = [(SYVectorClock *)self clocks];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    long long v14 = __59__SYVectorClock_Additions__compactDictionaryRepresentation__block_invoke;
    long long v15 = &unk_264423B60;
    id v6 = v3;
    id v16 = v6;
    id v7 = v4;
    id v17 = v7;
    [v5 enumerateObjectsUsingBlock:&v12];

    if (objc_msgSend(v6, "count", v12, v13, v14, v15))
    {
      uint64_t v8 = [(SYVectorClock *)self clocks];
      [v8 removeObjectsAtIndexes:v6];
    }
    id v9 = v17;
    id v10 = v7;
  }
  else
  {
    id v10 = (id)objc_opt_new();
  }
  return v10;
}

void __59__SYVectorClock_Additions__compactDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id v5 = [v11 peer];
  id v6 = [v5 peerID];

  if (v6)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "version"));
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v11 peer];
    id v10 = [v9 peerID];
    [v8 setObject:v7 forKeyedSubscript:v10];
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (id)jsonRepresentation
{
  v2 = [(SYVectorClock *)self compactDictionaryRepresentation];
  uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  unint64_t v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return v4;
}

- (void)clearClocks
{
}

- (void)addClocks:(id)a3
{
  id v4 = a3;
  clocks = self->_clocks;
  id v8 = v4;
  if (!clocks)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = self->_clocks;
    self->_clocks = v6;

    id v4 = v8;
    clocks = self->_clocks;
  }
  [(NSMutableArray *)clocks addObject:v4];
}

- (unint64_t)clocksCount
{
  return [(NSMutableArray *)self->_clocks count];
}

- (id)clocksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clocks objectAtIndex:a3];
}

+ (Class)clocksType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYVectorClock;
  id v4 = [(SYVectorClock *)&v8 description];
  id v5 = [(SYVectorClock *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_clocks count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_clocks, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_clocks;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"clocks"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYVectorClockReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_clocks;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(SYVectorClock *)self clocksCount])
  {
    [v8 clearClocks];
    unint64_t v4 = [(SYVectorClock *)self clocksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SYVectorClock *)self clocksAtIndex:i];
        [v8 addClocks:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_clocks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addClocks:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    clocks = self->_clocks;
    if ((unint64_t)clocks | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](clocks, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_clocks hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SYVectorClock addClocks:](self, "addClocks:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)clocks
{
  return self->_clocks;
}

- (void)setClocks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end