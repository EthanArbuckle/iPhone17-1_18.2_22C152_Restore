@interface BMSiriAssistantSuggestionFeaturesEngagementLabels
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithWasSpoken:(id)a3 wasTapped:(id)a4 dwellTime:(id)a5;
- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithWasSpoken:(id)a3 wasTapped:(id)a4 dwellTime:(id)a5 otherSuggestionTapped:(id)a6 otherSuggestionSpoken:(id)a7 position:(id)a8;
- (BOOL)hasDwellTime;
- (BOOL)hasOtherSuggestionSpoken;
- (BOOL)hasOtherSuggestionTapped;
- (BOOL)hasPosition;
- (BOOL)hasWasSpoken;
- (BOOL)hasWasTapped;
- (BOOL)isEqual:(id)a3;
- (BOOL)otherSuggestionSpoken;
- (BOOL)otherSuggestionTapped;
- (BOOL)wasSpoken;
- (BOOL)wasTapped;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)position;
- (int64_t)dwellTime;
- (unsigned)dataVersion;
- (void)setHasDwellTime:(BOOL)a3;
- (void)setHasOtherSuggestionSpoken:(BOOL)a3;
- (void)setHasOtherSuggestionTapped:(BOOL)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasWasSpoken:(BOOL)a3;
- (void)setHasWasTapped:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesEngagementLabels

- (void)setHasPosition:(BOOL)a3
{
  self->_hasPosition = a3;
}

- (BOOL)hasPosition
{
  return self->_hasPosition;
}

- (int)position
{
  return self->_position;
}

- (void)setHasOtherSuggestionSpoken:(BOOL)a3
{
  self->_hasOtherSuggestionSpoken = a3;
}

- (BOOL)hasOtherSuggestionSpoken
{
  return self->_hasOtherSuggestionSpoken;
}

- (BOOL)otherSuggestionSpoken
{
  return self->_otherSuggestionSpoken;
}

- (void)setHasOtherSuggestionTapped:(BOOL)a3
{
  self->_hasOtherSuggestionTapped = a3;
}

- (BOOL)hasOtherSuggestionTapped
{
  return self->_hasOtherSuggestionTapped;
}

- (BOOL)otherSuggestionTapped
{
  return self->_otherSuggestionTapped;
}

- (void)setHasDwellTime:(BOOL)a3
{
  self->_hasDwellTime = a3;
}

- (BOOL)hasDwellTime
{
  return self->_hasDwellTime;
}

- (int64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setHasWasTapped:(BOOL)a3
{
  self->_hasWasTapped = a3;
}

- (BOOL)hasWasTapped
{
  return self->_hasWasTapped;
}

- (BOOL)wasTapped
{
  return self->_wasTapped;
}

- (void)setHasWasSpoken:(BOOL)a3
{
  self->_hasWasSpoken = a3;
}

- (BOOL)hasWasSpoken
{
  return self->_hasWasSpoken;
}

- (BOOL)wasSpoken
{
  return self->_wasSpoken;
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
    if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasWasSpoken]
      || [v5 hasWasSpoken])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasWasSpoken]) {
        goto LABEL_33;
      }
      if (![v5 hasWasSpoken]) {
        goto LABEL_33;
      }
      int v6 = [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self wasSpoken];
      if (v6 != [v5 wasSpoken]) {
        goto LABEL_33;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasWasTapped]
      || [v5 hasWasTapped])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasWasTapped]) {
        goto LABEL_33;
      }
      if (![v5 hasWasTapped]) {
        goto LABEL_33;
      }
      int v7 = [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self wasTapped];
      if (v7 != [v5 wasTapped]) {
        goto LABEL_33;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasDwellTime]
      || [v5 hasDwellTime])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasDwellTime]) {
        goto LABEL_33;
      }
      if (![v5 hasDwellTime]) {
        goto LABEL_33;
      }
      int64_t v8 = [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self dwellTime];
      if (v8 != [v5 dwellTime]) {
        goto LABEL_33;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasOtherSuggestionTapped]
      || [v5 hasOtherSuggestionTapped])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasOtherSuggestionTapped])goto LABEL_33; {
      if (![v5 hasOtherSuggestionTapped])
      }
        goto LABEL_33;
      int v9 = [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self otherSuggestionTapped];
      if (v9 != [v5 otherSuggestionTapped]) {
        goto LABEL_33;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasOtherSuggestionSpoken]
      || [v5 hasOtherSuggestionSpoken])
    {
      if (![(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasOtherSuggestionSpoken])goto LABEL_33; {
      if (![v5 hasOtherSuggestionSpoken])
      }
        goto LABEL_33;
      int v10 = [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self otherSuggestionSpoken];
      if (v10 != [v5 otherSuggestionSpoken]) {
        goto LABEL_33;
      }
    }
    if (![(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasPosition]
      && ![v5 hasPosition])
    {
      BOOL v12 = 1;
      goto LABEL_34;
    }
    if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasPosition]
      && [v5 hasPosition])
    {
      int v11 = [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self position];
      BOOL v12 = v11 == [v5 position];
    }
    else
    {
LABEL_33:
      BOOL v12 = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  BOOL v12 = 0;
LABEL_35:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasWasSpoken])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasSpoken](self, "wasSpoken"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasWasTapped])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasTapped](self, "wasTapped"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasDwellTime])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels dwellTime](self, "dwellTime"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasOtherSuggestionTapped])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionTapped](self, "otherSuggestionTapped"));
  }
  else
  {
    int v6 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasOtherSuggestionSpoken])
  {
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionSpoken](self, "otherSuggestionSpoken"));
  }
  else
  {
    int v7 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self hasPosition])
  {
    int64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels position](self, "position"));
  }
  else
  {
    int64_t v8 = 0;
  }
  v21[0] = @"wasSpoken";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = @"wasTapped";
  int v10 = (void *)v4;
  if (!v4)
  {
    int v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9);
  }
  v22[1] = v10;
  v21[2] = @"dwellTime";
  int v11 = v5;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"otherSuggestionTapped";
  BOOL v12 = v6;
  if (!v6)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"otherSuggestionSpoken";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"position";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_33;
    }
LABEL_42:

    if (v6) {
      goto LABEL_34;
    }
    goto LABEL_43;
  }

  if (!v7) {
    goto LABEL_42;
  }
LABEL_33:
  if (v6) {
    goto LABEL_34;
  }
LABEL_43:

LABEL_34:
  if (!v5) {

  }
  if (v19)
  {
    if (v20) {
      goto LABEL_38;
    }
  }
  else
  {

    if (v20) {
      goto LABEL_38;
    }
  }

LABEL_38:

  return v15;
}

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"wasSpoken"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"wasTapped"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          uint64_t v17 = 0;
          goto LABEL_50;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v52 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        v24 = v7;
        id v25 = v8;
        id v26 = [NSString alloc];
        uint64_t v49 = objc_opt_class();
        v27 = v26;
        id v8 = v25;
        int v7 = v24;
        v28 = (id *)[v27 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v49, @"wasTapped"];
        v70 = v28;
        int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        uint64_t v29 = v23;
        a4 = v28;
        uint64_t v17 = 0;
        v21 = 0;
        id *v52 = (id)[v22 initWithDomain:v29 code:2 userInfo:v10];
        goto LABEL_49;
      }
      id v59 = v9;
    }
    else
    {
      id v59 = 0;
    }
    int v10 = [v6 objectForKeyedSubscript:@"dwellTime"];
    v60 = self;
    v57 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v17 = 0;
          v21 = v59;
          goto LABEL_49;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v33 = v7;
        id v34 = v8;
        id v35 = [NSString alloc];
        uint64_t v50 = objc_opt_class();
        v36 = v35;
        id v8 = v34;
        int v7 = v33;
        id v58 = (id)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v50, @"dwellTime"];
        id v68 = v58;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        id v37 = (id)[v30 initWithDomain:v32 code:2 userInfo:v11];
        uint64_t v17 = 0;
        a4 = 0;
        id *v31 = v37;
        uint64_t v9 = v57;
        v21 = v59;
LABEL_48:

        self = v60;
LABEL_49:

        goto LABEL_50;
      }
      v56 = v10;
    }
    else
    {
      v56 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"otherSuggestionTapped"];
    v55 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v58 = 0;
          uint64_t v17 = 0;
          v21 = v59;
          a4 = v56;
          goto LABEL_48;
        }
        id v38 = v8;
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"otherSuggestionTapped"];
        id v66 = v14;
        BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v41 = v39;
        id v8 = v38;
        int v7 = v55;
        id v42 = (id)[v41 initWithDomain:v40 code:2 userInfo:v12];
        uint64_t v17 = 0;
        id v58 = 0;
        *a4 = v42;
        goto LABEL_57;
      }
      id v58 = v11;
    }
    else
    {
      id v58 = 0;
    }
    BOOL v12 = [v6 objectForKeyedSubscript:@"otherSuggestionSpoken"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = v8;
      id v14 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      id v14 = v12;
LABEL_16:
      v15 = [v6 objectForKeyedSubscript:@"position"];
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v16 = 0;
LABEL_19:
        a4 = v56;
        uint64_t v17 = [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)v60 initWithWasSpoken:v13 wasTapped:v59 dwellTime:v56 otherSuggestionTapped:v58 otherSuggestionSpoken:v14 position:v16];
        v60 = v17;
LABEL_46:

        id v8 = v13;
        int v7 = v55;
LABEL_47:

        v21 = v59;
        uint64_t v9 = v57;
        goto LABEL_48;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        goto LABEL_19;
      }
      if (a4)
      {
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"position"];
        v62 = v46;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        *a4 = (id)[v54 initWithDomain:v51 code:2 userInfo:v47];
      }
      id v16 = 0;
      uint64_t v17 = 0;
LABEL_45:
      a4 = v56;
      goto LABEL_46;
    }
    if (a4)
    {
      id v13 = v8;
      v53 = a4;
      id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v44 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"otherSuggestionSpoken"];
      id v64 = v16;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v15];
      uint64_t v17 = 0;
      id v14 = 0;
      id *v53 = v45;
      goto LABEL_45;
    }
    id v14 = 0;
    uint64_t v17 = 0;
LABEL_57:
    a4 = v56;
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v17 = 0;
    id v8 = 0;
    goto LABEL_51;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
  v19 = a4;
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"wasSpoken"];
  v72[0] = v21;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
  uint64_t v17 = 0;
  id v8 = 0;
  id *v19 = (id)[v18 initWithDomain:v20 code:2 userInfo:v9];
LABEL_50:

LABEL_51:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasWasSpoken)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasWasTapped)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasDwellTime)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasOtherSuggestionTapped)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasOtherSuggestionSpoken)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasPosition)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)BMSiriAssistantSuggestionFeaturesEngagementLabels;
  id v5 = [(BMEventBase *)&v66 init];
  if (!v5) {
    goto LABEL_92;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasWasSpoken = 1;
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
              goto LABEL_65;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_67;
            }
          }
          v4[*v8] = 1;
LABEL_65:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_67:
          BOOL v62 = v22 != 0;
          uint64_t v63 = 16;
          goto LABEL_84;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasWasTapped = 1;
          while (2)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
              *(void *)&v4[v30] = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  uint64_t v29 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v29 = 0;
          }
LABEL_71:
          BOOL v62 = v29 != 0;
          uint64_t v63 = 18;
          goto LABEL_84;
        case 3u:
          char v34 = 0;
          unsigned int v35 = 0;
          int64_t v36 = 0;
          v5->_hasDwellTime = 1;
          while (2)
          {
            uint64_t v37 = *v6;
            uint64_t v38 = *(void *)&v4[v37];
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
              *(void *)&v4[v37] = v39;
              v36 |= (unint64_t)(v40 & 0x7F) << v34;
              if (v40 < 0)
              {
                v34 += 7;
                BOOL v17 = v35++ >= 9;
                if (v17)
                {
                  int64_t v36 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            int64_t v36 = 0;
          }
LABEL_75:
          v5->_dwellTime = v36;
          continue;
        case 4u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          v5->_hasOtherSuggestionTapped = 1;
          while (2)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
              *(void *)&v4[v44] = v46;
              v43 |= (unint64_t)(v47 & 0x7F) << v41;
              if (v47 < 0)
              {
                v41 += 7;
                BOOL v17 = v42++ >= 9;
                if (v17)
                {
                  uint64_t v43 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v43 = 0;
          }
LABEL_79:
          BOOL v62 = v43 != 0;
          uint64_t v63 = 21;
          goto LABEL_84;
        case 5u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          v5->_hasOtherSuggestionSpoken = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  uint64_t v50 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v50 = 0;
          }
LABEL_83:
          BOOL v62 = v50 != 0;
          uint64_t v63 = 23;
LABEL_84:
          *((unsigned char *)&v5->super.super.isa + v63) = v62;
          continue;
        case 6u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          v5->_hasPosition = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_91;
          }
          continue;
      }
      while (1)
      {
        uint64_t v58 = *v6;
        uint64_t v59 = *(void *)&v4[v58];
        unint64_t v60 = v59 + 1;
        if (v59 == -1 || v60 > *(void *)&v4[*v7]) {
          break;
        }
        char v61 = *(unsigned char *)(*(void *)&v4[*v9] + v59);
        *(void *)&v4[v58] = v60;
        v57 |= (unint64_t)(v61 & 0x7F) << v55;
        if ((v61 & 0x80) == 0) {
          goto LABEL_86;
        }
        v55 += 7;
        BOOL v17 = v56++ >= 9;
        if (v17)
        {
          LODWORD(v57) = 0;
          goto LABEL_88;
        }
      }
      v4[*v8] = 1;
LABEL_86:
      if (v4[*v8]) {
        LODWORD(v57) = 0;
      }
LABEL_88:
      v5->_position = v57;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_91:
  }
    id v64 = 0;
  else {
LABEL_92:
  }
    id v64 = v5;

  return v64;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasSpoken](self, "wasSpoken"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels wasTapped](self, "wasTapped"));
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels dwellTime](self, "dwellTime"));
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionTapped](self, "otherSuggestionTapped"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels otherSuggestionSpoken](self, "otherSuggestionSpoken"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEngagementLabels position](self, "position"));
  char v10 = (void *)[v3 initWithFormat:@"BMSiriAssistantSuggestionFeaturesEngagementLabels with wasSpoken: %@, wasTapped: %@, dwellTime: %@, otherSuggestionTapped: %@, otherSuggestionSpoken: %@, position: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithWasSpoken:(id)a3 wasTapped:(id)a4 dwellTime:(id)a5 otherSuggestionTapped:(id)a6 otherSuggestionSpoken:(id)a7 position:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriAssistantSuggestionFeaturesEngagementLabels;
  char v20 = [(BMEventBase *)&v24 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v20->_hasWasSpoken = 1;
      v20->_wasSpoken = [v14 BOOLValue];
    }
    else
    {
      v20->_hasWasSpoken = 0;
      v20->_wasSpoken = 0;
    }
    if (v15)
    {
      v20->_hasWasTapped = 1;
      v20->_wasTapped = [v15 BOOLValue];
    }
    else
    {
      v20->_hasWasTapped = 0;
      v20->_wasTapped = 0;
    }
    if (v16)
    {
      v20->_hasDwellTime = 1;
      uint64_t v21 = [v16 longLongValue];
    }
    else
    {
      v20->_hasDwellTime = 0;
      uint64_t v21 = -1;
    }
    v20->_dwellTime = v21;
    if (v17)
    {
      v20->_hasOtherSuggestionTapped = 1;
      v20->_otherSuggestionTapped = [v17 BOOLValue];
    }
    else
    {
      v20->_hasOtherSuggestionTapped = 0;
      v20->_otherSuggestionTapped = 0;
    }
    if (v18)
    {
      v20->_hasOtherSuggestionSpoken = 1;
      v20->_otherSuggestionSpoken = [v18 BOOLValue];
    }
    else
    {
      v20->_hasOtherSuggestionSpoken = 0;
      v20->_otherSuggestionSpoken = 0;
    }
    if (v19)
    {
      v20->_hasPosition = 1;
      int v22 = [v19 intValue];
    }
    else
    {
      v20->_hasPosition = 0;
      int v22 = -1;
    }
    v20->_position = v22;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"wasSpoken" number:1 type:12 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"wasTapped" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dwellTime" number:3 type:3 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"otherSuggestionTapped" number:4 type:12 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"otherSuggestionSpoken" number:5 type:12 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"position" number:6 type:2 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3BE8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wasSpoken" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wasTapped" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dwellTime" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:3 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"otherSuggestionTapped" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"otherSuggestionSpoken" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"position" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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

    id v8 = [[BMSiriAssistantSuggestionFeaturesEngagementLabels alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)initWithWasSpoken:(id)a3 wasTapped:(id)a4 dwellTime:(id)a5
{
  return [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self initWithWasSpoken:a3 wasTapped:a4 dwellTime:a5 otherSuggestionTapped:0 otherSuggestionSpoken:0 position:0];
}

@end