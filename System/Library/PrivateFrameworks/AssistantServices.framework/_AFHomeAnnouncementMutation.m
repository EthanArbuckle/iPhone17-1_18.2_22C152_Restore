@interface _AFHomeAnnouncementMutation
- (BOOL)isDirty;
- (_AFHomeAnnouncementMutation)initWithBase:(id)a3;
- (id)getFinishedDate;
- (id)getIdentifier;
- (id)getStartedDate;
- (unint64_t)getFinishedHostTime;
- (unint64_t)getStartedHostTime;
- (void)setFinishedDate:(id)a3;
- (void)setFinishedHostTime:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setStartedDate:(id)a3;
- (void)setStartedHostTime:(unint64_t)a3;
@end

@implementation _AFHomeAnnouncementMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_startedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setFinishedDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getFinishedDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_finishedDate;
  }
  else
  {
    v2 = [(AFHomeAnnouncement *)self->_base finishedDate];
  }
  return v2;
}

- (void)setStartedDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getStartedDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_startedDate;
  }
  else
  {
    v2 = [(AFHomeAnnouncement *)self->_base startedDate];
  }
  return v2;
}

- (void)setFinishedHostTime:(unint64_t)a3
{
  self->_finishedHostTime = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (unint64_t)getFinishedHostTime
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_finishedHostTime;
  }
  else {
    return [(AFHomeAnnouncement *)self->_base finishedHostTime];
  }
}

- (void)setStartedHostTime:(unint64_t)a3
{
  self->_startedHostTime = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getStartedHostTime
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_startedHostTime;
  }
  else {
    return [(AFHomeAnnouncement *)self->_base startedHostTime];
  }
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    v2 = [(AFHomeAnnouncement *)self->_base identifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFHomeAnnouncementMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAnnouncementMutation;
  v6 = [(_AFHomeAnnouncementMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end