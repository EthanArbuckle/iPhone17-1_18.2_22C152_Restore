@interface PDDataObserver
- (BOOL)_entitiesChangedSinceLastTrigger:(id)a3;
- (BOOL)_entityCountsChangedSinceLastTrigger:(id)a3;
- (BOOL)isPrepared;
- (NSDate)lastTriggerDate;
- (id)description;
- (id)observedTableName;
- (int64_t)changedEntitiesCount;
- (int64_t)changedMatchingEntitiesCount;
- (int64_t)lastChangeID;
- (void)_sendClientEntitiesChangedAdded:(id)a3 updated:(id)a4 deleted:(id)a5 updatedMatchingPredicate:(id)a6 updatedNotMatchingPredicate:(id)a7;
- (void)setChangedEntitiesCount:(int64_t)a3;
- (void)setChangedMatchingEntitiesCount:(int64_t)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLastChangeID:(int64_t)a3;
- (void)setLastTriggerDate:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPrepared:(BOOL)a3;
@end

@implementation PDDataObserver

- (id)observedTableName
{
  return [(objc_class *)self->_entityClass entityName];
}

- (BOOL)_entityCountsChangedSinceLastTrigger:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PDDataObserver *)self lastChangeID];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v30 = sub_1000E5A6C(v4);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D4A4C;
  v23[3] = &unk_1001F4448;
  id v6 = v4;
  id v24 = v6;
  v25 = self;
  v26 = v29;
  v27 = &v31;
  BOOL v28 = v5 == 0;
  sub_10000749C(v6, v23);
  v7 = NSStringFromClass(self->_entityClass);
  if (*((unsigned char *)v32 + 24))
  {
    v8 = +[PDUserDefaults sharedDefaults];
    unsigned int v9 = [v8 enableVerboseLogging];

    if (v9)
    {
      CLSInitLog();
      v10 = CLSLogNotifications;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int64_t changedEntitiesCount = self->_changedEntitiesCount;
        lastTriggerDate = self->_lastTriggerDate;
        [(NSDate *)lastTriggerDate timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 134219010;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v7;
        __int16 v39 = 2048;
        int64_t v40 = changedEntitiesCount;
        __int16 v41 = 2112;
        v42 = lastTriggerDate;
        __int16 v43 = 2048;
        uint64_t v44 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "<PDDataObserver: %p> entity:%@ found %ld changes since lastTriggerDate:%@ (%f)", buf, 0x34u);
      }
    }
    v14 = +[NSDate date];
    v15 = self->_lastTriggerDate;
    self->_lastTriggerDate = v14;

    [(CLSEntityChangeNotifiable *)self->_remoteObserver clientRemote_itemChanged:[(NSDate *)self->_lastTriggerDate hash]];
  }
  else
  {
    v16 = +[PDUserDefaults sharedDefaults];
    unsigned int v17 = [v16 enableVerboseLogging];

    if (v17)
    {
      CLSInitLog();
      v18 = CLSLogNotifications;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = self->_lastTriggerDate;
        [(NSDate *)v19 timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 134218754;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v7;
        __int16 v39 = 2112;
        int64_t v40 = (int64_t)v19;
        __int16 v41 = 2048;
        v42 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "<PDDataObserver: %p> entity:%@ no changes since lastTriggerDate:%@ (%f)", buf, 0x2Au);
      }
    }
  }
  BOOL v21 = *((unsigned char *)v32 + 24) != 0;

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  return v21;
}

- (void)_sendClientEntitiesChangedAdded:(id)a3 updated:(id)a4 deleted:(id)a5 updatedMatchingPredicate:(id)a6 updatedNotMatchingPredicate:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (char *)[v19 count];
  unsigned int v17 = &v16[(void)[v12 count]];
  if ((char *)[v13 count] + (void)v17)
  {
    [(CLSEntityChangeNotifiable *)self->_remoteObserver clientRemote_entitiesChangedAdded:v19 updated:v12 deleted:v13];
    [v19 removeAllObjects];
    [v12 removeAllObjects];
    [v13 removeAllObjects];
  }
  id v18 = [v14 count];
  if ((char *)[v15 count] + (void)v18)
  {
    [(CLSEntityChangeNotifiable *)self->_remoteObserver clientRemote_entitiesChangedUpdatedMatchingPredicate:v14 updatedNotMatchingPredicate:v15];
    [v14 removeAllObjects];
    [v15 removeAllObjects];
  }
}

- (BOOL)_entitiesChangedSinceLastTrigger:(id)a3
{
  id v4 = a3;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  BOOL v58 = self->_lastChangeID == 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_10000B734;
  v46[4] = sub_10000B5B4;
  id v47 = (id)objc_opt_new();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_10000B734;
  v44[4] = sub_10000B5B4;
  id v45 = (id)objc_opt_new();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_10000B734;
  v42[4] = sub_10000B5B4;
  id v43 = (id)objc_opt_new();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_10000B734;
  v40[4] = sub_10000B5B4;
  id v41 = (id)objc_opt_new();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10000B734;
  v38[4] = sub_10000B5B4;
  id v39 = (id)objc_opt_new();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  __int16 v37 = 0;
  __int16 v37 = sub_1000E5A6C(v4);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D5250;
  v23[3] = &unk_1001F44C0;
  void v23[4] = self;
  id v6 = v4;
  id v24 = v6;
  v25 = v46;
  v26 = &v49;
  v27 = v44;
  BOOL v28 = v42;
  v29 = v40;
  v30 = v38;
  uint64_t v31 = v48;
  v32 = v57;
  uint64_t v33 = v36;
  char v34 = &v53;
  uint64_t v35 = 50;
  sub_10000749C(v6, v23);
  v7 = NSStringFromClass(self->_entityClass);
  if (*((unsigned char *)v54 + 24))
  {
    v8 = +[PDUserDefaults sharedDefaults];
    unsigned int v9 = [v8 enableVerboseLogging];

    if (v9)
    {
      CLSInitLog();
      v10 = CLSLogNotifications;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (NSDate *)v50[3];
        lastTriggerDate = self->_lastTriggerDate;
        [(NSDate *)lastTriggerDate timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 134219010;
        v60 = self;
        __int16 v61 = 2112;
        v62 = v7;
        __int16 v63 = 2048;
        v64 = v11;
        __int16 v65 = 2112;
        v66 = lastTriggerDate;
        __int16 v67 = 2048;
        uint64_t v68 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "<PDDataObserver: %p> entity:%@ found %ld changes since lastTriggerDate:%@ (%f)", buf, 0x34u);
      }
    }
    id v14 = +[NSDate date];
    id v15 = self->_lastTriggerDate;
    self->_lastTriggerDate = v14;

    [(CLSEntityChangeNotifiable *)self->_remoteObserver clientRemote_finishWithEntitiesChangedSince:self->_lastTriggerDate];
  }
  else
  {
    v16 = +[PDUserDefaults sharedDefaults];
    unsigned int v17 = [v16 enableVerboseLogging];

    if (v17)
    {
      CLSInitLog();
      id v18 = CLSLogNotifications;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = self->_lastTriggerDate;
        [(NSDate *)v19 timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 134218754;
        v60 = self;
        __int16 v61 = 2112;
        v62 = v7;
        __int16 v63 = 2112;
        v64 = v19;
        __int16 v65 = 2048;
        v66 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "<PDDataObserver: %p> entity:%@ no changes since lastTriggerDate:%@ (%f)", buf, 0x2Au);
      }
    }
  }

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v49, 8);
  BOOL v21 = *((unsigned char *)v54 + 24) != 0;
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(v57, 8);

  return v21;
}

- (id)description
{
  v22.receiver = self;
  v22.super_class = (Class)PDDataObserver;
  v3 = [(PDDataObserver *)&v22 description];
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "appendString:", @" (entity: ");
  int64_t v5 = NSStringFromClass(self->_entityClass);
  [v4 appendString:v5];

  id v6 = +[PDUserDefaults sharedDefaults];
  unsigned int v7 = [v6 enableVerboseLogging];

  if (v7)
  {
    [v4 appendString:@") (whereSQL: "];
    if (self->_predicateWhereSql) {
      CFStringRef predicateWhereSql = (const __CFString *)self->_predicateWhereSql;
    }
    else {
      CFStringRef predicateWhereSql = @"(null)";
    }
    [v4 appendString:predicateWhereSql];
    [v4 appendString:@") (bindings: "];
    uint64_t v9 = [(NSArray *)self->_bindings description];
    v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = @"(null)";
    }
    [v4 appendString:v11];

    [v4 appendString:@") (changedEntitiesCount: "];
    id v12 = +[NSNumber numberWithInteger:[(PDDataObserver *)self changedEntitiesCount]];
    uint64_t v13 = [v12 stringValue];
    [v4 appendString:v13];

    [v4 appendString:@") (changedMatchingEntitiesCount: "];
    id v14 = +[NSNumber numberWithInteger:[(PDDataObserver *)self changedMatchingEntitiesCount]];
    id v15 = [v14 stringValue];
    [v4 appendString:v15];
  }
  [v4 appendString:@") (invalidated: "];
  if (self->_invalidated) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  [v4 appendString:v16];
  [v4 appendString:@") (lastTriggerDate: "];
  unsigned int v17 = [(PDDataObserver *)self lastTriggerDate];
  uint64_t v18 = [v17 description];
  id v19 = (void *)v18;
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  else {
    CFStringRef v20 = @"Never";
  }
  [v4 appendString:v20];

  [v4 appendString:@""]);

  return v4;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isPrepared
{
  return self->_prepared;
}

- (void)setPrepared:(BOOL)a3
{
  self->_prepared = a3;
}

- (int64_t)changedEntitiesCount
{
  return self->_changedEntitiesCount;
}

- (void)setChangedEntitiesCount:(int64_t)a3
{
  self->_int64_t changedEntitiesCount = a3;
}

- (int64_t)changedMatchingEntitiesCount
{
  return self->_changedMatchingEntitiesCount;
}

- (void)setChangedMatchingEntitiesCount:(int64_t)a3
{
  self->_changedMatchingEntitiesCount = a3;
}

- (NSDate)lastTriggerDate
{
  return self->_lastTriggerDate;
}

- (void)setLastTriggerDate:(id)a3
{
}

- (int64_t)lastChangeID
{
  return self->_lastChangeID;
}

- (void)setLastChangeID:(int64_t)a3
{
  self->_lastChangeID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTriggerDate, 0);
  objc_storeStrong((id *)&self->_remoteObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_inversePredicateWhereNotSql, 0);

  objc_storeStrong((id *)&self->_predicateWhereSql, 0);
}

@end