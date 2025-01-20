@interface FUFlightStep
+ (BOOL)supportsSecureCoding;
- (BOOL)departure;
- (BOOL)isEqual:(id)a3;
- (BOOL)taxiing;
- (FUAirport)airport;
- (FUFlightStep)initWithCoder:(id)a3;
- (FUStepTime)actualTime;
- (FUStepTime)estimatedTime;
- (FUStepTime)plannedTime;
- (FUStepTime)runwayTime;
- (FUStepTime)scheduledTime;
- (FUStepTime)time;
- (NSNumber)delayFromSchedule;
- (NSString)gate;
- (NSString)terminal;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)legStatus;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setActualTime:(id)a3;
- (void)setAirport:(id)a3;
- (void)setDelayFromSchedule:(id)a3;
- (void)setDeparture:(BOOL)a3;
- (void)setEstimatedTime:(id)a3;
- (void)setGate:(id)a3;
- (void)setLegStatus:(int64_t)a3;
- (void)setPlannedTime:(id)a3;
- (void)setRunwayTime:(id)a3;
- (void)setScheduledTime:(id)a3;
- (void)setTerminal:(id)a3;
@end

@implementation FUFlightStep

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(FUFlightStep *)self airport];
    v6 = [v4 airport];
    if (v5 != v6)
    {
      v7 = [(FUFlightStep *)self airport];
      v8 = [v4 airport];
      if (![v7 isEqual:v8])
      {
        LOBYTE(v9) = 0;
        goto LABEL_52;
      }
      v64 = v8;
      v65 = v7;
    }
    v10 = [(FUFlightStep *)self gate];
    v11 = [v4 gate];
    if (v10 != v11)
    {
      v12 = [(FUFlightStep *)self gate];
      v13 = [v4 gate];
      if (![v12 isEqual:v13])
      {
        LOBYTE(v9) = 0;
LABEL_50:

LABEL_51:
        v8 = v64;
        v7 = v65;
        if (v5 == v6)
        {
LABEL_53:

          goto LABEL_54;
        }
LABEL_52:

        goto LABEL_53;
      }
      v62 = v13;
      v63 = v12;
    }
    v14 = [(FUFlightStep *)self terminal];
    v15 = [v4 terminal];
    if (v14 != v15)
    {
      v16 = [(FUFlightStep *)self terminal];
      v61 = [v4 terminal];
      if (!objc_msgSend(v16, "isEqual:"))
      {
        LOBYTE(v9) = 0;
        goto LABEL_48;
      }
      v60 = v16;
    }
    int64_t v17 = [(FUFlightStep *)self legStatus];
    if (v17 == [v4 legStatus])
    {
      v59 = v14;
      v18 = [(FUFlightStep *)self delayFromSchedule];
      uint64_t v19 = [v4 delayFromSchedule];
      v20 = (void *)v19;
      if (v18 == (void *)v19)
      {
        v55 = (void *)v19;
        v56 = v18;
      }
      else
      {
        v21 = [(FUFlightStep *)self delayFromSchedule];
        v53 = [v4 delayFromSchedule];
        v54 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          LOBYTE(v9) = 0;
          v16 = v60;
LABEL_46:

LABEL_47:
          v14 = v59;
          if (v59 == v15) {
            goto LABEL_49;
          }
          goto LABEL_48;
        }
        v55 = v20;
        v56 = v18;
      }
      uint64_t v22 = [(FUFlightStep *)self actualTime];
      [v4 actualTime];
      v58 = v57 = (void *)v22;
      v16 = v60;
      if ((void *)v22 != v58)
      {
        v23 = [(FUFlightStep *)self actualTime];
        v51 = [v4 actualTime];
        v52 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          LOBYTE(v9) = 0;
LABEL_44:

LABEL_45:
          v20 = v55;
          v18 = v56;
          if (v56 == v55) {
            goto LABEL_47;
          }
          goto LABEL_46;
        }
      }
      uint64_t v24 = [(FUFlightStep *)self scheduledTime];
      uint64_t v25 = [v4 scheduledTime];
      v50 = (void *)v24;
      BOOL v26 = v24 == v25;
      v27 = (void *)v25;
      if (v26)
      {
        v29 = (void *)v25;
      }
      else
      {
        v28 = [(FUFlightStep *)self scheduledTime];
        v48 = [v4 scheduledTime];
        v49 = v28;
        if (!objc_msgSend(v28, "isEqual:"))
        {
          LOBYTE(v9) = 0;
          v34 = v50;
LABEL_42:

LABEL_43:
          if (v57 == v58) {
            goto LABEL_45;
          }
          goto LABEL_44;
        }
        v29 = v27;
      }
      uint64_t v30 = [(FUFlightStep *)self runwayTime];
      uint64_t v45 = [v4 runwayTime];
      v46 = (void *)v30;
      v47 = v29;
      if (v30 != v45)
      {
        v31 = [(FUFlightStep *)self runwayTime];
        v42 = [v4 runwayTime];
        v43 = v31;
        if (!objc_msgSend(v31, "isEqual:"))
        {
          LOBYTE(v9) = 0;
          v33 = (void *)v45;
          v32 = v46;
          goto LABEL_40;
        }
      }
      v35 = [(FUFlightStep *)self estimatedTime];
      v44 = [v4 estimatedTime];
      if (v35 == v44
        || ([(FUFlightStep *)self estimatedTime],
            v36 = objc_claimAutoreleasedReturnValue(),
            [v4 estimatedTime],
            v39 = objc_claimAutoreleasedReturnValue(),
            v40 = v36,
            objc_msgSend(v36, "isEqual:")))
      {
        BOOL v37 = [(FUFlightStep *)self departure];
        int v9 = v37 ^ [v4 departure] ^ 1;
        if (v35 == v44)
        {

          v33 = (void *)v45;
          v32 = v46;
          v16 = v60;
          if (v46 == (void *)v45)
          {
LABEL_41:

            v34 = v50;
            v27 = v47;
            if (v50 == v47) {
              goto LABEL_43;
            }
            goto LABEL_42;
          }
LABEL_40:

          goto LABEL_41;
        }
        v41 = v35;
        v16 = v60;
      }
      else
      {
        v41 = v35;
        LOBYTE(v9) = 0;
      }
      v33 = (void *)v45;
      v32 = v46;

      if (v46 == (void *)v45) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
    LOBYTE(v9) = 0;
    v16 = v60;
    if (v14 == v15)
    {
LABEL_49:

      v13 = v62;
      v12 = v63;
      if (v10 == v11) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
LABEL_48:

    goto LABEL_49;
  }
  LOBYTE(v9) = 0;
LABEL_54:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDeparture:", -[FUFlightStep departure](self, "departure"));
  v5 = [(FUFlightStep *)self airport];
  v6 = (void *)[v5 copy];
  [v4 setAirport:v6];

  v7 = [(FUFlightStep *)self gate];
  v8 = (void *)[v7 copy];
  [v4 setGate:v8];

  int v9 = [(FUFlightStep *)self terminal];
  v10 = (void *)[v9 copy];
  [v4 setTerminal:v10];

  objc_msgSend(v4, "setLegStatus:", -[FUFlightStep legStatus](self, "legStatus"));
  v11 = [(FUFlightStep *)self actualTime];
  v12 = (void *)[v11 copy];
  [v4 setActualTime:v12];

  v13 = [(FUFlightStep *)self scheduledTime];
  v14 = (void *)[v13 copy];
  [v4 setScheduledTime:v14];

  v15 = [(FUFlightStep *)self plannedTime];
  v16 = (void *)[v15 copy];
  [v4 setPlannedTime:v16];

  int64_t v17 = [(FUFlightStep *)self estimatedTime];
  v18 = (void *)[v17 copy];
  [v4 setEstimatedTime:v18];

  uint64_t v19 = [(FUFlightStep *)self runwayTime];
  v20 = (void *)[v19 copy];
  [v4 setRunwayTime:v20];

  return v4;
}

- (BOOL)taxiing
{
  if (self->_departure)
  {
    if (self->_actualTime)
    {
      uint64_t v2 = 80;
      return *(Class *)((char *)&self->super.isa + v2) == 0;
    }
  }
  else if (self->_runwayTime)
  {
    uint64_t v2 = 72;
    return *(Class *)((char *)&self->super.isa + v2) == 0;
  }
  return 0;
}

- (FUStepTime)time
{
  actualTime = self->_actualTime;
  if (actualTime) {
    goto LABEL_2;
  }
  estimatedTime = self->_estimatedTime;
  if (!estimatedTime)
  {
    actualTime = self->_scheduledTime;
    goto LABEL_2;
  }
  if (!self->_departure)
  {
LABEL_14:
    v3 = estimatedTime;
    goto LABEL_3;
  }
  v8 = [(FUStepTime *)estimatedTime date];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  if (v10 >= 0.0)
  {
    estimatedTime = self->_estimatedTime;
    goto LABEL_14;
  }
  actualTime = self->_runwayTime;
  if (actualTime)
  {
LABEL_2:
    v3 = actualTime;
LABEL_3:
    id v4 = v3;
    goto LABEL_4;
  }
  v11 = [FUStepTime alloc];
  v12 = [MEMORY[0x263EFF910] date];
  id v4 = [(FUStepTime *)v11 initWithType:3 date:v12];

LABEL_4:
  return v4;
}

- (void)setDelayFromSchedule:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && ([v4 doubleValue], id v4 = v8, fabs(v5) < 900.0))
  {
    delayFromSchedule = self->_delayFromSchedule;
    self->_delayFromSchedule = (NSNumber *)&unk_26D1C4098;
  }
  else
  {
    v7 = (NSNumber *)v4;
    delayFromSchedule = self->_delayFromSchedule;
    self->_delayFromSchedule = v7;
  }
}

- (NSNumber)delayFromSchedule
{
  if (self->_scheduledTime && !self->_delayFromSchedule && (self->_actualTime || self->_estimatedTime))
  {
    v3 = NSNumber;
    id v4 = [(FUFlightStep *)self time];
    double v5 = [v4 date];
    v6 = [(FUStepTime *)self->_scheduledTime date];
    [v5 timeIntervalSinceDate:v6];
    v7 = objc_msgSend(v3, "numberWithDouble:");
    [(FUFlightStep *)self setDelayFromSchedule:v7];
  }
  delayFromSchedule = self->_delayFromSchedule;
  return delayFromSchedule;
}

- (unint64_t)status
{
  uint64_t v2 = [(FUFlightStep *)self delayFromSchedule];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 integerValue];
    uint64_t v5 = 3;
    if (v4) {
      uint64_t v5 = 4;
    }
    if (v4 >= 0) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 2;
    }
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(FUFlightStep *)self gate];
  uint64_t v5 = [(FUFlightStep *)self terminal];
  unint64_t v6 = [v3 stringWithFormat:@"FlightEvent: gate:%@, airportTerminal:%@", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  uint64_t v4 = [(FUFlightStep *)self airport];

  if (v4)
  {
    uint64_t v5 = [(FUFlightStep *)self airport];
    [v22 encodeObject:v5 forKey:@"airport"];
  }
  unint64_t v6 = [(FUFlightStep *)self gate];

  if (v6)
  {
    v7 = [(FUFlightStep *)self gate];
    [v22 encodeObject:v7 forKey:@"gate"];
  }
  id v8 = [(FUFlightStep *)self terminal];

  if (v8)
  {
    double v9 = [(FUFlightStep *)self terminal];
    [v22 encodeObject:v9 forKey:@"terminal"];
  }
  objc_msgSend(v22, "encodeInteger:forKey:", -[FUFlightStep legStatus](self, "legStatus"), @"legStatus");
  double v10 = [(FUFlightStep *)self delayFromSchedule];

  if (v10)
  {
    v11 = [(FUFlightStep *)self delayFromSchedule];
    [v22 encodeObject:v11 forKey:@"delayFromSchedule"];
  }
  v12 = [(FUFlightStep *)self actualTime];

  if (v12)
  {
    v13 = [(FUFlightStep *)self actualTime];
    [v22 encodeObject:v13 forKey:@"actualTime"];
  }
  v14 = [(FUFlightStep *)self scheduledTime];

  if (v14)
  {
    v15 = [(FUFlightStep *)self scheduledTime];
    [v22 encodeObject:v15 forKey:@"scheduledTime"];
  }
  v16 = [(FUFlightStep *)self plannedTime];

  if (v16)
  {
    int64_t v17 = [(FUFlightStep *)self plannedTime];
    [v22 encodeObject:v17 forKey:@"plannedTime"];
  }
  v18 = [(FUFlightStep *)self estimatedTime];

  if (v18)
  {
    uint64_t v19 = [(FUFlightStep *)self estimatedTime];
    [v22 encodeObject:v19 forKey:@"estimatedTime"];
  }
  v20 = [(FUFlightStep *)self runwayTime];

  if (v20)
  {
    v21 = [(FUFlightStep *)self runwayTime];
    [v22 encodeObject:v21 forKey:@"runwayTime"];
  }
  objc_msgSend(v22, "encodeBool:forKey:", -[FUFlightStep departure](self, "departure"), @"departure");
}

- (FUFlightStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FUFlightStep;
  uint64_t v5 = [(FUFlightStep *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"airport"];
    airport = v5->_airport;
    v5->_airport = (FUAirport *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gate"];
    gate = v5->_gate;
    v5->_gate = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"terminal"];
    terminal = v5->_terminal;
    v5->_terminal = (NSString *)v10;

    v5->_legStatus = [v4 decodeIntegerForKey:@"legStatus"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delayFromSchedule"];
    delayFromSchedule = v5->_delayFromSchedule;
    v5->_delayFromSchedule = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actualTime"];
    actualTime = v5->_actualTime;
    v5->_actualTime = (FUStepTime *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduledTime"];
    scheduledTime = v5->_scheduledTime;
    v5->_scheduledTime = (FUStepTime *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plannedTime"];
    plannedTime = v5->_plannedTime;
    v5->_plannedTime = (FUStepTime *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedTime"];
    estimatedTime = v5->_estimatedTime;
    v5->_estimatedTime = (FUStepTime *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runwayTime"];
    runwayTime = v5->_runwayTime;
    v5->_runwayTime = (FUStepTime *)v22;

    v5->_departure = [v4 decodeBoolForKey:@"departure"];
    uint64_t v24 = v5;
  }

  return v5;
}

- (FUAirport)airport
{
  return (FUAirport *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAirport:(id)a3
{
}

- (NSString)gate
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGate:(id)a3
{
}

- (NSString)terminal
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTerminal:(id)a3
{
}

- (int64_t)legStatus
{
  return self->_legStatus;
}

- (void)setLegStatus:(int64_t)a3
{
  self->_legStatus = a3;
}

- (FUStepTime)scheduledTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScheduledTime:(id)a3
{
}

- (FUStepTime)estimatedTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEstimatedTime:(id)a3
{
}

- (FUStepTime)actualTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActualTime:(id)a3
{
}

- (FUStepTime)runwayTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRunwayTime:(id)a3
{
}

- (BOOL)departure
{
  return self->_departure;
}

- (void)setDeparture:(BOOL)a3
{
  self->_departure = a3;
}

- (FUStepTime)plannedTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPlannedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plannedTime, 0);
  objc_storeStrong((id *)&self->_runwayTime, 0);
  objc_storeStrong((id *)&self->_actualTime, 0);
  objc_storeStrong((id *)&self->_estimatedTime, 0);
  objc_storeStrong((id *)&self->_scheduledTime, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_airport, 0);
  objc_storeStrong((id *)&self->_delayFromSchedule, 0);
}

@end