@interface BMSiriAssistantSuggestionFeaturesUserSegmentation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesUserSegmentation)initWithIs2x3:(id)a3 siriWasDisabled:(id)a4 siriWasdictationOnly:(id)a5 active6MonthsOrMoreAgo:(id)a6 active28To6MonthsDaysAgo:(id)a7 active14To28DaysAgo:(id)a8 active7To14DaysAgo:(id)a9 activeWithin7days:(id)a10 activeWithin7days1Turn:(id)a11 activeWithin7Days2To3Turns:(id)a12 activeWithin7Days4PlusTurns:(id)a13;
- (BMSiriAssistantSuggestionFeaturesUserSegmentation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)active14To28DaysAgo;
- (BOOL)active28To6MonthsDaysAgo;
- (BOOL)active6MonthsOrMoreAgo;
- (BOOL)active7To14DaysAgo;
- (BOOL)activeWithin7Days2To3Turns;
- (BOOL)activeWithin7Days4PlusTurns;
- (BOOL)activeWithin7days;
- (BOOL)activeWithin7days1Turn;
- (BOOL)hasActive14To28DaysAgo;
- (BOOL)hasActive28To6MonthsDaysAgo;
- (BOOL)hasActive6MonthsOrMoreAgo;
- (BOOL)hasActive7To14DaysAgo;
- (BOOL)hasActiveWithin7Days2To3Turns;
- (BOOL)hasActiveWithin7Days4PlusTurns;
- (BOOL)hasActiveWithin7days;
- (BOOL)hasActiveWithin7days1Turn;
- (BOOL)hasIs2x3;
- (BOOL)hasSiriWasDisabled;
- (BOOL)hasSiriWasdictationOnly;
- (BOOL)is2x3;
- (BOOL)isEqual:(id)a3;
- (BOOL)siriWasDisabled;
- (BOOL)siriWasdictationOnly;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasActive14To28DaysAgo:(BOOL)a3;
- (void)setHasActive28To6MonthsDaysAgo:(BOOL)a3;
- (void)setHasActive6MonthsOrMoreAgo:(BOOL)a3;
- (void)setHasActive7To14DaysAgo:(BOOL)a3;
- (void)setHasActiveWithin7Days2To3Turns:(BOOL)a3;
- (void)setHasActiveWithin7Days4PlusTurns:(BOOL)a3;
- (void)setHasActiveWithin7days1Turn:(BOOL)a3;
- (void)setHasActiveWithin7days:(BOOL)a3;
- (void)setHasIs2x3:(BOOL)a3;
- (void)setHasSiriWasDisabled:(BOOL)a3;
- (void)setHasSiriWasdictationOnly:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesUserSegmentation

- (void)setHasActiveWithin7Days4PlusTurns:(BOOL)a3
{
  self->_hasActiveWithin7Days4PlusTurns = a3;
}

- (BOOL)hasActiveWithin7Days4PlusTurns
{
  return self->_hasActiveWithin7Days4PlusTurns;
}

- (BOOL)activeWithin7Days4PlusTurns
{
  return self->_activeWithin7Days4PlusTurns;
}

- (void)setHasActiveWithin7Days2To3Turns:(BOOL)a3
{
  self->_hasActiveWithin7Days2To3Turns = a3;
}

- (BOOL)hasActiveWithin7Days2To3Turns
{
  return self->_hasActiveWithin7Days2To3Turns;
}

- (BOOL)activeWithin7Days2To3Turns
{
  return self->_activeWithin7Days2To3Turns;
}

- (void)setHasActiveWithin7days1Turn:(BOOL)a3
{
  self->_hasActiveWithin7days1Turn = a3;
}

- (BOOL)hasActiveWithin7days1Turn
{
  return self->_hasActiveWithin7days1Turn;
}

- (BOOL)activeWithin7days1Turn
{
  return self->_activeWithin7days1Turn;
}

- (void)setHasActiveWithin7days:(BOOL)a3
{
  self->_hasActiveWithin7days = a3;
}

- (BOOL)hasActiveWithin7days
{
  return self->_hasActiveWithin7days;
}

- (BOOL)activeWithin7days
{
  return self->_activeWithin7days;
}

- (void)setHasActive7To14DaysAgo:(BOOL)a3
{
  self->_hasActive7To14DaysAgo = a3;
}

- (BOOL)hasActive7To14DaysAgo
{
  return self->_hasActive7To14DaysAgo;
}

- (BOOL)active7To14DaysAgo
{
  return self->_active7To14DaysAgo;
}

- (void)setHasActive14To28DaysAgo:(BOOL)a3
{
  self->_hasActive14To28DaysAgo = a3;
}

- (BOOL)hasActive14To28DaysAgo
{
  return self->_hasActive14To28DaysAgo;
}

- (BOOL)active14To28DaysAgo
{
  return self->_active14To28DaysAgo;
}

- (void)setHasActive28To6MonthsDaysAgo:(BOOL)a3
{
  self->_hasActive28To6MonthsDaysAgo = a3;
}

- (BOOL)hasActive28To6MonthsDaysAgo
{
  return self->_hasActive28To6MonthsDaysAgo;
}

- (BOOL)active28To6MonthsDaysAgo
{
  return self->_active28To6MonthsDaysAgo;
}

- (void)setHasActive6MonthsOrMoreAgo:(BOOL)a3
{
  self->_hasActive6MonthsOrMoreAgo = a3;
}

- (BOOL)hasActive6MonthsOrMoreAgo
{
  return self->_hasActive6MonthsOrMoreAgo;
}

- (BOOL)active6MonthsOrMoreAgo
{
  return self->_active6MonthsOrMoreAgo;
}

- (void)setHasSiriWasdictationOnly:(BOOL)a3
{
  self->_hasSiriWasdictationOnly = a3;
}

- (BOOL)hasSiriWasdictationOnly
{
  return self->_hasSiriWasdictationOnly;
}

- (BOOL)siriWasdictationOnly
{
  return self->_siriWasdictationOnly;
}

- (void)setHasSiriWasDisabled:(BOOL)a3
{
  self->_hasSiriWasDisabled = a3;
}

- (BOOL)hasSiriWasDisabled
{
  return self->_hasSiriWasDisabled;
}

- (BOOL)siriWasDisabled
{
  return self->_siriWasDisabled;
}

- (void)setHasIs2x3:(BOOL)a3
{
  self->_hasIs2x3 = a3;
}

- (BOOL)hasIs2x3
{
  return self->_hasIs2x3;
}

- (BOOL)is2x3
{
  return self->_is2x3;
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
    if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasIs2x3]
      || [v5 hasIs2x3])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasIs2x3]) {
        goto LABEL_58;
      }
      if (![v5 hasIs2x3]) {
        goto LABEL_58;
      }
      int v6 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self is2x3];
      if (v6 != [v5 is2x3]) {
        goto LABEL_58;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasSiriWasDisabled]
      || [v5 hasSiriWasDisabled])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasSiriWasDisabled]) {
        goto LABEL_58;
      }
      if (![v5 hasSiriWasDisabled]) {
        goto LABEL_58;
      }
      int v7 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self siriWasDisabled];
      if (v7 != [v5 siriWasDisabled]) {
        goto LABEL_58;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasSiriWasdictationOnly]
      || [v5 hasSiriWasdictationOnly])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasSiriWasdictationOnly])goto LABEL_58; {
      if (![v5 hasSiriWasdictationOnly])
      }
        goto LABEL_58;
      int v8 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self siriWasdictationOnly];
      if (v8 != [v5 siriWasdictationOnly]) {
        goto LABEL_58;
      }
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive6MonthsOrMoreAgo](self, "hasActive6MonthsOrMoreAgo")|| [v5 hasActive6MonthsOrMoreAgo])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive6MonthsOrMoreAgo])goto LABEL_58; {
      if (![v5 hasActive6MonthsOrMoreAgo])
      }
        goto LABEL_58;
      int v9 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self active6MonthsOrMoreAgo];
      if (v9 != [v5 active6MonthsOrMoreAgo]) {
        goto LABEL_58;
      }
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive28To6MonthsDaysAgo](self, "hasActive28To6MonthsDaysAgo")|| [v5 hasActive28To6MonthsDaysAgo])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive28To6MonthsDaysAgo])goto LABEL_58; {
      if (![v5 hasActive28To6MonthsDaysAgo])
      }
        goto LABEL_58;
      int v10 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self active28To6MonthsDaysAgo];
      if (v10 != [v5 active28To6MonthsDaysAgo]) {
        goto LABEL_58;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive14To28DaysAgo]
      || [v5 hasActive14To28DaysAgo])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive14To28DaysAgo]) {
        goto LABEL_58;
      }
      if (![v5 hasActive14To28DaysAgo]) {
        goto LABEL_58;
      }
      int v11 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self active14To28DaysAgo];
      if (v11 != [v5 active14To28DaysAgo]) {
        goto LABEL_58;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive7To14DaysAgo]
      || [v5 hasActive7To14DaysAgo])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive7To14DaysAgo]) {
        goto LABEL_58;
      }
      if (![v5 hasActive7To14DaysAgo]) {
        goto LABEL_58;
      }
      int v12 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self active7To14DaysAgo];
      if (v12 != [v5 active7To14DaysAgo]) {
        goto LABEL_58;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7days]
      || [v5 hasActiveWithin7days])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7days]) {
        goto LABEL_58;
      }
      if (![v5 hasActiveWithin7days]) {
        goto LABEL_58;
      }
      int v13 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self activeWithin7days];
      if (v13 != [v5 activeWithin7days]) {
        goto LABEL_58;
      }
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7days1Turn](self, "hasActiveWithin7days1Turn")|| [v5 hasActiveWithin7days1Turn])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7days1Turn])goto LABEL_58; {
      if (![v5 hasActiveWithin7days1Turn])
      }
        goto LABEL_58;
      int v14 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self activeWithin7days1Turn];
      if (v14 != [v5 activeWithin7days1Turn]) {
        goto LABEL_58;
      }
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days2To3Turns](self, "hasActiveWithin7Days2To3Turns")|| [v5 hasActiveWithin7Days2To3Turns])
    {
      if (![(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7Days2To3Turns])goto LABEL_58; {
      if (![v5 hasActiveWithin7Days2To3Turns])
      }
        goto LABEL_58;
      int v15 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self activeWithin7Days2To3Turns];
      if (v15 != [v5 activeWithin7Days2To3Turns]) {
        goto LABEL_58;
      }
    }
    if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days4PlusTurns](self, "hasActiveWithin7Days4PlusTurns")&& ![v5 hasActiveWithin7Days4PlusTurns])
    {
      LOBYTE(v17) = 1;
      goto LABEL_59;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days4PlusTurns](self, "hasActiveWithin7Days4PlusTurns")&& [v5 hasActiveWithin7Days4PlusTurns])
    {
      BOOL v16 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self activeWithin7Days4PlusTurns];
      int v17 = v16 ^ [v5 activeWithin7Days4PlusTurns] ^ 1;
    }
    else
    {
LABEL_58:
      LOBYTE(v17) = 0;
    }
LABEL_59:

    goto LABEL_60;
  }
  LOBYTE(v17) = 0;
LABEL_60:

  return v17;
}

- (id)jsonDictionary
{
  v37[11] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasIs2x3])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation is2x3](self, "is2x3"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasSiriWasDisabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasDisabled](self, "siriWasDisabled"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasSiriWasdictationOnly])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasdictationOnly](self, "siriWasdictationOnly"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive6MonthsOrMoreAgo])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active6MonthsOrMoreAgo](self, "active6MonthsOrMoreAgo"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive28To6MonthsDaysAgo])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active28To6MonthsDaysAgo](self, "active28To6MonthsDaysAgo"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive14To28DaysAgo])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active14To28DaysAgo](self, "active14To28DaysAgo"));
    id v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v35 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActive7To14DaysAgo])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active7To14DaysAgo](self, "active7To14DaysAgo"));
    id v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v34 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7days])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days](self, "activeWithin7days"));
    id v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v33 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7days1Turn])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days1Turn](self, "activeWithin7days1Turn"));
    id v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v32 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7Days2To3Turns])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days2To3Turns](self, "activeWithin7Days2To3Turns"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self hasActiveWithin7Days4PlusTurns])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days4PlusTurns](self, "activeWithin7Days4PlusTurns"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  v36[0] = @"is2x3";
  uint64_t v10 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v10;
  v37[0] = v10;
  v36[1] = @"siriWasDisabled";
  uint64_t v11 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v11;
  v37[1] = v11;
  v36[2] = @"siriWasdictationOnly";
  uint64_t v12 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v12;
  v37[2] = v12;
  v36[3] = @"active6MonthsOrMoreAgo";
  uint64_t v13 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = v3;
  v24 = (void *)v13;
  v37[3] = v13;
  v36[4] = @"active28To6MonthsDaysAgo";
  uint64_t v14 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = v4;
  v23 = (void *)v14;
  v37[4] = v14;
  v36[5] = @"active14To28DaysAgo";
  int v15 = v35;
  if (!v35)
  {
    int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = v5;
  v37[5] = v15;
  v36[6] = @"active7To14DaysAgo";
  BOOL v16 = v34;
  if (!v34)
  {
    BOOL v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v17 = v6;
  v37[6] = v16;
  v36[7] = @"activeWithin7days";
  v18 = v33;
  if (!v33)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[7] = v18;
  v36[8] = @"activeWithin7days1Turn";
  v19 = v32;
  if (!v32)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[8] = v19;
  v36[9] = @"activeWithin7Days2To3Turns";
  v20 = v8;
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[9] = v20;
  v36[10] = @"activeWithin7Days4PlusTurns";
  v21 = v9;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[10] = v21;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:11];
  if (v9)
  {
    if (v8) {
      goto LABEL_58;
    }
  }
  else
  {

    if (v8) {
      goto LABEL_58;
    }
  }

LABEL_58:
  if (!v32) {

  }
  if (!v33) {
  if (!v34)
  }

  if (!v35) {
  if (!v7)
  }

  if (v17)
  {
    if (v29) {
      goto LABEL_70;
    }
  }
  else
  {

    if (v29)
    {
LABEL_70:
      if (v30) {
        goto LABEL_71;
      }
LABEL_79:

      if (v31) {
        goto LABEL_72;
      }
      goto LABEL_80;
    }
  }

  if (!v30) {
    goto LABEL_79;
  }
LABEL_71:
  if (v31) {
    goto LABEL_72;
  }
LABEL_80:

LABEL_72:

  return v28;
}

- (BMSiriAssistantSuggestionFeaturesUserSegmentation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v132[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"is2x3"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"siriWasDisabled"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          goto LABEL_45;
        }
        v38 = a4;
        id v39 = v8;
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v129 = *MEMORY[0x1E4F28568];
        v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"siriWasDisabled"];
        v130 = v29;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
        v42 = v40;
        id v8 = v39;
        id v43 = (id)[v42 initWithDomain:v41 code:2 userInfo:v12];
        a4 = 0;
        id v10 = 0;
        id *v38 = v43;
        goto LABEL_44;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"siriWasdictationOnly"];
    id v109 = v10;
    v110 = self;
    v107 = (void *)v11;
    id v108 = v8;
    v106 = v9;
    if (v11 && (uint64_t v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v29 = 0;
          goto LABEL_44;
        }
        id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v127 = *MEMORY[0x1E4F28568];
        v46 = a4;
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"siriWasdictationOnly"];
        id v128 = v14;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
        v47 = v44;
        id v8 = v108;
        a4 = 0;
        v29 = 0;
        id *v46 = (id)[v47 initWithDomain:v45 code:2 userInfo:v30];
LABEL_43:

        id v10 = v109;
        self = v110;
        id v9 = v106;
        uint64_t v12 = v107;
LABEL_44:

        goto LABEL_45;
      }
      id v105 = v12;
    }
    else
    {
      id v105 = 0;
    }
    uint64_t v13 = [v6 objectForKeyedSubscript:@"active6MonthsOrMoreAgo"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = v13;
        if (!a4)
        {
          id v14 = 0;
          v29 = v105;
          goto LABEL_43;
        }
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v125 = *MEMORY[0x1E4F28568];
        v50 = a4;
        id v104 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"active6MonthsOrMoreAgo"];
        id v126 = v104;
        int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        v51 = v48;
        id v8 = v108;
        id v52 = (id)[v51 initWithDomain:v49 code:2 userInfo:v15];
        a4 = 0;
        id v14 = 0;
        id *v50 = v52;
        v29 = v105;
        goto LABEL_42;
      }
      v103 = v13;
      id v14 = v13;
    }
    else
    {
      v103 = v13;
      id v14 = 0;
    }
    int v15 = [v6 objectForKeyedSubscript:@"active28To6MonthsDaysAgo"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v104 = 0;
          v29 = v105;
          v30 = v103;
          goto LABEL_42;
        }
        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v54 = *MEMORY[0x1E4F502C8];
        uint64_t v123 = *MEMORY[0x1E4F28568];
        v55 = a4;
        uint64_t v56 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"active28To6MonthsDaysAgo"];
        uint64_t v124 = v56;
        uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
        v58 = v53;
        id v8 = v108;
        uint64_t v59 = v54;
        id v19 = (id)v56;
        v102 = (void *)v57;
        a4 = 0;
        id v104 = 0;
        id *v55 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 2);
        v29 = v105;
        v30 = v103;
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      BOOL v16 = v15;
      id v104 = v15;
    }
    else
    {
      BOOL v16 = v15;
      id v104 = 0;
    }
    uint64_t v17 = [v6 objectForKeyedSubscript:@"active14To28DaysAgo"];
    v102 = (void *)v17;
    if (v17 && (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v19 = 0;
          v29 = v105;
          v30 = v103;
          int v15 = v16;
          goto LABEL_41;
        }
        id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v121 = *MEMORY[0x1E4F28568];
        v62 = a4;
        id v101 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"active14To28DaysAgo"];
        id v122 = v101;
        v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
        id v63 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        a4 = 0;
        id v19 = 0;
        id *v62 = v63;
        goto LABEL_98;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v20 = [v6 objectForKeyedSubscript:@"active7To14DaysAgo"];
    v100 = (void *)v20;
    if (!v20 || (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v101 = 0;
LABEL_22:
      [v6 objectForKeyedSubscript:@"activeWithin7days"];
      v22 = int v15 = v16;
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v99 = 0;
            v29 = v105;
            v30 = v103;
            goto LABEL_39;
          }
          id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
          v71 = v22;
          id v72 = v19;
          uint64_t v73 = *MEMORY[0x1E4F502C8];
          uint64_t v117 = *MEMORY[0x1E4F28568];
          id v95 = v14;
          v74 = a4;
          id v98 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"activeWithin7days"];
          id v118 = v98;
          uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
          v76 = v70;
          id v8 = v108;
          uint64_t v77 = v73;
          id v19 = v72;
          v22 = v71;
          v96 = (void *)v75;
          a4 = 0;
          id v99 = 0;
          id *v74 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
          id v14 = v95;
          goto LABEL_101;
        }
        id v99 = v22;
      }
      else
      {
        id v99 = 0;
      }
      uint64_t v23 = [v6 objectForKeyedSubscript:@"activeWithin7days1Turn"];
      v96 = (void *)v23;
      id v97 = v19;
      if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v98 = 0;
LABEL_28:
        v25 = [v6 objectForKeyedSubscript:@"activeWithin7Days2To3Turns"];
        id v94 = v14;
        if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v26 = 0;
              goto LABEL_37;
            }
            id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
            v83 = v22;
            v84 = a4;
            uint64_t v85 = *MEMORY[0x1E4F502C8];
            uint64_t v113 = *MEMORY[0x1E4F28568];
            id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"activeWithin7Days2To3Turns"];
            id v114 = v28;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
            id v86 = (id)[v82 initWithDomain:v85 code:2 userInfo:v27];
            a4 = 0;
            id v26 = 0;
            id *v84 = v86;
            v22 = v83;
            id v14 = v94;
            goto LABEL_36;
          }
          v92 = v22;
          id v26 = v25;
        }
        else
        {
          v92 = v22;
          id v26 = 0;
        }
        v27 = [v6 objectForKeyedSubscript:@"activeWithin7Days4PlusTurns"];
        if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v87 = a4;
              id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v90 = *MEMORY[0x1E4F502C8];
              uint64_t v111 = *MEMORY[0x1E4F28568];
              v88 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"activeWithin7Days4PlusTurns"];
              v112 = v88;
              v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
              id *v87 = (id)[v91 initWithDomain:v90 code:2 userInfo:v89];

              id v28 = 0;
              a4 = 0;
            }
            else
            {
              id v28 = 0;
            }
            id v14 = v94;
            goto LABEL_35;
          }
          id v28 = v27;
        }
        else
        {
          id v28 = 0;
        }
        a4 = [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)v110 initWithIs2x3:v108 siriWasDisabled:v109 siriWasdictationOnly:v105 active6MonthsOrMoreAgo:v14 active28To6MonthsDaysAgo:v104 active14To28DaysAgo:v97 active7To14DaysAgo:v101 activeWithin7days:v99 activeWithin7days1Turn:v98 activeWithin7Days2To3Turns:v26 activeWithin7Days4PlusTurns:v28];
        v110 = (BMSiriAssistantSuggestionFeaturesUserSegmentation *)a4;
LABEL_35:
        v22 = v92;
LABEL_36:

LABEL_37:
        id v8 = v108;
        v29 = v105;
        v30 = v103;
        id v19 = v97;
LABEL_38:

LABEL_39:
LABEL_40:

        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v98 = v24;
        goto LABEL_28;
      }
      if (a4)
      {
        v78 = a4;
        id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v80 = *MEMORY[0x1E4F502C8];
        uint64_t v115 = *MEMORY[0x1E4F28568];
        id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"activeWithin7days1Turn"];
        id v116 = v26;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
        id v81 = (id)[v79 initWithDomain:v80 code:2 userInfo:v25];
        a4 = 0;
        id v98 = 0;
        id *v78 = v81;
        goto LABEL_37;
      }
      id v98 = 0;
LABEL_101:
      v29 = v105;
      v30 = v103;
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v101 = v21;
      goto LABEL_22;
    }
    if (a4)
    {
      id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v65 = v19;
      uint64_t v66 = *MEMORY[0x1E4F502C8];
      uint64_t v119 = *MEMORY[0x1E4F28568];
      v67 = a4;
      id v99 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"active7To14DaysAgo"];
      id v120 = v99;
      uint64_t v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
      v68 = v64;
      id v8 = v108;
      uint64_t v69 = v66;
      id v19 = v65;
      a4 = 0;
      id v101 = 0;
      id *v67 = (id)[v68 initWithDomain:v69 code:2 userInfo:v93];
      v29 = v105;
      v30 = v103;
      int v15 = v16;
      v22 = (void *)v93;
      goto LABEL_39;
    }
    id v101 = 0;
LABEL_98:
    v29 = v105;
    v30 = v103;
    int v15 = v16;
    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    goto LABEL_46;
  }
  id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v33 = *MEMORY[0x1E4F502C8];
  uint64_t v131 = *MEMORY[0x1E4F28568];
  uint64_t v34 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"is2x3"];
  v132[0] = v34;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:&v131 count:1];
  uint64_t v35 = v33;
  id v10 = (id)v34;
  id v36 = (id)[v32 initWithDomain:v35 code:2 userInfo:v9];
  v37 = a4;
  a4 = 0;
  id v8 = 0;
  id *v37 = v36;
LABEL_45:

LABEL_46:
  return (BMSiriAssistantSuggestionFeaturesUserSegmentation *)a4;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasIs2x3)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasSiriWasDisabled)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasSiriWasdictationOnly)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActive6MonthsOrMoreAgo)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActive28To6MonthsDaysAgo)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActive14To28DaysAgo)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActive7To14DaysAgo)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActiveWithin7days)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActiveWithin7days1Turn)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActiveWithin7Days2To3Turns)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasActiveWithin7Days4PlusTurns)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v105.receiver = self;
  v105.super_class = (Class)BMSiriAssistantSuggestionFeaturesUserSegmentation;
  id v5 = [(BMEventBase *)&v105 init];
  if (!v5) {
    goto LABEL_130;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    id v10 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__is2x3;
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    uint64_t v12 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v13 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasDisabled;
    id v14 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    int v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    BOOL v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v19 = 0;
      while (1)
      {
        uint64_t v20 = *v6;
        uint64_t v21 = *(void *)&v4[v20];
        unint64_t v22 = v21 + 1;
        if (v21 == -1 || v22 > *(void *)&v4[*v7]) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)&v4[*v11] + v21);
        *(void *)&v4[v20] = v22;
        v19 |= (unint64_t)(v23 & 0x7F) << v17;
        if ((v23 & 0x80) == 0) {
          goto LABEL_13;
        }
        v17 += 7;
        if (v18++ >= 9)
        {
          unint64_t v19 = 0;
          int v25 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v25 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v19 = 0;
      }
LABEL_15:
      if (v25 || (v19 & 7) == 4) {
        break;
      }
      switch((v19 >> 3))
      {
        case 1u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v9[414]) = 1;
          while (1)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7])
            {
              uint64_t v35 = v10;
              goto LABEL_110;
            }
            char v33 = *(unsigned char *)(*(void *)&v4[*v11] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              break;
            }
            uint64_t v34 = 0;
            v27 += 7;
            uint64_t v35 = v10;
            BOOL v36 = v28++ > 8;
            if (v36) {
              goto LABEL_114;
            }
          }
          uint64_t v35 = v10;
          goto LABEL_111;
        case 2u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v12[416]) = 1;
          while (2)
          {
            uint64_t v45 = *v6;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v7])
            {
              uint64_t v35 = v13;
              goto LABEL_110;
            }
            char v48 = *(unsigned char *)(*(void *)&v4[*v11] + v46);
            *(void *)&v4[v45] = v47;
            v29 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              uint64_t v34 = 0;
              v43 += 7;
              uint64_t v35 = v13;
              BOOL v36 = v44++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = v13;
          goto LABEL_111;
        case 3u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v14[418]) = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasdictationOnly;
              goto LABEL_110;
            }
            char v54 = *(unsigned char *)(*(void *)&v4[*v11] + v52);
            *(void *)&v4[v51] = v53;
            v29 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              uint64_t v34 = 0;
              v49 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasdictationOnly;
              BOOL v36 = v50++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasdictationOnly;
          goto LABEL_111;
        case 4u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v15[420]) = 1;
          while (2)
          {
            uint64_t v57 = *v6;
            uint64_t v58 = *(void *)&v4[v57];
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active6MonthsOrMoreAgo;
              goto LABEL_110;
            }
            char v60 = *(unsigned char *)(*(void *)&v4[*v11] + v58);
            *(void *)&v4[v57] = v59;
            v29 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              uint64_t v34 = 0;
              v55 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active6MonthsOrMoreAgo;
              BOOL v36 = v56++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active6MonthsOrMoreAgo;
          goto LABEL_111;
        case 5u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + v16[422]) = 1;
          while (2)
          {
            uint64_t v63 = *v6;
            uint64_t v64 = *(void *)&v4[v63];
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active28To6MonthsDaysAgo;
              goto LABEL_110;
            }
            char v66 = *(unsigned char *)(*(void *)&v4[*v11] + v64);
            *(void *)&v4[v63] = v65;
            v29 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              uint64_t v34 = 0;
              v61 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active28To6MonthsDaysAgo;
              BOOL v36 = v62++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active28To6MonthsDaysAgo;
          goto LABEL_111;
        case 6u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v29 = 0;
          v5->_hasActive14To28DaysAgo = 1;
          while (2)
          {
            uint64_t v69 = *v6;
            uint64_t v70 = *(void *)&v4[v69];
            unint64_t v71 = v70 + 1;
            if (v70 == -1 || v71 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active14To28DaysAgo;
              goto LABEL_110;
            }
            char v72 = *(unsigned char *)(*(void *)&v4[*v11] + v70);
            *(void *)&v4[v69] = v71;
            v29 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              uint64_t v34 = 0;
              v67 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active14To28DaysAgo;
              BOOL v36 = v68++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active14To28DaysAgo;
          goto LABEL_111;
        case 7u:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v29 = 0;
          v5->_hasActive7To14DaysAgo = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active7To14DaysAgo;
              goto LABEL_110;
            }
            char v78 = *(unsigned char *)(*(void *)&v4[*v11] + v76);
            *(void *)&v4[v75] = v77;
            v29 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              uint64_t v34 = 0;
              v73 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active7To14DaysAgo;
              BOOL v36 = v74++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active7To14DaysAgo;
          goto LABEL_111;
        case 8u:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v29 = 0;
          v5->_hasActiveWithin7days = 1;
          while (2)
          {
            uint64_t v81 = *v6;
            uint64_t v82 = *(void *)&v4[v81];
            unint64_t v83 = v82 + 1;
            if (v82 == -1 || v83 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days;
              goto LABEL_110;
            }
            char v84 = *(unsigned char *)(*(void *)&v4[*v11] + v82);
            *(void *)&v4[v81] = v83;
            v29 |= (unint64_t)(v84 & 0x7F) << v79;
            if (v84 < 0)
            {
              uint64_t v34 = 0;
              v79 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days;
              BOOL v36 = v80++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days;
          goto LABEL_111;
        case 9u:
          char v85 = 0;
          unsigned int v86 = 0;
          uint64_t v29 = 0;
          v5->_hasActiveWithin7days1Turn = 1;
          while (2)
          {
            uint64_t v87 = *v6;
            uint64_t v88 = *(void *)&v4[v87];
            unint64_t v89 = v88 + 1;
            if (v88 == -1 || v89 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days1Turn;
              goto LABEL_110;
            }
            char v90 = *(unsigned char *)(*(void *)&v4[*v11] + v88);
            *(void *)&v4[v87] = v89;
            v29 |= (unint64_t)(v90 & 0x7F) << v85;
            if (v90 < 0)
            {
              uint64_t v34 = 0;
              v85 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days1Turn;
              BOOL v36 = v86++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days1Turn;
          goto LABEL_111;
        case 0xAu:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v29 = 0;
          v5->_hasActiveWithin7Days2To3Turns = 1;
          while (2)
          {
            uint64_t v93 = *v6;
            uint64_t v94 = *(void *)&v4[v93];
            unint64_t v95 = v94 + 1;
            if (v94 == -1 || v95 > *(void *)&v4[*v7])
            {
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days2To3Turns;
              goto LABEL_110;
            }
            char v96 = *(unsigned char *)(*(void *)&v4[*v11] + v94);
            *(void *)&v4[v93] = v95;
            v29 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              uint64_t v34 = 0;
              v91 += 7;
              uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days2To3Turns;
              BOOL v36 = v92++ > 8;
              if (v36) {
                goto LABEL_114;
              }
              continue;
            }
            break;
          }
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days2To3Turns;
          goto LABEL_111;
        case 0xBu:
          char v97 = 0;
          unsigned int v98 = 0;
          uint64_t v29 = 0;
          v5->_hasActiveWithin7Days4PlusTurns = 1;
          break;
        default:
          v37 = v9;
          v38 = v10;
          id v39 = v12;
          id v40 = v13;
          uint64_t v41 = v14;
          char v42 = PBReaderSkipValueWithTag();
          id v14 = v41;
          id v8 = (int *)MEMORY[0x1E4F940C8];
          uint64_t v13 = v40;
          uint64_t v12 = v39;
          int v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          id v10 = v38;
          id v9 = v37;
          BOOL v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          if ((v42 & 1) == 0) {
            goto LABEL_129;
          }
          continue;
      }
      while (1)
      {
        uint64_t v99 = *v6;
        uint64_t v100 = *(void *)&v4[v99];
        unint64_t v101 = v100 + 1;
        if (v100 == -1 || v101 > *(void *)&v4[*v7]) {
          break;
        }
        char v102 = *(unsigned char *)(*(void *)&v4[*v11] + v100);
        *(void *)&v4[v99] = v101;
        v29 |= (unint64_t)(v102 & 0x7F) << v97;
        if ((v102 & 0x80) == 0)
        {
          uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days4PlusTurns;
          goto LABEL_111;
        }
        uint64_t v34 = 0;
        v97 += 7;
        uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days4PlusTurns;
        BOOL v36 = v98++ > 8;
        if (v36) {
          goto LABEL_114;
        }
      }
      uint64_t v35 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days4PlusTurns;
LABEL_110:
      v4[*v8] = 1;
LABEL_111:
      uint64_t v34 = v4[*v8] ? 0 : v29;
LABEL_114:
      *((unsigned char *)&v5->super.super.isa + *v35) = v34 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_129:
  }
    v103 = 0;
  else {
LABEL_130:
  }
    v103 = v5;

  return v103;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation is2x3](self, "is2x3"));
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasDisabled](self, "siriWasDisabled"));
  BOOL v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasdictationOnly](self, "siriWasdictationOnly"));
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active6MonthsOrMoreAgo](self, "active6MonthsOrMoreAgo"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active28To6MonthsDaysAgo](self, "active28To6MonthsDaysAgo"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active14To28DaysAgo](self, "active14To28DaysAgo"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active7To14DaysAgo](self, "active7To14DaysAgo"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days](self, "activeWithin7days"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days1Turn](self, "activeWithin7days1Turn"));
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days2To3Turns](self, "activeWithin7Days2To3Turns"));
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days4PlusTurns](self, "activeWithin7Days4PlusTurns"));
  int v15 = (void *)[v14 initWithFormat:@"BMSiriAssistantSuggestionFeaturesUserSegmentation with is2x3: %@, siriWasDisabled: %@, siriWasdictationOnly: %@, active6MonthsOrMoreAgo: %@, active28To6MonthsDaysAgo: %@, active14To28DaysAgo: %@, active7To14DaysAgo: %@, activeWithin7days: %@, activeWithin7days1Turn: %@, activeWithin7Days2To3Turns: %@, activeWithin7Days4PlusTurns: %@", v13, v12, v16, v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v15;
}

- (BMSiriAssistantSuggestionFeaturesUserSegmentation)initWithIs2x3:(id)a3 siriWasDisabled:(id)a4 siriWasdictationOnly:(id)a5 active6MonthsOrMoreAgo:(id)a6 active28To6MonthsDaysAgo:(id)a7 active14To28DaysAgo:(id)a8 active7To14DaysAgo:(id)a9 activeWithin7days:(id)a10 activeWithin7days1Turn:(id)a11 activeWithin7Days2To3Turns:(id)a12 activeWithin7Days4PlusTurns:(id)a13
{
  id v18 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriAssistantSuggestionFeaturesUserSegmentation;
  id v26 = [(BMEventBase *)&v32 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v18)
    {
      v26->_hasIs2x3 = 1;
      v26->_is2x3 = [v18 BOOLValue];
    }
    else
    {
      v26->_hasIs2x3 = 0;
      v26->_is2x3 = 0;
    }
    if (v31)
    {
      v26->_hasSiriWasDisabled = 1;
      v26->_siriWasDisabled = [v31 BOOLValue];
    }
    else
    {
      v26->_hasSiriWasDisabled = 0;
      v26->_siriWasDisabled = 0;
    }
    if (v30)
    {
      v26->_hasSiriWasdictationOnly = 1;
      v26->_siriWasdictationOnly = [v30 BOOLValue];
    }
    else
    {
      v26->_hasSiriWasdictationOnly = 0;
      v26->_siriWasdictationOnly = 0;
    }
    if (v29)
    {
      v26->_hasActive6MonthsOrMoreAgo = 1;
      v26->_active6MonthsOrMoreAgo = [v29 BOOLValue];
    }
    else
    {
      v26->_hasActive6MonthsOrMoreAgo = 0;
      v26->_active6MonthsOrMoreAgo = 0;
    }
    if (v19)
    {
      v26->_hasActive28To6MonthsDaysAgo = 1;
      v26->_active28To6MonthsDaysAgo = [v19 BOOLValue];
    }
    else
    {
      v26->_hasActive28To6MonthsDaysAgo = 0;
      v26->_active28To6MonthsDaysAgo = 0;
    }
    if (v20)
    {
      v26->_hasActive14To28DaysAgo = 1;
      v26->_active14To28DaysAgo = [v20 BOOLValue];
    }
    else
    {
      v26->_hasActive14To28DaysAgo = 0;
      v26->_active14To28DaysAgo = 0;
    }
    if (v21)
    {
      v26->_hasActive7To14DaysAgo = 1;
      v26->_active7To14DaysAgo = [v21 BOOLValue];
    }
    else
    {
      v26->_hasActive7To14DaysAgo = 0;
      v26->_active7To14DaysAgo = 0;
    }
    if (v22)
    {
      v26->_hasActiveWithin7days = 1;
      v26->_activeWithin7days = [v22 BOOLValue];
    }
    else
    {
      v26->_hasActiveWithin7days = 0;
      v26->_activeWithin7days = 0;
    }
    if (v23)
    {
      v26->_hasActiveWithin7days1Turn = 1;
      v26->_activeWithin7days1Turn = [v23 BOOLValue];
    }
    else
    {
      v26->_hasActiveWithin7days1Turn = 0;
      v26->_activeWithin7days1Turn = 0;
    }
    if (v24)
    {
      v26->_hasActiveWithin7Days2To3Turns = 1;
      v26->_activeWithin7Days2To3Turns = [v24 BOOLValue];
    }
    else
    {
      v26->_hasActiveWithin7Days2To3Turns = 0;
      v26->_activeWithin7Days2To3Turns = 0;
    }
    if (v25)
    {
      v26->_hasActiveWithin7Days4PlusTurns = 1;
      v26->_activeWithin7Days4PlusTurns = [v25 BOOLValue];
    }
    else
    {
      v26->_hasActiveWithin7Days4PlusTurns = 0;
      v26->_activeWithin7Days4PlusTurns = 0;
    }
  }

  return v26;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"is2x3" number:1 type:12 subMessageClass:0];
  v15[0] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriWasDisabled" number:2 type:12 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriWasdictationOnly" number:3 type:12 subMessageClass:0];
  v15[2] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"active6MonthsOrMoreAgo" number:4 type:12 subMessageClass:0];
  v15[3] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"active28To6MonthsDaysAgo" number:5 type:12 subMessageClass:0];
  v15[4] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"active14To28DaysAgo" number:6 type:12 subMessageClass:0];
  v15[5] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"active7To14DaysAgo" number:7 type:12 subMessageClass:0];
  v15[6] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeWithin7days" number:8 type:12 subMessageClass:0];
  v15[7] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeWithin7days1Turn" number:9 type:12 subMessageClass:0];
  v15[8] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeWithin7Days2To3Turns" number:10 type:12 subMessageClass:0];
  v15[9] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeWithin7Days4PlusTurns" number:11 type:12 subMessageClass:0];
  v15[10] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3B88;
}

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"is2x3" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriWasDisabled" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriWasdictationOnly" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"active6MonthsOrMoreAgo" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"active28To6MonthsDaysAgo" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"active14To28DaysAgo" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"active7To14DaysAgo" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activeWithin7days" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activeWithin7days1Turn" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activeWithin7Days2To3Turns" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activeWithin7Days4PlusTurns" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v12;
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

    id v8 = [[BMSiriAssistantSuggestionFeaturesUserSegmentation alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end