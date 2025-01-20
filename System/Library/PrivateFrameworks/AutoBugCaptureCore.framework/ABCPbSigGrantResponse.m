@interface ABCPbSigGrantResponse
+ (Class)sigResponseType;
- (ABCPbSigConfigWhitelist)sigConfigWhitelist;
- (BOOL)hasGlobalDecision;
- (BOOL)hasSigConfigWhitelist;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sigResponses;
- (NSString)description;
- (NSString)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)globalDecisionAsString:(int)a3;
- (id)sigResponseAtIndex:(unint64_t)a3;
- (int)StringAsGlobalDecision:(id)a3;
- (int)globalDecision;
- (unint64_t)hash;
- (unint64_t)sigResponsesCount;
- (void)addSigResponse:(id)a3;
- (void)clearSigResponses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGlobalDecision:(int)a3;
- (void)setHasGlobalDecision:(BOOL)a3;
- (void)setSigConfigWhitelist:(id)a3;
- (void)setSigResponses:(id)a3;
- (void)setStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSigGrantResponse

- (int)globalDecision
{
  if (*(unsigned char *)&self->_has) {
    return self->_globalDecision;
  }
  else {
    return 0;
  }
}

- (void)setGlobalDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_globalDecision = a3;
}

- (void)setHasGlobalDecision:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGlobalDecision
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)globalDecisionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_263FC4EB8[a3];
  }

  return v3;
}

- (int)StringAsGlobalDecision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALL_FALSE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALL_TRUE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FOLLOW_SIG_RESPONSE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)clearSigResponses
{
}

- (void)addSigResponse:(id)a3
{
  id v4 = a3;
  sigResponses = self->_sigResponses;
  id v8 = v4;
  if (!sigResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_sigResponses;
    self->_sigResponses = v6;

    id v4 = v8;
    sigResponses = self->_sigResponses;
  }
  [(NSMutableArray *)sigResponses addObject:v4];
}

- (unint64_t)sigResponsesCount
{
  return [(NSMutableArray *)self->_sigResponses count];
}

- (id)sigResponseAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sigResponses objectAtIndex:a3];
}

+ (Class)sigResponseType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSigConfigWhitelist
{
  return self->_sigConfigWhitelist != 0;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigGrantResponse;
  id v4 = [(ABCPbSigGrantResponse *)&v8 description];
  v5 = [(ABCPbSigGrantResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t globalDecision = self->_globalDecision;
    if (globalDecision >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_globalDecision);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_263FC4EB8[globalDecision];
    }
    [v3 setObject:v5 forKey:@"global_decision"];
  }
  status = self->_status;
  if (status) {
    [v3 setObject:status forKey:@"status"];
  }
  if ([(NSMutableArray *)self->_sigResponses count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_sigResponses, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v8 = self->_sigResponses;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"sig_response"];
  }
  sigConfigWhitelist = self->_sigConfigWhitelist;
  if (sigConfigWhitelist)
  {
    v15 = [(ABCPbSigConfigWhitelist *)sigConfigWhitelist dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"sig_config_whitelist"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigGrantResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_status) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sigResponses;
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

  if (self->_sigConfigWhitelist) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_globalDecision;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v9 = v4;
  if (self->_status) {
    objc_msgSend(v4, "setStatus:");
  }
  if ([(ABCPbSigGrantResponse *)self sigResponsesCount])
  {
    [v9 clearSigResponses];
    unint64_t v5 = [(ABCPbSigGrantResponse *)self sigResponsesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ABCPbSigGrantResponse *)self sigResponseAtIndex:i];
        [v9 addSigResponse:v8];
      }
    }
  }
  if (self->_sigConfigWhitelist) {
    objc_msgSend(v9, "setSigConfigWhitelist:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_globalDecision;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_status copyWithZone:a3];
  uint64_t v8 = (void *)v6[4];
  v6[4] = v7;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_sigResponses;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (void)v18);
        [v6 addSigResponse:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v15 = [(ABCPbSigConfigWhitelist *)self->_sigConfigWhitelist copyWithZone:a3];
  v16 = (void *)v6[2];
  v6[2] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_globalDecision != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 4) && !-[NSString isEqual:](status, "isEqual:")) {
    goto LABEL_13;
  }
  sigResponses = self->_sigResponses;
  if ((unint64_t)sigResponses | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](sigResponses, "isEqual:")) {
      goto LABEL_13;
    }
  }
  sigConfigWhitelist = self->_sigConfigWhitelist;
  if ((unint64_t)sigConfigWhitelist | *((void *)v4 + 2)) {
    char v8 = -[ABCPbSigConfigWhitelist isEqual:](sigConfigWhitelist, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_globalDecision;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_status hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_sigResponses hash];
  return v4 ^ v5 ^ [(ABCPbSigConfigWhitelist *)self->_sigConfigWhitelist hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  NSUInteger v4 = (id *)a3;
  uint64_t v5 = v4;
  if ((_BYTE)v4[5])
  {
    self->_uint64_t globalDecision = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[4]) {
    -[ABCPbSigGrantResponse setStatus:](self, "setStatus:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5[3];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ABCPbSigGrantResponse addSigResponse:](self, "addSigResponse:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  sigConfigWhitelist = self->_sigConfigWhitelist;
  id v12 = v5[2];
  if (sigConfigWhitelist)
  {
    if (v12) {
      -[ABCPbSigConfigWhitelist mergeFrom:](sigConfigWhitelist, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ABCPbSigGrantResponse setSigConfigWhitelist:](self, "setSigConfigWhitelist:");
  }
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSMutableArray)sigResponses
{
  return self->_sigResponses;
}

- (void)setSigResponses:(id)a3
{
}

- (ABCPbSigConfigWhitelist)sigConfigWhitelist
{
  return self->_sigConfigWhitelist;
}

- (void)setSigConfigWhitelist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_sigResponses, 0);

  objc_storeStrong((id *)&self->_sigConfigWhitelist, 0);
}

@end