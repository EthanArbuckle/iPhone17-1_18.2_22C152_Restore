@interface DRSProtoDiagnosticUploadRequestBatch
+ (Class)uploadRequestsType;
- (BOOL)hasClientMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoClientDeviceMetadata)clientMetadata;
- (NSMutableArray)uploadRequests;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)uploadRequestsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)uploadRequestsCount;
- (void)addUploadRequests:(id)a3;
- (void)clearUploadRequests;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientMetadata:(id)a3;
- (void)setUploadRequests:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoDiagnosticUploadRequestBatch

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (void)clearUploadRequests
{
}

- (void)addUploadRequests:(id)a3
{
  id v4 = a3;
  uploadRequests = self->_uploadRequests;
  id v8 = v4;
  if (!uploadRequests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_uploadRequests;
    self->_uploadRequests = v6;

    id v4 = v8;
    uploadRequests = self->_uploadRequests;
  }
  [(NSMutableArray *)uploadRequests addObject:v4];
}

- (unint64_t)uploadRequestsCount
{
  return [(NSMutableArray *)self->_uploadRequests count];
}

- (id)uploadRequestsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_uploadRequests objectAtIndex:a3];
}

+ (Class)uploadRequestsType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoDiagnosticUploadRequestBatch;
  id v4 = [(DRSProtoDiagnosticUploadRequestBatch *)&v8 description];
  v5 = [(DRSProtoDiagnosticUploadRequestBatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  clientMetadata = self->_clientMetadata;
  if (clientMetadata)
  {
    v5 = [(DRSProtoClientDeviceMetadata *)clientMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"client_metadata"];
  }
  if ([(NSMutableArray *)self->_uploadRequests count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_uploadRequests, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_uploadRequests;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"upload_requests"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticUploadRequestBatchReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_clientMetadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_uploadRequests;
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
  if (self->_clientMetadata) {
    objc_msgSend(v8, "setClientMetadata:");
  }
  if ([(DRSProtoDiagnosticUploadRequestBatch *)self uploadRequestsCount])
  {
    [v8 clearUploadRequests];
    unint64_t v4 = [(DRSProtoDiagnosticUploadRequestBatch *)self uploadRequestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(DRSProtoDiagnosticUploadRequestBatch *)self uploadRequestsAtIndex:i];
        [v8 addUploadRequests:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoClientDeviceMetadata *)self->_clientMetadata copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_uploadRequests;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addUploadRequests:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((clientMetadata = self->_clientMetadata, !((unint64_t)clientMetadata | v4[1]))
     || -[DRSProtoClientDeviceMetadata isEqual:](clientMetadata, "isEqual:")))
  {
    uploadRequests = self->_uploadRequests;
    if ((unint64_t)uploadRequests | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](uploadRequests, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoClientDeviceMetadata *)self->_clientMetadata hash];
  return [(NSMutableArray *)self->_uploadRequests hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  clientMetadata = self->_clientMetadata;
  uint64_t v6 = *((void *)v4 + 1);
  if (clientMetadata)
  {
    if (v6) {
      -[DRSProtoClientDeviceMetadata mergeFrom:](clientMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[DRSProtoDiagnosticUploadRequestBatch setClientMetadata:](self, "setClientMetadata:");
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
        -[DRSProtoDiagnosticUploadRequestBatch addUploadRequests:](self, "addUploadRequests:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (DRSProtoClientDeviceMetadata)clientMetadata
{
  return self->_clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
}

- (NSMutableArray)uploadRequests
{
  return self->_uploadRequests;
}

- (void)setUploadRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadRequests, 0);

  objc_storeStrong((id *)&self->_clientMetadata, 0);
}

@end