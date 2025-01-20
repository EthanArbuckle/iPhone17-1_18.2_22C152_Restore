@interface MTRPluginPBMDeviceNodeDownloadDiagnosticLog
+ (id)deviceNodeDownloadDiagnosticLogMessageFromMessage:(id)a3;
+ (id)deviceNodeDownloadDiagnosticLogOfType:(int64_t)a3 timeout:(double)a4 nodeID:(id)a5;
+ (id)urlFromResponsePayload:(id)a3 error:(id *)a4;
- (BOOL)hasHeader;
- (BOOL)hasLogType;
- (BOOL)hasNode;
- (BOOL)hasTimeoutInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMDeviceNode)node;
- (MTRPluginPBMHeader)header;
- (double)timeoutInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)logType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLogType:(BOOL)a3;
- (void)setHasTimeoutInterval:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setLogType:(int)a3;
- (void)setNode:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceNodeDownloadDiagnosticLog

+ (id)deviceNodeDownloadDiagnosticLogMessageFromMessage:(id)a3
{
  id v3 = a3;
  v4 = [MTRPluginPBMDeviceNodeDownloadDiagnosticLog alloc];
  v5 = [v3 messageData];

  v6 = [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)v4 initWithData:v5];
  if ([(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)deviceNodeDownloadDiagnosticLogOfType:(int64_t)a3 timeout:(double)a4 nodeID:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(MTRPluginPBMDeviceNodeDownloadDiagnosticLog);
  v9 = +[MTRPluginPBMDeviceNode deviceNodeWithNodeID:v7];

  [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)v8 setNode:v9];
  [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)v8 setLogType:a3];
  [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)v8 setTimeoutInterval:a4];
  return v8;
}

- (BOOL)isValid
{
  if (![(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)self hasHeader]) {
    return 0;
  }
  id v3 = [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)self header];
  if ([v3 isValid]
    && [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)self hasNode])
  {
    v4 = [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)self node];
    if ([v4 isValid]) {
      BOOL v5 = [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)self hasLogType];
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)urlFromResponsePayload:(id)a3 error:(id *)a4
{
  v33[1] = *(id *)MEMORY[0x263EF8340];
  v6 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a3];
  id v7 = [v6 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 object];

    if (v8)
    {
      v9 = NSTemporaryDirectory();
      v10 = [v9 stringByAppendingPathComponent:@"com.apple.homed"];

      v11 = [MEMORY[0x263F08850] defaultManager];
      v33[0] = 0;
      char v12 = [v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:v33];
      id v13 = v33[0];

      if (v12)
      {
        id v14 = v10;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog(Helpers) urlFromResponsePayload:error:].cold.5((uint64_t)v10, (uint64_t)v13);
        }
        id v14 = 0;
      }

      v16 = [v14 stringByAppendingString:@"/Matter/DiagnosticLog/"];
      uint64_t v32 = *MEMORY[0x263F08078];
      v33[0] = &unk_27046AB78;
      v17 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v18 = [MEMORY[0x263F08850] defaultManager];
      unsigned __int8 v31 = 0;
      if ([v18 fileExistsAtPath:v16 isDirectory:&v31])
      {
        id v19 = 0;
        if (v31)
        {
LABEL_16:
          id v29 = v19;
          [v18 setAttributes:v17 ofItemAtPath:v16 error:&v29];
          id v20 = v29;

          id v19 = v20;
LABEL_20:
          int v22 = v31;

          if (v22) {
            id v23 = v16;
          }
          else {
            id v23 = 0;
          }

          if (v23)
          {
            v24 = [MEMORY[0x263F08C38] UUID];
            v25 = [v24 UUIDString];
            v26 = [v23 stringByAppendingString:v25];

            v27 = [MEMORY[0x263F08850] defaultManager];
            if ([v27 createFileAtPath:v26 contents:v8 attributes:0])
            {
              v15 = [NSURL fileURLWithPath:v26];
            }
            else if (a4)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog(Helpers) urlFromResponsePayload:error:]();
              }
              [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1011 userInfo:0];
              v15 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v15 = 0;
            }
          }
          else if (a4)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog(Helpers) urlFromResponsePayload:error:]((uint64_t)a1);
            }
            [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1011 userInfo:0];
            v15 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }

          goto LABEL_38;
        }
      }
      else
      {
        id v30 = 0;
        int v21 = [v18 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:v17 error:&v30];
        id v19 = v30;
        unsigned __int8 v31 = v21;
        if (v21) {
          goto LABEL_16;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog(Helpers) urlFromResponsePayload:error:].cold.4();
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  if (a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog(Helpers) urlFromResponsePayload:error:]((uint64_t)a1);
    }
    [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1008 userInfo:0];
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_38:

  return v15;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasNode
{
  return self->_node != 0;
}

- (void)setLogType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_logType = a3;
}

- (void)setHasLogType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLogType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeoutInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeoutInterval = a3;
}

- (void)setHasTimeoutInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeoutInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceNodeDownloadDiagnosticLog;
  v4 = [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)&v8 description];
  BOOL v5 = [(MTRPluginPBMDeviceNodeDownloadDiagnosticLog *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    BOOL v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  node = self->_node;
  if (node)
  {
    id v7 = [(MTRPluginPBMDeviceNode *)node dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"node"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_logType];
    [v3 setObject:v9 forKey:@"logType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = [NSNumber numberWithDouble:self->_timeoutInterval];
    [v3 setObject:v10 forKey:@"timeoutInterval"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceNodeDownloadDiagnosticLogReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_node)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v6;
  }
  if (self->_node)
  {
    objc_msgSend(v6, "setNode:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_logType;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timeoutInterval;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(MTRPluginPBMDeviceNode *)self->_node copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_logType;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timeoutInterval;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[MTRPluginPBMHeader isEqual:](header, "isEqual:")) {
      goto LABEL_15;
    }
  }
  node = self->_node;
  if ((unint64_t)node | *((void *)v4 + 4))
  {
    if (!-[MTRPluginPBMDeviceNode isEqual:](node, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_logType != *((_DWORD *)v4 + 6)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timeoutInterval != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTRPluginPBMHeader *)self->_header hash];
  unint64_t v4 = [(MTRPluginPBMDeviceNode *)self->_node hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_logType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timeoutInterval = self->_timeoutInterval;
  double v7 = -timeoutInterval;
  if (timeoutInterval >= 0.0) {
    double v7 = self->_timeoutInterval;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
  id v10 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMDeviceNodeDownloadDiagnosticLog setHeader:](self, "setHeader:");
  }
  id v4 = v10;
LABEL_7:
  node = self->_node;
  uint64_t v8 = *((void *)v4 + 4);
  if (node)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MTRPluginPBMDeviceNode mergeFrom:](node, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MTRPluginPBMDeviceNodeDownloadDiagnosticLog setNode:](self, "setNode:");
  }
  id v4 = v10;
LABEL_13:
  char v9 = *((unsigned char *)v4 + 40);
  if ((v9 & 2) != 0)
  {
    self->_logType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v4 + 40);
  }
  if (v9)
  {
    self->_double timeoutInterval = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (MTRPluginPBMHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (MTRPluginPBMDeviceNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (int)logType
{
  return self->_logType;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end