@interface GEOLogMsgEventStateTiming
+ (BOOL)isValid:(id)a3;
+ (Class)stateTransitionFeedbackType;
- (BOOL)hasDurationInOldState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventStateTiming)initWithDictionary:(id)a3;
- (GEOLogMsgEventStateTiming)initWithJSON:(id)a3;
- (NSMutableArray)stateTransitionFeedbacks;
- (double)durationInOldState;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)stateTransitionFeedbackAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)stateTransitionFeedbacksCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addStateTransitionFeedback:(id)a3;
- (void)clearStateTransitionFeedbacks;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationInOldState:(double)a3;
- (void)setHasDurationInOldState:(BOOL)a3;
- (void)setStateTransitionFeedbacks:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventStateTiming

- (NSMutableArray)stateTransitionFeedbacks
{
  return self->_stateTransitionFeedbacks;
}

- (void)setStateTransitionFeedbacks:(id)a3
{
}

- (void)clearStateTransitionFeedbacks
{
}

- (void)addStateTransitionFeedback:(id)a3
{
  id v4 = a3;
  stateTransitionFeedbacks = self->_stateTransitionFeedbacks;
  id v8 = v4;
  if (!stateTransitionFeedbacks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_stateTransitionFeedbacks;
    self->_stateTransitionFeedbacks = v6;

    id v4 = v8;
    stateTransitionFeedbacks = self->_stateTransitionFeedbacks;
  }
  [(NSMutableArray *)stateTransitionFeedbacks addObject:v4];
}

- (unint64_t)stateTransitionFeedbacksCount
{
  return [(NSMutableArray *)self->_stateTransitionFeedbacks count];
}

- (id)stateTransitionFeedbackAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stateTransitionFeedbacks objectAtIndex:a3];
}

+ (Class)stateTransitionFeedbackType
{
  return (Class)objc_opt_class();
}

- (double)durationInOldState
{
  return self->_durationInOldState;
}

- (void)setDurationInOldState:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_durationInOldState = a3;
}

- (void)setHasDurationInOldState:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDurationInOldState
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventStateTiming;
  id v4 = [(GEOLogMsgEventStateTiming *)&v8 description];
  v5 = [(GEOLogMsgEventStateTiming *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventStateTiming _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v17);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"stateTransitionFeedback";
      }
      else {
        v13 = @"state_transition_feedback";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v17);
    }
    if (*(unsigned char *)(a1 + 24))
    {
      v14 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      if (a2) {
        v15 = @"durationInOldState";
      }
      else {
        v15 = @"duration_in_old_state";
      }
      [v4 setObject:v14 forKey:v15];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventStateTiming _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventStateTiming)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventStateTiming *)-[GEOLogMsgEventStateTiming _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"stateTransitionFeedback";
      }
      else {
        id v6 = @"state_transition_feedback";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v20 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOStateTransitionFeedback alloc];
                if (a3) {
                  uint64_t v15 = [(GEOStateTransitionFeedback *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOStateTransitionFeedback *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addStateTransitionFeedback:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v20;
      }

      if (a3) {
        long long v17 = @"durationInOldState";
      }
      else {
        long long v17 = @"duration_in_old_state";
      }
      long long v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 doubleValue];
        objc_msgSend(a1, "setDurationInOldState:");
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventStateTiming)initWithJSON:(id)a3
{
  return (GEOLogMsgEventStateTiming *)-[GEOLogMsgEventStateTiming _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventStateTimingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventStateTimingReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_stateTransitionFeedbacks;
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

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOLogMsgEventStateTiming *)self readAll:0];
  if ([(GEOLogMsgEventStateTiming *)self stateTransitionFeedbacksCount])
  {
    [v8 clearStateTransitionFeedbacks];
    unint64_t v4 = [(GEOLogMsgEventStateTiming *)self stateTransitionFeedbacksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventStateTiming *)self stateTransitionFeedbackAtIndex:i];
        [v8 addStateTransitionFeedback:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((void *)v8 + 1) = *(void *)&self->_durationInOldState;
    *((unsigned char *)v8 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_stateTransitionFeedbacks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addStateTransitionFeedback:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 8) = self->_durationInOldState;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOLogMsgEventStateTiming *)self readAll:1];
  [v4 readAll:1];
  stateTransitionFeedbacks = self->_stateTransitionFeedbacks;
  if ((unint64_t)stateTransitionFeedbacks | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](stateTransitionFeedbacks, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_durationInOldState == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventStateTiming *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_stateTransitionFeedbacks hash];
  if (*(unsigned char *)&self->_flags)
  {
    double durationInOldState = self->_durationInOldState;
    double v6 = -durationInOldState;
    if (durationInOldState >= 0.0) {
      double v6 = self->_durationInOldState;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[GEOLogMsgEventStateTiming addStateTransitionFeedback:](self, "addStateTransitionFeedback:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_double durationInOldState = *((double *)v4 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end