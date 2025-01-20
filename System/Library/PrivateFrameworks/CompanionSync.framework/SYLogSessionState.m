@interface SYLogSessionState
+ (Class)peerType;
+ (Class)transportOptionsType;
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)canceled;
- (BOOL)hasCanRestart;
- (BOOL)hasCanRollback;
- (BOOL)hasCanceled;
- (BOOL)hasError;
- (BOOL)hasFullSessionTimeout;
- (BOOL)hasIsReset;
- (BOOL)hasPerMessageTimeout;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReset;
- (BOOL)isSending;
- (BOOL)readFrom:(id)a3;
- (NSDictionary)cocoaTransportOptions;
- (NSMutableArray)peers;
- (NSMutableArray)transportOptions;
- (NSString)identifier;
- (NSString)reason;
- (SYLogErrorInfo)error;
- (double)fullSessionTimeout;
- (double)perMessageTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)peerAtIndex:(unint64_t)a3;
- (id)stateAsString:(int)a3;
- (id)transportOptionsAtIndex:(unint64_t)a3;
- (int)StringAsState:(id)a3;
- (int)state;
- (unint64_t)hash;
- (unint64_t)maxConcurrentMessages;
- (unint64_t)peersCount;
- (unint64_t)transportOptionsCount;
- (void)addPeer:(id)a3;
- (void)addTransportOptions:(id)a3;
- (void)clearPeers;
- (void)clearTransportOptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCocoaTransportOptions:(id)a3;
- (void)setError:(id)a3;
- (void)setFullSessionTimeout:(double)a3;
- (void)setHasCanRestart:(BOOL)a3;
- (void)setHasCanRollback:(BOOL)a3;
- (void)setHasCanceled:(BOOL)a3;
- (void)setHasFullSessionTimeout:(BOOL)a3;
- (void)setHasIsReset:(BOOL)a3;
- (void)setHasPerMessageTimeout:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsReset:(BOOL)a3;
- (void)setIsSending:(BOOL)a3;
- (void)setMaxConcurrentMessages:(unint64_t)a3;
- (void)setPeers:(id)a3;
- (void)setPerMessageTimeout:(double)a3;
- (void)setReason:(id)a3;
- (void)setState:(int)a3;
- (void)setTransportOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYLogSessionState

- (id)stateAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264423A18[a3];
  }
  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotStarted"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Continue"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SendComplete"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cancel"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Restart"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Error"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WaitingForStartConfirmation"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WaitingForCompletionConfirmation"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WaitingForBatchEnqueue"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SyncComplete"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsReset:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isReset = a3;
}

- (void)setHasIsReset:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsReset
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPerMessageTimeout:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_perMessageTimeout = a3;
}

- (void)setHasPerMessageTimeout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPerMessageTimeout
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFullSessionTimeout:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fullSessionTimeout = a3;
}

- (void)setHasFullSessionTimeout:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSessionTimeout
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setCanRestart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_canRestart = a3;
}

- (void)setHasCanRestart:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCanRestart
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCanRollback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_canRollback = a3;
}

- (void)setHasCanRollback:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCanRollback
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCanceled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_canceled = a3;
}

- (void)setHasCanceled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCanceled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearTransportOptions
{
}

- (void)addTransportOptions:(id)a3
{
  id v4 = a3;
  transportOptions = self->_transportOptions;
  id v8 = v4;
  if (!transportOptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_transportOptions;
    self->_transportOptions = v6;

    id v4 = v8;
    transportOptions = self->_transportOptions;
  }
  [(NSMutableArray *)transportOptions addObject:v4];
}

- (unint64_t)transportOptionsCount
{
  return [(NSMutableArray *)self->_transportOptions count];
}

- (id)transportOptionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transportOptions objectAtIndex:a3];
}

+ (Class)transportOptionsType
{
  return (Class)objc_opt_class();
}

- (void)clearPeers
{
}

- (void)addPeer:(id)a3
{
  id v4 = a3;
  peers = self->_peers;
  id v8 = v4;
  if (!peers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_peers;
    self->_peers = v6;

    id v4 = v8;
    peers = self->_peers;
  }
  [(NSMutableArray *)peers addObject:v4];
}

- (unint64_t)peersCount
{
  return [(NSMutableArray *)self->_peers count];
}

- (id)peerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_peers objectAtIndex:a3];
}

+ (Class)peerType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYLogSessionState;
  id v4 = [(SYLogSessionState *)&v8 description];
  v5 = [(SYLogSessionState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  uint64_t state = self->_state;
  if (state >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_264423A18[state];
  }
  [v4 setObject:v7 forKey:@"state"];

  objc_super v8 = [NSNumber numberWithBool:self->_isSending];
  [v4 setObject:v8 forKey:@"isSending"];

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v32 = [NSNumber numberWithBool:self->_isReset];
    [v4 setObject:v32 forKey:@"isReset"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_8;
  }
  v33 = [NSNumber numberWithDouble:self->_perMessageTimeout];
  [v4 setObject:v33 forKey:@"perMessageTimeout"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    v10 = [NSNumber numberWithDouble:self->_fullSessionTimeout];
    [v4 setObject:v10 forKey:@"fullSessionTimeout"];
  }
LABEL_10:
  v11 = [NSNumber numberWithUnsignedLongLong:self->_maxConcurrentMessages];
  [v4 setObject:v11 forKey:@"maxConcurrentMessages"];

  error = self->_error;
  if (error)
  {
    v13 = [(SYLogErrorInfo *)error dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"error"];
  }
  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    v34 = [NSNumber numberWithBool:self->_canRestart];
    [v4 setObject:v34 forKey:@"canRestart"];

    char v14 = (char)self->_has;
    if ((v14 & 8) == 0)
    {
LABEL_14:
      if ((v14 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  v35 = [NSNumber numberWithBool:self->_canRollback];
  [v4 setObject:v35 forKey:@"canRollback"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    v15 = [NSNumber numberWithBool:self->_canceled];
    [v4 setObject:v15 forKey:@"canceled"];
  }
LABEL_16:
  if ([(NSMutableArray *)self->_transportOptions count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_transportOptions, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v17 = self->_transportOptions;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v19);
    }

    [v4 setObject:v16 forKey:@"transportOptions"];
  }
  if ([(NSMutableArray *)self->_peers count])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_peers, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v24 = self->_peers;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v36 + 1) + 8 * j) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v26);
    }

    [v4 setObject:v23 forKey:@"peer"];
  }
  reason = self->_reason;
  if (reason) {
    [v4 setObject:reason forKey:@"reason"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogSessionStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_identifier) {
    -[SYLogSessionState writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_4:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_4;
  }
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
  PBDataWriterWriteUint64Field();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
  char v7 = (char)self->_has;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = (char)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_10:
      if ((v7 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  objc_super v8 = self->_transportOptions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v13 = self->_peers;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }

  if (self->_reason) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v15 = a3;
  [v15 setIdentifier:self->_identifier];
  id v4 = v15;
  *((_DWORD *)v15 + 16) = self->_state;
  *((unsigned char *)v15 + 84) = self->_isSending;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v15 + 83) = self->_isReset;
    *((unsigned char *)v15 + 88) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v15 + 3) = *(void *)&self->_perMessageTimeout;
  *((unsigned char *)v15 + 88) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v15 + 1) = *(void *)&self->_fullSessionTimeout;
    *((unsigned char *)v15 + 88) |= 1u;
  }
LABEL_5:
  *((void *)v15 + 2) = self->_maxConcurrentMessages;
  if (self->_error)
  {
    objc_msgSend(v15, "setError:");
    id v4 = v15;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_28:
    v4[81] = self->_canRollback;
    v4[88] |= 8u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v4[80] = self->_canRestart;
  v4[88] |= 4u;
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0) {
    goto LABEL_28;
  }
LABEL_9:
  if ((v6 & 0x10) != 0)
  {
LABEL_10:
    v4[82] = self->_canceled;
    v4[88] |= 0x10u;
  }
LABEL_11:
  if ([(SYLogSessionState *)self transportOptionsCount])
  {
    [v15 clearTransportOptions];
    unint64_t v7 = [(SYLogSessionState *)self transportOptionsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(SYLogSessionState *)self transportOptionsAtIndex:i];
        [v15 addTransportOptions:v10];
      }
    }
  }
  if ([(SYLogSessionState *)self peersCount])
  {
    [v15 clearPeers];
    unint64_t v11 = [(SYLogSessionState *)self peersCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(SYLogSessionState *)self peerAtIndex:j];
        [v15 addPeer:v14];
      }
    }
  }
  if (self->_reason) {
    objc_msgSend(v15, "setReason:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 64) = self->_state;
  *(unsigned char *)(v5 + 84) = self->_isSending;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 83) = self->_isReset;
    *(unsigned char *)(v5 + 88) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_perMessageTimeout;
  *(unsigned char *)(v5 + 88) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_fullSessionTimeout;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
LABEL_5:
  *(void *)(v5 + 16) = self->_maxConcurrentMessages;
  id v9 = [(SYLogErrorInfo *)self->_error copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_canRestart;
    *(unsigned char *)(v5 + 88) |= 4u;
    char v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_7:
      if ((v11 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 81) = self->_canRollback;
  *(unsigned char *)(v5 + 88) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 82) = self->_canceled;
    *(unsigned char *)(v5 + 88) |= 0x10u;
  }
LABEL_9:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v12 = self->_transportOptions;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTransportOptions:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v18 = self->_peers;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        [(id)v5 addPeer:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSString *)self->_reason copyWithZone:a3];
  long long v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if (self->_state != *((_DWORD *)v4 + 16)) {
    goto LABEL_61;
  }
  if (self->_isSending)
  {
    if (!*((unsigned char *)v4 + 84)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_61;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x20) == 0) {
      goto LABEL_61;
    }
    if (self->_isReset)
    {
      if (!*((unsigned char *)v4 + 83)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 83))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_perMessageTimeout != *((double *)v4 + 3)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_61;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_fullSessionTimeout != *((double *)v4 + 1)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_61;
  }
  if (self->_maxConcurrentMessages != *((void *)v4 + 2))
  {
LABEL_61:
    char v11 = 0;
    goto LABEL_62;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 4))
  {
    if (!-[SYLogErrorInfo isEqual:](error, "isEqual:")) {
      goto LABEL_61;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0) {
      goto LABEL_61;
    }
    if (self->_canRestart)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0) {
      goto LABEL_61;
    }
    if (self->_canRollback)
    {
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 81))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
    {
      if (self->_canceled)
      {
        if (!*((unsigned char *)v4 + 82)) {
          goto LABEL_61;
        }
        goto LABEL_55;
      }
      if (!*((unsigned char *)v4 + 82)) {
        goto LABEL_55;
      }
    }
    goto LABEL_61;
  }
  if ((*((unsigned char *)v4 + 88) & 0x10) != 0) {
    goto LABEL_61;
  }
LABEL_55:
  transportOptions = self->_transportOptions;
  if ((unint64_t)transportOptions | *((void *)v4 + 9)
    && !-[NSMutableArray isEqual:](transportOptions, "isEqual:"))
  {
    goto LABEL_61;
  }
  peers = self->_peers;
  if ((unint64_t)peers | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](peers, "isEqual:")) {
      goto LABEL_61;
    }
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 7)) {
    char v11 = -[NSString isEqual:](reason, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_62:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    uint64_t v5 = 2654435761 * self->_isReset;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL isSending = self->_isSending;
  uint64_t state = self->_state;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double perMessageTimeout = self->_perMessageTimeout;
    double v10 = -perMessageTimeout;
    if (perMessageTimeout >= 0.0) {
      double v10 = self->_perMessageTimeout;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (has)
  {
    double fullSessionTimeout = self->_fullSessionTimeout;
    double v15 = -fullSessionTimeout;
    if (fullSessionTimeout >= 0.0) {
      double v15 = self->_fullSessionTimeout;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  unint64_t maxConcurrentMessages = self->_maxConcurrentMessages;
  unint64_t v19 = [(SYLogErrorInfo *)self->_error hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v20 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_22;
    }
LABEL_25:
    uint64_t v21 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v22 = 0;
    goto LABEL_27;
  }
  uint64_t v20 = 2654435761 * self->_canRestart;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v21 = 2654435761 * self->_canRollback;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v22 = 2654435761 * self->_canceled;
LABEL_27:
  uint64_t v23 = v19 ^ v20 ^ v21 ^ v22 ^ [(NSMutableArray *)self->_transportOptions hash];
  uint64_t v24 = v23 ^ [(NSMutableArray *)self->_peers hash];
  return (2654435761 * state) ^ v3 ^ (2654435761 * isSending) ^ v5 ^ v8 ^ v13 ^ (2654435761u * maxConcurrentMessages) ^ v24 ^ [(NSString *)self->_reason hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[SYLogSessionState setIdentifier:](self, "setIdentifier:");
  }
  self->_uint64_t state = *((_DWORD *)v4 + 16);
  self->_BOOL isSending = *((unsigned char *)v4 + 84);
  char v5 = *((unsigned char *)v4 + 88);
  if ((v5 & 0x20) != 0)
  {
    self->_isReset = *((unsigned char *)v4 + 83);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 88);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_double perMessageTimeout = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 88))
  {
LABEL_6:
    self->_double fullSessionTimeout = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  self->_unint64_t maxConcurrentMessages = *((void *)v4 + 2);
  error = self->_error;
  uint64_t v7 = *((void *)v4 + 4);
  if (error)
  {
    if (v7) {
      -[SYLogErrorInfo mergeFrom:](error, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SYLogSessionState setError:](self, "setError:");
  }
  char v8 = *((unsigned char *)v4 + 88);
  if ((v8 & 4) != 0)
  {
    self->_canRestart = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)v4 + 88);
    if ((v8 & 8) == 0)
    {
LABEL_17:
      if ((v8 & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_canRollback = *((unsigned char *)v4 + 81);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
LABEL_18:
    self->_canceled = *((unsigned char *)v4 + 82);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_19:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *((id *)v4 + 9);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(SYLogSessionState *)self addTransportOptions:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 6);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[SYLogSessionState addPeer:](self, "addPeer:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  if (*((void *)v4 + 7)) {
    -[SYLogSessionState setReason:](self, "setReason:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_uint64_t state = a3;
}

- (BOOL)isSending
{
  return self->_isSending;
}

- (void)setIsSending:(BOOL)a3
{
  self->_BOOL isSending = a3;
}

- (BOOL)isReset
{
  return self->_isReset;
}

- (double)perMessageTimeout
{
  return self->_perMessageTimeout;
}

- (double)fullSessionTimeout
{
  return self->_fullSessionTimeout;
}

- (unint64_t)maxConcurrentMessages
{
  return self->_maxConcurrentMessages;
}

- (void)setMaxConcurrentMessages:(unint64_t)a3
{
  self->_unint64_t maxConcurrentMessages = a3;
}

- (SYLogErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)canRestart
{
  return self->_canRestart;
}

- (BOOL)canRollback
{
  return self->_canRollback;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (NSMutableArray)transportOptions
{
  return self->_transportOptions;
}

- (void)setTransportOptions:(id)a3
{
}

- (NSMutableArray)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setCocoaTransportOptions:(id)a3
{
  id v4 = a3;
  [(SYLogSessionState *)self clearTransportOptions];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__SYLogSessionState_Convenience__setCocoaTransportOptions___block_invoke;
  v5[3] = &unk_264423D70;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __59__SYLogSessionState_Convenience__setCocoaTransportOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_opt_new();
  [v8 setKey:v6];

  uint64_t v7 = [v5 description];

  [v8 setValue:v7];
  [*(id *)(a1 + 32) addTransportOptions:v8];
}

- (NSDictionary)cocoaTransportOptions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v4 = [(SYLogSessionState *)self transportOptions];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(SYLogSessionState *)self transportOptions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 value];
        unint64_t v13 = [v11 key];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYLogSessionState writeTo:]", "SYLogSessionState.m", 395, "nil != self->_identifier");
}

@end