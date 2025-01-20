@interface _AFExperimentStateMutation
- (BOOL)getDidEnd;
- (BOOL)isDirty;
- (_AFExperimentStateMutation)initWithBase:(id)a3;
- (id)getEndingGroupIdentifier;
- (id)getLastSyncDate;
- (id)getVersion;
- (void)setDidEnd:(BOOL)a3;
- (void)setEndingGroupIdentifier:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation _AFExperimentStateMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_endingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setVersion:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getVersion
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_version;
  }
  else
  {
    v2 = [(AFExperimentState *)self->_base version];
  }
  return v2;
}

- (void)setEndingGroupIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getEndingGroupIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_endingGroupIdentifier;
  }
  else
  {
    v2 = [(AFExperimentState *)self->_base endingGroupIdentifier];
  }
  return v2;
}

- (void)setDidEnd:(BOOL)a3
{
  self->_didEnd = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (BOOL)getDidEnd
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_didEnd;
  }
  else {
    return [(AFExperimentState *)self->_base didEnd];
  }
}

- (void)setLastSyncDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getLastSyncDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_lastSyncDate;
  }
  else
  {
    v2 = [(AFExperimentState *)self->_base lastSyncDate];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFExperimentStateMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentStateMutation;
  v6 = [(_AFExperimentStateMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end