@interface _AFHomeAnnouncementSnapshotMutation
- (BOOL)isDirty;
- (_AFHomeAnnouncementSnapshotMutation)initWithBase:(id)a3;
- (id)getLastPlayedAnnouncement;
- (unint64_t)getState;
- (void)setLastPlayedAnnouncement:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation _AFHomeAnnouncementSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayedAnnouncement, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setLastPlayedAnnouncement:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getLastPlayedAnnouncement
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_lastPlayedAnnouncement;
  }
  else
  {
    v2 = [(AFHomeAnnouncementSnapshot *)self->_base lastPlayedAnnouncement];
  }
  return v2;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getState
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_state;
  }
  else {
    return [(AFHomeAnnouncementSnapshot *)self->_base state];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFHomeAnnouncementSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAnnouncementSnapshotMutation;
  v6 = [(_AFHomeAnnouncementSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end