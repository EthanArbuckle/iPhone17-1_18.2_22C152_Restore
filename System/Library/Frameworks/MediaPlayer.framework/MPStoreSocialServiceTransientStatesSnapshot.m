@interface MPStoreSocialServiceTransientStatesSnapshot
- (MPStoreSocialServiceTransientStatesSnapshot)init;
- (int64_t)transientFollowPendingRequestStateForPerson:(id)a3;
- (int64_t)transientFollowStateForPerson:(id)a3;
- (void)_addTransientFollowState:(int64_t)a3 transientFollowPendingRequestState:(int64_t)a4 forPerson:(id)a5;
@end

@implementation MPStoreSocialServiceTransientStatesSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientFollowPendingRequestStatesPerProfileID, 0);

  objc_storeStrong((id *)&self->_transientFollowStatesPerProfileID, 0);
}

- (void)_addTransientFollowState:(int64_t)a3 transientFollowPendingRequestState:(int64_t)a4 forPerson:(id)a5
{
  v8 = [a5 identifiers];
  v9 = [v8 universalStore];
  id v14 = [v9 socialProfileID];

  if (v14)
  {
    transientFollowStatesPerProfileID = self->_transientFollowStatesPerProfileID;
    v11 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)transientFollowStatesPerProfileID setObject:v11 forKey:v14];

    transientFollowPendingRequestStatesPerProfileID = self->_transientFollowPendingRequestStatesPerProfileID;
    v13 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)transientFollowPendingRequestStatesPerProfileID setObject:v13 forKey:v14];
  }
}

- (int64_t)transientFollowPendingRequestStateForPerson:(id)a3
{
  v4 = [a3 identifiers];
  v5 = [v4 universalStore];
  v6 = [v5 socialProfileID];

  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_transientFollowPendingRequestStatesPerProfileID objectForKey:v6];
    v8 = v7;
    if (v7) {
      int64_t v9 = [v7 integerValue];
    }
    else {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)transientFollowStateForPerson:(id)a3
{
  v4 = [a3 identifiers];
  v5 = [v4 universalStore];
  v6 = [v5 socialProfileID];

  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_transientFollowStatesPerProfileID objectForKey:v6];
    v8 = v7;
    if (v7) {
      int64_t v9 = [v7 integerValue];
    }
    else {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (MPStoreSocialServiceTransientStatesSnapshot)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPStoreSocialServiceTransientStatesSnapshot;
  v2 = [(MPStoreSocialServiceTransientStatesSnapshot *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transientFollowStatesPerProfileID = v2->_transientFollowStatesPerProfileID;
    v2->_transientFollowStatesPerProfileID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transientFollowPendingRequestStatesPerProfileID = v2->_transientFollowPendingRequestStatesPerProfileID;
    v2->_transientFollowPendingRequestStatesPerProfileID = v5;
  }
  return v2;
}

@end