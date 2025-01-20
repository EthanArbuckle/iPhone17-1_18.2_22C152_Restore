@interface PMSeparationParticipant
- (DSIdentifiable)identity;
- (KCSharingParticipant)participant;
- (NSString)description;
- (PMSeparationParticipant)initWithParticipant:(id)a3 identity:(id)a4;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation PMSeparationParticipant

- (PMSeparationParticipant)initWithParticipant:(id)a3 identity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PMSeparationParticipant;
  v9 = [(PMSeparationParticipant *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    objc_storeStrong((id *)&v10->_identity, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(KCSharingParticipant *)self->_participant handle];
  v6 = [v3 stringWithFormat:@"<%@: %p; handle: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (int64_t)permission
{
  return 2;
}

- (int64_t)role
{
  if ([(KCSharingParticipant *)self->_participant permissionLevel] == 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (DSIdentifiable)identity
{
  return self->_identity;
}

- (KCSharingParticipant)participant
{
  return self->_participant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end