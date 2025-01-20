@interface AFClockTimerSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFClockTimerSnapshot)init;
- (AFClockTimerSnapshot)initWithBuilder:(id)a3;
- (AFClockTimerSnapshot)initWithCoder:(id)a3;
- (AFClockTimerSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFClockTimerSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 timersByID:(id)a5 notifiedFiringTimerIDs:(id)a6;
- (AFClockTimerSnapshot)initWithSerializedBackingStore:(id)a3;
- (BOOL)hasFiringTimers;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDictionary)timersByID;
- (NSOrderedSet)notifiedFiringTimerIDs;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)firingTimers;
- (id)mostRecentFiringTimer;
- (id)mutatedCopyWithMutator:(id)a3;
- (id)serializedBackingStore;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFClockTimerSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedFiringTimerIDs, 0);
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSOrderedSet)notifiedFiringTimerIDs
{
  return self->_notifiedFiringTimerIDs;
}

- (NSDictionary)timersByID
{
  return self->_timersByID;
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
  v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_generation];
  [v3 setObject:v4 forKey:@"generation"];

  date = self->_date;
  if (date) {
    [v3 setObject:date forKey:@"date"];
  }
  if (self->_timersByID)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_timersByID, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v7 = self->_timersByID;
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
          v13 = [(NSDictionary *)self->_timersByID objectForKey:v12];
          v14 = [v13 buildDictionaryRepresentation];
          [v6 setObject:v14 forKey:v12];
        }
        uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }

    v15 = (void *)[v6 copy];
    [v3 setObject:v15 forKey:@"timersByID"];
  }
  if (self->_notifiedFiringTimerIDs)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSOrderedSet count](self->_notifiedFiringTimerIDs, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = self->_notifiedFiringTimerIDs;
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
    [v3 setObject:v22 forKey:@"notifiedFiringTimerIDs"];
  }
  v23 = objc_msgSend(v3, "copy", (void)v25);

  return v23;
}

- (AFClockTimerSnapshot)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"generation"];
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

    uint64_t v10 = [v5 objectForKey:@"timersByID"];
    objc_opt_class();
    v36 = self;
    if (objc_opt_isKindOfClass())
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
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
                uint64_t v19 = [[AFClockTimer alloc] initWithDictionaryRepresentation:v18];
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

    v21 = [v5 objectForKey:@"notifiedFiringTimerIDs"];
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
      v5 = v22;
      self = v36;
    }
    else
    {
      long long v31 = 0;
    }

    self = [(AFClockTimerSnapshot *)self initWithGeneration:v35 date:v34 timersByID:v20 notifiedFiringTimerIDs:v31];
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
  v6 = [v4 numberWithUnsignedLongLong:generation];
  [v7 encodeObject:v6 forKey:@"AFClockTimerSnapshot::generation"];

  [v7 encodeObject:self->_date forKey:@"AFClockTimerSnapshot::date"];
  [v7 encodeObject:self->_timersByID forKey:@"AFClockTimerSnapshot::timersByID"];
  [v7 encodeObject:self->_notifiedFiringTimerIDs forKey:@"AFClockTimerSnapshot::notifiedFiringTimerIDs"];
}

- (AFClockTimerSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimerSnapshot::generation"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFClockTimerSnapshot::date"];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"AFClockTimerSnapshot::timersByID"];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"AFClockTimerSnapshot::notifiedFiringTimerIDs"];

  uint64_t v17 = [(AFClockTimerSnapshot *)self initWithGeneration:v6 date:v7 timersByID:v12 notifiedFiringTimerIDs:v16];
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFClockTimerSnapshot *)a3;
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
      unint64_t generation = self->_generation;
      if (generation == [(AFClockTimerSnapshot *)v5 generation])
      {
        id v7 = [(AFClockTimerSnapshot *)v5 date];
        date = self->_date;
        if (date == v7 || [(NSDate *)date isEqual:v7])
        {
          uint64_t v9 = [(AFClockTimerSnapshot *)v5 timersByID];
          timersByID = self->_timersByID;
          if (timersByID == v9 || [(NSDictionary *)timersByID isEqual:v9])
          {
            v11 = [(AFClockTimerSnapshot *)v5 notifiedFiringTimerIDs];
            notifiedFiringTimerIDs = self->_notifiedFiringTimerIDs;
            BOOL v13 = notifiedFiringTimerIDs == v11
               || [(NSOrderedSet *)notifiedFiringTimerIDs isEqual:v11];
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
  uint64_t v6 = v5 ^ [(NSDictionary *)self->_timersByID hash];
  unint64_t v7 = v6 ^ [(NSOrderedSet *)self->_notifiedFiringTimerIDs hash] ^ v4;

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFClockTimerSnapshot;
  uint64_t v5 = [(AFClockTimerSnapshot *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t generation = %llu, date = %@, timersByID = %@, notifiedFiringTimerIDs = %@}", v5, self->_generation, self->_date, self->_timersByID, self->_notifiedFiringTimerIDs];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFClockTimerSnapshot *)self _descriptionWithIndent:0];
}

- (AFClockTimerSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 timersByID:(id)a5 notifiedFiringTimerIDs:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__AFClockTimerSnapshot_initWithGeneration_date_timersByID_notifiedFiringTimerIDs___block_invoke;
  v18[3] = &unk_1E5928F50;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  unint64_t v22 = a3;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  v16 = [(AFClockTimerSnapshot *)self initWithBuilder:v18];

  return v16;
}

void __82__AFClockTimerSnapshot_initWithGeneration_date_timersByID_notifiedFiringTimerIDs___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[7];
  id v4 = a2;
  [v4 setGeneration:v3];
  [v4 setDate:a1[4]];
  [v4 setTimersByID:a1[5]];
  [v4 setNotifiedFiringTimerIDs:a1[6]];
}

- (AFClockTimerSnapshot)init
{
  return [(AFClockTimerSnapshot *)self initWithBuilder:0];
}

- (AFClockTimerSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFClockTimerSnapshotMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFClockTimerSnapshot;
  uint64_t v5 = [(AFClockTimerSnapshot *)&v18 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_AFClockTimerSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFClockTimerSnapshotMutation *)v7 isDirty])
    {
      v6->_unint64_t generation = [(_AFClockTimerSnapshotMutation *)v7 getGeneration];
      objc_super v8 = [(_AFClockTimerSnapshotMutation *)v7 getDate];
      uint64_t v9 = [v8 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      id v11 = [(_AFClockTimerSnapshotMutation *)v7 getTimersByID];
      uint64_t v12 = [v11 copy];
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v12;

      id v14 = [(_AFClockTimerSnapshotMutation *)v7 getNotifiedFiringTimerIDs];
      uint64_t v15 = [v14 copy];
      notifiedFiringTimerIDs = v6->_notifiedFiringTimerIDs;
      v6->_notifiedFiringTimerIDs = (NSOrderedSet *)v15;
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
  id v4 = (void (**)(id, _AFClockTimerSnapshotMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFClockTimerSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFClockTimerSnapshotMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFClockTimerSnapshot);
      v6->_unint64_t generation = [(_AFClockTimerSnapshotMutation *)v5 getGeneration];
      unint64_t v7 = [(_AFClockTimerSnapshotMutation *)v5 getDate];
      uint64_t v8 = [v7 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      id v10 = [(_AFClockTimerSnapshotMutation *)v5 getTimersByID];
      uint64_t v11 = [v10 copy];
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v11;

      id v13 = [(_AFClockTimerSnapshotMutation *)v5 getNotifiedFiringTimerIDs];
      uint64_t v14 = [v13 copy];
      notifiedFiringTimerIDs = v6->_notifiedFiringTimerIDs;
      v6->_notifiedFiringTimerIDs = (NSOrderedSet *)v14;
    }
    else
    {
      uint64_t v6 = (AFClockTimerSnapshot *)[(AFClockTimerSnapshot *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFClockTimerSnapshot *)[(AFClockTimerSnapshot *)self copy];
  }

  return v6;
}

- (id)ad_shortDescription
{
  id v3 = NSString;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[AFClockTimerSnapshot generation](self, "generation"));
  uint64_t v5 = [(AFClockTimerSnapshot *)self date];
  uint64_t v6 = [v5 description];
  unint64_t v7 = [(AFClockTimerSnapshot *)self notifiedFiringTimerIDs];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFClockTimerSnapshot hasFiringTimers](self, "hasFiringTimers"));
  uint64_t v9 = [v3 stringWithFormat:@"(gen: %@, date: %@, notifiedFiringTimerIDs: %@, isFiring: %@)", v4, v6, v7, v8];

  return v9;
}

- (AFClockTimerSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
    uint64_t v6 = [v5 generation];
    unint64_t v7 = [v5 date];
    uint64_t v8 = [v5 timersByID];
    uint64_t v9 = [v5 notifiedFiringTimerIDs];
    self = [(AFClockTimerSnapshot *)self initWithGeneration:v6 date:v7 timersByID:v8 notifiedFiringTimerIDs:v9];

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

- (id)firingTimers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(AFClockTimerSnapshot *)self notifiedFiringTimerIDs];
  uint64_t v5 = [(AFClockTimerSnapshot *)self timersByID];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __45__AFClockTimerSnapshot_Utility__firingTimers__block_invoke;
  id v13 = &unk_1E592AE78;
  id v14 = v4;
  id v15 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

void __45__AFClockTimerSnapshot_Utility__firingTimers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 isFiring] && AFClockIsFiringTimerValid(v6))
  {
    if ([*(id *)(a1 + 32) containsObject:v5]) {
      goto LABEL_8;
    }
    id v7 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)&v9[4] = "-[AFClockTimerSnapshot(Utility) firingTimers]_block_invoke";
    *(_WORD *)&v9[12] = 2112;
    *(void *)&v9[14] = v6;
    uint64_t v8 = "%s Timer %@ is not in notifiedFiringTimerIDs, but isFiring is YES.";
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
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)&v9[4] = "-[AFClockTimerSnapshot(Utility) firingTimers]_block_invoke";
    *(_WORD *)&v9[12] = 2112;
    *(void *)&v9[14] = v6;
    uint64_t v8 = "%s Timer %@ is in notifiedFiringTimerIDs, but isFiring is NO.";
LABEL_11:
    _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, v8, v9, 0x16u);
    goto LABEL_8;
  }
LABEL_9:
}

- (id)mostRecentFiringTimer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(AFClockTimerSnapshot *)self timersByID];
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
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 isFiring] && AFClockIsFiringTimerValid(v9))
        {
          if (v6)
          {
            uint64_t v10 = [v6 firedDate];
            uint64_t v11 = [v9 firedDate];
            if ([v10 compare:v11] == -1) {
              uint64_t v12 = v9;
            }
            else {
              uint64_t v12 = v6;
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

- (BOOL)hasFiringTimers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AFClockTimerSnapshot *)self timersByID];
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
        if ([v7 isFiring] && AFClockIsFiringTimerValid(v7))
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

@end