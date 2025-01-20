@interface APSTopicFilterPolicyEmbedded
- (APSSystemMonitor)systemMonitor;
- (APSTopicFilterPolicyEmbedded)initWithDelegate:(id)a3;
- (APSTopicFilterPolicyEmbedded)initWithDelegate:(id)a3 ultraConstrainedProvider:(id)a4;
- (APSUltraConstrainedProvider)ultraConstrainedProvider;
- (BOOL)downgradeWhenLocked;
- (id)initShouldDowngradeWhenLocked:(BOOL)a3 systemMonitor:(id)a4 ultraConstrainedProvider:(id)a5 withDelegate:(id)a6;
- (id)topicChosenByPolicyFromTopics:(id)a3;
- (int64_t)filterChosenByPolicyForTopic:(id)a3;
- (void)dealloc;
- (void)logFilterPolicyInformation;
- (void)setDowngradeWhenLocked:(BOOL)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setUltraConstrainedProvider:(id)a3;
- (void)systemDidLock;
- (void)systemDidUnlock;
@end

@implementation APSTopicFilterPolicyEmbedded

- (id)initShouldDowngradeWhenLocked:(BOOL)a3 systemMonitor:(id)a4 ultraConstrainedProvider:(id)a5 withDelegate:(id)a6
{
  BOOL v9 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)APSTopicFilterPolicyEmbedded;
  v13 = [(APSTopicFilterPolicy *)&v16 initWithDelegate:a6];
  p_isa = (id *)&v13->super.super.isa;
  if (v13)
  {
    v13->_downgradeWhenLocked = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v13->_systemMonitor, a4);
      [v11 addListener:p_isa];
    }
    objc_storeWeak(p_isa + 4, v12);
  }

  return p_isa;
}

- (APSTopicFilterPolicyEmbedded)initWithDelegate:(id)a3 ultraConstrainedProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[APSSystemMonitor sharedInstance];
  BOOL v9 = [(APSTopicFilterPolicyEmbedded *)self initShouldDowngradeWhenLocked:0 systemMonitor:v8 ultraConstrainedProvider:v6 withDelegate:v7];

  return v9;
}

- (APSTopicFilterPolicyEmbedded)initWithDelegate:(id)a3
{
  return [(APSTopicFilterPolicyEmbedded *)self initWithDelegate:a3 ultraConstrainedProvider:0];
}

- (void)dealloc
{
  [(APSSystemMonitor *)self->_systemMonitor removeListener:self];
  v3.receiver = self;
  v3.super_class = (Class)APSTopicFilterPolicyEmbedded;
  [(APSTopicFilterPolicyEmbedded *)&v3 dealloc];
}

- (int64_t)filterChosenByPolicyForTopic:(id)a3
{
  id v4 = a3;
  if (!self->_downgradeWhenLocked) {
    goto LABEL_8;
  }
  if (![(APSSystemMonitor *)self->_systemMonitor isSystemLocked]
    || ([v4 attributes],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isPushWakeEnabled],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = [v4 attributes];
    unsigned int v8 = [v7 isPushWakeEnabled];

    if (v8)
    {
      BOOL v9 = +[APSLog topicManager];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000CC0E8();
      }
    }
LABEL_8:
    if (_os_feature_enabled_impl())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_ultraConstrainedProvider);
      if ([WeakRetained isConnectedOnUltraConstrainedInterface])
      {
        id v11 = [v4 attributes];
        unsigned __int8 v12 = [v11 isUltraConstrainedEnabled];

        if ((v12 & 1) == 0)
        {
          v13 = +[APSLog topicManager];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [v4 topicName];
            int v21 = 138412546;
            v22 = self;
            __int16 v23 = 2112;
            v24 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ downgrading %@ to ignored, not eligible for requested ultra constrained filter", (uint8_t *)&v21, 0x16u);
          }
          int64_t v15 = 3;
          goto LABEL_20;
        }
      }
      else
      {
      }
      id v16 = objc_loadWeakRetained((id *)&self->_ultraConstrainedProvider);
      unsigned int v17 = [v16 isConnectedOnUltraConstrainedInterface];

      if (v17)
      {
        v18 = +[APSLog topicManager];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_1000CC080();
        }
      }
    }
    v13 = [v4 attributes];
    int64_t v15 = (int64_t)[v13 filter];
    goto LABEL_20;
  }
  v13 = +[APSLog topicManager];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v4 topicName];
    int v21 = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ downgrading %@ to non-waking, not eligible for requested filter", (uint8_t *)&v21, 0x16u);
  }
  int64_t v15 = 4;
LABEL_20:

  return v15;
}

- (id)topicChosenByPolicyFromTopics:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    int64_t v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      int64_t v12 = -[APSTopicFilterPolicyEmbedded filterChosenByPolicyForTopic:](self, "filterChosenByPolicyForTopic:", v11, (void)v16);
      int64_t v13 = v12;
      if (!v7 || v12 < v7)
      {
        id v14 = v11;

        int64_t v7 = v13;
        unsigned int v8 = v14;
        if (v13 == 1) {
          break;
        }
      }
      if (v6 == (id)++v10)
      {
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        id v14 = v8;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)logFilterPolicyInformation
{
  objc_super v3 = +[APSLog topicManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_downgradeWhenLocked) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    if ([(APSSystemMonitor *)self->_systemMonitor isSystemLocked]) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_ultraConstrainedProvider);
    int v8 = 138413058;
    if ([WeakRetained isConnectedOnUltraConstrainedInterface]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    uint64_t v9 = self;
    __int16 v10 = 2112;
    CFStringRef v11 = v4;
    __int16 v12 = 2112;
    CFStringRef v13 = v5;
    __int16 v14 = 2112;
    CFStringRef v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ policy state {downgradeWhenLocked: %@, isSystemLocked: %@, isConnectedOnUltraConstrainedInterface: %@}", (uint8_t *)&v8, 0x2Au);
  }
}

- (void)systemDidLock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained filtersWillPotentiallyBeChangedByPolicy:self];
}

- (void)systemDidUnlock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained filtersWillPotentiallyBeChangedByPolicy:self];
}

- (BOOL)downgradeWhenLocked
{
  return self->_downgradeWhenLocked;
}

- (void)setDowngradeWhenLocked:(BOOL)a3
{
  self->_downgradeWhenLocked = a3;
}

- (APSSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (APSUltraConstrainedProvider)ultraConstrainedProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ultraConstrainedProvider);
  return (APSUltraConstrainedProvider *)WeakRetained;
}

- (void)setUltraConstrainedProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ultraConstrainedProvider);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
}

@end