@interface SMDSParticipant
- (DSIdentifiable)identity;
- (int64_t)permission;
- (int64_t)role;
- (void)setIdentity:(id)a3;
@end

@implementation SMDSParticipant

- (int64_t)permission
{
  return 1;
}

- (int64_t)role
{
  return 2;
}

- (DSIdentifiable)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end