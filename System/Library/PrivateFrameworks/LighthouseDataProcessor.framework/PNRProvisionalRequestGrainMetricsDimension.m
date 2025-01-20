@interface PNRProvisionalRequestGrainMetricsDimension
- (BOOL)hasExecutionTime;
- (BOOL)hasFailureInfo;
- (BOOL)hasFullQueryResponseTime;
- (BOOL)hasNumActionResponseGenerated;
- (BOOL)hasNumActionsCreated;
- (BOOL)hasNumActionsExecuted;
- (BOOL)hasNumPlansCreated;
- (BOOL)hasNumQueries;
- (BOOL)hasNumQueryPlansCreated;
- (BOOL)hasNumResponsePlansCreated;
- (BOOL)hasPlanningTime;
- (BOOL)hasResponsePreparationTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)bundleIds;
- (NSArray)toolIds;
- (NSData)jsonData;
- (PNRProvisionalMetrics)executionTime;
- (PNRProvisionalMetrics)fullQueryResponseTime;
- (PNRProvisionalMetrics)planningTime;
- (PNRProvisionalMetrics)responsePreparationTime;
- (PNRProvisionalRequestGrainMetricsDimension)initWithDictionary:(id)a3;
- (PNRProvisionalRequestGrainMetricsDimension)initWithJSON:(id)a3;
- (PNRProvisionalSageFailureInfo)failureInfo;
- (id)bundleIdAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)toolIdAtIndex:(unint64_t)a3;
- (int)numActionResponseGenerated;
- (int)numActionsCreated;
- (int)numActionsExecuted;
- (int)numPlansCreated;
- (int)numQueries;
- (int)numQueryPlansCreated;
- (int)numResponsePlansCreated;
- (unint64_t)bundleIdCount;
- (unint64_t)hash;
- (unint64_t)toolIdCount;
- (void)addBundleId:(id)a3;
- (void)addToolId:(id)a3;
- (void)clearBundleId;
- (void)clearToolId;
- (void)deleteExecutionTime;
- (void)deleteFailureInfo;
- (void)deleteFullQueryResponseTime;
- (void)deleteNumActionResponseGenerated;
- (void)deleteNumActionsCreated;
- (void)deleteNumActionsExecuted;
- (void)deleteNumPlansCreated;
- (void)deleteNumQueries;
- (void)deleteNumQueryPlansCreated;
- (void)deleteNumResponsePlansCreated;
- (void)deletePlanningTime;
- (void)deleteResponsePreparationTime;
- (void)setBundleIds:(id)a3;
- (void)setExecutionTime:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setFullQueryResponseTime:(id)a3;
- (void)setHasExecutionTime:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasFullQueryResponseTime:(BOOL)a3;
- (void)setHasNumActionResponseGenerated:(BOOL)a3;
- (void)setHasNumActionsCreated:(BOOL)a3;
- (void)setHasNumActionsExecuted:(BOOL)a3;
- (void)setHasNumPlansCreated:(BOOL)a3;
- (void)setHasNumQueries:(BOOL)a3;
- (void)setHasNumQueryPlansCreated:(BOOL)a3;
- (void)setHasNumResponsePlansCreated:(BOOL)a3;
- (void)setHasPlanningTime:(BOOL)a3;
- (void)setHasResponsePreparationTime:(BOOL)a3;
- (void)setNumActionResponseGenerated:(int)a3;
- (void)setNumActionsCreated:(int)a3;
- (void)setNumActionsExecuted:(int)a3;
- (void)setNumPlansCreated:(int)a3;
- (void)setNumQueries:(int)a3;
- (void)setNumQueryPlansCreated:(int)a3;
- (void)setNumResponsePlansCreated:(int)a3;
- (void)setPlanningTime:(id)a3;
- (void)setResponsePreparationTime:(id)a3;
- (void)setToolIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRProvisionalRequestGrainMetricsDimension

- (void)setNumQueries:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numQueries = a3;
}

- (BOOL)hasNumQueries
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNumQueries:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteNumQueries
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setNumPlansCreated:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numPlansCreated = a3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)deleteNumPlansCreated
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setNumQueryPlansCreated:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numQueryPlansCreated = a3;
}

- (BOOL)hasNumQueryPlansCreated
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumQueryPlansCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)deleteNumQueryPlansCreated
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setNumResponsePlansCreated:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numResponsePlansCreated = a3;
}

- (BOOL)hasNumResponsePlansCreated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNumResponsePlansCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumResponsePlansCreated
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setNumActionsCreated:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numActionsCreated = a3;
}

- (BOOL)hasNumActionsCreated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNumActionsCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)deleteNumActionsCreated
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setNumActionsExecuted:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_numActionsExecuted = a3;
}

- (BOOL)hasNumActionsExecuted
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasNumActionsExecuted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)deleteNumActionsExecuted
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setNumActionResponseGenerated:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_numActionResponseGenerated = a3;
}

- (BOOL)hasNumActionResponseGenerated
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasNumActionResponseGenerated:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)deleteNumActionResponseGenerated
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (BOOL)hasFullQueryResponseTime
{
  return self->_fullQueryResponseTime != 0;
}

- (void)deleteFullQueryResponseTime
{
}

- (BOOL)hasPlanningTime
{
  return self->_planningTime != 0;
}

- (void)deletePlanningTime
{
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteExecutionTime
{
}

- (BOOL)hasResponsePreparationTime
{
  return self->_responsePreparationTime != 0;
}

- (void)deleteResponsePreparationTime
{
}

- (void)clearToolId
{
}

- (void)addToolId:(id)a3
{
  id v4 = a3;
  toolIds = self->_toolIds;
  id v8 = v4;
  if (!toolIds)
  {
    v6 = [MEMORY[0x263EFF980] array];
    v7 = self->_toolIds;
    self->_toolIds = v6;

    id v4 = v8;
    toolIds = self->_toolIds;
  }
  [(NSArray *)toolIds addObject:v4];
}

- (unint64_t)toolIdCount
{
  return [(NSArray *)self->_toolIds count];
}

- (id)toolIdAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_toolIds objectAtIndexedSubscript:a3];
}

- (void)clearBundleId
{
}

- (void)addBundleId:(id)a3
{
  id v4 = a3;
  bundleIds = self->_bundleIds;
  id v8 = v4;
  if (!bundleIds)
  {
    v6 = [MEMORY[0x263EFF980] array];
    v7 = self->_bundleIds;
    self->_bundleIds = v6;

    id v4 = v8;
    bundleIds = self->_bundleIds;
  }
  [(NSArray *)bundleIds addObject:v4];
}

- (unint64_t)bundleIdCount
{
  return [(NSArray *)self->_bundleIds count];
}

- (id)bundleIdAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_bundleIds objectAtIndexedSubscript:a3];
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalRequestGrainMetricsDimensionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
  v6 = [(PNRProvisionalRequestGrainMetricsDimension *)self fullQueryResponseTime];

  if (v6)
  {
    v7 = [(PNRProvisionalRequestGrainMetricsDimension *)self fullQueryResponseTime];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(PNRProvisionalRequestGrainMetricsDimension *)self planningTime];

  if (v8)
  {
    v9 = [(PNRProvisionalRequestGrainMetricsDimension *)self planningTime];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PNRProvisionalRequestGrainMetricsDimension *)self executionTime];

  if (v10)
  {
    v11 = [(PNRProvisionalRequestGrainMetricsDimension *)self executionTime];
    PBDataWriterWriteSubmessage();
  }
  v12 = [(PNRProvisionalRequestGrainMetricsDimension *)self responsePreparationTime];

  if (v12)
  {
    v13 = [(PNRProvisionalRequestGrainMetricsDimension *)self responsePreparationTime];
    PBDataWriterWriteSubmessage();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v14 = self->_toolIds;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v16);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v19 = self->_bundleIds;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v21);
  }

  v24 = [(PNRProvisionalRequestGrainMetricsDimension *)self failureInfo];

  if (v24)
  {
    v25 = [(PNRProvisionalRequestGrainMetricsDimension *)self failureInfo];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_64;
  }
  $AA289F35DA062A6B8AB178B047ED4B74 has = self->_has;
  unsigned int v6 = v4[96];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_64;
  }
  if (*(unsigned char *)&has)
  {
    int numQueries = self->_numQueries;
    if (numQueries != [v4 numQueries]) {
      goto LABEL_64;
    }
    $AA289F35DA062A6B8AB178B047ED4B74 has = self->_has;
    unsigned int v6 = v4[96];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int numPlansCreated = self->_numPlansCreated;
      if (numPlansCreated != [v4 numPlansCreated]) {
        goto LABEL_64;
      }
      $AA289F35DA062A6B8AB178B047ED4B74 has = self->_has;
      unsigned int v6 = v4[96];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int numQueryPlansCreated = self->_numQueryPlansCreated;
        if (numQueryPlansCreated != [v4 numQueryPlansCreated]) {
          goto LABEL_64;
        }
        $AA289F35DA062A6B8AB178B047ED4B74 has = self->_has;
        unsigned int v6 = v4[96];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          int numResponsePlansCreated = self->_numResponsePlansCreated;
          if (numResponsePlansCreated != [v4 numResponsePlansCreated]) {
            goto LABEL_64;
          }
          $AA289F35DA062A6B8AB178B047ED4B74 has = self->_has;
          unsigned int v6 = v4[96];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            int numActionsCreated = self->_numActionsCreated;
            if (numActionsCreated != [v4 numActionsCreated]) {
              goto LABEL_64;
            }
            $AA289F35DA062A6B8AB178B047ED4B74 has = self->_has;
            unsigned int v6 = v4[96];
          }
          int v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              int numActionsExecuted = self->_numActionsExecuted;
              if (numActionsExecuted != [v4 numActionsExecuted]) {
                goto LABEL_64;
              }
              $AA289F35DA062A6B8AB178B047ED4B74 has = self->_has;
              unsigned int v6 = v4[96];
            }
            int v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 != ((v6 >> 6) & 1)) {
              goto LABEL_64;
            }
            if (v18)
            {
              int numActionResponseGenerated = self->_numActionResponseGenerated;
              if (numActionResponseGenerated != [v4 numActionResponseGenerated]) {
                goto LABEL_64;
              }
            }
            uint64_t v20 = [(PNRProvisionalRequestGrainMetricsDimension *)self fullQueryResponseTime];
            uint64_t v21 = [v4 fullQueryResponseTime];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_63;
            }
            uint64_t v22 = [(PNRProvisionalRequestGrainMetricsDimension *)self fullQueryResponseTime];
            if (v22)
            {
              v23 = (void *)v22;
              v24 = [(PNRProvisionalRequestGrainMetricsDimension *)self fullQueryResponseTime];
              v25 = [v4 fullQueryResponseTime];
              int v26 = [v24 isEqual:v25];

              if (!v26) {
                goto LABEL_64;
              }
            }
            else
            {
            }
            uint64_t v20 = [(PNRProvisionalRequestGrainMetricsDimension *)self planningTime];
            uint64_t v21 = [v4 planningTime];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_63;
            }
            uint64_t v27 = [(PNRProvisionalRequestGrainMetricsDimension *)self planningTime];
            if (v27)
            {
              long long v28 = (void *)v27;
              long long v29 = [(PNRProvisionalRequestGrainMetricsDimension *)self planningTime];
              long long v30 = [v4 planningTime];
              int v31 = [v29 isEqual:v30];

              if (!v31) {
                goto LABEL_64;
              }
            }
            else
            {
            }
            uint64_t v20 = [(PNRProvisionalRequestGrainMetricsDimension *)self executionTime];
            uint64_t v21 = [v4 executionTime];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_63;
            }
            uint64_t v32 = [(PNRProvisionalRequestGrainMetricsDimension *)self executionTime];
            if (v32)
            {
              long long v33 = (void *)v32;
              v34 = [(PNRProvisionalRequestGrainMetricsDimension *)self executionTime];
              v35 = [v4 executionTime];
              int v36 = [v34 isEqual:v35];

              if (!v36) {
                goto LABEL_64;
              }
            }
            else
            {
            }
            uint64_t v20 = [(PNRProvisionalRequestGrainMetricsDimension *)self responsePreparationTime];
            uint64_t v21 = [v4 responsePreparationTime];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_63;
            }
            uint64_t v37 = [(PNRProvisionalRequestGrainMetricsDimension *)self responsePreparationTime];
            if (v37)
            {
              v38 = (void *)v37;
              v39 = [(PNRProvisionalRequestGrainMetricsDimension *)self responsePreparationTime];
              v40 = [v4 responsePreparationTime];
              int v41 = [v39 isEqual:v40];

              if (!v41) {
                goto LABEL_64;
              }
            }
            else
            {
            }
            uint64_t v20 = [(PNRProvisionalRequestGrainMetricsDimension *)self toolIds];
            uint64_t v21 = [v4 toolIds];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_63;
            }
            uint64_t v42 = [(PNRProvisionalRequestGrainMetricsDimension *)self toolIds];
            if (v42)
            {
              v43 = (void *)v42;
              v44 = [(PNRProvisionalRequestGrainMetricsDimension *)self toolIds];
              v45 = [v4 toolIds];
              int v46 = [v44 isEqual:v45];

              if (!v46) {
                goto LABEL_64;
              }
            }
            else
            {
            }
            uint64_t v20 = [(PNRProvisionalRequestGrainMetricsDimension *)self bundleIds];
            uint64_t v21 = [v4 bundleIds];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_63;
            }
            uint64_t v47 = [(PNRProvisionalRequestGrainMetricsDimension *)self bundleIds];
            if (v47)
            {
              v48 = (void *)v47;
              v49 = [(PNRProvisionalRequestGrainMetricsDimension *)self bundleIds];
              v50 = [v4 bundleIds];
              int v51 = [v49 isEqual:v50];

              if (!v51) {
                goto LABEL_64;
              }
            }
            else
            {
            }
            uint64_t v20 = [(PNRProvisionalRequestGrainMetricsDimension *)self failureInfo];
            uint64_t v21 = [v4 failureInfo];
            if ((v20 == 0) != (v21 != 0))
            {
              uint64_t v52 = [(PNRProvisionalRequestGrainMetricsDimension *)self failureInfo];
              if (!v52)
              {

LABEL_67:
                BOOL v57 = 1;
                goto LABEL_65;
              }
              v53 = (void *)v52;
              v54 = [(PNRProvisionalRequestGrainMetricsDimension *)self failureInfo];
              v55 = [v4 failureInfo];
              char v56 = [v54 isEqual:v55];

              if (v56) {
                goto LABEL_67;
              }
            }
            else
            {
LABEL_63:
            }
          }
        }
      }
    }
  }
LABEL_64:
  BOOL v57 = 0;
LABEL_65:

  return v57;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_numQueries;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_numPlansCreated;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numQueryPlansCreated;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_numResponsePlansCreated;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_numActionsCreated;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v9 = 0;
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_numActionsExecuted;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_numActionResponseGenerated;
LABEL_16:
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(PNRProvisionalMetrics *)self->_fullQueryResponseTime hash];
  unint64_t v11 = [(PNRProvisionalMetrics *)self->_planningTime hash];
  unint64_t v12 = v10 ^ v11 ^ [(PNRProvisionalMetrics *)self->_executionTime hash];
  unint64_t v13 = [(PNRProvisionalMetrics *)self->_responsePreparationTime hash];
  uint64_t v14 = v13 ^ [(NSArray *)self->_toolIds hash];
  uint64_t v15 = v12 ^ v14 ^ [(NSArray *)self->_bundleIds hash];
  return v15 ^ [(PNRProvisionalSageFailureInfo *)self->_failureInfo hash];
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_bundleIds)
  {
    uint64_t v4 = [(PNRProvisionalRequestGrainMetricsDimension *)self bundleIds];
    uint64_t v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_executionTime)
  {
    uint64_t v6 = [(PNRProvisionalRequestGrainMetricsDimension *)self executionTime];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"executionTime"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v8 forKeyedSubscript:@"executionTime"];
    }
  }
  if (self->_failureInfo)
  {
    uint64_t v9 = [(PNRProvisionalRequestGrainMetricsDimension *)self failureInfo];
    unint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      unint64_t v11 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v11 forKeyedSubscript:@"failureInfo"];
    }
  }
  if (self->_fullQueryResponseTime)
  {
    unint64_t v12 = [(PNRProvisionalRequestGrainMetricsDimension *)self fullQueryResponseTime];
    unint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"fullQueryResponseTime"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v14 forKeyedSubscript:@"fullQueryResponseTime"];
    }
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v19 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numActionResponseGenerated](self, "numActionResponseGenerated"));
    [v3 setObject:v19 forKeyedSubscript:@"numActionResponseGenerated"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_20:
      if ((has & 0x20) == 0) {
        goto LABEL_21;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_20;
  }
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numActionsCreated](self, "numActionsCreated"));
  [v3 setObject:v20 forKeyedSubscript:@"numActionsCreated"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_21:
    if ((has & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numActionsExecuted](self, "numActionsExecuted"));
  [v3 setObject:v21 forKeyedSubscript:@"numActionsExecuted"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_22:
    if ((has & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numPlansCreated](self, "numPlansCreated"));
  [v3 setObject:v22 forKeyedSubscript:@"numPlansCreated"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_23:
    if ((has & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_34;
  }
LABEL_33:
  v23 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numQueries](self, "numQueries"));
  [v3 setObject:v23 forKeyedSubscript:@"numQueries"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_24:
    if ((has & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_34:
  v24 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numQueryPlansCreated](self, "numQueryPlansCreated"));
  [v3 setObject:v24 forKeyedSubscript:@"numQueryPlansCreated"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_25:
    int v16 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numResponsePlansCreated](self, "numResponsePlansCreated"));
    [v3 setObject:v16 forKeyedSubscript:@"numResponsePlansCreated"];
  }
LABEL_26:
  if (self->_planningTime)
  {
    uint64_t v17 = [(PNRProvisionalRequestGrainMetricsDimension *)self planningTime];
    int v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"planningTime"];
    }
    else
    {
      v25 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v25 forKeyedSubscript:@"planningTime"];
    }
  }
  if (self->_responsePreparationTime)
  {
    int v26 = [(PNRProvisionalRequestGrainMetricsDimension *)self responsePreparationTime];
    uint64_t v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"responsePreparationTime"];
    }
    else
    {
      long long v28 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v28 forKeyedSubscript:@"responsePreparationTime"];
    }
  }
  if (self->_toolIds)
  {
    long long v29 = [(PNRProvisionalRequestGrainMetricsDimension *)self toolIds];
    long long v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"toolId"];
  }
  [(PNRProvisionalRequestGrainMetricsDimension *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNRProvisionalRequestGrainMetricsDimension *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalRequestGrainMetricsDimension)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(PNRProvisionalRequestGrainMetricsDimension *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (PNRProvisionalRequestGrainMetricsDimension)initWithDictionary:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PNRProvisionalRequestGrainMetricsDimension;
  uint64_t v5 = [(PNRProvisionalRequestGrainMetricsDimension *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"numQueries"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalRequestGrainMetricsDimension setNumQueries:](v5, "setNumQueries:", [v6 intValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"numPlansCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalRequestGrainMetricsDimension setNumPlansCreated:](v5, "setNumPlansCreated:", [v7 intValue]);
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"numQueryPlansCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalRequestGrainMetricsDimension setNumQueryPlansCreated:](v5, "setNumQueryPlansCreated:", [v8 intValue]);
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"numResponsePlansCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalRequestGrainMetricsDimension setNumResponsePlansCreated:](v5, "setNumResponsePlansCreated:", [v9 intValue]);
    }
    unint64_t v10 = [v4 objectForKeyedSubscript:@"numActionsCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalRequestGrainMetricsDimension setNumActionsCreated:](v5, "setNumActionsCreated:", [v10 intValue]);
    }
    unint64_t v11 = [v4 objectForKeyedSubscript:@"numActionsExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalRequestGrainMetricsDimension setNumActionsExecuted:](v5, "setNumActionsExecuted:", [v11 intValue]);
    }
    v48 = v8;
    v49 = v7;
    v50 = v6;
    unint64_t v12 = [v4 objectForKeyedSubscript:@"numActionResponseGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalRequestGrainMetricsDimension setNumActionResponseGenerated:](v5, "setNumActionResponseGenerated:", [v12 intValue]);
    }
    v44 = v12;
    uint64_t v13 = [v4 objectForKeyedSubscript:@"fullQueryResponseTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [[PNRProvisionalMetrics alloc] initWithDictionary:v13];
      [(PNRProvisionalRequestGrainMetricsDimension *)v5 setFullQueryResponseTime:v14];
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"planningTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v16 = [[PNRProvisionalMetrics alloc] initWithDictionary:v15];
      [(PNRProvisionalRequestGrainMetricsDimension *)v5 setPlanningTime:v16];
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"executionTime"];
    objc_opt_class();
    int v51 = (void *)v17;
    if (objc_opt_isKindOfClass())
    {
      int v18 = [[PNRProvisionalMetrics alloc] initWithDictionary:v17];
      [(PNRProvisionalRequestGrainMetricsDimension *)v5 setExecutionTime:v18];
    }
    v43 = (void *)v13;
    v45 = v11;
    int v46 = v10;
    uint64_t v47 = v9;
    v19 = [v4 objectForKeyedSubscript:@"responsePreparationTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [[PNRProvisionalMetrics alloc] initWithDictionary:v19];
      [(PNRProvisionalRequestGrainMetricsDimension *)v5 setResponsePreparationTime:v20];
    }
    uint64_t v21 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    int v41 = v19;
    uint64_t v42 = v15;
    if (objc_opt_isKindOfClass())
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v57 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v28 = (void *)[v27 copy];
              [(PNRProvisionalRequestGrainMetricsDimension *)v5 addToolId:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v62 count:16];
        }
        while (v24);
      }

      v19 = v41;
      uint64_t v15 = v42;
    }
    long long v29 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v53 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v36 = (void *)[v35 copy];
              [(PNRProvisionalRequestGrainMetricsDimension *)v5 addBundleId:v36];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v32);
      }

      v19 = v41;
      uint64_t v15 = v42;
    }
    uint64_t v37 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [[PNRProvisionalSageFailureInfo alloc] initWithDictionary:v37];
      [(PNRProvisionalRequestGrainMetricsDimension *)v5 setFailureInfo:v38];
    }
    v39 = v5;
  }
  return v5;
}

- (int)numQueries
{
  return self->_numQueries;
}

- (int)numPlansCreated
{
  return self->_numPlansCreated;
}

- (int)numQueryPlansCreated
{
  return self->_numQueryPlansCreated;
}

- (int)numResponsePlansCreated
{
  return self->_numResponsePlansCreated;
}

- (int)numActionsCreated
{
  return self->_numActionsCreated;
}

- (int)numActionsExecuted
{
  return self->_numActionsExecuted;
}

- (int)numActionResponseGenerated
{
  return self->_numActionResponseGenerated;
}

- (PNRProvisionalMetrics)fullQueryResponseTime
{
  return self->_fullQueryResponseTime;
}

- (void)setFullQueryResponseTime:(id)a3
{
}

- (PNRProvisionalMetrics)planningTime
{
  return self->_planningTime;
}

- (void)setPlanningTime:(id)a3
{
}

- (PNRProvisionalMetrics)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(id)a3
{
}

- (PNRProvisionalMetrics)responsePreparationTime
{
  return self->_responsePreparationTime;
}

- (void)setResponsePreparationTime:(id)a3
{
}

- (NSArray)toolIds
{
  return self->_toolIds;
}

- (void)setToolIds:(id)a3
{
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (PNRProvisionalSageFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
}

- (void)setHasFullQueryResponseTime:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasPlanningTime:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasExecutionTime:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasResponsePreparationTime:(BOOL)a3
{
  self->_hasFullQueryResponseTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasPlanningTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_toolIds, 0);
  objc_storeStrong((id *)&self->_responsePreparationTime, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_planningTime, 0);

  objc_storeStrong((id *)&self->_fullQueryResponseTime, 0);
}

@end