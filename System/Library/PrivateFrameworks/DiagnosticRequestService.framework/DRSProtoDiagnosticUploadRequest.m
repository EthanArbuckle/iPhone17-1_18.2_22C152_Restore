@interface DRSProtoDiagnosticUploadRequest
+ (Class)logsType;
- (BOOL)hasIssueDescription;
- (BOOL)hasRequestDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoRequestDescription)requestDescription;
- (NSMutableArray)logs;
- (NSString)issueDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)logsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)logsCount;
- (void)addLogs:(id)a3;
- (void)clearLogs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIssueDescription:(id)a3;
- (void)setLogs:(id)a3;
- (void)setRequestDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoDiagnosticUploadRequest

- (BOOL)hasRequestDescription
{
  return self->_requestDescription != 0;
}

- (BOOL)hasIssueDescription
{
  return self->_issueDescription != 0;
}

- (void)clearLogs
{
}

- (void)addLogs:(id)a3
{
  id v4 = a3;
  logs = self->_logs;
  id v8 = v4;
  if (!logs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_logs;
    self->_logs = v6;

    id v4 = v8;
    logs = self->_logs;
  }
  [(NSMutableArray *)logs addObject:v4];
}

- (unint64_t)logsCount
{
  return [(NSMutableArray *)self->_logs count];
}

- (id)logsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_logs objectAtIndex:a3];
}

+ (Class)logsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoDiagnosticUploadRequest;
  id v4 = [(DRSProtoDiagnosticUploadRequest *)&v8 description];
  v5 = [(DRSProtoDiagnosticUploadRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  requestDescription = self->_requestDescription;
  if (requestDescription)
  {
    v5 = [(DRSProtoRequestDescription *)requestDescription dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_description"];
  }
  issueDescription = self->_issueDescription;
  if (issueDescription) {
    [v3 setObject:issueDescription forKey:@"issue_description"];
  }
  if ([(NSMutableArray *)self->_logs count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_logs, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_logs;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"logs"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticUploadRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_requestDescription) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueDescription) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_logs;
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
  if (self->_requestDescription) {
    objc_msgSend(v8, "setRequestDescription:");
  }
  if (self->_issueDescription) {
    objc_msgSend(v8, "setIssueDescription:");
  }
  if ([(DRSProtoDiagnosticUploadRequest *)self logsCount])
  {
    [v8 clearLogs];
    unint64_t v4 = [(DRSProtoDiagnosticUploadRequest *)self logsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(DRSProtoDiagnosticUploadRequest *)self logsAtIndex:i];
        [v8 addLogs:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoRequestDescription *)self->_requestDescription copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_issueDescription copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_logs;
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
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addLogs:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestDescription = self->_requestDescription, !((unint64_t)requestDescription | v4[3]))
     || -[DRSProtoRequestDescription isEqual:](requestDescription, "isEqual:"))
    && ((issueDescription = self->_issueDescription, !((unint64_t)issueDescription | v4[1]))
     || -[NSString isEqual:](issueDescription, "isEqual:")))
  {
    logs = self->_logs;
    if ((unint64_t)logs | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](logs, "isEqual:");
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

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoRequestDescription *)self->_requestDescription hash];
  NSUInteger v4 = [(NSString *)self->_issueDescription hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_logs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  requestDescription = self->_requestDescription;
  uint64_t v6 = *((void *)v4 + 3);
  if (requestDescription)
  {
    if (v6) {
      -[DRSProtoRequestDescription mergeFrom:](requestDescription, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[DRSProtoDiagnosticUploadRequest setRequestDescription:](self, "setRequestDescription:");
  }
  if (*((void *)v4 + 1)) {
    -[DRSProtoDiagnosticUploadRequest setIssueDescription:](self, "setIssueDescription:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[DRSProtoDiagnosticUploadRequest addLogs:](self, "addLogs:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (DRSProtoRequestDescription)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (void)setIssueDescription:(id)a3
{
}

- (NSMutableArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDescription, 0);
  objc_storeStrong((id *)&self->_logs, 0);

  objc_storeStrong((id *)&self->_issueDescription, 0);
}

@end