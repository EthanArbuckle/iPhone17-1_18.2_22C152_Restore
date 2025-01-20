@interface _AFMultiUserStateSnapshotMutation
- (BOOL)isDirty;
- (_AFMultiUserStateSnapshotMutation)initWithBase:(id)a3;
- (id)getConfidenceScores;
- (id)getVtSatScore;
- (void)setConfidenceScores:(id)a3;
- (void)setVtSatScore:(id)a3;
@end

@implementation _AFMultiUserStateSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceScores, 0);
  objc_storeStrong((id *)&self->_vtSatScore, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setConfidenceScores:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getConfidenceScores
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_confidenceScores;
  }
  else
  {
    v2 = [(AFMultiUserStateSnapshot *)self->_base confidenceScores];
  }
  return v2;
}

- (void)setVtSatScore:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getVtSatScore
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_vtSatScore;
  }
  else
  {
    v2 = [(AFMultiUserStateSnapshot *)self->_base vtSatScore];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFMultiUserStateSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMultiUserStateSnapshotMutation;
  v6 = [(_AFMultiUserStateSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end