@interface BMPostSiriEngagementEventSignalDeltaEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPostSiriEngagementEventSignalDeltaEvent)initWithDuration:(double)a3 sinceUIEnd:(double)a4 sinceUIStart:(double)a5;
- (BOOL)hasDuration;
- (BOOL)hasSinceUIEnd;
- (BOOL)hasSinceUIStart;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)duration;
- (double)sinceUIEnd;
- (double)sinceUIStart;
- (id)initByReadFrom:(id)a3;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasSinceUIEnd:(BOOL)a3;
- (void)setHasSinceUIStart:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPostSiriEngagementEventSignalDeltaEvent

- (BMPostSiriEngagementEventSignalDeltaEvent)initWithDuration:(double)a3 sinceUIEnd:(double)a4 sinceUIStart:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)BMPostSiriEngagementEventSignalDeltaEvent;
  result = [(BMEventBase *)&v9 init];
  if (result)
  {
    result->_hasDuration = 1;
    result->_duration = a3;
    result->_hasSinceUIEnd = 1;
    result->_sinceUIEnd = a4;
    result->_hasSinceUIStart = 1;
    result->_sinceUIStart = a5;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = NSNumber;
  [(BMPostSiriEngagementEventSignalDeltaEvent *)self duration];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = NSNumber;
  [(BMPostSiriEngagementEventSignalDeltaEvent *)self sinceUIEnd];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v8 = NSNumber;
  [(BMPostSiriEngagementEventSignalDeltaEvent *)self sinceUIStart];
  objc_super v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)[v3 initWithFormat:@"BMPostSiriEngagementEventSignalDeltaEvent with duration: %@, sinceUIEnd: %@, sinceUIStart: %@", v5, v7, v9];

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMPostSiriEngagementEventSignalDeltaEvent;
  v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_43;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    objc_super v9 = (int *)MEMORY[0x1E4F940B8];
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
        if (v11++ >= 9)
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasSinceUIStart = 1;
        uint64_t v24 = *v6;
        unint64_t v25 = *(void *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v7])
        {
          v23 = *(objc_class **)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0;
        }
        v28 = &OBJC_IVAR___BMPostSiriEngagementEventSignalDeltaEvent__sinceUIStart;
      }
      else if (v20 == 2)
      {
        v5->_hasSinceUIEnd = 1;
        uint64_t v26 = *v6;
        unint64_t v27 = *(void *)&v4[v26];
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)&v4[*v7])
        {
          v23 = *(objc_class **)(*(void *)&v4[*v9] + v27);
          *(void *)&v4[v26] = v27 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0;
        }
        v28 = &OBJC_IVAR___BMPostSiriEngagementEventSignalDeltaEvent__sinceUIEnd;
      }
      else
      {
        if (v20 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_42;
          }
          continue;
        }
        v5->_hasDuration = 1;
        uint64_t v21 = *v6;
        unint64_t v22 = *(void *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v7])
        {
          v23 = *(objc_class **)(*(void *)&v4[*v9] + v22);
          *(void *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0;
        }
        v28 = &OBJC_IVAR___BMPostSiriEngagementEventSignalDeltaEvent__duration;
      }
      *(Class *)((char *)&v5->super.super.isa + *v28) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_42:
  }
    v29 = 0;
  else {
LABEL_43:
  }
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasDuration)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasSinceUIEnd)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasSinceUIStart)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (unsigned)dataVersion
{
  return 0;
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v4 = [[BMPostSiriEngagementEventSignalDeltaEvent alloc] initByReadFrom:v7];
  }

  return v4;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMPostSiriEngagementEventSignalDeltaEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMPostSiriEngagementEventSignalDeltaEvent *)self hasDuration]
      || [v5 hasDuration])
    {
      if ([(BMPostSiriEngagementEventSignalDeltaEvent *)self hasDuration]
        && [v5 hasDuration])
      {
        [(BMPostSiriEngagementEventSignalDeltaEvent *)self duration];
        double v7 = v6;
        [v5 duration];
        BOOL v9 = v7 == v8;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
    if ([(BMPostSiriEngagementEventSignalDeltaEvent *)self hasSinceUIEnd]
      || [v5 hasSinceUIEnd])
    {
      if ([(BMPostSiriEngagementEventSignalDeltaEvent *)self hasSinceUIEnd]
        && [v5 hasSinceUIEnd])
      {
        [(BMPostSiriEngagementEventSignalDeltaEvent *)self sinceUIEnd];
        double v12 = v11;
        [v5 sinceUIEnd];
        BOOL v14 = v12 == v13;
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 1;
    }
    if ([(BMPostSiriEngagementEventSignalDeltaEvent *)self hasSinceUIStart]
      || [v5 hasSinceUIStart])
    {
      if ([(BMPostSiriEngagementEventSignalDeltaEvent *)self hasSinceUIStart]
        && [v5 hasSinceUIStart])
      {
        [(BMPostSiriEngagementEventSignalDeltaEvent *)self sinceUIStart];
        double v16 = v15;
        [v5 sinceUIStart];
        BOOL v18 = v16 == v17;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 1;
    }
    BOOL v10 = v9 && v14 && v18;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasSinceUIEnd
{
  return self->_hasSinceUIEnd;
}

- (void)setHasSinceUIEnd:(BOOL)a3
{
  self->_hasSinceUIEnd = a3;
}

- (double)sinceUIEnd
{
  return self->_sinceUIEnd;
}

- (BOOL)hasSinceUIStart
{
  return self->_hasSinceUIStart;
}

- (void)setHasSinceUIStart:(BOOL)a3
{
  self->_hasSinceUIStart = a3;
}

- (double)sinceUIStart
{
  return self->_sinceUIStart;
}

@end