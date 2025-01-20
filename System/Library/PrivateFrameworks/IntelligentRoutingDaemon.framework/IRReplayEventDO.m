@interface IRReplayEventDO
+ (BOOL)supportsSecureCoding;
+ (id)replayEventDOWithDate:(id)a3 contextChangeReason:(id)a4 candidatesContainer:(id)a5 miloLslPrediction:(id)a6 systemState:(id)a7 nearbyDeviceContainerDO:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReplayEventDO:(id)a3;
- (IRCandidatesContainerDO)candidatesContainer;
- (IRMiloLslPredictionDO)miloLslPrediction;
- (IRNearbyDeviceContainerDO)nearbyDeviceContainerDO;
- (IRReplayEventDO)initWithCoder:(id)a3;
- (IRReplayEventDO)initWithDate:(id)a3 contextChangeReason:(id)a4 candidatesContainer:(id)a5 miloLslPrediction:(id)a6 systemState:(id)a7 nearbyDeviceContainerDO:(id)a8;
- (IRSystemStateDO)systemState;
- (NSDate)date;
- (NSString)contextChangeReason;
- (id)copyWithReplacementCandidatesContainer:(id)a3;
- (id)copyWithReplacementContextChangeReason:(id)a3;
- (id)copyWithReplacementDate:(id)a3;
- (id)copyWithReplacementMiloLslPrediction:(id)a3;
- (id)copyWithReplacementNearbyDeviceContainerDO:(id)a3;
- (id)copyWithReplacementSystemState:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRReplayEventDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDeviceContainerDO, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_miloLslPrediction, 0);
  objc_storeStrong((id *)&self->_candidatesContainer, 0);
  objc_storeStrong((id *)&self->_contextChangeReason, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (NSDate)date
{
  return self->_date;
}

- (IRSystemStateDO)systemState
{
  return self->_systemState;
}

- (IRNearbyDeviceContainerDO)nearbyDeviceContainerDO
{
  return self->_nearbyDeviceContainerDO;
}

- (IRMiloLslPredictionDO)miloLslPrediction
{
  return self->_miloLslPrediction;
}

- (NSString)contextChangeReason
{
  return self->_contextChangeReason;
}

- (IRCandidatesContainerDO)candidatesContainer
{
  return self->_candidatesContainer;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_date hash];
  NSUInteger v4 = [(NSString *)self->_contextChangeReason hash] - v3 + 32 * v3;
  unint64_t v5 = [(IRCandidatesContainerDO *)self->_candidatesContainer hash] - v4 + 32 * v4;
  unint64_t v6 = [(IRMiloLslPredictionDO *)self->_miloLslPrediction hash] - v5 + 32 * v5;
  unint64_t v7 = [(IRSystemStateDO *)self->_systemState hash] - v6 + 32 * v6;
  return [(IRNearbyDeviceContainerDO *)self->_nearbyDeviceContainerDO hash] - v7 + 32 * v7;
}

- (IRReplayEventDO)initWithDate:(id)a3 contextChangeReason:(id)a4 candidatesContainer:(id)a5 miloLslPrediction:(id)a6 systemState:(id)a7 nearbyDeviceContainerDO:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IRReplayEventDO;
  v18 = [(IRReplayEventDO *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_date, a3);
    objc_storeStrong((id *)&v19->_contextChangeReason, a4);
    objc_storeStrong((id *)&v19->_candidatesContainer, a5);
    objc_storeStrong((id *)&v19->_miloLslPrediction, a6);
    objc_storeStrong((id *)&v19->_systemState, a7);
    objc_storeStrong((id *)&v19->_nearbyDeviceContainerDO, a8);
  }

  return v19;
}

- (BOOL)isEqualToReplayEventDO:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_20;
  }
  int v6 = self->_date != 0;
  unint64_t v7 = [v4 date];
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
  int v12 = self->_contextChangeReason != 0;
  v13 = [v5 contextChangeReason];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_20;
  }
  contextChangeReason = self->_contextChangeReason;
  if (contextChangeReason)
  {
    id v16 = [v5 contextChangeReason];
    int v17 = [(NSString *)contextChangeReason isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  int v18 = self->_candidatesContainer != 0;
  v19 = [v5 candidatesContainer];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_20;
  }
  candidatesContainer = self->_candidatesContainer;
  if (candidatesContainer)
  {
    id v22 = [v5 candidatesContainer];
    BOOL v23 = [(IRCandidatesContainerDO *)candidatesContainer isEqual:v22];

    if (!v23) {
      goto LABEL_20;
    }
  }
  int v24 = self->_miloLslPrediction != 0;
  v25 = [v5 miloLslPrediction];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_20;
  }
  miloLslPrediction = self->_miloLslPrediction;
  if (miloLslPrediction)
  {
    v28 = [v5 miloLslPrediction];
    BOOL v29 = [(IRMiloLslPredictionDO *)miloLslPrediction isEqual:v28];

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
  int v36 = self->_nearbyDeviceContainerDO != 0;
  v37 = [v5 nearbyDeviceContainerDO];
  int v38 = v37 == 0;

  if (v36 == v38)
  {
LABEL_20:
    char v41 = 0;
  }
  else
  {
    nearbyDeviceContainerDO = self->_nearbyDeviceContainerDO;
    if (nearbyDeviceContainerDO)
    {
      v40 = [v5 nearbyDeviceContainerDO];
      char v41 = [(IRNearbyDeviceContainerDO *)nearbyDeviceContainerDO isEqual:v40];
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
  id v4 = (IRReplayEventDO *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRReplayEventDO *)self isEqualToReplayEventDO:v5];

  return v6;
}

+ (id)replayEventDOWithDate:(id)a3 contextChangeReason:(id)a4 candidatesContainer:(id)a5 miloLslPrediction:(id)a6 systemState:(id)a7 nearbyDeviceContainerDO:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  int v20 = (void *)[objc_alloc((Class)a1) initWithDate:v19 contextChangeReason:v18 candidatesContainer:v17 miloLslPrediction:v16 systemState:v15 nearbyDeviceContainerDO:v14];

  return v20;
}

- (id)copyWithReplacementDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:v4 contextChangeReason:self->_contextChangeReason candidatesContainer:self->_candidatesContainer miloLslPrediction:self->_miloLslPrediction systemState:self->_systemState nearbyDeviceContainerDO:self->_nearbyDeviceContainerDO];

  return v5;
}

- (id)copyWithReplacementContextChangeReason:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date contextChangeReason:v4 candidatesContainer:self->_candidatesContainer miloLslPrediction:self->_miloLslPrediction systemState:self->_systemState nearbyDeviceContainerDO:self->_nearbyDeviceContainerDO];

  return v5;
}

- (id)copyWithReplacementCandidatesContainer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date contextChangeReason:self->_contextChangeReason candidatesContainer:v4 miloLslPrediction:self->_miloLslPrediction systemState:self->_systemState nearbyDeviceContainerDO:self->_nearbyDeviceContainerDO];

  return v5;
}

- (id)copyWithReplacementMiloLslPrediction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date contextChangeReason:self->_contextChangeReason candidatesContainer:self->_candidatesContainer miloLslPrediction:v4 systemState:self->_systemState nearbyDeviceContainerDO:self->_nearbyDeviceContainerDO];

  return v5;
}

- (id)copyWithReplacementSystemState:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date contextChangeReason:self->_contextChangeReason candidatesContainer:self->_candidatesContainer miloLslPrediction:self->_miloLslPrediction systemState:v4 nearbyDeviceContainerDO:self->_nearbyDeviceContainerDO];

  return v5;
}

- (id)copyWithReplacementNearbyDeviceContainerDO:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDate:self->_date contextChangeReason:self->_contextChangeReason candidatesContainer:self->_candidatesContainer miloLslPrediction:self->_miloLslPrediction systemState:self->_systemState nearbyDeviceContainerDO:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRReplayEventDO)initWithCoder:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRReplayEventDO key \"date\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v30 = *MEMORY[0x263F08320];
      v31[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRReplayEventDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_9:

LABEL_10:
      id v14 = 0;
LABEL_29:

      goto LABEL_30;
    }
LABEL_6:
    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextChangeReason"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v15 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v15);
        id v16 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v16);
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRReplayEventDO key \"contextChangeReason\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v28 = *MEMORY[0x263F08320];
        BOOL v29 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        id v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRReplayEventDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];

        goto LABEL_9;
      }
    }
    else
    {
      id v18 = [v4 error];

      if (v18) {
        goto LABEL_10;
      }
    }
    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidatesContainer"];
    if (v19 || ([v4 error], BOOL v23 = objc_claimAutoreleasedReturnValue(), v23, !v23))
    {
      int v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"miloLslPrediction"];
      if (v20
        || ([v4 error], int v24 = objc_claimAutoreleasedReturnValue(), v24, !v24))
      {
        id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemState"];
        if (v21
          || ([v4 error], v25 = objc_claimAutoreleasedReturnValue(), v25, !v25))
        {
          id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nearbyDeviceContainerDO"];
          if (v22
            || ([v4 error], int v26 = objc_claimAutoreleasedReturnValue(), v26, !v26))
          {
            self = [(IRReplayEventDO *)self initWithDate:v5 contextChangeReason:v7 candidatesContainer:v19 miloLslPrediction:v20 systemState:v21 nearbyDeviceContainerDO:v22];
            id v14 = self;
          }
          else
          {
            id v14 = 0;
          }
        }
        else
        {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }

    goto LABEL_29;
  }
  v13 = [v4 error];

  if (!v13) {
    goto LABEL_6;
  }
  id v14 = 0;
LABEL_30:

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
  contextChangeReason = self->_contextChangeReason;
  if (contextChangeReason)
  {
    [v11 encodeObject:contextChangeReason forKey:@"contextChangeReason"];
    id v4 = v11;
  }
  candidatesContainer = self->_candidatesContainer;
  if (candidatesContainer)
  {
    [v11 encodeObject:candidatesContainer forKey:@"candidatesContainer"];
    id v4 = v11;
  }
  miloLslPrediction = self->_miloLslPrediction;
  if (miloLslPrediction)
  {
    [v11 encodeObject:miloLslPrediction forKey:@"miloLslPrediction"];
    id v4 = v11;
  }
  systemState = self->_systemState;
  if (systemState)
  {
    [v11 encodeObject:systemState forKey:@"systemState"];
    id v4 = v11;
  }
  nearbyDeviceContainerDO = self->_nearbyDeviceContainerDO;
  if (nearbyDeviceContainerDO)
  {
    [v11 encodeObject:nearbyDeviceContainerDO forKey:@"nearbyDeviceContainerDO"];
    id v4 = v11;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<IRReplayEventDO | date:%@ contextChangeReason:%@ candidatesContainer:%@ miloLslPrediction:%@ systemState:%@ nearbyDeviceContainerDO:%@>", self->_date, self->_contextChangeReason, self->_candidatesContainer, self->_miloLslPrediction, self->_systemState, self->_nearbyDeviceContainerDO];

  return v2;
}

@end