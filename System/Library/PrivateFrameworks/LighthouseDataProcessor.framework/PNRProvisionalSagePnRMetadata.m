@interface PNRProvisionalSagePnRMetadata
- (BOOL)hasClientId;
- (BOOL)hasClientRequestId;
- (BOOL)hasClientSessionId;
- (BOOL)hasRawSessionId;
- (BOOL)hasRequestStatus;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)actionIds;
- (NSArray)planIds;
- (NSData)jsonData;
- (NSString)SessionId;
- (NSString)clientId;
- (NSString)clientRequestId;
- (NSString)clientSessionId;
- (NSString)rawSessionId;
- (NSString)requestStatus;
- (PNRProvisionalSagePnRMetadata)initWithDictionary:(id)a3;
- (PNRProvisionalSagePnRMetadata)initWithJSON:(id)a3;
- (id)actionIdAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)planIdAtIndex:(unint64_t)a3;
- (unint64_t)actionIdCount;
- (unint64_t)hash;
- (unint64_t)planIdCount;
- (void)addActionId:(id)a3;
- (void)addPlanId:(id)a3;
- (void)clearActionId;
- (void)clearPlanId;
- (void)deleteClientId;
- (void)deleteClientRequestId;
- (void)deleteClientSessionId;
- (void)deleteRawSessionId;
- (void)deleteRequestStatus;
- (void)deleteSessionId;
- (void)setActionIds:(id)a3;
- (void)setClientId:(id)a3;
- (void)setClientRequestId:(id)a3;
- (void)setClientSessionId:(id)a3;
- (void)setHasClientId:(BOOL)a3;
- (void)setHasClientRequestId:(BOOL)a3;
- (void)setHasClientSessionId:(BOOL)a3;
- (void)setHasRawSessionId:(BOOL)a3;
- (void)setHasRequestStatus:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setPlanIds:(id)a3;
- (void)setRawSessionId:(id)a3;
- (void)setRequestStatus:(id)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRProvisionalSagePnRMetadata

- (BOOL)hasSessionId
{
  return self->_SessionId != 0;
}

- (void)deleteSessionId
{
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (void)deleteClientId
{
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

- (void)deleteClientSessionId
{
}

- (void)clearPlanId
{
}

- (void)addPlanId:(id)a3
{
  id v4 = a3;
  planIds = self->_planIds;
  id v8 = v4;
  if (!planIds)
  {
    v6 = [MEMORY[0x263EFF980] array];
    v7 = self->_planIds;
    self->_planIds = v6;

    id v4 = v8;
    planIds = self->_planIds;
  }
  [(NSArray *)planIds addObject:v4];
}

- (unint64_t)planIdCount
{
  return [(NSArray *)self->_planIds count];
}

- (id)planIdAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_planIds objectAtIndexedSubscript:a3];
}

- (void)clearActionId
{
}

- (void)addActionId:(id)a3
{
  id v4 = a3;
  actionIds = self->_actionIds;
  id v8 = v4;
  if (!actionIds)
  {
    v6 = [MEMORY[0x263EFF980] array];
    v7 = self->_actionIds;
    self->_actionIds = v6;

    id v4 = v8;
    actionIds = self->_actionIds;
  }
  [(NSArray *)actionIds addObject:v4];
}

- (unint64_t)actionIdCount
{
  return [(NSArray *)self->_actionIds count];
}

- (id)actionIdAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_actionIds objectAtIndexedSubscript:a3];
}

- (BOOL)hasRequestStatus
{
  return self->_requestStatus != 0;
}

- (void)deleteRequestStatus
{
}

- (BOOL)hasRawSessionId
{
  return self->_rawSessionId != 0;
}

- (void)deleteRawSessionId
{
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSagePnRMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PNRProvisionalSagePnRMetadata *)self SessionId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(PNRProvisionalSagePnRMetadata *)self clientId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  v7 = [(PNRProvisionalSagePnRMetadata *)self clientRequestId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  id v8 = [(PNRProvisionalSagePnRMetadata *)self clientSessionId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v9 = self->_planIds;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteStringField();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_actionIds;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteStringField();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  v19 = [(PNRProvisionalSagePnRMetadata *)self requestStatus];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  v20 = [(PNRProvisionalSagePnRMetadata *)self rawSessionId];

  if (v20) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self SessionId];
  v6 = [v4 SessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(PNRProvisionalSagePnRMetadata *)self SessionId];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [(PNRProvisionalSagePnRMetadata *)self SessionId];
    uint64_t v10 = [v4 SessionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self clientId];
  v6 = [v4 clientId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(PNRProvisionalSagePnRMetadata *)self clientId];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(PNRProvisionalSagePnRMetadata *)self clientId];
    uint64_t v15 = [v4 clientId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self clientRequestId];
  v6 = [v4 clientRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(PNRProvisionalSagePnRMetadata *)self clientRequestId];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(PNRProvisionalSagePnRMetadata *)self clientRequestId];
    v20 = [v4 clientRequestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self clientSessionId];
  v6 = [v4 clientSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v22 = [(PNRProvisionalSagePnRMetadata *)self clientSessionId];
  if (v22)
  {
    long long v23 = (void *)v22;
    long long v24 = [(PNRProvisionalSagePnRMetadata *)self clientSessionId];
    long long v25 = [v4 clientSessionId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self planIds];
  v6 = [v4 planIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v27 = [(PNRProvisionalSagePnRMetadata *)self planIds];
  if (v27)
  {
    long long v28 = (void *)v27;
    v29 = [(PNRProvisionalSagePnRMetadata *)self planIds];
    v30 = [v4 planIds];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self actionIds];
  v6 = [v4 actionIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v32 = [(PNRProvisionalSagePnRMetadata *)self actionIds];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(PNRProvisionalSagePnRMetadata *)self actionIds];
    v35 = [v4 actionIds];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self requestStatus];
  v6 = [v4 requestStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v37 = [(PNRProvisionalSagePnRMetadata *)self requestStatus];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(PNRProvisionalSagePnRMetadata *)self requestStatus];
    v40 = [v4 requestStatus];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnRMetadata *)self rawSessionId];
  v6 = [v4 rawSessionId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v42 = [(PNRProvisionalSagePnRMetadata *)self rawSessionId];
    if (!v42)
    {

LABEL_45:
      BOOL v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    v44 = [(PNRProvisionalSagePnRMetadata *)self rawSessionId];
    v45 = [v4 rawSessionId];
    char v46 = [v44 isEqual:v45];

    if (v46) {
      goto LABEL_45;
    }
  }
  else
  {
LABEL_41:
  }
LABEL_42:
  BOOL v47 = 0;
LABEL_43:

  return v47;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_SessionId hash];
  NSUInteger v4 = [(NSString *)self->_clientId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_clientRequestId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_clientSessionId hash];
  uint64_t v7 = [(NSArray *)self->_planIds hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_actionIds hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_requestStatus hash];
  return v9 ^ [(NSString *)self->_rawSessionId hash];
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_SessionId)
  {
    NSUInteger v4 = [(PNRProvisionalSagePnRMetadata *)self SessionId];
    NSUInteger v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"SessionId"];
  }
  if (self->_actionIds)
  {
    NSUInteger v6 = [(PNRProvisionalSagePnRMetadata *)self actionIds];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"actionId"];
  }
  if (self->_clientId)
  {
    uint64_t v8 = [(PNRProvisionalSagePnRMetadata *)self clientId];
    NSUInteger v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"clientId"];
  }
  if (self->_clientRequestId)
  {
    uint64_t v10 = [(PNRProvisionalSagePnRMetadata *)self clientRequestId];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"clientRequestId"];
  }
  if (self->_clientSessionId)
  {
    uint64_t v12 = [(PNRProvisionalSagePnRMetadata *)self clientSessionId];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"clientSessionId"];
  }
  if (self->_planIds)
  {
    v14 = [(PNRProvisionalSagePnRMetadata *)self planIds];
    uint64_t v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"planId"];
  }
  if (self->_rawSessionId)
  {
    int v16 = [(PNRProvisionalSagePnRMetadata *)self rawSessionId];
    uint64_t v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"rawSessionId"];
  }
  if (self->_requestStatus)
  {
    uint64_t v18 = [(PNRProvisionalSagePnRMetadata *)self requestStatus];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"requestStatus"];
  }
  [(PNRProvisionalSagePnRMetadata *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNRProvisionalSagePnRMetadata *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    NSUInteger v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    NSUInteger v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalSagePnRMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  NSUInteger v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSUInteger v5 = 0;
  }
  else
  {
    self = [(PNRProvisionalSagePnRMetadata *)self initWithDictionary:v4];
    NSUInteger v5 = self;
  }

  return v5;
}

- (PNRProvisionalSagePnRMetadata)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PNRProvisionalSagePnRMetadata;
  NSUInteger v5 = [(PNRProvisionalSagePnRMetadata *)&v49 init];
  if (v5)
  {
    NSUInteger v6 = [v4 objectForKeyedSubscript:@"SessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[v6 copy];
      [(PNRProvisionalSagePnRMetadata *)v5 setSessionId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"clientId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v9 = (void *)[v8 copy];
      [(PNRProvisionalSagePnRMetadata *)v5 setClientId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"clientRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(PNRProvisionalSagePnRMetadata *)v5 setClientRequestId:v11];
    }
    v39 = v8;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"clientSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = (void *)[v12 copy];
      [(PNRProvisionalSagePnRMetadata *)v5 setClientSessionId:v13];
    }
    uint64_t v37 = v12;
    v14 = [v4 objectForKeyedSubscript:@"planId"];
    objc_opt_class();
    v40 = v14;
    v38 = v10;
    if (objc_opt_isKindOfClass())
    {
      int v36 = v6;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v21 = (void *)[v20 copy];
              [(PNRProvisionalSagePnRMetadata *)v5 addPlanId:v21];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v17);
      }

      NSUInteger v6 = v36;
      uint64_t v10 = v38;
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"actionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            long long v28 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v29 = (void *)[v28 copy];
              [(PNRProvisionalSagePnRMetadata *)v5 addActionId:v29];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v25);
      }

      uint64_t v10 = v38;
    }
    v30 = [v4 objectForKeyedSubscript:@"requestStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v31 = (void *)[v30 copy];
      [(PNRProvisionalSagePnRMetadata *)v5 setRequestStatus:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"rawSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = (void *)[v32 copy];
      [(PNRProvisionalSagePnRMetadata *)v5 setRawSessionId:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (NSString)SessionId
{
  return self->_SessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setClientRequestId:(id)a3
{
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (void)setClientSessionId:(id)a3
{
}

- (NSArray)planIds
{
  return self->_planIds;
}

- (void)setPlanIds:(id)a3
{
}

- (NSArray)actionIds
{
  return self->_actionIds;
}

- (void)setActionIds:(id)a3
{
}

- (NSString)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(id)a3
{
}

- (NSString)rawSessionId
{
  return self->_rawSessionId;
}

- (void)setRawSessionId:(id)a3
{
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_hasSessionId = a3;
}

- (void)setHasClientId:(BOOL)a3
{
  self->_hasClientId = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasClientSessionId:(BOOL)a3
{
  self->_hasClientSessionId = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  self->_hasRequestStatus = a3;
}

- (void)setHasRawSessionId:(BOOL)a3
{
  self->_hasRawSessionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSessionId, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_actionIds, 0);
  objc_storeStrong((id *)&self->_planIds, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);

  objc_storeStrong((id *)&self->_SessionId, 0);
}

@end