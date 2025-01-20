@interface _AFMyriadSessionMutation
- (BOOL)isDirty;
- (_AFMyriadSessionMutation)initWithBase:(id)a3;
- (id)getCurrentElectionAdvertisementData;
- (id)getCurrentElectionAdvertisementId;
- (id)getElectionAdvertisementDataByIds;
- (id)getSessionId;
- (unint64_t)getGeneration;
- (void)setCurrentElectionAdvertisementData:(id)a3;
- (void)setCurrentElectionAdvertisementId:(id)a3;
- (void)setElectionAdvertisementDataByIds:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setSessionId:(id)a3;
@end

@implementation _AFMyriadSessionMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electionAdvertisementDataByIds, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementData, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setElectionAdvertisementDataByIds:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getElectionAdvertisementDataByIds
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_electionAdvertisementDataByIds;
  }
  else
  {
    v2 = [(AFMyriadSession *)self->_base electionAdvertisementDataByIds];
  }
  return v2;
}

- (void)setCurrentElectionAdvertisementData:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getCurrentElectionAdvertisementData
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_currentElectionAdvertisementData;
  }
  else
  {
    v2 = [(AFMyriadSession *)self->_base currentElectionAdvertisementData];
  }
  return v2;
}

- (void)setCurrentElectionAdvertisementId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getCurrentElectionAdvertisementId
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_currentElectionAdvertisementId;
  }
  else
  {
    v2 = [(AFMyriadSession *)self->_base currentElectionAdvertisementId];
  }
  return v2;
}

- (void)setSessionId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getSessionId
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_sessionId;
  }
  else
  {
    v2 = [(AFMyriadSession *)self->_base sessionId];
  }
  return v2;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getGeneration
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_generation;
  }
  else {
    return [(AFMyriadSession *)self->_base generation];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFMyriadSessionMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMyriadSessionMutation;
  v6 = [(_AFMyriadSessionMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end