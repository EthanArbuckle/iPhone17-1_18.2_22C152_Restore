@interface ADRemoteSpeechRequestHelper
- (AFSpeechRequestOptions)speechRequestOptions;
- (NSUUID)currentToken;
- (id)completion;
- (id)setSpeechRequestOptions:(id)a3 withCompletion:(id)a4;
- (void)reset;
@end

@implementation ADRemoteSpeechRequestHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
}

- (id)completion
{
  return self->_completion;
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (NSUUID)currentToken
{
  return self->_currentToken;
}

- (void)reset
{
  currentToken = self->_currentToken;
  self->_currentToken = 0;

  speechRequestOptions = self->_speechRequestOptions;
  self->_speechRequestOptions = 0;

  id completion = self->_completion;
  self->_id completion = 0;
}

- (id)setSpeechRequestOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSUUID);
  v9 = (NSUUID *)[v8 copy];
  currentToken = self->_currentToken;
  self->_currentToken = v9;

  v11 = (AFSpeechRequestOptions *)[v7 copy];
  speechRequestOptions = self->_speechRequestOptions;
  self->_speechRequestOptions = v11;

  id v13 = objc_retainBlock(v6);
  id completion = self->_completion;
  self->_id completion = v13;

  return v8;
}

@end