@interface BMLighthouseTaskTelemetry
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseTaskTelemetry)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseTaskTelemetry)initWithVersion:(id)a3 bucketStart:(id)a4 bucketEnd:(id)a5 taskName:(id)a6 taskState:(id)a7 latestEventTimestamp:(id)a8 countCompleted:(id)a9 countFailed:(id)a10 countDeferred:(id)a11 dailyExecutionLatency:(id)a12 crossExecutionDelay:(id)a13 executionCompletionTime:(id)a14 executionFailureTime:(id)a15 executionDeferralTime:(id)a16;
- (BOOL)hasCountCompleted;
- (BOOL)hasCountDeferred;
- (BOOL)hasCountFailed;
- (BOOL)hasCrossExecutionDelay;
- (BOOL)hasDailyExecutionLatency;
- (BOOL)hasExecutionCompletionTime;
- (BOOL)hasExecutionDeferralTime;
- (BOOL)hasExecutionFailureTime;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (NSDate)bucketEnd;
- (NSDate)bucketStart;
- (NSDate)latestEventTimestamp;
- (NSString)description;
- (NSString)taskName;
- (NSString)taskState;
- (double)crossExecutionDelay;
- (double)dailyExecutionLatency;
- (double)executionCompletionTime;
- (double)executionDeferralTime;
- (double)executionFailureTime;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)countCompleted;
- (int)countDeferred;
- (int)countFailed;
- (int)version;
- (unsigned)dataVersion;
- (void)setHasCountCompleted:(BOOL)a3;
- (void)setHasCountDeferred:(BOOL)a3;
- (void)setHasCountFailed:(BOOL)a3;
- (void)setHasCrossExecutionDelay:(BOOL)a3;
- (void)setHasDailyExecutionLatency:(BOOL)a3;
- (void)setHasExecutionCompletionTime:(BOOL)a3;
- (void)setHasExecutionDeferralTime:(BOOL)a3;
- (void)setHasExecutionFailureTime:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseTaskTelemetry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskState, 0);

  objc_storeStrong((id *)&self->_taskName, 0);
}

- (void)setHasExecutionDeferralTime:(BOOL)a3
{
  self->_hasExecutionDeferralTime = a3;
}

- (BOOL)hasExecutionDeferralTime
{
  return self->_hasExecutionDeferralTime;
}

- (double)executionDeferralTime
{
  return self->_executionDeferralTime;
}

- (void)setHasExecutionFailureTime:(BOOL)a3
{
  self->_hasExecutionFailureTime = a3;
}

- (BOOL)hasExecutionFailureTime
{
  return self->_hasExecutionFailureTime;
}

- (double)executionFailureTime
{
  return self->_executionFailureTime;
}

- (void)setHasExecutionCompletionTime:(BOOL)a3
{
  self->_hasExecutionCompletionTime = a3;
}

- (BOOL)hasExecutionCompletionTime
{
  return self->_hasExecutionCompletionTime;
}

- (double)executionCompletionTime
{
  return self->_executionCompletionTime;
}

- (void)setHasCrossExecutionDelay:(BOOL)a3
{
  self->_hasCrossExecutionDelay = a3;
}

- (BOOL)hasCrossExecutionDelay
{
  return self->_hasCrossExecutionDelay;
}

- (double)crossExecutionDelay
{
  return self->_crossExecutionDelay;
}

- (void)setHasDailyExecutionLatency:(BOOL)a3
{
  self->_hasDailyExecutionLatency = a3;
}

- (BOOL)hasDailyExecutionLatency
{
  return self->_hasDailyExecutionLatency;
}

- (double)dailyExecutionLatency
{
  return self->_dailyExecutionLatency;
}

- (void)setHasCountDeferred:(BOOL)a3
{
  self->_hasCountDeferred = a3;
}

- (BOOL)hasCountDeferred
{
  return self->_hasCountDeferred;
}

- (int)countDeferred
{
  return self->_countDeferred;
}

- (void)setHasCountFailed:(BOOL)a3
{
  self->_hasCountFailed = a3;
}

- (BOOL)hasCountFailed
{
  return self->_hasCountFailed;
}

- (int)countFailed
{
  return self->_countFailed;
}

- (void)setHasCountCompleted:(BOOL)a3
{
  self->_hasCountCompleted = a3;
}

- (BOOL)hasCountCompleted
{
  return self->_hasCountCompleted;
}

- (int)countCompleted
{
  return self->_countCompleted;
}

- (NSString)taskState
{
  return self->_taskState;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (int)version
{
  return self->_version;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (-[BMLighthouseTaskTelemetry hasVersion](self, "hasVersion") || [v5 hasVersion])
    {
      if (![(BMLighthouseTaskTelemetry *)self hasVersion]) {
        goto LABEL_68;
      }
      if (![v5 hasVersion]) {
        goto LABEL_68;
      }
      int v6 = [(BMLighthouseTaskTelemetry *)self version];
      if (v6 != [v5 version]) {
        goto LABEL_68;
      }
    }
    v7 = [(BMLighthouseTaskTelemetry *)self bucketStart];
    uint64_t v8 = [v5 bucketStart];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMLighthouseTaskTelemetry *)self bucketStart];
      v11 = [v5 bucketStart];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_68;
      }
    }
    v14 = [(BMLighthouseTaskTelemetry *)self bucketEnd];
    uint64_t v15 = [v5 bucketEnd];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMLighthouseTaskTelemetry *)self bucketEnd];
      v18 = [v5 bucketEnd];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_68;
      }
    }
    v20 = [(BMLighthouseTaskTelemetry *)self taskName];
    uint64_t v21 = [v5 taskName];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMLighthouseTaskTelemetry *)self taskName];
      v24 = [v5 taskName];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_68;
      }
    }
    v26 = [(BMLighthouseTaskTelemetry *)self taskState];
    uint64_t v27 = [v5 taskState];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMLighthouseTaskTelemetry *)self taskState];
      v30 = [v5 taskState];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_68;
      }
    }
    v32 = [(BMLighthouseTaskTelemetry *)self latestEventTimestamp];
    uint64_t v33 = [v5 latestEventTimestamp];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMLighthouseTaskTelemetry *)self latestEventTimestamp];
      v36 = [v5 latestEventTimestamp];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_68;
      }
    }
    if (![(BMLighthouseTaskTelemetry *)self hasCountCompleted]
      && ![v5 hasCountCompleted]
      || [(BMLighthouseTaskTelemetry *)self hasCountCompleted]
      && [v5 hasCountCompleted]
      && (int v38 = [(BMLighthouseTaskTelemetry *)self countCompleted],
          v38 == [v5 countCompleted]))
    {
      if (![(BMLighthouseTaskTelemetry *)self hasCountFailed]
        && ![v5 hasCountFailed]
        || [(BMLighthouseTaskTelemetry *)self hasCountFailed]
        && [v5 hasCountFailed]
        && (int v39 = [(BMLighthouseTaskTelemetry *)self countFailed],
            v39 == [v5 countFailed]))
      {
        if (![(BMLighthouseTaskTelemetry *)self hasCountDeferred]
          && ![v5 hasCountDeferred]
          || [(BMLighthouseTaskTelemetry *)self hasCountDeferred]
          && [v5 hasCountDeferred]
          && (int v40 = [(BMLighthouseTaskTelemetry *)self countDeferred],
              v40 == [v5 countDeferred]))
        {
          if (![(BMLighthouseTaskTelemetry *)self hasDailyExecutionLatency]
            && ![v5 hasDailyExecutionLatency]
            || [(BMLighthouseTaskTelemetry *)self hasDailyExecutionLatency]
            && [v5 hasDailyExecutionLatency]
            && ([(BMLighthouseTaskTelemetry *)self dailyExecutionLatency],
                double v42 = v41,
                [v5 dailyExecutionLatency],
                v42 == v43))
          {
            if (![(BMLighthouseTaskTelemetry *)self hasCrossExecutionDelay]
              && ![v5 hasCrossExecutionDelay]
              || [(BMLighthouseTaskTelemetry *)self hasCrossExecutionDelay]
              && [v5 hasCrossExecutionDelay]
              && ([(BMLighthouseTaskTelemetry *)self crossExecutionDelay],
                  double v45 = v44,
                  [v5 crossExecutionDelay],
                  v45 == v46))
            {
              if (![(BMLighthouseTaskTelemetry *)self hasExecutionCompletionTime]
                && ![v5 hasExecutionCompletionTime]
                || [(BMLighthouseTaskTelemetry *)self hasExecutionCompletionTime]
                && [v5 hasExecutionCompletionTime]
                && ([(BMLighthouseTaskTelemetry *)self executionCompletionTime],
                    double v48 = v47,
                    [v5 executionCompletionTime],
                    v48 == v49))
              {
                if (![(BMLighthouseTaskTelemetry *)self hasExecutionFailureTime]
                  && ![v5 hasExecutionFailureTime]
                  || [(BMLighthouseTaskTelemetry *)self hasExecutionFailureTime]
                  && [v5 hasExecutionFailureTime]
                  && ([(BMLighthouseTaskTelemetry *)self executionFailureTime],
                      double v51 = v50,
                      [v5 executionFailureTime],
                      v51 == v52))
                {
                  if (![(BMLighthouseTaskTelemetry *)self hasExecutionDeferralTime]
                    && ![v5 hasExecutionDeferralTime])
                  {
                    BOOL v13 = 1;
                    goto LABEL_69;
                  }
                  if ([(BMLighthouseTaskTelemetry *)self hasExecutionDeferralTime]
                    && [v5 hasExecutionDeferralTime])
                  {
                    [(BMLighthouseTaskTelemetry *)self executionDeferralTime];
                    double v54 = v53;
                    [v5 executionDeferralTime];
                    BOOL v13 = v54 == v55;
LABEL_69:

                    goto LABEL_70;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_68:
    BOOL v13 = 0;
    goto LABEL_69;
  }
  BOOL v13 = 0;
LABEL_70:

  return v13;
}

- (NSDate)latestEventTimestamp
{
  if (self->_hasRaw_latestEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_latestEventTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)bucketEnd
{
  if (self->_hasRaw_bucketEnd)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bucketEnd];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)bucketStart
{
  if (self->_hasRaw_bucketStart)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bucketStart];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v63[14] = *MEMORY[0x1E4F143B8];
  if ([(BMLighthouseTaskTelemetry *)self hasVersion])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry version](self, "version"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  id v4 = [(BMLighthouseTaskTelemetry *)self bucketStart];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMLighthouseTaskTelemetry *)self bucketStart];
    [v6 timeIntervalSince1970];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v8 = [(BMLighthouseTaskTelemetry *)self bucketEnd];
  if (v8)
  {
    v9 = NSNumber;
    v10 = [(BMLighthouseTaskTelemetry *)self bucketEnd];
    [v10 timeIntervalSince1970];
    objc_msgSend(v9, "numberWithDouble:");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  uint64_t v12 = [(BMLighthouseTaskTelemetry *)self taskName];
  v61 = [(BMLighthouseTaskTelemetry *)self taskState];
  BOOL v13 = [(BMLighthouseTaskTelemetry *)self latestEventTimestamp];
  if (v13)
  {
    v14 = NSNumber;
    uint64_t v15 = [(BMLighthouseTaskTelemetry *)self latestEventTimestamp];
    [v15 timeIntervalSince1970];
    objc_msgSend(v14, "numberWithDouble:");
    id v60 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v60 = 0;
  }

  if ([(BMLighthouseTaskTelemetry *)self hasCountCompleted])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry countCompleted](self, "countCompleted"));
    id v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v59 = 0;
  }
  if ([(BMLighthouseTaskTelemetry *)self hasCountFailed])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry countFailed](self, "countFailed"));
    id v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v58 = 0;
  }
  if ([(BMLighthouseTaskTelemetry *)self hasCountDeferred])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry countDeferred](self, "countDeferred"));
    id v57 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v57 = 0;
  }
  if (![(BMLighthouseTaskTelemetry *)self hasDailyExecutionLatency]
    || ([(BMLighthouseTaskTelemetry *)self dailyExecutionLatency], fabs(v16) == INFINITY))
  {
    id v56 = 0;
  }
  else
  {
    [(BMLighthouseTaskTelemetry *)self dailyExecutionLatency];
    v17 = NSNumber;
    [(BMLighthouseTaskTelemetry *)self dailyExecutionLatency];
    objc_msgSend(v17, "numberWithDouble:");
    id v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMLighthouseTaskTelemetry *)self hasCrossExecutionDelay]
    || ([(BMLighthouseTaskTelemetry *)self crossExecutionDelay], fabs(v18) == INFINITY))
  {
    id v55 = 0;
  }
  else
  {
    [(BMLighthouseTaskTelemetry *)self crossExecutionDelay];
    int v19 = NSNumber;
    [(BMLighthouseTaskTelemetry *)self crossExecutionDelay];
    objc_msgSend(v19, "numberWithDouble:");
    id v55 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMLighthouseTaskTelemetry *)self hasExecutionCompletionTime]
    || ([(BMLighthouseTaskTelemetry *)self executionCompletionTime], fabs(v20) == INFINITY))
  {
    id v54 = 0;
  }
  else
  {
    [(BMLighthouseTaskTelemetry *)self executionCompletionTime];
    uint64_t v21 = NSNumber;
    [(BMLighthouseTaskTelemetry *)self executionCompletionTime];
    objc_msgSend(v21, "numberWithDouble:");
    id v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMLighthouseTaskTelemetry *)self hasExecutionFailureTime]
    || ([(BMLighthouseTaskTelemetry *)self executionFailureTime], fabs(v22) == INFINITY))
  {
    id v53 = 0;
  }
  else
  {
    [(BMLighthouseTaskTelemetry *)self executionFailureTime];
    v23 = NSNumber;
    [(BMLighthouseTaskTelemetry *)self executionFailureTime];
    objc_msgSend(v23, "numberWithDouble:");
    id v53 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMLighthouseTaskTelemetry *)self hasExecutionDeferralTime]
    || ([(BMLighthouseTaskTelemetry *)self executionDeferralTime], fabs(v24) == INFINITY))
  {
    id v26 = 0;
  }
  else
  {
    [(BMLighthouseTaskTelemetry *)self executionDeferralTime];
    int v25 = NSNumber;
    [(BMLighthouseTaskTelemetry *)self executionDeferralTime];
    objc_msgSend(v25, "numberWithDouble:");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v62[0] = @"version";
  uint64_t v27 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  double v48 = (void *)v27;
  v63[0] = v27;
  v62[1] = @"bucketStart";
  uint64_t v28 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  double v47 = (void *)v28;
  v63[1] = v28;
  v62[2] = @"bucketEnd";
  uint64_t v29 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  double v46 = (void *)v29;
  v63[2] = v29;
  v62[3] = @"taskName";
  uint64_t v30 = v12;
  if (!v12)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  double v45 = (void *)v30;
  v63[3] = v30;
  v62[4] = @"taskState";
  uint64_t v31 = (uint64_t)v61;
  if (!v61)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  double v52 = v3;
  v63[4] = v31;
  v62[5] = @"latestEventTimestamp";
  uint64_t v32 = (uint64_t)v60;
  if (!v60)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  double v50 = (void *)v12;
  double v51 = v11;
  v63[5] = v32;
  v62[6] = @"countCompleted";
  uint64_t v33 = v59;
  if (!v59)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  double v44 = (void *)v31;
  v63[6] = v33;
  v62[7] = @"countFailed";
  v34 = v58;
  if (!v58)
  {
    v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[7] = v34;
  v62[8] = @"countDeferred";
  v35 = v57;
  if (!v57)
  {
    v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = v7;
  v63[8] = v35;
  v62[9] = @"dailyExecutionLatency";
  int v37 = v56;
  if (!v56)
  {
    int v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[9] = v37;
  v62[10] = @"crossExecutionDelay";
  int v38 = v55;
  if (!v55)
  {
    int v38 = [MEMORY[0x1E4F1CA98] null];
  }
  double v43 = (void *)v32;
  v63[10] = v38;
  v62[11] = @"executionCompletionTime";
  int v39 = v54;
  if (!v54)
  {
    int v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[11] = v39;
  v62[12] = @"executionFailureTime";
  int v40 = v53;
  if (!v53)
  {
    int v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[12] = v40;
  v62[13] = @"executionDeferralTime";
  double v41 = v26;
  if (!v26)
  {
    double v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[13] = v41;
  id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:14];
  if (!v26) {

  }
  if (!v53) {
  if (!v54)
  }

  if (!v55) {
  if (!v56)
  }

  if (!v57) {
  if (!v58)
  }

  if (!v59) {
  if (!v60)
  }

  if (v61)
  {
    if (v50) {
      goto LABEL_90;
    }
  }
  else
  {

    if (v50)
    {
LABEL_90:
      if (v51) {
        goto LABEL_91;
      }
      goto LABEL_98;
    }
  }

  if (v51)
  {
LABEL_91:
    if (v36) {
      goto LABEL_92;
    }
LABEL_99:

    if (v52) {
      goto LABEL_93;
    }
    goto LABEL_100;
  }
LABEL_98:

  if (!v36) {
    goto LABEL_99;
  }
LABEL_92:
  if (v52) {
    goto LABEL_93;
  }
LABEL_100:

LABEL_93:

  return v49;
}

- (BMLighthouseTaskTelemetry)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v193[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"version"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v163 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v163 = v6;
LABEL_4:
    id v7 = [v5 objectForKeyedSubscript:@"bucketStart"];
    v161 = v6;
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v10 = v7;
      id v11 = [v9 alloc];
      [v10 doubleValue];
      double v13 = v12;

      id v14 = (id)[v11 initWithTimeIntervalSince1970:v13];
LABEL_11:
      uint64_t v8 = v14;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      uint64_t v8 = [v21 dateFromString:v7];

LABEL_16:
      double v22 = [v5 objectForKeyedSubscript:@"bucketEnd"];
      v162 = v8;
      if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v23 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v24 = (objc_class *)MEMORY[0x1E4F1C9C8];
        int v25 = v22;
        id v26 = v22;
        id v27 = [v24 alloc];
        [v26 doubleValue];
        double v29 = v28;

        double v22 = v25;
        uint64_t v30 = (id *)[v27 initWithTimeIntervalSince1970:v29];
LABEL_21:
        v23 = v30;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v23 = [v31 dateFromString:v22];

LABEL_24:
        uint64_t v32 = [v5 objectForKeyedSubscript:@"taskName"];
        v160 = (void *)v32;
        if (!v32 || (uint64_t v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v157 = 0;
          goto LABEL_27;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v157 = v33;
LABEL_27:
          v156 = a4;
          uint64_t v34 = [v5 objectForKeyedSubscript:@"taskState"];
          v158 = (void *)v34;
          if (v34)
          {
            v35 = (void *)v34;
            a4 = v23;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v159 = v35;
                goto LABEL_33;
              }
              if (v156)
              {
                id v55 = v22;
                id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
                id v57 = v7;
                uint64_t v58 = *MEMORY[0x1E4F502C8];
                uint64_t v184 = *MEMORY[0x1E4F28568];
                id v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskState"];
                v185 = v59;
                uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
                v61 = v56;
                double v22 = v55;
                uint64_t v62 = v58;
                id v7 = v57;
                v155 = (void *)v60;
                id v159 = 0;
                double v20 = 0;
                id *v156 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, 2);
                goto LABEL_45;
              }
              id v159 = 0;
              double v20 = 0;
              id v54 = v157;
LABEL_108:
              int v19 = v163;
LABEL_148:

              goto LABEL_149;
            }
          }
          else
          {
            a4 = v23;
          }
          id v159 = 0;
LABEL_33:
          uint64_t v36 = [v5 objectForKeyedSubscript:@"latestEventTimestamp"];
          v155 = (void *)v36;
          if (!v36 || (int v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v154 = 0;
LABEL_48:
            uint64_t v64 = [v5 objectForKeyedSubscript:@"countCompleted"];
            v65 = a4;
            v153 = (void *)v64;
            v151 = a4;
            if (v64 && (v66 = (void *)v64, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v156)
                {
                  a4 = v65;
                  v90 = 0;
                  double v20 = 0;
                  id v54 = v157;
                  int v19 = v163;
LABEL_145:
                  id v59 = (void *)v154;
                  goto LABEL_146;
                }
                a4 = v65;
                v83 = v22;
                id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
                v85 = v7;
                uint64_t v86 = *MEMORY[0x1E4F502C8];
                uint64_t v180 = *MEMORY[0x1E4F28568];
                id v152 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"countCompleted"];
                id v181 = v152;
                v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
                v88 = v84;
                double v22 = v83;
                uint64_t v89 = v86;
                id v7 = v85;
                double v20 = 0;
                v90 = 0;
                id v54 = v157;
                id *v156 = (id)[v88 initWithDomain:v89 code:2 userInfo:v87];
                int v19 = v163;
LABEL_144:

                goto LABEL_145;
              }
              id v150 = v66;
            }
            else
            {
              id v150 = 0;
            }
            uint64_t v67 = [v5 objectForKeyedSubscript:@"countFailed"];
            v149 = (void *)v67;
            if (v67 && (v68 = (void *)v67, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v156)
                {
                  a4 = v151;
                  id v152 = 0;
                  double v20 = 0;
                  id v54 = v157;
                  int v19 = v163;
LABEL_143:
                  v87 = v149;
                  v90 = v150;
                  goto LABEL_144;
                }
                v91 = v22;
                id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v93 = *MEMORY[0x1E4F502C8];
                uint64_t v178 = *MEMORY[0x1E4F28568];
                v82 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"countFailed"];
                v179 = v82;
                v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
                v95 = v92;
                double v22 = v91;
                double v20 = 0;
                id v152 = 0;
                id v54 = v157;
                id *v156 = (id)[v95 initWithDomain:v93 code:2 userInfo:v94];
                int v19 = v163;
                goto LABEL_142;
              }
              id v152 = v68;
            }
            else
            {
              id v152 = 0;
            }
            uint64_t v69 = [v5 objectForKeyedSubscript:@"countDeferred"];
            v148 = (void *)v69;
            if (!v69 || (v70 = (void *)v69, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v144 = 0;
              goto LABEL_57;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v144 = v70;
LABEL_57:
              uint64_t v71 = [v5 objectForKeyedSubscript:@"dailyExecutionLatency"];
              v143 = v22;
              v147 = (void *)v71;
              if (!v71 || (v72 = (void *)v71, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v73 = 0;
                goto LABEL_60;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v73 = v72;
LABEL_60:
                v74 = [v5 objectForKeyedSubscript:@"crossExecutionDelay"];
                v141 = v7;
                id v146 = v73;
                if (!v74 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v75 = 0;
                  goto LABEL_63;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v75 = v74;
LABEL_63:
                  v76 = [v5 objectForKeyedSubscript:@"executionCompletionTime"];
                  v142 = v75;
                  if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v145 = 0;
                    goto LABEL_66;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v145 = v76;
LABEL_66:
                    v77 = [v5 objectForKeyedSubscript:@"executionFailureTime"];
                    if (!v77 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v78 = self;
                      id v79 = 0;
                      goto LABEL_69;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v78 = self;
                      id v79 = v77;
LABEL_69:
                      v80 = [v5 objectForKeyedSubscript:@"executionDeferralTime"];
                      if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v81 = 0;
LABEL_72:
                        v82 = v144;
                        double v20 = [(BMLighthouseTaskTelemetry *)v78 initWithVersion:v163 bucketStart:v162 bucketEnd:v151 taskName:v157 taskState:v159 latestEventTimestamp:v154 countCompleted:v150 countFailed:v152 countDeferred:v144 dailyExecutionLatency:v146 crossExecutionDelay:v75 executionCompletionTime:v145 executionFailureTime:v79 executionDeferralTime:v81];
                        v78 = v20;
LABEL_137:
                        self = v78;

                        goto LABEL_138;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v81 = v80;
                        goto LABEL_72;
                      }
                      double v20 = (BMLighthouseTaskTelemetry *)v156;
                      if (v156)
                      {
                        id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v140 = *MEMORY[0x1E4F502C8];
                        uint64_t v166 = *MEMORY[0x1E4F28568];
                        v130 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"executionDeferralTime"];
                        v167 = v130;
                        v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
                        id *v156 = (id)[v165 initWithDomain:v140 code:2 userInfo:v131];

                        id v81 = 0;
                        double v20 = 0;
                      }
                      else
                      {
                        id v81 = 0;
                      }
LABEL_136:
                      v82 = v144;
                      goto LABEL_137;
                    }
                    if (v156)
                    {
                      v78 = self;
                      id v127 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v128 = *MEMORY[0x1E4F502C8];
                      uint64_t v168 = *MEMORY[0x1E4F28568];
                      id v81 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"executionFailureTime"];
                      id v169 = v81;
                      v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
                      id v129 = (id)[v127 initWithDomain:v128 code:2 userInfo:v80];
                      double v20 = 0;
                      id v79 = 0;
                      id *v156 = v129;
                      goto LABEL_136;
                    }
                    id v79 = 0;
                    double v20 = 0;
LABEL_134:
                    v82 = v144;
LABEL_138:

                    id v7 = v141;
                    id v54 = v157;
                    goto LABEL_139;
                  }
                  if (v156)
                  {
                    id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v111 = *MEMORY[0x1E4F502C8];
                    uint64_t v170 = *MEMORY[0x1E4F28568];
                    id v79 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"executionCompletionTime"];
                    id v171 = v79;
                    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
                    double v20 = 0;
                    id v145 = 0;
                    id *v156 = (id)[v110 initWithDomain:v111 code:2 userInfo:v77];
                    goto LABEL_134;
                  }
                  id v145 = 0;
                  double v20 = 0;
LABEL_129:
                  id v54 = v157;
                  v82 = v144;
LABEL_139:

                  int v19 = v163;
                  id v73 = v146;
                  goto LABEL_140;
                }
                if (v156)
                {
                  id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v108 = *MEMORY[0x1E4F502C8];
                  uint64_t v172 = *MEMORY[0x1E4F28568];
                  id v145 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"crossExecutionDelay"];
                  id v173 = v145;
                  v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
                  v109 = v107;
                  id v7 = v141;
                  double v20 = 0;
                  v142 = 0;
                  id *v156 = (id)[v109 initWithDomain:v108 code:2 userInfo:v76];
                  goto LABEL_129;
                }
                v142 = 0;
                double v20 = 0;
LABEL_127:
                id v54 = v157;
                int v19 = v163;
                v82 = v144;
LABEL_140:

                double v22 = v143;
                goto LABEL_141;
              }
              if (v156)
              {
                v103 = v7;
                id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v105 = *MEMORY[0x1E4F502C8];
                uint64_t v174 = *MEMORY[0x1E4F28568];
                v142 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"dailyExecutionLatency"];
                v175 = v142;
                v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
                v106 = v104;
                id v7 = v103;
                double v20 = 0;
                id v73 = 0;
                id *v156 = (id)[v106 initWithDomain:v105 code:2 userInfo:v74];
                goto LABEL_127;
              }
              id v73 = 0;
              double v20 = 0;
              id v54 = v157;
              int v19 = v163;
              v82 = v144;
LABEL_141:

              v94 = v148;
              goto LABEL_142;
            }
            if (v156)
            {
              v96 = v22;
              id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
              v98 = v7;
              uint64_t v99 = *MEMORY[0x1E4F502C8];
              uint64_t v176 = *MEMORY[0x1E4F28568];
              id v73 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"countDeferred"];
              id v177 = v73;
              uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
              v101 = v97;
              double v22 = v96;
              uint64_t v102 = v99;
              id v7 = v98;
              v147 = (void *)v100;
              double v20 = 0;
              id *v156 = (id)objc_msgSend(v101, "initWithDomain:code:userInfo:", v102, 2);
              id v54 = v157;
              int v19 = v163;
              v82 = 0;
              goto LABEL_141;
            }
            double v20 = 0;
            id v54 = v157;
            int v19 = v163;
            v94 = v148;
            v82 = 0;
LABEL_142:
            a4 = v151;

            goto LABEL_143;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v38 = (objc_class *)MEMORY[0x1E4F1C9C8];
            int v39 = v22;
            id v40 = v37;
            id v41 = [v38 alloc];
            [v40 doubleValue];
            double v43 = v42;

            double v22 = v39;
            id v44 = (id)[v41 initWithTimeIntervalSince1970:v43];
LABEL_40:
            uint64_t v154 = (uint64_t)v44;
            goto LABEL_48;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v63 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            uint64_t v154 = [v63 dateFromString:v37];

            goto LABEL_48;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v44 = v37;
            goto LABEL_40;
          }
          id v59 = v156;
          if (v156)
          {
            v132 = v22;
            id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
            v134 = v7;
            uint64_t v135 = *MEMORY[0x1E4F502C8];
            uint64_t v182 = *MEMORY[0x1E4F28568];
            v90 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"latestEventTimestamp"];
            v183 = v90;
            uint64_t v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
            v137 = v133;
            double v22 = v132;
            uint64_t v138 = v135;
            id v7 = v134;
            v153 = (void *)v136;
            double v20 = 0;
            id *v156 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v138, 2);
            id v59 = 0;
            id v54 = v157;
            int v19 = v163;
LABEL_146:

            goto LABEL_147;
          }
          double v20 = 0;
LABEL_45:
          id v54 = v157;
          int v19 = v163;
LABEL_147:

          goto LABEL_148;
        }
        if (a4)
        {
          double v45 = a4;
          a4 = v23;
          double v46 = v45;
          double v47 = v22;
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v49 = v7;
          uint64_t v50 = *MEMORY[0x1E4F502C8];
          uint64_t v186 = *MEMORY[0x1E4F28568];
          id v159 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskName"];
          id v187 = v159;
          uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
          double v52 = v48;
          double v22 = v47;
          uint64_t v53 = v50;
          id v7 = v49;
          v158 = (void *)v51;
          id v54 = 0;
          double v20 = 0;
          *double v46 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2);
          goto LABEL_108;
        }
        a4 = v23;
        id v54 = 0;
        double v20 = 0;
LABEL_115:
        int v19 = v163;
LABEL_149:

        uint64_t v8 = v162;
        goto LABEL_150;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = v22;
        goto LABEL_21;
      }
      if (a4)
      {
        id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
        v120 = v7;
        uint64_t v121 = *MEMORY[0x1E4F502C8];
        uint64_t v188 = *MEMORY[0x1E4F28568];
        uint64_t v122 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bucketEnd"];
        uint64_t v189 = v122;
        uint64_t v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
        uint64_t v124 = v121;
        id v7 = v120;
        id v54 = (void *)v122;
        v160 = (void *)v123;
        id v125 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v124, 2);
        v126 = a4;
        a4 = 0;
        double v20 = 0;
        id *v126 = v125;
        goto LABEL_115;
      }
      double v20 = 0;
LABEL_132:
      int v19 = v163;
LABEL_150:

      int v6 = v161;
      goto LABEL_151;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v7;
      goto LABEL_11;
    }
    if (a4)
    {
      id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
      v113 = v7;
      uint64_t v114 = *MEMORY[0x1E4F502C8];
      uint64_t v190 = *MEMORY[0x1E4F28568];
      v115 = a4;
      a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bucketStart"];
      v191 = a4;
      uint64_t v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
      v117 = v112;
      double v22 = (void *)v116;
      uint64_t v118 = v114;
      id v7 = v113;
      uint64_t v8 = 0;
      double v20 = 0;
      id *v115 = (id)[v117 initWithDomain:v118 code:2 userInfo:v116];
      goto LABEL_132;
    }
    uint64_t v8 = 0;
    double v20 = 0;
    int v19 = v163;
LABEL_151:

    goto LABEL_152;
  }
  if (a4)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F502C8];
    uint64_t v192 = *MEMORY[0x1E4F28568];
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"version"];
    v193[0] = v8;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:&v192 count:1];
    uint64_t v18 = v16;
    id v7 = (void *)v17;
    int v19 = 0;
    double v20 = 0;
    *a4 = (id)[v15 initWithDomain:v18 code:2 userInfo:v17];
    goto LABEL_151;
  }
  int v19 = 0;
  double v20 = 0;
LABEL_152:

  return v20;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMLighthouseTaskTelemetry *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasVersion)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRaw_bucketStart)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRaw_bucketEnd)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_taskName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_taskState)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_latestEventTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasCountCompleted)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCountFailed)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCountDeferred)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasDailyExecutionLatency)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasCrossExecutionDelay)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasExecutionCompletionTime)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasExecutionFailureTime)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasExecutionDeferralTime)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)BMLighthouseTaskTelemetry;
  id v5 = [(BMEventBase *)&v69 init];
  if (!v5) {
    goto LABEL_114;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasVersion = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_78;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_80;
            }
          }
          v4[*v8] = 1;
LABEL_78:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_80:
          uint64_t v65 = 80;
          goto LABEL_93;
        case 2u:
          v5->_hasRaw_bucketStart = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 24;
          goto LABEL_110;
        case 3u:
          v5->_hasRaw_bucketEnd = 1;
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 40;
          goto LABEL_110;
        case 4u:
          uint64_t v32 = PBReaderReadString();
          uint64_t v33 = 96;
          goto LABEL_37;
        case 5u:
          uint64_t v32 = PBReaderReadString();
          uint64_t v33 = 104;
LABEL_37:
          uint64_t v34 = *(Class *)((char *)&v5->super.super.isa + v33);
          *(Class *)((char *)&v5->super.super.isa + v33) = (Class)v32;

          continue;
        case 6u:
          v5->_hasRaw_latestEventTimestamp = 1;
          uint64_t v35 = *v6;
          unint64_t v36 = *(void *)&v4[v35];
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v36);
            *(void *)&v4[v35] = v36 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 56;
          goto LABEL_110;
        case 7u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v22 = 0;
          v5->_hasCountCompleted = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v41;
              v22 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                BOOL v17 = v38++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_84:
          uint64_t v65 = 84;
          goto LABEL_93;
        case 8u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v22 = 0;
          v5->_hasCountFailed = 1;
          while (2)
          {
            uint64_t v45 = *v6;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v9] + v46);
              *(void *)&v4[v45] = v47;
              v22 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v17 = v44++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_88:
          uint64_t v65 = 88;
          goto LABEL_93;
        case 9u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v22 = 0;
          v5->_hasCountDeferred = 1;
          break;
        case 0xAu:
          v5->_hasDailyExecutionLatency = 1;
          uint64_t v55 = *v6;
          unint64_t v56 = *(void *)&v4[v55];
          if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v56);
            *(void *)&v4[v55] = v56 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 112;
          goto LABEL_110;
        case 0xBu:
          v5->_hasCrossExecutionDelay = 1;
          uint64_t v57 = *v6;
          unint64_t v58 = *(void *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v58);
            *(void *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 120;
          goto LABEL_110;
        case 0xCu:
          v5->_hasExecutionCompletionTime = 1;
          uint64_t v59 = *v6;
          unint64_t v60 = *(void *)&v4[v59];
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v60);
            *(void *)&v4[v59] = v60 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 128;
          goto LABEL_110;
        case 0xDu:
          v5->_hasExecutionFailureTime = 1;
          uint64_t v61 = *v6;
          unint64_t v62 = *(void *)&v4[v61];
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v62);
            *(void *)&v4[v61] = v62 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 136;
          goto LABEL_110;
        case 0xEu:
          v5->_hasExecutionDeferralTime = 1;
          uint64_t v63 = *v6;
          unint64_t v64 = *(void *)&v4[v63];
          if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(objc_class **)(*(void *)&v4[*v9] + v64);
            *(void *)&v4[v63] = v64 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0;
          }
          uint64_t v66 = 144;
LABEL_110:
          *(Class *)((char *)&v5->super.super.isa + v66) = v29;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_113;
          }
          continue;
      }
      while (1)
      {
        uint64_t v51 = *v6;
        uint64_t v52 = *(void *)&v4[v51];
        unint64_t v53 = v52 + 1;
        if (v52 == -1 || v53 > *(void *)&v4[*v7]) {
          break;
        }
        char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v52);
        *(void *)&v4[v51] = v53;
        v22 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0) {
          goto LABEL_90;
        }
        v49 += 7;
        BOOL v17 = v50++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_92;
        }
      }
      v4[*v8] = 1;
LABEL_90:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_92:
      uint64_t v65 = 92;
LABEL_93:
      *(_DWORD *)((char *)&v5->super.super.isa + v65) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_113:
  }
    uint64_t v67 = 0;
  else {
LABEL_114:
  }
    uint64_t v67 = v5;

  return v67;
}

- (NSString)description
{
  id v20 = [NSString alloc];
  int v19 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry version](self, "version"));
  uint64_t v24 = [(BMLighthouseTaskTelemetry *)self bucketStart];
  uint64_t v23 = [(BMLighthouseTaskTelemetry *)self bucketEnd];
  uint64_t v22 = [(BMLighthouseTaskTelemetry *)self taskName];
  unint64_t v15 = [(BMLighthouseTaskTelemetry *)self taskState];
  int v18 = [(BMLighthouseTaskTelemetry *)self latestEventTimestamp];
  BOOL v17 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry countCompleted](self, "countCompleted"));
  char v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry countFailed](self, "countFailed"));
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskTelemetry countDeferred](self, "countDeferred"));
  id v4 = NSNumber;
  [(BMLighthouseTaskTelemetry *)self dailyExecutionLatency];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  int v6 = NSNumber;
  [(BMLighthouseTaskTelemetry *)self crossExecutionDelay];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = NSNumber;
  [(BMLighthouseTaskTelemetry *)self executionCompletionTime];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = NSNumber;
  [(BMLighthouseTaskTelemetry *)self executionFailureTime];
  unsigned int v11 = objc_msgSend(v10, "numberWithDouble:");
  unint64_t v12 = NSNumber;
  [(BMLighthouseTaskTelemetry *)self executionDeferralTime];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  unsigned int v21 = (void *)[v20 initWithFormat:@"BMLighthouseTaskTelemetry with version: %@, bucketStart: %@, bucketEnd: %@, taskName: %@, taskState: %@, latestEventTimestamp: %@, countCompleted: %@, countFailed: %@, countDeferred: %@, dailyExecutionLatency: %@, crossExecutionDelay: %@, executionCompletionTime: %@, executionFailureTime: %@, executionDeferralTime: %@", v19, v24, v23, v22, v15, v18, v17, v16, v3, v5, v7, v9, v11, v13];

  return (NSString *)v21;
}

- (BMLighthouseTaskTelemetry)initWithVersion:(id)a3 bucketStart:(id)a4 bucketEnd:(id)a5 taskName:(id)a6 taskState:(id)a7 latestEventTimestamp:(id)a8 countCompleted:(id)a9 countFailed:(id)a10 countDeferred:(id)a11 dailyExecutionLatency:(id)a12 crossExecutionDelay:(id)a13 executionCompletionTime:(id)a14 executionFailureTime:(id)a15 executionDeferralTime:(id)a16
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id obj = a6;
  id v50 = a6;
  id v47 = a7;
  id v49 = a7;
  id v24 = a8;
  id v25 = a9;
  id v53 = a10;
  char v26 = v23;
  id v52 = a11;
  uint64_t v27 = v22;
  id v51 = a12;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  v54.receiver = self;
  v54.super_class = (Class)BMLighthouseTaskTelemetry;
  uint64_t v32 = [(BMEventBase *)&v54 init];
  if (v32)
  {
    v32->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v21)
    {
      v32->_hasVersion = 1;
      int v33 = [v21 intValue];
    }
    else
    {
      v32->_hasVersion = 0;
      int v33 = -1;
    }
    v32->_version = v33;
    if (v27)
    {
      v32->_hasRaw_bucketStart = 1;
      [v27 timeIntervalSince1970];
    }
    else
    {
      v32->_hasRaw_bucketStart = 0;
      double v34 = -1.0;
    }
    v32->_raw_bucketStart = v34;
    if (v26)
    {
      v32->_hasRaw_bucketEnd = 1;
      [v26 timeIntervalSince1970];
    }
    else
    {
      v32->_hasRaw_bucketEnd = 0;
      double v35 = -1.0;
    }
    v32->_raw_bucketEnd = v35;
    objc_storeStrong((id *)&v32->_taskName, obj);
    objc_storeStrong((id *)&v32->_taskState, v47);
    if (v24)
    {
      v32->_hasRaw_latestEventTimestamp = 1;
      [v24 timeIntervalSince1970];
    }
    else
    {
      v32->_hasRaw_latestEventTimestamp = 0;
      double v36 = -1.0;
    }
    v32->_raw_latestEventTimestamp = v36;
    if (v25)
    {
      v32->_hasCountCompleted = 1;
      int v37 = [v25 intValue];
    }
    else
    {
      v32->_hasCountCompleted = 0;
      int v37 = -1;
    }
    v32->_countCompleted = v37;
    if (v53)
    {
      v32->_hasCountFailed = 1;
      int v38 = [v53 intValue];
    }
    else
    {
      v32->_hasCountFailed = 0;
      int v38 = -1;
    }
    v32->_countFailed = v38;
    if (v52)
    {
      v32->_hasCountDeferred = 1;
      int v39 = [v52 intValue];
    }
    else
    {
      v32->_hasCountDeferred = 0;
      int v39 = -1;
    }
    v32->_countDeferred = v39;
    if (v51)
    {
      v32->_hasDailyExecutionLatency = 1;
      [v51 doubleValue];
    }
    else
    {
      v32->_hasDailyExecutionLatency = 0;
      double v40 = -1.0;
    }
    v32->_dailyExecutionLatency = v40;
    if (v28)
    {
      v32->_hasCrossExecutionDelay = 1;
      [v28 doubleValue];
    }
    else
    {
      v32->_hasCrossExecutionDelay = 0;
      double v41 = -1.0;
    }
    v32->_crossExecutionDelay = v41;
    if (v29)
    {
      v32->_hasExecutionCompletionTime = 1;
      [v29 doubleValue];
    }
    else
    {
      v32->_hasExecutionCompletionTime = 0;
      double v42 = -1.0;
    }
    v32->_executionCompletionTime = v42;
    if (v30)
    {
      v32->_hasExecutionFailureTime = 1;
      [v30 doubleValue];
    }
    else
    {
      v32->_hasExecutionFailureTime = 0;
      double v43 = -1.0;
    }
    v32->_executionFailureTime = v43;
    if (v31)
    {
      v32->_hasExecutionDeferralTime = 1;
      [v31 doubleValue];
    }
    else
    {
      v32->_hasExecutionDeferralTime = 0;
      double v44 = -1.0;
    }
    v32->_executionDeferralTime = v44;
  }

  return v32;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"version" number:1 type:2 subMessageClass:0];
  v18[0] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bucketStart" number:2 type:0 subMessageClass:0];
  v18[1] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bucketEnd" number:3 type:0 subMessageClass:0];
  v18[2] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskName" number:4 type:13 subMessageClass:0];
  v18[3] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskState" number:5 type:13 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"latestEventTimestamp" number:6 type:0 subMessageClass:0];
  v18[5] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countCompleted" number:7 type:2 subMessageClass:0];
  v18[6] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countFailed" number:8 type:2 subMessageClass:0];
  v18[7] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countDeferred" number:9 type:2 subMessageClass:0];
  v18[8] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dailyExecutionLatency" number:10 type:0 subMessageClass:0];
  v18[9] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"crossExecutionDelay" number:11 type:0 subMessageClass:0];
  v18[10] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"executionCompletionTime" number:12 type:0 subMessageClass:0];
  v18[11] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"executionFailureTime" number:13 type:0 subMessageClass:0];
  v18[12] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"executionDeferralTime" number:14 type:0 subMessageClass:0];
  v18[13] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3F90;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"version" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bucketStart" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bucketEnd" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskName" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskState" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"latestEventTimestamp" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countCompleted" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countFailed" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countDeferred" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:2 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dailyExecutionLatency" dataType:1 requestOnly:0 fieldNumber:10 protoDataType:0 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"crossExecutionDelay" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:0 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"executionCompletionTime" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:0 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"executionFailureTime" dataType:1 requestOnly:0 fieldNumber:13 protoDataType:0 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"executionDeferralTime" dataType:1 requestOnly:0 fieldNumber:14 protoDataType:0 convertedType:0];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMLighthouseTaskTelemetry alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[19] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end