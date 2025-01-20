@interface _AFSetAudioSessionActiveContextMutation
- (BOOL)isDirty;
- (_AFSetAudioSessionActiveContextMutation)initWithBase:(id)a3;
- (id)getSpeechRequestOptions;
- (int64_t)getReason;
- (unint64_t)getOptions;
- (void)setOptions:(unint64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setSpeechRequestOptions:(id)a3;
@end

@implementation _AFSetAudioSessionActiveContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSpeechRequestOptions:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getSpeechRequestOptions
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_speechRequestOptions;
  }
  else
  {
    v2 = [(AFSetAudioSessionActiveContext *)self->_base speechRequestOptions];
  }
  return v2;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getReason
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_reason;
  }
  else {
    return [(AFSetAudioSessionActiveContext *)self->_base reason];
  }
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getOptions
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_options;
  }
  else {
    return [(AFSetAudioSessionActiveContext *)self->_base options];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSetAudioSessionActiveContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSetAudioSessionActiveContextMutation;
  v6 = [(_AFSetAudioSessionActiveContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end