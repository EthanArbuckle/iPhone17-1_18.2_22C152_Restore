@interface BMMomentsEngagementNotificationInfo
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEngagementNotificationInfo)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMMomentsEngagementNotificationInfo)initWithNotificationEventTimestamp:(id)a3 notificationPostingTimestamp:(id)a4 notificationSuggestionCount:(id)a5;
- (BOOL)hasNotificationSuggestionCount;
- (BOOL)isEqual:(id)a3;
- (NSDate)notificationEventTimestamp;
- (NSDate)notificationPostingTimestamp;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)notificationSuggestionCount;
- (unsigned)dataVersion;
- (void)setHasNotificationSuggestionCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEngagementNotificationInfo

- (void)setHasNotificationSuggestionCount:(BOOL)a3
{
  self->_hasNotificationSuggestionCount = a3;
}

- (BOOL)hasNotificationSuggestionCount
{
  return self->_hasNotificationSuggestionCount;
}

- (int)notificationSuggestionCount
{
  return self->_notificationSuggestionCount;
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
    v6 = [(BMMomentsEngagementNotificationInfo *)self notificationEventTimestamp];
    uint64_t v7 = [v5 notificationEventTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEngagementNotificationInfo *)self notificationEventTimestamp];
      v10 = [v5 notificationEventTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_16;
      }
    }
    v13 = [(BMMomentsEngagementNotificationInfo *)self notificationPostingTimestamp];
    uint64_t v14 = [v5 notificationPostingTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMomentsEngagementNotificationInfo *)self notificationPostingTimestamp];
      v17 = [v5 notificationPostingTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_16;
      }
    }
    if (![(BMMomentsEngagementNotificationInfo *)self hasNotificationSuggestionCount]
      && ![v5 hasNotificationSuggestionCount])
    {
      BOOL v12 = 1;
      goto LABEL_17;
    }
    if ([(BMMomentsEngagementNotificationInfo *)self hasNotificationSuggestionCount]
      && [v5 hasNotificationSuggestionCount])
    {
      int v19 = [(BMMomentsEngagementNotificationInfo *)self notificationSuggestionCount];
      BOOL v12 = v19 == [v5 notificationSuggestionCount];
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (NSDate)notificationPostingTimestamp
{
  if (self->_hasRaw_notificationPostingTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_notificationPostingTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)notificationEventTimestamp
{
  if (self->_hasRaw_notificationEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_notificationEventTimestamp];
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
  v18[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMomentsEngagementNotificationInfo *)self notificationEventTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMMomentsEngagementNotificationInfo *)self notificationEventTimestamp];
    [v5 timeIntervalSince1970];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  uint64_t v7 = [(BMMomentsEngagementNotificationInfo *)self notificationPostingTimestamp];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMMomentsEngagementNotificationInfo *)self notificationPostingTimestamp];
    [v9 timeIntervalSince1970];
    v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v10 = 0;
  }

  if ([(BMMomentsEngagementNotificationInfo *)self hasNotificationSuggestionCount])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementNotificationInfo notificationSuggestionCount](self, "notificationSuggestionCount"));
  }
  else
  {
    int v11 = 0;
  }
  v17[0] = @"notificationEventTimestamp";
  BOOL v12 = v6;
  if (!v6)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v12;
  v17[1] = @"notificationPostingTimestamp";
  v13 = v10;
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v13;
  v17[2] = @"notificationSuggestionCount";
  uint64_t v14 = v11;
  if (!v11)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  if (v11)
  {
    if (v10) {
      goto LABEL_18;
    }
LABEL_23:

    if (v6) {
      goto LABEL_19;
    }
    goto LABEL_24;
  }

  if (!v10) {
    goto LABEL_23;
  }
LABEL_18:
  if (v6) {
    goto LABEL_19;
  }
LABEL_24:

LABEL_19:

  return v15;
}

- (BMMomentsEngagementNotificationInfo)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"notificationEventTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    v16 = [v6 objectForKeyedSubscript:@"notificationPostingTimestamp"];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v18 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v19 = v16;
        id v20 = [v18 alloc];
        [v19 doubleValue];
        double v22 = v21;

        id v23 = (id)[v20 initWithTimeIntervalSince1970:v22];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v24 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v17 = [v24 dateFromString:v16];

          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!p_isa)
          {
            v17 = 0;
            goto LABEL_22;
          }
          id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
          v35 = p_isa;
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"notificationPostingTimestamp"];
          id v44 = v26;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          id v37 = (id)[v40 initWithDomain:v36 code:2 userInfo:v25];
          v17 = 0;
          p_isa = 0;
          id *v35 = v37;
          goto LABEL_21;
        }
        id v23 = v16;
      }
      v17 = v23;
    }
    else
    {
      v17 = 0;
    }
LABEL_17:
    v25 = [v6 objectForKeyedSubscript:@"notificationSuggestionCount"];
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (p_isa)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v41 = *MEMORY[0x1E4F28568];
          v39 = p_isa;
          v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"notificationSuggestionCount"];
          v42 = v29;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          id *v39 = (id)[v38 initWithDomain:v28 code:2 userInfo:v30];

          id v26 = 0;
          p_isa = 0;
        }
        else
        {
          id v26 = 0;
        }
        goto LABEL_21;
      }
      id v26 = v25;
    }
    else
    {
      id v26 = 0;
    }
    self = [(BMMomentsEngagementNotificationInfo *)self initWithNotificationEventTimestamp:v8 notificationPostingTimestamp:v17 notificationSuggestionCount:v26];
    p_isa = (id *)&self->super.super.isa;
LABEL_21:

    goto LABEL_22;
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
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    v8 = [v15 dateFromString:v7];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v7;
    goto LABEL_6;
  }
  if (!p_isa)
  {
    v8 = 0;
    goto LABEL_23;
  }
  id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v32 = *MEMORY[0x1E4F502C8];
  uint64_t v45 = *MEMORY[0x1E4F28568];
  v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"notificationEventTimestamp"];
  v46[0] = v17;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  id v33 = (id)[v31 initWithDomain:v32 code:2 userInfo:v16];
  v8 = 0;
  v34 = p_isa;
  p_isa = 0;
  id *v34 = v33;
LABEL_22:

LABEL_23:
  return (BMMomentsEngagementNotificationInfo *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEngagementNotificationInfo *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasRaw_notificationEventTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRaw_notificationPostingTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasNotificationSuggestionCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMMomentsEngagementNotificationInfo;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_49;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        v5->_hasNotificationSuggestionCount = 1;
        while (1)
        {
          uint64_t v27 = *v6;
          uint64_t v28 = *(void *)&v4[v27];
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)&v4[*v7]) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v28);
          *(void *)&v4[v27] = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0) {
            goto LABEL_38;
          }
          v24 += 7;
          BOOL v17 = v25++ >= 9;
          if (v17)
          {
            LODWORD(v26) = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8]) {
          LODWORD(v26) = 0;
        }
LABEL_40:
        v5->_notificationSuggestionCount = v26;
      }
      else
      {
        if (v20 == 2)
        {
          v5->_hasRaw_notificationPostingTimestamp = 1;
          uint64_t v31 = *v6;
          unint64_t v32 = *(void *)&v4[v31];
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)&v4[*v7])
          {
            id v23 = *(objc_class **)(*(void *)&v4[*v9] + v32);
            *(void *)&v4[v31] = v32 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v23 = 0;
          }
          uint64_t v33 = 40;
        }
        else
        {
          if (v20 != 1)
          {
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_48;
            }
            continue;
          }
          v5->_hasRaw_notificationEventTimestamp = 1;
          uint64_t v21 = *v6;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v7])
          {
            id v23 = *(objc_class **)(*(void *)&v4[*v9] + v22);
            *(void *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v23 = 0;
          }
          uint64_t v33 = 24;
        }
        *(Class *)((char *)&v5->super.super.isa + v33) = v23;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_48:
  }
    v34 = 0;
  else {
LABEL_49:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMomentsEngagementNotificationInfo *)self notificationEventTimestamp];
  id v5 = [(BMMomentsEngagementNotificationInfo *)self notificationPostingTimestamp];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementNotificationInfo notificationSuggestionCount](self, "notificationSuggestionCount"));
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMMomentsEngagementNotificationInfo with notificationEventTimestamp: %@, notificationPostingTimestamp: %@, notificationSuggestionCount: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMomentsEngagementNotificationInfo)initWithNotificationEventTimestamp:(id)a3 notificationPostingTimestamp:(id)a4 notificationSuggestionCount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMMomentsEngagementNotificationInfo;
  unsigned int v11 = [(BMEventBase *)&v16 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasRaw_notificationEventTimestamp = 1;
      [v8 timeIntervalSince1970];
    }
    else
    {
      v11->_hasRaw_notificationEventTimestamp = 0;
      double v12 = -1.0;
    }
    v11->_raw_notificationEventTimestamp = v12;
    if (v9)
    {
      v11->_hasRaw_notificationPostingTimestamp = 1;
      [v9 timeIntervalSince1970];
    }
    else
    {
      v11->_hasRaw_notificationPostingTimestamp = 0;
      double v13 = -1.0;
    }
    v11->_raw_notificationPostingTimestamp = v13;
    if (v10)
    {
      v11->_hasNotificationSuggestionCount = 1;
      int v14 = [v10 intValue];
    }
    else
    {
      v11->_hasNotificationSuggestionCount = 0;
      int v14 = -1;
    }
    v11->_notificationSuggestionCount = v14;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"notificationEventTimestamp" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"notificationPostingTimestamp", 2, 0, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"notificationSuggestionCount" number:3 type:2 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF58E0;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"notificationEventTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"notificationPostingTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"notificationSuggestionCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMomentsEngagementNotificationInfo alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[13] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end