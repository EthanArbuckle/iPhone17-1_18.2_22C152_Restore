@interface _AFSharedConfidenceScoreMutation
- (BOOL)isDirty;
- (_AFSharedConfidenceScoreMutation)initWithBase:(id)a3;
- (id)getSharedUserId;
- (unint64_t)getConfidenceScore;
- (void)setConfidenceScore:(unint64_t)a3;
- (void)setSharedUserId:(id)a3;
@end

@implementation _AFSharedConfidenceScoreMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setConfidenceScore:(unint64_t)a3
{
  self->_confidenceScore = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getConfidenceScore
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_confidenceScore;
  }
  else {
    return [(AFSharedConfidenceScore *)self->_base confidenceScore];
  }
}

- (void)setSharedUserId:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getSharedUserId
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_sharedUserId;
  }
  else
  {
    v2 = [(AFSharedConfidenceScore *)self->_base sharedUserId];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSharedConfidenceScoreMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSharedConfidenceScoreMutation;
  v6 = [(_AFSharedConfidenceScoreMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end