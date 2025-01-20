@interface _GKASKResourceCacheGroup
- (BOOL)hasMultipleMembers;
- (_GKASKResourceCacheGroup)init;
- (id)makeMemberContents;
- (id)onlyMemberContents;
- (id)snapshotMemberContents;
- (void)discardMemberContents:(id)a3;
- (void)setHasMultipleMembers:(BOOL)a3;
@end

@implementation _GKASKResourceCacheGroup

- (_GKASKResourceCacheGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GKASKResourceCacheGroup;
  v2 = [(_GKASKResourceCacheGroup *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    memberContents = v2->_memberContents;
    v2->_memberContents = v3;

    v2->_guard._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)snapshotMemberContents
{
  p_guard = &self->_guard;
  os_unfair_lock_lock(&self->_guard);
  v4 = (void *)[(NSMutableArray *)self->_memberContents copy];
  os_unfair_lock_unlock(p_guard);

  return v4;
}

- (id)onlyMemberContents
{
  p_guard = &self->_guard;
  os_unfair_lock_lock(&self->_guard);
  v4 = [(NSMutableArray *)self->_memberContents firstObject];
  os_unfair_lock_unlock(p_guard);

  return v4;
}

- (id)makeMemberContents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  os_unfair_lock_lock(&self->_guard);
  [(NSMutableArray *)self->_memberContents addObject:v3];
  [(_GKASKResourceCacheGroup *)self setHasMultipleMembers:(unint64_t)[(NSMutableArray *)self->_memberContents count] > 1];
  os_unfair_lock_unlock(&self->_guard);

  return v3;
}

- (void)discardMemberContents:(id)a3
{
  p_guard = &self->_guard;
  id v5 = a3;
  os_unfair_lock_lock(p_guard);
  [(NSMutableArray *)self->_memberContents removeObjectIdenticalTo:v5];

  [(_GKASKResourceCacheGroup *)self setHasMultipleMembers:(unint64_t)[(NSMutableArray *)self->_memberContents count] > 1];

  os_unfair_lock_unlock(p_guard);
}

- (BOOL)hasMultipleMembers
{
  return self->_hasMultipleMembers;
}

- (void)setHasMultipleMembers:(BOOL)a3
{
  self->_hasMultipleMembers = a3;
}

- (void).cxx_destruct
{
}

@end