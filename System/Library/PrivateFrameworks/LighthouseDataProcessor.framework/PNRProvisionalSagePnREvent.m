@interface PNRProvisionalSagePnREvent
- (BOOL)hasPlannerGrainMetricsDimension;
- (BOOL)hasRequestGrainMetricsDimension;
- (BOOL)hasSagePnRMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRProvisionalPlannerGrainMetricsDimension)plannerGrainMetricsDimension;
- (PNRProvisionalRequestGrainMetricsDimension)requestGrainMetricsDimension;
- (PNRProvisionalSagePnREvent)initWithDictionary:(id)a3;
- (PNRProvisionalSagePnREvent)initWithJSON:(id)a3;
- (PNRProvisionalSagePnRMetadata)sagePnRMetadata;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deletePlannerGrainMetricsDimension;
- (void)deleteRequestGrainMetricsDimension;
- (void)deleteSagePnRMetadata;
- (void)setHasPlannerGrainMetricsDimension:(BOOL)a3;
- (void)setHasRequestGrainMetricsDimension:(BOOL)a3;
- (void)setHasSagePnRMetadata:(BOOL)a3;
- (void)setPlannerGrainMetricsDimension:(id)a3;
- (void)setRequestGrainMetricsDimension:(id)a3;
- (void)setSagePnRMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRProvisionalSagePnREvent

- (BOOL)hasSagePnRMetadata
{
  return self->_sagePnRMetadata != 0;
}

- (void)deleteSagePnRMetadata
{
}

- (BOOL)hasRequestGrainMetricsDimension
{
  return self->_requestGrainMetricsDimension != 0;
}

- (void)deleteRequestGrainMetricsDimension
{
}

- (BOOL)hasPlannerGrainMetricsDimension
{
  return self->_plannerGrainMetricsDimension != 0;
}

- (void)deletePlannerGrainMetricsDimension
{
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSagePnREventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  v4 = [(PNRProvisionalSagePnREvent *)self sagePnRMetadata];

  if (v4)
  {
    v5 = [(PNRProvisionalSagePnREvent *)self sagePnRMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PNRProvisionalSagePnREvent *)self requestGrainMetricsDimension];

  if (v6)
  {
    v7 = [(PNRProvisionalSagePnREvent *)self requestGrainMetricsDimension];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(PNRProvisionalSagePnREvent *)self plannerGrainMetricsDimension];

  if (v8)
  {
    v9 = [(PNRProvisionalSagePnREvent *)self plannerGrainMetricsDimension];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PNRProvisionalSagePnREvent *)self sagePnRMetadata];
  v6 = [v4 sagePnRMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PNRProvisionalSagePnREvent *)self sagePnRMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PNRProvisionalSagePnREvent *)self sagePnRMetadata];
    id v10 = [v4 sagePnRMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnREvent *)self requestGrainMetricsDimension];
  v6 = [v4 requestGrainMetricsDimension];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PNRProvisionalSagePnREvent *)self requestGrainMetricsDimension];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PNRProvisionalSagePnREvent *)self requestGrainMetricsDimension];
    v15 = [v4 requestGrainMetricsDimension];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSagePnREvent *)self plannerGrainMetricsDimension];
  v6 = [v4 plannerGrainMetricsDimension];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PNRProvisionalSagePnREvent *)self plannerGrainMetricsDimension];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PNRProvisionalSagePnREvent *)self plannerGrainMetricsDimension];
    v20 = [v4 plannerGrainMetricsDimension];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PNRProvisionalSagePnRMetadata *)self->_sagePnRMetadata hash];
  unint64_t v4 = [(PNRProvisionalRequestGrainMetricsDimension *)self->_requestGrainMetricsDimension hash] ^ v3;
  return v4 ^ [(PNRProvisionalPlannerGrainMetricsDimension *)self->_plannerGrainMetricsDimension hash];
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_plannerGrainMetricsDimension)
  {
    unint64_t v4 = [(PNRProvisionalSagePnREvent *)self plannerGrainMetricsDimension];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"plannerGrainMetricsDimension"];
    }
    else
    {
      v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"plannerGrainMetricsDimension"];
    }
  }
  if (self->_requestGrainMetricsDimension)
  {
    uint64_t v7 = [(PNRProvisionalSagePnREvent *)self requestGrainMetricsDimension];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"requestGrainMetricsDimension"];
    }
    else
    {
      v9 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v9 forKeyedSubscript:@"requestGrainMetricsDimension"];
    }
  }
  if (self->_sagePnRMetadata)
  {
    id v10 = [(PNRProvisionalSagePnREvent *)self sagePnRMetadata];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"sagePnRMetadata"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v12 forKeyedSubscript:@"sagePnRMetadata"];
    }
  }
  [(PNRProvisionalSagePnREvent *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNRProvisionalSagePnREvent *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalSagePnREvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRProvisionalSagePnREvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalSagePnREvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PNRProvisionalSagePnREvent;
  v5 = [(PNRProvisionalSagePnREvent *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sagePnRMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [[PNRProvisionalSagePnRMetadata alloc] initWithDictionary:v6];
      [(PNRProvisionalSagePnREvent *)v5 setSagePnRMetadata:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"requestGrainMetricsDimension"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PNRProvisionalRequestGrainMetricsDimension alloc] initWithDictionary:v8];
      [(PNRProvisionalSagePnREvent *)v5 setRequestGrainMetricsDimension:v9];
    }
    id v10 = [v4 objectForKeyedSubscript:@"plannerGrainMetricsDimension"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PNRProvisionalPlannerGrainMetricsDimension alloc] initWithDictionary:v10];
      [(PNRProvisionalSagePnREvent *)v5 setPlannerGrainMetricsDimension:v11];
    }
    uint64_t v12 = v5;
  }
  return v5;
}

- (PNRProvisionalSagePnRMetadata)sagePnRMetadata
{
  return self->_sagePnRMetadata;
}

- (void)setSagePnRMetadata:(id)a3
{
}

- (PNRProvisionalRequestGrainMetricsDimension)requestGrainMetricsDimension
{
  return self->_requestGrainMetricsDimension;
}

- (void)setRequestGrainMetricsDimension:(id)a3
{
}

- (PNRProvisionalPlannerGrainMetricsDimension)plannerGrainMetricsDimension
{
  return self->_plannerGrainMetricsDimension;
}

- (void)setPlannerGrainMetricsDimension:(id)a3
{
}

- (void)setHasSagePnRMetadata:(BOOL)a3
{
  self->_hasSagePnRMetadata = a3;
}

- (void)setHasRequestGrainMetricsDimension:(BOOL)a3
{
  self->_hasRequestGrainMetricsDimension = a3;
}

- (void)setHasPlannerGrainMetricsDimension:(BOOL)a3
{
  self->_hasPlannerGrainMetricsDimension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plannerGrainMetricsDimension, 0);
  objc_storeStrong((id *)&self->_requestGrainMetricsDimension, 0);

  objc_storeStrong((id *)&self->_sagePnRMetadata, 0);
}

@end