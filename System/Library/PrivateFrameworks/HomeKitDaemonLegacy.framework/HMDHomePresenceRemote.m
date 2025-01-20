@interface HMDHomePresenceRemote
- (BOOL)areUsersAtHome:(id)a3;
- (BOOL)areUsersNotAtHome:(id)a3;
- (BOOL)isAnyUserAtHome;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoUserAtHome;
- (BOOL)isUserAtHome:(id)a3;
- (BOOL)isUserNotAtHome:(id)a3;
- (HMDHomePresenceRemote)initWithPresenceByPairingIdentity:(id)a3;
- (HMDHomePresenceRemote)initWithPresenceByUserId:(id)a3;
- (NSDictionary)userPresenceMap;
- (NSString)description;
- (id)regionForUser:(id)a3;
- (unint64_t)hash;
@end

@implementation HMDHomePresenceRemote

- (void).cxx_destruct
{
}

- (NSDictionary)userPresenceMap
{
  return self->_userPresenceMap;
}

- (BOOL)isAnyUserAtHome
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSDictionary *)self->_userPresenceMap count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = [(NSDictionary *)self->_userPresenceMap allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) value] == 1)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isNoUserAtHome
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(NSDictionary *)self->_userPresenceMap count]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSDictionary *)self->_userPresenceMap allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    char v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 &= [*(id *)(*((void *)&v10 + 1) + 8 * i) value] == 2;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)areUsersNotAtHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v11 = -[HMDHomePresenceRemote regionForUser:](self, "regionForUser:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          v9 &= [v11 value] == 2;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)areUsersAtHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v11 = -[HMDHomePresenceRemote regionForUser:](self, "regionForUser:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          v9 &= [v11 value] == 1;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isUserNotAtHome:(id)a3
{
  v3 = [(HMDHomePresenceRemote *)self regionForUser:a3];
  BOOL v4 = [v3 value] == 2;

  return v4;
}

- (BOOL)isUserAtHome:(id)a3
{
  v3 = [(HMDHomePresenceRemote *)self regionForUser:a3];
  BOOL v4 = [v3 value] == 1;

  return v4;
}

- (id)regionForUser:(id)a3
{
  id v4 = a3;
  userPresenceMap = self->_userPresenceMap;
  uint64_t v6 = [v4 pairingIdentity];
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [(NSDictionary *)userPresenceMap objectForKeyedSubscript:v7];

  if (!v8)
  {
    char v9 = self->_userPresenceMap;
    long long v10 = [v4 uuid];
    long long v11 = [v10 UUIDString];
    uint64_t v8 = [(NSDictionary *)v9 objectForKeyedSubscript:v11];
  }
  return v8;
}

- (unint64_t)hash
{
  v2 = [(HMDHomePresenceRemote *)self userPresenceMap];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMDHomePresenceRemote *)self userPresenceMap];
    uint64_t v8 = [v6 userPresenceMap];
    char v9 = [v7 isEqualToDictionary:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v2 = NSString;
  unint64_t v3 = [(HMDHomePresenceRemote *)self userPresenceMap];
  id v4 = [v2 stringWithFormat:@"[Home-Presence-Remote: %@]", v3];

  return (NSString *)v4;
}

- (HMDHomePresenceRemote)initWithPresenceByPairingIdentity:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomePresenceRemote;
  id v5 = [(HMDHomePresenceRemote *)&v23 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v18 = v5;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = [v4 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = [v4 objectForKeyedSubscript:v13];
          long long v15 = +[HMDUserPresenceRegion regionWithNumber:v14];
          [(NSDictionary *)v7 setObject:v15 forKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    id v6 = v18;
    userPresenceMap = v18->_userPresenceMap;
    v18->_userPresenceMap = v7;
  }
  return v6;
}

- (HMDHomePresenceRemote)initWithPresenceByUserId:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomePresenceRemote;
  id v5 = [(HMDHomePresenceRemote *)&v23 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v18 = v5;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = [v4 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = [v4 objectForKeyedSubscript:v13];
          long long v15 = +[HMDUserPresenceRegion regionWithNumber:v14];
          [(NSDictionary *)v7 setObject:v15 forKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    id v6 = v18;
    userPresenceMap = v18->_userPresenceMap;
    v18->_userPresenceMap = v7;
  }
  return v6;
}

@end