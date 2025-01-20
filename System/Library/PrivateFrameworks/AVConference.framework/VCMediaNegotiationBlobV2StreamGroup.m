@interface VCMediaNegotiationBlobV2StreamGroup
+ (BOOL)isValidStreamGroupIDFromConfig:(id)a3 defaultConfig:(id)a4;
+ (Class)payloadsType;
+ (Class)streamsType;
+ (id)defaultsForStreamGroup:(unsigned int)a3;
+ (id)defaultsForStreamGroupCustom:(unsigned int)a3;
+ (id)negotiationCipherSuiteAsString:(unsigned int)a3;
+ (unsigned)streamGroupFromStreamGroupID:(unsigned int)a3;
+ (unsigned)streamGroupIDFromStreamGroup:(unsigned int)a3;
+ (void)updateParentStreamIDForGroupConfig:(id)a3;
- (BOOL)appendStreamsToStreamGroupConfig:(id)a3 streamGroupID:(unsigned int)a4 rtpSampleRates:(id)a5;
- (BOOL)hasSettingsU1;
- (BOOL)hasStreamGroup;
- (BOOL)isDefaultPayloadConfigsWithStreamGroupConfig:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsedPayloadConfigAtIndex:(id)a3 streamGroupConfig:(id)a4 rtpTimestampRate:(unsigned int *)a5;
- (BOOL)readFrom:(id)a3;
- (BOOL)setupPayloadsWithGroupConfig:(id)a3;
- (BOOL)setupStreamsWithGroupConfig:(id)a3;
- (BOOL)updatePayloadConfigsWithStreamGroupConfig:(id)a3 rtpSampleRates:(id)a4;
- (NSMutableArray)payloads;
- (NSMutableArray)streams;
- (VCMediaNegotiationBlobV2SettingsU1)settingsU1;
- (VCMediaNegotiationBlobV2StreamGroup)initWithStreamGroupConfig:(id)a3;
- (VCMediaNegotiationBlobV2StreamGroup)initWithStreamGroupConfig:(id)a3 defaultConfig:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customPayloadConfigStateWithStreamGroupConfig:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)payloadsAtIndex:(unint64_t)a3;
- (id)streamsAtIndex:(unint64_t)a3;
- (int)getStreamGroupConfig:(id *)a3;
- (unint64_t)hash;
- (unint64_t)payloadsCount;
- (unint64_t)streamsCount;
- (unsigned)codecIndexForType:(int64_t)a3 inPayloadConfigurations:(id)a4;
- (unsigned)streamGroup;
- (void)addPayloads:(id)a3;
- (void)addStreams:(id)a3;
- (void)appendV2PayloadsToStreamConfig:(id)a3 streamGroupConfig:(id)a4;
- (void)clearPayloads;
- (void)clearStreams;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4;
- (void)setHasStreamGroup:(BOOL)a3;
- (void)setPayloads:(id)a3;
- (void)setSettingsU1:(id)a3;
- (void)setStreamGroup:(unsigned int)a3;
- (void)setStreams:(id)a3;
- (void)updateDefaultPayloadConfigsWithConfig:(id)a3 rtpSampleRates:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2StreamGroup

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2StreamGroup *)self setPayloads:0];
  [(VCMediaNegotiationBlobV2StreamGroup *)self setStreams:0];
  [(VCMediaNegotiationBlobV2StreamGroup *)self setSettingsU1:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroup;
  [(VCMediaNegotiationBlobV2StreamGroup *)&v3 dealloc];
}

- (void)setStreamGroup:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_streamGroup = a3;
}

- (void)setHasStreamGroup:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStreamGroup
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearPayloads
{
}

- (void)addPayloads:(id)a3
{
  payloads = self->_payloads;
  if (!payloads)
  {
    payloads = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_payloads = payloads;
  }

  [(NSMutableArray *)payloads addObject:a3];
}

- (unint64_t)payloadsCount
{
  return [(NSMutableArray *)self->_payloads count];
}

- (id)payloadsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_payloads objectAtIndex:a3];
}

+ (Class)payloadsType
{
  return (Class)objc_opt_class();
}

- (void)clearStreams
{
}

- (void)addStreams:(id)a3
{
  streams = self->_streams;
  if (!streams)
  {
    streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_streams = streams;
  }

  [(NSMutableArray *)streams addObject:a3];
}

- (unint64_t)streamsCount
{
  return [(NSMutableArray *)self->_streams count];
}

- (id)streamsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_streams objectAtIndex:a3];
}

+ (Class)streamsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSettingsU1
{
  return self->_settingsU1 != 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroup;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2StreamGroup description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroup dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_streamGroup), @"streamGroup");
  }
  if ([(NSMutableArray *)self->_payloads count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_payloads, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    payloads = self->_payloads;
    uint64_t v6 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(payloads);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v24 objects:v23 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"payloads"];
  }
  if ([(NSMutableArray *)self->_streams count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_streams, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    streams = self->_streams;
    uint64_t v12 = [(NSMutableArray *)streams countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(streams);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)streams countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"streams"];
  }
  settingsU1 = self->_settingsU1;
  if (settingsU1) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2SettingsU1 dictionaryRepresentation](settingsU1, "dictionaryRepresentation"), @"settingsU1");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  payloads = self->_payloads;
  uint64_t v5 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(payloads);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v6);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  streams = self->_streams;
  uint64_t v10 = [(NSMutableArray *)streams countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(streams);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)streams countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v11);
  }
  if (self->_settingsU1) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 6) = self->_streamGroup;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if ([(VCMediaNegotiationBlobV2StreamGroup *)self payloadsCount])
  {
    [a3 clearPayloads];
    unint64_t v5 = [(VCMediaNegotiationBlobV2StreamGroup *)self payloadsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addPayloads:", -[VCMediaNegotiationBlobV2StreamGroup payloadsAtIndex:](self, "payloadsAtIndex:", i));
    }
  }
  if ([(VCMediaNegotiationBlobV2StreamGroup *)self streamsCount])
  {
    [a3 clearStreams];
    unint64_t v8 = [(VCMediaNegotiationBlobV2StreamGroup *)self streamsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(a3, "addStreams:", -[VCMediaNegotiationBlobV2StreamGroup streamsAtIndex:](self, "streamsAtIndex:", j));
    }
  }
  if (self->_settingsU1)
  {
    objc_msgSend(a3, "setSettingsU1:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (id *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_streamGroup;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  payloads = self->_payloads;
  uint64_t v8 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(payloads);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [v6 addPayloads:v12];
      }
      uint64_t v9 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v9);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  streams = self->_streams;
  uint64_t v14 = [(NSMutableArray *)streams countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(streams);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * j) copyWithZone:a3];
        [v6 addStreams:v18];
      }
      uint64_t v15 = [(NSMutableArray *)streams countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v15);
  }

  v6[2] = [(VCMediaNegotiationBlobV2SettingsU1 *)self->_settingsU1 copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_streamGroup != *((_DWORD *)a3 + 6)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    payloads = self->_payloads;
    if (!((unint64_t)payloads | *((void *)a3 + 1))
      || (int v5 = -[NSMutableArray isEqual:](payloads, "isEqual:")) != 0)
    {
      streams = self->_streams;
      if (!((unint64_t)streams | *((void *)a3 + 4))
        || (int v5 = -[NSMutableArray isEqual:](streams, "isEqual:")) != 0)
      {
        settingsU1 = self->_settingsU1;
        if ((unint64_t)settingsU1 | *((void *)a3 + 2))
        {
          LOBYTE(v5) = -[VCMediaNegotiationBlobV2SettingsU1 isEqual:](settingsU1, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_streamGroup;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_payloads hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_streams hash];
  return v4 ^ v5 ^ [(VCMediaNegotiationBlobV2SettingsU1 *)self->_settingsU1 hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)a3 + 40))
  {
    self->_streamGroup = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VCMediaNegotiationBlobV2StreamGroup *)self addPayloads:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v7);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        [(VCMediaNegotiationBlobV2StreamGroup *)self addStreams:*(void *)(*((void *)&v18 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v12);
  }
  settingsU1 = self->_settingsU1;
  uint64_t v16 = *((void *)a3 + 2);
  if (settingsU1)
  {
    if (v16) {
      -[VCMediaNegotiationBlobV2SettingsU1 mergeFrom:](settingsU1, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[VCMediaNegotiationBlobV2StreamGroup setSettingsU1:](self, "setSettingsU1:");
  }
}

- (unsigned)streamGroup
{
  return self->_streamGroup;
}

- (NSMutableArray)payloads
{
  return self->_payloads;
}

- (void)setPayloads:(id)a3
{
}

- (NSMutableArray)streams
{
  return self->_streams;
}

- (void)setStreams:(id)a3
{
}

- (VCMediaNegotiationBlobV2SettingsU1)settingsU1
{
  return self->_settingsU1;
}

- (void)setSettingsU1:(id)a3
{
}

- (VCMediaNegotiationBlobV2StreamGroup)initWithStreamGroupConfig:(id)a3 defaultConfig:(id)a4
{
  uint64_t v6 = [(VCMediaNegotiationBlobV2StreamGroup *)self init];
  if (v6)
  {
    if (!+[VCMediaNegotiationBlobV2StreamGroup isValidStreamGroupIDFromConfig:a3 defaultConfig:a4])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:].cold.5();
        }
      }
      goto LABEL_27;
    }
    uint64_t v7 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupFromStreamGroupID:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupFromStreamGroupID:", [a3 groupID]);
    if (!v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:]();
        }
      }
      goto LABEL_27;
    }
    uint64_t v8 = v7;
    if ([(VCMediaNegotiationBlobV2StreamGroup *)v6 streamGroup] != v7) {
      [(VCMediaNegotiationBlobV2StreamGroup *)v6 setStreamGroup:v8];
    }
    if ([a3 u1Config])
    {
      uint64_t v9 = -[VCMediaNegotiationBlobV2SettingsU1 initWithU1Config:]([VCMediaNegotiationBlobV2SettingsU1 alloc], "initWithU1Config:", [a3 u1Config]);
      if (!v9)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:].cold.4();
          }
        }
        goto LABEL_27;
      }
      uint64_t v10 = v9;
      [(VCMediaNegotiationBlobV2StreamGroup *)v6 setSettingsU1:v9];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroup *)v6 setupPayloadsWithGroupConfig:a3])
    {
      if ([(VCMediaNegotiationBlobV2StreamGroup *)v6 setupStreamsWithGroupConfig:a3]) {
        return v6;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:]();
      }
    }
LABEL_27:

    return 0;
  }
  return v6;
}

- (VCMediaNegotiationBlobV2StreamGroup)initWithStreamGroupConfig:(id)a3
{
  id v5 = +[VCMediaNegotiationBlobV2StreamGroup defaultsForStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "defaultsForStreamGroup:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupFromStreamGroupID:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupFromStreamGroupID:", [a3 groupID]));
  if (v5)
  {
    return [(VCMediaNegotiationBlobV2StreamGroup *)self initWithStreamGroupConfig:a3 defaultConfig:v5];
  }
  else
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:]();
      }
    }
    return 0;
  }
}

- (int)getStreamGroupConfig:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v14 = -2142961633;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:]();
      }
    }
    goto LABEL_22;
  }
  id v5 = +[VCMediaNegotiationBlobV2StreamGroup defaultsForStreamGroup:[(VCMediaNegotiationBlobV2StreamGroup *)self streamGroup]];
  if (!v5)
  {
    int v14 = -2142961648;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:]();
      }
    }
LABEL_22:
    id v7 = 0;
LABEL_23:

    return v14;
  }
  uint64_t v6 = v5;
  unsigned int v16 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:[(VCMediaNegotiationBlobV2StreamGroup *)self streamGroup]];
  id v7 = v6;
  objc_msgSend(v7, "setMediaType:", objc_msgSend(v6, "mediaType"));
  objc_msgSend(v7, "setMediaSubtype:", objc_msgSend(v6, "mediaSubtype"));
  objc_msgSend(v7, "setSyncGroupID:", objc_msgSend(v6, "syncGroupID"));
  objc_msgSend(v7, "setU1Config:", -[VCMediaNegotiationBlobV2SettingsU1 u1Config](-[VCMediaNegotiationBlobV2StreamGroup settingsU1](self, "settingsU1"), "u1Config"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(VCMediaNegotiationBlobV2StreamGroup *)self streams];
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v8);
      }
      if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "usesPayloadConfigsWithGroupID:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", self->_streamGroup)))break; {
      if (v10 == ++v12)
      }
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    if ([(VCMediaNegotiationBlobV2StreamGroup *)self updatePayloadConfigsWithStreamGroupConfig:v7 rtpSampleRates:v13])
    {
      goto LABEL_13;
    }
    int v14 = -2142961633;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:].cold.4();
      }
    }
    goto LABEL_23;
  }
LABEL_11:
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
LABEL_13:
  if (![(VCMediaNegotiationBlobV2StreamGroup *)self appendStreamsToStreamGroupConfig:v7 streamGroupID:v16 rtpSampleRates:v13])
  {
    int v14 = -2142961633;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:]();
      }
    }
    goto LABEL_23;
  }
  +[VCMediaNegotiationBlobV2StreamGroup updateParentStreamIDForGroupConfig:v7];
  int v14 = 0;
  *a3 = v7;
  return v14;
}

- (unsigned)codecIndexForType:(int64_t)a3 inPayloadConfigurations:(id)a4
{
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) codecIndexForType:inPayloadConfigurations:]();
      }
    }
    return -1;
  }
  if (![a4 count]) {
    return -1;
  }
  uint64_t v6 = 0;
  unsigned __int8 v7 = 0;
  while (objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v6), "codecType") != a3)
  {
    uint64_t v6 = ++v7;
    if ([a4 count] <= (unint64_t)v7) {
      return -1;
    }
  }
  return v7;
}

- (void)appendV2PayloadsToStreamConfig:(id)a3 streamGroupConfig:(id)a4
{
  if (a4)
  {
    if (a3)
    {
      if ([a4 groupID] == 1835623282)
      {
        id v7 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:1835623282];
        uint64_t v8 = [(VCMediaNegotiationBlobV2StreamGroup *)self codecIndexForType:20 inPayloadConfigurations:v7];
        if (v8 == 255)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendV2PayloadsToStreamConfig:streamGroupConfig:](v12);
            }
          }
        }
        else
        {
          uint64_t v9 = v8;
          if ([v7 count] > (unint64_t)v8)
          {
            uint64_t v10 = [v7 objectAtIndex:v9];
            if (v10)
            {
              uint64_t v11 = v10;
              [a3 addCodec:v9];
              [a4 addCodecConfig:v11];
            }
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendV2PayloadsToStreamConfig:streamGroupConfig:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendV2PayloadsToStreamConfig:streamGroupConfig:]();
    }
  }
}

- (BOOL)appendStreamsToStreamGroupConfig:(id)a3 streamGroupID:(unsigned int)a4 rtpSampleRates:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = [(VCMediaNegotiationBlobV2StreamGroup *)self streams];
  uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v67 objects:v66 count:16];
  if (v37)
  {
    uint64_t v6 = 0;
    uint64_t v36 = *(void *)v68;
    id v41 = a3;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v68 != v36) {
          objc_enumerationMutation(obj);
        }
        v42 = *(void **)(*((void *)&v67 + 1) + 8 * v7);
        uint64_t v8 = objc_msgSend(v42, "streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:", objc_msgSend(a3, "codecConfigs"), a5, a4);
        if (!v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v28 = VRTraceErrorLogLevelToCSTR();
            long long v29 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v30 = [v42 streamIndex];
              v31 = FourccToCStr(a4);
              *(_DWORD *)buf = 136316162;
              uint64_t v52 = v28;
              __int16 v53 = 2080;
              v54 = "-[VCMediaNegotiationBlobV2StreamGroup(Utils) appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:]";
              __int16 v55 = 1024;
              int v56 = 183;
              __int16 v57 = 1024;
              int v58 = v30;
              __int16 v59 = 2080;
              *(void *)v60 = v31;
              _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to process the stream config (streamIndex=%d) for streamGroupID=%s. Skipping remaining streams", buf, 0x2Cu);
            }
          }
          goto LABEL_39;
        }
        uint64_t v9 = v8;
        uint64_t v39 = v7;
        v40 = v6;
        if ([v8 v2StreamID]) {
          [(VCMediaNegotiationBlobV2StreamGroup *)self appendV2PayloadsToStreamConfig:v9 streamGroupConfig:a3];
        }
        uint64_t v44 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v10 = (void *)[MEMORY[0x1E4F1CA80] set];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v45 = (id)[v9 codecs];
        uint64_t v11 = [v45 countByEnumeratingWithState:&v62 objects:v61 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v63 != v13) {
                objc_enumerationMutation(v45);
              }
              uint64_t v15 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              unsigned int v16 = objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "objectAtIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
              if ([v16 cipherSuite] < 4)
              {
                uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "cipherSuite"));
                uint64_t v22 = (void *)v44;
              }
              else
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                {
                  uint64_t v17 = VRTraceErrorLogLevelToCSTR();
                  long long v18 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    int v19 = [v16 cipherSuite];
                    int v20 = [v42 streamIndex];
                    long long v21 = FourccToCStr(a4);
                    *(_DWORD *)buf = 136316418;
                    uint64_t v52 = v17;
                    __int16 v53 = 2080;
                    v54 = "-[VCMediaNegotiationBlobV2StreamGroup(Utils) appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:]";
                    __int16 v55 = 1024;
                    int v56 = 194;
                    __int16 v57 = 1024;
                    int v58 = v19;
                    __int16 v59 = 1024;
                    *(_DWORD *)v60 = v20;
                    a3 = v41;
                    *(_WORD *)&v60[4] = 2080;
                    *(void *)&v60[6] = v21;
                    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown cipherSuite=%d (streamIndex=%d) for streamGroupID=%s. Skipping remaining streams", buf, 0x32u);
                  }
                }
                uint64_t v22 = v10;
                uint64_t v23 = (uint64_t)v15;
              }
              [v22 addObject:v23];
            }
            uint64_t v12 = [v45 countByEnumeratingWithState:&v62 objects:v61 count:16];
          }
          while (v12);
        }
        uint64_t v6 = v40;
        if (v40) {
          [v40 intersectSet:v44];
        }
        else {
          uint64_t v6 = (void *)v44;
        }
        if (![v6 count]) {
          goto LABEL_39;
        }
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v24 = [v10 countByEnumeratingWithState:&v47 objects:v46 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v48 != v26) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend(v9, "removeCodec:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "unsignedIntValue"));
            }
            uint64_t v25 = [v10 countByEnumeratingWithState:&v47 objects:v46 count:16];
          }
          while (v25);
        }
        a3 = v41;
        [v41 addStreamConfig:v9];
        uint64_t v7 = v39 + 1;
      }
      while (v39 + 1 != v37);
      uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v67 objects:v66 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }
LABEL_39:
  uint64_t v32 = objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count");
  if (!v32 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:]();
    }
  }
  return v32 != 0;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  uint64_t v6 = [(VCMediaNegotiationBlobV2StreamGroup *)self getStreamGroupConfig:&v31];
  id v7 = a4;
  uint64_t v8 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@Stream Group: ", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroup data](self, "data"), "length"), a4];
  if (v31)
  {
    uint64_t v9 = FourccToCStr([v31 groupID]);
    uint64_t v10 = FourccToCStr([v31 mediaType]);
    objc_msgSend(v8, "appendFormat:", @"groupID='%s' mediaType='%s' subtype='%s'", v9, v10, FourccToCStr(objc_msgSend(v31, "mediaSubtype")));
    if ([v31 syncGroupID]) {
      objc_msgSend(v8, "appendFormat:", @" syncGroupID='%s'", FourccToCStr(objc_msgSend(v31, "syncGroupID")));
    }
    [v8 appendFormat:@" encodeDecodeFeatures=%@", objc_msgSend((id)objc_msgSend(v31, "u1Config"), "videoFeatureStringsFixedPosition")];
  }
  else
  {
    objc_msgSend(v8, "appendFormat:", @"Skipping (result=%x)", v6);
  }
  char v11 = [v8 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v12, v13, v14, v15, v16, v17, v11);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    int v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v43 = v18;
      __int16 v44 = 2080;
      id v45 = "-[VCMediaNegotiationBlobV2StreamGroup(Utils) printWithLogFile:prefix:]";
      __int16 v46 = 1024;
      int v47 = 236;
      __int16 v48 = 2112;
      long long v49 = v8;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
  if (v31)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v20 = (void *)[v31 streamConfigs];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          +[VCMediaNegotiationBlobV2StreamGroupStream printWithLogFile:prefix:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "printWithLogFile:prefix:streamConfig:", a3, [NSString stringWithFormat:@"%@  ", v7], *(void *)(*((void *)&v38 + 1) + 8 * i));
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v37 count:16];
      }
      while (v22);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v25 = (void *)[v31 codecConfigs];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v32 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          +[VCMediaNegotiationBlobV2StreamGroupPayload printWithLogFile:prefix:payloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "printWithLogFile:prefix:payloadConfig:", a3, [NSString stringWithFormat:@"%@  ", v7], *(void *)(*((void *)&v33 + 1) + 8 * j));
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v32 count:16];
      }
      while (v27);
    }
  }
}

+ (id)defaultsForStreamGroup:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      return 0;
    case 1u:
      uint64_t v3 = 875704438;
      uint64_t v4 = 1667329381;
      uint64_t v5 = 1986618469;
      goto LABEL_21;
    case 2u:
      uint64_t v4 = 1835623282;
      goto LABEL_18;
    case 3u:
      uint64_t v4 = 1935897189;
      uint64_t v5 = 1986618469;
      uint64_t v3 = 875704422;
      uint64_t v6 = 1937339233;
      goto LABEL_22;
    case 4u:
      uint64_t v4 = 1937339233;
      uint64_t v5 = 1936684398;
      uint64_t v3 = 1819304813;
      goto LABEL_21;
    case 5u:
      uint64_t v3 = 875704438;
      uint64_t v4 = 1667329399;
      uint64_t v6 = 1835623287;
      uint64_t v5 = 1986618469;
      goto LABEL_8;
    case 6u:
      uint64_t v4 = 1835623287;
      uint64_t v5 = 1936684398;
      uint64_t v3 = 1819304813;
      uint64_t v6 = 0;
LABEL_8:
      uint64_t v7 = 1;
      goto LABEL_23;
    case 7u:
      uint64_t v4 = 1667330164;
      uint64_t v5 = 1835365473;
      uint64_t v3 = 1667330164;
      goto LABEL_21;
    case 0xBu:
      uint64_t v4 = 1936290409;
LABEL_18:
      uint64_t v5 = 1936684398;
      uint64_t v3 = 1819304813;
      uint64_t v6 = 0;
      goto LABEL_22;
    case 0xCu:
      if (+[VCHardwareSettings deviceClass] != 8) {
        return 0;
      }
      uint64_t v4 = 1718909044;
      uint64_t v5 = 1986618469;
      uint64_t v3 = 875704422;
      goto LABEL_21;
    case 0xDu:
      if (+[VCHardwareSettings deviceClass] != 8) {
        return 0;
      }
      uint64_t v4 = 1717854580;
      uint64_t v5 = 1835365473;
      uint64_t v3 = 1835887209;
      goto LABEL_21;
    case 0xEu:
      if (+[VCHardwareSettings deviceClass] != 8) {
        return 0;
      }
      uint64_t v4 = 1650745716;
      uint64_t v5 = 1835365473;
      uint64_t v3 = 1717657974;
LABEL_21:
      uint64_t v6 = 1835623282;
LABEL_22:
      uint64_t v7 = 3;
LABEL_23:
      return +[VCMediaNegotiatorStreamGroupConfiguration streamGroupConfigWithGroupID:v4 mediaType:v5 subtype:v3 syncGroupID:v6 cipherSuite:v7];
    default:
      return +[VCMediaNegotiationBlobV2StreamGroup defaultsForStreamGroupCustom:](VCMediaNegotiationBlobV2StreamGroup, "defaultsForStreamGroupCustom:");
  }
}

+ (id)defaultsForStreamGroupCustom:(unsigned int)a3
{
  switch(a3)
  {
    case 0x64617431u:
      uint64_t v3 = 1751474550;
      uint64_t v4 = 1684108337;
      goto LABEL_6;
    case 0x64617432u:
      uint64_t v4 = 1684108338;
      uint64_t v3 = 1717657974;
LABEL_6:
      uint64_t v6 = 1835365473;
      break;
    case 0x64617433u:
      uint64_t v4 = 1684108339;
      uint64_t v6 = 1835365473;
      uint64_t v3 = 1751212406;
      break;
    case 0x64617434u:
      uint64_t v4 = 1684108340;
      uint64_t v6 = 1835365473;
      uint64_t v3 = 1651466614;
      break;
    case 0x64617435u:
      uint64_t v4 = 1684108341;
      uint64_t v6 = 1835365473;
      uint64_t v3 = 1701142902;
      break;
    default:
      switch(a3)
      {
        case 0x76696431u:
          uint64_t v4 = 1986618417;
          goto LABEL_17;
        case 0x76696432u:
          uint64_t v4 = 1986618418;
          goto LABEL_17;
        case 0x76696433u:
          uint64_t v4 = 1986618419;
          goto LABEL_17;
        case 0x76696434u:
          uint64_t v4 = 1986618420;
LABEL_17:
          uint64_t v6 = 1986618469;
          uint64_t v3 = 875704422;
          goto LABEL_18;
        default:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v7 = VRTraceErrorLogLevelToCSTR();
            uint64_t v8 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              +[VCMediaNegotiationBlobV2StreamGroup(Utils) defaultsForStreamGroupCustom:v8];
            }
          }
          return 0;
      }
  }
LABEL_18:

  return +[VCMediaNegotiatorStreamGroupConfiguration streamGroupConfigWithGroupID:v4 mediaType:v6 subtype:v3 syncGroupID:1835623282 cipherSuite:3];
}

- (BOOL)isDefaultPayloadConfigsWithStreamGroupConfig:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = (void *)[a3 streamConfigs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = +[VCMediaNegotiationBlobV2StreamGroupStream isDefaultPayloadConfigsWithStreamConfig:payloadConfigs:streamGroupID:](VCMediaNegotiationBlobV2StreamGroupStream, "isDefaultPayloadConfigsWithStreamConfig:payloadConfigs:streamGroupID:", *(void *)(*((void *)&v12 + 1) + 8 * v8), [a3 codecConfigs], objc_msgSend(a3, "groupID"));
      if (!v9) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (id)customPayloadConfigStateWithStreamGroupConfig:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count"));
  if (objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count"))
  {
    unsigned int v5 = 1;
    uint64_t v6 = MEMORY[0x1E4F1CC28];
    do
      [v4 addObject:v6];
    while (objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count") > (unint64_t)v5++);
  }
  return v4;
}

- (BOOL)setupStreamsWithGroupConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned int v5 = (void *)[a3 streamConfigs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = -[VCMediaNegotiationBlobV2StreamGroupStream initWithStreamConfig:payloadConfigs:streamGroupID:]([VCMediaNegotiationBlobV2StreamGroupStream alloc], "initWithStreamConfig:payloadConfigs:streamGroupID:", *(void *)(*((void *)&v15 + 1) + 8 * v9), [a3 codecConfigs], objc_msgSend(a3, "groupID"));
      if (!v10) {
        break;
      }
      char v11 = v10;
      [(VCMediaNegotiationBlobV2StreamGroup *)self addStreams:v10];

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) setupStreamsWithGroupConfig:]();
    }
    LOBYTE(v12) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)isUsedPayloadConfigAtIndex:(id)a3 streamGroupConfig:(id)a4 rtpTimestampRate:(unsigned int *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = (void *)[a4 streamConfigs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "codecs"), "containsObject:", a3))
        {
          *a5 = [v12 rtpTimestampRate];
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v8;
}

- (BOOL)setupPayloadsWithGroupConfig:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v18 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = (id)[a3 codecConfigs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
      if (!-[VCMediaNegotiationBlobV2StreamGroup isUsedPayloadConfigAtIndex:streamGroupConfig:rtpTimestampRate:](self, "isUsedPayloadConfigAtIndex:streamGroupConfig:rtpTimestampRate:", [NSNumber numberWithUnsignedInt:v7 + v9], a3, &v18))break; {
      uint64_t v11 = [VCMediaNegotiationBlobV2StreamGroupPayload alloc];
      }
      uint64_t v12 = -[VCMediaNegotiationBlobV2StreamGroupPayload initWithPayloadConfig:index:rtpSampleRate:streamGroupID:](v11, "initWithPayloadConfig:index:rtpSampleRate:streamGroupID:", v10, v7 + v9, v18, [a3 groupID]);
      if (!v12)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v14) {
            return v14;
          }
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) setupPayloadsWithGroupConfig:]();
        }
        goto LABEL_18;
      }
      long long v13 = (void *)v12;
      [(VCMediaNegotiationBlobV2StreamGroup *)self addPayloads:v12];

      if (v6 == ++v9)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v19 count:16];
        uint64_t v7 = (v7 + v9);
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) setupPayloadsWithGroupConfig:](v15);
    }
LABEL_18:
    LOBYTE(v14) = 0;
    return v14;
  }
LABEL_10:
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)updatePayloadConfigsWithStreamGroupConfig:(id)a3 rtpSampleRates:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:self->_streamGroup];
  uint64_t v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:v7];
  id v9 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:v7];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [(VCMediaNegotiationBlobV2StreamGroup *)self payloads];
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v27 = v9;
    unsigned int v28 = v8;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v31;
LABEL_3:
    uint64_t v15 = 0;
    uint64_t v16 = v13;
    while (1)
    {
      if (*(void *)v31 != v14) {
        objc_enumerationMutation(v10);
      }
      long long v17 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
      uint64_t v18 = objc_msgSend(v17, "payloadConfigurationWithStreamGroupID:index:", v7, v16 + v15, v27);
      if (!v18) {
        break;
      }
      uint64_t v19 = v18;
      uint64_t v20 = [v17 rtpSampleRateWithStreamGroupID:v7];
      objc_msgSend(a4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v20));
      [a3 addCodecConfig:v19];
      if (v12 == ++v15)
      {
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v29 count:16];
        uint64_t v13 = (v16 + v15);
        if (v12) {
          goto LABEL_3;
        }
        unsigned int v21 = v16 + v15;
        uint64_t v8 = v28;
        id v9 = v27;
        goto LABEL_11;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v25) {
        return v25;
      }
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) updatePayloadConfigsWithStreamGroupConfig:rtpSampleRates:]();
    }
    LOBYTE(v25) = 0;
  }
  else
  {
    unsigned int v21 = 0;
LABEL_11:
    if ([v9 count] > (unint64_t)v21)
    {
      uint64_t v22 = v21;
      unsigned int v23 = v21 + 1;
      do
      {
        if (objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v22), "codecType") != 102
          || +[VCHardwareSettings supportsHEVCEncoding])
        {
          objc_msgSend(a4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8));
          objc_msgSend(a3, "addCodecConfig:", objc_msgSend(v9, "objectAtIndex:", v22));
        }
        uint64_t v22 = v23;
      }
      while ([v9 count] > (unint64_t)v23++);
    }
    LOBYTE(v25) = 1;
  }
  return v25;
}

- (void)updateDefaultPayloadConfigsWithConfig:(id)a3 rtpSampleRates:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultPayloadConfigurationsForStreamGroupID:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:self->_streamGroup]);
  uint64_t v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultRTPSampleRateForStreamGroupID:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:self->_streamGroup]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        [a3 addCodecConfig:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
        objc_msgSend(a4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v10);
  }
}

+ (void)updateParentStreamIDForGroupConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (void *)[a3 streamConfigs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned __int16 v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isTemporalStream])
        {
          if (v6) {
            [v9 setParentStreamID:v6];
          }
          unsigned __int16 v6 = [v9 streamID];
        }
        else
        {
          unsigned __int16 v6 = 0;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v5);
  }
}

+ (id)negotiationCipherSuiteAsString:(unsigned int)a3
{
  if (a3 >= 4) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", *(void *)&a3);
  }
  else {
    return off_1E6DB8468[a3];
  }
}

+ (BOOL)isValidStreamGroupIDFromConfig:(id)a3 defaultConfig:(id)a4
{
  if (!a4) {
    return 0;
  }
  int v6 = [a3 mediaType];
  if (v6 != [a4 mediaType]) {
    return 0;
  }
  int v7 = [a3 mediaSubtype];
  if (v7 != [a4 mediaSubtype]) {
    return 0;
  }
  int v8 = [a3 syncGroupID];
  return v8 == [a4 syncGroupID];
}

+ (unsigned)streamGroupFromStreamGroupID:(unsigned int)a3
{
  unsigned int result = a3;
  if ((int)a3 <= 1718909043)
  {
    if ((int)a3 <= 1667330163)
    {
      switch(a3)
      {
        case 0x62646174u:
          return 14;
        case 0x63616D65u:
          return 1;
        case 0x63616D77u:
          return 5;
      }
    }
    else
    {
      if (a3 - 1684108337 < 5) {
        return result;
      }
      if (a3 == 1667330164) {
        return 7;
      }
      if (a3 == 1717854580) {
        return 13;
      }
    }
    return 0;
  }
  if ((int)a3 <= 1936290408)
  {
    if ((int)a3 > 1835623286)
    {
      if (a3 == 1835623287) {
        return 6;
      }
      if (a3 == 1935897189) {
        return 3;
      }
    }
    else
    {
      if (a3 == 1718909044) {
        return 12;
      }
      if (a3 == 1835623282) {
        return 2;
      }
    }
    return 0;
  }
  if (a3 - 1986618417 >= 4)
  {
    if (a3 == 1936290409) {
      return 11;
    }
    if (a3 == 1937339233) {
      return 4;
    }
    return 0;
  }
  return result;
}

+ (unsigned)streamGroupIDFromStreamGroup:(unsigned int)a3
{
  unsigned int result = 1667329381;
  switch(a3)
  {
    case 1u:
      return result;
    case 2u:
      unsigned int result = 1835623282;
      break;
    case 3u:
      unsigned int result = 1935897189;
      break;
    case 4u:
      unsigned int result = 1937339233;
      break;
    case 5u:
      unsigned int result = 1667329399;
      break;
    case 6u:
      unsigned int result = 1835623287;
      break;
    case 7u:
      unsigned int result = 1667330164;
      break;
    case 8u:
    case 9u:
    case 0xAu:
LABEL_7:
      unsigned int result = 0;
      break;
    case 0xBu:
      unsigned int result = 1936290409;
      break;
    case 0xCu:
      unsigned int result = 1718909044;
      break;
    case 0xDu:
      unsigned int result = 1717854580;
      break;
    case 0xEu:
      unsigned int result = 1650745716;
      break;
    default:
      unsigned int result = a3;
      if (!v4 & v3)
      {
        switch(a3)
        {
          case 0x76696431u:
          case 0x76696432u:
          case 0x76696433u:
          case 0x76696434u:
            return result;
          default:
            goto LABEL_7;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x64617431u:
          case 0x64617432u:
          case 0x64617433u:
          case 0x64617434u:
          case 0x64617435u:
            return result;
          default:
            JUMPOUT(0);
        }
      }
  }
  return result;
}

@end