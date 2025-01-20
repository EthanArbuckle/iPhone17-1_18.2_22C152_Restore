@interface BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments)initWithSegmentType:(id)a3 segmentDataAvailabilityState:(id)a4 daysWithTwoValidAssistantTurnsPerWeek:(id)a5 daysWithTwoAssistantSpeechRequestsPerWeek:(id)a6;
- (BOOL)hasDaysWithTwoAssistantSpeechRequestsPerWeek;
- (BOOL)hasDaysWithTwoValidAssistantTurnsPerWeek;
- (BOOL)hasSegmentDataAvailabilityState;
- (BOOL)hasSegmentType;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)daysWithTwoAssistantSpeechRequestsPerWeek;
- (int)daysWithTwoValidAssistantTurnsPerWeek;
- (int)segmentDataAvailabilityState;
- (int)segmentType;
- (unsigned)dataVersion;
- (void)setHasDaysWithTwoAssistantSpeechRequestsPerWeek:(BOOL)a3;
- (void)setHasDaysWithTwoValidAssistantTurnsPerWeek:(BOOL)a3;
- (void)setHasSegmentDataAvailabilityState:(BOOL)a3;
- (void)setHasSegmentType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments

- (void)setHasDaysWithTwoAssistantSpeechRequestsPerWeek:(BOOL)a3
{
  self->_hasDaysWithTwoAssistantSpeechRequestsPerWeek = a3;
}

- (BOOL)hasDaysWithTwoAssistantSpeechRequestsPerWeek
{
  return self->_hasDaysWithTwoAssistantSpeechRequestsPerWeek;
}

- (int)daysWithTwoAssistantSpeechRequestsPerWeek
{
  return self->_daysWithTwoAssistantSpeechRequestsPerWeek;
}

- (void)setHasDaysWithTwoValidAssistantTurnsPerWeek:(BOOL)a3
{
  self->_hasDaysWithTwoValidAssistantTurnsPerWeek = a3;
}

- (BOOL)hasDaysWithTwoValidAssistantTurnsPerWeek
{
  return self->_hasDaysWithTwoValidAssistantTurnsPerWeek;
}

- (int)daysWithTwoValidAssistantTurnsPerWeek
{
  return self->_daysWithTwoValidAssistantTurnsPerWeek;
}

- (void)setHasSegmentDataAvailabilityState:(BOOL)a3
{
  self->_hasSegmentDataAvailabilityState = a3;
}

- (BOOL)hasSegmentDataAvailabilityState
{
  return self->_hasSegmentDataAvailabilityState;
}

- (int)segmentDataAvailabilityState
{
  return self->_segmentDataAvailabilityState;
}

- (void)setHasSegmentType:(BOOL)a3
{
  self->_hasSegmentType = a3;
}

- (BOOL)hasSegmentType
{
  return self->_hasSegmentType;
}

- (int)segmentType
{
  return self->_segmentType;
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
    if ([(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasSegmentType]
      || [v5 hasSegmentType])
    {
      if (![(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasSegmentType]) {
        goto LABEL_23;
      }
      if (![v5 hasSegmentType]) {
        goto LABEL_23;
      }
      int v6 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self segmentType];
      if (v6 != [v5 segmentType]) {
        goto LABEL_23;
      }
    }
    if (-[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments hasSegmentDataAvailabilityState](self, "hasSegmentDataAvailabilityState")|| [v5 hasSegmentDataAvailabilityState])
    {
      if (![(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasSegmentDataAvailabilityState])goto LABEL_23; {
      if (![v5 hasSegmentDataAvailabilityState])
      }
        goto LABEL_23;
      int v7 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self segmentDataAvailabilityState];
      if (v7 != [v5 segmentDataAvailabilityState]) {
        goto LABEL_23;
      }
    }
    if (-[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments hasDaysWithTwoValidAssistantTurnsPerWeek](self, "hasDaysWithTwoValidAssistantTurnsPerWeek")|| [v5 hasDaysWithTwoValidAssistantTurnsPerWeek])
    {
      if (![(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasDaysWithTwoValidAssistantTurnsPerWeek])goto LABEL_23; {
      if (![v5 hasDaysWithTwoValidAssistantTurnsPerWeek])
      }
        goto LABEL_23;
      int v8 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self daysWithTwoValidAssistantTurnsPerWeek];
      if (v8 != [v5 daysWithTwoValidAssistantTurnsPerWeek]) {
        goto LABEL_23;
      }
    }
    if (!-[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments hasDaysWithTwoAssistantSpeechRequestsPerWeek](self, "hasDaysWithTwoAssistantSpeechRequestsPerWeek")&& ![v5 hasDaysWithTwoAssistantSpeechRequestsPerWeek])
    {
      BOOL v10 = 1;
      goto LABEL_24;
    }
    if (-[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments hasDaysWithTwoAssistantSpeechRequestsPerWeek](self, "hasDaysWithTwoAssistantSpeechRequestsPerWeek")&& [v5 hasDaysWithTwoAssistantSpeechRequestsPerWeek])
    {
      int v9 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self daysWithTwoAssistantSpeechRequestsPerWeek];
      BOOL v10 = v9 == [v5 daysWithTwoAssistantSpeechRequestsPerWeek];
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
  if ([(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasSegmentType])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments segmentType](self, "segmentType"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasSegmentDataAvailabilityState])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments segmentDataAvailabilityState](self, "segmentDataAvailabilityState"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasDaysWithTwoValidAssistantTurnsPerWeek])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments daysWithTwoValidAssistantTurnsPerWeek](self, "daysWithTwoValidAssistantTurnsPerWeek"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self hasDaysWithTwoAssistantSpeechRequestsPerWeek])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments daysWithTwoAssistantSpeechRequestsPerWeek](self, "daysWithTwoAssistantSpeechRequestsPerWeek"));
  }
  else
  {
    int v6 = 0;
  }
  v13[0] = @"segmentType";
  int v7 = v3;
  if (!v3)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"segmentDataAvailabilityState";
  int v8 = v4;
  if (!v4)
  {
    int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"daysWithTwoValidAssistantTurnsPerWeek";
  int v9 = v5;
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"daysWithTwoAssistantSpeechRequestsPerWeek";
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

- (BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"segmentType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    int v9 = [v6 objectForKeyedSubscript:@"segmentDataAvailabilityState"];
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
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"segmentDataAvailabilityState"];
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
    BOOL v10 = [v6 objectForKeyedSubscript:@"daysWithTwoValidAssistantTurnsPerWeek"];
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
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"daysWithTwoValidAssistantTurnsPerWeek"];
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
    v13 = [v6 objectForKeyedSubscript:@"daysWithTwoAssistantSpeechRequestsPerWeek"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)v11 initWithSegmentType:v8 segmentDataAvailabilityState:v31 daysWithTwoValidAssistantTurnsPerWeek:v12 daysWithTwoAssistantSpeechRequestsPerWeek:v14];
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      int v7 = v32;
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
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"daysWithTwoAssistantSpeechRequestsPerWeek"];
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
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"segmentType"];
  v40[0] = v18;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
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
  [(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasSegmentType)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSegmentDataAvailabilityState)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasDaysWithTwoValidAssistantTurnsPerWeek)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasDaysWithTwoAssistantSpeechRequestsPerWeek)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_66;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    int v9 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasSegmentType = 1;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__segmentType;
              goto LABEL_54;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v19 += 7;
            BOOL v25 = v20++ > 8;
            if (v25)
            {
              LODWORD(v21) = 0;
              v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__segmentType;
              goto LABEL_57;
            }
          }
          v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__segmentType;
          goto LABEL_55;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v21 = 0;
          v5->_hasSegmentDataAvailabilityState = 1;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__segmentDataAvailabilityState;
              goto LABEL_54;
            }
            char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 1;
            v21 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v25 = v28++ > 8;
              if (v25)
              {
                LODWORD(v21) = 0;
                v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__segmentDataAvailabilityState;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__segmentDataAvailabilityState;
          goto LABEL_55;
        case 3u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v21 = 0;
          v5->_hasDaysWithTwoValidAssistantTurnsPerWeek = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__daysWithTwoValidAssistantTurnsPerWeek;
              goto LABEL_54;
            }
            char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 1;
            v21 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v25 = v33++ > 8;
              if (v25)
              {
                LODWORD(v21) = 0;
                v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__daysWithTwoValidAssistantTurnsPerWeek;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__daysWithTwoValidAssistantTurnsPerWeek;
          goto LABEL_55;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v21 = 0;
          v5->_hasDaysWithTwoAssistantSpeechRequestsPerWeek = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_65;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v6;
        unint64_t v40 = *(void *)&v4[v39];
        if (v40 == -1 || v40 >= *(void *)&v4[*v7]) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
        *(void *)&v4[v39] = v40 + 1;
        v21 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0)
        {
          v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__daysWithTwoAssistantSpeechRequestsPerWeek;
          goto LABEL_55;
        }
        v37 += 7;
        BOOL v25 = v38++ > 8;
        if (v25)
        {
          LODWORD(v21) = 0;
          v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__daysWithTwoAssistantSpeechRequestsPerWeek;
          goto LABEL_57;
        }
      }
      v26 = &OBJC_IVAR___BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments__daysWithTwoAssistantSpeechRequestsPerWeek;
LABEL_54:
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_57:
      *(_DWORD *)((char *)&v5->super.super.isa + *v26) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_65:
  }
    v42 = 0;
  else {
LABEL_66:
  }
    v42 = v5;

  return v42;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments segmentType](self, "segmentType"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments segmentDataAvailabilityState](self, "segmentDataAvailabilityState"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments daysWithTwoValidAssistantTurnsPerWeek](self, "daysWithTwoValidAssistantTurnsPerWeek"));
  int v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments daysWithTwoAssistantSpeechRequestsPerWeek](self, "daysWithTwoAssistantSpeechRequestsPerWeek"));
  id v8 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments with segmentType: %@, segmentDataAvailabilityState: %@, daysWithTwoValidAssistantTurnsPerWeek: %@, daysWithTwoAssistantSpeechRequestsPerWeek: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments)initWithSegmentType:(id)a3 segmentDataAvailabilityState:(id)a4 daysWithTwoValidAssistantTurnsPerWeek:(id)a5 daysWithTwoAssistantSpeechRequestsPerWeek:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments;
  unint64_t v14 = [(BMEventBase *)&v20 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasSegmentType = 1;
      int v15 = [v10 intValue];
    }
    else
    {
      v14->_hasSegmentType = 0;
      int v15 = -1;
    }
    v14->_segmentType = v15;
    if (v11)
    {
      v14->_hasSegmentDataAvailabilityState = 1;
      int v16 = [v11 intValue];
    }
    else
    {
      v14->_hasSegmentDataAvailabilityState = 0;
      int v16 = -1;
    }
    v14->_segmentDataAvailabilityState = v16;
    if (v12)
    {
      v14->_hasDaysWithTwoValidAssistantTurnsPerWeek = 1;
      int v17 = [v12 intValue];
    }
    else
    {
      v14->_hasDaysWithTwoValidAssistantTurnsPerWeek = 0;
      int v17 = -1;
    }
    v14->_daysWithTwoValidAssistantTurnsPerWeek = v17;
    if (v13)
    {
      v14->_hasDaysWithTwoAssistantSpeechRequestsPerWeek = 1;
      int v18 = [v13 intValue];
    }
    else
    {
      v14->_hasDaysWithTwoAssistantSpeechRequestsPerWeek = 0;
      int v18 = -1;
    }
    v14->_daysWithTwoAssistantSpeechRequestsPerWeek = v18;
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"segmentType" number:1 type:2 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"segmentDataAvailabilityState" number:2 type:2 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"daysWithTwoValidAssistantTurnsPerWeek" number:3 type:2 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"daysWithTwoAssistantSpeechRequestsPerWeek" number:4 type:2 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4C20;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"segmentType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"segmentDataAvailabilityState" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"daysWithTwoValidAssistantTurnsPerWeek" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"daysWithTwoAssistantSpeechRequestsPerWeek" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments alloc] initByReadFrom:v7];
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