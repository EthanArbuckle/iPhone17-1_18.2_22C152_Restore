@interface APSTopicGroup
- (APSTopicGroup)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5;
- (APSTopicHasher)topicHasher;
- (BOOL)isEqual:(id)a3;
- (NSMutableDictionary)hashesToEnabledTopics;
- (NSMutableDictionary)hashesToIgnoredTopics;
- (NSMutableDictionary)hashesToNonWakingTopics;
- (NSMutableDictionary)hashesToOpportunisticTopics;
- (NSMutableDictionary)hashesToPausedTopics;
- (NSSet)enabledTopics;
- (NSSet)ignoredTopics;
- (NSSet)nonWakingTopics;
- (NSSet)opportunisticTopics;
- (NSString)logString;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)currentFilterForTopicState:(id)a3;
@end

@implementation APSTopicGroup

- (APSTopicGroup)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)APSTopicGroup;
  v12 = [(APSTopicGroup *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_user, a5);
    objc_storeStrong((id *)&v13->_environment, a3);
    objc_storeStrong((id *)&v13->_topicHasher, a4);
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hashesToEnabledTopics = v13->_hashesToEnabledTopics;
    v13->_hashesToEnabledTopics = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hashesToIgnoredTopics = v13->_hashesToIgnoredTopics;
    v13->_hashesToIgnoredTopics = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hashesToOpportunisticTopics = v13->_hashesToOpportunisticTopics;
    v13->_hashesToOpportunisticTopics = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hashesToNonWakingTopics = v13->_hashesToNonWakingTopics;
    v13->_hashesToNonWakingTopics = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hashesToPausedTopics = v13->_hashesToPausedTopics;
    v13->_hashesToPausedTopics = v22;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (APSTopicGroup *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (self == v4)
  {
    unsigned __int8 v15 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    v7 = [(APSTopicGroup *)self hashesToEnabledTopics];
    v8 = [(APSTopicGroup *)v6 hashesToEnabledTopics];
    if ([v7 isEqualToDictionary:v8])
    {
      id v9 = [(APSTopicGroup *)self hashesToOpportunisticTopics];
      id v10 = [(APSTopicGroup *)v6 hashesToOpportunisticTopics];
      if ([v9 isEqualToDictionary:v10])
      {
        id v11 = [(APSTopicGroup *)self hashesToNonWakingTopics];
        v12 = [(APSTopicGroup *)v6 hashesToNonWakingTopics];
        if ([v11 isEqualToDictionary:v12])
        {
          v13 = [(APSTopicGroup *)self hashesToIgnoredTopics];
          v19 = [(APSTopicGroup *)v6 hashesToIgnoredTopics];
          if (objc_msgSend(v13, "isEqualToDictionary:"))
          {
            v17 = [(APSTopicGroup *)self hashesToPausedTopics];
            [(APSTopicGroup *)v6 hashesToPausedTopics];
            v14 = v18 = v13;
            unsigned __int8 v15 = [v17 isEqualToDictionary:v14];

            v13 = v18;
          }
          else
          {
            unsigned __int8 v15 = 0;
          }
        }
        else
        {
          unsigned __int8 v15 = 0;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
LABEL_9:
    unsigned __int8 v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[APSTopicGroup alloc] initWithEnvironment:self->_environment topicHasher:self->_topicHasher user:self->_user];
  id v5 = objc_alloc((Class)NSDictionary);
  v6 = [(APSTopicGroup *)self hashesToEnabledTopics];
  id v7 = [v5 initWithDictionary:v6 copyItems:1];
  v8 = (NSMutableDictionary *)[v7 mutableCopy];
  hashesToEnabledTopics = v4->_hashesToEnabledTopics;
  v4->_hashesToEnabledTopics = v8;

  id v10 = objc_alloc((Class)NSDictionary);
  id v11 = [(APSTopicGroup *)self hashesToOpportunisticTopics];
  id v12 = [v10 initWithDictionary:v11 copyItems:1];
  v13 = (NSMutableDictionary *)[v12 mutableCopy];
  hashesToOpportunisticTopics = v4->_hashesToOpportunisticTopics;
  v4->_hashesToOpportunisticTopics = v13;

  id v15 = objc_alloc((Class)NSDictionary);
  v16 = [(APSTopicGroup *)self hashesToNonWakingTopics];
  id v17 = [v15 initWithDictionary:v16 copyItems:1];
  v18 = (NSMutableDictionary *)[v17 mutableCopy];
  hashesToNonWakingTopics = v4->_hashesToNonWakingTopics;
  v4->_hashesToNonWakingTopics = v18;

  id v20 = objc_alloc((Class)NSDictionary);
  v21 = [(APSTopicGroup *)self hashesToIgnoredTopics];
  id v22 = [v20 initWithDictionary:v21 copyItems:1];
  v23 = (NSMutableDictionary *)[v22 mutableCopy];
  hashesToIgnoredTopics = v4->_hashesToIgnoredTopics;
  v4->_hashesToIgnoredTopics = v23;

  id v25 = objc_alloc((Class)NSDictionary);
  v26 = [(APSTopicGroup *)self hashesToPausedTopics];
  id v27 = [v25 initWithDictionary:v26 copyItems:1];
  v28 = (NSMutableDictionary *)[v27 mutableCopy];
  hashesToPausedTopics = v4->_hashesToPausedTopics;
  v4->_hashesToPausedTopics = v28;

  return v4;
}

- (int64_t)currentFilterForTopicState:(id)a3
{
  id v4 = a3;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v5 = [(NSMutableDictionary *)self->_hashesToEnabledTopics allValues];
  id v6 = [v5 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v65;
    int64_t v9 = 1;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v65 != v8) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v64 + 1) + 8 * v10);
      id v12 = [v4 topicName];
      v13 = [v11 topicName];
      unsigned __int8 v14 = [v12 isEqualToString:v13];

      if (v14) {
        break;
      }
      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v5 = [(NSMutableDictionary *)self->_hashesToOpportunisticTopics allValues];
    id v15 = [v5 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v61;
      int64_t v9 = 2;
LABEL_11:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(v5);
        }
        v19 = *(void **)(*((void *)&v60 + 1) + 8 * v18);
        id v20 = [v4 topicName];
        v21 = [v19 topicName];
        unsigned __int8 v22 = [v20 isEqualToString:v21];

        if (v22) {
          break;
        }
        if (v16 == (id)++v18)
        {
          id v16 = [v5 countByEnumeratingWithState:&v60 objects:v71 count:16];
          if (v16) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v5 = [(NSMutableDictionary *)self->_hashesToNonWakingTopics allValues];
      id v23 = [v5 countByEnumeratingWithState:&v56 objects:v70 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v57;
        int64_t v9 = 4;
LABEL_19:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v5);
          }
          id v27 = *(void **)(*((void *)&v56 + 1) + 8 * v26);
          v28 = [v4 topicName];
          v29 = [v27 topicName];
          unsigned __int8 v30 = [v28 isEqualToString:v29];

          if (v30) {
            break;
          }
          if (v24 == (id)++v26)
          {
            id v24 = [v5 countByEnumeratingWithState:&v56 objects:v70 count:16];
            if (v24) {
              goto LABEL_19;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v5 = [(NSMutableDictionary *)self->_hashesToIgnoredTopics allValues];
        id v31 = [v5 countByEnumeratingWithState:&v52 objects:v69 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v53;
          int64_t v9 = 3;
LABEL_27:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v53 != v33) {
              objc_enumerationMutation(v5);
            }
            v35 = *(void **)(*((void *)&v52 + 1) + 8 * v34);
            v36 = [v4 topicName];
            v37 = [v35 topicName];
            unsigned __int8 v38 = [v36 isEqualToString:v37];

            if (v38) {
              break;
            }
            if (v32 == (id)++v34)
            {
              id v32 = [v5 countByEnumeratingWithState:&v52 objects:v69 count:16];
              if (v32) {
                goto LABEL_27;
              }
              goto LABEL_33;
            }
          }
        }
        else
        {
LABEL_33:

          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v5 = [(NSMutableDictionary *)self->_hashesToPausedTopics allValues];
          id v39 = [v5 countByEnumeratingWithState:&v48 objects:v68 count:16];
          if (v39)
          {
            id v40 = v39;
            uint64_t v41 = *(void *)v49;
            int64_t v9 = 5;
LABEL_35:
            uint64_t v42 = 0;
            while (1)
            {
              if (*(void *)v49 != v41) {
                objc_enumerationMutation(v5);
              }
              v43 = *(void **)(*((void *)&v48 + 1) + 8 * v42);
              v44 = [v4 topicName];
              v45 = [v43 topicName];
              unsigned __int8 v46 = [v44 isEqualToString:v45];

              if (v46) {
                break;
              }
              if (v40 == (id)++v42)
              {
                id v40 = [v5 countByEnumeratingWithState:&v48 objects:v68 count:16];
                if (v40) {
                  goto LABEL_35;
                }
                goto LABEL_41;
              }
            }
          }
          else
          {
LABEL_41:
            int64_t v9 = 0;
          }
        }
      }
    }
  }

  return v9;
}

- (NSSet)enabledTopics
{
  return (NSSet *)sub_100041950(self->_hashesToEnabledTopics);
}

- (NSSet)ignoredTopics
{
  return (NSSet *)sub_100041950(self->_hashesToIgnoredTopics);
}

- (NSSet)opportunisticTopics
{
  return (NSSet *)sub_100041950(self->_hashesToOpportunisticTopics);
}

- (NSSet)nonWakingTopics
{
  return (NSSet *)sub_100041950(self->_hashesToNonWakingTopics);
}

- (NSMutableDictionary)hashesToEnabledTopics
{
  return self->_hashesToEnabledTopics;
}

- (NSMutableDictionary)hashesToIgnoredTopics
{
  return self->_hashesToIgnoredTopics;
}

- (NSMutableDictionary)hashesToOpportunisticTopics
{
  return self->_hashesToOpportunisticTopics;
}

- (NSMutableDictionary)hashesToNonWakingTopics
{
  return self->_hashesToNonWakingTopics;
}

- (NSMutableDictionary)hashesToPausedTopics
{
  return self->_hashesToPausedTopics;
}

- (NSString)logString
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@:", self];
  [v3 appendFormat:@"enabled: %@", self->_hashesToEnabledTopics];
  [v3 appendFormat:@"opportunistic: %@", self->_hashesToOpportunisticTopics];
  [v3 appendFormat:@"ignored: %@", self->_hashesToIgnoredTopics];
  [v3 appendFormat:@"nonwaking: %@", self->_hashesToNonWakingTopics];
  [v3 appendFormat:@"paused: %@", self->_hashesToPausedTopics];
  return (NSString *)v3;
}

- (APSTopicHasher)topicHasher
{
  return self->_topicHasher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicHasher, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_hashesToPausedTopics, 0);
  objc_storeStrong((id *)&self->_hashesToNonWakingTopics, 0);
  objc_storeStrong((id *)&self->_hashesToOpportunisticTopics, 0);
  objc_storeStrong((id *)&self->_hashesToIgnoredTopics, 0);
  objc_storeStrong((id *)&self->_hashesToEnabledTopics, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end