@interface ATXCandidateRelevanceModelPBMetrics
+ (Class)candidateMetricsType;
- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsFourWeeksAgo;
- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsLastFourWeeks;
- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsOneWeekAgo;
- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsThreeWeeksAgo;
- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsTwoWeeksAgo;
- (ATXCandidateRelevanceModelPBModelMetrics)modelMetrics;
- (BOOL)hasEvaluationMetricsFourWeeksAgo;
- (BOOL)hasEvaluationMetricsLastFourWeeks;
- (BOOL)hasEvaluationMetricsOneWeekAgo;
- (BOOL)hasEvaluationMetricsThreeWeeksAgo;
- (BOOL)hasEvaluationMetricsTwoWeeksAgo;
- (BOOL)hasModelMetrics;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)candidateMetrics;
- (id)candidateMetricsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)candidateMetricsCount;
- (unint64_t)hash;
- (void)addCandidateMetrics:(id)a3;
- (void)clearCandidateMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCandidateMetrics:(id)a3;
- (void)setEvaluationMetricsFourWeeksAgo:(id)a3;
- (void)setEvaluationMetricsLastFourWeeks:(id)a3;
- (void)setEvaluationMetricsOneWeekAgo:(id)a3;
- (void)setEvaluationMetricsThreeWeeksAgo:(id)a3;
- (void)setEvaluationMetricsTwoWeeksAgo:(id)a3;
- (void)setModelMetrics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXCandidateRelevanceModelPBMetrics

- (BOOL)hasModelMetrics
{
  return self->_modelMetrics != 0;
}

- (BOOL)hasEvaluationMetricsOneWeekAgo
{
  return self->_evaluationMetricsOneWeekAgo != 0;
}

- (BOOL)hasEvaluationMetricsTwoWeeksAgo
{
  return self->_evaluationMetricsTwoWeeksAgo != 0;
}

- (BOOL)hasEvaluationMetricsThreeWeeksAgo
{
  return self->_evaluationMetricsThreeWeeksAgo != 0;
}

- (BOOL)hasEvaluationMetricsFourWeeksAgo
{
  return self->_evaluationMetricsFourWeeksAgo != 0;
}

- (BOOL)hasEvaluationMetricsLastFourWeeks
{
  return self->_evaluationMetricsLastFourWeeks != 0;
}

- (void)clearCandidateMetrics
{
}

- (void)addCandidateMetrics:(id)a3
{
  id v4 = a3;
  candidateMetrics = self->_candidateMetrics;
  id v8 = v4;
  if (!candidateMetrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_candidateMetrics;
    self->_candidateMetrics = v6;

    id v4 = v8;
    candidateMetrics = self->_candidateMetrics;
  }
  [(NSMutableArray *)candidateMetrics addObject:v4];
}

- (unint64_t)candidateMetricsCount
{
  return [(NSMutableArray *)self->_candidateMetrics count];
}

- (id)candidateMetricsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_candidateMetrics objectAtIndex:a3];
}

+ (Class)candidateMetricsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXCandidateRelevanceModelPBMetrics;
  id v4 = [(ATXCandidateRelevanceModelPBMetrics *)&v8 description];
  v5 = [(ATXCandidateRelevanceModelPBMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  modelMetrics = self->_modelMetrics;
  if (modelMetrics)
  {
    v5 = [(ATXCandidateRelevanceModelPBModelMetrics *)modelMetrics dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"modelMetrics"];
  }
  evaluationMetricsOneWeekAgo = self->_evaluationMetricsOneWeekAgo;
  if (evaluationMetricsOneWeekAgo)
  {
    v7 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)evaluationMetricsOneWeekAgo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"evaluationMetricsOneWeekAgo"];
  }
  evaluationMetricsTwoWeeksAgo = self->_evaluationMetricsTwoWeeksAgo;
  if (evaluationMetricsTwoWeeksAgo)
  {
    v9 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)evaluationMetricsTwoWeeksAgo dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"evaluationMetricsTwoWeeksAgo"];
  }
  evaluationMetricsThreeWeeksAgo = self->_evaluationMetricsThreeWeeksAgo;
  if (evaluationMetricsThreeWeeksAgo)
  {
    v11 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)evaluationMetricsThreeWeeksAgo dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"evaluationMetricsThreeWeeksAgo"];
  }
  evaluationMetricsFourWeeksAgo = self->_evaluationMetricsFourWeeksAgo;
  if (evaluationMetricsFourWeeksAgo)
  {
    v13 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)evaluationMetricsFourWeeksAgo dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"evaluationMetricsFourWeeksAgo"];
  }
  evaluationMetricsLastFourWeeks = self->_evaluationMetricsLastFourWeeks;
  if (evaluationMetricsLastFourWeeks)
  {
    v15 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)evaluationMetricsLastFourWeeks dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"evaluationMetricsLastFourWeeks"];
  }
  if ([(NSMutableArray *)self->_candidateMetrics count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_candidateMetrics, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = self->_candidateMetrics;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"candidateMetrics"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBMetricsReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_modelMetrics) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_evaluationMetricsOneWeekAgo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_evaluationMetricsTwoWeeksAgo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_evaluationMetricsThreeWeeksAgo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_evaluationMetricsFourWeeksAgo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_evaluationMetricsLastFourWeeks) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_candidateMetrics;
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
  if (self->_modelMetrics) {
    objc_msgSend(v8, "setModelMetrics:");
  }
  if (self->_evaluationMetricsOneWeekAgo) {
    objc_msgSend(v8, "setEvaluationMetricsOneWeekAgo:");
  }
  if (self->_evaluationMetricsTwoWeeksAgo) {
    objc_msgSend(v8, "setEvaluationMetricsTwoWeeksAgo:");
  }
  if (self->_evaluationMetricsThreeWeeksAgo) {
    objc_msgSend(v8, "setEvaluationMetricsThreeWeeksAgo:");
  }
  if (self->_evaluationMetricsFourWeeksAgo) {
    objc_msgSend(v8, "setEvaluationMetricsFourWeeksAgo:");
  }
  if (self->_evaluationMetricsLastFourWeeks) {
    objc_msgSend(v8, "setEvaluationMetricsLastFourWeeks:");
  }
  if ([(ATXCandidateRelevanceModelPBMetrics *)self candidateMetricsCount])
  {
    [v8 clearCandidateMetrics];
    unint64_t v4 = [(ATXCandidateRelevanceModelPBMetrics *)self candidateMetricsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXCandidateRelevanceModelPBMetrics *)self candidateMetricsAtIndex:i];
        [v8 addCandidateMetrics:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ATXCandidateRelevanceModelPBModelMetrics *)self->_modelMetrics copyWithZone:a3];
  uint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsOneWeekAgo copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsTwoWeeksAgo copyWithZone:a3];
  long long v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsThreeWeeksAgo copyWithZone:a3];
  long long v13 = (void *)v5[5];
  v5[5] = v12;

  id v14 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsFourWeeksAgo copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsLastFourWeeks copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_candidateMetrics;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addCandidateMetrics:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((modelMetrics = self->_modelMetrics, !((unint64_t)modelMetrics | v4[7]))
     || -[ATXCandidateRelevanceModelPBModelMetrics isEqual:](modelMetrics, "isEqual:"))
    && ((evaluationMetricsOneWeekAgo = self->_evaluationMetricsOneWeekAgo,
         !((unint64_t)evaluationMetricsOneWeekAgo | v4[4]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsOneWeekAgo, "isEqual:"))
    && ((evaluationMetricsTwoWeeksAgo = self->_evaluationMetricsTwoWeeksAgo,
         !((unint64_t)evaluationMetricsTwoWeeksAgo | v4[6]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsTwoWeeksAgo, "isEqual:"))
    && ((evaluationMetricsThreeWeeksAgo = self->_evaluationMetricsThreeWeeksAgo,
         !((unint64_t)evaluationMetricsThreeWeeksAgo | v4[5]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsThreeWeeksAgo, "isEqual:"))
    && ((evaluationMetricsFourWeeksAgo = self->_evaluationMetricsFourWeeksAgo,
         !((unint64_t)evaluationMetricsFourWeeksAgo | v4[2]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsFourWeeksAgo, "isEqual:"))
    && ((evaluationMetricsLastFourWeeks = self->_evaluationMetricsLastFourWeeks,
         !((unint64_t)evaluationMetricsLastFourWeeks | v4[3]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsLastFourWeeks, "isEqual:")))
  {
    candidateMetrics = self->_candidateMetrics;
    if ((unint64_t)candidateMetrics | v4[1]) {
      char v12 = -[NSMutableArray isEqual:](candidateMetrics, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXCandidateRelevanceModelPBModelMetrics *)self->_modelMetrics hash];
  unint64_t v4 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsOneWeekAgo hash] ^ v3;
  unint64_t v5 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsTwoWeeksAgo hash];
  unint64_t v6 = v4 ^ v5 ^ [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsThreeWeeksAgo hash];
  unint64_t v7 = [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsFourWeeksAgo hash];
  unint64_t v8 = v7 ^ [(ATXCandidateRelevanceModelPBEvaluationMetrics *)self->_evaluationMetricsLastFourWeeks hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_candidateMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  modelMetrics = self->_modelMetrics;
  uint64_t v6 = *((void *)v4 + 7);
  if (modelMetrics)
  {
    if (v6) {
      -[ATXCandidateRelevanceModelPBModelMetrics mergeFrom:](modelMetrics, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ATXCandidateRelevanceModelPBMetrics setModelMetrics:](self, "setModelMetrics:");
  }
  evaluationMetricsOneWeekAgo = self->_evaluationMetricsOneWeekAgo;
  uint64_t v8 = *((void *)v4 + 4);
  if (evaluationMetricsOneWeekAgo)
  {
    if (v8) {
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsOneWeekAgo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsOneWeekAgo:](self, "setEvaluationMetricsOneWeekAgo:");
  }
  evaluationMetricsTwoWeeksAgo = self->_evaluationMetricsTwoWeeksAgo;
  uint64_t v10 = *((void *)v4 + 6);
  if (evaluationMetricsTwoWeeksAgo)
  {
    if (v10) {
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsTwoWeeksAgo, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsTwoWeeksAgo:](self, "setEvaluationMetricsTwoWeeksAgo:");
  }
  evaluationMetricsThreeWeeksAgo = self->_evaluationMetricsThreeWeeksAgo;
  uint64_t v12 = *((void *)v4 + 5);
  if (evaluationMetricsThreeWeeksAgo)
  {
    if (v12) {
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsThreeWeeksAgo, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsThreeWeeksAgo:](self, "setEvaluationMetricsThreeWeeksAgo:");
  }
  evaluationMetricsFourWeeksAgo = self->_evaluationMetricsFourWeeksAgo;
  uint64_t v14 = *((void *)v4 + 2);
  if (evaluationMetricsFourWeeksAgo)
  {
    if (v14) {
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsFourWeeksAgo, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsFourWeeksAgo:](self, "setEvaluationMetricsFourWeeksAgo:");
  }
  evaluationMetricsLastFourWeeks = self->_evaluationMetricsLastFourWeeks;
  uint64_t v16 = *((void *)v4 + 3);
  if (evaluationMetricsLastFourWeeks)
  {
    if (v16) {
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsLastFourWeeks, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsLastFourWeeks:](self, "setEvaluationMetricsLastFourWeeks:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = *((id *)v4 + 1);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[ATXCandidateRelevanceModelPBMetrics addCandidateMetrics:](self, "addCandidateMetrics:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v19);
  }
}

- (ATXCandidateRelevanceModelPBModelMetrics)modelMetrics
{
  return self->_modelMetrics;
}

- (void)setModelMetrics:(id)a3
{
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsOneWeekAgo
{
  return self->_evaluationMetricsOneWeekAgo;
}

- (void)setEvaluationMetricsOneWeekAgo:(id)a3
{
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsTwoWeeksAgo
{
  return self->_evaluationMetricsTwoWeeksAgo;
}

- (void)setEvaluationMetricsTwoWeeksAgo:(id)a3
{
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsThreeWeeksAgo
{
  return self->_evaluationMetricsThreeWeeksAgo;
}

- (void)setEvaluationMetricsThreeWeeksAgo:(id)a3
{
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsFourWeeksAgo
{
  return self->_evaluationMetricsFourWeeksAgo;
}

- (void)setEvaluationMetricsFourWeeksAgo:(id)a3
{
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsLastFourWeeks
{
  return self->_evaluationMetricsLastFourWeeks;
}

- (void)setEvaluationMetricsLastFourWeeks:(id)a3
{
}

- (NSMutableArray)candidateMetrics
{
  return self->_candidateMetrics;
}

- (void)setCandidateMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelMetrics, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsTwoWeeksAgo, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsThreeWeeksAgo, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsOneWeekAgo, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsLastFourWeeks, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsFourWeeksAgo, 0);
  objc_storeStrong((id *)&self->_candidateMetrics, 0);
}

@end