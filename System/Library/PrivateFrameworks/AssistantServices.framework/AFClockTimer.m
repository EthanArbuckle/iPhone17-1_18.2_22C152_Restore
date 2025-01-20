@interface AFClockTimer
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFClockTimer)init;
- (AFClockTimer)initWithBuilder:(id)a3;
- (AFClockTimer)initWithCoder:(id)a3;
- (AFClockTimer)initWithDictionaryRepresentation:(id)a3;
- (AFClockTimer)initWithTimerID:(id)a3 timerURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 state:(int64_t)a7 duration:(double)a8 type:(int64_t)a9 fireTimeInterval:(double)a10 fireDate:(id)a11 firedDate:(id)a12 dismissedDate:(id)a13 lastModifiedDate:(id)a14;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFiring;
- (NSDate)dismissedDate;
- (NSDate)fireDate;
- (NSDate)firedDate;
- (NSDate)lastModifiedDate;
- (NSString)description;
- (NSString)title;
- (NSURL)timerURL;
- (NSUUID)timerID;
- (double)duration;
- (double)fireTimeInterval;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)state;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFClockTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timerURL, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (double)fireTimeInterval
{
  return self->_fireTimeInterval;
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isFiring
{
  return self->_isFiring;
}

- (NSURL)timerURL
{
  return self->_timerURL;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  timerID = self->_timerID;
  if (timerID) {
    [v3 setObject:timerID forKey:@"timerID"];
  }
  timerURL = self->_timerURL;
  if (timerURL) {
    [v4 setObject:timerURL forKey:@"timerURL"];
  }
  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFiring];
  [v4 setObject:v7 forKey:@"isFiring"];

  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  unint64_t state = self->_state;
  if (state > 3) {
    v10 = @"(unknown)";
  }
  else {
    v10 = off_1E59287B8[state];
  }
  v11 = v10;
  [v4 setObject:v11 forKey:@"state"];

  v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_duration];
  [v4 setObject:v12 forKey:@"duration"];

  unint64_t type = self->_type;
  if (type > 2) {
    v14 = @"(unknown)";
  }
  else {
    v14 = off_1E592C540[type];
  }
  v15 = v14;
  [v4 setObject:v15 forKey:@"type"];

  v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_fireTimeInterval];
  [v4 setObject:v16 forKey:@"fireTimeInterval"];

  fireDate = self->_fireDate;
  if (fireDate) {
    [v4 setObject:fireDate forKey:@"fireDate"];
  }
  firedDate = self->_firedDate;
  if (firedDate) {
    [v4 setObject:firedDate forKey:@"firedDate"];
  }
  dismissedDate = self->_dismissedDate;
  if (dismissedDate) {
    [v4 setObject:dismissedDate forKey:@"dismissedDate"];
  }
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate) {
    [v4 setObject:lastModifiedDate forKey:@"lastModifiedDate"];
  }
  v21 = (void *)[v4 copy];

  return v21;
}

- (AFClockTimer)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"timerID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v6;
    }
    else {
      id v36 = 0;
    }

    v8 = [v5 objectForKey:@"timerURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v35 = v8;
    }
    else {
      id v35 = 0;
    }

    v9 = [v5 objectForKey:@"isFiring"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    unsigned int v34 = [v10 BOOLValue];
    v11 = [v5 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v13 = [v5 objectForKey:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v33 = AFClockTimerStateGetFromName(v13);
    }
    else {
      uint64_t v33 = 0;
    }

    v14 = [v5 objectForKey:@"duration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    [v15 doubleValue];
    double v17 = v16;

    v18 = [v5 objectForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = AFClockTimerTypeGetFromName(v18);
    }
    else {
      uint64_t v19 = 0;
    }

    v20 = [v5 objectForKey:@"fireTimeInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    [v21 doubleValue];
    double v23 = v22;

    v24 = [v5 objectForKey:@"fireDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    v26 = [v5 objectForKey:@"firedDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    v28 = [v5 objectForKey:@"dismissedDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }

    v30 = [v5 objectForKey:@"lastModifiedDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }

    self = [(AFClockTimer *)self initWithTimerID:v36 timerURL:v35 isFiring:v34 title:v12 state:v33 duration:v19 type:v17 fireTimeInterval:v23 fireDate:v25 firedDate:v27 dismissedDate:v29 lastModifiedDate:v31];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  timerID = self->_timerID;
  id v10 = a3;
  [v10 encodeObject:timerID forKey:@"AFClockTimer::timerID"];
  [v10 encodeObject:self->_timerURL forKey:@"AFClockTimer::timerURL"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFiring];
  [v10 encodeObject:v5 forKey:@"AFClockTimer::isFiring"];

  [v10 encodeObject:self->_title forKey:@"AFClockTimer::title"];
  v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_state];
  [v10 encodeObject:v6 forKey:@"AFClockTimer::state"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_duration];
  [v10 encodeObject:v7 forKey:@"AFClockTimer::duration"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_type];
  [v10 encodeObject:v8 forKey:@"AFClockTimer::type"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_fireTimeInterval];
  [v10 encodeObject:v9 forKey:@"AFClockTimer::fireTimeInterval"];

  [v10 encodeObject:self->_fireDate forKey:@"AFClockTimer::fireDate"];
  [v10 encodeObject:self->_firedDate forKey:@"AFClockTimer::firedDate"];
  [v10 encodeObject:self->_dismissedDate forKey:@"AFClockTimer::dismissedDate"];
  [v10 encodeObject:self->_lastModifiedDate forKey:@"AFClockTimer::lastModifiedDate"];
}

- (AFClockTimer)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::timerID"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::timerURL"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::isFiring"];
  unsigned int v24 = [v6 BOOLValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::title"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::state"];
  uint64_t v9 = [v8 integerValue];

  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::duration"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::type"];
  uint64_t v14 = [v13 integerValue];

  id v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::fireTimeInterval"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::fireDate"];
  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::firedDate"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::dismissedDate"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimer::lastModifiedDate"];

  double v22 = [(AFClockTimer *)self initWithTimerID:v4 timerURL:v5 isFiring:v24 title:v7 state:v9 duration:v14 type:v12 fireTimeInterval:v17 fireDate:v18 firedDate:v19 dismissedDate:v20 lastModifiedDate:v21];
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFClockTimer *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isFiring = self->_isFiring;
      if (isFiring == [(AFClockTimer *)v5 isFiring]
        && (int64_t state = self->_state, state == [(AFClockTimer *)v5 state])
        && (double duration = self->_duration, [(AFClockTimer *)v5 duration], duration == v9)
        && (int64_t type = self->_type, type == [(AFClockTimer *)v5 type])
        && (double fireTimeInterval = self->_fireTimeInterval,
            [(AFClockTimer *)v5 fireTimeInterval],
            fireTimeInterval == v12))
      {
        id v15 = [(AFClockTimer *)v5 timerID];
        timerID = self->_timerID;
        if (timerID == v15 || [(NSUUID *)timerID isEqual:v15])
        {
          double v17 = [(AFClockTimer *)v5 timerURL];
          timerURL = self->_timerURL;
          if (timerURL == v17 || [(NSURL *)timerURL isEqual:v17])
          {
            uint64_t v19 = [(AFClockTimer *)v5 title];
            title = self->_title;
            if (title == v19 || [(NSString *)title isEqual:v19])
            {
              id v21 = [(AFClockTimer *)v5 fireDate];
              fireDate = self->_fireDate;
              if (fireDate == v21 || [(NSDate *)fireDate isEqual:v21])
              {
                double v23 = [(AFClockTimer *)v5 firedDate];
                firedDate = self->_firedDate;
                if (firedDate == v23 || [(NSDate *)firedDate isEqual:v23])
                {
                  id v25 = [(AFClockTimer *)v5 dismissedDate];
                  dismissedDate = self->_dismissedDate;
                  if (dismissedDate == v25 || [(NSDate *)dismissedDate isEqual:v25])
                  {
                    id v27 = [(AFClockTimer *)v5 lastModifiedDate];
                    lastModifiedDate = self->_lastModifiedDate;
                    BOOL v13 = lastModifiedDate == v27 || [(NSDate *)lastModifiedDate isEqual:v27];
                  }
                  else
                  {
                    BOOL v13 = 0;
                  }
                }
                else
                {
                  BOOL v13 = 0;
                }
              }
              else
              {
                BOOL v13 = 0;
              }
            }
            else
            {
              BOOL v13 = 0;
            }
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_timerID hash];
  uint64_t v4 = [(NSURL *)self->_timerURL hash] ^ v3;
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFiring];
  uint64_t v6 = [v5 hash];
  NSUInteger v7 = v4 ^ [(NSString *)self->_title hash] ^ v6;
  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_state];
  uint64_t v9 = [v8 hash];
  id v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_duration];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  double v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_type];
  uint64_t v13 = [v12 hash];
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_fireTimeInterval];
  uint64_t v15 = v13 ^ [v14 hash];
  uint64_t v16 = v11 ^ v15 ^ [(NSDate *)self->_fireDate hash];
  uint64_t v17 = [(NSDate *)self->_firedDate hash];
  uint64_t v18 = v17 ^ [(NSDate *)self->_dismissedDate hash];
  unint64_t v19 = v16 ^ v18 ^ [(NSDate *)self->_lastModifiedDate hash];

  return v19;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v20.receiver = self;
  v20.super_class = (Class)AFClockTimer;
  v5 = [(AFClockTimer *)&v20 description];
  unint64_t state = self->_state;
  if (state > 3) {
    NSUInteger v7 = @"(unknown)";
  }
  else {
    NSUInteger v7 = off_1E59287B8[state];
  }
  timerID = self->_timerID;
  timerURL = self->_timerURL;
  BOOL isFiring = self->_isFiring;
  title = self->_title;
  double v12 = v7;
  double duration = self->_duration;
  unint64_t type = self->_type;
  if (type > 2) {
    uint64_t v15 = @"(unknown)";
  }
  else {
    uint64_t v15 = off_1E592C540[type];
  }
  if (isFiring) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  uint64_t v17 = v15;
  v18 = (void *)[v4 initWithFormat:@"%@ {timerID = %@, timerURL = %@, isFiring = %@, title = %@, unint64_t state = %@, duration = %f, type = %@, fireTimeInterval = %f, fireDate = %@, firedDate = %@, dismissedDate = %@, lastModifiedDate = %@}", v5, timerID, timerURL, v16, title, v12, *(void *)&duration, v17, *(void *)&self->_fireTimeInterval, self->_fireDate, self->_firedDate, self->_dismissedDate, self->_lastModifiedDate];

  return v18;
}

- (NSString)description
{
  return (NSString *)[(AFClockTimer *)self _descriptionWithIndent:0];
}

- (AFClockTimer)initWithTimerID:(id)a3 timerURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 state:(int64_t)a7 duration:(double)a8 type:(int64_t)a9 fireTimeInterval:(double)a10 fireDate:(id)a11 firedDate:(id)a12 dismissedDate:(id)a13 lastModifiedDate:(id)a14
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __143__AFClockTimer_initWithTimerID_timerURL_isFiring_title_state_duration_type_fireTimeInterval_fireDate_firedDate_dismissedDate_lastModifiedDate___block_invoke;
  v38[3] = &unk_1E5925BF0;
  id v39 = v20;
  id v40 = v21;
  BOOL v50 = a5;
  double v47 = a8;
  int64_t v48 = a9;
  double v49 = a10;
  id v41 = v22;
  id v42 = v23;
  id v43 = v24;
  id v44 = v25;
  id v45 = v26;
  int64_t v46 = a7;
  id v27 = v26;
  id v28 = v25;
  id v29 = v24;
  id v30 = v23;
  id v31 = v22;
  id v32 = v21;
  id v33 = v20;
  unsigned int v34 = [(AFClockTimer *)self initWithBuilder:v38];

  return v34;
}

void __143__AFClockTimer_initWithTimerID_timerURL_isFiring_title_state_duration_type_fireTimeInterval_fireDate_firedDate_dismissedDate_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTimerID:v3];
  [v4 setTimerURL:*(void *)(a1 + 40)];
  [v4 setIsFiring:*(unsigned __int8 *)(a1 + 120)];
  [v4 setTitle:*(void *)(a1 + 48)];
  [v4 setState:*(void *)(a1 + 88)];
  [v4 setDuration:*(double *)(a1 + 96)];
  [v4 setType:*(void *)(a1 + 104)];
  [v4 setFireTimeInterval:*(double *)(a1 + 112)];
  [v4 setFireDate:*(void *)(a1 + 56)];
  [v4 setFiredDate:*(void *)(a1 + 64)];
  [v4 setDismissedDate:*(void *)(a1 + 72)];
  [v4 setLastModifiedDate:*(void *)(a1 + 80)];
}

- (AFClockTimer)init
{
  return [(AFClockTimer *)self initWithBuilder:0];
}

- (AFClockTimer)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFClockTimerMutation *))a3;
  v32.receiver = self;
  v32.super_class = (Class)AFClockTimer;
  v5 = [(AFClockTimer *)&v32 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFClockTimerMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFClockTimerMutation *)v7 isDirty])
    {
      v8 = [(_AFClockTimerMutation *)v7 getTimerID];
      uint64_t v9 = [v8 copy];
      timerID = v6->_timerID;
      v6->_timerID = (NSUUID *)v9;

      uint64_t v11 = [(_AFClockTimerMutation *)v7 getTimerURL];
      uint64_t v12 = [v11 copy];
      timerURL = v6->_timerURL;
      v6->_timerURL = (NSURL *)v12;

      v6->_BOOL isFiring = [(_AFClockTimerMutation *)v7 getIsFiring];
      uint64_t v14 = [(_AFClockTimerMutation *)v7 getTitle];
      uint64_t v15 = [v14 copy];
      title = v6->_title;
      v6->_title = (NSString *)v15;

      v6->_unint64_t state = [(_AFClockTimerMutation *)v7 getState];
      [(_AFClockTimerMutation *)v7 getDuration];
      v6->_double duration = v17;
      v6->_unint64_t type = [(_AFClockTimerMutation *)v7 getType];
      [(_AFClockTimerMutation *)v7 getFireTimeInterval];
      v6->_double fireTimeInterval = v18;
      unint64_t v19 = [(_AFClockTimerMutation *)v7 getFireDate];
      uint64_t v20 = [v19 copy];
      fireDate = v6->_fireDate;
      v6->_fireDate = (NSDate *)v20;

      id v22 = [(_AFClockTimerMutation *)v7 getFiredDate];
      uint64_t v23 = [v22 copy];
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v23;

      id v25 = [(_AFClockTimerMutation *)v7 getDismissedDate];
      uint64_t v26 = [v25 copy];
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v26;

      id v28 = [(_AFClockTimerMutation *)v7 getLastModifiedDate];
      uint64_t v29 = [v28 copy];
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v29;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFClockTimerMutation *))a3;
  if (v4)
  {
    v5 = [[_AFClockTimerMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFClockTimerMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFClockTimer);
      NSUInteger v7 = [(_AFClockTimerMutation *)v5 getTimerID];
      uint64_t v8 = [v7 copy];
      timerID = v6->_timerID;
      v6->_timerID = (NSUUID *)v8;

      id v10 = [(_AFClockTimerMutation *)v5 getTimerURL];
      uint64_t v11 = [v10 copy];
      timerURL = v6->_timerURL;
      v6->_timerURL = (NSURL *)v11;

      v6->_BOOL isFiring = [(_AFClockTimerMutation *)v5 getIsFiring];
      uint64_t v13 = [(_AFClockTimerMutation *)v5 getTitle];
      uint64_t v14 = [v13 copy];
      title = v6->_title;
      v6->_title = (NSString *)v14;

      v6->_unint64_t state = [(_AFClockTimerMutation *)v5 getState];
      [(_AFClockTimerMutation *)v5 getDuration];
      v6->_double duration = v16;
      v6->_unint64_t type = [(_AFClockTimerMutation *)v5 getType];
      [(_AFClockTimerMutation *)v5 getFireTimeInterval];
      v6->_double fireTimeInterval = v17;
      double v18 = [(_AFClockTimerMutation *)v5 getFireDate];
      uint64_t v19 = [v18 copy];
      fireDate = v6->_fireDate;
      v6->_fireDate = (NSDate *)v19;

      id v21 = [(_AFClockTimerMutation *)v5 getFiredDate];
      uint64_t v22 = [v21 copy];
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v22;

      id v24 = [(_AFClockTimerMutation *)v5 getDismissedDate];
      uint64_t v25 = [v24 copy];
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v25;

      id v27 = [(_AFClockTimerMutation *)v5 getLastModifiedDate];
      uint64_t v28 = [v27 copy];
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v28;
    }
    else
    {
      uint64_t v6 = (AFClockTimer *)[(AFClockTimer *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFClockTimer *)[(AFClockTimer *)self copy];
  }

  return v6;
}

@end