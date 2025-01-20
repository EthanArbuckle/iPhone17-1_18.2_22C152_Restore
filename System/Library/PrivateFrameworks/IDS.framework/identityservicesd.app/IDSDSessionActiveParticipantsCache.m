@interface IDSDSessionActiveParticipantsCache
+ (IDSDSessionActiveParticipantsCache)sharedInstance;
- (IDSDSessionActiveParticipantsCache)init;
- (NSMutableDictionary)cachedTokensBySessionID;
- (id)participantsForSessionID:(id)a3;
- (id)vendTokenListForSessionID:(id)a3;
- (os_unfair_lock_s)lock;
- (void)removeParticipantsForSessionID:(id)a3;
- (void)setCachedTokensBySessionID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)updateParticipants:(id)a3 forSessionID:(id)a4;
@end

@implementation IDSDSessionActiveParticipantsCache

+ (IDSDSessionActiveParticipantsCache)sharedInstance
{
  if (qword_100A4C778 != -1) {
    dispatch_once(&qword_100A4C778, &stru_100989358);
  }
  v2 = (void *)qword_100A4C780;

  return (IDSDSessionActiveParticipantsCache *)v2;
}

- (IDSDSessionActiveParticipantsCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSDSessionActiveParticipantsCache;
  result = [(IDSDSessionActiveParticipantsCache *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)updateParticipants:(id)a3 forSessionID:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a3, "__imSetByApplyingBlock:", &stru_100989378);
  v8 = v7;
  if (v6 && [v7 count])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v10 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IDSDSessionActiveParticipantsCache adding sessionID %@ participants %@", (uint8_t *)&v17, 0x16u);
    }

    v11 = [(IDSDSessionActiveParticipantsCache *)self cachedTokensBySessionID];

    if (!v11)
    {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      [(IDSDSessionActiveParticipantsCache *)self setCachedTokensBySessionID:v12];
    }
    v13 = [(IDSDSessionActiveParticipantsCache *)self cachedTokensBySessionID];
    v14 = [v13 objectForKeyedSubscript:v6];

    if (v14)
    {
      v15 = [v14 setByAddingObjectsFromSet:v8];
      v16 = [(IDSDSessionActiveParticipantsCache *)self cachedTokensBySessionID];
      [v16 setObject:v15 forKeyedSubscript:v6];
    }
    else
    {
      v15 = [(IDSDSessionActiveParticipantsCache *)self cachedTokensBySessionID];
      [v15 setObject:v8 forKeyedSubscript:v6];
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)removeParticipantsForSessionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDSDSessionActiveParticipantsCache removing sessionID %@", (uint8_t *)&v9, 0xCu);
    }

    os_unfair_lock_lock(&self->_lock);
    id v6 = [(IDSDSessionActiveParticipantsCache *)self cachedTokensBySessionID];
    [v6 setObject:0 forKeyedSubscript:v4];

    v7 = [(IDSDSessionActiveParticipantsCache *)self cachedTokensBySessionID];
    id v8 = [v7 count];

    if (!v8) {
      [(IDSDSessionActiveParticipantsCache *)self setCachedTokensBySessionID:0];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)participantsForSessionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(IDSDSessionActiveParticipantsCache *)self cachedTokensBySessionID];
    v7 = [v6 objectForKeyedSubscript:v4];
    id v8 = [v7 copy];

    os_unfair_lock_unlock(p_lock);
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v9 = +[NSSet set];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = +[NSSet set];
  }

  return v10;
}

- (id)vendTokenListForSessionID:(id)a3
{
  id v4 = a3;
  v5 = [[IDSParticipantsCacheEntryPointer alloc] initWithCache:self sessionID:v4];

  return v5;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)cachedTokensBySessionID
{
  return self->_cachedTokensBySessionID;
}

- (void)setCachedTokensBySessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end