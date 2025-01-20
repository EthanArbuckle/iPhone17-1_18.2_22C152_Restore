@interface BMSiriTaskAggregationStatistics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriTaskAggregationStatistics)initWithCompletedSystemTasks:(id)a3 failedSystemTasks:(id)a4 cancelledSystemTasks:(id)a5 tasksPerformedWithUI:(id)a6;
- (BMSiriTaskAggregationStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasCancelledSystemTasks;
- (BOOL)hasCompletedSystemTasks;
- (BOOL)hasFailedSystemTasks;
- (BOOL)hasTasksPerformedWithUI;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)cancelledSystemTasks;
- (unsigned)completedSystemTasks;
- (unsigned)dataVersion;
- (unsigned)failedSystemTasks;
- (unsigned)tasksPerformedWithUI;
- (void)setHasCancelledSystemTasks:(BOOL)a3;
- (void)setHasCompletedSystemTasks:(BOOL)a3;
- (void)setHasFailedSystemTasks:(BOOL)a3;
- (void)setHasTasksPerformedWithUI:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriTaskAggregationStatistics

- (void)setHasTasksPerformedWithUI:(BOOL)a3
{
  self->_hasTasksPerformedWithUI = a3;
}

- (BOOL)hasTasksPerformedWithUI
{
  return self->_hasTasksPerformedWithUI;
}

- (unsigned)tasksPerformedWithUI
{
  return self->_tasksPerformedWithUI;
}

- (void)setHasCancelledSystemTasks:(BOOL)a3
{
  self->_hasCancelledSystemTasks = a3;
}

- (BOOL)hasCancelledSystemTasks
{
  return self->_hasCancelledSystemTasks;
}

- (unsigned)cancelledSystemTasks
{
  return self->_cancelledSystemTasks;
}

- (void)setHasFailedSystemTasks:(BOOL)a3
{
  self->_hasFailedSystemTasks = a3;
}

- (BOOL)hasFailedSystemTasks
{
  return self->_hasFailedSystemTasks;
}

- (unsigned)failedSystemTasks
{
  return self->_failedSystemTasks;
}

- (void)setHasCompletedSystemTasks:(BOOL)a3
{
  self->_hasCompletedSystemTasks = a3;
}

- (BOOL)hasCompletedSystemTasks
{
  return self->_hasCompletedSystemTasks;
}

- (unsigned)completedSystemTasks
{
  return self->_completedSystemTasks;
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
    if ([(BMSiriTaskAggregationStatistics *)self hasCompletedSystemTasks]
      || [v5 hasCompletedSystemTasks])
    {
      if (![(BMSiriTaskAggregationStatistics *)self hasCompletedSystemTasks]) {
        goto LABEL_23;
      }
      if (![v5 hasCompletedSystemTasks]) {
        goto LABEL_23;
      }
      unsigned int v6 = [(BMSiriTaskAggregationStatistics *)self completedSystemTasks];
      if (v6 != [v5 completedSystemTasks]) {
        goto LABEL_23;
      }
    }
    if ([(BMSiriTaskAggregationStatistics *)self hasFailedSystemTasks]
      || [v5 hasFailedSystemTasks])
    {
      if (![(BMSiriTaskAggregationStatistics *)self hasFailedSystemTasks]) {
        goto LABEL_23;
      }
      if (![v5 hasFailedSystemTasks]) {
        goto LABEL_23;
      }
      unsigned int v7 = [(BMSiriTaskAggregationStatistics *)self failedSystemTasks];
      if (v7 != [v5 failedSystemTasks]) {
        goto LABEL_23;
      }
    }
    if ([(BMSiriTaskAggregationStatistics *)self hasCancelledSystemTasks]
      || [v5 hasCancelledSystemTasks])
    {
      if (![(BMSiriTaskAggregationStatistics *)self hasCancelledSystemTasks]) {
        goto LABEL_23;
      }
      if (![v5 hasCancelledSystemTasks]) {
        goto LABEL_23;
      }
      unsigned int v8 = [(BMSiriTaskAggregationStatistics *)self cancelledSystemTasks];
      if (v8 != [v5 cancelledSystemTasks]) {
        goto LABEL_23;
      }
    }
    if (![(BMSiriTaskAggregationStatistics *)self hasTasksPerformedWithUI]
      && ![v5 hasTasksPerformedWithUI])
    {
      BOOL v10 = 1;
      goto LABEL_24;
    }
    if ([(BMSiriTaskAggregationStatistics *)self hasTasksPerformedWithUI]
      && [v5 hasTasksPerformedWithUI])
    {
      unsigned int v9 = [(BMSiriTaskAggregationStatistics *)self tasksPerformedWithUI];
      BOOL v10 = v9 == [v5 tasksPerformedWithUI];
    }
    else
    {
LABEL_23:
      BOOL v10 = 0;
    }
LABEL_24:

    goto LABEL_25;
  }
  BOOL v10 = 0;
LABEL_25:

  return v10;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriTaskAggregationStatistics *)self hasCompletedSystemTasks])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics completedSystemTasks](self, "completedSystemTasks"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSiriTaskAggregationStatistics *)self hasFailedSystemTasks])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics failedSystemTasks](self, "failedSystemTasks"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMSiriTaskAggregationStatistics *)self hasCancelledSystemTasks])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics cancelledSystemTasks](self, "cancelledSystemTasks"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriTaskAggregationStatistics *)self hasTasksPerformedWithUI])
  {
    unsigned int v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics tasksPerformedWithUI](self, "tasksPerformedWithUI"));
  }
  else
  {
    unsigned int v6 = 0;
  }
  v13[0] = @"completedSystemTasks";
  unsigned int v7 = v3;
  if (!v3)
  {
    unsigned int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"failedSystemTasks";
  unsigned int v8 = v4;
  if (!v4)
  {
    unsigned int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"cancelledSystemTasks";
  unsigned int v9 = v5;
  if (!v5)
  {
    unsigned int v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"tasksPerformedWithUI";
  BOOL v10 = v6;
  if (!v6)
  {
    BOOL v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_23;
    }
  }
  else
  {

    if (v5)
    {
LABEL_23:
      if (v4) {
        goto LABEL_24;
      }
LABEL_30:

      if (v3) {
        goto LABEL_25;
      }
      goto LABEL_31;
    }
  }

  if (!v4) {
    goto LABEL_30;
  }
LABEL_24:
  if (v3) {
    goto LABEL_25;
  }
LABEL_31:

LABEL_25:

  return v11;
}

- (BMSiriTaskAggregationStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"completedSystemTasks"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    unsigned int v9 = [v6 objectForKeyedSubscript:@"failedSystemTasks"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"failedSystemTasks"];
        id v38 = v12;
        BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        v15 = 0;
        a4 = 0;
        id *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    BOOL v10 = [v6 objectForKeyedSubscript:@"cancelledSystemTasks"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cancelledSystemTasks"];
        id v36 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      id v12 = v10;
    }
    else
    {
      v11 = self;
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"tasksPerformedWithUI"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = [(BMSiriTaskAggregationStatistics *)v11 initWithCompletedSystemTasks:v8 failedSystemTasks:v31 cancelledSystemTasks:v12 tasksPerformedWithUI:v14];
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      unsigned int v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tasksPerformedWithUI"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"completedSystemTasks"];
  v40[0] = v18;
  unsigned int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v15 = 0;
  id v8 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriTaskAggregationStatistics *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasCompletedSystemTasks)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasFailedSystemTasks)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCancelledSystemTasks)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasTasksPerformedWithUI)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMSiriTaskAggregationStatistics;
  id v5 = [(BMEventBase *)&v49 init];
  if (!v5) {
    goto LABEL_66;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasCompletedSystemTasks = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7])
            {
              uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__completedSystemTasks;
              goto LABEL_54;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              break;
            }
            v20 += 7;
            BOOL v27 = v21++ > 8;
            if (v27)
            {
              LODWORD(v22) = 0;
              uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__completedSystemTasks;
              goto LABEL_57;
            }
          }
          uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__completedSystemTasks;
          goto LABEL_55;
        case 2u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v22 = 0;
          v5->_hasFailedSystemTasks = 1;
          while (2)
          {
            uint64_t v31 = *v6;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v7])
            {
              uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__failedSystemTasks;
              goto LABEL_54;
            }
            char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
            *(void *)&v4[v31] = v33;
            v22 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v27 = v30++ > 8;
              if (v27)
              {
                LODWORD(v22) = 0;
                uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__failedSystemTasks;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__failedSystemTasks;
          goto LABEL_55;
        case 3u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v22 = 0;
          v5->_hasCancelledSystemTasks = 1;
          while (2)
          {
            uint64_t v37 = *v6;
            uint64_t v38 = *(void *)&v4[v37];
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)&v4[*v7])
            {
              uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__cancelledSystemTasks;
              goto LABEL_54;
            }
            char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
            *(void *)&v4[v37] = v39;
            v22 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              BOOL v27 = v36++ > 8;
              if (v27)
              {
                LODWORD(v22) = 0;
                uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__cancelledSystemTasks;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__cancelledSystemTasks;
          goto LABEL_55;
        case 4u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v22 = 0;
          v5->_hasTasksPerformedWithUI = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_65;
          }
          continue;
      }
      while (1)
      {
        uint64_t v43 = *v6;
        uint64_t v44 = *(void *)&v4[v43];
        unint64_t v45 = v44 + 1;
        if (v44 == -1 || v45 > *(void *)&v4[*v7]) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)&v4[*v9] + v44);
        *(void *)&v4[v43] = v45;
        v22 |= (unint64_t)(v46 & 0x7F) << v41;
        if ((v46 & 0x80) == 0)
        {
          uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__tasksPerformedWithUI;
          goto LABEL_55;
        }
        v41 += 7;
        BOOL v27 = v42++ > 8;
        if (v27)
        {
          LODWORD(v22) = 0;
          uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__tasksPerformedWithUI;
          goto LABEL_57;
        }
      }
      uint64_t v28 = &OBJC_IVAR___BMSiriTaskAggregationStatistics__tasksPerformedWithUI;
LABEL_54:
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_57:
      *(_DWORD *)((char *)&v5->super.super.isa + *v28) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_65:
  }
    v47 = 0;
  else {
LABEL_66:
  }
    v47 = v5;

  return v47;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics completedSystemTasks](self, "completedSystemTasks"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics failedSystemTasks](self, "failedSystemTasks"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics cancelledSystemTasks](self, "cancelledSystemTasks"));
  unsigned int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriTaskAggregationStatistics tasksPerformedWithUI](self, "tasksPerformedWithUI"));
  id v8 = (void *)[v3 initWithFormat:@"BMSiriTaskAggregationStatistics with completedSystemTasks: %@, failedSystemTasks: %@, cancelledSystemTasks: %@, tasksPerformedWithUI: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSiriTaskAggregationStatistics)initWithCompletedSystemTasks:(id)a3 failedSystemTasks:(id)a4 cancelledSystemTasks:(id)a5 tasksPerformedWithUI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriTaskAggregationStatistics;
  uint64_t v14 = [(BMEventBase *)&v20 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasCompletedSystemTasks = 1;
      unsigned int v15 = [v10 unsignedIntValue];
    }
    else
    {
      unsigned int v15 = 0;
      v14->_hasCompletedSystemTasks = 0;
    }
    v14->_completedSystemTasks = v15;
    if (v11)
    {
      v14->_hasFailedSystemTasks = 1;
      unsigned int v16 = [v11 unsignedIntValue];
    }
    else
    {
      unsigned int v16 = 0;
      v14->_hasFailedSystemTasks = 0;
    }
    v14->_failedSystemTasks = v16;
    if (v12)
    {
      v14->_hasCancelledSystemTasks = 1;
      unsigned int v17 = [v12 unsignedIntValue];
    }
    else
    {
      unsigned int v17 = 0;
      v14->_hasCancelledSystemTasks = 0;
    }
    v14->_cancelledSystemTasks = v17;
    if (v13)
    {
      v14->_hasTasksPerformedWithUI = 1;
      unsigned int v18 = [v13 unsignedIntValue];
    }
    else
    {
      unsigned int v18 = 0;
      v14->_hasTasksPerformedWithUI = 0;
    }
    v14->_tasksPerformedWithUI = v18;
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"completedSystemTasks" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"failedSystemTasks" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cancelledSystemTasks" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tasksPerformedWithUI" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6A98;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"completedSystemTasks" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"failedSystemTasks" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cancelledSystemTasks" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tasksPerformedWithUI" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
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
    unsigned int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriTaskAggregationStatistics alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end