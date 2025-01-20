@interface AFClockAlarmSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFClockAlarmSnapshot)init;
- (AFClockAlarmSnapshot)initWithBuilder:(id)a3;
- (AFClockAlarmSnapshot)initWithCoder:(id)a3;
- (AFClockAlarmSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFClockAlarmSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 alarmsByID:(id)a5 notifiedFiringAlarmIDs:(id)a6;
- (AFClockAlarmSnapshot)initWithSerializedBackingStore:(id)a3;
- (BOOL)hasFiringAlarms;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDictionary)alarmsByID;
- (NSOrderedSet)notifiedFiringAlarmIDs;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)firingAlarms;
- (id)mostRecentFiringAlarm;
- (id)mutatedCopyWithMutator:(id)a3;
- (id)serializedBackingStore;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFClockAlarmSnapshot

- (id)firingAlarms
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(AFClockAlarmSnapshot *)self notifiedFiringAlarmIDs];
  v5 = [(AFClockAlarmSnapshot *)self alarmsByID];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __45__AFClockAlarmSnapshot_Utility__firingAlarms__block_invoke;
  v13 = &unk_1E59275B0;
  id v14 = v4;
  id v15 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

void __45__AFClockAlarmSnapshot_Utility__firingAlarms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 isFiring] && AFClockIsFiringAlarmValid(v6))
  {
    if ([*(id *)(a1 + 32) containsObject:v5]) {
      goto LABEL_8;
    }
    id v7 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)v9 = 136315394;
    *(void *)&v9[4] = "-[AFClockAlarmSnapshot(Utility) firingAlarms]_block_invoke";
    *(_WORD *)&v9[12] = 2112;
    *(void *)&v9[14] = v6;
    v8 = "%s Alarm %@ is not in notifiedFiringAlarmIDs, but isFiring is YES.";
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    id v7 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6, *(_OWORD *)v9, *(void *)&v9[16], v10);
      goto LABEL_9;
    }
    *(_DWORD *)v9 = 136315394;
    *(void *)&v9[4] = "-[AFClockAlarmSnapshot(Utility) firingAlarms]_block_invoke";
    *(_WORD *)&v9[12] = 2112;
    *(void *)&v9[14] = v6;
    v8 = "%s Alarm %@ is in notifiedFiringAlarmIDs, but isFiring is NO.";
LABEL_11:
    _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, v8, v9, 0x16u);
    goto LABEL_8;
  }
LABEL_9:
}

- (id)mostRecentFiringAlarm
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(AFClockAlarmSnapshot *)self alarmsByID];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 isFiring] && AFClockIsFiringAlarmValid(v9))
        {
          if (v6)
          {
            uint64_t v10 = [v6 firedDate];
            uint64_t v11 = [v9 firedDate];
            if ([v10 compare:v11] == -1) {
              v12 = v9;
            }
            else {
              v12 = v6;
            }
            id v13 = v12;

            id v6 = v13;
          }
          else
          {
            id v6 = v9;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasFiringAlarms
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AFClockAlarmSnapshot *)self alarmsByID];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isFiring] && AFClockIsFiringAlarmValid(v7))
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedFiringAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSOrderedSet)notifiedFiringAlarmIDs
{
  return self->_notifiedFiringAlarmIDs;
}

- (NSDictionary)alarmsByID
{
  return self->_alarmsByID;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (id)buildDictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_generation];
  [v3 setObject:v4 forKey:@"generation"];

  date = self->_date;
  if (date) {
    [v3 setObject:date forKey:@"date"];
  }
  if (self->_alarmsByID)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_alarmsByID, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v7 = self->_alarmsByID;
    uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v13 = [(NSDictionary *)self->_alarmsByID objectForKey:v12];
          uint64_t v14 = [v13 buildDictionaryRepresentation];
          [v6 setObject:v14 forKey:v12];
        }
        uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }

    long long v15 = (void *)[v6 copy];
    [v3 setObject:v15 forKey:@"alarmsByID"];
  }
  if (self->_notifiedFiringAlarmIDs)
  {
    long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSOrderedSet count](self->_notifiedFiringAlarmIDs, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v17 = self->_notifiedFiringAlarmIDs;
    uint64_t v18 = [(NSOrderedSet *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(v16, "addObject:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
        }
        uint64_t v19 = [(NSOrderedSet *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    v22 = (void *)[v16 copy];
    [v3 setObject:v22 forKey:@"notifiedFiringAlarmIDs"];
  }
  v23 = objc_msgSend(v3, "copy", (void)v25);

  return v23;
}

- (AFClockAlarmSnapshot)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"generation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v35 = [v7 unsignedLongLongValue];
    uint64_t v9 = [v5 objectForKey:@"date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v34 = v9;
    }
    else {
      id v34 = 0;
    }

    uint64_t v10 = [v5 objectForKey:@"alarmsByID"];
    objc_opt_class();
    v36 = self;
    if (objc_opt_isKindOfClass())
    {
      long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v33 = v10;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v18 = [v12 objectForKey:v17];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v19 = [[AFClockAlarm alloc] initWithDictionaryRepresentation:v18];
                if (v19) {
                  [v11 setObject:v19 forKey:v17];
                }
              }
              else
              {
                uint64_t v19 = 0;
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v14);
      }

      uint64_t v20 = (void *)[v11 copy];
      uint64_t v10 = v33;
      self = v36;
    }
    else
    {
      uint64_t v20 = 0;
    }

    v21 = [v5 objectForKey:@"notifiedFiringAlarmIDs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v5;
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v24 = v21;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v38 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = *(id *)(*((void *)&v37 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v30 = v29;

              if (v30) {
                [v23 addObject:v30];
              }
            }
            else
            {

              id v30 = 0;
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v26);
      }

      long long v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v23];
      uint64_t v5 = v22;
      self = v36;
    }
    else
    {
      long long v31 = 0;
    }

    self = [(AFClockAlarmSnapshot *)self initWithGeneration:v35 date:v34 alarmsByID:v20 notifiedFiringAlarmIDs:v31];
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t generation = self->_generation;
  id v7 = a3;
  id v6 = [v4 numberWithUnsignedLongLong:generation];
  [v7 encodeObject:v6 forKey:@"AFClockAlarmSnapshot::generation"];

  [v7 encodeObject:self->_date forKey:@"AFClockAlarmSnapshot::date"];
  [v7 encodeObject:self->_alarmsByID forKey:@"AFClockAlarmSnapshot::alarmsByID"];
  [v7 encodeObject:self->_notifiedFiringAlarmIDs forKey:@"AFClockAlarmSnapshot::notifiedFiringAlarmIDs"];
}

- (AFClockAlarmSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarmSnapshot::generation"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockAlarmSnapshot::date"];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  long long v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"AFClockAlarmSnapshot::alarmsByID"];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  long long v16 = [v4 decodeObjectOfClasses:v15 forKey:@"AFClockAlarmSnapshot::notifiedFiringAlarmIDs"];

  uint64_t v17 = [(AFClockAlarmSnapshot *)self initWithGeneration:v6 date:v7 alarmsByID:v12 notifiedFiringAlarmIDs:v16];
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFClockAlarmSnapshot *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t generation = self->_generation;
      if (generation == [(AFClockAlarmSnapshot *)v5 generation])
      {
        id v7 = [(AFClockAlarmSnapshot *)v5 date];
        date = self->_date;
        if (date == v7 || [(NSDate *)date isEqual:v7])
        {
          uint64_t v9 = [(AFClockAlarmSnapshot *)v5 alarmsByID];
          alarmsByID = self->_alarmsByID;
          if (alarmsByID == v9 || [(NSDictionary *)alarmsByID isEqual:v9])
          {
            long long v11 = [(AFClockAlarmSnapshot *)v5 notifiedFiringAlarmIDs];
            notifiedFiringAlarmIDs = self->_notifiedFiringAlarmIDs;
            BOOL v13 = notifiedFiringAlarmIDs == v11
               || [(NSOrderedSet *)notifiedFiringAlarmIDs isEqual:v11];
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
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_generation];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSDate *)self->_date hash];
  uint64_t v6 = v5 ^ [(NSDictionary *)self->_alarmsByID hash];
  unint64_t v7 = v6 ^ [(NSOrderedSet *)self->_notifiedFiringAlarmIDs hash] ^ v4;

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFClockAlarmSnapshot;
  uint64_t v5 = [(AFClockAlarmSnapshot *)&v8 description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"%@ {generation = %llu, date = %@, alarmsByID = %@, notifiedFiringAlarmIDs = %@}", v5, self->_generation, self->_date, self->_alarmsByID, self->_notifiedFiringAlarmIDs];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFClockAlarmSnapshot *)self _descriptionWithIndent:0];
}

- (AFClockAlarmSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 alarmsByID:(id)a5 notifiedFiringAlarmIDs:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__AFClockAlarmSnapshot_initWithGeneration_date_alarmsByID_notifiedFiringAlarmIDs___block_invoke;
  v18[3] = &unk_1E5928B48;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  unint64_t v22 = a3;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  long long v16 = [(AFClockAlarmSnapshot *)self initWithBuilder:v18];

  return v16;
}

void __82__AFClockAlarmSnapshot_initWithGeneration_date_alarmsByID_notifiedFiringAlarmIDs___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[7];
  id v4 = a2;
  [v4 setGeneration:v3];
  [v4 setDate:a1[4]];
  [v4 setAlarmsByID:a1[5]];
  [v4 setNotifiedFiringAlarmIDs:a1[6]];
}

- (AFClockAlarmSnapshot)init
{
  return [(AFClockAlarmSnapshot *)self initWithBuilder:0];
}

- (AFClockAlarmSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFClockAlarmSnapshotMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFClockAlarmSnapshot;
  uint64_t v5 = [(AFClockAlarmSnapshot *)&v18 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_AFClockAlarmSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFClockAlarmSnapshotMutation *)v7 isDirty])
    {
      v6->_unint64_t generation = [(_AFClockAlarmSnapshotMutation *)v7 getGeneration];
      objc_super v8 = [(_AFClockAlarmSnapshotMutation *)v7 getDate];
      uint64_t v9 = [v8 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      id v11 = [(_AFClockAlarmSnapshotMutation *)v7 getAlarmsByID];
      uint64_t v12 = [v11 copy];
      alarmsByID = v6->_alarmsByID;
      v6->_alarmsByID = (NSDictionary *)v12;

      id v14 = [(_AFClockAlarmSnapshotMutation *)v7 getNotifiedFiringAlarmIDs];
      uint64_t v15 = [v14 copy];
      notifiedFiringAlarmIDs = v6->_notifiedFiringAlarmIDs;
      v6->_notifiedFiringAlarmIDs = (NSOrderedSet *)v15;
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
  id v4 = (void (**)(id, _AFClockAlarmSnapshotMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFClockAlarmSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFClockAlarmSnapshotMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFClockAlarmSnapshot);
      v6->_unint64_t generation = [(_AFClockAlarmSnapshotMutation *)v5 getGeneration];
      unint64_t v7 = [(_AFClockAlarmSnapshotMutation *)v5 getDate];
      uint64_t v8 = [v7 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      id v10 = [(_AFClockAlarmSnapshotMutation *)v5 getAlarmsByID];
      uint64_t v11 = [v10 copy];
      alarmsByID = v6->_alarmsByID;
      v6->_alarmsByID = (NSDictionary *)v11;

      id v13 = [(_AFClockAlarmSnapshotMutation *)v5 getNotifiedFiringAlarmIDs];
      uint64_t v14 = [v13 copy];
      notifiedFiringAlarmIDs = v6->_notifiedFiringAlarmIDs;
      v6->_notifiedFiringAlarmIDs = (NSOrderedSet *)v14;
    }
    else
    {
      uint64_t v6 = (AFClockAlarmSnapshot *)[(AFClockAlarmSnapshot *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFClockAlarmSnapshot *)[(AFClockAlarmSnapshot *)self copy];
  }

  return v6;
}

- (id)ad_shortDescription
{
  id v3 = NSString;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[AFClockAlarmSnapshot generation](self, "generation"));
  uint64_t v5 = [(AFClockAlarmSnapshot *)self date];
  uint64_t v6 = [v5 description];
  unint64_t v7 = [(AFClockAlarmSnapshot *)self notifiedFiringAlarmIDs];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFClockAlarmSnapshot hasFiringAlarms](self, "hasFiringAlarms"));
  uint64_t v9 = [v3 stringWithFormat:@"(gen: %@, date: %@, notifiedFiringAlarmIDs: %@, isFiring: %@)", v4, v6, v7, v8];

  return v9;
}

- (AFClockAlarmSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
    uint64_t v6 = [v5 generation];
    unint64_t v7 = [v5 date];
    uint64_t v8 = [v5 alarmsByID];
    uint64_t v9 = [v5 notifiedFiringAlarmIDs];
    self = [(AFClockAlarmSnapshot *)self initWithGeneration:v6 date:v7 alarmsByID:v8 notifiedFiringAlarmIDs:v9];

    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)serializedBackingStore
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

@end