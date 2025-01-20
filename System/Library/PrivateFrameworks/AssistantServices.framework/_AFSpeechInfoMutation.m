@interface _AFSpeechInfoMutation
- (BOOL)isDirty;
- (_AFSpeechInfoMutation)initWithBase:(id)a3;
- (id)getSpeechRecognizedCommand;
- (void)setSpeechRecognizedCommand:(id)a3;
@end

@implementation _AFSpeechInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRecognizedCommand, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSpeechRecognizedCommand:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getSpeechRecognizedCommand
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_speechRecognizedCommand;
  }
  else
  {
    v2 = [(AFSpeechInfo *)self->_base speechRecognizedCommand];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSpeechInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechInfoMutation;
  v6 = [(_AFSpeechInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end