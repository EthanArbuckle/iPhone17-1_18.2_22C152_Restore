@interface IDSKTGossipPolicy
- (BOOL)havePreviouslyGossipedToURI:(id)a3;
- (BOOL)shouldGossipToURI:(id)a3;
- (BOOL)shouldSelfVerifyBecauseOfPeer;
- (IDSKTGossipPolicy)initWithGossipSpecification:(id)a3;
- (IDSKTGossipPolicySpecification)spec;
- (IDSKVStore)kvStore;
- (NSDate)lastSelfVerifyDate;
- (NSMutableSet)gossipRecipients;
- (void)_loadGossipRecipients;
- (void)_storeGossipRecipients;
- (void)markGossipForURI:(id)a3;
- (void)markSelfVerifyBecauseOfPeer;
- (void)resetGossipState;
- (void)setGossipRecipients:(id)a3;
- (void)setKvStore:(id)a3;
- (void)setLastSelfVerifyDate:(id)a3;
- (void)setSpec:(id)a3;
@end

@implementation IDSKTGossipPolicy

- (IDSKTGossipPolicy)initWithGossipSpecification:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"IDSKTGossipPolicy.m", 38, @"Invalid parameter not satisfying: %@", @"spec" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)IDSKTGossipPolicy;
  v7 = [(IDSKTGossipPolicy *)&v19 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_spec, a3);
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    gossipRecipients = v8->_gossipRecipients;
    v8->_gossipRecipients = v9;

    uint64_t v11 = CSDBGetMobileUserDirectory();
    if (v11)
    {
      v12 = +[NSString stringWithUTF8String:v11];
    }
    else
    {
      v12 = @"~";
    }
    v20[0] = v12;
    v20[1] = @"/Library/IdentityServices/ids-gossip.db";
    v13 = +[NSArray arrayWithObjects:v20 count:2];
    v14 = +[NSString pathWithComponents:v13];

    if (v11) {
    v15 = (IDSKVStore *)[objc_alloc((Class)IDSKVStore) initWithPath:v14 storeName:@"GossipCache" dataProtectionClass:0];
    }
    kvStore = v8->_kvStore;
    v8->_kvStore = v15;

    [(IDSKTGossipPolicy *)v8 _loadGossipRecipients];
  }

  return v8;
}

- (void)resetGossipState
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  [(IDSKTGossipPolicy *)self setGossipRecipients:v3];

  [(IDSKTGossipPolicy *)self _storeGossipRecipients];
}

- (BOOL)havePreviouslyGossipedToURI:(id)a3
{
  return [(NSMutableSet *)self->_gossipRecipients containsObject:a3];
}

- (BOOL)shouldGossipToURI:(id)a3
{
  unsigned int v4 = [(NSMutableSet *)self->_gossipRecipients containsObject:a3];
  v5 = [(IDSKTGossipPolicy *)self spec];
  id v6 = v5;
  if (v4) {
    uint32_t v7 = [v5 subsequentGossipChance];
  }
  else {
    uint32_t v7 = [v5 firstGossipChance];
  }
  BOOL v8 = arc4random_uniform(0x64u) < v7;

  return v8;
}

- (void)markGossipForURI:(id)a3
{
  id v7 = a3;
  id v4 = [(NSMutableSet *)self->_gossipRecipients count];
  if ((unint64_t)v4 >= [(IDSKTGossipPolicySpecification *)self->_spec maxRecipientMemory])
  {
    v5 = [(NSMutableSet *)self->_gossipRecipients allObjects];
    id v6 = objc_msgSend(v5, "objectAtIndex:", arc4random_uniform((uint32_t)objc_msgSend(v5, "count")));
    [(NSMutableSet *)self->_gossipRecipients removeObject:v6];
  }
  [(NSMutableSet *)self->_gossipRecipients addObject:v7];
  [(IDSKTGossipPolicy *)self _storeGossipRecipients];
}

- (BOOL)shouldSelfVerifyBecauseOfPeer
{
  if (!self->_lastSelfVerifyDate) {
    return 1;
  }
  id v3 = +[NSDate now];
  [v3 timeIntervalSinceDate:self->_lastSelfVerifyDate];
  double v5 = v4;

  [(IDSKTGossipPolicySpecification *)self->_spec selfVerifyThrottleTime];
  return v5 > v6;
}

- (void)markSelfVerifyBecauseOfPeer
{
  id v3 = +[NSDate now];
  lastSelfVerifyDate = self->_lastSelfVerifyDate;
  self->_lastSelfVerifyDate = v3;

  _objc_release_x1(v3, lastSelfVerifyDate);
}

- (void)_loadGossipRecipients
{
  kvStore = self->_kvStore;
  id v22 = 0;
  double v4 = [(IDSKVStore *)kvStore dataForKey:@"gossip-recipient-set" error:&v22];
  id v5 = v22;
  if (v5)
  {
    double v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Error fetching stored gossip recipients { error: %@ }", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }

  if (v4)
  {
    uint64_t v7 = objc_opt_class();
    BOOL v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    id v21 = 0;
    v9 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v8 fromData:v4 error:&v21];
    id v10 = v21;

    if (v10)
    {
      uint64_t v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Error unarchiving stored gossip recipients { error: %@ }", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(NSMutableSet *)self->_gossipRecipients addObject:v16];
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v13);
    }
  }
}

- (void)_storeGossipRecipients
{
  gossipRecipients = self->_gossipRecipients;
  id v11 = 0;
  double v4 = +[NSKeyedArchiver archivedDataWithRootObject:gossipRecipients requiringSecureCoding:1 error:&v11];
  id v5 = v11;
  if (v5)
  {
    double v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Error archiving stored gossip recipients { error: %@ }", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }

  kvStore = self->_kvStore;
  id v10 = 0;
  [(IDSKVStore *)kvStore persistData:v4 forKey:@"gossip-recipient-set" error:&v10];
  id v8 = v10;
  if (v8)
  {
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Error storing gossip recipients { error: %@ }", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (IDSKTGossipPolicySpecification)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
}

- (NSMutableSet)gossipRecipients
{
  return self->_gossipRecipients;
}

- (void)setGossipRecipients:(id)a3
{
}

- (IDSKVStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
}

- (NSDate)lastSelfVerifyDate
{
  return self->_lastSelfVerifyDate;
}

- (void)setLastSelfVerifyDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelfVerifyDate, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_storeStrong((id *)&self->_gossipRecipients, 0);

  objc_storeStrong((id *)&self->_spec, 0);
}

@end