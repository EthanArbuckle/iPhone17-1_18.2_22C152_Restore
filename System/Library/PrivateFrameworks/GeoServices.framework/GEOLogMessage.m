@interface GEOLogMessage
+ (BOOL)isValid:(id)a3;
+ (Class)logMsgEventType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasGroupRetryCount;
- (BOOL)hasLogMessageType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMessage)initWithDictionary:(id)a3;
- (GEOLogMessage)initWithJSON:(id)a3;
- (NSMutableArray)logMsgEvents;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)logMessageTypeAsString:(int)a3;
- (id)logMsgEventAtIndex:(unint64_t)a3;
- (int)StringAsLogMessageType:(id)a3;
- (int)logMessageType;
- (unint64_t)hash;
- (unint64_t)logMsgEventsCount;
- (unsigned)groupRetryCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addLogMsgEvent:(id)a3;
- (void)clearLogMsgEvents;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroupRetryCount:(unsigned int)a3;
- (void)setHasGroupRetryCount:(BOOL)a3;
- (void)setHasLogMessageType:(BOOL)a3;
- (void)setLogMessageType:(int)a3;
- (void)setLogMsgEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMessage

- (void).cxx_destruct
{
}

- (void)setLogMessageType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_logMessageType = a3;
}

- (void)addLogMsgEvent:(id)a3
{
  id v4 = a3;
  logMsgEvents = self->_logMsgEvents;
  id v8 = v4;
  if (!logMsgEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_logMsgEvents;
    self->_logMsgEvents = v6;

    id v4 = v8;
    logMsgEvents = self->_logMsgEvents;
  }
  [(NSMutableArray *)logMsgEvents addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_logMsgEvents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
}

- (NSMutableArray)logMsgEvents
{
  return self->_logMsgEvents;
}

- (void)setLogMsgEvents:(id)a3
{
}

- (void)clearLogMsgEvents
{
}

- (unint64_t)logMsgEventsCount
{
  return [(NSMutableArray *)self->_logMsgEvents count];
}

- (id)logMsgEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_logMsgEvents objectAtIndex:a3];
}

+ (Class)logMsgEventType
{
  return (Class)objc_opt_class();
}

- (int)logMessageType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_logMessageType;
  }
  else {
    return 0;
  }
}

- (void)setHasLogMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLogMessageType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)logMessageTypeAsString:(int)a3
{
  if (a3 <= 11999)
  {
    id v4 = @"LOG_MESSAGE_TYPE_UNKNOWN";
    switch(a3)
    {
      case 0:
        goto LABEL_64;
      case 1:
        id v4 = @"DEBUGLOG";
        return v4;
      case 2:
        id v4 = @"CURATED_COLLECTION_SESSION";
        return v4;
      case 3:
        id v4 = @"FIFTEEN_MONTH_SESSION";
        return v4;
      case 4:
        id v4 = @"PRESSURE_DATA_SESSION";
        return v4;
      case 5:
        id v4 = @"POI_BUSYNESS_DATA_SESSION";
        return v4;
      case 6:
        id v4 = @"FIFTEEN_MONTH_USER_SESSION";
        return v4;
      case 7:
        id v4 = @"NETWORK_SELECTION_HARVEST_SESSION";
        return v4;
      default:
        if (a3 == 10000)
        {
          id v4 = @"USAGE";
        }
        else
        {
          if (a3 != 11000) {
            goto LABEL_63;
          }
          id v4 = @"SHORT_SESSION_USAGE";
        }
        break;
    }
  }
  else if (a3 > 29999)
  {
    switch(a3)
    {
      case 50000:
        id v4 = @"REALTIME_TRAFFIC_PROBE";
        break;
      case 50001:
        id v4 = @"BATCH_TRAFFIC_PROBE";
        break;
      case 50002:
        id v4 = @"WIFI_CONNECTION_QUALITY_PROBE_COLLECTION";
        break;
      case 50003:
        id v4 = @"LOG_DISCARD_EVENT";
        break;
      default:
        if (a3 == 30000)
        {
          id v4 = @"NAVIGATION_TRACE";
        }
        else
        {
          if (a3 != 40000) {
            goto LABEL_63;
          }
          id v4 = @"TELEMETRY";
        }
        break;
    }
  }
  else
  {
    if (a3 <= 13999)
    {
      if (a3 == 12000)
      {
        id v4 = @"LONG_SESSION_USAGE";
        return v4;
      }
      if (a3 == 13000)
      {
        id v4 = @"SESSIONLESS_USAGE";
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 14000:
          id v4 = @"LONG_SESSION_LOG_FRAMEWORK_USAGE";
          return v4;
        case 15000:
          id v4 = @"COHORTS_SESSION_USAGE";
          return v4;
        case 20000:
          id v4 = @"PERFORMANCE";
          return v4;
      }
    }
LABEL_63:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_64:
  }
  return v4;
}

- (int)StringAsLogMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOG_MESSAGE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEBUGLOG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_SESSION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FIFTEEN_MONTH_SESSION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PRESSURE_DATA_SESSION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"POI_BUSYNESS_DATA_SESSION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FIFTEEN_MONTH_USER_SESSION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NETWORK_SELECTION_HARVEST_SESSION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"USAGE"])
  {
    int v4 = 10000;
  }
  else if ([v3 isEqualToString:@"SHORT_SESSION_USAGE"])
  {
    int v4 = 11000;
  }
  else if ([v3 isEqualToString:@"LONG_SESSION_USAGE"])
  {
    int v4 = 12000;
  }
  else if ([v3 isEqualToString:@"SESSIONLESS_USAGE"])
  {
    int v4 = 13000;
  }
  else if ([v3 isEqualToString:@"LONG_SESSION_LOG_FRAMEWORK_USAGE"])
  {
    int v4 = 14000;
  }
  else if ([v3 isEqualToString:@"COHORTS_SESSION_USAGE"])
  {
    int v4 = 15000;
  }
  else if ([v3 isEqualToString:@"PERFORMANCE"])
  {
    int v4 = 20000;
  }
  else if ([v3 isEqualToString:@"NAVIGATION_TRACE"])
  {
    int v4 = 30000;
  }
  else if ([v3 isEqualToString:@"TELEMETRY"])
  {
    int v4 = 40000;
  }
  else if ([v3 isEqualToString:@"REALTIME_TRAFFIC_PROBE"])
  {
    int v4 = 50000;
  }
  else if ([v3 isEqualToString:@"BATCH_TRAFFIC_PROBE"])
  {
    int v4 = 50001;
  }
  else if ([v3 isEqualToString:@"WIFI_CONNECTION_QUALITY_PROBE_COLLECTION"])
  {
    int v4 = 50002;
  }
  else if ([v3 isEqualToString:@"LOG_DISCARD_EVENT"])
  {
    int v4 = 50003;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMessage;
  int v4 = [(GEOLogMessage *)&v8 description];
  v5 = [(GEOLogMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_62;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 8) count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = *(id *)(a1 + 8);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          long long v12 = [v11 dictionaryRepresentation];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    if (a2) {
      long long v13 = @"logMsgEvent";
    }
    else {
      long long v13 = @"log_msg_event";
    }
    [v4 setObject:v5 forKey:v13];
  }
  char v14 = *(unsigned char *)(a1 + 24);
  if ((v14 & 2) != 0)
  {
    uint64_t v15 = *(unsigned int *)(a1 + 20);
    if ((int)v15 <= 11999)
    {
      uint64_t v16 = @"LOG_MESSAGE_TYPE_UNKNOWN";
      switch((int)v15)
      {
        case 0:
          goto LABEL_53;
        case 1:
          uint64_t v16 = @"DEBUGLOG";
          break;
        case 2:
          uint64_t v16 = @"CURATED_COLLECTION_SESSION";
          break;
        case 3:
          uint64_t v16 = @"FIFTEEN_MONTH_SESSION";
          break;
        case 4:
          uint64_t v16 = @"PRESSURE_DATA_SESSION";
          break;
        case 5:
          uint64_t v16 = @"POI_BUSYNESS_DATA_SESSION";
          break;
        case 6:
          uint64_t v16 = @"FIFTEEN_MONTH_USER_SESSION";
          break;
        case 7:
          uint64_t v16 = @"NETWORK_SELECTION_HARVEST_SESSION";
          break;
        default:
          if (v15 == 10000)
          {
            uint64_t v16 = @"USAGE";
          }
          else
          {
            if (v15 != 11000) {
              goto LABEL_41;
            }
            uint64_t v16 = @"SHORT_SESSION_USAGE";
          }
          break;
      }
      goto LABEL_53;
    }
    if ((int)v15 > 29999)
    {
      int v17 = v15 - 50000;
      uint64_t v15 = (v15 - 50000);
      switch(v17)
      {
        case 0:
          uint64_t v16 = @"REALTIME_TRAFFIC_PROBE";
          break;
        case 1:
          uint64_t v16 = @"BATCH_TRAFFIC_PROBE";
          break;
        case 2:
          uint64_t v16 = @"WIFI_CONNECTION_QUALITY_PROBE_COLLECTION";
          break;
        case 3:
          uint64_t v16 = @"LOG_DISCARD_EVENT";
          break;
        default:
          if (v15 == 30000)
          {
            uint64_t v16 = @"NAVIGATION_TRACE";
          }
          else
          {
            if (v15 != 40000) {
              goto LABEL_41;
            }
            uint64_t v16 = @"TELEMETRY";
          }
          break;
      }
      goto LABEL_53;
    }
    if ((int)v15 <= 13999)
    {
      if (v15 == 12000)
      {
        uint64_t v16 = @"LONG_SESSION_USAGE";
        goto LABEL_53;
      }
      if (v15 == 13000)
      {
        uint64_t v16 = @"SESSIONLESS_USAGE";
        goto LABEL_53;
      }
    }
    else
    {
      switch(v15)
      {
        case 0x36B0:
          uint64_t v16 = @"LONG_SESSION_LOG_FRAMEWORK_USAGE";
          goto LABEL_53;
        case 0x3A98:
          uint64_t v16 = @"COHORTS_SESSION_USAGE";
          goto LABEL_53;
        case 0x4E20:
          uint64_t v16 = @"PERFORMANCE";
LABEL_53:
          if (a2) {
            v18 = @"logMessageType";
          }
          else {
            v18 = @"log_message_type";
          }
          [v4 setObject:v16 forKey:v18];

          char v14 = *(unsigned char *)(a1 + 24);
          goto LABEL_57;
      }
    }
LABEL_41:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
LABEL_57:
  if (v14)
  {
    v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v20 = @"groupRetryCount";
    }
    else {
      v20 = @"group_retry_count";
    }
    [v4 setObject:v19 forKey:v20];
  }
LABEL_62:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMessage)initWithDictionary:(id)a3
{
  return (GEOLogMessage *)-[GEOLogMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_77;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_77;
  }
  if (a3) {
    id v6 = @"logMsgEvent";
  }
  else {
    id v6 = @"log_msg_event";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v14 = [GEOLogMsgEvent alloc];
            if (a3) {
              uint64_t v15 = [(GEOLogMsgEvent *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEOLogMsgEvent *)v14 initWithDictionary:v13];
            }
            uint64_t v16 = (void *)v15;
            [a1 addLogMsgEvent:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    id v5 = v24;
  }

  if (a3) {
    int v17 = @"logMessageType";
  }
  else {
    int v17 = @"log_message_type";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"LOG_MESSAGE_TYPE_UNKNOWN"])
    {
      uint64_t v20 = 0;
    }
    else if ([v19 isEqualToString:@"DEBUGLOG"])
    {
      uint64_t v20 = 1;
    }
    else if ([v19 isEqualToString:@"CURATED_COLLECTION_SESSION"])
    {
      uint64_t v20 = 2;
    }
    else if ([v19 isEqualToString:@"FIFTEEN_MONTH_SESSION"])
    {
      uint64_t v20 = 3;
    }
    else if ([v19 isEqualToString:@"PRESSURE_DATA_SESSION"])
    {
      uint64_t v20 = 4;
    }
    else if ([v19 isEqualToString:@"POI_BUSYNESS_DATA_SESSION"])
    {
      uint64_t v20 = 5;
    }
    else if ([v19 isEqualToString:@"FIFTEEN_MONTH_USER_SESSION"])
    {
      uint64_t v20 = 6;
    }
    else if ([v19 isEqualToString:@"NETWORK_SELECTION_HARVEST_SESSION"])
    {
      uint64_t v20 = 7;
    }
    else if ([v19 isEqualToString:@"USAGE"])
    {
      uint64_t v20 = 10000;
    }
    else if ([v19 isEqualToString:@"SHORT_SESSION_USAGE"])
    {
      uint64_t v20 = 11000;
    }
    else if ([v19 isEqualToString:@"LONG_SESSION_USAGE"])
    {
      uint64_t v20 = 12000;
    }
    else if ([v19 isEqualToString:@"SESSIONLESS_USAGE"])
    {
      uint64_t v20 = 13000;
    }
    else if ([v19 isEqualToString:@"LONG_SESSION_LOG_FRAMEWORK_USAGE"])
    {
      uint64_t v20 = 14000;
    }
    else if ([v19 isEqualToString:@"COHORTS_SESSION_USAGE"])
    {
      uint64_t v20 = 15000;
    }
    else if ([v19 isEqualToString:@"PERFORMANCE"])
    {
      uint64_t v20 = 20000;
    }
    else if ([v19 isEqualToString:@"NAVIGATION_TRACE"])
    {
      uint64_t v20 = 30000;
    }
    else if ([v19 isEqualToString:@"TELEMETRY"])
    {
      uint64_t v20 = 40000;
    }
    else if ([v19 isEqualToString:@"REALTIME_TRAFFIC_PROBE"])
    {
      uint64_t v20 = 50000;
    }
    else if ([v19 isEqualToString:@"BATCH_TRAFFIC_PROBE"])
    {
      uint64_t v20 = 50001;
    }
    else if ([v19 isEqualToString:@"WIFI_CONNECTION_QUALITY_PROBE_COLLECTION"])
    {
      uint64_t v20 = 50002;
    }
    else if ([v19 isEqualToString:@"LOG_DISCARD_EVENT"])
    {
      uint64_t v20 = 50003;
    }
    else
    {
      uint64_t v20 = 0;
    }

    goto LABEL_70;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v18 intValue];
LABEL_70:
    [a1 setLogMessageType:v20];
  }

  if (a3) {
    v21 = @"groupRetryCount";
  }
  else {
    v21 = @"group_retry_count";
  }
  long long v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setGroupRetryCount:", objc_msgSend(v22, "unsignedIntValue"));
  }

LABEL_77:
  return a1;
}

- (GEOLogMessage)initWithJSON:(id)a3
{
  return (GEOLogMessage *)-[GEOLogMessage _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMessageReadAllFrom(self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = self->_logMsgEvents;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [(GEOLogMessage *)self readAll:0];
  if ([(GEOLogMessage *)self logMsgEventsCount])
  {
    [v9 clearLogMsgEvents];
    unint64_t v4 = [(GEOLogMessage *)self logMsgEventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMessage *)self logMsgEventAtIndex:i];
        [v9 addLogMsgEvent:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 5) = self->_logMessageType;
    *((unsigned char *)v9 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v9 + 4) = self->_groupRetryCount;
    *((unsigned char *)v9 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_logMsgEvents;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addLogMsgEvent:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_logMessageType;
    *(unsigned char *)(v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_groupRetryCount;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOLogMessage *)self readAll:1];
  [v4 readAll:1];
  logMsgEvents = self->_logMsgEvents;
  if ((unint64_t)logMsgEvents | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](logMsgEvents, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_logMessageType != *((_DWORD *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_groupRetryCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMessage *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_logMsgEvents hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_logMessageType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_groupRetryCount;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMessage addLogMsgEvent:](self, "addLogMsgEvent:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 24);
  if ((v10 & 2) != 0)
  {
    self->_logMessageType = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v10 = *((unsigned char *)v4 + 24);
  }
  if (v10)
  {
    self->_groupRetryCount = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (unsigned)groupRetryCount
{
  return self->_groupRetryCount;
}

- (void)setGroupRetryCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_groupRetryCount = a3;
}

- (void)setHasGroupRetryCount:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGroupRetryCount
{
  return *(unsigned char *)&self->_flags & 1;
}

@end