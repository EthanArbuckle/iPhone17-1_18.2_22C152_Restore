@interface CUVoiceRequest
- (SiriTTSSpeechRequest)speechRequest;
- (id)completion;
- (id)owner;
- (unsigned)flags;
- (void)setCompletion:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setOwner:(id)a3;
- (void)setSpeechRequest:(id)a3;
@end

@implementation CUVoiceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRequest, 0);
  objc_storeStrong(&self->_owner, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)setSpeechRequest:(id)a3
{
}

- (SiriTTSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setOwner:(id)a3
{
}

- (id)owner
{
  return self->_owner;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

@end