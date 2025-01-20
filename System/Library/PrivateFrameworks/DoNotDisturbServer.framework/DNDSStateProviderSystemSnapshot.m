@interface DNDSStateProviderSystemSnapshot
- (BOOL)isEqual:(id)a3;
- (DNDSStateProviderSystemSnapshot)init;
- (NSArray)activeAssertionUUIDs;
- (NSArray)assertions;
- (NSDate)lastUpdate;
- (NSDictionary)activeDateIntervalByAssertionUUID;
- (id)_initWithAssertions:(id)a3 activeAssertionUUIDs:(id)a4 activeDateIntervalByAssertionUUID:(id)a5 interruptionBehaviorSetting:(unint64_t)a6 lostModeState:(unint64_t)a7 lastUpdate:(id)a8;
- (id)_initWithSnapshot:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)interruptionBehaviorSetting;
- (unint64_t)lostModeState;
@end

@implementation DNDSStateProviderSystemSnapshot

- (DNDSStateProviderSystemSnapshot)init
{
  return (DNDSStateProviderSystemSnapshot *)[(DNDSStateProviderSystemSnapshot *)self _initWithSnapshot:0];
}

- (id)_initWithSnapshot:(id)a3
{
  id v4 = a3;
  v5 = [v4 assertions];
  v6 = [v4 activeAssertionUUIDs];
  v7 = [v4 activeDateIntervalByAssertionUUID];
  uint64_t v8 = [v4 interruptionBehaviorSetting];
  uint64_t v9 = [v4 lostModeState];
  v10 = [v4 lastUpdate];

  id v11 = [(DNDSStateProviderSystemSnapshot *)self _initWithAssertions:v5 activeAssertionUUIDs:v6 activeDateIntervalByAssertionUUID:v7 interruptionBehaviorSetting:v8 lostModeState:v9 lastUpdate:v10];
  return v11;
}

- (id)_initWithAssertions:(id)a3 activeAssertionUUIDs:(id)a4 activeDateIntervalByAssertionUUID:(id)a5 interruptionBehaviorSetting:(unint64_t)a6 lostModeState:(unint64_t)a7 lastUpdate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)DNDSStateProviderSystemSnapshot;
  v18 = [(DNDSStateProviderSystemSnapshot *)&v30 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    v20 = (void *)v19;
    v21 = (void *)MEMORY[0x1E4F1CBF0];
    if (v19) {
      v22 = (void *)v19;
    }
    else {
      v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v18->_assertions, v22);

    uint64_t v23 = [v15 copy];
    v24 = (void *)v23;
    if (v23) {
      v25 = (void *)v23;
    }
    else {
      v25 = v21;
    }
    objc_storeStrong((id *)&v18->_activeAssertionUUIDs, v25);

    uint64_t v26 = [v16 copy];
    v27 = (void *)v26;
    if (v26) {
      v28 = (void *)v26;
    }
    else {
      v28 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v18->_activeDateIntervalByAssertionUUID, v28);

    v18->_interruptionBehaviorSetting = a6;
    v18->_lostModeState = a7;
    objc_storeStrong((id *)&v18->_lastUpdate, a8);
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [(DNDSStateProviderSystemSnapshot *)self assertions];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSStateProviderSystemSnapshot *)self activeAssertionUUIDs];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSStateProviderSystemSnapshot *)self activeDateIntervalByAssertionUUID];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(DNDSStateProviderSystemSnapshot *)self interruptionBehaviorSetting];
  unint64_t v10 = [(DNDSStateProviderSystemSnapshot *)self lostModeState];
  id v11 = [(DNDSStateProviderSystemSnapshot *)self lastUpdate];
  unint64_t v12 = v9 ^ v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DNDSStateProviderSystemSnapshot *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v7 = [(DNDSStateProviderSystemSnapshot *)self assertions];
      uint64_t v8 = [(DNDSStateProviderSystemSnapshot *)v6 assertions];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDSStateProviderSystemSnapshot *)self assertions];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_50;
        }
        unint64_t v10 = (void *)v9;
        id v11 = [(DNDSStateProviderSystemSnapshot *)v6 assertions];
        if (!v11)
        {
          char v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        unint64_t v12 = [(DNDSStateProviderSystemSnapshot *)self assertions];
        v3 = [(DNDSStateProviderSystemSnapshot *)v6 assertions];
        if (![v12 isEqual:v3])
        {
          char v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v51 = v3;
        v52 = v12;
        v53 = v11;
        v54 = v10;
      }
      id v14 = [(DNDSStateProviderSystemSnapshot *)self activeAssertionUUIDs];
      id v15 = [(DNDSStateProviderSystemSnapshot *)v6 activeAssertionUUIDs];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSStateProviderSystemSnapshot *)self activeAssertionUUIDs];
        if (v16)
        {
          id v17 = (void *)v16;
          uint64_t v18 = [(DNDSStateProviderSystemSnapshot *)v6 activeAssertionUUIDs];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            v50 = v14;
            v20 = [(DNDSStateProviderSystemSnapshot *)self activeAssertionUUIDs];
            v3 = [(DNDSStateProviderSystemSnapshot *)v6 activeAssertionUUIDs];
            if (([v20 isEqual:v3] & 1) == 0)
            {

              goto LABEL_46;
            }
            v45 = v20;
            v46 = v19;
            v47 = v17;
            goto LABEL_17;
          }
        }
        goto LABEL_46;
      }
      v50 = v14;
LABEL_17:
      v21 = [(DNDSStateProviderSystemSnapshot *)self activeDateIntervalByAssertionUUID];
      v22 = [(DNDSStateProviderSystemSnapshot *)v6 activeDateIntervalByAssertionUUID];
      if (v21 == v22)
      {
        v48 = v21;
        v49 = v3;
        goto LABEL_25;
      }
      uint64_t v23 = [(DNDSStateProviderSystemSnapshot *)self activeDateIntervalByAssertionUUID];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [(DNDSStateProviderSystemSnapshot *)v6 activeDateIntervalByAssertionUUID];
        if (v25)
        {
          v48 = v21;
          v49 = v3;
          id v44 = v25;
          v21 = [(DNDSStateProviderSystemSnapshot *)self activeDateIntervalByAssertionUUID];
          uint64_t v26 = [(DNDSStateProviderSystemSnapshot *)v6 activeDateIntervalByAssertionUUID];
          if ([v21 isEqual:v26])
          {
            v42 = v26;
            v43 = v24;
LABEL_25:
            unint64_t v27 = [(DNDSStateProviderSystemSnapshot *)self interruptionBehaviorSetting];
            if (v27 == [(DNDSStateProviderSystemSnapshot *)v6 interruptionBehaviorSetting]&& (unint64_t v28 = [(DNDSStateProviderSystemSnapshot *)self lostModeState], v28 == [(DNDSStateProviderSystemSnapshot *)v6 lostModeState]))
            {
              v29 = [(DNDSStateProviderSystemSnapshot *)self lastUpdate];
              uint64_t v30 = [(DNDSStateProviderSystemSnapshot *)v6 lastUpdate];
              if (v29 != (void *)v30)
              {
                v41 = (void *)v30;
                uint64_t v31 = [(DNDSStateProviderSystemSnapshot *)self lastUpdate];
                v32 = v49;
                if (v31)
                {
                  v40 = (void *)v31;
                  v33 = [(DNDSStateProviderSystemSnapshot *)v6 lastUpdate];
                  if (v33)
                  {
                    v39 = v33;
                    v38 = [(DNDSStateProviderSystemSnapshot *)self lastUpdate];
                    [(DNDSStateProviderSystemSnapshot *)v6 lastUpdate];
                    v35 = v34 = v29;
                    char v13 = [v38 isEqual:v35];

                    v29 = v34;
                    v32 = v49;

                    v33 = v39;
                  }
                  else
                  {
                    char v13 = 0;
                  }
                }
                else
                {

                  char v13 = 0;
                }
                v36 = v48;
                goto LABEL_33;
              }

              char v13 = 1;
            }
            else
            {
              char v13 = 0;
            }
            v36 = v48;
            v32 = v49;
LABEL_33:
            if (v36 != v22)
            {
            }
            if (v50 != v15)
            {
            }
LABEL_47:
            id v11 = v53;
            unint64_t v10 = v54;
            unint64_t v12 = v52;
            v3 = v51;
            if (v7 != v8) {
              goto LABEL_48;
            }
LABEL_50:

            goto LABEL_51;
          }

          v25 = v44;
          v21 = v48;
          v3 = v49;
        }
      }
      if (v50 != v15)
      {
      }
LABEL_46:
      char v13 = 0;
      goto LABEL_47;
    }
    char v13 = 0;
  }
LABEL_51:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSStateProviderSystemSnapshot *)self assertions];
  uint64_t v6 = [(DNDSStateProviderSystemSnapshot *)self activeAssertionUUIDs];
  v7 = [(DNDSStateProviderSystemSnapshot *)self activeDateIntervalByAssertionUUID];
  [(DNDSStateProviderSystemSnapshot *)self interruptionBehaviorSetting];
  uint64_t v8 = DNDStringFromInterruptionBehaviorSetting();
  uint64_t v9 = DNDSStringFromLostModeState([(DNDSStateProviderSystemSnapshot *)self lostModeState]);
  unint64_t v10 = [(DNDSStateProviderSystemSnapshot *)self lastUpdate];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; assertions: %@; activeAssertionUUIDs: %@; activeDateIntervalByAssertionUUID: %@; interruptionBehaviorSetting: %@; lostModeState: %@; lastUpdate: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  id v11 = v10);

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableStateProviderSystemSnapshot alloc];
  return [(DNDSStateProviderSystemSnapshot *)v4 _initWithSnapshot:self];
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (NSArray)activeAssertionUUIDs
{
  return self->_activeAssertionUUIDs;
}

- (NSDictionary)activeDateIntervalByAssertionUUID
{
  return self->_activeDateIntervalByAssertionUUID;
}

- (unint64_t)interruptionBehaviorSetting
{
  return self->_interruptionBehaviorSetting;
}

- (unint64_t)lostModeState
{
  return self->_lostModeState;
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_activeDateIntervalByAssertionUUID, 0);
  objc_storeStrong((id *)&self->_activeAssertionUUIDs, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end