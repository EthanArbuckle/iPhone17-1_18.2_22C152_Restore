@interface SFAnalyticsMatchingRule
+ (id)armKeyForEventName:(id)a3;
- (BOOL)firstMatchArmed;
- (BOOL)isSubsetMatch:(id)a3 target:(id)a4;
- (BOOL)matchAttributes:(id)a3 eventClass:(int64_t)a4 processName:(id)a5 logger:(id)a6;
- (BOOL)valueMatch:(id)a3 target:(id)a4;
- (NSDate)lastMatch;
- (NSDictionary)matchingDictionary;
- (NSString)eventName;
- (SECSFAEventRule)rule;
- (SFAnalyticsMatchingRule)initWithSFARule:(id)a3 logger:(id)a4;
- (id)armKey;
- (id)cachedMatchDictionary;
- (id)description;
- (id)lastMatchTimeKey;
- (unsigned)doAction:(id)a3 attributes:(id)a4 logger:(id)a5;
- (void)setEventName:(id)a3;
- (void)setFirstMatchArmed:(BOOL)a3;
- (void)setLastMatch:(id)a3;
- (void)setMatchingDictionary:(id)a3;
- (void)setRule:(id)a3;
@end

@implementation SFAnalyticsMatchingRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMatch, 0);
  objc_storeStrong((id *)&self->_matchingDictionary, 0);
  objc_storeStrong((id *)&self->_rule, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

- (void)setFirstMatchArmed:(BOOL)a3
{
  self->_firstMatchArmed = a3;
}

- (BOOL)firstMatchArmed
{
  return self->_firstMatchArmed;
}

- (void)setLastMatch:(id)a3
{
}

- (NSDate)lastMatch
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchingDictionary:(id)a3
{
}

- (NSDictionary)matchingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRule:(id)a3
{
}

- (SECSFAEventRule)rule
{
  return (SECSFAEventRule *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)doAction:(id)a3 attributes:(id)a4 logger:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SFAnalyticsMatchingRule *)self rule];
  v12 = [v11 action];

  if (v12)
  {
    if ([v12 hasTtr])
    {
      int v13 = [v8 shouldRatelimit:v10 rule:self];
      v14 = getOSLog();
      v15 = v14;
      if (!v13)
      {
        id v47 = v10;
        id v48 = v9;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [(SFAnalyticsMatchingRule *)self rule];
          v27 = [v26 eventType];
          v28 = [(SFAnalyticsMatchingRule *)self cachedMatchDictionary];
          *(_DWORD *)buf = 138412546;
          v50 = v27;
          __int16 v51 = 2112;
          v52 = v28;
          _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "SFACollection action trigger ttr: %@: %@", buf, 0x16u);
        }
        v15 = [v12 ttr];
        v29 = [v15 alert];
        v30 = [v15 description];
        v31 = [v12 radarnumber];
        v32 = [v15 componentName];
        v33 = [v15 componentVersion];
        v34 = [v15 componentID];
        id v9 = v48;
        [v8 tapToRadar:v29 description:v30 radar:v31 componentName:v32 componentVersion:v33 componentID:v34 attributes:v48];

        unsigned int v18 = 0;
        id v10 = v47;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = [(SFAnalyticsMatchingRule *)self rule];
        v17 = [v16 eventType];
        *(_DWORD *)buf = 138412290;
        v50 = v17;
        _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_INFO, "SFACollection ratelimit ttr: %@", buf, 0xCu);
      }
LABEL_30:
      unsigned int v18 = 0;
LABEL_31:

      goto LABEL_32;
    }
    if ([v12 hasAbc])
    {
      int v19 = [v8 shouldRatelimit:v10 rule:self];
      v20 = getOSLog();
      v15 = v20;
      if (!v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [(SFAnalyticsMatchingRule *)self rule];
          v41 = [v40 eventType];
          v42 = [(SFAnalyticsMatchingRule *)self cachedMatchDictionary];
          *(_DWORD *)buf = 138412546;
          v50 = v41;
          __int16 v51 = 2112;
          v52 = v42;
          _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "SFACollection action trigger abc: %@ %@", buf, 0x16u);
        }
        v15 = [v12 abc];
        v43 = [v15 domain];
        if (v43)
        {
        }
        else
        {
          v44 = [v15 type];

          if (!v44) {
            goto LABEL_30;
          }
        }
        v21 = [v15 type];
        v22 = [v15 subtype];
        v45 = [v15 domain];
        [v8 autoBugCaptureWithType:v21 subType:v22 domain:v45];

LABEL_29:
        goto LABEL_30;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      v21 = [(SFAnalyticsMatchingRule *)self rule];
      v22 = [v21 eventType];
      *(_DWORD *)buf = 138412290;
      v50 = v22;
      v23 = "SFACollection ratelimit abc: %@";
      v24 = v15;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
    }
    else
    {
      int v35 = [v12 hasDrop];
      v15 = getOSLog();
      BOOL v36 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v36)
        {
          v37 = [(SFAnalyticsMatchingRule *)self rule];
          v38 = [v37 eventType];
          *(_DWORD *)buf = 138412290;
          v50 = v38;
          _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "SFACollection action trigger drop: %@", buf, 0xCu);
        }
        v15 = [v12 drop];
        unsigned int v39 = [v15 excludeEvent];
        if ([v15 excludeCount]) {
          unsigned int v18 = v39 | 2;
        }
        else {
          unsigned int v18 = v39;
        }
        goto LABEL_31;
      }
      if (!v36) {
        goto LABEL_30;
      }
      v21 = [(SFAnalyticsMatchingRule *)self rule];
      v22 = [v21 eventType];
      *(_DWORD *)buf = 138412290;
      v50 = v22;
      v23 = "SFACollection unknown action: %@";
      v24 = v15;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_18B299000, v24, v25, v23, buf, 0xCu);
    goto LABEL_29;
  }
  unsigned int v18 = 0;
LABEL_32:

  return v18;
}

- (BOOL)matchAttributes:(id)a3 eventClass:(int64_t)a4 processName:(id)a5 logger:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = [(SFAnalyticsMatchingRule *)self rule];
  v14 = [v13 processName];

  if (v14)
  {
    v15 = [(SFAnalyticsMatchingRule *)self rule];
    v16 = [v15 processName];
    int v17 = [v11 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  unsigned int v18 = [(SFAnalyticsMatchingRule *)self rule];
  int v19 = [v18 matchOnFirstFailure];

  if (!a4 && v19 && ![(SFAnalyticsMatchingRule *)self firstMatchArmed])
  {
    v20 = [(SFAnalyticsMatchingRule *)self armKey];
    [v12 setNumberProperty:MEMORY[0x1E4F1CC38] forKey:v20];

    [(SFAnalyticsMatchingRule *)self setFirstMatchArmed:1];
  }
  v21 = [(SFAnalyticsMatchingRule *)self rule];
  int v22 = [v21 hasMatch];

  if (v22)
  {
    uint64_t v23 = [(SFAnalyticsMatchingRule *)self cachedMatchDictionary];
    if (!v23) {
      goto LABEL_18;
    }
    v24 = (void *)v23;
    BOOL v25 = [(SFAnalyticsMatchingRule *)self isSubsetMatch:v23 target:v10];

    if (!v25) {
      goto LABEL_18;
    }
  }
  v26 = [(SFAnalyticsMatchingRule *)self rule];
  int v27 = [v26 matchOnFirstFailure];

  if ((unint64_t)(a4 - 1) <= 1 && v27)
  {
    v28 = [(SFAnalyticsMatchingRule *)self armKey];
    if ([(SFAnalyticsMatchingRule *)self firstMatchArmed])
    {
      [v12 setNumberProperty:0 forKey:v28];
      [(SFAnalyticsMatchingRule *)self setFirstMatchArmed:0];

      goto LABEL_14;
    }

LABEL_18:
    BOOL v31 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v29 = [(SFAnalyticsMatchingRule *)self rule];
  int v30 = [v29 eventClass];

  BOOL v31 = 0;
  switch(v30)
  {
    case 0:
      if ((unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL) {
        goto LABEL_18;
      }
      goto LABEL_29;
    case 1:
      goto LABEL_29;
    case 10:
      if (a4) {
        goto LABEL_18;
      }
      goto LABEL_29;
    case 11:
      if (a4 != 1) {
        goto LABEL_18;
      }
      goto LABEL_29;
    case 12:
      if (a4 != 2) {
        goto LABEL_18;
      }
      goto LABEL_29;
    case 13:
      if (a4 != 3) {
        goto LABEL_18;
      }
      goto LABEL_29;
    case 14:
      if (a4 != 4) {
        goto LABEL_18;
      }
LABEL_29:
      BOOL v31 = 1;
      break;
    default:
      break;
  }
LABEL_19:

  return v31;
}

- (id)armKey
{
  v3 = objc_opt_class();
  v4 = [(SFAnalyticsMatchingRule *)self eventName];
  v5 = [v3 armKeyForEventName:v4];

  return v5;
}

- (id)cachedMatchDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(SFAnalyticsMatchingRule *)v2 matchingDictionary];

  if (v3) {
    goto LABEL_2;
  }
  v5 = (void *)MEMORY[0x1E4F28F98];
  v6 = [(SFAnalyticsMatchingRule *)v2 rule];
  v7 = [v6 match];
  id v15 = 0;
  id v8 = [v5 propertyListWithData:v7 options:0 format:0 error:&v15];
  id v9 = v15;

  if (!v8 || v9)
  {
    id v10 = getOSLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    id v11 = "SFAnalyticsMatchingRule match dictionary wrong: %@";
    id v12 = v10;
    uint32_t v13 = 12;
LABEL_15:
    _os_log_error_impl(&dword_18B299000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFAnalyticsMatchingRule *)v2 setMatchingDictionary:v8];

LABEL_2:
    objc_sync_exit(v2);

    v4 = [(SFAnalyticsMatchingRule *)v2 matchingDictionary];
    goto LABEL_11;
  }
  id v10 = getOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v11 = "SFAnalyticsMatchingRule match not dictionary";
    id v12 = v10;
    uint32_t v13 = 2;
    goto LABEL_15;
  }
LABEL_10:

  objc_sync_exit(v2);
  v4 = 0;
LABEL_11:

  return v4;
}

- (id)lastMatchTimeKey
{
  v2 = NSString;
  v3 = [(SFAnalyticsMatchingRule *)self rule];
  v4 = [v3 eventType];
  v5 = [v2 stringWithFormat:@"SFA-LastMatchRule-%@-", v4];

  return v5;
}

- (BOOL)isSubsetMatch:(id)a3 target:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  if (v8 <= [v7 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v16 = objc_msgSend(v7, "objectForKeyedSubscript:", v15, (void)v20);
          id v17 = [v10 objectForKeyedSubscript:v15];
          BOOL v18 = [(SFAnalyticsMatchingRule *)self valueMatch:v17 target:v16];

          if (!v18)
          {
            BOOL v9 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_13:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)valueMatch:(id)a3 target:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v8 = [v6 isEqual:v7];
LABEL_4:
    BOOL v9 = v8;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [(SFAnalyticsMatchingRule *)self isSubsetMatch:v6 target:v7];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    id v23 = v7;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v11;
    uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v14 = v23;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (!v15)
          {

LABEL_28:
            BOOL v9 = 0;
            goto LABEL_29;
          }
          uint64_t v16 = v15;
          int v17 = 0;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v14);
              }
              v17 |= [(SFAnalyticsMatchingRule *)self valueMatch:v13 target:*(void *)(*((void *)&v24 + 1) + 8 * j)];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v16);

          if ((v17 & 1) == 0) {
            goto LABEL_28;
          }
        }
        BOOL v9 = 1;
        uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
LABEL_29:
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_5:

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SFAnalyticsMatchingRule *)self eventName];
  v5 = [(SFAnalyticsMatchingRule *)self cachedMatchDictionary];
  id v6 = [(SFAnalyticsMatchingRule *)self lastMatch];
  id v7 = [v3 stringWithFormat:@"<SFAnalyticsMatchingRule: %@ match: %@ %@>", v4, v5, v6];

  return v7;
}

- (SFAnalyticsMatchingRule)initWithSFARule:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SFAnalyticsMatchingRule;
  char v8 = [(SFAnalyticsMatchingRule *)&v16 init];
  if (v8)
  {
    BOOL v9 = [v6 eventType];
    [(SFAnalyticsMatchingRule *)v8 setEventName:v9];

    [(SFAnalyticsMatchingRule *)v8 setRule:v6];
    id v10 = [(SFAnalyticsMatchingRule *)v8 lastMatchTimeKey];
    id v11 = [v7 datePropertyForKey:v10];
    [(SFAnalyticsMatchingRule *)v8 setLastMatch:v11];

    uint64_t v12 = [(SFAnalyticsMatchingRule *)v8 armKey];
    uint64_t v13 = [v7 numberPropertyForKey:v12];

    if (v13) {
      [(SFAnalyticsMatchingRule *)v8 setFirstMatchArmed:1];
    }
    id v14 = v8;
  }

  return v8;
}

+ (id)armKeyForEventName:(id)a3
{
  return (id)[NSString stringWithFormat:@"SFAColl-%@-armed", a3];
}

@end