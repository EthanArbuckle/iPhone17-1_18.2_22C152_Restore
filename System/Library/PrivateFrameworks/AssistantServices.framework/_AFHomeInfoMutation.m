@interface _AFHomeInfoMutation
- (BOOL)getActivityNotificationsEnabledForPersonalRequests;
- (BOOL)isDirty;
- (_AFHomeInfoMutation)initWithBase:(id)a3;
- (id)getHomeIdentifier;
- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3;
- (void)setHomeIdentifier:(id)a3;
@end

@implementation _AFHomeInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  self->_activityNotificationsEnabledForPersonalRequests = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (BOOL)getActivityNotificationsEnabledForPersonalRequests
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_activityNotificationsEnabledForPersonalRequests;
  }
  else {
    return [(AFHomeInfo *)self->_base activityNotificationsEnabledForPersonalRequests];
  }
}

- (void)setHomeIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getHomeIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_homeIdentifier;
  }
  else
  {
    v2 = [(AFHomeInfo *)self->_base homeIdentifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFHomeInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeInfoMutation;
  v6 = [(_AFHomeInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end