@interface _AFSpeechSynthesisRecordMutation
- (BOOL)isDirty;
- (_AFSpeechSynthesisRecordMutation)initWithBase:(id)a3;
- (id)getUtterance;
- (unint64_t)getBeginTimestamp;
- (unint64_t)getEndTimestamp;
- (void)setBeginTimestamp:(unint64_t)a3;
- (void)setEndTimestamp:(unint64_t)a3;
- (void)setUtterance:(id)a3;
@end

@implementation _AFSpeechSynthesisRecordMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setEndTimestamp:(unint64_t)a3
{
  self->_endTimestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (unint64_t)getEndTimestamp
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_endTimestamp;
  }
  else {
    return [(AFSpeechSynthesisRecord *)self->_base endTimestamp];
  }
}

- (void)setBeginTimestamp:(unint64_t)a3
{
  self->_beginTimestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getBeginTimestamp
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_beginTimestamp;
  }
  else {
    return [(AFSpeechSynthesisRecord *)self->_base beginTimestamp];
  }
}

- (void)setUtterance:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getUtterance
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_utterance;
  }
  else
  {
    v2 = [(AFSpeechSynthesisRecord *)self->_base utterance];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSpeechSynthesisRecordMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechSynthesisRecordMutation;
  v6 = [(_AFSpeechSynthesisRecordMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end