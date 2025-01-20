@interface IRHistoryEventDO
+ (BOOL)supportsSecureCoding;
+ (id)historyEventDOWithDate:(id)a3 candidateIdentifier:(id)a4 event:(id)a5 miloPredictionEvent:(id)a6 systemState:(id)a7 sharingPolicy:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHistoryEventDO:(id)a3;
- (IREventDO)event;
- (IRHistoryEventDO)initWithCoder:(id)a3;
- (IRHistoryEventDO)initWithDate:(id)a3 candidateIdentifier:(id)a4 event:(id)a5 miloPredictionEvent:(id)a6 systemState:(id)a7 sharingPolicy:(id)a8;
- (IRMiLoPredictionEventDO)miloPredictionEvent;
- (IRSystemStateDO)systemState;
- (NSDate)date;
- (NSString)candidateIdentifier;
- (NSString)sharingPolicy;
- (id)copyWithReplacementCandidateIdentifier:(id)a3;
- (id)copyWithReplacementDate:(id)a3;
- (id)copyWithReplacementEvent:(id)a3;
- (id)copyWithReplacementMiloPredictionEvent:(id)a3;
- (id)copyWithReplacementSharingPolicy:(id)a3;
- (id)copyWithReplacementSystemState:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRHistoryEventDO

- (IRHistoryEventDO)initWithDate:(id)a3 candidateIdentifier:(id)a4 event:(id)a5 miloPredictionEvent:(id)a6 systemState:(id)a7 sharingPolicy:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IRHistoryEventDO;
  v18 = [(IRHistoryEventDO *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_date, a3);
    objc_storeStrong((id *)&v19->_candidateIdentifier, a4);
    objc_storeStrong((id *)&v19->_event, a5);
    objc_storeStrong((id *)&v19->_miloPredictionEvent, a6);
    objc_storeStrong((id *)&v19->_systemState, a7);
    objc_storeStrong((id *)&v19->_sharingPolicy, a8);
  }

  return v19;
}

+ (id)historyEventDOWithDate:(id)a3 candidateIdentifier:(id)a4 event:(id)a5 miloPredictionEvent:(id)a6 systemState:(id)a7 sharingPolicy:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) initWithDate:v19 candidateIdentifier:v18 event:v17 miloPredictionEvent:v16 systemState:v15 sharingPolicy:v14];

  return v20;
}

- (id)copyWithReplacementDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:v4 candidateIdentifier:self->_candidateIdentifier event:self->_event miloPredictionEvent:self->_miloPredictionEvent systemState:self->_systemState sharingPolicy:self->_sharingPolicy];

  return v5;
}

- (id)copyWithReplacementCandidateIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date candidateIdentifier:v4 event:self->_event miloPredictionEvent:self->_miloPredictionEvent systemState:self->_systemState sharingPolicy:self->_sharingPolicy];

  return v5;
}

- (id)copyWithReplacementEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date candidateIdentifier:self->_candidateIdentifier event:v4 miloPredictionEvent:self->_miloPredictionEvent systemState:self->_systemState sharingPolicy:self->_sharingPolicy];

  return v5;
}

- (id)copyWithReplacementMiloPredictionEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date candidateIdentifier:self->_candidateIdentifier event:self->_event miloPredictionEvent:v4 systemState:self->_systemState sharingPolicy:self->_sharingPolicy];

  return v5;
}

- (id)copyWithReplacementSystemState:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date candidateIdentifier:self->_candidateIdentifier event:self->_event miloPredictionEvent:self->_miloPredictionEvent systemState:v4 sharingPolicy:self->_sharingPolicy];

  return v5;
}

- (id)copyWithReplacementSharingPolicy:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date candidateIdentifier:self->_candidateIdentifier event:self->_event miloPredictionEvent:self->_miloPredictionEvent systemState:self->_systemState sharingPolicy:v4];

  return v5;
}

- (BOOL)isEqualToHistoryEventDO:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_20;
  }
  int v6 = self->_date != 0;
  v7 = [v4 date];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_20;
  }
  date = self->_date;
  if (date)
  {
    v10 = [v5 date];
    int v11 = [(NSDate *)date isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  int v12 = self->_candidateIdentifier != 0;
  v13 = [v5 candidateIdentifier];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_20;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    id v16 = [v5 candidateIdentifier];
    int v17 = [(NSString *)candidateIdentifier isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  int v18 = self->_event != 0;
  id v19 = [v5 event];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_20;
  }
  event = self->_event;
  if (event)
  {
    id v22 = [v5 event];
    BOOL v23 = [(IREventDO *)event isEqual:v22];

    if (!v23) {
      goto LABEL_20;
    }
  }
  int v24 = self->_miloPredictionEvent != 0;
  v25 = [v5 miloPredictionEvent];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_20;
  }
  miloPredictionEvent = self->_miloPredictionEvent;
  if (miloPredictionEvent)
  {
    v28 = [v5 miloPredictionEvent];
    BOOL v29 = [(IRMiLoPredictionEventDO *)miloPredictionEvent isEqual:v28];

    if (!v29) {
      goto LABEL_20;
    }
  }
  int v30 = self->_systemState != 0;
  v31 = [v5 systemState];
  int v32 = v31 == 0;

  if (v30 == v32) {
    goto LABEL_20;
  }
  systemState = self->_systemState;
  if (systemState)
  {
    v34 = [v5 systemState];
    BOOL v35 = [(IRSystemStateDO *)systemState isEqual:v34];

    if (!v35) {
      goto LABEL_20;
    }
  }
  int v36 = self->_sharingPolicy != 0;
  v37 = [v5 sharingPolicy];
  int v38 = v37 == 0;

  if (v36 == v38)
  {
LABEL_20:
    char v41 = 0;
  }
  else
  {
    sharingPolicy = self->_sharingPolicy;
    if (sharingPolicy)
    {
      v40 = [v5 sharingPolicy];
      char v41 = [(NSString *)sharingPolicy isEqual:v40];
    }
    else
    {
      char v41 = 1;
    }
  }

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRHistoryEventDO *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRHistoryEventDO *)self isEqualToHistoryEventDO:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_date hash];
  NSUInteger v4 = [(NSString *)self->_candidateIdentifier hash] - v3 + 32 * v3;
  unint64_t v5 = [(IREventDO *)self->_event hash] - v4 + 32 * v4;
  unint64_t v6 = [(IRMiLoPredictionEventDO *)self->_miloPredictionEvent hash] - v5 + 32 * v5;
  unint64_t v7 = [(IRSystemStateDO *)self->_systemState hash] - v6 + 32 * v6;
  return [(NSString *)self->_sharingPolicy hash] - v7 + 32 * v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRHistoryEventDO)initWithCoder:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRHistoryEventDO key \"date\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v35 = *MEMORY[0x263F08320];
      v36[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRHistoryEventDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_9:
      int v14 = 0;
LABEL_10:

LABEL_11:
LABEL_12:

LABEL_13:
LABEL_14:

      goto LABEL_15;
    }
LABEL_6:
    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateIdentifier"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v15 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v15);
        id v16 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v16);
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRHistoryEventDO key \"candidateIdentifier\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v33 = *MEMORY[0x263F08320];
        v34 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        int v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRHistoryEventDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];

        goto LABEL_9;
      }
    }
    else
    {
      id v19 = [v4 error];

      if (v19)
      {
        int v14 = 0;
        goto LABEL_14;
      }
    }
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
    if (!v9)
    {
      int v24 = [v4 error];

      if (v24)
      {
        int v14 = 0;
        goto LABEL_13;
      }
    }
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"miloPredictionEvent"];
    if (!v10)
    {
      v25 = [v4 error];

      if (v25)
      {
        int v14 = 0;
        goto LABEL_12;
      }
    }
    int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemState"];
    if (!v11)
    {
      int v26 = [v4 error];

      if (v26)
      {
        int v14 = 0;
        goto LABEL_11;
      }
    }
    int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingPolicy"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v20 = (objc_class *)objc_opt_class();
        int v30 = NSStringFromClass(v20);
        id v21 = (objc_class *)objc_opt_class();
        BOOL v29 = NSStringFromClass(v21);
        v28 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRHistoryEventDO key \"sharingPolicy\" (expected %@, decoded %@)", v30, v29, 0];
        uint64_t v31 = *MEMORY[0x263F08320];
        int v32 = v28;
        id v22 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        BOOL v23 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRHistoryEventDOOCNTErrorDomain" code:3 userInfo:v22];
        [v4 failWithError:v23];

        goto LABEL_9;
      }
    }
    else
    {
      v27 = [v4 error];

      if (v27) {
        goto LABEL_9;
      }
    }
    self = [(IRHistoryEventDO *)self initWithDate:v5 candidateIdentifier:v7 event:v9 miloPredictionEvent:v10 systemState:v11 sharingPolicy:v12];
    int v14 = self;
    goto LABEL_10;
  }
  v13 = [v4 error];

  if (!v13) {
    goto LABEL_6;
  }
  int v14 = 0;
LABEL_15:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  date = self->_date;
  id v11 = v4;
  if (date)
  {
    [v4 encodeObject:date forKey:@"date"];
    id v4 = v11;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    [v11 encodeObject:candidateIdentifier forKey:@"candidateIdentifier"];
    id v4 = v11;
  }
  event = self->_event;
  if (event)
  {
    [v11 encodeObject:event forKey:@"event"];
    id v4 = v11;
  }
  miloPredictionEvent = self->_miloPredictionEvent;
  if (miloPredictionEvent)
  {
    [v11 encodeObject:miloPredictionEvent forKey:@"miloPredictionEvent"];
    id v4 = v11;
  }
  systemState = self->_systemState;
  if (systemState)
  {
    [v11 encodeObject:systemState forKey:@"systemState"];
    id v4 = v11;
  }
  sharingPolicy = self->_sharingPolicy;
  if (sharingPolicy)
  {
    [v11 encodeObject:sharingPolicy forKey:@"sharingPolicy"];
    id v4 = v11;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<IRHistoryEventDO | date:%@ candidateIdentifier:%@ event:%@ miloPredictionEvent:%@ systemState:%@ sharingPolicy:%@>", self->_date, self->_candidateIdentifier, self->_event, self->_miloPredictionEvent, self->_systemState, self->_sharingPolicy];

  return v2;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (IREventDO)event
{
  return self->_event;
}

- (IRMiLoPredictionEventDO)miloPredictionEvent
{
  return self->_miloPredictionEvent;
}

- (IRSystemStateDO)systemState
{
  return self->_systemState;
}

- (NSString)sharingPolicy
{
  return self->_sharingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingPolicy, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_miloPredictionEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end