@interface APSTopicManager
- (APSTopicFilterPolicy)policy;
- (APSTopicGroup)group;
- (APSTopicGroup)serverGroup;
- (APSTopicHasher)topicHasher;
- (APSTopicManager)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5 userPreferences:(id)a6 ultraConstrainedProvider:(id)a7 delegate:(id)a8;
- (APSTopicManagerDelegate)delegate;
- (BOOL)_addTopic:(id)a3 connectionServer:(id)a4 attributes:(id)a5 change:(int64_t *)a6;
- (BOOL)_hasTopic:(id)a3;
- (BOOL)_isValidEnvironmentToTopics:(id)a3;
- (BOOL)_recategorizeTopic:(id)a3;
- (BOOL)_removeTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5;
- (BOOL)hasListeningTopic:(id)a3;
- (BOOL)hasListeningTopicHash:(id)a3;
- (BOOL)hasListeningTopics;
- (BOOL)hasPausedTopic:(id)a3;
- (BOOL)hasPausedTopics;
- (BOOL)hasSendingTopic:(id)a3;
- (BOOL)hasSendingTopicHash:(id)a3;
- (BOOL)hasSendingTopics;
- (BOOL)hasUltraConstrainedPermissionForTopic:(id)a3;
- (BOOL)inTransaction;
- (BOOL)pendingServerUpdate;
- (NSDictionary)hashesToTopics;
- (NSMutableArray)topicsChanged;
- (NSString)logString;
- (id)_redListTopics;
- (id)_topicStateForTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5;
- (id)debugDescription;
- (id)description;
- (id)hasEnabledTopicHash:(id)a3;
- (id)hasIgnoredTopicHash:(id)a3;
- (id)hasNonWakingTopicHash:(id)a3;
- (id)hasOpportunisticTopicHash:(id)a3;
- (id)hasPausedTopicHash:(id)a3;
- (id)hasRecentlyRemovedTopicHash:(id)a3;
- (id)hasTopicHash:(id)a3;
- (id)hasTopicHash:(id)a3 includeRecentlyRemoved:(BOOL)a4;
- (id)topicStatesForConnectionServer:(id)a3;
- (int64_t)_changeFromFilter:(int64_t)a3 toFilter:(int64_t)a4;
- (int64_t)_potentiallyChangeChosenTopicStateForTopic:(id)a3;
- (int64_t)transactionChange;
- (void)_clearPendingFilterTimer;
- (void)_filtersWillPotentiallyBeChanged:(id)a3;
- (void)_forgetRedListTopic:(id)a3;
- (void)_pendingFilterTimerFired;
- (void)_processPendingChangeIfNeeded;
- (void)_processTopicChange:(id)a3 immediately:(BOOL)a4 alertDelegate:(BOOL)a5;
- (void)_rememberRedListTopic:(id)a3;
- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4;
- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4 shortInterval:(BOOL)a5;
- (void)addTopicsAndAttributes:(id)a3 connectionServer:(id)a4;
- (void)beginTransaction;
- (void)dealloc;
- (void)endTransaction;
- (void)filtersWillPotentiallyBeChangedByPolicy:(id)a3;
- (void)performFilterBlock:(id)a3;
- (void)performTransactionBlock:(id)a3;
- (void)removeAllTopics;
- (void)removeTopics:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5;
- (void)removeTopicsForConnectionServer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInTransaction:(BOOL)a3;
- (void)setIsPowerEfficientToSendFilter:(BOOL)a3;
- (void)setServerGroup:(id)a3;
- (void)setTopicsChanged:(id)a3;
- (void)setTransactionChange:(int64_t)a3;
@end

@implementation APSTopicManager

- (APSTopicManager)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5 userPreferences:(id)a6 ultraConstrainedProvider:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v33 = a6;
  id v17 = a7;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)APSTopicManager;
  v19 = [(APSTopicManager *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_delegate, v18);
    objc_storeStrong((id *)&v20->_user, a5);
    objc_storeStrong((id *)&v20->_userPreferences, a6);
    uint64_t v21 = [v14 name];
    environmentName = v20->_environmentName;
    v20->_environmentName = (NSString *)v21;

    v20->_isPowerEfficientToSendFilter = 1;
    v23 = [[APSTopicFilterPolicyEmbedded alloc] initWithDelegate:v20 ultraConstrainedProvider:v17];
    policy = v20->_policy;
    v20->_policy = &v23->super;

    v25 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:24];
    topicsToTopicsStates = v20->_topicsToTopicsStates;
    v20->_topicsToTopicsStates = v25;

    v27 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:24];
    hashesToTopics = v20->_hashesToTopics;
    v20->_hashesToTopics = v27;

    v29 = [[APSTopicGroup alloc] initWithEnvironment:v14 topicHasher:v15 user:v16];
    group = v20->_group;
    v20->_group = v29;

    objc_storeStrong((id *)&v20->_topicHasher, a4);
    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v20 selector:"_filtersWillPotentiallyBeChanged:" name:@"APSFiltersWillPotentiallyBeChangedNotification" object:0];
  }
  return v20;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(APSTopicManager *)self _clearPendingFilterTimer];
  [(APSTopicFilterPolicy *)self->_policy setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)APSTopicManager;
  [(APSTopicManager *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (BOOL)_isValidEnvironmentToTopics:(id)a3
{
  v3 = [a3 objectForKey:self->_environmentName];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v3 objectForKey:&stru_10012F350],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    BOOL v5 = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = objc_msgSend(v3, "allKeys", 0);
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [v3 objectForKey:v11];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              continue;
            }
          }
          BOOL v5 = 0;
          goto LABEL_17;
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v5 = 1;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
LABEL_17:
  }
  return v5;
}

- (id)_redListTopics
{
  v3 = [(APSUserPreferences *)self->_userPreferences tokenTopics];
  if ([v3 count]
    && [(APSTopicManager *)self _isValidEnvironmentToTopics:v3])
  {
    objc_super v4 = [v3 objectForKey:self->_environmentName];
    if (v4)
    {
      long long v16 = v3;
      BOOL v5 = +[NSMutableArray array];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v6 = [v4 allKeys];
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            v12 = [v4 objectForKey:v11];
            [v12 timeIntervalSinceNow];
            if (v13 <= -691200.0)
            {
              id v14 = +[APSLog topicManager];
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v22 = self;
                __int16 v23 = 2112;
                uint64_t v24 = v11;
                __int16 v25 = 2112;
                v26 = v12;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Pruning stale topic %@ last used %@", buf, 0x20u);
              }
            }
            else
            {
              [v5 addObject:v11];
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
        }
        while (v8);
      }

      v3 = v16;
    }
    else
    {
      BOOL v5 = +[NSArray array];
    }
  }
  else
  {
    BOOL v5 = +[NSArray array];
  }

  return v5;
}

- (void)_rememberRedListTopic:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(APSUserPreferences *)self->_userPreferences tokenTopics];
  id v5 = [v4 mutableCopy];

  if ([(APSTopicManager *)self _isValidEnvironmentToTopics:v5]
    && ([v5 objectForKey:self->_environmentName],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 mutableCopy],
        v6,
        v7))
  {
    id v8 = +[NSDate date];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = +[NSDate date];
    +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v8, v9, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v5)
  {
    [v5 setObject:v7 forKey:self->_environmentName];
  }
  else
  {
    +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v7, self->_environmentName, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(APSUserPreferences *)self->_userPreferences setTokenTopics:v5];
}

- (void)_forgetRedListTopic:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(APSUserPreferences *)self->_userPreferences tokenTopics];
  id v5 = [v4 mutableCopy];

  if ([(APSTopicManager *)self _isValidEnvironmentToTopics:v5]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [v5 objectForKey:self->_environmentName];
    id v8 = [v7 mutableCopy];

    if (v8)
    {
      id v9 = [v8 objectForKey:v10];

      if (v9)
      {
        [v5 setObject:v8 forKey:self->_environmentName];
        [v8 removeObjectForKey:v10];
        [(APSUserPreferences *)self->_userPreferences setTokenTopics:v5];
      }
    }
  }
}

- (id)hasEnabledTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = [(APSTopicGroup *)group hashesToEnabledTopics];
  BOOL v6 = [v5 objectForKey:v4];

  id v7 = [v6 topicName];

  return v7;
}

- (id)hasIgnoredTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = [(APSTopicGroup *)group hashesToIgnoredTopics];
  BOOL v6 = [v5 objectForKey:v4];

  id v7 = [v6 topicName];

  return v7;
}

- (id)hasPausedTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = [(APSTopicGroup *)group hashesToPausedTopics];
  BOOL v6 = [v5 objectForKey:v4];

  id v7 = [v6 topicName];

  return v7;
}

- (id)hasOpportunisticTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = [(APSTopicGroup *)group hashesToOpportunisticTopics];
  BOOL v6 = [v5 objectForKey:v4];

  id v7 = [v6 topicName];

  return v7;
}

- (id)hasNonWakingTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = [(APSTopicGroup *)group hashesToNonWakingTopics];
  BOOL v6 = [v5 objectForKey:v4];

  id v7 = [v6 topicName];

  return v7;
}

- (BOOL)_hasTopic:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_topicsToTopicsStates objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)hasTopicHash:(id)a3 includeRecentlyRemoved:(BOOL)a4
{
  return -[NSMutableDictionary objectForKey:](self->_hashesToTopics, "objectForKey:", a3, a4);
}

- (id)hasTopicHash:(id)a3
{
  return [(APSTopicManager *)self hasTopicHash:a3 includeRecentlyRemoved:1];
}

- (BOOL)hasListeningTopics
{
  v3 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v6 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
      BOOL v4 = [v6 count] != 0;
    }
  }

  return v4;
}

- (BOOL)hasPausedTopics
{
  v2 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasListeningTopic:(id)a3
{
  id v4 = a3;
  if ([(APSTopicManager *)self hasListeningTopics])
  {
    id v5 = [(APSTopicHasher *)self->_topicHasher topicHashForTopic:v4 user:self->_user];
    BOOL v6 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
    id v7 = [v6 objectForKey:v5];
    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
      id v10 = [v9 objectForKey:v5];
      if (v10)
      {
        BOOL v8 = 1;
      }
      else
      {
        uint64_t v11 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
        v12 = [v11 objectForKey:v5];
        BOOL v8 = v12 != 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasListeningTopicHash:(id)a3
{
  id v4 = a3;
  if ([(APSTopicManager *)self hasListeningTopics])
  {
    id v5 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
    BOOL v6 = [v5 objectForKey:v4];
    if (v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      BOOL v8 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
      id v9 = [v8 objectForKey:v4];
      if (v9)
      {
        BOOL v7 = 1;
      }
      else
      {
        id v10 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
        uint64_t v11 = [v10 objectForKey:v4];
        BOOL v7 = v11 != 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasPausedTopic:(id)a3
{
  id v4 = a3;
  if ([(APSTopicManager *)self hasPausedTopics])
  {
    id v5 = [(APSTopicHasher *)self->_topicHasher topicHashForTopic:v4 user:self->_user];
    BOOL v6 = [(APSTopicManager *)self hasPausedTopicHash:v5];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasSendingTopics
{
  BOOL v3 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v6 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
      if ([v6 count])
      {
        BOOL v4 = 1;
      }
      else
      {
        BOOL v7 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
        BOOL v4 = [v7 count] != 0;
      }
    }
  }
  return v4;
}

- (BOOL)hasSendingTopicHash:(id)a3
{
  id v4 = a3;
  if ([(APSTopicManager *)self hasSendingTopics])
  {
    id v5 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
    BOOL v6 = [v5 objectForKey:v4];
    if (v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      BOOL v8 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
      id v9 = [v8 objectForKey:v4];
      if (v9)
      {
        BOOL v7 = 1;
      }
      else
      {
        id v10 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
        uint64_t v11 = [v10 objectForKey:v4];
        if (v11)
        {
          BOOL v7 = 1;
        }
        else
        {
          v12 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
          double v13 = [v12 objectForKey:v4];
          BOOL v7 = v13 != 0;
        }
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasSendingTopic:(id)a3
{
  id v4 = a3;
  if ([(APSTopicManager *)self hasSendingTopics])
  {
    id v5 = [(APSTopicHasher *)self->_topicHasher topicHashForTopic:v4 user:self->_user];
    BOOL v6 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
    BOOL v7 = [v6 objectForKey:v5];
    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
      id v10 = [v9 objectForKey:v5];
      if (v10)
      {
        BOOL v8 = 1;
      }
      else
      {
        uint64_t v11 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
        v12 = [v11 objectForKey:v5];
        if (v12)
        {
          BOOL v8 = 1;
        }
        else
        {
          double v13 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
          id v14 = [v13 objectForKey:v5];
          BOOL v8 = v14 != 0;
        }
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasUltraConstrainedPermissionForTopic:(id)a3
{
  [(NSMutableDictionary *)self->_topicsToTopicsStates objectForKeyedSubscript:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "attributes", (void)v10);
        unsigned __int8 v8 = [v7 isUltraConstrainedEnabled];

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (id)hasRecentlyRemovedTopicHash:(id)a3
{
  return 0;
}

- (id)_topicStateForTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5
{
  id v8 = a4;
  [(NSMutableDictionary *)self->_topicsToTopicsStates objectForKey:a3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "connectionServer", (void)v20);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15 == v8)
        {
          long long v16 = [v14 attributes];
          id v17 = [v16 filter];

          if (v17 == (id)a5)
          {
            id v18 = v14;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v18 = 0;
LABEL_13:

  return v18;
}

- (BOOL)_recategorizeTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 topicHash];
  if (self->_inTransaction)
  {
    BOOL v6 = [(APSTopicManager *)self topicsChanged];

    if (!v6)
    {
      id v7 = objc_alloc_init((Class)NSMutableArray);
      [(APSTopicManager *)self setTopicsChanged:v7];
    }
    id v8 = [(APSTopicManager *)self topicsChanged];
    unsigned __int8 v9 = [v8 containsObject:v4];

    if ((v9 & 1) == 0)
    {
      id v10 = [(APSTopicManager *)self topicsChanged];
      [v10 addObject:v4];
    }
  }
  id v11 = [v4 desiredFilter];
  id v12 = [v4 currentFilter];
  if (v11 != v12)
  {
    switch((unint64_t)[v4 desiredFilter])
    {
      case 1uLL:
        long long v13 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
        goto LABEL_13;
      case 2uLL:
        long long v13 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
        goto LABEL_13;
      case 3uLL:
        long long v13 = [(APSTopicGroup *)self->_group hashesToIgnoredTopics];
        goto LABEL_13;
      case 4uLL:
        long long v13 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
        goto LABEL_13;
      case 5uLL:
        long long v13 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
LABEL_13:
        id v14 = v13;
        [v13 setObject:v4 forKey:v5];

        break;
      default:
        break;
    }
    switch((unint64_t)[v4 currentFilter])
    {
      case 1uLL:
        id v15 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
        goto LABEL_20;
      case 2uLL:
        id v15 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
        goto LABEL_20;
      case 3uLL:
        id v15 = [(APSTopicGroup *)self->_group hashesToIgnoredTopics];
        goto LABEL_20;
      case 4uLL:
        id v15 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
        goto LABEL_20;
      case 5uLL:
        id v15 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
LABEL_20:
        long long v16 = v15;
        [v15 removeObjectForKey:v5];

        break;
      default:
        break;
    }
    id v17 = +[APSLog topicManager];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v4 topicName];
      long long v19 = sub_100067094((unint64_t)[v4 currentFilter]);
      long long v20 = sub_100067094((unint64_t)[v4 desiredFilter]);
      int v22 = 138413058;
      long long v23 = self;
      __int16 v24 = 2112;
      __int16 v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: recategorizing topic %@ from %@ to %@", (uint8_t *)&v22, 0x2Au);
    }
    objc_msgSend(v4, "setCurrentFilter:", objc_msgSend(v4, "desiredFilter"));
  }

  return v11 != v12;
}

- (BOOL)_addTopic:(id)a3 connectionServer:(id)a4 attributes:(id)a5 change:(int64_t *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = -[APSTopicManager _topicStateForTopic:connectionServer:filter:](self, "_topicStateForTopic:connectionServer:filter:", v9, v10, [v11 filter]);
  uint64_t v13 = [(APSTopicHasher *)self->_topicHasher topicHashForTopic:v9 user:self->_user];
  id v14 = [[APSTopicState alloc] initWithTopicName:v9 connectionServer:v10 attributes:v11 topicHash:v13];
  id v15 = +[APSLog topicManager];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v56 = self;
    __int16 v57 = 2112;
    id v58 = v9;
    __int16 v59 = 2112;
    *(void *)v60 = v13;
    *(_WORD *)&v60[8] = 2112;
    id v61 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: adding topic %@ (%@) for connection server %@", buf, 0x2Au);
  }
  v46 = (void *)v13;

  long long v16 = [(NSMutableDictionary *)self->_topicsToTopicsStates objectForKey:v9];
  id v17 = v16;
  if (v12)
  {
    [v16 removeObject:v12];
    [v17 addObject:v14];
  }
  else
  {
    if (v16)
    {
      [v16 addObject:v14];
    }
    else
    {
      id v17 = +[NSMutableArray arrayWithObject:v14];
      [(NSMutableDictionary *)self->_topicsToTopicsStates setObject:v17 forKey:v9];
    }
    if ([v17 count] == (id)1)
    {
      hashesToTopics = self->_hashesToTopics;
      long long v19 = [(APSTopicState *)v14 topicHash];
      [(NSMutableDictionary *)hashesToTopics setObject:v9 forKey:v19];
    }
  }
  v48 = v11;
  v49 = v10;
  v47 = (void *)v12;
  if ([v17 count] == (id)1)
  {
    long long v20 = v14;
LABEL_12:
    long long v21 = 0;
    id v22 = 0;
    goto LABEL_13;
  }
  uint64_t v25 = [(APSTopicFilterPolicy *)self->_policy topicChosenByPolicyFromTopics:v17];
  if ((APSTopicState *)v25 != v14)
  {
    __int16 v26 = (void *)v25;
    int v24 = 0;
    long long v21 = 0;
    int64_t v27 = [(APSTopicState *)v14 currentFilter];
    goto LABEL_39;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v29 = v17;
  id v30 = [v29 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (!v30)
  {

    goto LABEL_12;
  }
  id v31 = v30;
  uint64_t v32 = *(void *)v52;
  while (2)
  {
    for (i = 0; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v52 != v32) {
        objc_enumerationMutation(v29);
      }
      objc_super v34 = *(APSTopicState **)(*((void *)&v51 + 1) + 8 * i);
      if (v34 != v14 && [*(id *)(*((void *)&v51 + 1) + 8 * i) currentFilter])
      {
        long long v21 = v34;
        id v22 = [(APSTopicState *)v21 currentFilter];
        goto LABEL_46;
      }
    }
    id v31 = [v29 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v31) {
      continue;
    }
    break;
  }
  id v22 = 0;
  long long v21 = 0;
LABEL_46:

  id v10 = v49;
LABEL_13:
  [(APSTopicState *)v14 setDesiredFilter:[(APSTopicFilterPolicy *)self->_policy filterChosenByPolicyForTopic:v14]];
  if (!v21)
  {
    [(APSTopicManager *)self _recategorizeTopic:v14];
    goto LABEL_19;
  }
  id v23 = [(APSTopicState *)v14 desiredFilter];
  [(APSTopicState *)v21 setDesiredFilter:0];
  [(APSTopicManager *)self _recategorizeTopic:v21];
  [(APSTopicManager *)self _recategorizeTopic:v14];
  if (v23 != v22)
  {
LABEL_19:
    id v28 = [(APSTopicState *)v14 currentFilter];
    if (v28 == (id)3 || v28 == (id)5)
    {
      int v24 = 1;
      if (v28 == (id)3 && v22 == (id)5)
      {
        [(APSTopicManager *)self _forgetRedListTopic:v9];
        uint64_t v44 = 5;
        [(APSTopicManager *)self _removeTopic:v9 connectionServer:0 filter:5];
      }
      else
      {
        uint64_t v44 = (uint64_t)v22;
      }
    }
    else
    {
      uint64_t v44 = (uint64_t)v22;
      if (v10) {
        [(APSTopicManager *)self _rememberRedListTopic:v9];
      }
      int v24 = 1;
    }
    goto LABEL_38;
  }
  uint64_t v44 = (uint64_t)v22;
  int v24 = 0;
LABEL_38:
  __int16 v26 = v14;
  int64_t v27 = [(APSTopicState *)v14 currentFilter];
LABEL_39:
  int64_t v35 = v27;
  v36 = [(APSTopicManager *)self serverGroup];
  id v37 = [v36 currentFilterForTopicState:v26];

  if (v24) {
    int64_t v38 = [(APSTopicManager *)self _changeFromFilter:v37 toFilter:v35];
  }
  else {
    int64_t v38 = 0;
  }
  v39 = a6;
  *a6 = v38;
  v40 = +[APSLog topicManager];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = sub_100043A2C(*a6);
    *(_DWORD *)buf = 138413570;
    v56 = self;
    __int16 v57 = 2112;
    id v58 = v9;
    __int16 v59 = 1024;
    *(_DWORD *)v60 = v35;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v45;
    LOWORD(v61) = 1024;
    *(_DWORD *)((char *)&v61 + 2) = v37;
    HIWORD(v61) = 2112;
    v62 = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@: calculated change type for %@ {newTopicFilter: %d, previouslyChosenTopicFilter: %d, previousServerTopicFilter: %d change: %@}", buf, 0x32u);

    v39 = a6;
  }

  BOOL v42 = *v39 != 0;
  return v42;
}

- (void)beginTransaction
{
  [(APSTopicManager *)self setInTransaction:1];
  policy = self->_policy;
  [(APSTopicFilterPolicy *)policy logFilterPolicyInformation];
}

- (void)endTransaction
{
  [(APSTopicManager *)self setInTransaction:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = [(APSTopicManager *)self topicsChanged];
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        policy = self->_policy;
        topicsToTopicsStates = self->_topicsToTopicsStates;
        uint64_t v12 = [v9 topicName];
        uint64_t v13 = [(NSMutableDictionary *)topicsToTopicsStates objectForKeyedSubscript:v12];
        id v14 = [(APSTopicFilterPolicy *)policy topicChosenByPolicyFromTopics:v13];

        id v15 = [(APSTopicManager *)self serverGroup];
        id v16 = [v15 currentFilterForTopicState:v9];

        int64_t v17 = [(APSTopicManager *)self _changeFromFilter:v16 toFilter:[(APSTopicFilterPolicy *)self->_policy filterChosenByPolicyForTopic:v14]];
        if (v6 <= v17) {
          int64_t v6 = v17;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  id v18 = +[APSLog topicManager];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = sub_100043A2C(v6);
    long long v20 = [(APSTopicManager *)self topicsChanged];
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = self;
    __int16 v33 = 2112;
    objc_super v34 = v19;
    __int16 v35 = 2112;
    v36 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: completed transaction - calculated change %@ {topics changed: %@}", buf, 0x20u);
  }
  long long v21 = [APSFilterChange alloc];
  id v22 = [(APSTopicManager *)self topicsChanged];
  id v23 = [v22 firstObject];
  int v24 = [v23 topicName];
  uint64_t v25 = [(APSFilterChange *)v21 initWithChange:v6 triggeringTopic:v24];

  [(APSTopicManager *)self setTopicsChanged:0];
  if (v6) {
    [(APSTopicManager *)self _processTopicChange:v25 immediately:0 alertDelegate:1];
  }
}

- (void)performTransactionBlock:(id)a3
{
  id v4 = (void (**)(id, APSTopicManager *))a3;
  [(APSTopicManager *)self beginTransaction];
  v4[2](v4, self);

  [(APSTopicManager *)self endTransaction];
}

- (void)addTopicsAndAttributes:(id)a3 connectionServer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = &objc_retain_x28_ptr;
  id v9 = +[APSLog topicManager];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 allKeys];
    id v11 = APSPrettyPrintCollection();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v37 = 2112;
    int64_t v38 = v11;
    __int16 v39 = 2112;
    id v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: adding topics %@ for connection server %@", buf, 0x20u);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0;
    char v16 = 0;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        *(void *)buf = 0;
        long long v20 = objc_msgSend(v12, "objectForKey:", v19, (void)v31);
        unsigned int v21 = [(APSTopicManager *)self _addTopic:v19 connectionServer:v7 attributes:v20 change:buf];

        uint64_t v22 = *(void *)buf;
        if (*(uint64_t *)buf <= v15) {
          uint64_t v22 = v15;
        }
        if (v21) {
          uint64_t v15 = v22;
        }
        v16 |= v21;
      }
      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);

    id v8 = &objc_retain_x28_ptr;
    if (v16)
    {
      id v23 = [APSFilterChange alloc];
      int v24 = [v12 allKeys];
      uint64_t v25 = [v24 firstObject];
      __int16 v26 = [(APSFilterChange *)v23 initWithChange:v15 triggeringTopic:v25];

      [(APSTopicManager *)self _processTopicChange:v26 immediately:0 alertDelegate:1];
      goto LABEL_21;
    }
  }
  else
  {
  }
  long long v27 = [(APSTopicManager *)self group];
  long long v28 = [(APSTopicManager *)self serverGroup];
  unsigned int v29 = [v27 isEqual:v28];

  if (v29)
  {
    long long v30 = [v8[147] topicManager];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ no change detected between the new filter and the old server filter - cancelling any pending updates", buf, 0xCu);
    }

    [(APSTopicManager *)self _clearPendingFilterTimer];
  }
LABEL_21:
}

- (BOOL)_removeTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(APSTopicManager *)self _topicStateForTopic:v8 connectionServer:v9 filter:a5];
  id v11 = +[APSLog topicManager];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    uint64_t v25 = self;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: removing topic %@ for connection server %@", (uint8_t *)&v24, 0x20u);
  }

  if (v10)
  {
    id v12 = [(NSMutableDictionary *)self->_topicsToTopicsStates objectForKey:v8];
    [v12 removeObject:v10];
    id v13 = [v10 currentFilter];
    if (v13)
    {
      [v10 setDesiredFilter:0];
      [(APSTopicManager *)self _recategorizeTopic:v10];
      if ([v12 count])
      {
        id v14 = [(APSTopicFilterPolicy *)self->_policy topicChosenByPolicyFromTopics:v12];
        objc_msgSend(v14, "setDesiredFilter:", -[APSTopicFilterPolicy filterChosenByPolicyForTopic:](self->_policy, "filterChosenByPolicyForTopic:", v14));
        [(APSTopicManager *)self _recategorizeTopic:v14];
        BOOL v15 = v13 != [v14 currentFilter];
      }
      else
      {
        BOOL v15 = 0;
      }
      if ([v12 count]) {
        goto LABEL_16;
      }
      if (v13 == (id)3)
      {
        hashesToTopics = self->_hashesToTopics;
        id v18 = [v10 topicHash];
        [(NSMutableDictionary *)hashesToTopics removeObjectForKey:v18];

        goto LABEL_16;
      }
    }
    else
    {
      BOOL v15 = 0;
      if ([v12 count])
      {
LABEL_16:

        BOOL v16 = v15;
        goto LABEL_17;
      }
    }
    uint64_t v19 = self->_hashesToTopics;
    long long v20 = [v10 topicHash];
    [(NSMutableDictionary *)v19 removeObjectForKey:v20];

    topicsToTopicsStates = self->_topicsToTopicsStates;
    uint64_t v22 = [v10 topicName];
    [(NSMutableDictionary *)topicsToTopicsStates removeObjectForKey:v22];

    if (v13 != (id)5) {
      BOOL v15 = 1;
    }
    goto LABEL_16;
  }
  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (void)removeTopics:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v8);
        }
        v12 |= [(APSTopicManager *)self _removeTopic:*(void *)(*((void *)&v18 + 1) + 8 * i) connectionServer:v9 filter:a5];
      }
      id v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
    if (v12)
    {
      BOOL v15 = [APSFilterChange alloc];
      BOOL v16 = [v8 anyObject];
      uint64_t v17 = [(APSFilterChange *)v15 initWithChange:2 triggeringTopic:v16];

      [(APSTopicManager *)self _processTopicChange:v17 immediately:0 alertDelegate:1];
    }
  }
}

- (void)removeTopicsForConnectionServer:(id)a3
{
  id v4 = a3;
  id v5 = [(APSTopicManager *)self topicStatesForConnectionServer:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v12 = [v11 topicName];
        uint64_t v13 = [v11 attributes];
        unsigned __int8 v14 = -[APSTopicManager _removeTopic:connectionServer:filter:](self, "_removeTopic:connectionServer:filter:", v12, v4, [v13 filter]);

        v8 |= v14;
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
    if (v8)
    {
      BOOL v15 = [APSFilterChange alloc];
      BOOL v16 = [v5 firstObject];
      uint64_t v17 = [v16 topicName];
      long long v18 = [(APSFilterChange *)v15 initWithChange:2 triggeringTopic:v17];

      [(APSTopicManager *)self _processTopicChange:v18 immediately:0 alertDelegate:1];
    }
  }
}

- (void)removeAllTopics
{
  id v3 = [(NSMutableDictionary *)self->_topicsToTopicsStates count];
  id v4 = [(NSMutableDictionary *)self->_topicsToTopicsStates allKeys];
  id v11 = [v4 firstObject];

  [(NSMutableDictionary *)self->_topicsToTopicsStates removeAllObjects];
  id v5 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
  [v5 removeAllObjects];

  id v6 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
  [v6 removeAllObjects];

  id v7 = [(APSTopicGroup *)self->_group hashesToIgnoredTopics];
  [v7 removeAllObjects];

  char v8 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
  [v8 removeAllObjects];

  uint64_t v9 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
  [v9 removeAllObjects];

  if (v3)
  {
    id v10 = [[APSFilterChange alloc] initWithChange:2 triggeringTopic:v11];
    [(APSTopicManager *)self _processTopicChange:v10 immediately:0 alertDelegate:1];
  }
}

- (id)topicStatesForConnectionServer:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v19 = self;
  id obj = self->_topicsToTopicsStates;
  id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [(NSMutableDictionary *)v19->_topicsToTopicsStates objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              unsigned __int8 v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              id v15 = [v14 connectionServer];

              if (v15 == v4) {
                [v5 addObject:v14];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v11);
        }
      }
      id v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)setIsPowerEfficientToSendFilter:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isPowerEfficientToSendFilter != a3)
  {
    id v5 = +[APSLog topicManager];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412546;
      char v8 = self;
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ isPowerEfficientToSendFilter changed to %@", (uint8_t *)&v7, 0x16u);
    }

    self->_isPowerEfficientToSendFilter = v3;
  }
  if (v3) {
    [(APSTopicManager *)self _processPendingChangeIfNeeded];
  }
}

- (void)_processTopicChange:(id)a3 immediately:(BOOL)a4 alertDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (![(APSTopicManager *)self inTransaction])
  {
    __int16 v9 = +[APSLog topicManager];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = sub_100043A2C((unint64_t)[v8 topicGroupChange]);
      id v11 = (void *)v10;
      CFStringRef v12 = @"NO";
      *(_DWORD *)long long v22 = 138413058;
      *(void *)&v22[4] = self;
      if (v6) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      if (v5) {
        CFStringRef v12 = @"YES";
      }
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v10;
      __int16 v23 = 2112;
      CFStringRef v24 = v13;
      __int16 v25 = 2112;
      CFStringRef v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: process topic change with change = %@, immediately = %@, alert = %@", v22, 0x2Au);
    }
    if ([v8 topicGroupChange])
    {
      if (v6)
      {
        if (!v5)
        {
          uint64_t v17 = +[APSLog topicManager];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v22 = 138412290;
            *(void *)&v22[4] = self;
            long long v21 = "%@ processed change -- would immediately tell our delegate but we were asked not to";
LABEL_21:
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v21, v22, 0xCu);
          }
          goto LABEL_22;
        }
        [(APSTopicManager *)self _clearPendingFilterTimer];
        unsigned __int8 v14 = +[APSLog topicManager];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v22 = 138412290;
          *(void *)&v22[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ processing immediate change to server topics", v22, 0xCu);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          uint64_t v17 = objc_loadWeakRetained((id *)&self->_delegate);
          [v17 topicManagerRequestToSendFilter:self change:v8];
LABEL_22:
        }
      }
      else
      {
        switch((unint64_t)[v8 topicGroupChange])
        {
          case 1uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
            uint64_t v18 = self;
            id v19 = v8;
            uint64_t v20 = 0;
            goto LABEL_18;
          case 2uLL:
            [(APSTopicManager *)self _scheduleServerUpdateWithChange:v8 timer:1 shortInterval:0];
            break;
          case 3uLL:
          case 9uLL:
          case 0xAuLL:
            [(APSTopicManager *)self _processTopicChange:v8 immediately:1 alertDelegate:v5];
            break;
          case 8uLL:
            uint64_t v18 = self;
            id v19 = v8;
            uint64_t v20 = 1;
LABEL_18:
            -[APSTopicManager _scheduleServerUpdateWithChange:timer:](v18, "_scheduleServerUpdateWithChange:timer:", v19, v20, *(_OWORD *)v22);
            break;
          default:
            uint64_t v17 = +[APSLog topicManager];
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            *(_DWORD *)long long v22 = 138412290;
            *(void *)&v22[4] = self;
            long long v21 = "%@ no change detected";
            goto LABEL_21;
        }
      }
    }
  }
}

- (int64_t)_potentiallyChangeChosenTopicStateForTopic:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_topicsToTopicsStates objectForKey:a3];
  if ([v4 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          __int16 v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v9, "currentFilter", (void)v17))
          {
            id v6 = v9;
            id v10 = [v6 currentFilter];
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v10 = 0;
LABEL_12:

    id v11 = [(APSTopicFilterPolicy *)self->_policy topicChosenByPolicyFromTopics:v5];
    int64_t v12 = [(APSTopicFilterPolicy *)self->_policy filterChosenByPolicyForTopic:v11];
    [v11 setDesiredFilter:v12];
    if (v6)
    {
      if (v11 == v6)
      {
        CFStringRef v13 = self;
        id v14 = v6;
LABEL_18:
        -[APSTopicManager _recategorizeTopic:](v13, "_recategorizeTopic:", v14, (void)v17);
        if (v10 == (id)v12)
        {
          int64_t v15 = 0;
LABEL_26:

          goto LABEL_27;
        }
        if (v10)
        {
          if (v12 == 1)
          {
            int64_t v15 = 8;
            goto LABEL_26;
          }
        }
        else if ((unint64_t)(v12 - 1) < 4)
        {
          int64_t v15 = qword_10010E9F8[v12 - 1];
          goto LABEL_26;
        }
        int64_t v15 = 1;
        goto LABEL_26;
      }
      [v6 setDesiredFilter:0];
      [(APSTopicManager *)self _recategorizeTopic:v6];
    }
    CFStringRef v13 = self;
    id v14 = v11;
    goto LABEL_18;
  }
  int64_t v15 = 0;
LABEL_27:

  return v15;
}

- (void)filtersWillPotentiallyBeChangedByPolicy:(id)a3
{
  id v4 = a3;
  [v4 logFilterPolicyInformation];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NSMutableDictionary *)self->_topicsToTopicsStates allKeys];
  id v6 = [(APSFilterChange *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    id v17 = v4;
    int64_t v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v19;
    id v11 = &stru_10012F350;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int64_t v14 = [(APSTopicManager *)self _potentiallyChangeChosenTopicStateForTopic:v13];
        if (v14)
        {
          int64_t v15 = v14;
          if (v14 <= v8)
          {
            char v9 = 1;
          }
          else
          {
            char v16 = v13;

            char v9 = 1;
            id v11 = v16;
            int64_t v8 = v15;
          }
        }
      }
      id v7 = [(APSFilterChange *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);

    if ((v9 & 1) == 0)
    {
      id v4 = v17;
      goto LABEL_17;
    }
    id v5 = [[APSFilterChange alloc] initWithChange:v8 triggeringTopic:v11];
    [(APSTopicManager *)self _processTopicChange:v5 immediately:1 alertDelegate:1];
    id v4 = v17;
  }
  else
  {
    id v11 = &stru_10012F350;
  }

LABEL_17:
}

- (void)_filtersWillPotentiallyBeChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"topic"];

  if ([(APSTopicManager *)self _hasTopic:v5])
  {
    id v6 = +[APSLog topicManager];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      int64_t v8 = self;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Filter will potentially be changed for topic %@", (uint8_t *)&v7, 0x16u);
    }

    [(APSTopicManager *)self filtersWillPotentiallyBeChangedByPolicy:self->_policy];
  }
}

- (void)_clearPendingFilterTimer
{
  self->_pendingServerUpdate = 0;
  [(NSTimer *)self->_pendingFilterTimer invalidate];
  pendingFilterTimer = self->_pendingFilterTimer;
  self->_pendingFilterTimer = 0;
}

- (void)_processPendingChangeIfNeeded
{
  if (self->_pendingServerUpdate)
  {
    BOOL v3 = +[APSLog topicManager];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ _processPendingChangeIfNeeded, forcing timer to fire!", (uint8_t *)&v4, 0xCu);
    }

    [(APSTopicManager *)self _pendingFilterTimerFired];
  }
}

- (void)_pendingFilterTimerFired
{
  BOOL v3 = +[APSLog topicManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ _pendingFilterTimerFired", (uint8_t *)&v5, 0xCu);
  }

  [(APSTopicManager *)self _clearPendingFilterTimer];
  [(APSTopicManager *)self _processTopicChange:self->_pendingChange immediately:1 alertDelegate:1];
  pendingChange = self->_pendingChange;
  self->_pendingChange = 0;
}

- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4
{
}

- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4 shortInterval:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = [v9 topicGroupChange];
  if ((uint64_t)v10 > [(APSFilterChange *)self->_pendingChange topicGroupChange]) {
    objc_storeStrong((id *)&self->_pendingChange, a3);
  }
  id v11 = +[APSLog topicManager];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = sub_100043A2C((unint64_t)[v9 topicGroupChange]);
    CFStringRef v13 = (void *)v12;
    CFStringRef v14 = @"NO";
    BOOL isPowerEfficientToSendFilter = self->_isPowerEfficientToSendFilter;
    *(_DWORD *)CFStringRef v24 = 138413314;
    *(void *)&v24[4] = self;
    if (v6) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    if (v5) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    *(_WORD *)&v24[12] = 2112;
    *(void *)&v24[14] = v12;
    if (isPowerEfficientToSendFilter) {
      CFStringRef v14 = @"YES";
    }
    *(_WORD *)&v24[22] = 2112;
    CFStringRef v25 = v16;
    __int16 v26 = 2112;
    CFStringRef v27 = v17;
    __int16 v28 = 2112;
    CFStringRef v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Schedule server update with change %@; withTimer %@; shortInterval %@; isPowerEfficientToSendFilter %@",
      v24,
      0x34u);
  }
  if (self->_isPowerEfficientToSendFilter && v5)
  {
    long long v18 = +[APSLog topicManager];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFStringRef v24 = 138412290;
      *(void *)&v24[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ asked to schedule an update but it's power efficient now. Processing update now.", v24, 0xCu);
    }

    [(APSTopicManager *)self _pendingFilterTimerFired];
  }
  else
  {
    if (v6)
    {
      [(APSTopicManager *)self _clearPendingFilterTimer];
      long long v19 = +[APSLog topicManager];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CFStringRef v24 = 138412290;
        *(void *)&v24[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ scheduling a pending filter timer.", v24, 0xCu);
      }

      double v20 = 300.0;
      if (v5) {
        double v20 = 20.0;
      }
      +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_pendingFilterTimerFired", 0, 0, v20, *(_OWORD *)v24, *(void *)&v24[16]);
      long long v21 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      pendingFilterTimer = self->_pendingFilterTimer;
      self->_pendingFilterTimer = v21;

      [(NSTimer *)self->_pendingFilterTimer setTolerance:2.0];
    }
    else
    {
      __int16 v23 = +[APSLog topicManager];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CFStringRef v24 = 138412290;
        *(void *)&v24[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ Topic change is low priority, not scheduling a timer.", v24, 0xCu);
      }
    }
    self->_pendingServerUpdate = 1;
  }
}

- (void)performFilterBlock:(id)a3
{
  int v4 = (void (**)(id, void *, void *, void *, void *, void *, void *))a3;
  BOOL v5 = +[APSLog topicManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int64_t v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to performFilterBlock", (uint8_t *)&v14, 0xCu);
  }

  [(APSTopicManager *)self _clearPendingFilterTimer];
  BOOL v6 = [(APSTopicManager *)self group];
  id v7 = [v6 copy];
  [(APSTopicManager *)self setServerGroup:v7];

  if (v4)
  {
    int64_t v8 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
    id v9 = [(APSTopicGroup *)self->_group hashesToIgnoredTopics];
    id v10 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
    id v11 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
    uint64_t v12 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
    CFStringRef v13 = [(APSTopicHasher *)self->_topicHasher topicsToSaltsWithUser:self->_user];
    v4[2](v4, v8, v9, v10, v11, v12, v13);
  }
}

- (id)debugDescription
{
  uint64_t v16 = objc_opt_class();
  uint64_t v3 = [(APSUser *)self->_user name];
  environmentName = self->_environmentName;
  int64_t v15 = (void *)v3;
  long long v18 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
  int v4 = APSPrettyPrintCollection();
  CFStringRef v17 = [(APSTopicGroup *)self->_group hashesToOpportunisticTopics];
  BOOL v5 = APSPrettyPrintCollection();
  BOOL v6 = [(APSTopicGroup *)self->_group hashesToNonWakingTopics];
  id v7 = APSPrettyPrintCollection();
  int64_t v8 = [(APSTopicGroup *)self->_group hashesToIgnoredTopics];
  id v9 = APSPrettyPrintCollection();
  id v10 = [(APSTopicGroup *)self->_group hashesToPausedTopics];
  id v11 = APSPrettyPrintCollection();
  uint64_t v12 = +[NSString stringWithFormat:@"<<%@: %p>: { userName=%@, environment=%@, enabledTopics=%@, opportunisticTopics=%@, nonWakingTopics=%@, ignoredTopics=%@, pausedTopics=%@ }>", v16, self, v15, environmentName, v4, v5, v7, v9, v11];

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  environmentName = self->_environmentName;
  BOOL v5 = [(APSUser *)self->_user name];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; %@; %@>",
    v3,
    self,
    environmentName,
  BOOL v6 = v5);

  return v6;
}

- (NSString)logString
{
  id v49 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@: {\n", self];
  uint64_t v3 = +[NSMutableSet setWithCapacity:16];
  int v4 = +[NSMutableSet setWithCapacity:16];
  BOOL v5 = +[NSMutableSet setWithCapacity:16];
  BOOL v6 = +[NSMutableSet setWithCapacity:16];
  id v7 = +[NSMutableSet setWithCapacity:16];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v50 = self;
  int64_t v8 = [(APSTopicGroup *)self->_group hashesToEnabledTopics];
  id v9 = [v8 allValues];

  id v10 = [v9 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v68;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v68 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = [*(id *)(*((void *)&v67 + 1) + 8 * i) topicName];
        [v3 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v11);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  int64_t v15 = [(APSTopicGroup *)v50->_group hashesToIgnoredTopics];
  uint64_t v16 = [v15 allValues];

  id v17 = [v16 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v64;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v64 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)j) topicName];
        [v4 addObject:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v18);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v22 = [(APSTopicGroup *)v50->_group hashesToOpportunisticTopics];
  __int16 v23 = [v22 allValues];

  id v24 = [v23 countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v60;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v60 != v26) {
          objc_enumerationMutation(v23);
        }
        __int16 v28 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)k) topicName];
        [v5 addObject:v28];
      }
      id v25 = [v23 countByEnumeratingWithState:&v59 objects:v73 count:16];
    }
    while (v25);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  CFStringRef v29 = [(APSTopicGroup *)v50->_group hashesToPausedTopics];
  long long v30 = [v29 allValues];

  id v31 = [v30 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v56;
    do
    {
      for (m = 0; m != v32; m = (char *)m + 1)
      {
        if (*(void *)v56 != v33) {
          objc_enumerationMutation(v30);
        }
        __int16 v35 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)m) topicName];
        [v7 addObject:v35];
      }
      id v32 = [v30 countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v32);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v36 = [(APSTopicGroup *)v50->_group hashesToNonWakingTopics];
  __int16 v37 = [v36 allValues];

  id v38 = [v37 countByEnumeratingWithState:&v51 objects:v71 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v52;
    do
    {
      for (n = 0; n != v39; n = (char *)n + 1)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v37);
        }
        BOOL v42 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)n) topicName];
        [v6 addObject:v42];
      }
      id v39 = [v37 countByEnumeratingWithState:&v51 objects:v71 count:16];
    }
    while (v39);
  }

  [v49 appendString:@"\tEnabled"];
  v43 = APSPrettyPrintCollection();
  [v49 appendString:v43];

  [v49 appendString:@"\tIgnored"];
  uint64_t v44 = APSPrettyPrintCollection();
  [v49 appendString:v44];

  [v49 appendString:@"\tOpportunistic"];
  int v45 = APSPrettyPrintCollection();
  [v49 appendString:v45];

  [v49 appendString:@"\tPaused"];
  v46 = APSPrettyPrintCollection();
  [v49 appendString:v46];

  [v49 appendString:@"\tNon-waking"];
  v47 = APSPrettyPrintCollection();
  [v49 appendString:v47];

  [v49 appendString:@"\t}"];
  return (NSString *)v49;
}

- (int64_t)_changeFromFilter:(int64_t)a3 toFilter:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      if ((unint64_t)a4 >= 5) {
        goto LABEL_13;
      }
      int v4 = &unk_10010EA18;
      goto LABEL_12;
    case 1:
      if ((unint64_t)a4 >= 5) {
        goto LABEL_13;
      }
      int v4 = &unk_10010EA40;
      goto LABEL_12;
    case 2:
      if ((unint64_t)a4 >= 5) {
        goto LABEL_13;
      }
      int v4 = &unk_10010EA68;
      goto LABEL_12;
    case 3:
      if ((unint64_t)a4 >= 5) {
        goto LABEL_13;
      }
      int v4 = &unk_10010EA90;
      goto LABEL_12;
    case 4:
      if ((unint64_t)a4 > 4) {
        goto LABEL_13;
      }
      int v4 = &unk_10010EAB8;
LABEL_12:
      int64_t result = v4[a4];
      break;
    default:
LABEL_13:
      int64_t result = 1;
      break;
  }
  return result;
}

- (APSTopicGroup)group
{
  return self->_group;
}

- (APSTopicManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSTopicManagerDelegate *)WeakRetained;
}

- (BOOL)pendingServerUpdate
{
  return self->_pendingServerUpdate;
}

- (APSTopicHasher)topicHasher
{
  return self->_topicHasher;
}

- (NSDictionary)hashesToTopics
{
  return &self->_hashesToTopics->super;
}

- (APSTopicFilterPolicy)policy
{
  return self->_policy;
}

- (BOOL)inTransaction
{
  return self->_inTransaction;
}

- (void)setInTransaction:(BOOL)a3
{
  self->_inTransaction = a3;
}

- (int64_t)transactionChange
{
  return self->_transactionChange;
}

- (void)setTransactionChange:(int64_t)a3
{
  self->_transactionChange = a3;
}

- (NSMutableArray)topicsChanged
{
  return self->_topicsChanged;
}

- (void)setTopicsChanged:(id)a3
{
}

- (APSTopicGroup)serverGroup
{
  return self->_serverGroup;
}

- (void)setServerGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverGroup, 0);
  objc_storeStrong((id *)&self->_topicsChanged, 0);
  objc_storeStrong((id *)&self->_topicHasher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingChange, 0);
  objc_storeStrong((id *)&self->_pendingFilterTimer, 0);
  objc_storeStrong((id *)&self->_hashesToTopics, 0);
  objc_storeStrong((id *)&self->_topicsToTopicsStates, 0);
  objc_storeStrong((id *)&self->_redListAttributes, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end