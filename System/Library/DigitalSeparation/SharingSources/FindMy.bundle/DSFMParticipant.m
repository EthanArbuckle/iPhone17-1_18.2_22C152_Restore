@interface DSFMParticipant
- (DSIdentifiable)identity;
- (NSString)description;
- (NSString)identifier;
- (int64_t)permission;
- (int64_t)role;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setPermission:(int64_t)a3;
- (void)setRole:(int64_t)a3;
@end

@implementation DSFMParticipant

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(DSFMParticipant *)self identity];
  v6 = +[NSString stringWithFormat:@"%@ <%p>: identity: %@", v4, self, v5];

  return (NSString *)v6;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (int64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(int64_t)a3
{
  self->_permission = a3;
}

- (DSIdentifiable)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end