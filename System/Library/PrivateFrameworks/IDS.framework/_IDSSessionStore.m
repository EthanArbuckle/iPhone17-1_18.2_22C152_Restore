@interface _IDSSessionStore
+ (id)sharedInstance;
- (NSMapTable)sessionBySessionID;
- (_IDSSessionStore)init;
- (id)sessionForAccount:(id)a3 fromID:(id)a4 identifier:(id)a5 transportType:(id)a6;
- (void)setSessionBySessionID:(id)a3;
@end

@implementation _IDSSessionStore

+ (id)sharedInstance
{
  if (qword_1EB2BD780 != -1) {
    dispatch_once(&qword_1EB2BD780, &unk_1EE246528);
  }
  v2 = (void *)qword_1E92DE2B8;

  return v2;
}

- (_IDSSessionStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)_IDSSessionStore;
  v2 = [(_IDSSessionStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    sessionBySessionID = v2->_sessionBySessionID;
    v2->_sessionBySessionID = (NSMapTable *)v3;
  }
  return v2;
}

- (id)sessionForAccount:(id)a3 fromID:(id)a4 identifier:(id)a5 transportType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl())
  {
    v14 = +[IDSInternalQueueController sharedInstance];
    int v15 = [v14 assertQueueIsCurrent];

    if (v15)
    {
      v16 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_191A33960(v16);
      }
    }
    if (!v12
      || ([(NSMapTable *)self->_sessionBySessionID objectForKey:v12],
          (id v17 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v18 = [IDSSession alloc];
      v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
      id v17 = -[IDSSession _initWithAccount:destinations:transportType:uniqueID:](v18, "_initWithAccount:destinations:transportType:uniqueID:", v10, v19, [v13 integerValue], v12);

      if (v12) {
        [(NSMapTable *)self->_sessionBySessionID setObject:v17 forKey:v12];
      }
    }
  }
  else
  {
    v20 = [IDSSession alloc];
    v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    id v17 = -[IDSSession _initWithAccount:destinations:transportType:uniqueID:](v20, "_initWithAccount:destinations:transportType:uniqueID:", v10, v21, [v13 integerValue], v12);
  }

  return v17;
}

- (NSMapTable)sessionBySessionID
{
  return self->_sessionBySessionID;
}

- (void)setSessionBySessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end